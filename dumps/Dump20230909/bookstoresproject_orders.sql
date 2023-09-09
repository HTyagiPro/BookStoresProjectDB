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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 12:39:05
