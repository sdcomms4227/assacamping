-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: assa
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `commentWriteDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`commentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'comment1','hong','홍길동',1,0,0,'2020-07-06 14:21:21'),(1,1,2,'comment2','hong','홍길동',2,0,0,'2020-07-06 14:21:30'),(1,1,3,'comment3','hong','홍길동',3,0,0,'2020-07-06 14:21:32'),(1,1,4,'comment4','hong','홍길동',4,0,0,'2020-07-06 14:21:35'),(1,1,5,'reply1-1','hong','홍길동',1,1,9,'2020-07-06 15:31:17'),(1,1,6,'reply1-2','hong','홍길동',1,1,5,'2020-07-06 15:31:17'),(1,1,8,'reply2-1','hong','홍길동',2,1,3,'2020-07-06 14:24:59'),(1,1,9,'reply2-2','hong','홍길동',2,1,2,'2020-07-06 14:24:59'),(1,1,10,'replt1-3','hong','홍길동',1,1,3,'2020-07-06 15:31:17'),(1,1,11,'reply1-4','hong','홍길동',1,1,2,'2020-07-06 15:31:17'),(1,1,12,'reply3-1','hong','홍길동',3,1,6,'2020-07-07 02:14:37'),(1,1,13,'reply3-2','hong','홍길동',3,1,5,'2020-07-07 02:14:37'),(1,1,14,'reply3-3','hong','홍길동',3,1,4,'2020-07-07 02:14:37'),(1,1,16,'reply4-2','hong','홍길동',4,1,4,'2020-07-07 02:25:04'),(1,1,17,'reply3-4','hong','홍길동',3,1,2,'2020-07-07 02:14:37'),(1,1,18,'reply4-3','hong','홍길동',4,1,2,'2020-07-07 02:25:04'),(1,1,19,'comment5','hong','홍길동',5,0,0,'2020-07-07 02:47:24'),(1,1,20,'reply5-1','hong','홍길동',5,1,3,'2020-07-07 02:56:04'),(1,1,21,'reply5-2','hong','홍길동',5,1,2,'2020-07-07 02:56:04'),(1,1,22,'reply5-3','hong','홍길동',5,1,1,'2020-07-07 02:56:04'),(1,1,23,'comment6','hong','홍길동',6,0,0,'2020-07-07 02:57:10'),(1,1,24,'reply6-1','hong','홍길동',6,1,5,'2020-07-07 06:57:48'),(1,1,25,'reply6-2','hong','홍길동',6,1,4,'2020-07-07 06:57:48'),(1,1,26,'reply6-3','hong','홍길동',6,1,3,'2020-07-07 06:57:48'),(1,1,27,'reply6-4','hong','홍길동',6,1,2,'2020-07-07 06:57:48'),(1,1,28,'sadf','hong','홍길동',6,1,1,'2020-07-07 06:57:48'),(1,1,29,'cmt7','hong','홍길동',7,0,0,'2020-07-07 06:58:32'),(1,1,30,'reply7-1','hong','홍길동',7,1,3,'2020-07-07 08:02:54'),(1,1,31,'reply7-2','hong','홍길동',7,1,2,'2020-07-07 08:03:01'),(1,1,32,'reply7-3','hong','홍길동',7,1,1,'2020-07-07 08:04:22'),(1,1,33,'reply1-1-1','hong','홍길동',1,2,10,'2020-07-07 08:11:10'),(1,1,34,'reply1-2-1','hong','홍길동',1,2,6,'2020-07-07 08:11:20');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-07 17:43:23
