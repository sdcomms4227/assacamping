-- MySQL dump 10.13  Distrib 5.6.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assa
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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productNo` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `productContent` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `productImageName1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `productImageName2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `productImageName3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productQuantity` int(11) DEFAULT NULL,
  `productDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productCategoryNo` int(11) DEFAULT NULL,
  `productRating` int(11) DEFAULT NULL,
  PRIMARY KEY (`productNo`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'텐트1','텐트입니다','1_6553316_1.jpg','2_6553316_2.jpg',NULL,320000,100,'2020-07-13 06:10:27',1,1),(2,'텐트2','텐트입니다','1_5331793_1.jpg','2_5331793_3.jpg','3_5331793_2.jpg',350000,100,'2020-07-13 06:10:08',1,2),(3,'텐트3','텐트입니다','1_4058924_1.jpg',NULL,NULL,250000,23,'2020-07-13 06:09:52',1,5),(4,'상품8','타프입니다','1_t4_1.jpg','2_t4_2.jpg',NULL,120000,100,'2020-07-13 06:07:03',2,4),(5,'타프7','타프입니다','1_t9_1.jpg','2_t9_2.jpg',NULL,90000,97,'2020-07-13 06:06:28',2,3),(6,'텐트6','텐트입니다','1_5331793_1.jpg','2_5331793_3.jpg','3_5331793_2.jpg',310000,100,'2020-07-13 06:07:38',1,5),(7,'상품7','내용','1_7162078_1.jpg',NULL,NULL,30000,100,'2020-07-13 05:53:38',1,4),(8,'텐트8','텐트입니다','1_5339912_1.jpg','2_5339912_2.jpg','3_5339912_3.jpg',350000,100,'2020-07-13 06:09:29',1,4),(9,'텐트9','텐트입니다','1_10562061_1.jpg',NULL,NULL,500000,100,'2020-07-13 06:09:09',1,2),(10,'텐트10','텐트입니다','1_11671112_2.jpg','2_11671112_1.jpg',NULL,200000,100,'2020-07-13 06:08:40',1,2),(11,'텐트11','텐트입니다','1_6553316_1.jpg','2_6553316_2.jpg',NULL,150000,100,'2020-07-13 06:08:22',1,3),(12,'텐트12','텐트입니다','1_tent.jpg','2_tent2.jpg','3_tent3.jpg',120000,41,'2020-07-13 06:08:01',1,5),(13,'탠트6','경량텐트\r\n플라이 : 625g\r\n텐트펙:134g\r\n로프:165g\r\n그라운드시트:226g\r\n안정적인 통풍기능 레인루프 텐트 상단에 6개의 고리를 이용해\r\n설치되는 레인 루프는 눈과 비를 효과적으로 막고,악천 후 속에서도 \r\n안정적인 통풍기능을 제공합니다','1_5339912_1.jpg','2_5339912_2.jpg','3_5339912_3.jpg',150000,60,'2020-07-13 05:52:22',1,NULL),(14,'의자1','캠핑의자','1_chair10_1.jpg','2_chair10_2.jpg',NULL,30000,50,'2020-07-13 05:55:48',9,NULL),(15,'캠핑의자2','캠핑의자','1_chair1_1.jpg','2_chair1_2.jpg','3_chair1_3.jpg',25000,60,'2020-07-13 05:56:26',9,NULL),(16,'캠핑의자3','캠핑의자3','1_chair3_1.jpg','2_chair3_2.jpg','3_chair3_3.jpg',45000,60,'2020-07-13 05:57:04',9,NULL),(17,'캠핑의자4','캠핑의자입니다','1_chair5_1.jpg','2_chair5_2.jpg',NULL,40000,60,'2020-07-13 05:57:33',9,NULL),(18,'캠핑의자5','캠핑의자입니다','1_chair6_1.jpg','2_chair6_2.jpg',NULL,25000,60,'2020-07-13 05:58:19',9,NULL),(19,'캠핑의자6','캠핑의자입니다','1_chair4_2.jpg','2_chair4_1.jpg',NULL,40000,60,'2020-07-13 05:58:47',9,NULL),(20,'캠핑의자7','캠핑의자입니다','1_chair9_2.jpg','2_chair9_1.jpg',NULL,36000,60,'2020-07-13 05:59:25',9,NULL),(21,'타프1','타프입니다','1_t10_2.jpg','2_t10_1.jpg',NULL,86000,60,'2020-07-13 06:02:45',2,NULL),(22,'타프2','타프입니다','1_t6_1.jpg','2_t6_2.jpg',NULL,200000,60,'2020-07-13 06:03:15',2,NULL),(23,'타프3','타프입니다','1_t2_1.jpg','2_t2_2.jpg',NULL,70000,60,'2020-07-13 06:03:50',2,NULL),(24,'타프4','타프입니다','1_t1.jpg',NULL,NULL,60000,60,'2020-07-13 06:04:12',2,NULL),(25,'타프5','타프입니다','1_t3_1.jpg','2_t3_2.jpg','3_t3_3.jpg',65000,60,'2020-07-13 06:04:45',2,NULL),(26,'타프6','타프입니다','1_t8_1.jpg','2_t8_2.jpg',NULL,85000,60,'2020-07-13 06:05:33',2,NULL),(27,'침낭1','침낭입니다','1_b1_1.jpg','2_b1_2.jpg','3_b1_3.jpg',110000,100,'2020-07-13 06:11:42',3,NULL),(28,'침낭2','침낭','1_b2_1.jpg','2_b2_2.jpg','3_b2_3.jpg',150000,100,'2020-07-13 06:12:13',3,NULL),(29,'침낭3','침낭입니다','1_b3_1.jpg','2_b3_2.jpg',NULL,100000,100,'2020-07-13 06:12:46',3,NULL),(30,'침낭4','침낭입니다','1_b4_1.jpg','2_b4_2.jpg',NULL,250000,100,'2020-07-13 06:13:17',3,NULL),(31,'침낭5','침낭입니다','1_b5_1.jpg','2_b5_2.jpg',NULL,160000,100,'2020-07-13 06:17:31',3,NULL),(32,'침낭6','침낭입니다','1_b6.jpg',NULL,NULL,120000,100,'2020-07-13 06:18:10',3,NULL),(33,'침낭7','침낭입니다','1_b8.jpg',NULL,NULL,180000,100,'2020-07-13 06:18:46',3,NULL),(34,'침낭9','침낭입니다','1_b10_1.jpg','2_b10_2.jpg',NULL,120000,50,'2020-07-13 06:19:22',3,NULL),(35,'램프1','램프입니다','1_L1.jpg',NULL,NULL,32000,100,'2020-07-13 06:20:35',7,NULL),(36,'램프2','램프입니다','1_L2.jpg',NULL,NULL,35000,60,'2020-07-13 06:21:03',7,NULL),(37,'램프3','램프입니다','1_L3.jpg',NULL,NULL,31000,50,'2020-07-13 06:34:25',7,NULL),(38,'램프4','램프입니다','1_L4.jpg',NULL,NULL,29000,60,'2020-07-13 06:34:54',7,NULL),(39,'램프5','램프입니다','1_L5.jpg',NULL,NULL,32000,50,'2020-07-13 06:36:17',7,NULL),(40,'램프6','램프입니다','1_L6.jpg',NULL,NULL,15000,60,'2020-07-13 06:36:51',7,NULL),(41,'램프7','램프입니다','1_L7.jpg',NULL,NULL,20000,50,'2020-07-13 06:37:18',7,NULL),(42,'램프8','램프입니다','1_L8.jpg',NULL,NULL,16000,50,'2020-07-13 06:41:36',7,NULL),(43,'램프9','램프입니다','1_L9.jpg',NULL,NULL,17500,60,'2020-07-13 06:45:41',7,NULL),(44,'램프10','램프입니다','1_L10.jpg',NULL,NULL,20000,60,'2020-07-13 06:46:06',7,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-13 15:52:43
