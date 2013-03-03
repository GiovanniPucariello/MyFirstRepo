CREATE DATABASE  IF NOT EXISTS `team7` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `team7`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 10.0.41.100    Database: team7
-- ------------------------------------------------------
-- Server version	5.5.25a

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
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `component` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_cat` varchar(50) NOT NULL,
  `serial_num` varchar(100) NOT NULL,
  `lot` varchar(200) DEFAULT NULL,
  `manufacture_date` date NOT NULL,
  `validity_date` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (10,'跑得快','汽车','189','3','2012-08-06','2012-08-01','汽车中的王者\r\n					',34),(11,'奥迪','汽车','23','3','2012-08-08','2012-08-16','	汽车经典				',45),(12,'联想液晶电视','电视机','20120811A001','7','2012-08-11','2012-08-12','及开关的电视\r\n					',56),(13,'惠普','台式电脑','234','4','2012-08-08','2012-08-09','	电脑				',453),(18,'宝马','汽车','20120811A002','','2012-08-02','2036-08-20','					',0),(30,'苹果笔记本电脑','笔记本','PC244224','20091012','2009-08-04','2015-08-20','苹果笔记本电脑，专业的笔记本电脑				',8999);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_dealer`
--

DROP TABLE IF EXISTS `product_dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_dealer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dealer_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dealer_id_idx` (`dealer_id`),
  KEY `FK_product_id` (`product_id`),
  CONSTRAINT `FK_dealer_id` FOREIGN KEY (`dealer_id`) REFERENCES `dealer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_dealer`
--

LOCK TABLES `product_dealer` WRITE;
/*!40000 ALTER TABLE `product_dealer` DISABLE KEYS */;
INSERT INTO `product_dealer` VALUES (4,1002,NULL,'					'),(5,1004,NULL,'					'),(6,1003,NULL,'		sdsdsd			'),(7,1003,NULL,'		sdsdsd			'),(8,1003,NULL,'		sdsdsd			'),(18,1008,13,'					'),(22,1024,13,'					'),(23,1003,12,'					'),(37,1001,10,'上海大众'),(46,1001,11,'					'),(47,1001,12,'					');
/*!40000 ALTER TABLE `product_dealer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `dealer_id` int(10) NOT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_profile_dealer` (`dealer_id`),
  KEY `user_profile_ibfk_1` (`user_id`),
  CONSTRAINT `user_profile_dealer` FOREIGN KEY (`dealer_id`) REFERENCES `dealer` (`id`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (25,1120,1002,'三十多','dddd','dsds','ss@ee.com','23232','12121','12121','sdsdsdsd','速度速度111111\r\n					'),(26,1121,1015,'是多少','sds','是多少','sds@qq.co','23243','1443235·','23423','sdsdsdds','	上的士大夫似的				'),(27,1126,1009,'说道','ss ','说道','ss@ee.com','23232','121243124','1212342','速度速度','			是多少的		'),(30,1134,1004,'dddd','身上','说道','dd@dd.com','11','11','213','sdsd','	12sdsdsds				'),(31,1139,1008,'eee','dd','dd','22@dd.com','2222','22','23323','sdsds','sdsdsd\r\n					'),(33,1141,1004,'椅','ss','ss','2222','111','222','ss','ss','	dfsdsd				');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer_cat`
--

DROP TABLE IF EXISTS `dealer_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer_cat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer_cat`
--

LOCK TABLES `dealer_cat` WRITE;
/*!40000 ALTER TABLE `dealer_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealer_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'客户经理','客户经理'),(2,'企业客户','企业客户'),(3,'系统管理员','系统管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `is_locked` char(1) COLLATE utf8_bin NOT NULL,
  `force_chg_pwd` char(1) COLLATE utf8_bin NOT NULL,
  `language` int(11) NOT NULL,
  `role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1035,'admin','21232f297a57a5a743894a0e4a801fc3','0','0',1,3),(1078,'nnn','202cb962ac59075b964b07152d234b70','1','0',2,1),(1080,'vv','202cb962ac59075b964b07152d234b70','0','0',1,1),(1120,'张三','d0cd2693b3506677e4c55e91d6365bff','0','1',3,2),(1121,'testcustomer','e6123b631c7bfb7fa839bb3aea452ffd','0','0',2,2),(1126,'ff','633de4b0c14ca52ea2432a3c8a5c4c31','1','1',1,2),(1134,'ttt','accc9105df5383111407fd5b41255e23','1','1',2,2),(1139,'bbb','21ad0bd836b90d08f4cf640b4c298e7c','1','0',2,2),(1141,'uuu','c70fd4260c9eb90bc0ba9d047c068eb8','1','1',2,2),(1159,'3333','1aabac6d068eef6a7bad3fdf50a05cc8','1','1',2,2),(1160,'nnnnnn','eab71244afb687f16d8c4f5ee9d6ef0e','0','1',2,2),(1163,'李斯','3691308f2a4c2f6983f2880d32e29c84','0','0',3,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer`
--

DROP TABLE IF EXISTS `dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `dealer_cat_id` int(10) DEFAULT NULL,
  `dealer_type_id` int(10) DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dealer_cat_id` (`dealer_cat_id`),
  KEY `dealer_type_id` (`dealer_type_id`),
  CONSTRAINT `dealer_cat_id` FOREIGN KEY (`dealer_cat_id`) REFERENCES `dealer_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dealer_type_id` FOREIGN KEY (`dealer_type_id`) REFERENCES `dealer_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer`
--

LOCK TABLES `dealer` WRITE;
/*!40000 ALTER TABLE `dealer` DISABLE KEYS */;
INSERT INTO `dealer` VALUES (1001,'大众汽车',NULL,NULL,NULL,'上海市普陀','长期从我公司大宗采购数码产品\r\n					'),(1002,'Oracl',NULL,NULL,NULL,'The Sun','DataBase\r\n					'),(1003,'家乐福超市',NULL,NULL,NULL,'安达市','答案1\r\n					'),(1004,'沃尔玛超市',NULL,NULL,NULL,'北京市朝阳区','长期从我公司采购数码产品'),(1008,'东风日产汽车',NULL,NULL,NULL,'海口市','海南省分公司'),(1009,'华深家具',NULL,NULL,NULL,'海南省美兰区','华深家具				'),(1014,'汽车',NULL,NULL,NULL,'中国','	无敌汽车				'),(1015,'IBM',NULL,NULL,NULL,'America','America Africa World					'),(1024,'DC城',NULL,NULL,NULL,'明珠','明珠DC');
/*!40000 ALTER TABLE `dealer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer_type`
--

DROP TABLE IF EXISTS `dealer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer_type`
--

LOCK TABLES `dealer_type` WRITE;
/*!40000 ALTER TABLE `dealer_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealer_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-14  8:48:27
