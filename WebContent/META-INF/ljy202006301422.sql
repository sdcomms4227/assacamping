CREATE DATABASE  IF NOT EXISTS `assa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `assa`;
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
-- Table structure for table `productlist`
--

DROP TABLE IF EXISTS `productlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlist` (
  `productNo` int(20) NOT NULL,
  `productPrice` int(20) DEFAULT NULL,
  `cartQuantity` int(20) DEFAULT NULL,
  `productRestQuantity` int(20) DEFAULT NULL,
  `productDelivery` int(20) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productInformation` varchar(200) DEFAULT NULL,
  `productImage` varchar(200) DEFAULT NULL,
  `productCategory` varchar(100) DEFAULT NULL,
  `productDate` datetime DEFAULT NULL,
  PRIMARY KEY (`productNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlist`
--

LOCK TABLES `productlist` WRITE;
/*!40000 ALTER TABLE `productlist` DISABLE KEYS */;
INSERT INTO `productlist` VALUES (1,5000,1,4,2500,'텐트','ㅇㅇ','test.jpg','d','2020-06-29 16:20:32'),(2,5000,2,4,2500,'텐트2','ㅇㅇ','test.jpg','c','2020-06-29 16:20:59');
/*!40000 ALTER TABLE `productlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-29 17:06:07
