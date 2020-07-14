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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'네이처하이크 클라우드 피크 2 20D','돔텐트 / 백패킹용 / 사용인원: 2인용 / 권장사용: 2인용 / 추가 구성품: 이너텐트, 그라운드시트, 루프 플라이 /\r\n[본체] 내수압: 4000mm / 재질: 나일론, 립스탑, 20D / 폴대재질: 두랄루민 /\r\n[플로어] 재질: 나일론, 립스탑, 20D /\r\n[무게&크기] 무게: 2.34kg / 크기(가로x세로x높이): 본체-274x210x150cm, 이너-210x130(120)x105cm / 수납크기(가로x세로x높이): 50x15x15cm / 색상: 그린, 블루,퍼플','1_5339912_1.jpg','2_5339912_2.jpg','3_5339912_3.jpg',210000,100,'2020-07-14 12:19:56',1,1),(2,'배진산업 캠프타운 테일게이트 차량 연결 텐트','돔텐트 / 차박텐트 / 차량설치위치: 뒷면 / 사용인원: 1인용~2인용 / 권장사용: 4인용 /\r\n[본체] 내수압: 3000mm / 재질: 폴리에스테르, 타프타, 75D / 폴대재질: 스틸, 알루미늄 /\r\n[무게&크기] 무게: 13.2kg / 크기(가로x세로x높이): 250x250x210cm / 수납크기(가로x세로x높이): 110x25x25cm','1_5331793_3.jpg','2_5331793_2.jpg',NULL,326000,100,'2020-07-14 12:20:06',1,2),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트','텐트 / 그늘막형 / 반자동설치 / 사용인원: 4인용~5인용 / 권장사용: 4인용 / 추가 구성품: 익스텐션 /\r\n[본체] 내수압: 2000mm / 재질: 폴리에스테르, 메쉬, 190T / 폴대재질: 스틸, 화이버글라스 /\r\n[플로어] 내수압: 2000mm / 재질: 폴리에스테르, 옥스포드, 210D /\r\n[무게&크기] 무게: 5kg / 크기(가로x세로x높이): 270x240x165cm / 수납크기(가로x세로x높이): 110x20x20cm / 색상: 틸블루, 라이트그레이, 올리브그린','1_11671112_1.jpg','2_11671112_2.jpg',NULL,77200,197,'2020-07-14 13:18:11',1,5),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ','초대형 사이즈! 고기능성 타프일체형 타프 하우스\r\n상세 스펙\r\n타프 / 일체형 스크린 / 렉타(사각) / 내수압: 3000mm / 재질: 폴리에스테르 / 옥스포드 / 150D / PU코팅 / UV코팅 / 발수 / 무게: 17.7kg / 폴개수: 메인폴 2개, 사이드폴 6개 / 크기(가로x세로x높이): 430x400x270(170)cm / 구성품: 타프스크린, 폴, 팩, 스트링, 수납케이스, 라이너시트','1_t6_1.jpg','2_t6_2.jpg',NULL,330000,95,'2020-07-14 16:44:38',2,4),(5,'힐맨 실 타프 블랙에디션 ','타프 / 스킨 / 렉타(사각) / 내수압: 4000mm / 재질: 나일론 / 립스탑 / 20D / PU코팅 / 무게: 845g / 크기(가로x세로): 300x350cm','1_t9_1.jpg',NULL,NULL,85600,97,'2020-07-14 01:33:47',2,3),(6,'아이두젠 패스트캠프 초대형 타프스크린 ','상세 스펙\r\n타프 / 일체형 스크린 / 내수압: 3000mm / 재질: 폴리에스테르 / 옥스포드 / 150D / PU코팅 / UV코팅 / 발수 / 폴개수: 메인폴 2개, 사이드폴 6개 / 크기(가로x세로x높이): 430x400x270cm / 구성품: 본체, 사이드월, 프론트월, 폴, 폴주머니, 팩, 팩주머니, 스트링, 수납가방','1_t2_1.jpg','2_t2_2.jpg',NULL,262700,94,'2020-07-14 16:44:38',2,5),(7,'살레와 오리털 침낭 1500g (해외구매) ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 오리털 / 재질: 나일론 / 내한온도: -32℃ / 방수 / 무게: 1.74kg / 320T / 크기(가로x세로): 80x230cm / 색상: 블루, 레드','1_b7.jpg',NULL,NULL,100000,98,'2020-07-14 16:44:38',3,4),(8,'신호상사 하프돔 하이드라 400D ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 오리털 / 크기 : 215*80*55cm / 무게 : 1.10kg','1_b3_1.jpg','2_b3_2.jpg',NULL,160000,98,'2020-07-14 16:44:38',3,4),(9,'BUCK703 이중 고밀도 거위털 침낭 ','봉제 완료 후 다시한번 리스탑원단으로 덧씌워 털빠짐 최소화, 보온력 강화!\r\n상세 스펙\r\n침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 거위털 / 재질: 폴리에스테르 / 내한온도: -10℃ / 방수 / 무게: 2.17kg / 크기(가로x세로): 80x210cm, 수납크기-25x40cm / 구성품: 침낭, 압축백','1_b10_1.jpg','2_b10_2.jpg',NULL,50000,95,'2020-07-14 16:44:38',3,2),(10,'반고 나이트스타 알파 300 쿼드 엑스칼리버 ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 홀로파이버 / 재질: 폴리에스테르 / 내한온도: -23℃ / 무게: 1.82kg / 크기(가로x세로): 80x215cm / 구성품: 침낭, 압축 케이스 / EN 13537 테스트 완료','1_b2_1.jpg','2_b2_2.jpg','3_b2_3.jpg',79000,100,'2020-07-14 01:29:50',3,2),(11,'트라우마 알파인 450D ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 거위털 / 재질: 나일론 / 내한온도: -10℃ / 발수 / 무게: 900g / 크기(가로x세로): 75(50)x205cm, 수납크기-15x25cm','1_b4_1.jpg','2_b4_2.jpg',NULL,180000,99,'2020-07-14 16:44:38',3,3),(12,'반고 나이트스타 알파 350 엑스칼리버 ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 홀로파이버 / 재질: 폴리에스테르 / 내한온도: -25℃ / 무게: 1.88kg / 크기(가로x세로): 50x210cm / 구성품: 침낭, 압축케이스 / EN 13537 테스트 완료','1_b1_2.jpg','2_b1_1.jpg','3_b1_3.jpg',75000,32,'2020-07-14 16:44:38',3,5),(13,' 샤오미 Nextool 고휘도 야외 손전등 ','캠핑용품 / 랜턴(램프) / 손전등 / LED / 2000루멘 / 밝기조절: 4단계 / 에너지원: 전기 / 충전식 / 점멸등 / 방수 / 잔여배터리표시 / 원터치점화 / 최대사용시간: 140시간 / 265g / 크기(가로x세로): 5.9x16.4cm','1_L6.jpg',NULL,NULL,27000,99,'2020-07-14 12:26:17',7,3),(14,'발뮤다 LED 랜턴 L02B ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 195루멘 / 에너지원: 전기 / 충전식 / 생활방수 / 최대사용시간: 50시간 / 630g / 크기(가로x세로x높이): 11x10.3x24.8cm','1_L3.jpg',NULL,NULL,178000,100,'2020-07-14 08:30:51',7,3),(15,'트리 감성 LED 클래식 캠핑등 ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 에너지원: 전기 / AA건전지x4 / 크기(지름x높이): 12.5x27cm','1_L2.jpg',NULL,NULL,15000,100,'2020-07-14 08:30:51',7,3),(16,'울트라코어 RJ-8000 헤드랜턴 ','캠핑용품 / 랜턴(램프) / 헤드형 / LED / 6000루멘 / 밝기조절: 3단계 / 에너지원: 전기 / 충전식 / 점멸등 / 줌조절 / 방수 / 최대사용시간: 15시간 / 70g / 크기(길이): 8.5cm','1_L9.jpg','2_L10.jpg',NULL,28600,100,'2020-07-14 08:30:51',7,3),(17,'발뮤다 LED 랜턴 L02A (해외구매) ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 195루멘 / 에너지원: 전기 / 충전식 / 생활방수 / 최대사용시간: 50시간 / 630g / 크기(가로x세로x높이): 11x10.3x24.8cm','1_L4.jpg',NULL,NULL,160000,99,'2020-07-14 12:26:17',7,3),(18,'네이처하이크 NH 버터플라이 캠핑체어 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 두랄루민 / 등받이 / 컴팩트접이식 / 무게: 2.9kg / 내하중: 120kg / 크기(세로x높이): 설치시-53x35x81cm, 수납시-25x98cm / 색상: 블랙, 카키','1_chair1_1.jpg','2_chair1_2.jpg','3_chair1_3.jpg',66800,100,'2020-07-14 08:30:51',9,3),(19,'카르닉 고급 모던 릴렉스 체어 특대형 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 알루미늄 / 팔걸이 / 등받이 / 포켓 / 컴팩트접이식 / 무게: 3.9kg / 크기(가로x세로x높이): 설치시-58x55x101cm, 수납시-13x120cm / 색상: 베이지, 블랙, 오렌지, 투톤그레이, 투톤블루, 투톤카키','1_chair3_1.jpg','2_chair3_2.jpg','3_chair3_3.jpg',34000,56,'2020-07-14 08:30:51',9,3),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ','캠핑가구 / 캠핑의자 / 경량의자 / 두랄루민 / 등받이 / 분해접이식 / 무게: 1.28kg / 내하중: 150kg / 크기(가로x세로x높이): 설치시-36x48x102cm, 수납시-13x50cm / 색상: 블랙, 그레이','1_chair2_1.jpg','2_chair2_2.jpg',NULL,40000,100,'2020-07-14 08:30:51',9,3),(21,'코코아이티 초경량 체어 기본형 ','작지만 강하다! 하중 145kg 경량 폴딩체어\r\n\r\n상세 스펙\r\n캠핑가구 / 캠핑의자 / 경량의자 / 두랄루민 / 등받이 / 분해접이식 / 무게: 860g / 내하중: 145kg / 크기(가로x높이): 설치시-55x65cm, 수납시-34x11cm','1_chair10_1.jpg','2_chair10_2.jpg',NULL,18400,100,'2020-07-14 08:30:51',9,3),(22,'카즈미 감성 릴렉스 체어 ','감성적인 패턴으로 고급스러움을 더하다! 설치와 이동이 간편한 릴렉스체어\r\n상세 스펙\r\n캠핑가구 / 캠핑의자 / 릴렉스의자 / 알루미늄 / 팔걸이 / 등받이 / 포켓 / 컴팩트접이식 / 무게: 3.6kg / 내하중: 80kg / 크기(가로x세로x높이): 설치시-44.5x54x102cm, 수납시-24x132cm','1_chair8_1.jpg','2_chair8_2.jpg',NULL,35600,98,'2020-07-14 12:26:17',9,3),(23,'K4CAMP 원터치 줄무늬 의자 ','캠핑가구 / 캠핑의자 / 미니의자 / 스틸 / 팔걸이 / 등받이 / 폴더접이식 / 무게: 1.87kg / 크기(가로x높이): 설치시-44x74cm, 수납시-67cm\r\n','1_chair6_1.jpg','2_chair6_2.jpg',NULL,8500,97,'2020-07-14 11:57:02',9,3),(24,'비에프엘 버팔로 프리미엄 캠핑 티탄 스마트 체어 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 두랄루민 / 팔걸이 / 등받이 / 목받침 / 포켓 / 각도조절 / 컴팩트접이식 / 무게: 4kg / 내하중: 100kg / 크기(가로x세로x높이): 설치시-50x70x96cm, 수납시-30x90cm','1_chair7_2.jpg',NULL,NULL,54000,97,'2020-07-14 11:57:02',9,3);
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
INSERT INTO `productorder` VALUES (12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'4524','서울 중구 세종대로 110','서울특별시청','admin','3',1,'관리자','010-1234-1234','배송전 연락 바랍니다','admin@naver.com','2020-07-14 18:26:45','결제대기',77500,1),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'5089','서울 광진구 강변북로','6','lee','1',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:45:46','결제대기',417400,2),(6,'아이두젠 패스트캠프 초대형 타프스크린',2500,262700,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:45:46','결제대기',417400,2),(12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:45:46','결제대기',417400,2),(8,'신호상사 하프돔 하이드라 400D ',2500,160000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:51:48','결제대기',162500,3),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ',2500,330000,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:51:58','결제대기',332500,4),(23,'K4CAMP 원터치 줄무늬 의자 ',2500,8500,'5089','서울 광진구 강변북로','6','lee','9',3,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:57:02','결제대기',190000,5),(24,'비에프엘 버팔로 프리미엄 캠핑 티탄 스마트 체어 ',2500,54000,'5089','서울 광진구 강변북로','6','lee','9',3,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:57:02','결제대기',190000,5),(9,'BUCK703 이중 고밀도 거위털 침낭 ',2500,50000,'3900','서울 마포구 가양대로','1','cheon','3',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:24:23','결제대기',52500,6),(13,' 샤오미 Nextool 고휘도 야외 손전등 ',2500,27000,'3900','서울 마포구 가양대로','1','cheon','7',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','결제대기',523400,7),(17,'발뮤다 LED 랜턴 L02A (해외구매) ',2500,160000,'3900','서울 마포구 가양대로','1','cheon','7',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','결제대기',523400,7),(22,'카즈미 감성 릴렉스 체어 ',2500,35600,'3900','서울 마포구 가양대로','1','cheon','9',2,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','결제대기',523400,7),(6,'아이두젠 패스트캠프 초대형 타프스크린 ',2500,262700,'3900','서울 마포구 가양대로','1','cheon','2',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','결제대기',523400,7),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'5089','서울 광진구 강변북로','6','lee','1',2,'이가흔','010-1234-1234','부재시 경비실에 맡겨주세요','lee@naver.com','2020-07-14 22:18:11','결제취소',156900,8),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ',2500,330000,'12990','경기 하남시 감북로','8','jung','2',2,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9),(6,'아이두젠 패스트캠프 초대형 타프스크린 ',2500,262700,'12990','경기 하남시 감북로','8','jung','2',2,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9),(9,'BUCK703 이중 고밀도 거위털 침낭 ',2500,50000,'12990','경기 하남시 감북로','8','jung','3',4,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9),(11,'트라우마 알파인 450D ',2500,180000,'12990','경기 하남시 감북로','8','jung','3',1,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9),(7,'살레와 오리털 침낭 1500g (해외구매) ',2500,100000,'12990','경기 하남시 감북로','8','jung','3',2,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9),(8,'신호상사 하프돔 하이드라 400D ',2500,160000,'12990','경기 하남시 감북로','8','jung','3',1,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9),(12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'12990','경기 하남시 감북로','8','jung','3',4,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','결제대기',2227900,9);
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
INSERT INTO `qna` VALUES (12,5,'홍길동','hong','홍길동','2020-07-09 06:14:28','답변','2020-07-10 03:37:02'),(12,7,'test1','hong','홍길동','2020-07-09 07:22:43',NULL,NULL),(12,8,'test2','hong','홍길동','2020-07-09 07:23:45',NULL,NULL),(10,11,'문의','inwoo','천인우','2020-07-09 09:15:06',NULL,NULL),(12,12,'안냐야','jung','정의동','2020-07-10 00:30:23','왜 의동아','2020-07-10 03:46:18'),(11,13,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:30:59',NULL,NULL),(11,14,'11111','jung','정의동','2020-07-10 01:43:02',NULL,NULL),(11,16,'ㅂㅇㄹ','hong','정의동','2020-07-10 02:27:58',NULL,NULL),(11,17,'ㅁㄴㅇㄹ','hong','정의동','2020-07-10 02:39:58',NULL,NULL),(10,20,'test3','hong','정의동','2020-07-10 02:51:19',NULL,NULL),(10,21,'test4','hong','정의동','2020-07-10 02:51:20',NULL,NULL),(10,22,'test5','hong','정의동','2020-07-10 02:51:24',NULL,NULL),(10,23,'test6','hong','홍길동','2020-07-10 03:08:50','answer test','2020-07-10 03:45:40'),(3,24,'재입고 언제 되나요?','anna','천안나','2020-07-14 00:40:15',NULL,NULL);
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
INSERT INTO `review` VALUES (12,14,'자차카파','hong','홍길동','2020-07-09 07:48:12',5),(12,15,'타하','hong','홍길동','2020-07-09 07:48:22',2),(12,16,'가나다라','hong','홍길동','2020-07-09 07:52:19',1),(12,17,'마바사아','hong','홍길동','2020-07-09 07:52:24',4),(12,18,'abcd','hong','홍길동','2020-07-09 07:52:32',3),(12,19,'최악이네요','hong','홍길동','2020-07-09 08:36:05',1),(12,20,'천안\n나','jung','정의동','2020-07-10 00:30:38',5),(12,21,'ㅇ','jung','정의동','2020-07-10 00:56:47',5),(11,22,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:35',5),(11,23,'ㅁㄴㅇㄹ','jung','정의동','2020-07-10 01:10:39',3),(11,24,'ㅁㅁㅁㅁ','jung','정의동','2020-07-10 01:29:42',5),(11,25,'4','jung','정의동','2020-07-10 01:29:46',5),(10,27,'test2','hong','정의동','2020-07-10 02:50:59',4),(10,28,'test3','hong','정의동','2020-07-10 02:51:02',3),(10,29,'test4','hong','정의동','2020-07-10 02:51:06',2),(10,30,'test5','hong','정의동','2020-07-10 02:51:09',1),(3,31,'조아요','anna','천안나','2020-07-14 00:39:59',5);
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
INSERT INTO `wishlist` VALUES (4,'anna',6,'2020-07-14 00:39:24'),(5,'anna',12,'2020-07-14 00:55:14');
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

-- Dump completed on 2020-07-15  1:56:31
