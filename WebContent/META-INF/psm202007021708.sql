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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-02 17:08:28
