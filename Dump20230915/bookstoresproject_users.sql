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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'0','100000001','admin@example.com','2023-09-01 12:44:39','admin','active','Anonymous','Address_user',123456789),(2,'6','2305136396','a@example.com','2023-09-01 15:17:47','user','active','Anonymous','Address_user',123985269),(3,'7','1478523969','b@example.com','2023-09-01 16:47:30','user','active','Anonymous','Address_user',23585269),(5,'A','123','A1@example.com','2023-09-05 13:51:04','user','active','Anonymous','Address_user',2358005269),(7,'B','123','B1@example.com',NULL,'User','Active','BBC','123, B Street',123456),(8,'C','123','C@example.com',NULL,'User','Active','CDD','123, CStreet',12345689),(11,'user1','12','1B@example.com',NULL,'User','Active','BBC1','123, B Street',124444),(12,'D11','999999999','d@example.com','2023-09-07 12:20:42','user','active','D','234 Main St',999999999),(13,'Abhinav12','96996939','abhinav@example.com','2023-09-07 12:37:11','user','active','Abhinav','69 Street',96996939),(14,'Bodhini','Bodhini123','Bodh@gmail.com',NULL,'User','Active','Bodhini Goli','Hyderabad',998765432),(15,'Deep13','6753754968','Deep@gmail.com','2023-09-12 10:38:25','user','active','Deep','bombay',6753754968),(16,'Ajay','Ajay123','Ajay@gmail.com',NULL,'Admin','Active','Ajay Saxena','Pune',7349876897),(17,'Bodhini Goli14','1234569973','Bodhni@example.com','2023-09-12 10:51:06','user','active','Bodhini Goli','abc 123',1234569973),(18,'Hero15','1111111111','hero@gmail.com','2023-09-12 12:40:14','user','active','Hero','Indian',1111111111),(19,'Villain16','2222222222','villain@gmail.com','2023-09-12 12:42:46','user','active','Villain','Indian',2222222222),(20,'Joker17','3333333333','joker@example.com','2023-09-12 12:46:46','user','active','Joker','Joker Street',3333333333);
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

-- Dump completed on 2023-09-15 18:12:22
