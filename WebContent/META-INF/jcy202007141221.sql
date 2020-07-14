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
INSERT INTO `event` VALUES (1,'하림캠핑간닭이벤트','하림캠핑간닭이벤트','하림캠핑간닭.JPG','2020-07-14 03:15:09',1),(2,'타임세일','타임세일','타임세일.jpg','2020-07-14 03:15:22',1),(3,'쿠킹캠핑','쿠킹캠핑 ','쿠킹캠핑.jpg','2020-07-14 03:15:45',1),(4,'캠핑이벤트','캠핑이벤트 ','캠핑이벤트.jpg','2020-07-14 03:15:59',1),(5,'캠핑의계절','캠핑의계절 ','캠핑의계절.jpg','2020-07-14 03:16:12',1),(6,'차박텐트','차박텐트 ','차박텐트.jpg','2020-07-14 03:16:25',1),(7,'장바구니이벤트','장바구니이벤트 ','장바구니.jpg','2020-07-14 03:16:42',1),(8,'욜로이벤트','욜로이벤트 ','욜로.jpg','2020-07-14 03:16:56',1),(9,'야심한밤 특가찬스','야심한밤 특가찬스','야심한밤특가찬스.jpg','2020-07-14 03:17:09',1),(10,'스피커할인 이벤트','스피커할인 이벤트','스피커할인.jpg','2020-07-14 03:17:30',1),(11,'쇼핑반값','쇼핑반값 ','쇼핑반값.jpg','2020-07-14 03:17:47',1),(12,'비정상특가','비정상특가 ','비정상특가.jpg','2020-07-14 03:18:01',1),(13,'봄이벤트 ','봄이벤트 ','봄이벤트.jpg','2020-07-14 03:18:15',1),(14,'보물찾기이벤트','보물찾기이벤트','보물찾기.jpg','2020-07-14 03:18:28',1),(15,'리퍼판매이벤트','리퍼판매이벤트','리퍼판매.jpg','2020-07-14 03:18:46',1),(16,'당일배송 이벤트','당일배송 이벤트','당일배송.jpg','2020-07-14 03:18:57',1),(17,'Summer SALE','Summer SALE','summerSale.jpg','2020-07-14 03:20:20',1);
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

-- Dump completed on 2020-07-14 12:21:33
