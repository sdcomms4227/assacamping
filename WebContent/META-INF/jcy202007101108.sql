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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'admin','이벤트1','이벤트1','event_1.jpg','2020-07-10 01:40:22',0),(2,'admin','이벤트2','2','event_2.jpg','2020-07-10 01:40:35',0),(3,'admin','이벤트3','3','event_3.jpg','2020-07-10 01:40:55',0),(4,'admin','이벤트4','4','event_4.jpg','2020-07-10 01:41:05',0),(5,'admin','이벤트5','5','event_5.jpg','2020-07-10 01:41:19',0),(6,'admin','이벤트6','6','event_6.jpg','2020-07-10 01:41:45',1),(7,'admin','이벤트7','http://www.ccamping.co.kr/shop/goods/goods_event.php?sno=23','event_7.jpg','2020-07-10 01:47:33',2),(8,'admin','이벤트8','8','event_8.jpg','2020-07-10 01:52:59',0),(9,'admin','이벤트9','9','event_1.jpg','2020-07-10 01:53:12',0),(10,'admin','ㅇㅇㅇ','ㅇㅇㅇㅇ','event_1.jpg','2020-07-10 01:58:03',0),(11,'admin','ㅇㅇㅁㄴㅇ','ㅇㅇㅇㅇ','event_2.jpg','2020-07-10 01:58:13',0),(12,'admin','ㅎㅎ','ㅎㅎ','event_4.jpg','2020-07-10 01:58:20',0),(13,'admin','ㅁㄴㅇㄹ','ㅇㄹㅇㄹㅇ','event_5.jpg','2020-07-10 01:58:32',0),(14,'admin','ㄴㄴ','ㄴㄴㄴ','event_6.jpg','2020-07-10 01:58:39',0),(15,'admin','ㄹㄹㅎㅎ','ㄹㄹㄹㅎㅎ','event_1.jpg','2020-07-10 01:59:27',2),(16,'admin','ㄴㄴㄴ','ㄴㄴ','event_1.jpg','2020-07-10 01:59:09',0);
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

-- Dump completed on 2020-07-10 11:07:45
