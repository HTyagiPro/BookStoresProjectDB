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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11 21:15:12
