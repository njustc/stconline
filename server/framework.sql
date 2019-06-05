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
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('15002',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','15001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('15003',1,'/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','15001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('15004',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','15001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*¡IDATx\Ú\í\İ\\u/ğ¾µ\\\ÜB)\ËòR–%EQ¥\ëuq-£î¢•\å‘LŸtO&ŒF1\È\ë’Mna%»(°\n\×EŒ®@BL! b$€0\Ç$¼’dB’sÿ¿±›Û„L“™\î>ŸOÕ¿zú1==¿3óÿÿyüÏ A½\Èó|ÿA\0\Ã\Åÿµ\ä\é\Ôñ‘\Úa7/\Ì_8÷º9›ÿ\ïO|~Ü,?ûª™[\Ò\ãY¼\î\Â\Í\ëN_¯‹\çk\í\ì«gm­]\íı¶ı9\ç]7wj4˜\ÔaÏšô“E¯\çögŸ½ğ‡ó^:û?fmı??œ\×}\á\íŞœ\çÔ½\î\ë\æ®_ıew-_ğ/7-\Ø8ö¦ùÏ¾z\æÖŸ/ÍŸK\×=™\ç\ßôx>µöºZûöÕ³Şˆ\Û\Ú\ë\0hŒ80µƒS›ÿ…7>¾ñü\ë\æ¾q\íC[W\Ämzü}õ¯_¾9\ä\âŸ=³nü-7D`|ûš¶œs\Í\ì	|f›÷ı\äº<??\Ú-ó;ÿ\å¦ù+\ã\ë\í\0 QÀ¥w¾øZº½û¢Ÿ<³\î\Ü)l¹ğ‡)~4¯ûû\ÓÖ¼tÁõoŠ\×\İ4ÿe\\ÿ»M\éu—şûÿ<ÿÊ¸[\ØzŒ~0c\åK\çN™½!^}Œ(ª›Î¸ü7/=\Ï\Éó\ï\ÏØ˜_£\â\0_ş\Î=¿6\İş{l\Ûs\åŒü\Ük\çlN÷\ç¦v\íwµ\ê•\ê\ëş\×9yü}÷Î§\×ü\Ë\Í6DÃ¼|yz\ì¢q·.|±6ªˆ¯«£‹÷;e\Îúxü{¿Zı¨\Í@\0\r\èœ)¬Oô\ßşY[\Ó\Zı\æ1W\Í\Èÿó\á|\Å\Ø=¶*:\ï\Ú\ë\" \âÈ¡s®™\İ}ÉK\×\Ä6ş\Ø\\tİŒ\çW×¿.Ş¯öõO\åw\Äm5u\Ğ`#C¢#\â\Õü©´ªşdl\Ê{\ãü}·=•/}<Ï¿W[Ã¯¾ñƒikb”ğ¹nøİ¦±7>\Úı½©+¯{\İşµQAõş\çR\ï?\áük|]µ\Z+\0ÎŠº\ãnùÃ†k\È»8\Ï¬\Íó\Ç\åù¤\×ò|^lJ¯¹5µÿ=ş\Ö\'\×\ÇN\ày}E\Z6<¶1=Ù¯V¼zõ\Ìu«~¶hı\Òôšo¥ö‘„¯ş÷Ÿó\ÛV\äù¸»ºò›\â0\Òÿ|(¿§ºSø*\Ğ!ò„82(:\íI?}f\İ\åÿó\ÊËµ\ãÿoy:\Îı+©İ–\Ú=qT\ÏÔ•ùs18\ïÚ‡Şˆó	j-=w^j§¾œ\ç\Ö\Ş\ï;w<»h\Âm\\RNA\ìƒPy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0úJ\ç\Şs\Ï=¿¸ú\ê«\×M<y\ë9çœ“wvv\æÃ‡\Ï;::ò³\Ï>;?~ü¦I“&½8zô\èo«@X¶lYû-·Ü²\æ[\ßúV~ú\é§\ç7\Şxcş\ĞC\åË—/\Ï7lØ‡M›6\å]]]ù#<’\ßz\ë­ùi§–Ÿy\æ™[Ç{¹\\>Xšo\Íÿ\à3f¬>ë¬³ò´\æŸ/X° §³\ßU.\ÌÓ¨!?\å”Sò4j˜¤¢\0M´öÿƒü`\ë˜1còùó\ç\ç{\ãé§Ÿ\ÎGŸz\ê©+;;;T]€¶v\í\Ú\Ñ\ãÇÏ¯¼ò\Ê|Íš5y_ˆ\ÍFñ~gœqÆ«64ğ \à{\ßû^¾yóæ¼¯M™2%F/<x\Õh ± 6\Å\Zû¾€š\ïÿûùˆ#Wq€;c@_m\ÚÑ¦¡\ÓN;mk¹\\£\ê\0\r 6\ÅQ@qPˆ\Å\í\í\í[\ì\0h\0q@ÚŸ.¾ø\âMÃ‡Ÿªú\0(\ÎÁúkPó\ÔSO\åi$ğ†\Ä\0hÚ´i¿Š3÷\å\Î\à\ŞtvvnÉ²\ìK`€\Ä\\@1\Ä@¸\âŠ+\Ö>|¶¥\00@b2¸˜h <ø\àƒ›S,µ\0H\Ì\Z“Á\r„Õ«WoM!\Ğm)\0˜º6h‹	\éb*jK`€D\'<„\0À\0:é¤“r$°U\0 oû\Û¶O ««k“}\0hÂ„	\İut\Ğ=÷\Ü\Ó\å\è €t\ÑE=?P\ç	Œ?~…ó\0\Ğ\èÑ£¿\×ˆ3†c\Úg|l\éï¹ƒ\æÎ›‚\Ì0\ĞÆ÷\Û\Ë/¿¼_C`Ô¨Q+\Ì\"\n\Ğ\0\âğ\ßø\Æ7¶.\\¸°_\à\á‡^£\0\×\0hgy\æø¸°Ì¾¾²\Øúõ\ë·T*•M®,\Ğ`N;\í´\åW\\qÅ¾\ÜI¼5ıŒ®,\Ë«6@ƒ‰´iD°úê«¯\ŞA°u\ìØ±óbó“j4hŒ\Z5ª\ë\ßş\í\ßò\×_½\Ï6q\Æ±#x©ı\0\0M‹¿ù\Íonıı\ï¿\×;c@l2\0h\"±óvÄˆ›\'L˜ğF„Á\îl\"š7oŞª\Ø\ÇP=\n\ÈN`€fk\ïi-şX›9r\ä\ÖÉ“\'¯Ÿ5k\Ö\æ+Vl‰\ë\Ôf\É\à\î½÷\Ş\Õ1Dœ	œ`ó@‹HzGj\ÓS{>C\\8¯kİ±\Í?µ¹1„3ŠùÄ‰ß©\0\rQ£F \0\r¶¶¶¿Q	€b†ÀV;\n©}T%\0\n\ZY–}\\%\0\n¨\\.o:t\èa*P\Ü8R%\0\nhøğ\á›\Û\Ú\Ú>­\0\Å¸XügU  !P*•V	€*—Ë›†\röe•\0(ft·µµı£J\0\Ğğ\á\Ã7–J¥!*P\ÌØ\Ú0•\0(f¬/\'*P\ÌX›Q	€b†À\Ú\ÔşY%\0\n¨\\.¯I\í›*PÌ‘À«©¡\0\Å	¼’\Ú•\0(\æH\à¥\Ô\ÎU	€bV—J¥U ˜#®\ÔÆ«@1C`E–e“T ˜!°<µKT €\Ò(\à…J¥r¹J\0s$ğ\çr¹|…J\03K\í*•\0( ,\ËW*•)*PÌ‘À³\årùz•\0(fü1…ÀT ˜!ğTj7«@eY¶0…Àm*P\ÌXB\àv•\0( \0óSû¹J\03M\í*P\Ìø]jSU ˜!07Ë²»U ˜!ğ@\ni*P@\åryV\n*P@\0*P\Ì˜›„T ˜!pw\ìV	€*•J¿*—\Ë«@1C\à®óT ˜!ğ\ß)W	€Ê²\ì\áÃ‡ÿ^%\0Š?I!ğ„J\0P\n€[R{R%\0\n(.-—˜T	€b†Àõq±y•\0( J¥2%Ë²\Å*P@ipUjÏ©@•\Ë\å+RüY%\0\n¨R©\\e\Ù*PÌ‘À¥i$°L%\0Š9¸(V¨@1C`B\n.•\0(fŒM!°J%\0\n¨T*?|øğ—T ˜!pv¹\\~Y%\0\n(\ÎH\íU•\0( 4\nøfjkT ˜#Nm­J\03:R[§\0TNR¬W	€b†¥¶A%\0\n¨R©—e\ÙF•\0(f|5ºU €\Ê\åò1)6©@1C\àB\0  b\'pjùN\ÚR•h\Í5ÿKw¥R\éx•(\æh\àyhaY–M\î-\Ú\Û\Û3hı\ÑÀ\Úí„€\ËL$\Æm\årùt•(N¼V®.P$i\ÍL\İ(`ŒŠ\0t4 \0T*•.\0û@\çû/^¼x\éÜ¹sóû\î»/Ÿ6mš¶múô\éùı÷ß¿5µ)şª€¦0{öì¼««+\ï\î\î\Öö¢­Zµ*Ÿ9s\æ\Ö“ıeM!F\0 oƒ L{\r4‡\Ø¤ó\î\Û›‡üeM!:,·\0„ÀÛºW—\ç‹¹1_8ı;=-¾\ÇtúB\0hñXûÊ‹ù÷Œ\Ïÿ\ëó\Ş\Ò\â±xN\Ç/€¥ù¶\0¨µN\Õñ •C\à©\ß~·\×ˆ\çtüB\0h\áxb\Ú\Ä^C \Óñ@hB\0h\Åˆ£zxN\Ç/€Es®\î5\â9¿\0Z8^zqAşÄ½Ş¾)(=\Ï\éø…\0\Ğ\Â!mÉ¼›\ßñ˜N_\0­7\æ‹œòöMA\é±xN\Ç/€\r8#ø™9WõºO sÖ°\0Z-\Ò\ZşòE3ò?\Ü=¶\×\0¨µxM¼Ö¨@\0-;[û7*@‡À®¬ı\ïhT „\0\Ğ\Ä!°§PkB@\0Mš\0„€&\0! 	@hB\0š\0„€&\0! 	@@K½§5\Ú{	 \åC \Öiö\Öv\å=\æÌ™“ò“Ÿ\Ì\ßó÷\ä\ï}\ï{ó#<²aB`o\ß[\0…	\ìi‡y\Øa‡õ|ß‚òU«V\å£GĞµ÷¾|o!\0>–-[–>¼gM?\ÚĞ¡Có+V¼ùü»\Şõ®\ï{ú\é§÷h\í|\Û\Ñ\Ç\á‡ş–÷\Úöù\Úh\ã\Ãşp\Ï\Ï>ø\àƒó\Ûn»\ímï½§#!\0º\ßy\çù]w\İ\Õóu©Tzóùc9¦\ç±è¿ô¥/\å&L\èÔ¿\ï;\Şñ†@ıû{\ì±o{>:ú%K–¼yÿ¦›nzóş?øA›ƒ\0!°/B \Öş\ãñ\r6ô´ø:«=£‚/¼0?\âˆ#\Ş|£>ú-\ï[ÿú\Ş:\êú÷µı\í=¿½û0Û®ı@ôSÔ·yó\æ½9*¨\ß\Úı\Ú÷\ïI\ì\Ê}!\0}¸9h\êÔ©o\Ût\Â	\'\äs\ç\Î\íùú±\Ç\ëy>Fµ\çcSM<¶hÑ¢ü\æ›o\Ş\á\æ \ÚûoosĞ„@-À\ê÷a@\ìFDZ¿c8¾Åµ\ç;î¸>\Öö\ãù\Ø4şü7Ÿm÷øÀz\İI»\í\ã \Û\Û1¼\'!0yò\äQ\Å ;†! 	@hB\0š\0„€&\0! 	@hB\0š\0„€€\0B@\0!\0 „\0€\0B@\0!\00@\î»\ï>·\0Šjö\ì\Ù[ºººt\Ş}\Ô^x\á…\çStû\ËšÂŒ3.™9s\æÖ•+W²\Ó^³fMŸÀô\é\Ó\ßHm²¿, i¤NkRZ{]›1\Z¹\Å%*ûòı~ó›\ß\ä#FŒÈ¯ºêª¾z\Ïn\0°T/^\ß\×\ïùz¼o¹\\^W©T¦<x•(HdYvw¼o­¥0\Ø¥ÛƒU \ÅC uö§×‡@]Û’\Úô‡ª<@‹†À\É\'Ÿ|H/!P\ßf\ÛLĞ‚!P\rl\ê-\0\Òs[R£ú\0-\Z\é}—ö†\röe•h\í˜¹\0x\Ã\Îa€b„@\Ç6pOŒ*•\ÊOU \ÅC ³³óÀj\ç¿5µqñX\Z|¡z„\Ğ7T …C úŞ‹¶\İşŸF\Òã›³,;BõZ8vğ3›Ú«(`$û¥Ÿ»2µG-€\â…@í„²˜N\âJK `!Pı\Ù\Ã\âÄ±R©t¼%P°i$pMŒRû¨¥P°¨Áüô9–§/÷³D\0\n£F: \\.¿–\Â`š%P°•J\å“qş@ºk©\0,Bõ:1\Ã\è\ç-€‚…@õóü<µõ1í„¥P°¨~¦%1å„¥PÀ2d\ÈA1\ãhj·YB\0P*•¾û²,;\ÅR(X„\0“âˆ¡ööö\Ã-)€‚…@(—Ë³R{ÅŒ£\0‰\'¾3}Æ®4*x\Ä\Ò(X„\ÅüBiDp…%P°\í\í\íYu\Æ\Ñ!–\Z@ÁB dYvmú¼\İ#Güˆ%P°¨Á‚ô™—\r2\ã(@ñB :\ã\èšô¹\ï±ô\0\n\Õ\Ïü©8 µ,A€‚…@È²\ì¬\ØQ<bÄˆ\ÏYŠ\0B\à\Î¯›q €!PıüÏ§öGK €!\Ğ\Ñ\Ññ¡êŒ£·Xš\0P.—©^‘\ì\ë–(@ÁB T*•‹\Ò\ïò\ÆĞ¡C³T\n\Õ\ßev\Z\r¼\Ü\Ö\ÖönK `!3fY¶*ÁÃ–,@ÁB ¤øxlJ·“-]€‚…@(ÿÅ–ô»}\Í(XTƒ\àúÔºO<ñ\Ä[\Ê\0\ê\ïöDj/Z\Ê\0¶¶¶÷¥\ßom–ew[\Ò\0j|:f-•J\ç[\Ú\0\ê\ï8:v§Ág-q€‚…@H#»\Ò\ïº\î\Øc}¿¥P°¨ş®f(jÄŒ£Y–mL¿óÍ–<@ÁB ¤øJ\Ì8Z*•N²ô!P°¨şÎ—¤0ˆ©%õ\0bş\ŞsR{ÉŒ£€( ˜q´\\.¯N£‡ü\0B €:;;?Qqô{ş\0!P\Ìß¿\'’U*•¯úk\0„@•J¥¦:l4\ã( \n*Ë²…©½ €( ÚŒ£\årù×ªjooÿLœH–‚\à\Õ\0„@•J¥³#R;J5\0!PÌšL5\ã( \n¬\\./MµyJ%\0!P\Ì88M\í&\Õ\0„@µµµıcœH–jÔ¡\Z€(f}.3\ã( Š]£¹1\ãhL:§\Z€(˜˜n:B \Â@5\0!P@±9(6\Å\æ!\Õ\0„@1k\Õ;Šc‡±j\0B ˜õº)CHUÅ¬\ÙSq2™J\0B €b:‰˜V\"¦—P\r@³nG\ÅDs1\áœj\0\Í\Òq­ˆN\'mJíš˜r:‚ ¦ V\r B cg!e\Ù$•Ú­ øu\\Œ&.J£\Z@3Áª„À\ÚÁƒ\ï¯J»\'.K—§T	 ©Gi­öR\Ú}qúT¿\î¸`½j\0\Í\Û\Û7°\Î(`\ÏU*•¯Vg­¨\Ğt£ûú$.Oµ|£³³óª4z,3\n\è{)LJ#‚\Õf\Z½³:¥.Æ©Hß¨›qtj\0>\Z\è\Ù7`\Ğ\ç{hlJ\í\Õ\0\Z9:œ1¼o”J¥“\âD²_Q\r(˜<\Ï÷_¼xñÒ¹s\ç\æ÷\İw_>m\Ú4m\Úô\é\Óóû\ï¿kjSš4doN!°±££\ãCş+ @\"\0fÏwuu\å\İ\İ\İ\Ú^´U«V\å3g\ÎÜšar“ÁS{\ŞHŒ\0@\ßA\Zt7\ã\ßBm\Æ\ÑR©t—ÿ(ˆ\Ø¤ó\î\Û›‡šõ\ï!Ë²\ÏVO$\í¿\n :,·¨—F\ç§\Ø\Ü\Ö\Ööiÿ! zÚºW—\ç‹¹1_8ı;=-¾\Çtú­\ÕÁ\İf!\Ğ\ÓÖ¾òbş\Ä=\ãó\ßÿú¼·´x,\Óñ·^„/¦ö„ÿ(x,]øË·@­½°pª¿EC f-—\Ëİ©]\ï?\nOıö»½†@<§\ão\Í¨¾;ŠS+ûo‚†À\Ó&ö\Zñœ¿uC dY69¦–H·÷B@,ª#‚ß¥Xe\ÆQ(`\Ä\Ñ@½…@<§\ãoıˆG\Ë\åò\Ë)fû¯‚…À¢9W÷\Zñœ¿õC :ô°\Ø,T©T.òŸ\n—^\\?qï„·o\nJ\Ås:şb„@H£¯ÇŒ£Ã†\rû²ÿ(HD[2\ïæ·…@<¦\Ó/VTƒ\à\Ö\Ì8\nE	óENyû¦ ôX<§\ã/VTƒ\à3BB \Î~f\ÎU½\îˆ\çœ5\\¼\è\ì\ì<0Ë²\×S\Ü\é¿Z1\Ò\ZşòE3ò?\Ü=¶\×\0¨µxM¼Ö¨ 8!FŒñ¹8‘,…ÁYş“ …B`gkÿFB føğ\áÄŒ£©}\Ê´H\ì\Ê\ÚÿFB`Z¡®…œ\à\Ş4\"X3jÔ¨üGA„À@­	b…@²_\n‚eY–-ğ-š\Ø]#GüH\n‚\î\×ú¯! \n¨R©;Š\Û\Û\Û3ÿY „@¥¸\"6utt|\Ì!P@Y–=’‚ ËŒ£ „@\r<xÿ4\"x%µYş\Ã@joo?<\ÎH£‚Iş\Ë@bn:%f-•J_T\rı\ÒÒ¯\ÔÓ„@cH!p[\Ì8:dÈƒTZ jlomw\ß\ã]\ïzWş·û·ù}÷\İ\'Z7¥¶D% \ÅF{\Ú\á\Ö\ß\ìÙ³{¾ş\Ø\Ç>fsP‹ŠGS¬O\í\çªeË–\å\é>\Ï{\Ş\ÓÓ†š¯X±¢\×ï‹¯\ãuµûñÚ‘#G\æõW\Õóø1\Ç“/Y²$é¥—z;ô\ĞC\ßòó\âş{\ßû\Ş|ÕªUo{\ï\ŞŞ«öü?øÁüø@\Ï×“\'O\îùŞ¸ûı\×t\ĞAB ”\Ë\å\Ï\Çşt{ºj@‹‡@@<~\çw\æw\İuW\Ï×¥Ri»\ß7kÖ¬¯¿öµ¯½ù|Zs\ìylÎœ9ù“O>\ÙóõQG\ÕóÜ˜1cz\îÿ\æ7¿\é¹\ï½÷öÜÇ·÷™vô^Ñ;î¸\ÇÖ®]›q\Ä=_\Ç\ík¯½\Öóõ	\'œ úH¥RG¥\ÛOª´p\Ä\Zw<¾aÃ†¶\íšş mö#Ä¦ ?ı\éOoûşúöw¼\ã/½_´¨\ç\ëø‡\è¹·q?\ß\Şg\Ú\Ñ{E»ğ\Â{?~|\Ïí©§\Ús;iÒ¤\Ûx^ô,Ë¦¥\ÑÀkf!\Ğóõ¹\ç\Ûóõ—¾ô¥·}¬o\ï\ç\Æ\æ¥x¾6\nˆû½}¦½\×\í·\ß\Şó|lö9\äCz‹PŠûñø\Ï~ö3!Ğ·b\Æ\Ñ\å)\æ+`s\ĞÔ©Sw¸9(6\Ã|ğÁ=÷kG\Õ6\á\\pÁ\Ûı¹µMHµ\ï‹M=½}¦½WŒ j\ßó¯ÿú¯=]v\Ùeo>V?B}#ı}|4\æJApj@†@ìŒ­\ß1_\Ç\Î\âŞ¾/:ß¸ô\ÑG÷ÜÀ§Ÿ~z\Ï\ÛA½~\Z‡•\Æcÿ÷¿\ÃÏ´+\ï;•\ãP\Õ\Ú\Î\ë\ØÁ÷\ãqG\íi¥\àø˜q4ımS\rh\ÒĞ„À\ŞH#+cDpò\É\'¢\Z „@17\r=š\Ú\Êô\å~ªB@L\Ì8šB\à\Õ\Ô~«\Z „@17Q=`‚j€\Å\Ü,ô\ê\Å_P\rB €\ÒH\à§1\ÇP[[\Ûß¨!P@i$ğl–e‹U„€( ¤XŸ\ÚªB@P©T:ºzE²SU„€( \ããˆ¡¡C‡©\Z „@1ƒ\à¾8‡ \Î%P\rB xb\Æ\Ñ\årùq¥\0! \n(\æJ!°)…Á\rªB@P\n\Ûc&\ÚN8\áP\Õ\0! \n$uş7U\Ï$>K5`¨]\ÈE&Ë²1\Õô°aÃ¾¬\Z°Ì={KWW—Î»\Ú/¼ğ|\nnY{®­­\íİ©ó2…À\ë\í\íí‡«\ìC3fÌ¸d\æÌ™[W®\\©\ïƒ\0˜>}ú©Mö—µ\Çg¯HmU¹\\>XE ¤NkRZ{]›1\ZµÅÁFş|\Õ\Ö-\0ö\\gg\ç\'\Òr^›Ú³\Î\r\0\Ş4q\â\ÄwV/^O‹JkıŸO­;-\çUx‹Q£F Z:\0\ÊÕ‹\ÊüT5€\ím&8P´¦R©t~š\ÚeªlWGGÇ‡„@\ëÉ²\ìš\ê9\0§«Ğ«O<ñÃ©³Øª­#uü¿N!ğFZ®_S\r`‡bş˜\ÔaP\İ\É??µ\r©}JE€ŠC…@ó;ö\ØcßŸF\0KS{9ÀGU\Ø%C‡=,u[T¢¹Gsqm€Ôokk{ŸŠ\0»G\n\æ\Õ\Ş\Şş™\ê\æŸG\Ó\İıT\Ø-i\Íñ\Óq¹J4ŸJ¥r\\Zvo¤ÿ¥j\0{$u\"G	\æ“e\ÙY\Õs\0®R\r`Å”±6©M\0“«\ç\0œ£\ZÀ^)•J_Œy\åU¢iBûg1rKAĞ¦\Z@_t*\Ç¦°_\êøJËª{ÄˆŸS OT*•¯FÇ¢+&ùK°8ök\éö\ã*ôe—:–*Ñ˜ª\Óz¬NmY\\FE€>•:—aqœ¹J48‡#-›õ©=SB¨\Ğ\ç\Ú\Û\Û\Ó@ [¯%-“¯\ÄQ[\évšj\0ûL¹\\W‰†\n€S\â,\î7¨°¯C\àë©³Y§¡R©\\T\r€ñªô\ËZg\\€\\%^Z7W\Ï\îP\r _”J¥S\ã\ĞC•ğ\0˜™–Ã¦8yO5€ş	\Ä4¯ª\ÄÀhkk{wZO\Ç&¹˜\Ö[E€~•\Ö>Ç¤öŠJô¿!C†”:ÿ©uÅµU\èw©:7µ—T¢\ßG`‡Æ¾˜À\Ï<xD©Tº0uD«U¢_k~tLÕ‘\Úl\Õ\0z$0>6G¨D¿Õ»³€¦v›j\0\Ğ)MLm¥JôÏ¨«z\è%ª4„r¹|qê”–«Ä¾•eÙµ\ÕÁ|S5€F\Z	\\–Ú‹*±O\à\î˜(¦\íV\r ¡¤\éò\ÔI½ }/fşLÿ\ïc&\ĞT\çOª\Ğp\Ê\åò©“ú³Jô­\Î\Î\Î#\\Sm_9r\äGThH©“º*µ\çT¢\ïttt|,\ÎÂº¶µµ½OE€†•\ÖV¯I£%*\Ñg¡zTjS]Iw÷S \ÑC\àºÏª\ÄŞ«T*\'\Æ9\0©wª\ĞJ¥\Òc\ê•\Ø\ëÀ\è\ê! \ßW\r ™:¯›Rû£J\ì¹\ê\Îõ€1ª4[Ü’Ú“*±\Ç#©ÿM@±)H5€¦“e\ÙOR\'ö„J\ì¶ıR\İ~W\İ	üY\å\0š5\îˆšTb\×\ÅaŸ©fKR{-U i¥\ì\ç©\ÍW‰]\'~\Åõbª8!LE€f_¤ö¨J\ì\\LıFN\ëS[SB¨\Ğ\n!05¶m«ÄµµµıcL—\Ú=ª´Œr¹ü\ë´fûJ\ì0(¿‘\ê´%N¬S\r \Õ:¸{R{P%z­\Ï%\0•Je¬j\0­\Ø\ÉMw­\Û^GI·V§¡\Z@KÊ²lF\ê\äf©\Ä\Û\Âñş\Ô6¥\Ú|A5€V^ÛA 1xğ\àıc\Z\Ô\Ö\r:ô0Z}÷\ÓT¢\ç:\0Jµ\èJ5Y9dÈƒT(B\Ìu\Ø\ã A±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•J_L5\Ød\ßP\Äx$u~¿,\ê\ïGş\Ä@1›ª¿ ˆ!ğXQ¯„•:şqq@jûK\0\n)&‹I\ä\n8¸> \ÎöW\0y$° u„·,ø\îy€b> @\ÑC`a\êo+\Â\ï\Z3¦\ß÷1\èĞ¡C´ôÂ‹KKa§h\Ìı\×\0ˆkœx\â‰¶\äşqv\ìM­ü;\ÆÕ¿\Ê\åòk©-5j\Ô–:ÀÿE©\İĞª¿_\\ÿ7®œ\à\átw?K N\êŸm\ÕyòS\ç?¬zÀ\Ï-i€\í‡À’×´\Ú\ïU*•\ÎNÿ–tû\ï–2@\ïk\ËÏ§¸²•~§ø}\"\0Rm	\ìx$°´•Ö–S\Çÿ‹\Ø”~§\ã-]€¯5¿P©T.o_e¿hó\Òï³±½½ı3–,À®­9/K\ç¥\Íü;´µµ½/6k¥ö\ê\É\'Ÿ|ˆ¥\n°\ë#i$pQ³~ş‘#G~$uş/§¶ô\Øc}¿%\n°{#•©Ml\Ò\Ïş©\Ô6¤ ›SBXš\0»ß‘®Š)•›ğs-&K\í,E€=\ïLW§vA3}\æR©tjZ©T¦X‚\0{/¥vn³|\ŞØ‰]=\àK`\ï;\ÕWR\ÓŸ5Ë²Ÿ\Ä9\0\éó–-9€¾	¼š\ÚMğ9H­»T*m©ô\İH\àµ\Ø\ÆŞ¨Ÿoğ\àÁûWg:]›F‡Zb\0}»†\ë)ø\Ù:::>T=ziÅ!C²´\0ú>Ö¥‘ÀIö¹\Ú\Û\ÛÏ–\ÚSmmmï¶¤\0öM¼Z¥‘>Ó°aÃ¾œ>Ó¦\Ô~k	\ìCq\Ñõ´Ö5\Ê\ç‰QIZ.—l\é\0\ìû‘À†J¥rbƒ|–ñ©óß’‚i’%\Ğ?\ïÆ´ö=¤F\0?Œ\0HŸ\çŸ-€ş\î4ø\ê\0†\é± \0¾b‰\0ôo¼)­3?;úIÿ\Â\Ø9n°4\0&¾0\0ğ7\ég/O?{uj[\0o¤Nøóıù3\ÓZÿ\Ç\Ó\Ï\\“~öŸF\Zu€¥\00p!°9µ£ú\ë\ç1\âs±\"µ¹\é\î~–\0@ÿuøq\Ş|\'­»³³óÀ}4h‹\ĞI·wX\Z\0ı,\ÚY\ì«µ\Ä5ª‚¹Ü’\0¸\ÑÀ¢\Ş \\.oŠY;÷ÁÏ¼ªz!˜3,€\r\ì‹Q@\n–_\Æ\Î\çô\ŞÇ©>@È²lñööôñ(`¿ôs‹i)\Ú\Ú\Ú>­\ê\0\r¢T*¿m¤ûÊ¾zÿc=öı\é=ÿœ\Şó•tûQh0©s^V\0¯÷\Õ( :ı\êu‹—F¨4@Š«‰\ÕB .\ê‹÷Œ\Í>±ù\'À\ã\'N|§*4öh`E„@Lá°·\ï3‘¦`y#\İşJeš#:N<ñ\Ä|o\×\ÚÓšÿ\é\ÕC@¯VU€\æq~jyj{|—´öÿ½€48_9š+\0¶¦öXõv·ƒ uş·\Ç4tyJ\0v=\0jÿ¸\İ\r‚˜\0®\\.w÷÷¤\0ôm\0\ì\ìñ·ˆ©ŸS\Çÿl–ek:;;?¡œ\0\Í\0\Û>?n{O\Æ\Å_R\ç¿*.\ÓG\Ğ8P³\İMCqù\Ç8©,.—…TN€\Ö€ú \ØR\Ä5ˆ\ã2”©İ§”\0­\0õß·\åğ\Ã¿+MAğ#¥(F\0ôxÿû\ßÿú§\Êÿ\î\ïş\Î\0 \É ®\ç{ı _\×÷-¯;\à€.Ù›  1\àƒşrvğw½½n‡G\rĞ¸0¨ºfŸ×µ\íA}\0\Ô\Úu;y_\0\Z<\0z\ë\à\ëƒ`g\Ï\×\ìö™\Å\0l\0\ì,Ş¹‹Pÿs¶€\æ	€A÷nÀ¶A`@“À‚`w Æ¦!€vHµó^¸›\ß÷\Î\íŒ\0º«ï»«\ß{ˆE0°#]\İ4\Ó\×#K-€\Æ‚ş\Ú\'P›[È¦ €&	‚¾<:È‰c\0\r\Z\Û;j§¯\Î\è\ä¨ €†6n;k\ê}y\Æğd%hüÁ¾˜;H\0\04Ùˆ >®´k³ˆÖ¿\Îù\0\0M<\"Ø›mø\0 \ÅF» \0 EF»Ó¡\0€\ìÊ¦¡AvrDPÛ‡ \0\0\n\Û;¿\0€‚qu\àL`€©­ù\Ïd6P€b†\0€‚ª†\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0B\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0! \0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0B\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\04n‡¿\":ı´u*Ğš!Ğ±³È²l’J´n¬\ÚA¬<xğşªPÀ\Ñ@¹\\¾T…\0Z?¶·o`Q\0@AGö\0+–\0TZó?¥.Æ©@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\ì\êa¢\İ\Û\ìØœ\ÚK©Í­T*S:;;T5€&7t\è\Ğ#S\Ç>3u\ì›v\ál\áú\ÃE·dY¶0\İ~^šp\Í?u\âw§\Î?ßÎ¿—6\×\È\0 I6\ì\Ëi\r~Ã¶ùé§Ÿ_w\İuùC=”¿ø\â‹ù†\rò·]]]ù£>šÿø\Ç?\ÎÇŒ³½\é$Ö—J¥\ãU \ÅQ?\í\í\í[\ê;ğó\Î;¯§ƒß¼ys¾«\æÏŸŸ;v\Û0\Ø\ê|€€ú\Í?)ò©S§\îVç¿­»\ï¾;\ï\ì\ìtb@#‹M@)\0¶\Öoúy\æ™gò¾ğ\Üs\Ï\ågu\Ö[F6\r4ˆ\Ø	\\¿  ¶ñ÷¥x¿ú ˆ}v4€8\n¨~P_\0¶7\"\Øf\Ó\Ğ\ïT`\0\Åy\0õûbÀ¾û\ê÷\Äf(K`€Ä‰`õGmÚ´)\ß\×.¸\à‚ú\ÍB-€û\ê\Ï\Ã@ûÃ‚\Şrfqj[\Z\0ı,Õ¬\ß¼7‡‚\î®ú\Êb®!K ŸU\'ƒ\ë\éˆo¸á†¼?\İz\ë­o™V\Â\Ò\0\èÿxó¢ñ1DŠMOu›„^±4\0úY\ê|\ß\Ü°|ùò~\r8o ~\ZjK ÿGovÄµ\É\àúKü¼úŸoi\0`!\0`$ \0‚}\0\Å	8: À!\à<€¢Jk\à—\Ô\Ã\ßúÖ·œ10b\î \Øo\î €‚Š9ı\ëg\í\Ñ@ıµ‡\Í\"\n0€\âzq¹G\×\0(\îh`v]Yì¤“Nre1€F\×úkş\î\ëkŸyæ™®1ĞˆJ¥\Òñõ›…\"újD#€ú\0ˆŸ?O\Õ\Z+Î¯‚\Ø4ûöfgq\ì\ØfPŒ&©6@Aí¨¡ùó\ç\ïöa \ãÇK\ç\ï+\0\0\Z?¯\ßGP¿‰(\Î,~\ä‘Gz\æ\ZªM:·±\Í?‚\"\Î®?¬~€M@\0M\"v\Ú\Ö5´—\íwv4¡8 ­\Å?Vfñ®´88N«T*_UE€&SLT\ç\ZŠ\ÑÁªúi¨\ë¦x%&ƒ‹¹€L\0\0\0\0\0\0\0\0\0\0\0Ğºş¨\Í!W¥şQ‡\0\0\0\0IEND®B`‚',1),('15005',1,'/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','15001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0\0\0F_#Á\0\0úIDATx\Ú\í\İTõ½\'ğ\Ô\ÍC½IUÈ­\äZ÷Z[©\ìİ¤n¥¬T6©T*)+¡’J²\Ë<Dº§g\'\ÑA\ÅÁG(YY‚\Z5‘”D‰hb|D6F“6W‘‡#¢b\"¢øB!^\â 0À\Ì\Ùÿ¯/\ã¶À \Ó\İsúó©ú\ÕtŸnzNÿs¾ş\Îó]\ï\0ú—eÙ§\ÇN\ß3vjû\î¶\ë\ê}\'Ÿ\Ñv\í\Ü\ÌHP‹+Fõ\Õÿšş\ì¶4\í\ßû{ÿ‚,›r\ávß±,»\ë0\ï{„\0Uu\Ñ\r\ìºôÎ—·¦ú@ª¡D¿z4›\Ù\ßû/½\ë¥em\×\Í\ÍŒz_w\Ó\ã¯Y\0TM„\\²0\Õi©®wÓ¢\ÍH\ç_?\ç53·<\Ö6µ½7\Ş3»+»¡\ïı}u\Ç\Ù\Êx\ï~õè®±×µ÷\ÌÏ²búU÷®Y’¦Ï®|\ï3Yvešv\\\Ûue±Y´òµ\è-	\0T\ß&\Æ\ÊJn½õ\Él\ÆeXŞµ\'¼®:÷õT±?/\Ş3e\æ\ß7¥\Ç_Œ\Çñ\Ş[–¼¾\æü_\ÎÛ™¦ıö\Ú\Ù+7V|\ÖÍ©¾ß·ó¿\ï~eÜ¯÷\ê›7¨š­Yö£ñ·,\î\Ü€C\Æ\ßú\ä\Øty\á»\ÆN×»w FG6ñ÷Ï½qı\Ã\ÙC±94‚0\ŞûpoöÂ´G²9S\Ú\Ùñ\Ò\ë\Ù\Ò§ul¿wev{¼ÿ\îü_\Î\ï)w‰×µ¿õ3S\×g)\0P—Ü¾tû\Í\é^³g\Ş{nşkw\ê\Ø:z*:µŸ\ÄQšË²lR¼?ö\ç]ğË‡{b3h„\\t‚ñ¾kÜ²1Mûc¼÷\Ö%\Ù\êx­\ïwüySöri9ôşó3Wñø8K€ªˆ}qÿûùle_\È]qÏ«[.ÿÃ³[/ÿ\ãŠş³{\Ëf\ÏO\Ç&Ì±¿L`\ê\Ğö\ìûûx\ß{Ÿ|5{vlt~7<¼û¥×²§ÿ7Wş·\Ó\ËA÷\Ëö\Şò¿¯\èö¦\ÌÙ¶À’\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`¹õ\ÉlÆ¸›m®\Ö\ïË²\ì=m\×\ÎÍŒ<\0U•\è;ÿó\Ö\Å\ëªB\éw~}\ÜM¿fô¨f\à}\à\Âv¥ŸŸ=ÿúù;\ÓÏ¯Vvc§¶\ï0{]{\Ï\ÛM¿f\æ–\ÇÚ®{¨7jvWvÃ\Ïÿl¼w\âô\çV\Æûo|$›\Ó\ãq_-È²)–\0\î³^_8ı¹\ìÿ\Ä\ã¦\'³\ìgñøWf3\Ç\ßü\×õ)´¾Xùşş¦O}hg\ÇU÷®Y’¦\ê\Ë|1ıŞ•\Ù\íL{x[šöï©¾\Ù\×MnÍ²ı\ä\î¿?k	\0P­.\ï\ìÊ+jÊœmÊX\ê\à\"¨öş7ıMo\ïÏŠ\é—Ü¶d\Í3Yv\å\ßw\Ü\Ø=ax\é/½´)\Ë.¶\0¨Š¦\Í\ß]Y\ßóeY6\é’\éKW—\Ã-…Vòı}B\ïÀÓ¿¾W¨–V‰n/_ş\Ç\Ï\Ç&ĞŠ÷g)\0P÷vf·\îR\ï\ÛG7wGv}\ß~»=õM`sö›\Ên/ùtlÂ¼ø7Ol¼ô–Ç´‰¿{aEš>$\Şß·¯¯³€A\íg3\Ö=y\ÛSÙ½F€Ü»pÚ‚8€\å$#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\ÎdY6d\æÌ™÷L:u\ë\äÉ“{/¸\à‚¬µµ5kjj\ÊFŒ‘;6›0a\Â\ÎI“&­3f\ÌùF€A\ç\ÕW_m¹ıö\Û_?\ï¼ó²Ñ£Gg·\ÜrKöè£fkÖ¬É¶oß…;wfÙ¢E‹²\éÓ§g£F\Ê\Î9\çœ\Şñ\ã\Ç\Ï/•J\Ç\ZE\0ê½³;v\îÜ¹\Î=÷\Ü,uvÙ’%K\Ê\áv°–.]š¥®0;\ãŒ3²\ÔN2¢\0\Ômw÷‹_ü¢·­­-[¼xqv8şùlÌ˜1\ÙYgµ®µµuˆ\Ñ ntuu™0aBv\íµ\×f¯¿şzv$\Äf\Ğø¼³\Ï>û5›;¨›/\ïg?ûY¶{÷\î\ìH›6mZt|›†z´\Ñ fb^lÒŒl ¯Ï”)S²SO=õ#@\Í\ÄA+±\ïHm\Ò<Ğ¦\ÎQ£Fõ–J¥6£@\Õ\Åf\Í8J3Ğ¬†8¸¥¥¥¥\Çş=\0ª.\ÎÃ‹\Óª\éò\Ë/\ß\Ù\Ô\Ô4\Ã\èP5q¥•8ñ¼Z]^Ÿ\ç{.K\Ş.µ\0P5³f\Íú¿q¥•<x¥?­­­=\ÅbñK€ªˆkiÆ¥\Åj\ášk®\Ù\Ö\Ô\Ô\Ôa)\0Pqñè¸–f-<ò\È#»Sè­´\0¨Š¸[B\\<º6l\ØĞ›B¯\ÛR\0 *\â¶@}wK¨¶¸€uÜš\ÈR\0 *\"tjI\èP5§vZ-;½^¡@Õœşù5Û§\×\ÙÙ¹\Ó>=\0ªf\âÄ‰İµ:zs\æÌ™\Ş j.»\ì²WjuŞ„	\Ö:O€ª3f\Ì÷F\ZU“+²\Äe\È\\‘€j_Oµ¯½¹p\á\ÂØ´\éÚ›\0T\×%—\\ò\Ğ\ÕW_]\Õ\Ğ;ó\Ì3×º\Ë\0U\×\Ú\Ú:\ä?øA\ïÒ¥K«x=öØ†\èò\ÜO€š8\çœs&Ädú\Î\éÛ¶m\ëinn\Ş\é\Î\é\0\ÔÔ¨Q£\Ö\\s\Í5yPKoú\Åbq¹\Ñ ¦â ’\Ôñm˜:u\ê@_\ïøñ\ãÿ\ç\å\Å\æT£\r@]ß™g\ÙùóŸÿ<{\ã7\Ø&Í³\Ï>;\\Yi?\0u|#FŒXş\Ãş°÷©§:\ìƒVb^l\Ò\Ô\áP·\â`“SO=u÷Ä‰wEø\Ê&\Ï\'xb}\ì#\Üs”¦ƒV\0¨Ñ¥.\í®\è\ÖF\Ù;yò\ämó\æ\ÍÛ½v\íÚ¸^\ß\İ\â\â\Ñ>ø\à†¸´X\\i%\Â.\ÎÃ³9€A)…ØˆT³S½’‚p[\Ü¨¢ºcŸ]ª…qi1WZ A˜\r>ü}F€F	½	\0\Z\"ôN:\é¤	\0\Z!ôzO>ù\ä1\04D\è1\âcF€F½b±ø	#@\î•J¥aÃ†}\ÊH\0\Ğ\Ş\î\áÃ‡\ÖH\0{\Åbq×©§úE#@#tzqC\Ø/	\0\Z!ôºS·÷u#@#„ŞT\'\Z	\0\Z!ô¶777Ÿl$\0È½¸\ÛBKKK\ÑH\0\Ğ\ŞÖ¸å‘\0 B¯+\Õ÷\0¹W*•¶\n…³Œ\0\Ğ\é½V,\Ï5\04B\èmJ\İ\ŞF€F½\r©\Æ	\0\Z!ô:SM0\04B\è­-‹“Œ\0z¯–J¥+\0¹—º¼U\Í\Í\ÍW	\0\Z¡\Ó{%uzSŒ\0z+RM5\0\ä^\êò^*‹7\Z	\0\Z!ô^,\n¿1\0\ä^SS\Ós©~k$\0È½b±¸4…\Ş\ïŒ\0\Ğ\é=•‚\ï.#@\î•J¥\'…ÂŸŒ\0¹—º¼E)ø\î3\04B\è=šB\ï\ÏF€\ÜkjjZ\êA#@#„\Şü\Ô\í\Í5\0\ä^^©Tšg$\0h„Ğ››8\0¹—\ï?R-4\0\ä^œ®§-	\0\Z!ô\îN¡÷W#@\î\Å%\È\âRdF€F½;R\è=c$\0È½¸­P\Ü^\ÈH\0{¥R\é\æz/	\0r¯X,Ş˜‚\ï%#@#„\Şõ)ôV	\0r/Ş”¦¦¦WŒ\0\Ğ\éMN¡·\ÒH\0\ĞŞ•)ô^5\0\ä^ssóe©\Û[k$\0È½\Ô\åMH\Õi$\0È½B¡pq©T\Ú`$\0È½x¤No“‘\0 ÷R\à)‹›\0¹W(\ÎJ\İ\Ş#@\î¥.\ïŒ\Ô\íu	\0r/ŞˆT[\0¹WJR\èm3\0\ä^ssó\É)ô¶	\0r¯P(œ”Bo‡‘\0 ÷Š\Å\â\×S\èu\Ç\ã\Ö\Ö\Ö!¥Ré„–––\Ï\0½j›S\È\íJ?{\ÒÏ¬ŸZf¤\0\ÈC\è\İv€°+Wt{F\n€Ao\èĞ¡GG§\×_\à‹Å¥F	€†\èöty\0\ä±\Û\ë\ŞOè¹ƒ:\0ùS,\'\í§\Ëmd\0È¥t[*Bo£ ·Rg\×V\Ñ\åµ\0r­X,¾¡g$\0È½B¡p±\Ğ¤²,;zùò\å+.\\˜Í™3\'›5k–RG¬fÏÍŸ?¿7\Õ4m@\ÍE\àuttdYww·RG¼Ö¯_Ÿµ··÷¦\0œ\ì/¨©\èğªFğ¥Î¯\Û_PS±I\ÓJYU£bs§¿8 ¦bEd…¬„ ô*j\ëkk²\å‹nÉ–Î¾´\\ñ8¦Y™+¡\ä*ôº6¯Î™9!{\ê\Ï½¥bZ¼f…®„›\Ğ[¹ô¾}¯¯V-a…®„Ÿ\Ğ{î¡Ÿözñšºz@nB\ï™Y?\î7ô\â5+t%ô\0¡§”\Ğ[\è\ÅÑšı…^¼f…®„›\Ğ[¶`j¿¡¯Y¡+¡\ä&ô6®^’=ó\à\Ä}7m¦iñšºz@nB/j\Å¿\İ\'ôbš•¹z@¾BoÇl\Ù#\Óöİ´™¦\ÅkV\èJ\è¹½¸\âÊ‹®\ëwŸ^¼\æª,J\èƒ;ôR·f\Ù\Ü\ì\é\Æ÷x}\ï‰÷\êú”\Ğ]\è½]w§\ëSB\ÈM\èLww ®\Ï\n^	=`Ğ„\Ş;\r¼¾²‚WB4¡§”\Ğ„RBzJ	=@\è)%ô\0¡§„€\ĞSB@\è)¡ ôjViø\Ê\Õ\ßs%ô\0¡W÷!¶w½\Ó\Ğ‚Bzƒ¦s;\Ü÷=¡½AzË–-\Ë>ù\ÉOö\Û	V>?”Q\è½ºÛ¼y\â‰\'–Ÿ\ß}÷\İÙ½÷\Şkó¦\Ğ„^~;½c9¦üúö\í\Û\Ë%ô„ ô„\Ğz€\Ğ\ì¡W¹ysÆŒorGuTùùÚµk¯\Ğ„\Ş\àÚ§²üñu K\Ô\äÉ“\ß\ìu|BzJ\è=%ô\0„z\0BO	=\0¡§„€\ĞSBzJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡§„À[Í™3\Ç\nY	= 1tttôtvvZ)«­U«V½’B¯\Û_PSs\çÎ½¢½½½wİºu\rµ\î\ê\êj\È\ß]«À›={ö®T“ı\Å5—VF“\Òÿ…o\ÍOP÷\ÜsOvú\é§g÷\ß\ÕwüÎ–––\ì;\î\È\Ze¼£\Ãx\05R*•V¤šW«\ß\ß\Ô\ÔÔ›*+‹“,\r\02ğ¾—g÷ˆ#ş¹†ó°3BoOğ=ŸºÎZ2\0Dà¼\ê×µœ‡v[úBoOõ¤yº\Ò\Ò\àHŞ”\ÔY½‘şCCo\ã^¡\×\×õ-Oóx¬%Àaimm’BeW\n—³k=/i^\Ù_\è\í©])øF[b\0N\Ğ\ÌL¡·ªN\æe\ÙB/je„´¥À!6lØ§ö\ì7ûr=\ÌO¼\ÒO\ØmMó\Øf‰p8\Õ)L«£ùi\ßO\àm:t\èÑ–\0‡\ÓU\rO\×3r\ä\È\ã\ê(ôfW„\İ\ÂÔ‰ş÷˜Ç˜WK€w,…É¦,¿«³\Îó¦\Øo—\æí„Ši¿Kµ\É\à†\Ë©¶>ü}õ4_ûÛŒóóš‚ğrK€Cr\æ™gşc\n‘¸òÉ¸Á2Ï…B\á\â˜\ç˜wK€C\éò\îIµn°\Íw±X\ìL\İ\Şİ– \0¥µµõ\ãq`Hssó7Û¼\Ç<Ç¼\Çw°$8˜.\ï©\Ô1-\ÌóeIğvq\â\ÃÿÿM§\n@®\åeŸXì“Œ\ïb‰°_{~\ì\Î\ÃÑ}GŸ\Æw²dx‹8\Ï-uF;òt[|—z<\Ï€\Z\Ë\ëM\â;\Õ\Ûe\0¨m0ü—¼^»²¯\n@\r\Å\âv=yı~ñ\İ\ê\é.\0\Ô.ğ¾÷\ÊKÁp|C\ïøzº \05’\Â`u\Ü½¾g\İ\Üù€\Út@\ç¦0\Ø\Õ\Ú\Ú:$\ï\ß5¾c|\×øÎ–<@\ãù‡o”J¥k\Z\å§\ï:%…\Şñ\İ-~€7bM!ğz£}\ïøÎ©~\í¿\0€1bÄˆN¡·;­ü¿×€¡÷½ø\î1şK\0hŒ.\ï‘b±¸¼Q¿\n¾iø/ \ç†ş\ß\Ò\n?kiiik\Ô1H?2Æ ¹¹ù¿ú/ \ç\Ò\Êş÷iÅ¿-\à\Z4ôN¡÷ÿ%\04ÎŠU#®øK¥\Ò	\é»÷º³:@1b\Ä\Çâ¼µ\Ôõo¤ï¾óK©\Úı\0\Ğ`\Ò\ÊL\É\Ø\Ò\Òò\ÉFø¾q\'õ¸™‹O4nğ=œ*\î0û¶K¥\Ò\ÊT¶\Ô\Z\ÔĞ¡CN¡\×U(ş”\çï™º\Ùbtµ\'tÒ‡-u€–\ïKy½Ÿ^EG».}¿»,m\0\âh\Î\ëS0\ì>|ø?\å0ğ~¾ß®F=E€ı‡\Ã\Ë)–\æ\í{¥.vS\êfc	ğ¦“O>ù_Rğ\íLuU‚ü\ÂTİ©\Ë{Ÿ%À\Ş!ñı8¬?…\Ägsò}º\â–B–,\0ı\Å\Ì›ü\ã¿g0ô.O\ßeÛ»\Ü?€şD\ØE\èEø\r\â¯7\É\İ\Ş\Ü\Ü|™%\nÀ\Å\æ\Í\ØÌ¹÷=÷\â°ÿ4\í\ÊzŸÿ4Ÿ\×Æ¦MK€ƒ´Ä-q€KKK\Ë\ç\Ò\ãW\ã–<©¯óÀ~_¼±XŠ\0JÇ´4…Ç¦\èúö^\Ô\Úz\çÔ‰\Şól\ép(\áqlœ»Wv}U·›\r\ãô8=NH·8(…B\áG{6\îxYÜ.®\ÙY§\é]õŞ‰P_\Ş\İû»\Ê:\å”S¾Zoó“Í°qqiK€ƒ\Ò\Ú\Ú:$…ÇŒ\è\èú½ô\Ú\äz›\ï4_ÿ‘\ê\ï– \0‡\ìô\ÓOÿh\n‘Tû¿\Ùõ4¯qc\Ø=W’ù–\0‡~\Ëö\n½õ4¥Ri^Ì£¥À\Ñ\Ü\Üü\Í,\ë#ô\âş{õ2_\Åbñ±)6\Í\Ó	–\0GTœ°g“\ço\ëd~O¡÷´%PY–½|ùò•.\Ì\æÌ™“Íš5K\rP\İÿı\Ùé§Ÿ\İw\ß}\rógÏÍŸ?¿7\Õ4m@\ÍE\àuttdYww·\Z\à\ê\ê\êj¸\ï¼~ıú¬½½½7\àdq@ME‡\'ğT5‚/u~\İşâ€šŠMšVÊª\Z›;ı\Å5+\"+d%ô\0¡WQ[_[“-_tK¶tö¥\åŠ\Ç1\Í\Ê\\	= W¡×µyuö\Ì\Ì	\ÙS¾\è-\Ó\â5+t%ô€Ü„\ŞÊ¥÷\íx}µj\é+t%ô€ü„\Şsı´\ßĞ‹×¬Ğ•\Ğrz\Ï\Ìúq¿¡¯Y¡+¡=¥„0\ØB/\Ö\ì/ô\â5+t%ô€Ü„Ş²Sû\r½x\Í\n]	= 7¡·qõ’\ì™\'\î»i3M‹×¬Ğ•\ĞrzQ+ø\í>¡Ó¬Ì•\Ğòz;vd\Ë™¶\ï¦\Í4-^³BWB\ÈE\è\ÅW^\\p]¿ûô\â5WeQBÜ¡—:¸5\Ë\æfO?0¾\ßÀ\ë«xO¼W×§„0\èB\ï\íº;]Ÿz@nB\ï`º»u}VğJ\èƒ&ô\Şi\àõ•¼zÀ 	=¥„ ô”z€\ĞSJ\èBO)¡=%ô\0„z\0BO	=\0¡W\ÓJCX.c!ô\0¡WWÁõ\Ş÷¾7û\Ìg>“Í™3G\è	=@\è\å»\ë\è\è(?ş\Ø\Ç>&ˆ„ ôò¿	2u\ÔQo>_»vm6r\ä\È\ìı\ïyú×¾öµlÅŠ\ÙÆ\Ë\Ó>ñ‰O¼\åó\âù1\Ç“­_¿~Ÿ\Ï\î\ï³ú^ÿ\ÈG>’}\èC*?<yrù\ß\Æ\ÏxşÁ~0ûğ‡?,ô\0„Ş‘	½yó\æ•Ÿx\â‰o¾\Ş\Ú\ÚZ¶`Á‚\ì\ÙgŸ-?şü\ç?_~­­­­üüşû\ï/?ğÁ\Ë\Ïcúşõ@Ÿõ\ío»<­««+;şø\ãË\ã\ç–-[Ê¿û\İ\ï\n=\0¡wdö\éõm\Ú|ù\å—\ß|=:²½\ßó\îw¿»üÚ²e\ËÊ¿ño”Ÿ\Ç\Ïx\Ó÷zú¬¨‹/¾¸<mÂ„	\åŸguVù\ç¤I“\Ê?\ãu¡ ôH§w\á…–\å+_\Ù\'¨¢\Û\Úß¿6lXùõ¾./÷·\éô\í>\ë\Î;\ï,¿›1?úÑ–§E\Çó˜ş‡?üA\è½#z±Yñ\Øc-?\ï;‚³o“\ä¸q\ãöû\ïû6‰öı»\Øt\Ù_\è½\İgE‡\Ø÷o~ò“Ÿ”§]u\ÕUoN«\ì@…€\Ğ;\ìY\"l\âù—¾ô¥òó8`eô\è\Ñ\åL*7KV~Fœ\æÓ¾ğ…/ğ³\æ³\â ˜8u\"z‰\çq@L<\é\ŞzJ\è=%ô\0„z\0BO	=@\è)%ô\0¡§”\Ğ„RBzJ	=@\è)¡ ô”\ĞzJ\è=%ô\0„z\0BO	=@\è	=%ô€F\Ñw#U¥„{=V\Êj@kÕªU¯¤\Ğ\ëö\Ô\ÔÜ¹s¯hoo\ï]·n•³\Z°À›={ö®T“ı\Å5—VF“\Òÿ…o\ÍO\ê\í«T*‡C«n0\r:ôè¦¦&û¦\0È¿\áÃ‡ÿ“\Ğ !Œ9ò¸b±\Øk$\0È½xÿ–:=¡@C„\Şñ)ôzŒ\0¹\×\Ò\Òò¹z»\0¹W*•NH¡·\ËH\0\Ğ¡÷µz;\0¹W(NJ¡·\ÃH\0{)ğNIµ\İH\0{¥R\é\Ôb±ø†‘\0 ÷R\à‘:½.#@#tz£S\èm1\0\ä^¡P›‚o“‘\0 B\ï\âzŒ\0¹\×\Ü\Ü<±X,v\Z	\0r¯©©\éŠTkŒ\0¹—º¼\É)ôV\Z	\0\Z!ô®M¡÷Š‘\0 B\ï†z/	\0r¯T*İœ\êE#@\î¥.\ïöT\Ï\Z	\0\Z!ô\î,‹KŒ\0¹W(şT*•4\04B§7#\Õ\ãF€F½™©1\04B\è\ÍI5\ßH\0\Ğ¡7?‚\ÏH\0\Ğ¡·°X,>`$\0h„\Ğ{<f1\0\ä^œ®§-	\0r¯X,>\İ\Ü\Üü{#@\î\Å%\È\âRdF€Ü‹‹M\n…\ß	\0r¯X,.onnf$\0È½¸l\ÜH\ÖH\0\ĞŞª\Ô\é]m$\0h„NoM©Tº\ÜH\0\Ğ^g\êô&\Z	\0\Z¡\ÓÛjœ‘\0 ÷J¥\Ò\æTmF€F\èô¶¤\Ğm$\0h„\Ğ\ëJõ}#@®6\ìS©«;!Õ±¡÷Fªf£@®‹Å¥)\à²~ª\'Õ®\Ø\Ü\Ù\Ú\Ú:\Äh0¨µ´´|\î\0¡W®Œw)\0r!\ÛSı^©T\ê\Ñ\å\Ğİ.€\ÜI\áöü~Bo·.€\Ü)\n\ß\ÙO\è\İdd\0È¥r¯VŞ¶¡C‡mT\0È¥b±xFÅ¾¼Ÿ\Z\0ò\Şí­\ĞûÖ·¾õ¯F€ÜˆÍ—)\à.IÕ‘j}ª\î½dIµ1\Õ\Â\æ\æ\æij`Ğ‰K¥ kOA¶ó\íNL\ßûœ½¸‚K\\¶\Ì(P÷]\n­R\Øe‡vı\ÔB\0u\é”SNùj\êĞ¶\ï^£G\În¼ñ\Æ\ì\ÑG\ÍV¯^mß¾=ñ³³³3û\Ë_ş’\İv\ÛmY[[\ÛşN\\\ß§:]\0\êF•\Ù\Ò\Ò\ÒSX]tQ9\Ğv\ïŞ¬Å‹g\ãÇ\ß;üz\Ó\çO2\Ê\0\ÔE\àUn\ÎL\á—Í˜1\ã\Âno<ğ@\Ö\ÚÚºw\×\'ø\0¨Ø¤™¯·rS\æ‹/¾˜	û\Ûß²s\Ï=÷-ŸM\0\ÔD´R¹//ö\ÑIñy•Áûø\Ü@\Õ\ÅQš•›4T‡·¿o¯M}\0ª&\ÎÃ«ÜûğR\ì\ã«Ü¿›U-\0ª\"N<¯<Js\çÎ\Ù@7n\\\åfÎ¥–\0.ö\åU^i%NK¨†%K–¼\å\Ê-©µ4\0Pq\ê@\åÁ+‡sjÂ¡ª<=®\Õii\00 ö\\<º<7\İtSVMÓ§O\Ëe\Ê,\r\0:ô\Ö÷O\\Z¬šbSj\Å&\ÎÍ–\0*…Í›ûóÖ¬YS\ÕĞ‹óö*oKdi\00ĞŞ›Á\Ówñ\èj‰\ßWùû-\r\0ªzµ ô\0\Ğ\éÀ‘fŸ\0\Ô\é9z€†	=\ç\é\ĞR‡ue­®\Èr\Şy\ç¹\"\0\Õ\×ŞŒıi®½	@Cˆ{\ÚU\Şe¡\Z\İ\Şøñ\ã\İe€\ê‹û\é¥ğ\éu?=\0\Z¥\Û\ë¨Ö\ÓO;\í4wN vZ[[‡‹\Åm•µ\ÄytGú¼¼s\Î9§r³\æ¶ø½F€ª+\nß©\Ü\ÌÁw¤:¾\èğ*/~Oü>£@-ƒ\ïG•Á›:c\ß\á\ÜûğöÚ¤]\Ş$£\r@\İ_\ßQ‹/>\ä\Ó&L˜ğ–°‹\Ïx\0\Ô[ğ}§r_\å&Ï¸rË¢E‹\Ê\×\ê\ì»HuüŒ}vŒq¥•\Ê\Ï+÷\áÙ¤	@]ŠƒL*\ê<\Ìz\ÜA+\0Ô½8/ui­¼r\ËÁT\\i%N<onnş¦Q`P‰K–\í¹Vgt\ë+oKTq9±\Íqñè¸–¦K‹\0\0\0\0\0\0\0\0\0\0\0\0\0õ\àÿ\ŞF6’µa¦U\0\0\0\0IEND®B`‚',1),('2',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('20002',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','20001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('20003',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','20001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('20004',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png','20001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0\0\0F_#Á\0\0 IDATx^\í\İŒe½\'p\â_\\5¢1—5fcÜ»\×c×˜¬WmbV7÷†u¥9sf¬@kå¢‚W#†8(z¹«{¥S\Ä\r\ZV Š¢ˆ\Ğ\ÎL¹]ÿ!(\Å\"R@şµüµ”Ò–N\ç\İ\çw:‡{æ™™2@\ç}g\Şù|’o\æœ\ç}\Ï{\ÎiN\æ\Û\ç÷¼\ïa‡\0\0PC§}y\ämC#E–»óõ:ö\å\Íöºƒ\ß=\"_¼ô«×Œ·\ïn\ê\\\0¥X³vø;­ûÊ†eqõ9£ŸŠûùz††\ï\ZX;¼kppôğ|\Ùlt \0”fõ\Ğ\È©\äö­\Z¾4\î¬=\'\İß»úœkş\Ç\êu\Ã\ãft£\ãkÖ>\ÚZ>uV¸\âq¿J·\ÇÖ\ì_34ò‹\Õ\é1­\å\é~\ÚÎ\éö©,·t>¶óu\0Àœ\Z|Q^bkÖ\ìN³½F*«‡\Òı=1›[3´\áQh“ó•\ÑO¬¾¼]^©Ğ¶\ÇcÖ|/•\Ş\Ö_½v\ä\Z>&\n0•\ëÎ”ßœú¿\×/MÛ•–M~5\00‡RA}2\ÍğZ¿[ù¿6İ“i¬UFy¶\Ëmõ\Ú\Ñï¤‚;0»[;|÷¿•^\ÌG~Ş–J\ï¥Œ\ä#3\Ç?\å\Ûj?\0J3¯”ñ˜\Ù\Åı5k‡\ÜQbÅ©\çm\Í9\ë×´Jj\í†8°\Î\è\ã\éş\Ö:k‡÷¥\Û¶\×I¿$f|¥ö\ØÀºk¾x\à±#\Å\ßñ\Ö|uø}\éş¾{\0P’T@{S.\"ŠrJ³¾\İk††÷z\î\È\ß\rm¸¿=#kÚ¿lø\Ğ\ÄcŠS‡FbFW¬™x\\\Êmñspğ\Ò%:°vôü§»v\ä\ê(¼\ÕC\ë\×\ÅñÀ\Øğşv\Ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Àô±¡\ác†FŠS×Ÿ/;\Ô†F7\åc\0Pš¡\ákG~›~nÉ—j«×Œ\çc\0PŠ\ÕC\Ã\ë\Ò,\ï–S\×võ\Ğ\È16ğ•Ñ£\×>³¿4öı™\ÆV~\ãÇ¯¢Œ±”±\Õ\çn<3\ÆOûò\È\ÛR‰\îo/K\Ïqik\Ök¥ıü\0PŠ\Õ\çl82Ğ¯½\æo&n·fak†F¶ºv\ä\ÓQt\í™\Ùtc1;Lø›ÁÁ\Ñ\Ã\×|uø}Q|­u\×\'ä£±İ´şÿl—Üİ¨\Ã;\Ú\Ï\0¥I…õ«\Î\ÙWdpğ\ÒWL7›i,OŒÇŒ1\n2nG!®(\Ó(Èu\Ãgun\0\æ\\\ÌÀbwå¤±¡\á\í§|<\Ê\ë\çnzG\ì®L·Ÿ8°lº±\áı1\Ã\ë\Ü\Æ\à\à\à‹Z¸nø\â\Ö\íu#\×F¹Nlc_\çº\0PŠ\Ø\Í»\'üi`\İ\è9QXÅµ§½\Îtc«\×\rÿK_k|\í\Èc«\Ïm¤’ûdZ\ç\Ö\ÕCÃ»\Ìş†³Ç˜ñ¥ûc±›´ó9`Ájıo\â€\0¨µ4›{2Š\É\Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 &Š¢8bÃ†\rß¸ğ\Â?ó\Ì3\Ç?ù\ÉOı\èG‹bÕªUÅ©§:~ú\é§\ïK\Ë6¯Y³\æù\ã`\ŞûóŸÿü_.»\ì²GR‘\'Ÿ|rqÁ7\Şxcq\Çw<òH\âgÜñXe˜Šp|``\àûK–,9<\ß&\0\Ì+1³û\ÉO~rg”\İ\ç>÷¹bË–-­‚›­X?\ÍúŠ•+W\î_±b\Å\Ùùö`^ˆ\Ùİ·¾õ­±4S+n¾ù\æ¼Ï•xü)§œR¤\â»É¬€y%\Í\Ğ>üù\Ï¾ø\Â¾P\ìÚµ+\ï°\ç$¶³\ÅN8aG³\Ù<2N\0(]\Ìğ¢ğ\Î;\ï¼bll,\ï®\ç%¶744Tô÷÷?j\Æ@¥R/»4c†w¨¯-¶{\ÆgŒ§\âûeşü\0Pš8h%ş†w¨vi\Î$¶¿bÅŠñÁü5\0Àœ‹İšq”\æó=he¶nºé¦¢¯¯\ï)»9(]|/4)\Ói§6\Öl6\Ï\Ï_\0Ì™\Ô?G\Ä,\ï\Ù~\ïùºõ\Ö[‹Tz{ó\×\0s&N-gZ©BÿşeË–½7M\00\'\â\\šq\ê°*œ}ö\Ù{\Òl\ïŠü5Àœˆ“G\Ç93«°iÓ¦\İ===\Ûò\×\0s\"®–\'‹®\Âm·\İ6–J\ï‰ü5Àœˆ+\"´¯–P¶‡~8¾¯7–¿&\0˜q=¼\nE\éùk€9€­j¦÷\àƒ\î3\Ó 4q\Åóªş¦·yó\æ]ş¦@iN?ıô}U½y\Í5\×<\è\èM\0Js\æ™gn®\ê{zkÖ¬\Ù\æ{z\0”&\Ï\â\Î\n´\ÜtF\0JµjÕªñ²Ï½y\İu\×İ›JÏ¹7(\×ÀÀÀ÷\Ï<óÌ¼—\æTÿã®²\0@\é\âºv+W®\Ü_\Öõô®ºêª­1\Ës==\0*±bÅŠ³O9\å”9¿rúÎ;wõöö>\å\Ê\é\0T*\ßMq1Ù±±±¼«‰´İ±}\èCI…w}ş\Ü\0Pª\Ø\İx\Â	\'\ì\Z\Z:\ä\Å…÷Ñ~ôTxÙ­	À¼\Ğl6\ì\ï\ïôŒ3\Î?T»:c—\æ\Ä\ï¡\Ø~şœ\0P™˜‰¥\âû\åŠ+\Æoºé¦¼Ã•8he\âox×›\á0o\ÅÁ&}}}Ov\Úic·\Şzk\Şg3\ßÃ‹¯%\ÄQšZ`Aˆ\ÙY|Ÿ.eo*±ıgŸ}ö¸\ây\\\06®‡WKˆ“GÇ¹4\ã\Ôbq¦•(»xœ\Ù\0Rœ2,Î•\'‰«#L”[1ñ3\î·Î¥\é\Ôb\0\ÔR”^WW\×Kòq\0¨‰\Ò{E>\0µ¥w\Ì1Ç¼6€\ÚI¥7~\ì±Ç¾.€Ú‰\Ò\ë\ï\ïc>\0µ“Jo£\ÑxS>\0µ\Ól6÷/]ºô¨|\0j\'¾£\×\Õ\Õõ¶|\0j§\Ñh\ì;\î¸\ãşk>\0µ“fzO5›\Í÷\ä\ã\0P;q\Í4\Û{_>\0µ“JoO\Ê\ß\ç\ã\0P;©ğv÷öö›@\í4\Z\'ûúú\Zù8\0\Ô\Î\Ä%…úóq\0¨Tx;SN\È\Ç vš\Í\æ\î\î\îUù8\0\ÔNš\åı¥\Ñh|,€\ÚI¥÷hší–@\í¤\Ò{8\åSù8\0\ÔN*¼S\Î\È\Ç vR\ámk4\Zg\æ\ã\0P;©ô\îo6›ÿ”@\í¤YŞ½½½½_\Ê\Ç v\ÒL\ï\î4\Ó;\'€\ÚI¥wgÊ¹ù8\0\ÔNš\åı©\Ñh|#€\ÚI¥÷\Ç\î\î\îo\å\ã\0P;===H¹(€\Úi4\Z›S\é]œ@\í¤Â»9ß¥ù8\0\ÔN³\Ùümww÷òq\0¨4\ËûU*¾+òq\0¨Tz7¤Ò»2€\Ú\é\é\é¹.\åš|\0j\'Ş¿¦\Ù\ŞH>\0µ…\×l6¯\Í\Ç vRé­]œù8\0\ÔN*¼Ÿ¦\\Ÿ@\í\Ä\×\âkù8\0\ÔN*½\ËS\éİ˜@\í\Ä)\È\âTdù8\0\ÔN*½ÿ›J\ï–|\0j\'.+—\Ê\Ç vš\Íæ…©ôn\Ë\Ç v\Z\Æ7Rñı)€\ÚI¥÷µTzw\æ\ã\0P;©ğ\Î\é\é\é¹;€\ÚI3½/§Ò»\'€\ÚI3½J¥w>\0µ\Ó\Û\Ûûù4\ÛÛ–@\í¤Y\Ş)\æ\ã\0P;\İ\İİŸn6›\ç\ã\0P;©ğNK3½Góq\0¨Txo4\Z\å\ã\0P;\İ\İİ«\ÒloG>\0µ“fy\'¥\Ù\Ş\Î|\0j\'^\Êù8\0\ÔN3I¥÷d>\0µ\Ó\Û\Û{l*½\İù8\0\ÔNww÷1©ôö\ä\ã\0P;F\ã}©ôöv5›\Í#;\ïÀ‚³dÉ’\ÃS¡=•J®x†Üœ?\0œTz\çOSr“²lÙ²÷\æ€g³½\Ûó\Ç\0À‚u°ÙY\0µ³½Tp{ó\ÂK¹;_\0¼Tp_\ÌK¯¯¯¯‘¯\0µ\Ğh4\ì(½ûó\å\0P³=³<\0j/\Íö\Ò\Ë\Ç v&®œ®ô\0¢¢(ßºu\ë=7\ÜpC1<<\\¬_¿^\ä%>S›6m\ZK?\Ï\Ê?{\0¥‹\ÂK¿”Š\íÛ·»w\ï.ö\î\İ+r\ÈŸ©ølmÜ¸q<•\à`şù(U\Ìğ\â—Rş\ËJ\äPfÛ¶mQz®8T+v?™\á\É\\\'>c±»3ÿü”*~å¿ D\æ\"J¨\ÜlKï‰¿<PlıÕ·‹\Í>\×JÜ±|=‘™¢ô€\ÊÍ¦ôv>v_q\Ë\Õg7_ù“c±,__dº(= r³)½{6_1¥ğÚ¹wó§¬/2]”P¹Ù”\ŞFÿyJÙµ\ËòõE¦‹\Ò*7›Ò»eı\à”²k\'–\å\ë‹L¥TN\éIYQz@\åfSzq´f^v\íÄ²|}‘\é¢ô€\ÊÍ¦ôn¿\î\Ü)e\×N,\Ë\×™.J¨\ÜlJ\ï‘û~W\Ür\Íg§^ŒÅ²|}‘\é¢ô€\ÊÍ¦ô\"wşú¢)¥cùz\"3E\é•›U\é\í\ÙS\Üşóó¦”^ŒÅ²)\ë‹L¥T\î™J/Î¸ò\Ç\ë\ÖM)¼vb™³²\Èl¢ô€\Ê\ÍXzi÷À\í#\Å\ïvú”¢\Ë\ëÄºf}r°(= rÓ•\Ş3\Í\îfŠYŸ,J¨\Üt¥7›\Ù\İL‰\Ç\æ\Û‰(= rÓ•^^d\Ï6ùöD\"J¨\Üt¥\'2Qz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éMNú\'™’|\Îõò\Û\×^{mñ\îw¿{\Êú¢ô€y@\éM\Îa)ºÙ¬7Ó¸(=`Pz“s\Ø¥µeË–\âè£.^ö²—\'œpÂ´3½—¾ô¥Oßn‹=J¨œÒ›œ\Ã:J«_²dI\ëö\å—_^ü\èG?š¶ôò\Û29J¨œÒ›œ\Ãf(­ö,n÷\îİ­t®7\Óm™¥TN\éM\Îa3”–\Ò{şQz@\å”\Ş\ä6Ci½ÿı\ïo\Ç\î\Í\Ë.»lÆ¢{ù\Ë_Şº½cÇV9\æ\ÛY\ÌQz@\å”\Ş\ä6Q`‰ñ;î¸£8ê¨£Š¿ø\Å\ÅI\'4c\é]x\á…Å«_ı\ê\â…/|añ\İ\ï~w\Êös”P9¥\'eE\é•SzRV”P9¥\'eE\é•SzRV”P9¥\'eE\é•SzRV”P9¥\'eE\é•SzRV”P9¥\'eE\é•SzRV”P9¥\'eE\é•SzRV”P9¥\'eE\é•SzRV”P9¥\'eE\é•v±S™ó¤\ÏØ˜\Ò*·iÓ¦±\íÛ·Où%%r(s\×]wİJogşù(Ušéµq\ã\ÆñmÛ¶/¦\ßÎ;§Œ••*Ÿ»\ì\Ä/\noÃ†\rûR\é\r\æŸ?€\Ò\Å/£ø_x\ì~Zù\áXœx\â‰\ÅUW]5e\Ù\\\'ó¸\ã+.¹\ä’)\Ëjœøl\r\æŸ;\0J\Ğl6\ïL¹6/KOO\ÏxJ\Ñ\Û\Ûû¥|\02©\ì>œ\ng¬¿¿ÿ¯òeeIÏ¿/Jo\"÷¤Y\çòu\0\àyK¥÷x\Êùùx™R\Ñ\í\î(½\ÈX\Ê`¾\0<g©\ì\Îi4\Z»\Ò\Í\ä\ËÊ”^\ÇcY\éµs»Y\0\Ï\Ûò\åËH…»ÿ!_V¶ƒ”Y\0\Ï_*’«S\éİ›W!ftÓ”]g\îI\Åxdş8\0xFK—.=*\ÉşT$\ïÉ—Ua¦\ÒK¥üdzùú\00k©PnKeò‹|¼*\éõü2/¼\Øå™¯\0\ÏJš=u¥B\ÙüñÇ¿>_V•Tr£…·)\ÍDÿs¼\Æx­ùº\00k©LM\Årq>^¥Tn\ëS¶öõõ½½=¯1\å\Ñ\Îõ\0`\ÖR‰|1ewWW\×KòeUZ²d\É\áùX¼\Æx­©¤\ÏÊ—ÀA­\\¹òß¥y*\åSù²ùª»»û\Óñš\ãµ\ç\Ë\0`F©<~˜²=Ÿ\ï\ZÆƒi¶wy>\0\ÓZ¾|ù\ßÄ!½½½—/›\ï\â5\Çk÷/€)\Ò\ï\æ4cº)_(\âõGòq\0˜$•\Å\ßOşÿ\×ù²…b!\ÏT(Q]ş&“Œ÷’@\Ë\ÄÑ{\ëpôcû\è\ÓxOù2\0¹ø[š\í©\Ó÷\Ü\â½\Ì\Ç\ïP±š\Ñ$\ŞS¼·|€E*•\Â¨\ë¹+\ç\ã¹C¨P\\A!•Ã–|¼.\â½\Å{\Ì\ÇXdR¼\'\Íôb–÷\Ö|Y]\Ä{‹÷\ï5_À\"’\Êà¾”«óñº‰÷Ø˜\'W~ ©>–\Ê`\ßò\åËÈ—\ÕM¼\Çx¯ñóe\0\Ô\ßR	\ìj6›_\É\ÔUz¯\ç¤\ÒÛ•n¾ _@¥Â» •À\ãùx\İ\Å{N9? ¦úûûÿ*•\ŞXú\åÿ\á|Y\İ\Å{÷ÿù2\0j(ı\Òÿy£\ÑØš/©ø\îLÿ\×\å\ã\0\ÔLWW\×J¿ğ‹¾¾¾|\Ùb‘\nÿøø7\è\í\íıù2\0j&ı²ÿ^ú\Åÿd*ÀW\ä\Ëƒô\ŞŸJ\ï7ù8\05\ßY[Œ¿ø›\Í\æß¦÷>\î\Ê\ê\0‹Hÿ\ã{ki\Öwz¾¬\Î\Ò{şS\Ê\Æ|€šK¿ü?G2öõõ½%_VGq%õô~|\Z`±J%ğÿR\â\n\ãµÿ\Âv³Ù¼\'\å\Ê|€EbÉ’%‡§\Ò\Û\Ù\İ\İıƒ|Y¤\Ùl#fµ\Çs\Ìkóe\0,\"©ğ\Ş×œ«\ãõô\ÚR\ámO\ï\ï\Ò|€E(\Â\×R1\ì\é\ê\êzM¾l¡K\ïkEzû\ëW4\0˜F*‡;R9l\Î\Çº4‹}4\Íf¿•°ˆ{ì±¯K\Å÷T\Ê\Ùù²…*½—O¤\ìM³¼—\ä\Ë\0X\äRAœ‡õ§’x[¾l!Šƒt\â’Bù8\0´¤¢¸:\Åcƒƒƒ/Ê—-$\é=œ•\ŞË“‡-‚¯c\0ğE\ÙE\éEù\å\Ë¸H\î\î\Ş\Ş\Ş\Ï\ç\0`’Ø½»9;¯¹7ñ¾\ëÂ©\Ë\Z\ÆP\ì\Ú\Ì\Ç`Zq@K\Ø¸Ä‰š£DRŠtûŠ|\İù$Z‰ƒWR>‘/€\ÅWRy\ìHÂ›\È\íùzóI*\å\Ók|4€¥ò82•\Ç]e\×\ÎùºóE|=¾ˆ^\ãŠ|\0L+\ÇI©8¢<òÂ‹Œ\ç\ë\Ïqª±ôú¶\å\ã\00­T\Z—LSt“²t\éÒ£ò\ÇU-N&^\Ûş8¹t¾\0¦u\â‰\'¾!•\Ç/ó¢\ë\Ì|<‚3½®Ÿ¦ü9€g³¹‰Y¦”\Ş|»Q\\6fy]]]ÿ=_\0³¶lÙ²÷¦B¹=+¾?\æ\ëU©\Ùl^¯1€\çd\âB¬÷O”\Şş|yU\ÒlôM)\ãñ]\Â|\0</=®O\ßÛ»(_V…ô:~™^\Ï\ïóq\0JP\Å\á[·n½\ç†n(†‡‡‹õ\ë\×\Ëåª«®*N<ñ\Ä\âŠ+®˜²¬®‰\ÏÔ¦M›\Æ\ÒÏ³ò\Ï@\é¢ğ\Ò/¥bûö\í\Å\îİ»‹½{÷\Êf\çÎS\Æ\êœøL\Ågk\ãÆ\ã©ó\Ï@©b†¿”ò_V\"‡2Û¶m‹\ÒsRm Z±û\ÉO\æ:ñ‹İù\ç Tñ‹(ÿ%2Qz@\åf[zOü\åbë¯¾]l\Şğ¹V\âvŒ\å\ë‰\Ì¥Tn6¥·ó±ûŠ[®>£¸ù\Êœ”‹eùú\"\ÓE\é•›M\éİ³ùŠ)…\×Î½›<e}‘\é¢ô€\ÊÍ¦ôş0ú\ÏSÊ®X–¯/2]”P¹Ù”\Ş-\ë§”];±,__dº(= rJOÊŠ\Ò*7›Ò‹£5ó²k\'–\å\ë‹L¥Tn6¥wûu\çN)»vbY¾¾\ÈtQz@\åfSz\Ü÷»\â–k>;¥ğb,–\å\ë‹L¥Tn6¥¹ó\×M)½\Ë\×™)J¨Ü¬JoÏ\âöŸŸ7¥ôb,–MY_dš(= r\ÏTzqÆ•?^·nJ\áµËœ•Ef¥Tn\Æ\ÒK3¸n)~ÿ³Ó§]X\'\Ö5ë“ƒE\é•›®ôiv7S\Ìú\ä`Qz@\å¦+½\Ù\Ì\îfJ<6ßHD\é•›®ôò\"{¶É·\'Qz@\å¦+=‘¹ˆ\Ò*§ô¤¬(= rJOÊŠ\Ò*§ô¤¬(= rJOÊŠ\Ò*§ô¤¬(= rJOÊŠ\Ò*§ô¤¬(= r‹©ô\Ò\Û}:/~ñ‹‹7½\éM\Åğğğ”õf›ö¶òq™>J¨\Üb,½¸½eË–\Ö\í7¿ù\ÍSÖ“¹‰\Ò*·XK¯}?f|qû¡‡*?şø\â¥/}iñ²—½¬Xºtiq\ï½÷_|qk½\ã;®µ^¬÷¿û\İ\ïN\Ú\ŞLeGydñ‘|¤uû\ë_ÿz\ë1k×®m\İ_µjUñ\ÊW¾r\Êk­c”P¹\ÅZz7\Şxc\ëöQGÕº¿|ùò\Öı¿é¦›Z·\ßÿş÷÷\ß\ëö\Şğ†\Özo|\ã[÷\ï¹\çIÛ›\éñ±\ìƒü`ñº×½®uû\ï|gk\Ù;\Şñ\Öı×¿şõ\Å>ğ)¯µQz@\åc\éµsô\ÑG\×_}kY\Ì\Ğò\å1\Ë\ŞúÖ·¶î¶~¾\å-o™´½gzüg>ó™\Öıö\ìğU¯zÕ¤û\íY`İ£ô€\Ê-\ÆÒ‹Û§œrJñò—¿¼¸ò\Ê+[÷Û¥µ{÷\î);ù\ä“[\ËbF?\Û%Õ¹½ƒ=ş²\Ë.k-‹Y]ü¼\à‚&İ¿è¢‹¦<¦Qz@\åk\éE9\ÅÑ›¯~õ«[»*{{{[Ë¾ù\Ío>½\ëó]\ïzWk\İvi\Å\ßÿ\â\ç%—\\2e{{ü\İw\ßıôº1»Œ±·¿ı\íO=Ÿ#HR”P¹\ÅZz‘\Ë/¿¼u¿»»»Ø¶m[\ë\ïrqJ\Ì\Ú\â\ïqQV±Ş;Š¾ğ…­u\ãg´’o\ï`Ä¬2\Ö]·n]\ëşW¿úÕ§¿k×®)¯µQz@\åS\éIµQz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éIYQz@å””¥TN\éIYQz@\å\â¦\Ó]\í[\äP&}\ÆÆ”P¹M›6mß¾}\Ê/)‘C™»\îº\ë\îTz;ó\Ï@©\ÒLï¬7oÛ¶mÜŒOub†…·aÃ†}©ôó\Ï@\é\â—Qü/<v?\É3§\ÙlN“ƒ&>[ƒù\ç€ynÉ’%‡÷ôôø\Û\0õ\×\Õ\Õõ\Z¥À¢püñÇ¿¾\ÑhŒ\ç\ã\0P;©ğş:\Íô”\0õ—Jï­©ôö\ç\ã\0P;}}}oO¥7–@\í4›Í¿M¥·/€\ÚI¥÷\ßR\é=•@\ítww“JoO>\0µ“\noY\Ê\î|\0j§\Ùl\×h4v\å\ã\0P;©ğNJ3=W\0 ş\ÒL\ï\äTz;òq\0¨\î\î\î5©ø\Í\Ç vR\é}:•\Ş\Ãù8\0\ÔNoo\ïgÆƒù8\0\ÔNOO\ÏS\È\Ç v\Ò,\ïË©ô\î\É\Ç vR\é\r¥Ò»;€\ÚI¥÷õTzw\ä\ã\0P;\ÍfóÂ”?\æ\ã\0P;i–÷”[óq\0¨Tx—4\Z\ß\å\ã\0P;\İ\İ\İ?h6›¿\Í\Ç v\ÒL\ï\Ç)¿\Ì\Ç vR\á]òó|\0j\'\ŞpÊ¿\æ\ã\0P;QxQ|ù8\0\ÔN*¼\ë\Æ\Ïòq\0¨8ˆ%f\É\Ç v\â\ë\nñµ…|\0j§\Ñhü¾··÷{ù8\0\ÔNœ‚,NE–@\í\ÄÉ¦»»»¿•@\í4\Z­½½½\ç\å\ã\0P;===wÇ…dóq\0¨Tx÷¦™Ş—òq\0¨4\Ó{ \Ùl•@í¤™Şƒi¦÷\Ù|\0j\'\ÍôNùT>\0µ\Ól6K\È\Ç v\Ò,oG*½“óq\0¨Tz;SN\È\Ç`A[ºt\éQF\ãMc©ğv¥ôvÀ‚7q¡b¦¤B™\ßò\åË\È\0J\Ìôò¢\Ë\ã2C\0\ÔFš\Íİ˜];\Ífs¿Y\0µ±lÙ²÷\æe×‘ÿ“¯\0Z*·\Ûó\ÂK³¼§–,Yrx¾.\0,h\Ó\ÍöRéŸ¯\0µŠ\îş\ÒÛ/€\Ú\è\ë\ëk´K\Ïõô\0¨½TxÛ¢ôººº^“/€mbv7:QvO¤ìŸ˜\íMÜñ\ÑX/,\0\Ì{\'x\â&Šn_{w\æ,\ë\Æ\ãómÀ¼_2³«4›\Í8µX^h\Ï&ûc;¾´À¼§\ë\í\íIO*°+V\çw^ñ‹_ü¢¸\ã;ŠGy¤ñ3\î\Çx,õòÇ¦<\ÛÍŸ\0*\Óh4NJ…\×ş[]+­Bk•\Ü3‰õbıx\\\çv\â4e±ıü9 t…÷tIõõõ?ı\éOg]v¹x\\<>¶\ÓQ~\ãŠ€JM\ì\Ò|z†·jÕªbË–-y=\'±\Ø^\çŒÏ®N\0*™tş\r/\n\ê¾û\îË»\ëy‰\íu_\Ên tqte\ç.\ÍC5\Ã\Ë\Åv;wuºö\0¥Š\ï\Ñu~-!ş7—bû³½ı¾\Ç@iz|ñ¼UBq´\ås=he¶bû\ÙQ£ùk€9\Ñ\Óq¦•øšA\ây:Jo_şš\0\à\ë¼RB|¡|®gymñ<_`w®N\0\æ\\\ç®\Í8“J™\âù\ì\â 4=—*s\×f[¶‹s[ş\Ú\0\à\ê9p9 VñÄ¹3\Ë\Ï\×QzO\ä¯\r\0©\×ÁkOû\ä\Ñe‰\ç\ë(½±üµÀ!\ÕQ:y\'•¢óùó\×\0‡”™\0‹F¿\é°Xô8z€Å¢\Ç÷ô\0X,ª<#\ËI\'ôt\é9#\0¥\èq\îM\0‹\Î]œe]eaõ\ê\ÕvmP¾¸]*ı\ír==\0j­\Ì+§÷öö>]z®œ@\é–/_~DO\ÇwöV­ZU\Üw\ß}yg=/±½•+Wv\Îòˆ\ç\Í_\0Ì¹¥K—\Õl6Ÿ\Ş\Í\Åw¨f|±\ÎÂ‹\ç‰\ç\Ë_\0”¦\Ñhœ”Ji¼sWgü\r\î¹\Ü‹\Çw\îÒŒ\í\Çó\ä\Ï\r\0¥‹B\êœñE\â¨\ÎøšÁl\Ë/Ö‹õ³£4[3<…À¼»{:ş\Æ\×N|=Î¤…\ç\ÎlŸ¤:~\Æı\å_<\ï\Èvi0/\ÅA&GuNšõ=‡\ì\í8h€yo\â{|£=gn™ebıQ\ß\Ã`Aš8Wg`\\!v¶¯\Ç?\ã~Œ:—&\0\0\0\0\0\0\0\0\0\0\0\0\00_ü@%hvd\Ø\0\0\0\0IEND®B`‚',1),('20005',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png','20001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0+®IDATx^\í\İŒ\\e½ÿqRD\nˆ€QB!Æ¦!¤¢ü*‚kŒª©HwgÎœ™NYi»”ŠZÄ‹¹xA.W\ÌO¥(.I½HùSA\Ú\Òò«µ€X¶P,´@[º¥,ôÿö\Ïn\Ï\ïû©³ß™İ=3s\Î<\ïWò\Í\î<Ï™3³³\Éó™\çÌœ\çq\0\0\0\0GÍ¹ùÉ \\…\Õ\0ˆ°r¶\ä‹ûl\Ûpı\0€+7`d®\0a\å\ì‘ò\Ãõ\0\"¬Ü€=’A~¸~\0@„•°G2\È\×\0ˆ0°\ËUXı\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05Á‰‹-ú\Õ]wİµó\Úk¯=t\ÕUW—]vYJ¥‚Y³f\ßı\îw]}õ\Õ¥o\ÍW\\q¡½?\0 †\Şx\ãÿsÿı÷w\ËÀÌ=;¸\ã;‚•+W¯¾új\Ğ\İ\İ(ı©·µ]û5$Í™3ç–––±vŸ\0€ˆ\Ówş>ú\èüø\Ãk×®\Í\rø•\Ò\íeVtttôÍœ9óF»\0@D\é»ÿ;ï¼³W\Ş\É\Ï?ÿ¼\ßGD\ïù\å—«˜\0@\Ä\É;øo\\w\İuÁ~ô£`Ï=vL¯Š\îGg—\\r\É\ß÷\Ç\Ù\Ç\0D€\Î\04\0\æÍ›ôööÚ±|Tt7\ß|s\Íf\ßaF\0\0#\ãô‰zHg\0a@\îw\îÜ¹‡$µ\0h ıX?\ë\Ğ`tÿ3g\Î<”J¥:\ís\0\04€\ÒoöC\àJ­Zµ*\Èd28,\0 \ç\è·õt\å•Wöú¾»}.\0€:’ñøDŒô<€\Ñzñ\Å	ıöù\0\0\êH—‚\Ğ3!›\Íöµµµ}\Ş>\'\0@\èZ@º\ÔC#\Üx\ãûd6ğ°}N\0€:\Ñ\Å\àtÍŸFX¶lYO*•\ê²\Ï	\0P\'º\Z¨.ş\Ö/¿ür¯„Ànûœ\0\0u¢+~V­··\ß~[\Ï\èµ\Ï	\0P\'z=€\Ò\ìs\0Ô‰^¦Q3·\Şz\ë 3\0h ½\"X£>X³f\Í>\0€\ÒKB6\ê\ÛAO<ñ\Ä[|;\0\ZH¯	Ü¨ó®¸\âŠ.\Î\0€Ò‹\Â\ë7„\Z ÷\Í \Î€Ó‹\Â\×{\í \åË—o’`\í \0h´9s\æ< …¯§l6»“UD t]ÿ¾z]O\à±\Ç[¯³\0®\'\0\01s\æ\Ì/¿üòš_Yl×®]{\Ò\éô®,\0#A°J/.S\Ãk÷^|ñ\Å\Û%\0V\Ø\Ç\04˜¹\ä’Kv\Ü|óÍ¡Àe—]¶E`‡\0 ¢|\ß—\Ífß™;wî¡°\r\é! ü`›\î\ß>&\0 BôºÁ³3g\Î<¤…\rı8ÿÀ\nf\0\0#ú\ám&“9 …\×kÀ!=@¿ª\ß\âC`\0ˆ)}÷®\ß\ç×‹\Â\ë5õ’zE0½ Œ^@|]\rTƒÓµ€t)=X½\ïş I\èºÖ.ú¦«\æû ÿSo\ç\Öb)\0p„†@gg\ç{l;\0À\Z\Ç\Úv\0€4‰\Äl;\0À‡ø\î?\08JC@\êT\Û\0p€†€\çy±\í\0\0ø¾\ß\×\Ú\Ú:Á¶\0‰¶\0\à\0=Q,‘Hœm\Û\08\èy\Ş\'m;\0À\Z\Édò\Û\0p€\ïûX+\0¥«‹&‰/\Ûv\0€R©Ô¾d29Ù¶\0 !\Ğ#\Õf\Û\0\0\Ø\ë\Û\0p@şb2Y\Û\0p€À.©Kl;\0À¾\ïï”ºÔ¶\0 ³€\íRß´\í\0\0\È,\à]©9¶\0\à\0™tK}Ï¶\0 ³€·“\É\ä¿\Ûv\0€dğ–\Ô\\\Û\0p€@—\çy\×\Úv\0€$¶H\İ`\Û\0YÀ¦t:}“m\08@foø¾ÿS\Û\0p€„ÀkR·\Øv\0€<\Ï[ŸN§\ç\Ùv\0€dğŠ\ïû·\Ûv\0€$^–¸Ë¶\0 !ğ’\Ô=¶\0\à\0\Ïó\ÖHÌ·\í\0\0H¼ !pŸm\08@`•\Ô¶\0\à\0	€¿IıÁ¶\0 ğ¬\Ô#¶\0\à\0	€\ç=n\Û\0ø³„ÀB\Û\0p€\ïûOI<i\Û\0\Ğ\0\Ğ °\í\0\0\è¡ =$d\Û\0\Ğ…õ\Ãa\Û\0p@2™|\Ô÷ıgl;\0ÀI<g\Û\0ø½„À\ßm;\0À\çı.•J=o\Û\0ø­„Àj\Û\0p€Ào¤^´\í\0\0\è¥%%^¶\í\0\0\èE\æ%^±\í\0\0¤\Ó\éyç­·\í\0\0\È,\à©\×l;\0À¾\ïÿTB\à\r\Û\0p@:¾\Éó¼M¶\0\à\0™	ü§\ÌŞ´\í\0\0\ÈL\à:™	t\Ùv\0€$®‘xË¶\0 !pµ„À6\Û\0p@2™¼*•Ju\Ûv\0€$®ğ}ÿ\Û\0p€\Ì¾)µİ¶\0 ³€K¥v\Úv\0€dp‰\Ô.\Û\0p€@Vj·m\08À{m;\0À\0mR=¶\0\à€t:}¡\çyûl;\0À_‘™À~\Û\0p€\ïû_8`\Û\0ø,!\0\0hii+ƒşôƒaj½/\0 	H\Ü^f\ĞPmmmŸ·÷\04\nf\Ì\0 ™\r5`\0\0ğ<o¯\r€\×\Z\07È€ƒ\rL&\ã\Ù\í\0\0M\Ê\Ì˜\0€KŠg\Ì\0ÀA\0\Û5l;\0À¾\ï_I\0@\rA0vıúõŸ~ú\é`ñ\â\ÅÁÂ…©*J_»eË–õ\Ê\Ï\ë\ík\0‘¥ ƒW°u\ëÖ §§\'Ø¿?UE\ék§¯\áÒ¥KI(t\Ú\×\0\"Ig\0:x\ÙAª®ººº4¸2€x\Ğ\Ã\Ì\0\Â+}-õğ} ’tÀ²5º\"\0\ÄF¥!°{û–`ı_ÿ;X³è‡¹\Òßµ\ÍnG\0b¤’\Øõ\î\æ`õŸ\æ\Ï/ø·¥m\Úg·w½\0±QIl\\ópI\0jÓšGJ¶w½\0±QI¼´\ä¿JÿBiŸ\İ\Şõ\"\0\ÄF%!°zag\É\à_(\í³Û»^„\0€\Ø \Â/B\0@lTúm ;øJû\ìö®!\0 6*	u\ËQ2øJû\ìö®!\0 6*	\î\Í/«Ÿ¸¦$\0´Mû\ìö®!\0 6*	­\r\Ï\İS\Úf·£\01RQ\ì\Û¬ûË¼’\Ğ6\í+\Ù\Şñ\"\0\Ä\Æp! gÿsù-%P(\í\ã¬\áE\0ˆAC@\Ş\áoY÷dğÇ¯.øm\é6º-³‚ş\"\0\ÄF¹\î\İÿ`Å¬ ¿\0±Q.*y÷?X\é}\íş\\+B\0@l”;°´\ìş\\+B\0@l”jtE\0ˆ\rB ü\"\0\Ä!~\0bƒ¿\0±A„_„\0€\Ø \Â/B\0@l\á!\0 6ğ‹\0£\r\ÙEÙ²\Û\Ùzö\Ùgƒó\Ï??8úè£ƒc9&8\ï¼ó‚\åË——lg«\ÒıW\Åûyê©§‚.¸ d›j‹\0£\rB1\ÂÁyüøñ¹\í_x\á…`\åÊ•¹\ßO=õÔ’\ílôq*©°÷I\0ˆZ†@wwwpé¥—\æ\Ş\é\ë;şY³f;v\ì\Èõi›n¿v\í\Úa÷U|»ğûŒ3rû8ë¬³\ï£\Ğ÷‰O|\"8ê¨£‚\ã?>¸\æšk‚‹.º(÷ø\ãÆ\î½÷\Ş\Ûj{\áwûü«-B\0@l\Ô24\0´mşüùÁı÷ßŸû]ƒ@û~ü\ã\çnw\ÜqÁ\ìÙ³s3‚ÁöU|»ğûC=”+ı½p(§\Ğ÷À6l8|[{İºu¹\ßO:\é¤A÷iÿ¦j‹\0µÂ»ì\\\é\ï\ÚV\è\×\Ï\0\Ú\Û\ÛsA }\Z\åöU|»ğ{¹}u?{{°\ß\Ã(B\0@l\Ô2\n‡|Šlğ\í}7n\ÜXñ`^ø½xŸú8v»\ánö{E\0ˆZ†€¾\Ë×¶\â\ÃAz\èGû&L˜»­\ßz\î¹\çr¿\ë‡\Å\Ú÷¡}(w{õ\ê\ÕÁ‚\Ê\Øzlÿ‘G\Éı>iÒ¤²\Ïa¨\ÛÅ¿f\"úy…Kñ\ßPM\0b£–! \ë¸ú_K ğÁğªU«Eô\È#\Ì}EtÅŠ¹¾»\ï¾;8\á„r\ïğ\çÌ™Svğ\Ö\Ïô\Ãß‰\'\æ÷—{C\İ.şı®»\î\Ê}V Ï£ğÁñhŠ\0a…\0õ¯\"\0\Ä!~\0bƒ¿\0±A„_„\0€\Ø \Â/B\0@l\á!\0 6ğ‹\0„@øE\0ˆ\rB ü\"\0\Ä!~\0bƒ¿\0±A„_„\0€\Ø \Â/B\0@l\á!\0 6ğ‹\0‹/\åB*T\Ék\ÙK\0ˆeË–õnİºµd0£ª«\×^{\íu	]öu€H’™ÀõK—.=\Ô\Õ\Õu\È\ÅÁÎ;KÚª)h\0,Z´è „@§} ²t\Ğ\Òw¯z#Ê•J¥J\ÚFS=öX0u\ê\Ô\àg?ûYI_•¥¯a§}}\0!\Ğ°m£%ûÜ­û•\êñ}ÿg---c\í6\0€¨Ex·0¹’ 8 ?\ïnoo?\Ñn\0h Z„€ì³³8ŠÂ /™Lş~úô\é§\Ùû\0\0\Z ! 3ñ6\0ŠKú\él\ÃD\0\Ğ`µ%û=hÿ¢\ê“ú½\0 \Îj\ËşZ»3™\Ì9v{\0@\Ô*|\ß¸L\0\à\Ãa\0ˆZ…€\î10_jo:ş_»-\0 Ajú\r ü\à\ß+•\Õ6™|6\ÕÿyÀL»=\0 jJöı¼~S¨¸Mf\×h0Hû™\Å\í\0€¨eFs‰\Ôv¾\"\n\0\rÖˆc\äq·Jı\Ív\0\0\ê¨A!Pø\Ì\à€\çy7\Û>\0@4*”<v[~)‰¯\Û>\0@42”\Ìn\ÕÔ©¶\0Pc%A°J\ÇùuŒ\í\0\ÔPB ££\ãX\ß÷w\è¢r¶\0PCQ•N§Ï’\ç\Ò+?¯¶}\0€\Z‰J(™\rÌ–\ç\Ó\'??cû\0\05¥Pò|\Ú\ËBs\0PQ%\Ïiƒ\Ô:\Û\0YC`ò\ä\É”\ç\Õ#5\ßö\0B\ÅP\Édòsúù€\çy3l\0 $Q\r%p­~c(“Éœaû\0\0!ˆr(\ß÷Ÿ’z—G ¢\ï‘\çø–\Ì\nşjû\0\0£õP\ÙlötydFğS\Û\0…8„€\Êd2^~\Å\ÑÉ¶\0P¥¸„€ò<\ï6y¾û§M›vŠ\í\0T!N! $^\çü\æ¬8\n\0£·È¯8ºS÷Ÿl\0`„\âJó\Çõü©\ï\Û>\0À\Ä1”\çy\ß\ÒŠ§Núi\Û\0¨P\\C@I<(a°‡G Jq%\Ïÿu©—m;\0 ql6û\áTÿŠ£¿±}\0€a\Ä=”\ïû_Hõ_‘\ì¶\00„f•N§¯“¿\å`kk\ë\Û\0D³„€’¿e™\Ì\ŞI$\ïµ}\0€2š)t\ÅQ\Ïó¶I<cû\0\0e4S(	\èa!ùù\Û\00š-”ß¯Oş¶¯\Ú>\0@‘f%!p»\Ôş)S¦œlû\0\0y\Í\ZJş¶\ÕR›m;\0 ¯™C ‘H¼Oş¾]\ç=nû\0\0G4w(	‚³\åo\ìM&“W\Ù>\0p^³‡€’¿ñ\ÛúA±\Ì>iû\0Ài.„€’™ÀCò·\î4i\Òûm\08Ë•P)V€\\\n]q\Ôó¼}ò7\ßcû\0ÀI.…€’ø¢ü\Í}\Édòb\Û\0\Îq-”ü\Í7H\è\Ò\ãm\08\Å\ÅPòw/—\êf\ÅQ\0Ns5t\ÅQ\ß÷ß–\ÙÀÓ¶\0œ\áj¨ööö¦úWı±\í\0\'¸Jşş´H–N§¿bû\0 \é¹*™L\Ş)¯\Ã>V\àB Ÿ\çyk¤6\Ùv\0hj„@¿ÂŠ£¾\ï/°}\0Ğ´\Éd2\ç\È\ë\Ñ\'Ap¥\í€¦D”L&¯\Ğ :\×ö@\Ó!J\ÉkòHŠG¸€(\Ï÷ıòÚ¼d\Û ©\åIŒÓ¯J\İmû\0 iƒK$_\Ö\É\ä5\Ê\Ú>\0h\n„À\Ğ\äõ¹‘G4-B`xò\Z­\ê\ÖE\çl\0\Ä\Z!0<]nZC@\ÃÀö@¬•\Ñ\ÃAzXH\Ù>\0ˆ-B rú±~P¬\Û>\0ˆ%B`dô+£Rûô+¤¶\0b‡9y\Í^Ò“\Él;\0\Ä!0rºœ„¼n»¥±}\0+„@u\äu;WªOœ³}\0I¾ï¿«ƒşP¥\Û\Øû¡<]rZƒ@— ¶}\092hÍ±ƒ¾-\İ\Æ\ŞƒÓ‹\Ğ\È\ë¶K/Jcû\0 r†š\r0¨^–R/Oi\Û r†š\r0¨^ ^^¿ızÁz\Û\0‘Sn6À,`t\Ò\éôWò+¦m\0DJ¹\Ù\0³€Ñ“ ¸I^Ëƒ\í\í\íµ}\0)Å³f\áñ<\ïiy=\ßf\ÅQ\0‘V<`¢G—\Û>\0ˆ”\ÂlÀ¶ctt\ÅQ=,$uƒ\í€\È(\Ìl;F/™L^,¯mŸ\Âm€&Á\Øõ\ë\×o|úé§ƒÅ‹.¤ª(}\í–-[\Ö+?¯·¯qH\Ü#!°/›\Í~\Øöhb\Z\02x[·n\rzzz‚ıû÷SU”¾vú\Z.]ºô„B§}\ã@‚\àe©\×m;€&¦3\0¼\ì FUW]]]\Z»\ì\ë…G“\É\äC¶@“\Ò\Ã\Ì\0\Â+}-õğ}\ã\Âó¼O\æO$û¶\íĞ„tÀ²5ºŠs(™	\\%!Ğ›H$Î¶}\0šL¥!°{û–`ı_ÿ;X³è‡¹\Òßµ\ÍnG\Å?”\ÌO±\â(\Ğü*	]\ïnVÿinğü‚PÚ¦}v{×«B@Il–Zm\Û4‘JB`ãš‡K P›\Ö<R²½\ë\Õ,! +ú¾¿_\êv\Û IT/-ù¯’Á¿P\Úg·w½š%”\Ì¾ªKù¶@¨$V/\ì,ü¥}v{×«™B@y÷]ZB~~\Äöˆ9B üj¶P\ÏJlc\ÅQ \ÉTúm ;øJû\ìö®W3†€®8\êûş;\Ël€«$\Ö-ÿE\É\à_(\í³Û»^\Íªµµu‚J§\Ó\×\Ù>\01UIto~!Xı\Ä5% m\Úg·w½š5”\Ì¾¡+¶µµ}\Şöˆ¡JB@k\Ãs÷”„€¶\Ù\í¨\æ%Ap¯A+M ¢Ø·/X÷—y%! m\ÚW²½\ã\Õ\ì! $şÉŠ£@.ôŒ\à.¿¥$\0\n¥}œ5<°\\ööö=\Ï\Û#ağ \í#ƒ†€¼\Ãß²\î\É\à_]2ğ\Û\Òmt[fı\åB¨©S§~ZO$“0ø–\í\åB`¸wÿƒ³‚şr%T*•ú¾®8*õq\Û Ê…@%\ïş+½¯İŸk\åR(	€\'dF°³££\ãX\Û \âÊ…€\ØGZv®•k! \ÆH¼\éy\Ş¶@Ä•jt\å`1mÚ´S$öK\Üfû\0D!~¹*N_¨g2\Ïöˆ(B ür5”„ÀOeFp ›Ínû\0D!~¹\Êó¼¿J¼ÅŠ£@\á—\ë!\Ğ\Ò\Ò2Vf\ïJ=eû\0D!~¹*“Éœ¡\çÈ¬\àZ\Û Bğ‹\è\'0CWM&“Ÿ³}\0\"‚¿‘˜¯+N<ùƒ¶@Œ6de\Ëng«xÛ£:*?~|°xñ\â’\í*­J·E$!°Njƒm£\rB1\ÂA¸xûµk\×\æ~Ÿ0aB\Évq,B` ]qTB`¯\Ô¶@ƒ\Õ2º»»ƒK/½48\æ˜c‚£>:˜5kV°cÇ²\Û\ë\ï:#\Ğß·m\ÛL›6-w½okkk°iÓ¦`şüù¹\í¦Nš\ÛN·\Ñ\Û÷\Ş{\ï€ı\rv\í7n\\\î9\é\ï·\İv[\î>?ÿù\Ïs·õùüñ%\ÛH‹(\åûşgôóù9\Ûöh Z†€¶Ú¦ƒ÷ı÷ßŸû]Z»ıÊ•+s¿Oœ81w[\Ş9\ænkûªU«r¿\éK_\n\Ş|ó\Í\Üï§vZn»\ÓO?=w{\ãÆö7\Øıµï¢‹.\nN>ù\ä\Ü\ï\çw^®\ï\Üs\Ï\Í\İ>\å”S‚/¼°\äoi\å¥\Ó\é«õCòó,\Û AjúN\\\Ûzzzr¥¿k[ñö…:ë¬³‚+V¸_q\îw\æ™g\æn/Y²$÷óŒ3\Î(yü¡\îÿƒü w»0{8\á„\Ü.\ÌFS„À\à<\Ï[(³¬8\nDD-C@\Åh[qw\Üq%\Û_~ù\å¹ö\än‡‡}œÙ³g\çúô»ş,\Ú\Åû\êş…‰¾\ë×Ÿw\ÜqÇ€\Û÷\Ü3ú\ë&C\ÒG·H¬²\0\Z –!P8,S|8Hq»½\Öúí “N:)wh\'N\çú~ı\ë_>Ttşù\ç\ç¶-\ìG??ĞŸ÷\İw_\Éş†ºÿë¯¿~x[}h\Û9\çœs¸m4\ßP*!04	Su}!	‚[m€:«e\è\Ã3f\ÌÈ½3\×\Ò\0\ìƒ\á|0w;™L]]]¹\0)| ¬\Çóuğ\Ö\íôşGydn[ı©\Ûı\ru-uè¶·\ÜrK\îö/ù\Ë\Ã÷ß³gO\É\ß6\Ò\"†\'ÿ\ç¯ëŠ£m¶@…Ô¿Š¨Œ\Ìn\ÖÁô\é\ÓO³}\0\ê„¿\ÊIüMj«ü:\Æö¨B ü\"*§+Jl—Zbû\0\Ô!~#\ãyŞ™ùó®±}\0jŒ¿‘“˜™?£ø³¶@\r\á!P™	ü¯®1”H$>`û\0\Ô!~Õ“™À+ç­·\í\0j„¿\ê\é,@B`¯\Ô\ïl€\Z \Â/B`t’\É\äúù€üœeû\0„Œ¿Ñ“˜«\ßjmmhû\0„ˆ¿pH,\Ösô\\\Û $„@øE„FW\íò}ÿ\ï¶@Hğ‹®+$!p@\Â\à\Û „@øE„KB\à>	½*\Üx\Û`”ğ‹şw\ç\Ï$ş–\í½ˆJ¹+pQÕ•¼–½„@8<\Ï{R\à@[[\Û\çm€,[¶¬w\ëÖ­%ƒU]½ö\Úk¯Kì²¯3*—H$\Ş+ƒÿ‹{2™\Ì¶@ˆd&pıÒ¥KuuubFP}\é@`Ñ¢E%:\í\ëŒ\Ê\ä\Ï\î’\Ú\æûş8\Û t\Ğ\Òw¯z#ª¥Ú¶–¾†öõEe\Ú\Û\Û?*ÿ\ç]R¯pn\0€\Ã:;;ß£!`\Û\Ñ<\ä]ÿg¤ö\Ëÿù/¶€\ã:::%š—ş¾.¡KI\Û>\0\Ğ\Ã\'\Í)™L^¥_•º\Ñö@N6›ı0!\Ğ|<Ï»5Àl\Û\0‡M™2\åd,\ÙvÄ—ü$\Êÿõ«¶\0\ĞõcdÀ š@şCşUR=R·ı\0PB¿:H\Äß¤I“\Ş/3€R\ïH\0œjû ¬\Ö\Ö\Ö	2pô\ÙvÄ‡\Î\æd\à\ß.õz\"‘xŸ\í€A\éÕ¥ø\Êd2\ç\äÿüMn±ı\00$y\çx¶~Ü¶#ú\Ò\éô…ò¿;(!ş°\í€Š\È r.!?\ç}K¿*u‹\í€Š\é’únÒ¶#º$\0~¢ ÿ»+m\0ŒH2™üœ(l;¢Işûu\æ&A°}\00b2¨|ˆ…12ğ?-ÿ«ıS§Nı´\í€ª¤\Ó\é¯\èÀb\ÛºÈŸÀz	\ìòó#¶\0ª¦\ß0‘eŸmG4\ä—õx[\êM½(Œ\í€Q‘Á¥MªÇ¶£ñôù\ß\ì•Z­KB\Ø~\0µL&#o¯mGc\Éÿ\ä‹ú­-ù¹\Ğö@h|ßŸ*\ÍÛÆ‘ÿ\Ç=‹[B\à\Û\0¡’Á\æ2\Ø\ì¶\íhŒt:}]>\0\æ\Ú>\0¾\ë”g—mGı\Éÿ\áTÿYÀY\Û\05‘L&g\éWm;\êKş¥ò8 \'\ï\Ù>\0¨™ü\Z4\Ûm;\ê#‘H¼Wşkõœ.\ëmû ¦\ä\İ\ç©wm;joò\ä\É”Á¿K\ê-½Ö³\í€š“\è{Rİ¶µ%\ïş\Ç\ëg1Àÿliikû .’\É\ä¿\Ë@ô¶mG\í\Èk~À~©e¶\0\êJ¿Š¨‡#l;jC^\ë´T¯\Ô|\Û\0u\'ƒQ§\ÔVÛğ\é¬+\Õÿ\Ğl\04„\ïû\×Ë ´Å¶#\\\çİ¦ ¯÷¥¶\0\ZF¦¥6\Ûv„G\àqy\ê²İ¶\0\ZJ¦›d\Úd\Û1zºò§ş\ÏK\í•\×ù,\Û\0\r\çûşOezÃ¶ct\Ú\Û\ÛO\Ôp•\×öiÓ¦bû dºE\ê5Û\êe³\Ù\Ó\å5İ®¯k\"‘xŸ\í€Èw«·\Êl`ƒmGud\à?WjŸ¼®•›cl?\0DŠV¿’xÅ¶c\ä\Ò\éô	€^y=´}\0I\ÉdòN]ºÀ¶cddğÿvªÿ+ ?³}\0Y2p\İ-õ²mG\åò®k\0Ì±}\0i2xıF\êEÛ\Ê\ÈL\ê÷zH\Ù>\0ˆ<\Ïó~+ƒ\ØjÛa‘\×\í\Ùü‡ÀŸ´\02€ıN²\çm;§_û”\×lƒ\Ôı:¨\í€Ø\ì©U¶\å\é‰_òzuKm\Ö\Âl?\0ÄŠfú›mG)]úAfN{¥^\Ğ%!l?\0ÄÀ#zlÛ¶c D\"ñeyJı\Éö@lù¾¿@\Ş\Ù>m\Ûñ/2ğÏ”×©OO¬³}\0kú\ÎV\ê/¶ıäµ¹A N_mû\0 öd[”\âZ·e\É\àoªˆ©¶\0š‚\çyO\Ê ÷”mwşÿOê€¼6Ÿµ}\0\Ğ44\04l»«ZZZ\Æ\Ê\àÿ²\Ô\î\Ö\Ö\Ö	¶\0šŠv–Xh\Û]”\Íf?,¯\Å[òšl<yòm?\04ğVğµ\Ç#\Ğwıú\î_g:°ı\0Ğ”ô\ë¡ú5Q\Û\î’d2ù9y\rôø?Ÿ\0p‹^K¿‡m»+ô›?ú\r ©\ß\Ø>\0hz+}G¯„%ÿ\è9\0R\×\Û>\0p‚„«¤°\í\ÍNş\Û5\0\äoŸiû\0Àºš„÷\Ùöf&\ïRu= \Û\0N‘X#\â|\ÛŞŒt\åOù{ÿ¡+¶¶¶N´ı\0\à	€]øPT\×ş—¿s³T÷”)SN¶ı\0\à$ı^¼\Ôİ¶½™\èÕ¿|\ß\ß!µ¡££\ãX\Û\0Î’\0X\'u‡mo\ç}Rş¾}\0\Ï\È\Í1¶\0œ&ƒ\ã+ÍºN¾şm©şs\0œûö\0TD‘H\Üj\Û\ã.™L^!ƒŸüü¿¶\0\'\å\ë7\Ûö8Ó¿G@\êÛ¶\0PDf›\éİ²ü\ĞC@ò7}\İö\0y×¼)N\ßd\ÛchŒ\Úsò÷\ì\Ëd2\ç\ØN\0@ò®ùM<ÿÓ¶\ÇI\"‘xŸÖ’\Ú>}úô\Ól?\0`òÎ¹Kf\×\Ùö¸˜6m\Ú)2ø¿#µqÒ¤I\ï·ı\0€!\È\à¹UªÓ¶Ç<\ïKõH­\Ò%!l?\0`2ˆn“ú\Ûuòœ¿*uPê¶\0P!Dß–ú¾m²d29Ks_:gû\0\0# ƒi·\Ô÷l{T\é‡\Ø\Z\0q.\0ˆ$Tß•šcÛ£\Èó¼\ß\Ê\à\ß+\Ï×·}\0€*È º]ê›¶=j\ä9şYj2™¼Àö\0ª¤K,\ë1v\Û---cSı+î’™Àx\Û\0…ü\à:Ã¶GA6›ıpªÿ\ÛK]“\'Oş \í\0Œ’°»e&p±mo´L&s†>7©—‰\Ä{m?\0 2\È\î‘J\ÛöFjkkû¼<§RKl\0 Dz\Ñuy\×\í\ÙöF\ÑY‰ş}¾\ïÿ\í\0„LÜt:=Å¶7‚<—¹2ø÷I0]kû\0\05 \ï>y÷=Ù¶×›<‡;5\0\äù\\bû\0\05\"ƒ\î~™	|Å¶×“<‡Eú€\Ì\0¾hû\0\05¤ƒ¯¼ÿ‚m¯ıÖükô\Ãiùy¦\í\0\ÔX>>k\ÛkM\àò\Ø[\ä±ß–\Zgû\0u ñA„?c\ÛkI\ŞõDs§<ö«\Ç\Ú~\0@\È@\Ü+u®m¯•©S§~Z?‡Z!7\Ç\Ø~\0@¤ú\×\à	†*y‡~@\×\ë±÷\rƒ\Ì\0\Z:òów¶\0Pcù3qK~·\Ûû…Aöı½Tÿ…`n²}\0€:‘w\á\ë\íÀ_\05™È¾o\Ñ\0H\Å`\Éj\0hjºD„ü‹\ê»ıhI°<,û=(3€m\0 dP~\Ó€®!d·¥1²Ï•²\ïD\"q¶\í\04\È ³\Ğf“&Mz¿\ì\ï\r	w\åç©¶\0\Ğ`f6\Ğcû«¥ƒ¾\ß\İ\â\Z¶\02Xg‹…²j§ö\Ñ@‘\0ø{gg\ç{l?\0 Bô»†@g\í\êJ¤&\åç£¶\0As\ä\İ{0\Úwí²ŸÙ©ş¯€ş\Âö\0¢köØ±cıi;*%\ïş¬ 3€«l\0 ºt\à\ï“ú}şçˆƒ@ÿû¤z£tyJ\0Àğ\nPø\í\ía\É\à¿\Â÷ııõ^\00:ƒ\røƒµ \"\ËÀÿŠ\çy;\Û\Û\Û?jû\0\Ñ5\Ü@?d¿ş\ãdğ\ß&³€-zQ\Û\0ˆ®!ø\"e·\Ó\Ë?J\ée \×\èe!‹û\0\0\ÑVv`Â€\íeğy÷@jñÀ\Í\0\0Q7\Ò\0(\È\İ\ïcû\Ø=úP	‚»\ì\0€h«6\0rN8á„«¾öµ¯ŸúÔ§8\0b\Æ€^\ÏW¯\Z6\Üu}lw\Üq\Ç\éI`U	\0 ş\ÊÀ\ËRzv°ş,\Û\Î\î\0Q\ål}g¯{¡\ÊAq\0\êWEı\åö\0ˆÁ\êr|q\×_0\Øş\0\r6\Ü\0=\Ø@¯+ˆ–k·P0\Ü\ã\0\0\ê¬Ò¹\\\ì7·‡\n€‚J\0Pc#\ËÁH `¤\0Ù‰GôÄºôH\è! ;\Ğ\Û#½¸Laj}\0€\é;rf\0\Ğd*\Ë€T•>\0 N†˜\Ë\0\ß€&2\Ø\0=X\0p\0\04™r5g€C\ì€]<À—€‚Á¶³û\0Dœ¸u@\×wöƒ@\İ\Î\î\0£ÀG{\0@ƒU;W{?\0@ÄŒt@\éö\0€ˆ«t`¯t;\0@\Ì7À\×\0ˆ¹ÁúÁ\Ú\0M\Æøö6\0 \Éş\Âr\Ğ\0\08fv*•Ò³ƒ	\0\0pQ>\0\0.\"\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0Àa„\0\08Œ\0\0‡\0\à0B\0\0F\0€\Ã\0p!\0\0#\0À¾ï¿«ƒşP¥\Û\Øû\0š€ğs\ì oK·±÷\04‰¡f\Ì\0 \É\r5`\0\0(7`\0\0(7`\0\0)\r0\0\0\Ç\Ï˜\0€ƒ\n³\Û\0hB™LÆ“A‰T—\Ôn©Cù\Ù@oş¶¶/\Ñ\í\ì}\014}úô\ÓòÿÁ\Â\áŸ\nK·_¢÷·û\0D\\{{û‰\Édò÷¾\ï\Ş\íW[}ºİŸ}\0@µ¶¶NL§\Ó{\ì€>s\æ\Ì`Ş¼yÁ3\Ï<¼ú\ê«Awww ô§\Ş\Öv\í\×\í\ì}¥v\ë~\íc\0\"\Äó¼\0}\Åøœ9sr|ooon\Ğn§\Û\ëıŠ÷#³Š>İ¿}L\0@\ä\àğ \Éd‚?şñş–\ŞO\ï¯û)\nƒC\0DLş\Ğ\áÀ¬Y³‚µk\×\Úq½*º\İ_ñŒ€CC\0ú¡mñg\0:`oŞ¼Ùå£¢û+©\İ|X\0 \ß\Ş)>\ÖÀ\Òı\Z\ÒÇµ\Ï\0PGú=şâ¯\ê1üZ\Òı\Íú8\0\0\Z(\Õ\"XnP\ÖoóTû!p¥tÿ\æ[CK\ìs\0\ÔIª\èL`ıZg=\è\ã…ÀAûœ\0\0u_(7\ë	^µ\è\ãŸP\ÆZC\0\Ğ\0Å‡‚ôL\ßz\Ò\Ç\ã\04Pª\ÕÏº\n*0‡„º\ìs\0\ÔXªù\ç\Ü@¬kÿÔ“>^Q\ì¶\Ï\r\0Pc©ş\ë\0\ä\â\Âbpõ¢W½ö¹\0j¬h¶ct]?¾}n\0€\Zc&\0\0Kñ™\0\0¸+Å·ƒ\0À])\Î\0\0w5òŒ\á3f\Î€I±v\0¸«øP½Vı\Îw¾Ã¡ \0ˆ]\Ï_\âÃ—•\äz\0\à˜z^Y¬øBö\\Y\0\"@¯õ›*:g V\×\î\è\è(pa\0ˆŠ\Ö\ÖÖ‰¾\ï>,¤AÖŒ@÷S\0ú8úxö9\0\0\Z\Èó¼2H¾Ş°\Z\Òcø\Õ~X¬÷\Óû\Òı\ë\ã\Ø\Ç\0D€\Ğ\Å3-ıÖ~­³\Ò0\Ğ\ít{ó- \Ü€\0\0€ˆ\ÓC5©¢\Ï\n¥\'”é™¾:À\ë\Ú?…E\çô§\Ş\Öv\í/>¬¨vs\0bB?´\ÍkhÀ¬ Š\ê\Óığ!0\0\ÄPş<‚%©¢3‹+,\İ~	\ç\0@“È¯5¤ «\ê\á¢\Âõô§\Ş\Öö%¬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ğ\Üş?”cjg‡„º\0\0\0\0IEND®B`‚',1),('2502',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2504',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.Entrust.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1),('2505',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0\0\0F_#Á\0\0ŒIDATx\Ú\í\İ\rŒ•õ½\'ğ\æ¦/f5©¹ñ^\Óm6Æ½Û¦\Ù÷n\Z³É¶¤\í¶\rmW\äœ93€\ÓúV‘¶\Û\ZI	E½µUz¥jE­¶Z‰­n-\"UD^¦:\ÖwQ+Š¼:€Tpx™ÿşsg\Ìa˜Q)0\ç\Ìs>Ÿ\ä—sxÎ™3\Ïù?\Îóõ÷¼~\à\0\ĞHRJ—nH\éùü8\ã\Şuim~ü\×\Şwö\íÏ¦9mO·½•\Ò÷gw¤\Û\ß\ís¯ºoÃ‹ùg\ëó\'q\0jæ…”–\ç0úlO(}\"\×\ÂB\ï¸WR\ÊoO\Ã{şı\Ï\ïö¹\í)ı[ŸŸ??‡\ë#@\Íüiszùš¹ÛÌ¡ô\îx>\Í\î	¾;r=\İ\İôùon\ë	­\ß^~÷ª\Ü\ä¥Gs\Í\Éu\Ì[\Ò\ê÷ı\îò»_‰\×>\ëó¯¦´,?\Şÿğöô‹Ÿ½\ä\Úü9ùñÿ\åzĞ¨P7?–\æ\Ç&\Ík|mû\Õs^{6¦\Í^¿?6sŒ\î\î\ê?tü5¦-Ø‘nÚ™R[÷\ë\éö·ÛMó\ã÷—\îO\×\ÏZ\ß?s|N\Ä\éùñú\ÇO\Çûoücz\ä/)=Ÿ÷³ùo¶u\0]¡/ßš^ˆ\ç3K{:½\ã®[ø\æ\ÖüxbOu\İ\Õ\Øúôô…»\ç¿5İ•§Ÿ4sEgì¸»*?ÿ—il\İ^õ¹m/¿Vô„\ã{‚un\Ï\çÙ¯@MB\ïüt\Şö\×#\èr]ù@GZ\Ó/û\åSù\ß_ˆÍœ\ËRZ\Şó\Ş%?_²wItoq0K~ü\æŒ?vlÉÅ-w.\ï\Ü\Ğ\Û\Õ\İútz0Oÿ\Ô\ïÖ¤\ßÆ´\Ë\ïùóª\ÙÓš<\í\Â\\÷\Zy\0jz\ç\äº|E¼ü8!§\ße±¯.\×s=‘\ë¬\èã •\\7\æZ”zF‰ı}¹.Èµ¸\' ¯\êù\ÙK{\Şwo®Sz\Ş{r®\è\"o7\ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À­O§ö\ïH)`¤¨©FŸŸ2ó¥uGùwœ¿!¥)F€Z‡\Ş\ÙmO·\å\Ç\ãzş}â¢·ÓÏ¦tõ\ïÖ¤ß¾Ë´O,İŸ®Ï_+¥\ïÇ´\Ù\ëÒ3_J÷\Æ{oy<\Í\ëy_ùªû6¼¸\"¥+{\ß\0µ¼~x{úÅŒ\Ç\Ò\Âüüœ˜V½©3O;f i7ş1=Aõ³ùo¶Ç´\è\æ6§ôƒx¾`Gº)¿6<_ı‡­Om\0jz£\â1:°U)M\ç?½iY\ß÷õ–\îƒ7?–\æG\ØS\İû\ë\"@{;\Æ\Ù\éöx-ß¹<\Í2\Ú\0\Ô2ğ\"¬¾\Ğóü\ã¿5\İÏ¯™»\í\Éü\ï“s}*6]4\íò{şœs2}:ş\ë›1\í\Êß­Y\Ù\Óıı¯\ê û\×Y¯®ˆŸ=¥ËŒ<\0µ½s\"\ÄzŸ\\„Ö‹)]\Õd=¯÷7\í\äö”ş­78\ÃÏ§\Ù=Ÿs~Ÿ\ßõõ\ŞÍ\0P„ıü\íÏ¦9½ûü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†„”\Òñó\æÍ»\ï†nxkÚ´i]\ßı\îwSkkkjjjJ£GN\ßşö·\Ó\äÉ“÷L:uÃ„	¾c\Ä\0r6n\Ü\Ør\çw¾y\É%—¤q\ãÆ¥_ı\êW\éñ\ÇO›6mJ»w\ïNaÏ=©££#=ù\ä“i\æÌ™i\ìØ±iüøñ]“&MZZ©TN4Š\0\Ô{gw\â¢E‹¶^|ñ\Å)wviÙ²e\İ\áö~-_¾<\å®0w\Şy)w…S(\0u\Û\İı\ìg?\ëš8qbz\î¹\ç\Ò\áX¹reš0aBúÖ·¾õZkk\ëñF€º±cÇ	“\'ON\×]w]zó\Í7Ó‘›A\ãó.ºè¢¿\Ú\Ü	@\İtxxW_}uÚ·o_:\ÒfÌ˜\ß\ëÃ†\r;\ÆhP3±/6iFGv4¯\×ô\é\ÓÓ¨Q£\Ö\Zq\0j&Z‰}xGj“\æ»m\ê;vlW¥R™h\Ôt±Y3ÒŒ#4C\Ü\Ò\ÒÒ²\ßş=\0]œ‡§%¦+¯¼rOSS\Ó£À ‰+­Ä‰\çƒ\Õ\åõzé¥—R\îôö:¨€A3şü?Ä•V\æÁ+imm\İ_.—Ï³\0q-Í¸´X-\\{íµ»ššš\Ú,\0E\\<:®¥Y=öØ¾z\ë,\0E\Ü-!.][·n\íÊ¡\×i)\00(\â¶@½wKlq\ë¸5‘¥\0À ˆĞ©%¡À 9\çœsj\Ù\éu	=\0\Íw¾óš\í\Ó\ë\è\è\ØcŸ\0ƒfÊ”)µ:zsŞ¼y\Ş`\Ğ\\q\Åkku\Ş\äÉ“7;O€A3aÂ„oŒ;¶&Wd‰Ë¹\"\0ƒ|ûûÚ›\í\í\í±iÓµ7\\?øÁ¹\æšk5ô.¸\à‚\Í\î²\0À kmm=şüó\Ï\ïZ¾|ù ŞŸşô§­\Ñå¹Ÿ\051~üø\Éq#Ù£}\çô]»v\íonn\Ş\ã\Î\é\0\Ô\ÔØ±c7]{\íµGó –®ü;:\Ê\åòj£\r@M\ÅA%¹\ã\Ûz\Ã\r7\à\ëš4iÒ«q^^lN5\Ú\0\ÔEğ]pÁ?ı\éO\ÓÎ;\Ø&Í‹.º(\\Yg?\0u|£G^}\á…v=ÿüó‡}\ĞJ\ìÃ‹Mš:<\0\êVl2jÔ¨}S¦L\Ù\áw(›<Ÿz\ê©-±°\ç(M­\0Pÿ¢;\Ë]\Ú=Ñ­3¦kÚ´i»–,Y²oó\æ\Íû\ã~x½wKˆ‹G?üğ\Ã[\ã\Òbq¥•»8\Ï\æL\0†¤b£s-Èµ6á®¸-PUu\Æ>»\\\íqi1WZ ˆA˜Fùa#@£„\ŞqF€†½\áÃ‡Ÿ`$\0h„\Ğ\ë:ë¬³>f$\0hˆ\Ğ=zô\ÉF€F½ı\årù“F€Â«T*ûGŒqª‘\0 :½}#Gü´‘\0 ğ\Ê\åò\ŞQ£Fı‹‘\0 :½¸!\ìg\0z¹\Ûû‚‘\0 B\ï\í\\_1\04B\è\ínnn>\ËH\0Pxq·…–––²‘\0 :½·\â–CF€F½¹¾i$\0(¼J¥òF©Tú–‘\0 :½¿–\Ëå‹\0z¯\çn\ï»F€F½­¹.5\04B\èu\äšl$\0h„\Ğ\Û\\.—§\Z	\0\Z!ô6V*•«Œ\0…—»¼õ\Í\Í\Í\×	\0\Z¡\Ó[›;½\éF€F½5¹n0\0^\îòş\\.—o6\04B\è½\\*•n3\0^SS\ÓK¹~m$\0(¼r¹¼<‡\Ş]F€F\èô\ÏÁw‘\0 ğ*•Ê³¥R\é÷F€\Â\Ë]Ş“9ø\î7\04B\è=C\ï#@\á555=š\ëa#@#„\Ş\Ò\Ü\í-2\0^^¥RYb$\0h„Ğ››8\0…—\ïÁ\\\íF€Â‹\Ó\â´#@#„Ş¬z\Ï	\0\n/.A—\"3\04B\èı&‡Ş‹F€Â‹\Û\n\Åí…Œ\0…W©T~™C\ïß\0…W.—o\ÎÁ÷g#@#„Ş9ô\Ö	\0\n/\Şô¦¦¦µF€F\èô¦\å\Ğ[g$\0h„N\ïªz\0…\×\Ü\Ü|E\îö6	\0\n/wy“su	\0\n¯T*]V©T¶\Z	\0\n/\Şws§÷º‘\0 ğr\àM(—\ËÛ\0…W*•¾•»½7Œ\0…—»¼ór··\ÃH\0Px9ğF\çz\ËH\0Px•,‡\Ş.#@\á577Ÿ•Co·‘\0 ğJ¥\Òğzo	\0\n¯\\.!‡^g<omm=¾R©œ\Ş\Ò\Òrš‘`\ÈË¡¶=‡\Ü\Şü¸??¦j•‘ ¡wÇ»„]wE·g¤\0ò†\rvLtz^¹\\^n”\0hˆnO—@»½\Î~B\Ï\Ô(r¹<µŸ.oœ‘ rĞ½QzÛŒ\0…•;»‰U]\ŞD#@¡•\Ë\å7#ôŒ\0…W*•.z\0CTJ\é˜Õ«W¯kooO.Ló\ç\ÏW\êˆÕ‚\ÒÒ¥K»r\Íğ\×\Ô\\^[[[\ê\è\èHJñÚ²eKZ¼xqWÀişâ€šŠO\à©Á¾\Üùuú‹j*6iZ)«Á¨\Ø\Ü\é/¨©XY!+¡½ªzë¯›\Ò\ê\'•–/¸¼»\âyL³2WB(T\è\íØ¾!½8orzş\ïP1-^³BWB(L\è­[~ÿA\×[\ë—Ï±BWB(N\è½ô\ÈO½x\Í\n]	= 0¡÷\âüzñšºz€\ĞSJ\èC-ô\âhÍB/^³BWB(L\è­zô†C/^³BWB(L\èmÛ°,½øğ”ƒ7m\æiñšºz@aB/j\ÍS¿>(ôbš•¹z@±B\ï\í·Óª\Çf¼i3O‹×¬Ğ•\Ğ\nzqÅ•—½~À}zñš«²(¡\í\Ğ\ËÜ¦U‹\ÒM\Z0ğz+\Ş\ï\Õõ)¡¹\Ğ{¯\îN×§„P˜\Ğ{?\İİ»u}VğJ\èC&ôş\ÖÀ\ë-+x%ô€!zJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡÷~jıúõ\é„NH^xaZµjUúÒ—¾”¾öµ¯õûŞ¹s\ç¦\'x\âÀ\ìæŸ™={¶Pz€\Ğ\Z•‡!Íœ9ó€÷}\ÏÆ»§ñ‹_<`ú\İw\ß\İ=ı•W^9\ègn¿ıva\'ô\0¡W¡\á\Ï7oŞœ\Şxãƒ\ï\ÑGM_ù\ÊW\êw\ïŞy\æ™o¸»fMúù\Ï\Şı¹ñ3”K–,zBzõz·\ÜrKš5kV÷ó\Ø\äYı\Ú\äÉ“»\Ã-\îsŸ{çµ¶¶¶4~üø\î\éÛ·o\×0UBzu\×\é\Åó•+Wv?\ä‘GÒ±\Çû\ÎûN=õ\Ô\îªş\ÙmÛ¶uÿL\ã(ô„ ô\ê:ôz7Oö®¤T\èõ\İd*ô\0„Ş W\ïf\Ëq\ãÆ¥;v¤öööd‰\ç\'N\ì>J3>ü€Ÿ_±bE÷ô\Ø\Ô\Ù_\èq\Æi\áÂ…\é\ä“OzBzµ­­¥¨¾¨\ŞÍ›½›9#×­[÷\Îk–gyfwõş|ßŸ\ë=Í¡\ï.B@\è)¡ ô”\ĞzJ\è=%ô\0„z€Ğ³BVBzJ	=@\è)%ô\0¡§”\Ğ„zBzJ\è=%ô\0„z\0BO	=\0¡§„À>÷³BVBhmmmû;::¬”\ÕQ­õ\ë×¯Í¡\×\é/¨©E‹ıhñ\â\Å]¯½öZC­„w\ì\ØÑ¿»V·`Á‚½¹¦ù‹j.¯Œ¦\æÿ+6?5B\İw\ß}\é\Üs\ÏMs\ç\Îô\ß¿³¥¥%ı\æ7¿I2\Ş\Ñ\á	<€\Z©T*kr-©\Õ\ïojj\êÊ•\Ê\åòTK€£x\ßÈ³oô\è\ÑÿX\Ãy\Ø¡\×|+s\×y’%À\Ñœ7sı¢–ó\Ã\î\Ş\Ğ\ë©ıy®²t\08’7=wV;óÓ¿«q\èm\ëz½]\ß\ê<\'ZR\0–\Ö\Ö\Ö\ãs¨\ì\Í\árQ­\ç%\Ï\Ã\ÚşB¯§ö\æ\àg‰p8A3/‡\Şú:™—U\ïzQ\ë\"¤-5\0Ùˆ#N\í\Ùoö\Ùz˜Ÿ8xe€°{+\Ï\ãDK€\Ã\é¬ş=‡ÉŸ\êh~÷xo6\ìK€\Ã\éªF\æÀ\Û?fÌ˜\×Q\è-¨\n»öÜ‰şÏ˜Ç˜WK€¿Y“\×s°\ÜUgç­±\ß.\Ï\Û\éU\Ó\î\Êõº%À\ß\Z.?Êµ{\äÈ‘®§ù\êo3f\Ìc\Ìk\Â+-9\0\É\\ğŸrˆÄ•O.*ó\\*•.‹yy·8”.\ï¾\\¯\rµù.—\Ë¹Û›e	ğ¾´¶¶~\"innşòP›÷˜\ç˜÷ø–$\0\ï§\Ë{>wL\Ï\r\åù²$x¯ÀøJ\Ï\áÿÿ¤S ĞŠ²O,öI\Æw±D\èW\ÏÑE8ú±÷\è\ÓøN–,\0ˆó\Ürgôv‘\Îs‹\ïR\çPcE½¢I|§z»¢\0µ\r†ÿR\ÔkW\Ö\ãµC¨¡¸ƒBÜ®§¨\ß/¾[=\İ%€\Ú\Şg\ã^y9N)p\èRO÷ Frlˆ»¢7À÷¬›;¿P›\è\â{[[[/úw\ï\ß5¾³%\Ğxş.‡À\ÎJ¥rm£|\áü]§\ç\Ğ\Û\ß\İ\âh q#\Öo6\Ú÷\ïœ\ëş\0h£Gş\Çzûò\Êÿ\rzßˆ\ïc\à¿€\Æ\èò+—Ë«õû\ç\à[“\Ç\àQÿ%\0\ÜÈ‘#ÿ[^á§–––‰:9ğ\Ç\Ä477ÿWÿE\0\\^\Ùÿ6¯øw\å\0<®AC\ï…zOû/ qVü\ëq\Å_©TN\Ïß½Ë\Õ\Z\È\èÑ£Oó\Ör\×7©‘¾wş\ÎÎµ\Ø\0\r&¯ü\'Ä‘Œ---ÿ½¾o\ÜI=.G\æ\â\Ó\0|\Ìw/ü	Û•Je]®,u€5lØ°cr\è\í(•J¿/ò÷\Ì\İl9º\Ú\áÃ‡Ÿ`©4°xŸ)\êıôª:\Ú\×ò÷»\Ç\Ò \æ¼1\Ã\Û#Güû\Şùùû\ím\ÔS4\0\è?^\Éá°¼h\ß+w±¯\çnö6K€wœu\ÖY\ËÁ·\'×\äÿ7Wg\îò>l	\Ğ7$¾‡õ\çøtA¾Ï¸¥%À@A1/\Åöşğ‡\Ê\ß#‡+ów\Ùõ÷\Ï` vz~Cøk\ÄMrw777_a‰ğ®bófl\æ\ì{Ï½8\ì?O»ª\Ş\ç?\Ï\çu±iÓ’\à}‰Z\âÀ–8À¥¥¥\å´ü|cÜ’\'\×u\ØƒW\â K€Cé˜–\çğx=º¾À‹\Ú\\\Ïóœ;\Ñ_\Æ<[z\0Jxœ\ç\îU…]o\Õ\íf\Ã8=ND\Ò-A\0Ş—R©ôıM„}/\Åı\èâšuÚ™\ŞS\ï(\0õ\Õ\á\Í\ê/\ìª\ë\ì³\Ïş|½\Íw\\L:6\Ã\ÆÅ¥-E\0Ş—\Ö\Ö\Ö\ãsxÌ‰n \ĞË¯M«·ù\Îóõ`®W-A\0Ù¹\ç{R‘¶\\ı…ß‚zš×¸1lÏ•dş·%À\á†ßª>¡·¦\æ±R©,‰y´´\08\"š››¿œƒeK„^\Ü¯^\æ«\\.26\Å\æy:\İR\àˆŠ\Óz6yşºN\æ\ç‰z/X2\05R:fõ\ê\Õ\ë\Ú\Û\Û\ÓÂ…\Óüùó\ÕQª¹s\ç¦s\Ï=7\İÿı\ró,X–.]Ú•k†¿6 \æ\"ğ\Ú\Ú\ÚRGGG\ê\ì\ìTG¹v\ì\Ø\Ñp\ßyË–-iñ\â\Å]9\0§ù‹j*:<§#ør\ç\×\é/¨©Ø¤i¥¬£bs§¿8 ¦bEd…¬„ ôªê­¿nJ«ŸüUZ¾\àò\îŠ\ç1\Í\Ê\\	= P¡·cû†ô\â¼\É\éù¾w@Å´x\Í\n]	= 0¡·nùı^o­_>\Ç\n]	= 8¡÷\Ò#?0ô\â5+t%ô€Â„Ş‹ó8`\è\ÅkV\èJ\èBO)¡µĞ‹£5\n½x\Í\n]	= 0¡·\ê\Ñ½x\Í\n]	= 0¡·mÃ²ô\â\ÃSŞ´™§\ÅkV\èJ\è…	½¨5Oıú Ğ‹iV\æJ\è\Å\n½·\ßN«›qğ¦\Í<-^³BWB(D\è\ÅW^~ôú÷\é\Åk®Ê¢„0´C/wp›V-J/<4iÀÀ\ë­xO¼W×§„0\äBï½º;]Ÿz@aB\ïıtw\ï\ÖõYÁ+¡™\Ğû[¯·¬\à•\Ğ†L\è)%ô\0¡§”\Ğ„RBzJ	=@\è)¡ ô”\ĞzJ\è=%ô\0„^o-Y²$t\ÒIiÕªU\İ\ÏO;\í´#ö\Ùñ™³g\ÏjBzõQLù«¦ööö\î\Çcü{\íÚµ‡ı\Ùw\ß}w÷g½ò\Ê+‚M\èB¯öµq\ã\Æ\î`z\ä‘Gş\ãNğÛ¶uÿû\á‡~\ç=mmm\é\ÔSOMË–-;\à\ç>ö±¥\éÓ§ÿÇt×¬IŸúÔ§ø\ìİ»w§gy¦\ß\ß\Û\ßgy\æ™iøğ\á\İA<kÖ¬\îyù\ÈG>’z\ê)¡ ô\\\è\İr\Ë-\é\Ş{\ïMÿğÿp@\È\ÄkW\\qEw€\Åóÿø\Ç½\Ï?úÑ¦»\îº\ë€P?~|÷{¶o\ß~À\ï\è3{»\Ì\Ş\éˆñ¸r\åJ¡ ô\\\è\Å&\Èx¼é¦›\Şy-º½˜6nÜ¸\î}s\×_}w¸õ\İ4º~ıú~Ã©·k¬\Ç÷ú\ÌŞ®³÷ó\âqİºuB@\è\Ù\Ğ\ë\r±\ŞMs\æ\Ì\éŞ„YışÍ›7Ôµ3¦\ßn¬¿\Ğ{¯ÏŒ÷Ç¾À™3g¦c=6\íÜ¹\Ó>=\0¡wdªw“b\ï&\Íx>bÄˆBè“Ÿüdw‡v\Æg°y³ú\çû\Ûw·bÅŠ\î\×bSgß \è3\ãH\Ò\Ï|\æ3iË–-\ìkz\0B\ï°+Be\áÂ…\İ_\ï´}\èCìŸ‹`;\å”S\Ü\ÌXı³½°\ÄA)Qñ\ÙQ};Á>3º\Ã\Ş\î®oW)ô\0„z\0BO	=\0¡§„€\ĞSBzJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡§„€\ĞSBzBO	= Q\Ä}à¬•\Ğ\ZB[[\Ûş+euTkıúõks\èuú‹jjÑ¢E?Z¼xq\×k¯½få¬Z\à-X°`o®işâ€š\Ë+£©ùÿ\ÂßŠ\ÍOê½«R©‡C«N0\r6ì˜¦¦&û¦\0(¾‘#Gş½\Ğ !Œ3\æ\ã\år¹\ËH\0Px9ğş)wzB€†½Sr\è\í7\0^KK\Ëi9ôö	\0\n¯R©œCo¯‘\0 B\ï\Ìz{Œ\0…W*•†\ç\Ğ{\ÛH\0Px9ğ\ÎÎµ\ÛH\0Px•JeT¹\\\Şi$\0(¼x\ç\åNo‡‘\0 :½q9ô\Ş0\0^©Túv¾×\0z—\å\Ğ\Ûj$\0(¼\æ\æ\æ)\år¹\ÃH\0PxMMM?Êµ\ÉH\0Px¹Ë›–Co‘\0 B\ïºzk\0z7\å\Ğ{\ÅH\0Px•Jå—¹^6\0^\îò\îÌµ\ÂH\0\Ğ¡ww¹\\^f$\0(¼R©ôûJ¥ò¬‘\0 :½9¹0\04B\è\Í\Ëõ˜‘\0 Boa®¥F€F½¥|F€F½ör¹ü‘\0 B\ï‰8˜\ÅH\0PxqºBœ¶`$\0(¼r¹üBssóo\0…— ‹K‘	\0\n/.6]*•n3\0^¹\\^\İ\Ü\Ü<\ÃH\0PxqÙ¸‘¬‘\0 :½õ¹Ó»\ÆH\0\ĞŞ¦J¥r¥‘\0 :½\Ü\éM1\04B§·5×¥F€Â«T*\ÛsM4\04B§÷F½qF€F½¹¾i$\0(”#Fœš»º\ÓsXz;s5\0\n¥\\./\Ï—¨ı¹ö\Æ\æ\Î\Ö\Ö\Ö\ã\0CZKK\Ëi\ïzİ•ƒñ#@!\ä`{~ À«T*ûuy\04D·§\Ë pr¸­\ì\'ôö\éò\0(œR©ôõ~B\ïV#@!\å\ÛXx»†\rvŒQ \Ê\åòyUûò~bD\0(z··9B\ï«_ı\ê6\Z\0Fl¾\Ì÷ƒ\\m¹¶\ä\ê\ì{ K®m¹Ú›››g8¨€!\'.=–ƒlq²=\ïubz\ßsö\â\n.q\Ù2£@\İwv9´\Êa—%\ì¨v\0u\é\ì³\Ïş|\î\Ğv÷\r¯q\ãÆ¥›o¾9=şø\ãiÃ†\ri÷\î\İ)\ÄcGGGzú\é§\ÓwÜ‘&Nœ\Øß‰\ë»\âT£@İˆ£2[ZZöW\Ö÷¾÷½\î@Û·o_z¿{\î¹4iÒ¤¾\á×•?ªQ .¯zsf¿4gÎœC\n»¾z\è¡\Ô\Ú\ÚÚ·\ë|\0\ÔNl\ÒÌ\×U½)ó\å—_NG\Â_şò—tñ\Å\Ğñ\Ù\Ô	@M\ÄA+\Õûğ\"ğbİ‘ŸW|±\ÏÁ-\0º8J³z“\æ‘\êğú\ëøúl\ê|\Â\è0h\â<¼\êıx±\ïhŠ}|\Õû÷b³ª¥\0À ˆÏ«\ÒÜ³gO:\Ú.½ô\Ò\êÍœ\Ë-\0ºØ—W}¥•8-a0,[¶\ì€+·\ä:\Ñ\Ò\0à¨ŠSª^9œSUõ	\ìq­NK€£ª\ç\â\Ñ\İÁsë­·¦Á4s\æ\Ì.Sfi\0p´CoKoğÄ¥\ÅSlJ­\ÚÄ¹\İ\Ò\0\à¨\Êaó\Îş¼M›6\rj\è\Åy{Õ·%²4\08Ú\Ş;Á\Ó{ñ\èÁ¿¯ú÷[\Z\0Z\èÕ‚\Ğ@§\0Gš}z\04R§\ç\èM\0\Z&ôœ§@c\È\ÖUµº\"\Ë%—\\\âŠ,\0¸öf\ìOs\íM\0\ZB\ÜÓ®ú.ƒ\Ñ\íMš4\É]\0|q?½>]\î§@£t{mƒu\çôs\Î9Ç\Ó¨\Ö\Ö\Ö\ã\Ë\åò®\êƒZ\â<º#}^\Şøñ\ã«7k\îŠ\ßkôt¥R\é\ëÕ›9#øT\Ç^u\à\Å\ï‰\ßg\Ô¨eğ}¿:øbSg\ì\ã;œƒ[b^ŸMš\Ñ\åM5\Ú\0\Ô]ğõ\Õù\Üs\Ïòi	“\'O> \ì\âs\0õ|_¯\Ş\ÇW½\É3®\Üò\ä“Ov_«³÷\"\Õñû\ì\"\ãJ+\Õ\'W\ïÃ³I€º™T\Õy˜õ„ƒV\0¨{q_\îÒ©¾r\Ëû©¸\ÒJœx\Ş\Ü\Üüe£À—,\ë¹Vgt[ªoKTu9±\íqñè¸–¦K‹\0\0\0\0\0\0\0\0\0\0\0\0\0õ\àÿ¹°\"c<O e\0\0\0\0IEND®B`‚',1),('3',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0\0\0F_#Á\0\0ŒIDATx\Ú\í\İ\rŒ•õ½\'ğ\æ¦/f5©¹ñ^\Óm6Æ½Û¦\Ù÷n\Z³É¶¤\í¶\rmW\äœ93€\ÓúV‘¶\Û\ZI	E½µUz¥jE­¶Z‰­n-\"UD^¦:\ÖwQ+Š¼:€Tpx™ÿşsg\Ìa˜Q)0\ç\Ìs>Ÿ\ä—sxÎ™3\Ïù?\Îóõ÷¼~\à\0\ĞHRJ—nH\éùü8\ã\Şuim~ü\×\Şwö\íÏ¦9mO·½•\Ò÷gw¤\Û\ß\ís¯ºoÃ‹ùg\ëó\'q\0jæ…”–\ç0úlO(}\"\×\ÂB\ï¸WR\ÊoO\Ã{şı\Ï\ïö¹\í)ı[ŸŸ??‡\ë#@\Íüiszùš¹ÛÌ¡ô\îx>\Í\î	¾;r=\İ\İôùon\ë	­\ß^~÷ª\Ü\ä¥Gs\Í\Éu\Ì[\Ò\ê÷ı\îò»_‰\×>\ëó¯¦´,?\Şÿğöô‹Ÿ½\ä\Úü9ùñÿ\åzĞ¨P7?–\æ\Ç&\Ík|mû\Õs^{6¦\Í^¿?6sŒ\î\î\ê?tü5¦-Ø‘nÚ™R[÷\ë\éö·ÛMó\ã÷—\îO\×\ÏZ\ß?s|N\Ä\éùñú\ÇO\Çûoücz\ä/)=Ÿ÷³ùo¶u\0]¡/ßš^ˆ\ç3K{:½\ã®[ø\æ\ÖüxbOu\İ\Õ\Øúôô…»\ç¿5İ•§Ÿ4sEgì¸»*?ÿ—il\İ^õ¹m/¿Vô„\ã{‚un\Ï\çÙ¯@MB\ïüt\Şö\×#\èr]ù@GZ\Ó/û\åSù\ß_ˆÍœ\ËRZ\Şó\Ş%?_²wItoq0K~ü\æŒ?vlÉÅ-w.\ï\Ü\Ğ\Û\Õ\İútz0Oÿ\Ô\ïÖ¤\ßÆ´\Ë\ïùóª\ÙÓš<\í\Â\\÷\Zy\0jz\ç\äº|E¼ü8!§\ße±¯.\×s=‘\ë¬\èã •\\7\æZ”zF‰ı}¹.Èµ¸\' ¯\êù\ÙK{\Şwo®Sz\Ş{r®\è\"o7\ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À­O§ö\ïH)`¤¨©FŸŸ2ó¥uGùwœ¿!¥)F€Z‡\Ş\ÙmO·\å\Ç\ãzş}â¢·ÓÏ¦tõ\ïÖ¤ß¾Ë´O,İŸ®Ï_+¥\ïÇ´\Ù\ëÒ3_J÷\Æ{oy<\Í\ëy_ùªû6¼¸\"¥+{\ß\0µ¼~x{úÅŒ\Ç\Ò\Âüüœ˜V½©3O;f i7ş1=Aõ³ùo¶Ç´\è\æ6§ôƒx¾`Gº)¿6<_ı‡­Om\0jz£\â1:°U)M\ç?½iY\ß÷õ–\îƒ7?–\æG\ØS\İû\ë\"@{;\Æ\Ù\éöx-ß¹<\Í2\Ú\0\Ô2ğ\"¬¾\Ğóü\ã¿5\İÏ¯™»\í\Éü\ï“s}*6]4\íò{şœs2}:ş\ë›1\í\Êß­Y\Ù\Óıı¯\ê û\×Y¯®ˆŸ=¥ËŒ<\0µ½s\"\ÄzŸ\\„Ö‹)]\Õd=¯÷7\í\äö”ş­78\ÃÏ§\Ù=Ÿs~Ÿ\ßõõ\ŞÍ\0P„ıü\íÏ¦9½ûü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†„”\Òñó\æÍ»\ï†nxkÚ´i]\ßı\îwSkkkjjjJ£GN\ßşö·\Ó\äÉ“÷L:uÃ„	¾c\Ä\0r6n\Ü\Ør\çw¾y\É%—¤q\ãÆ¥_ı\êW\éñ\ÇO›6mJ»w\ïNaÏ=©££#=ù\ä“i\æÌ™i\ìØ±iüøñ]“&MZZ©TN4Š\0\Ô{gw\â¢E‹¶^|ñ\Å)wviÙ²e\İ\áö~-_¾<\å®0w\Şy)w…S(\0u\Û\İı\ìg?\ëš8qbz\î¹\ç\Ò\áX¹reš0aBúÖ·¾õZkk\ëñF€º±cÇ	“\'ON\×]w]zó\Í7Ó‘›A\ãó.ºè¢¿\Ú\Ü	@\İtxxW_}uÚ·o_:\ÒfÌ˜\ß\ëÃ†\r;\ÆhP3±/6iFGv4¯\×ô\é\ÓÓ¨Q£\Ö\Zq\0j&Z‰}xGj“\æ»m\ê;vlW¥R™h\Ôt±Y3ÒŒ#4C\Ü\Ò\ÒÒ²\ßş=\0]œ‡§%¦+¯¼rOSS\Ó£À ‰+­Ä‰\çƒ\Õ\åõzé¥—R\îôö:¨€A3şü?Ä•V\æÁ+imm\İ_.—Ï³\0q-Í¸´X-\\{íµ»ššš\Ú,\0E\\<:®¥Y=öØ¾z\ë,\0E\Ü-!.][·n\íÊ¡\×i)\00(\â¶@½wKlq\ë¸5‘¥\0À ˆĞ©%¡À 9\çœsj\Ù\éu	=\0\Íw¾óš\í\Ó\ë\è\è\ØcŸ\0ƒfÊ”)µ:zsŞ¼y\Ş`\Ğ\\q\Åkku\Ş\äÉ“7;O€A3aÂ„oŒ;¶&Wd‰Ë¹\"\0ƒ|ûûÚ›\í\í\í±iÓµ7\\?øÁ¹\æšk5ô.¸\à‚\Í\î²\0À kmm=şüó\Ï\ïZ¾|ù ŞŸşô§­\Ñå¹Ÿ\051~üø\Éq#Ù£}\çô]»v\íonn\Ş\ã\Î\é\0\Ô\ÔØ±c7]{\íµGó –®ü;:\Ê\åòj£\r@M\ÅA%¹\ã\Ûz\Ã\r7\à\ëš4iÒ«q^^lN5\Ú\0\ÔEğ]pÁ?ı\éO\ÓÎ;\Ø&Í‹.º(\\Yg?\0u|£G^}\á…v=ÿüó‡}\ĞJ\ìÃ‹Mš:<\0\êVl2jÔ¨}S¦L\Ù\áw(›<Ÿz\ê©-±°\ç(M­\0Pÿ¢;\Ë]\Ú=Ñ­3¦kÚ´i»–,Y²oó\æ\Íû\ã~x½wKˆ‹G?üğ\Ã[\ã\Òbq¥•»8\Ï\æL\0†¤b£s-Èµ6á®¸-PUu\Æ>»\\\íqi1WZ ˆA˜Fùa#@£„\ŞqF€†½\áÃ‡Ÿ`$\0h„\Ğ\ë:ë¬³>f$\0hˆ\Ğ=zô\ÉF€F½ı\årù“F€Â«T*ûGŒqª‘\0 :½}#Gü´‘\0 ğ\Ê\åò\ŞQ£Fı‹‘\0 :½¸!\ìg\0z¹\Ûû‚‘\0 B\ï\í\\_1\04B\è\ínnn>\ËH\0Pxq·…–––²‘\0 :½·\â–CF€F½¹¾i$\0(¼J¥òF©Tú–‘\0 :½¿–\Ëå‹\0z¯\çn\ï»F€F½­¹.5\04B\èu\äšl$\0h„\Ğ\Û\\.—§\Z	\0\Z!ô6V*•«Œ\0…—»¼õ\Í\Í\Í\×	\0\Z¡\Ó[›;½\éF€F½5¹n0\0^\îòş\\.—o6\04B\è½\\*•n3\0^SS\ÓK¹~m$\0(¼r¹¼<‡\Ş]F€F\èô\ÏÁw‘\0 ğ*•Ê³¥R\é÷F€\Â\Ë]Ş“9ø\î7\04B\è=C\ï#@\á555=š\ëa#@#„\Ş\Ò\Ü\í-2\0^^¥RYb$\0h„Ğ››8\0…—\ïÁ\\\íF€Â‹\Ó\â´#@#„Ş¬z\Ï	\0\n/.A—\"3\04B\èı&‡Ş‹F€Â‹\Û\n\Åí…Œ\0…W©T~™C\ïß\0…W.—o\ÎÁ÷g#@#„Ş9ô\Ö	\0\n/\Şô¦¦¦µF€F\èô¦\å\Ğ[g$\0h„N\ïªz\0…\×\Ü\Ü|E\îö6	\0\n/wy“su	\0\n¯T*]V©T¶\Z	\0\n/\Şws§÷º‘\0 ğr\àM(—\ËÛ\0…W*•¾•»½7Œ\0…—»¼ór··\ÃH\0Px9ğF\çz\ËH\0Px•,‡\Ş.#@\á577Ÿ•Co·‘\0 ğJ¥\Òğzo	\0\n¯\\.!‡^g<omm=¾R©œ\Ş\Ò\Òrš‘`\ÈË¡¶=‡\Ü\Şü¸??¦j•‘ ¡wÇ»„]wE·g¤\0ò†\rvLtz^¹\\^n”\0hˆnO—@»½\Î~B\Ï\Ô(r¹<µŸ.oœ‘ rĞ½QzÛŒ\0…•;»‰U]\ŞD#@¡•\Ë\å7#ôŒ\0…W*•.z\0CTJ\é˜Õ«W¯kooO.Ló\ç\ÏW\êˆÕ‚\ÒÒ¥K»r\Íğ\×\Ô\\^[[[\ê\è\èHJñÚ²eKZ¼xqWÀişâ€šŠO\à©Á¾\Üùuú‹j*6iZ)«Á¨\Ø\Ü\é/¨©XY!+¡½ªzë¯›\Ò\ê\'•–/¸¼»\âyL³2WB(T\è\íØ¾!½8orzş\ïP1-^³BWB(L\è­[~ÿA\×[\ë—Ï±BWB(N\è½ô\ÈO½x\Í\n]	= 0¡÷\âüzñšºz€\ĞSJ\èC-ô\âhÍB/^³BWB(L\è­zô†C/^³BWB(L\èmÛ°,½øğ”ƒ7m\æiñšºz@aB/j\ÍS¿>(ôbš•¹z@±B\ï\í·Óª\Çf¼i3O‹×¬Ğ•\Ğ\nzqÅ•—½~À}zñš«²(¡\í\Ğ\ËÜ¦U‹\ÒM\Z0ğz+\Ş\ï\Õõ)¡¹\Ğ{¯\îN×§„P˜\Ğ{?\İİ»u}VğJ\èC&ôş\ÖÀ\ë-+x%ô€!zJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡÷~jıúõ\é„NH^xaZµjUúÒ—¾”¾öµ¯õûŞ¹s\ç¦\'x\âÀ\ìæŸ™={¶Pz€\Ğ\Z•‡!Íœ9ó€÷}\ÏÆ»§ñ‹_<`ú\İw\ß\İ=ı•W^9\ègn¿ıva\'ô\0¡W¡\á\Ï7oŞœ\Şxãƒ\ï\ÑGM_ù\ÊW\êw\ïŞy\æ™o¸»fMúù\Ï\Şı¹ñ3”K–,zBzõz·\ÜrKš5kV÷ó\Ø\äYı\Ú\äÉ“»\Ã-\îsŸ{çµ¶¶¶4~üø\î\éÛ·o\×0UBzu\×\é\Åó•+Wv?\ä‘GÒ±\Çû\ÎûN=õ\Ô\îªş\ÙmÛ¶uÿL\ã(ô„ ô\ê:ôz7Oö®¤T\èõ\İd*ô\0„Ş W\ïf\Ëq\ãÆ¥;v¤öööd‰\ç\'N\ì>J3>ü€Ÿ_±bE÷ô\Ø\Ô\Ù_\èq\Æi\áÂ…\é\ä“OzBzµ­­¥¨¾¨\ŞÍ›½›9#×­[÷\Îk–gyfwõş|ßŸ\ë=Í¡\ï.B@\è)¡ ô”\ĞzJ\è=%ô\0„z€Ğ³BVBzJ	=@\è)%ô\0¡§”\Ğ„zBzJ\è=%ô\0„z\0BO	=\0¡§„À>÷³BVBhmmmû;::¬”\ÕQ­õ\ë×¯Í¡\×\é/¨©E‹ıhñ\â\Å]¯½öZC­„w\ì\ØÑ¿»V·`Á‚½¹¦ù‹j.¯Œ¦\æÿ+6?5B\İw\ß}\é\Üs\ÏMs\ç\Îô\ß¿³¥¥%ı\æ7¿I2\Ş\Ñ\á	<€\Z©T*kr-©\Õ\ïojj\êÊ•\Ê\åòTK€£x\ßÈ³oô\è\ÑÿX\Ãy\Ø¡\×|+s\×y’%À\Ñœ7sı¢–ó\Ã\î\Ş\Ğ\ë©ıy®²t\08’7=wV;óÓ¿«q\èm\ëz½]\ß\ê<\'ZR\0–\Ö\Ö\Ö\ãs¨\ì\Í\árQ­\ç%\Ï\Ã\ÚşB¯§ö\æ\àg‰p8A3/‡\Şú:™—U\ïzQ\ë\"¤-5\0Ùˆ#N\í\Ùoö\Ùz˜Ÿ8xe€°{+\Ï\ãDK€\Ã\é¬ş=‡ÉŸ\êh~÷xo6\ìK€\Ã\éªF\æÀ\Û?fÌ˜\×Q\è-¨\n»öÜ‰şÏ˜Ç˜WK€¿Y“\×s°\ÜUgç­±\ß.\Ï\Û\éU\Ó\î\Êõº%À\ß\Z.?Êµ{\äÈ‘®§ù\êo3f\Ìc\Ìk\Â+-9\0\É\\ğŸrˆÄ•O.*ó\\*•.‹yy·8”.\ï¾\\¯\rµù.—\Ë¹Û›e	ğ¾´¶¶~\"innşòP›÷˜\ç˜÷ø–$\0\ï§\Ë{>wL\Ï\r\åù²$x¯ÀøJ\Ï\áÿÿ¤S ĞŠ²O,öI\Æw±D\èW\ÏÑE8ú±÷\è\ÓøN–,\0ˆó\Ürgôv‘\Îs‹\ïR\çPcE½¢I|§z»¢\0µ\r†ÿR\ÔkW\Ö\ãµC¨¡¸ƒBÜ®§¨\ß/¾[=\İ%€\Ú\Şg\ã^y9N)p\èRO÷ Frlˆ»¢7À÷¬›;¿P›\è\â{[[[/úw\ï\ß5¾³%\Ğxş.‡À\ÎJ¥rm£|\áü]§\ç\Ğ\Û\ß\İ\âh q#\Öo6\Ú÷\ïœ\ëş\0h£Gş\Çzûò\Êÿ\rzßˆ\ïc\à¿€\Æ\èò+—Ë«õû\ç\à[“\Ç\àQÿ%\0\ÜÈ‘#ÿ[^á§–––‰:9ğ\Ç\Ä477ÿWÿE\0\\^\Ùÿ6¯øw\å\0<®AC\ï…zOû/ qVü\ëq\Å_©TN\Ïß½Ë\Õ\Z\È\èÑ£Oó\Ör\×7©‘¾wş\ÎÎµ\Ø\0\r&¯ü\'Ä‘Œ---ÿ½¾o\ÜI=.G\æ\â\Ó\0|\Ìw/ü	Û•Je]®,u€5lØ°cr\è\í(•J¿/ò÷\Ì\İl9º\Ú\áÃ‡Ÿ`©4°xŸ)\êıôª:\Ú\×ò÷»\Ç\Ò \æ¼1\Ã\Û#Güû\Şùùû\ím\ÔS4\0\è?^\Éá°¼h\ß+w±¯\çnö6K€wœu\ÖY\ËÁ·\'×\äÿ7Wg\îò>l	\Ğ7$¾‡õ\çøtA¾Ï¸¥%À@A1/\Åöşğ‡\Ê\ß#‡+ów\Ùõ÷\Ï` vz~Cøk\ÄMrw777_a‰ğ®bófl\æ\ì{Ï½8\ì?O»ª\Ş\ç?\Ï\çu±iÓ’\à}‰Z\âÀ–8À¥¥¥\å´ü|cÜ’\'\×u\ØƒW\â K€Cé˜–\çğx=º¾À‹\Ú\\\Ïóœ;\Ñ_\Æ<[z\0Jxœ\ç\îU…]o\Õ\íf\Ã8=ND\Ò-A\0Ş—R©ôıM„}/\Åı\èâšuÚ™\ŞS\ï(\0õ\Õ\á\Í\ê/\ìª\ë\ì³\Ïş|½\Íw\\L:6\Ã\ÆÅ¥-E\0Ş—\Ö\Ö\Ö\ãsxÌ‰n \ĞË¯M«·ù\Îóõ`®W-A\0Ù¹\ç{R‘¶\\ı…ß‚zš×¸1lÏ•dş·%À\á†ßª>¡·¦\æ±R©,‰y´´\08\"š››¿œƒeK„^\Ü¯^\æ«\\.26\Å\æy:\İR\àˆŠ\Óz6yşºN\æ\ç‰z/X2\05R:fõ\ê\Õ\ë\Ú\Û\Û\ÓÂ…\Óüùó\ÕQª¹s\ç¦s\Ï=7\İÿı\ró,X–.]Ú•k†¿6 \æ\"ğ\Ú\Ú\ÚRGGG\ê\ì\ìTG¹v\ì\Ø\Ñp\ßyË–-iñ\â\Å]9\0§ù‹j*:<§#ør\ç\×\é/¨©Ø¤i¥¬£bs§¿8 ¦bEd…¬„ ôªê­¿nJ«ŸüUZ¾\àò\îŠ\ç1\Í\Ê\\	= P¡·cû†ô\â¼\É\éù¾w@Å´x\Í\n]	= 0¡·nùı^o­_>\Ç\n]	= 8¡÷\Ò#?0ô\â5+t%ô€Â„Ş‹ó8`\è\ÅkV\èJ\èBO)¡µĞ‹£5\n½x\Í\n]	= 0¡·\ê\Ñ½x\Í\n]	= 0¡·mÃ²ô\â\ÃSŞ´™§\ÅkV\èJ\è…	½¨5Oıú Ğ‹iV\æJ\è\Å\n½·\ßN«›qğ¦\Í<-^³BWB(D\è\ÅW^~ôú÷\é\Åk®Ê¢„0´C/wp›V-J/<4iÀÀ\ë­xO¼W×§„0\äBï½º;]Ÿz@aB\ïıtw\ï\ÖõYÁ+¡™\Ğû[¯·¬\à•\Ğ†L\è)%ô\0¡§”\Ğ„RBzJ	=@\è)¡ ô”\ĞzJ\è=%ô\0„^o-Y²$t\ÒIiÕªU\İ\ÏO;\í´#ö\Ùñ™³g\ÏjBzõQLù«¦ööö\î\Çcü{\íÚµ‡ı\Ùw\ß}w÷g½ò\Ê+‚M\èB¯öµq\ã\Æ\î`z\ä‘Gş\ãNğÛ¶uÿû\á‡~\ç=mmm\é\ÔSOMË–-;\à\ç>ö±¥\éÓ§ÿÇt×¬IŸúÔ§ø\ìİ»w§gy¦\ß\ß\Û\ßgy\æ™iøğ\á\İA<kÖ¬\îyù\ÈG>’z\ê)¡ ô\\\è\İr\Ë-\é\Ş{\ïMÿğÿp@\È\ÄkW\\qEw€\Åóÿø\Ç½\Ï?úÑ¦»\îº\ë€P?~|÷{¶o\ß~À\ï\è3{»\Ì\Ş\éˆñ¸r\åJ¡ ô\\\è\Å&\Èx¼é¦›\Şy-º½˜6nÜ¸\î}s\×_}w¸õ\İ4º~ıú~Ã©·k¬\Ç÷ú\ÌŞ®³÷ó\âqİºuB@\è\Ù\Ğ\ë\r±\ŞMs\æ\Ì\éŞ„YışÍ›7Ôµ3¦\ßn¬¿\Ğ{¯ÏŒ÷Ç¾À™3g¦c=6\íÜ¹\Ó>=\0¡wdªw“b\ï&\Íx>bÄˆBè“Ÿüdw‡v\Æg°y³ú\çû\Ûw·bÅŠ\î\×bSgß \è3\ãH\Ò\Ï|\æ3iË–-\ìkz\0B\ï°+Be\áÂ…\İ_\ï´}\èCìŸ‹`;\å”S\Ü\ÌXı³½°\ÄA)Qñ\ÙQ};Á>3º\Ã\Ş\î®oW)ô\0„z\0BO	=\0¡§„€\ĞSBzJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡§„€\ĞSBzBO	= Q\Ä}à¬•\Ğ\ZB[[\Ûş+euTkıúõks\èuú‹jjÑ¢E?Z¼xq\×k¯½få¬Z\à-X°`o®işâ€š\Ë+£©ùÿ\ÂßŠ\ÍOê½«R©‡C«N0\r6ì˜¦¦&û¦\0(¾‘#Gş½\Ğ !Œ3\æ\ã\år¹\ËH\0Px9ğş)wzB€†½Sr\è\í7\0^KK\Ëi9ôö	\0\n¯R©œCo¯‘\0 B\ï\Ìz{Œ\0…W*•†\ç\Ğ{\ÛH\0Px9ğ\ÎÎµ\ÛH\0Px•JeT¹\\\Şi$\0(¼x\ç\åNo‡‘\0 :½q9ô\Ş0\0^©Túv¾×\0z—\å\Ğ\Ûj$\0(¼\æ\æ\æ)\år¹\ÃH\0PxMMM?Êµ\ÉH\0Px¹Ë›–Co‘\0 B\ïºzk\0z7\å\Ğ{\ÅH\0Px•Jå—¹^6\0^\îò\îÌµ\ÂH\0\Ğ¡ww¹\\^f$\0(¼R©ôûJ¥ò¬‘\0 :½9¹0\04B\è\Í\Ëõ˜‘\0 Boa®¥F€F½¥|F€F½ör¹ü‘\0 B\ï‰8˜\ÅH\0PxqºBœ¶`$\0(¼r¹üBssóo\0…— ‹K‘	\0\n/.6]*•n3\0^¹\\^\İ\Ü\Ü<\ÃH\0PxqÙ¸‘¬‘\0 :½õ¹Ó»\ÆH\0\ĞŞ¦J¥r¥‘\0 :½\Ü\éM1\04B§·5×¥F€Â«T*\ÛsM4\04B§÷F½qF€F½¹¾i$\0(”#Fœš»º\ÓsXz;s5\0\n¥\\./\Ï—¨ı¹ö\Æ\æ\Î\Ö\Ö\Ö\ã\0CZKK\Ëi\ïzİ•ƒñ#@!\ä`{~ À«T*ûuy\04D·§\Ë pr¸­\ì\'ôö\éò\0(œR©ôõ~B\ïV#@!\å\ÛXx»†\rvŒQ \Ê\åòyUûò~bD\0(z··9B\ï«_ı\ê6\Z\0Fl¾\Ì÷ƒ\\m¹¶\ä\ê\ì{ K®m¹Ú›››g8¨€!\'.=–ƒlq²=\ïubz\ßsö\â\n.q\Ù2£@\İwv9´\Êa—%\ì¨v\0u\é\ì³\Ïş|\î\Ğv÷\r¯q\ãÆ¥›o¾9=şø\ãiÃ†\ri÷\î\İ)\ÄcGGGzú\é§\ÓwÜ‘&Nœ\Øß‰\ë»\âT£@İˆ£2[ZZöW\Ö÷¾÷½\î@Û·o_z¿{\î¹4iÒ¤¾\á×•?ªQ .¯zsf¿4gÎœC\n»¾z\è¡\Ô\Ú\ÚÚ·\ë|\0\ÔNl\ÒÌ\×U½)ó\å—_NG\Â_şò—tñ\Å\Ğñ\Ù\Ô	@M\ÄA+\Õûğ\"ğbİ‘ŸW|±\ÏÁ-\0º8J³z“\æ‘\êğú\ëøúl\ê|\Â\è0h\â<¼\êıx±\ïhŠ}|\Õû÷b³ª¥\0À ˆÏ«\ÒÜ³gO:\Ú.½ô\Ò\êÍœ\Ë-\0ºØ—W}¥•8-a0,[¶\ì€+·\ä:\Ñ\Ò\0à¨ŠSª^9œSUõ	\ìq­NK€£ª\ç\â\Ñ\İÁsë­·¦Á4s\æ\Ì.Sfi\0p´CoKoğÄ¥\ÅSlJ­\ÚÄ¹\İ\Ò\0\à¨\Êaó\Îş¼M›6\rj\è\Åy{Õ·%²4\08Ú\Ş;Á\Ó{ñ\èÁ¿¯ú÷[\Z\0Z\èÕ‚\Ğ@§\0Gš}z\04R§\ç\èM\0\Z&ôœ§@c\È\ÖUµº\"\Ë%—\\\âŠ,\0¸öf\ìOs\íM\0\ZB\ÜÓ®ú.ƒ\Ñ\íMš4\É]\0|q?½>]\î§@£t{mƒu\çôs\Î9Ç\Ó¨\Ö\Ö\Ö\ã\Ë\åò®\êƒZ\â<º#}^\Şøñ\ã«7k\îŠ\ßkôt¥R\é\ëÕ›9#øT\Ç^u\à\Å\ï‰\ßg\Ô¨eğ}¿:øbSg\ì\ã;œƒ[b^ŸMš\Ñ\åM5\Ú\0\Ô]ğõ\Õù\Üs\Ïòi	“\'O> \ì\âs\0õ|_¯\Ş\ÇW½\É3®\Üò\ä“Ov_«³÷\"\Õñû\ì\"\ãJ+\Õ\'W\ïÃ³I€º™T\Õy˜õ„ƒV\0¨{q_\îÒ©¾r\Ëû©¸\ÒJœx\Ş\Ü\Üüe£À—,\ë¹Vgt[ªoKTu9±\íqñè¸–¦K‹\0\0\0\0\0\0\0\0\0\0\0\0\0õ\àÿ¹°\"c<O e\0\0\0\0IEND®B`‚',1),('5002',1,'processes/Entrust.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5003',1,'processes/Entrust.Entrust.png','5001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1),('7502',1,'processes/Entrust.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7503',1,'processes/Entrust.Entrust.png','7501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1),('7506',1,'processes/Entrust.bpmn20.xml','7505','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7507',1,'processes/Entrust.Entrust.png','7505','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','22501',10),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('10006','Entrust:4:7508','10001','10005','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-03 10:57:11.575','2019-06-03 10:57:11.585',10,NULL,''),('10007','Entrust:4:7508','10001','10005','submitEntrust','10008',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:57:11.595',NULL,NULL,NULL,''),('12506','Entrust:4:7508','12501','12505','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-03 10:58:39.272','2019-06-03 10:58:39.276',4,NULL,''),('12507','Entrust:4:7508','12501','12505','submitEntrust','12508',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:58:39.279',NULL,NULL,NULL,''),('17506','Entrust:5:15006','17501','17505','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:15.331','2019-06-04 11:50:15.333',2,NULL,''),('17507','Entrust:5:15006','17501','17505','submitEntrust','17508',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:15.335',NULL,NULL,NULL,''),('17515','Entrust:5:15006','17510','17514','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.844',1,NULL,''),('17516','Entrust:5:15006','17510','17514','submitEntrust','17517',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:16.844',NULL,NULL,NULL,''),('17524','Entrust:5:15006','17519','17523','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257',0,NULL,''),('17525','Entrust:5:15006','17519','17523','submitEntrust','17526',NULL,'ToSubmit','userTask','u20190604195011','2019-06-04 11:50:18.258',NULL,NULL,NULL,''),('17533','Entrust:5:15006','17528','17532','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.366',1,NULL,''),('17534','Entrust:5:15006','17528','17532','submitEntrust','17535',NULL,'ToSubmit','userTask','u20190604195013','2019-06-04 11:50:19.366',NULL,NULL,NULL,''),('17542','Entrust:5:15006','17537','17541','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:21.269','2019-06-04 11:50:21.269',0,NULL,''),('17543','Entrust:5:15006','17537','17541','submitEntrust','17544',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:21.269',NULL,NULL,NULL,''),('17551','Entrust:5:15006','17546','17550','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:22.656','2019-06-04 11:50:22.656',0,NULL,''),('17552','Entrust:5:15006','17546','17550','submitEntrust','17553',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:22.656',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('10009',NULL,'participant','201906031001',NULL,'10001'),('12509',NULL,'participant','201906031001',NULL,'12501'),('17509',NULL,'participant','u20190604195010',NULL,'17501'),('17518',NULL,'participant','u20190604195010',NULL,'17510'),('17527',NULL,'participant','u20190604195011',NULL,'17519'),('17536',NULL,'participant','u20190604195013',NULL,'17528'),('17545',NULL,'participant','u20190604195014',NULL,'17537'),('17554',NULL,'participant','u20190604195014',NULL,'17546');
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('17501','17501',NULL,'Entrust:5:15006','2019-06-04 11:50:15.275',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17510','17510',NULL,'Entrust:5:15006','2019-06-04 11:50:16.843',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17519','17519',NULL,'Entrust:5:15006','2019-06-04 11:50:18.257',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17528','17528',NULL,'Entrust:5:15006','2019-06-04 11:50:19.365',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17537','17537',NULL,'Entrust:5:15006','2019-06-04 11:50:21.268',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17546','17546',NULL,'Entrust:5:15006','2019-06-04 11:50:22.655',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('17508','Entrust:5:15006','submitEntrust','17501','17505','ToSubmit',NULL,NULL,NULL,'u20190604195010','2019-06-04 11:50:15.350',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17517','Entrust:5:15006','submitEntrust','17510','17514','ToSubmit',NULL,NULL,NULL,'u20190604195010','2019-06-04 11:50:16.844',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17526','Entrust:5:15006','submitEntrust','17519','17523','ToSubmit',NULL,NULL,NULL,'u20190604195011','2019-06-04 11:50:18.258',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17535','Entrust:5:15006','submitEntrust','17528','17532','ToSubmit',NULL,NULL,NULL,'u20190604195013','2019-06-04 11:50:19.366',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17544','Entrust:5:15006','submitEntrust','17537','17541','ToSubmit',NULL,NULL,NULL,'u20190604195014','2019-06-04 11:50:21.269',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17553','Entrust:5:15006','submitEntrust','17546','17550','ToSubmit',NULL,NULL,NULL,'u20190604195014','2019-06-04 11:50:22.656',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('17502','17501','17501',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195010',NULL,'2019-06-04 11:50:15.329','2019-06-04 11:50:15.329'),('17503','17501','17501',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195015',NULL,'2019-06-04 11:50:15.330','2019-06-04 11:50:15.330'),('17504','17501','17501',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:15.330','2019-06-04 11:50:15.330'),('17511','17510','17510',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195010',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.843'),('17512','17510','17510',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195016',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.843'),('17513','17510','17510',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.843'),('17520','17519','17519',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195011',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257'),('17521','17519','17519',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195018',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257'),('17522','17519','17519',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257'),('17529','17528','17528',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195013',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.365'),('17530','17528','17528',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195019',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.365'),('17531','17528','17528',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.365'),('17538','17537','17537',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195014',NULL,'2019-06-04 11:50:21.268','2019-06-04 11:50:21.268'),('17539','17537','17537',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195021',NULL,'2019-06-04 11:50:21.268','2019-06-04 11:50:21.268'),('17540','17537','17537',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:21.268','2019-06-04 11:50:21.268'),('17547','17546','17546',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195014',NULL,'2019-06-04 11:50:22.655','2019-06-04 11:50:22.655'),('17548','17546','17546',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195022',NULL,'2019-06-04 11:50:22.655','2019-06-04 11:50:22.655'),('17549','17546','17546',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:22.656','2019-06-04 11:50:22.656');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('15001','SpringAutoDeployment',NULL,NULL,'','2019-06-04 11:49:32.248',NULL),('20001','SpringAutoDeployment',NULL,NULL,'','2019-06-05 05:41:31.246',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('5001','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('7501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('Entrust:1:2506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:5:15006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',5,'15001','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:6:20007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',6,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:3:15007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',3,'15001','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:4:20006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',4,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('17501',1,'17501',NULL,NULL,'Entrust:5:15006',NULL,'17501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:15.275',NULL,NULL,0,0,0,0,0,0,0,0,0),('17505',1,'17501',NULL,'17501','Entrust:5:15006',NULL,'17501','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:15.330',NULL,NULL,0,0,0,0,0,0,0,0,0),('17510',1,'17510',NULL,NULL,'Entrust:5:15006',NULL,'17510',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:16.843',NULL,NULL,0,0,0,0,0,0,0,0,0),('17514',1,'17510',NULL,'17510','Entrust:5:15006',NULL,'17510','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:16.843',NULL,NULL,0,0,0,0,0,0,0,0,0),('17519',1,'17519',NULL,NULL,'Entrust:5:15006',NULL,'17519',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:18.257',NULL,NULL,0,0,0,0,0,0,0,0,0),('17523',1,'17519',NULL,'17519','Entrust:5:15006',NULL,'17519','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:18.257',NULL,NULL,0,0,0,0,0,0,0,0,0),('17528',1,'17528',NULL,NULL,'Entrust:5:15006',NULL,'17528',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:19.365',NULL,NULL,0,0,0,0,0,0,0,0,0),('17532',1,'17528',NULL,'17528','Entrust:5:15006',NULL,'17528','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:19.365',NULL,NULL,0,0,0,0,0,0,0,0,0),('17537',1,'17537',NULL,NULL,'Entrust:5:15006',NULL,'17537',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:21.268',NULL,NULL,0,0,0,0,0,0,0,0,0),('17541',1,'17537',NULL,'17537','Entrust:5:15006',NULL,'17537','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:21.269',NULL,NULL,0,0,0,0,0,0,0,0,0),('17546',1,'17546',NULL,NULL,'Entrust:5:15006',NULL,'17546',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:22.655',NULL,NULL,0,0,0,0,0,0,0,0,0),('17550',1,'17546',NULL,'17546','Entrust:5:15006',NULL,'17546','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:22.656',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('17509',1,NULL,'participant','u20190604195010',NULL,'17501',NULL),('17518',1,NULL,'participant','u20190604195010',NULL,'17510',NULL),('17527',1,NULL,'participant','u20190604195011',NULL,'17519',NULL),('17536',1,NULL,'participant','u20190604195013',NULL,'17528',NULL),('17545',1,NULL,'participant','u20190604195014',NULL,'17537',NULL),('17554',1,NULL,'participant','u20190604195014',NULL,'17546',NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('17508',1,'17505','17501','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195010',NULL,50,'2019-06-04 11:50:15.335',NULL,NULL,1,'',NULL,NULL),('17517',1,'17514','17510','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195010',NULL,50,'2019-06-04 11:50:16.844',NULL,NULL,1,'',NULL,NULL),('17526',1,'17523','17519','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195011',NULL,50,'2019-06-04 11:50:18.258',NULL,NULL,1,'',NULL,NULL),('17535',1,'17532','17528','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195013',NULL,50,'2019-06-04 11:50:19.366',NULL,NULL,1,'',NULL,NULL),('17544',1,'17541','17537','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195014',NULL,50,'2019-06-04 11:50:21.269',NULL,NULL,1,'',NULL,NULL),('17553',1,'17550','17546','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195014',NULL,50,'2019-06-04 11:50:22.656',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('17502',1,'string','ClientID','17501','17501',NULL,NULL,NULL,NULL,'u20190604195010',NULL),('17503',1,'string','EntrustID','17501','17501',NULL,NULL,NULL,NULL,'p20190604195015',NULL),('17504',1,'string','WorkerIDs','17501','17501',NULL,NULL,NULL,NULL,'w2',NULL),('17511',1,'string','ClientID','17510','17510',NULL,NULL,NULL,NULL,'u20190604195010',NULL),('17512',1,'string','EntrustID','17510','17510',NULL,NULL,NULL,NULL,'p20190604195016',NULL),('17513',1,'string','WorkerIDs','17510','17510',NULL,NULL,NULL,NULL,'w2',NULL),('17520',1,'string','ClientID','17519','17519',NULL,NULL,NULL,NULL,'u20190604195011',NULL),('17521',1,'string','EntrustID','17519','17519',NULL,NULL,NULL,NULL,'p20190604195018',NULL),('17522',1,'string','WorkerIDs','17519','17519',NULL,NULL,NULL,NULL,'w2',NULL),('17529',1,'string','ClientID','17528','17528',NULL,NULL,NULL,NULL,'u20190604195013',NULL),('17530',1,'string','EntrustID','17528','17528',NULL,NULL,NULL,NULL,'p20190604195019',NULL),('17531',1,'string','WorkerIDs','17528','17528',NULL,NULL,NULL,NULL,'w2',NULL),('17538',1,'string','ClientID','17537','17537',NULL,NULL,NULL,NULL,'u20190604195014',NULL),('17539',1,'string','EntrustID','17537','17537',NULL,NULL,NULL,NULL,'p20190604195021',NULL),('17540',1,'string','WorkerIDs','17537','17537',NULL,NULL,NULL,NULL,'w2',NULL),('17547',1,'string','ClientID','17546','17546',NULL,NULL,NULL,NULL,'u20190604195014',NULL),('17548',1,'string','EntrustID','17546','17546',NULL,NULL,NULL,NULL,'p20190604195022',NULL),('17549',1,'string','WorkerIDs','17546','17546',NULL,NULL,NULL,NULL,'w2',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `accept_opinions` varchar(255) DEFAULT NULL,
  `anti_virus` varchar(255) DEFAULT NULL,
  `check_sample` varchar(255) DEFAULT NULL,
  `client_ex_storage` varchar(255) DEFAULT NULL,
  `client_in_storage` varchar(255) DEFAULT NULL,
  `client_other` varchar(255) DEFAULT NULL,
  `client_system` varchar(255) DEFAULT NULL,
  `code_line` varchar(255) DEFAULT NULL,
  `company_ch` varchar(255) DEFAULT NULL,
  `company_en` varchar(255) DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `encryption_lev` varchar(255) DEFAULT NULL,
  `entrust_entity` varchar(255) DEFAULT NULL,
  `expected_deadline` varchar(255) DEFAULT NULL,
  `fp_num` varchar(255) DEFAULT NULL,
  `func_description` varchar(255) DEFAULT NULL,
  `func_num` varchar(255) DEFAULT NULL,
  `info_addr` varchar(255) DEFAULT NULL,
  `info_email` varchar(255) DEFAULT NULL,
  `infofax` varchar(255) DEFAULT NULL,
  `info_name` varchar(255) DEFAULT NULL,
  `info_phone` varchar(255) DEFAULT NULL,
  `info_postcode` varchar(255) DEFAULT NULL,
  `infotel` varchar(255) DEFAULT NULL,
  `infourl` varchar(255) DEFAULT NULL,
  `opinions` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `sample_choice` varchar(255) DEFAULT NULL,
  `sample_file` varchar(255) DEFAULT NULL,
  `sample_type` varchar(255) DEFAULT NULL,
  `server_data_base` varchar(255) DEFAULT NULL,
  `server_ex_storage` varchar(255) DEFAULT NULL,
  `server_hard_frame` varchar(255) DEFAULT NULL,
  `server_hard_other` varchar(255) DEFAULT NULL,
  `server_in_storage` varchar(255) DEFAULT NULL,
  `server_language` varchar(255) DEFAULT NULL,
  `server_soft_frame` varchar(255) DEFAULT NULL,
  `server_soft_midw` varchar(255) DEFAULT NULL,
  `server_soft_version` varchar(255) DEFAULT NULL,
  `server_support` varchar(255) DEFAULT NULL,
  `server_system` varchar(255) DEFAULT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_type` varchar(255) DEFAULT NULL,
  `test_basis` varchar(255) DEFAULT NULL,
  `test_specification` varchar(255) DEFAULT NULL,
  `test_type` varchar(255) DEFAULT NULL,
  `unit_property` varchar(255) DEFAULT NULL,
  `user_description` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `web_environment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (1,'17501',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,'17510',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,'17519',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(4,'17528',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195019',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(5,'17537',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(6,'17546',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195022',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4);
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
  `function_type` varchar(255) DEFAULT NULL,
  `function_object` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_roles`
--

LOCK TABLES `tbl_sys_roles` WRITE;
/*!40000 ALTER TABLE `tbl_sys_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user`
--

DROP TABLE IF EXISTS `tbl_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (9,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,USER','u20190605134944','SSB'),(8,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,USER','u20190605134833','SSA'),(7,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190605134759','CUSC'),(6,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190605134754','CUSB'),(5,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190605134344','CUSA'),(10,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,USER','u20190605135114','SMA'),(11,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,USER','u20190605135358','TSA'),(12,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,USER','u20190605135411','TSB'),(13,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,USER','u20190605135543','TMA'),(14,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,USER','u20190605135736','QMA'),(15,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN,USER','u20190605135828','admin');
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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

-- Dump completed on 2019-06-05  6:00:49
