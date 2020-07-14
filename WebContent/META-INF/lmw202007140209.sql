CREATE DATABASE  IF NOT EXISTS `assa` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `assa`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assa
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `camping`
--

DROP TABLE IF EXISTS `camping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camping` (
  `campingNo` int(11) NOT NULL,
  `campingTitle` varchar(50) DEFAULT NULL,
  `campingContent` varchar(2000) DEFAULT NULL,
  `campingFileName` varchar(2000) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `campingRe_ref` int(11) DEFAULT NULL,
  `campingRe_lev` int(11) DEFAULT NULL,
  `campingRe_seq` int(11) DEFAULT NULL,
  `campingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `campingCount` int(11) DEFAULT NULL,
  `campingCategoryNo` int(11) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`campingNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camping`
--

LOCK TABLES `camping` WRITE;
/*!40000 ALTER TABLE `camping` DISABLE KEYS */;
INSERT INTO `camping` VALUES (1,'제목','내용',NULL,'hong',1,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(2,'제목','내용',NULL,'hong',2,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(3,'제목','내용',NULL,'hong',3,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(4,'제목','내용',NULL,'hong',4,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(5,'제목','내용',NULL,'hong',5,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(6,'제목','내용',NULL,'hong',6,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(7,'제목','내용',NULL,'hong',7,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(8,'제목','내용',NULL,'hong',8,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(9,'제목','내용',NULL,'hong',9,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(10,'제목','내용',NULL,'hong',10,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(11,'제목','내용',NULL,'hong',11,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(12,'제목','내용',NULL,'hong',12,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(13,'제목','내용',NULL,'hong',13,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(14,'제목','내용',NULL,'hong',14,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(15,'제목','내용',NULL,'hong',15,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(16,'제목','내용',NULL,'hong',16,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(17,'제목','내용',NULL,'hong',17,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(18,'제목','내용',NULL,'hong',18,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(19,'제목','내용',NULL,'hong',19,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(20,'제목','내용',NULL,'hong',20,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(21,'제목','내용',NULL,'hong',20,1,1,'2020-07-11 14:10:19',0,1,'홍길동'),(22,'제목','내용',NULL,'hong',20,2,1,'2020-07-11 14:10:19',0,1,'홍길동'),(23,'제목','내용',NULL,'hong',20,1,2,'2020-07-11 14:10:19',0,1,'홍길동'),(24,'제목','내용',NULL,'hong',20,2,2,'2020-07-11 14:10:19',0,1,'홍길동'),(25,'제목','내용',NULL,'hong',20,3,1,'2020-07-11 14:10:19',0,1,'홍길동'),(26,'제목','내용',NULL,'hong',20,3,2,'2020-07-11 14:10:19',0,1,'홍길동'),(27,'제목','내용',NULL,'hong',20,1,3,'2020-07-11 14:10:19',0,1,'홍길동'),(28,'제목','내용',NULL,'hong',20,1,4,'2020-07-11 14:10:19',0,1,'홍길동'),(29,'제목','내용',NULL,'hong',20,1,5,'2020-07-11 14:10:19',0,1,'홍길동'),(30,'제목','내용',NULL,'hong',30,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(31,'제목','내용',NULL,'hong',31,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(32,'제목','내용',NULL,'hong',32,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(33,'제목','내용',NULL,'hong',33,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(34,'제목','내용',NULL,'hong',34,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(35,'제목','내용',NULL,'hong',35,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(36,'제목','내용',NULL,'hong',36,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(37,'제목','내용',NULL,'hong',37,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(38,'제목','내용',NULL,'hong',38,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(39,'제목','내용',NULL,'hong',39,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(40,'제목','내용',NULL,'hong',40,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(41,'제목','내용',NULL,'hong',41,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(42,'제목','내용',NULL,'hong',42,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(43,'제목','내용',NULL,'hong',43,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(44,'제목','내용',NULL,'hong',44,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(45,'제목','내용',NULL,'hong',45,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(46,'제목','내용',NULL,'hong',46,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(47,'제목','내용',NULL,'hong',47,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(48,'제목','내용',NULL,'hong',48,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(49,'제목','내용',NULL,'hong',49,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(50,'제목','내용',NULL,'hong',50,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(51,'제목','내용',NULL,'hong',51,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(52,'제목','내용',NULL,'hong',52,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(53,'제목','내용',NULL,'hong',53,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(54,'제목','내용',NULL,'hong',54,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(55,'제목','내용',NULL,'hong',55,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(56,'제목','내용',NULL,'hong',56,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(57,'제목','내용',NULL,'hong',57,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(58,'제목','내용',NULL,'hong',58,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(59,'제목','내용',NULL,'hong',59,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(60,'제목','내용',NULL,'hong',60,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(61,'제목','내용',NULL,'hong',61,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(62,'제목','내용',NULL,'hong',62,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(63,'제목','내용',NULL,'hong',63,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(64,'제목','내용',NULL,'hong',64,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(65,'제목','내용',NULL,'hong',65,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(66,'제목','내용',NULL,'hong',66,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(67,'제목','내용',NULL,'hong',67,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(68,'제목','내용',NULL,'hong',68,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(69,'제목','내용',NULL,'hong',69,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(70,'제목','내용',NULL,'hong',70,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(71,'제목','내용',NULL,'hong',71,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(72,'제목','내용',NULL,'hong',72,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(73,'제목','내용',NULL,'hong',73,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(74,'제목','내용',NULL,'hong',74,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(75,'제목','내용',NULL,'hong',75,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(76,'제목','내용',NULL,'hong',76,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(78,'제목78','내용',NULL,'hong',78,0,0,'2020-07-11 14:10:19',5,1,'홍길동'),(79,'제목','내용',NULL,'hong',79,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(80,'제목','내용',NULL,'hong',80,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(81,'제목','내용',NULL,'hong',81,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(82,'제목','내용',NULL,'hong',82,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(83,'제목','내용',NULL,'hong',83,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(84,'제목','내용',NULL,'hong',84,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(85,'제목','내용',NULL,'hong',85,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(86,'제목','내용',NULL,'hong',86,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(87,'제목','내용',NULL,'hong',87,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(88,'제목','내용',NULL,'hong',88,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(89,'제목89','내용',NULL,'hong',89,0,0,'2020-07-11 14:10:19',12,1,'홍길동'),(90,'제목','내용',NULL,'hong',90,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(91,'제목','내용',NULL,'hong',91,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(92,'제목','내용',NULL,'hong',92,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(93,'제목','내용',NULL,'hong',93,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(94,'제목','내용',NULL,'hong',94,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(95,'제목','내용',NULL,'hong',95,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(96,'제목','내용',NULL,'hong',96,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(97,'제목','내용',NULL,'hong',97,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(98,'제목','내용',NULL,'hong',98,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(99,'제목','내용',NULL,'hong',99,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(100,'제목','내용',NULL,'hong',100,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(101,'제목','내용',NULL,'hong',101,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(102,'제목','내용',NULL,'hong',102,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(103,'제목','내용',NULL,'hong',103,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(104,'제목','내용',NULL,'hong',104,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(105,'제목','내용',NULL,'hong',105,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(106,'제목','내용',NULL,'hong',106,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(107,'제목','내용',NULL,'hong',107,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(108,'제목','내용',NULL,'hong',108,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(109,'제목','내용',NULL,'hong',109,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(110,'제목','내용',NULL,'hong',110,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(111,'제목','내용',NULL,'hong',111,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(113,'제목','내용',NULL,'hong',113,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(114,'제목','내용',NULL,'hong',114,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(115,'제목','내용',NULL,'hong',115,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(116,'제목','내용',NULL,'hong',116,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(117,'117','117',NULL,'hong',117,0,0,'2020-07-11 14:10:19',3,3,'홍길동'),(118,'제목','내용',NULL,'hong',118,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(119,'제목','내용',NULL,'hong',119,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(120,'120','120',NULL,'hong',120,0,0,'2020-07-11 14:10:19',5,2,'홍길동'),(121,'121','121',NULL,'hong',121,0,0,'2020-07-11 14:10:19',3,1,'홍길동'),(122,'제목','내용',NULL,'hong',122,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(123,'제목','내용',NULL,'hong',123,0,0,'2020-07-11 14:10:19',8,1,'홍길동'),(124,'제목','내용',NULL,'hong',124,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(125,'125','125',NULL,'hong',125,0,0,'2020-07-11 14:10:19',4,3,'홍길동'),(126,'126','126',NULL,'hong',126,0,0,'2020-07-11 14:10:19',4,1,'홍길동'),(127,'127','127',NULL,'hong',127,0,0,'2020-07-11 14:10:19',5,2,'홍길동'),(128,'제목','내용',NULL,'hong',128,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(136,'추천 제목','내용',NULL,'hong',136,0,0,'2020-07-11 14:10:19',5,3,'홍길동'),(137,'[답글] 추천 제목 - 136 답글1 ㅇㅇ','1',NULL,'hong',136,1,1,'2020-07-11 14:10:19',7,3,'홍길동'),(138,'[답글] [답글] 추천 제목 - 136 답글1 ㅇㅇ -답답글','1','cat2.JPG','hong',136,2,2,'2020-07-11 14:10:19',5,3,'홍길동'),(140,'0','0',NULL,'hong',140,0,0,'2020-07-11 14:10:19',11,1,'홍길동'),(143,'제목 입니다.','내용 입니다.','cat3.JPG','hong',143,0,0,'2020-07-12 01:39:26',56,3,'홍길동'),(145,'[답글] 3','3',NULL,'hong',143,1,1,'2020-07-11 14:10:19',9,3,'홍길동'),(146,'[답글] [답글] 33','3','bg02.jpg','hong',143,2,2,'2020-07-11 14:10:19',11,3,'홍길동'),(147,'관리자가 등록한 정보','내용입니다.\r\n내용입니다.\r\n내용입니다.',NULL,'hong',147,0,0,'2020-07-12 09:35:29',77,1,'홍길동');
/*!40000 ALTER TABLE `camping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campingcategory`
--

DROP TABLE IF EXISTS `campingcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campingcategory` (
  `campingCategoryNo` int(11) NOT NULL AUTO_INCREMENT,
  `campingCategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`campingCategoryNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campingcategory`
--

LOCK TABLES `campingcategory` WRITE;
/*!40000 ALTER TABLE `campingcategory` DISABLE KEYS */;
INSERT INTO `campingcategory` VALUES (1,'정보'),(2,'소식'),(3,'추천'),(4,'레시피');
/*!40000 ALTER TABLE `campingcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `productNo` int(11) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `cartQuantity` int(11) DEFAULT NULL,
  `productDelivery` int(11) DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `productImage` varchar(100) DEFAULT NULL,
  `productCategory` varchar(100) DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `productCartDate` datetime DEFAULT NULL,
  `productTotalPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `boardCategoryNo` int(11) DEFAULT NULL,
  `boardNo` int(11) DEFAULT NULL,
  `commentNo` int(11) NOT NULL,
  `commentContent` varchar(1024) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `commentRe_ref` int(11) DEFAULT NULL,
  `commentRe_lev` int(11) DEFAULT NULL,
  `commentRe_seq` int(11) DEFAULT NULL,
  `commentWriteDate` date DEFAULT NULL,
  PRIMARY KEY (`commentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'test','hong','홍길동',0,0,0,'2020-06-28'),(1,1,2,'test','hong','홍길동',0,0,0,'2020-06-28'),(1,1,3,'test','hong','홍길동',0,0,0,'2020-06-28'),(2,1,4,'test1','hong','홍길동',0,0,0,'2020-07-02'),(1,2,5,'test','hong','홍길동',0,0,0,'2020-06-28');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventNo` int(11) NOT NULL AUTO_INCREMENT,
  `eventTitle` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `eventContent` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `eventImageFileName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `eventWriteDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `eventReadCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventNo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'이벤트1','이벤트1','event_1.jpg','2020-07-12 12:03:45',0),(2,'이벤트2','2','event_2.jpg','2020-07-12 13:14:25',1),(3,'이벤트3','3','event_3.jpg','2020-07-12 12:03:45',0),(4,'이벤트4','4','event_4.jpg','2020-07-12 12:03:45',0),(5,'이벤트5','5','event_5.jpg','2020-07-12 12:03:45',0),(6,'이벤트6','6','event_6.jpg','2020-07-12 12:03:45',1),(7,'이벤트7','http://www.ccamping.co.kr/shop/goods/goods_event.php?sno=23','event_7.jpg','2020-07-12 12:03:45',2),(8,'이벤트8','8','event_8.jpg','2020-07-12 12:03:45',0),(9,'이벤트9','9','event_1.jpg','2020-07-12 12:03:45',0),(10,'ㅇㅇㅇ','ㅇㅇㅇㅇ','event_1.jpg','2020-07-12 14:02:43',1),(11,'ㅇㅇㅁㄴㅇ','ㅇㅇㅇㅇ','event_2.jpg','2020-07-12 13:50:34',1),(12,'ㅎㅎ','ㅎㅎ','event_4.jpg','2020-07-12 13:50:21',1),(13,'ㅁㄴㅇㄹ','ㅇㄹㅇㄹㅇ','event_5.jpg','2020-07-12 14:03:45',1),(14,'ㄴㄴ','ㄴㄴㄴ','event_6.jpg','2020-07-12 13:50:19',1),(15,'ㄹㄹㅎㅎ','ㄹㄹㄹㅎㅎ','event_1.jpg','2020-07-13 17:05:40',3),(16,'제목 수정됨','내용 수정됨','event_1.jpg','2020-07-12 14:03:41',6);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `faqNo` int(11) NOT NULL AUTO_INCREMENT,
  `faqTitle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `faqContent` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `faqWriteDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`faqNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (5,'배송 기간은 얼마나 걸리나요?','입금 확인 후 1~7일 정도의 기간이 소요되며, 제품의 특성에 따라 그 이상 소요될 수 있습니다.\r\n(상품의 배송 기간은 각 상품 상세 페이지 하단의 배송안내란을 참고해 주시기 바랍니다.)','2020-07-13 05:05:46'),(6,'비회원은 어떻게 주문하나요?','ASSA Camping에서는 회원만 주문이 가능합니다.','2020-07-13 05:06:29'),(7,'주문 취소는 어떻게 하나요?','주문상태가 \"결제대기, 배송준비\" 상태일 경우 [나의 주문 내역] 페이지에서 주문 취소가 가능합니다.\r\n\"배송중\" 상태일 경우 주문취소가 불가능하며, \"배송완료\" 후 고객센터로 문의주시기 바랍니다.','2020-07-13 05:08:55');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstate`
--

DROP TABLE IF EXISTS `orderstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstate` (
  `orderStateNo` int(11) NOT NULL,
  `orderStateName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`orderStateNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstate`
--

LOCK TABLES `orderstate` WRITE;
/*!40000 ALTER TABLE `orderstate` DISABLE KEYS */;
INSERT INTO `orderstate` VALUES (1,'결제대기'),(2,'배송준비'),(3,'주문취소'),(4,'배송중'),(5,'배송완료'),(6,'구매확정'),(7,'반품신청'),(8,'반품완료');
/*!40000 ALTER TABLE `orderstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productNo` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `productContent` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `productImageName1` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `productImageName2` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `productImageName3` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productQuantity` int(11) DEFAULT NULL,
  `productDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productCategoryNo` int(11) DEFAULT NULL,
  `productRating` int(11) DEFAULT NULL,
  PRIMARY KEY (`productNo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'상품1','내용','product_1.jpg',NULL,NULL,32000,100,'2020-07-05 07:05:42',1,1),(2,'상품2','내용','product_2.jpg',NULL,NULL,23000,100,'2020-07-05 07:05:33',1,2),(3,'상품3','내용','product_3.jpg',NULL,NULL,10000,-4,'2020-07-12 00:45:06',1,5),(4,'상품4','내용','product_4.jpg',NULL,NULL,12000,98,'2020-07-13 16:59:03',2,4),(5,'상품5','내용','product_5.jpg',NULL,NULL,14000,97,'2020-07-11 14:56:28',2,3),(6,'상품6','내용','product_6.jpg',NULL,NULL,11500,100,'2020-07-05 07:04:17',2,5),(7,'상품7','내용','product_7.jpg',NULL,NULL,30000,100,'2020-07-05 07:04:30',3,4),(8,'상품8','내용','product_8.jpg',NULL,NULL,35000,100,'2020-07-05 07:04:35',3,4),(9,'상품9','내용','product_9.jpg',NULL,NULL,50000,100,'2020-07-05 07:04:40',3,2),(10,'상품10','내용','1_product_10.jpg',NULL,NULL,20000,100,'2020-07-05 07:00:34',3,2),(11,'상품11','내용','1_product_11.jpg',NULL,NULL,15000,0,'2020-07-05 07:00:44',3,3),(12,'상품12','상품 상세정보\r\n상품 상세정보\r\n상품 상세정보','1_product_12.jpg','2_product_image_2.jpg','3_product_image_3.jpg',12000,40,'2020-07-13 16:57:02',3,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `productCategoryNo` int(11) NOT NULL AUTO_INCREMENT,
  `productCategoryName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`productCategoryNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'텐트'),(2,'타프 / 파라솔 / 소품'),(3,'침낭 / 매트'),(4,'핫팩 / 손난로'),(5,'버너 / 그릴 / 화로'),(6,'취사용품'),(7,'랜턴 / 램프'),(8,'캠핑소품'),(9,'캠핑의자 / 테이블'),(10,'야전침대 / 해먹');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `productNo` int(11) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productDelivery` int(11) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `userZipcode` varchar(50) DEFAULT NULL,
  `userAddress1` varchar(50) DEFAULT NULL,
  `userAddress2` varchar(50) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `productCategory` varchar(50) DEFAULT NULL,
  `cartQuantity` int(11) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPhone` varchar(50) DEFAULT NULL,
  `userComment` varchar(100) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `orderNo` int(255) NOT NULL AUTO_INCREMENT,
  `orderDate` datetime DEFAULT NULL,
  `orderState` varchar(30) DEFAULT NULL,
  `productPayment` int(50) DEFAULT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com',1,'2020-07-02 16:42:35','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com',2,'2020-07-02 16:42:35','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com',3,'2020-07-02 16:42:35','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',4,'2020-07-02 16:43:10','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',5,'2020-07-02 16:43:10','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',6,'2020-07-02 16:43:10','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',7,'2020-07-02 16:46:08','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',8,'2020-07-02 16:46:08','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',9,'2020-07-02 16:46:08','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',10,'2020-07-02 16:46:57','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',11,'2020-07-02 16:46:57','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',12,'2020-07-02 16:46:57','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',13,'2020-07-02 16:49:23','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',14,'2020-07-02 16:49:23','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',15,'2020-07-02 16:49:23','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',16,'2020-07-02 16:52:07','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',17,'2020-07-02 16:52:07','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',18,'2020-07-02 16:52:07','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',19,'2020-07-02 16:53:05','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',20,'2020-07-02 16:53:05','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',21,'2020-07-02 16:53:05','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',22,'2020-07-02 16:53:25','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',23,'2020-07-02 16:53:25','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',24,'2020-07-02 16:53:25','결제대기',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',25,'2020-07-02 16:54:40','결제대기',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',26,'2020-07-02 16:54:40','결제대기',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com',27,'2020-07-02 16:54:40','결제대기',152500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',28,'2020-07-11 22:08:04','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',29,'2020-07-11 22:09:18','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',30,'2020-07-11 22:09:44','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',31,'2020-07-11 22:15:13','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',32,'2020-07-11 22:15:29','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',33,'2020-07-11 22:15:42','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',34,'2020-07-11 22:15:52','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',35,'2020-07-11 22:15:53','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',36,'2020-07-11 22:16:24','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',37,'2020-07-11 22:16:35','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',38,'2020-07-11 22:16:48','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',39,'2020-07-11 22:16:50','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',40,'2020-07-11 22:16:56','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',41,'2020-07-11 22:17:09','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',42,'2020-07-11 22:17:26','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',43,'2020-07-11 22:18:08','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',44,'2020-07-11 22:18:46','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',45,'2020-07-11 22:19:05','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',46,'2020-07-11 22:19:07','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',47,'2020-07-11 22:19:16','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',48,'2020-07-11 22:19:27','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',49,'2020-07-11 22:19:48','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',50,'2020-07-11 22:19:50','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',51,'2020-07-11 22:21:26','결제대기',292500),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',52,'2020-07-11 22:21:35','결제대기',292500),(5,'상품5',2500,14000,'12345','부산시 부산진구','7층','lee','2',3,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',53,'2020-07-11 23:56:28','결제대기',56000),(12,'상품12',2500,12000,'12345','부산시 부산진구','7층','lee','3',5,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',54,'2020-07-12 00:05:28','결제대기',302500),(12,'상품12',2500,12000,'12345','부산시 부산진구','7층','lee','3',9,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',55,'2020-07-12 00:07:35','결제대기',110500),(3,'상품3',2500,10000,'12345','부산시 부산진구','7층','lee','1',99,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',56,'2020-07-12 00:14:50','결제대기',992500),(3,'상품3',2500,10000,'12345','부산시 부산진구','7층','lee','1',5,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com',57,'2020-07-12 09:45:06','결제대기',64500),(12,'상품12',2500,12000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com',58,'2020-07-14 01:57:02','결제완료',14500),(4,'상품4',2500,12000,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com',59,'2020-07-14 01:58:52','결제완료',79500),(4,'상품4',2500,12000,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com',60,'2020-07-14 01:59:03','결제완료',79500);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `productNo` int(11) DEFAULT NULL,
  `qnaNo` int(11) NOT NULL,
  `qnaContent` varchar(2048) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `qnaDate` timestamp NULL DEFAULT NULL,
  `qnaAnswer` varchar(2048) DEFAULT NULL,
  `qnaAnswerDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`qnaNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (12,5,'홍길동','hong','홍길동','2020-07-09 06:14:28','답변','2020-07-10 03:37:02'),(12,7,'test1','hong','홍길동','2020-07-09 07:22:43',NULL,NULL),(12,8,'test2','hong','홍길동','2020-07-09 07:23:45',NULL,NULL),(10,11,'문의','inwoo','천인우','2020-07-09 09:15:06',NULL,NULL),(12,12,'안냐야','jung','정의동','2020-07-10 00:30:23','왜 의동아','2020-07-10 03:46:18'),(11,13,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:30:59',NULL,NULL),(11,14,'11111','jung','정의동','2020-07-10 01:43:02',NULL,NULL),(11,16,'ㅂㅇㄹ','hong','정의동','2020-07-10 02:27:58',NULL,NULL),(11,17,'ㅁㄴㅇㄹ','hong','정의동','2020-07-10 02:39:58',NULL,NULL),(10,20,'test3','hong','정의동','2020-07-10 02:51:19',NULL,NULL),(10,21,'test4','hong','정의동','2020-07-10 02:51:20',NULL,NULL),(10,22,'test5','hong','정의동','2020-07-10 02:51:24',NULL,NULL),(10,23,'test6','hong','홍길동','2020-07-10 03:08:50','answer test','2020-07-10 03:45:40');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `productNo` int(11) DEFAULT NULL,
  `reviewNo` int(11) NOT NULL,
  `reviewContent` varchar(2048) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `reviewDate` timestamp NULL DEFAULT NULL,
  `starRating` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (12,14,'자차카파','hong','홍길동','2020-07-09 07:48:12',5),(12,15,'타하','hong','홍길동','2020-07-09 07:48:22',2),(12,16,'가나다라','hong','홍길동','2020-07-09 07:52:19',1),(12,17,'마바사아','hong','홍길동','2020-07-09 07:52:24',4),(12,18,'abcd','hong','홍길동','2020-07-09 07:52:32',3),(12,19,'최악이네요','hong','홍길동','2020-07-09 08:36:05',1),(12,20,'천안\n나','jung','정의동','2020-07-10 00:30:38',5),(12,21,'ㅇ','jung','정의동','2020-07-10 00:56:47',5),(11,22,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:35',5),(11,23,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:39',3),(11,24,'ㅁㅁㅁㅁ','jung','정의동','2020-07-10 01:29:42',5),(11,25,'4','jung','정의동','2020-07-10 01:29:46',5),(10,27,'test2','hong','정의동','2020-07-10 02:50:59',4),(10,28,'test3','hong','정의동','2020-07-10 02:51:02',3),(10,29,'test4','hong','정의동','2020-07-10 02:51:06',2),(10,30,'test5','hong','정의동','2020-07-10 02:51:09',1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` varchar(12) NOT NULL,
  `userPw` varchar(12) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userPhone` varchar(20) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userZipcode` int(11) DEFAULT NULL,
  `userAddress1` varchar(100) DEFAULT NULL,
  `userAddress2` varchar(100) DEFAULT NULL,
  `userDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userUse` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','1234','관리자','010-1234-1234','admin@naver.com',4524,'서울 중구 세종대로 110','서울특별시청','2020-07-10 11:20:20',1),('anna','1234','천안나','010-1234-1234','anna@naver.com',46729,'부산 강서구 가달1로','7','2020-07-13 11:12:38',1),('cheon','1234','천인우','010-1234-1234','cheon@naver.com',3900,'서울 마포구 가양대로','1','2020-07-13 11:03:56',1),('im','1234','임한결','010-1234-1234','im@naver.com',4806,'서울 성동구 가람길 113','후생관','2020-07-13 11:07:08',1),('jung','1234','정의동','010-1234-1234','jung@naver.com',12990,'경기 하남시 감북로','8','2020-07-13 11:04:45',1),('kim','1234','김강열','010-1234-1234','kim@naver.com',13306,'경기 성남시 수정구 성남대로 지하 1332','가천대역','2020-07-13 11:11:52',1),('lee','1234','이가흔','010-1234-1234','lee@naver.com',5089,'서울 광진구 강변북로','6','2020-07-13 11:06:19',1),('park','1234','박지현','010-1234-1234','park@naver.com',52822,'경남 진주시 가좌길','11','2020-07-13 11:08:47',1),('seo','1234','서민재','010-1234-1234','seo@naver.com',7378,'서울 영등포구 가마산로','311','2020-07-13 11:07:53',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishNo` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `productNo` int(11) DEFAULT NULL,
  `wishDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'lee',11,'2020-07-13 16:39:22'),(2,'lee',10,'2020-07-13 16:39:26'),(3,'lee',12,'2020-07-13 16:39:32');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-14  2:09:33
