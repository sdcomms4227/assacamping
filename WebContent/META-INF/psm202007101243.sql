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
  `orderDate` datetime DEFAULT NULL,
  `orderState` varchar(30) DEFAULT NULL,
  `productPayment` int(50) DEFAULT NULL,
  `orderNo` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 15:30:19','결제완료',38500,1),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-08 16:56:37','결제완료',638500,2),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-08 16:56:37','결제완료',638500,2),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:39:23','결제완료',638500,3),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:39:23','결제완료',638500,3),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:42:17','결제취소',638500,4),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:42:17','결제취소',638500,4),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:45:27','결제완료',638500,5),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:45:27','결제완료',638500,5),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:47:39','결제완료',638500,6),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:47:39','결제완료',638500,6),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:49:30','결제완료',638500,7),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:49:30','결제완료',638500,7),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:57:00','결제완료',638500,8),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 17:57:00','결제완료',638500,8),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 18:06:28','결제완료',638500,9),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','배송전 연락 바랍니다','tttt@naver.com','2020-07-08 18:06:28','결제완료',638500,9),(6,'아이두젠 캠핑 침낭 스퀘어E',2500,600000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',4,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-08 18:12:27','결제완료',2420500,10),(7,'침낭',2500,9000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',2,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-08 18:12:27','결제완료',2420500,10),(9,'침낭',2500,19000,'111-111','부산시 수영구','민락동 빌라1호','psm211','3',4,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-08 19:20:40','결제완료',328500,11),(8,'탠트',2500,250000,'111-111','부산시 수영구','민락동 빌라1호','psm211','1',1,'박수민','0101234567','부재시 경비실에 맡겨주세요','tttt@naver.com','2020-07-08 19:20:40','결제완료',328500,11);
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

-- Dump completed on 2020-07-10 12:42:48
