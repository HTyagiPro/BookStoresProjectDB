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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Author 1','2023-09-01 06:27:48'),(2,'Author 2','2023-09-01 06:27:48'),(3,'Author 3','2023-09-01 06:27:48'),(4,'Author 4','2023-09-01 06:27:48'),(5,'Author 5','2023-09-01 06:27:48'),(6,'Author 6','2023-09-06 13:10:23');
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
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `ISBNcode` (`ISBNcode`),
  KEY `fk_authorBooks` (`authorID`),
  KEY `fk_publisherBooks` (`publisherID`),
  CONSTRAINT `fk_authorBooks` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  CONSTRAINT `fk_publisherBooks` FOREIGN KEY (`publisherID`) REFERENCES `publisher` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,1,1,'Book 1','Category 1',19.99,1234567890123,300,2022,'New','2023-09-01 07:00:08','https://edit.org/images/cat/book-covers-big-2019101610.jpg'),(3,2,2,'Book 2','Category 2',24.99,2345678901234,250,2021,'Used','2023-09-01 07:00:08','https://edit.org/images/cat/book-covers-big-2019101610.jpg'),(4,3,3,'Book 3','Category 1',14.99,3456789012345,400,2023,'New','2023-09-01 07:00:08','https://edit.org/images/cat/book-covers-big-2019101610.jpg'),(5,4,4,'Book 4','Category 3',29.99,4567890123456,350,2020,'Used','2023-09-01 07:00:08','https://images.unsplash.com/photo-1629992101753-56d196c8aabb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&w=1000&q=80'),(6,5,5,'Book 5','Category 2',22.99,5678901234567,320,2022,'New','2023-09-01 07:00:08','https://images.unsplash.com/photo-1629992101753-56d196c8aabb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&w=1000&q=80'),(7,5,4,'The Vampire Diaries','Super Naturals',1500.00,1472361,650,2016,'New','2023-09-01 07:04:05','https://m.media-amazon.com/images/I/51ytBkF2IbL.jpg'),(9,2,2,'The Orignals','Super Naturals',2000.00,998991993,650,2013,'Used',NULL,'https://flxt.tmsimg.com/assets/p9944343_b_v9_al.jpg'),(10,5,5,'The Legcies','Super Naturals',2500.00,99899003,550,2017,'New',NULL,'https://upload.wikimedia.org/wikipedia/en/2/2e/The_Legacy_of_the_Bones_poster.jpg'),(11,4,4,'The God\'s Eye','Super Naturals',2300.00,998991993000,650,2013,'Used','2023-09-06 10:56:58','https://cdn.kobo.com/book-images/091d647f-6fe5-4f8f-b7e5-3b73681b09ac/1200/1200/False/the-god-s-eye-a-fantasy-short-story-1.jpg'),(13,6,6,'How to became Rich?','Philosophy',420.00,99887766,250,2007,'New','2023-09-08 11:28:00','https://fourminutebooks.com/wp-content/uploads/2019/03/best-finance-books-think-and-grow-rich.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

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
  `price_Of_Unit_Quantity` decimal(10,2) NOT NULL,
  `record_Created_On` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_bookCart` (`bookID`),
  CONSTRAINT `fk_bookCart` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Customer 1','customer1@example.com','Address 1',1234567890,'2023-09-01 06:28:01'),(2,'Customer 2','customer2@example.com','Address 2',2345678901,'2023-09-01 06:28:01'),(3,'Customer 3','customer3@example.com','Address 3',3456789012,'2023-09-01 06:28:01'),(4,'Customer 4','customer4@example.com','Address 4',4567890123,'2023-09-01 06:28:01'),(5,'Customer 5','customer5@example.com','Address 5',5678901234,'2023-09-01 06:28:01'),(6,'A','a@example.com','123 Main St',2305136396,'2023-09-01 09:47:47'),(7,'B','b@example.com','234 Main St',1478523969,'2023-09-01 11:17:30'),(11,'D','d@example.com','234 Main St',999999999,'2023-09-07 06:50:42'),(12,'Abhinav','abhinav@example.com','69 Street',96996939,'2023-09-07 07:07:12');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,2,10,20,'2023-09-01 09:21:27'),(2,3,4,6,'2023-09-01 09:21:27'),(3,4,8,22,'2023-09-01 09:21:27'),(4,5,12,18,'2023-09-01 09:21:27'),(5,6,6,14,'2023-09-01 09:21:27'),(6,13,0,0,'2023-09-08 11:27:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,1,2,19.99,'2023-09-01 07:03:25'),(2,2,3,2,3,24.99,'2023-09-01 07:03:25'),(3,3,4,3,1,14.99,'2023-09-01 07:03:25'),(4,4,5,4,4,29.99,'2023-09-01 07:03:25'),(5,5,6,5,2,22.99,'2023-09-01 07:03:25'),(6,16,7,7,4,1500.00,'2023-09-08 10:58:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-09-01 10:00:00',59.95,'Shipping Address 1',4.00,0.00,'2023-09-01 07:01:53'),(2,2,'2023-09-02 11:00:00',74.99,'Shipping Address 2',5.00,0.00,'2023-09-01 07:01:53'),(3,3,'2023-09-03 12:00:00',44.98,'Shipping Address 3',3.00,0.00,'2023-09-01 07:01:53'),(4,4,'2023-09-04 13:00:00',89.97,'Shipping Address 4',6.00,0.00,'2023-09-01 07:01:53'),(5,5,'2023-09-05 14:00:00',68.97,'Shipping Address 5',4.00,0.00,'2023-09-01 07:01:53'),(6,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 10:41:39'),(7,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 10:43:45'),(8,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:02:47'),(9,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:10:28'),(10,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:10:36'),(11,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:11:08'),(12,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:11:09'),(13,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:11:09'),(14,6,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:12:10'),(15,7,'2023-08-30 10:00:00',25.99,'123 Main St',3.00,1.00,'2023-09-01 11:17:52'),(16,7,'2023-09-08 16:28:42',32850.00,'123, B Street',18.00,150.00,'2023-09-08 10:58:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'2023-09-01 10:30:00',59.95,'Paid','2023-09-01 07:03:33'),(2,2,2,'2023-09-02 11:30:00',74.99,'Paid','2023-09-01 07:03:33'),(3,3,3,'2023-09-03 12:30:00',44.98,'Paid','2023-09-01 07:03:33'),(4,4,4,'2023-09-04 13:30:00',89.97,'Paid','2023-09-01 07:03:33'),(5,5,5,'2023-09-05 14:30:00',68.97,'Paid','2023-09-01 07:03:33'),(6,16,7,'2023-09-08 16:28:43',32850.00,'Paid','2023-09-08 10:58:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Publisher 1','2023-09-01 06:27:55'),(2,'Publisher 2','2023-09-01 06:27:55'),(3,'Publisher 3','2023-09-01 06:27:55'),(4,'Publisher 4','2023-09-01 06:27:55'),(5,'Publisher 5','2023-09-01 06:27:55'),(6,'Publisher 6','2023-09-07 04:57:10');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'0','100000001','admin@example.com','2023-09-01 12:44:39','admin','active','Anonymous','Address_user',123456789),(2,'6','2305136396','a@example.com','2023-09-01 15:17:47','user','active','Anonymous','Address_user',123985269),(3,'7','1478523969','b@example.com','2023-09-01 16:47:30','user','active','Anonymous','Address_user',23585269),(5,'A','123','A1@example.com','2023-09-05 13:51:04','user','active','Anonymous','Address_user',2358005269),(7,'B','123','B1@example.com',NULL,'User','Active','BBC','123, B Street',123456),(8,'C','123','C@example.com',NULL,'User','Active','CDD','123, CStreet',12345689),(11,'user1','12','1B@example.com',NULL,'User','Active','BBC1','123, B Street',124444),(12,'D11','999999999','d@example.com','2023-09-07 12:20:42','user','active','D','234 Main St',999999999),(13,'Abhinav12','96996939','abhinav@example.com','2023-09-07 12:37:11','user','active','Abhinav','69 Street',96996939);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 12:40:41
