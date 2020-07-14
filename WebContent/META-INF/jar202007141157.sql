-- MySQL dump 10.13  Distrib 5.6.45, for Win64 (x86_64)
--
-- Host: localhost    Database: assa
-- ------------------------------------------------------
-- Server version	5.6.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `camping` VALUES (1,'제목','내용',NULL,'hong',1,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(2,'제목','내용',NULL,'hong',2,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(3,'제목','내용',NULL,'hong',3,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(4,'제목','내용',NULL,'hong',4,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(5,'제목','내용',NULL,'hong',5,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(6,'제목','내용',NULL,'hong',6,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(7,'제목','내용',NULL,'hong',7,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(8,'제목','내용',NULL,'hong',8,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(9,'제목','내용',NULL,'hong',9,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(10,'제목','내용',NULL,'hong',10,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(11,'제목','내용',NULL,'hong',11,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(12,'제목','내용',NULL,'hong',12,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(13,'제목','내용',NULL,'hong',13,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(14,'제목','내용',NULL,'hong',14,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(15,'제목','내용',NULL,'hong',15,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(16,'제목','내용',NULL,'hong',16,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(17,'제목','내용',NULL,'hong',17,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(18,'제목','내용',NULL,'hong',18,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(19,'제목','내용',NULL,'hong',19,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(20,'제목','내용',NULL,'hong',20,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(21,'제목','내용',NULL,'hong',20,1,1,'2020-07-11 14:10:19',0,1,'홍길동'),(22,'제목','내용',NULL,'hong',20,2,1,'2020-07-11 14:10:19',0,1,'홍길동'),(23,'제목','내용',NULL,'hong',20,1,2,'2020-07-11 14:10:19',0,1,'홍길동'),(24,'제목','내용',NULL,'hong',20,2,2,'2020-07-11 14:10:19',0,1,'홍길동'),(25,'제목','내용',NULL,'hong',20,3,1,'2020-07-11 14:10:19',0,1,'홍길동'),(26,'제목','내용',NULL,'hong',20,3,2,'2020-07-11 14:10:19',0,1,'홍길동'),(27,'제목','내용',NULL,'hong',20,1,3,'2020-07-11 14:10:19',0,1,'홍길동'),(28,'제목','내용',NULL,'hong',20,1,4,'2020-07-11 14:10:19',0,1,'홍길동'),(29,'제목','내용',NULL,'hong',20,1,5,'2020-07-11 14:10:19',0,1,'홍길동'),(30,'제목','내용',NULL,'hong',30,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(31,'제목','내용',NULL,'hong',31,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(32,'제목','내용',NULL,'hong',32,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(33,'제목','내용',NULL,'hong',33,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(34,'제목','내용',NULL,'hong',34,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(35,'제목','내용',NULL,'hong',35,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(36,'제목','내용',NULL,'hong',36,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(37,'제목','내용',NULL,'hong',37,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(38,'제목','내용',NULL,'hong',38,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(39,'제목','내용',NULL,'hong',39,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(40,'제목','내용',NULL,'hong',40,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(41,'제목','내용',NULL,'hong',41,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(42,'제목','내용',NULL,'hong',42,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(43,'제목','내용',NULL,'hong',43,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(44,'제목','내용',NULL,'hong',44,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(45,'제목','내용',NULL,'hong',45,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(46,'제목','내용',NULL,'hong',46,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(47,'제목','내용',NULL,'hong',47,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(48,'제목','내용',NULL,'hong',48,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(49,'제목','내용',NULL,'hong',49,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(50,'제목','내용',NULL,'hong',50,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(51,'제목','내용',NULL,'hong',51,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(52,'제목','내용',NULL,'hong',52,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(53,'제목','내용',NULL,'hong',53,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(54,'제목','내용',NULL,'hong',54,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(55,'제목','내용',NULL,'hong',55,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(56,'제목','내용',NULL,'hong',56,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(57,'제목','내용',NULL,'hong',57,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(58,'제목','내용',NULL,'hong',58,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(59,'제목','내용',NULL,'hong',59,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(60,'제목','내용',NULL,'hong',60,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(61,'제목','내용',NULL,'hong',61,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(62,'제목','내용',NULL,'hong',62,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(63,'제목','내용',NULL,'hong',63,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(64,'제목','내용',NULL,'hong',64,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(65,'제목','내용',NULL,'hong',65,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(66,'제목','내용',NULL,'hong',66,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(67,'제목','내용',NULL,'hong',67,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(68,'제목','내용',NULL,'hong',68,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(69,'제목','내용',NULL,'hong',69,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(70,'제목','내용',NULL,'hong',70,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(71,'제목','내용',NULL,'hong',71,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(72,'제목','내용',NULL,'hong',72,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(73,'제목','내용',NULL,'hong',73,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(74,'제목','내용',NULL,'hong',74,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(75,'제목','내용',NULL,'hong',75,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(76,'제목','내용',NULL,'hong',76,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(78,'제목78','내용',NULL,'hong',78,0,0,'2020-07-11 14:10:19',5,1,'홍길동'),(79,'제목','내용',NULL,'hong',79,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(80,'제목','내용',NULL,'hong',80,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(81,'제목','내용',NULL,'hong',81,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(82,'제목','내용',NULL,'hong',82,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(83,'제목','내용',NULL,'hong',83,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(84,'제목','내용',NULL,'hong',84,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(85,'제목','내용',NULL,'hong',85,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(86,'제목','내용',NULL,'hong',86,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(87,'제목','내용',NULL,'hong',87,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(88,'제목','내용',NULL,'hong',88,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(89,'제목89','내용',NULL,'hong',89,0,0,'2020-07-11 14:10:19',12,1,'홍길동'),(90,'제목','내용',NULL,'hong',90,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(91,'제목','내용',NULL,'hong',91,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(92,'제목','내용',NULL,'hong',92,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(93,'제목','내용',NULL,'hong',93,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(94,'제목','내용',NULL,'hong',94,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(95,'제목','내용',NULL,'hong',95,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(96,'제목','내용',NULL,'hong',96,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(97,'제목','내용',NULL,'hong',97,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(98,'제목','내용',NULL,'hong',98,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(99,'제목','내용',NULL,'hong',99,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(100,'제목','내용',NULL,'hong',100,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(101,'제목','내용',NULL,'hong',101,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(102,'제목','내용',NULL,'hong',102,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(103,'제목','내용',NULL,'hong',103,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(104,'제목','내용',NULL,'hong',104,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(105,'제목','내용',NULL,'hong',105,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(106,'제목','내용',NULL,'hong',106,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(107,'제목','내용',NULL,'hong',107,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(108,'제목','내용',NULL,'hong',108,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(109,'제목','내용',NULL,'hong',109,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(110,'제목','내용',NULL,'hong',110,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(111,'제목','내용',NULL,'hong',111,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(113,'제목','내용',NULL,'hong',113,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(114,'제목','내용',NULL,'hong',114,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(115,'제목','내용',NULL,'hong',115,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(116,'제목','내용',NULL,'hong',116,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(117,'117','117',NULL,'hong',117,0,0,'2020-07-11 14:10:19',3,3,'홍길동'),(118,'제목','내용',NULL,'hong',118,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(119,'제목','내용',NULL,'hong',119,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(120,'120','120',NULL,'hong',120,0,0,'2020-07-11 14:10:19',5,2,'홍길동'),(121,'121','121',NULL,'hong',121,0,0,'2020-07-11 14:10:19',3,1,'홍길동'),(122,'제목','내용',NULL,'hong',122,0,0,'2020-07-11 14:10:19',0,1,'홍길동'),(123,'제목','내용',NULL,'hong',123,0,0,'2020-07-11 14:10:19',8,1,'홍길동'),(124,'제목','내용',NULL,'hong',124,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(125,'125','125',NULL,'hong',125,0,0,'2020-07-11 14:10:19',4,3,'홍길동'),(126,'126','126',NULL,'hong',126,0,0,'2020-07-11 14:10:19',4,1,'홍길동'),(127,'127','127',NULL,'hong',127,0,0,'2020-07-11 14:10:19',5,2,'홍길동'),(128,'제목','내용',NULL,'hong',128,0,0,'2020-07-11 14:10:19',1,1,'홍길동'),(136,'추천 제목','내용',NULL,'hong',136,0,0,'2020-07-11 14:10:19',5,3,'홍길동'),(137,'[답글] 추천 제목 - 136 답글1 ㅇㅇ','1',NULL,'hong',136,1,1,'2020-07-11 14:10:19',7,3,'홍길동'),(138,'[답글] [답글] 추천 제목 - 136 답글1 ㅇㅇ -답답글','1','cat2.JPG','hong',136,2,2,'2020-07-11 14:10:19',5,3,'홍길동'),(140,'0','0',NULL,'hong',140,0,0,'2020-07-11 14:10:19',11,1,'홍길동'),(143,'제목 입니다.','내용 입니다.','cat3.JPG','hong',143,0,0,'2020-07-14 00:59:50',58,3,'홍길동'),(145,'[답글] 3','3',NULL,'hong',143,1,1,'2020-07-14 00:59:58',10,3,'홍길동'),(146,'[답글] [답글] 33','3','bg02.jpg','hong',143,2,2,'2020-07-11 14:10:19',11,3,'홍길동'),(147,'관리자가 등록한 정보','내용입니다.\r\n내용입니다.\r\n내용입니다.',NULL,'hong',147,0,0,'2020-07-12 09:35:29',77,1,'홍길동');
/*!40000 ALTER TABLE `camping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campingcategory`
--

DROP TABLE IF EXISTS `campingcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `eventNo` int(11) DEFAULT NULL,
  `commentNo` int(11) NOT NULL,
  `commentContent` varchar(1024) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `commentRe_ref` int(11) DEFAULT NULL,
  `commentRe_lev` int(11) DEFAULT NULL,
  `commentRe_seq` int(11) DEFAULT NULL,
  `commentWriteDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`commentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (10,1,'와우!','seo','서민재',1,0,0,'2020-07-14 02:42:45'),(10,2,'와우2@','seo','서민재',1,1,1,'2020-07-14 02:42:53');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `event` VALUES (1,'이벤트1','이벤트1','event_1.jpg','2020-07-14 02:29:15',12),(2,'이벤트2','2','event_2.jpg','2020-07-14 01:58:28',2),(3,'이벤트3','3','event_3.jpg','2020-07-12 12:03:45',0),(4,'이벤트4','4','event_4.jpg','2020-07-12 12:03:45',0),(5,'이벤트5','5','event_5.jpg','2020-07-12 12:03:45',0),(6,'이벤트6','6','event_6.jpg','2020-07-12 12:03:45',1),(7,'이벤트7','http://www.ccamping.co.kr/shop/goods/goods_event.php?sno=23','event_7.jpg','2020-07-12 12:03:45',2),(8,'이벤트8','8','event_8.jpg','2020-07-12 12:03:45',0),(9,'이벤트9','9','event_1.jpg','2020-07-12 12:03:45',0),(10,'ㅇㅇㅇ','ㅇㅇㅇㅇ','event_1.jpg','2020-07-14 02:42:37',2),(11,'ㅇㅇㅁㄴㅇ','ㅇㅇㅇㅇ','event_2.jpg','2020-07-14 01:20:26',3),(12,'ㅎㅎ','ㅎㅎ','event_4.jpg','2020-07-14 00:40:33',2),(13,'ㅁㄴㅇㄹ','ㅇㄹㅇㄹㅇ','event_5.jpg','2020-07-14 01:59:37',2),(14,'ㄴㄴ','ㄴㄴㄴ','event_6.jpg','2020-07-14 02:01:08',2),(15,'ㄹㄹㅎㅎ','ㄹㄹㄹㅎㅎ','event_1.jpg','2020-07-14 01:42:17',5),(16,'제목 수정됨','내용 수정됨','event_1.jpg','2020-07-14 01:57:36',13);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'네이처하이크 클라우드 피크 2 20D (2인용) ','돔텐트 / 백패킹용 / 사용인원: 2인용 / 권장사용: 2인용 / 추가 구성품: 이너텐트, 그라운드시트, 루프 플라이 /\r\n[본체] 내수압: 4000mm / 재질: 나일론, 립스탑, 20D / 폴대재질: 두랄루민 /\r\n[플로어] 재질: 나일론, 립스탑, 20D /\r\n[무게&크기] 무게: 2.34kg / 크기(가로x세로x높이): 본체-274x210x150cm, 이너-210x130(120)x105cm / 수납크기(가로x세로x높이): 50x15x15cm / 색상: 그린, 블루,퍼플','1_5339912_1.jpg','2_5339912_2.jpg','3_5339912_3.jpg',210000,100,'2020-07-14 01:37:33',1,1),(2,'배진산업 캠프타운 테일게이트 차량 연결 텐트 (4인용) ','돔텐트 / 차박텐트 / 차량설치위치: 뒷면 / 사용인원: 1인용~2인용 / 권장사용: 4인용 /\r\n[본체] 내수압: 3000mm / 재질: 폴리에스테르, 타프타, 75D / 폴대재질: 스틸, 알루미늄 /\r\n[무게&크기] 무게: 13.2kg / 크기(가로x세로x높이): 250x250x210cm / 수납크기(가로x세로x높이): 110x25x25cm','1_5331793_3.jpg','2_5331793_2.jpg',NULL,326000,100,'2020-07-14 01:36:32',1,2),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트 (4인용) ','텐트 / 그늘막형 / 반자동설치 / 사용인원: 4인용~5인용 / 권장사용: 4인용 / 추가 구성품: 익스텐션 /\r\n[본체] 내수압: 2000mm / 재질: 폴리에스테르, 메쉬, 190T / 폴대재질: 스틸, 화이버글라스 /\r\n[플로어] 내수압: 2000mm / 재질: 폴리에스테르, 옥스포드, 210D /\r\n[무게&크기] 무게: 5kg / 크기(가로x세로x높이): 270x240x165cm / 수납크기(가로x세로x높이): 110x20x20cm / 색상: 틸블루, 라이트그레이, 올리브그린','1_11671112_1.jpg','2_11671112_2.jpg',NULL,77200,200,'2020-07-14 01:35:38',1,5),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ','초대형 사이즈! 고기능성 타프일체형 타프 하우스\r\n상세 스펙\r\n타프 / 일체형 스크린 / 렉타(사각) / 내수압: 3000mm / 재질: 폴리에스테르 / 옥스포드 / 150D / PU코팅 / UV코팅 / 발수 / 무게: 17.7kg / 폴개수: 메인폴 2개, 사이드폴 6개 / 크기(가로x세로x높이): 430x400x270(170)cm / 구성품: 타프스크린, 폴, 팩, 스트링, 수납케이스, 라이너시트','1_t6_1.jpg','2_t6_2.jpg',NULL,330000,98,'2020-07-14 01:34:38',2,4),(5,'힐맨 실 타프 블랙에디션 ','타프 / 스킨 / 렉타(사각) / 내수압: 4000mm / 재질: 나일론 / 립스탑 / 20D / PU코팅 / 무게: 845g / 크기(가로x세로): 300x350cm','1_t9_1.jpg',NULL,NULL,85600,97,'2020-07-14 01:33:47',2,3),(6,'아이두젠 패스트캠프 초대형 타프스크린 ','상세 스펙\r\n타프 / 일체형 스크린 / 내수압: 3000mm / 재질: 폴리에스테르 / 옥스포드 / 150D / PU코팅 / UV코팅 / 발수 / 폴개수: 메인폴 2개, 사이드폴 6개 / 크기(가로x세로x높이): 430x400x270cm / 구성품: 본체, 사이드월, 프론트월, 폴, 폴주머니, 팩, 팩주머니, 스트링, 수납가방','1_t2_1.jpg','2_t2_2.jpg',NULL,262700,98,'2020-07-14 01:33:03',2,5),(7,'살레와 오리털 침낭 1500g (해외구매) ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 오리털 / 재질: 나일론 / 내한온도: -32℃ / 방수 / 무게: 1.74kg / 320T / 크기(가로x세로): 80x230cm / 색상: 블루, 레드','1_b7.jpg',NULL,NULL,100000,100,'2020-07-14 01:31:50',3,4),(8,'신호상사 하프돔 하이드라 400D ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 오리털 / 크기 : 215*80*55cm / 무게 : 1.10kg','1_b3_1.jpg','2_b3_2.jpg',NULL,160000,100,'2020-07-14 01:31:17',3,4),(9,'BUCK703 이중 고밀도 거위털 침낭 ','봉제 완료 후 다시한번 리스탑원단으로 덧씌워 털빠짐 최소화, 보온력 강화!\r\n상세 스펙\r\n침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 거위털 / 재질: 폴리에스테르 / 내한온도: -10℃ / 방수 / 무게: 2.17kg / 크기(가로x세로): 80x210cm, 수납크기-25x40cm / 구성품: 침낭, 압축백','1_b10_1.jpg','2_b10_2.jpg',NULL,50000,100,'2020-07-14 01:30:30',3,2),(10,'반고 나이트스타 알파 300 쿼드 엑스칼리버 ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 홀로파이버 / 재질: 폴리에스테르 / 내한온도: -23℃ / 무게: 1.82kg / 크기(가로x세로): 80x215cm / 구성품: 침낭, 압축 케이스 / EN 13537 테스트 완료','1_b2_1.jpg','2_b2_2.jpg','3_b2_3.jpg',79000,100,'2020-07-14 01:29:50',3,2),(11,'트라우마 알파인 450D ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 거위털 / 재질: 나일론 / 내한온도: -10℃ / 발수 / 무게: 900g / 크기(가로x세로): 75(50)x205cm, 수납크기-15x25cm','1_b4_1.jpg','2_b4_2.jpg',NULL,180000,100,'2020-07-14 01:28:14',3,3),(12,'반고 나이트스타 알파 350 엑스칼리버 ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 홀로파이버 / 재질: 폴리에스테르 / 내한온도: -25℃ / 무게: 1.88kg / 크기(가로x세로): 50x210cm / 구성품: 침낭, 압축케이스 / EN 13537 테스트 완료','1_b1_2.jpg','2_b1_1.jpg','3_b1_3.jpg',75000,38,'2020-07-14 01:29:06',3,5),(13,' 샤오미 Nextool 고휘도 야외 손전등 ','캠핑용품 / 랜턴(램프) / 손전등 / LED / 2000루멘 / 밝기조절: 4단계 / 에너지원: 전기 / 충전식 / 점멸등 / 방수 / 잔여배터리표시 / 원터치점화 / 최대사용시간: 140시간 / 265g / 크기(가로x세로): 5.9x16.4cm','1_L6.jpg',NULL,NULL,27000,100,'2020-07-14 01:39:09',7,NULL),(14,'발뮤다 LED 랜턴 L02B ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 195루멘 / 에너지원: 전기 / 충전식 / 생활방수 / 최대사용시간: 50시간 / 630g / 크기(가로x세로x높이): 11x10.3x24.8cm','1_L3.jpg',NULL,NULL,178000,100,'2020-07-14 01:41:11',7,NULL),(15,'트리 감성 LED 클래식 캠핑등 ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 에너지원: 전기 / AA건전지x4 / 크기(지름x높이): 12.5x27cm','1_L2.jpg',NULL,NULL,15000,100,'2020-07-14 01:42:15',7,NULL),(16,'울트라코어 RJ-8000 헤드랜턴 ','캠핑용품 / 랜턴(램프) / 헤드형 / LED / 6000루멘 / 밝기조절: 3단계 / 에너지원: 전기 / 충전식 / 점멸등 / 줌조절 / 방수 / 최대사용시간: 15시간 / 70g / 크기(길이): 8.5cm','1_L9.jpg','2_L10.jpg',NULL,28600,100,'2020-07-14 01:43:04',7,NULL),(17,'발뮤다 LED 랜턴 L02A (해외구매) ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 195루멘 / 에너지원: 전기 / 충전식 / 생활방수 / 최대사용시간: 50시간 / 630g / 크기(가로x세로x높이): 11x10.3x24.8cm','1_L4.jpg',NULL,NULL,160000,100,'2020-07-14 01:46:01',7,NULL),(18,'네이처하이크 NH 버터플라이 캠핑체어 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 두랄루민 / 등받이 / 컴팩트접이식 / 무게: 2.9kg / 내하중: 120kg / 크기(세로x높이): 설치시-53x35x81cm, 수납시-25x98cm / 색상: 블랙, 카키','1_chair1_1.jpg','2_chair1_2.jpg','3_chair1_3.jpg',66800,100,'2020-07-14 01:47:40',9,NULL),(19,'카르닉 고급 모던 릴렉스 체어 특대형 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 알루미늄 / 팔걸이 / 등받이 / 포켓 / 컴팩트접이식 / 무게: 3.9kg / 크기(가로x세로x높이): 설치시-58x55x101cm, 수납시-13x120cm / 색상: 베이지, 블랙, 오렌지, 투톤그레이, 투톤블루, 투톤카키','1_chair3_1.jpg','2_chair3_2.jpg','3_chair3_3.jpg',34000,56,'2020-07-14 01:58:01',9,NULL),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ','캠핑가구 / 캠핑의자 / 경량의자 / 두랄루민 / 등받이 / 분해접이식 / 무게: 1.28kg / 내하중: 150kg / 크기(가로x세로x높이): 설치시-36x48x102cm, 수납시-13x50cm / 색상: 블랙, 그레이','1_chair2_1.jpg','2_chair2_2.jpg',NULL,40000,100,'2020-07-14 01:50:43',9,NULL),(21,'코코아이티 초경량 체어 기본형 ','작지만 강하다! 하중 145kg 경량 폴딩체어\r\n\r\n상세 스펙\r\n캠핑가구 / 캠핑의자 / 경량의자 / 두랄루민 / 등받이 / 분해접이식 / 무게: 860g / 내하중: 145kg / 크기(가로x높이): 설치시-55x65cm, 수납시-34x11cm','1_chair10_1.jpg','2_chair10_2.jpg',NULL,18400,100,'2020-07-14 01:57:45',9,NULL),(22,'카즈미 감성 릴렉스 체어 ','감성적인 패턴으로 고급스러움을 더하다! 설치와 이동이 간편한 릴렉스체어\r\n상세 스펙\r\n캠핑가구 / 캠핑의자 / 릴렉스의자 / 알루미늄 / 팔걸이 / 등받이 / 포켓 / 컴팩트접이식 / 무게: 3.6kg / 내하중: 80kg / 크기(가로x세로x높이): 설치시-44.5x54x102cm, 수납시-24x132cm','1_chair8_1.jpg','2_chair8_2.jpg',NULL,35600,100,'2020-07-14 01:53:56',9,NULL),(23,'K4CAMP 원터치 줄무늬 의자 ','캠핑가구 / 캠핑의자 / 미니의자 / 스틸 / 팔걸이 / 등받이 / 폴더접이식 / 무게: 1.87kg / 크기(가로x높이): 설치시-44x74cm, 수납시-67cm\r\n','1_chair6_1.jpg','2_chair6_2.jpg',NULL,8500,100,'2020-07-14 01:54:48',9,NULL),(24,'비에프엘 버팔로 프리미엄 캠핑 티탄 스마트 체어 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 두랄루민 / 팔걸이 / 등받이 / 목받침 / 포켓 / 각도조절 / 컴팩트접이식 / 무게: 4kg / 내하중: 100kg / 크기(가로x세로x높이): 설치시-50x70x96cm, 수납시-30x90cm','1_chair7_2.jpg',NULL,NULL,54000,100,'2020-07-14 01:55:42',9,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcart`
--

DROP TABLE IF EXISTS `productcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `productcart` VALUES (1,50000,1,2500,'탠트1','test.jpg','탠트','psm211','2020-06-26 16:27:31',50000),(2,50000,2,2500,'탠트2','test.jpg','탠트','psm211','2020-06-26 16:27:48',100000);
/*!40000 ALTER TABLE `productcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
  `orderDate` datetime DEFAULT NULL,
  `orderState` varchar(30) DEFAULT NULL,
  `productPayment` int(50) DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-02 16:42:35','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-02 16:42:35','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-02 16:42:35','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:43:10','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:43:10','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:43:10','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:46:08','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:46:08','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:46:08','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:46:57','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:46:57','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:46:57','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:49:23','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:49:23','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:49:23','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:52:07','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:52:07','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:52:07','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:53:05','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:53:05','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:53:05','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:53:25','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:53:25','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:53:25','결제대기',152500,NULL),(3,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:54:40','결제대기',152500,NULL),(2,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:54:40','결제대기',152500,NULL),(1,'탠트1',2500,50000,'111-111','부산시 수영구','민락동 빌라1호','lee','탠트',1,'이가흔','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-02 16:54:40','결제대기',152500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:08:04','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:09:18','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:09:44','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:15:13','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:15:29','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:15:42','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:15:52','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:15:53','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:16:24','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:16:35','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:16:48','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:16:50','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:16:56','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:17:09','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:17:26','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:18:08','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:18:46','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:19:05','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:19:07','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:19:16','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:19:27','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:19:48','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:19:50','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:21:26','결제대기',292500,NULL),(12,'텐트12',2500,50000,'12345','부산시 부산진구','7층','lee','텐트12',2,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 22:21:35','결제대기',292500,NULL),(5,'상품5',2500,14000,'12345','부산시 부산진구','7층','lee','2',3,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-11 23:56:28','결제대기',56000,NULL),(12,'상품12',2500,12000,'12345','부산시 부산진구','7층','lee','3',5,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-12 00:05:28','결제대기',302500,NULL),(12,'상품12',2500,12000,'12345','부산시 부산진구','7층','lee','3',9,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-12 00:07:35','결제대기',110500,NULL),(3,'상품3',2500,10000,'12345','부산시 부산진구','7층','lee','1',99,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-12 00:14:50','결제대기',992500,NULL),(3,'상품3',2500,10000,'12345','부산시 부산진구','7층','lee','1',5,'이가흔','010-1234-1234','배송전 연락 바랍니다','hong@naver.com','2020-07-12 09:45:06','결제대기',64500,NULL),(12,'상품12',2500,12000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 01:57:02','결제완료',14500,NULL),(4,'상품4',2500,12000,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 01:58:52','결제완료',79500,NULL),(4,'상품4',2500,12000,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 01:59:03','결제완료',79500,NULL),(19,'캠핑의자6',2500,40000,'1111-111','1','1','admin','9',2,'관리자','010-1234-1234','부재시 경비실에 맡겨주세요','admin@naver.com','2020-07-14 09:53:52','결제완료',322500,NULL),(12,'상품12',2500,12000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 10:01:10','결제완료',37500,NULL),(6,'상품6',2500,11500,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 10:15:06','결제완료',26000,NULL),(12,'상품12',2500,12000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','부재시 경비실에 맡겨주세요','lee@naver.com','2020-07-14 10:23:23','결제완료',26000,1),(6,'상품6',2500,11500,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','부재시 경비실에 맡겨주세요','lee@naver.com','2020-07-14 10:23:23','결제완료',26000,1);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productqna`
--

DROP TABLE IF EXISTS `productqna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productqna` (
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
-- Dumping data for table `productqna`
--

LOCK TABLES `productqna` WRITE;
/*!40000 ALTER TABLE `productqna` DISABLE KEYS */;
INSERT INTO `productqna` VALUES (1,5,'홍길동','hong','홍길동','2020-07-09 06:14:28','답변','2020-07-10 03:37:02'),(1,7,'test1','hong','홍길동','2020-07-09 07:22:43',NULL,NULL),(1,8,'test2','hong','홍길동','2020-07-09 07:23:45',NULL,NULL),(6,11,'문의','inwoo','천인우','2020-07-09 09:15:06',NULL,NULL),(1,12,'안냐야','jung','정의동','2020-07-10 00:30:23','왜 의동아','2020-07-10 03:46:18'),(2,13,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:30:59',NULL,NULL),(2,14,'11111','jung','정의동','2020-07-10 01:43:02',NULL,NULL),(2,16,'ㅂㅇㄹ','hong','정의동','2020-07-10 02:27:58',NULL,NULL),(2,17,'ㅁㄴㅇㄹ','hong','정의동','2020-07-10 02:39:58',NULL,NULL),(6,20,'test3','hong','정의동','2020-07-10 02:51:19',NULL,NULL),(6,21,'test4','hong','정의동','2020-07-10 02:51:20',NULL,NULL),(6,22,'test5','hong','정의동','2020-07-10 02:51:24',NULL,NULL),(6,23,'test6','hong','홍길동','2020-07-10 03:08:50','answer test','2020-07-10 03:45:40');
/*!40000 ALTER TABLE `productqna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productreview`
--

DROP TABLE IF EXISTS `productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productreview` (
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
-- Dumping data for table `productreview`
--

LOCK TABLES `productreview` WRITE;
/*!40000 ALTER TABLE `productreview` DISABLE KEYS */;
INSERT INTO `productreview` VALUES (1,14,'자차카파','hong','홍길동','2020-07-09 07:48:12',5),(1,16,'가나다라','hong','홍길동','2020-07-09 07:52:19',1),(1,17,'마바사아','hong','홍길동','2020-07-09 07:52:24',4),(1,18,'abcd','hong','홍길동','2020-07-09 07:52:32',3),(1,19,'최악이네요','hong','홍길동','2020-07-09 08:36:05',1),(1,20,'천안\n나','jung','정의동','2020-07-10 00:30:38',5),(3,21,'ㅇ','jung','정의동','2020-07-10 00:56:47',5),(2,22,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:35',5),(2,23,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:39',3),(2,24,'ㅁㅁㅁㅁ','jung','정의동','2020-07-10 01:29:42',5),(2,25,'4','jung','정의동','2020-07-10 01:29:46',5),(6,27,'test2','hong','정의동','2020-07-10 02:50:59',4),(6,28,'test3','hong','정의동','2020-07-10 02:51:02',3),(6,29,'test4','hong','정의동','2020-07-10 02:51:06',2),(6,30,'test5','hong','정의동','2020-07-10 02:51:09',1);
/*!40000 ALTER TABLE `productreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `qna` VALUES (12,5,'홍길동','hong','홍길동','2020-07-09 06:14:28','답변','2020-07-10 03:37:02'),(12,7,'test1','hong','홍길동','2020-07-09 07:22:43',NULL,NULL),(12,8,'test2','hong','홍길동','2020-07-09 07:23:45',NULL,NULL),(10,11,'문의','inwoo','천인우','2020-07-09 09:15:06',NULL,NULL),(12,12,'안냐야','jung','정의동','2020-07-10 00:30:23','왜 의동아','2020-07-10 03:46:18'),(11,13,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:30:59',NULL,NULL),(11,14,'11111','jung','정의동','2020-07-10 01:43:02',NULL,NULL),(11,16,'ㅂㅇㄹ','hong','정의동','2020-07-10 02:27:58',NULL,NULL),(11,17,'ㅁㄴㅇㄹ','hong','정의동','2020-07-10 02:39:58',NULL,NULL),(10,20,'test3','hong','정의동','2020-07-10 02:51:19',NULL,NULL),(10,21,'test4','hong','정의동','2020-07-10 02:51:20',NULL,NULL),(10,22,'test5','hong','정의동','2020-07-10 02:51:24',NULL,NULL),(10,23,'test6','hong','홍길동','2020-07-10 03:08:50','answer test','2020-07-10 03:45:40'),(3,24,'재입고 언제 되나요?','anna','천안나','2020-07-14 00:40:15',NULL,NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `review` VALUES (12,14,'자차카파','hong','홍길동','2020-07-09 07:48:12',5),(12,15,'타하','hong','홍길동','2020-07-09 07:48:22',2),(12,16,'가나다라','hong','홍길동','2020-07-09 07:52:19',1),(12,17,'마바사아','hong','홍길동','2020-07-09 07:52:24',4),(12,18,'abcd','hong','홍길동','2020-07-09 07:52:32',3),(12,19,'최악이네요','hong','홍길동','2020-07-09 08:36:05',1),(12,20,'천안\n나','jung','정의동','2020-07-10 00:30:38',5),(12,21,'ㅇ','jung','정의동','2020-07-10 00:56:47',5),(11,22,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:35',5),(11,23,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:39',3),(11,24,'ㅁㅁㅁㅁ','jung','정의동','2020-07-10 01:29:42',5),(11,25,'4','jung','정의동','2020-07-10 01:29:46',5),(10,27,'test2','hong','정의동','2020-07-10 02:50:59',4),(10,28,'test3','hong','정의동','2020-07-10 02:51:02',3),(10,29,'test4','hong','정의동','2020-07-10 02:51:06',2),(10,30,'test5','hong','정의동','2020-07-10 02:51:09',1),(3,31,'조아요','anna','천안나','2020-07-14 00:39:59',5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `wishlist` VALUES (1,'lee',11,'2020-07-13 16:39:22'),(2,'lee',10,'2020-07-13 16:39:26'),(3,'lee',12,'2020-07-13 16:39:32'),(4,'anna',6,'2020-07-14 00:39:24'),(5,'anna',12,'2020-07-14 00:55:14');
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

-- Dump completed on 2020-07-14 11:57:54
