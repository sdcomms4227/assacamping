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
  PRIMARY KEY (`campingNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camping`
--

LOCK TABLES `camping` WRITE;
/*!40000 ALTER TABLE `camping` DISABLE KEYS */;
INSERT INTO `camping` VALUES (1,'제목','내용',NULL,'hong',1,0,0,'2020-06-25 06:41:29',0,1),(2,'제목','내용',NULL,'hong',2,0,0,'2020-06-25 06:41:29',0,1),(3,'제목','내용',NULL,'hong',3,0,0,'2020-06-25 06:41:29',0,1),(4,'제목','내용',NULL,'hong',4,0,0,'2020-06-25 06:41:29',0,1),(5,'제목','내용',NULL,'hong',5,0,0,'2020-06-25 06:41:29',0,1),(6,'제목','내용',NULL,'hong',6,0,0,'2020-06-25 06:41:29',0,1),(7,'제목','내용',NULL,'hong',7,0,0,'2020-06-25 06:41:29',0,1),(8,'제목','내용',NULL,'hong',8,0,0,'2020-06-25 06:41:30',0,1),(9,'제목','내용',NULL,'hong',9,0,0,'2020-06-25 06:41:30',0,1),(10,'제목','내용',NULL,'hong',10,0,0,'2020-06-25 06:41:30',0,1),(11,'제목','내용',NULL,'hong',11,0,0,'2020-06-25 06:41:30',0,1),(12,'제목','내용',NULL,'hong',12,0,0,'2020-06-25 06:41:30',0,1),(13,'제목','내용',NULL,'hong',13,0,0,'2020-06-25 06:41:30',0,1),(14,'제목','내용',NULL,'hong',14,0,0,'2020-06-25 06:41:30',0,1),(15,'제목','내용',NULL,'hong',15,0,0,'2020-06-25 06:41:30',0,1),(16,'제목','내용',NULL,'hong',16,0,0,'2020-06-25 06:41:30',0,1),(17,'제목','내용',NULL,'hong',17,0,0,'2020-06-25 06:41:30',0,1),(18,'제목','내용',NULL,'hong',18,0,0,'2020-06-25 06:41:30',0,1),(19,'제목','내용',NULL,'hong',19,0,0,'2020-06-25 06:41:30',0,1),(20,'제목','내용',NULL,'hong',20,0,0,'2020-06-25 06:41:30',0,1),(21,'제목','내용',NULL,'hong',20,1,1,'2020-06-25 06:41:30',0,1),(22,'제목','내용',NULL,'hong',20,2,1,'2020-06-25 06:41:30',0,1),(23,'제목','내용',NULL,'hong',20,1,2,'2020-06-25 06:41:30',0,1),(24,'제목','내용',NULL,'hong',20,2,2,'2020-06-25 06:41:30',0,1),(25,'제목','내용',NULL,'hong',20,3,1,'2020-06-25 06:41:30',0,1),(26,'제목','내용',NULL,'hong',20,3,2,'2020-06-25 06:41:30',0,1),(27,'제목','내용',NULL,'hong',20,1,3,'2020-06-25 06:41:30',0,1),(28,'제목','내용',NULL,'hong',20,1,4,'2020-06-25 06:41:30',0,1),(29,'제목','내용',NULL,'hong',20,1,5,'2020-06-25 06:41:30',0,1),(30,'제목','내용',NULL,'hong',30,0,0,'2020-06-27 05:45:40',1,1),(31,'제목','내용',NULL,'hong',31,0,0,'2020-06-25 06:41:30',0,1),(32,'제목','내용',NULL,'hong',32,0,0,'2020-06-25 06:41:30',0,1),(33,'제목','내용',NULL,'hong',33,0,0,'2020-06-25 06:41:30',0,1),(34,'제목','내용',NULL,'hong',34,0,0,'2020-06-25 06:41:30',0,1),(35,'제목','내용',NULL,'hong',35,0,0,'2020-06-25 06:41:30',0,1),(36,'제목','내용',NULL,'hong',36,0,0,'2020-06-25 06:41:30',0,1),(37,'제목','내용',NULL,'hong',37,0,0,'2020-06-25 06:41:30',0,1),(38,'제목','내용',NULL,'hong',38,0,0,'2020-06-25 06:41:30',0,1),(39,'제목','내용',NULL,'hong',39,0,0,'2020-06-25 06:41:30',0,1),(40,'제목','내용',NULL,'hong',40,0,0,'2020-06-25 06:41:30',0,1),(41,'제목','내용',NULL,'hong',41,0,0,'2020-06-25 06:41:30',0,1),(42,'제목','내용',NULL,'hong',42,0,0,'2020-06-25 06:41:30',0,1),(43,'제목','내용',NULL,'hong',43,0,0,'2020-06-25 06:41:30',0,1),(44,'제목','내용',NULL,'hong',44,0,0,'2020-06-25 06:41:30',0,1),(45,'제목','내용',NULL,'hong',45,0,0,'2020-06-25 06:41:31',0,1),(46,'제목','내용',NULL,'hong',46,0,0,'2020-06-25 06:41:31',0,1),(47,'제목','내용',NULL,'hong',47,0,0,'2020-06-25 06:41:31',0,1),(48,'제목','내용',NULL,'hong',48,0,0,'2020-06-25 06:41:31',0,1),(49,'제목','내용',NULL,'hong',49,0,0,'2020-06-25 06:41:31',0,1),(50,'제목','내용',NULL,'hong',50,0,0,'2020-06-25 06:41:31',0,1),(51,'제목','내용',NULL,'hong',51,0,0,'2020-06-25 06:41:31',0,1),(52,'제목','내용',NULL,'hong',52,0,0,'2020-06-25 06:41:31',0,1),(53,'제목','내용',NULL,'hong',53,0,0,'2020-06-25 06:41:31',0,1),(54,'제목','내용',NULL,'hong',54,0,0,'2020-06-25 06:41:31',0,1),(55,'제목','내용',NULL,'hong',55,0,0,'2020-06-25 06:41:31',0,1),(56,'제목','내용',NULL,'hong',56,0,0,'2020-06-25 06:41:31',0,1),(57,'제목','내용',NULL,'hong',57,0,0,'2020-06-25 06:41:31',0,1),(58,'제목','내용',NULL,'hong',58,0,0,'2020-06-25 06:41:31',0,1),(59,'제목','내용',NULL,'hong',59,0,0,'2020-06-25 06:41:31',0,1),(60,'제목','내용',NULL,'hong',60,0,0,'2020-06-25 06:41:31',0,1),(61,'제목','내용',NULL,'hong',61,0,0,'2020-06-25 06:41:31',0,1),(62,'제목','내용',NULL,'hong',62,0,0,'2020-06-25 06:41:31',0,1),(63,'제목','내용',NULL,'hong',63,0,0,'2020-06-25 06:41:31',0,1),(64,'제목','내용',NULL,'hong',64,0,0,'2020-06-25 06:41:31',0,1),(65,'제목','내용',NULL,'hong',65,0,0,'2020-06-25 06:41:31',0,1),(66,'제목','내용',NULL,'hong',66,0,0,'2020-06-25 06:41:31',0,1),(67,'제목','내용',NULL,'hong',67,0,0,'2020-06-25 06:41:31',0,1),(68,'제목','내용',NULL,'hong',68,0,0,'2020-06-25 06:41:31',0,1),(69,'제목','내용',NULL,'hong',69,0,0,'2020-06-25 06:41:31',0,1),(70,'제목','내용',NULL,'hong',70,0,0,'2020-06-25 06:41:31',0,1),(71,'제목','내용',NULL,'hong',71,0,0,'2020-06-25 06:41:31',0,1),(72,'제목','내용',NULL,'hong',72,0,0,'2020-06-25 06:41:31',0,1),(73,'제목','내용',NULL,'hong',73,0,0,'2020-06-25 06:41:31',0,1),(74,'제목','내용',NULL,'hong',74,0,0,'2020-06-25 06:41:31',0,1),(75,'제목','내용',NULL,'hong',75,0,0,'2020-06-25 06:41:31',0,1),(76,'제목','내용',NULL,'hong',76,0,0,'2020-06-25 06:41:31',0,1),(78,'제목78','내용',NULL,'hong',78,0,0,'2020-06-27 14:05:54',5,1),(79,'제목','내용',NULL,'hong',79,0,0,'2020-06-25 06:41:31',0,1),(80,'제목','내용',NULL,'hong',80,0,0,'2020-06-25 06:41:31',0,1),(81,'제목','내용',NULL,'hong',81,0,0,'2020-06-25 06:41:31',0,1),(82,'제목','내용',NULL,'hong',82,0,0,'2020-06-25 06:41:31',0,1),(83,'제목','내용',NULL,'hong',83,0,0,'2020-06-25 06:41:31',0,1),(84,'제목','내용',NULL,'hong',84,0,0,'2020-06-25 06:41:31',0,1),(85,'제목','내용',NULL,'hong',85,0,0,'2020-06-27 14:08:35',1,1),(86,'제목','내용',NULL,'hong',86,0,0,'2020-06-25 06:41:32',0,1),(87,'제목','내용',NULL,'hong',87,0,0,'2020-06-25 06:41:32',0,1),(88,'제목','내용',NULL,'hong',88,0,0,'2020-06-25 06:41:32',0,1),(89,'제목89','내용',NULL,'hong',89,0,0,'2020-06-27 06:24:42',12,1),(90,'제목','내용',NULL,'hong',90,0,0,'2020-06-25 06:41:32',0,1),(91,'제목','내용',NULL,'hong',91,0,0,'2020-06-25 06:41:32',0,1),(92,'제목','내용',NULL,'hong',92,0,0,'2020-06-25 06:41:32',0,1),(93,'제목','내용',NULL,'hong',93,0,0,'2020-06-25 06:41:32',0,1),(94,'제목','내용',NULL,'hong',94,0,0,'2020-06-25 06:41:32',0,1),(95,'제목','내용',NULL,'hong',95,0,0,'2020-06-25 06:41:32',0,1),(96,'제목','내용',NULL,'hong',96,0,0,'2020-06-25 06:41:32',0,1),(97,'제목','내용',NULL,'hong',97,0,0,'2020-06-25 06:41:32',0,1),(98,'제목','내용',NULL,'hong',98,0,0,'2020-06-27 14:04:01',1,1),(99,'제목','내용',NULL,'hong',99,0,0,'2020-06-25 06:41:32',0,1),(100,'제목','내용',NULL,'hong',100,0,0,'2020-06-25 06:41:32',0,1),(101,'제목','내용',NULL,'hong',101,0,0,'2020-06-25 06:41:32',0,1),(102,'제목','내용',NULL,'hong',102,0,0,'2020-06-25 06:41:32',0,1),(103,'제목','내용',NULL,'hong',103,0,0,'2020-06-25 06:41:32',0,1),(104,'제목','내용',NULL,'hong',104,0,0,'2020-06-25 06:41:32',0,1),(105,'제목','내용',NULL,'hong',105,0,0,'2020-06-25 06:41:32',0,1),(106,'제목','내용',NULL,'hong',106,0,0,'2020-06-25 06:41:32',0,1),(107,'제목','내용',NULL,'hong',107,0,0,'2020-06-25 06:41:32',0,1),(108,'제목','내용',NULL,'hong',108,0,0,'2020-06-25 06:41:32',0,1),(109,'제목','내용',NULL,'hong',109,0,0,'2020-06-27 04:11:49',1,1),(110,'제목','내용',NULL,'hong',110,0,0,'2020-06-25 06:41:32',0,1),(111,'제목','내용',NULL,'hong',111,0,0,'2020-06-25 06:41:32',0,1),(113,'제목','내용',NULL,'hong',113,0,0,'2020-06-25 06:41:32',0,1),(114,'제목','내용',NULL,'hong',114,0,0,'2020-06-25 06:41:32',0,1),(115,'제목','내용',NULL,'hong',115,0,0,'2020-06-25 06:41:32',0,1),(116,'제목','내용',NULL,'hong',116,0,0,'2020-06-25 06:41:32',0,1),(117,'117','117',NULL,'hong',117,0,0,'2020-06-25 08:25:46',3,3),(118,'제목','내용',NULL,'hong',118,0,0,'2020-06-29 03:45:39',1,1),(119,'제목','내용',NULL,'hong',119,0,0,'2020-06-25 06:41:32',0,1),(120,'120','120',NULL,'hong',120,0,0,'2020-07-05 08:18:06',5,2),(121,'121','121',NULL,'hong',121,0,0,'2020-06-25 08:21:10',3,1),(122,'제목','내용',NULL,'hong',122,0,0,'2020-06-25 06:41:33',0,1),(123,'제목','내용',NULL,'hong',123,0,0,'2020-06-25 08:20:30',8,1),(124,'제목','내용',NULL,'hong',124,0,0,'2020-06-25 08:18:36',1,1),(125,'125','125',NULL,'hong',125,0,0,'2020-06-25 08:18:33',4,3),(126,'126','126',NULL,'hong',126,0,0,'2020-06-25 08:18:07',4,1),(127,'127','127',NULL,'hong',127,0,0,'2020-06-27 14:05:36',5,2),(128,'제목','내용',NULL,'hong',128,0,0,'2020-06-25 06:43:48',1,1),(136,'추천 제목','내용',NULL,'hong',136,0,0,'2020-07-05 14:27:44',5,3),(137,'[답글] 추천 제목 - 136 답글1 ㅇㅇ','1',NULL,'hong',136,1,1,'2020-06-27 06:31:35',7,3),(138,'[답글] [답글] 추천 제목 - 136 답글1 ㅇㅇ -답답글','1','cat2.JPG','hong',136,2,2,'2020-06-28 15:51:19',5,3),(140,'0','0',NULL,'hong',140,0,0,'2020-06-29 03:45:47',11,1),(143,'제목 입니다.','내용 입니다.','cat3.JPG','hong',143,0,0,'2020-07-05 14:11:25',54,3),(145,'[답글] 3','3',NULL,'hong',143,1,1,'2020-07-05 09:01:51',9,3),(146,'[답글] [답글] 33','3','bg02.jpg','hong',143,2,2,'2020-06-30 08:59:50',11,3),(147,'관리자가 등록한 정보','내용입니다.\r\n내용입니다.\r\n내용입니다.',NULL,'hong',147,0,0,'2020-07-05 15:35:32',73,1);
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
INSERT INTO `productcart` VALUES (1,50000,1,2500,'탠트1','test.jpg','탠트','psm211','2020-06-26 16:27:31',50000),(2,50000,2,2500,'탠트2','test.jpg','탠트','psm211','2020-06-26 16:27:48',100000);
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
  `userDate` date DEFAULT NULL,
  `userUse` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','1','1','1@1','1','1','1','2020-06-24',1),('2','2','2','2','2@2','2','2','2','2020-06-24',1),('3','3','3','3','3@3','3','3','3','2020-06-24',1),('4','4','4','4','4@4','4','4','4','2020-06-24',1),('5','5','5','5','5@5','5','5','5','2020-06-24',1),('6','6','6','6','6@6','6','6','6','2020-06-24',1),('admin','1234','관리자','010-1234-1234','admin@naver.com','1','1','1','2020-07-05',1),('hong','1234','홍길동','11','11','11','11','11','2020-07-02',1),('lee','1234','이순신','2','2','2','2','2','2020-07-02',1);
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

-- Dump completed on 2020-07-06  1:23:58
