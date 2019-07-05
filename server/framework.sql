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
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"CusSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"StaffReview\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('3',1,'/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562206221743\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestReport\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestReportID\" name=\"ID of test report\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewReport\" name=\"TMReviewReport\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TMReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"qmReviewReport\" name=\"QMReviewReport\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"qmReviewGate\" name=\"QMReviewGate\"/>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusReviewReport\" name=\"CUSReviewReport\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CUSReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitReport\" name=\"TSSubmitReport\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"_12\" sourceRef=\"start\" targetRef=\"tmReviewReport\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"tmReviewReport\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_14\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"qmReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" sourceRef=\"qmReviewReport\" targetRef=\"qmReviewGate\"/>\n    <sequenceFlow id=\"_16\" name=\"é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"cusReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_17\" sourceRef=\"cusReviewReport\" targetRef=\"cusReviewGate\"/>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_20\" name=\"ä¸é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_21\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_22\" sourceRef=\"tsSubmitReport\" targetRef=\"tmReviewReport\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestReport\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"25.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewReport\" id=\"Shape-tmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"210.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewReport\" id=\"Shape-qmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewGate\" id=\"Shape-qmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewReport\" id=\"Shape-cusReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitReport\" id=\"Shape-tsSubmitReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"20.0\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"tmReviewReport\" targetElement=\"tmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"start\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"57.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"qmReviewReport\" targetElement=\"qmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"tmReviewGate\" targetElement=\"qmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"237.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"cusReviewReport\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"525.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"qmReviewGate\" targetElement=\"cusReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"412.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"tmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"227.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"cusReviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"251.0\" y=\"617.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"qmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"396.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"tsSubmitReport\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"65.0\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"cusReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"601.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"420.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('4',1,'/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"SSSubmit\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\" activiti:candidateGroups=\"SM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\" activiti:candidateGroups=\"QM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestPlan\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestPlanID\" name=\"ID of test plan\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestPlan\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('6',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0&ŠIDATx\Ú\í\Ý°\Ô\å}7p&µ©M\Ó\Öf\Ò:™Œu2\í\ëdlš±\Í\ÛI›\éXÒ´il†1E\Î\î\Ù=€\'#¢xAðF$ðÑªUCU¢D\ÓhM\È¯ \âQ¼€QQ¼p‘›Àÿ}~›]º\Ï\ávönûù\Ì<³\ç\ìž\ëoŸ}¾û<ÿÛ A]È²\ìðA\0@\ã\\ò\ß/<“ö©}ü\Æ\å\Ù+\ç\Ï\\´\ëÿý\à©U“¾¿l\Íøo\Ïß\î/\Æ\×]tý’\é\ã/\Å\×\Å\ãµ6~Æ‚=õ_Wûy\Ï3oQm\0šR\n\Æ\Ó~°ò\í¯ýð¹\ç.úÞ’\×\Çÿ\ç‚=_ùÞ’]ÿÈŽ]Yv_\Ý\×\Ý7sñ\Ö\×\"T/ÿñše_½lû\Ä\ÙK·Ÿ1\Ïÿ¼œ½˜\î_÷T–]2û±ln\í\ëj\í\ÜÞ‰\Û\Ú\×@3…\í©™Ú¢Ø‹nxlû…3¿s\Ý{\Ö\Æmºÿƒõ_¿fWöð%·®\Ø2ù¦\å\Û\"˜Ï½\æ¾\Ý\ç]³0f¶\Ó\á\ç·%\Ë.Œv\Óòì¶¯\Î^úZ|\ÜÙ¬\0ô¬ö²\ÛVoL·ó.þÁŠ-\ç_{\ßî‹¾—÷ú%;¾y×¦\×\'|÷Áñu³—¾ó\ê„\ï>´3}\Ýe\ßøùª7\'\Ýô\ä¶Ï˜\Ù~\ë\Þ\×^?ÿÚ…\Û\â\ë\"Tc†\\]n>ó\Ê_¼þpÜ¿(Ë¾y\ïö\ì\Z \Ãös_û\ïU›\Ó\í7b\Ûë¸«\ï\ÍÎ¿nÑ®ôù\âÔ®ûŸ®³úuz\Þo\îÿ\Óÿ¸\í™M_½qÙ¶\ÒYK²5é¾‹\'\ÍY¾º6KŽ«³\åží¢­qÿ?\Ýðˆ\åc\0š\Öy\×Þ·5\á-\çþ\ç‚=i†ºkÜ·\ïÍ¾ó`¶v\âõ®¬}]q\ì©|\Þ5w\\z\ÛË›bl,3Ï¼wÕ†ú¯‹ŸWûø+³[\â¶\ZÀör )g¶GG`>ùVötšz>KÀoXZ\Ùf{ó\Ó\ÙËe\Ùµkuf{\ê·\î\Ú³\Þ\ÏL˜õ\ÐÎ‰7<²ãŠ¹¯=V÷u‡\×f¹\Õ\Ï?“RvÊ…\×\Ýÿ¶jÐŒA{v\ì\Ø4\é¦\'¶]s_ö\Ë\ç³l\Ù\æ,{le–MÛ˜eKbY9}Íœ\Ôþ\ï\ä9Om¡f=üö\Ú4\r~t{züòŸ®}k\Æü-\ëo]¹õ\åô5\ç¤ö\Ñ\Þ\Âoý\è¥\ì\æµY6\é\Ç\ë²\Ùqx\Ðw\È\î¨\îõ*@3…m„ß”\Ø9\Âq\Ú­\Ør\å\Ï\ß|£vü\ìM\Ïd¢ŸO\í\æ\Ôîˆ½ˆç¾–½3\Ú®{\à8·\Ö\Òc¤vúYvQ\í\ç}\í–\çVN¹ù\Ù\êÉm\Ä*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ýR–eG\Üq\Ç·Ï˜1c\Ëô\é\Ó÷œw\ÞyY{{{\Ö\ÚÚš1\"?~|6yò\äÓ¦M[=v\ì\ØsU\0Ð«¯¾\Úv\ÓM7m:\çœs²3\Î8#»\á†²x [³fM¶mÛ¶,\ìÜ¹3[·n]öð\Ãgs\æ\Ì\ÉÆŒ“u\ÖY{&Nœø«R©t¤*@\ç3\Ù#\ï½÷\Þ\rgŸ}v–f²Ù²e\Ë*¡z –/_ž¥Yp6jÔ¨,Í‚§©(\0t˜\Í~\ë[\ß\Ú3nÜ¸l\éÒ¥Yw<ó\Ì3\ÙØ±c³\ÓO?ýµööö#T€¦·yóæ±“\'OÎ®¾ú\êlÓ¦MY#\Ärsü¼3\Ï<ó-\Ë\Ê\04ýŒ6‚öŠ+®\Èv\íÚ•5Úµ\×^3\Ü7|¸j\Ðtbm,\Ç4 ­ù\æ7¿™\r>|•Š\Ðtbg¨\ØFÛ¨¥\ã}-)3fO©T\Z§\ê\04X>Ž½Žc\ãž;Mµµµ\í¶ý€¦\Ç\Ñ\Æ\á==\é’K.\Ù\Ù\Ú\Ú:Wõð\â\ÌPqÂŠžš\Õ\Ö<ýô\ÓYšÙ¾cg)\0¼»\îº\ë§qf¨<wŠ\êJ{{û\îb±8Ê³\0À€\ç:ŽS0ö†«®ºjkkk\ëB\Ï\0Z\\T \Îu\Ü\î¿ÿþ])l_ö,\00 \Å\Õ{\â¢½aÃ†\r{R\Ø\îð,\00 \Å\åñjW\ï\éiqaƒ¸DŸg€-Â®7	[\0¼“O>¹7g¶{„-\0Þ¹\çž\Ûk\Ûl×­[·\Ó6[\0¼)S¦\ìè­½‘\ï¸\ãŽuöF`À»ø\â‹Wõ\Öq¶“\'O^\ë8[\0¼±c\Ç~yÌ˜1½r©8]£3H\Ð,»»§Ï¼xñ\âXBvnd\0šÃ¤I“~y\å•WöhØŽ=z­«þ\0\Ð4\Ú\ÛÛ8õ\ÔS÷,_¾¼G‚öÁ\Ü³Z×³ ©œu\ÖY“\ãò›6m\Ê5h·nÝº»\\.\ïLA;N\Õh:cÆŒYs\ÕUWå¹³Ôžô;\Ö‹\Å\çU€¦;+¥\î†3f\ä¸{&NœøRW\ËÖª\r@S\î\èÑ£\×}ý\ë_\Ï\Þ~û\í†-Ÿyæ™±C\ÔË¶\Ó@5pGŒñüi§¶\çñ\Ç\ïö\ÎP±6–Ž\Íh ƒØ‰iøðá»¦L™òN„\îÁ,-/Y²d}l®\îulg(\0\èJ\ÌFÓ¬ô–˜Ž9r\Ïô\éÓ·.X°`\×Úµkw\ÇõhkWï‰‹\n\Üy\ç\âŒqf¨\Ù8ŽÖ²1\0„ž#R»;µU)€·\Æ\åñ\êÚŽ\Ø&›\Ú\â8£3C@\ã8›:u\êa*\09†­Y,\0\ä¶---T	\0\È1l\Ò\09‡\íˆ#þD%\0 ¿°\Ý3t\èÐ¨\0\ä¶©¥\0cØŽ1\âc*\0ù…\í\îb±xŒJ\0@Ža\Û\Ö\Öv¬J\0@NJ¥\Ò\î“N:\é“*\0ù\Ílw¥öW*\0ù†\í§U\0rR,\ß>|øgT\0ò›Ù¾S(ŽW	\0\È/lw¦°ý¬J\0@~a»£X,~^%\0 Ç°-—\Ëÿª\0_\Øn/\nCT\0ò\Ûmif;T%\0 ¿°\ÝZ,[T\0r\ÛR¢\0“4«};e\íp•\0€üf¶[R\Ø~Y%\0 ¿°Ýœf·£T\0r’fµ›R;M%\0 ¿™\í\Æ¶g¨\0\ä¤X,¾™w¬J\0@NÒ¬öB¡0^%\0 \'iVûzj\ç«\0\ä¶R› \0_Ø®Om’J\0@NŠ\Å\âºr¹<E%\0 ¿™\í\Ú¸\ÓT\0ò\Û5©]ª\0_Ø®N\ír•\0€œ‹\ÅW\Ê\åò•*\09)•J/\n…o¨\0ä¤µµuUš\Ý^­\0_Ø¾\Ú•\0€œ¤Y\íó\årùZ•\0€œ”J¥\çR\à\ÎT	\0\È/lW\n…\ï©\0ä¤µµõ\Ù\Ôf«\0\ä¶O§v£J\0@NŠ\Å\âòR©4G%\0 ¿°}¢\\.ÿ—J\0@NZ[[O{‹J\0@~a»4µÿQ	\0\È/lI\ív•\0€œ‹Å‡K¥\ÒOT\0r’‚öÁB¡ðS•\0€œ´¶¶.N\í\ç*\0ù…\í¢\Ô\îT	\0\È/l¦v·J\0@NJ¥Ò‚b±x¯J\0@~3\Û_¦6_%\0 ¿°½;–’U\0ò\Û;c\')•\0€œ‹\ÅyqøJ\0@NJ¥\Ò\ÏR\à> \0_\Øþ$NÙ¨\0“¸A\\Œ@%\0 \'…B\áGivû˜J\0@NR\Ð\Þ\ZW	\0\ÈI¹\\þ¯b±ø„J\0@NÒ¬ö\æ¶\ËU\0òÛ›R{J%\0 ¿°Ú³*\09)\n\ß+•J+T\0r’‚ö»ifûœJ\0@NŠ\Å\âu)l­\0“´3R{A%\0 ¿™\í\Õ)lW©\0\ä¤T*]•\Âö%•\0€üf¶\ÓSØ¾¬\0“´—§¶Z%\0 ¿°½4µ5*\09)—\Ë‹Åµ*\0ù\Íl§¦öšJ\0@~a;)µõ*\09)\n•J¥\r*\0ù…\í…ifûºJ\0@~a;>\Íl\ßP	\0\ÈIšÕŽ-‹oª\0\ä¶g¦ö–J\0@N\n…\Â\é¥Ri£J\0@NŠ\Å\â¨4³Ý¬\0“4«ýr\n\Û-*\09IA;B\Ø@¾a[N\ím•\0€œ‹Å–¶[U\0rR.—‡¦°Ý¦\0_Øž˜f·\ÛU\0r’fµ_LM\Ø@^Ò¬öó)lw¨\0\ädØ°aŸ+•J;U\0r’‚ö\Ò\ÌV\Ø@^†þ™b±øŽJ\0@NÒ¬öÓ©\íR	\0\ÈIKKË§„-\0\ä¨\\.—\Âv·J\0@ƒ\ÄÙ¢R\Ëö\Ó^V)\08D¥R\é²ý…m¡Pø’J@~³\ÛU*\0\ÝT,§w¶mmmE€\Æ\Ìn7w¶kU\0\Z¶“:†m©T:Ce\0 ±»±.l_W\0h°4“W7«§\"\0\ã\ìV%\0 ¿° lè·²,;üù\çŸyñ\â\Å\Ù=÷Ü“\Ýu\×]\Ú!´»\ï¾;ûÕ¯~µ\'µkõ*}\\\Þ%¡…f\ëÖ­\Ëv\ìØ¡u£­_¿>›?þž4(M×³ôq}\Ø+\Þ\í„\Z;¥YÀ=K\×Ç½bY\Í\0\Ò\ØKnz–>®{Å‹\Æ\àa \Ò\Ç5}úÀ@´\å­5\Ùóß-¿ûk•\Ç}‘>®\rˆ6¿¹:{òŽ\É\Ù\ã?»\à]-\î‹\Ç>\"}\\º9½¼ü\'\ï„j\í•\ås\r>\"}\\º;=ý\Ëÿ\èr Š\Ç>\"}\\º9=y\×\Ô.¢x\Ì\àc \Ò\ÇõqÀ@d \Ò\Çõq}úö@{fv5\Åc‘>®\ÝˆV.š\Ñ\å@|Dú¸>ts z}õ²\ì\É;§¼wy-\Ý|Dú¸>ts ŠöÂ’\ß3\Å}‘>®ˆ¶o\ÏV\Þ\í{—\×\Ò}ñ˜Á\Ç@¤\ë\ã@7¢8{ÎŠE\ß\îr{V<\æ;\"}\\e J\ï\æ×¬¼7{b\Þ\Ä.¡Z‹¯‰¯50\é\ãú8p€\Ñþ\Þ\é›ˆôq}\\Ï‚nDòN_3\0‘H\×ÇýD‡:Õš\È@¤\ë\ãÀ~\"\Í@¤kú8ˆD\è\ãú8ˆD]kmm‘Ú«zŸ>.lÁ@¤5x ª†\ì\ÚÔ²hzŸ>.lÁ@¤5h \ê²\ÂV¶` \Ò\Z4‹\ÅQ±\\\Ü1d…­>\ÞY\ÛÞN˜!lA\Øö‰¨³™¬°\ÕÇ»j+V¬\È\Ú\Ú\ÚúM\à\n[\è\ÃÑ­·Þšu\ÔQ\Ùoý\Öo\Åµ\Ëûòlñ;òþ=Õ°\ÕúP\ë\ë\á5kÖ¬¬T*e«V­ê‘¾\ÛÝŸ%l¡Aa»hÑ¢\ì¸\ãŽ\Ë~\çw~\'û\Ý\ßý\Ýì“Ÿüd·_¬ù\ÈG*\ßó\Â/\ìó¾\ÚÏŽöÛ¿ý\Û\Ù_ÿõ_g÷\ÜsO¿\nÛ¨m¡P¸0\rô›\Ílû\ÏÊ¥K—f\år9ûý\ßÿýJß‹\Ûù—iH¿\è\ê5µeË–\ì\ÔSO­ô‰k®¹¦W\Âö`¶°…\rDÿø\Ç+/¾eË–e\ë×¯\ÏÆŽ\Û\í~gß³¿û.\\XùøcûX\ÞAjRj…m\ß\Û%K–T\Âõ\ÏÿüÏ³G}´r\ß3\Ï<“µ··7¤_tõšºýö\Û÷ö‰‘#Gfk×®\íñ7Š\Âzi Šwõñ\â‹Á¦«f}\ëøX|¼‹¯ýüÎ¾§«Ÿ\Ó\ÙÏŒ\Ù@\íóŒbPú½\ßû½\Êýÿü\Ïÿ\\™¿þú\ë•ûŽ9\æ˜wý½ñy\Ì$b€\ëø³»úYµ\Çÿøÿ8û£?ú£\Ê\ÇÓ§O¯|o\Ü\Æ\çø‡˜}ø\Ã>\à¨:\Ó\Ý(lûf\Ø<¸òü\Þyç‡<#ü\áXycX\Û,RÿXW¯©ñ\ãÇ¿\ëM\Ø×¿þõ}þ®Z;ö\Øc\ßõ³:>^›=\Ç\êQü\î#<2»ù\æ›\ßó³÷õz¶ó@¡S\Íü\ÇÌ¦L™R	«}\'Ûž\âñ£>º[3\ÛT>þ\â¿¸÷ñ˜i\Ä}±,÷\ÔSOU>þô§?]ylÜ¸q•\Ïñ‹_T>3>û;û}ûúY\ÑN<ñ\Ä\Ê}›7o\Î>ñ‰OT>ŽÛ7V>þ·û·C9©E\Ìt7\ë}}+l\ã\ÍV<§Û¶m\Ûg\ØFv\Õ\ã\rX¼q‹Yò¼¦z\è¡N71\Üw\ß}]†\ím·Ý–ýø\Ç?®||\Â	\'¼\çñ\Ôx\ÃXû|ö\ì\Ù{?7–‘¡\rD1\ã»è¢‹öL´\ã?~Ÿ/Î¹s\çV¾¾ö~\Óþî«µ˜)üú×¿~Ï X\ßj¿g\åÊ••k\Û\Ù\â6>û;û}ûúYÑ¢q\ß\äÉ“+·§Ÿ~z\åvÚ´i•\Ûx\Ü@\Ô\\a[¿\ÊÒ±?\Å\ì1>\Ë\Äñn_¯©!C†t\Z¶cÆŒ\É;\ì°N1þ¾hµ\ÙkgwöyýNˆ\Âú\à@\ï\Òk\ï\È÷õ\âŒ%Õ¸\ï\É\'Ÿ\Ü;\ì\ï½¿û\Î?ÿü\Ê\Ç1\è8(\Æì²³¿÷¤“NÚ»·ñyW¿o?+–\ãñø\ßj³ôHkÿk\ìMm \ZX\Ë\Èûúúú\×Ag}<fª±\ÚQ{\Ã\Ûi»zM½ÿý\ïÏ†\Ú\å\ÔñqHa{ Ÿ[\è#Q‹/®|;‹Ô–O;†Tý\Î±„÷\Å,4–®\Z¶±|³…ø¼¶Grm\éwÂ„	þíµ¥\ç\Ú÷\ÅqW¿o?+fÄµ\ïù÷ÿ÷\Ê}—_~ù\Þû\êg\Ü¢þ¶\Ñ\Ïc©x3U[Žm¢±M¿~~<\ï\Ñ/n¼ñ\Æ.Cª¶¥¶l\Û\Ùk\ê/ÿò/÷y¸Ò°a\Ã*KÒ-#\Ç*RW\ËÈ‡¶½ž…-ôÀ@\Û*c ˆw\èñBŒ%\ä8,¢öx\ì$\ïª\ë_´±­¨pƒö±ó\ÔÁ\î¡!W¿Œ;Bq\Æ•—u±SG.÷ý\Ý\ßý\Ý>öü¬ø?£µ(¶]\Ç\çõ³\nQÿ\Ûh±§ðð\á\Ã+¡Ë®q[hñ&²c_é¬\Ç÷ÆŽy±mµ«\×TKK\Ë{¶X,V––\ãw~ö³Ÿ}\×^øg¼ù\íl©C	\Û\Î^\Ï\Âzi \Ò,±\é\ãio¾ùfe\æñ\Ç¯f¼‘‹c\ß\0}DšHÏ©½øâ‹•Ã€ôq0i\"}<§¶aÃ†\ì”SN\Ñ\ÇÁ@¤ˆôñ<Zœ²ñ–[n©œyÓ¦Mú8ˆ4‘>\Þ\Èö\àƒfgŸ}ve\'¥Õ«W\ë\ã` \ÒDúx£\ÚK/½”]z\é¥Ù¹çž»÷\\\Ìú8ˆ4‘>Þ€\Ë\Äs\æÌ©\\\é\'\rÚºu«>\"\Í@¤7ª\ÅU¬\â¸î«¯¾:[·n>\"\Í@¤7ª=ÿüó•ói_x\á…\ÙO<¡ƒH3\é\ãjo½õVv\Ã\r7T–ŒþóŸ\ïó\"ú8ˆ4‘>~mûö\í•syŸv\Úi\Ùu\×]W9†V‘f \Ò\Ç\ÔV¬XQ9\í\âW¿ú\Õ÷\\(^‘f \ÒÇ»\Ñ\â¢\ßù\Îw*³\Ùø1»\Õ\Çak \Ò\Ç´d<oÞ¼\Êv\ÙY³fU.2 \Â\Ö@¤7¨-_¾<û\ÊW¾’M:µ\Ók\ë\ã@E\í‚ìšH?ð\×4ž1cF6fÌ˜Ê¥òôq`Ÿ.\\¸»?\\\ß\×\Ú+¯¼²*\rD;ô¬\Ù\Ç\ãlOs\ç\Î\ÍF\Ýx\ã\ÙÆõq`ÿ\î½÷\ÞK\çÏŸ¿\çµ\×^–\r„\î¾û\îwR›®g\r¼>¾t\é\Ò\ì¼ó\Î\Ë.¹\ä’Êµgõqà ¤Î´ôNuK,\rõ\Õ—\ë\Ë_µ\í0\r¼>~û\í·g\'N\ÌF\ZU\ÙªôC}8x---\ïommµˆž\îwLý\îŽ\Ôv§6?}þ!Uú \'l\é1©¿MNmgjk\n…\Âñ*4C\Ø~H\Ø\Ò\"X#`SÛ‘\Ú$š\ÆÐ¡C?’¾=*Ažo\èJ¥Ò‚X2.‹ób5EU€¦r\Ê)§@aK.RÀ^ž\Ú;©­J!û)šR{{ûÿ¶\ä0›ýBš\ÍnH!»-ÝŽS ©µµµ\Ë{*A#¤`=2µS\Û](~4xð\à\ÃUhz\årù8aK#¤~4#µ]©­Œ7q*ð¿\ä§c€T	ºÑ‡†¥öV±X|;µQ*\ÐA©TúûØE%8X±s]\ê;WOLq\ÓÔ©SS€N\n…\Ï\Æ	T‚ƒð¾\Ôgf\Çv\Ùtûdš\Íþ™’\0\ìC\Z(?\'P	ð\Í\ÙÉ©¿lIA»)µ’Š\0€4p~1µ\í*Á~Þ”“\Ú3±}?\ÝÎŒÙ­ª\0 r¹<4Ž…T	:ªH\ázK,§¶d\äÈ‘U€ƒ\Ô\ÖÖ–\Æ\Ò\âV• £ô&\ì\ÌÔ¶¦öF¡P¢\"\0‡(\ÍV†\Ç!*AM{ú\Å±—z\n\Ùo¨@÷\ÃöË±Ã‹J0zô\è¤¾0·z(Ï¢!C†|XU\0\Z \rª§¦™\í&•hú~0¡z\é»×†\rö9h\ì \Û\å\ÞR‰\æ4|øðÏ¤\çuk\ÞtMS€\ÄYR{S%šK{{û)`\ï‰+>¥Û»O8\á„?P€üf¶\ç§öºJ4r¹|qu&ûJj«\"\09+\n\ÅuGUb\à‹m±)\\\×\ÅIL\Òó~¡Š\0ô\Ü\Ìvrj\ëTb\à\Z1bÄŸ¤\çøþ\Ø\Ë8½±úI\ìu¬*\0=(–\Ólg­JL)\\¯ªžbñù8~VE\0zg0¾,\rÆ¯ªÄ€{ubznßˆ3@¥\Û3T w\å+cG•\â\Ü\Å)`©ž˜\â‡qncU\èý™m,3¾¤ý\Þû\âj<Õ}:®Ò£$\0}D\Z˜¿Ú‹*Ñ¯\ß0…M\éyÜœ\Ú\èc\Ò\èº4@ÿZ%ú\ås÷g©-¯^þ\îúA®1\Ðgg¶³R[©ý\ÇÔ©SK\á:\'–ŒS\Ø.=\å”SŽV€¾¶³S{V%ú\Íóujjo\Çù¬\Ë\åòP\èƒ÷M©=¥}[šÁ~\"=O\Ï\Å1³±]E\0ú\× þƒ4x?©}\Ó\àÁƒ/•J·\Åv\Ùô\\=nT€~&\rÞ·\Æv?•\è{\n…\Âøô\ÜlsW·´´|AE\0úo\ØÞ–ôGU¢\ïhkkû›\Ö\Ö\ÖU©½“\Ú\å*\Ðÿ\Ãö\')lV‰Þ—f¯L\ázGõ\Äó\Ó\çR€¶?‹m*Ñ»ªW_Ú™ÚšB¡p¼Š\0¬A>fR÷«D\ïˆ`€MmGj“T``†\í=©ýJ%zV,—J¥\ÕSÌ‹%dU¸a;?µ_ªD\Öüò\ê\ÎO«R\È~JE\0þÀ¿0µ»U¢Gf³_ˆ\ÃxR½·¥\Ûq*\Ð<a{l·U‰üÄ‰(R{0NLQ(~\'ªP€&R=+\Ñ\ÏT\"·733ª§X\\\Ù\Ö\Öv¬Š\04\ç¬kIšmýX%\Z²\Ã\âb\é\Í\ÌÛ©R€\æ\Û\ÇbiS%\Z#.w—Böñ\ê‰)nŠ\Ë\á©\n€\Ø\ãi\æu‹Jt\Ûû\âr…±]6.\ìvW\0jaÁð•8t…B\á\äT\Ç-)h7¥VR\0:†\íS±Ü©/½I9&µgb¨t;3f·ª@gaûlšŒ]¯®¥¥\åý±ôKÆ±ƒ\ÙÈ‘#?ª*\0\ì+lŸKñ]•8\àz™\Ú\Ö\Ô\Þ(\nCT€ýJ3´\ç\Ë\åòµ*±o©FÇ¥7%/\ÄiS\È~CE\08˜™Ú‹©}[%:7zô\è¤úÌ­Ê³hÈ!V\06l_J3¶«T¢\Ó\ÚL¨^ú\îµaÃ†}NE\08\Ô@Y],¯P‰ÿ5|øð\ÏD]\âb\î©6\ÓT€\î†m\\¸üR•4¨½½ýˆ¸¾o\n\Ø=q%¤N8\áT€F„\íZ³·\ÊPWg²¯¤ö·z\0\Ûu©Mn\Öÿ?¶Å¦p\Zl/\n\ê\04\\\\\Ì<…\ÌE\Íö1\âOª\×òSü$ö:\Ö\0\ÈkfûF\n›óš\ì\r\ÆU\ÕS,\Æ1\Æ\Ç\é\0\ä*Î›)x\Æ6\Ãÿš‚õ\Ä´o\Ä \Ò\íž}\0zjf»q Oœ»8ýŸTOLñ\Ã8·±g€žœ\ÙnJt\ê\0ý÷\ÞWã©†\ì\Óq•\Ï8\0½1³\ë°~y ý_¥ßˆ7›S\á™ 7\Ãö\í\Ô\Êh¦þg©-¯^þ..\è\Z³\0ôz\ØnM\á\Ô\Ò\ßÿ©S§–\ÂuN,§ÿg\é)§œr´g€¾¶\Û\n…Â—úùÿpju†þV¹\\\êY ¯\ÕöÔ¾\Øÿö4ƒýDúÛŸ‹cf]&€¾¶;Rh}¾?ýÍƒ>¼T*\Ý\Ûe\Ó\ßþ@º=\Ò3	@_Û)¬þ¡¿ü½…Ba|\n\Ø\íqšÉ–––/x\èkÁº*µ¬“Ë°\ïT\ÛÆ¸\Ô\\_û\Û\Û\Ú\Úþ¦ú÷\Ç\ßx¹g€>©\\.ÿka»·¥Y\ã-}\éoN³\×¦¿\ëŽ\ê‰)\æ§\Ï?\ä™ ¯\ÏnWv´±\r´/\Íj\ã\Ò±\Ì¸/\n\Ç{ö\0\è÷³Û¾2«`€·R›\äY ß‰K\Ëu¶Ý¶·gµ±Dœf\×ª\'¦˜KÈž-\0ú¥8‰E\'a;«7ÿ¦\Øé©ºóÓª²Ÿò,\Ð\ï¥P{µnùø\í8vµ—f³_ˆ\Ãx\âLV\évœg€#ì¨º£.\é\é\ß\'¢H\íÁ\Ø)+Í´\Ô[a\0y\Ïn\×F\Ø2\ä\Ã=ü{gT\í]\Ù\Ö\Öv¬g€¶#†š\Åsz\è÷\r‹‹Ä²uÌ¬=\04ƒS\ËR›–\ç/‰\ËÝ¥}¼zbŠ›z*\Ü /\íž\Ô­\Þ\æ¸\ïK\á:;¶Ë¦\Û\'\ã\Â\î\Ê@³m-`\'5:p…\Â\É)`·¤ Ý”ZI\Éh\æ \Ý\ßý%\Í^I\í™\Ø*\ÝÎŒÙ­’ h\ßûøAŸ\"±¥¥\åýqº\ÇX2Nm\ÉÈ‘#?ª\Ü\0\Ú\Îô’ršÅž™\Ú\Ö\Ô\Þ(\nC”\Z\0A»¸»÷7\Ã-—\ËÇ¥Y\ìqš\Å²\ßPf\0\íÁ\ß\îÎ¾oô\è\ÑH;·z(Ï¢ž>)\0„ \íøý{g¸)\\\'T/}÷Ú°a\Ã>§\Ä\0\Úÿ\r\Ú\Ø+ø»ƒö¿wpÇ¯«l\Ã=ê¨£®O»:.\æ^,§)/\0‚ö½Aû\ì ßœ-\ê\Ù}n§_÷|`\ê‰\'ž˜ý\Ó?ýÓ¯O8\á„?P^\0\í{—Ž¿[\r\Ðl[´µ6³ö`\î ü\Î4\0ý:h»\n\ÒúÀ\Ý\ß\ã5\r?\Ó\0„ \Ý_\àv€A[ÿ{v\\\0\íîŽƒÚŽ;I\é´¸´5–”h\nGWCrùA~\ßa\ÌhwT\ï?óª\ß{´§€f˜\Ù\è’n£g¶—y\n\0h¦À\í©m¶µs\'[B@\à\î\'huo\äCº\0”À\íl/\áFg;b½`\ï¶\Ôú@\ìö¤\êf´Ó•\0\Z|ndA\0ûž\á\Ö\î\ÌAvÕŸú¯s<-\0\ìg†Ûm¬‚\0r\Ì\î^x\0šn†{0Á)h\àg¸²¤<b¡\0 ·nm¯ €·³\ãs€nî¤º uf(\0h°\ÚLvþ W\ï€üf¸­­­™ €U\Ã\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°€ƒum„\ë~\Ú•€C\Ûû\Ûb±8M¥\0 {»~a»yð\àÁ‡«\0\ä4»-•J—©\04&p;\Ûv»Å¬\0rœ\Ý\ÚV\0\ÜW\Íj Gi&;ª.l\'©\0\ä3»­l»5«€ˆ@lj«‡ÿ\ì\è°\ÝvWj¯§¶¸\\._\Û\Þ\Þ~„ªÀ8é¤“>™t~\nÐpö¨úÃ€v‹\Å\å\éö\ïU\0º˜É¦°œ—B6;˜\í¢-6\Ó€:Ã†\rû\\š‘n\ëšgœqF6s\æ\Ì\ì\ÈV¯^mÛ¶-q»nÝº\ì‘GÉ¾ÿý\ïg\ãÆ\ë\ì4Ž[…Â—T€¦{·µµ\í®\Ê.¸ ¤»v\í\Ê\ÔÒ¥K³‰\'v\Ý=Ž\Ç éƒ¶~\Ù8…n6w\îÜƒ\nÙŽ\æÍ›—µ··;\0\Ä\Òq\n\Ú=õK\Æ+V¬\È\Z\á\Å_\Ì\Î>û\ìw\Íp-)\ÐTbg¨úm´´±\r¶‘\â\ç\ÕnlÃµ\Ó\0M#ö:®_:nÔŒ¶³n‡%\å‡T€/Ž£­\ßN\Ûhó\Ûp\ë·\ß\Æòµg€-NXQ¿\×ñÎ;³¼M˜0¡~9y¹g€+¶\ÕÖŸ*\ï\é	Ë–-{×™¦R;Ò³À€‡\à\Ô\ïÕC|Vý‰/\â\\Êž\r\0¤\êE*7kÖ¬¬\'Í™3\ç]§sôl\00P\Ãv}-ð\âŒ=)–¬ë–’\ßôl\00 ¥Û»½vÍš5=\Z¶q\Ümý\åù<\0Ô™\í\ÞÀ«]T §\Ä\ï«ÿýž\r\0|\Øöa€™­™-\0tm¶\0ÿ\Ì\Ö\Þ\È\0s\Ø:\Î\0ò”f”—õ\Ö¤\Î9\çg`\à‹s#\ÇöR\çF€\Å5e\ë¯ú\Ó³Û‰\'º\ê\0\Í#®g›Bo\ë\Ù@¾³Û½;Jµµµe+V¬\È%h_|ñ\Å\ì\ä“O®Û‡T€¦\Ð\Þ\Þ~D±X\ÜZ¿³T\Û\è\ãj\Ï:\ë¬ú\å\ã­ñ{U€¦Q(¾T¿œÛ¨n\Ìh\ëƒ6~Oü>U ÷\ÂúÀ%\åØ†Û¦bm‡¥\ã˜\ÕNSm\0n]8\Æ^\ÊK—.=\è\Ã{&Ožü®Ÿ+h\à7û¥úm¸õK\Ëq¦©‡~¸r.\å\Ú\Å\â6¶\ÉF Ç™¡\êOXQ¿\Ö\Ò1\0Ô‰—\ê÷R\îf{\È\ÎP\0Ð…87\ÍJ­?\ÓÔ´83Tœ°¢\\.ÿ«*ÀˆS;VÏ¥³\Ýõõ—\ç«;\í\â›qQ8×±S0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ð\×ü1tšs‚‰\0\0\0\0IEND®B`‚',1),('7',1,'/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\ë\0\0\0tô«\Å\0\0B\âIDATx\Ú\í\rpT\å¹øS>Tj¯W[®\ãtoo§\ÃuÔŽC?”¦v¨¥EIr–\ÝMb*•BE½P ~\à­^¥\"#¶ŠŽýú+­©\ÊGˆ\\ˆ\" ‘¯‘oB’=ÿ\çYÏ¦\Ëf7\ÙÍž\Ý=\ç\ì\ï7ó\Ì\îžs’lžsö·\Ï{\Îyß· \0\0À«L|ª\Úü\Õ\Ü\á\Ð\ç±ñÿ\Ö|v*¼\Ý\ÓÕ¦ðªÄ¸‰s\ß6;\Â\ÚNxK·›ôÌŠ<Ÿ\ï\ïm\0\È\n‡Z\Í\æ\'+··ŠŒn•¨Q\Ýó\ìÿ…&?·JõŽ\Ä\êv¾Z\ß6in.{\ëžyµ!]8TŒòZ–o\Ð\í\Z[\Ì=þ\í£Ó‘\í\"þ½Q\Û\0dœÿôA[¸ú²d5ñ\éšH%öŸ\Ñ\Ûý\æ\å÷e»·ÿµÝ¿*¶™\Ñ\Û\É\ë)[5f¿¾\ë”UñmW\Í\0Ø†\nGš ZE}p–\Ô$&/XŠ4\'þ¾&4\éy\í›‘\Ù\ÓQamõû´Éº~òüºv]¾\æ`¨qñ\'gš\É8\0d‘\Ï@­¾&‰œ\"\ÂR=ðÊ†v]6ñ÷+Lk»[&>ý¶Š\í–\è\í¤iª\Ëvku\×ñûž/¨•^Dx“\çÕµ\Ó€¬ððk;N[\Í\È{£+6½\0©\Ü\"\ÛZ\Ûý\Ç\Ù\Í\Õ/„¨\âŠ\Þ.ò|Î’½\'\ÃË¾\Ýq\0\Ètµö•\í\Ï4[Ò©\Ó+œ\Ón>c	¬\îž_\Û>û¯´ý«WluS¼\Û&†¨R{fUû\'\Ç\Íý\Övÿ©Þ¬×ž4Í“¸\"\n\0Y\ÛOUJZuýÏ‹[U\\O½±£õH\Èüd\æŸ?lÑ¦¦ló´Ä¯;ª³ß¯ýú\Å÷\Ú½pýWE\ç®Mú}XŒ£\ß\ïW6?mš;¼ÿùQ\æ¯_®?c]8xš\Ì@&Å¶V\Ìõ‘<þ@E>w¦÷²EÝ£&Ì¯\Û}\æø5ûZ\äù/\ïyvE(\Þ\ÅaK\ì\ïû•H0|e5\æ÷‘y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0°\Ó4/\\²d\É\ß\çÎ{|Îœ9¡{\î¹Ç¬¨¨0G\Ze–••™“&M2§OŸ~fÖ¬Yû&L˜ð+2\0ŽeÿþýÁ—^z\é\è/ùKsüøñ\æÿøGów\Þ18`ž:uJx5Ïœ9c666šk×®5_~ùeóŽ;\î0\ïº\ë®\Ðý÷ß¿\Ò\ï÷÷\'‹\0\à”\n­uuõ¡»\ï¾Û”\n\ÍÜ´iSX`\ÉR__oJugŽ3Æ”\ên€œWiÿû¿ÿš8q¢¹a\Ã3¶m\ÛfJ\Ó\Ôü\Å/~qPš®’]\0\È:ÇŽ›0}útó©§ž2=jÚ6Yõ÷\ÝyçŸ\Ó4€¬Wj*µ\Ç{\Ìlkk3\ífÞ¼yZ¹}VXXx\Ù€Œ£\çÔ´ù©•U&¤\á\É\'Ÿ4KKKw“q\0\È8z¡@Ï©\Ù\Õü\ìªYz\Çw„¤I:‘¬@F› zõS¯|f½ \Û9\ß\0C\ïS\Ó[:²Éƒ>xfÔ¨Q•d\0lG{\èÍ·Ùª\Ö\"lÝºÕ”Š­•	\0`;Ë–-û§ö(\È\äƒDTTT´û|¾1\ì\0°\íû©Ý¤rÁO<qRš£µ\ì\0°\íÐ®}?sÁ\êÕ«\ÛDl{\Ø\0`+:J‡vh\Ï‡\n‰\ØZ\Ø\0`+:\äPd”Žl£\êu\Ø#ö\0ØŠŠ%— 6\0°[o½5—[±€\íü\êW¿\Ê\Ù9¶\Æ\Æ\Æ3œc\0Û™1cFK®®Š.Y²¤‘«¢\0`;<ðÀ\î\\\Ý\Ç6}úô\îc\0Û™0a\Â\ÏuŽ‚\\ô<\Ð.Uô<\0€LÉ­=\Û}E\ë\ê\ê´J_Q\0\ÈÓ¦M{ûñ\ÇÏª\ØÆŽ\ÛÀ\è\01t’•\Ûo¿=¤3Keƒw\ß}÷VkŒ\Ç\0å®»îš®ƒMfzÝ“\'O¶3Œ \0Y\áŽ;\î8ð\ÄOdòBBHþF£\Ï\ç\ÛI¶ +\è‰|©\Ü\éD\Ç›\Îÿ©Þ·\Æü¢\0u¹;¶ñ·¿ý­y\â\Ä	ÛšŸw\Þy§^,\Ø\Ãy5\0È™\Ü\Ê\Ê\ÊvŽ7.´q\ãÆ´/\è95m~R©@\Î\Ñü¥¥¥m3f\ÌhUÁ¥\Ò<]·n]“ž³³®~r¡\0\0œƒVYRmýU«®òòòÐœ9sN®X±¢­¡¡¡]\ÇS‹ŒÒ¡Ú—.]zH»IišÞ§F\Ó\0ˆªL¢Jb·\ÈN\ç+0£¢EÏ¡I\Ôi7)z\0€›eg\"1\0ðœ\ØJJJ.&\0\à¤\Ù*//¿ŒL\0€§\ÄVQQñM2\0^jŠ\êl\î\É\0xIlmÁ`ð:2\0^[«aƒ\É\0xIl-\Òý1™\0\0\Ï R;F	\0ð’\ØNƒA™\0\0/5EkW+2\0^ªØŽŠ\Øn\'\0à¥Š\ís‘\Û\Ýd\0¼$¶f‰\Éd\0¼$¶&‰id\0<ƒ4CÀd\0¼T±\í“x„L\0€—\Äö©\ß\ï‚L\0€g©\í’\æ\è3d\0¼T±m—X@&\0ÀKb\Û*±L\0€—Ä¶9ü™L\0€—Ä¶A\âU2\0žÁ\çó­õûý¯“	\0ðRÅ¦$/&\0\à%±­”XN&\0ÀKb[®r#\0\à%±-\Ñ\æ(™\0\0/‰­Rb\r™\0\0\Ï`\Æk~¿ÿ}2\0žAo\Îõù|	\0ðRSt¡v«\"\0\à%±-ÐŽðd\0¼\Ô\'MÑd\0<ƒ\ß\ïR*¶\Ýd\0<ƒTk\éð\àd\0¼\Ô}@\'t!\0\àt\ê=‚L\0€—\Ä6Y\'M&\0\à%±M¦\èa2\0žÁ\ï÷“8J&\0À3†q«Tm\Ç-\Éõ—¸¾¨¨\è*2\0n©\ÎúK³ó¤ˆ¬U¢]\ÂL5d\0\\ƒH«¶¡i„F}9™\0WUm]UkŒ\Í\0®”Û¢Db“¦\ê\02\0®¬\Ú\âc©­\';\0\àZtTX±ƒA™\0Wc]!ˆm\0/4I\'FÄ¦\Ï\É\0x¥j;ªb#\0\à¬\Ñ=\0$‡iš\ç\íÜ¹sO]]¹|ùrsÙ²eD¢ªª\Ê\\¹reHbG@ŽQ©\Õ\ÖÖšfKK‘F455™555!‘\ÜŽ,€¢•\ZR³WnRÁµpd\äm~\"${C›¦Y\09D?„\È±\ä¥ØŽ~ÀÜ¹öf}\ÕoÂ¡\Ïu\"Cl\0®Û±\Ãû\Ì\ÍK¦›ß¸÷¬\Ðeº™!6\0×‰mOýë¤‰½õ•\È±¸Ol[\ß~4¡\Øt2Cl\0®\Û\æe3ŠM\×!3\Ä€\Ø\0\äZlz4‘\Øt2Cl\0®\ÛöUsŠM\×!3\Ä\à:±5\ï\Ûdn^:£s3T–\é:d†\Ø\0\\\'6]\ëv›.Cdˆ\rÀb;}\ÚÜ¾z^\çf¨,\Óu\È±¸JlÚ³\à£UO\'<Ç¦\ë\è}€\Ø\0\Ü!6©\Äl¯6?X|B©EB·\Ñm©\Þ€c\Å\Ö]•Fõ†\Ø\0\\\'¶dª´®ª7Ä†\Ø\0\'¶žJ-ˆ\r±8ó\Ø\0\Ø\0b\0Ä†\Ø\0\0±!6\0\ÄF 6\0\ÄF 6\0Ä†\Ø\0Àb“_\ÑeDos\Ã\r7œõ³ú:z»\Ø\ß×·o_ó\Úk¯5\Ý6[=bðP\Å+©x²Ú°aCx\Ùúõ\ë;	0öw\Ô\ÖÖ†Ÿ_q\Åˆ\r\0œ)¶\ïÿû\æ˜1c\Â\ËÆ~Ý•\Ø\"¯\Ï=÷ÜŽ\×\r\r\rfyy¹yþùç‡—2\ÄÜµk—\Ù\Ü\Ü^6`À€³þ¶¾\î×¯Ÿ\Ù\ÔÔ„\Ø\0›ýb«¬¬7/7m\Ú~\Ô\×]‰mÅŠ\á\çÃ†\r\ëX_QQ^¶j\Õ*sË–-\á\çƒ\r\n¯›8qbøõ[o½~½t\é\Òðk]N\Å€\Ø2\"6}>p\àÀp¥‰*´\è\Ðf\èŽ;:\Ök•»M\ïÞ½¿˜tfûöðó›nº)üZõµ.Gl\0ˆ-cb[°`Aø¹>v%6}>yò\äðóo¼±“ØŽ9÷=…\×Gª5}\Í96\0Ä–Q±u·.úõ±c\Ç\Ìþýû‡_G®ŒFš¢S§Nûû\"\Í\×\È\Ïi“5™¿\Õ\ÝûDl\0ˆ\Í±i<ô\ÐC\á×ƒþb*À\æfsüøñ\æE]÷ªª†\Þ\"¢Ë¾û\Ý\ï¦ô·\0b#\0bCl\0\ÐcF\Z\Õ\àóù¶ùýþEG}9bCl\0n\ÛF	3:Dp\íòxJb·Ho±Ä¬`0x\Ý\âÅ‹‘bp>†aL‰[‚8£WOœ8€³Y](\Òj\ïFj\'À\ão¾ù&2Bl\0®iŽ\îK$5i–þ‰slˆ\rÀƒÁoI3ôy‘\×~‰P©½ý3ˆ\r±8iNŽ°.•P™}*\Ï\È\ã-q¤6;ö\çb\È9………ç‰ \îy­×“ÿò\Ø*±A/Œ;ö\Ë1\Í\Ñ\ã©\éU\Ðx¿±!6€œ ÷¡‰œž–ø\ÄjbQ-“\Ç\â®~Îª\äBcmƒ\Ø@Öª\ìzƒ­\È\ë3KN\rz~¬¨¨\èªdGqqñ\ä\çËº\Ú±!6€Œ1s\æ\Ì>\"¡\Û%V‹\ÄN\ë\rµ\Ú{ <PRRrq¦þ.bCl\0¶RVVö5=¡/2ûÐº\ïL{üŸ,û¹¬î•÷€\Ø@Úˆ¸®q½,­«˜\Íòúo\×\ç\âý 6\Ä\Ð#‚Á 8\ÌWmô‰\ÄvI<Q^^~Y®ß›Û¦¶Cl\09¢¤¤\ä+@\à~‘\Ø\"³6‘\Ø‰uò|‚¬;\ÇIïµ¶¶¶½±±!\Ù{÷\î\Ý-bk\áS\0ž ¢¢\â›\"²ù{õ–\Ù‰7Dp?uòû®®®~¸¦¦&tð\àA\ÄdƒÔªªªZ%\æð‰\07Wf?1\ãŸ\"²#\ÖýeûDfÏ‰\Ü¸\éÿ\â,©2ŽkÊ©¡7;ùýYÑ‚\ÔÀ\";G¤u·\ÄZù µh3Sb³Ä´¡C‡^@†2×´W±‘	\0›\ÐüR•ýNd¶ÓºQö„|\ÈÞ–\Ê\ÌOv²\ÃÈ‘#/ÕŠ˜L\0¤Aii\é÷D`•\Ó!Kfòü©¾Mv²uþ±¤H/©\Êny\ÕZ7\É\êÍ²\Û%Ñ›hIOn	W\ë>!\0Ý Ý”t\ÄùÀlµDvZ¢NZ˜\ã´{rzó²\ì›V2\Ù@ù€¼ qÀºQö3yþw©\Ö~Hv½\ß~¬k\È€…H\ëfùP,•8fÝ’±[bnWSÒãš¢#õ™€¼E[”Ád‰\r\Ú|Ñ\Ê\ì}];#¸¦)ZªW£\É\äeeeWhfUc!«:[¢\Õ\Z\Ùq?:œ“}N&ÀóXƒ(þ]¾\Í[£d\Ðógz\ìx®b›¨û™L€\ç\Ð+•RýB¯\\ZW0õJ\æ½²©óh’!\ï\"ûý>\Û!2^ib~M\Äõ˜\ÞS¦#\Ê\ê$¿+õž³‚,\r\Ä¹GGÖ¡\Ñ\É¸–`0x\Þ\å/\ÑhÝ’qHžÿEž‡\ì\ä­\Ø\×QS\È¸\nW@û_Jœ°š˜;\ä@ž£}\ÉDf\è\"\àht$9P§[#c´Y#e¬‘¸\Ói1‚#Ä¶@OG	pEEEWZ\è>ë–Œ\Ï%*õ®r²Ýˆ\í%½PD&À)\ä0‰7u4Yë–Œ=òø¬Ž\Ö@v Yt²\ížL@N(,,<O\ï9½§\ãü\ë]ÿr@n\Ò\Ëõ:X ‚Š\íuÜ“L@6«²¯Ë÷¤Î¼d51K,—±„\ì€M\Ç\ØHšL@¦¿Au™WuNL«‰y\Ð:r\rÙˆ­F¯š“	°›^r`\Ý&±*j F½ü\á\áÃ‡_Bz \Ãb[­U™€´QaIeö \nÌº\ë_…¶Z*´1\ÄYn!¬3\ãdz„5óB‰«‰ù™P¯I&;ÃŠm£\ÎAA& •ƒ¦X¢\Ê:\é¯2ûD¢§ô¢\0\Ù‡£[ô.™€„Xs4Nµ¾u \Æ3ò¸^ª²Iz»Š\ícˆšLÀYˆ¸¾!\Í\Ìyrp\ì±:–•\Ç\Å\"³\ád\\ ¶O´¿(™\0=\á:Dol´º.isŸˆ\ìy\í\ÚDvÀebÛ§\ÃW‘‰ülbž#\"/ñ®„v*o“ƒ¡^*µ\Ä.›^ÌšE&ò§*\ë¯cU\É\ã\ÇÖ½e\'\åù\nü¢€Á…ˆÀ\è\r\àÑ³ˆ\é˜|\Ú-\ì\ä\Ö\Ð?¦D“\È\í\Ïò8ˆ¬€Ä¶\Ø:®;…u’^ðjaúDo—\è&Y\0/¡§M¬\Â\Í.b\r™Bl\0n;®+»›6W\Ébp[st€u%?ž\Øj\Èbpë±½&\Þ96Î­¥ˆiš\ç\íÜ¹sO]]¹|ùrsÙ²eŽ\Ý\ÙN{OUUU\æÊ•+Có8ª §ŸÆŠ\Í\ï÷¿HfRD¥V[[k666š---D\Z\Ñ\Ô\Ôd\Ö\ÔÔ„Drs8² &\é\Î(±¡\Ë_\ÐJ\r©\Ù+7©\àZ8² §ÿ(Jl!#=@›Ÿ\É\ÞÐ¦)G¤y®­A\Å6r\äHÎ­õý\"#\ÄŽ[™H\Íd2 ‹\íø\çÌkÿh\ÖWý&ú\\—!2\ÄaŠ„GôÍ”ØŽ\Þgn^2\Ý\ÜøÆ½g….\Óu\È±\íRI¬·‘[&Ä¶§þõNR‹\Ä\ÞúJd†\ØÀ~©Ed6\r¹eHl[\ß~4¡\Øt2Cl©u·\Ò\Û\æe3ŠM\×!3\Ä“Z\ìúi¤\n±!6ð‚\Ô\nh–f@lz4‘\Øt2Clq©EË­\Ê\Í±m_57¡\Øt2Cl©Eÿ\\;•[šbkÞ·\ÉÜ¼tF\çf¨,\Óu\È±AÖ¤\Æ97»Ä¦±k\Ý\ÂNb\Óeˆ±A\ÚR\Óy:ž+\è~¾Ž\Ø\í8ç––\ØNŸ6·¯ž×¹*\Ët2Cl–\Ô>,ø¢—Á‡]\È-\ÑvTn=›ö,øh\Õ\Ó	Ï±\é:z 6\èqóó9KVfr‹–Z$\æ\ÛØ¬\Í#±I%v`{µùÁ\âûJ-ºnKõ†\Ø \åsjñ¤-·\î\Ö\Ð,MRl\ÝUiToˆ\rl‘Zwrë“¤Ô¢ÿWK‰-™*­«\ê\r±!6H¹™On-)H-Vn\Ó[\Ì³§R‹b\ë^l:›=Ÿy¤–„\ÜR‘\Z\Í\ÒnÏ±›\nmÔ¨Qµ\Çù\Ü{š\Ë-!Õ§øs}\âTj-\ÖòTXlý\ìåˆÈ˜\ØTh>Ÿ\ï¯\"´6k,û6>û™GG -//¿¬¨¨\èJ\Éù \ÙCÀH\Ã0n•\ç\ã\åqŠ\ì—Ysdù<\Ù\æg@Ö½.Ë–Y_Bk\äùy\Ü*±C\Ö\í‘\×\ròxH^®_R§$Z$Z%\Ú#óƒ\Êvf\n\ÍB»+¶\ÙTlD\Æ\Ä&€\Ù\í±Óªyý\Ø\ÒÙ•T\è\ßÁ|[$òC‘\ÇYV*1N\ây=C>üI>\æ\Ê\ë?\Èó?\Éó¿K,‘\×+\äõ;òø¾<\ÖË²%vK\×M²ü°<?&\ÏOÆ“JT„¬ü\ë—\ÊKB*£#\Í\Öü{¬Ù¡>”\ÇMk\åùÿIT\Éûþ§üü\ß\äùBYþ¬¼þ¼\ï\äñ>y}·¬û¹¬+–\ç?.--ýž<”\×_:t\è98\Ç6ˆ-£b“~¢õ¡‹7³wF\Å6s\æ\Ì>Ã‡¿¤¬¬\ì\nù^-\ÂÁò7‡\É{ò\Ë{\Z£\ïM^OS\é\Ê\ë§\äùyþ²l÷š<S\âm‰:‰÷$6Ëº\äñ‰}ŸÉ²£òxB\â´%Œ6\Ü7Þ„¿©\Èó\Ó\'¬ŸýLž7Z¿s—õ76[sµ¬«\Ö÷¢\ïIß›\ÄsOÊ²‡­÷®ù}:§þú¿\êÿ,\"½Xs\à’smv^\åf]Ä–9±YM³«\æƒOÈ‡s¾VZhu Ï—K¬’\×\ë´z\Ð*Bž\ï’\ç{\åùA«\Ê8iÉº°T¬ª¤SµbU1­–€T´Ç¬j§Ib¿U}¬U‘VG–\Ðj\äõb­ž´Š’÷õ¼<Z\â­²´\ÚÒªK^d\Ýpyþ­Ê´:±|MžŸCC8©«•v\Ý\ÇV\Æ\ÕPÄ–\r±%$>)hk«žÇ‘\ç\ï\Êó•Kõ<ž\ï\Ñó>²\î\Ê\ãz>H\Ï\éù!\ÉHž\ßl\ÍC9H\Ï#9òÒ±c\Ç~™#Û‘L‹SQ\Ù\Ùó€‰º[æ›¢\ÚLŠ™\Õû¬`†ï¼­\Ü2\ÑW©¹Yl‘o,7]<°*ªº\Øf¢T]\×s\æu\å-·ùÉ\î½÷«\Ù!¶‚ø—¡Ï’ÍªU«Ì«¯¾\Ú<÷\Üs\Í~ýú™W]u\ÕY¿£»õ^[©\ÞX·´#6*·4Ï‰!µLTl‰s\å•W†—oÚ´\Éljj2\'L˜\Òz/‹-BEEÅ…zb¾¨¨\è*Ž@*·‚ž ‹Ô²)¶¾}û†—oÛ¶-\î\Ïu·>ö÷&z‰o}\ë[gý®\Øõ‘ªð\ÒK/\rÿ\íþýû›¯¼ò\n}EÁ©\çÜš\Å6dÈðr•È7\ÞhÎ˜1#\\™%»^\×õ\îÝ»[±-Z´\Èü\Ç?þ~>t\è\ÐN\ëU^»v\í\êxý\Â/t¼þ\êW¿Š\ØÀi•[2\ÍÒ².\äFl\r\r\r\æ}÷\Ýg8°c›Áƒ\'½^_\ëù·\î\Äv\êÔ©pDª²x\ë\ã½Vifº)‹\Ø •[\äœRË…Ø¢cÝºu\ÕY²\ë£_G\Ä\Õ±%û\Z±\ä\ïþ7È¦\Øn¹\å³®®.ü|ýúõ\ám´:Kv½6u\Ùö\í\ÛÍ…v\Ù­¬¬L\ØM\æu¦$ˆ\ØÀ¹…%Ö§OŸ\éô(È½\ØFŒ–“V]Ú¤\Ôf\æ†\r’^¯\ç\Â.ºè¢¸·’Ä»8 RŒwñ\0±\ËÏ¹…z÷\î]c†)r{””dIlbƒŒWnfIIIH»Ê‘Ä†\ØÀ+\\n\r\\0ŒT 6\ÄžAG‰\Ñ1\ß\ÈbCl\à%±\í\ÓQ]\ÈbCl\à¬‘ƒ_!ˆ\r±—*64a9™@lˆ\r¼$¶Wu\0R2\ØxIl:ûn2\Øx^\ç¸ ˆ\r±gfh‰N\ØC&b/5E¯\Ñ—\ÉbCl\àt&û|˜\\±!6È¿ªM\'ú:™@lˆ\r¼$¶3:\Ó™@lˆ\r¼$¶c·“‰X¾|92Bl\à`|>_ƒ\ß\ïL¤@mmm{cc#B²)ö\îÝ»[\Ä\ÖÂ‘6VlJ¼@&R ººúáššš\ÐÁƒ“\rR«ªªj•`\Â\r°Slu:-™Hù Î’*\ã¸6¡ˆ´¢©\ÝH3ôu‰ud\Â[\çŽ\Æ\Þ\Ç#¯\×\è²\â\â\â‘dò\à30_Ž÷d\Â#y*0\r\Ã0n\Öe………\ç\é\Ø\Öò²y\Ð.\ÑD&<@EEÅ…²3[#b‹Œp \ß^s¢–™R¢O$[\àq±•I\'\ÞØ™•\Ñ\Óƒ\×\Éãž˜\å-*A2^E¾¼¯—/ôV2\árF}yTs³#¤iº&\Þr=\çF\ÖÀ«”••}þ¢@¾\ÖÇ‘—iõ™‹·¼\ã€G[0\æð\á\Ã/!.Eû\Ä%’WW!2<IöÀ\Ãbk---ý™p\ïl\ê‰Ø¬¨$ƒ\à\ÑV\Ì	½ˆ@&\\ˆuq Y/XWD[“™vÞ£\ÍW¿ß¿ˆ,‚‡¿ð§“	\ï|S=«7\'Š´f\Ëó§À\ïD€·\Ë\ëþòšqª _Ä¶Co\Ô%\ÞÙ¡/IlI°\î´a\Ã\Éx\íR¥]«È„wv\è\"‰÷ˆM›­S\É\äA\Ëe±v†\'Þ©Ø–H¬N°\îc‰d	ò\àsð‚_D&¼³CWJ,O°n•|“-#KŸƒ‡%	\ï\ì\Ð5‰n\ã±Õ“%ð:~¿œŽtC&¼sn\áX¢o16™,Aˆmˆ\Ä2\áú‘a\Ï\'›Žzp‚,×±úO‡È„wš¢»õþµMÑ«™%ò\è³`\ê\Êd\Â;ó@¢zfÎœ\ÙGwöØ±c¿L¦ >\íòe>\Ø\Z\ÆhŒŽMÈ]\îÝ™‡ººWMÖµ\Éþ™/!\Çô,9¶7Jì·º\r¶Ê²N\Ý	É”{\ÅvD¾¡\Æw±ž\ÉdÁsHeö\Ó\îúI\Ó7\Ú\Ýb;!;°´‹o¶½Z’“)ð\à±_\Ù\ÍP]È’{w\îi‰a]¬\ß`\Ækd\n¼†ô`\Äh•\ÚN2\än±µ\ê\É\Ò.vþ\r^E\ïH0bô²\ãn±µ\Ë\Î\ØÅŽF¶ù„L‡?\r±\rt\ZJ2\ã\î\Z\Z9r\ä¥]Tle›\Ï\Éx¸Iz}\Ì|ü\à±™]};iWÙ†®&\àõ\ÏAÇ…\î]s9z\ãmwÓŽ\é\Ì=LM^Ge&_\â\ít«ò\0\å\å\å—\éð\ß\É4We»o1ð2\Öùd\Ä\æ90™¾ ²Í©@ 0’ŒA:˜¦y\ÞÎ;÷\Ô\ÕÕ™Ë—/7—-[Fô ªªªÌ•+W†$\æqT\ÅÁ:iÚš„\0uŸid\ÒA¥V[[k666š---D\Z\Ñ\Ô\Ôd\Ö\ÔÔ„Dr\Ü<‹NÔ¢7\è&Q±}¨C\'“1H­Ôš½r“\n®…#«s\ÅVª\Å&!¶•²]5ƒt\Ð\æ\'B²7´iÊ‘\ÕYl\ãµ|Û½,\Ûm%cú!DFˆ-M\ÑûtØ¢$Î±Í’h$c\r±ÿü€¹s\í\Íúªß„CŸ\ë2D†Ø’\"Ù™y¤bó\Ëv\'\ÉdZl\Ç\ï37/™nn|\ãÞ³B—\é:d†Øº\Å\ê\0¼»»\í‚Á\à·\"²!¶=õ¯w’Z$ö\ÖW\"3Ä–\Ô9¶?\èd.Il\ÚK{:ô²™\ÛÖ·M(6]‡\Ì[2MÑ¿HÕ¶)\Ém[\r\ÃL\Ö “bÛ¼lfB±\é:d†Ø’‘Ue²c­Ie\×\å\â\0ˆ\r±9\å[µÞ£–¤?±=I\Ö “bÓ« ‰Ä¦\ëbKFVu\"·\ÅInûž4EÿA\Ö “bÛ¾jnB±\é:d†Ø’i^¾Ÿ\ì|²\í\ë*7²™[ó¾M\æ\æ¥3:7Ce™®Cfˆ-™*l‹\ÄKI6[õÖO\É\ZdRl\Z»\Ö-\ì$6]†\È[²\ç\ØvyIJðN½€@\Ö £b;}\ÚÜ¾z^\çf¨,\Óu\È±%#¶½\"¶Ç“lŠþ ™!Ž\0z*6\íYðÑª§žc\Óuô>@lÉˆ­Q\Ä6#™mõ\æ\\kˆð^dl›Tb¶W›,¾?¡\Ô\"¡\Û\è¶Toˆ­«*\ì°\ÎB•\Â9¹ö¢¢¢+\É\Ø%¶\îª4ª7Ä–2:¢\Äm)l2ú\È\Ø%¶dª´®ª7Ä†\Ø\â‰\ê”Dq*MW\Ù~&™»\Ä\ÖS©E±!¶xM\Ñ3:oh\n\"Üš\ì\í!\0IŸc#›\Í[[IIÉ·S\Øþm\á\n2ˆ\r±9Yl)\Í*R{Q\'v!s€\Ø›“\ÅfJ\Åvq\n\ÛO×©ø\È 6\Ä\æTz¥z_š^h\Ð¤bs$Z©YbKšŠŠŠojó•\ìbClŽDÏ­õDR©6_b\Ë\ZÁ`ð:½*\Ú±)..þÄ†\Ø‡Þ¿¦’\ê\Ø>—˜@!b[ºt©ùý\ï\ß\ì×¯_8ô¹.‹\ÞFþT8n¸á†³–\ë\ëÈº\Øm5úö\ík^{íµ¦›f¬GlÕ£ò3ŸH\Ì%ƒm±½õ\Ö[ašû÷\ï7\Z\Z\Â\ÏuY´Ü¢eµaÃ†ð²õ\ë×Ÿµ<v[}^[[~~\ÅW 6Ÿc£}E{ ¶5†aü“B¶\Å©¸\ê\ê\ê:–\éó\Ø\ê,\"+­\æÆŒ^6nÜ¸ð\ë®\Äy}\î¹\çv¼Vy–——›\çŸ~xù!C\Ì]»v™\Í\Í\Í\áe8\ë=\êk­$›šš[.9M’\æ\èg=h\Â.¹m ƒm±iS1ZB\Z§N\n/S™\ÄÊª²²2ü3›6m\n?\ê\ë®Ä¶bÅŠðóaÃ†u¬¯¨¨/[µj•¹eË–ðóAƒ…\×Mœ81üZ+\ÉH3Y_\ër*¶¡\ã°i§öñw:@%§‹MŸ80\\E\éc¢\n-:´ºcÇŽŽõZ¥\ÅnÓ»w\ï/&žÙ¾=üü¦›n\n¿\ÖG}­\Ë[îš¢sz\"(©\Ø\Æõ¤	®\Ø\"M\Éu\ë\ÖujŠ~÷»ß+¶„Ÿ\ëcWb\Ó\ç“\'O?¿ñ\Æ;‰\íÈ‘#q\ßSQQQ\Ç9>}\Ô×œcË­ØžA\íHõ\çJKK¿×“\ÛD\0\Ò[DzžK\ÏaE_<X´hQ\Âófñ®˜\Æ{}\ì\Ø1³ÿþ\á×‘+£‘¦\èÔ©S\ãþ¾Hó5òs\ÚdM\æou÷>[\Ñ\á‡t–ªTn\ìØ±_Ö›tgÎœÙ‡,B6\Å‘›^(ˆTR\Ú<]¸pa—òJVl\Z=ôPøõ\àÁƒ¿˜°¹\Ù?~¼y\ÑEÅ½ªª¡·ˆ\ÄVˆ-G\èE\0W´‡R\Ô!Â¯\"‹m±E‡VQ\Ñ\ÍLn\Ð•\Ó‰\Õ=ü\Ù\"\ÅR²¹›^8\Ðj\é’K.	ß‚\Ø@\å´Rby\Ï\Ï5ˆ\Ø$‹K±ˆ-ž\Ø\ÖHTöPlõ\"‹€\Ø›£1}þ\ÜC)VI¬\"‹€\Ø›£¦\äG†a<ß“ŸÕŸ±}L±!6§5EwK\ÕöT\ÅvŸü|3YÄ†Øœ&¶=½\0 M\Øòó§\É\" 6\Ä\æ4±’˜Ú“Ÿ=zô\åR\í1D8 6\Ä\æ8±‘Šm|\Z?o\Ê\Ï÷\'“€\Ø›“Ä–\ÖM¶òó-%%%?!“€\Ø›“\ÄvZbXO^\Çr“¸‡LbClN[«ˆ\éúžþ¼\Ï\çÛ©#„I@lˆ\ÍIbk1\rL\ã\ç\ë\ä\ç“I@lˆ\ÍIb9ò\Ò4š¢±m\"“€\Ø›“Ä¦ƒô—FSô1ùû\É$$‹›¦µCl.$2Xdšb¼M\â8Ù„d©­­mollDH6\ÅÞ½{w‹\ØZ8²,\Ê\Ë\Ë/K÷[k&ùv²	\ÉR]]ýpMMM\è\àÁƒŽ\Å\éÓ§]%µªªªV‰9YÿjFLWJÃ‡¿D«>\é\Ê\ï÷¿XTTt%™…\î\â,©2Žk\ÊiL\'¾¯Ñ‚\Ôb\Ð\Û<ôv\Î\Ó}]~×“V‡ú<~®CŽ\ë„/d\ÜDEE\Å7õ‚\Z™p1†a·»ûÐ¡C/°\æ*Ý¦Õ \ÄI¡W;Ì“qpA+\æ\Çr¼ž!\î®\ØJeGž\È\Ô\ï\×¬\ä÷\ß-±^¢Uy|GbŒ¬\î\Å\0Šmó\åº_l\ãµ|ÿž_\çXƒG»qµIl–ªqJ:·›\0Ø‰“3õ|1™pwSTŠ<”#©‘xC¿õœ†N\Ú,ñˆ^Œ`\Ï@+¶ù=™@œõ\íô°4\é€÷qÎ» £ñZökÿÓ²²²+\ØK\åcñ\ïz\ê„L¸û\Û\é)½’\é¤÷¤2S©\Éû\ÚgUrÍ–ô®aA\ÄV«“‘	#MÁ?\èd.N}\Ö=rX\ÍT•\Ü1m¾j3–½\Û\æž\Î\Ú\ÎÙ‰qKv½À \Ztº@½ð`]€\Ðo\×\0{lüL|ª÷d’	w\ï\ÄJ0Ù…o½—^–\×[G¬[HZ­[J\î\Ö[LØ³\Æg¢Y¿@É„‹T\ë\ínÿ?¬Ù²tò\æ\ÖMÁ\êe{½Y˜½)Š\í$­\0÷\ïD\Ï\r©Ý¸´;—vë²®°\îÖ¦E:c\ÎA^}&Z\é\n\èr\äÿ¾”Ý¯yõÿ\Óùr ¾ qP%GG}HBlÌºæ¸E\â¥|ø_µb££>t…žºHw|Bp\0:K ˜—0õ!\ÙÿWË—cz@l{eg>ž\Ï9 £>D0\ãf½ˆL¸_lZ¹‰AGýüEöõ=EA&\Üÿ!>,1‘L$\ÌõóKl\Ú\Ëe™pÿŽ\Ô\ìmd\"©\\\ÑQ\ßû_d/\ê=d\Âý\ÖS\Åd\"5\è¨\ï\Ù\ÏÃ›z~•L¸ÿ\ê\ÊÓƒŽú\ÞA¥¦ûŽL¸ÿª­¤¤\ä\Ûd\Â\è¨\ïúÏƒv\Å{L¸G\ê\Ýø\ß Žú\îû<\ì\×\ê›L¸GšR±]L&2õ]ñy\Ðþ\Åw“	—WV÷nB\Í2t\Ôw&z\ê€\Þ\'.G+5ú\Å\å:\ê;\íN¥ÝªÈ„»¿¾ÁŒ\×Î‚Žú9oŠê©™¯	¯\Ó+wdÂ™\ÐQ?û_*|\Ñ{£\ì¢W\ëÈ„ó¡£~\æÑªXsK&\Ü_vk\Ï2\á\Ê/%:\ê§Á\èÑ£/×©\'µŸtqqñ¬\ÖK@«b²\ãrô\Û^\ï’\'î¯¼\é¨ß£/v­|\Í8¡ËX\Ý\ä\æ‘)—!\ßð“\äñ™ðÔ‡•Žú\É\çª6\Ø\"’\Ï\Çõd\ÊeX\'¦É„7¡£~R\Í\ÑPbc6x—6E\ç\èºd\Âû\ÐQ?\ág`[©µ1¡‹{wª~›\ï ùõÿ…\Èk|<±\é…Ž÷žcxIg©\"yM\ÞwÔ—ÿ»%Fl\r\\]v÷·\Õ\"W”L@„|\ì¨/ÿ_e´Ø¸`\àþºDb5™€x\äKGýŠŠŠ-‰«\Øv±\ç\Ý/¶•\ÚE‡L@wx½£þ\Ï~ö³­*6©X+\Ø\Û\î\Û\Z-\Ã\É¤‚;\êO‘0o¸\á]õzUL\ïk\"\ÐS<\ÐQ_¥úÒ—¾ô~ß¾}\Í>}ú<À^u9ò-û‘aÏ“	°v\ÔKMb–¾\èÕ«\×ô\è\×\àÞ¦\èn\î×~q:¹£þ”›‚\Ü\Ü/¶r\ì=H& ’sRGý\î\äY?=\çN±’˜J& \Ë\Ç].;\ê\'[‘M£rs\ïvD»”	\ÈYî¨Ÿj3S\å\ÖN\å\æ>±±•’	p\î¨\ß\ÓsgS,¹Q¹¹HlzRw™\0§asGýt/p\Î\Íebk¥_¸€t:\ê\ÇJMo;y® û\ÛOb·ãœ›‹\Ä\Ö.\Ç@2n\"…Žúñ¤ö¡„i=ö\êBjñ¶£rs‰\ØB\Ì<n&QGý.¸\àÁ8\Ös–¬\Ì.\ä-µHÌ·±YY›É¸S\à\"õo¾ù\æc·\Ür‹y\Î9\ç<’„´¢\å\Ö\Ýúš¥g\ìØ±_V±‘	ð\áŠ*ŽÔº“[Ÿ$¥ýw¸Z\ê4\Ê\Ë\Ë/\ÓÒL€×¤–„l\âÉ­%©\ÅÊsnNA/\Z\è‰W2y&µ®ä–Š\Ôh–:½\ÍCo÷ \à.·„TŸ\â\Ïõ‰S©µX\ËSa±õ³—³+rŒa\Ãõ]2«Ø’m\Ú]±\Íf8£b+•\æ\è	2y\Øµ\ë[¤/)\ÍP‰M\çS<B& \Ï\äf\çUQn\Öu`Sô>¶ˆL€G\å\ïj¥]÷±•p5Ô™ˆ\ÔÖ&\Éx”iq**;{\Ì!\ÅD‡\×\î\'dò¨YjW_Q¤\æTü~ÿt22yR¹E\Ëm~Ar£{Do\Çýj.iŠþEª¶Mdò¤rK\çœRs‘\Ø*u\Âd2yZ¹õ´9NFªµj\ZL@žUn©H\n©¹°b«¹-&‡•[2\ÍÒ².¸¿\ßÿ¾a¯‘	 r‹»¾©¹³b\Û\"ñ™\0\äÖ©¢£G[‘f\è\Î@ 0L\0rûBb}úô™^@×‹m¯ˆ\íq2yN¸B\ëÝ»wa¦\È\íQR\ân±5Š\Øf	€p\åf–””„tfz\Ò\ábü~ÿa‰‰d \Ì\å:g©|&~@*\\Œ\ì\Äc·‘	€ŽVŒ\ÎSZF&\Ü-¶S\Åd \ã3\Ñ,1•L¸»)ªe÷2\Ð!¶O\å3ñ™p÷Nl+))ù6™\0\èhŠ\Ö\Ë\ç\â2\án±…dG~ƒL\0t|&\ê$–	w\ïD½¼}1™\0ø\Ã0þ)M\ÑwÉ„K‘\×_\Å&Á\Ö\0ÿú\\¼(Ÿ‰É„‹‘f\è	^‡\'\0\á\Ï\Äcò™\ØG&\\N ¡t4]²4EIRµ}F&¼Q~_¯w\\K¼M6 Ÿ	ƒ>ùœ$\ÞÙ¡ß’ªw]o,\è~’\0¯6E¿#ŸV2\á!\Ê\Ë\Ë/\Óþ£²c?;v\ì—\É\ä#GŽ¼Toƒ\"£¢¢\âBÙ±û%š†~	|C\ï(,,<LxŒ’’’st¾Q)Ë2„\är\ì·]I&¼»ƒßµ:\Ê_C6 *¶ùrÿ	™ð¶\Ü\ÞÐ“©t–‡<\Û1½Ç“Lx_n\Ð{\Ý\ä\ÑO6 \Ä\Ö(1L\ä‡\Üfk/‰	d<.¶]R±=C&òGn-¹=L6À«ˆ\Ô6Iü•L\ä×·Y@\åf\Æód<zŒ¯”XN&ò¯r¢$*\ÉxPl—Šm=™\ÈCt\ä]\Ùù§%\Þ!\à±/\î\çDn“‰<EGßµfºúPo\ê%#\à±=(\Çô2‘Ç”••}M×¤cX\r:ô2hŠ\Þ)q„L\ä9\Úa^„\Ý:Ž•v\"&#\àftŒB=\ÍB& `\æÌ™}\ä`ø@‡>¢Ÿ¸¼b»F¯ü“	ˆ>(j´¯]ii\é÷\È¸\àHGø pzs£vÁ2c8\Ù\0—~A›:„™€\Øc®\ÕK\á6².<~\Û\Õ\Óul+©\Ü\î#\à²c÷´^D \è\0¹]¿ýDpO’\rp\Ñq{DŽ\Ùñd\"\Û\Íz\ÎM¾ÿL6À\rø|¾½Q—L@—D¦ø“¦šl€Ž×µk™€n±¦ø;)r\ÛPÀ\à\ìŠm½ˆm™€¤\Ð)þ\ä \Ñ)þv1\Å8Xl\Õ:|™€¤±¦ø; C03\Å8´)ú7kòp€\ä\Ñ\Ñ@\äÀ\Ù.Sü+¶g\ä\Ø\ÜE& \'ô¹­\Ñ)þÀÕ¤œ‚3´EA& \Ç\Èô¦Ž\È[\\\\ü#²©\Ø\Æ\èXƒdÒ•\Ûz¯[0ô‘\r\È5:a²\æ@&À¹=¢½\ä\Ûòn²¹DoM\Ò\î€dlÁ0ŒIV,\îú†œa\rž\Ê\ÐE`\"µRkt…drØ‚1\"4ØŠ4G¬Dr¯“\rÈ‘\Ø\Ú\ä8ü™\0[\Ñ)þtø‰:²9›vÿ+!‰\Ê-<ÅŸ<ncŠ?\È&\ÒZ8,\Ç\ÝlÀAoÿ˜#1€Ì€-\èrpbŠ?\È†aL‘\ãK‡*\Ò~Ì§D`!½xm………\ç‘-°³Yú\âO‚)þ \ÕYW™u„ŽøA¦ÀvtŠ?9À6\Ë\Æ`;z¾+±\Ñ32}\0®”o\Ø®XAŽ­c	ªµd²q\0¾j5†‘\r°\í\ÒOlzŽ\ì@V°†–aŠ?°û¸\Ú#¶V.\Z@V\Ñ\áe,¹M%`“\Øh¯ƒ(±Õ\È:\"¶qVÿ\Ò\'\È\ØtL-ŠˆMš§×‘\ÈU\å6\Ò:\çö\nÙ€tÑ¦§Îª¦•Ù€œb\Æ`ù¦Õƒ±Šl€\rU\Û\ÄŽÀ\çó\r”8)$Sü9\Ó4\ÏÛ¹sçžºº:sùò\å\æ²eËˆDUU•¹r\åÊ\Ä<Ž*#Rûº\Ä\ç:W³œ‹J­¶¶\Ölll4[ZZˆ4¢©©É¬©©	‰\ä\æpdy\âO*·‰Æ’’’‹Éˆó\ÐJ\r©\Ù+7©\à\Î\Ü\ëX\'€?–\Ê\í\È\èÑ£/\'#\ÎB›Ÿ\É\ÞÐ¦)GV~\ÐKÄ¶Ž)þœ‡~‘bƒ4&\éb½|o\ÆÉ†»\Ävüó\æÎµ4\ë«~}®\Ëbƒ‚ðE……\ÖpÏŒŠ\ê±;¼\ÏÜ¼dº¹ñ{\Ï\n]¦\ëbƒ‚ð¼[\Å\ÜI6œ/¶=õ¯w’Z$ö\ÖW\"3\Äü~ÿ=*7‘\Üd\Ã\Ùb\Ûúö£	Å¦\ëbƒ³›¥e\Ö\ä\ÌóÉ†sÅ¶y\ÙÌ„b\Óu\È±A%%%?±µ\Z†ñ²\Øx¹Áš\âo5\Ùpž\Øô*h\"±\é:d†\Ø \ß±—Øªó*\çˆmûª¹	Å¦\ëbƒ.°f):$MÓ½Lñ\ç±5\ï\Ûdn^:£s3T–\é:d†Ø ûsn_Á\íÁ5«\è\ÈH\îÅ¦±k\Ý\ÂNb\Óeˆ±A’hSTª¶zmš2\ë·\Ävú´¹}õ¼\Î\ÍPY¦\ëbƒ±\ÕJ´H\"¹›ö,øh\Õ\Ó	Ï±\é:z 6H\Ã0^\ÓŠ˜\â/\Ëb“J\ìÀöjóƒ\Å÷\'”Z$tÝ–\ê\r±A\ny:–\Ä\Ï\ÉF\æ\Å\Ö]•Fõ†\ØÀ¾f\éL•“\æf^l\ÉTi]Uoˆ\r±Aj\Í\Ò_h,yü\ÙÈœ\Øz*µH 6\Ä©Wn\Å:\ì‘To/“žc#d‘\ÚtÀJŸÏ·Œl 6\Äž¡¨¨\è*‘\ÛI‘\Ûú¦øClˆ\r<\Ô,\rOñ\'±ƒ)þbÏ \Óú‰\Ø\Z$2\ÅbCl\à´Zóûý‹Ü˜\â±!6ð½Dl\ï\ézþt 6\Ä^:\ï¶T¯˜\ê•S²\ØxIn/\é½nz\Ï\ÙÈŽ\Ø6l\Ø`ó\ßþ\í\ßÌ¾}û†oºé¦Žõò§\Âý3±\ËV­Ze^}õ\Õ\æ¹\çžkö\ë\×Ï¼êª«\ân¯¡\ã\Úk¯58“=bƒŒ\áóù\æh/©\ÜÆ“ÌŠmÝºua‘ý\×ý—¹~ýúð²mÛ¶™)‰\í\Ê+¯¿Þ´i“\Ù\Ô\ÔdN˜0!\áöµµµ\á\çW\\qbƒ¼«\Ü&[³`\Í\"™[aaaX2K—.M¸M2b\Ó*L_«“ùú\\«»\Èë††³¼¼\Ü<ÿüó\ÃË‡b\îÚµ±÷0\ãV\í</r{–ldFl*•Ì©S§\Ò›Š(\ÒÌ¼ñ\Æ\Í3f„+·xÛ¯X±\"ü|Ø°a\ëµB\ÔeÚ¤Ý²eKøù Aƒx“@ ðS\âO·ˆl8WlZq\Ýw\ß}\æÀ;\Ö\r<8\î9¶H3tÇŽ\ÞGtô\î\Ý±§›¥ƒ¬\ÑxW‘\Ì4E»ú]±ò\Ó\ÇØ¦d\ìy»HõO„“\'O?\×\Ê.öo9r„sl?DMñ·…)þ\ì›^0Ð‹ZA©\"ô|Wd›¢¢¢°tž}ö\Ùð\ë„_\ßr\Ë-\Û\èóºººŽß©\ëµz‹\'¶cÇŽ™ýû÷¿Ž\\4E§Nšô9º®^#6p\r\Ö\Í{tF,\Äf\Ï\íz%³´´4,8mþ\é\ãÐ¡C;\Ö\ïß¿\ß3fŒù\ïÿþ\ïay\è\ãm·\Ý^\ÙfÄˆ\æW¿ú\Õp•¦Õ—6Cõ6’D\âyè¡‡\Îj®677›\ãÇ7/ºè¢³š£ˆ\ròšŠ)þ¸A—¦(x\nmŠj“T›¦\ÚDElbÏ òyŠ?Ä†\ØÀ»\ç\Ý\éz[b#x½×š\ëV\ÄF 6ð’\Üfi,íŠ…\Ø\Ä^j–Ž·ú—\ÎAlb\Ï™\âO‡?Blb/Un\á)þt\àJ\ÄF 6ð\Ö§t\ÈñNñ‡\Ø\ä!:9ŒN£“\ÅxqŠ?Ä†\Ø O±¦ø;¨\ÓüymŠ?Ä†\Ø \ÑjM\'f¶&hþ:b#x…^>Ÿo½ˆ\í¤W¦øClˆ\r Œ\Èm™W¦øClˆ\r ‘\Ú\Ë^˜\âÏ‰\Ó\×!6€b\Æï´—‚<þÂ­ÿCmmm{cc#B²)ö\îÝ»[\Ä\ÖÂ§\Ü.·)\Úy^7Óï¿ººúáššš\ÐÁƒ+‹Ó§O»FjUUU­sød€š¥?W¹yn|ÿòAœ%U\ÆqmB91t†y³Ô©\ï/*Z\Zx\n©Ø†\é˜nRÁ½F6ì£¬¬\ì\nŸ\Ï\"\0¹“[dŠ¿Z²a[5¬}v[\É@‘\êb€Î£ õLñgË—E@\â™\0\È}•\Ñßš‹)þ\Ò\Ûd\Í%™\0p\0C‡½@ª¶½ò¡<”\ïSü¥Y\Ï\Ñ<’	\0‡`Mñ·5ß§øK³b[(b\ÛF&\0œ÷\á\\-q:^G6RnÖ¿!ñ.™\0p †aüC*Ö’’’Ÿ”¿–	\0‡\"b›oÍ‚UF6’\ÎY½\ä\ë2\à`À*7i^\ÝC6’ª\Øv‹Üž\"\0\Îÿ°Þ©r\É=N6ºF¾\0Iž\î\'\0\îhb•X\Ã-$]~	×¾¸dÀ%†ñC°R$·˜l$›\è9„L\0¸if]­SüÉ‡w]G§øKSl\í\ÚML\0¸\âO\ÄvD>Äžœ\â/M±™\äÀ¥\è´~R™4J4TTT\\HF\n\nFŽy©ˆ!‹\0ÜŒV&R¹\íò\ÚiTk:TG€û\é%\æ\rR¹”˜\çb+\Öó\0\ÞùPWIõv\Æ0ŒÁyœƒ	Z½r4\0x\ëƒýŠ6\ÅÀ\È|üÿE\ì³\åÿ?À‘\0\à½÷V¬qùö¿Kµú¼ü\ï\Û9\n\0¼Y¹MµfÁš‘gÿ÷\ß%\Þ\ã\0ð\î‡ü6•›\Ï\ç{&þ\ç•\Ë\Ùû\0\Þþ ³ú—¾š\'ÿ\ïF‘ù\ß\Øó\0G*¶\ïÈ‡]§ø[\éõÿU\ï\és\ë$\Ô\0\"EEEWŠ\àNˆ\Ü6{yŠ?\í‰!ÿ\ãLö8@ž`u7úLbô\êR±\ÍÇ«Á\0yNñ\'bÛ§ƒ1–••}\ÍkÿŸN€£\ç\Ù\Ó\0y†Tk\ç\èôt\"€còø\rUlz‹\Ë\Õ\ìe€<E\ÄV§Žˆ\î\ÛúŸLF:\Ès¤\Ây]d\Ð*•Û\Ýþ¿¨\ÐTl\ìU\0\Ð*g\Õ«\Ô\Íÿ‡5²p;{\0\"•Ûƒ*\Ã0&¹õ÷>\\›\Ö\ìM\0\è@š£w[“3?\âR±ýBo÷`OÀYƒAŸ\Õ\ëŠy–¼\ïƒ\ìE\0\èDqqñô‚‚Ä›nz\ßÚ•Jä¶“=\0‰$ž\âObMK¦ø\Ó\Î\ï\"¶\r\ì=\0HHYY\Ùz\ÎJnÔ›z]\Ð­Î‡Žþ\0&Ã‡¿Dd¡\Ë8ý\ÆW\Ûzh’½\0\Ý2v\ì\Ø/‹0v‰8———_\æ\Ô÷©“G\ë=y\ì1\0H–^zþJ\Äq2~Ë¡b; ñ0»\n\0Rm\î\éy¬3~¿ÿzŠ\ís½½\0)þ¬÷º†q³\ÃÄ¦Wq‹\ÙC\0\Ð#¤b{\Ò\ê¥p»ƒÄ¦7b\ï\0@‘Š\í>ÿLd2\Ý!b\Éû\éÏž€ter›U¹\Í\Í\åû°®\Ü2d\0\ØV¹\é¨\Zm>Ÿï¯¹z:Y\rC€­”––~O\Ä\Ò\"MÁ¹øû:P¦^­eO\0@&ª¦\"™²=ÅŸ\Õ$>\Î^\0\0\Û\Ñ)þ¤jOñ§\ç½2T\r\ß_¦÷Ò=úr]\î—\åM\ì\0\È‘)þT4™˜\â\Ï›²,d]Õ›‡\Ëó&‰i\ì\r\0°\r\rD\Äòa¦¦ø“ß»1Vn1\Ñ©\æ\0\0ì®®Þ‘°}Š?k¤ß„b\Ë\åZ\0\ÈD4•:\"¯4‡\Øü{\'\Ú\É\Â\Â\Âó\È<\0d\Ã0ž·n\ä\r\Øõ;E”³\ã‰M–\'\ã\0­\Ê\íakþÒ‰6þÎ–±\í\'\Ó\0m¹M°\ä6ÛŽ\ß\'\Í\Î\Å1\Õ\Úõd\0²Ž\ÈÇ¯]°\ä\á\éþ®`0x]Ô¹5&r€œ\ÊmˆuA\át×ˆ#>U±†ñS2\0¹n–^£ƒCŠ\Ü\ÞM\ã\×L‘0o¸\á†÷­€#\Ð)þ¤	yT\äöQ¦øS©…¾ô¥/½ß·o_³OŸ>Q\0p\Ö\Új\nSü…¥&1\Ëz==\æ5\0@n±ŠüDûy&1\Åß”›‚\Ü\0Àiô²ú€ž\èbŠ¿\î\äYOx\0p\"¶·Lñ—lE6\Ê\r\0œ(·¿\è½n@`D›™*·v*7\0p>Ÿ\ï)\í¥ð\ßÿý\ß\ëa6Å’•\08‡ë®»nñ\Ï~ö3³_¿~÷ðWp\Î\r\0EXJQR\ë%ñœõ\Ø±\Ûq\Î\r\0œ#µ(©¤>”0­\Ç^]H-\ÞvTn\0\à(©X˜ñ\ä-µH\Ì\ï\æ÷\0\äDj‰¤-·\î\Ö\Ð,\0\'I­;¹õIRj\Ñ‡«¥\0s©u%·–¤+7Î¹@N¥Ö•\ÜR‘\Z\ÍR\0\È(—[BªOñ\çúÄ©\ÔZ¬å©°\ØúY\Ær€ŒTl\É6\í®\Øf³\0 —\ÍQ»Î±Eú’\Ò€œ\Ê\ÍÎ«¢Ü¬\0Y•[¼«•v\Ý\ÇVVÀ\ÕP\0\È\Ó\âTTvö<˜CŠÀ	\ÍR»úŠ\"5\0pD\å-·ùÉ\î½÷«€\ã*·tÎ‰!5\0pE\å\Ö\Ó\æ,\0€\ã*·T$…\Ô\0À5•[2\ÍÒ².\0€‡*·\È99¤\0ž[¼û\ß\0\0\\\'·i)6S\0M¤B«)`”\0ðR\å6j\Ô(©€§°\Ä\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ,\0\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0\Ä\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0\Ø&±Y7qœL€›\ÄVÖ\Ø|>\ß,2\0n“[Sb;VXXxY\0\ÏTm~¿6\0·\Ê-Þ¹¶\ãTk\0à©ªsk\0\à¹\í§Z\0O!Ú˜(±M##\0\à•ª-|®j\r\0\\‰\ÊK+3‰Zë––˜ólm\Íu@`^EEÅ…d\r\0IQQ\ÑU\"«\Z‘Õ™$zD\ßú\Ñ.\Í\Õzy¼ž,€c*4\Óbš™Š\ÐD\0\ä”\â\â\âI¥u*VP\ãÇ7\çÏŸo¾ó\Î;\æ¾}û\ÌS§N™Š>666š\ï½÷žù\â‹/š\'NŒ\×\Õ\ê¤a7“]\0\È:zµ3¶GK\é\Þ{\ï\rK«­­\ÍL–\r6˜÷\ß¬\àB\Ü\ï\0Y—Zt\ÓSgVVV¦$´X/^lJ3”›y 7\ÍO‘Z(º\Ùù\ÑG™vð\É\'Ÿ˜w\ß}÷Y•\ÍR\0\È(z¡ úœšJMÏ™Ù‰þ¾h¹\é97.(\0@&› ‹£›ŸvUjñ*·˜f\é\Z²\0¶£÷©EŸW\Ósj™DÏ¹EŸo\Ó&0{\0lEo¾¾úy\æ\Ì3\ÓL:5ºIZ\Ï^\0\0\Û\Ðsk\Ñ=\nô–Žl°iÓ¦³z(Hôgo\0€-\èm\ÑÒ¹­#U¢o\âÕ¾¥\ì\r\0°«Z‘Ë‚\Ìlòò\Ë/Ÿ\ÕåŠ½\0v‰­cb\í&•M´\Ù\Õ=\Ì\Þ\0\0[¡tœ_;p\à@VÅ¦÷µEy\Ä\Þ\0\0»*¶¹D:´gý{\ÑŸ½\0¶‹- 6\0 b\0\èÎ±€+6®Š€\ç\Ä\Æ}l\0à¹¦\è\ì\\õ<ø\å/I\Ï\0°kJ½6úŠ€×š£k¢G÷\ÈF\Õ=£{\0€\íXó††\r\0¼Vµ\Õfk\Ý[o½•t ó\è\Ü:A¦\ç<¸ë®»˜ó\0\0²‡\Î\Z\Ý$µ{–ªh©1K\0dSnS¢\åf×¼¢1\ÍO\æ€\Ü\Ê-rµTgvOõ–Ž\éÓ§3<\08§Y\Z}\Î-ºyª=Ö®]\î[\Z\é8¯zM\å§=\n¢o¾>§Fó\0rŠžØ¾Zšf¬\áB\08½\ÏMª­õ\Ñ=’	\íQ 7\ßŸ’E\0p$\Úý\Ê\ê[ªU\\SôGQ]£k‡v\íûI7)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0{ùÿavv\Ù]Q\0\0\0\0IEND®B`‚',1),('8',1,'/home/dell/stconline/server/target/classes/processes/Contract.Contract.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0k&IDATx\Ú\ì½tVÕ™øí¥­uÚ™©³Úº\æ¶:]ß”\Õquuj»fü·\ÓQþ\ÎgÇ±NAÞ“÷Í…„B @€p•p	7\åb@‹€Ø€Xð¡X\äƒ\Ä(ˆŒC0B!\Ù\ß~¶9™7÷¼—\\\Î9¿\ßZ{½·“7É“œ}~ï³Ÿ½÷-·\0\0\0\0DJ\Æ3»Õˆº–\ÑL»ü@­9n\án¥9©\Û\"¹_\ß\êŽÓœ\r:nEsß‡h\0\0¸Œg_;{s\ä’üZ}ñªJ©óF\ê$¡Z©úù5\"°4¿vÄ¢<9\îl‘Ð·\Ç/\Ô~!\Ç=ŸWR5ò\Ùü6\0\0\01rñ\Þ\Úz‰0·{\ìLÃ¿68\î\Ù7õq{\Zd#\êŽ\Û|œ~¼&¯\èú—\ÒF-ù\ê½\å~s\Ù\n\0\0\0p r—!K7Ô¥t\ßd#ž\Í3Ç½z\äËªC g¿Ÿ|ø…ª°ŸŸýÊ‰\êxÿ&\0\0pú‚ÿdF,lT#±$¿v\ÄÂ¯²uÇ“ûrÛ°–b\Ú}ò\Ë\ëA\Ç=Tw\ÜC’É¨}C\Z\0\0\0.\ÌH\Ô\rKü¾\á°\ÆÿÊ‚}l\Ýq=š?nOƒ\ã\ìû™\Ï\Ôj\Z¹\èA\Ä\0\0Ü“ø\î’\×\ÎÞ”‹ü\ÅjuA¤`\ä³_‰…y,39–\ä\×\Öûÿ\ÚÇøjV\ÆöŒ ™‹·t£\î¸vv¢\îñöÿoy\åfl\0\0\0¸N$†\ÙY…\Ï\æ¹´ ö\Åý*G,®\ÏT\ä\ë¶\áË«\ÍXœÿU“lÄ¢<s\\•R_¿\ßØ•o\Õn~÷‹k\ã^(¬±ß¿®\Ð2Ÿ\È\0\0¸€O®©‹¯Ÿ¸&÷$¹ðh\\@ùU\æa\ß\Ô5‡k\Æ,+\éœ+G.\Îkö¸‹\Õ\êJ{ß\È\0\0\0€«\Ñ\Òû\íÛ·oZ´hÑ—s\çÎ­5j”JLLT111*>>^1BeeeÝ˜:u\ê\'Ã†\rI\Ä\0\0\0\à–ó\ç\ÏÇ®^½úòð\á\Ã\Õ\àÁƒÕªU«\ÔþýûÕ§Ÿ~ª*++%«¦nÜ¸¡\Ê\Ê\Ê\Ô;ï¼£Ö¬Y£\Ò\Ò\ÒTzzz\í„	òý~ÿ\ÝD\0\0Àch?¸{÷\î\Ý\åC‡Us\ç\ÎUGŽ1\Â\Ð^Ž;¦-Z¤RRRÔ¨Q£¦Q\0\0\0e!,XP›‘‘¡:¤\"\áÄ‰jØ°ajÐ AŸ%&&~‡\è\0\0¸˜+W®\Ë\Ê\ÊR\Ï<óŒº|ù²Š2\"\ï7dÈ/\ê\0\0\0pq&B$bö\ì\Ù\ê\æÍ›*\Ú,Y²D2Ÿ÷\ì\Ùó›D\0\0ÀEHM„gH\æ #$\Âfþüù*..®˜ˆ\0\0¸)¬”šˆh\rg´6Ì‘––V\ë÷û3ˆ:\0\0€!\r™!33:)ÀŒ­¡^\0\0À\È:2Å³3™>}ú˜˜˜-D\0\0ÀÁÈŠ•²\ØTge#l>ø\à\å÷û«)¼\0\0p0¯¿þú«²beGX¶DbbbeY)ü\0\0\0Š\ì!\Ë^w999\×bbböòW\0\0\0p(²—\ì\Ñ¼õ\Ö[7µH|\Ì_\0\0À¡\È.ž²WWP^^^«E¢Š¿\0\0€C‘-À\í]<;\ÙL¶!\ç¯\0\0\0\àP\äBÞ• \0\0\0¦_¿~]™‘¨E$\0\0\0\ÌÈ‘#»¬F¢¬¬\ì5\0\0\0fò\ä\ÉU]5kcûö\íe\Ì\Ú\0\0\0p0Ó¦M+\îªu$²²²JYG\0\0ÀÁ6,)--­KV¶”%²Y\Ù\0\0Àù2Q\Ó\Ù{m\ìÛ·O†5\Øk\0\0À\éLœ8qÏœ9s:U$X\Ê\îŸ\0\0\0. 11ñ;¨=v\ìX§H\Ä\Ûo¿].\Ù¿\ß7\Ñ\0\0p\é\é\éYC‡U—/_\îP‰¸v\íZM ¸¡%\"ƒ¨\0\0¸ˆ´´´Osrr:²ð²V2Ë²>\"\Ú\0\0\0.C\n\Ó\Ó\Ó\Ë-Z\Ô2Q;aÂ„s²n„¥m\0\0\0—\Ê\ÄÀ\Ë\æÍ›§®^½\Zµ\áŒ!C†Hq\å\Ç\ÔE\0\0\0x@&\â\ã\ã?JMM­=|øpÄ…•R!\Ãd\"\0\0\0<„D\Æ\Å\ÅÝœ<yrµE(\Ã………¤\æ¢nv…•\0\0\0^D²–e­—¬BBBB\íÜ¹s¯½ñ\Æ7KKKknÜ¸Q¿‹§lÀµcÇŽrYöZV¬u\"\Ê\0\0\0\0ƒƒx\Ýv\êV¬\å\âšlÔª¤B·}²\ì5+V\0\0@{\äB!\r\0\0\0¶Hô\í\Û÷¯ˆ\0\0\0„ŒeYµ			K$\0\0\0 ,‘HLLü‘\0\0\0€‰‰‰©\Ñ2ñ\"\0\0\0\áˆ\Ä\Í\Ø\Ø\Ø!\0\0\0ŽHTû|¾û‰\0\0\0„#U–eý†H\0\0\0@\Èh‰¸#\0\0\0ŽH\\‹µˆ\0\0\0„LLLÌ—²t6‘\0\0\0€±,\ë²‰D\0\0\0BFK\ÄZ&†	\0\0\0G$.\ê–I$\0\0\0 ‘¸ \ÛD\"\0\0\0!cYVi ˜F$\0\0\0 dbbb>\Ñ\íI\"\0\0\0\áˆ\Ä9¿ßŸC$\0\0\0 d´Dœ±,k1‘\0\0\0€‰‰‰)\Òm‘\0\0\0€pD\â\Ýr‰\0\0\0„#GÀˆ\0\0\0„#‡t\Û@$\0\0\0 d,\Ëz\Ç\ï÷ÿ‘H\0\0\0@\È\Ä\Ä\Ä\ì\Ó2ñ\Z‘\0\0\0€pD\"_·]D\0\0\0\Â‰]\"D\0\0\0\Â‰\í2¼A$\0\0\0 ‘Ø¢\Û\"\0\0\0!\ãóù6úýþƒD\0\0\0BF£²,\ë}\"\0\0\0!#\Ëc\Ë2\ÙD\0\0\0\Â‰²q‘\0\0\0€	K,\ËúˆH\0\0\0@\Èøýþù111\ÅD\0\0\0BÆ²¬\ÙZ$>!\0\0\02@`š–‰R\"\0\0\0!3Q·D\0\0\0\Â‰L\Ý.	\0\0\0G$†Y–UA$\0\0\0 dü~ªn—‰\0\0\0„Œ\Ï\ç\ëóeTÜ­Û¯ûô\éóS\"\0\0\0\rQ°,\ëš‡j\ÝjtS-´<¢\0\0\0MÐ’°·V›œœü\"\0\0\0M¨¾h-q€(\0\0@k2ñJK\"aYV\"\0\0\0­‰\Ä\Ý\Í\ÕHh‰x\è\0\0\0@›È®ŸE\"66\Ö\"2\0\0\0\Ð.\êfp\Ø\"ñ1\0\0€v\ã÷û3l‘ûD\0\0\0BÂ²¬\Ë\"D\0\0\0B¦n÷OD\0À	¼ýöÛ©ƒ¾ñOÿôO\Òq\Óh4\Z-‚öw÷wªGEúþ\Ý\\aÀñ«_ýJý÷ÿ·z\çwTee¥\0€ð¨®®V\ï¿ÿ¾\êÓ§úö·¿}™\0×“žž^-\0\0\Ñ\å7¿ùM\îf÷q¥W#\Ã’‰\0\0€\èr\ìØ±Z\Ý\Í\Þ\àJn‡\á\0€@†9\ê\ê&\0\Ü-\0\0\Ð1 €H´q‚\Ü{\ï½mó\Øc\Õ\ß>|xýý?ý\éO\rŽ•\ÌH\ÝI§¾ÿý\ï7ÛŽ;\Ö\à½\ï¿ÿþ\ïq\àÀó|QQQƒ\ç\Ë\Ë\ËÕ–-[ÔŠ+\Ì\ëR`ºÿþ&\ß\ï\ÙgŸ¥\ç\0D \Ú\"q\åÊ•Ó›~øa\Ó\Z?\'·rÁ®©©QUUUõ{;\Å÷\È#ÔŸ\\Ë–-k’ü\Å/~aZ 0\í•W^1-..\Î|Í¼yó\ê?w\îœy\î…^P‰‰‰\êö\ÛoWuk˜&¥}ðÁ\æ½GŒQÿs\ÊÏ—››kggg«\×_\Ýü\Üò¸°°\Þ\0	€Ž‰õ\ë\×\×?\'_yN„!ø¤\É\É\É1\ã\ßý\îwõu‘¹0aBýqrLc9hŒd\ì÷øüó\Ï¼&2 MŸÁ‹¼¼<s_Dž·±¿¯d#‰¿ù›¿iò;\Ê\×\0 \00´a_\ÔÔ¯ý\ëú\Çw\Þy§i\'Ožlrüƒ>h\îK6BÏœ9\Ó\Ü\ÚÙƒ\à\áŠ`¶o\ßn^—lDcNŸ>m^“Y\'‚HFð÷*--5{õ\êU?\äa;3²{÷\î&\ÉL™2…ž\0	€Ž	¹X\ç\çç«‰\'\Ö\r\Èc¹ß¿ÿ\Ç\ÛY‰9s\æ\Ôgd±–\Æõ\r’Aø\×ýW\Ó}ôQ“-÷’\ãdˆCž“&\Ão¾ù¦ùš²²²ú\ì}¬4ùž\"C‡5>\ÜD„ÉˆHF\ã&\Ã \0\0ˆ@f$\äý?ÿó?7x,·R‡`gD\Z\ä¹ý\èGõ_+õ	öý\à\Z‰’’“\á&+\Âý\áP¬—yNš¼\ç[o½\Õ`\è#øg“ŒÈ¶m\Û\Ì\íó\Ï?o†+l<Xÿó\ÊpŠ\ÍHñ¥€\ÚÙ‹ø‡`:,\0 \0)k×®5÷\íbEF°_³‹)\åo_¸e¤-‘h{†…dš\ãÒ¥K\rj,\ìú»\0³¥lÄ†\r\Ì,‘‘‰\éÓ§\×\Ï(‘Ÿ\0\0‘\0\è\àŒ„)\Þu\×]\r7Wc\\·\ÐX$dhAš\Ô;„#O>ù¤y]2ö´O™¡ÑœH\È\ë2\Ôq\Çw\Ô|\ÊÉ!C\ê³)ò\Z\Ó?\0‘\0\è@‘¦qF¢¥“(X$n	šÁqö\ì\Ùf×‚hH\Ø3,d¸\Ã^BÖ°§œ\Ú\"!\â<ó– Yò\Ò$Cag3\ä15\0€H\0t‚H¬Y³¦\Í½4)¤¤(SKvÀ.¾”\\\Ç ,X°@\Ù[š\Ëú\ÍaO•\ï-µöû\Ø\"!uöû\Ï$	—[\Z\Í8±\ëHt=2\Ä$\Â)ÿ\'£F2ÿ2\Ë\'>>\Þ\Ô\áH\æ\ëé§ŸV{ö\ì!X€H\08U$\0¢Éµk\×L‘­Ôª<X­ZµÊ¬>úé§Ÿ\ÖÀÞ¸q\ÃÈ£l4\'\"›––f†¬ž{\î9UQQA‘\0@$À‹\ìÝ»\×ÁÜ¹sÕ‘#GŒ0´Y‡dÑ¢E*%%E½ö\Úk	\0D¼”…¡¬ŒŒu\èÐ¡ˆ\Þ\ëÄ‰jØ°ajô\è\Ñ\ê\êÕ«	\0DÜŒd²²²\Ô3\Ï<£._¾•÷”!y¿\Ì\ÌL†:\0‘\0@$ÀÍ™‘ˆÙ³g«›7oFýý—,Y¢FŽ\Ù`\0D\0‘\0— \Ã’9\è‰°™?~ý¶õ\0ˆ\0\".A\n+¥&\"Z\Ã­\rs\Èì­[·t@$\0	pË†\ÌÎ™`\Ên\ÔK\0\"€H€u\"dŠgg\"\Û\ÖK-\0\"€H€Ã‘š…\Î\ÊF\Ø\Èþ+’• ð	\0DŒ,{-5Y`\ÙIIIj×®]ü\0‘\0@$À©\È\Þ²\ìuW°p\áB5yòdþ€H\0 \àTd.\Ù;£+Ø·oŸÉ†\0 \0ˆ8\Ù\ÅS6\à\ê\n\Ê\Ë\ËM\0\"€H€C‘-À\í]<;YŽ[¶!@$\0	p(]}!G$\0‘\0@$ÀÁô\ë×Œ \0ˆ@xteDYY5€H\0 \àd²³³»l\ÖÆž={˜µˆ\0\"NFvû\ìªu$žz\ê)Ö‘\0D\0‘\0\'#Ùˆ´´´.Y\ÙR†5X\Ù	\0DNW\ìµñ\î»\ïª\Ø\ØXö\Ú\0D\0‘\0§³r\åJ³\Âeg’™™\ÉîŸ€H\0 \à®^½ª¨Ž;Ö©ÙˆŠŠ\n‚ˆ\0\"n`Û¶mj\èÐ¡\êò\å\Ëú}®]»fV\ÓÜºu+AD\0‘\071v\ìX•““Ó¡…—£G6\Â€H\0 \à2¤ðqÌ˜1jÑ¢E\"2\ÝSÖ¡\0D\0‘\0—Ê„¬v9oÞ¼¨]ðe8cÜ¸qF\"¨‹\0D\0‘\0\È\ÄÈ‘#Õ Aƒ\Ô\áÃ‡#z/)¬”š\Î ˆ\0\"B\n\"\ÔÔ©SP„2\Üq\è\Ð!Ss!³3(¬D\0‘\0\"Y)À”U(e§P¹ŸŸŸ¯JKK\ë“’]<e.\Ù;C\ê \äXY\'‚¡@$\0	\0ƒ\Äô\é\ÓUzzº®-À\í&ò 5“&M2\Ë^³b% \0ˆ@‹HF\Â\ï÷@$\0	€\Ð9zô¨¾\0@$\0	€°†9¤f\0‘\0@$\0BfÓ¦M*%%…@\0\"€H\0„\Î/¼ †B \0‘\0@$\0BgÁ‚f+p\0D\0‘\0™3f˜©ž\0ˆ\0\"2&L0N \0ˆ@\Èddd¨¥K—@$\0	€Ð‘\r½Ö®]K \0‘\0@$\0B§ÿþl\Æˆ\0\"²\×\Æþýû	 \0ˆ@\èUTTD \0‘\0@$\0BGvü¼t\é\0D\0‘\0\Ê\ÊJ#\0ˆ\0\"2\çÎcq@$\0	€ðx÷\ÝwU\\\\\0D\0‘\0;wª¤¤$ˆ\0\":\ë×¯W$€H\0 \0¡³|ùr5l\Ø0ˆ\0\":ó\æ\ÍScÇŽ%€H\0 \0¡3u\êT\Ó\0	\0D dÆŒ£ž~úiˆ\0\":C‡5u\0ˆ\0\"22c\ã\å—_&€H\0 \0¡“˜˜hÖ’\0@$\0	€‘U-<H \0‘\0@$\0BGöÙý6\0	\0D dd\çO\Ù\0‘\0@$\0B¢¢¢‚-\Ä‘\0@$\0Â£¨¨Hˆ\0\":ûö\íSñññ	\0D u\Ê\Ë\ËÕªU«\ÔÖ­[Õ‘#G\Ô\éÓ§\Íýþýû@$\0	€¶‰55›LMNNVP7n$P€H\0 \0M™<yr³\"a7™\n*™\0D\0‘\0hvx£5‘\È\É\É!H€H\0 \0-3bÄˆf%BŠ.«ªª \0ˆ@\Ë\ìØ±£Y‘\ç	\0D M¤¸2X\"\r\ZDP\0‘\0@$\0\Ú\Ç\ìÙ³ˆÄ‰\'\n \0ˆ@û¸zõª™¡!1zôhˆ\0\"\ZÃ‡7\"ñ\Þ{\ï@$\0	€öó\ÔSO©»\îºKY–¥\Ê\Ê\Ê \0ˆ@û%\â\Ö[oU?ÿùÏ•\Ï\çS“&M\"(€H\0 \0\í—[²³³<@$\0	€vID[\Ï \0ˆ@»dÁ~}Ú´i	\0D ôŒƒH™	@$\0	€°‡-D&n»\í62€H\0 €D„Wû _\'2Af	\0Dˆˆ¾ž\Ì \0ˆ -u¼ªµÿMj&\0‘\0@$\0‰[$\ÈL\0\"€H\0‘HDc˜\0‘\0@$ÀEªH0\Ìˆ\0\"HDD\"afs\0\"€H€\Ç%\"\\‘–	j&\0‘\0@$À,¡6†9\0‘\0@$À¥œ={\Ötž÷\ÜsO»3\Ñ	¡W¯^\æù9\0	\0Dœ‘hm˜¡#3\ãÆ\ã\0ˆ\0\"n\ÞhK0BÁÞ‹ƒa\r@$\0	ð°L„#3f\Ì`q*@$\0	p«LH¦`ò\ä\É\"+V¬P½{÷V>ŸOÍ›7O=z” \"€H€[8þ¼\n\ê±\Çk—L\Ü\ÆÊ–Ã‡W/½ô’\Z1b„òûý*..NM˜0A½úê«ªªªŠ? \0ˆ8òòr5e\Ê£ÆŒc$¢#ö\Ú5jTƒ\çkjj\ÔÞ½{\Í0G¿~ý\Ì÷<x°z\î¹\çTII	@$\0	\è\ÎTTT¨\éÓ§›Ì€dNž<YÿZ{\Öy¸%\Ê\ëEˆ<ˆD2\ÄH…\ÈEvv¶‘\r‘\0D\0‘€nÀ•+W\Ô\ìÙ³@:T9r¤\ÅLB$+PF²\è”s\Èp‡{\Èð‡-;2,\"€H\0 \Ð\ÉTVVªœœS!C………&\Ñ\Þ\íS\n3Ÿ~úi5`À\0#)))l\"€H@g Ÿ\î/^lb\àÀª   C¥ £·—Œ›€H\0 \ÐÁH]L¹”­|‚ßµkW\Ø\ïe/\"\Õ\Ö0Gnnn³…•ù;R°	ˆ\0\"Q¾¸¾ø\â‹*>>^%%%©­[·F\å}\Û\Ê4\Ø5%\ÍAÁ& \0ˆDÀ\Ë/¿¬\Ìt\ãÆQÿ–dÂ®¥\èN+VR°	ˆ\0\"\ídË–-*11\Ñd!\äBÙ‘4\Þè«½\Ã]\r›€H\0\"Ðˆ;v¨\ä\ädó‰{ÕªU–¾·3<ð€#wñ¤`	@$À\Ó\ä\ç\ç›OÖ±±±jÙ²eªººº\Ó\ÉL\Èÿ¥Ó·§`	@$À38p@\r\Z4\ÈL\å\\¸pa—z>{ö¬\ëbLÁ&\"€H€\ë8|ø°JOO7!\ãúW¯^%(\0›ˆ\0\"Ž\æÄ‰*##\Ã\\ÀfÎœ©.]ºDPº\n6	\0DÁ\éÓ§Uff¦I­O:U]¼x‘ t3(\ØD$\0	\èv\Èø¼/Š@Lœ8Q•––@Á&\"€H@—\"Â••e.@\"\çÎ#(B\n6	\0D:²Œ¤\Æeii\Ò\0wAÁ&\"€H@Ô‘¢IY‡A.*Ã‡WÇ\'(‚MD\0‘€°‘i›r‘ˆ¤½<HP<›ˆ\0\"\íNo/Z´È¬!J\íß¿Ÿ @(\ØD$\0	h‚,]-Y\ÊZR\Ùyyy\Ú›ˆ\0\"\áñO—¹¹¹&UÝ¿µ}ûv‚e´(\ØD$\0	°n\Ý:•`>AnÞ¼™€@Ô¡`‘\0@$\\È¦M›Œ<ˆD¬_¿ž€@§@Á&\"€H8œmÛ¶™\á\éÀe8ƒñk\è*(\ØD$\0	!…“’R–B\Ê\åË—#\Ð\í `‘\0@$º!ûö\íS©©©f*\ç³\Ï>KúAk›l\n‡H\0\"€,%Ÿ\ì¤\Î\É\É1‹K8•\à‚M\ÉVxýÿ‘\0D:Y¾Z–±e­eyk\0· \Ùù\ß&#H\0\"Q¦¨¨\Èl¤%¬Œ+“þ7r\æ\ÌD‘\0D¢Iqq±\Z;v¬I÷\Ê\Ö\Þeee\\\Ë\áÃ‡M\Í\"H\0\"RZZªžx\â	ó\élüøñL—Oð\æ›ošµO	D	“òòr5u\êT“=z´Iõx…­[·ª\ä\ädD‘\0DBEŠ&gÎœY?\r\îÄ‰<‡¬\Â*Ó™	D	h\'2\Ím\îÜ¹fˆôôt3F\àUžþys ˆ \Ð² Ï‚Œ@¤¥¥©ð<‹-2³“	D	h\ê\êjµd\É³”õÀMq€9}ú´Y™U†ñ¤‰\\Ï™3Ç¬v‰H €H@#d/U«V™©mRL¶s\çN‚žFVg•¢\âæšˆ¶´¤¤$µk\×.D\0‘ð6k×®Uñññ*11\Ñ\ì/\0\0_!»¶$\ÒD¼½¸\"ˆ6l\Ø`\æ\Ä\Ë.‡r\0\Z\"›tµ&ò:C\0ˆ„ç¹ð’’•,Ä‹/¾\È\É\0­ \çIs!\Ù\n¯‚H\0\"\áQd,7%%ÅŒ\í®X±\0hË–-kV$¼<“	‘\0D\Â!\ÈEÇŽ¿OAA™!S9/^\ì\É1]€p©¨¨0±KÄ¸q\ã<D	‡`wZ\"\áT†š5 D \æÏŸ¯*++¹*\0„¬\ê\Z,25‘\0@$#v0`@»2GŽQÃ†\r3Ÿ¢d\Þû•+W¸\0D€ˆƒ}\Êfu^‘\0DÂ¡\"œ¡hN(Nž<iöÁ˜>}ºI\É@t:t¨9ÿ>üðCD‘\0D\Â\Ù\"œ¡!\â\âb³§<7yòd³C\'\0DY\åR\Î1‘\0D\",Î;g:¹p¿þú\ë´0š¬–™ŸŸ¯ŠŠŠ¸*ç–ƒ\Ï-D‰0:º½{÷ª²²23\ã~»p\á‚\Ê\Ë\ËS§N\â\n\nœ[=·	@$\ÂHi\Ò\ÑE·\Ãó\âþÀ¹\å–s‘\0D\"D\äÄ¤“Šn“t,\0\ç–3\Ï-D‰‘“\n‘€\èÃ¹…H\0 A\í\Ë/>U½³JÛ™mšÜ—\ç\è\Ü	\à\ÜB$\0‰VÛ•ŠO\Ô\Ñ\íY\êðŸF7hòœ¼F‡H\0\ç\"€H´\Ø>>ö\Ç&\ÝJŽm¡ƒC$€s‘\0@$Zn\ìyª\Å\ÎN^£ƒC$€s‘\0@$ZlG_Ÿ\Òbg\'¯\ÑÁ!À¹…H\0 tvˆpn!ˆ \Ñ\ïì¤’¼¥\ÎN^£ƒC$€s‘\0@$ZlE‹Z\ì\ì\ä5:8D8·	\0D¢\Åvñ“#\ê\èŽ\ÉMS¯ú9y‘\0\Î-D\0‘hµ)\Ìm\Ò\Ù\Éstnˆpn!\0ˆD\ë\íúuUôÖ’¦©Wýœ¼F‡H\0\ç\"€H´¸òÞ©‚…-Ž\ã\Êk¬À‡H\0\ç\"€H4ù¤ôi\ÑnõþkZ\ì\è\ì&\ÇÈ±|‚B$€s‘\0@$\Úü¤\Ä\'(D8·	\0D¢\ÅÎ®=Ÿ”ZûEg‡H\0\ç\"\àa‘·£³\"œ[ˆ\0Å–4D8·	\0D‚\Î‘\0D‚s‘\0@$\è\ì\0‘\à\ÜB$\0	:;@$hˆ\0\"AC$€s‘\0@$\è\ì	@$8·	@$\è\ì	@$8·	\0D‚\Î	\Z\"\à!‘¨;\éÔ¿ÿû¿7x^Û¯Er¬´¯ý\ë\ê\ç?ÿ¹ÚµkxJ$v\ìØ¡þ\í\ßþM\Ýyç¦\É}y.\ÒsÐ‰\ç\"\àr‘v\è\Ð!ó\Ü{\ï½\×\àùHŽ•û{÷\î5÷ø\Ã\ÒÙgDbÛ¶m\æÿ¾gÏž\êüùóª´´\ÔÜ—\ç‚e\Â+\ç\"\àr‘OJ)))\æ¹\Ô\ÔTó¸¥N,”cƒ\ßq\Çõ¥SMHHP\ßúÖ·\Ìó=ô:sæŒºxñ¢y®G\r~Ny,Ÿ\è.\\¸€H€#D\Â\Î(\ìÛ·¯þ9¹\ß8û\à•ó\n‘\0p¹HlÙ²Å¤J9bn\åqKX(\Ç\Êý7\Þx\Ã\Ü\ä‘G\ê_OLL4\Ï¨\ãÇ›û÷\ÝwŸy-##\Ã<–OtvzX\Ëód$À)\"!\çFð9!­²²\Ò<\'o¯Wˆ€\ËEB\îÿ\ä\'?1ŸPä¶¥O?¡k7I¿ž>}ºþuù´\Ôø˜\Ûo¿Ý¼VTTd\î÷\ê\Õ\Ë<–[y,\Ï#\àV‘pûy…H\0x@$V¬Xa\î\Ëm[\"Ê±™™™\æþƒ>Ø¤Ã»t\éR³?WŸ>}\êÇ’\åVS#N	{h¢°°°\É\Ð\Æ/ùKÏWˆ€D¢­\×\Â=öÊ•+\ê\î»\ï6\í\ns;;v\ì\Øf\ß\ÏN\Û\Ú_\'©\Úöþ\\­ýœˆtÖ¹e_¬¥NAj‚‹-_y\åÏWˆ\0\"Ñ±3f\Ì0\ï¿ÿ~óXŠ¿¬\îº\ë®f«Ó¥\ÉÔ¶ÆŸ\Þ	pŠH\Ø2!…•v¦@†;rss£v:\é¼B$\0\\*4D:\çÜ’,Að°\ç\"€H\Ð\Ù\"\Ñ\î&…–’\rø\îw¿k¦drn!\0ˆ 4D\0‘ !À¹…H\0 4D8·	D	:;D	\Î-D\0‘ ³D‚†H\0 tv€H\Ð	\0D‚†H\0\ç\"€H\Ð\Ù!€Hpn!€H\Ð\Ù!€Hpn!\0ˆ 4D\0‘ !À¹…H\0 4D8·	—\\(¾ù\ÑG}¼o\ß>³M¼ÄŽzÛ¹s§\Ê\ÏÏ¯\Õm	\"Ag‡H\0\"Á¹\å‘‰Ø»w¯*++\ã\'\Âv\á\Â•——W«¥b.\"\Ñbªü£ }8·‰®D2HDteBÿÿU!Í€±F·•––š\0\ç–3\Ï-·ˆ\"\Û1\"‹H4\Ã\éÓ§%e£>û\ì³ný¼~ýºc:ºS§NqÇœ[N8\Ç:ó\Ür‹H0´†HtšH\Ø\Þ\îÝ»»m±ËŽ;”\ß\ï7·Ý¹(‰\0§[Á\çX \è¶\çXgž[^‰/¿øT}ô\Î*ulg¶ir_žC	Wq\é\Ò%#\0\Ðq\È9VQQ\áù8xI$®T|¢Žn\ÏR‡ÿ4ºA“\ç\ä5\ä‘p\r\çÏŸG$\0:A$Š‹‹	‰\Ä\Ç\Çþ\ØD\"\ìVrlò€H¸‡“\'Oª\Ø\ØXzz€DÎ±Ã‡#‰ö<Õ¢H\Èk\È\"\á\Z\Þ}÷]GOÐô\ë\×O½ùæ›ˆ„‡D\â\è\ëSZ	y\ry@$\\ƒtn			ôô\0HÿþýÕ¶m\Û	D‘@$\Ü\Çö\í\ÛM\'\0GjjªZ¿~=\"\á!‘Y\Z-‰„¼†< ®a\ãÆ*%%…ž IOOW«V­B$<$E‹Z	y\ry@$\\Ãš5k\Ô\àÁƒ\é\é:‘#GªE‹!‰‹ŸQGwLn:¬¡Ÿ“×D\Â5¬\\¹R\r:”ž ™0a‚š3g\"\á±©\Î\æ6	yq@$\\…|J\Z5j==@2u\êT•HxI$®_WEo-i:¬¡Ÿ«rÀ¶ˆ\"\Ñn\æÎ«ÆGOÐH6B²ˆ„7DBV®<U°°\Å\Z	y\Õ-	\×0}út5e\Êzz\02ˆD¤\"qýºú´h·zÿµ	-J„\Ý\ä9–\ì\"\áx&Mš¤fÌ˜AOÐ<ÿüóf\æ\"\á^‘h+Av‘p-2¬1o\Þ<zz€DÖµ$	÷ŠD{²­e\'	DÂ±Hº•ii\0\ËÖ­[Urr2\"\áb‘W\"\ì†H ŽeØ°ajÅŠôô\0KÑ»_$hˆ„gE\"--M­]»–ž ‘?\Ù‘ !®D–\ÇÞ´i==@r\æ\Ì\å÷û	D‚†H¸Ù°K6\î€Ž\ã\âÅ‹ˆD„\"ñ›\ßü\æûˆ\"HtCúõ\ëg\Æo ú\ìÛ·O=õ\ÔS¦\Ð2&&F]½z‘Ë²~/ñ“¦\ï\×j)«\Ñ÷o\ê\Ûúñu}ÿª¾Y·\Ïõýº×­X?þP\ß\×\ÇÒ·tÛ«\ÛNŸ\Ï÷ª¾Ý \Ûj}\Ìrýú3úv–~œ¥oGé–ª[œ>\îüñÿ\Ð\Ï\ß{OBB\Â\ß>üð\Ã±c\Ç.þˆ\"a#\ã¶¤\Çˆ\çÏŸ7»|>\\¥/>jÌ˜1\ê\å—_Vd$\Z‰„Ž\Ñ\é‹øk-u\Èr\á!Ð­R·G\ä\".\Ïõ\é\Ó\ç\Çrq—‹¼~\Ç\ä¢/}\á¡ŸŸ(R \Û|ý\Þ\Ë\êd\áe}»E$BdB?~»N.Ž\ëöa\Ý÷ù(\Ó\ís‘ýúUù¾\"+\"-ºÕˆ\Ä\ØB\Ã\Å‘@$êŽ\î\äÉ“\\\0\Â@:@ùt:yòd“Ý“\á‹Aƒ©…ª\ãÇ 6DB_˜?’‹²€1;cý\\?ýšd\ÞOLLü5ˆ\"\ÑM‘ŽO>E@ûñ–µWdÆ“\\E d…\ØmÛ¶™\Ú\'uC&†2TÑ§OŸŸÖ½t[]ö@†/ž¤\Ø2z­.þ\Ý\î½	‡#\'ñ¥K—\è\á\0Z@Î\r6¨±cÇš¡@‘o{ý•’’¦H\ØÙˆ vQ\ê¤\ÆA\Çø’~ýÿ¸m\ÖFAAú\Ù\Ï~¦\î¸\ãu\çwªŸþô§Q}½+E\"\Ò÷F$JMM9\å\0þ—¨Ù³g›\é\Ñ\"R,9s\æLÓ‘s¾D.R\ÑH\"\ì&5oö\ì\Ùó›nœþù\ãÿ\Ø\Ä\àÈ‘#\êÂ…FH£ùzgg¢ùÞˆ„ƒ?i1%\r@©\Ò\ÒRõ\Â/¨#F\ÔIfffªu\ë\ÖQ$\Ù\"QW\Ü\ØD$¤˜Q\Çþ_ÜºŽ\Ä×¿þuƒ\'Nt\È\ëme	\ì\Çv»\çž{\Z¼W\ã\×\í¬\Ç_ÿõ_›\ï}÷\Ýw›¿w\ã¯G(	‡\"µˆx‘\ê\êjµk\×.5u\êT•˜˜h.b²©\ÖüùóÍ§=\è8‘Ð±Žo!a·+n\ÍH<ô\ÐC&rQ~ðÁM‘®d¢õº¼vûí··)¯¼òŠÚ¼y³¹ÿð\Ã7y]dAQ³‹dÛ¿÷½\ï1´Hü/R4&Ÿ¼\0¼@QQ‘Z¼x±\Z<x°\èøøx5q\âDõê«¯ª\Ê\ÊJ\Ôy\"q¡\r‘vÀ\"!™¯ñ\ãÇ«Ÿü\ä\'õ\Þû\ï¿?j¯\Ëc©ŸhK$\äÿ]šuh\îõ\æ‹¤4\ÎB ‰w\ß}—õÿÁµ\È\âO²ü»t¼\"\r\"C‡U\Ï=÷œ*..&@]\'-\ÕF|iY\Ö	\Ý\Ö\ë¿\Õ`·/‘]XXXŸ]ˆ\Ö\ëÁmQG$\Úó‘@$\ìHnC:×¹s\ç\ÖI\ÊðÓ§OWùùùIv‘i¨\ÒŸWd˜Cj\"ºûPF´D\âw¿ûY\íT\î¿÷\Þ{&’]ˆ\Ö\ë2\ì \ÏIö-77·Õ¡-[¶´8´ŽHH&DK\Ö‘ð²Ç†t´\0N¥¼¼\\­^½ºA‘\ä¨Q£\Ì¯\ìo\ÝO$´@<\ïôE¸\"ñ\Øc™‹½d\r\ä\Â+\Ã‡Š\Ú\ëR\Ëp\×]wµXø\Øøy‘\æŠ-\Ã	x\ÉnPl\é1‘Ø¸q£ù\ä\à$«°g\Ï•­’’’LZ|À€\êé§Ÿ6[uC÷	7\\(XÙ’•-‰:Ö¬Yc\n\Ï\0º3R-¾d\É5d\È#R\ïð\ÄO˜Ô¬\×7ÁB$	D‘\èRV®\\iŠ\ÏÀyœ={Öµ¿›ÈLMYiy‰X¶l™‘\n@$	D‘\è&\È~2ž\ÎB¶¥–ÿU\Ù\ßÁ-\È´2<1p\à@#2l1m\Ú4•——G‘$\"H ˆDwEŠcÆG\ï\æ0‰¸õ\Ö[Õ½÷\Þkn*R)‘\"²v‘\äÈ‘#Õ‹/¾h\n(‘@$	D\ÂÈ´¸)S¦Ð»9L\"lyO\ìN‘	\É*\ÈLùŸ“lƒLÍ”B\ßyó\æ™õL\0‘@$	DÂ\ÈhÆŒôn”ˆ¶ž\ïÈ¢O²øSzzzýJ’&L0‹DQ$‰H 4D\ÂÈ°†|\"gJD\ã\×%CrQ—¹\ä‘\"+\å\Ér\ÓR$)‰<H‘¤,K}úôiþ€H\Ð	·!\ã\ÓRp	Î•›p‡9dgKY‡!ÜŒ†lp•““c6¼’\"I\Ù\0K6Â’\r±dc,\0D‚†H¸\Ù\Ë~ÅŠôn—ˆ`™¸\í¶\ÛÚ™¡‡~ýú=W\ädn)’|é¥—\Ô\èÑ£M¤Jfdd˜\åxei\\\0D‚†Hxˆ´´4S9Î—ˆ\à¯™h\ë\ë8`\ä!x\ã¤\æ¶Ï–\"É½{÷ª™3gš\å\Ô\í\"\É9s\æ˜÷\0@$hˆ„‡EB.Røîˆ\Æ_\ßRfB6ý!h¼\ãÂ…\Í\ë%%%õ‹•\Éq\"RO³a\Ãu\å\Êþ@€H ˆ\"ñò	S6\îgI\Ä-A›\î´6\Ì\Ñ\ÜûlÝºµY‰&CöP‡,.õ3\'Ož\äˆ\"H \Í#\r\ÙJ¢G{\ê\"\ÍD´G$š\ËL¬ZµªE‰°›Ìºˆ\äw\0@$hˆ„‡”µ,MÑ©t\äpF{E\"ø}%\ÛÐš@\ØMv„@$	D‘hrq!u]\ì²…d\0\Úó\é>ÔšˆPDBé˜½{÷V}ûöUƒ\r2\Í\Þ«qc\Ét@$\ÚF¦7sñG$	¤¹ÏŸ?O\ï\Ö\"a7¹`¯_¿>jŽH³f\Íj2›C¦\Ê\Ï&32dõIùYE€\0‰\ÖÙ»woMYY¥VRRR¬E¢\n‘p\èE\ïÒ¥Kôn(v“z”\Æ\Ã\á\Î\ÎG$\ì\ï\×\Ö:,]\rˆD\Û\ìÞ½{f^^^\ígŸ}\Öm/\Î×¯_wŒD\ìÜ¹³Z·¹ˆ„Ãõ‚/t’h©É¢Cöv“O®ò	\Önr¡”U\r¥É¦L2#$99\ÙL1•&«\'\ÊÑ²¢¤\Öe\rY>Y>	\Ë\ÂXÃ‡71Â¬¸™™™i=\Z;v¬I·\Ë\r²ôrVV–\ÙhL\Òõ\Ù\Ù\Ùf(ùD-\ÉÙ³g›Me;jYmqÁ‚f\æ,Ñ¼d\É³\ïƒ,À%C²€’\ì4)\ëh¬[·N½üò\Ëfz£L‡Ý²e‹™Ý°m\Û6µc\Ç³J£lg-…©2urÿþýª°°\ÐÔ—\È\ÚG5KLµYƒ qú\Ãþò\ìŒP[K8i£/@$º3ú\Â7UŠþRRòÝ­I\'}¶ô_\Ýñ\çkÔª\Ü$ž\ËHˆLH+”O¢’•egY¥P\Öô÷™3g\ÌER.–Ç7O¹ˆ\Ê\ÅT%’‹«,Z$[¹\è\Ê?¯L+•‹±\\”7o\Þl>\Ë\ÅZR\é²2¢\\\Ä\åb.ÿðrq—‹ü²e\Ë\ÌE_.þ²¦Áüùó\È~ ²\0’\\|E\ZDD\"D&&Ožl\äB$C\Úøñ\ã|Œ3ÆˆˆH‰È‰4‘‘‘‘‘i\"6\"9\ÒDxD|D‚D†DŠDŽD\0dÿˆ`y™\n–+9q\ÛS\Ðh·{î¹§Ý™‡h‰„Ð«W/s\ÌÙ³g¹²\"\á2zö\ìùMÝ¿Ü>†h à¢¡\r«\Æ\Ã\Z­\r3tdF‚¢J@$Ü‰\ß\ï\Å\îwúô\éóS\"‚H€\ÃEB2’¡iŽÎ®‘°÷\â`X	wbYV\Ýjƒú <¢‚H€CEBV†\Ì\Ï\ÏoóøÎšµ\éV\ã\0ˆD÷G÷=‡}˜©–¡\"ƒH€ƒu3«öÌ¦ˆD$¤%”÷@$œGll¬\ÕÜ°ª\ß\ï\Ï :ˆx\0»v¡=û[\ÂX\ÙRŠN	Wg#.5\'–e}Dt	ðµ\×ˆ„\ë%bEk3\Äü~ÿ¯‰\"\ËLt\Ô\îŸ\0ˆ„»Ð’p·\ÔB´&–e½G¤	ðXf\"’š$	\ï\àóù\ÆhY(\Õ\íKŠF³6\ìv“¢KD\ÈLDux\0‘p/Z&D,ž“L)¶Ô\ç\Ê\ÔP\"ƒH€3¡Hˆ\Ô\rw\\òù|ƒˆ\"P¿ˆT[\Ã2Å“\ÂJ@$ ®øòº‰G‰\"Ð®Lƒ]SD\0\"u\"Q\ÃòØˆ@»d\"”õ\'\0	Ïˆ„\êÛ·ï·‰\"Ð¬L\Ø\Ò\Ð\Þa\0D\ÂSõw³ó\'\"\Ð\"v\â`O@$ ¹l\Ä}2Ý“H \0­f&\äˆ4Æ²¬¾º¸F$	€V‘\0@$ 1>Ÿo„\ß\ï¯ ˆ\0\"ˆ„L ˜£û‡Oˆ\"€H\0\"\á\ÔH\äZ–u‚H \0ˆ ŽHl\Õ\"±ŸH \0ˆ ŽH\ì™ ˆ\0\"ˆ„#\Èð‘@$\0	@$ d,\Ë*‘\Ý>‰\"€H\0\"!\ã÷û?\×m‘@$\0	@$ œ¡k±±±‘@$\0	@$ ‘¸iY\Öÿ!ˆ\0\"ˆ„#µ²q‘@$\0	@$ $øg\ìü‰H\0 €H@XX–õ\Ý7\Ô	D\0‘\0D\Â\ÖxD·*\"H\0 €H@\Èø|¾A~¿ÿ2‘@$\0	@$ dÀ4\Ý7”	D\0‘\0DÂ©‘X\æ÷û?$ˆ\0\"ˆ„Œ–ˆW´L¼G$	\0D	§\Ø2_‹\Än\"H\0 €H@8CGt[O$	\0D	\'#qV·ED‘\0@$\0‘€pD\â‚n‰\"€H\0\"\áˆÄ—~¿?‰H \0ˆ 2Z\"n<þø\ãÿA$	\0D	\'#Q›˜˜ø#\"H\0 €H@¨\Ü&ýÂ”)S¾F(	\0D	‰øøøZ–UK$	\0D	§>\â\Ý/\Ü ˆ\0\"ˆ„S/³6ˆ\"€H\0\"!\ãóù\Æûýþr\"H\0 €H@\ÈX–õŒ\îŠ‰\"€H\0\"!þ û…£D‘\0@$\0‘€pj$v\êö&‘@$\0	@$ dü~¡\Ï\ç\ÛL$	\0D	\'#Q¤\Û\n\"H\0 €H@8\"ñ©n3‰\"€H\0\"\áˆ\Ä%Ý†	D\0‘\0D\Â‰\ë@\à1\"H\0 €H@8Å–5Z$~F$	\0D	\'#¡~ø\á¿ ˆ\0\"ˆ„Ä£>ú]\éˆ\"€H\0\"!û/ºO¸I$	\0D	gX\ãq\Ý*‰\"€H\0\"\áZfX–UA$	\0D	-³uŸð	‘@$\0	@$ œ¡t;I$	\0D	Ÿ\Ï÷ª\ß\ï›H \0ˆ NFbŸnÛ‰\"€H\0\"\áˆ\Äq¿ß¿†H \0ˆ ŽH|\ìóùž&ˆ\0\"ˆ„#Ÿ\ë–I$	\0D	G$®ù5D‘\0@$\0‘€±,«:..\îWD‘\0@$\0‘€p2µ			K$	\0D	‰ž={~“?	\0D	‹\Ø\Ø\Ø{ü~\r‘@$\0	@$ dÀi‘¨\"ˆ\0\"ˆ„S1À²¬\ËD‘\0@$\0‘€pDbŠnŸ	D\0‘\0DBÆ²¬¥º}D$	\0D	ŸÏ·Q÷‡ˆ\"€H\0\"!\ã÷û\ß\ÐýÁ\"H\0 €H@85‡µL¼L$	\0D	\'#qÆ²¬\ÅD‘\0@$\0‘€p2eºe	D\0‘\0D\Â‰+–e¥	D\0‘\0D\Â‰Z$~C$	\0D	-µºõ ˆ\0\"ˆ„\Êm\Òô\í\Û÷„‘\0@$\0‘€P‡5þ^·Z\"H\0 €H@\Èø|¾ûu_PM$	\0D	¿\ß§û‚«D‘\0h•\Ô\ÔT#­µ~ýú(@$¼7´1V·‹D‘\0h•üüü6Ebýúõ\n	\ïe$\æ\ëóÿ‘@$\0\ÚdÀ€-JDbb¢ªªª\"H€HxË²^\Ò\í‘@$\0\"\ÊJ¼ô\ÒK	om\ìÐ­€H¸X$\äS\âÆ\Õ\äÉ“\Í\'Ê¸¸¸€@  RRRÔ¤I“\ÔÊ•+\ÕÕ«W\éi Eš«•\Ú²€Hx6#ñŽ\ß\ïÿ#‘p¡H«©S§6‡¶šˆEff¦:q\â=´++Am ž®‘8¥\ÛóD\ÂE\"!ŸgÎœi„ h®I–‚4fÐ Ad#\0‘\0{h\ãS-³ˆ„KD\âÈ‘#¦co,ƒVË–-Sû÷\ïWŸ|ò‰ª¬¬4\Ç\ËmYY™z÷\Ýw\Õ\ïÿ{•‘‘\Ñ\äk\ã\ã\ãÕ\è} ž]»v\ÕÿÈ°\0\"\ái‘øÂ²¬¡D\Â\"!{\ãaŒÑ£GI¸yóf»\ß\çÐ¡CjÂ„	\r\ÞG\Û&\ékh€]+A6	\Ï\×H\\÷ù|ÿC$.\"ÁC±±±jË–-!	Dc^{\í53¥±ph©•\èÝ»7\0D‚Œ\ÄM\Ý\î%	\Îq\Æ8u\êTTN¸³gÏª¡C‡6\ÈL0\Ì\ÂSO=e:d©£@$<-ò¡ó;DÂ¡\"!i\å\àš‘©yˆ&ò~Á2!5`\"·\Þz«º÷\Þ{\Í-2ˆ„7\éÛ·\ï_\ÉuH8X$dvFðpF´2\Íe&‚‡9žx\â	z#K„-Ó¦MC&\0‘ð®HüB†6ˆ„CEBÖ‰®‹šˆŽDj&‚\ë%dH¼-m=€H¸}\rê­¯•DÂ¡\"!‹M\ÏÎ¸q\ãF‡Ÿ€cÇŽ­ÿž²h _—\0\"\á\rdÚ§Lÿ$	©ž\ê)S<;\ÉB¯€YQQA¯„D\Ô\Ã0 \ÞB¢\Ò×ƒóDÂ\"!\Ó0ƒ,#™\æ*Á‹V\É\Þ­±zõjd\Ã#,·\Ýv™	@$¼!\Ï\ëkÁI\"\á@‘\r¸\ì‹ùŠ+:õ$\\³fMƒ%´›Ë–,^¼\Ø\Ì\îcØ³\Ã;üu\"d&\0‘p7º\ß\"›v	Š„\ì\âi_\Ìe\Ù\ë\ÎD†Q\ìïœœ\\ÿ|yy¹š7o^ƒ5-	\ïID\ã¯\'3ˆ„«E\â-\ÙFœH8P$‚\ë#>ýô\ÓN=	e]‰\à:	©›\áY¬ª¹¿Xs\ÂùQSSc¶š—\Û\Öh|5€H¸¾\Øò˜\î\ç\×	ŠDð…\ÚÞ€«³\ï\Ê¢\à|‰\èÑ£‡\é|\å¶%™h\é82€H¸:#qNˆ\Ì!‰® ‘HOO7™¢*YM™2\Å,¤%\Ã ‹-R\Ï=÷œ\Ê\Í\Í5¤²\ÆÎ;UAA:xð :yò¤*))Q/^ds¨.\ZÎC]\ÇÛ¢LK„\Ýµa\0D¢ÛŠ\ÄEŸ\Ï7†H‘ˆ(#!…•w\rn«V­RK—.Uó\ç\ÏW³g\Ï6ŸL³²²Ô¸q\ãÔ¨Q£\Ôð\á\ÃÕ!C\Ìn’r\ÑJJJR			\æ=e\èD†L‚‡M\ì\Çòš#\Ç\Ê\×\È\×\Ê{\È{\r6Ì¼·|¹xegg«\'Ÿ|R\å\ää˜Ÿ÷ù\çŸWk×®5[`oÛ¶M\å\å\å™=Dd˜\æô\éÓª´´T]¹r¥\ÍT¾\Û%¢%I–‰¶^·a˜	WŠ\ÄU\ÝD‚\Z‰h\\#!H¶@2=´!\ßG²’¥l…d-${!Y\ÉfHVC²’\ål‡üL’ý,ˆdC$+\"\ÙÉ’¤¥¥™¢\Õþýû›ýJd–I°¼4\ÞF]ž—BR9N–—¯y4h\ã³.meZ’…\ê\ê\êvIDð÷a6 ®‰jŸ\Ïw?‘p Ht\ÇY‚\Ì\Ü3fL\Ñp*rA”bQ‘§3gÎ¨£GšÌ…d0$“±i\Ó&õ\ÒK/9:\ë2kÖ¬ve\nš“‰o|\ãí–ˆ\Æ2A\Í ®(¶¬\Õ}\Ö\ß	ŠDw^GB•\ì*A\è¾Y\Ý	˜\Ö\ÞAs2ŠD0\Ìˆ„{\èÙ³\ç7\ëvþ¼h8P$\äSpW­l)Ÿ®Û»²¥tOdGWù_»\çž{Bú:\Îhœ‰\Çò|(ô\ê\Õ\Ë|­ü\0ˆ„#³=ôu †H8T$\äSkðÎŸ\ìµ\á\ê\Ô\Ìhg$dX\0‘p¬HüF_ªˆ„CEB4vðîŸ‘•˜0a»ºT&:«F\ÂÞ‹ƒa\r@$/)úZp…H8X$Š‹‹\è\ÉøyGò\Úk¯5˜\É \Ù	ð†LDs\Ö‹S\"\áÀd}-(#	!¸\èR¦&ž:uªCN<Ç–b=û{I6\Ü\'\ÍÍ¦ˆ\Ö:R \Êl\r@$\\%Kô‡\Ù3D\Â\á\"!S\í]6\í\ÂK™ªM\äýd€ý=\äû±†;±k‚/ö\Ñ\\\ÙR¦« \î@_6X–uˆH8\\$Y xˆCd\"Z™	\ÉDK„|ù~\àaŽhíµD\0\"\á:‘Ø£[‘pH›7on 2\Ì!5‘`JMDðp†4Y\Ã\0¼“™–	\É0´g÷\Ï\à\ãX/	W‹\Ä!\ÉJ	—ˆDs2a\Ï\æ8t\èPH\ï#E”²*c\ã%¢‘\ïe&\"©i@\"\0‘p7–e}¤\ÛR\"\á\"‘°‡9‚k&‚‡;d\Ìw\Þy\Ç\ì\Íaoô%·R!²!+V/6\\Áp™‰H†G\0	WŠD™¾FL!.	A\n!ƒgsD\Òdv…•d&B‘$	\Ïm\\\Ñm\0‘p¡H\Ø\È:²r`ð\n˜\íir¼,6%{<\0Ø™‰ös\ÈO\n+‘ðŒHTõ\í\Û÷?‰„‹E\ÂF–Ó–½9$K!8oAn‹ƒ\ì\â)Ÿ e\ï–½†p2\rvMˆ„7ðûý5}úôù1‘ð€H4f\ëÖ­õ±c\ÇzˆX&š[\0‘p}FB\É DÂƒ\"!\Ù[$d±!€pdÂ–†ö{\0 \î!!!\áoõ5¤–HxP$6n\ÜØ¤&‚¬„Šx\à\Ø\Å	oküÚ²¬j\"\áA‘HJJj\"©©©ô,VfBþ@$<9¬\Ð\í\Z‘ð˜H¬^½ºÅ™\Zûö\í£w‘ÿ)\æ@$¼…\Ï\ç£\Ïÿ‹D\Âc\"\Ñ\ÜBUv“ý4\0BEV<½t\é\0D\Â{\"ñ´>ÿ?&	™þ\Ù\Öú¬^	\áˆDyy9\0D\Â{5k,\Ë:F$<$­e#‚—\ÑU$JJJ Þ«‘Ø®\Û>\"\áÁbK›“\'Oš…¨\0\"Aþ‡Îœ9C \0‘ðžHðù|¯	‹\Äñ\ã\Ç\ÍV\ã\0‘Š„H)\0\"\á9‘8©\ÛD\Â\Ã\"![…#)ò?$ÿK\0ˆ„\çD\â¼nO	‹„l\È%{n\0D‚\Ô\Þ@$<†eYZ$†	‹„tþr\0ˆ„„„\Ö DÂ›‰\Ê@ Ð›HxX$ö\ïßH@\Ä$&&ª¼¼<ˆ„÷D\âfll\ì¿	‹DAAù4		²\äúÎ;	 \Þ	õè£~—HxX$òóóU¿~ý\èQ \"ú÷ï¯¶m\ÛF \0‘ð‰‰‰\ß‘ ‰={ö˜´4@$\È6ô›7o&€Hx+q¯n5D\Â\ã\"!\éhIKDÂ€Ô†\r \"<fY\Öu\"\áq‘Ø¾}»IKDÂ Aƒ\Ì>.\0ˆ„§2Ctû‚Hx\\$^}õU•œœL1d\È•››K \0‘ð–H\Ì\Ô\íS\"\áq‘qm\ßˆ„¡C‡ª\çŸž@\0\"\á!|>\ßJ-ED\Â\ã\"±i\Ó&D\"føð\á\ê¹\çž#€Hx¿\ßÿG\Ý\n‰„\ÇEB\n\ä¤P FŽ©ž}öYˆ„·†6\n,\ËzHx\\$Ö¯_¯RSS\éQ \"233\Õ3\Ï<C \0‘ð–H\Õ\"ñ‘ð¸HH¥½T\ÜDÂ¸q\ãÔ¼yó \Þ‰b¿\ß?ŸHx\\$^|ñE•––F1q\âDõ\ä“O@$¼%\å>Ÿo<‘ð¸HÈ”=™º	“&MR3f\Ì €HxË²®j™ˆ\'‰U«V©ôôtzˆˆ©S§ª\ì\ìlˆ„·2\Õ~¿ÿ\"\áq‘X¹r¥Y\0 $!Y	\0D\ÂS\"Q›œœü\"\áq‘¹ÿ²\0@$H}„\ÔI\0 Þ oß¾ß¨\Ûùó6¢\áq‘Xºt©\Ê\ÈÈ Gˆ2s\0‘ð‰‰‰?²,«–H jÑ¢EjÔ¨Qô(²†„¬%€Hx¿\ßÿn7ˆ\"¡,X FM!«Z\Ê\ê–\0ˆ„g\ê#ú\ëö%‘@$TNNŽ\Z3f=\nDÄ²e\Ë\"D\Â[\"‘¥\Û\"H0¶\rQAvþdö \ÞÁ²¬\ÅZ$\Î	DBÍ™3GM˜0\"‚…\Í\0‘ðœH¬\×\"q˜H LÛƒ¨Àž-€HxN$vûýþ7ˆ\"¡fÎœ\ÉBB1lGˆ„·\ÐqP·Wˆ\"¡¦OŸ®¦L™B±yóf•’’B \0‘ðN±\åiË²–	D\Â\ì û$\0D\ÂÖ­[Urr2\0D\Â;\"ñ™‰©D‘`³%ˆ\n;w\îTIII\æ~EE…:q\â„*..&0€H¸wh\ã²n©D‘0\Ã\Z2¼\Ð^D\â\ã\ãUll¬\Ò‰’õö›kdº\0‘puF¢*ü‘@$L¡¥\\„\Â\äÉ“[i\"\å\å\å\n	÷ŠDþ0q‘@$\ÔO<¡fÏžM!g%ô§‘EBþ¯\0	W‹„\Z8p\àŸ	DB?^Í;—BFVEmI$ÎŸ?O€\0‘p)½{÷þk}ž³ó\'\"ñcÇŽUO?ý4=\n„••h®F‚%\×‘p7qqq¿\Ò\çz5‘@$²ó\çüùó\éQ ,V®\\\ÙD$ö\í\ÛG`\0‘p1±±±–\æ\Z‘@$™™™j\áÂ…ô(62ƒÃ–ˆÁƒ@$\\Ž\ß\ï¥\Ï÷Ï‰\"a9r¤zö\Ùg\éQ ld1*[$\ä>\0\"\án,Ëš«\Ï÷‰\"a\È\È\ÈPK—.¥GˆHLL4õ\0ˆ„û\Ñ±Z·ˆ\"a>|¸z\î¹\ç\èQ \"6n\Üh2\0ˆ„\'2¯\éó}‘@$C‡5sÐ½9w\îœ)bÜµk—zýõ\×ia4Y\Æ;??_ñˆDd5o\ëö\'\"H\Ò\Ó\ÓÕªU«\èQº¹D\ìÝ»W•••©ªª*Z\íÂ…*//O:uŠ,@$\Â\ÏHœ\Ð\"ñ{\"H†¢rss\éQº1’‰@\"¢+’\Ù@$Â®‘øD\Ë\Äl\"H\Ò\Ò\ÒÔ‹/¾HÒ‘‹\Ý&C\0ˆD\ØCºe	D\Â0h\Ð õ\ÒK/Ñ£tc\ä¢\Ç\Å‘\0D¢e$*-\Ë\êK$	CjjªZ¿~==ŠD\â\Ë/>U½³JÛ™mšÜ—\çD‰(‹\ÄM\Ý\î#ˆ„a\àÀjÃ†\rô(‰+Ÿ¨£Û³\Ô\á?n\Ð\ä9y\ry@$\0‘ˆ¢HÈŠ¶\ß\'ˆ„aÀ€jÓ¦Mô(‰ý±‰DØ­\ä\Ø\ä‘\0D\"*<üð\Ã!\"A$‰zRRRÔ–-[\èQ.\ìyªE‘×D‰hÐ§OŸŸúýþ\Z\"HÔ“œœ\Ìþ.‰£¯OiQ$\ä5\ä‘\0D\"\Zø|¾Gcbb®	D¢žþýû«\íÛ·Ó£ ˆ \Ð&~¿°n—ˆ\"QORR’Y:œ-2K£%‘×D‰(‰\ÄtË²J‰\"Q\ìÚ¸g\Ïz‡‹DQÁ¢EB^C	@$¢ALL\Ì\n\Ý>$ˆD=ýúõ3³E\â\â\'G\Ô\Ñ“›k\è\ç\ä5\ä‘\0D\"J\"±I·w‰\"QOBB‚*(( Gq¸HH;S˜\ÛD$\ä9\Ä‘\0D\"Š\"±W·D‘¨\'>>^\íß¿Ÿ\Å\é\"qýº*zkI\Óa\rýœ¼†< €HDË²\Þ\×\"±ŽH \rD¢°°\ÅÁ\"!+Wž*X\Øb„¼\Æê–ˆ Q\ÊHë¶H õ\Ä\ÅÅ©ƒÒ£8Q$®_WŸ\íV\ï¿6¡E‰°›#Ç’@$\0‘ˆ¿\ß_&	D¢H9r„\Åa\"\ÑV‚\ì\"ˆDe$¾ôù|ýˆ\"QOll¬:~ü8=Š\ÃD¢=YˆÖ²ˆ\"ˆDü@‹\Ä\r-ÿ—P \rD\â\äÉ“ô(‰p%\Ânˆ\"ˆDˆŒ‘xi‰¨ÿ!\á@$\ê	\êô\é\Óô(N¬‘ !·\ß~;\"\Ñ~‰¨½õ\Ö[\ß\Ó\"¡¾öµ¯M#$ˆD‘(..¦GA$	ðòð\Û\ßþV\Å\Ä\ÄHLLü—›\Ö%B·©u³\Z=¯‹„\ß\ïW%%%ô*ˆ\"ž\ã\Î;\ïT².‚nµº/|#!!\áo¹\ì´*m=^‰\Ò\ÒRzD‘\0\Ï\ÖH\è~ð\×111Eº\Õ\èûzô\ÑG¿\Ë\å§MY°_ŸH¨	U^^N‚H \àY‘°\éÛ·\ïj™8§\ÛMË²\Ö\ë\Ç\ßF\"Ze\"™	DÂˆDEE=\n\"H€\çE\Â&66\Ö\Ò2Qªe¢Z÷‘\Ïk¡øÑªLÔ™ð°H\è“E]¹r…‘@$\0‘h„\îh‘ø\\\ßVi©xF?u\Ñ\â\×Õ™ð°HH\Ç\nˆ\"ˆD‹B‘©\Û\Ý*À4$‚š	D¢‘H\Ô\Ô\ÔÐ£¸X$:d¦ùþùŸÿ¹úú×¿nn{õ\ê•r]Glš¼÷\Ïþsµk\×.D\\%6\"\"uR‘\éb‰\Ì\Ëòvd`\ZGÍ„\×D\âÒ¥KF$\æÍ›‡L¸T$dgW‡ü\ÇT\ï½÷žy\îÄ‰*111ª\"!÷÷\î\Ýk\îÿð‡?D$À•\"a_<ý~ÿ|\î¨ö\Ð\ÕŠ\ä\ä\äDY\"N\Ö\Å\æd+2\Ñ\Òqd&¼–‘8zô¨\êß¿¿JJJR‡¦gq™Hô\ì\Ù\Ót–;v\ìh—4÷xÝºuF\êVlõX¹\Çw\Ô?–©\Å			\ê[\ßú–yþ¡‡RgÎœQ/^4\Ïõ\èÑ£Á\Ï\"enÿ…	\è®\"aL)Ä”‚L-ŸIfW](Djda­0„¢¹\áŒ\åÁ™\Æd\"X\"\ì¶,Š\Ã$\à$‘$‘““cfpÌ™3‡ì„‹DB.\ÞòTYYÙªHˆ$´$ù—i.ú’\ÝhMB\Þx\ã\rsÿ‘G©]2ò\\AA\ÙN\î\ßw\ß}æµŒŒóxÛ¶m\æ±ÈŽ<–\ç\ÉH@w‰ ¡ø¶L•)£2u4üWˆ„ÈŒ,®U«ow\ê¾ü\îj\"š“„`™h\ëõ[\æð H\ØHG¯\Ötþ¤—ñHg\Z‹\Ä\Ýw\ßm^—¬Ä°a\Ã\ÌÿIs5ö°†\ì\Ý\Òøû7[ZŠŠŠ\Ì}»^Cn\å±<H€SD\ÂF±’Å¬dQ+Y\ÜJ¹\êD‘\ï©\ìV\'+zö\ìù\Í0+[’…¯µS\"˜\Í\áU‘°³.4Ù‰Y³f©\ê\êjzm´öv¡¤\Ü\áh,P¿û\Ý\ï\Ì1òüü\ãf¥#33\Ó\ÜðÁ›ˆ„\Ô\ã4÷½ûô\éS?ô\"·ò˜\Z	p¢H\Ø\È2\Ûú\"ž\'sY~[ß¿·DBµ\Ðd\Ècb˜³3š“‰ª$¢±LP3\á‘°‘­\ÅSRRLvBR\Ú\àL‘K)¶”L=4!Å–R·`ó½\ï}\Ït\n’	\È\Í\Ím\"v“\Í\Ý\äy9¾9‘õH${!\í™ö\Ð\ÆØ±c›ýù\ì\áû\ëd¤½µ-ýœˆt¥H\Ø\ÈF`Z$g	ô4\É\ÜÔ·7ô\ã\ëúþU}ÿr]\Ñ\æ\Ý\Î\ëV¬¨o\ëcI\íƒn{e\È\Â\çó½ªo7\è¶Z³\\Ö¶Ð·³Z	»]\Ó_û¤þ±Æ†8\ÜÐœL„\"sxY$l/^l²Ó§Og½	Š„´#GŽ¨¸¸8#2t ·?üpý\ë/¼ð‚ºë®»št/\ØòµR¹yó\æ/\æ3f\Ì0\ï¿ÿ~óXŠ*\Ü\äýƒ>™2*\Ïýò—¿©‘€\î,A5¥Ï·¿LEŸ>}~¬/\ê÷=þø\ãÿ\Ó}kœn©ú\"?B2\"2#DÂ²:YxY\ßn‰™Ðß®“‹ãº‰l\×\ÉG[\"¡z÷\îmÿ¾\ÇBü¾\ÖL&¢ª\îùPx­\îkÀ¥\Ýc\"!È˜÷€T¿~ý\Ôþýû\é}&4DºN$:©F¢%øX\ËGF3\Ã\Z\ífˆvFb—uŠ„Í²e\ËLv\";;›\ì\"H\0\"\Ñ\r\ZÂ²¬÷|>\ßÿ„Yh\í\Z‰‰\\\"\r5\0RSS\Í»Œg\"H\0\"Ñ¥\"ñ\ë:\â\Î÷t\ëÑŽ/\ë\ÌY,N…H4\Ïò\å\ËMvbÊ”)¦\Ò	D‰Î§OŸ>?•Y\"a.F\Õ\ÜlŠh­#\Ïl\rD¢M¤ŠÐ A*>>^\å\ç\ç\Ó+!ˆ \Îbb3ƒh®l9—\Ë8\"\Ñ.V­Ze²YYY\ê\êÕ«ôNˆ\"ˆ„sè¨½6D\"4JJJTZZš\ÉN\ìÙ³‡\n‘@$\0‘p^f\"X&–\ÝÒ¾\Ý?ƒc½D\"rdA#Ù²z\âÄ‰d\'	D	ge&\"©i@\"‰\èqþüy5d\È³\ÒÎ;\é­	D	gf&\ÂD\":¬]»\Öd\'Æo–OD‘\0D\Âq5H\"Ñµ”––š#ccc\Õö\í\Û\é¹	D	gd&\Ú3\ÌOa%\"\Ñi¬[·\Îd\'ÆŒcv‚D‘\0D\ÂÑ™	»¦‰@$:²²25|øp“Øºu+½\"H\0\"\áL™hný	@$:\r6˜\ìDff¦ª¨¨ 7C$	@$º¿LLq\Ø‰Ž¥¼¼\\edd˜\ìÄ–-[\è\Ñ	D‰\î]3!2‘w»x\"ÝM›6™5j”ºxñ\"=[3\ìÚµ‹‹?\"ˆD—g&,\ËRH\"\Ñ-‘¡±€†\ìÝ»\×Ô— \0\Ñi2“H\ä\0‘\r\Ùe´oß¾\ß&ˆD·E†8D&d\ÈC†>\à+NŸ>­òòò\ÔgŸ}†DI\"N:\Å? ¡‹Dm\ïÞ½ÿšH \Ý\Z)¾”\"L)Æ”¢Lø_™Ø½{·I\Éw\×&·u\çŸO\ZˆDD\"QcYV\"H8™*\Ù	™.*i}\è\ÞÈ§}I{ ®‰›}ûöý‘@$ƒ,\\5v\ìX“­ û\"K #€H¸^$ª}>\ßýD‘p²´¶d\'d©m\ã†\î‡\Ì\"€H¸^$ªô»ÿ\"ˆ„c?ñ\Ê\æ_’X³f\r\éfˆ\àI\0\"\áj‘¸fYV_\"H8\ZÙ–\\¶\'—m\Êe»r\èœ;w‘\0D\Âý\"ñ¥>Ï“ˆ\"\áx®^½ª&Nœh²¹¹¹¤ ³J\ä\ï€H¸Z$.\é6„H ®A\ÖVˆWiiiª¤¤„€t!\'Nœ0u,\0ˆ„«E\â¢n™D‘p]v\"++Ë¤\ÕW­ZE@ºˆ#GŽ €H¸Ë²\ÊÀd\"H¸’7\ß|\Ód\'\r\Z¤Š‹‹	H\'SXXh\â€H¸:#ñ‰nO	DÂµTVVª)S¦˜\ì\Äò\å\Ë	H\'²ÿ~D	÷‹D±eY\Ï	D\Âõ¨„„•ššªÎœ9C@:)#$1@$\\-\êjË‰\"\á	d\É\æ\ì\ìl“X²d	\é`d‹\Ä\ÄDˆ„»E\â\Ýr‰\"á¹”{¿~ýÔ€\ÌE\èv\ìØ¡’’’ \î‰Ã–e­\'ˆ„\'³Ó§O7Ù‰Å‹\à\ÕW_U\É\É\É	£%\âÝþ‘H žEfHú=%%E<y’€D‘M›6™¬\0\"\á\êŒDn;ˆ\"\áiª««Õ¬Y³Lvb\áÂ…ª¦¦† D\r6 €H¸?#±[÷o	D44\Ù	I\Ç?~œ€D\ÈK/½d\Öð\0@$\\-¯\Å\Ä\Ä\ì#ˆ\Ô!Ùˆ9s\æ˜\ìDNNÙ‰X½zµ\Z<x0\0D\Â\ÝC›t{—H ÐˆÃ‡›ýû÷WG% a Ë“§§§@$\\L øƒeY\ï	DZ\ÈNÌ›7\Ïd\'\ä–\ìDh\ÈJ¢Ã†\r#€H¸;#ñ‚n\'‰\"­ 	\ÉLH†B2\Ð>–.]ªFŒA \0‘pwFb‰eY	DÚ‘š	\ÉNH\rÙ‰¶Y´h‘\Z5j\0D\Â\Å\è>1G·‰\"\íDfsÈ¬™\Ý!³< e\æÏŸ¯FM \0‘p÷\Ð\ÆL\Ý>%ˆ„˜õ&$;!\ëO\È:\Ð©+7n\0D\Â\Ý\"1Q·D‘€0•0eEL\ÉN\È\n™ÐÙ³g«\'žx‚@\0\"\áb|>\ßý¡\ês\"H@\È^’½;døŠ™3gª¬¬,ˆ„»k$Ru»L$	ˆ\ÙET–ƒ–]EewQPjÚ´ijÊ”)	wm\Ä[–u•H %–-[f²\Ù\ÙÙž\ÏNˆDˆL\0 \î%ô\Ö2QI$	ˆ\"gÎœQ©©©*!!Ax6“&M2\Ã\0ˆ„{±,\ë7Z$ªˆ\"€¬\ì(\Ù	ùd^YY\é¹\ß_\n-¥\à\0‘p/qqq¿\Ò2QM$	\è Š‹‹\Í˜ñññ*??\ßS¿»Lý”) \0ˆ„{\éÓ§\ÏOõ¦\Z\"H@#XIvBf1\\½z\Õ¿sff¦z\æ™gø\ã\"\ábô‡¤\Æ\Ä\Ä\Ô	D:’’•––f²{ö\ìqý\ï+\Ëc\Ë2\Ù\0ˆ„«E\âûZ$ˆ\"Inn®\nj\âÄ‰®\ÎNÈ†]K–,\áˆ„‹\éÙ³\ç7	Dº€ó\çÏ«!C†¨¸¸8µs\çNWþŽC‡U+W®\ä\rˆ„\Ë‘˜2e\Ê×ˆ\"]ÀÚµkMvbüøñ\êÊ•+®ú\Ý\Ò\Ó\ÓMm\0\"\á~‘\èÛ·\ï_	Dºˆ\Ò\ÒR5l\Ø0«¶o\ß\îš\ßK\êA^|ñEþÀ€H¸Ë²j“““@$	\èbÖ­[g²cÆŒQ—.]rü\ï#\Ó^\åw@$\\Ÿ‘¨\Ñ„\î!ˆt\Ê\Ê\Ê\Ôð\á\ÃMvb\ëÖ­Žþ]d\ï‘\r6ðGD\Âý\"qS·ûˆ\"\Ý¹\0KvB\Öb¨¨¨p\ä\ï [¬oÞ¼™?& .\Ç\ï÷\ßxüñ\ÇÿƒH \Ð\Í(//W&;±e\Ë\Çýü\É\ÉÉŽÏª\0\"íª‘¸®?ø<F$	\è¦lÚ´\ÉÈ„,ðtñ\âE\Çü\ÜIIIjÇŽü‘pÿ\Ð\ÆU\ÝD‘€nŒ„ˆ„…ˆ…HLLô\Ä\nž€H 1W,\ËJ!ˆ8\0\â™!ú\è.\È\æd\'NœhP\ÏÑ¯_?µw\ï^þh€H¸h£B\Ë\Ä0\"H€C‹µaJ1fw™!?,J\Ó\\“\Í\ÊD~d¨\Ã+–\"\á±b\ËrŸ\Ï7žH \à0¤Q.\Ð2]T¦v%§OŸnQ$ì–““\Ã\r	wf$Jõ›iD‘\0\"W;\Öd\'ºzñ\'YH«%‰Ÿl ®­‘øX\Ë\Ä\\\"H€ƒ‘¥µ%;!KmË’\Û\Ý-+A6	W‹\Ä-‹‰\"G6ý’Í¿\ä\Óÿš5kº\äg­\Ã\ÉF\0\"\á¹\Z‰S>Ÿo%‘@$À%È¶\ä²=¹lS.Û•w&h\"Ë–-\ãˆ„»k$Ž\és}-‘@$ÀEH`\âÄ‰&››Û©\ß[6\ë²%\"!!AUUUñD\Â\Ý‰ƒ>Ÿo#‘@$À…\ä\å\å©øøx³¥wIII§|\Ï]»vÕ‹\ÄÚµkù#\0\"\áþŒ\Ä~-\"ˆ¸8;‘••e\ÖsXµjU§|\Ï\Ô\ÔT#NZ\Ò\0‘»\Ør¯n»ˆ\".\ç\Í7\ß4\Ù	z•(;’üü|Õ»wo†5\0‘ð†H\ì™ ˆx€\Ê\ÊJ5e\Ê“X¾|y‡}Ÿ§žz\ÊtÈ“&M\"\è€H¸Ÿ\Ï÷ª\îS\Þ&ˆxˆ‚‚S)CgÎœ‰ºD\Üz\ë­\ê\Þ{\ï5·\È ®\ÏHl\Ð\í‘@$ÀcÈ°Cvv¶\ÉN,Y²$ªa\ËÃ´iÓ	@$\\Ž\îC\Ö\ÈP\"H€GÙ¿¿Ù©sÀ€fu\ÊhID[\Ï ®\ÉH¬Ð­ˆH \àñ\ì\Äô\é\ÓMvbñ\â\ÅQ“ˆÆ¯K†\0‘pH,’e²‰\" \nUbb¢JIIQ\'OžŒŠD\Ø0\Ìˆ„;	s,\Ë*!ˆ€¡ººZÍš5\Ëd\'.\\¨jjj\"–ˆ`™¸\í¶\Û\ÈL\0\"\á\"´DL‰‰)%ˆ@<h²\É\É\É\êøñ\ãKDð×‰L™\0D\Â5Ccu+\'ˆ@$1g\Î“­À\í\ìD¤”\ÔL\0\"áªŒ\ÄP-_	D E>¬’’’TÿþýÕ„	\ZH„È…\ÔT´6\Ò\Üq\ÔL\0\"\á\Z‘H\Ñ\"q…H \0mŠ€ˆ\Äoû[5~üøú\çzô\èa:_¹mI&Z:Ž\Ì \ÎÇ¯\Ñ\"qH \0\í\ZŽ°%BC]\ÇÛ¢LK„\Ý\Ø\ä}\ÉL\0\"\áL|>ß£Z$®	D M‰h|±oN‚e¢­\×m\æ\0D\Â\Ñ\"ñµH\Ü ˆ@HÑ–L\È4\ÒöHDð÷a6 \Î#66ö_´H\Ü$ˆ@\ÈÑšL|\ã\ßh·D4–	j&\0‘p”H\Ü\ã÷ûkˆ\"–D´&¡H\Ã€H8“˜˜˜¿×­–H \0õœ={\Öt¨÷\ÜsOH_\'\Ã3òXž…^½z™¯•Ÿ\0‘\è\Þ$&&~G‹qC$\0š\ÏH´w˜!\Ú‰q\ã\ÆñG\0D\ÂÜ†H \0\roD«F\ÂÞ‹ƒa\r@$7¼!ÓºÿŒH \0!\ËD4gm°8 \Î	¿\ß7‘@$\0Z¼\È77›\"Z\ëH\ä\æ\æ2[	g‹D­eYÿ‘@$\0Zvhœ1ˆ\æÊ–£F\"È€H8W$jÀÏˆ\"\Ò0G´ö\Ú@\"\0‘p¼HTûýþ_	D Ý™‰`™C{vÿ>Žõ\"\0‘pZ\"ªúö\íûŸD‘\0hwf\"’š$	\×e$*u{œH \0.\ìö	ˆ„+E\âK\Ý\â‰\"Ð¡R€D\0\"\áÚ¡K>Ÿo‘@$\0\Â\ÊL´g˜C¦xRX	ˆ„k3Ÿk™E$	€\ÉL\Ø5H ®‰2Ý²ˆ\"u™hný	\0D\Âu\"q\Þ\ï÷\Ï\"ˆ@TdÂ–†ö{\0 Ž‰sZ$rˆ\"1\Ù\Ù\ÙÊ²,õÀ°‹\' \Þ‰\Óú¼_J$	€ˆ¹zõªª\ÛR‰\0D\Â#h‰8\á÷ûO$	€ˆ¹xñ¢‰³g\Ï@$¼#Gôy¿ŽH \0SRR\"\Û	@$<„>\ç}>\ßf\"H\0D\Ì\éÓ§U  €Hx«FbŸeY¯	D bŽ=ªbcc	 \Þ‰<\Ýö	D b\nU||<\0D\Â[\"±]··ˆ\"1*!!@\0\"\á!¤>B\ê$ˆ\"1»v\íR‰‰‰	oe$\Ö\É\Ì\r\"H\0DÌ¶m\ÛTÿþý	 \Þ‰\\YK‚H \0³i\Ó&5`À\0ˆ„‡\Ð±\Ì\ï÷H$	€ˆY¿~½JMM%€Hx-ócbbŠ‰\"1«W¯Vƒ&€HxK$f\É D‘\0ˆ˜+V¨aÃ†@$¼U#‘¥[‘@$\0\"f\éÒ¥*##ƒ@\0\"\á-‘\È\Ô\ís\"H\0DÌ‚\Ô\èÑ£	 \Þ\Z\Ú¬E\â‘@$\0\"f\îÜ¹lˆ„\Çðù|ý´H|I$	€ˆ™9s¦š8q\"\0D\Â[Cÿ{÷bÕ™pú¢”\r”¥,H\è‹%/Zò¢ú¢P\ÊR–B-„\rŒ\Þs\ï33Æ¨‰\æ¯\â\ß7ÿˆML\ÚÄ‰iþI¦tm16)v\×\â0Gd4-M\Æ`2§kQ3Ž3§\ç4\'®Î½wœ™{Ÿ\ÏY–e~\Ù{\ïw\Îó\Ü\ç\ÌÉ®ó&!$ f6lH»ºº!‘¹s\çþm©T\Z2	!5[»v\í\Ø]	Q\í‘øQ±X6	!5[µjUºq\ãFƒ@HÄµ´ñ\ç\Ùu\Ñ$„\Ô,|c\ã¹\çž3„DD\Ú\Ú\Úþ$I’Q“P³x Ý¼y³A $\âZÚ˜U,…„€Ú…S-_y\åƒ@HDd\áÂ…\ß\ËB\Â\ì„\ÔnÉ’%\é›o¾i‰øöI„\ÙýžI	¨É¢E‹\Ò\î\înƒ@HD³g\ÏþC“P“\Î\Î\Ît\çÎˆL\Øl9oÞ¼?6	!5iooO÷\ì\Ùc‰ø6\\Ž455\ÝjBj²`Á‚ô½÷\Þ3„D|K›››ÿ\Â$„\ÔdÞ¼y\é!_H\\(\nmBj\Ò\ÚÚšööö\ZB\"¾ø&‰;MBH@Mš››Ó£G\ZB\"¾Í–\ç²\×bBj‰\ãÇB\"¾;g²\ën“P“R©”ž8q\Â ñ…\Äÿ%IrŸI	¨I8”fpp\Ð ñ…\Ä`v­0	!5‡Ä™3g!_Hü&I’.“PsHŒŒŒB\"¾8™…\Ä\Ó&!$ jCCCc!B\"Êø4»þ\Ñ$„T\íô\é\ÓB!oHüWvm5	!U‰H%Iòa©T\ÚfBªö\É\'Ÿ¤\år\Ù qÞ‘8’];LBH@\Õ>úè£±©@HD½Ùµ\Û$„T­¯¯/mii1„Dœ!q I’3	!U;xð\à\Ø\Ó?AHD\ïg\×/MBH@\Õö\ïßŸÎŸ?\ß *•Jÿ’$II	¨Ú»ï¾›\Þ}÷\ÝˆP¡PØ™\ÅDŸI	¨Ú®]»ÒŽŽƒ@HD(I’\îb±øk“Pµw\Þy\']¸p¡A $\â\\\Úø§,$Ž›„€ªmÛ¶-]¼x±A $\â¼#±9‹‰OLBH@\Õ^{\íµt\éÒ¥ˆ3$þ¾X,~fBª¶eË–tùò\åˆP¹\\þY&!$ j/¼ðBú\ÐCB\"ÎX•…\Ä)“PµgŸ}6]±b…A $\â\Ül¹<»N›„€ª=õ\ÔS\éš5k!¡b±Ø™$\É\×&!$ j=öXº~ýzƒ@H\Ä\å\ì:kBª\"\"\Ä‰(÷Hü$I’oLBH@\ÕÂ²FX\Þ\0!\å‰¿É®&!$ ja£e\Øp	B\">I’üe±X6	!U_ý_!eHüY#&!$ jË–-;”\n„D|\Ú\Û\Û˜\ÅÄ¨I	¨Z8;“\rB\">s\ç\Îý£b±h~Bªw\ï½÷¦o¿ý¶A $\â‰\ßBj\Ò\ÙÙ™\îØ±\Ã ‘\n!‚\Â$„T¥££#Ý½{·A $\"‰;\ï¼ó&!$ *,H÷\í\Ûg‰xCb´µµõ“P•¶¶¶tÿþýˆT©T\Zijjº\Í$„T%ûK$\í\é\é1„D¤’$niiù+“P•\ì\r$\í\ë\ë3„D¼K\ÂQ\Ù&!$ *\Í\Í\Í\é±c\Ç!oHœ/\nw™„€ªd‰¤ýýýˆwi\ãlö>\ÐbBª‰ƒ@HÄ»\Ùò\ë\ìº\Ç$„T%|‡ü«¯¾2„D¼!ñ\ÛB¡ð€I	¨:$†††!\ï\ÒÆ©r¹¼\Ê$„Tlddd,$@HD½\Ùò‹R©ô˜I	¨Ø™3g„B\Â\Ò\Æg…B\áY“P±ÁÁA!°´ñ?\årù\ç&!$ b\'Nœû\Ö‰¨—6Žg\×\ë&!$ bÇ;\n„D\Ô!ñ\ër¹ü\Ï&!$ bG	K‡K¥\Ò/LBH@\Åz{{\Ç\ÚB\"\ê;³\ë_MBH@\Å8Î›7\Ï +•Jÿ‘$É¿›„€Š\íÛ·/]°`A $\â¾#±/»þ\Ó$„TlÏž=i{{»A $\â‰\ÝI’2	!Û±cGºp\áBƒ@HÄ½´ñNGLBH@Åº»»\ÓE‹B\"\î;oe\×G&!$ b¯¿þzºd\Éƒ@H\Ä}G\â•,$þ\Û$„T\ì\å—_N—-[f‰ˆ%IòYHô›„€Š½ø\â‹\éƒ>h‰¸—6žÊ®“&!$ b›6mJ}ôQƒ@H\Ä?Í®\ß\\Zæ˜•]?jjjº\Íd„\\\×Æ\ÓU«VB\"žý³’$9—…\Ãpv„§ÿþŽk¿i		¸®\Ç<]·nA $\âºñ«kD¸F\Û\Û\ÛhRB®«««+Ý°aƒA $\"»+‘]×º\ÑkJB&dÍš5\é“O>i‰øb\â¿+$’$ùS0!+W®LŸy\æƒ@HDxW\âj{$\Â#\ÅMGHÀ„=ò\È#\éó\Ï?o‰•\ËåŸ‰\æ\æ\æ\Äd„L\Øò\å\ËÓ—^z\É ‘ºô\rŽ\Ë!ñ™‰	¨\Èý÷ßŸnÝº\Õ ñ.q,¿\á?›ˆ€Š,^¼8}ë­·!÷]‰¯³ˆ0C!\×öùçŸ§ÇŽK¿ý\ï\î¹\çžtûöí†ƒˆ\Äw\Üñ\ÅbqÍ¥³$Ne\×Ð¸}³\ë³\ë`\ØC\Ñ\Ö\Öö}S0\æ‰\'ž¸\Ö4a“U\Ú\Ò\ÒrEh€h\á\È\ëpZe®s\ÕW8o\"I’Ã±Ù¦($ˆ\ÜÙ³g\Ó\ìM\äšo\Z«W¯6(„DƒÝ\ÈB`\ïõ^û¼ºC!$ˆ\Ü\ÓO?}\Í7Š°üB¢1Ì™3\çÇ¥R\éüø\×y\ØµeË–´§§\'=yòdzþüù±9†~ù\å—\é|¾ñ\Æc\ß\êº\Ê9\ç\n…\Â]¦+$ˆT…°©\êjŽ\Ë!\Ñ0(;š››¯8p*œ\"\á\âÅ‹ž\í‘#G\Æ\ì7þY\Ù\Ï\ï2e!A¤\Âò\Å\ÕB\Â\Þ„D\ãDD~)#\ìÚ½{wE1\ÞÞ½{Ó¶¶¶ñw\'Ä„ F}}}ß‰ˆÍ›7B¢A–3²ˆ\Í/c|üñÇ“2\çO?ý4½\ï¾û®¸3a™CH©ü›Aøkehh\ÈP\r°±2¿\'\"DD\Øó0™\Â\ÏË¿„=6`\n	\"tô\è\Ño\ß6m\Úd ‰\ÆX\ÒØ›ÿa²\îD\\\í\ÎÄ¸e\Ä(F\Þ!Q\ç\Â9ù}aOÄöL\ä—GÃ’Šz!Aƒ\n\Ë;w\îL×¯_ŸvvvŽ:•o>\éºu\ë\ÒW_}u\ì¼	õ%6•ÿvÆ…nø\ÜW¬X‘_\âø\ÐG½ Áô÷÷}¥s|8\\\ï\nañð\Ã§\rB¢>öF\äO¬_ñœ\nù%\Òpfv\Íòq/$h;\á8\ì\É8\É.Ü¥p‡!1\ã÷Ft\å7X\Öò5\ÏJ\å­\n\Ï\æðq/$¨s\á/„ùóç§“y’]kkk\Ú\Û\Ûk¸‰™»¬ñ«Ë¯×­[·N\é\ì·m\Ûv\Å\Ú>\î…u\ìý÷\ßÿ\Î2\ÆddN\Ãô”P„ÄŒ\r‰S—_«á…©\Þ_r\ï§}\Ü	\ê8\"¦\â$;1˜y²ðo÷G|ñ\ÅS:ûpG3ÿr÷B‚:–3B8L\ÅIv\áÎ„e„ÄŒ»#ñ\íkôò²\åT	¿/ÿû}\Ü	\êL\ØX™\ß1\'Ù…=6`\"$ffHL!!$¨c\á\Û\Óq’]xð	w$Ü‘Ô±pN\Ätžd–T@H\Ø#a„ N…Ã¦¦ó$»ph	\ß\Úð­\r!A\n{#ò_õœŽ“\ì\ÂÝÓ§Oû—˜þpŽ„€Ê„¯aÎ„“\ìÂ³9@HLû\ÒÆ“\Óõ~°l\Ù2\'[\n	\êQx\0\×Lø$¡\rBbz…gm„ý	žµ!$`\Â\ÂS<gÂšh{{»‰™±¼Ñ›\ß35w%ò\'\àzú§ \Î\ä÷GL\ç.\í°O„\Äôkjjº-{MŽN×·¸\æÌ™ócõB‚:2“¾7Bb\æmº¼\Ñ\çÊŒ{8`¯\é	\ê8$büý $¾«­­\íûI’œ»\Ñ\'\Ý.]º4¿¤q.ü^\Ó¸#\áŽB¢\n…»òK“ý\ì|D„\ß~Ÿ©	\ê= $®\æcb²ž<n9#Ü\è2m!Aò­\r•\Ä\Ä\åos9r¤¢Ù†¯x®]»öŠ€?WD	\êœs$@HLd™#¿g\"¿\Ü\Þ7:4vGóòòhøg¸\ãb#¼\Îó‡M\å÷DX\Î4€\î\î\ît&œd\çdK„\Ä\Ìß€™ÿ6GW¯•B‚žµ‘ò§gm $¸–p\ÎD’$‡ó\'`N\ä\n\'V†Ã¦²\×ûß™¢ Á¬^½:Î“\ì<ý!Q\ÂqÚ—ž\Í\îRœ\Ê?‚<w\Ôõ\éð\0®ð\ì\Ç^	\ZXxÑ§\Óu’]¸;B„u,¿\ér*O²wC@H€ Î={6mmmM§ò$»ðû\Â\ï!B‚\Ð\Û\Û{\ÅÇ<\É.üžðû@H€ \ìÚµëŠ˜¸Q\'\Ùmß¾Ý° $ˆ!&&ó$»ðsEB„,s\ä÷LL\ÆIv\á\çY\Î@H€ a#dþ\Ûµ\\\á\Û6V\"$@H¡p\Î\ÄÊ•+¯8s\"Wøß‡Ã¦úúú!B‚Ø…\ã´Ã³9\Â]Šð\Ô\Ðü#\È/‡CxŠgx\0Wxv†c¯ $\0„	\0„	\0!B@H€\0 $\0	\0„	\0!B@H€\0 $\0	\0„	\0!B@H€\0B!€\0! $@H\0	\0B„\0B!€\0! $`ŠC\âüùó^\í\0“lxxxTH\Ððn¹\å–\ÑC‡y\ÅL²Ã‡Ÿ\Í\Þf/ø¤¡¡\Ýz\ë­Îž=\Û+`’\Ý|óÍ¿\Í\Þfú¤¡\ÑÍºé¦›¾¹ýö\ÛG{zzF‡‡‡½újX\Îw\".E\ÄPxõ1C1‘]û/ýŸ>u¹\\.WMWX\Î\è\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\Íþ«•\Í-Bl#\Ý\0\0\0\0IEND®B`‚',1),('9',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0>gIDATx\Ú\í\Ýp¾\ïq\n_\èZ[®\åYŽµµ\ëµ,)Ë²,<\Þ-÷\áj\\¯{-ÎºI¦;=“qAPp  ««®r\ÔUv‘#*W÷®¨¨+ 1\nˆ	ò’‡wB^\Ó÷ÿŸ\í\á!™d2Ýù~ªþ\ÕóJÿyü\æ\ß\Ó\ÓÝ§\0\0ð§±\Ï/·‹\æ­o\Ö\ÒÓ­kÿ	û›\Ø\í^Xn‹\'¤nx\Ö\ê\æx\Åo\'þ¤·›øÊº9}\ç™ÿ\Î\n›n\0´›\Ö\ìk9$\Ëÿ#õ\ß\ZÄ¿cs\ã\ßß¡!<O\ê_õv+v\ÔýÏ—>mÑž<÷‹úq/¬°5\Ðc\áÿú\Æ&¹ü\ï\Î\ïûhVY\Ýþø\íâ¥·\Óeüv\0\0 ›\Þ\Ùp\ì˜\ì¸ÿ\å‡^”©úŸ\Óö¿&\Þî²ý\Ç\Ç\ÍX)·+9mBC[½)0¤>ÐšS\Þô\ÍC.mq\Î\ßI·\0\è\"\r\Õ	/­i”@};\Â\Z\Ú3?Š\ê\é§\ÞÿªA—z»‰¯®m÷Ï€.{xfit¬·†ñX™¾žµ:\Z¿]\Â\ï\Ó\Õ\ëoLý\ë¶zù·¶ýù\Ûþ‚Ž\0\ÐM°?zp\æ\ê\èC3WE\Ô\Õ\àÏ¯°5p\ß\ÝpøøƒYø\êg\Í\Î\í~ªA­Ë‡þ²*ª§õvÿù\Êg\ÍrY©N\éñß§§u©{üs\î©ÿw\Ë	V—\0/\ÖP\å¬ò6\Æ&|†­ýs/9µ‘™s»‹ô6j€;“úøWG5œo?ýú»R—N _D\Ç\0\è\Þ\Ô\ÝO\Æ\á\n\'X\çNœ³®ù¹%G:!=w\Ö\ÊýuK¾<qÌ¹\íÿr&\ï¹ø;\Ér¤÷8©)ó7\×\ÉùO\Û]ŸÂó#¥–\ë\Æmt\0€\î‡÷ÿ\Ö\à÷\ç•\Ñ\é|{hüKŸ¶|öM“nu¾òÏ¥\'jtµ¸œ~@*¬«¿5¬\'¾¼¦eAYM\Ý\ß\Ö}{\âÁ?ŠŽÿ\ïO[&\Ïû\\\Ãÿ­\Äß·h¿½[\Î\×\Û;ô\ëd/,?zÀ\ÙX\í:\0@\×\Ã{\Ôb©k4luƒ4ý;ñ;\Ür\Ý#-¶½{\çQ»VNÿö÷onl\Z\ß\Âü…ÿ)±¨õ\ï›0{M\ã#/~\Ò\Ôú÷\Ñy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02FÚ³xñ\â·gÌ˜q|úô\éÑ‡zÈŽD\"vAA‡\íq\ã\Æ\ÙS¦Liœ6mÚ¾1c\Æ<H\Ç\0\0p\É7\ß|š7o\Þ\ÑxÀ5j”ýê«¯ÚŸ|ò‰]UUe\×\×\×\ëq\ì\Æ\ÆF»¦¦\Æ^»v­=þ|û\Þ{\ïµ\ï¿ÿþ\è¤I“VY–ÕŸ.\0™I»ÿò\å\ËŒ=Ú–I\ÛÞ¸qc,¤“UQQaË”n>Ü–)}\Z\0 ‡§\í?ý\éOÑ±c\Ç\Ú\å\å\åvwlÙ²\Å3fŒ}\Ï=÷\ìD\"\Ñ]\0\0\Ò\ìØ±cc¦L™b?ÿüóöÑ£G\ít\Ð\Õ\ëúû\î»\ï¾Ã¬F\0 \Í·÷SO=e777\Û\é6s\æLÀ¿\Í\É\É\éG·\0\è&ýŒ[W•\ë„\ÜÁ÷\Üs\ÏÙ………{\è8\0\0Ý¤§\ég\Ü\éZU\Þ\Ñ*ô{\ï½7jY\ÖXº\0@\é\êrÝª\\·(\ÏÝˆ-\nµðù7\0\0]¤\ß\ãÖ¯ƒe\Òc=\ÖXPP°ˆ\î\0\"\Ýsš\î€%SSwÜ—_~i\Ë\ä\Ý\Ä\Æk\0\0¤h\éÒ¥\ï\éž\Ózr#µöD\"‘\Ó4‡s/\0\0\ÝW¹\îò\Ô\r\Ï>ûl]AAA)÷\0\0)ÐƒŒ\è¾\Ê\Ýðñ\Ç7KxWr/\0\0=:˜d\Ä\rˆJx7p/\0\0=œgü\è`™¦:\ÑCŠr/\0\0\rO7\Þ\0\0¤h\èÐ¡nN\ÞQ\Â\0€=ø\àƒ®}\æ]SS\Ó\Èg\Þ\0\0¤h\êÔ©\rnmm¾xñ\â\Z¶6\0 E>ú\è·¾\ç=eÊ”j¾\ç\r\0@ŠÆŒs×½÷\Þ\ë\Ê\Öt÷¨\ìa\r\0€®xK¦÷m^VV¦«\ÌÙ·9\0\0]1yò\äO?ýtF\Ã{Äˆ\ÕU\0€.ŠD\"\Ý}÷\ÝÑŠŠŠŒ÷§Ÿ~z@§nŽ\ç\r\0@7\ÜÿýSFm=z´Gƒ»®®®%6Jp¥\ë\0\0tÓ½÷\Þ[õ\ì³\Ïö\ä\ÆkQù7jL\Ó\ÜI·\0H\ÝxL&ð3f\Ì\è‰\0Nš4\éký^·®¦§\Û\0\0¤1ÀGŒQó_ÿõ_ö‰\'Ò¶ªü¾û\î\Ó\r\Ô*ùœ\0€\nðp8¼s\äÈ‘\Ñ\r6t{\ã4ýŒ[W•3q\0\Ð\Ãt£²\Â\Â\Â\æ©S§6iˆ§²*}Ýºuµúº³U9§\0):-\Ë\Ôü¦N\ÏC†‰NŸ>½n\åÊ•\Í\Õ\Õ\Õ-z<n\Õ\Ð\ÐÕƒŒ,Y²\ä€\îòT÷œ¦¡­\ß\ãf59\0\0.’0KK\í‘@¯\Ó\Ãy&Tƒ~¦-U¦»<e\Ïi\0\0x;Ô£\ápør:\0€Â»\Ñ0Œ[\è\0\0þ	\ï\ã\ÞC\é\0\0>aY\Ö	\ï‰t\0\0ÿLÞº\Ûót\0\0ÿ„÷&	\ï\×\é\0\0þ	\ï$¼—\Ò	\0\0|Â²¬w¥\Ö\Ñ	\0\0|\Â0Œ—%¼·\Ñ	\0\0|¢  \àq©*:\0€O˜¦9Z\Âû0\0\0À\'Ã¸SÂ»žN\0\0\à@\àz	\ïf:\0€\Âûb=²\0\0ÀG4¼õ\Ø\ßt\0\0ÿ„w‹\Ôut\0\0Ÿ0Mó¤n¸F\'\0\0ð\Ï\ä}X\ê>:\0€Â»Jw\ÖB\'\0\0ðOxo\×Ý¤\Ò	\0\0|BL\"\áý\0\0À?“w±\Z”N\0\0\àÁ`ð¯Þ›\è\0\0>aš\æó\Þ{\è\0\0þ™¼\'Y–u€N\0\0\à†a•\Éû8\0\0À?\á}‹„w#\0\0À\'LÓ¼B\Â;J\'\0\0ð‰¢¢¢³õ\Èbº¤\0\0ø„N\Þ\ápør:\0€Â»Q?û¦\0\0ø\'¼\ëV\çt\0\0Ÿ\Ð\ïyKxO¤\0\0øgòÞ£{Z£\0\0ø\'¼7Ix¿N\'\0\0ðOx$á½”N\0\0\à–e½«\Çõ¦\0\0ø„a/Kxo£\0\0øDAAÁ\ãRUt\0\0Ÿ0Ms´„÷a:\0€O†q§„w=\0\0À\'Àõ\Þ\Ít\0\0ÿ„÷\Åzd1:\0€hxG\"‘‹\è\0\0þ	\ï©\ë\è\0\0>aš\æI\ÝpN\0\0\àŸ\Éû°\Ô\ï-ËºQ‚|¸\Ôt©t\0\0	{¼uµõ!ýŠ˜„tT?ónU\Í999ý\è\0\0 ¡\Ý_Ã¹À>U\è\ë\é\0\0\"=»£ð\Î\ÏÏ¿•.\0\à½\0?\Ö\ÎÔ½“\î\0\0\àA¡P\Èl+¼õ3qº\0€GÉ”½¥Ux7±¡\Z\0\0\Þ\ïØ‰[›—\Ð\0\0<Î²¬…ñð…B?¦#\0\0xœ®&—\àn\Ô	œn\0\0\à\Ü\Ï\Þ\0\0$°m»\ßÎ;+\Ë\Ê\Ê\ìeË–\ÙK—.¥ºP\Å\Å\ÅöªU«¢R3yT\0z”wii©]SSc744PÝ¨\Ú\ÚZ»¤¤$*A>G\0 \Ç\è\ÄMp§7Àeo\à‘\0\è1ºªœ\ÐMo\éjtY\0€£AC\à\Þ\0€^\Þ\ÇW\Ù;×¾jWÿ>VzZ/#¬	o\0€\ÃûØ¡}ö¦\ÅS\ì\r\ï?rZ\éezMx\0<Þ•\ïž\Üñ\Ú[±ˆÀ&¼\0^\ï/Wü±\Ýð\Ö\ël\Â\0\à±ðÞ´´¨\Ýð\Ö\ël\Â\0@x\Þ\0\0t\'¼u\ëòö\Â[¯#°	o\0€\Ç\Â{û\êí†·^G`\Þ\0\0…÷Á}\íMK¦ž¹\Ê\\.\Ó\ël\Â\0\à±ð\ÖÚµn\îá­—Ö„7\0À‹\á}ò¤½ý\ã™g®2—\Ëô:›ð\0x(¼uj\ÛV¿\Ð\îg\Þz{Y#¼\0^o™¨«¶/·¿øpR»Á/½Þ–)œð\0¸ÞM\ÛL\á„7\0Àc\áÌ´\Ý\ÑNx\Þ\0€‡wWƒ;^„7\á\r\0\ÈpxS„7\0€ð&¼\0 ¼	o\0\0\áM\Þ\0\0Â›ð\0€ð&¼\0„7\áMx\0oÂ›ð\0x;¼—,Ybÿü\ç?·\Ï?ÿüX\éi½,ñ6òO\Å\ê¿ø\Åi—\ëùøu­o«u\Î9\ç\Øÿöoÿf/[¶Œð\0 \áýü#²999ö7\ß|cWWW\ÇN\ëe‰ž\È\å\å\å±\ËÖ¯_\Ú\å­o«§KKKc§/¿ür\Â\0€t„w|r.++;u™žn=e\ÇY§ò\áÃ‡\Ç.9rd\ì|G\á?\Þy\ç:¯o†b\ç;ß‰]~\Ûm·Ù»v\í²<»lÀ€§ýz^\×\Ô\Ö\Ö\Þ\0\0\Â[Wk\'­V}}}\ì2\r\ÌÖ¼hÑ¢\Ø\ÏlÜ¸1¶\Ôó…÷Ê•+c§\ï¸\ãŽS\×G\"‘\Øe«W¯¶7o\Þ;}\Ã\r7Ä®;vlì¼®ˆ¯\Ò\×óz9“7\0€ð\îBx\ë\ék®¹&6\rë²½I;±t•ùW_}u\êz¶[\ßæ¬³ÎŠ]·}ûö\Ø\éÿ÷×¥ž\×\Ë	o\0\0\á-_\í½nÝº3V›ÿô§?m3¼gÏž;­ËŽ\Â[O?üðÃ±Ó¿ü\å/\Ï\ï#GŽ´ù7\å\å\åú\Ì]—z\ÞKŸy6\ì2Ë²F,\à\0\Èxx\ÇR?w\ÖÏ”7X[¸pa»Ÿc·µ%z[\ç;f÷\ï\ß?v>¾\Åy|µù„	\Úü}ñU\íñŸ\Ó\Õ\ë\Éü[ý]\ro\rk\Ã0\ÆKX¯‘\Ð>$KÛ©J\0€Œ‡w<Àu\ã´øD¬«\Ò\çÎ\Ûa@\'\ÞZø\Ãb\çoº\é¦\Øy\Ý0mÔ¨Qö÷¾÷½6·V\×Ò¯—µžþ3\Þo¿ý¶ól©\rÖ	a}Z™¦ù!@\0€+\áX:\r÷IX%žmUWWg\Ú\ívb\å\ç\ç\ß\Ê#\0\àzx\ë\Æj:õ^r\É%±¯oec€\ë–\î\Î—Šv\Þ-<ú\0\0žo\ê>ó…B?–>\ÞÁjó\Z©¥–e<xð%<\Z\0„·ö°&Á\Ü_‚ººðþL®{B7b“\0?\ê\\v\\N¯—šò\è\0\Þ.~ULC91¼5¸¯D\"9_û@n[-¥«Ü›d¹S¿R&až[TTt6X\0\0\áÁ\ïyK\0\Ït\Â;š““Ó¯“»¦¯\Üþv¹\í	õm²lp½Vª\Ø0Œq\ápøû<‚€ð¦zx\'-À\Ãuš\î\Ê}%?7@‚ûq	óO¥N­j—ÓŸK˜?#§¯\ã\r\0„7\Õ{XKb\êNÊ Aƒ¾+¡}\Ô{\ÜUº»®j—0\ß%Aÿºœ\ÎgU;\0Þ”\Ç÷m.¡ý+	ó—%¸·\êªv]E/a~@._.§\Ö\r\èx\Ô\0\áMyøÀ$‘H\ä\Ê`0ø¨w™\ÔgUû		ór	ò\çô\ël<\0€ð&¼=|T±@ p¡„÷\ÝR‹¤¾‰¯j—\Ú-õ†„¹)·9—g\0Þ„·‡\É~›\î‹]¦ñ-²<\él\Õ~@j…P%77÷Rž)\0@x\Þ&\á}…\Ô4gUûag7¯uz ¹üyY\ÞÀ3\0o\Â\Û\ÃFŒqö\ïd\nG–ûœU\í\ÍR{djÿ›,ƒ¬j\0Â›ðö8	ò[d\nŸ%Á½Y–ñU\í%\ÌW\Êu‡òž]\0\ÐC–-[F\à\Þ\Ý‡/ƒS%ÀWKŠ¯j—\Ó_\ÈrFaa\á\Ïx¶@š”––¶\Ô\Ô\Ôºiª½{÷\î‘ðn\ÈöÇ•®j—)ü.	\î·%À÷\Ê\éøªö¯õp©r¾0];«€¬³|ùò\ÇKJJ¢û÷\ï÷|0ž<y\ÒóÁ]\\\\\Ü$5GÖ™$°o– QªB¼Þ™Î¿•Z%Sû$Yþ.@’$l¦É´x\\W÷zµ–,Y;\Z——ÿF¸	\î\ä\r6\ì2¹O\'K•J°ë„¹†ú&	ø¿†q]\0Ÿ\Óð\ÖýyÓ‰\ÞIW£\Ë}–\Ð~KÂ¼\ÒYÍ®U)\ç\Ê\åCY\Õ\0>£[4³sv‘Ð¾Q§p\Æ\ã«\Ú\å2\Ý \î#©):½\Ó%\0ðöyK^^\ÞUt\"{\é›7\çóñU\Î\ç\å±U\íú9º~ž®Ÿ«\Ó%\0ð]…Ê4HW£\ë–\ëº»³%{³¾\É\Ó-\ÜuKw\Ý\â]·|§S\0\à^x7\ê\ÎA\è:¢\ß)\×\ï–K€o”\ÒÝºFïž¯\Ö\ï¢\ëw\Ò\é\0d.¼OÊ‹\ïo\èR¡V‘\Ç\Î©\Ýœ³7¸“R_\ÊdþR~~þ­t	\0z.¼O\è~´\éºC÷\Ã.¡mIˆ¿©ûgw¶h×\Èì“‹ß•Ë‡\ë¡S\é\0¤¼¨\ÕcQ\Ó	ôÀ\Ãœ#¦mpŽ uŽ¨V¦GX\Ó#­\Ñ%\0\èýŠ\ÔX:<\Öú\ë±\Ìõ˜\æzlóøªv\ç˜\ç³õ\èt	\0’›¼kõkBt™VTTtv(2%¸ß\Ú-\Õ\ä\ì¯ý©EºFˆU\í\0\Ðy¬’zœNÀ$¬¯—\0V“\åò\ÆR·\Ç\Ð]ø\ÑU\írùc‘H\äJº€ð.(øZ_,\é¼(_Ÿ\É\ãt™®%rö\× Ë­²|E\Âþ\×t	@6†÷Wº-:?\ÐU\íò˜Í—\Ç\ì\ëÞ»tU»³U{•œ\ß0Œ{\ØW?€^O7’½\×\è|üô:	\íg\äqü¹œ>®«\Ú\åôQ©Oõ#!vÿ 7†÷F\Ý`ˆN ·<xð%\æ\ã\äq],U\ël\Õ\Þ a¾M–s‚Á\à\ír³¾t\n€Ÿ\Ã{­\îDƒN ·\ÒU\íØ¹\Üôc\"\Ý%°ºTµœþ@ÿ£\"‘\ÈEt\n€oè¾©¥–\Ð	d	óRO\Ëcÿ³øªv©cúfV–O†B¡«\é\0/O\Þ\ËeòXI\'\ÍÀ\Å\Úcô¬<\'jœ­\Úe¹Cj®aƒû°ª€‡&\ïô;´t8M_=`<7\æIˆk€7:»w\Ý/µX~´>m\à\nyaZ¨[\é\Ò	 c\Ø\×H=%Ï—uºŠ]Wµs\\s\0nM\Þ\ä©‚N\0)?wlv\ß\nÀ†a¼¬_¡¡@\Êá­Ÿ‹÷§\0\Üxš!µ‹N\0©‡7‡5\à\nýºŒ¼\0\í¥@\Ê\áÝ¢_9£\02N‚{šnAK\'€”Ÿ;M………?£\02\Î0Œñ\Þ\éò\ä\Ý þ+:À û¤\Ó	 \å\çN½¼ù½“N\0\È8Ë²\î\Ò\ÝC\Ò	 \åð>!¤\02\Î4Í€¼\0\Õ\Ñ	 \å\ç\ÎQy\î\ÜM\'\0d\\ øµL\ß\rtH9¼\éþ\Ð\é€Œ“\à¾Q^€š\èòs\ç€a\é€Œ\Ó\ï©\ê÷U\é\Zy\ÞT\ëW-\é€Œ\Ó=Déž¢\èrx\ï\Ó•\Ð	\0‡¿¯X @\Ê\á½[\ê: \ãÀ¹„7Ð¥ð\ÞaY\ÖKt€[/Bzh\Ãs\é\Òóf³\Ô<:Àµð<xð%tH\éy³Á4\Í7\é\0·^„¢\ápør:$Ï²¬u†a¼C\'\0¸õ\"Ä¡\r\Ô\ßô~,µ˜N\0p\ëE¨Iw\ÖB\'€”ž7%R+\è\0·&\ï\ÝM*\0R\n\ï\Å:}\Ó	\0n½\ÕK\å\Ó	 ¥7½ïš¦¹–N\0p+¼†1”N\0)…÷\ß$¼\Ë\é\0·\Âûˆ\Ô}tH\éy3O¿\ëM\'\0¸õ\"tP&\ïñtH\éy3[j;\0\àÖ‹\Ð~©\":¤ô¼yA÷oN\'\0¸õ\"\ÄÑ‘€ƒÁ§\åy³—N\0p+¼9:zx?*\á]M\'\0¸Â²¬m†a¼L\'€\ä\Ésf¢<w\Ð	\0®\é¡B&\ïtH\éM\ïX©Ct€[/BŸ\Ëñ\0’\'ox\ï–7¾G\é\0·&\ïO$Àß§@Joz\å¹s‚N\0pk‚X%µŒN\0\Éƒ¹ºka:À­ð^\"µšN\0É“©ûWò¼i \0\\Á€.=on\Ô\Ã\é\Ò	\0nMoÊ‹\Ð:$/”\çM\0\à\nyš+õ%\0’‰D®”7¾Q:À­\É{–„÷WtH^nn\î¥ò¼!¼¸Ã²¬g\åE\èk:$/\\(\Ï›N\0p…¼\0=.U\åy\Ý\'//\ïZ:7Ù¶\Ýo\çÎ•eeeö²e\Ë\ì¥K—z®4¼½øw%Vqq±½jÕª¨\ÔLU€§\ìþ¦i\Ö\éV²º±¾ø´S%tn\Ò\à.--µkjjì††ªU[[k—””D%È§ó\Èü;i—v\ÚZ\ÑaÃ†]F§\à&¸	\îô¸L\â|/ðóô-\Õ\ÑÔ½†.Ámºªœ\ÐMo\éjtY€¿|a{\ámš\æ\0:·i\Ð¸„7€V\Ów[ŸyKp¯§;ðSx?\\e\ï\\ûª]QüûX\éi½Œ°&¼^)\ÎlÞ¡PÈ¤3ðKx;´\ÏÞ´xŠ½\áýGN+½L¯#°	o Wr¶<‡w%ŸÂ»²\â\Ý3‚;^{+Ø„7\Ð;Y–56\ÞzšŽÀO\áý\åŠ?¶\ÞzMx½yú>\ê\ì)Š¯‡ÁW\á½iiQ»\á­\×Ø„7\Ðk\å\ç\çO¹\å–[ôI­5Ž€ð&¼xß„s\Î9GŸÔº¥y”\0‡_\Â[·.o/¼õ:›ðz«ñ­{2¿„÷ö\Õ3\Ú\ro½ŽÀ&¼l\î\Î.<\Þ÷m´7-™z\æ*s¹L¯#°	o [‚»õõ“i¼\Z\ÞZ»\Ö\Í=#¼õ2Âšð²-¸\ãX…o‡÷É“öögž¹\Ê\\.\Ó\ël\ÂÈ¶\àNð&px-¼uj\ÛV¿\Ð\îg\Þz{Y#¼l\îÄŸka‡\'\Â[&\êª\í\Ë\í/>œ\Ônp\ÇKo£·e\n\'¼l\î\Ö?\Ï\×Â»³i›)œðzsp÷•z\ÉYv¤õ\íø®†w2\ÓvGS8\áMx~\î­}þ¹7µ­x{·c‡k\á\Ý\Õ\àŽ\áMx~\î>\Î$m\'T[ž\Üñš\Õ\É\ï’’““Ó¯«\áM\Þ@6w{Áœ\à]\Ç*ttIAAAƒKžð&¼$Üø\ÙIw\â¿\ÃV\èH5¼ã‡ m4Móùö&qÂ›ð\î\ä¼!…\àn\à|Ž”\Â;^\àuR\Óo\Â ¸“\ÓV€§\Üq¬BG—\Ã;¡ŽKM&¼	o ›\\\æ„nEŠ?wvwƒsy*>\ì\àE9^\ÑV\ÕÒªšjrªQW­:\ËYžtª^K\'6Y\ê\Ôv\Ây\á?¦%·=*\Ë#R‡\åºCrþ[9}PKNe­\\^#\Ëý²¬–e•\Ô>§*¥¾–\Ú#µ[n¿K–_\Ér‡,·Km•Ÿ\Ù\"\Ë/eY!\ËM²üB–¤\Ê\åôzY~&Ëµò3Ÿ\Ê\é2§VK•\Êe+eY\"\×/—e±,—\Êr±\Ô†a¼\'\ËE²|Gn·PNÿ]–“\år»\×e¹@jž\\öš\Ô+r»—eù’\\÷¢\Ô_\äºº\ZZ.{V®{&>-—=)õ¸\\ö˜N·r\ÙT\rHYN’\å©‡\å¶\ã\äú±rýhYŽ’ó÷\È\åwKýNN•eX*\n…LY\æ\Ë\Ï\æJýFN\ß!\Ë\Û\å\ç~•ŸŸ«ü\ì\Írû›\n&\×\Ý®—\åuyyy\×\Ê\Ï^-Ë«\"‘È•=Nôþ”\ßó(\áMx\Ù6y\'»\n;Ý“÷ú3ò¢}®~Ž)\Ë\å\Åú¢Áƒ_‡¿Ÿ››{©¼8ÿPN_./\ÐWH\r\ÐuY^#!0\Ðy±¿A\ÎÿD‚\àF\r\'n“\ë~­a!/êƒ¥\î\Ô\Ñ0±þ©\Ð	™\ß\É\Ï—ó#5„4Œ\ä²1\ZNNH—šè„—†X‘,\ÕpÓ“\Û?%5]\ÃO\ê9¹\ì\rE\'g\Éù\Ù\Zš\Zžrz®,\çk¨\Ê\ïø«,\ßt\ÂVC÷mY¾\ë„ñr¾±Yâ„µ†ö\n\'\ÄK¥>’úX\Þ	û5²\\\ç¼	\Ð7Z7	úfa³ó\æa«\Ün›,w8o.ôM\Æ.\çM\Ç\×r¾Rn·\×yCR\åTµó¦Eß¼\Ô\Êò€ó†\æ[©CúfG\ßô\È\é#rýQ\ç\Í\Ðq§N8o–\âoœ\âo¤ôMUCüM–¾\é’\ëšÞˆ5\Ëu±7gº”\ë¢I¼\É;U.\á\r°\ê¼ó\à\î\Êg\Þñ}Ÿ³\Ê\ÝZm®o t\r€_W›ÇŸ7„7€ž\nðtnm\Î[\Ð\Ýð®\Õ5%­o—Jx·³ö\è´@]½zµ=p\à@û¼óÎ³\Ï?ÿ|û\Úk¯=\íwtv=\á\r S\Þ\ÖV\à\éúžw¸[™£{\á­\Û„Û»]W\'\ïöBôª«®Š]¾q\ãF»¶¶\Ö3fLJ\×\Þ\02er“q:÷°6£\á]©\Û-tv»t‡÷9\çœ»|Ë–-mþ\\g×·þ½í\×\ÕW_}\Ú\ïj}}|º¿ô\ÒKcÿvÿþý\í\Þ\0N\Út\ïÛœ\àFJwx\ßv\Ûm±\Ë5(ù\Ë_\ÚS§NM\Ø\É^¯×u\ÖY†÷Â…\íw\Þy\'vzÐ Ag\\¯½k×®S\ç\çÌ™s\êü¿üË¿\Þ\0Î˜À|VŸ\äŽ*–x;¾\Ï\rß†wuuµ=q\âDûšk®9u››nº)\é\ëõ¼~\ÞYx\×\×\×\Ç*>]·u}[\çõAŸ^\íNxþœÀ»ó5Á\r_‡wb­[·\îÔ”\ìõ‰\ç\ã\áÜ•ðNö<\á\r »\ÌQ\Ä\àûðþ\íok—••\ÅN¯_¿>v²“½^Wi\ëeÛ·o·\çÎ\Û\ájóE‹µ»\Ú<™ó=ô„7\à\ï	<• &¸\Ñ+\Âû7¿ùM,€uz\Ö\ÕßºJ¼¼¼<\é\ëõ³\é\ï}\ï{m~\r­­\r\Ò4ø\Û\Ú`ðÐ	<™U\è\á>lœŸ…7Ex\Ù<\Ç?#\'¸Ax\Þ\0|\àm}? ¼	o\0ð\É	ÁÍž\Ó@x\Þ\0<.>i—ôùŸ£ƒ„7\á\rÀ\ë¸\îoš\à\áMxð\ro=7\0\áMxðWx_H\'@x\Þ\0ü\Þ\Ó	Þ„7\0ÿ„wÔ²¬þt„7\á\rÀ\'LÓŒ6\ì2:Â›ð\à£ðŽD\"W\Ò	Þ„7\0Ÿ(((h	…BW\Ó	Þ„7\0…·\Ôut„7\á\rÀ?\á\Ý,u\0\áMxðOx7Y–u#€,[¶ŒÀ%¼$Þ†a\ÜB\'\à¥¥¥-555„nšj\ïÞ½{$¼xd½ŒL\Ý\r@\à\×t^°|ùò\ÇKJJ¢û÷\ï\'|\Ó\Ü\Å\Å\ÅMR\Óyd½oò>)“÷`:¯°™&\Ó\âq]\Ý\ëÅš3gŽ­{&ô\êß—P\r7\Ð{Ã»>\æ\Ò	 \é\ç\Ì\çh|\0\à\Ó4\ëB¡I\'€\ÎY–5Vƒ[KN¢#\0Üš\"ŽK…\éÜ›\ÝxxKU\Ò\0n…÷1©\ß\Ñ	 \Ó\àžžÜ±2\ãN: \ã,\Ë:*5’N\0>OúKµ´o©5t€“÷a™(F\Ó	 \Ãð^\ØFp\ÇJž?\è€L¿(}k\Æ8:´?u;»¶\Û)¦o\0Ÿ¼Jx§@»Ï‘\Ò‚[+:lØ°\Ë\è€Œ1M³6N¢@»S·~#£©“\0/¡[\029U\ì—*¢@Ò~—ºž…B?\Öû\ä\å\å]Kg\0d2¼«\ä\Å\ç1:$\Ç0Œ{\ä9s„N\0p3¼÷I=I\'€¤\'\ï±R‡\è\07_ˆ*e’x†N\0IO\Þ\åys€N\0psò\Þcš\æótHú9S¤ÛŠ\Ð	\0nNÞ»$¼ÿB\'€¤\ÃûIý¸‰N\0p3¼wHxÏ¢@\ÒÏ™g%¼¿¦\0Üœ\"¶Ê‹\Ñ+tHŽ®©\Ò5Vt€›\áý¥\Ô\\:$\Ç0Œ—%¼·\Ñ	\0nN\Þ\èô\ÞyR›\é\07_ˆ6H€¿I\'€¤\ßð¾©\Ï:À5–e}n\Æ[tHú\r\ï\ÛRŸ\Ñ	\0n†÷:	\ïw\èôs\æ}™¾?¡\0\Ü|!úT\Âû=:$=y\ëaB\é\07_ˆ>–ZL\'€¤\ßð®”\É{9\0\àfx—\ê$A\'€¤Ÿ3e¼\á\àöQ‰\Ô\n:$G¦\îµ2}¿K\'\0¸\Þ|~¤öœ)—ú;\0\à\æ\ÑbýÜ›N\0IO\Þ\ì\Ø€»ø\ÚòÞ­Rs\è\07\Ãû]ýN\0I?g8\0w\é\Þ\Õt/ktHzò\Þ#\áý<\0\à\Zö\Ó¤üœ\ÙŸ¦\0\Ü|!z]\Â{\0’~\ÎTKx?J\'\0¸\Æ9¼\á—tHú9S+5™N\0peY¯\èÖ³tH:¼J=L\'\0¸\Þ/\É\Ñ:$Þ‡¥\î£\0\\gš¦¹“N\0I‡÷1y\Î§\0\\£_yÑ¯¾\Ð	 \éð>!¤\0\\c\Æ3–eU\Ò	 \éð®ƒ¹t€›“÷Sòb´N\0I‡wƒ„÷\ít€›/DKU\Ñ	 \é\çL£eY7\Ó	\0n¾I\í§@\ÒÏ™f©\è\07_ˆ&\ëN\'\èôs¦%//\ïZ:À\Í¢	R\èôs&jš\æt€k\ÃgYÖ·tH>¼sss/¥\0\\#\Äh\Ýc\0’o{Ð Aß¥\0Üœ¼\ï‘\Éû\0’ï¢¢¢³\é\07\'\ïáº»G:tNC[Ã›N\0p{ŠK§@\ç\"‘\ÈE„7\0\×YB^Œ\ê\è\Ð9\ÝPM7X£\0Üž¼óu_\ÍtHjò¾\Ò4M\Â€»\Ã,\á}’N\0Ó³X–\ÕB\'\0¸*üZ^Œ\Z\è\Ð9\Ý-ª\î•N\0pU~~þ­ÞzZ7Æ‘\Ó7†B¡\Ó\àL†aÜ¢&¡\02J\Âù¼ø4\éª?\Ýj¶\ÚN§€3\é¡@õ t@¦\ÃûµB;V:}\Ó)\àLl\à	À999ýtòn/¸MÓ¬ K@»o~\å9r‚N\0ð\Ôô\Í\Ô\r´=p{únh#¼+\é\Ðaxs \0®¾Mkc\êEg€ö\Éó\äa©ƒt€›/DGÂ›$ ó\ç\Ì©Z:À52iM˜º\Ç\Ò \Ó\ç\Ìcò|©¢\0<1}\Ó	 sÁ`ði\Ó4÷\Ò	\0®2c\"\á\r$ýf÷©\Ýt\è\Ål\Û\î·s\ç\ÎÊ²²2{Ù²eöÒ¥K=Y–eyöo\Ó*..¶W­Z•šÉ£\nn’©{–<_v\Ð	 \Ó\à.--µkjjì††ªU[[k—””D%È§óÈ‚‹“÷©­t\è\Åt\â&¸\Ó\à2‰³_i¸9y¿.á½‰N\0½˜®*\'t\Ó[º\ZG\\œ¼ÿ.UN\'€^Lƒ†À%¼Ñ«\Â{‘\Ô\Z:\Þöñ\ÃUöÎµ¯\ÚÅ¿•ž\Ö\Ëk\Âž\ï\ÅR\Ó	 \Ë\ÃûØ¡}ö¦\ÅS\ì\r\ï?rZ\éezMx\Ã;L\Ó\\nY\ÖJ:dyxWV¼{Fp\Çko\Å\"›ð†·&\ï$À—\Ò	 \Ë\Ãû\Ël7¼õ:›ð†§&\ïOdò~ŸN\0YÞ›–µ\ÞzMx\ÃS\á½^\Â{!\0oÂ›ð†\Â{cAAÁt\ÈòðÖ­\Ë\Ûo½ŽÀ&¼\áÜ›¥\æ\Ñ	 \Ë\Ã{û\êí†·^G`\ÞðTxo—šM\'€,\ïƒû6Ú›–L=s•¹\\¦\×Ø„7¼Ã²¬]¦iþ…N\0Y\ÞZ»\Ö\Í=#¼õ2Âšð†\çÂ»\Ò0Œg\è\í\á}ò¤½ý\ã™g®2—\Ëô:›ð†w|#þ\0²8¼uj\ÛV¿\Ð\îg\Þz{Y#¼\á©ð\Þ/UD\'€lo™¨«¶/·¿øpR»Á/½Þ–)œð†\'\Âû€\Ô:dYxw6m3…\Þð.Ë²I¥@–…w2\ÓvGS8\áMx\Ã\Õð>j\Æ=tÈ²ð\îjpÇ‹ð&¼áž‚‚‚\ã\ÞC\ée\áM\Þð/\Ó4\ëB¡I\'\0Â›\"¼\áŸ\Éû¤LÞƒ\é@xS„7üÞ–e\ÝF\'\0Â›\"¼\áŸðn’ð¾‘N\0„7Ex\Ã?\á\Ý,u\0oŠð†O\È\ÔÝ’——w\0oŠð†&\ï¨\Ô\é@xS„7ü\Þö\àÁƒ/¡\0\á}ZÉuX‰·ù\Å/~q\Ú\Ï\êù\Ä\Û\Åkþüù§._°`\á\rt#¼GŒq\0\ïNƒ¼£€///]¶~ýú3B>^2)\Ø\çœsŽ}\ÖYg\ÅN\Þ@jŠŠŠÎ¶,k!“7@xw;¼þóŸ\ÛÃ‡]6r\ä\È\Øù\Ö?S[[\í;\î¸\ãTˆ<x°\ÝIÿê«¯¶·l\Ù\Ò\å\ë	oô6¦iþJ‚ûˆ,†q\ïn…÷¢E‹ba¼q\ã\Æ\ØRÏ·þ™_|ñ\Ô\êr-=ý\ç?ÿùŒßµp\áBûwÞ‰4hP\Ê\×gju<\áL	\çÊ¤½HªE\ê\r¹¨/]\ïn‡·ž¾\æšk\ìÄ–mý\ÌM7\Ýd\ç;ß±Oœ8+=­—µþ]õõõ±\Ò\Ó\çŸ~\Ê×³\Ú½‰„õRÇ¤¾e§,\0\áöðž={v\ì´.[_·gÏžv7|Ûµk\á\r´1m›¦ù¡~Ÿ[j>\Ó6@x÷HxwtÝ“O>;=dÈS\×\Æ.{ê©§\ÎX-_\í\Þ\ÞjóŽ®\ï\è\ï\ë\ì<\á\r/0\ãN=ä§„ö	ðŸ\Ð€ðv%¼¯½ö\Ú\Ø\éü\ã§®\×\Óz\ÙÀ\Û\Ü\àLW¿w´AZ{\×\Þð«œœœ~\Ú\Å:m\Ëro\Ïõª³ \í“\á\Õ\â„72I&\ì€v,kB¡Ð\é\0_„÷y\ç«®^OxÃtG+\Ú%º%¹L\Ü/\Ñ\0¾\novÒ‚l#”ª—ª\nƒ\é\0Â›ð†G%°?\Òi\Û4Í¿\Ð\0„7\á\r3c¨öI	\î}²¼†Ž\0 ¼	oxT$¹H»\Ìù\Þöst\0\áMx\Ã\Ã$´\ï–jú://\ï*:€ð&¼\áQ@\àb™²\×\ég\ÛÁ`ði:€ð&¼\áaÚ£$´¥vE\"‘+\é\0Â›ð†G\é1¶%°Ë¥š¥§#\0o\Â&a=F§m™ºw„\Ã\á\Ë\é\0Â›ð†GIX÷7Móg\Ú.¢#\0o\ÂÞž¶–j’\Ú*õC:€ð&¼\áQ¹¹¹—JXo\Ö\àƒ“\è\0Â›ð†‡iX;\Óö\æ!C†ü€Ž\0\èË–-#p	ot“®wVkp?LG\0ô¨\Ò\ÒÒ–šš\ZB7Mµw\ï\Þ=\Þ\r<²²jÚžª¤\é†iº\Z\Ð\ã–/_þxIIItÿþýžÆ“\'Oz>¸‹‹‹›¤¦ó\È\êýô+_ú\Õ/\ç+`c\é€Œ’°™&\Ó\âq]\Ý\ë\ÕZ²d‰-/’¶—ÿF¸	\î\ì aý˜óõ¯r\Ýù\n€vhx\ë˜\èÜ¢»3\ÕÝš:\Óö(:\00M3:lØ°\Ë\è\\zü=¥\ÑŠ\èE\è\0$7y\ë˜\Ò	d’ªS\Ù\éºón:\0©…w“a7\Ñ	dŠL\Ù\ÏJµ\È\Ôý	\Ù\0@\×\Âû¤„÷`:ž&a}<\Þö\écN\Âû.:\0]\ïòBZH\'\ÐÃ³ú\Ô\êAƒ}—Ž\0@7Hp‘\Éû:ž \ÛSH`WI\ÕK\é\0¤g\":(\á=žN \ÝLÓœ\ålI¾rÄˆ\Ð\0H_xWË‹\ì4:t	\×\ËcªFªN*@G\0 \Íd*ª”\Éû:4½œ£[’\ËrYNNN?:\0=óbû•LG/\Ò	t‡<†~\"¡}@O\Ç\å\Í\àt\0z6¼7KÍ£è¢¾\Úói{q 8—–\0@Ï‡w¹\Ô\ß\éR%}£nð(uL\ê:\0™\ï2©\èR™¶\å1ó†nIn\Æ{L\Û\0ùð.‘ZA\'	\ë[L\Ó<$S÷Q	\í_\Ó\0p\'¼?\Ð\é›N #EEEgKp¿\å\ì%\ím=OW\0À½I\ê-™¢>§h<>n“À>\"u8??ÿV:\0\îO\Þót‹s:¶¦m	\îw½¤ýM.\êKW\0Àt–òÂ¼ƒN Q0¼]·\"—\ÇÆ·2\0<F÷®¦{Y£Pº\å¸n\á|o{\Ó6\0xs\ÂzT÷oN\' …\ß\èÒ¤þŒŽ\0€w\'\ïñº£\r:‘½t\ä¦i.\Õi[\ê5:\0\'/Ö£ô˜\Þt\";\É·|©Rµ¡P\è\Çt\0üÞ…2u \ÙE¯­;\çq¾·=›Ž\0€†1X^¼OÒ‰¬z\Ãf\É}^§\Û:H]GG\0À/\ä7\Ëx#\èýÀ…r_—\ê´g\Ò\0ð)y¨/\æt¢w“û8,U/õM^^Þµt\0|,_./\èQ:\Ñ;\r\Z4\è»Î‘\ãZL\Ó|žŽ\0@/‰D.’v›Nô\Êiûwº=ƒTe(ºšŽ\0@\ïÑ—ð\î•o\È\Ö8\Óöt:\0½sB³õŸNøŸa÷\Èý\Ù µG‚{\0€^J^\ä£Ã†\r»ŒNø\×\àÁƒ/‘ûq½„v³eYO\Ð\0\èý“·~uh ðí›¯\ÑØ²\Ü)u€\ì\ï&û\è?\ápøûr\ßm\Ði[B{\Z€\ì\nï“º§5:\á2i?¤oº¤¶ó‘\0dgxŸ\Ð}œ\Ó	\ï\Ë\ÍÍ½T¦\ì\n\'¸\'\Ó\0\È\Þ)\îˆn¥L\'<ÿ&k‚w“Ô–!C†ü€Ž\0@v‡\ÂA=®7ð&\rj\rlgÚž@G\0\0\Z\Þ\Õlð\ä\ÙûfŠ³AZ…®2§#\0€Ë²*eò~†Nx‡n„¦£\é\ß\ä¾GG\0\0­§»¯d²{‘NxC0|Ô™¶\Ëõ\ë`t\0\ÐVxo–šG\'Ü¥;X±,k—³Ã•\Ñt\0\ÐQx—KýN¸z<©Ó¶\Ôgº«S:\0\è,8ôx\Ï\Ð	W¦\íz™¶¤F\Ò\0@²\á]\"µ‚Nd–n$(\Ý\"õ)Gu\0¤\Z\Þ\èôM\'2#\n]-÷^\Ý-­\Ô\ï\è\0 +\à[2ý}N\'2òF\é=Š›\ÔÇƒ\rú.\0t5P\æ\é\çt¢\ç\ä\å\å]+=®’ª—\n\Ó\0@·˜¦9K&\ït¢\Çúû¢3m¯\n\Ò\0@·9NUÒ‰ô’ ¾^{¿T](2\é\0 mœ=zUÓ‰´¾!zY·$—©{ùˆ#. #\0€t\Íx=²\è>\é\ã\rRµzŒtyS”KG\0\0=B&\ÄQzLo:\Ñ\í\àž«Ó¶,—\ä\ä\äô£#\0€ž\ïB\Ó4OÐ‰®),,ü™®¹:n\Æ`:\0\èq\Z8º\Ã:‘²¾ò¦\çuÝ’\\\Þ\0½Î¥%\0€LM\Þ7\ëq£\éDj=“:$\á}4\ÞNG\0\0%\á3P§G:‘Ü´-¡ý7\í—a\ïMK\0\0‡/—0ŠÒ‰Ž\å\ç\ç\ß*}:,uDü6:\0p\ÑJÉ¦m\Ó\éZúó¶³—4=\îy_º\0p[_Â»m@\à\×ú¹¶~¾­Ÿs\Ó\0€ghxsL\é\ÓBû\\\Ã0\Þ\Ói;þ•i\0\à92]F‡\rv8õÕ¹\ãú\Ým™¶o¤#\0\0¯N\Þ:a\Ì\æ\è^\Ñt\ïh\Î^\Ò\æñ¨\0\0x=¼›d\â¼)[ÿÿºr\ÝËœ”\î—ü\0\0?„÷\ÉlÜµ§ñKü¥Ó¶\Ô+<\0\0~\n\ïºólú?\ë1¶Es[½Í£\0\0\à+zT1™¼\ïÉ†ÿ«õ…Ø«ôs~	\ïY\Üû\0\0¿N\Þõ¸\ÞYð&¥Pþ¯õRUÙ¾\0Àÿ\á]-S\è´\Þúÿ4h\Ðw\åÿø±³—´\Ü\ã\0€\Þ0‘V\Ê\äýL/ý¿Ý¥\äÉ›“½¡P\èj\îm\0@o™¼¿’p{±7ýŸtqÜŸ\ê–\ä½õ	\0 »\Ã{so\Ú1‰öH©ù?\í‘7%¸‡\0½1¼Ë#fùZ ¸XþŸI5K=\É=\0\è\Í\á]&õ\Ïÿ÷É´\Ý(µK¦\í+¸W\0½=¼K¤Vøño‡\Ãß—°\Ö5\ÍÁ`ðQ\îM\0@¶„÷:}û\í\ï6cœüÝR;8*\Z\0 «H¾eY\Ö\ç~ù{\åo\í/½É™¶§r\0²qòž§[œû\ä\Æx=\nš\ÔV©r\ï\0²’\î\ã[¦\ÙzZW?\Ë\é½ö«!C†ü@\ÂúKù»ôð¥¹\×\0\0Y#\nýX·\Ê\Ö\éU‚0*K»š\í¡5“¿·\"77÷R\îE\0@6N\Ú;;m[\Ã=\'\'§Ÿ\Û§³`›·,\âž\0dõô\ÝQxK¸¿\é7\Ótƒ4YnÔ¯ƒq¯\0˜¾Ms};\áÝ¢ûw\ëï’ ¾\\÷µ\î|l÷\0\0]%\í\"³ux¯q\ëo²,\ë	¶õkkƒ¾„{	\0€3§\ï7\Ûø¼û\ÆLÿ2\é_)ÿön©\Ã0\î\áž\0 ºQšx]Bx\ïq\á\r\Ät] Ëµz`\î\0\0:\Ï\ç\ã\á-Sï™úwóòò®’)¿RþÝ“ò7\çž\0\0 µ\0?¦\á\É7\Üúy{Ù Aƒ¾\Ë=\0\0@Šdâžš››\Û\ã\á-\Óöµ\Øû$¼OÊ¿9”\Î\0\Ðu¤4¼§õ\Ô?g:[·.¤\å\0\0t\Ýx©¨\Ôzg™\Ö\0—°¾N&\íjY\Ö[‚v\0ž\àŽö\ät¸\îÝ™¶WŒ1\â\Ú\r\0@zƒ»³Ë“\æ\ì~µFJ¿†–O«\0\è¹\àn}ý\äT±eY¯\é–\ä¦i.õ\ÂÁM\0\0È†\àŽKiº„õOd\Ê> u<þ†6\0\Ù\àNð–N&ð¾\Øœ\ïmÎ¥\Í\0\0¸Ü‰?\×\Ò\Ö\Ï†q“ö·R\ÇdÚ¾\0\à~p·þùø\Þ\×9¨I‹L\Ü\ïM‹\0\è¹\à\î+õ’³\ìH\ë\Û\Å>ÿÑ~4WBû°„ö	ð_\Ñ^\0\0z>¸·öù\ç\ÞÔ¶v\àm\Þ\î‚.(úÿøû\æ›o®`\Ú\0 çƒ»3I\Û	\ÕV€\'w¼fÅ¯\Ô\0\ï\Ó{b\0€\àn;`\Û\n\æ\Ä\0\ï\ìú¸´\î‰\r\0\0‚»\ã`m/ \ÏN2¸ÿ\0€ž\r\îŽ¼!…\àn\à“i=\0\0=\Üx*Á\Ç*t\0\0º\à2\'t+Rü¹³Û˜¸œ\ËSñ¡ó³—qW\0\0ú\ä\ì*\ìtO\ÞOp\0\0\Ðõ\0\Ï\Ôg\Þñ}Ÿ³\Ê\0€ðtnmÞ¥Ã†\0€¶ƒµ­­À\Óõ=\ïp¶2\0 \í&·1w{k	÷tZ\0@\ÏL\àiÛ·9Á\r\0@f\'ð\Ä\0Ÿ\Õ\'¹£Š%ÞŽ\ïs\0\á	¼;ŸQ\Ü\0\0x`O%ø	n\0\0\\œÀS	b‚\0\0L\àÉ¬B÷a\ã4\0\0|3\Ç?#\'¸\0ðA€·õýp\0\0\à±\0Ÿ’\Ü\ì9\r\0\0›bš¦îŒ¥¤G\0ÀûÀ\ÅNx\Û7\0\0> Á}EAANÜ—\Ñ\r\0\0ü1y_/\á\ÝL\'\0\0ð‰üüü[-\Ëj¤\0\0øD0Ì•É»žN\0\0\à2u\ß%\á}œN\0\0\à\ÜcL\Ó<D\'\0\0ðOxO–ª¥\0\0ø\'¼Ÿ”\ÚG\'\0\0ðOxÏ\ÚE\'\0\0ðOxÏ‘\ÚJ\'\0\0ð	\Ó4ß”\ÚH\'\0\0ð	\Ã0Þ“\É{\r\0\0À?“÷r	\ïUt\0\0Ÿ\à.“ZL\'\0\0ð	Ë²>—ZH\'\0\0ð\Ï\ä½Y\Â{>\0\0À?\áý•iš³\è\0\0þ	\ïJ\Ã0ž¡\0\0ø\'¼«eòžF\'\0\0ðOx”z˜N\0\0\à–e•\ZI\'\0\0ð\Ï\ä]\'\ám\Ñ	\0\0ü\Þ\rÁ`ðv:\0€O˜¦\ÙTXXø3:\0€&\ï–P(t5\0\0À?\á\Í\ÍÍ½”N\0\0\àŸð¶srrú\Ñ	\0\0|@C[Ã›N\0\0\àºº\\W›\Ó	\0\0|B7T\Ó\r\Ö\è\0\0>¡_Ó¯Š\Ñ	\0\0|BwÎ¢;i¡\0\0ø„\îUwJ\'\0\0ðOx\Ô“\Ð	\0\0|Bª‡¥\0\0ø„iš\Ó$¼«\é\0\0>a\Æ3–eU\Ò	\0\0ü3yÏ’ð\ÞA\'\0\0ð		\îù\àt\0\0ÿ„÷B	\ïõt\0\0Ÿ(((X,õ1\0\0À?\á½Jj\0\0À?\á½Fj\0\0À\'L\Ó\Ü(\áý\0\0À?“÷VË²^¡\0\0ø\'¼wK½@\'\0\0ðOx#“÷t\0\0Ÿ0M³6N¢\0\0øgò>,>šN\0\0\àŸð>n\ÆP:\0€Â»^\ÂûN:\0€Â»Q\Âû:\0€Â»Y\ê::\0€\Â;\Z‡/§\0\0ø\'¼\íH$r\0\0Àújx\ë’V\0\0\à@\àb\'¼\0€˜¦y…~\æM\'\0\0ð\Ï\ä}½nmN\'\0\0ð‰üüü[-\Ëj¤\0\0øD0\Ì\Õ=¬\Ñ	\0\0|B¦\î»t\ß\æt\0\0Ÿ\àcš\æ!:\0€\Â{²T-\0\0À?\áý¤\Ô>:\0€\Â{†\Ô.:\0€\Â{Ž\ÔV:\0€O˜¦ù¦\ÔF:\0€O†ñžL\Þk\è\0\0þ™¼—Kx¯¢\0\0ø„w™\Ôb:\0€OX–õ¹\ÔB:\0€&\ï\Í\Þó\é\0\0þ	\ï¯LÓœE\'\0\0ðOxW\Z†ñ\0\0À?\á]-“÷4:\0€\Âû \Ô\Ãt\0\0Ÿ°,\ë¨\ÔH:\0€&\ï:	o‹N\0\0\àŸðnƒ·\Ó	\0\0|\Â4Í¦\Â\ÂÂŸ\Ñ	\0\0ü3y·„B¡«\é\0\0þ	\ïhnn\î¥t\0\0ÿ„·““ÓN\0\0\à\Z\Ú\Z\Þt\0\0Ÿ\Ð\Õ\åºÚœN\0\0\àº¡šn°F\'\0\0ð	ýŠ˜~UŒN\0\0\àºs\ÝI\0\0À\'t·¨º{T:\0€\Â{¤˜„N\0\0\àz(P=$(\0\0À\'LÓœ&\á]M\'\0\0ð	\Ã0ž±,«’N\0\0\àŸ\É{–„÷:\0€OHpÏ—\0¯ \0\0ø\'¼Jx¯§\0\0øDAAÁb©\é\0\0þ	\ïUR\Ë\è\0\0þ	\ï5R‹\è\0\0>aš\æF	\ï7\è\0\04lØ°\Ë,ËºQ{@\Â\ä½U.{…\î\0\0\à\Í)ûy	k»ŠJ5iiÀ\Ó-\0\0<Bÿ\ÙA€k±·5\0\0¼D¦\ê\×:\no¦n\0\0<&\'\'§Ÿ„ts[Ámš\æ:\0€IP·õ™w\â†l\0\0ÀC4¤\Û\ï:\0€·§\ï\í	Á\Ý‰D.¢+\0\0xX~~þ­	Ÿu/¤#\0\0øcú®v¶0¿Šn\0\0\à1\ÎVæ“¥J¥j\Ûø¾·n~Pª,\Îd5:\0\0.\É\ËË»V7F“@n\ìd\ç,­¿\ï\Ýbšf\ßû\0 ƒ“¶„\ï‡\Úv*¡\ÝN•1‰\0Ðƒtc4™˜\ë[‡ð¨Q£\ìY³fÙŸ|ò‰½o\ß>»¾¾\ÞVº¬©©±?û\ì3ûµ\×^³ÇŽ\Û\Ö\\\êÃ¸“\î\0f²\ÃC¡PKbð>ò\È#±`nnn¶“U^^nOš4©­¹L£\Ë\0\0¤1¸W“KˆÛ‹-J)´[ûð\Ã\íH$\Òz\n\'À\0\è.]U.ÁM\\E¾m\Û6;v\ï\Þm=ú´	œU\è\0\0tƒnœ–ø··~†Núû\\?g#6\0\0ºH·*O\\Už®‰»­	¼\Õ*ô5t\0€\é÷¸?\ç\ÖÏ¸{’~žøù·®®\ç^\0\0 º–Ä­\Ê\íž6aÂ„\Ä\Õ\ç\Ü\0\0$I?\ëN\Üsš~,6n\ÜxÚžØ¤úso\0\0ý\ÊV\âFj\ÝùJXªw\ä¢ûB\ç\Þ\0\0 	\ÎAFb:{öl;“\æÏŸ\Ú\îS¹7\0\0H.¼k\ãª»<\Í$]EŸ°\êü÷\0\0I\Ð<õywUUUF\Ã[¿÷x8Q\î\r\0\0’›¼Ohü #™¢ÿ^\â¿Ï½\0@Š\á\í\Â\0\0&o\0\0z7>ó\0À“7[›\0\à³ð\æ{\Þ\0\0ø‰L¼O¸µ‡µx€=¬\0*Ý·¹~\ÞÌ¾\Í\0ð=¦v\âQ\Å21}Oš4‰£Š\0\ÐUz<o	\Ñ(\Çó\0À_\Ó÷©\r\×B¡½mÛ¶	\îÝ»w\ÛC‡M\ï5t\0€.ˆD\"™¦Y—¸ñš~;\Ý\ß\ë¾ÿþûW—\×\é¿K÷\0\è\"\Ã0\îL\\}®ž®	\\\'\î\Ä\à\ÖGÿ=º\0@÷||b€\ë*tý¼;±\égÜ­V•\ë\Ô=n\0\ÐC\ß\n½¼¼<å¯ƒM™2\å´\Ð\Ö\ßKp\0\Ð3~g\âg\à‰«\ÒuOlk×®\í=~0]\êg\Ú\Zðº\ç´\Ä°$~\ÆÍªr\0\0znL–¸z7k\r§\0!ú=p™š\×\'\î‰-™\Ò=§\éX‚Á\à\ít\0\0\è®T}¡\ë4^›x8Ñ„ÝœÒƒŒ\è¾\Ê\Ù\å)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\ÏùÿÀ¨z(D¶Ù¯\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','2501',2),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-07-05 02:06:08.594',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:12',1,'http://www.activiti.org/test','åˆåŒ','Contract',1,'1','/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:1:10',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'1','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('TestPlan:1:13',1,'http://www.activiti.org/test',NULL,'TestPlan',1,'1','/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png',NULL,0,1,1,'',NULL),('TestReport:1:11',1,'http://www.activiti.org/test',NULL,'TestReport',1,'1','/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png',NULL,0,1,1,'',NULL);
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
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `assignee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneeaddr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assgineeauthrepre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneebank` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneebankname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneecompanyname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneecontact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneefax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneepostcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneesigndate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneetel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneeusername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientaddr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientauthpepre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientbank` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientcompanyname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientcontact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientfax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientpostcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientsigndate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clienttel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientusername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contractbody` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `finishtime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `quality` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `signdate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `signplace` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_contract`
--

LOCK TABLES `tbl_sys_contract` WRITE;
/*!40000 ALTER TABLE `tbl_sys_contract` DISABLE KEYS */;
INSERT INTO `tbl_sys_contract` VALUES (1,'p20190606171309','',0,'A',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'A',NULL,'A','A',NULL,NULL,'A',NULL,NULL,NULL,'A','85733','A','A','A','u20190605134344','',NULL),(2,'p20190606171310','',0,'B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','2357','B','B','B','u20190605134344','',NULL),(3,'p20190606171311','',0,'C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','5225','C','C','C','u20190605134344','',NULL),(4,'p20190606171312','',0,'D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','36432','D','D','D','u20190605134754','',NULL),(5,'p20190606171313','',0,'E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','12343','E','E','E','u20190605134759','',NULL),(6,'p20190606171314','',0,'F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','1123','F','F','F','u20190605134754','',NULL),(7,'p20190701205847','',0,'G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','1141','G','G','G','u20190605134344','G',NULL);
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
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (4,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171312','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134754',NULL,NULL),(5,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171313','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134759',NULL,NULL),(6,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171314','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134833',NULL,NULL),(37,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704142958','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(50,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704191843','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(39,'',0,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.opword.book1\",\"basic-form.others.reqword.plan\"]','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\",\"basic-form.radio.opsystem2\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704143058','form.sample.radio.destruction','','basic-form.mediumg.label','','','[\"basic-form.checkbox.architecture2\",\"basic-form.checkbox.architecture3\"]','','','','\"\"','','','','','fasdafd','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(49,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704185453','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(40,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704143523','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL);
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
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `design_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `designer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expected_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `regu_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062933 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testcase`
--

LOCK TABLES `tbl_sys_testcase` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testcase` DISABLE KEYS */;
INSERT INTO `tbl_sys_testcase` VALUES (2019062909,'p20190606171311','',0,'note3','d3','3','note3','c3','p20190606171311-20190629205845',NULL,NULL,NULL,NULL),(2019062908,'p20190606171310','',0,'note2','d2','2','note2','c2','p20190606171310-20190629205816',NULL,NULL,NULL,NULL),(2019062907,'p20190606171309','',0,'note1','d1','1','note1','c1','p20190606171309-20190629205733',NULL,NULL,NULL,NULL),(2019062910,'p20190606171312','',0,'note4','d4','4','note4','c4','p20190606171312-20190629205922',NULL,NULL,NULL,NULL),(2019062911,'p20190606171313','',0,'note5','d5','5','note5','c5','p20190606171313-20190629210039',NULL,NULL,NULL,NULL),(2019062912,'p20190606171314','',0,'note6','d6','6','note6','c6','p20190606171314-20190629210242',NULL,NULL,NULL,NULL),(2019062917,'p20190606171312','',0,'note7','d7','7','note7','c7','p20190606171312-20190629223943',NULL,NULL,NULL,NULL),(2019062918,'p20190606171309','',0,'note8','d8','8','note8','c8','p20190606171309-20190629224200',NULL,NULL,NULL,NULL),(2019062919,'p20190606171312','',0,'note9','d9','9','note9','c9','p20190606171312-20190629224229',NULL,NULL,NULL,NULL);
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
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auditor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hardware` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `progress_table` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `staff` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062916 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testplan`
--

LOCK TABLES `tbl_sys_testplan` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testplan` DISABLE KEYS */;
INSERT INTO `tbl_sys_testplan` VALUES (2019062901,'p20190606171309','',0,'AA','Aser1','Aser2','Abody','ssd',NULL,'nju','Aser3',NULL,NULL,NULL),(2019062902,'p20190606171310','',0,'BB','Bser1','Bser2','Bbody','ssd',NULL,'stc','Bser3',NULL,NULL,NULL),(2019062903,'p20190606171311','',0,'CC','Cser1','Cser2','Cbody','ssd',NULL,'dev','Cser3',NULL,NULL,NULL),(2019062904,'p20190606171312','',0,'DD','Dser1','Dser2','Dbody','ssd',NULL,'online','Dser3',NULL,NULL,NULL),(2019062905,'p20190606171313','',0,'EE','Eser1','Eser2','Ebody','ssd',NULL,'2019062905','Eser3',NULL,NULL,NULL),(2019062906,'p20190606171314','',0,'FF','Fser1','Fser2','Fbody','ssd',NULL,'2019062906','Fser3',NULL,NULL,NULL);
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
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bug_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `design_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `designer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `exe_process` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `executor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expected_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_consistent` bit(1) NOT NULL,
  `pre_condition` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `real_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `regu_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testrecord`
--

LOCK TABLES `tbl_sys_testrecord` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testrecord` DISABLE KEYS */;
INSERT INTO `tbl_sys_testrecord` VALUES (1,'p20190606171312','',0,'a4','000','note4','d4',NULL,NULL,'4','\0',NULL,NULL,'note4','c4','p20190606171312-20190629205922',NULL,NULL,NULL,NULL),(2,'p20190606171312','',0,'a7','000','note7','d7',NULL,NULL,'7','\0',NULL,NULL,'note7','c7','p20190606171312-20190629223943',NULL,NULL,NULL,NULL),(3,'p20190606171309','',0,'a1','001','note1','d1',NULL,NULL,'1','\0',NULL,NULL,'note1','c1','p20190606171312-20190629205733',NULL,NULL,NULL,NULL);
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
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `approver_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auditor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auditor_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_company` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_contact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_post_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hardware_environment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `report_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_menu` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_environment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_basis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_conclusion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_exe_record` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tester` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tester_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062912 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testreport`
--

LOCK TABLES `tbl_sys_testreport` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testreport` DISABLE KEYS */;
INSERT INTO `tbl_sys_testreport` VALUES (2019062901,'p20190606171309','',0,'A1','20190620','A2','20190620',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3','20190620','1.0',NULL,NULL,NULL),(2019062902,'p20190606171310','',0,'B1','20190621','B2','20190621',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B3','20190621','1.1',NULL,NULL,NULL),(2019062903,'p20190606171311','',0,'C1','20190622','C2','20190622',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C3','20190622','1.2',NULL,NULL,NULL),(2019062904,'p20190606171312','',0,'D1','20190623','D2','20190623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D3','20190623','1.3',NULL,NULL,NULL),(2019062905,'p20190606171313','',0,'E1','20190624','E2','20190624',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E3','20190624','1.4',NULL,NULL,NULL),(2019062906,'p20190606171314','',0,'F1','20190625','F2','20190625',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F3','20190625','1.5',NULL,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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

-- Dump completed on 2019-07-05  2:07:31
