-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assa
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
  `userName` varchar(20) DEFAULT NULL,
  `campingRe_ref` int(11) DEFAULT NULL,
  `campingRe_lev` int(11) DEFAULT NULL,
  `campingRe_seq` int(11) DEFAULT NULL,
  `campingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `campingCount` int(11) DEFAULT NULL,
  `campingCategoryNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`campingNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camping`
--

LOCK TABLES `camping` WRITE;
/*!40000 ALTER TABLE `camping` DISABLE KEYS */;
INSERT INTO `camping` VALUES (1,'제목','내용',NULL,'hong','홍길동',1,0,0,'2020-07-08 10:39:38',0,1),(2,'제목','내용',NULL,'hong','홍길동',2,0,0,'2020-07-08 10:39:38',0,1),(3,'제목','내용',NULL,'hong','홍길동',3,0,0,'2020-07-08 10:39:38',0,1),(4,'제목','내용',NULL,'hong','홍길동',4,0,0,'2020-07-08 10:39:38',0,1),(5,'제목','내용',NULL,'hong','홍길동',5,0,0,'2020-07-08 10:39:38',0,1),(6,'제목','내용',NULL,'hong','홍길동',6,0,0,'2020-07-08 10:39:38',0,1),(7,'제목','내용',NULL,'hong','홍길동',7,0,0,'2020-07-08 10:39:38',0,1),(8,'제목','내용',NULL,'hong','홍길동',8,0,0,'2020-07-08 10:39:38',0,1),(9,'제목','내용',NULL,'hong','홍길동',9,0,0,'2020-07-08 10:39:38',0,1),(10,'제목','내용',NULL,'hong','홍길동',10,0,0,'2020-07-08 10:39:38',0,1),(11,'제목','내용',NULL,'hong','홍길동',11,0,0,'2020-07-08 10:39:38',0,1),(12,'제목','내용',NULL,'hong','홍길동',12,0,0,'2020-07-08 10:39:38',0,1),(13,'제목','내용',NULL,'hong','홍길동',13,0,0,'2020-07-08 10:39:38',0,1),(14,'제목','내용',NULL,'hong','홍길동',14,0,0,'2020-07-08 10:39:38',0,1),(15,'제목','내용',NULL,'hong','홍길동',15,0,0,'2020-07-08 10:39:38',0,1),(16,'제목','내용',NULL,'hong','홍길동',16,0,0,'2020-07-08 10:39:38',0,1),(17,'제목','내용',NULL,'hong','홍길동',17,0,0,'2020-07-08 10:39:38',0,1),(18,'제목','내용',NULL,'hong','홍길동',18,0,0,'2020-07-08 10:39:38',0,1),(19,'제목','내용',NULL,'hong','홍길동',19,0,0,'2020-07-08 10:39:38',0,1),(20,'제목','내용',NULL,'hong','홍길동',20,0,0,'2020-07-08 10:39:38',0,1),(21,'제목','내용',NULL,'hong','홍길동',20,1,1,'2020-07-08 10:39:38',0,1),(22,'제목','내용',NULL,'hong','홍길동',20,2,1,'2020-07-08 10:39:38',0,1),(23,'제목','내용',NULL,'hong','홍길동',20,1,2,'2020-07-08 10:39:38',0,1),(24,'제목','내용',NULL,'hong','홍길동',20,2,2,'2020-07-08 10:39:38',0,1),(25,'제목','내용',NULL,'hong','홍길동',20,3,1,'2020-07-08 10:39:38',0,1),(26,'제목','내용',NULL,'hong','홍길동',20,3,2,'2020-07-08 10:39:38',0,1),(27,'제목','내용',NULL,'hong','홍길동',20,1,3,'2020-07-08 10:39:38',0,1),(28,'제목','내용',NULL,'hong','홍길동',20,1,4,'2020-07-08 10:39:38',0,1),(29,'제목','내용',NULL,'hong','홍길동',20,1,5,'2020-07-08 10:39:38',0,1),(30,'제목','내용',NULL,'hong','홍길동',30,0,0,'2020-07-08 10:39:38',1,1),(31,'제목','내용',NULL,'hong','홍길동',31,0,0,'2020-07-08 10:39:38',0,1),(32,'제목','내용',NULL,'hong','홍길동',32,0,0,'2020-07-08 10:39:38',0,1),(33,'제목','내용',NULL,'hong','홍길동',33,0,0,'2020-07-08 10:39:38',0,1),(34,'제목','내용',NULL,'hong','홍길동',34,0,0,'2020-07-08 10:39:38',0,1),(35,'제목','내용',NULL,'hong','홍길동',35,0,0,'2020-07-08 10:39:38',0,1),(36,'제목','내용',NULL,'hong','홍길동',36,0,0,'2020-07-08 10:39:38',0,1),(37,'제목','내용',NULL,'hong','홍길동',37,0,0,'2020-07-08 10:39:38',0,1),(38,'제목','내용',NULL,'hong','홍길동',38,0,0,'2020-07-08 10:39:38',0,1),(39,'제목','내용',NULL,'hong','홍길동',39,0,0,'2020-07-08 10:39:38',0,1),(40,'제목','내용',NULL,'hong','홍길동',40,0,0,'2020-07-08 10:39:38',0,1),(41,'제목','내용',NULL,'hong','홍길동',41,0,0,'2020-07-08 10:39:38',0,1),(42,'제목','내용',NULL,'hong','홍길동',42,0,0,'2020-07-08 10:39:38',0,1),(43,'제목','내용',NULL,'hong','홍길동',43,0,0,'2020-07-08 10:39:38',0,1),(44,'제목','내용',NULL,'hong','홍길동',44,0,0,'2020-07-08 10:39:38',0,1),(45,'제목','내용',NULL,'hong','홍길동',45,0,0,'2020-07-08 10:39:38',0,1),(46,'제목','내용',NULL,'hong','홍길동',46,0,0,'2020-07-08 10:39:38',0,1),(47,'제목','내용',NULL,'hong','홍길동',47,0,0,'2020-07-08 10:39:38',0,1),(48,'제목','내용',NULL,'hong','홍길동',48,0,0,'2020-07-08 10:39:38',0,1),(49,'제목','내용',NULL,'hong','홍길동',49,0,0,'2020-07-08 10:39:38',0,1),(50,'제목','내용',NULL,'hong','홍길동',50,0,0,'2020-07-08 10:39:38',0,1),(51,'제목','내용',NULL,'hong','홍길동',51,0,0,'2020-07-08 10:39:38',0,1),(52,'제목','내용',NULL,'hong','홍길동',52,0,0,'2020-07-08 10:39:38',0,1),(53,'제목','내용',NULL,'hong','홍길동',53,0,0,'2020-07-08 10:39:38',0,1),(54,'제목','내용',NULL,'hong','홍길동',54,0,0,'2020-07-08 10:39:38',0,1),(55,'제목','내용',NULL,'hong','홍길동',55,0,0,'2020-07-08 10:39:38',0,1),(56,'제목','내용',NULL,'hong','홍길동',56,0,0,'2020-07-08 10:39:38',0,1),(57,'제목','내용',NULL,'hong','홍길동',57,0,0,'2020-07-08 10:39:38',0,1),(58,'제목','내용',NULL,'hong','홍길동',58,0,0,'2020-07-08 10:39:38',0,1),(59,'제목','내용',NULL,'hong','홍길동',59,0,0,'2020-07-08 10:39:38',0,1),(60,'제목','내용',NULL,'hong','홍길동',60,0,0,'2020-07-08 10:39:38',0,1),(61,'제목','내용',NULL,'hong','홍길동',61,0,0,'2020-07-08 10:39:38',0,1),(62,'제목','내용',NULL,'hong','홍길동',62,0,0,'2020-07-08 10:39:38',0,1),(63,'제목','내용',NULL,'hong','홍길동',63,0,0,'2020-07-08 10:39:38',0,1),(64,'제목','내용',NULL,'hong','홍길동',64,0,0,'2020-07-08 10:39:38',0,1),(65,'제목','내용',NULL,'hong','홍길동',65,0,0,'2020-07-08 10:39:38',0,1),(66,'제목','내용',NULL,'hong','홍길동',66,0,0,'2020-07-08 10:39:38',0,1),(67,'제목','내용',NULL,'hong','홍길동',67,0,0,'2020-07-08 10:39:38',0,1),(68,'제목','내용',NULL,'hong','홍길동',68,0,0,'2020-07-08 10:39:38',0,1),(69,'제목','내용',NULL,'hong','홍길동',69,0,0,'2020-07-08 10:39:38',0,1),(70,'제목','내용',NULL,'hong','홍길동',70,0,0,'2020-07-08 10:39:38',0,1),(71,'제목','내용',NULL,'hong','홍길동',71,0,0,'2020-07-08 10:39:38',0,1),(72,'제목','내용',NULL,'hong','홍길동',72,0,0,'2020-07-08 10:39:38',0,1),(73,'제목','내용',NULL,'hong','홍길동',73,0,0,'2020-07-08 10:39:38',0,1),(74,'제목','내용',NULL,'hong','홍길동',74,0,0,'2020-07-08 10:39:38',0,1),(75,'제목','내용',NULL,'hong','홍길동',75,0,0,'2020-07-08 10:39:38',0,1),(76,'제목','내용',NULL,'hong','홍길동',76,0,0,'2020-07-08 10:39:38',0,1),(78,'제목78','내용',NULL,'hong','홍길동',78,0,0,'2020-07-08 10:39:38',5,1),(79,'제목','내용',NULL,'hong','홍길동',79,0,0,'2020-07-08 10:39:38',0,1),(80,'제목','내용',NULL,'hong','홍길동',80,0,0,'2020-07-08 10:39:38',0,1),(81,'제목','내용',NULL,'hong','홍길동',81,0,0,'2020-07-08 10:39:38',0,1),(82,'제목','내용',NULL,'hong','홍길동',82,0,0,'2020-07-08 10:39:38',0,1),(83,'제목','내용',NULL,'hong','홍길동',83,0,0,'2020-07-08 10:39:38',0,1),(84,'제목','내용',NULL,'hong','홍길동',84,0,0,'2020-07-08 10:39:38',0,1),(85,'제목','내용',NULL,'hong','홍길동',85,0,0,'2020-07-08 10:39:38',1,1),(86,'제목','내용',NULL,'hong','홍길동',86,0,0,'2020-07-08 10:39:38',0,1),(87,'제목','내용',NULL,'hong','홍길동',87,0,0,'2020-07-08 10:39:38',0,1),(88,'제목','내용',NULL,'hong','홍길동',88,0,0,'2020-07-08 10:39:38',0,1),(89,'제목89','내용',NULL,'hong','홍길동',89,0,0,'2020-07-08 10:39:38',12,1),(90,'제목','내용',NULL,'hong','홍길동',90,0,0,'2020-07-08 10:39:38',0,1),(91,'제목','내용',NULL,'hong','홍길동',91,0,0,'2020-07-08 10:39:38',0,1),(92,'제목','내용',NULL,'hong','홍길동',92,0,0,'2020-07-08 10:39:38',0,1),(93,'제목','내용',NULL,'hong','홍길동',93,0,0,'2020-07-08 10:39:38',0,1),(94,'제목','내용',NULL,'hong','홍길동',94,0,0,'2020-07-08 10:39:38',0,1),(95,'제목','내용',NULL,'hong','홍길동',95,0,0,'2020-07-08 10:39:38',0,1),(96,'제목','내용',NULL,'hong','홍길동',96,0,0,'2020-07-08 10:39:38',0,1),(97,'제목','내용',NULL,'hong','홍길동',97,0,0,'2020-07-08 10:39:38',0,1),(98,'제목','내용',NULL,'hong','홍길동',98,0,0,'2020-07-08 10:39:38',1,1),(99,'제목','내용',NULL,'hong','홍길동',99,0,0,'2020-07-08 10:39:38',0,1),(100,'제목','내용',NULL,'hong','홍길동',100,0,0,'2020-07-08 10:39:38',0,1),(101,'제목','내용',NULL,'hong','홍길동',101,0,0,'2020-07-08 10:39:38',0,1),(102,'제목','내용',NULL,'hong','홍길동',102,0,0,'2020-07-08 10:39:38',0,1),(103,'제목','내용',NULL,'hong','홍길동',103,0,0,'2020-07-08 10:39:38',0,1),(104,'제목','내용',NULL,'hong','홍길동',104,0,0,'2020-07-08 10:39:38',0,1),(105,'제목','내용',NULL,'hong','홍길동',105,0,0,'2020-07-08 10:39:38',0,1),(106,'제목','내용',NULL,'hong','홍길동',106,0,0,'2020-07-08 10:39:38',0,1),(107,'제목','내용',NULL,'hong','홍길동',107,0,0,'2020-07-08 10:39:38',0,1),(108,'제목','내용',NULL,'hong','홍길동',108,0,0,'2020-07-08 10:39:38',0,1),(109,'제목','내용',NULL,'hong','홍길동',109,0,0,'2020-07-08 10:39:38',1,1),(110,'제목','내용',NULL,'hong','홍길동',110,0,0,'2020-07-08 10:39:38',0,1),(111,'제목','내용',NULL,'hong','홍길동',111,0,0,'2020-07-08 10:39:38',0,1),(113,'제목','내용',NULL,'hong','홍길동',113,0,0,'2020-07-08 10:39:38',0,1),(114,'제목','내용',NULL,'hong','홍길동',114,0,0,'2020-07-08 10:39:38',0,1),(115,'제목','내용',NULL,'hong','홍길동',115,0,0,'2020-07-08 10:39:38',0,1),(116,'제목','내용',NULL,'hong','홍길동',116,0,0,'2020-07-08 10:39:38',0,1),(117,'117','117',NULL,'hong','홍길동',117,0,0,'2020-07-08 10:39:38',3,3),(118,'제목','내용',NULL,'hong','홍길동',118,0,0,'2020-07-08 10:39:38',1,1),(119,'제목','내용',NULL,'hong','홍길동',119,0,0,'2020-07-08 10:39:38',0,1),(120,'120','120',NULL,'hong','홍길동',120,0,0,'2020-07-08 10:39:38',5,2),(121,'121','121',NULL,'hong','홍길동',121,0,0,'2020-07-08 10:39:38',3,1),(122,'제목','내용',NULL,'hong','홍길동',122,0,0,'2020-07-08 10:39:38',0,1),(123,'제목','내용',NULL,'hong','홍길동',123,0,0,'2020-07-08 10:39:38',8,1),(124,'제목','내용',NULL,'hong','홍길동',124,0,0,'2020-07-08 10:39:38',1,1),(125,'125','125',NULL,'hong','홍길동',125,0,0,'2020-07-08 10:39:38',4,3),(126,'126','126',NULL,'hong','홍길동',126,0,0,'2020-07-09 07:10:43',5,1),(127,'127','127',NULL,'hong','홍길동',127,0,0,'2020-07-08 10:39:38',5,2),(128,'제목','내용',NULL,'hong','홍길동',128,0,0,'2020-07-08 10:39:38',1,1),(136,'추천 제목','내용',NULL,'hong','홍길동',136,0,0,'2020-07-09 01:51:56',6,3),(137,'[답글] 추천 제목 - 136 답글1 ㅇㅇ','1',NULL,'hong','홍길동',136,1,1,'2020-07-08 10:39:38',7,3),(138,'[답글] [답글] 추천 제목 - 136 답글1 ㅇㅇ -답답글','1','cat2.JPG','hong','홍길동',136,2,2,'2020-07-08 10:39:38',5,3),(140,'0','0',NULL,'hong','홍길동',140,0,0,'2020-07-08 10:39:38',11,1),(143,'제목 입니다.','내용 입니다.','cat3.JPG','hong','홍길동',143,0,0,'2020-07-09 08:25:19',58,3),(145,'[답글] 3','3',NULL,'hong','홍길동',143,1,2,'2020-07-09 01:51:48',9,3),(146,'[답글] [답글] 33','3','bg02.jpg','hong','홍길동',143,2,3,'2020-07-09 01:51:48',11,3),(147,'관리자가 등록한 정보','내용입니다.\r\n내용입니다.\r\n내용입니다.',NULL,'hong','관리자',147,0,0,'2020-07-09 01:52:03',92,1),(148,'[답글] 제목 입니다.','dd',NULL,'lee','이순신',143,1,1,'2020-07-09 08:25:22',4,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
  `cartNo` int(11) NOT NULL,
  `productNo` int(11) DEFAULT NULL,
  `productQuantity` int(11) DEFAULT NULL,
  `productDelivery` int(11) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `cartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cartNo`)
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'상품1','내용','product_1.jpg',NULL,NULL,32000,100,'2020-07-05 07:05:42',1,1),(2,'상품2','내용','product_2.jpg',NULL,NULL,23000,100,'2020-07-05 07:05:33',1,2),(3,'상품3','내용','product_3.jpg',NULL,NULL,10000,100,'2020-07-05 06:05:58',1,5),(4,'상품4','내용','product_4.jpg',NULL,NULL,12000,100,'2020-07-05 07:04:06',2,4),(5,'상품5','내용','product_5.jpg',NULL,NULL,14000,100,'2020-07-05 07:04:11',2,3),(6,'상품6','내용','product_6.jpg',NULL,NULL,11500,100,'2020-07-05 07:04:17',2,5),(7,'상품7','내용','product_7.jpg',NULL,NULL,30000,100,'2020-07-05 07:04:30',3,4),(8,'상품8','내용','product_8.jpg',NULL,NULL,35000,100,'2020-07-05 07:04:35',3,4),(9,'상품9','내용','product_9.jpg',NULL,NULL,50000,100,'2020-07-05 07:04:40',3,2),(10,'상품10','내용','1_product_10.jpg',NULL,NULL,20000,100,'2020-07-05 07:00:34',3,2),(11,'상품11','내용','1_product_11.jpg',NULL,NULL,15000,0,'2020-07-05 07:00:44',3,3),(12,'상품12','상품 상세정보\r\n상품 상세정보\r\n상품 상세정보','1_product_12.jpg','2_product_image_2.jpg','3_product_image_3.jpg',12000,100,'2020-07-05 10:33:38',3,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcart`
--

DROP TABLE IF EXISTS `productcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcart` (
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
-- Dumping data for table `productcart`
--

LOCK TABLES `productcart` WRITE;
/*!40000 ALTER TABLE `productcart` DISABLE KEYS */;
INSERT INTO `productcart` VALUES (1,50000,1,2500,'탠트1','test.jpg','탠트','hong','2020-06-26 16:27:31',50000),(2,50000,2,2500,'탠트2','test.jpg','탠트','hong','2020-06-26 16:27:48',100000);
/*!40000 ALTER TABLE `productcart` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com',1,'2020-07-02 16:42:35','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com',2,'2020-07-02 16:42:35','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com',3,'2020-07-02 16:42:35','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',4,'2020-07-02 16:43:10','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',5,'2020-07-02 16:43:10','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',6,'2020-07-02 16:43:10','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',7,'2020-07-02 16:46:08','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',8,'2020-07-02 16:46:08','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',9,'2020-07-02 16:46:08','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',10,'2020-07-02 16:46:57','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',11,'2020-07-02 16:46:57','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',12,'2020-07-02 16:46:57','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',13,'2020-07-02 16:49:23','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',14,'2020-07-02 16:49:23','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',15,'2020-07-02 16:49:23','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',16,'2020-07-02 16:52:07','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',17,'2020-07-02 16:52:07','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',18,'2020-07-02 16:52:07','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',19,'2020-07-02 16:53:05','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',20,'2020-07-02 16:53:05','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',21,'2020-07-02 16:53:05','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',22,'2020-07-02 16:53:25','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',23,'2020-07-02 16:53:25','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',24,'2020-07-02 16:53:25','결제완료',152500),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',25,'2020-07-02 16:54:40','결제완료',152500),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',26,'2020-07-02 16:54:40','결제완료',152500),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','psm211','탠트',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com',27,'2020-07-02 16:54:40','결제완료',152500);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productqna`
--

DROP TABLE IF EXISTS `productqna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productqna` (
  `productNo` int(11) DEFAULT NULL,
  `qnaNo` int(11) NOT NULL,
  `qnaContent` varchar(2048) DEFAULT NULL,
  `qnaAnswer` varchar(2048) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `qnaDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`qnaNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productqna`
--

LOCK TABLES `productqna` WRITE;
/*!40000 ALTER TABLE `productqna` DISABLE KEYS */;
INSERT INTO `productqna` VALUES (12,1,'내용','답변했어요.\r\n답변했어요.\r\n답변했어요.','hong','홍길동','2020-07-09 08:32:41'),(12,2,'내용',NULL,'hong','홍길동','2020-07-09 05:30:35'),(12,3,'내용',NULL,'hong','홍길동','2020-07-09 05:30:35'),(12,4,'내용','답변 내용입니다.','hong','홍길동','2020-07-09 07:40:45'),(11,5,'내용',NULL,'lee','이순신','2020-07-09 08:34:48'),(10,6,'문의드려요.',NULL,'lee','이순신','2020-07-09 08:35:33'),(10,7,'언제입고되나요?','입고예정이 없습니다.\r\n\r\n재입고알림을 받으시려면\r\n상품페이지에서 \"재입고알림\"을 눌러서 등록해주세요.','lee','이순신','2020-07-09 08:36:21'),(11,8,'반품하고 싶어요.',NULL,'lee','이순신','2020-07-09 08:35:33'),(8,9,'문의내용',NULL,'hong','홍길동','2020-07-09 09:14:59'),(11,10,'내용3',NULL,'lee','이순신','2020-07-09 09:15:23'),(12,11,'내용5',NULL,'hong','홍길동','2020-07-09 09:15:23'),(12,12,'내용33',NULL,'hong','홍길동','2020-07-09 09:15:23'),(12,13,'내용555',NULL,'hong','홍길동','2020-07-09 09:15:23'),(12,14,'내용1234',NULL,'hong','홍길동','2020-07-09 09:15:23'),(11,15,'문의내용입니다.',NULL,'lee','이순신','2020-07-09 09:15:23'),(10,16,'문의드려요.',NULL,'lee','이순신','2020-07-09 09:15:23'),(10,17,'언제입고되나요?',NULL,'lee','이순신','2020-07-09 09:15:23'),(11,18,'반품하고 싶어요.','반품하세요.','lee','이순신','2020-07-09 09:15:39'),(8,19,'문의내용','네네','hong','홍길동','2020-07-09 09:17:53'),(11,20,'내용3',NULL,'lee','이순신','2020-07-09 09:17:04'),(12,21,'내용5',NULL,'hong','홍길동','2020-07-09 09:17:04'),(12,22,'내용33','답답스','hong','홍길동','2020-07-09 09:17:30'),(12,23,'내용555',NULL,'hong','홍길동','2020-07-09 09:17:04'),(12,24,'내용1234','네네','hong','홍길동','2020-07-09 09:18:01'),(11,25,'문의내용입니다.','답답','lee','이순신','2020-07-09 09:17:19'),(10,26,'문의드려요.',NULL,'lee','이순신','2020-07-09 09:17:04'),(10,27,'언제입고되나요?','답답','lee','이순신','2020-07-09 09:17:13'),(11,28,'반품하고 싶어요.',NULL,'lee','이순신','2020-07-09 09:17:04'),(10,29,'문의내용','답변드립니다.','hong','홍길동','2020-07-10 00:47:20');
/*!40000 ALTER TABLE `productqna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productreview`
--

DROP TABLE IF EXISTS `productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productreview` (
  `productNo` int(11) DEFAULT NULL,
  `reviewNo` int(11) NOT NULL,
  `reviewContent` varchar(2048) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `starRating` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productreview`
--

LOCK TABLES `productreview` WRITE;
/*!40000 ALTER TABLE `productreview` DISABLE KEYS */;
INSERT INTO `productreview` VALUES (12,1,'내용','hong','홍길동','2020-07-09 02:38:33',5),(12,2,'내용','hong','홍길동','2020-07-09 02:38:33',2),(12,3,'내용','hong','홍길동','2020-07-09 02:38:34',3),(12,4,'내용','hong','홍길동','2020-07-09 02:38:34',4),(12,5,'내용','hong','홍길동','2020-07-09 02:38:34',5);
/*!40000 ALTER TABLE `productreview` ENABLE KEYS */;
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
  `userZipcode` varchar(20) DEFAULT NULL,
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
INSERT INTO `user` VALUES ('1','1','1','1','1@1','1','1','1','2020-06-23 15:00:00',1),('10','10','101010','10','10','10','10','10','2020-07-09 07:04:45',1),('4','4','4','4','4@4','4','4','4','2020-06-23 15:00:00',1),('5','5','5','5','5@5','5','5','5','2020-06-23 15:00:00',1),('9','9','9','9','9','9','9','9','2020-07-05 15:00:00',0),('admin','1234','관리자','010-1234-1234','admin@naver.com','1','1','1','2020-07-04 15:00:00',1),('hong','1234','홍길동','11','11','11','11','11','2020-07-01 15:00:00',1),('lee','1234','이순신','2','2','2','2','2','2020-07-01 15:00:00',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-10 17:55:55
