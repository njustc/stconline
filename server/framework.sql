-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: njustc
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_contract`
--

DROP TABLE IF EXISTS `tbl_sys_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `assignee` varchar(255) DEFAULT NULL,
  `assigneeaddr` varchar(255) DEFAULT NULL,
  `assgineeauthrepre` varchar(255) DEFAULT NULL,
  `assigneebank` varchar(255) DEFAULT NULL,
  `assigneebankname` varchar(255) DEFAULT NULL,
  `assigneecompanyname` varchar(255) DEFAULT NULL,
  `assigneecontact` varchar(255) DEFAULT NULL,
  `assigneefax` varchar(255) DEFAULT NULL,
  `assigneepostcode` varchar(255) DEFAULT NULL,
  `assigneesigndate` varchar(255) DEFAULT NULL,
  `assigneetel` varchar(255) DEFAULT NULL,
  `assigneeusername` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `clientaddr` varchar(255) DEFAULT NULL,
  `clientauthpepre` varchar(255) DEFAULT NULL,
  `clientbank` varchar(255) DEFAULT NULL,
  `clientcompanyname` varchar(255) DEFAULT NULL,
  `clientcontact` varchar(255) DEFAULT NULL,
  `clientfax` varchar(255) DEFAULT NULL,
  `clientpostcode` varchar(255) DEFAULT NULL,
  `clientsigndate` varchar(255) DEFAULT NULL,
  `clienttel` varchar(255) DEFAULT NULL,
  `clientusername` varchar(255) DEFAULT NULL,
  `contractbody` varchar(255) DEFAULT NULL,
  `finishtime` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `signdate` varchar(255) DEFAULT NULL,
  `signplace` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_contract`
--

LOCK TABLES `tbl_sys_contract` WRITE;
/*!40000 ALTER TABLE `tbl_sys_contract` DISABLE KEYS */;
INSERT INTO `tbl_sys_contract` VALUES (1,'p20190606171309','13',0,'A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','85733','A','A','A',5,'A'),(2,'p20190606171310','34',0,'B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','2357','B','B','B',5,'B'),(3,'p20190606171311','21',0,'C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','5225','C','C','C',5,'C'),(4,'p20190606171312','31',0,'D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','36432','D','D','D',6,'D'),(5,'p20190606171313','2',0,'E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','12343','E','E','E',7,'E'),(6,'p20190606171314','4',0,'F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','1123','F','F','F',6,'F'),(7,'p20190701205847','7',0,'G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','1141','G','G','G',5,'G');
/*!40000 ALTER TABLE `tbl_sys_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `process_state` int(11) DEFAULT NULL,
  `accept_opinions` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `anti_virus` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `check_sample` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_ex_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_in_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_other` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_system` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code_line` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_ch` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_en` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `developer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `encryption_lev` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entrust_entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expected_deadline` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fp_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `func_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `func_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infofax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_postcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infotel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infourl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `opinions` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_choice` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_file` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_data_base` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_ex_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_hard_frame` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_hard_other` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_in_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_language` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_soft_frame` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_soft_midw` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_soft_version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_support` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_system` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_basis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_specification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unit_property` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `web_environment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (1,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无',' ','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171309','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','basic-form.radio.domestic','认真搬砖的一群小朋友','1.0.2','无',5,''),(2,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无',' ','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171310','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','basic-form.radio.domestic','认真搬砖的一群小朋友','1.0.2','无',5,''),(3,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无',' ','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171311','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','basic-form.radio.domestic','认真搬砖的一群小朋友','1.0.2','无',5,''),(4,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171312','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无',6,NULL),(5,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171313','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无',7,NULL),(6,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171314','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无',6,NULL);
/*!40000 ALTER TABLE `tbl_sys_entrust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_functions`
--

DROP TABLE IF EXISTS `tbl_sys_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_functions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `function_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `function_object` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_functions`
--

LOCK TABLES `tbl_sys_functions` WRITE;
/*!40000 ALTER TABLE `tbl_sys_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_project`
--

DROP TABLE IF EXISTS `tbl_sys_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_project`
--

LOCK TABLES `tbl_sys_project` WRITE;
/*!40000 ALTER TABLE `tbl_sys_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_role_functions`
--

DROP TABLE IF EXISTS `tbl_sys_role_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_role_functions` (
  `role_id` bigint(20) NOT NULL,
  `function_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_role_functions`
--

LOCK TABLES `tbl_sys_role_functions` WRITE;
/*!40000 ALTER TABLE `tbl_sys_role_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_role_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_role_users`
--

DROP TABLE IF EXISTS `tbl_sys_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_role_users` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_role_users`
--

LOCK TABLES `tbl_sys_role_users` WRITE;
/*!40000 ALTER TABLE `tbl_sys_role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_roles`
--

DROP TABLE IF EXISTS `tbl_sys_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_roles`
--

LOCK TABLES `tbl_sys_roles` WRITE;
/*!40000 ALTER TABLE `tbl_sys_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testcase`
--

DROP TABLE IF EXISTS `tbl_sys_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testcase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `design_notes` varchar(255) DEFAULT NULL,
  `designer` varchar(255) DEFAULT NULL,
  `expected_result` varchar(255) DEFAULT NULL,
  `regu_notes` varchar(255) DEFAULT NULL,
  `test_class` varchar(255) DEFAULT NULL,
  `test_id` varchar(255) DEFAULT NULL,
  `test_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062921 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testcase`
--

LOCK TABLES `tbl_sys_testcase` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testcase` DISABLE KEYS */;
INSERT INTO `tbl_sys_testcase` VALUES (2019062909,'p20190606171311','3',0,'note3','d3','3','note3','c3','p20190606171311-20190629205845',NULL),(2019062908,'p20190606171310','2',0,'note2','d2','2','note2','c2','p20190606171310-20190629205816',NULL),(2019062907,'p20190606171309','1',0,'note1','d1','1','note1','c1','p20190606171309-20190629205733',NULL),(2019062910,'p20190606171312','4',0,'note4','d4','4','note4','c4','p20190606171312-20190629205922',NULL),(2019062911,'p20190606171313','5',0,'note5','d5','5','note5','c5','p20190606171313-20190629210039',NULL),(2019062912,'p20190606171314','6',0,'note6','d6','6','note6','c6','p20190606171314-20190629210242',NULL),(2019062917,'p20190606171312','7',0,'note7','d7','7','note7','c7','p20190606171312-20190629223943',NULL),(2019062918,'p20190606171309','8',0,'note8','d8','8','note8','c8','p20190606171309-20190629224200',NULL),(2019062919,'p20190606171312','9',0,'note9','d9','9','note9','c9','p20190606171312-20190629224229',NULL);
/*!40000 ALTER TABLE `tbl_sys_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testplan`
--

DROP TABLE IF EXISTS `tbl_sys_testplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) DEFAULT NULL,
  `auditor` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `hardware` varchar(255) DEFAULT NULL,
  `progress_table` varchar(255) DEFAULT NULL,
  `software` varchar(255) DEFAULT NULL,
  `staff` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062908 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testplan`
--

LOCK TABLES `tbl_sys_testplan` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testplan` DISABLE KEYS */;
INSERT INTO `tbl_sys_testplan` VALUES (2019062901,'p20190606171309','2019062901',0,'AA','Aser1','Aser2','Abody','ssd',NULL,'nju','Aser3'),(2019062902,'p20190606171310','2019062902',0,'BB','Bser1','Bser2','Bbody','ssd',NULL,'stc','Bser3'),(2019062903,'p20190606171311','2019062903',0,'CC','Cser1','Cser2','Cbody','ssd',NULL,'dev','Cser3'),(2019062904,'p20190606171312','2019062904',0,'DD','Dser1','Dser2','Dbody','ssd',NULL,'online','Dser3'),(2019062905,'p20190606171313','2019062905',0,'EE','Eser1','Eser2','Ebody','ssd',NULL,'2019062905','Eser3'),(2019062906,'p20190606171314','2019062906',0,'FF','Fser1','Fser2','Fbody','ssd',NULL,'2019062906','Fser3');
/*!40000 ALTER TABLE `tbl_sys_testplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testrecord`
--

DROP TABLE IF EXISTS `tbl_sys_testrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) DEFAULT NULL,
  `bug_id` varchar(255) DEFAULT NULL,
  `design_notes` varchar(255) DEFAULT NULL,
  `designer` varchar(255) DEFAULT NULL,
  `exe_process` varchar(255) DEFAULT NULL,
  `executor` varchar(255) DEFAULT NULL,
  `expected_result` varchar(255) DEFAULT NULL,
  `is_consistent` bit(1) NOT NULL,
  `pre_condition` varchar(255) DEFAULT NULL,
  `real_result` varchar(255) DEFAULT NULL,
  `regu_notes` varchar(255) DEFAULT NULL,
  `test_class` varchar(255) DEFAULT NULL,
  `test_id` varchar(255) DEFAULT NULL,
  `test_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testrecord`
--

LOCK TABLES `tbl_sys_testrecord` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testrecord` DISABLE KEYS */;
INSERT INTO `tbl_sys_testrecord` VALUES (1,'p20190606171312','11',0,'a4','000','note4','d4',NULL,NULL,'4','\0',NULL,NULL,'note4','c4','p20190606171312-20190629205922',NULL),(2,'p20190606171312','12',0,'a7','000','note7','d7',NULL,NULL,'7','\0',NULL,NULL,'note7','c7','p20190606171312-20190629223943',NULL),(3,'p20190606171309','9',0,'a1','001','note1','d1',NULL,NULL,'1','\0',NULL,NULL,'note1','c1','p20190606171312-20190629205733',NULL);
/*!40000 ALTER TABLE `tbl_sys_testrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testreport`
--

DROP TABLE IF EXISTS `tbl_sys_testreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) DEFAULT NULL,
  `approver_date` varchar(255) DEFAULT NULL,
  `auditor` varchar(255) DEFAULT NULL,
  `auditor_date` varchar(255) DEFAULT NULL,
  `client_addr` varchar(255) DEFAULT NULL,
  `client_company` varchar(255) DEFAULT NULL,
  `client_contact` varchar(255) DEFAULT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_fax` varchar(255) DEFAULT NULL,
  `client_post_code` varchar(255) DEFAULT NULL,
  `client_tel` varchar(255) DEFAULT NULL,
  `code_id` varchar(255) DEFAULT NULL,
  `hardware_environment` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `report_date` varchar(255) DEFAULT NULL,
  `sample_date` varchar(255) DEFAULT NULL,
  `sample_menu` varchar(255) DEFAULT NULL,
  `sample_name` varchar(255) DEFAULT NULL,
  `sample_state` varchar(255) DEFAULT NULL,
  `software_environment` varchar(255) DEFAULT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `test_basis` varchar(255) DEFAULT NULL,
  `test_conclusion` varchar(255) DEFAULT NULL,
  `test_content` varchar(255) DEFAULT NULL,
  `test_date` varchar(255) DEFAULT NULL,
  `test_exe_record` varchar(255) DEFAULT NULL,
  `test_type` varchar(255) DEFAULT NULL,
  `tester` varchar(255) DEFAULT NULL,
  `tester_date` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062908 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testreport`
--

LOCK TABLES `tbl_sys_testreport` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testreport` DISABLE KEYS */;
INSERT INTO `tbl_sys_testreport` VALUES (2019062901,'p20190606171309','2019062901',0,'A1','20190620','A2','20190620',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3','20190620','1.0'),(2019062902,'p20190606171310','2019062902',0,'B1','20190621','B2','20190621',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B3','20190621','1.1'),(2019062903,'p20190606171311','2019062903',0,'C1','20190622','C2','20190622',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C3','20190622','1.2'),(2019062904,'p20190606171312','2019062904',0,'D1','20190623','D2','20190623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D3','20190623','1.3'),(2019062905,'p20190606171313','2019062905',0,'E1','20190624','E2','20190624',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E3','20190624','1.4'),(2019062906,'p20190606171314','2019062906',0,'F1','20190625','F2','20190625',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F3','20190625','1.5');
/*!40000 ALTER TABLE `tbl_sys_testreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user`
--

DROP TABLE IF EXISTS `tbl_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (9,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,STAFF,USER','u20190605134944','SSB'),(8,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,STAFF,USER','u20190605134833','SSA'),(7,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190605134759','CUSC'),(6,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190605134754','CUSB'),(5,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190605134344','CUSA'),(10,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,STAFF,USER','u20190605135114','SMA'),(11,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,STAFF,USER','u20190605135358','TSA'),(12,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,STAFF,USER','u20190605135411','TSB'),(13,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,STAFF,USER','u20190605135543','TMA'),(14,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,STAFF,USER','u20190605135736','QMA'),(15,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN','u20190605135828','admin');
/*!40000 ALTER TABLE `tbl_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user_entrusts`
--

DROP TABLE IF EXISTS `tbl_sys_user_entrusts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user_entrusts` (
  `user_id` bigint(20) NOT NULL,
  `entrusts_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mvqyku3j1lfeu915rcacqhiu` (`entrusts_id`),
  KEY `FKo6o6s38lguhv0gy5pdxyu576n` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user_entrusts`
--

LOCK TABLES `tbl_sys_user_entrusts` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user_entrusts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_user_entrusts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user_projects`
--

DROP TABLE IF EXISTS `tbl_sys_user_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user_projects` (
  `user_id` bigint(20) NOT NULL,
  `projects_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_fsge06xodxnruvyhkan7n0ipl` (`projects_id`),
  KEY `FKt1bpdahotdvajs9ox0vb9uaqe` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user_projects`
--

LOCK TABLES `tbl_sys_user_projects` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_user_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-02  7:37:37
