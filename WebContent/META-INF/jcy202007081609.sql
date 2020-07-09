CREATE DATABASE  IF NOT EXISTS `assa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `assa`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: assa
-- ------------------------------------------------------
-- Server version	5.6.47-log

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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventNo` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `eventTitle` varchar(20) DEFAULT NULL,
  `eventContent` varchar(4000) DEFAULT NULL,
  `eventImageFileName` varchar(50) DEFAULT NULL,
  `eventWriteDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `eventReadCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventNo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (4,'admin','이벤트4','이벤트4','event_4.jpg','2020-07-08 03:43:06',0),(5,'admin','이벤트5','이벤트5','event_5.jpg','2020-07-08 03:43:17',0),(6,'admin','이벤트6','6','event_6.jpg','2020-07-08 03:43:28',0),(7,'admin','이벤트7','7','event_2.jpg','2020-07-08 03:43:47',0),(8,'admin','8','8','event_4.jpg','2020-07-08 03:43:57',0),(9,'admin','9','	9\r\n	','event_5.jpg','2020-07-08 05:29:50',9),(10,'admin','10','ㅇ','event_1.jpg','2020-07-08 03:44:17',0),(11,'admin','211','111','event_3.jpg','2020-07-08 03:44:29',0),(12,'admin','11111','ㅇㅇㅇ','event_5.jpg','2020-07-08 03:50:17',1),(13,'admin','222','222','event_1.jpg','2020-07-08 05:16:31',0),(14,'admin','g','gg','event_1.jpg','2020-07-08 05:17:43',0),(15,'admin','dd','dd','event_6.jpg','2020-07-08 05:22:36',0),(16,'admin','hh','hh','event_5.jpg','2020-07-08 05:23:23',0);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-08 15:49:54
