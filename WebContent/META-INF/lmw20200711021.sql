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
  `campingDate` timestamp NULL DEFAULT NULL,
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
INSERT INTO `camping` VALUES (1,'부산 기장에 위치한 캠핑장 추천합니다','캠핑하기 좋은 장소 추천합니다\r\n','123.jpg','psm211','박수민',1,0,0,'2020-07-15 01:34:21',10,1),(2,'부산 당일치기 캠핑 놀만한 곳. 늘푸른숲 캠핑느낌 가득하게 바베큐파티했어요.','지난 주말 친구들과 계모임날이라\r\n어디갈지 고민하다가\r\n코로나 때문에 남들피해서\r\n펜션 빌려서 놀까 글램핑을 갈까 했는데\r\n밍기적거리다가 다 놓치고\r\n결국은 발등에 불떨어져서 급하게 알아본\r\n늘 푸른 숲\r\n금정구라 화명동에서는 산성터널 하나만 타면되서\r\n가깝기도 하고\r\n좋았어요\r\n즐거웠던 늘푸른숲에서의 바베큐파티\r\n아직까진 밤이 시원해서\r\n저녁타임으로 즐기기 좋은 것 같아요!\r\n모기기피제는 챙겨가시길\r\n','1593398447215.jpg','assa01','강창민',2,0,0,'2020-07-15 01:37:29',3,1),(3,'간편한 캠핑요리 레시피(감바스)','[필수재료] \r\n\r\n새우 10마리, 마늘 5알, 올리브유 1/2종이컵, 버터 1숟가락, 페페론치노 1/3숟가락, 소금 약간, 후추 약간\r\n\r\n01.\r\n마늘을 편 썰어요\r\n02.\r\n새우는 내장을 빼고 머리와 껍질을 제거해요.\r\n03.\r\n팬에 버터를 녹이고 편 마늘, 페페론치노를 넣어 볶다가 소금, 후추를 뿌려요\r\n04.\r\n올리브유를 붓고 새우를 넣어 새우가 익을 때 까지 약불로 끓여 완성해요','1.감바스알아히요.jpg','psm211','박수민',3,0,0,'2020-07-15 01:38:48',5,4),(4,'라면 끓이기','물 550ml(3컵정도)를 끓인 후 분말스프, 후레이크를 같이 넣고\r\n4분30초간 더 끓이면 얼큰한 국물 맛의 신라면이 됩니다.','라면_끓이기_해장.jpg','assa01','강창민',4,0,0,'2020-07-15 01:44:16',4,4),(5,'캠핑 비어치킨 만드는법','재료= 닭, 양념재료( 다진마늘1,허브솔트1,오일3,설탕1,파슬리가루,허브시즈닝)\r\n1.닭에 칼집내서 잘 익을  수 있도록한다\r\n2. 양념재료들을 발라준다\r\n3.날개부분과 다리부분에 호일을 감싸준다\r\n4.맥주를 약간 마시고 1/3정도 들어있는 맥주캔위에 닭을 꽂아  전체로 호일을 한번더 감싸서 오븐에 굽는다\r\n','비어치킨.jpg','psm211','박수민',5,0,0,'2020-07-15 01:49:47',6,4),(6,'맛있겠네요.','이번에 여행가면 해 먹어 봐야겠습니다.',NULL,'assa01','강창민',5,1,1,'2020-07-15 01:51:44',7,4),(7,'캠핑장 추천!','충남 홍성 세울터오토캠핑장\r\n\r\n아무 생각 없이 캠핑블로그 둘러보다가 평이 좋길래 가보고, 완전 반해서 자주 가는 캠핑장입니다. \r\n사실 홍성이 절대 가까운 거리는 아닌데, 토요일 아침에 여유있게 출발하고 휴게소 스톱 한번 하더라도, 입실시간인 2시 안으로는 도착할 수 있습니다. 2년 전 처음 방문했을 때엔 사이트가 이렇게까지 많진 않았는데, 지금은 널찍널찍한 사이트가 더 많이 생겼고 펜션동, 돔하우스들도 있어 캠핑족+펜션족들이 함께 가도 좋은 곳입니다.\r\n주변이 산으로 둘러쌓여 있어 공기가 너무 좋고 (밤에는 조금 추워요~), 사이트가 전체적으로 아이들이 뛰어놀기 좋은 구조로 되어 있어 회사 및 동아리들에서 단체로 캠핑으로 오기도 합니다. 그래도 워낙 넓다 보니 전혀 바글바글하다는 느낌이 들지 않아요.\r\n근처에 마트, 슈퍼 등 외에도 대하로 유명한 남당항이 멀지 않으니 살 통통한 대하와 꽃게를 좀 사오세요. 저녁에 고기와 대하 조금 구워 먹다가 꽃게탕 끓여먹으면 정말 끝입니다! 꽃게탕 조금 남기셔서 다음 날 라면 넣어 끓여드심 더 좋고요!\r\n\r\n주소: 충청남도 홍성군 서부면 판교리 645-43\r\n전화번호: 041-642-9953\r\n예약하려면: http://cafe.daum.net/land3455/\r\n주말 1박 30,000원 / 화장실 깨끗한 편이고 개수대, 샤워장 모두 온수 나옵니다 / 애견 동반 가능','세울터오토캠핑장.jpg','arok','조아록',7,0,0,'2020-07-15 01:57:13',5,3),(8,'이것만은 꼭! 캠핑장에서 지켜야 할 주의사항','1. 화로대는 반드시 실외에서 사용하자.\r\n텐트 내에서 화로대를 사용하게 되면 불똥이 튀어 텐트에 옮겨붙거나 큰 화재를 유발할 수 있기 때문에 꼭 일정 거리를 둔 곳이나 실외에 설치해야 한다.\r\n\r\n2. 텐트 내 휘발유 난로 사용은 질식의 위험이 있으니 환기는 필수.\r\n아직 아침저녁으로 부는 찬 기운탓에 난방용품을 사용하는 경우가 많다. 보통 텐트 내에 휘발유 난로를 설치하는 경우, 발생한 일산화탄소가 빠져나가지 못해 산소가 부족해지기 쉬우므로 환기에 꾸준히 신경 써야 한다.\r\n\r\n3. 남은 재는 반드시 지정된 장소에 버리자.\r\n화로대를 사용한 뒤 남은 재가 날려 다른 캠퍼들에게 피해를 줄 수 있으니 반드시 지정된 장소에 버려야 한다. 만약 지정된 장소가 없다면 주변인에게 피해를 주지 않는 장소나 쓰레기 봉투에 담아 버리도록 하자.\r\n\r\n4. 화기 주변 화상을 조심하자.\r\n화로대 등 화기에 남은 재는 시간이 오래 지나도 화상을 입힐 만한 열기가 남아있어 매우 위험해서 주의를 요한다.\r\n\r\n5. 쓰레기는 최소한으로 줄이자.\r\n캠핑 시 가장 많이 발생할 수 있는 음식물 쓰레기를 줄이기 위해 음식은 먹을 만큼만 준비하는 것이 좋다. 또, 일회용품 사용을 자제하고 물은 생수를 사 먹기보다는 전용물통을 이용하는 것도 좋은 방법이다.\r\n\r\n6. 철수할 때에는 잔디복구를 잊지 말자.\r\n잔디 위에 텐트를 설치한 경우에는 철수 시 잔디가 함께 뽑히게 되는데 이때 잔디가 다시 뿌리 내릴 수 있도록 뽑힌 잔디를 원래대로 해놓고 밟아주어야 한다.\r\n\r\n7. 그늘막이나 해먹 설치 시, 나무에 묶을 때에는 수건 등으로 나무를 보호하자.\r\n그늘막이나 해먹 설치 시 나무가 로프의 당기는 힘을 버텨낼 수 있을지 먼저 확인해야 하며, 수건 등으로 나무를 감싼 다음 로프를 묶어 나무에 상처가 나지 않도록 주의해야 한다.\r\n\r\n8. 늦은 밤 캠핑 시에는 주의하자.\r\n야간에 사이트 구축 시에는 최대한 조용하게 설치해야 하며, 자동차 전조등을 키고 장비를 설치하는 것은 주변 캠퍼들에게 실례가 될 수 있다. 또한, 복잡하게 설치된 로프 줄에 아이들이 넘어지지 않도록 설치에 유의하자.\r\n\r\n9. 피부의 노출을 줄여 벌레에 물리지 않도록 하자.\r\n말벌, 뇌염모기, 살인 진드기 등 아웃도어에는 때로 위험한 벌레들이 있을 수 있으니 피부의 노출을 줄여 벌레에 물리는 것을 예방하는 것이 중요하다. 여름 캠핑 시에도 긴 바지, 양말, 신발 등을 갖추는 것을 잊지 말자.\r\n\r\n10. 캠핑장 내 예의는 기본!\r\n즐거운 캠핑을 위해서는 무엇보다 캠핑장 내 에티켓이 필수다. 캠핑장 내 지나친 음주나 고성방가를 피하는 것은 물론 소음을 유발할 수 있는 폭죽은 삼가하는 것이 좋다.',NULL,'arok','조아록',8,0,0,'2020-07-15 02:00:39',6,1),(9,' 캠핑장 소식','신종 코로나바이러스 감염증(코로나19)은 단기간에 여가 문화를 바꾸었다. 사람이 몰리는 전통 관광지 방문은 꺼리지만 캠핑, 등산 같은 아웃도어 레저는 더 인기다. 한국관광공사와 서울관광재단의 트렌드 조사가 이를 증명한다. 한국관광공사는 1월 20일~5월 30일 SK 티맵과 KT 모바일 빅데이터를 분석했고, 서울관광재단은 2월 1일~5월 15일 인스타그램‧블로그 등 SNS 게시물 19억 건을 분석했다.강원도가 141%로 두드러졌다. 이어 전북(+133%), 충남(+125%), 경기(+80%) 순으로 증가율이 높았다. 강원도에서는 영월(+470%), 양양(377%)을 찾는 캠핑족이 급증했다.\r\n[출처: 중앙일보] [그래픽텔링] 북적한 캠핑장·등산로 휑한 전통 관광지… 코로나 시대의 레저 풍경\r\n라는 뉴스 소식이네요 캠핑장 가기전에 예약문의 사전에 미리미리 하는 걸 추천합니다',NULL,'psm211','박수민',9,0,0,'2020-07-15 02:03:16',3,2),(10,'[답글] 부산 기장에 위치한 캠핑장 추천합니다','저도 이 곳을 방문 했었는데 정말 강추 합니다!!!',NULL,'abcd','김자바',1,1,1,'2020-07-15 05:10:20',1,1),(11,'지리산 캠피장 추천 합니다!','여름휴가로 다녀온 지리산 피아골 오토캠핑장 추천 합니다!\r\n시원하고 조용한 산자락에 있어 프라이빗한 휴가를 즐길 수 있습니다~','지리산.jpg','abcd','김자바',11,0,0,'2020-07-15 05:12:35',3,3);
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
INSERT INTO `cart` VALUES (18,66800,1,2500,'네이처하이크 NH 버터플라이 캠핑체어 ','1_chair1_1.jpg',NULL,'kim','2020-07-15 17:41:32',66800),(15,15000,1,2500,'트리 감성 LED 클래식 캠핑등 ','1_L2.jpg',NULL,'kim','2020-07-15 17:41:36',15000),(8,160000,1,2500,'신호상사 하프돔 하이드라 400D ','1_b3_1.jpg',NULL,'kim','2020-07-15 17:41:41',160000),(6,262700,1,2500,'아이두젠 패스트캠프 초대형 타프스크린 ','1_t2_1.jpg',NULL,'kim','2020-07-15 17:41:46',262700);
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
INSERT INTO `comment` VALUES (10,1,'와우!','seo','서민재',1,0,0,'2020-07-14 02:42:45'),(10,2,'와우2@','seo','서민재',1,1,1,'2020-07-14 02:42:53'),(14,3,'보물은 어디서 찾나요?','assa01','강창민',2,0,0,'2020-07-15 01:59:53'),(17,4,'ㅇㅇ','assa01','강창민',3,0,0,'2020-07-15 02:00:38');
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
  `eventWriteDate` timestamp NULL DEFAULT NULL,
  `eventReadCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventNo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'하림캠핑간닭이벤트','하림캠핑간닭이벤트','하림캠핑간닭.JPG','2020-07-14 03:15:09',1),(2,'타임세일','타임세일','타임세일.jpg','2020-07-14 03:15:22',2),(3,'쿠킹캠핑','쿠킹캠핑 ','쿠킹캠핑.jpg','2020-07-14 03:15:45',1),(4,'캠핑이벤트','캠핑이벤트 ','캠핑이벤트.jpg','2020-07-14 03:15:59',1),(5,'캠핑의계절','캠핑의계절 ','캠핑의계절.jpg','2020-07-14 03:16:12',1),(6,'차박텐트','차박텐트 ','차박텐트.jpg','2020-07-14 03:16:25',2),(7,'장바구니이벤트','장바구니이벤트 ','장바구니.jpg','2020-07-14 03:16:42',1),(8,'욜로이벤트','욜로이벤트 ','욜로.jpg','2020-07-14 03:16:56',1),(9,'야심한밤 특가찬스','야심한밤 특가찬스','야심한밤특가찬스.jpg','2020-07-14 03:17:09',1),(10,'스피커할인 이벤트','스피커할인 이벤트','스피커할인.jpg','2020-07-14 03:17:30',1),(11,'쇼핑반값','쇼핑반값 ','쇼핑반값.jpg','2020-07-14 03:17:47',2),(12,'비정상특가','비정상특가 ','비정상특가.jpg','2020-07-14 03:18:01',1),(13,'봄이벤트 ','봄이벤트 ','봄이벤트.jpg','2020-07-14 03:18:15',3),(14,'보물찾기이벤트','보물찾기이벤트','보물찾기.jpg','2020-07-14 03:18:28',2),(15,'리퍼판매이벤트','리퍼판매이벤트','리퍼판매.jpg','2020-07-15 01:31:42',3),(16,'당일배송 이벤트','당일배송 이벤트','당일배송.jpg','2020-07-15 00:48:34',2),(17,'Summer SALE','Summer SALE','summerSale.jpg','2020-07-15 00:48:48',8);
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
  `faqWriteDate` timestamp NULL DEFAULT NULL,
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
  `productDate` timestamp NULL DEFAULT NULL,
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
INSERT INTO `product` VALUES (1,'네이처하이크 클라우드 피크 2 20D','돔텐트 / 백패킹용 / 사용인원: 2인용 / 권장사용: 2인용 / 추가 구성품: 이너텐트, 그라운드시트, 루프 플라이 /\r\n[본체] 내수압: 4000mm / 재질: 나일론, 립스탑, 20D / 폴대재질: 두랄루민 /\r\n[플로어] 재질: 나일론, 립스탑, 20D /\r\n[무게&크기] 무게: 2.34kg / 크기(가로x세로x높이): 본체-274x210x150cm, 이너-210x130(120)x105cm / 수납크기(가로x세로x높이): 50x15x15cm / 색상: 그린, 블루,퍼플','1_5339912_1.jpg','2_5339912_2.jpg','3_5339912_3.jpg',210000,99,'2020-07-17 00:58:20',1,4),(2,'배진산업 캠프타운 테일게이트 차량 연결 텐트','돔텐트 / 차박텐트 / 차량설치위치: 뒷면 / 사용인원: 1인용~2인용 / 권장사용: 4인용 /\r\n[본체] 내수압: 3000mm / 재질: 폴리에스테르, 타프타, 75D / 폴대재질: 스틸, 알루미늄 /\r\n[무게&크기] 무게: 13.2kg / 크기(가로x세로x높이): 250x250x210cm / 수납크기(가로x세로x높이): 110x25x25cm','1_5331793_3.jpg','2_5331793_2.jpg',NULL,326000,97,'2020-07-17 00:58:20',1,4),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트','텐트 / 그늘막형 / 반자동설치 / 사용인원: 4인용~5인용 / 권장사용: 4인용 / 추가 구성품: 익스텐션 /\r\n[본체] 내수압: 2000mm / 재질: 폴리에스테르, 메쉬, 190T / 폴대재질: 스틸, 화이버글라스 /\r\n[플로어] 내수압: 2000mm / 재질: 폴리에스테르, 옥스포드, 210D /\r\n[무게&크기] 무게: 5kg / 크기(가로x세로x높이): 270x240x165cm / 수납크기(가로x세로x높이): 110x20x20cm / 색상: 틸블루, 라이트그레이, 올리브그린','1_11671112_1.jpg','2_11671112_2.jpg',NULL,77200,0,'2020-07-17 00:58:20',1,4),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ','초대형 사이즈! 고기능성 타프일체형 타프 하우스\r\n상세 스펙\r\n타프 / 일체형 스크린 / 렉타(사각) / 내수압: 3000mm / 재질: 폴리에스테르 / 옥스포드 / 150D / PU코팅 / UV코팅 / 발수 / 무게: 17.7kg / 폴개수: 메인폴 2개, 사이드폴 6개 / 크기(가로x세로x높이): 430x400x270(170)cm / 구성품: 타프스크린, 폴, 팩, 스트링, 수납케이스, 라이너시트','1_t6_1.jpg','2_t6_2.jpg',NULL,330000,93,'2020-07-16 16:40:19',2,0),(5,'힐맨 실 타프 블랙에디션 ','타프 / 스킨 / 렉타(사각) / 내수압: 4000mm / 재질: 나일론 / 립스탑 / 20D / PU코팅 / 무게: 845g / 크기(가로x세로): 300x350cm','1_t9_1.jpg',NULL,NULL,85600,97,'2020-07-16 16:40:19',2,0),(6,'아이두젠 패스트캠프 초대형 타프스크린 ','상세 스펙\r\n타프 / 일체형 스크린 / 내수압: 3000mm / 재질: 폴리에스테르 / 옥스포드 / 150D / PU코팅 / UV코팅 / 발수 / 폴개수: 메인폴 2개, 사이드폴 6개 / 크기(가로x세로x높이): 430x400x270cm / 구성품: 본체, 사이드월, 프론트월, 폴, 폴주머니, 팩, 팩주머니, 스트링, 수납가방','1_t2_1.jpg','2_t2_2.jpg',NULL,262700,93,'2020-07-16 16:40:19',2,4),(7,'살레와 오리털 침낭 1500g (해외구매) ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 오리털 / 재질: 나일론 / 내한온도: -32℃ / 방수 / 무게: 1.74kg / 320T / 크기(가로x세로): 80x230cm / 색상: 블루, 레드','1_b7.jpg',NULL,NULL,100000,97,'2020-07-14 16:44:38',3,2),(8,'신호상사 하프돔 하이드라 400D ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 오리털 / 크기 : 215*80*55cm / 무게 : 1.10kg','1_b3_1.jpg','2_b3_2.jpg',NULL,160000,98,'2020-07-14 16:44:38',3,4),(9,'BUCK703 이중 고밀도 거위털 침낭 ','봉제 완료 후 다시한번 리스탑원단으로 덧씌워 털빠짐 최소화, 보온력 강화!\r\n상세 스펙\r\n침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 거위털 / 재질: 폴리에스테르 / 내한온도: -10℃ / 방수 / 무게: 2.17kg / 크기(가로x세로): 80x210cm, 수납크기-25x40cm / 구성품: 침낭, 압축백','1_b10_1.jpg','2_b10_2.jpg',NULL,50000,94,'2020-07-15 01:27:28',3,5),(10,'반고 나이트스타 알파 300 쿼드 엑스칼리버 ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 홀로파이버 / 재질: 폴리에스테르 / 내한온도: -23℃ / 무게: 1.82kg / 크기(가로x세로): 80x215cm / 구성품: 침낭, 압축 케이스 / EN 13537 테스트 완료','1_b2_1.jpg','2_b2_2.jpg','3_b2_3.jpg',79000,100,'2020-07-14 01:29:50',3,0),(11,'트라우마 알파인 450D ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 거위털 / 재질: 나일론 / 내한온도: -10℃ / 발수 / 무게: 900g / 크기(가로x세로): 75(50)x205cm, 수납크기-15x25cm','1_b4_1.jpg','2_b4_2.jpg',NULL,180000,97,'2020-07-14 16:44:38',3,5),(12,'반고 나이트스타 알파 350 엑스칼리버 ','침낭 / 머미(미이라형) / 사용계절: 겨울용 / 충전재: 홀로파이버 / 재질: 폴리에스테르 / 내한온도: -25℃ / 무게: 1.88kg / 크기(가로x세로): 50x210cm / 구성품: 침낭, 압축케이스 / EN 13537 테스트 완료','1_b1_2.jpg','2_b1_1.jpg','3_b1_3.jpg',75000,31,'2020-07-14 16:44:38',3,0),(13,' 샤오미 Nextool 고휘도 야외 손전등 ','캠핑용품 / 랜턴(램프) / 손전등 / LED / 2000루멘 / 밝기조절: 4단계 / 에너지원: 전기 / 충전식 / 점멸등 / 방수 / 잔여배터리표시 / 원터치점화 / 최대사용시간: 140시간 / 265g / 크기(가로x세로): 5.9x16.4cm','1_L6.jpg',NULL,NULL,27000,98,'2020-07-14 12:26:17',7,4),(14,'발뮤다 LED 랜턴 L02B ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 195루멘 / 에너지원: 전기 / 충전식 / 생활방수 / 최대사용시간: 50시간 / 630g / 크기(가로x세로x높이): 11x10.3x24.8cm','1_L3.jpg',NULL,NULL,178000,99,'2020-07-14 08:30:51',7,4),(15,'트리 감성 LED 클래식 캠핑등 ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 에너지원: 전기 / AA건전지x4 / 크기(지름x높이): 12.5x27cm','1_L2.jpg',NULL,NULL,15000,97,'2020-07-15 01:26:57',7,5),(16,'울트라코어 RJ-8000 헤드랜턴 ','캠핑용품 / 랜턴(램프) / 헤드형 / LED / 6000루멘 / 밝기조절: 3단계 / 에너지원: 전기 / 충전식 / 점멸등 / 줌조절 / 방수 / 최대사용시간: 15시간 / 70g / 크기(길이): 8.5cm','1_L9.jpg','2_L10.jpg',NULL,28600,98,'2020-07-14 08:30:51',7,5),(17,'발뮤다 LED 랜턴 L02A (해외구매) ','캠핑용품 / 랜턴(램프) / 호롱불 / LED / 195루멘 / 에너지원: 전기 / 충전식 / 생활방수 / 최대사용시간: 50시간 / 630g / 크기(가로x세로x높이): 11x10.3x24.8cm','1_L4.jpg',NULL,NULL,160000,98,'2020-07-14 12:26:17',7,5),(18,'네이처하이크 NH 버터플라이 캠핑체어 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 두랄루민 / 등받이 / 컴팩트접이식 / 무게: 2.9kg / 내하중: 120kg / 크기(세로x높이): 설치시-53x35x81cm, 수납시-25x98cm / 색상: 블랙, 카키','1_chair1_1.jpg','2_chair1_2.jpg','3_chair1_3.jpg',66800,100,'2020-07-14 08:30:51',9,3),(19,'카르닉 고급 모던 릴렉스 체어 특대형 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 알루미늄 / 팔걸이 / 등받이 / 포켓 / 컴팩트접이식 / 무게: 3.9kg / 크기(가로x세로x높이): 설치시-58x55x101cm, 수납시-13x120cm / 색상: 베이지, 블랙, 오렌지, 투톤그레이, 투톤블루, 투톤카키','1_chair3_1.jpg','2_chair3_2.jpg','3_chair3_3.jpg',34000,56,'2020-07-14 08:30:51',9,0),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ','캠핑가구 / 캠핑의자 / 경량의자 / 두랄루민 / 등받이 / 분해접이식 / 무게: 1.28kg / 내하중: 150kg / 크기(가로x세로x높이): 설치시-36x48x102cm, 수납시-13x50cm / 색상: 블랙, 그레이','1_chair2_1.jpg','2_chair2_2.jpg',NULL,40000,95,'2020-07-14 08:30:51',9,3),(21,'코코아이티 초경량 체어 기본형 ','작지만 강하다! 하중 145kg 경량 폴딩체어\r\n\r\n상세 스펙\r\n캠핑가구 / 캠핑의자 / 경량의자 / 두랄루민 / 등받이 / 분해접이식 / 무게: 860g / 내하중: 145kg / 크기(가로x높이): 설치시-55x65cm, 수납시-34x11cm','1_chair10_1.jpg','2_chair10_2.jpg',NULL,18400,99,'2020-07-14 08:30:51',9,4),(22,'카즈미 감성 릴렉스 체어 ','감성적인 패턴으로 고급스러움을 더하다! 설치와 이동이 간편한 릴렉스체어\r\n상세 스펙\r\n캠핑가구 / 캠핑의자 / 릴렉스의자 / 알루미늄 / 팔걸이 / 등받이 / 포켓 / 컴팩트접이식 / 무게: 3.6kg / 내하중: 80kg / 크기(가로x세로x높이): 설치시-44.5x54x102cm, 수납시-24x132cm','1_chair8_1.jpg','2_chair8_2.jpg',NULL,35600,97,'2020-07-14 12:26:17',9,3),(23,'K4CAMP 원터치 줄무늬 의자 ','캠핑가구 / 캠핑의자 / 미니의자 / 스틸 / 팔걸이 / 등받이 / 폴더접이식 / 무게: 1.87kg / 크기(가로x높이): 설치시-44x74cm, 수납시-67cm\r\n','1_chair6_1.jpg','2_chair6_2.jpg',NULL,8500,95,'2020-07-15 01:31:21',9,1),(24,'비에프엘 버팔로 프리미엄 캠핑 티탄 스마트 체어 ','캠핑가구 / 캠핑의자 / 릴렉스의자 / 두랄루민 / 팔걸이 / 등받이 / 목받침 / 포켓 / 각도조절 / 컴팩트접이식 / 무게: 4kg / 내하중: 100kg / 크기(가로x세로x높이): 설치시-50x70x96cm, 수납시-30x90cm','1_chair7_2.jpg',NULL,NULL,54000,96,'2020-07-15 01:25:52',9,5);
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
INSERT INTO `productorder` VALUES (12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'4524','서울 중구 세종대로 110','서울특별시청','admin','3',1,'관리자','010-1234-1234','배송전 연락 바랍니다','admin@naver.com','2020-07-14 18:26:45','구매완료',77500,1),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'5089','서울 광진구 강변북로','6','lee','1',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:45:46','구매완료',417400,2),(6,'아이두젠 패스트캠프 초대형 타프스크린',2500,262700,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:45:46','구매완료',417400,2),(12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:45:46','구매완료',417400,2),(8,'신호상사 하프돔 하이드라 400D ',2500,160000,'5089','서울 광진구 강변북로','6','lee','3',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:51:48','구매완료',162500,3),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ',2500,330000,'5089','서울 광진구 강변북로','6','lee','2',1,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:51:58','구매완료',332500,4),(23,'K4CAMP 원터치 줄무늬 의자 ',2500,8500,'5089','서울 광진구 강변북로','6','lee','9',3,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:57:02','구매완료',190000,5),(24,'비에프엘 버팔로 프리미엄 캠핑 티탄 스마트 체어 ',2500,54000,'5089','서울 광진구 강변북로','6','lee','9',3,'이가흔','010-1234-1234','배송전 연락 바랍니다','lee@naver.com','2020-07-14 20:57:02','구매완료',190000,5),(9,'BUCK703 이중 고밀도 거위털 침낭 ',2500,50000,'3900','서울 마포구 가양대로','1','cheon','3',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:24:23','구매완료',52500,6),(13,' 샤오미 Nextool 고휘도 야외 손전등 ',2500,27000,'3900','서울 마포구 가양대로','1','cheon','7',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','구매완료',523400,7),(17,'발뮤다 LED 랜턴 L02A (해외구매) ',2500,160000,'3900','서울 마포구 가양대로','1','cheon','7',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','구매완료',523400,7),(22,'카즈미 감성 릴렉스 체어 ',2500,35600,'3900','서울 마포구 가양대로','1','cheon','9',2,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','구매완료',523400,7),(6,'아이두젠 패스트캠프 초대형 타프스크린 ',2500,262700,'3900','서울 마포구 가양대로','1','cheon','2',1,'천인우','010-1234-1234','배송전 연락 바랍니다','cheon@naver.com','2020-07-14 21:26:17','구매완료',523400,7),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'5089','서울 광진구 강변북로','6','lee','1',2,'이가흔','010-1234-1234','부재시 경비실에 맡겨주세요','lee@naver.com','2020-07-14 22:18:11','결제취소',156900,8),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ',2500,330000,'12990','경기 하남시 감북로','8','jung','2',2,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(6,'아이두젠 패스트캠프 초대형 타프스크린 ',2500,262700,'12990','경기 하남시 감북로','8','jung','2',2,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(9,'BUCK703 이중 고밀도 거위털 침낭 ',2500,50000,'12990','경기 하남시 감북로','8','jung','3',4,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(11,'트라우마 알파인 450D ',2500,180000,'12990','경기 하남시 감북로','8','jung','3',1,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(7,'살레와 오리털 침낭 1500g (해외구매) ',2500,100000,'12990','경기 하남시 감북로','8','jung','3',2,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(8,'신호상사 하프돔 하이드라 400D ',2500,160000,'12990','경기 하남시 감북로','8','jung','3',1,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'12990','경기 하남시 감북로','8','jung','3',4,'정의동','010-1234-1234','부재시 연락 바랍니다','jung@naver.com','2020-07-15 01:44:38','구매완료',2227900,9),(24,'비에프엘 버팔로 프리미엄 캠핑 티탄 스마트 체어 ',2500,54000,'6119','서울 강남구 강남대로 496','1234','assa01','9',1,'강창민','010-7452-2558','배송전 연락 바랍니다','developerbusan01@gmail.com','2020-07-15 10:25:52','결제취소',386500,10),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ',2500,330000,'6119','서울 강남구 강남대로 496','1234','assa01','2',1,'강창민','010-7452-2558','배송전 연락 바랍니다','developerbusan01@gmail.com','2020-07-15 10:25:52','결제취소',386500,10),(23,'K4CAMP 원터치 줄무늬 의자 ',2500,8500,'47281','부산 부산진구 가야대로 734','부산글로벌빌리지','abab','9',1,'정채연','010-1111-1111','배송전 연락 바랍니다','abab@naver.com','2020-07-15 10:26:44','구매완료',350900,11),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'47281','부산 부산진구 가야대로 734','부산글로벌빌리지','abab','1',1,'정채연','010-1111-1111','배송전 연락 바랍니다','abab@naver.com','2020-07-15 10:26:44','구매완료',350900,11),(6,'아이두젠 패스트캠프 초대형 타프스크린 ',2500,262700,'47281','부산 부산진구 가야대로 734','부산글로벌빌리지','abab','2',1,'정채연','010-1111-1111','배송전 연락 바랍니다','abab@naver.com','2020-07-15 10:26:44','구매완료',350900,11),(15,'트리 감성 LED 클래식 캠핑등 ',2500,15000,'47288','부산 부산진구 서면로 1','1234','psm211','7',2,'박수민','010-1234-1234','배송전 연락 바랍니다','ppp@test.com','2020-07-15 10:26:57','구매완료',358500,12),(2,'배진산업 캠프타운 테일게이트 차량 연결 텐트',2500,326000,'47288','부산 부산진구 서면로 1','1234','psm211','1',1,'박수민','010-1234-1234','배송전 연락 바랍니다','ppp@test.com','2020-07-15 10:26:57','구매완료',358500,12),(9,'BUCK703 이중 고밀도 거위털 침낭 ',2500,50000,'47566','부산 연제구 온천천남로 110','한양아파트 5-1106','arok',NULL,1,'조아록','010-7777-0985','부재시 경비실에 맡겨주세요','whdkfhr@gmail.com','2020-07-15 10:27:28','구매완료',129700,13),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'47566','부산 연제구 온천천남로 110','한양아파트 5-1106','arok',NULL,1,'조아록','010-7777-0985','부재시 경비실에 맡겨주세요','whdkfhr@gmail.com','2020-07-15 10:27:28','구매완료',129700,13),(4,'비에프엘 버팔로 올뉴 렉타 타프스크린 하우스 세트 ',2500,330000,'47288','부산 부산진구 서면로 1','1234','psm211','2',1,'박수민','010-1234-1234','부재시 경비실에 맡겨주세요','ppp@test.com','2020-07-15 10:28:04','구매완료',332500,14),(23,'K4CAMP 원터치 줄무늬 의자 ',2500,8500,'6119','서울 강남구 강남대로 496','1234','assa01','9',1,'강창민','010-7452-2558','배송전 연락 바랍니다','developerbusan01@gmail.com','2020-07-15 10:31:20','구매완료',88200,15),(3,'아이두젠 패스트캠프 원터치 오토6 프리미엄 에이텐트',2500,77200,'6119','서울 강남구 강남대로 496','1234','assa01','1',1,'강창민','010-7452-2558','배송전 연락 바랍니다','developerbusan01@gmail.com','2020-07-15 10:31:20','구매완료',88200,15),(12,'반고 나이트스타 알파 350 엑스칼리버 ',2500,75000,'47288','부산 부산진구 서면로 1','1234','psm211','3',1,'박수민','010-1234-1234','부재시 경비실에 맡겨주세요','ppp@test.com','2020-07-15 10:53:03','구매완료',77500,16),(11,'트라우마 알파인 450D ',2500,180000,'6119','서울 강남구 강남대로 496','1234','assa01',NULL,1,'강창민','010-7452-2558','배송전 연락 바랍니다','developerbusan01@gmail.com','2020-07-15 10:53:45','구매완료',182500,17),(15,'트리 감성 LED 클래식 캠핑등 ',2500,15000,'48719','부산 동구 범내로 12','00','abcd','7',1,'김자바','010-1234-5678','부재시 경비실에 맡겨주세요','java@test.com','2020-07-15 14:07:52','구매완료',46100,18),(16,'울트라코어 RJ-8000 헤드랜턴 ',2500,28600,'48719','부산 동구 범내로 12','00','abcd','7',1,'김자바','010-1234-5678','부재시 경비실에 맡겨주세요','java@test.com','2020-07-15 14:07:52','구매완료',46100,18),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ',2500,40000,'47743','부산 동래구 동래로','41','leemw','9',2,'이민우','010-1231-1231','부재시 연락 바랍니다','leemw@naver.com','2020-07-15 14:20:00','구매완료',82500,19),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ',2500,40000,'13306','경기 성남시 수정구 성남대로 지하 1332','가천대역','kim','9',1,'김강열','010-1234-1234','배송전 연락 바랍니다','kim@naver.com','2020-07-15 15:36:44','구매완료',42500,20),(14,'발뮤다 LED 랜턴 L02B ',2500,178000,'3900','서울 마포구 가양대로','1','cheon',NULL,1,'천인우','010-1234-1234','부재시 연락 바랍니다','cheon@naver.com','2020-07-15 17:25:24','구매완료',430500,21),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ',2500,40000,'3900','서울 마포구 가양대로','1','cheon',NULL,1,'천인우','010-1234-1234','부재시 연락 바랍니다','cheon@naver.com','2020-07-15 17:25:24','구매완료',430500,21),(1,'네이처하이크 클라우드 피크 2 20D',2500,210000,'3900','서울 마포구 가양대로','1','cheon',NULL,1,'천인우','010-1234-1234','부재시 연락 바랍니다','cheon@naver.com','2020-07-15 17:25:24','구매완료',430500,21),(17,'발뮤다 LED 랜턴 L02A (해외구매) ',2500,160000,'4806','서울 성동구 가람길 113','후생관','im',NULL,1,'임한결','010-1234-1234','부재시 경비실에 맡겨주세요','im@naver.com','2020-07-15 17:31:03','구매완료',198100,22),(22,'카즈미 감성 릴렉스 체어 ',2500,35600,'4806','서울 성동구 가람길 113','후생관','im',NULL,1,'임한결','010-1234-1234','부재시 경비실에 맡겨주세요','im@naver.com','2020-07-15 17:31:03','구매완료',198100,22),(2,'배진산업 캠프타운 테일게이트 차량 연결 텐트',2500,326000,'12990','경기 하남시 감북로','8','jung',NULL,1,'정의동','010-1234-1234','배송전 연락 바랍니다','jung@naver.com','2020-07-15 17:37:13','구매완료',497100,23),(7,'살레와 오리털 침낭 1500g (해외구매) ',2500,100000,'12990','경기 하남시 감북로','8','jung',NULL,1,'정의동','010-1234-1234','배송전 연락 바랍니다','jung@naver.com','2020-07-15 17:37:13','구매완료',497100,23),(16,'울트라코어 RJ-8000 헤드랜턴 ',2500,28600,'12990','경기 하남시 감북로','8','jung',NULL,1,'정의동','010-1234-1234','배송전 연락 바랍니다','jung@naver.com','2020-07-15 17:37:13','구매완료',497100,23),(20,'네이처하이크 YL06 초경량 릴렉스 체어 ',2500,40000,'12990','경기 하남시 감북로','8','jung',NULL,1,'정의동','010-1234-1234','배송전 연락 바랍니다','jung@naver.com','2020-07-15 17:37:13','구매완료',497100,23),(2,'배진산업 캠프타운 테일게이트 차량 연결 텐트',2500,326000,'7378','서울 영등포구 가마산로','311','seo',NULL,1,'서민재','010-1234-1234','배송전 연락 바랍니다','seo@naver.com','2020-07-15 17:53:03','구매완료',553900,24),(13,' 샤오미 Nextool 고휘도 야외 손전등 ',2500,27000,'7378','서울 영등포구 가마산로','311','seo',NULL,1,'서민재','010-1234-1234','배송전 연락 바랍니다','seo@naver.com','2020-07-15 17:53:03','구매완료',553900,24),(21,'코코아이티 초경량 체어 기본형 ',2500,18400,'7378','서울 영등포구 가마산로','311','seo',NULL,1,'서민재','010-1234-1234','배송전 연락 바랍니다','seo@naver.com','2020-07-15 17:53:03','구매완료',553900,24),(11,'트라우마 알파인 450D ',2500,180000,'7378','서울 영등포구 가마산로','311','seo',NULL,1,'서민재','010-1234-1234','배송전 연락 바랍니다','seo@naver.com','2020-07-15 17:53:03','구매완료',553900,24);
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
INSERT INTO `qna` VALUES (3,24,'재입고 언제 되나요?','anna','천안나','2020-07-14 00:40:15','재입고 예정이 없습니다.\r\n\'재입고 알림\'을 신청하시면, 상품 재입고 시 안내를 받으실 수 있습니다.','2020-07-15 02:35:35'),(4,25,'오늘 주문하면 언제 수령 받을 수 있을까요?','psm211','박수민','2020-07-15 01:29:59','영업일 기준 3일 이내에 배송이 완료됩니다.','2020-07-15 02:33:54'),(2,26,'1.설치하기 편한가요?\n2. 크기가 어느정도 되나요?','arok','조아록','2020-07-15 01:46:17',NULL,NULL),(2,27,'사진으로 보기에는 설치가 어려워 보이는데? 설치는 간단한가요? ','assa01','강창민','2020-07-15 01:46:32','간단히 설치하실 수 있습니다.','2020-07-15 02:33:14'),(12,28,'다른 색상으로 주문했는데 색상 변경 가능한가요','psm211','박수민','2020-07-15 01:52:30',NULL,NULL),(15,29,'AA건전지 4개가 들어가는데 사용가능시간이 몇시간 정도 되나요? ','assa01','강창민','2020-07-15 01:58:25',NULL,NULL),(21,30,'생활방수가 되는 제품인가요?','abcd','김자바','2020-07-15 05:09:34',NULL,NULL),(19,31,'무게가 어느정도인지! 튼튼한지 궁금합니다!!!!','im','임한결','2020-07-15 08:33:51',NULL,NULL),(10,32,'한겨울에도 사용할 수 있을까요??','im','임한결','2020-07-15 08:34:53',NULL,NULL),(2,33,'사용가능한 차종을 알려주세요.','leemw','이민우','2020-07-17 01:20:32',NULL,NULL);
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
INSERT INTO `review` VALUES (3,31,'조아요','anna','천안나','2020-07-14 00:39:59',5),(15,32,'램프 이뻐요','psm211','박수민','2020-07-15 01:27:20',5),(23,33,'싼 맛에 샀다가 3번 앉고 내려 앉았습니다.\n무게 많이 나가시는분은 튼튼한걸로 구매하세요.','assa01','강창민','2020-07-15 01:32:20',1),(9,34,'가격대비 만족! 따듯하고 푹신하고 좋네요','arok','조아록','2020-07-15 01:35:25',5),(3,35,'다른 곳 보다 가격도 싸고 튼튼하고 방수도 잘되고 휴대하기도 편리해요ㅎㅎ','arok','조아록','2020-07-15 01:41:01',4),(13,36,'기대이상으로 매우 만족합니다. 디자인도 깔끔하고 편의성도 좋고 밝기도 너무나 만조쿠~~!','arok','조아록','2020-07-15 01:42:12',5),(24,37,'어제 사용해봤는데 최고입니다 가볍고 안정적이고 편하게 누워서 쉬다가 왔읍니다..!','arok','조아록','2020-07-15 01:43:53',5),(2,38,'혼자서도 간편하게 설치가능해서 좋아요','psm211','박수민','2020-07-15 01:51:11',5),(11,39,'가볍고 따뜻하고 좋습니다. ^^','assa01','강창민','2020-07-15 01:54:28',5),(15,40,'클래식한 디자인이 마음에 듭니다!','abcd','김자바','2020-07-15 05:08:30',5),(1,41,'10만원대에도 산다는데 조금 비싸게 주고 샀네요. 힐레베르그 알락과 디자인 같구요. 품질은 생각만큼 좋습니다. 솔캠용으로 딱이고요. 남자둘 보다는 부부. 연인. 부자 캠 등 목적으로 쓰시면 더 좋을듯해요.','cheon','천인우','2020-07-15 08:26:52',4),(20,42,'최악이네요...\n프레임 도색이 벗겨져 왔습니다. ..아니 도색 자체가 덜된거 같아요 급해서 그냥 쓰려고요','cheon','천인우','2020-07-15 08:27:36',1),(14,43,'맘에들어요 ~~~ 캠핑갈때 들고 가려고 했는데 집에서도 침대옆에 놓구 자면 눈 부심이 없어서 편하게 잘수 있네요 책을 볼때는 밝기를 조정하면 되구요~ 여러모로 활용도가 많네요 아쉬운점은 충전 시간대비 사용시간인데 가장밝게 해서 사용하는것보다 집에서는 중간단계 불빛으로 쓰면 될것 같아요맘에들어요 ~~~','cheon','천인우','2020-07-15 08:28:27',4),(17,44,'생각했던거 보다는 작고 깜직하네요.감성캠핑에 잘 어울릴거 같아요^^맘에 들긴 하지만 가격 부담은 있습니다^^','im','임한결','2020-07-15 08:32:15',5),(22,45,'게가 있어서 들때는 무게가 좀 나간다고?? 생각했는데 펴서 앉아보니 확실히 무게가 있어야 안정적인 느낌이 드네요. 색감과 패턴도 맘에 듭니다','im','임한결','2020-07-15 08:32:48',3),(20,46,'7일만에 도착했습니다. 굿이예요~~ 롱 등받이다 보니 뒤로 넘어가려는 성질이 자꾸 나오네요.. 잘 쓸께요.','jung','정의동','2020-07-15 08:37:54',4),(16,47,'전에 여러개 사용해 봤는데 제일 밝음 아주 만족 합니다 줌기능 사용하면 아주멀리까지 잘보입니다','jung','정의동','2020-07-15 08:38:56',5),(7,48,'뽑기 실패 ... 냄새 안나고, 보기에 퀄리티 좋아 보임... 근디... 한번 들어 갔다 나오니 내가 오리가 됨...','jung','정의동','2020-07-15 08:39:38',2),(2,49,'빠른 배송감사합니다 사방을 개방할수 있고 실내처럼사용하며 답답한것도 없고 모기장 되어 있어 벌레도 안달라 붙고 너무 좋와요 서있어도 천장이 넉넉합니다','jung','정의동','2020-07-15 08:40:06',4),(6,50,'무게도 크기도 상상 이상이었어요... 설치도 해체도 좀 힘들었고요~~ 하지만... 일단 설치해놓고 사용해보니~~ 가성비면에서 그 어떤 제품보다 확실히 좋고요.... 스트링과 팩 그리고 망치~~ 사용자를 최대한 고려했다는게 보이더라고요.... 저렴한 가격에 잘 사용하고 있습니다...감사합니다^^','kim','김강열','2020-07-15 08:42:46',4),(8,51,'따뜻하고 휴대성도 좋네요..! 만족!','kim','김강열','2020-07-15 08:44:03',4),(15,52,'분위기는 너무 좋습니다살짝 불빛이 어두운감이 있는거 빼고는 감성은 최고입니다','kim','김강열','2020-07-15 08:44:55',4),(18,53,'중간에 배송이 잘못돼서 우여곡절이 있었지만 침착하게 잘 대응해주셔서 감사합니다. 의자 너무 튼튼하고 이뻐요!!','kim','김강열','2020-07-15 08:45:22',3),(2,54,'딱 2인이 사용하기에 적당한 크기입니다 설치 간단하고 높이도 높은데 가로폭이 3m 였으면 하는 바램이... 망치가 없다는게 함정','seo','서민재','2020-07-15 08:49:29',3),(13,55,'이거 위험한 물건입니다. 너무 밝아요. 거실창에 비췄다가 반사광에 눈뽕 맞았는데 태양권 맞은 기분에 10분간 몸져 누워 있다가 간신하 살아났네요. 해외배송임을 감안해서 1주일정도 못기다리면 안달박사 인증~.캠핑이랑 낚시 가서 잘 쓸께요. 무게가 좀 있긴한데 무거워서 못 쓰겠다는 사람은 손ㅂㅅ인증~','seo','서민재','2020-07-15 08:50:05',2),(21,56,'내가 요즘 나이가 먹었나 설치하다 손목 나가는줄 알았네요 엄청 빡빡하네요 설치하고보니 등받이쪽 이음쇠 부분이 사진과 같이 살짝 들뜨는 정도로 쇠가 휘네요 정상인지 모르겠습니다 저 휜것 때문에 설마 부서지않겟지 하는 소심한 마음으로 앉아서 그런가 두손과 두다리를 가지런히 모으게 만드네요 생각보다 편합니다 튼튼하다 판단되구요 트렁크에 가지고 다니면서 여유 부리겠습니다참고로 설명에는 아래두곳 먼저 꽂으라는데 엉덩이 부분 말하시는거 맞죠??등부터 꽂은다음에 엉덩이 꽂으니 더 쉽네요','seo','서민재','2020-07-15 08:51:10',4),(11,57,'저렴하게 잘 샀어요.','seo','서민재','2020-07-15 08:51:41',5),(7,58,'이 색상은 좀 아닌것 같아요...','leemw','이민우','2020-07-17 00:55:28',1);
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
  `userDate` timestamp NULL DEFAULT NULL,
  `userUse` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('abab','1234','정채연','010-1111-1112','abab@naver.com',47281,'부산 부산진구 가야대로 734','부산글로벌빌리지','2020-07-15 01:31:13',1),('abcd','1234','김자바','010-1234-5678','java@test.com',48719,'부산 동구 범내로 12','00','2020-07-15 05:05:48',1),('admin','1234','관리자','010-1234-1234','admin@naver.com',4524,'서울 중구 세종대로 110','서울특별시청','2020-07-10 11:20:20',1),('anna','1234','천안나','010-1234-1234','anna@naver.com',46729,'부산 강서구 가달1로','7','2020-07-13 11:12:38',1),('arok','1234','조아록','010-7777-0985','whdkfhr@gmail.com',47566,'부산 연제구 온천천남로 110','한양아파트 5-1106','2020-07-15 01:29:01',1),('assa01','12345','강창민','010-7452-2558','developerbusan01@gmail.com',6119,'서울 강남구 강남대로 496','1234','2020-07-15 01:23:58',1),('cheon','1234','천인우','010-1234-1234','cheon@naver.com',3900,'서울 마포구 가양대로','1','2020-07-13 11:03:56',1),('im','1234','임한결','010-1234-1234','im@naver.com',4806,'서울 성동구 가람길 113','후생관','2020-07-13 11:07:08',1),('jung','1234','정의동','010-1234-1234','jung@naver.com',12990,'경기 하남시 감북로','8','2020-07-13 11:04:45',1),('kim','1234','김강열','010-1234-1234','kim@naver.com',13306,'경기 성남시 수정구 성남대로 지하 1332','가천대역','2020-07-13 11:11:52',1),('lee','1234','이가흔','010-1234-1234','lee@naver.com',5089,'서울 광진구 강변북로','6','2020-07-13 11:06:19',1),('leemw','1234','이민우','010-1231-1231','itwill4227@gmail.com',47743,'부산 동래구 동래로','00','2020-07-15 05:19:22',1),('park','1234','박지현','010-1234-1234','park@naver.com',52822,'경남 진주시 가좌길','11','2020-07-13 11:08:47',1),('psm211','1234','박수민','010-1234-1234','ppp@test.com',47288,'부산 부산진구 서면로 1','1234','2020-07-15 01:25:57',1),('seo','1234','서민재','010-1234-1234','seo@naver.com',7378,'서울 영등포구 가마산로','311','2020-07-13 11:07:53',1),('whwoals18','1234','조재민','010-2728-1790','whwoals18@naver.com',47566,'부산 연제구 온천천남로 110','한양아파트 5-1106','2020-07-15 01:30:05',0);
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
  `wishDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`wishNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (4,'anna',6,'2020-07-14 00:39:24'),(5,'anna',12,'2020-07-14 00:55:14'),(6,'arok',3,'2020-07-15 01:25:00'),(7,'arok',9,'2020-07-15 01:25:17'),(8,'arok',13,'2020-07-15 01:25:37'),(9,'abab',3,'2020-07-15 01:26:21'),(10,'psm211',15,'2020-07-15 01:26:25'),(11,'arok',24,'2020-07-15 01:26:37'),(12,'arok',4,'2020-07-15 01:49:01'),(13,'cheon',3,'2020-07-15 07:03:48'),(14,'cheon',1,'2020-07-15 08:24:04'),(15,'cheon',20,'2020-07-15 08:24:13'),(16,'cheon',14,'2020-07-15 08:24:19'),(18,'im',19,'2020-07-15 08:29:26'),(20,'im',10,'2020-07-15 08:29:53'),(21,'jung',20,'2020-07-15 08:35:29'),(22,'jung',16,'2020-07-15 08:35:38'),(23,'jung',7,'2020-07-15 08:35:48'),(24,'jung',2,'2020-07-15 08:35:59'),(27,'seo',22,'2020-07-15 08:47:03'),(28,'seo',17,'2020-07-15 08:47:07');
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

-- Dump completed on 2020-07-17 10:22:03
