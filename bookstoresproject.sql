CREATE USER 'root'@'127.0.0.1' IDENTIFIED BY 'Cheeko@1234';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1';
FLUSH PRIVILEGES;


SELECT user, host FROM mysql.user;





-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstoresproject
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `authorID` int NOT NULL AUTO_INCREMENT,
  `author_Name` varchar(50) DEFAULT 'Anonymous',
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Author 1','2023-09-01 06:27:48'),(2,'Author 2','2023-09-01 06:27:48'),(3,'Author 3','2023-09-01 06:27:48'),(4,'Author 4','2023-09-01 06:27:48'),(5,'Author 5','2023-09-01 06:27:48'),(6,'Author 6','2023-09-06 13:10:23'),(7,'Author 6','2023-09-12 05:07:38'),(8,'Author 10','2023-09-20 06:30:27'),(9,'Demo10','2023-09-21 11:48:33'),(10,'Author 6','2023-09-26 12:15:59');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `authorID` int NOT NULL,
  `publisherID` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(127) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ISBNcode` bigint NOT NULL,
  `page_Count` int NOT NULL,
  `published_Year` int NOT NULL,
  `book_condition` varchar(5) NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `images` text,
  `rating` double DEFAULT (0),
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `ISBNcode` (`ISBNcode`),
  KEY `fk_authorBooks` (`authorID`),
  KEY `fk_publisherBooks` (`publisherID`),
  CONSTRAINT `fk_authorBooks` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  CONSTRAINT `fk_publisherBooks` FOREIGN KEY (`publisherID`) REFERENCES `publisher` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,1,1,'Book 1','Category 1',19.99,1234567890123,300,2022,'New','2023-09-01 07:00:08','https://edit.org/images/cat/book-covers-big-2019101610.jpg',3),(3,2,2,'Book 2','Category 2',24.99,2345678901234,250,2021,'Used','2023-09-01 07:00:08','https://edit.org/images/cat/book-covers-big-2019101610.jpg',4),(4,3,3,'Book 3','Category 1',14.99,3456789012345,400,2023,'New','2023-09-01 07:00:08','https://edit.org/images/cat/book-covers-big-2019101610.jpg',1),(5,4,4,'Book 4','Category 3',29.99,4567890123456,350,2020,'Used','2023-09-01 07:00:08','https://images.unsplash.com/photo-1629992101753-56d196c8aabb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&w=1000&q=80',4),(6,5,5,'Book 5','Category 2',22.99,5678901234567,320,2022,'New','2023-09-01 07:00:08','https://images.unsplash.com/photo-1629992101753-56d196c8aabb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&w=1000&q=80',0),(7,5,4,'The Vampire Diaries','Super Naturals',1500.00,1472361,650,2016,'New','2023-09-01 07:04:05','https://m.media-amazon.com/images/I/51ytBkF2IbL.jpg',5),(9,2,2,'The Orignals','Super Naturals',2000.00,998991993,650,2013,'Used',NULL,'https://flxt.tmsimg.com/assets/p9944343_b_v9_al.jpg',3.5),(10,5,5,'The Legcies','Super Naturals',2500.00,99899003,550,2017,'New',NULL,'https://upload.wikimedia.org/wikipedia/en/2/2e/The_Legacy_of_the_Bones_poster.jpg',0),(11,4,4,'The God\'s Eye','Super Naturals',2300.00,998991993000,650,2013,'Used','2023-09-06 10:56:58','https://cdn.kobo.com/book-images/091d647f-6fe5-4f8f-b7e5-3b73681b09ac/1200/1200/False/the-god-s-eye-a-fantasy-short-story-1.jpg',4),(13,6,6,'How to became Rich?','Philosophy',420.00,99887766,250,2007,'New','2023-09-08 11:28:00','https://fourminutebooks.com/wp-content/uploads/2019/03/best-finance-books-think-and-grow-rich.jpg',3),(14,2,3,'wings of fire','Philosophy',2000.00,7537,650,2020,'New','2023-09-12 05:07:02','https://fourminutebooks.com/wp-content/uploads/2019/03/best-finance-books-think-and-grow-rich.jpg',0),(15,6,5,'Geetanjali','Philosophy',2000.00,12121212121,250,2013,'New','2023-09-20 06:27:13','https://m.media-amazon.com/images/I/911E0+uRMSL._AC_UF1000,1000_QL80_.jpg',0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterInsertBook` AFTER INSERT ON `books` FOR EACH ROW BEGIN
    # Insert the new book into the Inventory table with default stock levels
    INSERT INTO Inventory (bookID, stock_Level_Used, stock_Level_New)
    VALUES (NEW.bookID, 0, 0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `customerID` int DEFAULT NULL,
  `conditions` varchar(10) DEFAULT (_utf8mb4'New'),
  PRIMARY KEY (`ID`),
  KEY `fk_bookCart` (`bookID`),
  KEY `fk_cartCustomer` (`customerID`),
  CONSTRAINT `fk_bookCart` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`),
  CONSTRAINT `fk_cartCustomer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (4,11,4,'2023-09-11 07:41:52',6,'New'),(5,11,2,'2023-09-11 07:42:16',7,'New'),(45,3,2,'2023-09-18 06:28:10',11,'New'),(46,4,1,'2023-09-18 06:28:15',11,'New'),(63,7,1,'2023-09-20 07:48:34',14,'New'),(64,13,1,'2023-09-20 07:55:29',23,'New');
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `cust_Name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cust_Address` varchar(100) NOT NULL,
  `contact_No` bigint NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contactNo` (`contact_No`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Customer 1','customer1@example.com','Address 1',1234567890,'2023-09-01 06:28:01'),(2,'Customer 2','customer2@example.com','Address 2',2345678901,'2023-09-01 06:28:01'),(3,'Customer 3','customer3@example.com','Address 3',3456789012,'2023-09-01 06:28:01'),(4,'Customer 4','customer4@example.com','Address 4',4567890123,'2023-09-01 06:28:01'),(5,'Customer 5','customer5@example.com','Address 5',5678901234,'2023-09-01 06:28:01'),(6,'A','a@example.com','123 Main St',2305136396,'2023-09-01 09:47:47'),(7,'B','b@example.com','234 Main St',1478523969,'2023-09-01 11:17:30'),(11,'D','d@example.com','234 Main St',999999999,'2023-09-07 06:50:42'),(12,'Abhinav','abhinav@example.com','69 Street',96996939,'2023-09-07 07:07:12'),(13,'Deep','Deep@gmail.com','bombay',6753754968,'2023-09-12 05:08:25'),(14,'Bodhini Goli','Bodhni@example.com','abc 123',1234569973,'2023-09-12 05:21:06'),(15,'Hero','hero@gmail.com','Indian',1111111111,'2023-09-12 07:10:14'),(16,'Villain','villain@gmail.com','Indian',2222222222,'2023-09-12 07:12:46'),(17,'Joker','joker@example.com','Joker Street',3333333333,'2023-09-12 07:16:47'),(18,'Harshit','harshit.tyagi@prolifics.com','Noida, UP',7078179015,'2023-09-20 06:33:39'),(19,'Htyagi','harshit.tyagi@gmail.com','HPR, Ind',8439301087,'2023-09-20 06:37:12'),(20,'Aman','aman@example.com','GZB, UP',9898989898,'2023-09-20 06:38:27'),(22,'Radha','radha@example.com','abc 123',9837303667,'2023-09-20 07:51:27'),(23,'Sai','Sai@gmail.com','Hyderabad',7093177998,'2023-09-20 07:52:42'),(25,'Admin','admin1@example.com','101 Admin Street',7500935628,'2023-09-21 05:39:54');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AddCustomerAsUser` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
    DECLARE v_username VARCHAR(100);
    DECLARE v_passcode BIGINT;
    DECLARE v_email VARCHAR(100);
    DECLARE v_custName VARCHAR(100);
    DECLARE v_address VARCHAR(100);
    DECLARE v_phone VARCHAR(100);

    # Get customer details from the inserted row
    SELECT CONCAT(New.cust_Name, NEW.customerID), NEW.contact_No, NEW.email, NEW.cust_Name, NEW.contact_No, NEW.cust_Address INTO v_username, v_passcode, v_email, v_custName, v_phone, v_address;

    # Insert the customer as a user
    INSERT INTO Users (username, passcode, email, name, address, phone_no)
    VALUES (v_username, v_passcode, v_email, v_custName, v_address, v_phone);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventoryID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `stock_Level_Used` int NOT NULL,
  `stock_Level_New` int NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventoryID`),
  KEY `fk_bookInv` (`bookID`),
  CONSTRAINT `fk_bookInv` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,2,8,7,'2023-09-01 09:21:27'),(2,3,10,10,'2023-09-01 09:21:27'),(3,4,10,10,'2023-09-01 09:21:27'),(4,5,9,10,'2023-09-01 09:21:27'),(5,6,10,10,'2023-09-01 09:21:27'),(6,13,8,10,'2023-09-08 11:27:59'),(7,7,10,10,'2023-09-11 11:03:55'),(8,9,10,10,'2023-09-11 11:04:08'),(9,10,10,10,'2023-09-11 11:04:20'),(10,11,10,10,'2023-09-11 11:04:31'),(11,14,10,10,'2023-09-12 05:07:02'),(12,15,10,10,'2023-09-20 06:27:12');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `bookID` int NOT NULL,
  `customerID` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `price_Of_Unit_Quantity` decimal(10,2) NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_customerOrdItms` (`customerID`),
  KEY `fk_bookOrdItms` (`bookID`),
  CONSTRAINT `fk_bookOrdItms` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`),
  CONSTRAINT `fk_customerOrdItms` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,1,2,19.99,'2023-09-01 07:03:25'),(2,2,3,2,3,24.99,'2023-09-01 07:03:25'),(3,3,4,3,1,14.99,'2023-09-01 07:03:25'),(4,4,5,4,4,29.99,'2023-09-01 07:03:25'),(5,5,6,5,2,22.99,'2023-09-01 07:03:25'),(6,16,7,7,4,1500.00,'2023-09-08 10:58:43'),(8,18,11,11,2,2300.00,'2023-09-11 11:18:11'),(9,18,7,11,2,1500.00,'2023-09-11 11:18:11'),(10,19,13,12,2,420.00,'2023-09-11 11:30:09'),(11,20,13,12,5,420.00,'2023-09-11 11:54:41'),(12,20,9,12,4,2000.00,'2023-09-11 11:54:42'),(13,31,13,12,5,420.00,'2023-09-11 13:13:14'),(14,31,9,12,4,2000.00,'2023-09-11 13:13:14'),(15,31,11,12,2,2300.00,'2023-09-11 13:13:14'),(16,43,7,12,2,1500.00,'2023-09-11 13:33:41'),(17,43,11,12,1,2300.00,'2023-09-11 13:33:41'),(18,43,9,12,1,2000.00,'2023-09-11 13:33:41'),(19,43,13,12,1,420.00,'2023-09-11 13:33:41'),(20,44,2,12,4,19.99,'2023-09-11 15:40:39'),(21,44,3,12,1,24.99,'2023-09-11 15:40:40'),(22,45,11,11,2,2300.00,'2023-09-12 05:18:38'),(23,46,11,11,2,2300.00,'2023-09-12 05:18:51'),(24,46,7,11,2,1500.00,'2023-09-12 05:18:51'),(25,46,10,11,1,2500.00,'2023-09-12 05:18:51'),(26,47,2,14,1,19.99,'2023-09-12 05:22:21'),(27,47,3,14,1,24.99,'2023-09-12 05:22:22'),(28,48,9,12,1,2000.00,'2023-09-14 05:04:36'),(29,49,7,12,1,1500.00,'2023-09-14 05:05:29'),(30,50,2,12,1,19.99,'2023-09-14 05:06:22'),(31,51,5,12,1,29.99,'2023-09-14 05:07:26'),(32,52,3,12,1,24.99,'2023-09-14 05:08:49'),(33,53,9,12,1,2000.00,'2023-09-14 05:10:41'),(34,54,3,12,1,24.99,'2023-09-14 05:11:58'),(35,55,7,12,1,1500.00,'2023-09-14 05:13:23'),(36,56,7,12,1,1500.00,'2023-09-14 05:14:52'),(37,57,4,12,1,14.99,'2023-09-14 05:35:05'),(38,58,13,12,1,420.00,'2023-09-14 12:47:00'),(39,59,13,12,1,420.00,'2023-09-14 13:09:15'),(40,60,13,12,1,420.00,'2023-09-14 13:09:19'),(41,61,13,12,1,420.00,'2023-09-14 13:16:58'),(42,62,2,11,1,19.99,'2023-09-18 06:06:41'),(43,62,3,11,1,24.99,'2023-09-18 06:06:41'),(44,63,2,12,2,19.99,'2023-09-19 04:54:22'),(45,64,13,12,1,420.00,'2023-09-19 04:55:07'),(46,65,2,12,1,19.99,'2023-09-19 05:23:47'),(47,66,6,12,1,22.99,'2023-09-19 05:29:15'),(48,67,7,12,2,1500.00,'2023-09-19 05:31:15'),(49,68,2,12,1,19.99,'2023-09-19 09:01:40'),(50,68,3,12,1,24.99,'2023-09-19 09:01:40'),(51,68,5,12,1,29.99,'2023-09-19 09:01:40'),(52,69,2,12,1,19.99,'2023-09-19 09:02:10'),(53,69,3,12,1,24.99,'2023-09-19 09:02:10'),(54,71,2,12,1,19.99,'2023-09-19 09:46:56'),(55,72,10,12,1,2500.00,'2023-09-20 05:32:08'),(58,74,2,20,2,19.99,'2023-09-20 06:57:46'),(59,75,9,23,2,2000.00,'2023-09-20 07:56:13'),(60,76,2,12,1,19.99,'2023-09-20 08:05:13'),(61,76,3,12,1,24.99,'2023-09-20 08:05:13'),(62,76,9,12,1,2000.00,'2023-09-20 08:05:13'),(63,77,2,20,1,19.99,'2023-09-21 03:54:50'),(76,94,2,20,1,19.99,'2023-10-03 05:23:38'),(77,94,2,20,1,19.99,'2023-10-03 05:23:38'),(78,95,2,20,1,19.99,'2023-10-03 05:30:26'),(79,95,5,20,1,29.99,'2023-10-03 05:30:26');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `order_Date` datetime NOT NULL,
  `total_Amount` decimal(10,2) NOT NULL,
  `shipping_Address` varchar(100) NOT NULL,
  `tax_Amount` decimal(10,2) NOT NULL,
  `discount_Amount` decimal(10,2) NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderID`),
  KEY `fk_customerOrd` (`customerID`),
  CONSTRAINT `fk_customerOrd` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-09-01 10:00:00',59.95,'Shipping Address 1',4.00,0.00,'2023-09-01 07:01:53'),(2,2,'2023-09-02 11:00:00',74.99,'Shipping Address 2',5.00,0.00,'2023-09-01 07:01:53'),(3,3,'2023-09-03 12:00:00',44.98,'Shipping Address 3',3.00,0.00,'2023-09-01 07:01:53'),(4,4,'2023-09-04 13:00:00',89.97,'Shipping Address 4',6.00,0.00,'2023-09-01 07:01:53'),(5,5,'2023-09-05 14:00:00',68.97,'Shipping Address 5',4.00,0.00,'2023-09-01 07:01:53'),(6,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 10:41:39'),(7,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 10:43:45'),(8,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:02:47'),(9,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:10:28'),(10,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:10:36'),(11,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:11:08'),(12,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:11:09'),(13,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:11:09'),(14,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:12:10'),(15,7,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:17:52'),(16,7,'2023-09-08 16:28:42',32850.00,'123, B Street',18.00,150.00,'2023-09-08 10:58:42'),(17,12,'2023-09-11 10:36:16',453.60,'123, B Street',75.60,42.00,'2023-09-11 05:06:16'),(18,11,'2023-09-11 16:48:11',8208.00,'123, B Street',1368.00,760.00,'2023-09-11 11:18:11'),(19,12,'2023-09-11 17:00:09',907.20,'123, B Street',151.20,84.00,'2023-09-11 11:30:09'),(20,12,'2023-09-11 17:24:41',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 11:54:41'),(21,12,'2023-09-11 17:33:15',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 12:03:15'),(22,12,'2023-09-11 17:34:25',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 12:04:25'),(23,12,'2023-09-11 17:35:30',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 12:05:30'),(24,12,'2023-09-11 17:38:31',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 12:08:31'),(25,12,'2023-09-11 17:39:44',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 12:09:44'),(26,12,'2023-09-11 17:53:28',15876.00,'fggggggggggggggggggg',2646.00,1470.00,'2023-09-11 12:23:28'),(27,12,'2023-09-11 18:02:42',15876.00,'fggggggggggggggggggg',2646.00,1470.00,'2023-09-11 12:32:42'),(28,12,'2023-09-11 18:03:52',15876.00,'fggggggggggggggggggg',2646.00,1470.00,'2023-09-11 12:33:52'),(29,12,'2023-09-11 18:39:40',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 13:09:40'),(30,12,'2023-09-11 18:40:27',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 13:10:27'),(31,12,'2023-09-11 18:43:14',15876.00,'123, B Street',2646.00,1470.00,'2023-09-11 13:13:14'),(32,12,'2023-09-11 18:45:37',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:15:37'),(33,12,'2023-09-11 18:48:31',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:18:31'),(34,12,'2023-09-11 18:51:13',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:21:13'),(35,12,'2023-09-11 18:51:20',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:21:20'),(36,12,'2023-09-11 18:51:58',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:21:58'),(37,12,'2023-09-11 18:52:35',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:22:35'),(38,12,'2023-09-11 18:54:02',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:24:02'),(39,12,'2023-09-11 18:55:22',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:25:22'),(40,12,'2023-09-11 18:56:09',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:26:09'),(41,12,'2023-09-11 18:58:00',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:28:00'),(42,12,'2023-09-11 18:59:14',15876.00,'testgsgzsvzbz',2646.00,1470.00,'2023-09-11 13:29:14'),(43,12,'2023-09-11 19:03:41',8337.60,'123, B Street',1389.60,772.00,'2023-09-11 13:33:41'),(44,12,'2023-09-11 21:10:39',113.35,'123, B Street',18.89,10.50,'2023-09-11 15:40:39'),(45,11,'2023-09-12 10:48:38',4968.00,'Hyderabad',828.00,460.00,'2023-09-12 05:18:38'),(46,11,'2023-09-12 10:48:51',10908.00,'Hyderabad',1818.00,1010.00,'2023-09-12 05:18:51'),(47,14,'2023-09-12 10:52:21',48.58,'Hyderabad',8.10,4.50,'2023-09-12 05:22:21'),(48,12,'2023-09-14 10:34:36',2160.00,'123, B Street',360.00,200.00,'2023-09-14 05:04:36'),(49,12,'2023-09-14 10:35:29',1620.00,'123, B Street',270.00,150.00,'2023-09-14 05:05:29'),(50,12,'2023-09-14 10:36:22',21.59,'123, B Street',3.60,2.00,'2023-09-14 05:06:22'),(51,12,'2023-09-14 10:37:26',32.39,'123, B Street',5.40,3.00,'2023-09-14 05:07:26'),(52,12,'2023-09-14 10:38:49',26.99,'123, B Street',4.50,2.50,'2023-09-14 05:08:49'),(53,12,'2023-09-14 10:40:41',2160.00,'123, B Street',360.00,200.00,'2023-09-14 05:10:41'),(54,12,'2023-09-14 10:41:58',26.99,'123, B Street',4.50,2.50,'2023-09-14 05:11:58'),(55,12,'2023-09-14 10:43:23',1620.00,'123, B Street',270.00,150.00,'2023-09-14 05:13:23'),(56,12,'2023-09-14 10:44:52',1620.00,'123, B Street',270.00,150.00,'2023-09-14 05:14:52'),(57,12,'2023-09-14 11:05:05',16.19,'123, B Street',2.70,1.50,'2023-09-14 05:35:05'),(58,12,'2023-09-14 18:17:00',453.60,'123, B Street',75.60,42.00,'2023-09-14 12:47:00'),(59,12,'2023-09-14 18:39:15',453.60,'123, CStreet',75.60,42.00,'2023-09-14 13:09:15'),(60,12,'2023-09-14 18:39:19',453.60,'123, CStreet',75.60,42.00,'2023-09-14 13:09:19'),(61,12,'2023-09-14 18:46:58',453.60,'123, CStreet',75.60,42.00,'2023-09-14 13:16:58'),(62,11,'2023-09-18 11:36:41',48.58,'69 Street',8.10,4.50,'2023-09-18 06:06:41'),(63,12,'2023-09-19 10:24:22',43.18,'Joker Street',7.20,4.00,'2023-09-19 04:54:22'),(64,12,'2023-09-19 10:25:07',453.60,'Joker Street',75.60,42.00,'2023-09-19 04:55:07'),(65,12,'2023-09-19 10:53:47',21.59,'69 Street',3.60,2.00,'2023-09-19 05:23:47'),(66,12,'2023-09-19 10:59:15',24.83,'Joker Street',4.14,2.30,'2023-09-19 05:29:15'),(67,12,'2023-09-19 11:01:15',3240.00,'123, B Street',540.00,300.00,'2023-09-19 05:31:15'),(68,12,'2023-09-19 14:31:39',1700.97,'123, B Street',283.49,157.50,'2023-09-19 09:01:39'),(69,12,'2023-09-19 14:32:09',48.58,'123, B Street',8.10,4.50,'2023-09-19 09:02:09'),(70,12,'2023-09-19 14:32:44',0.00,'Joker Street',0.00,0.00,'2023-09-19 09:02:44'),(71,12,'2023-09-19 15:16:56',21.59,'Joker Street',3.60,2.00,'2023-09-19 09:46:56'),(72,12,'2023-09-20 11:02:08',2700.00,'123, CS-Street',450.00,250.00,'2023-09-20 05:32:08'),(73,20,'2023-09-20 12:11:39',48.58,'Abc Street',8.10,4.50,'2023-09-20 06:41:39'),(74,20,'2023-09-20 12:27:45',43.18,'Hyderabad',7.20,4.00,'2023-09-20 06:57:45'),(75,23,'2023-09-20 13:26:13',4320.00,'Hyderabad',720.00,400.00,'2023-09-20 07:56:13'),(76,12,'2023-09-20 13:35:13',2208.58,'Joker Street',368.10,204.50,'2023-09-20 08:05:13'),(77,20,'2023-09-21 09:24:50',21.59,'123, B Street',3.60,2.00,'2023-09-21 03:54:49'),(78,20,'2023-09-21 17:11:25',21.59,'123, B Street',3.60,2.00,'2023-09-21 11:41:25'),(79,20,'2023-09-21 17:14:48',21.59,'Hyderabad',3.60,2.00,'2023-09-21 11:44:48'),(80,20,'2023-09-26 16:45:42',41.02,'123, B Street',6.84,3.80,'2023-09-26 11:15:42'),(81,20,'2023-09-26 16:47:57',41.02,'123, B Street',6.84,3.80,'2023-09-26 11:17:57'),(82,20,'2023-09-26 16:49:33',41.02,'123, B Street',6.84,3.80,'2023-09-26 11:19:33'),(83,12,'2023-09-27 16:44:05',411.60,'Hyderabad',75.60,84.00,'2023-09-27 11:14:05'),(84,20,'2023-09-27 16:53:34',41.02,'123, B Street',6.84,3.80,'2023-09-27 11:23:34'),(85,20,'2023-09-27 17:00:53',41.02,'',6.84,3.80,'2023-09-27 11:30:53'),(86,20,'2023-09-27 17:00:57',41.02,'Hyderabad',6.84,3.80,'2023-09-27 11:30:57'),(87,20,'2023-09-27 17:10:16',411.60,'123, B Street',75.60,84.00,'2023-09-27 11:40:16'),(88,20,'2023-10-03 10:14:46',41.02,'123, B Street',6.84,3.80,'2023-10-03 04:44:46'),(89,20,'2023-10-03 10:18:59',41.02,'123, B Street',6.84,3.80,'2023-10-03 04:48:59'),(90,20,'2023-10-03 10:27:01',41.02,'123, B Street',6.84,3.80,'2023-10-03 04:57:01'),(91,20,'2023-10-03 10:38:06',41.02,'123, B Street',6.84,3.80,'2023-10-03 05:08:06'),(92,20,'2023-10-03 10:43:28',41.02,'123, B Street',6.84,3.80,'2023-10-03 05:13:28'),(93,20,'2023-10-03 10:48:28',41.02,'123, B Street',6.84,3.80,'2023-10-03 05:18:28'),(94,20,'2023-10-03 10:53:38',41.02,'123, B Street',6.84,3.80,'2023-10-03 05:23:38'),(95,20,'2023-10-03 11:00:26',48.58,'69 Street',8.10,4.50,'2023-10-03 05:30:26');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `customerID` int NOT NULL,
  `payment_Date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(120) NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paymentID`),
  KEY `fk_customerPayments` (`customerID`),
  KEY `fk_orderidPayments` (`orderID`),
  CONSTRAINT `fk_customerPayments` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `fk_orderidPayments` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'2023-09-01 10:30:00',59.95,'Paid','2023-09-01 07:03:33'),(2,2,2,'2023-09-02 11:30:00',74.99,'Paid','2023-09-01 07:03:33'),(3,3,3,'2023-09-03 12:30:00',44.98,'Paid','2023-09-01 07:03:33'),(4,4,4,'2023-09-04 13:30:00',89.97,'Paid','2023-09-01 07:03:33'),(5,5,5,'2023-09-05 14:30:00',68.97,'Paid','2023-09-01 07:03:33'),(6,16,7,'2023-09-08 16:28:43',32850.00,'Paid','2023-09-08 10:58:43'),(7,17,12,'2023-09-11 10:36:16',453.60,'Paid','2023-09-11 05:06:16'),(8,18,11,'2023-09-11 16:48:11',8208.00,'Paid','2023-09-11 11:18:11'),(9,19,12,'2023-09-11 17:00:09',907.20,'Paid','2023-09-11 11:30:09'),(10,31,12,'2023-09-11 18:43:14',15876.00,'Paid','2023-09-11 13:13:14'),(11,42,12,'2023-09-11 18:59:14',15876.00,'Paid','2023-09-11 13:29:14'),(12,43,12,'2023-09-11 19:03:41',8337.60,'Paid','2023-09-11 13:33:41'),(13,44,12,'2023-09-11 21:10:40',113.35,'Paid','2023-09-11 15:40:40'),(14,45,11,'2023-09-12 10:48:38',4968.00,'Paid','2023-09-12 05:18:38'),(15,46,11,'2023-09-12 10:48:51',10908.00,'Paid','2023-09-12 05:18:51'),(16,47,14,'2023-09-12 10:52:22',48.58,'Paid','2023-09-12 05:22:22'),(17,48,12,'2023-09-14 10:34:36',2160.00,'Paid','2023-09-14 05:04:36'),(18,49,12,'2023-09-14 10:35:29',1620.00,'Paid','2023-09-14 05:05:29'),(19,50,12,'2023-09-14 10:36:22',21.59,'Paid','2023-09-14 05:06:22'),(20,51,12,'2023-09-14 10:37:26',32.39,'Paid','2023-09-14 05:07:26'),(21,52,12,'2023-09-14 10:38:49',26.99,'Paid','2023-09-14 05:08:49'),(22,53,12,'2023-09-14 10:40:41',2160.00,'Paid','2023-09-14 05:10:41'),(23,54,12,'2023-09-14 10:41:58',26.99,'Paid','2023-09-14 05:11:58'),(24,55,12,'2023-09-14 10:43:23',1620.00,'Paid','2023-09-14 05:13:23'),(25,56,12,'2023-09-14 10:44:52',1620.00,'Paid','2023-09-14 05:14:52'),(26,57,12,'2023-09-14 11:05:05',16.19,'Paid','2023-09-14 05:35:05'),(27,58,12,'2023-09-14 18:17:00',453.60,'Paid','2023-09-14 12:47:00'),(28,59,12,'2023-09-14 18:39:15',453.60,'Paid','2023-09-14 13:09:15'),(29,60,12,'2023-09-14 18:39:19',453.60,'Paid','2023-09-14 13:09:19'),(30,61,12,'2023-09-14 18:46:58',453.60,'Paid','2023-09-14 13:16:58'),(31,62,11,'2023-09-18 11:36:41',48.58,'Paid','2023-09-18 06:06:41'),(32,63,12,'2023-09-19 10:24:22',43.18,'Paid','2023-09-19 04:54:22'),(33,64,12,'2023-09-19 10:25:07',453.60,'Paid','2023-09-19 04:55:07'),(34,65,12,'2023-09-19 10:53:47',21.59,'Paid','2023-09-19 05:23:47'),(35,66,12,'2023-09-19 10:59:15',24.83,'Paid','2023-09-19 05:29:15'),(36,67,12,'2023-09-19 11:01:15',3240.00,'Paid','2023-09-19 05:31:15'),(37,69,12,'2023-09-19 14:32:10',48.58,'Paid','2023-09-19 09:02:10'),(38,70,12,'2023-09-19 14:32:44',0.00,'Paid','2023-09-19 09:02:44'),(39,71,12,'2023-09-19 15:16:56',21.59,'Paid','2023-09-19 09:46:56'),(40,17,12,'2023-09-19 18:29:18',453.60,'Refund_Init.','2023-09-19 12:59:18'),(41,72,12,'2023-09-20 11:02:08',2700.00,'Pending','2023-09-20 05:32:08'),(42,73,20,'2023-09-20 12:11:40',48.58,'Paid','2023-09-20 06:41:40'),(43,73,20,'2023-09-20 12:14:40',21.59,'Refund_Init.','2023-09-20 06:44:40'),(44,73,20,'2023-09-20 12:15:01',26.99,'Refund_Init.','2023-09-20 06:45:01'),(45,74,20,'2023-09-20 12:27:46',43.18,'Paid','2023-09-20 06:57:46'),(46,74,20,'2023-09-20 12:28:19',41.58,'Refund_Init.','2023-09-20 06:58:19'),(47,75,23,'2023-09-20 13:26:13',4320.00,'Pending','2023-09-20 07:56:13'),(48,75,23,'2023-09-20 13:30:08',4160.00,'Refund_Init.','2023-09-20 08:00:08'),(49,76,12,'2023-09-20 13:35:13',2208.58,'Paid','2023-09-20 08:05:13'),(50,77,20,'2023-09-21 09:24:50',21.59,'Paid','2023-09-21 03:54:50'),(51,77,20,'2023-09-21 09:25:35',21.59,'Refund_Init.','2023-09-21 03:55:35'),(52,78,20,'2023-09-21 17:11:26',21.59,'Paid','2023-09-21 11:41:26'),(53,79,20,'2023-09-21 17:14:49',21.59,'Paid','2023-09-21 11:44:49'),(54,83,12,'2023-09-27 16:44:05',411.60,'Pending','2023-09-27 11:14:05'),(55,87,20,'2023-09-27 17:10:16',411.60,'Pending','2023-09-27 11:40:16'),(56,94,20,'2023-10-03 10:53:39',41.02,'Paid','2023-10-03 05:23:39'),(57,95,20,'2023-10-03 11:00:27',48.58,'Paid','2023-10-03 05:30:27');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisherID` int NOT NULL AUTO_INCREMENT,
  `publisher_Name` varchar(50) DEFAULT 'Prolifics',
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Publisher 1','2023-09-01 06:27:55'),(2,'Publisher 2','2023-09-01 06:27:55'),(3,'Publisher 3','2023-09-01 06:27:55'),(4,'Publisher 4','2023-09-01 06:27:55'),(5,'Publisher 5','2023-09-01 06:27:55'),(6,'Publisher 6','2023-09-07 04:57:10'),(7,'Publisher 8','2023-09-12 05:07:51'),(8,'Publisher 10','2023-09-20 06:31:21'),(9,'Demo11','2023-09-21 11:48:43');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `book_id` int NOT NULL,
  `rating` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`id`),
  KEY `fk_customerRating` (`customer_id`),
  KEY `fk_bookRating` (`book_id`),
  CONSTRAINT `fk_bookRating` FOREIGN KEY (`book_id`) REFERENCES `books` (`bookID`),
  CONSTRAINT `fk_customerRating` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,12,11,4),(2,12,9,3),(3,12,13,3),(4,12,7,5),(5,12,3,3),(6,12,2,4),(7,12,5,4),(8,12,4,1),(9,20,2,2),(10,20,3,5),(11,23,9,4);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `passcode` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `registration_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `name` varchar(25) NOT NULL DEFAULT 'Anonymous',
  `address` varchar(25) NOT NULL DEFAULT 'Address_user',
  `phone_no` bigint NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phoneNo_UNIQUE` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','admin@example.com','2023-09-01 12:44:39','admin','active','Anonymous','Address_user',123456789),(2,'6','2305136396','a@example.com','2023-09-01 15:17:47','user','active','Anonymous','Address_user',123985269),(3,'7','1478523969','b@example.com','2023-09-01 16:47:30','user','active','Anonymous','Address_user',23585269),(5,'A','123','A1@example.com','2023-09-05 13:51:04','user','active','Anonymous','Address_user',2358005269),(7,'B','123','B1@example.com',NULL,'User','Active','BBC','123, B Street',123456),(8,'C','123','C@example.com',NULL,'User','Active','CDD','123, CStreet',12345689),(11,'user1','12','1B@example.com',NULL,'User','Active','BBC1','123, B Street',124444),(12,'D11','999999999','d@example.com','2023-09-07 12:20:42','user','active','D','234 Main St',999999999),(13,'Abhinav12','96996939','abhinav@example.com','2023-09-07 12:37:11','user','active','Abhinav','69 Street',96996939),(14,'Bodhini','Bodhini123','Bodh@gmail.com',NULL,'User','Active','Bodhini Goli','Hyderabad',998765432),(15,'Deep13','6753754968','Deep@gmail.com','2023-09-12 10:38:25','user','active','Deep','bombay',6753754968),(16,'Ajay','Ajay123','Ajay@gmail.com',NULL,'Admin','Active','Ajay Saxena','Pune',7349876897),(17,'Bodhini Goli14','1234569973','Bodhni@example.com','2023-09-12 10:51:06','user','active','Bodhini Goli','abc 123',1234569973),(18,'Hero15','1111111111','hero@gmail.com','2023-09-12 12:40:14','user','active','Hero','Indian',1111111111),(19,'Villain16','2222222222','villain@gmail.com','2023-09-12 12:42:46','user','active','Villain','Indian',2222222222),(20,'Joker17','3333333333','joker@example.com','2023-09-12 12:46:46','user','active','Joker','Joker Street',3333333333),(21,'Harshit18','7078179015','harshit.tyagi@prolifics.com','2023-09-20 12:03:38','user','active','Harshit','Noida, UP',7078179015),(22,'Htyagi19','8439301087','harshit.tyagi@gmail.com','2023-09-20 12:07:12','user','active','Htyagi','HPR, Ind',8439301087),(23,'Aman20','9898989898','aman@example.com','2023-09-20 12:08:26','user','active','Aman','GZB, UP',9898989898),(24,'Radha22','9837303667','radha@example.com','2023-09-20 13:21:26','user','active','Radha','abc 123',9837303667),(25,'Sai23','7093177998','Sai@gmail.com','2023-09-20 13:22:42','user','active','Sai','Hyderabad',7093177998),(27,'Admin25','7500935628','admin1@example.com','2023-09-21 11:09:54','Admin','active','Admin','101 Admin Street',7500935628);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bookstoresproject'
--

--
-- Dumping routines for database 'bookstoresproject'
--
/*!50003 DROP FUNCTION IF EXISTS `UserLogInFun` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UserLogInFun`(
    p_username VARCHAR(50),
    p_password VARCHAR(100)
) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_storedPasswordHash VARCHAR(100);
	DECLARE v_inputPasswordHash VARCHAR(100);
    # Get the stored password hash for the provided username
    SELECT passcode INTO v_storedPasswordHash
    FROM Users
    WHERE username = p_username;

    # Hash the provided password using the same algorithm
    # SET v_inputPasswordHash = SHA2(p_password, 512); # Use the same hashing algorithm as used during registration

    # Check if the provided password hash matches the stored password hash
    IF v_storedPasswordHash = p_password THEN
        RETURN TRUE;
        # You might add additional actions here, like setting a session token or updating login history.
    ELSE
        RETURN FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBook`(
    IN p_authorID INT,
    IN p_publisherID INT,
    IN p_title VARCHAR(255),
    IN p_category VARCHAR(127),
    IN p_price DECIMAL(10, 2),
    IN p_ISBNcode BIGINT,
    IN p_pageCount INT,
    IN p_condition VARCHAR(5),
    IN p_publishedYear INT
)
BEGIN
    INSERT INTO Books (authorID, publisherID, title, category, price, ISBNcode, pageCount, publishedYear, bookCondition)
    VALUES (p_authorID, p_publisherID, p_title, p_category, p_price, p_ISBNcode, p_pageCount, p_publishedYear, p_condition);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCustomer`(
    IN p_custName VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_custAddress VARCHAR(100),
    IN p_contactNo BIGINT,
    IN p_existing_username INT,
    IN p_existing_passcode BIGINT
)
BEGIN
    DECLARE v_userExists INT;

    # Check if the user login credentials are valid
    SELECT UserLogInFun(p_existing_username, p_existing_passcode) INTO v_userExists;
	

    IF v_userExists = 1 THEN
        # User login is valid, insert the customer
        INSERT INTO Customer (cust_Name, email, cust_Address, contact_No)
        VALUES (p_custName, p_email, p_custAddress, p_contactNo);
    ELSE
        # User login is not valid
        SELECT 'Log in with valid credentials.' AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddToStockLevelNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddToStockLevelNew`(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelNew INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    UPDATE Inventory SET stockLevelNew = v_oldStock + p_quantity WHERE bookID = p_bookID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddToStockLevelUsed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddToStockLevelUsed`(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelUsed INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    UPDATE Inventory SET stockLevelUsed = v_oldStock + p_quantity WHERE bookID = p_bookID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GeneratePopularBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GeneratePopularBook`(IN p_topPopular INT)
BEGIN
    SELECT
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName,
        COUNT(OI.bookID) AS OrderedTimes
    FROM
        Books B
    JOIN
        Author A ON B.authorID = A.authorID
    INNER JOIN
        Publisher P ON B.publisherID = P.publisherID
    LEFT JOIN
        OrderItems OI ON OI.bookID = B.bookID
    GROUP BY
        OI.bookID,
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName
    ORDER BY
        OrderedTimes DESC
    LIMIT p_topPopular;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetReports`(IN p_bookID INT)
BEGIN
    SELECT
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName,
        COUNT(OI.bookID) AS TotalOrders,
        I.stockLevelNew,
        I.stockLevelUsed
    FROM
        Books B
    INNER JOIN
        Author A ON B.authorID = A.authorID
    INNER JOIN
        Publisher P ON B.publisherID = P.publisherID
    INNER JOIN
        OrderItems OI ON B.bookID = OI.bookID
    INNER JOIN
        Inventory I ON B.bookID = I.bookID
    WHERE
        B.bookID = p_bookID
    GROUP BY
        OI.bookID,
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName,
        I.stockLevelNew,
        I.stockLevelUsed;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    # DECLARE v_passcode VARCHAR(100);
    
    -- Hash the password using SHA2 (you can choose an appropriate hashing algorithm)
    # SET v_passcode = SHA2(p_password, 512);
    
    -- Insert user data into Users table
    INSERT INTO Users (username, passcode, email)
    VALUES (p_username, p_password, p_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchBookByAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchBookByAuthor`(IN p_Author VARCHAR(255))
BEGIN
    DECLARE v_authorID INT;
    SELECT authorID INTO v_authorID FROM Author WHERE authorName = p_Author;
    SELECT * FROM Books WHERE authorID = v_authorID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchBookByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchBookByID`(IN p_id INT)
BEGIN
    SELECT * FROM Books WHERE bookID = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchBookByTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchBookByTitle`(IN p_title VARCHAR(255))
BEGIN
    SELECT * FROM Books WHERE title = p_title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SubstractToStockLevelNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SubstractToStockLevelNew`(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelNew INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    IF v_oldStock - p_quantity > 0 THEN
        UPDATE Inventory SET stockLevelNew = v_oldStock - p_quantity WHERE bookID = p_bookID;
	ELSE 
		SELECT 'Ordered Quanitity is not available.' AS Message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SubstractToStockLevelUsed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SubstractToStockLevelUsed`(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelUsed INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    IF v_oldStock - p_quantity > 0 THEN
        UPDATE Inventory SET stockLevelUsed = v_oldStock - p_quantity WHERE bookID = p_bookID;
	ELSE 
		SELECT 'Ordered Quanitity is not available.' AS Message;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserLogin`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(100)
)
BEGIN
    DECLARE v_storedPasswordHash VARCHAR(100);
	# DECLARE v_inputPasswordHash VARCHAR(100);
    # Get the stored password hash for the provided username
    SELECT passcode INTO v_storedPasswordHash
    FROM Users
    WHERE username = p_username;

    # Hash the provided password using the same algorithm
    
    #SET v_inputPasswordHash = SHA2(p_password, 512); # Use the same hashing algorithm as used during registration

    # Check if the provided password hash matches the stored password hash
    IF v_storedPasswordHash = p_password THEN
        SELECT 'Login successful' AS Result;
        # You might add additional actions here, like setting a session token or updating login history.
    ELSE
        SELECT 'Login failed' AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewOrderHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewOrderHistory`(IN p_customerID INT)
BEGIN
	Declare p_SumAmount int;
    -- Calculate the total paid amount for the customer's orders
    SELECT IFNULL(SUM(amount), 0) INTO p_SumAmount
    FROM Payments
    WHERE customerID = p_customerID AND status = 'Paid';

    -- Retrieve the order history for the customer
    SELECT
        C.custName,
        O.orderID,
        O.orderDate,
        p_SumAmount AS TotalPaid,
        O.shippingAddress,
        O.taxAmount,
        O.discountAmount
    FROM
        Orders O
    INNER JOIN
        Customer C ON C.customerID = O.customerID
    WHERE
        C.customerID = p_customerID
    ORDER BY
        orderDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 15:05:37
