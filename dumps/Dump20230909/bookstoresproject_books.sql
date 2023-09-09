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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 12:39:11
