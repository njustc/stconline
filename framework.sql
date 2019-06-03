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
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2502',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2504',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.Entrust.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1),('2505',1,'/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0\0\0F_#Á\0\0ŒIDATx\Ú\í\İ\rŒ•õ½\'ğ\æ¦/f5©¹ñ^\Óm6Æ½Û¦\Ù÷n\Z³É¶¤\í¶\rmW\äœ93€\ÓúV‘¶\Û\ZI	E½µUz¥jE­¶Z‰­n-\"UD^¦:\ÖwQ+Š¼:€Tpx™ÿşsg\Ìa˜Q)0\ç\Ìs>Ÿ\ä—sxÎ™3\Ïù?\Îóõ÷¼~\à\0\ĞHRJ—nH\éùü8\ã\Şuim~ü\×\Şwö\íÏ¦9mO·½•\Ò÷gw¤\Û\ß\ís¯ºoÃ‹ùg\ëó\'q\0jæ…”–\ç0úlO(}\"\×\ÂB\ï¸WR\ÊoO\Ã{şı\Ï\ïö¹\í)ı[ŸŸ??‡\ë#@\Íüiszùš¹ÛÌ¡ô\îx>\Í\î	¾;r=\İ\İôùon\ë	­\ß^~÷ª\Ü\ä¥Gs\Í\Éu\Ì[\Ò\ê÷ı\îò»_‰\×>\ëó¯¦´,?\Şÿğöô‹Ÿ½\ä\Úü9ùñÿ\åzĞ¨P7?–\æ\Ç&\Ík|mû\Õs^{6¦\Í^¿?6sŒ\î\î\ê?tü5¦-Ø‘nÚ™R[÷\ë\éö·ÛMó\ã÷—\îO\×\ÏZ\ß?s|N\Ä\éùñú\ÇO\Çûoücz\ä/)=Ÿ÷³ùo¶u\0]¡/ßš^ˆ\ç3K{:½\ã®[ø\æ\ÖüxbOu\İ\Õ\Øúôô…»\ç¿5İ•§Ÿ4sEgì¸»*?ÿ—il\İ^õ¹m/¿Vô„\ã{‚un\Ï\çÙ¯@MB\ïüt\Şö\×#\èr]ù@GZ\Ó/û\åSù\ß_ˆÍœ\ËRZ\Şó\Ş%?_²wItoq0K~ü\æŒ?vlÉÅ-w.\ï\Ü\Ğ\Û\Õ\İútz0Oÿ\Ô\ïÖ¤\ßÆ´\Ë\ïùóª\ÙÓš<\í\Â\\÷\Zy\0jz\ç\äº|E¼ü8!§\ße±¯.\×s=‘\ë¬\èã •\\7\æZ”zF‰ı}¹.Èµ¸\' ¯\êù\ÙK{\Şwo®Sz\Ş{r®\è\"o7\ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À­O§ö\ïH)`¤¨©FŸŸ2ó¥uGùwœ¿!¥)F€Z‡\Ş\ÙmO·\å\Ç\ãzş}â¢·ÓÏ¦tõ\ïÖ¤ß¾Ë´O,İŸ®Ï_+¥\ïÇ´\Ù\ëÒ3_J÷\Æ{oy<\Í\ëy_ùªû6¼¸\"¥+{\ß\0µ¼~x{úÅŒ\Ç\Ò\Âüüœ˜V½©3O;f i7ş1=Aõ³ùo¶Ç´\è\æ6§ôƒx¾`Gº)¿6<_ı‡­Om\0jz£\â1:°U)M\ç?½iY\ß÷õ–\îƒ7?–\æG\ØS\İû\ë\"@{;\Æ\Ù\éöx-ß¹<\Í2\Ú\0\Ô2ğ\"¬¾\Ğóü\ã¿5\İÏ¯™»\í\Éü\ï“s}*6]4\íò{şœs2}:ş\ë›1\í\Êß­Y\Ù\Óıı¯\ê û\×Y¯®ˆŸ=¥ËŒ<\0µ½s\"\ÄzŸ\\„Ö‹)]\Õd=¯÷7\í\äö”ş­78\ÃÏ§\Ù=Ÿs~Ÿ\ßõõ\ŞÍ\0P„ıü\íÏ¦9½ûü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†„”\Òñó\æÍ»\ï†nxkÚ´i]\ßı\îwSkkkjjjJ£GN\ßşö·\Ó\äÉ“÷L:uÃ„	¾c\Ä\0r6n\Ü\Ør\çw¾y\É%—¤q\ãÆ¥_ı\êW\éñ\ÇO›6mJ»w\ïNaÏ=©££#=ù\ä“i\æÌ™i\ìØ±iüøñ]“&MZZ©TN4Š\0\Ô{gw\â¢E‹¶^|ñ\Å)wviÙ²e\İ\áö~-_¾<\å®0w\Şy)w…S(\0u\Û\İı\ìg?\ëš8qbz\î¹\ç\Ò\áX¹reš0aBúÖ·¾õZkk\ëñF€º±cÇ	“\'ON\×]w]zó\Í7Ó‘›A\ãó.ºè¢¿\Ú\Ü	@\İtxxW_}uÚ·o_:\ÒfÌ˜\ß\ëÃ†\r;\ÆhP3±/6iFGv4¯\×ô\é\ÓÓ¨Q£\Ö\Zq\0j&Z‰}xGj“\æ»m\ê;vlW¥R™h\Ôt±Y3ÒŒ#4C\Ü\Ò\ÒÒ²\ßş=\0]œ‡§%¦+¯¼rOSS\Ó£À ‰+­Ä‰\çƒ\Õ\åõzé¥—R\îôö:¨€A3şü?Ä•V\æÁ+imm\İ_.—Ï³\0q-Í¸´X-\\{íµ»ššš\Ú,\0E\\<:®¥Y=öØ¾z\ë,\0E\Ü-!.][·n\íÊ¡\×i)\00(\â¶@½wKlq\ë¸5‘¥\0À ˆĞ©%¡À 9\çœsj\Ù\éu	=\0\Íw¾óš\í\Ó\ë\è\è\ØcŸ\0ƒfÊ”)µ:zsŞ¼y\Ş`\Ğ\\q\Åkku\Ş\äÉ“7;O€A3aÂ„oŒ;¶&Wd‰Ë¹\"\0ƒ|ûûÚ›\í\í\í±iÓµ7\\?øÁ¹\æšk5ô.¸\à‚\Í\î²\0À kmm=şüó\Ï\ïZ¾|ù ŞŸşô§­\Ñå¹Ÿ\051~üø\Éq#Ù£}\çô]»v\íonn\Ş\ã\Î\é\0\Ô\ÔØ±c7]{\íµGó –®ü;:\Ê\åòj£\r@M\ÅA%¹\ã\Ûz\Ã\r7\à\ëš4iÒ«q^^lN5\Ú\0\ÔEğ]pÁ?ı\éO\ÓÎ;\Ø&Í‹.º(\\Yg?\0u|£G^}\á…v=ÿüó‡}\ĞJ\ìÃ‹Mš:<\0\êVl2jÔ¨}S¦L\Ù\áw(›<Ÿz\ê©-±°\ç(M­\0Pÿ¢;\Ë]\Ú=Ñ­3¦kÚ´i»–,Y²oó\æ\Íû\ã~x½wKˆ‹G?üğ\Ã[\ã\Òbq¥•»8\Ï\æL\0†¤b£s-Èµ6á®¸-PUu\Æ>»\\\íqi1WZ ˆA˜Fùa#@£„\ŞqF€†½\áÃ‡Ÿ`$\0h„\Ğ\ë:ë¬³>f$\0hˆ\Ğ=zô\ÉF€F½ı\årù“F€Â«T*ûGŒqª‘\0 :½}#Gü´‘\0 ğ\Ê\åò\ŞQ£Fı‹‘\0 :½¸!\ìg\0z¹\Ûû‚‘\0 B\ï\í\\_1\04B\è\ínnn>\ËH\0Pxq·…–––²‘\0 :½·\â–CF€F½¹¾i$\0(¼J¥òF©Tú–‘\0 :½¿–\Ëå‹\0z¯\çn\ï»F€F½­¹.5\04B\èu\äšl$\0h„\Ğ\Û\\.—§\Z	\0\Z!ô6V*•«Œ\0…—»¼õ\Í\Í\Í\×	\0\Z¡\Ó[›;½\éF€F½5¹n0\0^\îòş\\.—o6\04B\è½\\*•n3\0^SS\ÓK¹~m$\0(¼r¹¼<‡\Ş]F€F\èô\ÏÁw‘\0 ğ*•Ê³¥R\é÷F€\Â\Ë]Ş“9ø\î7\04B\è=C\ï#@\á555=š\ëa#@#„\Ş\Ò\Ü\í-2\0^^¥RYb$\0h„Ğ››8\0…—\ïÁ\\\íF€Â‹\Ó\â´#@#„Ş¬z\Ï	\0\n/.A—\"3\04B\èı&‡Ş‹F€Â‹\Û\n\Åí…Œ\0…W©T~™C\ïß\0…W.—o\ÎÁ÷g#@#„Ş9ô\Ö	\0\n/\Şô¦¦¦µF€F\èô¦\å\Ğ[g$\0h„N\ïªz\0…\×\Ü\Ü|E\îö6	\0\n/wy“su	\0\n¯T*]V©T¶\Z	\0\n/\Şws§÷º‘\0 ğr\àM(—\ËÛ\0…W*•¾•»½7Œ\0…—»¼ór··\ÃH\0Px9ğF\çz\ËH\0Px•,‡\Ş.#@\á577Ÿ•Co·‘\0 ğJ¥\Òğzo	\0\n¯\\.!‡^g<omm=¾R©œ\Ş\Ò\Òrš‘`\ÈË¡¶=‡\Ü\Şü¸??¦j•‘ ¡wÇ»„]wE·g¤\0ò†\rvLtz^¹\\^n”\0hˆnO—@»½\Î~B\Ï\Ô(r¹<µŸ.oœ‘ rĞ½QzÛŒ\0…•;»‰U]\ŞD#@¡•\Ë\å7#ôŒ\0…W*•.z\0CTJ\é˜Õ«W¯kooO.Ló\ç\ÏW\êˆÕ‚\ÒÒ¥K»r\Íğ\×\Ô\\^[[[\ê\è\èHJñÚ²eKZ¼xqWÀişâ€šŠO\à©Á¾\Üùuú‹j*6iZ)«Á¨\Ø\Ü\é/¨©XY!+¡½ªzë¯›\Ò\ê\'•–/¸¼»\âyL³2WB(T\è\íØ¾!½8orzş\ïP1-^³BWB(L\è­[~ÿA\×[\ë—Ï±BWB(N\è½ô\ÈO½x\Í\n]	= 0¡÷\âüzñšºz€\ĞSJ\èC-ô\âhÍB/^³BWB(L\è­zô†C/^³BWB(L\èmÛ°,½øğ”ƒ7m\æiñšºz@aB/j\ÍS¿>(ôbš•¹z@±B\ï\í·Óª\Çf¼i3O‹×¬Ğ•\Ğ\nzqÅ•—½~À}zñš«²(¡\í\Ğ\ËÜ¦U‹\ÒM\Z0ğz+\Ş\ï\Õõ)¡¹\Ğ{¯\îN×§„P˜\Ğ{?\İİ»u}VğJ\èC&ôş\ÖÀ\ë-+x%ô€!zJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡÷~jıúõ\é„NH^xaZµjUúÒ—¾”¾öµ¯õûŞ¹s\ç¦\'x\âÀ\ìæŸ™={¶Pz€\Ğ\Z•‡!Íœ9ó€÷}\ÏÆ»§ñ‹_<`ú\İw\ß\İ=ı•W^9\ègn¿ıva\'ô\0¡W¡\á\Ï7oŞœ\Şxãƒ\ï\ÑGM_ù\ÊW\êw\ïŞy\æ™o¸»fMúù\Ï\Şı¹ñ3”K–,zBzõz·\ÜrKš5kV÷ó\Ø\äYı\Ú\äÉ“»\Ã-\îsŸ{çµ¶¶¶4~üø\î\éÛ·o\×0UBzu\×\é\Åó•+Wv?\ä‘GÒ±\Çû\ÎûN=õ\Ô\îªş\ÙmÛ¶uÿL\ã(ô„ ô\ê:ôz7Oö®¤T\èõ\İd*ô\0„Ş W\ïf\Ëq\ãÆ¥;v¤öööd‰\ç\'N\ì>J3>ü€Ÿ_±bE÷ô\Ø\Ô\Ù_\èq\Æi\áÂ…\é\ä“OzBzµ­­¥¨¾¨\ŞÍ›½›9#×­[÷\Îk–gyfwõş|ßŸ\ë=Í¡\ï.B@\è)¡ ô”\ĞzJ\è=%ô\0„z€Ğ³BVBzJ	=@\è)%ô\0¡§”\Ğ„zBzJ\è=%ô\0„z\0BO	=\0¡§„À>÷³BVBhmmmû;::¬”\ÕQ­õ\ë×¯Í¡\×\é/¨©E‹ıhñ\â\Å]¯½öZC­„w\ì\ØÑ¿»V·`Á‚½¹¦ù‹j.¯Œ¦\æÿ+6?5B\İw\ß}\é\Üs\ÏMs\ç\Îô\ß¿³¥¥%ı\æ7¿I2\Ş\Ñ\á	<€\Z©T*kr-©\Õ\ïojj\êÊ•\Ê\åòTK€£x\ßÈ³oô\è\ÑÿX\Ãy\Ø¡\×|+s\×y’%À\Ñœ7sı¢–ó\Ã\î\Ş\Ğ\ë©ıy®²t\08’7=wV;óÓ¿«q\èm\ëz½]\ß\ê<\'ZR\0–\Ö\Ö\Ö\ãs¨\ì\Í\árQ­\ç%\Ï\Ã\ÚşB¯§ö\æ\àg‰p8A3/‡\Şú:™—U\ïzQ\ë\"¤-5\0Ùˆ#N\í\Ùoö\Ùz˜Ÿ8xe€°{+\Ï\ãDK€\Ã\é¬ş=‡ÉŸ\êh~÷xo6\ìK€\Ã\éªF\æÀ\Û?fÌ˜\×Q\è-¨\n»öÜ‰şÏ˜Ç˜WK€¿Y“\×s°\ÜUgç­±\ß.\Ï\Û\éU\Ó\î\Êõº%À\ß\Z.?Êµ{\äÈ‘®§ù\êo3f\Ìc\Ìk\Â+-9\0\É\\ğŸrˆÄ•O.*ó\\*•.‹yy·8”.\ï¾\\¯\rµù.—\Ë¹Û›e	ğ¾´¶¶~\"innşòP›÷˜\ç˜÷ø–$\0\ï§\Ë{>wL\Ï\r\åù²$x¯ÀøJ\Ï\áÿÿ¤S ĞŠ²O,öI\Æw±D\èW\ÏÑE8ú±÷\è\ÓøN–,\0ˆó\Ürgôv‘\Îs‹\ïR\çPcE½¢I|§z»¢\0µ\r†ÿR\ÔkW\Ö\ãµC¨¡¸ƒBÜ®§¨\ß/¾[=\İ%€\Ú\Şg\ã^y9N)p\èRO÷ Frlˆ»¢7À÷¬›;¿P›\è\â{[[[/úw\ï\ß5¾³%\Ğxş.‡À\ÎJ¥rm£|\áü]§\ç\Ğ\Û\ß\İ\âh q#\Öo6\Ú÷\ïœ\ëş\0h£Gş\Çzûò\Êÿ\rzßˆ\ïc\à¿€\Æ\èò+—Ë«õû\ç\à[“\Ç\àQÿ%\0\ÜÈ‘#ÿ[^á§–––‰:9ğ\Ç\Ä477ÿWÿE\0\\^\Ùÿ6¯øw\å\0<®AC\ï…zOû/ qVü\ëq\Å_©TN\Ïß½Ë\Õ\Z\È\èÑ£Oó\Ör\×7©‘¾wş\ÎÎµ\Ø\0\r&¯ü\'Ä‘Œ---ÿ½¾o\ÜI=.G\æ\â\Ó\0|\Ìw/ü	Û•Je]®,u€5lØ°cr\è\í(•J¿/ò÷\Ì\İl9º\Ú\áÃ‡Ÿ`©4°xŸ)\êıôª:\Ú\×ò÷»\Ç\Ò \æ¼1\Ã\Û#Güû\Şùùû\ím\ÔS4\0\è?^\Éá°¼h\ß+w±¯\çnö6K€wœu\ÖY\ËÁ·\'×\äÿ7Wg\îò>l	\Ğ7$¾‡õ\çøtA¾Ï¸¥%À@A1/\Åöşğ‡\Ê\ß#‡+ów\Ùõ÷\Ï` vz~Cøk\ÄMrw777_a‰ğ®bófl\æ\ì{Ï½8\ì?O»ª\Ş\ç?\Ï\çu±iÓ’\à}‰Z\âÀ–8À¥¥¥\å´ü|cÜ’\'\×u\ØƒW\â K€Cé˜–\çğx=º¾À‹\Ú\\\Ïóœ;\Ñ_\Æ<[z\0Jxœ\ç\îU…]o\Õ\íf\Ã8=ND\Ò-A\0Ş—R©ôıM„}/\Åı\èâšuÚ™\ŞS\ï(\0õ\Õ\á\Í\ê/\ìª\ë\ì³\Ïş|½\Íw\\L:6\Ã\ÆÅ¥-E\0Ş—\Ö\Ö\Ö\ãsxÌ‰n \ĞË¯M«·ù\Îóõ`®W-A\0Ù¹\ç{R‘¶\\ı…ß‚zš×¸1lÏ•dş·%À\á†ßª>¡·¦\æ±R©,‰y´´\08\"š››¿œƒeK„^\Ü¯^\æ«\\.26\Å\æy:\İR\àˆŠ\Óz6yşºN\æ\ç‰z/X2\05R:fõ\ê\Õ\ë\Ú\Û\Û\ÓÂ…\Óüùó\ÕQª¹s\ç¦s\Ï=7\İÿı\ró,X–.]Ú•k†¿6 \æ\"ğ\Ú\Ú\ÚRGGG\ê\ì\ìTG¹v\ì\Ø\Ñp\ßyË–-iñ\â\Å]9\0§ù‹j*:<§#ør\ç\×\é/¨©Ø¤i¥¬£bs§¿8 ¦bEd…¬„ ôªê­¿nJ«ŸüUZ¾\àò\îŠ\ç1\Í\Ê\\	= P¡·cû†ô\â¼\É\éù¾w@Å´x\Í\n]	= 0¡·nùı^o­_>\Ç\n]	= 8¡÷\Ò#?0ô\â5+t%ô€Â„Ş‹ó8`\è\ÅkV\èJ\èBO)¡µĞ‹£5\n½x\Í\n]	= 0¡·\ê\Ñ½x\Í\n]	= 0¡·mÃ²ô\â\ÃSŞ´™§\ÅkV\èJ\è…	½¨5Oıú Ğ‹iV\æJ\è\Å\n½·\ßN«›qğ¦\Í<-^³BWB(D\è\ÅW^~ôú÷\é\Åk®Ê¢„0´C/wp›V-J/<4iÀÀ\ë­xO¼W×§„0\äBï½º;]Ÿz@aB\ïıtw\ï\ÖõYÁ+¡™\Ğû[¯·¬\à•\Ğ†L\è)%ô\0¡§”\Ğ„RBzJ	=@\è)¡ ô”\ĞzJ\è=%ô\0„^o-Y²$t\ÒIiÕªU\İ\ÏO;\í´#ö\Ùñ™³g\ÏjBzõQLù«¦ööö\î\Çcü{\íÚµ‡ı\Ùw\ß}w÷g½ò\Ê+‚M\èB¯öµq\ã\Æ\î`z\ä‘Gş\ãNğÛ¶uÿû\á‡~\ç=mmm\é\ÔSOMË–-;\à\ç>ö±¥\éÓ§ÿÇt×¬IŸúÔ§ø\ìİ»w§gy¦\ß\ß\Û\ßgy\æ™iøğ\á\İA<kÖ¬\îyù\ÈG>’z\ê)¡ ô\\\è\İr\Ë-\é\Ş{\ïMÿğÿp@\È\ÄkW\\qEw€\Åóÿø\Ç½\Ï?úÑ¦»\îº\ë€P?~|÷{¶o\ß~À\ï\è3{»\Ì\Ş\éˆñ¸r\åJ¡ ô\\\è\Å&\Èx¼é¦›\Şy-º½˜6nÜ¸\î}s\×_}w¸õ\İ4º~ıú~Ã©·k¬\Ç÷ú\ÌŞ®³÷ó\âqİºuB@\è\Ù\Ğ\ë\r±\ŞMs\æ\Ì\éŞ„YışÍ›7Ôµ3¦\ßn¬¿\Ğ{¯ÏŒ÷Ç¾À™3g¦c=6\íÜ¹\Ó>=\0¡wdªw“b\ï&\Íx>bÄˆBè“Ÿüdw‡v\Æg°y³ú\çû\Ûw·bÅŠ\î\×bSgß \è3\ãH\Ò\Ï|\æ3iË–-\ìkz\0B\ï°+Be\áÂ…\İ_\ï´}\èCìŸ‹`;\å”S\Ü\ÌXı³½°\ÄA)Qñ\ÙQ};Á>3º\Ã\Ş\î®oW)ô\0„z\0BO	=\0¡§„€\ĞSBzJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡§„€\ĞSBzBO	= Q\Ä}à¬•\Ğ\ZB[[\Ûş+euTkıúõks\èuú‹jjÑ¢E?Z¼xq\×k¯½få¬Z\à-X°`o®işâ€š\Ë+£©ùÿ\ÂßŠ\ÍOê½«R©‡C«N0\r6ì˜¦¦&û¦\0(¾‘#Gş½\Ğ !Œ3\æ\ã\år¹\ËH\0Px9ğş)wzB€†½Sr\è\í7\0^KK\Ëi9ôö	\0\n¯R©œCo¯‘\0 B\ï\Ìz{Œ\0…W*•†\ç\Ğ{\ÛH\0Px9ğ\ÎÎµ\ÛH\0Px•JeT¹\\\Şi$\0(¼x\ç\åNo‡‘\0 :½q9ô\Ş0\0^©Túv¾×\0z—\å\Ğ\Ûj$\0(¼\æ\æ\æ)\år¹\ÃH\0PxMMM?Êµ\ÉH\0Px¹Ë›–Co‘\0 B\ïºzk\0z7\å\Ğ{\ÅH\0Px•Jå—¹^6\0^\îò\îÌµ\ÂH\0\Ğ¡ww¹\\^f$\0(¼R©ôûJ¥ò¬‘\0 :½9¹0\04B\è\Í\Ëõ˜‘\0 Boa®¥F€F½¥|F€F½ör¹ü‘\0 B\ï‰8˜\ÅH\0PxqºBœ¶`$\0(¼r¹üBssóo\0…— ‹K‘	\0\n/.6]*•n3\0^¹\\^\İ\Ü\Ü<\ÃH\0PxqÙ¸‘¬‘\0 :½õ¹Ó»\ÆH\0\ĞŞ¦J¥r¥‘\0 :½\Ü\éM1\04B§·5×¥F€Â«T*\ÛsM4\04B§÷F½qF€F½¹¾i$\0(”#Fœš»º\ÓsXz;s5\0\n¥\\./\Ï—¨ı¹ö\Æ\æ\Î\Ö\Ö\Ö\ã\0CZKK\Ëi\ïzİ•ƒñ#@!\ä`{~ À«T*ûuy\04D·§\Ë pr¸­\ì\'ôö\éò\0(œR©ôõ~B\ïV#@!\å\ÛXx»†\rvŒQ \Ê\åòyUûò~bD\0(z··9B\ï«_ı\ê6\Z\0Fl¾\Ì÷ƒ\\m¹¶\ä\ê\ì{ K®m¹Ú›››g8¨€!\'.=–ƒlq²=\ïubz\ßsö\â\n.q\Ù2£@\İwv9´\Êa—%\ì¨v\0u\é\ì³\Ïş|\î\Ğv÷\r¯q\ãÆ¥›o¾9=şø\ãiÃ†\ri÷\î\İ)\ÄcGGGzú\é§\ÓwÜ‘&Nœ\Øß‰\ë»\âT£@İˆ£2[ZZöW\Ö÷¾÷½\î@Û·o_z¿{\î¹4iÒ¤¾\á×•?ªQ .¯zsf¿4gÎœC\n»¾z\è¡\Ô\Ú\ÚÚ·\ë|\0\ÔNl\ÒÌ\×U½)ó\å—_NG\Â_şò—tñ\Å\Ğñ\Ù\Ô	@M\ÄA+\Õûğ\"ğbİ‘ŸW|±\ÏÁ-\0º8J³z“\æ‘\êğú\ëøúl\ê|\Â\è0h\â<¼\êıx±\ïhŠ}|\Õû÷b³ª¥\0À ˆÏ«\ÒÜ³gO:\Ú.½ô\Ò\êÍœ\Ë-\0ºØ—W}¥•8-a0,[¶\ì€+·\ä:\Ñ\Ò\0à¨ŠSª^9œSUõ	\ìq­NK€£ª\ç\â\Ñ\İÁsë­·¦Á4s\æ\Ì.Sfi\0p´CoKoğÄ¥\ÅSlJ­\ÚÄ¹\İ\Ò\0\à¨\Êaó\Îş¼M›6\rj\è\Åy{Õ·%²4\08Ú\Ş;Á\Ó{ñ\èÁ¿¯ú÷[\Z\0Z\èÕ‚\Ğ@§\0Gš}z\04R§\ç\èM\0\Z&ôœ§@c\È\ÖUµº\"\Ë%—\\\âŠ,\0¸öf\ìOs\íM\0\ZB\ÜÓ®ú.ƒ\Ñ\íMš4\É]\0|q?½>]\î§@£t{mƒu\çôs\Î9Ç\Ó¨\Ö\Ö\Ö\ã\Ë\åò®\êƒZ\â<º#}^\Şøñ\ã«7k\îŠ\ßkôt¥R\é\ëÕ›9#øT\Ç^u\à\Å\ï‰\ßg\Ô¨eğ}¿:øbSg\ì\ã;œƒ[b^ŸMš\Ñ\åM5\Ú\0\Ô]ğõ\Õù\Üs\Ïòi	“\'O> \ì\âs\0õ|_¯\Ş\ÇW½\É3®\Üò\ä“Ov_«³÷\"\Õñû\ì\"\ãJ+\Õ\'W\ïÃ³I€º™T\Õy˜õ„ƒV\0¨{q_\îÒ©¾r\Ëû©¸\ÒJœx\Ş\Ü\Üüe£À—,\ë¹Vgt[ªoKTu9±\íqñè¸–¦K‹\0\0\0\0\0\0\0\0\0\0\0\0\0õ\àÿ¹°\"c<O e\0\0\0\0IEND®B`‚',1),('3',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0\0\0F_#Á\0\0ŒIDATx\Ú\í\İ\rŒ•õ½\'ğ\æ¦/f5©¹ñ^\Óm6Æ½Û¦\Ù÷n\Z³É¶¤\í¶\rmW\äœ93€\ÓúV‘¶\Û\ZI	E½µUz¥jE­¶Z‰­n-\"UD^¦:\ÖwQ+Š¼:€Tpx™ÿşsg\Ìa˜Q)0\ç\Ìs>Ÿ\ä—sxÎ™3\Ïù?\Îóõ÷¼~\à\0\ĞHRJ—nH\éùü8\ã\Şuim~ü\×\Şwö\íÏ¦9mO·½•\Ò÷gw¤\Û\ß\ís¯ºoÃ‹ùg\ëó\'q\0jæ…”–\ç0úlO(}\"\×\ÂB\ï¸WR\ÊoO\Ã{şı\Ï\ïö¹\í)ı[ŸŸ??‡\ë#@\Íüiszùš¹ÛÌ¡ô\îx>\Í\î	¾;r=\İ\İôùon\ë	­\ß^~÷ª\Ü\ä¥Gs\Í\Éu\Ì[\Ò\ê÷ı\îò»_‰\×>\ëó¯¦´,?\Şÿğöô‹Ÿ½\ä\Úü9ùñÿ\åzĞ¨P7?–\æ\Ç&\Ík|mû\Õs^{6¦\Í^¿?6sŒ\î\î\ê?tü5¦-Ø‘nÚ™R[÷\ë\éö·ÛMó\ã÷—\îO\×\ÏZ\ß?s|N\Ä\éùñú\ÇO\Çûoücz\ä/)=Ÿ÷³ùo¶u\0]¡/ßš^ˆ\ç3K{:½\ã®[ø\æ\ÖüxbOu\İ\Õ\Øúôô…»\ç¿5İ•§Ÿ4sEgì¸»*?ÿ—il\İ^õ¹m/¿Vô„\ã{‚un\Ï\çÙ¯@MB\ïüt\Şö\×#\èr]ù@GZ\Ó/û\åSù\ß_ˆÍœ\ËRZ\Şó\Ş%?_²wItoq0K~ü\æŒ?vlÉÅ-w.\ï\Ü\Ğ\Û\Õ\İútz0Oÿ\Ô\ïÖ¤\ßÆ´\Ë\ïùóª\ÙÓš<\í\Â\\÷\Zy\0jz\ç\äº|E¼ü8!§\ße±¯.\×s=‘\ë¬\èã •\\7\æZ”zF‰ı}¹.Èµ¸\' ¯\êù\ÙK{\Şwo®Sz\Ş{r®\è\"o7\ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À­O§ö\ïH)`¤¨©FŸŸ2ó¥uGùwœ¿!¥)F€Z‡\Ş\ÙmO·\å\Ç\ãzş}â¢·ÓÏ¦tõ\ïÖ¤ß¾Ë´O,İŸ®Ï_+¥\ïÇ´\Ù\ëÒ3_J÷\Æ{oy<\Í\ëy_ùªû6¼¸\"¥+{\ß\0µ¼~x{úÅŒ\Ç\Ò\Âüüœ˜V½©3O;f i7ş1=Aõ³ùo¶Ç´\è\æ6§ôƒx¾`Gº)¿6<_ı‡­Om\0jz£\â1:°U)M\ç?½iY\ß÷õ–\îƒ7?–\æG\ØS\İû\ë\"@{;\Æ\Ù\éöx-ß¹<\Í2\Ú\0\Ô2ğ\"¬¾\Ğóü\ã¿5\İÏ¯™»\í\Éü\ï“s}*6]4\íò{şœs2}:ş\ë›1\í\Êß­Y\Ù\Óıı¯\ê û\×Y¯®ˆŸ=¥ËŒ<\0µ½s\"\ÄzŸ\\„Ö‹)]\Õd=¯÷7\í\äö”ş­78\ÃÏ§\Ù=Ÿs~Ÿ\ßõõ\ŞÍ\0P„ıü\íÏ¦9½ûü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†„”\Òñó\æÍ»\ï†nxkÚ´i]\ßı\îwSkkkjjjJ£GN\ßşö·\Ó\äÉ“÷L:uÃ„	¾c\Ä\0r6n\Ü\Ør\çw¾y\É%—¤q\ãÆ¥_ı\êW\éñ\ÇO›6mJ»w\ïNaÏ=©££#=ù\ä“i\æÌ™i\ìØ±iüøñ]“&MZZ©TN4Š\0\Ô{gw\â¢E‹¶^|ñ\Å)wviÙ²e\İ\áö~-_¾<\å®0w\Şy)w…S(\0u\Û\İı\ìg?\ëš8qbz\î¹\ç\Ò\áX¹reš0aBúÖ·¾õZkk\ëñF€º±cÇ	“\'ON\×]w]zó\Í7Ó‘›A\ãó.ºè¢¿\Ú\Ü	@\İtxxW_}uÚ·o_:\ÒfÌ˜\ß\ëÃ†\r;\ÆhP3±/6iFGv4¯\×ô\é\ÓÓ¨Q£\Ö\Zq\0j&Z‰}xGj“\æ»m\ê;vlW¥R™h\Ôt±Y3ÒŒ#4C\Ü\Ò\ÒÒ²\ßş=\0]œ‡§%¦+¯¼rOSS\Ó£À ‰+­Ä‰\çƒ\Õ\åõzé¥—R\îôö:¨€A3şü?Ä•V\æÁ+imm\İ_.—Ï³\0q-Í¸´X-\\{íµ»ššš\Ú,\0E\\<:®¥Y=öØ¾z\ë,\0E\Ü-!.][·n\íÊ¡\×i)\00(\â¶@½wKlq\ë¸5‘¥\0À ˆĞ©%¡À 9\çœsj\Ù\éu	=\0\Íw¾óš\í\Ó\ë\è\è\ØcŸ\0ƒfÊ”)µ:zsŞ¼y\Ş`\Ğ\\q\Åkku\Ş\äÉ“7;O€A3aÂ„oŒ;¶&Wd‰Ë¹\"\0ƒ|ûûÚ›\í\í\í±iÓµ7\\?øÁ¹\æšk5ô.¸\à‚\Í\î²\0À kmm=şüó\Ï\ïZ¾|ù ŞŸşô§­\Ñå¹Ÿ\051~üø\Éq#Ù£}\çô]»v\íonn\Ş\ã\Î\é\0\Ô\ÔØ±c7]{\íµGó –®ü;:\Ê\åòj£\r@M\ÅA%¹\ã\Ûz\Ã\r7\à\ëš4iÒ«q^^lN5\Ú\0\ÔEğ]pÁ?ı\éO\ÓÎ;\Ø&Í‹.º(\\Yg?\0u|£G^}\á…v=ÿüó‡}\ĞJ\ìÃ‹Mš:<\0\êVl2jÔ¨}S¦L\Ù\áw(›<Ÿz\ê©-±°\ç(M­\0Pÿ¢;\Ë]\Ú=Ñ­3¦kÚ´i»–,Y²oó\æ\Íû\ã~x½wKˆ‹G?üğ\Ã[\ã\Òbq¥•»8\Ï\æL\0†¤b£s-Èµ6á®¸-PUu\Æ>»\\\íqi1WZ ˆA˜Fùa#@£„\ŞqF€†½\áÃ‡Ÿ`$\0h„\Ğ\ë:ë¬³>f$\0hˆ\Ğ=zô\ÉF€F½ı\årù“F€Â«T*ûGŒqª‘\0 :½}#Gü´‘\0 ğ\Ê\åò\ŞQ£Fı‹‘\0 :½¸!\ìg\0z¹\Ûû‚‘\0 B\ï\í\\_1\04B\è\ínnn>\ËH\0Pxq·…–––²‘\0 :½·\â–CF€F½¹¾i$\0(¼J¥òF©Tú–‘\0 :½¿–\Ëå‹\0z¯\çn\ï»F€F½­¹.5\04B\èu\äšl$\0h„\Ğ\Û\\.—§\Z	\0\Z!ô6V*•«Œ\0…—»¼õ\Í\Í\Í\×	\0\Z¡\Ó[›;½\éF€F½5¹n0\0^\îòş\\.—o6\04B\è½\\*•n3\0^SS\ÓK¹~m$\0(¼r¹¼<‡\Ş]F€F\èô\ÏÁw‘\0 ğ*•Ê³¥R\é÷F€\Â\Ë]Ş“9ø\î7\04B\è=C\ï#@\á555=š\ëa#@#„\Ş\Ò\Ü\í-2\0^^¥RYb$\0h„Ğ››8\0…—\ïÁ\\\íF€Â‹\Ó\â´#@#„Ş¬z\Ï	\0\n/.A—\"3\04B\èı&‡Ş‹F€Â‹\Û\n\Åí…Œ\0…W©T~™C\ïß\0…W.—o\ÎÁ÷g#@#„Ş9ô\Ö	\0\n/\Şô¦¦¦µF€F\èô¦\å\Ğ[g$\0h„N\ïªz\0…\×\Ü\Ü|E\îö6	\0\n/wy“su	\0\n¯T*]V©T¶\Z	\0\n/\Şws§÷º‘\0 ğr\àM(—\ËÛ\0…W*•¾•»½7Œ\0…—»¼ór··\ÃH\0Px9ğF\çz\ËH\0Px•,‡\Ş.#@\á577Ÿ•Co·‘\0 ğJ¥\Òğzo	\0\n¯\\.!‡^g<omm=¾R©œ\Ş\Ò\Òrš‘`\ÈË¡¶=‡\Ü\Şü¸??¦j•‘ ¡wÇ»„]wE·g¤\0ò†\rvLtz^¹\\^n”\0hˆnO—@»½\Î~B\Ï\Ô(r¹<µŸ.oœ‘ rĞ½QzÛŒ\0…•;»‰U]\ŞD#@¡•\Ë\å7#ôŒ\0…W*•.z\0CTJ\é˜Õ«W¯kooO.Ló\ç\ÏW\êˆÕ‚\ÒÒ¥K»r\Íğ\×\Ô\\^[[[\ê\è\èHJñÚ²eKZ¼xqWÀişâ€šŠO\à©Á¾\Üùuú‹j*6iZ)«Á¨\Ø\Ü\é/¨©XY!+¡½ªzë¯›\Ò\ê\'•–/¸¼»\âyL³2WB(T\è\íØ¾!½8orzş\ïP1-^³BWB(L\è­[~ÿA\×[\ë—Ï±BWB(N\è½ô\ÈO½x\Í\n]	= 0¡÷\âüzñšºz€\ĞSJ\èC-ô\âhÍB/^³BWB(L\è­zô†C/^³BWB(L\èmÛ°,½øğ”ƒ7m\æiñšºz@aB/j\ÍS¿>(ôbš•¹z@±B\ï\í·Óª\Çf¼i3O‹×¬Ğ•\Ğ\nzqÅ•—½~À}zñš«²(¡\í\Ğ\ËÜ¦U‹\ÒM\Z0ğz+\Ş\ï\Õõ)¡¹\Ğ{¯\îN×§„P˜\Ğ{?\İİ»u}VğJ\èC&ôş\ÖÀ\ë-+x%ô€!zJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡÷~jıúõ\é„NH^xaZµjUúÒ—¾”¾öµ¯õûŞ¹s\ç¦\'x\âÀ\ìæŸ™={¶Pz€\Ğ\Z•‡!Íœ9ó€÷}\ÏÆ»§ñ‹_<`ú\İw\ß\İ=ı•W^9\ègn¿ıva\'ô\0¡W¡\á\Ï7oŞœ\Şxãƒ\ï\ÑGM_ù\ÊW\êw\ïŞy\æ™o¸»fMúù\Ï\Şı¹ñ3”K–,zBzõz·\ÜrKš5kV÷ó\Ø\äYı\Ú\äÉ“»\Ã-\îsŸ{çµ¶¶¶4~üø\î\éÛ·o\×0UBzu\×\é\Åó•+Wv?\ä‘GÒ±\Çû\ÎûN=õ\Ô\îªş\ÙmÛ¶uÿL\ã(ô„ ô\ê:ôz7Oö®¤T\èõ\İd*ô\0„Ş W\ïf\Ëq\ãÆ¥;v¤öööd‰\ç\'N\ì>J3>ü€Ÿ_±bE÷ô\Ø\Ô\Ù_\èq\Æi\áÂ…\é\ä“OzBzµ­­¥¨¾¨\ŞÍ›½›9#×­[÷\Îk–gyfwõş|ßŸ\ë=Í¡\ï.B@\è)¡ ô”\ĞzJ\è=%ô\0„z€Ğ³BVBzJ	=@\è)%ô\0¡§”\Ğ„zBzJ\è=%ô\0„z\0BO	=\0¡§„À>÷³BVBhmmmû;::¬”\ÕQ­õ\ë×¯Í¡\×\é/¨©E‹ıhñ\â\Å]¯½öZC­„w\ì\ØÑ¿»V·`Á‚½¹¦ù‹j.¯Œ¦\æÿ+6?5B\İw\ß}\é\Üs\ÏMs\ç\Îô\ß¿³¥¥%ı\æ7¿I2\Ş\Ñ\á	<€\Z©T*kr-©\Õ\ïojj\êÊ•\Ê\åòTK€£x\ßÈ³oô\è\ÑÿX\Ãy\Ø¡\×|+s\×y’%À\Ñœ7sı¢–ó\Ã\î\Ş\Ğ\ë©ıy®²t\08’7=wV;óÓ¿«q\èm\ëz½]\ß\ê<\'ZR\0–\Ö\Ö\Ö\ãs¨\ì\Í\árQ­\ç%\Ï\Ã\ÚşB¯§ö\æ\àg‰p8A3/‡\Şú:™—U\ïzQ\ë\"¤-5\0Ùˆ#N\í\Ùoö\Ùz˜Ÿ8xe€°{+\Ï\ãDK€\Ã\é¬ş=‡ÉŸ\êh~÷xo6\ìK€\Ã\éªF\æÀ\Û?fÌ˜\×Q\è-¨\n»öÜ‰şÏ˜Ç˜WK€¿Y“\×s°\ÜUgç­±\ß.\Ï\Û\éU\Ó\î\Êõº%À\ß\Z.?Êµ{\äÈ‘®§ù\êo3f\Ìc\Ìk\Â+-9\0\É\\ğŸrˆÄ•O.*ó\\*•.‹yy·8”.\ï¾\\¯\rµù.—\Ë¹Û›e	ğ¾´¶¶~\"innşòP›÷˜\ç˜÷ø–$\0\ï§\Ë{>wL\Ï\r\åù²$x¯ÀøJ\Ï\áÿÿ¤S ĞŠ²O,öI\Æw±D\èW\ÏÑE8ú±÷\è\ÓøN–,\0ˆó\Ürgôv‘\Îs‹\ïR\çPcE½¢I|§z»¢\0µ\r†ÿR\ÔkW\Ö\ãµC¨¡¸ƒBÜ®§¨\ß/¾[=\İ%€\Ú\Şg\ã^y9N)p\èRO÷ Frlˆ»¢7À÷¬›;¿P›\è\â{[[[/úw\ï\ß5¾³%\Ğxş.‡À\ÎJ¥rm£|\áü]§\ç\Ğ\Û\ß\İ\âh q#\Öo6\Ú÷\ïœ\ëş\0h£Gş\Çzûò\Êÿ\rzßˆ\ïc\à¿€\Æ\èò+—Ë«õû\ç\à[“\Ç\àQÿ%\0\ÜÈ‘#ÿ[^á§–––‰:9ğ\Ç\Ä477ÿWÿE\0\\^\Ùÿ6¯øw\å\0<®AC\ï…zOû/ qVü\ëq\Å_©TN\Ïß½Ë\Õ\Z\È\èÑ£Oó\Ör\×7©‘¾wş\ÎÎµ\Ø\0\r&¯ü\'Ä‘Œ---ÿ½¾o\ÜI=.G\æ\â\Ó\0|\Ìw/ü	Û•Je]®,u€5lØ°cr\è\í(•J¿/ò÷\Ì\İl9º\Ú\áÃ‡Ÿ`©4°xŸ)\êıôª:\Ú\×ò÷»\Ç\Ò \æ¼1\Ã\Û#Güû\Şùùû\ím\ÔS4\0\è?^\Éá°¼h\ß+w±¯\çnö6K€wœu\ÖY\ËÁ·\'×\äÿ7Wg\îò>l	\Ğ7$¾‡õ\çøtA¾Ï¸¥%À@A1/\Åöşğ‡\Ê\ß#‡+ów\Ùõ÷\Ï` vz~Cøk\ÄMrw777_a‰ğ®bófl\æ\ì{Ï½8\ì?O»ª\Ş\ç?\Ï\çu±iÓ’\à}‰Z\âÀ–8À¥¥¥\å´ü|cÜ’\'\×u\ØƒW\â K€Cé˜–\çğx=º¾À‹\Ú\\\Ïóœ;\Ñ_\Æ<[z\0Jxœ\ç\îU…]o\Õ\íf\Ã8=ND\Ò-A\0Ş—R©ôıM„}/\Åı\èâšuÚ™\ŞS\ï(\0õ\Õ\á\Í\ê/\ìª\ë\ì³\Ïş|½\Íw\\L:6\Ã\ÆÅ¥-E\0Ş—\Ö\Ö\Ö\ãsxÌ‰n \ĞË¯M«·ù\Îóõ`®W-A\0Ù¹\ç{R‘¶\\ı…ß‚zš×¸1lÏ•dş·%À\á†ßª>¡·¦\æ±R©,‰y´´\08\"š››¿œƒeK„^\Ü¯^\æ«\\.26\Å\æy:\İR\àˆŠ\Óz6yşºN\æ\ç‰z/X2\05R:fõ\ê\Õ\ë\Ú\Û\Û\ÓÂ…\Óüùó\ÕQª¹s\ç¦s\Ï=7\İÿı\ró,X–.]Ú•k†¿6 \æ\"ğ\Ú\Ú\ÚRGGG\ê\ì\ìTG¹v\ì\Ø\Ñp\ßyË–-iñ\â\Å]9\0§ù‹j*:<§#ør\ç\×\é/¨©Ø¤i¥¬£bs§¿8 ¦bEd…¬„ ôªê­¿nJ«ŸüUZ¾\àò\îŠ\ç1\Í\Ê\\	= P¡·cû†ô\â¼\É\éù¾w@Å´x\Í\n]	= 0¡·nùı^o­_>\Ç\n]	= 8¡÷\Ò#?0ô\â5+t%ô€Â„Ş‹ó8`\è\ÅkV\èJ\èBO)¡µĞ‹£5\n½x\Í\n]	= 0¡·\ê\Ñ½x\Í\n]	= 0¡·mÃ²ô\â\ÃSŞ´™§\ÅkV\èJ\è…	½¨5Oıú Ğ‹iV\æJ\è\Å\n½·\ßN«›qğ¦\Í<-^³BWB(D\è\ÅW^~ôú÷\é\Åk®Ê¢„0´C/wp›V-J/<4iÀÀ\ë­xO¼W×§„0\äBï½º;]Ÿz@aB\ïıtw\ï\ÖõYÁ+¡™\Ğû[¯·¬\à•\Ğ†L\è)%ô\0¡§”\Ğ„RBzJ	=@\è)¡ ô”\ĞzJ\è=%ô\0„^o-Y²$t\ÒIiÕªU\İ\ÏO;\í´#ö\Ùñ™³g\ÏjBzõQLù«¦ööö\î\Çcü{\íÚµ‡ı\Ùw\ß}w÷g½ò\Ê+‚M\èB¯öµq\ã\Æ\î`z\ä‘Gş\ãNğÛ¶uÿû\á‡~\ç=mmm\é\ÔSOMË–-;\à\ç>ö±¥\éÓ§ÿÇt×¬IŸúÔ§ø\ìİ»w§gy¦\ß\ß\Û\ßgy\æ™iøğ\á\İA<kÖ¬\îyù\ÈG>’z\ê)¡ ô\\\è\İr\Ë-\é\Ş{\ïMÿğÿp@\È\ÄkW\\qEw€\Åóÿø\Ç½\Ï?úÑ¦»\îº\ë€P?~|÷{¶o\ß~À\ï\è3{»\Ì\Ş\éˆñ¸r\åJ¡ ô\\\è\Å&\Èx¼é¦›\Şy-º½˜6nÜ¸\î}s\×_}w¸õ\İ4º~ıú~Ã©·k¬\Ç÷ú\ÌŞ®³÷ó\âqİºuB@\è\Ù\Ğ\ë\r±\ŞMs\æ\Ì\éŞ„YışÍ›7Ôµ3¦\ßn¬¿\Ğ{¯ÏŒ÷Ç¾À™3g¦c=6\íÜ¹\Ó>=\0¡wdªw“b\ï&\Íx>bÄˆBè“Ÿüdw‡v\Æg°y³ú\çû\Ûw·bÅŠ\î\×bSgß \è3\ãH\Ò\Ï|\æ3iË–-\ìkz\0B\ï°+Be\áÂ…\İ_\ï´}\èCìŸ‹`;\å”S\Ü\ÌXı³½°\ÄA)Qñ\ÙQ};Á>3º\Ã\Ş\î®oW)ô\0„z\0BO	=\0¡§„€\ĞSBzJ	=@\è)%ô\0¡§”\Ğ„RBzJ\è=%ô\0„z\0BO	=\0¡§„€\ĞSBzBO	= Q\Ä}à¬•\Ğ\ZB[[\Ûş+euTkıúõks\èuú‹jjÑ¢E?Z¼xq\×k¯½få¬Z\à-X°`o®işâ€š\Ë+£©ùÿ\ÂßŠ\ÍOê½«R©‡C«N0\r6ì˜¦¦&û¦\0(¾‘#Gş½\Ğ !Œ3\æ\ã\år¹\ËH\0Px9ğş)wzB€†½Sr\è\í7\0^KK\Ëi9ôö	\0\n¯R©œCo¯‘\0 B\ï\Ìz{Œ\0…W*•†\ç\Ğ{\ÛH\0Px9ğ\ÎÎµ\ÛH\0Px•JeT¹\\\Şi$\0(¼x\ç\åNo‡‘\0 :½q9ô\Ş0\0^©Túv¾×\0z—\å\Ğ\Ûj$\0(¼\æ\æ\æ)\år¹\ÃH\0PxMMM?Êµ\ÉH\0Px¹Ë›–Co‘\0 B\ïºzk\0z7\å\Ğ{\ÅH\0Px•Jå—¹^6\0^\îò\îÌµ\ÂH\0\Ğ¡ww¹\\^f$\0(¼R©ôûJ¥ò¬‘\0 :½9¹0\04B\è\Í\Ëõ˜‘\0 Boa®¥F€F½¥|F€F½ör¹ü‘\0 B\ï‰8˜\ÅH\0PxqºBœ¶`$\0(¼r¹üBssóo\0…— ‹K‘	\0\n/.6]*•n3\0^¹\\^\İ\Ü\Ü<\ÃH\0PxqÙ¸‘¬‘\0 :½õ¹Ó»\ÆH\0\ĞŞ¦J¥r¥‘\0 :½\Ü\éM1\04B§·5×¥F€Â«T*\ÛsM4\04B§÷F½qF€F½¹¾i$\0(”#Fœš»º\ÓsXz;s5\0\n¥\\./\Ï—¨ı¹ö\Æ\æ\Î\Ö\Ö\Ö\ã\0CZKK\Ëi\ïzİ•ƒñ#@!\ä`{~ À«T*ûuy\04D·§\Ë pr¸­\ì\'ôö\éò\0(œR©ôõ~B\ïV#@!\å\ÛXx»†\rvŒQ \Ê\åòyUûò~bD\0(z··9B\ï«_ı\ê6\Z\0Fl¾\Ì÷ƒ\\m¹¶\ä\ê\ì{ K®m¹Ú›››g8¨€!\'.=–ƒlq²=\ïubz\ßsö\â\n.q\Ù2£@\İwv9´\Êa—%\ì¨v\0u\é\ì³\Ïş|\î\Ğv÷\r¯q\ãÆ¥›o¾9=şø\ãiÃ†\ri÷\î\İ)\ÄcGGGzú\é§\ÓwÜ‘&Nœ\Øß‰\ë»\âT£@İˆ£2[ZZöW\Ö÷¾÷½\î@Û·o_z¿{\î¹4iÒ¤¾\á×•?ªQ .¯zsf¿4gÎœC\n»¾z\è¡\Ô\Ú\ÚÚ·\ë|\0\ÔNl\ÒÌ\×U½)ó\å—_NG\Â_şò—tñ\Å\Ğñ\Ù\Ô	@M\ÄA+\Õûğ\"ğbİ‘ŸW|±\ÏÁ-\0º8J³z“\æ‘\êğú\ëøúl\ê|\Â\è0h\â<¼\êıx±\ïhŠ}|\Õû÷b³ª¥\0À ˆÏ«\ÒÜ³gO:\Ú.½ô\Ò\êÍœ\Ë-\0ºØ—W}¥•8-a0,[¶\ì€+·\ä:\Ñ\Ò\0à¨ŠSª^9œSUõ	\ìq­NK€£ª\ç\â\Ñ\İÁsë­·¦Á4s\æ\Ì.Sfi\0p´CoKoğÄ¥\ÅSlJ­\ÚÄ¹\İ\Ò\0\à¨\Êaó\Îş¼M›6\rj\è\Åy{Õ·%²4\08Ú\Ş;Á\Ó{ñ\èÁ¿¯ú÷[\Z\0Z\èÕ‚\Ğ@§\0Gš}z\04R§\ç\èM\0\Z&ôœ§@c\È\ÖUµº\"\Ë%—\\\âŠ,\0¸öf\ìOs\íM\0\ZB\ÜÓ®ú.ƒ\Ñ\íMš4\É]\0|q?½>]\î§@£t{mƒu\çôs\Î9Ç\Ó¨\Ö\Ö\Ö\ã\Ë\åò®\êƒZ\â<º#}^\Şøñ\ã«7k\îŠ\ßkôt¥R\é\ëÕ›9#øT\Ç^u\à\Å\ï‰\ßg\Ô¨eğ}¿:øbSg\ì\ã;œƒ[b^ŸMš\Ñ\åM5\Ú\0\Ô]ğõ\Õù\Üs\Ïòi	“\'O> \ì\âs\0õ|_¯\Ş\ÇW½\É3®\Üò\ä“Ov_«³÷\"\Õñû\ì\"\ãJ+\Õ\'W\ïÃ³I€º™T\Õy˜õ„ƒV\0¨{q_\îÒ©¾r\Ëû©¸\ÒJœx\Ş\Ü\Üüe£À—,\ë¹Vgt[ªoKTu9±\íqñè¸–¦K‹\0\0\0\0\0\0\0\0\0\0\0\0\0õ\àÿ¹°\"c<O e\0\0\0\0IEND®B`‚',1),('5002',1,'processes/Entrust.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5003',1,'processes/Entrust.Entrust.png','5001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1),('7502',1,'processes/Entrust.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7503',1,'processes/Entrust.Entrust.png','7501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1),('7506',1,'processes/Entrust.bpmn20.xml','7505','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7507',1,'processes/Entrust.Entrust.png','7505','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0²g\"\0\0*óIDATx\Ú\í\İ\\e™7ğ\Å*…–Km±ReQ–JQEaY,®Œe\á.úee™LŸtO&Œ€Q \Äx\Ã2K–°PÀBü¸*‚º¢P(ºˆˆ(	1¹bH !&$!$!™@r¾÷»óu’\É}.\İ}~¿ª·z¦»§»\ç93\ïÿ¼\çò!Cªò<›\ÚğøúOy~\å\ï–nyñ¥<¿hÊºüû?›§/óªÏ»2µûkÏ‹\çD»ú\×\Öü\çÏ^\\÷¼¦mÊ¿7d—ÿú¥yC\0h,©\Óşğ¯–\å/¦Û‰\Ñy\ÏZ/˜üZş|ú~fj?¬\î”\åù\Ât\ßÁÕŸ;ssOK·¿K\íÿ¤vx\íy+òü\Â\Ş\ãmÉ¯O·Ÿ¬\0\r\â•<ÿv\ê g¥öŸ-\È‘n?z\ámó_\ê%4\îImFj?¾\é‘M/§Û‡.ı\ß\ÖE˜\ìğ¼±µ\Ñ\ÂM\ç“òT~÷Ÿş6šø°j4\Æ(\à÷©MO\í\â\è\ÜûÌ†Ø¬s{j¿I\í¼ë¦­^nŒ\Ç~2oKl\Zº6¥\Ä5\éö–X\Ûÿs?¾>å¾µùjAr\ëüü®\Ú\æ¥Úˆ 6-¥ûQq€xl\âù\Î\ï×¾’:ñ?Äš}jÇ¤ö\åú\Í:÷®\ÎEG~Ãƒ›gNİ”?›6\æùc;>¯:Š\è\Ùdt\éÿ.z6n¿;\ã\Í*\rĞ€¾÷‡üÁÿ]”ÿ<:ÿ?½–?{\ÅoW¼š¾şÁµ“_Ÿ\ÛòkÏ»zò«k\âö–?õlº&6½–\çO\îø¼›ù\Û\Î\ã\êH£ggñ\İKò[U\Z Á¤Nú°\é›ò\Õ5ÿY·=“\ß›sf-ÏŸÿ\Åù\âú\ç\Ş6k\Ïşk¦¾û\r†u§\ç\Ï\Ìó¿\ìx\ÔOlû¯{ıa©}&‚Fµ\Z+\0Úª›~¾\Z;o\Ó\íUO\çù¥\évdjŸ¾ùÑµ±\Ó÷‚ÔJ_Ì©>÷\Ú\Ô>›{ª;‘¿0/\Ï/O·\ï‹û\â \ê>ƒV\ß\ã\à_ıµg\Ã1*\ĞX!ıÕ¯?ù|Ï½wMş\Âw/Ÿ\í\Êß®~\"O-ö|¼ú¼Ÿ\İ0}ıªI¿[±¶\Ö.ı\å\â82¨’\Úk}t\ã\Ãù\Ô\Ø\ÌTk±_ D\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–\çùa÷\ßÿ¯o¸\á†õ“&M\Úúõ¯=\ï\ê\ê\ÊGŒ‘wvv\æ_ı\êWó	&l¾ø\â‹_\Z;v\ì\×T ,[¶¬\ã\Ö[o}ı+_ùJ~\î¹\ç\æ?şñóGy$_¾|y¾q\ã\Æ<lŞ¼9_¹reş\Øc\å·\İv[~\Î9\ç\äcÆŒ\Ù:~üø‡\Ê\åòª\Ğ|kşGL›6mõùçŸŸ§5ÿ|\îÜ¹=ıŞš?~F\rù\ÙgŸ§Q\Ã\Å*\n\ĞDkÿ\×^{\í\Öq\ã\Æ\ås\æ\Ì\ÉÄ³\Ï>›;6ÿò—¿ürWW\×aª\ĞÀÖ­[7vÂ„	ùu\×]—¿şú\ëy_ˆ\ÍFñz\çwŞ«64ğ \à\Ê+¯\Ì\ßzë­¼¯\İx\ã1\"xe\èĞ¡‡¨6@‰}\0±	(\Ö\Øû#\0j®¹\æš|\äÈ‘‹U \ÄN\à\Ø\ĞW›€v·i\èœs\Î\ÙZ.—Ç©:@ˆ\Í@qP4bgqGG\Çû\0\Z@œ‡¤K/½tóˆ#\îQ}€AgÇ‰`5\n¨y\æ™gò4x\ÓNb€A4yò\ä\ßÆ™Àı¹3xWººº¶dYv¶¥\00Hb. ˜\nb0\\}õ\ÕoŒ1b¦¥\00Hb2¸˜h0<üğ\Ão¥Xb)\0’˜\r4&ƒ«W¯ŞšB \ÛR\0$1\rtm6Ğ\Ò\ÅTÔ–À ‰Nx0	€At\Æg\æH`«\0D_û\Ú\×mŸÀÊ•+7\Û\'\00ˆ.º\è¢\îÁ::\èşû\ï_\é\è €At\É%—,¬ó&L˜°\Ây\0ƒh\ìØ±_ˆk\Æ\Ã1m„3†?¶ô\ÜA³gÏMA\æl^x\áƒW]uÕ€†À\èÑ£W˜E \Ä\à¿ø\Å/n?ş€Àÿø\Ç\Õ1\np=€1fÌ˜	qa™ş¾²\Øo¼±¥R©lve1€s\Î9\ç,¿ú\ê«ûs\'ñ\Öô+³,[¨\Ú\0\r&vÒ¦Á\ên¸¡?‚`\ëøñ\ãÿ\Z\ç\Ä\æ\'\Õh\Ğ =zô\Ê\ï|\ç;ù†\rúl\Ğy\ç;‚—\Ø\0\ĞA\Ğ\ÙÙ¹ğK_ú\ÒÖ§z\ê€w\Ç>€\Ød\0\ĞDb\ç\íÈ‘#ßºè¢‹ŞŒ0Ø—MD?şøª\Ø\ÇP=\n\ÈN`€fk\ïi-ş±6?jÔ¨­“&MzcÆŒo­X±bK\\ 6hL÷À¬© \âL\à\èü\ã<\0›\0ZD\ê\Ô;S›’\Ú\âq}à¼®u\Ç6ÿ\Ôf\ÇT\Î(F0\ä\'N<X%\0\n\Z£G>T%\0\n\Z\í\í\íÿ \0\Å­vş8R{¯J\04²,{¿J\0P¹\\\Ş\Ò\Ö\ÖvŒJ\07W	€\Z1b\Ä[\í\í\íV	€b†@\\,ş#*P\Ğ(•J\'«@•\Ë\å\ÍÃ‡ÿ´J\03º\Û\Û\ÛÿU%\0\nhÄˆ›J¥\Ò0•\0(flLm¸J\03\Ş(\'*P\ÌX›Q	€b†Àº\Ô\ÎT	€*—Ë¯§ö%•\0(\æH\à\Õ\Ô\ÎS	€bÖ¦6N%\0Š9X“\Ú7T ˜#Õ¥R\é\Û*PÌ‘À\Ê\Ô&¨@1C`E–e«@1C`yj—©@¥QÀ\ÒJ¥r•J\0s$ğ\×r¹|µJ\03^L\íz•\0( ,\ËV*•U ˜#\ç\Ë\åòT ˜!ğ—ÿ£\0\ÅgRû©J\0P–eóSÜ®\0\Å¹)\îP	€J0\'µ;U ˜!ğDj¿V	€b†À£©İ£\0\Å\ÙY–İ§\0\Å?¤˜¬\0T.—g¤˜¦\0A \0\ÅÉ±IH%\0Š÷\Å\Îa•\0( R©ô\Ûr¹üG•\0(fÜB\àq•\0(fü*…ÀŸT €²,ûÅˆ#R	€b†À\ÏR\ÌS	€JpkjO«@Å¥%\ã“*P\ÌøA\\l^%\0\n¨R©Ü˜e\ÙB•\0( 4\n¸>µU €\Ê\åò\Õ)şª\0T©T®Ê²l©J\0s$py\Z	,S	€b.I#*P\Ì¸(…ÀJ•\0(fŒO!°J%\0\n¨T*]0bÄˆ5*P\Ìøj¹\\~E%\0\n(\ÎK\íU•\0( 4\nøRj¯«@1Gg¦¶N%\0Š©­W	€*\')\ŞP	€b†§¶Q%\0\n¨R©|>Ë²M*P\Ìøl\Z	t«@•\Ë\åSRlV	€b†À\'…\0@A\ÄN\à\Ôò=´%*Ğškş—\ï)J¥\Òi*P\Ì\ÑÀbhaY–M\ÚUtttd*\Ğú£u½„€\ËL$.\Ü1\Ê\åò¹*Pœ x­.\\] HÒšÿ¸ºQÀ8(\èh@%\0\n¨T*}[\0ôƒ<\ÏY¸p\á’Ù³g\çS§N\Í\'O¬\íG›2eJş\ĞCmM\íFU@Óˆ\0˜9sf¾r\åÊ¼»»[;€¶jÕª|úô\é[S Lò—4…€¾\r‚420\í5\ĞbÎ»o[lò—4…\è°t\ÜB\0»m\ë_]/|\ì\Çùü)ÿ\Õ\Ó\â\ë¸O§/€uk_\Ê\ç\İ?!\ê\Şon\×\â¾xL\Ç/€%ó³S\0\Ô\Ú\Òù÷\èø…\0\Ğ\Ê!ğÌƒÿ½\Ëˆ\ÇtüB\0h\á˜7y\â.C \Óñ@hB\0h\Åˆ£vñ˜_\0-fİ°\Ëˆ\ÇtüB\0h\áXó\Ò\Ü|\Ş\í¼)(\İ\éø…\0\Ğ\Â!m\Ñ\ã?\İ)\â>¾\0Z=6m\Ê<|\ãÎ›‚\Ò}ñ˜_\0-\ZqFğs³®\ß\å>x\ÌY\ÃB\0hµHkø\ËL\Ëÿ|\ßø]@­\Ås\â¹FB\0h\Ø\ÓÚ¿Q\0Z8öf\íw£! €&ı\r€ZB\0h\âĞ„\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@@ñB\à\ÙgŸÍ‡š?ıô\Óù½÷Ş›Ï;7?ò\È#÷\êg_x\á…üŸÿùŸó_şò—ù1\Ç“?ú\è£{¾®Áš5Ñ¹ö¼\ïş|\Ş\äw\ß}·\0\è‹ˆyÕªU\Û:\ç\èd\ãvö\ì\Ù{€x^„GÏµ\n-\êù~O\ï!Ï»ë®»ö\ëó\Şq\Ç=?\ï¿\ãc·\Ür‹\0„Àş´ZôöZ3g\Î\ÌO8\á„\í\Ö\Ş\çÌ™\ÓóüY³fm»oÃ†\r=·‹/\î\Ô\Í\Í7ß¼\İ÷ó\æ\Í\ë	 \Úı¯½öZ¾dÉ’I|Ÿe\éÒ¥\Û}–7\æO>ù\äö\ËIô\İ\ï~·\çu?÷¹\Ï\åÿò/ÿ’Ï˜1C\0B\à@B :Ü¸\ïšk®\Ùöõ¸q\ã¶=÷½ı\ío\Ï|ğÁF±\Ö_\Çæ›£:j»Ç>ú\è\ÑÀ\á‡·µµõ\Üÿÿñ=M:u[À\Äm­C0\Z3fL\Ï}k×®\íuTS{O#@`{\ì±ù‰\'¸SG»Ó´\Õ\ë\Ö\åW^y\åv\í)\ê;\ë\Ú\Ï\Åû}\ìc\ÛöYV¬X\Ñs[?ª\ØİˆE\0B C\àø@O§\Ü[\Ä\í\í·ß¾Ë€\ìˆ\ÍIB\0{\Ùb;û¶ñ\×6Mš4i\Û\×gy\æ¶\íşñ}WWW\ÏH ¶Ã¶¾C>ù\ä“{:\Ów¼\ãùq\Ç·\İccÇ\íù:\î¯=›ˆ>ñ‰O\äË–-Û¶\Ãz\ÇÀˆ\Ñq_l\Z\ê-\â\çcs\Òû\Ş÷>!\0½\r€\è8k-Ö¶\ëmò±c8vÀöv´O¬½_{íµ½v¤\ÑiGHDˆÔ‡K¼\ÏI\'´\İkFhŒ\Z5ª\ç5c\çn\ì\çE\ÄÏœr\Ê)=­ö9{;\Ìô÷¿ÿıN;…\0 4!\0M\0B@€Ğ„\0 4!\0M\0B@€ş²\0! \0„€\0B\0@\0! \0„€\0B\0`0\Ä\Üú:n!\0\ÔÌ™3·¬\\¹R\ç\İGm\éÒ¥‹Stû\ËšÂ´i\Ó.›>}úÖ—_~¹öë¯¿Ş§0eÊ”7S›\ä/h\Z©Óº8­½®\Í\ÜFŒÑ§¯—“9rd~ıõ\×÷\Õkv\0€~!\Ğ¯¹!^·\\.¯¯T*7:ô•(HdYv_¼n­¥0\Ø÷¥\Û#T \ÅC uö\çÖ‡@]Û’Ú”G«<@‹†ÀYgu\Ô.B ¾Í´™ C :\ZØ¼«\0HmImœ\ê´h¤\×]²‹\Ø8|øğO«<@k‡Àô^\àM;‡Š;Àı1\n¨T*?Wu€®®®Ãªÿ\Ö\Ô.Œû\Ò(\à“\Õ#„¾¨ò\0-\Õ\×^°\ãöÿ4¸(\İÿV–eÇ©>@‡Àn\ŞóÁ\Ô^uˆ(@C 9(½\ïË©=a	\0/j\'”\Åt\×Y\n\0\ê{\ÇJ¥\Òi–@ÁB ¤‘À÷bD\Ú{-\r€‚…@5\æ¤Ï±<}y%P°=zô¡\årùµ“-€‚…@¨T*\'\Äù\év¼¥P°\Õ\ë\Ä£·d\0\n\Õ\ÏsgjoÄ´–@ÁB ú™Å”–@C`Ø°a‡ÇŒ£©\İn	,B©TúT\ìÈ²\ìlK	 `!R\0\\GuttkI,B¹\\‘\ÚZ30&NœxpúŒ+Ó¨\à1K `!:;;\ßó¥ÁÕ–@ÁB tttd\ÕG‡Yj\0e\Ù÷\Ó\ç\í5jÔ‘–@ÁB \Zs\Óg^6ÄŒ£\0\ÅêŒ£¯§\Ï}¿¥P°¨~\æ\Åù©}\Ë(X„,\ËÎ\Å#Gü¨¥P°)\îJa°ÁŒ£\0\ê\ç_œ\Ú_,I€†@ggç»«3\Şji,B¹\\>¥zE²/X¢\0P©T.I¿Ë›mmm\ÇXª\0\ê\ï23^ioo›%P°ˆG³,[•‚\à–,@ÁB ¤xlJ·“,]€‚…@(ÿÍ–ô»}\Î(XTƒ\à©uŸ~ú\éï±”\n\Õ\ßm^j/Y\Ê\0öööw¦\ßo]–e÷Y\Ò\0j|8f-•JX\Ú\0\ê\ï86v§ÁG,q€‚…@H#»\Ó\ïºş\ÔSO}—¥P°¨ş®f(jÄŒ£Y–mJ¿óO-y€‚…@H!ğ™˜q´T*a\éB `!Pı/KaSK\í/\0\Åü½g¥¶ÆŒ£€( ˜q´\\.¯N£Gü\0B €ººº>XqôJ	€(\æ\ï_‰\É*•\Êgı5\0B €J¥ÒR6™q•e\ÙüÔ–ª \n¨6\ãh¹\\¾W5\0!P@\'Æ‰d)¾®\Z€( R©ô\Õ‚\ÔNR\r@³&÷˜qV.——¤\Ú<£€(f‡¦v‹j\0B €\Ú\Û\Ûÿ5N$K5\êT\r@³>W˜qÅ®\Ñ\ì˜q4&S\r@LL7!a \Z€( \Ø›…bój\0B ˜µ\êŒÅ±\ÃX5\0!P\Ìz\İ‡\Æ!¤ªb\Ö\ì™8™L%\0!P@1DL+\ÓK¨ ŠY·“b¢¹˜pN5€f\é¸VD§¿‡¶^¥öNL9ASP«\Ğ!Ğ¹§È²\ìb•Ú§ ¸7.F¥Q\r ‚`\ÕnB`\İĞ¡CQ¥}—¥Œ\ËSª\ĞÔ£´V{¹\ní»¸@}ª_w\\°^5€f‚\Şö\r¬7\n\Ø•J\å³\ÕG+ª4\İhÀ¾€>	‚«R-\ß\ì\ê\êú j\0ËŒú^\n\ÓGÒˆ`µGF\ï¬Î®U¤o\Ô\Í8:K5€F\rô\ì0\n\èó€=:6¥v™j\0\Î\î¥R\éŒ8‘,\ÂgT\n&\ÏóC.\\¸dö\ì\ÙùÔ©SóÉ“\'kûÑ¦L™’?ô\ĞC[S»±ICö§)6uvv¾\ÛHÀÌ™3ó•+W\æ\İ\İ\İ\Ú´U«V\åÓ§OßšaR“Á_R[\ì¿\n$F\0 oƒ º›ño¡6\ãh©Tº\ÛDl\Òy÷m‹\ÍC\Íú÷e\ÙGª\'’õ\ß–[\ÔK#R¼\Õ\Ş\Şşaÿ! z\ÚúW—\çûq>\Êõ´ø:\î\Ó\é·^TG÷™q„@O[·ö¥|\Şıò§\îı\æv-\î‹\Çtü­!…ÀK©\Íó_%ó³S\0\Ô\Ú\Òù÷\èø[4b\Æ\Ñr¹Ü\Úü§@C\à™ÿ{—!\éø[3ª£\ÏÅ\â\Ô\Êş[  !0oò\Ä]†@<¦\ão\İY–MŠ©%\Ò\íûıÇ€\êˆ\à\Ñ«\Ì8\n8\ZhW!\éø[?b\Æ\Ñr¹üJ\nƒ™şk `!°`\Ö\r»xL\Ç\ßú!\Ú\ÚÚ‰\ÍB•J\åÿ9P Xó\Ò\Ü|\Ş\í¼)(\İ\éø‹!¾3>ü\Óş{  !m\Ñ\ã?\İ)\â>~±B \Z·¥ \Øh\ÆQ(JlÚ”/xøÆ7¥û\â1±B \ZÏ™q\nqFğs³®\ß\å>x\ÌY\Ã\Å®®®Ã²,Û\Â\à.ÿEĞŠ!\Öğ—/˜–ÿù¾ñ»€Z‹\ç\Äs\nŠa\äÈ‘\ÉRœ\ï?	Z(ö´öoT jFŒñ­˜q4µùo‚	½Yû\ßİ¨@L.ÔµS\0<F¯=úPÿQ\Ğ!°¿PkB X!”‚`Y–esıGA„€&öÕ¨Q£LAĞ‚\àûş«@ªT*Ÿ\Å™ÿ,B €R\\F›;;;\ß\ç¿„€( ,\ËKA°ÒŒ£ „@\r:ô4\"X›\Úÿa „@utt\ç¤QÁ\Åş\Ë@bn:;f-•JŸR\rB €R\Ü36\ìpÕ€gŸ}6:thşô\ÓO\ç÷\Ş{o>w\î\Üü\È#\Ü\ã\ÏÍ˜1#?ê¨£òô|}\â‰\'öY¯y÷\İw\Æ\n‚©-R	h±H?¯Zµ*_³fM\Ï\×\Ñ\Ç\í\ìÙ³÷\ØQ\×?/n\ãûÅ‹p|\Çwô¼\Ö/¼ \ZD\Ì8šB\à\Ô\îT\rhÁ\ÍAµ\è\íµfÎœ™Ÿp\Â	=£†\Ú}Ë–-\ëyşƒ>¸\İ\Ï?ğÀ\Ûı\Üñ\Ç\ß3º¨ÿ¹÷¼\ç=ù5\×\\ó·\İ,Z”s\Ì1Û½\ßÆó\'Ÿ|²\×\Ï\Ù\Ûkr\Ê)ù°a\Ãz‚é®»\î\êù,oû\Ûó\Ç\\ô¡r¹üñ\Ø?n\ÏU\r(@Dg÷E‡]ûzÜ¸qÛ…À\Í7ßœ\ßy\çù?ş\ã?n\×\é\Æc—\\rÉ¶Ÿ»\âŠ+vz,¾şû¿ÿûüö\Ûoß®“3fL\ÏsÖ®]»Ó¨¥·×¬Bj÷G@\Äm}h	¾Q©T\Æ\ÇC\éöÕ€c=v§mıñœúˆM6qûı\ï\Ûsb4÷{\î¹=\Ûö¯¿şú\Î~\ÇMIK—.íµ³\î\í³\ì\é5k£’\Ú\ë\Å\í’%K„@?È²lr\Z\r¼f\ÆQhñøÀ>\ìc\Ûc\Ô:õ\Ú&š{î¹§g“OıÏ­X±b§\×5jT¯k\ë½}–=½f<?ö%\Üv\Ûmù;\Şñ|Ã†\rö	ôŸ˜qty\nƒ9J-±\r>:\ÒY³f\í´9hÒ¤IÛ¾>ó\Ì3·\ÛS\Û_·µµm\×)}ô\Ñ=kğŸø\Ä\'¶\ÛTÿó½mû#•\â±\Ø4´cp\ì\ê5\ãH¥“O>¹g\'÷º}B ¤xo\Ì/”‚\à{ªM\ÑO:u[‹5ñÃ±·v_t²ñ\Ü\Ô\îû»¿û»\í¶\ïGG\Üq\Ç\ír³Lı\Ï\ÖB\'vòF«}–G\n»z\ÍøÌµµÿGB ”J¥\Ób\Æ\Ñ\ÃUš|$ 	ı‘F\×Åˆà¬³\Î:J5@bn\Zz\"µ—Ó—©!P01\ãh\nWS{P5@bn:®zşÀEªB@s³\Ğ«gR5@J#Ÿ\ÇC\í\í\íÿ \Z „@¥‘ÀóY–-T	B €bB\à\Ô~¡\Z „@•J¥“«W$û²j€”B`B1\Ô\Ö\Öv¼j€\Å‚©qAœK \Z „@ñÄŒ£+\Ê\åòŸ”„€( ˜W(…À\æ?T\rB €RÜ‘B ÿ÷ÿ÷£U„€(\Ôù\ßR=“ø|Õ€~ó\îë¸…@#Ê²lZL5=|øğO«ô“™3gnY¹r¥Î»\ÚÒ¥K§\èö—µÿ\Ú\Û\Ûß–:ÿ§Sl\è\è\è8VE M›6\í²\éÓ§o}ù\å—u\â}\0S¦Ly3µIş²ö;\0\âŒ\á©­*—\ËG¨€\Ôi]œ\Ö^\×\ÇfŒFm±c°‘?_µu€ı\×\Õ\ÕõÁ´œ×¥ö¼s€m&Nœxp„€J´®´\ÖÿñÔº\Ór~X5€\íŒ=úP!\Ğ\ÒP®^T\æ\çªô¶™\à0!ĞšJ¥\ÒqhjW¨Ğ«\Î\Î\ÎwÖ“e\Ù÷ª\ç\0œ«\ZÀ.~ú\é\ïI\ÅV•h©\ã¿7…À›i¹~N5€İŠùcR‡!Z@u\'ÿœ\Ô6¦ö!ö(\Í\ï\ÔSO}W\Z,I\í•\0\ïU`¯´µµ“:-*\ÑÜ£¹¸6@j‹\Û\Û\Ûß©\"À¾„ÀñB yuttœX\İüóDúö öIZsüpG®Í§R©|>-»7SˆÿF5€ı’:‘“„@óÉ²\ìü\ê9\0×«°\ßbJX›T‰¦\n€I\Õs\0¾®\ZÀ)•JŸŠy\åU¢iBû—1rKAĞ®\Z@_t*§¦pP\êøIËª{\äÈ‘U OT*•\ÏFÇ¢+&ùK°0ök\éöı*ôe|>u,›T¢1U§õXÚ²¸(ŒŠ\0}*u.\Ã\ã8s•h<qGZ6o¤6/¦„P \Ïutt¤@ö†J4–´L>Gm¥\ÛÉªô›r¹<2.:®\r\0g\ÇY\Ü)~¨\Z@‡ÀRg³^%\ZC¥R¹¤\Z\0TµÎ¸\0¹J¾´~Z=¸S5€Q*•¾‡ªÄ Àô´6\Ç\É{ª\äH \æ yU%G{{û\Û\Ò2x66\ÉÅ´\Ş*¨´ö9.µµ*1ğ†\rvx\êüW¤¶2®õ¬\"À€K\Ğ7R[£>;:öÅ¤\0~n\èĞ¡‡¨0(J¥Ò·SG´Z%´\æ\'\ÇT©\ÍT\r`°Gbs„JX½+1hj·«\Ğ\Ò\Ä\Ô^V‰uU½L5€†P.—/M\Òr•\è_Y–}¿z!˜/©\ĞH#+R{I%ú5\0\î‹y€b\Ún\Õ\0\ZJê˜®J\ÔR•\è{1óg\êüŸŠ™@SOP \á”\Ë\å«S\'õW•\è[]]]‡E¸¦Ú¾2jÔ¨#UhH©“º>µU¢\ïtvv¾/\ÎÂº¶··¿SE€†•\ÖV¿—F‹T¢\ÏBõ¤\Ô6¥º>–¾=HE€F›R<¯®R©œ\ç\0¤zŞ¥\Z@S(•J?Š©T\â€G\0c«‡€^£\Z@3u^·¤ö•\ØÕ\ë\0\ãTh¶¸5µ§Ub¿GR¿ŠM@±)H5€¦“e\Ù\ÏR\'6O%ö\ÙA©nVwD9€f\r_\Ä	M*±÷\â°\ÏT³E©½‡ƒªĞ´RGvgjsTb\ïÄ‰_qı…˜j#NS \ÙC\à×©=¡{S?¤‘\Ó©Í)!Th…¸\'¶m«\Äîµ··ÿkL—\Úıª´Œr¹|oZ³}D%v”_Lu\Ú\'Ö©\Ğj\Üı©=¬»¬\Ïe\0•Je¼j\0­\Ø\ÉMq­\Û]’n«N1R5€–”eÙ´\Ô\É\ÍP‰\Âñ¡\Ô6§\Ú|R5€V^ÛA 3t\è\ĞCb\Z\ÔÖ·µµ£\"@«¯ñş!…Àd•\è¹À»S-V¦š¼<lØ°\ÃU(B\Ìv\Ø\ã!±\Ökÿ1\nˆÑ€¿ \âğ\Ğ8L´\È5(•JŸJ5\Øl\ßP\Äx,u~¿)\ê\ïGş\Ä@1›ª¿ ˆ!ğdQ¯„•:ş\ã€\Ô.õ—\0RL“\Èpğƒ€8\Ø_P\ä‘À\Ü\Ô\ŞQ°\à{ \æŠù€ü\0Eù©C¼½¿k\Ìü™~\ß?\ÇL mmm\Ç[ú@\áÅ¥%‹°S4\æşk\0Äµ\0N?ıô÷Xò\08;ö–Vş\ã\ê_\årùµ\Ô=úPK\àÿ‡À‚\Ô~Øª¿_\\ÿ7®œ\à\éÛƒ,q€:©s|¾U\ç\ÉOÿğ\ê9\0wZ\Ò\0½‡À¢\ßkµß«T*}5uş[\Ò\íÿµ”v½¶¼8…Àu­ô;\Å\ï\ÚXK`÷#%­´¶œ:ş_\Ç& ô;f\é\ìy­yi¥R¹ª~•ƒR =~ŸM\'Z²\0{·\æ¼,u—7ó\ï\Ğ\Ş\Şş\ÎØ¬•Ú«gu\ÖQ–*ÀŞV¤‘À%\ÍúùG\Zud\êü_ImÉ©§ú.K`\ßF/§6±I?û‡RÛ˜‚lNL	ai\ì{Gº*¦Tn\Â\Ïı¹˜.µ\ßYŠ\0ûß™®N\í[\Íô™K¥Ò—\ã\ĞJ¥r£%p`!°&µo4\Ëç\Ø\Õs\0¾e\éx§º6µq\ÍğY³,ûYœ>oÙ’è›‘À«©\×Ÿó©u—J¥“-5€¾	¼\Û\Øõó\r:ô\êL§\ë\ÒH\àhK o×°£s=»?[ggç»«G/­6l\Ø\á–@ß‡Àú48£\Ñ>WGGÇ±ñ\ÙR{¦½½ım–@ÿ„À†\Ô*ô™†ş\éô™6§ö %Ğ\â¢\ëi­;k”\Ï£’8´\\.ÿ\Ä\Ò\èÿ‘À\ÆJ¥rzƒ|–	©óß’‚\ébK``:\ŞMi\í{XŒ\0~>Ï™–\nÀÀ…@w\Z	|v?Ã”\ØF\0Ÿ±D\0¶Şœ\ÖÀOŒ÷£~R\Ç??vN§\Û\ã,\r€Á	OB\0üCz\ï\å\é½W§v„%08!ğf\ê„?>\ï™\ÖúßŸ\Şóõô\Ş/Œ=úPK`ğB\à­\ÔN\Z¨÷9r\äGc?Dj³Ó·Y\0\×\á\Çuxó=´î®®®\Ãúi\Ğ¡“nai\0°8\nhO!\Ğ_j‰kT/s•%0x£»\n€r¹¼9f\í\ì‡÷¼¾z!˜ó,€\rô\Ç( \Ëob\çsz\íÏ«>@È²laoûúxpPzŸ\'cZŠööö«:@ƒ(•J§\í©Ã¾®¯^ÿ\ÔSO}WzÍ¿¦\×\\›nß«\â\0\r&u\Î\Ë\ê`C_¢Ó¯^·xI„J4 ¸šX-\Ò\È\à’¾x\Í\Ø\ì›R\0üi\âÄ‰«2@cVD\ÄúZ1i\n–7\Ó\íoU 9B óô\ÓO\Ït­=­ùŸ[=ôUh¤–§¶\ßqIkÿWF\0¤À\Ê	\Ğ\\°5µ\'«·û©ó¿#¦h¤\ËS°÷P\ëø/\Ü\× ˆ	\à\Ê\år÷@\Ï@\n@\ßÀ\î\ßNLıœ:ş\ç³,{½««\ëƒ\Ê	\Ğü°\ã\ãöö`\\ü%uş«\âb0}qD\0\05½n\ZŠ\Ë?\ÆIeq9È¸,¤r´^\0\ÔÁ–Úˆ ®A—¡LmªR´v\0\ÔÿÜ–c=ö\î84Áÿ(%@1 Ç»\Şõ®ÿú·û·üŸşéŸŒ\0\0š<\0\âz¾?²\ç\ëún÷¼C=ô²	\0\Z#\0ş2\äogÿe7A°«\ç\íö¨!\0\Z7\0†T\×\ìóº\Ö[\Ô@­İ´‡\× Á`W|}\ì\éñš}>³€Á\r€=ÁÁ{\0õ\ï³E\04O\0\ì.º÷!\0vû\0š$\0vû\056\r²£ª÷ü}ü¹ƒ{tW\ï\ß÷Uö(‹`pG{»i¦¯G—[\0µO 6·MA\0M}yt\Ç\0\Z4z;j§¯\Î\è\â¨ €†va/k\ê}y\Æğ$%hüA\Ì$\0\0šlDP7\rÙ»YD\ëŸ\ç|\0€&\È6|\0\Ğb#‚}	\0\Ğ\"#‚}\é\Ğ\0@öf\ÓP\ç;\n9\"¨\íC\0\0‚\Ş\Î/\0 …ƒ\àÂº\0p&0@\Ô\Öü§1(@1G#FŒ\È\0@AUC\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0€\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0„\0\0B\0\0!\0€\0@\0!\0 \0\0\0„\0\0B\0\0!\0€\0@\0 \0\0\0\Z·\Ã_ş\Úz•h\Í\è\ÜSdYv±J´n¬\ÚM¬:t\è!ªPÀ\Ñ@¹\\¾\\…\0Z?z\Û7°\Ş(\0  £û\0ŠËŒ\0\n*­ùŸ]ª@ñF=ûŒ\0Z\\tô±ÆŸ\Ú\Ì\êa¢\İ;\ìx+µ5©Í®T*7vuu¦j\0M®­­\íøÔ±OOû\æ½8[¸şp\Ñ-Y–\ÍO·WE€&\\óOø}©ó\Ï÷¥ó\ßE›md\0\Ğ$†ş\é´¿q\Ç\Îü\Üs\Ï\Íoº\é¦ü‘G\É_z\é¥|\ãÆyˆÛ•+W\æO<ñDş“Ÿü$7n\\o\ÓI¼Q*•NS]€Gıtttl©\ïÀ¿ù\Íoötğo½õV¾·\æÌ™“?~\Ç0\Ø\ê|€€ú\Í?)ò{\î¹gŸ:ÿ\İw\ß}yWW—\Ë\0\ZYlJ°µ~\Ó\Ïs\Ï=—÷…_|1?ÿüó·\Ø4\Ğ b\'pı>€€\Ø\Æß—\âõ\êƒ ö\ØY\Ğ\0\â( úM@}5\èmD°Ã¦¡GU`\Åy\0õûb@Š}õûb3”¥\00H\âD°ú£€6oŞœ÷·o}\ë[õ›…\æ[\n\0ƒ öÔŸ	‡„¹s\çnwfqjGX\Z\0,Õ¬\ß| ‡‚\î«ú\Êb®!K`€U\'ƒ\ë\éˆø\Ã\æ\é¶\Ûn\ÛnZ	K`\àC`\ÛE\ãc*ˆ›\ê6	­µ4\0X\ê|·\íX¾|ù€†@œ7P?\rµ¥0ğ#mqm2¸\ïWÿş–À †À`\0FB\0`0\Ø\'\0Pì‘€£ƒ\0\n\Î\0(ª´~ù`1ü•¯|\Å\Ã\0ƒ)\æŠ\íñ\æ(¨˜Ó¿~Ñ\r\Ô_{\Ø,¢\0ƒ(®\'—{t=€\âfÔ•\Å\Î8\ãWh$q­ß¸\æo_cxÌ˜1®1ĞˆJ¥\Òiõ›…\"újD#€ú\0ˆ÷‰÷Su€\Æ\n‚\êƒ 6\r\Å>‚\ÙYû\0v\Ø£€‹U 	‚ v\ÔĞœ9söù0\Ğ	&l\×ù\Ç\ë\n\0€\Æ‚\Ó\ê÷\Ôo\"Š3‹{ì±¹†j“\Î\Åmló ˆ3\ëO«\ß`@“ˆ¶õG\r`{\ÔN`€&\ç¤µø\'\ë\Ï,Ş›gÇ‰`•Jå³ª\Ğ\äbŠ‰\ê\\C1:XU?\ru\İôkc2¸˜\ÈT\0\0\0\0\0\0\0\0\0\0\0\0­\ëÿ‚\Ç\êÁl\è\0\Ü\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','15001',7),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10006','Entrust:4:7508','10001','10005','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-03 10:57:11.575','2019-06-03 10:57:11.585',10,NULL,''),('10007','Entrust:4:7508','10001','10005','submitEntrust','10008',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:57:11.595',NULL,NULL,NULL,''),('12506','Entrust:4:7508','12501','12505','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-03 10:58:39.272','2019-06-03 10:58:39.276',4,NULL,''),('12507','Entrust:4:7508','12501','12505','submitEntrust','12508',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:58:39.279',NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('10009',NULL,'participant','201906031001',NULL,'10001'),('12509',NULL,'participant','201906031001',NULL,'12501');
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
INSERT INTO `act_hi_procinst` VALUES ('10001','10001',NULL,'Entrust:4:7508','2019-06-03 10:57:11.526',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('12501','12501',NULL,'Entrust:4:7508','2019-06-03 10:58:39.218',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('10008','Entrust:4:7508','submitEntrust','10001','10005','ToSubmit',NULL,NULL,NULL,'201906031001','2019-06-03 10:57:11.667',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','Entrust:4:7508','submitEntrust','12501','12505','ToSubmit',NULL,NULL,NULL,'201906031001','2019-06-03 10:58:39.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('10002','10001','10001',NULL,'ClientID','string',0,NULL,NULL,NULL,'201906031001',NULL,'2019-06-03 10:57:11.549','2019-06-03 10:57:11.549'),('10003','10001','10001',NULL,'EntrustID','string',0,NULL,NULL,NULL,'201906030001',NULL,'2019-06-03 10:57:11.567','2019-06-03 10:57:11.567'),('10004','10001','10001',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-03 10:57:11.567','2019-06-03 10:57:11.567'),('12502','12501','12501',NULL,'ClientID','string',0,NULL,NULL,NULL,'201906031001',NULL,'2019-06-03 10:58:39.256','2019-06-03 10:58:39.256'),('12503','12501','12501',NULL,'EntrustID','string',0,NULL,NULL,NULL,'201906030001',NULL,'2019-06-03 10:58:39.269','2019-06-03 10:58:39.269'),('12504','12501','12501',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-03 10:58:39.269','2019-06-03 10:58:39.269');
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('5001','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('7501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Entrust:1:2506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL);
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
INSERT INTO `act_ru_execution` VALUES ('10001',1,'10001',NULL,NULL,'Entrust:4:7508',NULL,'10001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-03 10:57:11.526',NULL,NULL,0,0,0,0,0,0,0,0,0),('10005',1,'10001',NULL,'10001','Entrust:4:7508',NULL,'10001','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-03 10:57:11.567',NULL,NULL,0,0,0,0,0,0,0,0,0),('12501',1,'12501',NULL,NULL,'Entrust:4:7508',NULL,'12501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-03 10:58:39.218',NULL,NULL,0,0,0,0,0,0,0,0,0),('12505',1,'12501',NULL,'12501','Entrust:4:7508',NULL,'12501','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-03 10:58:39.269',NULL,NULL,0,0,0,0,0,0,0,0,0);
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
INSERT INTO `act_ru_identitylink` VALUES ('10009',1,NULL,'participant','201906031001',NULL,'10001',NULL),('12509',1,NULL,'participant','201906031001',NULL,'12501',NULL);
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
INSERT INTO `act_ru_task` VALUES ('10008',1,'10005','10001','Entrust:4:7508','ToSubmit',NULL,NULL,'submitEntrust',NULL,'201906031001',NULL,50,'2019-06-03 10:57:11.596',NULL,NULL,1,'',NULL,NULL),('12508',1,'12505','12501','Entrust:4:7508','ToSubmit',NULL,NULL,'submitEntrust',NULL,'201906031001',NULL,50,'2019-06-03 10:58:39.279',NULL,NULL,1,'',NULL,NULL);
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
INSERT INTO `act_ru_variable` VALUES ('10002',1,'string','ClientID','10001','10001',NULL,NULL,NULL,NULL,'201906031001',NULL),('10003',1,'string','EntrustID','10001','10001',NULL,NULL,NULL,NULL,'201906030001',NULL),('10004',1,'string','WorkerIDs','10001','10001',NULL,NULL,NULL,NULL,'w2',NULL),('12502',1,'string','ClientID','12501','12501',NULL,NULL,NULL,NULL,'201906031001',NULL),('12503',1,'string','EntrustID','12501','12501',NULL,NULL,NULL,NULL,'201906030001',NULL),('12504',1,'string','WorkerIDs','12501','12501',NULL,NULL,NULL,NULL,'w2',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=201906030003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201906030001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201906030002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201906030003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (1001,NULL,NULL,NULL,'Tonny','201906031001',NULL),(1002,NULL,NULL,NULL,'Jimmy','201906031002',NULL),(1003,NULL,NULL,NULL,'Larry','201906031003',NULL);
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

-- Dump completed on 2019-06-03 12:52:02
