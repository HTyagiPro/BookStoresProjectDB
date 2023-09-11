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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'2023-09-01 10:30:00',59.95,'Paid','2023-09-01 07:03:33'),(2,2,2,'2023-09-02 11:30:00',74.99,'Paid','2023-09-01 07:03:33'),(3,3,3,'2023-09-03 12:30:00',44.98,'Paid','2023-09-01 07:03:33'),(4,4,4,'2023-09-04 13:30:00',89.97,'Paid','2023-09-01 07:03:33'),(5,5,5,'2023-09-05 14:30:00',68.97,'Paid','2023-09-01 07:03:33'),(6,16,7,'2023-09-08 16:28:43',32850.00,'Paid','2023-09-08 10:58:43'),(7,17,12,'2023-09-11 10:36:16',453.60,'Paid','2023-09-11 05:06:16'),(8,18,11,'2023-09-11 16:48:11',8208.00,'Paid','2023-09-11 11:18:11'),(9,19,12,'2023-09-11 17:00:09',907.20,'Paid','2023-09-11 11:30:09'),(10,31,12,'2023-09-11 18:43:14',15876.00,'Paid','2023-09-11 13:13:14'),(11,42,12,'2023-09-11 18:59:14',15876.00,'Paid','2023-09-11 13:29:14'),(12,43,12,'2023-09-11 19:03:41',8337.60,'Paid','2023-09-11 13:33:41'),(13,44,12,'2023-09-11 21:10:40',113.35,'Paid','2023-09-11 15:40:40');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11 21:15:05
