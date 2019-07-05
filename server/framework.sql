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
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"CusSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"StaffReview\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2502',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestPlan\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestPlanID\" name=\"ID of test plan\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestPlan\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\TestReport.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562206221743\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestReport\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestReportID\" name=\"ID of test report\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewReport\" name=\"TMReviewReport\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TMReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"qmReviewReport\" name=\"QMReviewReport\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"qmReviewGate\" name=\"QMReviewGate\"/>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusReviewReport\" name=\"CUSReviewReport\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CUSReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitReport\" name=\"TSSubmitReport\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"_12\" sourceRef=\"start\" targetRef=\"tmReviewReport\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"tmReviewReport\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_14\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"qmReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" sourceRef=\"qmReviewReport\" targetRef=\"qmReviewGate\"/>\n    <sequenceFlow id=\"_16\" name=\"é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"cusReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_17\" sourceRef=\"cusReviewReport\" targetRef=\"cusReviewGate\"/>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_20\" name=\"ä¸é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_21\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_22\" sourceRef=\"tsSubmitReport\" targetRef=\"tmReviewReport\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestReport\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"25.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewReport\" id=\"Shape-tmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"210.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewReport\" id=\"Shape-qmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewGate\" id=\"Shape-qmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewReport\" id=\"Shape-cusReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitReport\" id=\"Shape-tsSubmitReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"20.0\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"tmReviewReport\" targetElement=\"tmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"start\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"57.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"qmReviewReport\" targetElement=\"qmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"tmReviewGate\" targetElement=\"qmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"237.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"cusReviewReport\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"525.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"qmReviewGate\" targetElement=\"cusReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"412.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"tmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"227.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"cusReviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"251.0\" y=\"617.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"qmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"396.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"tsSubmitReport\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"65.0\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"cusReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"601.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"420.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2504',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"SSSubmit\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\" activiti:candidateGroups=\"SM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\" activiti:candidateGroups=\"QM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2505',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"CusSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"StaffReview\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2506',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.TestPlan.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0=IDATx\Ú\í\Ý\\u™?n\nAñ².Z*EY.E¹ReQ¨e±\å\"†µ\Ö5ZY1\Éô™\î\ÉÀhK¸W…’\"•dQt1‹þ€Z`ED pB„r!!\nˆ	w˜@B„@n“Ëœÿû\í\íÉ¿If’ždfº\Ï\ÌóT½uzº{&“wºû\Ó\ï9§\Ï\Ùk/\0\0\0`ˆM½p^\ÞW\r\Ö\í\0À„÷Î®\Û\Ó\Û\0\á\r\0\Â[x€ð\Þ\0 ¼€mAkos\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0h\ryž\ï\çwþ\æ\â‹/^;kÖ¬žoû\ÛyWWW\Þ\ÞÞžwvv\æ\ßúÖ·òiÓ¦mš9s\æKgœqÆ¿\é\04\É\Ë/¿\Üqõ\ÕW¿ñ\Ío~3Ÿ2eJþ‹_ü\"ÿý\ïŸ/_¾<ß°aCžlÚ´)_¹reþ\àƒ\æ\×\\sM~\Ê)§ä§vZ\Ï\ÙgŸ}o¹\\>@`x&\í\æÍ›·úô\ÓO\Ïc\Ò\Î}ô\ÑjH7jñ\â\ÅyL\éù	\'œÇ”>SG`ˆ§\íÿ÷ÿþ_\ÏÔ©SóE‹\å{\â\É\'Ÿ\Ì\Ï8\ãŒü\ä“O~¥««k\Ý€Aö\æ›ož1mÚ´ü\Â/\Ì\ßx\ã|0¤\Õ\ë\é\çzê©¯[\0ƒ<q§\à>ÿüóó-[¶\äƒ\í’K.Iø_ÇŒ³ŸnÀJÛ¸Óªò4!Ep÷ú\éOšOš4\éE€=”vNKÛ¸kUù\ÎV¡Ÿr\Ê)=\åryª®ÀnJ«\Ë\Ó^\åiò\ávb\ë\è\è\Øjû7\0\ì¦ô9\îôq°\áôý\ïS{{û­º\0”Žœ–À2\\Sw¯\'žx\"\É{³\×\0`€fÏžý\Ûtä´¡\ÜI­?]]][³,;Á_\0 «<ò´~ò“Ÿ¬ooo_\à¯\0\0N2’ŽU\Þ÷\ßÿ–\ï¥þ\n\00\0\é\ì`\é$#Í°zõ\êž\ïn\0€t:\ÏÞ³ƒ\r·t¢“tJQ\0€ž\Í$¼`€Ž?þøfN\Þ=\Â\0\è\ßþ\íßš¶\Í{\åÊ•›ló€š>}zw³ö6¿ó\Î;W\Ú\Û\0\è\Üs\Ï}±YŸóž6m\Ú\nŸó€:\ãŒ3¾v\Ê)§4\åk\éð¨Ž°\0»\à[‡û\Ø\æ.L«\Ì\Û\0v\Ç9\çœs÷ü\ãa\r\ïO<q…³ŠÀn\ê\ê\ê\Úÿ\ßøF\Ï\âÅ‹‡%¸ÿð‡?¬NS·óyÀ8\í´Ó¦~ú\éùo¼1¤Á½~ýú­•JeS÷T]€=t\Ê)§,ÿ\ÉO~2”;¯õÄ¿±2Ë²\çu\0A\Úy,&ð\Õ_|ñPx\Ï\ÙgŸý—ô¹î´š^·`ü\ÄO\\ùŸÿùŸùºu\ëmUù©§žšvP[j;7\0Q€wvv>\ÒI\'õ<ò\È#{¼sZ\ÚÆV•›¸`ˆ¥\Ê&Mš´eúô\é›SˆdUúC=´*mC¯\íUn\ç4\0.iZŽ©ùú4=w\Üq=³f\ÍZ\Ï=÷lY±b\Å\Öt>î¤»»»\'dä®»\îZyšŽœ–B;}Ž\Ûjr\0h¢\ãÎ¨9Q/F ¯O§ó¬«\î´M;ja:\ä©#§@k‡zOgg\çÁ:\0\Å	\ïM¥R\é\0€\â„÷\Ú\ï\ãu\0\n¢\\.¯ŽðþžN\0@q&\ï´Û…:\0\Å	\ï\Ç\"¼¥\0Pœðþ]„÷l\0€‚(—Ë·D=¤\0P¥R\é\ç\ÞO\ë\0D{{ûyQ\Ëu\0\n\"Ë²\Ó#¼_\×	\0(ˆR©tl„÷\0€‚hkkûT„÷\0€\â„÷ûÓ™\Åt\0\n$…w:÷·N\0@q\Â{k\Ô\'t\0\n\"Ë²i\Ç5\0€\âLÞ¯Gª\0Pœð^žÖ¢\0Pœð~&&U\'\0  Ò‰I\"¼o\Ö	\0(\Î\ä=\'\ZT\'\0  *•\ÊÿDx?¦\0PY–]\áý¢N\0@q&\ï³\Ë\åòj\0€‚(•J\Ç\Ç\ä½V\'\0 8\á}L„÷&\0€‚È²\ì£\Þ=:\01cÆŒ}Ò™\Å\ÒR7\0  \Ò\ä\Ý\Ù\Ùy°N\0@q\Â{S\Úö­\0Pœð^›ö:\×	\0(ˆô9\ï\ï\ï\é\0gò~1iM\'\0 8\áýX„÷¯t\0ŠÞ¿‹ðž­\0P\årù–t^o\0€‚(•J?ð~Z\'\0  \Ú\Û\ÛÏ‹Z®\0PY–\áýºN\0@A”J¥c#¼7\è\0D[[Û§\"¼·\è\0\'¼ßŸ\Î,¦\0P )¼»ººö\×	\0(Nxoú„N\0@AdY¶1í¸¦\0Pœ\Éûõ¨/—\ËGEŸ5+\ê€ö™\Ô+\"¨_K‹\îIÛ¼·«-cÆŒ\ÙO·\0 DhÂ¹À\ÞV\è\ë\0´\è\Ëw\Þ\'Nü¼.@\ëø›ýL\Ý\Ï\ë\0´ ŽŽŽ¬¯ðN\Û\Äu\0ZTL\ÙOnÞ›\í¨\0­Þ‡D`\×\ïm>_W\0 Å•\Ë\å›zÃ»££\ã\Ó:\0-.­&\àÞ”&p\Ý\0€‚ˆ\à¾@x@<\Ï÷{þù\ç—.\\¸0Ÿ;wn>{ölµ5gÎœü\Þ{\ïí‰ºÄ£\n€!•‚{Á‚ùÊ•+ó\î\înµµjÕª|þüù=\ä³<²\02i\âÜƒ\à1‰w{d0dÒªr¡;¸•V£{d0dR\Ð\\\á\rÀïµ¯/ÏŸðù\â9ÿ^­t9]\'¬…7\0-\Þo¾öRþØ\ÓòGnû\î[*]—n\Ø\Â€ï¥‹o\Ù!¸{k\Ù\â[¶ð \Õ\Âû‰»ÿ£\ßðN·	l\á\r@‹…÷c³gô\Þ\é6-¼\Þ\Â\0ö$¼\Ó\Þ\åý…wºM`o\0Z,¼Ÿ¹\ï\â~\Ã;\Ý&°…7\0-Þ¯¾ôhþ\Ø]\Ów\\e×¥\Û¶ð \Å\Â;Õ’‡®\Ú!¼\Óu\ÂZxÐŠ\á½qcþ\Ìý—\ì¸\Ê<®K·	l\á\r@…w:‚\Ú\Ó÷]\Ô\ï6\ït›£¬	o\0Z!¼c¢^þÌ¼ü\Ïwœ\Ýop÷VºOº¯)\\xÐ¤ð\ÞÕ´m\n\Þ\0´Xx72m\ïl\n\Þ\Â€a\ï\Ý\r\î\Þ\Þ\Â€ao%¼\Þ\Â\0„·ð@x+\á\r€ð\Þ\0 ¼…7\0\Â[xo\0„·ð\Þ\0´nx_z\é¥ù\ßÿý\ß\çû\î»ouy\ÅWl»-~ü¶Z¸paõº´¬¿~ûû¥Ÿs\È!‡\äs\ç\Î\Ý\íß©þgo\0„w]]{\íµÕ<\á„ò\r6\ä\'tRõ\ëo¼q‡Pž5kVõºó\Ï?¿\ßðN—Ÿ|ò\É\ê\åC=\Ô\ä\r\0ƒ\ÞGyd5hŸ{\î¹\ê\×K–,©~}ô\ÑG¿%”Sù\Ë_®^—–‡vX¿\á\ÝûušÀ\Ó\åU«V\å\Çw\\þŽw¼#\ç;ß™O˜0!_¶lÙ¶7“&Mª\Þ/\Ý\'}}\Í5×¼\å\çõ÷ý\Â€Q\Þ)`÷\Únõtú:…d}(O™2¥\Zž\ëÖ­«~Oúº¿ð~øá‡«—?üð\ê\×]]]Õ¯\Óõ‹-ª^þ—ù—ü\å—_®^>è ƒª÷;ø\àƒ«_/]ºô-?¯¿\ï\Þ\0\ï>¦\æ\Þ½\á†ª\Ë\éÓ§W—7\ÝtS¿Û¼Sq\ÄÛ¶‘§\Ð\ßþöt]º\í\ãÿxõ\ë»ï¾»ºLýöovöý\Â€Q\Þ)d÷ª­6ÿ\êW¿º-”\Ógõ!š&î·½\ímù‡?ü\áj°§¯û›¼O;\í´ü\Ý\ï~w~\Ûm·½%|\Ó6õ\íÿý\Þ	þ+_ùJu™¶¹÷\Þ}}³\Â{ò\ä\É•\Ë\å)\í\í\í\×z0¬\á}ù\å—o\Í.¸`[h¦Ò¶Ñ´<]3f\Ì·\Õ_N!›\Âÿ}\ï{_ux¥R©\Þö\ßÿý\ß\ÛV©ö³Ÿ­Þ·w¢\ï]p\Ýu\×\íðóvöýýý{\í\á\Þ\êÛ‡w\n\ëR©tf„õÚ¯\Å2¯\ÕR@\0†5¼S¥\Ð>ðÀ«“õ\'?ù\É\êö\îÞŸY‚3gÎ¬^þÁ~°Ë°\ì\à#ðò+VT·[§Ÿ›¦è´½ú\Å_¬\ÞoÍš5\Õ7\Ý7-\Ó\Îi\Ûÿ¼}ÿP…÷o~ó›Ì—G=a½©.¬\ßRY–\Ý\áÀ°‡÷öu\Ï=÷TCw´ eýúõ\Õ=\àû\ìúš8q\â\ç=hzx«\îüÿ÷S8\ßÕ³“ð\Þ\ê\Ñ€ðn±ƒ´ttt|:Bz\íNV›¯Œš].—§Ž7\î\0\ï8\ÂZó\Ô+ú\ï?\Æm?L;±E€¿Q»nm\\~8jV¥R9Â£\0\á\ÝÄŠ¥P®\ï\Üõ·wuu\í_ûø\Ø\íq\ßQi•û\æX>Ÿ>Ra>~ÆŒûx\Ä ¼‡ñs\ÞÀ—\ÔÂ»gÌ˜1û\í\âO³w\ÜÿKq\ß+#ÔŸŽew-\ÐWE\Í)•J\ß\ê\ì\ìüG0€ðVC|–\à\Ò4½;«ø¾C\"¸Ï‹0ÿCÔ¶U\íqùO\æ\Ä\åOxDo5GXk`\ên\ÈØ±c\ß¡}r\Ôo#¸—§=\ØÓªöó%ô¿Š\Ë­jÞªÅm¡ý…óŸGp?•Vµ§Uô\æ«\ãúyqù;i:z\0\á­Zø\Ä$]]]«T*\çFp/ŒZS[Õ¾.\Â|QùO\Ó\Ç\Ù<\0„·ðná³Šµµµ½\'\ÂûQ·F½Ü»ª=ê…¨\ë\"Ì³¸\Ï\Û=3\0„·ðna1ÿs:{L\ãO\Ærcm¯ö\ÕQw§ªŒ?þ@\Ï\0\á-¼[X„÷G£f\ÖVµ¿^;\Ì\ëút¢•¸þ\ÂX\é™ ¼…w;ñ\Ä\ßýõ˜\ÂoŽ\åKµU\í[¢^Œ©ý†XV¬j\ÞÂ»\ÅESøeÜÇ²wUû«\æ÷\Äm\ß;\î¸\ã>\ì\Ù0D\æÎ+p…÷\ë\ì\ì<¸R©L\0¿/‚üµ\ÞU\íqùÏ±¼xÒ¤IŸñl$,Øºr\åJ¡;HµlÙ²#¼»Gû\ã*­j)ükÜ¿‰\0_—{Wµÿ%.5¾ž4X«u\æÍ›w\Þüùó{^yå•–Æ7¶|pÏ™3gs\Ô,¬E`.‚üÒ¨\Å\àj\Óù_£î©ý\ìX~D—\0\Za33¦Åµiuo«\Ö]w\ÝU=W+ÿŽi\âÜ›<yòAñ7=\'jAû_kažBý±øÿ*•JG\ë@Á¥ðN\ÇóÖ‰‘)­F¿qg„ö¯#Ì—\ÖV³§Z\Z_\ß\×oU;@Á¤=š\í\Å<ºDh•¦ð4÷®j\ë\Òq¿‹š–¦w]h\íò­&L8T\'F¯ôæ­¶}ü\Þ\Úöò\êªö´=mOO\Û\Õu	 …¤U¨N¤A½´\Z=í¹žö`¯\íÉ¾%½\ÉK{¸§=\Ý\Ó\ïi\Ïwh^xoJ\Ñ	v&}¦<}¶<üÑ¨tX×ž\Úg\Ï\ïKŸEOŸI\×%€\á\ïñ\âû` Ò‰U\â±sV\Ôüt¸\Ú\Ñ\à6F=“ù\Ï&Nœøy]ºð^—Ž£­\ì‰tö\ír„øõ\éø\ìµ=\Ú\ÓAd^Š«o‰\ëOH§N\Õ)€A/ªo¤sQ\ëCð\Æð\È\Ú\Ó©A­§vFµ…\ék\éLkº°\ÒG„¢¦\ê\ÃðX; \Ë<\Ó<Û¼wU{\íœç—§s \ë@c“÷ªô1!`¸Í˜1cŸŽŽŽ,‚ûº¨¢6×Ž\×þrÔ­iU\í\0}ˆ\È\åQ\ç\é­ \ÂúS\à?‰\Ç\ä¢xc™ö\ÇH‡ð]“Vµ\Çõ\ß\ï\ê\êú˜.Â»½ý/\é\ÅR\'hEŠ\Ç\ç·\ãq:7­%ª\r®;–O\ÅòŠû/\ê0\Z\Ãû¹t- Òªöx\ÌNŒ\Ç\ì¯\"¼—¤Uíµ½Ú—\Ç×·•J¥“«ñ\Ò\ÎBñ¢÷K Ào@?¡}A<Žÿ—×¦U\íqù¨?¤MBÿŒ\Äð~4\í0¤Œ\ãÆû@„ù·\âq=\'jUm¯ö\îó§cye¥RùR\ÜmoŠ\Þ¦ƒh\è#UZ\Õ=>‚ûÚ´™(8zÔŠ¸|{<þ§tuu\í¯S@a¤cSGÝ¥Œ&\æGDý8û\ì]\Õõfz3\Ëutt¦K@+O\Þóbò¸G\'\Í\Ú\Ú\Ú\Þ¡}Fz#Ï‰•µ½\Ú7\ÅòÙ¨«J¥Ò¸½¬jZhò¾=}†V\'\à-öN\'\ì‰\ç\Æ\Õ\â)À7\Õ\ïúJÔð§§À\×& )\â…é¦´—®NÀ\ÎE`<\êüx¾<”V±§U\í\Îk4kò¾6^\ëø¹“;|+\Ð¥R\é\ç\é#4:\ï´]ü\0\0šñtq\Ô€‡·ÓšM‘>./@\Ët\Þ[\ÓG\Îtv\Ü3\Ó´:~\îlž4i\Ògtv¥R\é\Ì\ïWu<ywG€A\'€f¼\0\ZõºNÀ€Ÿ;\â\Í\ï±:»r¹üµtxH€‡÷º¨ŠN\0\Ã.Ë²¶xZ¯0\à\ç\Îñ\Üù†N\0Ã®­­\í‹1}w\ë8¼_K\ÇC\×	`\ØEp/@›uü\ÜY]*•¾§À°KŸSMŸW\Õ	˜xÞ¬Hµ\Ô	`Ø¥#D¥#E\é8¼_J\'*\Ñ	`\Øuvv~(`A\'`À\áýB\ÔE:»¶¶¶·oØ­ð~¶\\.ÿL\'€f½¥S¾]\'`@Ï›Ç£®\Ö	 i\á=nÜ¸\è\èyóH–e\×\ëÐ¬¡ž\Î\ÎÎƒu\ZW.—*•J7\ëÐ¬!§6„¿\é½?\êN\0šõ\"´9¬E\'`@Ï›ùQw\ëÐ¬É»;&U\'`@\á}gš¾uhÖ‹Ð†¨‰:z\Ó{K–e\êÐ¬ð^[*•Ž\×	Px\ß\á½H\'€f…÷š¨Suô¼¹:}\Ö[\'€f½½\Z“÷™:z\Þ\\õŒN\0\Ízz%j†NÀ€ž7¥\ã›\ëÐ¬!gG‚ªT*?Ž\ç\Í2\0š\ÞÎŽ\ïs#¼W\è\Ð\årù\éR©ôs€\Æ\Ås\æ{ñ\ÜY­@S\Äô°8&\ïkuô¦wj\Ôk:4\ëE\èO1EüZ\' qñ†÷ñ\Æ÷\r\0š5yÿ>ü6€½\éÏu:4k‚¸7j®N@\ã*•\Êøtha\0š\ÞwEÝ§Ð¸˜º¿Ï›n\0š\Â	`·ž7G¥\Ó\é\êÐ¬	\âúxzD\' q•J\åˆx\Þl\Õ	 )\âèª¨\'t\Z\×\Õ\Õõ±x\ãÛ£@³&\ï\Ë\"¼Ÿ\Ó	h\Üøñ\ãŒ\çðš£\\.ÿ$^„þ¢Ð¸¶¶¶÷\Äó&\×	 )\âè¼¨\åµ ? \íˆ3aÂ„\Ãu†f\Êó|¿\çŸ~\éÂ…ó¹s\ç\æ³g\Ïn¹J\áÝŠ¿W}Í™3\'¿÷\Þ{{¢.ñ¨‚\âN\ÙdY¶>\í%›v¶I/>ý\Ô|Ý¢™Rp/X° _¹re\Þ\ÝÝ­ö V­Z•ÏŸ?¿\'‚|–Gw\Ò^°“\ÐN\Õ3yò\äƒtŠfJ·\à\Ü\0I\Ü\çÒ¡\È\Ów\ÔÎ¦\ît‰fK«Ê…\î\àVZ\î‘\Åð›ú\ï,\Ë\Ñ!š-À\ÞÀv\Ów_Û¼#¸\ÖŠ\Þk__ž?ÿ\à/ò\Åsþ½Z\érºNXo‘*•\Ê%Û‡wGGG¦3%¼\ß|\í¥ü±;§\å\ÜöÝ·Tº.\Ý&°…7ŒHµ=\Ï{\Ã{©ŽP¤ð^ºø–‚»·–-¾U`o™\Ê\åò\Ô\ÞðN—u„\"…÷wÿG¿\án\Ø\ÂFòôýF\íHQ>F¡\Âû±\Ù3ú\r\ït›À\Þ0bMœ8q\Ú1\Ç“žÔ©f\ê\Â[x­\ï¬}÷\Ý7=©Óž\æ=œ¢„wÚ»¼¿ðN·	l\á\r#Õ™\Ûö9œ¢„÷3÷]\Üox§\Û¶ð†\ÑÜ»ºZ*¼_}\é\Ñü±»¦\ï¸\Ê<®K·	l\á\r£%¸·¿ý­¢U\Ã;Õ’‡®\Ú!¼\Óu\ÂZx\Ãh\î^V¡\Ó\Ú\á½qcþ\Ìý—\ì¸\Ê<®K·	l\á\r£-¸\ë|«	œV\ïtµ§ï»¨\ßm\Þ\é6GY\Þ0\Zƒ»þû¶šÀi‰ðŽ‰zù3óò?\ßqv¿Á\Ý[\é>é¾¦p\á\r£-¸·ÿ~8M\ï]MÛ¦p\á\r#9¸÷ŽúYm¹3\Û\ß\Ï6pš\ZÞL\Û;›Â…·ð†\"÷S{ý\ß\ÑÔž\ÚI€÷w?8M\ï\Ý\r\î\Þ\Þ\ÂŠ\Ü{\Õ&é¼®ú\nðú\à\î­\Ëvñs¡!cÆŒ\Ùow\Ã[	oÁ\Ý_0\×ø®n\ïe:»¥½½½;K^xo ±\à\ÞU€\ï\Ó`p\×ÿ;öBg \á\Ý{\n\ÚMY–]\Ø\ß$.¼…7\î\Æ¼{\0Á½}€\ÛÎ€Â»·\"À\×G\Í\Þ\Âwcú\nðw/«\Ð\Ù\íð®«µQ\ço\á\r£\ÉAµ\Ð]<À\ïÛ§‰»»vý@Ü±“\å\Þ\êÙ®¶nW[jµ¹V›Òª\ÕÚ²;–kµ!Uš\Øb™¦¶uµþ7S\Å}ßˆåš¨\×\ã¶\×\â\ë¿\Æ\åWS\Å\åÕ±\\×¯Œ\å+±\\\Ë\åQ/\Õji\Ô_¢^Œz!\î¿$–\Ï\Åò\ÙX>õT|Ï“±|\"–‹cùX,ÿ\ËG¢\Å\å‡cù\ÇX>\ßó‡¸¼°V÷E-ˆ\ë\î‰\åü¸}^,\ç\Ärv,ïŒº½T*ý6–·\Æò\æ¸\ßMqù\ÆX\Þ\Ë\ë\â~¿Š\åµQW\Çu¿Œº\"\î÷óXþ,n»4\ê¿â¶‹\Ój\è¸\î\'q\Û•J\å\ÇqÝ¢Î‹ë¾Ÿ¦Û¸nz\n\ÈXžË³¢¾÷ýV\Ü>5n?=–S\â\ë“\ãúoD}=.\ËÎ¨JGGGË‰ñ½ã£¾—¿\Ë/\Å÷}a\âÄ‰Ÿ\ïý\\\Üÿ\èI“&}&n;²­­\íS±üÄ„	\ï=,–‡vuu}lW“ô÷ŒŸs®ð\Þ0\Ú&\ïFWaö\äý\Ãô=ñ¢ýö´3–\ï‰\ëýÇ÷\Î\Î\Î?þÀxqþH\\>8^ ?\ZuHzQ\å\Ç#Ž¨½\Ø_ÿCÁQ)j¡ð\Ïq\ÛSXÄ‹ú¸¨cSˆ¤0)ÿŸIµùz|\ï	ñõI)„R\Åug¤pª…Ô™Qß«…W\n±±<7…[\n¹¸ÿùQ³RøEý4®»(…b-/‹¯/O¡™\Â3._\ËkR¨\Æ\ÏøŸX^_\Ûº¿‰\å-µ0¾=nKolîª…u\n\í»k!¾ \êwQ÷§€¯…ý±|¨ö& ½Hõh\íMBz³ðx\í\Í\ÃSq¿§cùl\í\ÍEz“±¤ö¦\ã/ñõÒ¸ß²\Ú’\åµZQ{Ó’Þ¼¬Š\å\ê\Úš¿F½–\Þ\ì¤7=qyM\ÜþF\í\Í\Ð\ÚZ­«½Y\ê}\ã\ÔûF*½©\ê\î}“•\Þt\Åm›\ëÞˆm‰Ûªo\Î\Ò2n\ëi\àMÞ¶¸\Â¬:\ßup\ï\Î6\ï\ÞcŸ[e\Î­6Oo \Ò\Z\0«Í…7ðÆƒ{w÷6wÀö4¼W¥5%\Û\ßo \á\Ý\Ï\Z¤\êm<ð@þ\Ù\Ï~6\Ç;Þ‘¿ó\ï\Ìÿñÿ1¿\ï¾ûvy[#ÿÞžjýÏ¹\çž{ò£>Zx\Ã(ð¾ö¬\Ïyw\îe/sö,¼\Óþý\Ýow\'\ï¾BõC©^÷è£\æ?üpõòG>ò‘]\Þ6\á=\Ô?SxCñœ\Ó\Çd<˜GX›¥\Å\ìFx/Mû-\ì\ê~ƒ\Þi¢N\×=ù\ä“;\Üg·mÿ³\ê¿\î½|\Â	\'T\ÆG±\ígô\Þö\ÉO~2\ßw\ß}ó¿ù›¿É§OŸžõ«_­Nøp@~\Í5×¼\å¾\éú\í\×o\ÝøP\Û\\p3¤3¼\Ï?ÿü\êu\ï~÷»ó)S¦T§\ìFnk$¼o¾ù\æj¥Ë½«¼{o»ñ\Æó%K–lûú†nÈŸy\æ™\ê\å÷½\ï}ýþL“7P?\×øe{5vV±úûù<7…\ïTi;vWWW5¤\Ó\í)´wu[#\á½aÃ†jõNÏ»ú¾¶ðúšÀ÷dµ\à¦\Ð\á\Ý[K—.}K\Ð\îì¶†wZ}.¼¡žÀü‚›Â†÷¡‡Z½.\íYþ\ÐCU/§\Õvu\Û?øÁ\ê×=öX~\Ûm·õ´i\Ûõ­·\ÞZ½<v\ì\Ø=\n\ï\Þ\ÉÍš5\Û\Þf\Èo(ö> \Ü>¼-Z´\í\ã`o{\ÛÛª[¸p\á.o»ò\Ê+ó¿ýÛ¿­N\ÔS§N\í3@O:\é¤\êNi‡~xu{öž„÷W\\Q\Ýž~ô¦@x\ÛO\à¬B\ï\Ü\Ë\Îi,¼•ð†\Ñ<÷n#\Üo\á\r Àûú|8o\á\r´X€ŸSÜŽœ†ð\Þ@‹ë´\ç\ïõÿŸ„·ðZ}OÇ›\Üo\á\rH\n\ït.n@xo X\áý@xo X\áý~@xo 8\á\ÝS.—\Ð	„·ð\n\"Ë²žÉ“\'¤o\á\r(¼»ºº>¦o\á\rD{{ûÖŽŽŽ\Ãt\á-¼…w\Ô\'t\á-¼\â„÷–¨#u\á-¼\â„÷\ær¹|”N\Ð\n\æÎ+p…7\Ð@xo*•J\Ç\è­`Á‚[W®\\)t©–-[öb„w·GŒ01uw·µµ}Q\'hó\æ\Í;oþüù=¯¼òŠð„\àž3g\Î\æ¨YY0ò&\ï1y\Ó	ZE„\ÍÌ˜×¦Õ½­XW^yežŽLØª¿_]un¹á½¡R©Œ\×	hø9³¦v6>€\æÈ²l}GGG¦°k\åryj\n\îTqyŠŽ\0Íš\"\ÖFu\ê4öf·7¼£–\êÐ¬ð~3\ê\ë:»\îYuÁ]­R©t¬\Î\0Ã®\\.¿u’NÀNŸ\'Dm\Ý>¼£\Ð “÷\ë1Qœ®°\Óð¾©\à®V<\Ñ!`¸_”þZ*•¾¥\Ðÿ\Ô];Œp\ÞO™¾aŸ¼_ð>S\' \ß\çÈ‚wªžÉ“\'¤SÀ°É²lU¥R9[\' ß©;}\"có.|¾n\Ã9U¼5C\' \á@ÿZ\nôt¹££\ã\Ó\é\Ä>&L8\\g€\á\ï\åñ\âó}€Æ”J¥“\ã9³F\'€f†÷KQ?\Ò	hxòž\ZõšN\0\Í|!Z\Z“\Ä:\rO\Þß‹\ç\Íj\0š9y¿˜eÙ…:\r?gf¤}Eth\æ\ä½$\Âû¿t\Z\ï¥\ÍM:43¼Ÿð¾L\' \á\ç\ÌO\"¼ÿ¢@3§ˆ§\â\Å\è\n€Æ¤5Ui•N\0\Í\ï\'¢®\Ò	hL©Túy„÷\Ó:4sŠX\á}­N@\Ãox¯Žz\\\'€f¾=~½N@\Ãox¯O\Ï\0š¦\\.ÿ©T*ýZ\' \á7¼¿‰ú£N\0\Í\ï‡\"¼o\Ö	hø9s[Lß¿\×	 ™/Dˆðþ­N@Ã“÷œtšP\0šùBtÔ:\r¿\á½\'&\ïy:43¼¤IB\' \á\ç\ÌBoxf¿Íº[\' 11u?\Ó÷-:43¼m¿ƒ=gEÝ¨@3_ˆ\îLÛ½u\Zž¼\Øh.{¿\á}*\êJ\0šÞ·¤mx:\r?gœ‰h®ttµt”5€†\'\ï#¼/\Ô	 i§üœYV©T~¬@3_ˆ~\áý˜N@\ÃÏ™\Þ\ç\ê\Ð4µ\Ó>¡\ÐðsfU\Ô9:4M¹\\¾\"\í=«\Ðpx¿\Zõ\0š\Þ?‹¢gu\Z\ï×£N\Õ	 i*•\Ê%Y–=¯\Ðpx¿Ï™thšô‘—ô\Ñ€†\Ã{]TE\'€¦)•J”\Ë\å¥:\r‡÷†J¥2^\'€fN\Þ\çÇ‹\ÑK:\r‡ww„÷—th\æ\ÑyQ\Ëu\Z~\Îl*—ËŸ\Ó	 ™/D3¢^\Ñ	hø9³%\êH\0šùBtN:\è„N@\ÃÏ™­&L8\\\'€f¾µZ\' \á\çLO–e\Õ	 iJ¥Ò·\Ê\åò_u\Z\ïñ\ã\Ç¨@\Ó\Äqz:b”N@\Ãá;ö½:4sò>9&\ï5:‡÷Œ3ö\Ñ	 ™“÷	\ép:»–B;…·N\0Íž\":£\Ö\ê\ìZWW\×þ\Âhºrˆ£õ:»–vTK;¬\é\Ð\ì\É{b:V³N@C“÷Ç²,\Þ@s•J¥q\Þuv-œ¥\\.o\Õ	 ©\Ú\ÚÚ¾/F\Ý:»–‹šª@SMœ8ñóÞ›\Ò\å´3N\\>ª££\ã\Ó:;*•JÇ¤“\è0¬\"œ_‹Ÿ\Íi\Õ_\Úk¶ŸzF§`G\éT é” :wxÿr\'¡]­4}\ë\ì\Èž@SŒ3f¿4y÷\ÜY–-\Ö%\è÷\Í\ï¤xŽ¬\Ó	 ¥¦oS7ô\Ï	fO\ß\Ý}„÷RÝ†·ù\0M}š\Ù\Ç\Ô=Eg ñ<ùNÔ«:4ó…hM]x{A‚]?g¦E­\Ò	 ibÒžZ7uO\Õ\Ø\ås\æûñ|Y®@KL\ß:»V©T~œe\Ù2\0šªT*}OxC\Ãov/ŠzA\'`\Ëó|¿\çŸ~\éÂ…ó¹s\ç\æ³g\Ïn\É*—\Ë-û»¥š3gN~\ï½÷öD]\âQE3\Å\Ô}Y<_ž\Õ	ÁRp/X° _¹re\Þ\ÝÝ­ö V­Z•ÏŸ?¿\'‚|–GMœ¼¯ŒzJ\'`K·\à\Ü\0I\Üq¥i\æ\äý«\ï\ÇtF°´ª\\\èn¥\Õ\èY4qò¾1j‘NÀ–‚F\à\noFTx\ß\Zõ€N€ð\Î×¾¾<þÁ_\ä‹\çü{µ\Ò\åt°Þ´\\x\ßu¿NÀ(\ï7_{)\ì\Îiù#·}÷-•®K·	l\áM\ëÈ²l^¹\\¾G\'`”‡÷\ÒÅ·\ìÜ½µlñ­[x\ÓZ“÷\ï\"Àg\ëŒòð~\â\îÿ\è7¼\Óm[x\ÓR“÷\ïcò¾M\'`”‡÷c³gô\Þ\é6-¼i©ð~8\Âû&\0\á-¼…7\Å	\ïG\Û\ÛÛ¯\Ó	\å\áö.\ï/¼\Óm[x\Ó:\"¸ºZ\'`”‡÷3÷]\Üox§\Û¶ð¦¥\Âû™¨\ËuFyx¿úÒ£ùcwM\ßq•y\\—n\ØÂ›\ÖQ.——dYö_:£<¼S-y\èª\Â;]\'¬…7-\ÞKK¥\Ò:£=¼7nÌŸ¹ÿ’W™\Çu\é6-¼i\í\í\í/G€ÿP\'`‡w:‚\Ú\Ó÷]\Ô\ï6\ït›£¬	oZ*¼_‰š¡0\Z\Ã;&\ê\å\Ï\Ì\Ëÿ|\Ç\Ùýwo¥û¤ûšÂ…7-Þ«£\Î\Ò	eá½«i\Û.¼i]\årùµ¨©:£,¼™¶w6…o\áMS\ÃûR©t²NÀ(\ï\Ý\r\î\Þ\ÞÂ›\æioo_\á}¼NÀ(o%¼)®,\Ë\Öwttd:\Â[	oŠ3yoŒ\É{œN€ðVÂ›\â„÷¦r¹ü\Ï:\Â[	oŠÞ›#¼\Ò	\ÞJxSœð\Þõ	\0á­„7S÷\Ö	&ª ¼•ð¦8“wO\ÔGt„·\Þ\'¼óq\ã\Æ}@\'@x¿¥\â\Ûú¬\ío[¸paõº´\Üþ~½uø\á‡o»~É’%\Â!¼O<ñ\Äw\éï†xÁ>kÖ¬\êu\çŸ~Ÿ\áý\ÐC½\åúK/½Tx\Ãnš1c\Æ>\årù&“7\ï\Ý\ïC=4ÿò—¿\\½.-;\ì°\î\ÆgT¿\î\ê\êª.K¥\Ò?\'\Ýö\Îw¾³:¡?ù\ä“\r\ßvô\ÑG\çŸþô§«×½ú\ê«ùI\'T½\ï;\ÞñŽü\ä“O\Î×¬Y#¼1²,ûB÷šX¾Ï£ct„÷n…÷”)SªA¹nÝº|\ß}÷­~]ÿ\r6\äü\àó<0_±bEõú®\éúúŸs\ã7\æ7\ß|sõò?ý\Ó?5|\ÛÜ¹só—_~¹z]\n\îtÝµ\×^›\ßp\Ã\r\Õ\Ë)À…7E\×\Ö\Ööö˜´o\Ú\Zu]\\µ·®€ð\Þ\íð\î\r\É\éÓ§W—7\Ýt\Ó[îŸ‚7]>ë¬³ª_ò“Ÿ¬~\Ýûûô\Þ7…yªt9½\Èm½¿Sº­¿ûoŠ*\Âú\ËQoFý\ÕAY@xJx§‰ûmo{[þ\á¸:y§¯\ë\ï?nÜ¸>wz\ë\ró¾:M\æ\ÞVÿ;¥Û¶¿ÿ»\ßýn\áMa§\í,\Ë\îHŸçŽºÆ´\r\Â{\Ð\Â;]NÛ\Ó\å1cÆ¼å¶´š<ûW¿ú\Õm\ßw\ÅWTo;\âˆ#\Þrß«®º*¿õ\Ö[«—{·¡7r[ý\ïÔ»M½~µyZ¿ýýû»,¼i¥R\é\Øt\Ê\Ï\í\Õ\àÿ # ¼=¼gÎœY½üƒü\à-·]t\ÑE\Õ\å´iÓ¶}_\Ú\á¬÷ö_|q\Û\å´m:}\Úù¬÷£d\ÜVÿ;¥\ÖN8\á„\êªòT)¸{wX\ÞA¼\Þ/B{Nš¶cy¥Ž€ðnÉ[\í,<÷$X}TŒ¢‰	»-{},Wvtt|ZG€–\r\ï\Þ)y ·	oFŠt •\íùiOò˜¸¦#@Ë‡·ƒ´0šE`W¢6D-¯T*G\è ¼…7-ª­­\í=Ø¿K\Óv–eÿ¥#€ðÞ´°R©t|ö\Æ\î—bùq„·ð¦Euuu\í½°ö¹\íŸ\ê ¼…7-,BûQ\ÝQ™0aÂ¡:o\áM‹jkk{L\Ù¥mÛ•J\å\Ç:o\áM‹Ðž¡½)jIWW\×\Çt\ÞÂ›•Î±½(jK\Ôy:o\áM‹°>#M\Û1u?\Û\Ù\Ùy°Ž\0\Â[xÓ¢\"¬È²\ìÏµi{†Ž\0\Â[x\Ó\Ú\Óöw¢6G=õ„·ð¦E?þÀ\ë\ÇSpW*•³u\ÞÂ›–Âº6m?~\Üq\Ç}XG€!1w\î\\+¼\ÙCiµxmõx\n\î\ï\è0¤,X°u\åÊ•BwjÙ²e/Fxw{dªi{z\Ú!-í˜–vP\Ó`\ÈÍ›7\ï¼ùó\ç÷¼ò\Ê+-Œ7nlù\àž3g\Î\æ¨YY#_ú\ÈWú\èW\í#`SuV63cZ\\›V÷¶j\Ýu\×]y¼H\æ­ü;¦‰[p\Öß¯}ükQ:øŠŽ\0ô#…w:“N\Ð,\ép¦é°¦µi{ŠŽ\0\ìB–e=“\'O>H\'h\Ò\ã\ïüt\"‘tB‘tbhlòNg`:B\'N\éTé”µSw~CG\0Þ›K¥\Ò\Ñ:Áp‰)û\'Q[c\êþ½M6\0»\Þ#¼\Ç\éC-\Âú\ãñx{)=\æ\"¼¿¦#\0»\Þ\ë\â…t’N0Ä³‹\Ó&š¨ûÆŽû^\Ø\Ükbò>Y\'\niŠ\ì\åQ¢*:08Ñ«\Þg\êƒ-Ë²\Ëj{’\ßs\â‰\'¾KG\0/¼WÄ‹\ìL`°´µµ}*S+£\ÖGµ\éÀ ‹©hiL\Þ\èƒôfðÊ´\'y,\çŽ3f?š\Û\çb:ºT\'\Øñú‡\í\ÕñxZo\Õ€¡\r\ïÇ£®\Ö	v\Ó\Þ\Ú\×Ô¦\í;\Û\Ú\ÚÞ®%\0CÞ‹¢n\Ô	*û¨´\ÃcÔ›Q_\Ö€\á\ï…Q·\ë™¶\ã1s]Ú“¼T*ýÖ´\r0ü\á=?\ên \Ö\ÇdYöZL\ÝoDhQG\0šÞ·§\é[\'Ø™3f\ìÁý\ë\ÚQ\Ò~“¾\Ö€\æMR¿Ž)\êO:A\âññ\Ï\Øk¢^Ÿ8q\â\çu ù“÷\Õis ¯i;‚û–\ÚQ\Ònˆ«ö\Ö€a/\Ì\Ï\êõ*•Ê—\Ò^\äñ\Øø«S\Æ´˜ttµt”5 I{Ž§ý jŸÛ¾Ö´\rÐšÖ¹\éø\æ:A<¾’ŽµzÒ¤IŸ\Ñ€Ö¼\ÏL\ÚÐ‰\Ñ+ƒ<Ë²\ÙiÚŽú¥Ž\0´¸x±ž’\Î\é­£S¼q›µ.jUGGÇ§u \á=)¦®u:1º¤ók§ƒó\Ô>·}¹Ž\0H©T\Z/\ÞubT½a+\Ç\ß|}\Ú\×!\ê:P¼ò\Ï\Åø&ù\Ú\Ú\Ú\Þ\ëiÚ®T*—\è@AÅ‹ø\é\Å\\\'F¶øwFmˆzyÂ„	‡\ë@uvv/\è=:12;ö½µ3\ÇmÍ²\ìBºººöö\\\'F\ä´ýõ´?C\ÔÒŽŽŽ\Ãt`\ä\Ø[x\È7dÔ¦\íY:02\'´<½\à\ëDñ•J¥“\ã\ï\Ùõb÷!:0BÅ‹|\Ï\äÉ“Ò‰\â\Z7n\Ü\â\ïøp„ö–r¹üCù“wú\è\Ð:Q\Ø7_§G`oŠ\åóQ\Õ€\ÑÞ›ö±x:;;?»GÒ´¡=SG\0FWxoLGZÓ‰\âˆIû\Û\éMW\Ô36y\0Œ\Îð^—Žq®­oüøñÆ”½¸\Ü\ç\èÀ\è\âÖ¤½”u¢\å\ßdÁ½9\ê\É\ãŽ;\î\Ã:0ºC\á\Õt^ohM)¨S`×¦\í³t€\Þ+\ìðÔ²›iµ\Ò§U\æ:@U¹\\^\Z“÷:\Ñ:\ÒNhig´tÆ·ø\Û|KG\0\Ø~º{.&»Ku¢5T*•sk\Óö¢ôq0 ¯ð~<\êjh®t€•r¹¼¤vÀ•\Óu€…÷¢¨u¢©ƒ¥i;\ê\éP§:À®‚#\ïùvhÊ´}H:‰HL\Û\ÝQ\'\é\0†÷ü¨»ubx¥#°·FýÁY\Ý\0hxßž¦o‡\ÅÄ½,–6\ê\ë:À\îL€¿Ž\é\ïO:1,o”.Jgq‹º\ìØ±\ï\Õ\0v7P®N{œ\ë\ÄÐ™0a\Â\á\Ñ\ã\åQ¢:u€=’e\Ùe1y?«C\Ö\ßKk\Óö½mmm\ï\Ñ\0öXmÇ©¥:1¸\"¨?ýJ\ÔúŽŽŽLG\04µ#z­Ð‰A}Côó´\'yL\ÝóN<ñ\Äw\é\0ƒ4g¦3‹\éÄž‹>µ*#=\Þ\×\0†DLˆS\Ò9½ubƒûª4m\Çò®1c\Æ\ì§#\0exOÊ²lN\ìžI“&}&­¹ˆZ[*•\Æ\é\0C.N:`ˆN\Ø\Þñ¦\çWiOòxt[[[\ÛÛµ€áš¼?—\Î­\ëY\Ôk\ÞoT*•/\é\0\Ã*\Â\çˆ4=\êDc\Óv„ö\r©_¥R\é\æ3f\ì£%\0»\Î\ÎÎƒ#Œztb\ç&Nœøù\è\Ó\ëQk\"ÀÿYG\0hštF«¤\\\'ú–¦\ë\è\ÏojGIK\ç=\ß[W\0h¶½…w\ß\Ú\ÚÚ¾˜¶k§\í\Ûi;·Ž\0\Ð2Rx;§ô[Bû\í¥R\é·iÚ®T*ÿc\Ú \å\Ät\Ù3yò\äƒtb\ÛG\çÖ¦\ÏnÇ´}”Ž\0Ðª“wš0\Í=HGEKGG«%\íj\n\0Z=¼7\Ç\Äyôhýÿ§ã§£\ÌE¥\ã’\é@\Â{\ãh<´g:\ãW:óWš¶£®ðH\0 H\á½.\ã|4ýŸ\Ó9¶\Ãút\Î\ít\îm\0\n%U,&\ï“G\Ãÿ5‚ú=\Ø÷¦\íüÞ—ù\ëP\Ô\Éû\Õt^\ïQð&eRü_7D-\í;\èPüð^S\èÌ‘úÿ;v\ì{\ãÿx\í(iû‹0&Ò¥1y_0Bÿo_K;\äÅ›“e‡ùk0R&\ï\ç\"\Ü.Iÿ§tÄ¸\î?¤=\ÉG\ê\0Fwx?>’L}RTwüŸ^Œ7%‡ø0\Ã{Q\íŒY…\Ö\Ö\Ööþøü1jKÔüe\É\á½0\êö‚ÿNi{SÔ’˜¶?\ê¯\nÀH\ïùQwñw\ï\ì\ìüP„uZs°¥R©œ\ë¯	Àh	\ï\Û\Óô]´ß»T*}+~\ïMQ\Ï:+\Z\0£J„\à¯\Ë\åòŸŠòû\Æ\ïz@öcµi{º¿ \0£qò¾:\íq^7\Zg¦³ E=õ=\0F¥tŒ\ï˜fŸM—\Ó\ê\ç¸|T«}\Ä\ê¸\ãŽûp„õñ{¥Ó—~\Ï_\r€Q£££\ã\Ói¯\ì4½Fö\Ä2\ï§.o¡5\ç\Ô~\ß\Å\ãÇ?\Ð_€\Ñ8i?¿“\Ð\ÎS¸3f¿fÿžµµ\0O§\àŽ\å·ý\å\0\Õ\Ó÷\Î\Â;\Âýúxƒ13\í\ËG\Ó\ÇÁü\Õ\00}g\Ù\Ãý„÷\Öt\\ðfý^\Ô§c­\×>v†¿\0Ô¤UÒµSdn\Þ4\ëw*—\Ë?L\Óvú\ØÚ¸q\ã>\à¯\0;N\ß\×÷±½û¨\áþ=b\ÒÿXü\Û/Du—J¥“ýe\0 i§´ðõu\áýb\Þ@\ÌJk\0bù`:±ˆ¿\n\0\ì:</\ì\r\ï˜z®wÂ„	‡Æ”¿4þÝñ;œ\à/\0ð7Sx\ç†î´½}\áØ±c\ß\ë/\0\0÷ôñ\ã\ÇyxÇ´}xöK\Þ\ã\ß<^\ç`÷•\Â{\æPý•J\å’\Ú\Þ\í¿kkk{–À\î;3ª\'\ê\á\ÚrP<\Âú1i¯ˆ\å†r\Ðn\0œ\à\î\r\ìs3À\Óñ\Ñk\Óö\Ý\'žxâ»´\07¸wu}\Ãj‡_]•>†6Q«`\è‚{û\Û\Ï\è.—Ë¿L{’gY6»Nn\0£!¸{\rhz„õ?Ä”½:jm¥RùŠ6Àðw}€o\Ý\Å¾wöµµ\Ïm\ß\Þ\Ö\Öövm€\æwý÷m\í\ëûJ¥\Ò\Ñ\Øz3¦\í/i1\04?¸·ÿþ\Þ	|\ï\ÚIM¶\Æ\Ä}ËŒ3ö\Ñb\0º\à\Þ;\êgµ\å\Îl¿\ê6ð¿û»¿»*Bûõ\í5\à_\Ð^\0ú\à~j¯ÿ;š\ÚS;	ð>\ï÷®w½kÆ¿þ\ë¿\æŸû\Ü\ç›¶`\èƒ{¯\Ú$\×U_^Ü½uY\ï)À÷\Z‚#±€\à\î;`û\n\æú\0\ß\Õ\í½õHl\0 ¸w¬ýô>\rwý¿³U€À\Ð÷\Î¼{\0Á½}€Ÿ£õ\00tÁ½³\0Hp÷²\n\0v\ÃAµ\Ð]<À\ïÛ§‰»»vý@\ÜQûÞƒü)\0`\à“w£«°{òþ¡?\0\ì~€\×6\ï\ÞcŸ[e\0C\àƒ¹·ùn6\0\è;Xû\Ú|°>\çÝ¹—½\Ì`Ð\Ó\Çd¼\ÇGX«›¸gi1\0\Í>h\Ç6\Ü\00¼x}€_¶Wcg«¿Ÿ\ÏsÀ0O\à{²Zp@L\à	~Á\r\0MœÀÄ‚\0Zdodz\ç^vN€\ÂL\à½\Û\È7\0 Àûú|8\0\Ðb>­.¸9\r\0ZÜ´,\Ë\ÒÁX\æ\ï\å\ì`\0\Ðú\Ú\Ú\Ú\Þ_\ï\\p@Dp´½½=M\Ü\é\0còþT„÷\0€‚˜8q\â\ç\Ë\åò&\0€‚¨T*\ãcòÞ \0P1u-\Â{­N\0@ADpŸ‘e\Ùk:\0\Å	\ïs¢V\é\0\'¼õ’N\0@q\Âû\â¨%:\0\Å	\ï+£ž\Ò	\0(ˆ,Ë®zT\'\0  J¥\Òocò~@\'\0 8“÷¼\ï{u\0\n\"‚{aÔ:\0Q.—ÿu“N\0@q&\ï\Ç#¼¯\Ñ	\0(Nx?—e\Ùe:\0\Å	ï¥¥R\é\0€\â„÷Š˜¼g\ê\0\'¼_úŽN\0@A”\Ë\å7¢N\Ò	\0(\Î\ä½>Â»¬\0Pœð\î®T*_\Ò	\0(ˆ,\Ë6Oš4\é3:\0Å™¼·vtt¦\0Pœð\î?~ü:\0\Å	\ï|Ì˜1û\é\0@\n\í\Þ:\0‘V—§\Õ\æ:\0‘vTK;¬\é\0DúˆXú¨˜N\0@A¤ƒ³¤ƒ´\è\0D:,j:<ªN\0@q\Âû¤tb\0€‚H§M§\Õ	\0(ˆ,\ËfFx¯\Ð	\0(ˆR©tA¹\\^ª\0Pœ\Éû²\ïgu\0\n\"‚ûšð\Å:\0\Å	\ï›\"¼\Ö	\0(ˆööö;£\î\×	\0(Nx\ß5W\'\0 8\áý@Ô­:\0‘eÙ£\Þ\×\é\0gò~ª\\._¡\0Pœð~!\ê\"\0€\â„÷\Ë1yÿP\'\0  ²,[U©T\Î\Ö	\0(\Î\äýzø\é:\0\Å	ïµ¥R\éx\0€\â„÷†\ïcu\0ŠÞ›\"¼\Ñ	\0(Nxo‰ú„N\0@qÂ»§³³ó`\0€\â„w\Þ\ÕÕµ¿N\0@1\ì\Â;-µ\0\n ­­\íýµð\0Š Ë²¦m\Þ:\0Å™¼?•ö6\×	\0(ˆ‰\'~¾\\.o\Ò	\0(ˆJ¥2>aM\'\0  b\êþZ:¶¹N\0@ADpŸ‘e\Ùk:\0\Å	\ïs¢V\é\0\'¼õ’N\0@q\Âû\â¨%:\0\Å	\ï+£ž\Ò	\0(ˆ,Ë®zT\'\0  J¥\Òocò~@\'\0 8“÷¼\ï{u\0\n\"‚{aÔ:\0Q.—ÿu“N\0@q&\ï\Ç#¼¯\Ñ	\0(Nx?—e\Ùe:\0\Å	ï¥¥R\é\0€\â„÷Š˜¼g\ê\0\'¼_úŽN\0@A”\Ë\å7¢N\Ò	\0(\Î\ä½>Â»¬\0Pœð\î®T*_\Ò	\0(ˆ,\Ë6Oš4\é3:\0Å™¼·vtt¦\0Pœð\î?~ü:\0\Å	\ï|Ì˜1û\é\0@\n\í\Þ:\0‘V—§\Õ\æ:\0‘vTK;¬\é\0DúˆXú¨˜N\0@A¤ƒ³¤ƒ´\è\0D:,j:<ªN\0@q\Âû¤tb\0€‚H§M§\Õ	\0(ˆ,\ËfFx¯\Ð	\0(ˆR©tA¹\\^ª\0Pœ\Éû²\ïgu\0\n\"‚ûšð\Å:\0\Å	\ï›\"¼\Ö	\0(ˆööö;£\î\×	\0(Nx\ß5W\'\0 8\áý@Ô­:\0‘eÙ£\Þ\×\é\0´ É“\'T.—ŠÀ>¤nò~*®»Bw\0 5§\ì#¬ó~ª\'jsªðº\0-\"þs\'ž\Ê\Ñ\Ö\0 •\ÄTýË…·©\0ZÌ˜1cö‹\Þ\ÒWpgYö¤@Š ž\Ó\×6\ïú\Ù\0€’Bºðž¯3\0\Ð\Ú\Ó÷3uÁ½©««k]€6q\â\Ä\Ï\×m\ë¾IG\0 \Ó÷Š\Ú\æ‡\ê\0´˜\Ú^\æ\çD-ˆZ\Õ\Ç\ç½\Ó\è¯F-¬T*—X\0M2aÂ„\Ã\Ó\ÎhÈ›vqp–\í?\ï½5Ë²\Å>÷\r\0\Ã8iGø\Þ¡$´û©…&q\0Big´˜˜7l\ÂS¦L\É/»\ì²ü÷¿ÿ}þ\ÒK/\å6lÈ“´\\¹reþ\Ç?þ1ÿ\å/™O:µ¯¸¬/•J\Ç\ê.\0²\Ù:::¶\Ö\ïw¿û\Ýj0oÙ²%oÔ¢E‹ò³\Ï>»¯¹\Ì\Ôe\0\Ä\à®_M!ž\ßz\ë­\n\í\í\Ýq\ÇyWW\×öS¸\0€=•V•Gp÷Ô¯\"ú\é§óÁð\Â/ä§Ÿ~ú[&p«\Ð`¤\Ó\ê·q§\àNÛ°Súyõž¶Û‰\r\0vSÚ«¼~Uù`M\Ü}M\àÛ­B@÷`€\Ò\ç¸\ë·s§m\ÜC)m¯\ßþV\×û+\0À\0¤°\Ô\ïU¾iÓ¦|¨u\ÖYõ«\Ïû+\0@ƒÒ¶\îú#§¥ƒ\r‡G}ô-Gb‹:À_\0\Z>²U¿“Úž|$l \êä’Ž…\î¯\0\r¨d¤\Z —_~y>œ®¹æš·>\Õ_\0\Z\ïU½šy:œ\Ò*úºU\ç¯ùk\0@\"4·m\ï^¾|ù°†wú\Üwý\éDý5\0 ±\É{[€öždd¸¤¯þ\ß÷\×\0€†w3o\00yÀ\Èf›7\0oò¶·9\0,¼}\Î\0Š$&\Þ6\ëk\ßü\æ7a\r\0*\Û<movls\0(tN\íú³Š\r\Çô}ö\Ùg;«\0\ì®t>\ï\Ñ\çó€bM\ß\Ûv\\\ë\è\èÈŸ~ú\é!	\î^x!?þø\ã\ë\Ãû\Ý€\Ý\Ð\ÕÕµ–e\ë\ëw^KŸ\Ã\ì\ÏuŸv\Úiõ«\Ë×§W÷`7•J¥c\ëWŸ§\0¬	<M\ÜõÁþô\ï\é:\0\ìy€ŸY\àiz\Ú¾\';±¥m\ÜÛ­*OS÷L\Ý€!\nðÞ½\Ð-Z4\àƒM›6\í-¡~®\à€¡	ðcë·×¯JOGb{ðÁ«\ÇB\ï=™IZ¦m\Ú)\àÓ‘\Ó\êÀR¿Ûªr\0Big²ú½\Ð÷°°s\Z\0“ô9ð˜š®?[#•Žœ–ÀR©T¾¤‹\0\Ð\éPªµc¡§i|Uý\éD\ësúZ:\ÉH:V¹Cž\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÐ¤a\ák,uS\0\0\0\0IEND®B`‚',1),('2507',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\TestReport.TestReport.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\ë\0\0\0tô«\Å\0\0A¤IDATx\Ú\í\rpT\å¹øS>T´õª\Ó[\Æq\Æi\Ë0—Áv;­\Ðtk)CQ’œew“˜\n‚F´X+ŽP­Z\ÌU¯õŠøýÁpKD¥8 !Dò‡(\"\"‚ (ˆ	‘\Ï’óžÓ³\é²\É&ûqv÷œ³¿\ß\Ì3ûqvóñœ³¿}\Þ÷œ÷}\n\0\0\0\0ÀL}¢\Æ\ì.œ\Ú\0±õô\\º\Û\0\0\0b\0@l\0€\Ø\0xPlœ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p¦i^°bÅŠ×Ÿ|òÉ£UUUw\Ýu—YQQaŽ?\Þ,++3\ï¼óNsÆŒ§fÏž½\çŽ;\îø#\0×²w\ï\Þð«¯¾ú\íþð³²²\Ò|ñ\Å\Íw\ß}\×Ü·oŸy\â\Ä	S9u\ê”\Ù\Ü\Ül¾ÿþû\æüùó\Í[o½Õœ2eJ\Ç}÷Ý·&$‹\0\à–\nm`MMÍ\Ûo¿Ý”\n\ÍÜ¼y³%°DÙºu«)Õ9q\âDSª»\Ùd\0r^¥ý\ÏÿüO\ÇÔ©S\ÍM›6™\é°}ûvSš¦\æ-·Ü²_š®]\0\È:GŽ¹cÆŒ\æO<a~ûí·¦h“U\Þm·\Ýö\rMS\0\Èz¥¦R›3gŽyúôi\Ói\æÎ«•\Û×………\çm\0\È8Ú§¦\ÍO­¬2!µ?þ¸YZZº›Œ@\Æ\ÑÚ§\æTó³§fé­·\Þ\Ú!MÒ©d\02\ÚÕ³Ÿz\æ3\è	…p8\ÜN\0d½NM/\é\È&<ðÀ©ñ\ã\Ç/%û\0\à8:¢@/¾\ÍVµaÛ¶m¦TlmœH\0\0\ÇY¹r\å?uDA&OÄ£¢¢¢=Ld/\0€£\è\ØO&•{\ì±\ã\Ò­c/\0€£\è€vû™Ö­[wZ\Ä\ÖÀ^\0\0G\ÑY:t@{.8p\à@‡ˆ­•½\0\0Ž¢SEf\é\È6:¨^§=b/\0€£¨Xr	b\0Ç¹ñ\ÆsY±u 6\0pœ?þñ9\ëcknn>E\08\ÎÌ™3[suVtÅŠÍœ\0Ç¹ÿþûw\ç\ê:¶3f4q\08\Îw\Üñ{]£ #tH#\0 Srk\ÏöX\Ñúúzm†2V\02\Ãô\é\ÓW?ò\È#YÛ¤I“š˜\Ý\02†.²ró\Í7w\è\ÊR\Ù\à½÷\Þ; \Õ\Zó±@F™2e\Êl2\Ó3\è?~¼=\nb]\0\È\n·\Þz\ë¾\Ç{,“\':\äw4d\0²‚v\äK\åv@:Î€\Üteø¯ôº5\Ö€¬\ËmÒ¤I\Íÿý\ßÿm;vÌ±\æ\çm·Ý¦\'\Z\èW€œÉ­¬¬l\ç\äÉ“;>úè£´OhŸš6?©\Ô\0 \çhii\é\é™3g¶©\à’ižnØ°¡Eû\ìì³Ÿœ(\0\0÷ U–T[ÿÐª«¼¼¼£ªª\êø;\ï¼sº©©©]\çS‹\ÌÒ¡\Ú\ß~û\í:LJG¨\Ðô:5šž\0\àjDTe\Õ»Evº^­Ú‡&Q¯Ã¤Q\0\0^–‰\Ä\0Àwb+))¹ˆL\0€ofgGyyù%d\0|%¶ŠŠŠ“	\0ðSSTWsJ&\0ÀOb;‡¯$\0\à\'±µ†1’L\0€Ÿ\Ä\Ö*M\Ñ_“	\0ð\r\"µ“¡Ph,™\0\0?‰\íx8	\0ðSSô¨µ\"\0à§Š\í[\Û\Íd\0üT±}#r»L\0€Ÿ\ÄvP\âOd\0ü$¶‰\éd\0|ƒ4C›B¡\Ðýd\0üT±\í‘x˜L\0€Ÿ\ÄöU0|ŒL\0€o©\í’\æ\èSd\0üT±\íxŽL\0€ŸÄ¶M\â2\0~Û–P(ôw2\0~\Û&‰\Åd\0|C x?¾I&\0ÀO›.¼œL\0€ŸÄ¶Fb™\0\0?‰m•ÊL\0€ŸÄ¶B›£d\0ü$¶¥\ë\É\0ø\Ã0^ƒ’	\0ð\rzqn ø˜L\0€Ÿš¢¯\è°*2\0~\Ûs:žL\0€Ÿš¢s¥)º“L\0€oƒKÅ¶›L\0€ojmŽNN&\0ÀOM\ÑûuA2\0¾A—\Þ\Ó%ø\È\0øIl\ÒE“\É\0øIlwHSô™\0\0\ß\'K|K&\0À7†q£TmGm\É\r”¸º¨¨h™\0¯Tg¥\Ùy\\D\Ö&\Ñ.aÆ‰Z²\0žA¤U×ƒ\Ð4:&L˜0ˆL€§ª6‰žª5\æf\0O\ÊmI<±ISu0\0OVm\Ýõ±‰\Ô6’\0ð,:«G¬\Ø\Â\áp€\Ì\0€§±ÏF\Ä\Ö@F\0ÀMÒ©±\é}2\0~©Ú¾U±‘	\0ð\rö\ìˆ\r\0\Ã4\Ísv\î\Ü\ÙP__o®Zµ\Ê\\¹r%‘BTWW›kÖ¬é˜\ËQcTjuuufss³\Ù\Ú\ÚJ¤---fmmm‡H®Š# ‡h¥†Ôœ•›Tp­Y\09D›Ÿ\É\ÙÐ¦)G@\Ñ!2Bl\0y)¶£\ß\ì3w¾ÿ¢¹µú\ÏV\è}}‘!6\0OŠ\íÈ¡=\æ–3Ì–\Ý}F\èsº\r™!6\0Ï‰­a\ë›]¤‰Æ­K‘bðžØ¶­þk\\±\é6d†\Ø\0<\'¶-+g\Å›nCfˆ\r\0±!6\0Èµ\Øô,h<±\é6d†\Ø\0<\'¶kŸŒ+6Ý†\Ì€\ç\Ävp\Ïfs\Ë\Û3»6C\å9Ý†\Ì€\çÄ¦±k\Ã+]Ä¦\Ï!2\Ä\àM±<i\îX7·k3Tž\Óm\È±xJl:²à³µ‹\ÛÇ¦\Û}€\Ø\0¼!6©\Äö\í¨1?^~_\\©EB_£¯¥zCl\0®[oU\Z\Õbðœ\Ø©\Òzª\Þbp\ØR•Z$bpg\Ø\0\Ø\0b\0Ä†\Ø\0\0±!6\0\ÄF 6\0\ÄF 6\0Ä†\Ø\0À\åb“·w±\Û\ê\ë\ë­\çô¶§\×õ\ï\ß\ß<x°™\Î\êô\Ñ?± 6Ge-¬ªª*\ë¹9s\æ\Ä›\Þß¾}»uÈ!Tl\0\à^±©¤Fm=§·—_~y\\±Ek\å¦÷[ZZ\Ìòòró\ì³\Ï6`™\æ‚¬×•––Z¯\Ó\×\è\ãùó\çŸñó\â½± ¶´\ÄVYYi‰\åØ±c–°ôq<±mÜ¸Ñº?l\Ø0\ëqEE…õXŸß´i“uÿº\ë®3÷\î\Ýk\Ý4hõº\Ë.»\Ìz\Ü\Ð\Ðp\ÆÏ‹÷~\Ä€\Ø\ÒÛ¢E‹¬Û™3gZ·K–,‰\ÛÇ¦1|øð\Î>9b\ìv}N·\r:\Ôz¼zõj\ëV+ÁØ¿¥§÷#6\0Ä–²Ø´R\ëÛ·¯y\É%—X›>ŽW±M™2\Å<\ï¼ó\ÌeË–!¦\'Ntù‘\Êo\ìØ±\Ö\í\äÉ“ãŠ­»÷#6\0Ä–²\ØôþÈ‘#­û………]¶E\ßW\éY\Ñ/¼\ÐjV†B!k\Û3\Ï<\Ó\ÙL1b„õ\ÚH%¨²\ÔÛ…vùy=½?\Þ\ßP\àÀYU\Äb›={¶uÿ/ùK¯\"‰4U\r\Ã0›šš¬~2\íø\×\êKû\Çv\ï\Þm½\îð\á\ÃV%¨¯\Õ[=Qûózz?b@lb@lˆ\r\0eüøñM@`{0\\\"1uÂ„	ƒbðº\Ø>’0£C\×.·\'$v‹ô–K\Ì‡\ÃW._¾!6\0÷cÆ´X±Å‰SÚ¹®—` $\Ä\àjDVˆ´\Ú{‘\ÚñP(ô\È[o½…Œ€gš£{\âIMš¥ÿGbð\ápøri†>/ò\Ú+\ÑGj/G¿±!6\0\×!\ÍÉ±öÉ€o%Tf_\É\íSr{C7R{(öýˆ\r±\äœ\Â\Â\ÂsDPw‰¼6j\ç¿Ü¶Il\Ò“&M:7¦9z4\"5=\Ú\Ý\ÏClˆ\r \'\èuh\"§¿I|i71Š¨V\ÊmqO\ï³+¹‰‰ñ^ƒ\Ø@Öª\ì—z­\È\ëk[NM\Ú?VTT4,ÑŸQ\\\\|¼¿¬§\× 6\Ä1fÍš\ÕO$t³\Ä:‘\ØI½ VG„B¡ûKJJ.\Ê\Ô\ïElˆ\rÀQ\Ê\Ê\Ê~ ú\"³O\í\ë\ÎtdÀÿ“\ç~/›ûd\ão@lˆ\r mD\\Wˆ¸\æ\Ë\í~û,\æAy¼H\â\ê\\ü=ˆ\r±¤D8‡j\ìNÿ‘\Ø.‰\Ç\Ê\Ë\Ë/\Éõß–\ÎRwbƒ<¢¤¤ä»¡P\è>‘\Ø\Ç\"³\Ó\"±S\äþ²\í,7ý­uuu\í\Í\Í\ÍÉ¡hll\Ü-bk\åS\0¾ ¢¢\â\Ç\"²yzI†ˆ\ì°\Ä2\Üo\Ýüw\×\Ô\Ô<X[[Û±ÿ~\Ä\ä€Ôª««\Û$ªøD€—+³\ß†ñO\Ùaûú²=\"³gEnƒ½ô\Èq¶TGµ	\å\ÖÐ‹Œ\Ýü÷\ÙÑŠ\ÔÀ‹\";K¤u»\ÄûòAk\Õf¦\Ä‰\é£F:Ÿe®i¯b#\0¡üR•=*2\Ûi_({L>d«¥2’\ì0nÜ¸‹µ\"&\0iPZZús\Ø?\ä\ÃtÀ–Y³\Ü_ •\ÃO\ÉNö±û/@’ô‘ª\ìF‘W}‘¬^,»C\âa½ˆ–ô\ä–P(4\\÷	™\0\è¦¤3^\Èf›-²“õ\ÒÂœ¬Ã›È{Ð‹—eß´‘	€n‘\r•\ÈKû\ìe¿–û¯Kµö+²\ã\êýök=YC&\0lDZ\×Ë‡\âm‰#ö%»%ž\ìiI:p]Stœv	\È[t²EùüIb“6_4¤2ûPŸ‹ˆ<\Ó-Õ³\ÑdòŠ²²²Ë´\n³«±»:[¡\Õ\Z\Ùñ>:“N}N&À÷Ø“(¾.\ß\æ‡\ìY2öiÿ™ö£‘\ßUlSu?“	ðz¦R*°[ôÌ¥}S\Ïd~¢g6uM2\ä_d¿\ß+b;@&À/M\Ìˆ¸\æ\è5e:£¬.ò+±F¯9+\È\ÒDŒ{ta\ZL€g	‡\ÃW\êUþ\Íö%\äþB¹ÿ3²“·b{DgM!\à)D\\!)q\Ìnb~!r•Ž$;Y¡‹L€«Ñ™0\ä@aÏŒqÚž)c½\Ämn›ˆ\\!¶\ç´;‚L€\ë(**\Zb {\ìK2¾‘XªW•“\èEl¯\ê‰\"2n9 GK¼¥³\ÉÚ—d4\È\í\Ó:[ÙD\Ñ\Åntµ{29¡°°ð½\æHö\Îó¯Wý\Ë¹YO\×\ëddRÛ›:¹\'™€lVe—Ê÷¸®¼d71J¬’±„\ì€C\Ç\Ø\n]HšL@¦¿Au\Z™Åº&¦\Ý\Ä\Üo÷ƒ\\Av b«Õ³\ædœ¦X7I¬šˆQW/pÌ˜1\ß\'=a±­ÓªL@Ú¨°¤2{@f_õ¯B[\'\ÚD&b„,·6†ñ™€”°§`~E¢\Énb~-\Ôk#\É\ä°bûH×  \ÌAS,Qmwú«Ì¾”ƒ\è	=)@vÀ%\Ç\è\'Ú‡K& .ö\Z÷\Øß‚:\ã)¹\Ý(UÙz¹Š\ís]ˆšLÀˆ¸~(\ÍÌ¹rp4\ØË¿•\Û\å\"³1d< ¶/u¼(™\0\íp½V/l´‡.isˆ\ìy\ÚDvÀcbÛ£\ÓW‘‰ülbž%\"«”xOB•Ÿ–ƒa«Tj3™ˆ<.6=™5›L\äOU6Pçª’\Û\Ï\íkËŽ\Ëýwtñ‹&b\"¬€G¯\"¦sò\é°<²“\ØSÿ˜-\"·¿\Ë\íUd| ¶\åöq\Ý%\ìKô„W+\Ë\'ú»D7\Éø	\í6±/7{ˆõd\n±x\í¸^Ú“Ø´¹J–€×š£ƒ\í3ùÝ‰­–!6\0¯\Û\ë»\ëc£o-IL\Ó<g\çÎ\rõõõ\æªU«Ì•+Wº>tg»\íoª®®6×¬Y\Ó!1—£\nR%\ný6VlÁ`ðe2“$*µºº:³¹¹\Ùlmm%Òˆ––³¶¶¶C$WÅ‘i4IwF‰\íCþR@+5¤\æ¬Ü¤‚k\åÈ‚T)..¾&Jl\ÉH\nhó!9\Ú4\åÈ‚4ûÚšTl\ãÆ£o-ôCˆŒ¸Nle\"5“Å€2,¶£\ß\ì3w¾ÿ¢¹µú\ÏV\è}}‘!6\È\Ó$ô8b¬h¦\Äv\ä\ÐsËŠ\æG\Ë\î>#ô9Ý†\Ì8.µ‰ö-rË„\Ø\Z¶¾\ÙEj‘hÜº™!6p^j™MGnÛ¶\Õ+6Ý†\ÌdDj½=\éˆm\Ë\ÊYqÅ¦ÛbƒŒI-vûtR…\ØøAj4K3 6=\ZOlº\r™!6È¸Ô¢\å\ÖN\å\æ€\Øv¬}2®\Øt2Cl©E¿¯\Ê-M±Ü³\Ù\ÜòöÌ®\ÍPyN·!3\ÄY“\Z}nN‰Mc×†WºˆMŸCdˆ\rÒ–š®\ÓñlA\ï\ëuÄ¾Ž>·´\Ävò¤¹c\ÝÜ®\ÍPyN·!3\ÄiI\íÓ‚2ø´¹\Å{•[*bÓ‘Ÿ­ý[\Ü>6\Ý\Æ\è\Ä)7?Ÿµeeö ·h©Ebžƒ\Í\Ú<›TbûvÔ˜/¿/®\Ô\"¡¯\Ñ\×R½!6HºO­;iEË­·\í4K[oU\Z\ÕbG¤Ö›\Üú%(µ\è\ß\Ã\Ù\ÒxbK¤J\ë©zClˆ\r’n&v\'·\Ö$¤+·\éˆ-æƒ™ª\Ô\"\Øz›®f\Ïg©% ·d¤F³´\×>6\"#bS¡?¾N\â(Ÿ{_3\È\Ò\Ö$\ß×¯›J­\Õ~>–\Û\ï„ØˆŒ‰M…þ!B;m\Ïeš\Ï~\æ\Ñh\Ë\Ë\Ë/)**\Z\"9¿JöÃµ¡Phœa7\ÊýJ¹&ûe¶D•<?W^ó’®3 \ÛÞ”\çV\Ú_B\ë\åþ&¹\Ý&ñ…lk\ÇMr{@£_R\'$Z%\Ú$\Ú#\ëƒ\Ê\ë\Ì$š…NWlQ±›|\0’h]V\Í\ïÇ–®®¤B¯¨¨ø±\æ§\"‘_‰<\Æ\Ês¥“%\î’\Ç3\å\Ã?Gòñ¤<~A\îÿŸ\Ü]b…<~G¿+·\Ê\íVy\îs‰\Ýû\äq‹<H\î‘ûÇ»“JTt\Øù\×/•S¶„TF‡%\Ú\ë4Ø«C}*·›%Þ—ûÿO¢Zþ\î\Êû\ÉýW\äù§\åñ£òw\ß/·÷\Ê\ã\Ûe\Û\ïe[±\Üÿuii\é\Ï\åv¨<¾tÔ¨Q\çç m:\'[F\Å&üTûC\×\Ý\Ê\ÞÛ¬Y³ú3\æûeee—É‡p¸|G\Ê\ï-SPþ¦‰ú·\É\ã\é*]yü„\ÜN\îÏ—×½&÷ß’X-Q/ñ\Ä\Ùö™\Ü~)±G¢Y\âky\î[¹=&q\Ò\Æi]Ü·»#R‘û\'%Ž\Ù\ïýZ\î7\Û?s—ý;¶Ø¿sl«Ñ¿Eÿ&ý\Û$ž•x\\ž{\Ðþ\Û5¿\Ã\áp@\×\ã\ÔÿQÿWýŸE¤i<\Ò\×\æ\äYQ.\ÖEl™›\ÝD1{\nù`> ñ˜|8\çi5 UVr•\ÄZy¼A«­\"\äþ.¹\ß(÷÷\ÛU\Æ\áHH¶YR±«’.ÕŠ]Å´\ÙR\Ñ±«‰½vô¹VEZ\ÙB«•\ÇËµz\Ò*Jþ®\ç\åþ\ß$\Ö*K«-­º\äqH¶‘û¿ÔªL«3\Ë\äþY4„:[\é\Ôuleœ\rEl\Ù[\"±O\â+‘‚6±¶i?Ž\ÜOî¯‘x[ûy´¿Gû}d\ÛS\"”G´?Hû…´HW2’û\×\Û\ëP^¥ýH\ãÆ»xÒ¤I\çrd»’\é\ÝTTNŽ<`¡nÄ–ù¦¨6“bVõ>#X\á;o+·LŒEjˆ-»\'ìŠª>¶™(U\×\Õy]¹E\Ëm^Ab³{D¿Ž\ëÕœ[A÷§¤­m\ë×¯7GŒaž}ö\Ù\æ€\Ì_ü\â\æÚµk{Ý–\È\ïKW:NýœT®c“\êm°}ù@;b£rK³O©e²b\ëNƒ¶žÛ¼y³¹q\ãF\ëþ¥—^\Ú\ë¶\\)[#***.ÐŽù¢¢¢aTn©Í ‹Ô²-6­\Äô¹\íÛ·wy}O\ÛbVô\ã\Èý‰\'Z?cøð\á?#²\í\'?ù‰Ù¿ó{\ßûž9s\æLó†n°*Ãšó\ç\Ï\Ïy\Å\à€¤Z®\Ä6g\Î\ë¹ó\Î;Ï¬¬¬´ª³D¶%\"¶7\Þx\Ã\n½?r\ä\È3¶-^¼\ØÜµkW\ç\ãE‹™;v\ì°\î_xá…ˆ\r\Ü\\¹%\Ò,-+\àDA\îÄ¦¡ýf\Ò\ä²¦\ÛUh½mKDl\'Nœ°B\ïk5\Ö\Ûû\âý\Ä«\Ü\"}rH-—b‹DCC\Ã\êi[²b\Ó&)bƒ<[w×¿A¶\Å6d\È\ë9=ºa\Ãë¾ž4\èm\Ûþ\çZ·l\Ùb.[¶¬[!i_\ÙÒ¥K­û£FJKl‰\ÜGl#¹Y\ë×¯ßŒF¸Cl›6mê¼¤£oß¾\Ö%õõõ½n{é¥—\Ìÿøÿ°*±©S§v+›É“\'[\'†\rfõŸ!6ðiŸ[‡|>j\r\Ã0En%%Y\Ø c•›YRRÒ¡C\åHbCl\à\ÙŒ&ˆ\r±o\ÐYbt\Î72\ØøIl{tV2\Øø{\æ\àd±!6ðSÅ¦“&¬\"ˆ\r±ŸÄ¶X\' %ˆ\r±ŸÄ¦Ó±\ï&ˆ\r±o\Ði\àu2\Øøi†–\è‚=d±!6ðSSô\nq™L 6\Ä¾AW²Ï‡Åµbƒü«\Út K\ÉbCl\à\'±Ò•\Î\ÈbCl\à\'±‘¸™L$ÁªU«bš‚Á\àd\"	\ê\ê\êÚ›››’C\Ñ\ØØ¸[\Ä\ÖÊ‘VlŸJ¼D&’ ¦¦\æÁ\Ú\ÚÚŽýû÷#&¤V]]\Ý&Á‚\à¤\Ø\êuZ2‘$òAœ-U\ÆQmBiE+R§‘f\è›È„¿ú¾½ŽG¯\×çŠ‹‹Ç‘!Èƒ\ÏÀ<9Þ¿ >!\n\ÍUi†q½>WXXxŽ^‰m?\ßD– š¢3$ZÈ„¨¨¨¸@vf[Dl‘\äÛ«*\ê9SJô©d|.¶2‰£d\Â;si´À4\Â\áð•r\Ûó|«JŒ_‘/\ï«\å½Lxœ	&Šjnv†4M\×w÷¼ö¹‘5ð+eee?`¼¨o§\Ý\ÈË´\Ç\Ìu÷|g€O[0\æ˜1c¾O&<ŠŽ‰‹\'¯žBdxœì\Å\ÖVZZús2\á\ÝØ’Š\Ø\ìXJÁ§­˜czLxû\äÀA=!`ŸmK@f:@¸A›¯Á`p	Y\á\Ï þù¦zZ/Ni=$÷Ÿ…BŠ\0o–\Ç\å1óTA¾ˆ\í½P—Løg‡¾*ñIœm\'\r\ÃC–À\ï\è*ZE&ü³C—H|Gl\Úl½‡,A´\\–\ë`x2áŸŠm…Äº8\Û>—xŽ,A|^\Ò\é‹È„v\è\Z‰Uq¶­•o²•d	ò\àsð \Ä>2\áŸº>\Þe¡P\è\ï\"¶­d	üN0œ¬3Ý	ÿô-|¬‹÷-¦\Ó&“%\È±]+qŠLøg‡~f\ÆóqÄ¦³#K\àw\ìñ\Ód\Â?M\Ñ\ÝzýZœ¦\èpVÉ†<ú,˜º€2™ð\Ç\Î\Üo…žY³fõÓ=iÒ¤s\É\äÁg¡]¾\ÌG\Ú\ÓMÔ¹	™²Ë»;ó@O×ªÉ¶Ó²ƒF¦ÀO\È1=[Ž\í$ö\Ú\Ã\Û\ä¹.\Ã	É”w\ÅvX¾¡*{\Ø\Îb²\à;¤2ûmo\ã¤\ím±“X\Ú\Ã7[£–\äd\n|x\ì/\íeª®ÁdÉ»;÷¤\Ä\è¶o2\ã52~C\'zˆ3c´Jm\'ò¶\ØÚ´³´‡¿Œ©ÁÁ¯\èqfŒžFv¼-¶vÙ¹C{\ØñO\Ék¾$S\à\ã\Ï@S\ìI]†’\Ìx{§vŒ7\î\â*¶©òšo\Èø¸Izu\ÌzLü\à±™=};\éPy\rCMÀïŸƒ\Î	\\»\æqô\Â\ÛÞ–Ó•{XšüŽ\ÊL¾\Ä\ÛV\å\Ê\Ë\Ë/\Ñ\é¿i®\Ê\ë~H\ÆÀ\Ï\ØýÉˆ\Í;rh\"cA\å5\'B¡\Ð82\é`š\æ9;w\îl¨¯¯7W­Ze®\\¹’H!ª««\Í5k\ÖtH\Ì\å¨\ê»Ó´-\ê\n>\Ó\É¤ƒJ­®®\Îlnn6[[[‰4¢¥¥Å¬­­\í\Éqñ|,ºP‹^ ›@\Åö©NL\Æ ´RCj\Î\ÊM*¸VŽ¬®[©.›€\Ø\Ö\È\ëj\È¤ƒ6?’³¡MSŽ¬®b«\ÔAð	¼n¾¼nƒt\Ð!2Bl\ÙhŠÞ«\Ó%\Ð\Ç6[¢™ŒA6\Ävô›}\æ\Î÷_4·Vÿ\Ù\n½¯\Ï!2Ä–‰®\Ì#[P^wœŒA¦\Åv\ä\ÐsËŠ\æG\Ë\î>#ô9Ý†\Ì[¯\Ø€w÷öºp8|9S„C6\ÄÖ°õ\Í.R‹D\ãÖ¥\È±%\Ô\Çö‚.\æ’ÀKû\è\èƒQ£FO\Ö “bÛ¶ú¯qÅ¦ÛbK¤)ºPª¶\Í	¾¶\Í0Œ‘d\r2)¶-+g\Å›nCfˆ-Y-Mt®5©\ìzœB\0±!6·ô±\Õ\è5j	Jð+\Û\ãd\r2)6=\ZOlº\r™!¶DdU/r[ž\àk?¦\èd\r2)¶kŸŒ+6Ý†\Ì[\"\Í\Ë]\Ï@^û¦Ê¬A&\Åvp\Ïfs\Ë\Û3»6C\å9Ý†\Ì[\"U\Ø\'¯&\Øl\ÕKC¾\"kI±i\ì\ÚðJ±\ésˆ±%\ÚÇ¶3\n\ÍMP‚·\é	²\ÛÉ“\æŽus»6C\å9Ý†\Ì[\"bk±=’`Sô—‰Lqª\ØtdÁgkÿ·M·1ú\0±%\"¶f\Û\ÌD^«\ç\ÚS„÷!s\à¨Ø¤Û·£\Æüxù}q¥	}¾–\ê\r±õT…\ÒU¨’\è“k/**\ZB\æÀ)±õV¥Q½!¶¤\Ñõ%nJ\âõ\Ç\Ã\áp€ÌSbK¤J\ë©zClˆ­;Q(N¦\é*¯ŸE\æÀ)±¥*µH 6\Ä\Ö]Sô”®š„·%zy@\Â}lbs¸b;]RRò\Ó$^¿ZDø™Ä†\Ø\Ü,¶¤\Ö©½¬»9@lˆ\Í\Íb3¥b»(‰\×\ÏÐ¥ø\È 6\Ä\æVú${]šžh\Ð¤bs%Z©\ÙbK˜ŠŠŠkó•\ìbCl®Dû\ÖR‘T²\ÍW\0Ä†Ø²F8¾RÏŠ¦ ¶S\Å\Å\Å×A@lˆ\Íu\èõk*©\Äö\Äd²-¶§Ÿ~\ÚüÑ~dö\ï\ßßº}\á…:·É\ïŒúúz\ë9½~>öuúsl¦³B}ô\ÏFl. \Õòž/%ž$ƒM±-X°À\ÈÄ‰\Í\'N˜“\'O¶/^¼¸‹°ªªª¬\ç\æÌ™Wlzûö\í\Öý!C†P±ù¨m¢ŽMAl\ë\r\Ãø\'„lŠíª«®²$ô\Å_ük2\Ê]»¬\Ç#GŽ<CX*©Ñ£G[\Ï\é\í\å—_Wl‘\ÇZ¹\éý––³¼¼\Ü<û\ì³\Í˜EEEfccc§TKKK­\×\ékôñüùó\ÏøyñÞØ²ˆ\È\éNiŽ~Bv‰\Èm„lŠM\å\Û\ä\Ó\Ç*haUVVZb9v\ì˜õ}Ol7n´\î6\Ìz\\QQa=\Ö\ç7m\ÚdÝ¿\îº\ëÌ½{÷Z÷\r\Zd½\î²\Ë.³744œñó\â½±e‡Mµ§ \ÄGu‚J2n[¤ÚŠfÑ¢E\Ö\íÌ™3­\Û%K–\Ä\íc\Ó>|xgŸœ\n1v»>§Û†j=^½zµu«•`¬({z?b\Ë^S´*AI\Å69•&,@:bSEš¢7\ÜpC§°´ó?Z0Z©õ\í\Û×¼\ä’K,\é\é\ãxÛ”)S\Ìó\Î;\Ï\\¶l\Ùb\Ò>¼\Ø\ß©üÆŽk\Ýj_<±u÷~Ä–=±=-‚ú\"\Ù÷•––þ<•\ËD\0\Ò\Ûs\Ï=\×)”G}´S(z‚ V0\Ú\ï¦÷»l‹¾¯R1^x\á…V³RZ1Ö¶gžy¦³™:b\Äëµ‘J0R9.\\¸°\Ë\Ï\ë\éýñþ†‚4Ïª\"¶tú!]¥*\Ù÷Mš4\é\\½HwÖ¬Yý\È\"dKl\Z*´‹/¾Øª\È~ò“ŸXýk‘Ÿ-ˆÙ³g[÷ÿò—¿ô*’H\åg†\Ù\Ô\Ôdõ“\é\Ï\Õ\êKû\Çv\ï\Þm½\îð\á\Ã\Ö\ï\Õ\×ê­ž(ˆýy=½±e	=	 ëŠ¦(E\"|Y„lŠ-6\Þy\çKH\\ \ÑrZ!±.\Å÷)–’EÈ¥\Ø\ÄÖœ\ÖH¬J±®I\Äö\0YÄ†\Ø\Ü&¶õKS\ÛV‰ÿ#‹€\Ø›«1}\n…þž¢«%Ö’E@lˆ\ÍUHSò3\Ã0žO\å½ú>\Û\çdbs[St·TmO¤(¶{\åý\É\" 6\Ä\æ6±\íKõ€4a\Ç\ÊûO’E@lˆ\Ímb; qO*\ï0a\Â ©ö˜\"bs\ØK\ÅV™\ÆûMyÿ@2	ˆ\r±¹Ili]d+\ïo-))ù\r™Ä†\Ø\Ü$¶“£S}¿\Î\å&q™Ä†\Ø\Ü$¶6\ÓÕ©¾?\ì\ÔB\È$ 6\Ä\æ&±µ‹˜†¦ñþzyÿr2	ˆ\r±¹Il\ãÆ»8¦\è\"\Ûf2	ˆ\r±¹Il:\ß9i4E\ç\È\Ï\ØK&!Q\ÒY\æŽ@l½™,2M1\Þ$q”lB¢\Ô\ÕÕµ777#$‡¢±±q·ˆ­•#Ë¦¼¼ü’t/°µW’o\'›(555\Ö\Ö\Öv\ìß¿ß•¢8yò¤§¤V]]\Ý&QÅ‘õ\ïf\ä\Ðt¥4fÌ˜\ïkÕ§+]ƒÁ—‹ŠŠ†Y\è\rù Î–*\ã¨6¡\Üºfÿ®8ÑŠ\Ôb\Ð\Ë<ôrú\é.•Ÿõ¸= ¾Cn¿\Ñ)\ÇuÁ²^¢¢¢\â\ÇzBLx\Ã0\Æ8=ˆ}Ô¨Q\ç\Ûk•n\×jP\â¸\ÎÐ«\æ\É8x ók9^O‘	oWl¥²#e\ê\ç\ë\nVòóo—\Ø(Ñ¦ŒÜ¾+1Q6÷a€\Å6‘õr½/¶JŸ\Å\ß\Ô5\ä\à\Ña\\§%¶H\Õ8-\ËM\0œDŽ\ÉY\Ú_L&¼\ÝÕ‰\"\äHª\×J,\ÓoG\í\Ó\ÐE›%Ö“\ì\Èa\Å6/•\ÄÁ]\ßN\êD“.ø;®\Ðut6^û\ä\Ã^ZVVv{	²|,¾®]\'d\Â\Û\ßNO\è™L7ýM*3•šü]{\ìJ\î -½+\Øc±\Õ\é\"Ed\Â\ÃHSð]\ÌÅ­Ÿ}\Ü\Ãv3U%wD›¯ÚŒe\ïA†Ä¶%\ÕU\ÛÀ=;q¡W°\ë	=Ñ \Ë\ê‰û„~»†Ø“\à\àg\â+½&“Lx{\'.\Õ“=ø§÷\Ñ\Óòz\éˆ}	I›}I\É\íz‰	{\ÒøL\Ô/P2\áaD5zù…\×ÿ{µ,]¼ù˜}Qð§z\Ú^/f/C’b;N+Àû;\Ñw“D\ê0.Î¥Ãº\ì3¬»µi‘ÎœsWŸ‰6†zùÀ(e÷k~ýÿt@¾¨/I\ìW\É1P«®ù`\'~\"ñj>ü¯Z±1PzB».ÒŸ\\€.\Ä\n…\æ\æ\ã\Ì@}ˆEöÿpù²cnAˆ­Qv\æ#ùœ\êC\Ã0®\×ËˆÈ„÷\ÅÖ¬•™ø7\Ô\Ï_d_ß¡]d\Âû\âCS\ÉD\Üü0P?¿Ä¦£\\ö	\ï\ïHýÀ\ÞD&\ÊõýÿEö²^I&¼ÿa=!QL&’ƒú¾ý<¼¥ý«d\Âû\ßP§Pž\Ô÷*5\Ýwd\Âû\ßP§KJJ~J&œúžÿ<\èP¼—È„÷w¤^ÿC2‘¨\ï½\Ï\Ã^­¾É„÷w¤)\ÛEd\"ó0P\ßŸ_|;™ðxEa\á\"\Ô,\Ã@}w¢]Œ>ñ8Z©1..÷0P\ß=\èp*VE&¼ý\íôCV¼v\Ô\ÏyST»f¾K&<L8¾R\ÏÜ‘	w\Â@ý\ì©ðEï²ûZ=[G&\Üõ3VÅš[2\áý²»XG	O~)1P?\r&L˜0H—ž\Ôq\Ò\Å\Å\Å\×Ø­—V\Åd\Ç\ãè·½^%O&¼_y3P?¥/v­|\ÍnBŸ?l“›K¦<†|\Ã\ß)ˆ¯É„¯>¬\ÔO<Wuq\Ä‰ù|\\M¦<†\Ý1\ÝL&ü	õjŽvô 6Vƒ÷hS´Jg\Ð%þ‡úq?\Û\ãH\í4ºxw§\ê·ùd\"¿` þ¿yUv\'6=±À‘\â\Ý>†Wu•*2‘\×\äý@}ù¿[c\Ä\Ö\Ä\Ùeo[-\ÑuE\ÉD\ÈÇúòÿ-\'¼¿CWH¬#\Ðù2P¿¢¢\â[\â*¶]\ìy\ï‹m\Ñ!\Ð~¨ÿ»\ßýn›ŠM*\Ö\nö¶÷Å¶^\Ëp2\É\àÃú\Ó$\Ì#F0\éªÐ³bz]™€TñÁ@}•Z\Çw¾óû÷\ïoö\ë\×\ï~öªÇ‘o\Ù\Ï\ÃxžL€xp ¾%5‰\Ùú OŸ>3¢ƒw›¢»¹^2ø\Å\é\æú\Ó\âHl\Zró¾\ØöÉ±÷\0™€,H\ÎMõ{“Wdûtöœ7\Åv@\â2Y>\îr9P?ÑŠl:•›w°\Ã:¤„L@®\Èò@ýd›™*·v*7\ï‰í˜ˆ­”L€\Èð@ýTûÎ¦\Ùr£róØ´Sw4™\0·\áð@ýtO\Ð\ç\æ1±µ1.<@:õc¥¦—<[\Ðû\å\'±¯£\Ï\ÍCbk—ƒc(™\0/‘\Ä@ý\î¤ö©„i\ßö\éAjÝ½Ž\Ê\Í#b\ë`\åqð2ñ\êŸþùtSa=k\Ë\Ê\ìAn\ÑR‹\Ä<›µ±™\Ì;~!2Pÿú\ë¯?r\Ã\r7˜gu\Ö\Ã	H+Zn½m/ Y\êr&Mšt®ŠL€Ï°*ªn¤Ö›\Üú%(µ\è\ß\Ã\ÙR·Q^^~‰–\îdü&µdÓ\ÜZ“Z¬\Ü\èssz\Ò@;^\É\ä™\Ôz’[2R£Y\êFô2½ÜƒL€dik’\ï\ë\×M¥\Öj?Ÿ\Ë\í÷bW\ä\Ã0\Æ\èºd|V±%\Ú,tºb{ˆ]\àŽŠ­Tš£\Ç\È\äasÔ©>¶\ÈXRš¡.›®§x˜L@ž\É\ÍÉ³¢\\¬\ëÂ¦\è½:m™\0ŸÊ­»³•N]\ÇVVÀ\ÙPw\"R{P\'š$\àS¦wSQ99ò Š»\\‡Ÿ	È£f©ScE‘š[	ƒ/\èb.dò¤r‹–Û¼‚\Äf÷ˆ~×«y¤)ºPª¶\Ídò¤rK§O©yHlKuÁd2yZ¹¥Úœ7#\ÕZ.F& \Ï*·d$…\Ô<X±Õ‹Ü–“	\È\Ã\Ê-‘fiY\'\n¼G0ü\Ð0Œ\×\ÈP¹u»½©y³bûD\âU2È­KEÇˆ¯\"\ÍÐ¡Ph.™\0\äö/‰õ\ë\×oF#\n</¶F\Û#dò«B\ëÛ·o­a¦\Èí¯¤\Ä\Ûbk±\Í$\0V\åf–””t\è\Êô¤\Ã\ÃƒÁCS\É€\Å ]³T>¿$Fv\â‰›\È@g+F\×)-#\Þ\Û	‰b2\Ðù™8(q™ðvST\Ë\îk\É@§Ø¾’\Ï\Äcd\Â\Û;ñtII\ÉO\É@gSt«|.	o‹­Cv\ä\É@\çg¢^b™ðöN\Ô\Ó\Û‘	€a\Æ?¥)ú™ð(²óª\Ø$¸\Â\Z\àßŸ‹—\å3ñ)™ð0\Ò¨+Á\ë\ádÀúLÌ‘\Ï\Ä2\áqB¡\ÐX=‰ ³\é’\r )j\Ü)U\Û\×d\Â\å÷\ÕzÅµ\Äj²ùL8\È\ç\à8™ð\Ï½\\v¨^uýQA\ï‹\\\0øµ)ú3ù´‘	Q^^~‰Ž•û\å¤I“\Î%#oŒ7\îb½ŠLøŒŠŠŠd\Ç\î•h3f\Ì÷\É\äzµ@aa\á9d\Âg”””œ¥\ëJYþ-S¸@¾!\Ç~{QQ\Ñ2\á\ßüž=Pþ\n²yT±µÊ—ûoÈ„¿\å¶L;S,y$¶#z\'™ð¿\Ü^\Ðk\Ý\ä6H6 \Ä\Ö,1ƒL\ä‡\Ü\ÒQ\nw\rð¹\ØvI\Åö™\È¹Mµ\åö \Ù\0¿\"R\Û,ñ2‘_\ßf!•›aÏ“\rð\é1¾Fb™È¿\Ê\íZ=¡ ±”l€\ÅöºTl\ÉD¢3\ï\Ê\Î?)ñ.\Ù\0Ÿ}q?+rûœL\ä):û®½\ÒÕ§zQ/Ÿˆ\í9¦÷‘‰<¦¬¬\ì\"¸\ÃjÔ¨Q\ç“ðASô6‰\Ãd\"\Ï\Ñór \ì\Öy¬t1/£sj7™€‚Y³fõ“ƒ\ácúˆqv\àñŠ\í\n=óO& ú ¨Õ±v¥¥¥?\'\àEt#\áƒLÀ\èÅ:\Ë0Œ1d<úm\ê^dbŒ\'\íQ\n7‘\rð\àñ\ÛÎ¬6\ï\à˜¡s[I\åv/\Ù\0»\'õ$™€x\È\Íú\í\'‚{œl€‡Ž\Û\Ãr\ÌV’	ˆ‹Tl\×kŸ›|þl€Mz¡.™€‰,ñ\'L\r\Ù\0¯Ÿ\ë\Ð*2½b/ñw\\ä¶©€%þÀ\Ý\ÛF\Û2	¡Kü\ÉA£Kü\íb‰?p±\Øjtú\"2	c/ñ·O§`f‰?piSt‘½x8@\â\èl r\à\ìˆ%þÀ\ÛSrl\î\"\n}Dn\ëu‰¿P(4œt€[\ãq¦¶(\È¤Œ@oéŒ¼\Å\Å\Å×\rpI\Å6Q\ç\Z$®\Ü^\Òk\Ý\Â\áp€l@®\Ñ“u22N\È\ía¥ ß–·“\r\È%zi’$\à†a\ÜiÁ\âªo\Èö\ä©L]\Î!R+µgWxŽl@[\Ì\rŽ\"\Í\Ñ_\ë	‘Ü›dr$¶\ÓrþŒL€£\è:}ŒD=Ù€ˆM‡ÿ•	\ÈD\åf-ñ\'·\ÛY\â²‰´\Éq÷Nà —HTI&3\àºÄŸ\\X\â2…a\Ó\äøÒ©Štó	X‡ž<ˆ‰Ó………\ç-p²Yú]]\âO‚%þ \Õ\Ù@W72\ëñƒL\ã\èr€m‘Œ%þÀqô,|Obcddú\0\\#ß°­œ±‚[G\âTk;\Éd\ã\0\\l7F“\rp\n\Ò×Ø´Ž\ì@V°§–a‰?pú¸\Ú#¶6N\Z@V\Ñ\éel¹\ÝC6À!±\r\ÖQQb«%+uDl“\íñ¥‘\rp\è˜Z›4O¯$#«\Êmœ\Ýç¶€l@ºh\ÓSWU\ÓÊl@N1c¤|\Ó\êÁXM6Àª­\n±+C%Ž\Ë\É.\Ç4\Ísv\î\Ü\ÙP__o®Zµ\Ê\\¹r%‘BTWW›kÖ¬é˜\ËQ\åcDj—J|£‹qp6Ë½¨\Ô\ê\ê\ê\Ì\æ\æf³µµ•H#ZZZ\Ì\Ú\Ú\Ú‘\\G–\Ñ%þ¤rk’h.))¹ˆŒ¸­Ôš³r“\nŽ\é\ÌýŽ\Ýü¹Tn‡\'L˜0ˆŒ¸m~\"$gC›¦YùA\Û–øsú!DFˆ\r\Ò@š¤\Ëõô½a¿\"\Þ\Û\Ñoö™;\ß\Ñ\ÜZýg+ô¾>‡\ÈX\'^±§{fVTˆ\íÈ¡=\æ–3Ì–\Ý}F\èsº\r™!6(°.\ä}\Ä^(\æ6²\á~±5l}³‹\Ô\"Ñ¸u)2Cl!Þ¥r\É\ÝO6\Ü-¶m«ÿ\ZWlº\r™!68³YZf/\Î<l¸Wl[VÎŠ+6Ý†\Ì\ÄPRRò[›ao\rÄ†\ØÀ7\è\Ì\rö\ëÈ†ûÄ¦gA\ã‰M·!3\Äq¨¨¨ø±ˆ\í¨\Ä6]WŒ¸Gl;\Ö>Wlº\r™!6\è{•¢\Ò4md‰?÷ˆ\í\àž\Íæ–·gvm†\Êsº\r™!6\è½\Ï\í»\"¸\ÜAÉ½\Ø4vmx¥‹\Øô9D†\Ø A´)*U\ÛVmš²\ê·\Ävò¤¹c\ÝÜ®\ÍPyN·!3\ÄI b«“h•¸Šl\äFl:²à³µ‹\ÛÇ¦\Û}€\Ø I\ÃxMW(b‰¿,‹M*±};jÌ—\ßWj‘\Ð\×\èk©\Þ$A(š««`Iüžld^l½UiToˆ\rœk–\ÎR¹±hn\æÅ–H•\ÖSõ†\Ø$\×,½E‡`\É\í£d#sbKUj‘@lˆ\r’¯ÜŠu\Ú#©\Þæ“ö±ˆ\r²‹H\í—:ae XI6b\ßPTT4L\äv\\ä¶±€%þb5K­%þ$¾`‰?Ä†\ØÀ7\è²~\"¶&‰ý,ñ‡\Øø­Ö‚Á\à\ç\"7–øClˆ\r|E\ÛºÄŸö¿‘Ä†\ØÀOýno\ëS=sJ6b?\É\íU½\ÖM¯y#™Ûœ9s\Ì\Ë.»\Ì\ìß¿¿ù½\ï}\Ï…B\æ_|am“_aE\äµÑ×¯_oŽ1\Â<û\ì³\Í˜¿ø\Å/Ìµk×žñ:\rý¹ƒ6\ÓYµ>ö\ï@l\àI@•ŽRÊ­’ldNlÿû¿ÿk	\ã\Úk¯5Oœ8a¾ñ\Æ\Ö\ãaÃ†õ*6••\Þß¼y³¹q\ãF\ëþ¥—^\Ú\åuÛ·o·\î2„Š\r@\Äö\'{¬\Ùd#3b>|¸%%K–$T)E?\Ö*Mï«¸yŸVnz¿¥¥\Å,//\ï¬ôŠŠŠ\Ì\Æ\ÆFsÁ‚\Ö\ëJKK­\×\ékôñüùó©\ØÀ_†q£ž¹=M6œ›\ÊF…qøð\á¤Å¦MX½\Þyç™•••V\å\Ö\Ý\ë\"\Õ\\¤\n¬¨¨°\ëó›6m²\î_w\Ýu\æÞ½{­ûƒ\r²^§\Íc}\Ü\ÐÐ€\ØÀ„B¡\ß\ê\"¸%d\ÃY±õ\í\Û\×\ÆÁƒ{\Ü-,}.òXû\ÔTT*7Ý¦²‹\íc\Ó\ÐÊ°¾¾\ÞÚ¦•Z\ìv}N·\r:\Ôz¼zõj\ëöò\Ë/§\r|\Ý,½Êžw-\ÙpNlZEõ\Ô47£Å¦\ÏÅ¾.RUE-¢)S¦X\â[¶l\Ùb\Ó>½ØŸ£•Ÿn;v¬u;yòd\Äþ&j‰¿OX\â\Ï±=ýôÓ–0Fm‰fñ\â\Å\Ö\ãý\èG\ÖöQ£FYõ÷\Ô\Õ\ÕY÷GŽimÓ“úXÏŽnØ°Áº¯\'bE¤?WŸ¿ð\Â-\êYW\Ýö\Ì3\Ït6Sõìª¾vÑ¢Eýqz»p\á\Â.?/‘ûˆ\r<…½\Ä\ßA‰]±¥¹‡\nF›Š*­\ÆT\\‘f\ã\îÝ»­3¦Zei´°°°óR\í‹\\\î¡\Ûôr\Èûb%£¡>6\Ãljj²š¯ú»ô½Ú¿¦¿G_§}}‘\æ¯\Þ\ê‰\Äy\nM\Å\Æ\\ KS|…6EµIªMSm¢\"6±oÐ“	ù¼\ÄbCl\à\ß~·%ºÄŸ^‚\Ø\Ä¾A/\àµWÁº±ˆ\rü$·\Ù:K‡b!6±Ÿš¥•öø\Ò*\ÄF 6ð\r‘%þtú#\ÄF 6ðS\åf-ñ§W\"6±o°—ø;¡SŽøt‰?Ä†\Ø \Ñ\Åat‘],ÆKü!6\ÄyŠ½\Ä\ß~]\æ\ÏoKü!6\ÄyŒVkº0³½@ó¥ˆ@l\àú\"¶\ã~Y\â±!6\0‘\ÛJ¿,ñ‡\Ø@\'\"µù~X\â/%\í\Ä>\Ä0ŒGu”‚\Ü\Þ\â\Õÿ¡®®®½¹¹!9»El­|:À\ër›¦ƒ\çEp³¼ø÷\×\Ô\Ô<X[[Û±ÿ~\×\Ê\â\äÉ“ž‘Zuuu›DŸðC³ô÷*·P(4×‹¿|gK•qT›Pn]\ã\à\í·\ß6\Ýú÷EE+R_!\Ûh\ÓM*¸\×È†s”••]:\È@\î\äYâ¯Žl8V\r\ë˜\Ý62C¤º¬\ë(\È\íV–øs\ä\Ë\"$qŒL\0\ä¾\Êh¯€\Å\é‹\íOšK2\àF\Zu¾Tmò¡<\ïKü¥YWi\É€K°—øÛ–\ïKü¥Y±½\"b\ÛN&\0\Ü÷\á\\\'q2_I6’n\Ö/“xL\0¸\Ã0ÞÊ£­¤¤\ä7d#\é/…dÀ¥ˆ\Ø\æÙ«`•‘„s¶Uòµ€L\0¸˜P(t¿\ÊMšWw‘„*¶\Ý\"·\'\È€û?¬·©\ÜDrž‘/€’§û\È€7šX%ö´G¯¿Ž\êX\\2\à\Ãø•NX)’[N6\âŠM\'ô¼–L\0xif\r\×%þ\äÃ»¡À§Kü¥)¶v¦F&\0<†.ñ\'b;,b_.ñ—¦\ØLr\àQtY?©Lš%š***. #\ãÆ»X\ÄÆ”E\0^F+©\Üvùm‰¿4ª5\ê4G€÷\é#\æMR¹—š\çb+\ÖþG	\0ÿ|¨«¥z;e\Æ\È<\ÎÁZ½r4\0øëƒ½@›b¡Ph\\>þÿ\"ö‡\äÿ\ßÇ‘\0\à¿÷cö¬\Éùö¿Kµú¼ü\ï;8\n\0üY¹\Ýc¯‚53\Ïþ\ï\×%>\à\0ð\ï‡ü&•[ x*þ\ç5«\Øû\0þþ ¶Ç—.Î“ÿ÷#‘ù\"ö<€Ï‘Š\ígòa\×%þ\Öøý\Õkú¼º5\0$IQQ\Ñ\Ü1‘\Û?/ñ§#1\äœ\Å\È\ì\áF_\ëDŒ~]\âO*¶oóñl0@^£Kü‰\Øö\èdŒeee?ð\Ûÿ§\àh¿\"{\Z Ïj\í,]žNpDnè³ŠM/q\Î^\ÈSDlõZ\áˆ\è~\ê£ÿ\Éd¦€<G*œ7EmR¹ý\Ú\ëÿ‹\nM\Å\Æ^\0­rž³‡`•zùÿ°gng@¤r{@¥`Æ^ý\äo£Mkö&\0t\"\Í\Ñ\Û\íÅ™ö¨\Øn\Ñ\Ë=Ø“\0p\áp8`ÁzÉƒbž-÷~ö\"\0t¡¸¸ø\Z=¡ ñ–—þnJ%r\Û\É€x’°–ø“X_\à‘%þtð»ˆm{\0\âRVVv™öY\éÄzQ¯š¢5ù0\Ð\0\ÒdÌ˜1\ßY\èÀò}n¿ðUÄ¶Q\'šd¯@¯Lš4\é\\\Æ.Ç¡òòòK\Üúw\ê\â\ÑzM{\0¥ö_‰8Ž‡\Ã\á\Ë]*¶}²«\0 \Ù\æžöc\nƒW»Pl\ß\èµx\ì%\0HšP(ôw½\Ö\Í0Œ\ë]&6=‹[\Ì€”Š\íq{”\Â\Í.›^X|{\0RF*¶{uþ3‘\É—ˆ­Cþž\ì\0HW&7Ù•Û“¹ü;\ì3·LY\0ŽUn:«\Æ\é@ ð\\ý\rºX\rS€£”––þ\\\Ä\Ò*MÁwrñûu¢L=[Ëž\0€LTM\ÇD2g{‰?»I|”½\0\0Ž£KüI\Õf-ñ§ý^ª\Î\Ë\Ï/\Ók\é&L˜0HŸ…B÷\Éó-\ì\0\È‘%þT4™X\â\Ï›ò\\‡}VT/>$÷[$¦³7\0À1t6Ë§™Z\âO~\îG±r‹‰öH5\0\àtuõ®„\ãKü\Ù3ý\Æ[.\Ï\Ð@ ¢Yª3òJñZ‡\î\Ñ8R;^XXx™€Œb\Æóö…¼!§~¦ˆò¡\î\Ä&\ÏW’q\0\ÈV\åö ½~\éTfkŒ\Øö’i\0È¶\Ü\î°\åö?Oš\Ëcªµ«\É2\0d‘OP‡`\É\Í\éþ¬p8|eT\ß\Z¹\0@N\åv­}BaYº?k\ìØ±_©\Ø\Ãø-™€\\7K¯\Ð\É!En\ï¥ñc¦I˜#FŒ\è\àº5\0pºÄŸ4!¿¹}–\Â*µŽ\ï|\ç;ö\ï\ß\ß\ì×¯\ßýd\0\\½ÄŸÚ›\Ä–\Ô$fÛg\Ä<\0\È-öD‘_\ê8\Ï–ø›GbÓ\0¸>ö\Ðc=,ñ×›¼\"\Û\0\0\îAÄ¶:\Î‰VdÓ©\Ü\0Àr[¨×º…B¡±)63Un\íTn\0\à*À:J\á¿þ\ë¿¥XM³\åF\å\0\î\á\Ê+¯\\þ»\ßý\Î0`À#)þú\Ü\0ÀUXRŠ’Z‰g\íÛžˆ}}n\0\à©E\ÉH%õ©„i\ßö\éAjÝ½Ž\Ê\r\0\\%µ»3£¢;¹EK-ózù¹\0\09‘Z<iEË­·\í4KÀMR\ëMný”Zô\ï\ál)\0\ä\\j=É­5	©\ÅÊ>7\0È©\Ôz’[2R£Y\n\0e-¤­I¾¯_7•Z«ý|2,·\ß\Ë\\n\0‘Š-\Ñf¡\Ó\ÛC\ì\0\ÈesÔ©>¶\ÈXRš¡\0S¹9yV”‹u «r\ë\îl¥S×±•p6\0rÀôn**\'GT‘b\0pC³Ô©±¢H\r\0\\Q¹E\Ëm^Ab³{D¿Ž\ë\Õ\0Àu•[:}bH\r\0<Q¹¥Úœ\0p]å–Œ¤\Z\0x¦rK¤YZVÀ‰\0ðQ\å\é“Cj\0\à¹uwý\0€\ç\ä6=\Éf*\0€«‰Thµ\Ì\Ò\0~ª\ÜÆo\"5\0ð¶\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±‘\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0Ä†\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0\Ä\0€\Ø\0\0\0\0b\0@l\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ç$Ö¤\"\ë%Ž’)\0ð’\Ø\Êz[ ˜M¦\0Àkrk\éAlG\n\Ï!K\0\à›ª->D†\0À«rë®¯\í(\Õ\Z\0øªj£o\r\0ü ·½Tk\0\à+¤B›%¶\éd\0üRµY}mTk\0\àIT^Z™I\ÔÙ—|´\Æô³–8(Q\n…\æVTT\\@\Ö\0À•\rYÕŠ¬N%0\ê úÒvi®n•Û«\É\"\0¸¦B1-¡™\É-N\ÔSÁ@N)..¾F*­±‚ª¬¬4\çÍ›g¾û\î»\æž={\Ì\'N˜Š\Þ677›|ðùò\Ë/›S§N\ín¨\Õq\Ã0®\'»\0uôlg8n–\Ò\Ýw\ßmI\ëô\é\Óf¢lÚ´É¼\ï¾ûb\×Áõn\0u©E7=Ep\æÒ¥K“Z,Ë—/7¥\ÊÅ¼\0›\æ§H­#º\Ùù\ÙgŸ™Nð\å—_š·\ß~û•\ÍR\0\È(z¢ ºOM¥¦}fN¢?/Zn\Ú\ç\Æ	\0\ÈdtytóÓ©J­»\Ê-¦Yºž\ì€\ã\èuj\ÑýjÚ§–I´\Ï-º¿M›À\ì\0p½ø6ú\ì\ç©S§\ÌLs\Ï=÷D7I·²\0À1´o-zD^Ò‘\r6o\Þ|\Æ‰\ì\r\0p½\ì\"ú„A:—u$KôE¼:¶”½\0N5C\ë\"ry\î¹\ç\Ìl2þü3†\\±7\0À)±u.Ì¢Ã¤²‰6{£š£‡\Ø\0\à\"”\Îþµ}ûöeUlz][ô”G\ì\r\0pªb\ë”Kd@{¶\Ð\ßýû\Ù\0\à¸\Ørb\0*6\0€Þ \r\0üX±qV\0|\'6®c\0\ß5E\Ê\ÕÈƒ?ü\áŒ<\0\0ç±—\Ô;\ÍXQ\0ð[st}ô\ìÙ¨Ú¢\×B`v\0p{\Ý\Ð\æc\0¿UmuÙšA÷\Æod]\0\È<ºö€®A\é5¦L™Âš\0=tÕ¨\è&©Ó«TEKUª\0 ›r›-7§\Öi~²®(\0\äVn‘³¥º²{²—tÌ˜1ƒ•\àÀ=\Í\Ò\è>·\èæ©ŽPxÿý÷­±¥‘óz«}h*?Q}ñmtŸ\Z\ÍO\0\È)Ú±}¶4\ÍXÏ‰\0p\rz›T[£G($:¢@/¾\r…B¿%‹\0\àJtø•=¶T«¸–\è)¢†F\Ò\í:ö“aR\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Îòÿ\É\ÆýXÃ©P8\0\0\0\0IEND®B`‚',1),('2508',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0fˆIDATx\Ú\ì½	pUÇ™°m;ûdõ\Ôd\\)OÊ•ú\ÊC¥\\v¾Jù«,6SS\É8ž€u\îÕŽv!	±/F,ƒ\ÍbÀ`v#0(0ƒÁ`Ec³0K°`,°Bˆþû\ípõ]„–»i9\ç<OU\×]u%½\Ò\éóœ·\ß\î¾\ç\0\0\0\0\0\0\0€.¡\à\å·UK-Z¯\0\0€\ÃE¢­\ç\"}\0\0\0	D\0\0\0	\0\0\0@$\0\0\0\0‘\0\0\0\0Û‹³6\0\0\0\0\0\0\0\0\0ºJ©\ïmÝºuýœ9s¾˜6mÚ­Áƒ«\ä\äd«\ÔÀUaa\áñ\ã\ÇšŸŸ?ˆˆ\0\0À=.\\ˆ[¶lÙ•¨œœU\\\\¬ö\îÝ«>û\ì3UWW§„7n¨ªª*õþû\ï«\åË—«\ì\ìl•››{kÔ¨Q»½^\ïD\0\0Àeh?x\à\í·ß®\Î\Ë\ËSÓ¦MS‡6\Â,GUs\æ\ÌQiiijð\àÁ\ã‰(\0\0€‹²³fÍºUPP <¨\"\áøñ\ã*??_eee}žœœü=¢\0\0\à`®^½š_XX¨^~ùeu\å\Ê\rdD>¯ÿþg¨\0\0ÀÁ™‘ˆ)S¦¨›7oªh3o\Þ<\ÉLü­W¯^_\'\Ú\0\0\0Bj\"d8C2!~fÎœ©\â\ã\ã+ˆ8\0\0€ƒ\ÂJ©‰ˆ\ÖpF[\Ã\Ù\ÙÙ·¼^oQ\0\0p\02¤!³3dfFg ˜qqq\ÔK\0\0\08\0Y\'B¦xv&\'N¼»‘\è\0\0\ØY±R›\ê¬l„Ÿ?þXy½\Þ\n/\0\0l\Ì[o½µIV¬\ì\È\Ë\ÖHNNn´,+¿\0\0€M‘½3d\Ù\ë®`ÆŒ\×bcc÷ðW\0\0\0°)²—\ì\Ñü\å/¹©E\â\0\0\0›\"»x\Ê\\]Auuõ--õü\0\0\0lŠl\î\ßÅ³³‘MÀdrþ\n\0\0\06EN\ä]	\"\0\0`c’’’º2#q‘\0\0\0°1ƒ\r\ê²\Z‰ªªª\ÔH\0\0\0Ø˜±c\Ç\ÖwÕ¬­[·V1k\0\0À\ÆL˜0¡¢«Ö‘(,,¬d	\0\0\0“ŸŸŸ’\Ý%+[\ÊÙ¬l	\0\0`™h\ì\ì½6\Ê\Ê\ÊdXƒ½6\0\0\0\ì\Î\èÑ£wN:µSE\"##£’\Ý?\0\0@rrò÷\Ò\Ó\Óo=z´S$\â½÷Þ«–l„\×\ë}€\è\0\08€\Ü\Ü\ÜÂ¼¼<u\åÊ••ˆk×®5ú|¾Z\"\nˆ:\0\0€ƒ\È\Î\ÎþlÆŒYxyK*Ë²>!\Ú\0\0\0C\nsss«\çÌ™\Ó2qkÔ¨Qge\ÝJ!\Ú\0\0\0•‰ŒŒŒª\éÓ§«\Ú\ÚÚ¨\rgô\ï\ß_Š+\ÏQ\0\0\à™HHHø$33óÖ¡C‡\".¬”š\Î \0\0\à\"¤ 2>>þ\æØ±cD(B\îØ¿ÿE©¹¸=;ƒ\ÂJ\0\0\07\"YË²VKV!11ñÖ´iÓ®½ó\Î;7+++oÜ¸Ñ´‹§lÀµmÛ¶jYöZV¬u\"\Ê\0\0\0\0ƒƒÝ¶\ëV¡\å\âšl\Ð\ê¥B·2Yöš+\0\0 ¹PH\0\0\0„-111ÿL$\0\0\0 d,Ëº•˜˜ø ‘\0\0\0€°D\"99ù\'D\0\0\0B&66¶Q\Ë\ÄO‰\0\0\0„#7\ã\â\â~N$\0\0\0 ‘hðx<O	\0\0\0G$\ê-\Ëú\r‘\0\0\0€\Ñq\Ý\çó=C$\0\0\0 ‘¸g	\0\0\0™\Ø\Ø\Ø/d\él\"\0\0\0!cY\Ö-\éD\0\0\0BFK\ÄßµL\ä	\0\0\0G$.\é6„H\0\0\0@8\"qQ·\ÑD\0\0\0BÆ²¬JŸ\Ï7H\0\0\0@\È\Ä\Æ\Æ~ª\ÛD\0\0\0\Â‰³^¯w‘\0\0\0€\ÑQnY\Ö\\\"\0\0\0!{J·\ÅD\0\0\0\Â‰u+!\0\0\0ŽHñù|\"\0\0\0ŽH\Ôm-‘\0\0\0€±,\ë}¯\×ûg\"\0\0\0![¦e\âM\"\0\0\0\áˆ\Än\Ýv	\0\0\0G$vˆL	\0\0\0G$¶\Êð‘\0\0\0€pDb£nûˆ\0\0\0„Œ\Ç\ãY\çõz	\0\0\0YŒÊ²¬ˆ\0\0\0„Œ,-\Ëd	\0\0\0G$\Ë\Æ]D\0\0\0B\Æ\çóÍ³,\ë\"\0\0\0!\ãõzg\Æ\Æ\ÆV	\0\0\0Ë²¦h‘ø”H\0\0\0@\Èø|¾	Z&*‰\0\0\0„Lll\ìh\Ý.	\0\0\0G$†\èv‰H\0\0\0@8\"‘oYV\r‘\0\0\0€ñz½™º]!\0\0\02\')66ö‹\ÛRñ€n¿\êÛ·\ï#D\0\0\0\î@DÁ²¬kZ\Ztk\ÔMµ\Òv-\0\0\0¸-	{\Úi·RSS\"R\0\0\0p·‡/\Ú\ÊF\ì#J\0\0\0Ð–L¼ÞšHX–Õƒ\0\0@[\"ñ@K5Z\">$:\0\0\0\Ð.²\ëgs‘ˆ‹‹³ˆ\0\0\0\Å\í~‘8GD\0\0\0 h¼^o_$\ä>\0\0€°,ëŠˆ‘\0\0\0€¹½û\'\"\0`\Þ{\ï½Ìœœœÿþ\ïÿ.7F£\Ñ\"hÿöoÿ¦zô\èqJ\ß€3¸B\"~ñ‹_¨ÿùŸÿQ\ï¿ÿ¾ª««S\0\0\r\r\rê£>R}ûöU\ßúÖ·n \àxrssD\"\0\0 ºü\æ7¿i\Ô\Ýlg\Zp42œ!™\0\0ˆ.G½¥»\ÙœiÀ\é0œ\0\Ð\È0\Ç\íº	\0g‹\0\0tˆ \0\0€H\0DC$\îieªSwy\0\0‘\0\è\æ\"\Ñ\Ös]ý:\0\0\"€H \0€H\0 ˆ\0\0\"ˆ\"\0€H\0 \0\0ˆ\0\"H\0\0\"`_‘¸‡\éŸ\0\0ˆ@8\"\ÐY8p@-X°@M:U\r<X%\'\'«\Ø\ØX• ¨Æ§^z\é%µs\çN‚ˆ\0\" Ôµk\×ÔŸþô\'5`À\0•““£Š‹‹\ÕÞ½{\ÕgŸ}Ö´Ì7TUU•\Ùhnùò\å*;;[\å\åå©…ªšš\Z‚ˆ\0\"ndÏž=F¦M›¦>l„!XŽ=ª\æÌ™£\Ò\Ò\ÒÔ›o¾I0‘\0@$ÀMYˆY³f©‚‚uð\àÁˆ>\ëøñ\ã*??_\r:T\Õ\Ö\Ö\\@$\0	p2’u(,,T/¿ü²ºr\åJT>S†@\äó†\ÂP \0ˆ89!1e\Êuó\æÍ¨þ¼yóÔ AƒT}}=ÁD\0‘\0§!\Ã’9\è‰ð3s\æLS¸	€H\0 \à ¤°Rj\"¢5œ\Ñ\Ö0‡\ÌþØ¼y3AD\0‘\0§i\È\ì™™\ÑHf||<õ€H\0 \àd™\âÙ™Lš4\É\Ôb\0 \0ˆ\Ø©Y\è¬l„Ÿ?þ\Ød%(¼D\0‘\0#\Ë^K\ÍBGX¶FJJŠÚ±c@$\0	°+²w†,{\ÝÌž=[;–? \0ˆ\ØÙ€Kö\Î\è\n\Ê\Ê\ÊL6\0‘\0@$À¦\È.ž²WWP]]m\ê$\0	\0DlŠl\î\ßÅ³³‘\å¸er\0D\0‘\0›\Ò\Õ\'rD	\0DlLRR	@$\0	€ð\è\Ê\Z‰ªª*j$\0‘\0@$À\ÎuÙ¬;w2k	\0D\ìŒ\ìö\ÙU\ëH¼øâ‹¬#ˆ\0\"vF²\Ù\Ù\Ù]²²¥k°²% \0ˆØœ®\Øk\ãƒ>Pqqq\ìµˆ\0\"vgÉ’%f…\Ë\ÎdÈ!\ìþ	ˆ\0\"N ¶¶Vedd¨£Gvj6¢¦¦†\à\"€H€Ø²e‹\Ê\Ë\ËSW®\\\é\Ð\ïs\í\Ú5³š\æ\æÍ›	: \0ˆ8‰\áÃ‡«3fth\á\åÐ¡C°\0 \0ˆ8)|6l˜š3gN‡È„L÷”u#d(\0‘\0@$À¡2!«]NŸ>=j\'|\Î1b„‘\ê\"\0‘\0@$À21h\Ð •••¥:\ÑgIa¥\ÔD\Èp™@$\0	pR™˜˜¨Æo„\"”áŽƒšš™Aa% \0ˆ¸\É\"H¦¬B);…\ÊýÝ»w«\Ê\ÊÊ¦Å¤dOÙ€KöÎ:y¯„¬ÁP \0ˆ€Ab\âÄ‰*77\×W\È\àþ&ò 5cÆŒ1\Ë^³b% \0ˆ@«HF\Â\ëõ@$\0	€\Ð9r\äˆ¾\0@$\0	€°†9¤f\0‘\0@$\0Bfýúõ*--@\0\"€H\0„Î«¯¾ªú÷\ïO \0‘\0@$\0BgÖ¬Yf+p\0D\0‘\0™\çŸ\ÞLõ@$\0	€5j”Yp\n\0‘\0@$\0B¦  @ÍŸ?Ÿ@\0\"€H\0„Žl\èµb\Å\nˆ\0\":ýúõc3.@$\0	€ð½6ö\î\ÝK \0‘\0@$\0B\Ç\çó©S§N@$\0	€Ð‘?/_¾L \0‘\0@$\0B£®®Îˆ\0\"€H\0„\ÌÙ³g\ÙB	\0D <>ø\àO \0‘\0@$\0Bgûö\í*%%…@\0\"€H\0„\Î\êÕ«UFF\0D\0‘\0E‹©üü|ˆ\0\":Ó§OWÃ‡\'€H\0 \0¡3~üx\Ó\0	\0D d†\r¦^z\é%ˆ\0\":yyy¦N\0‘\0@$\0BFfl¬Y³†@\0\"€H\0„Nrr²YK\0‘\0@$\0BFVµ<p\à\0\0D\0‘\0\ÙgCö\Û\0@$\0	€‘?eP\0D\0‘\0‰šš\Z¶D\0‘\0S§N)Ÿ\ÏG \0‘\0@$\0B§¬¬L%$$@$\0	€¶©®®V\Å\Å\Åjó\æ\Í\êð\á\Ã\êô\é\Ó\æ~¿~ý \0ˆ@û\Ä\ÅÅ™šˆ\æM¦€¦¦¦ªôôtµn\Ý:ˆ\0\"p7cÇŽmQ$üM¦‚J\æ\0‘\0@$\0Z\ÞhK$fÌ˜A\0‘\0@$\0Zg\àÀ-J„]\Ö\×\× @$\0	€\ÖÙ¶m[‹\"!\Ï \0ˆ@»Hqe Ddee@$\0	€\à˜2e\Ê\"qüøq‚ˆ\0\"µµµf††H\ÄÐ¡C	 \0ˆ@h0ÀˆÄ‡~H0\0‘\0@$\0‚\ç\Å_T÷\ß¿²,KUUU@$\0	€\à%\â\Þ{\ïU?û\ÙÏ”\Ç\ãQcÆŒ!(€H\0 \0ÁK„_ŠŠŠ\îx€H\0 \0AID{\Ï \0ˆ@P²\à}Â„		\0D ôŒƒH™	@$\0	€°‡-D&\î»\ï>2€H\0 €D„Wû _\'2Af	\0Dˆˆ¾ž\Ì \0ˆ ­u¼ª­ÿMj&\0‘\0@$\0‰[$\ÈL\0\"€H\0‘HDc˜\0‘\0@$ÀAªH0\Ìˆ\0\"HDD\"\áÿ>\Ì\æ\0D\0‘\0—KD¸\"(\ÔL\0\"€H€$\"PBms\0\"€H€C9s\æŒ\é<{ö\ìt\æ!Z\"!<õ\ÔS\æ=òs\0 \0ˆ\Ø8#\Ñ\Ö0CGf$FŒÁ	\0Dœ>¼Ñž`„‚/†5\0‘\0@$À\Å2ŽH<ÿüó,Nˆ\0\"N•	\ÉŒ;¶CDbñ\âÅªOŸ>\Ê\ãñ¨\éÓ§«#GŽt@$\0	p\n.\\P>ŸO=ó\Ì3A\É\Ä=a¬l9`À\0µr\åJ5p\à@\åõzU||¼\Z5j”Ú´i“ª¯¯\ç\0ˆ\0\"v£ººZ7N\Å\ÆÆªaÃ†‰èˆ½6|\ÇójÏž=f˜#))\É|ÿœœµp\áBuþüyþ0€H\0 Ð©©©Q\'N4™\Éœ8q¢\éµ`\Öy¸\'\Ê\ëEˆ<ˆDô\ï\ß\ßH…\ÈEQQ‘‘\r‘\0D\0‘€nÀÕ«WÕ”)SŒ@\ä\å\å©Ã‡·šIˆd\ÊH’a\îaþðËŽ‹ˆ\0 \0ˆt2uuujÆŒ¦B†ö\ï\ß\ßa2\í\Ý>¥0ó¥—^R\é\é\éF*\Ò\Ò\Ò(\ØD\0‘€\Î@®\î\çÎk\"##C•––v¨tô–á’‘ `	\0D:©+)—r¢•+ø;v„ýYþE¤\Ú\æ())i±°²#G\n6‘\0@$ \Ê\'\×\×^{M%$$¨””µyó\æ¨|n{™MEgIDKP°	ˆ\0\"°f\Í\Z•˜˜hN \ëÖ­‹ú\ç·&þZŠ\î´b%›€H\0 $7nT\É\É\É&!\'ÊŽ¤ùF_Á{t5l\"ˆ@3¶mÛ¦RSS\Íwqqq§¥\ïýˆ\'Ÿ|Ò–»xR°	ˆ \àjv\ï\Þm®¬\ã\â\âÔ‚TCCC§ÿ’™ÿK»oNÁ& €H€kØ·oŸ\Ê\Ê\Ê2S9gÏž\Ý\åW\ÏgÎœq\\Œ)\ØD$\0	p‡R¹¹¹F d\\¿¶¶– tl\"\0ˆØš\ãÇ«‚‚s›4i’º|ù2A\éB(\ØD$\0	°§OŸVC†1©õñ\ãÇ«K—.”n›ˆ\0\"\ÝŸ—\âEˆÑ£G«\Ê\ÊJ‚b(\ØD$\0	\èRD\n\Í	HD\â\ìÙ³\Å\æBHÁ&\"€H@‡#Cr‚‘Ô¸,--C\Z\à,(\ØD$\0	ˆ:R4)\ë0\ÈIeÀ€\êØ±c\Å%P°‰H\0 62mSN\"r‘´÷Š‹¡`‘\0@$ \èôöœ9s\Ì:² \ÔÞ½{	\n\Ü›ˆ\0\"w!KWË‰@–²–Tö®]»\n›ˆ\0\"\áò«Ë’’“ª\î×¯ŸÚºu+Aˆ2Zl\"\0ˆ„KXµj•JLL4W6l  u(\ØD$\0	²~ýz#\"«W¯& \Ð)P°‰H\0 6gË–-føB:p\Î`ü\Zº\n\n6	\0D\ÂFHá¤¤”¥rÑ¢Et;(\ØD$\0‰nHYY™\Ê\Ì\Ì4S9_y\å\Ò\Ç`\Ú*\ØdS8D	\èdñ(¹²“xÆŒfq)\0»X°)\Ù\n·ÿ?#€H@‡!\ËW\Ë2\Ö\"²¬µ,o\r\à$!ÿ\Ûd$	@$ Êœ:u\Êl¤%¬Œ+“þ\'R^^ŽH €H@4©¨¨PÃ‡7\é^\ÙÚ»ªªŠ €c9tè©™@$	@$ B*++\Õs\Ï=g®\ÎFŽ\Ét9p\ï¾û®Yû‘@$\0‘€0©®®V\ãÇ7ˆ¡C‡šT/€[Ø¼y³JMME$	@$ T¤hrÒ¤IM\Ó\àŽ?NPÀu\È*¬2‘@$\0‘€ ‘inÓ¦M3\ë@\ä\æ\æš1b\0·²t\éRs ˆ \Ð² Ï¬Y³Œ@dgg«}ûöp=s\æ\Ì1³“	D	h…††5o\Þ<³”uFF†).p#§OŸ6+³\Ê0ž4‘\ë©S§š\Õ.	D	h†\ì%P\\\\l¦¶I1\Ùö\í\Û	\n¸\ZYUŠŠ[j\"\Ú\ÒRRRÔŽ;	\0D\ÂÝ¬X±B%$$¨\ä\äd³¿\0\0ü\Ù\r´5™&\â\í\Æýc	@$À°v\íZ3\'^v9”û\0p\'²IW[\"!¯3´€H¸™/)Y\ÉB¼ö\Úkl‘\Ðrœ´$’­p+ˆ .E\Ær\Ó\Ò\Ò\Ì\Ø\î\âÅ‹€ X°`A‹\"\á\æ™Lˆ 6ANúÛ¶m‹øsJKK\Í™\Ê9w\î\\WŽ\é„KMMYˆ-P\"FŒ\á\ê˜ €H\Ø§%BNeøþýû\Í\Z\"3g\ÎTuuuœ\0\Â@Vu\r	™\ZŠH\0 ¶	KOO*Cqøða•ŸŸo®¢d\ÞûÕ«W9\0D€ˆƒÿ8”\Í\ê\Ü\"ˆ„ME\"0CÑ’Pœ8q\Â\ìƒ!1q\âD“’€è——gŽ¿¿þõ¯ˆ\"ˆ„½E\"0C!Cf\'Nyn\ìØ±f‡N\0ˆ.²Ê¥c:\"ˆDXœ={\Öt$r\â~ë­·ha4Y-s÷\î\Ý\êÔ©Sœ•€c\Ë\Æ\Ç\"ˆDÝž={TUU•™ñ@¿]¼xQ\íÚµK<y’3(pl\Ùô\ØB$\0‘#¥IG\ÝÏû\0Ç–SŽ-D‰‘“N*ºMÒ±\0[ö<¶	@$BDL:(D¢\Ç\"€H´/þþ™ú\äýbut{‘ir_ž£sC$€c‘\0@$\ÚlWk>UG¶ªCo½£\Ésò\Z\"[ˆ\0\"\Ñj;wô\Ïwutþvþ\èF:8D8¶	\0D¢õöñ\Î[\í\ì\ä5:8D8¶	\0D¢\Õv\ä­q­vvò\Z\"[ˆ\0\"Ag‡H\0\Ç\"H\0\"ý\ÎN*\É[\ë\ì\ä5:8D8¶	\0D¢\ÕvªtN«¼F‡H\0\Ç\"€H´\Ú.}zX\Ù6ö\îÔ«~N^£ƒC$€c‘\0@$\Úl\åûK\î\ê\ì\ä9:7D8¶	\0D¢\ívýº:õ—yw§^õsò\Z\"[ˆ\0\"\Ñ\ê\Ê{\'Kg·:Ž+¯±\"[ˆ\0\"q×•\Òg§\ÞV½9ªÕŽ\Î\ß\ä=ò^® 	\à\ØB$\0‰v¯”¸‚B$€c‘\0@$Z\íì‚¹Rj\ë\nŠ\Î‘\0Ž-DÀ\Å\"nG\çotvˆpl!\0[\Ò	\à\ØB$\0	:;D	Ž-D\0‘ ³D‚c‘\0@$\è\ì\0‘ !\0ˆ\r‘\0Ž-D\0‘ ³C$\0‘\à\ØB$\0‘ ³C$\0‘\à\ØB$\0	:;@$hˆ€\ËD\âögZYY™yNnŸ÷}_ù\ÊWT=ÔŽ;\"þù	°«HÌŸ?_ýø\Ç?6Çƒ\Ü.]º4¢\ãÏŽ\Ç\"\à‘˜6mšynÊ”)mvdÁ¼O\î?~\Ü\Üøá‡¹jWŠÄŠ+\Ì1––¦\ê\ê\êTff¦y¼v\íZWWˆ€DB:¥\ßý\îw\æ9¹\íÙ³g‹Y°\ïü|¹‚’û/^T‰‰‰\êk_ûšú\Æ7¾¡úö\í«ÎŸ?\ß\Ô\Ù\Æ\ÇÇ›÷\É{\äñò\å\Ë\ÉH€­E\âñ\Ç7ÿ¿§OŸ6\Ë\Ë\Ë\Í\ã\'žx\ÂU\Ç\"\à‘\È\É\É1Qmm­\é \äqKY°\ï“û~ø¡¹ÿ\È#˜\Ç\É\É\É\æ±<ð\àAsÿ©§žR.\\0÷z\è!ó¾ý\èG\æñ¹s\ç	°µH\È1\ÒüÿW\Ë	\ßM\Ç\"\à‘X³f¹;v¬¹}ýõ\×[\ìÈ‚}Ÿ¿=ú\è£Mc¿\ÒQ6]ž“\×~úÓŸš\Ç;w\î4·rEF8U$ü\Ù·Wˆ€DB®„¾ô¥/©|\Ðtrò¸¥Ž,\Ø÷\Éý\Ü\Ü\\õ\Ío~S½ñ\Æwtx2V\Üü\çð_=ó\Ì3\æVÆ’	°»H\È	\ß?´ñ‡?ü¡I¤X\ÒM\Ç\"\à‘û2n+÷{õ\êu\×k\á¼O:6\é0\ï¿ÿ~“Nõù|æµ…6¥gý\ë_›÷ú¯\ÈüWp«V­jó³\Û\Z?F$ »ˆ\Ä\âÅ‹›N\à/½ôR\ÓÿªTº\é¸B$\0\\\"\ãÇ7÷Ÿþù6;•`\ß\'\Í\æñxTee¥Ï•ña¹Š’qÜŠŠ\nó¾Ë—/›+2y¯\ÜJ\"v	i\"?øÁ\Ìÿõ\Ï~ö3óÿ\ïÿ|·Wˆ€ƒE‚†H@\ç[\ï¼óŽ\0Ž-D\0‘ ³D‚†H\0 4D8¶	\0D‚†H\0\Ç\"€H\Ð\Ù!€Hpl!\0ˆ 4D\0‘ ³D‚†H\0 4D8¶	\0D‚\Î‘\0D‚c‘\0D‚\Î‘\0D‚c‘\0@$\è\ì\0‘ !\0ˆ\r‘\0Ž-D\0‘ !À±…H\0 tvˆ [®	ý«|ý“O>9WVV¦v\ì\ØabG½mß¾]\íÞ½û–nó	:;D	Ž-×ˆ„HÄž={TUUÿ;¶‹/ª]»v\Ý\ÒR1\r‘h1UþQ	ˆ>[ˆDW\"™$\"º2¡ÿÿ\ê‰ÀX£\Û*++\Í	€cËžÇ–SD‘\í‘E$Z\àô\éÓ’²QŸþy·þ^¿~\Ý6\ÝÉ“\'9‹‚mŽ-;cyl9E$ZC$:M$ü\Þ\Ûo¿\Ým‹]¶mÛ¦¼^¯¹\í\ÎE9H\Ø\í\Ø\n<\Æ|>_·=\Æ:ó\Ør›H|ñ÷\Ï\Ô\'\ï«£Û‹L“ûò\â€H8ŠË—/‘\0€ŽCŽ±šš\Z\×\ÇÁM\"qµ\æSudk¡:ô\Æ\Ð;š<\'¯!ˆ„c¸p\á\"\Ð	\"QQQH¸H$\Îýó]\áo\çnD	\çp\â\Ä	GOÐ\È1v\è\Ð!D\ÂE\"ññ\Î[	y\ry@$\Ã| \â\ã\ã\é\é:¤¤$õ\î»\ï\".‰#okU$\ä5\ä‘pÒ¹%&&\Ò\Ót ýúõS[¶lA$	D‘p[·n5\0t™™™jõ\êÕˆ„‹DBfi´&ò\Zò€H8†u\ëÖ©´´4zz€$77W#.‰S¥sZ	y\ry@$\Ãò\å\ËUNN==@2h\Ð 5g\ÎD\ÂE\"q\é\Ó\Ã\êÈ¶±wk\è\ç\ä5\ä‘pK–,Qyyyôô\0È¨Q£\ÔÔ©S	—-HU¾¿\ä.‘\çD\ÂQ\ÈU\Ò\àÁƒ\é\é:ñ\ãÇ«¢¢\"D\ÂM\"qýº:õ—ywk\è\ç\êm°-\"HÍ´i\ÓÔˆ#\è\é:\ÉFHV‘p‡H\ÈÊ•\'Kg·Z#!¯±º%\"\á&Nœ¨ÆGO@\æ‘ˆT$®_WŸz[}ô\æ¨V%\Â\ß\ä=ò^²ˆ„\í3fŒzþù\ç\é\é:¥K—š™ˆ„sE¢½,\Ù	DÂ±È°\Æô\é\Ó\é\é:YCBÖ’@$œ+Ád!\Ú\ÊN ˆ„m‘t+\Ó\Ò\0:–Í›7«\Ô\ÔTD\ÂÁ\"®Dø\"HØ–üü|µxñbzz€„¥\è/4DÂµ\"‘­V¬XAOÐ\ÈÎŸlŽ‡H\Ð	G\"\Ëc¯_¿žž )//W^¯‘@$hˆ„ó\r»d\ã.\0\è8.]º„HD(¿ù\Íoþ‘@$‰nHRR’¿€\èSVV¦^|ñESh«jkk‰0°,\ë?iúþ--eúþM}{C?¾®\ï\×\êûWtû›¾Q·ºU\è\ÇÕ·\Çô{\ê\Û}º\í\Ñm»\Ç\ãÙ¤o\×\ê¶L¿g‘~ýe};Y?.Ô·ƒu\Ë\Ô-^¿\ïŸ}ö\Ùÿ\Ô\Ï?\×311ñÁÞ½{gÛ¶mœü	DÂŒ\Û8p€ \n\\¸pÁ\ìò9`À\0\åóù”>ù¨aÃ†©5kÖ¨šš\Z2\ÍDB\Ç\è·ú$þfk²œ¸Et«\Ó\íwr—\çúö\íû°œ\Ü\å$¯?\ã9\é\Ë\É_Ÿø\ê\çG‹\è6Sö‚Û²°F\ßn‰™Ðß»-\Çtû\ë\í\ï!òQ¥\Û\ßDJô\ëµò}EVDZtk‰ñ\r\'D‘¸tt\'Nœ\à\0\Ò\Ê\Õ\éØ±cMvO†/²²²\Ô\ìÙ³Õ±c\ÇP;\"¡OÌŸ\ÈIYÀ°æ±~.I¿&‡’““¿G\"HtS¤ã“«(\0oY{Ef<\ÉIPBVˆÝ²e‹\é!8‘¸=d`b(C}ûö}\äöK÷\Ý\Î\Èð\Å[\"ˆD7G\âË—/\Ó\Ã´‚k×®UÃ‡7C\"\ßþõWÎŸ?O€\Â	6\" ]’:©q\Ð1¾¬_ÿ¿Nµ±o\ß>õ\ë_ÿZ}\ík_S\ßø\Æ7\Ô/ùKUZZ\Z\Ñkmµ\Ûqødø9\ï¼óŽz\â‰\'	·‹Dcc£9€\å\0þ\ÒaO™2\ÅLqb\ÉI“&™N›\ã%r‘Úˆf\áoRƒðn¯^½¾\î\ä\éŸ=zô0±8|ø°úð\Ã\Íýþð‡½\Ö\"Ñ‘Ÿ‰H\ØøJ‹)i\0JUVVªW_}U\r8°©HrÈ!jÕªUIv€H\Ü.n¼K$¤˜Q\Çþ\çN_GB²	‹\ãÇG\íµ\æ\'öÀ\Çþû\"\Æò>úh\Ógø_û\Ù\Ï~¦¾ò•¯¨oûÛ¦\æ\çøƒ\É|<ðÀjùò\åw¼Wž÷ß–L 6Ej#	p#\r\r\rjÇŽjüøñ*99Ùœ\ÄdS­™3gš«=\è8‘Ð±Nh%\áoWž‘l—\Ä\â›\ßü¦\Ê\É\É1ÿs‘¾ŒHlØ°Á4¹\ï–ð¿&\Ãw²pšÿ±\Ì4:uê”¹ÿý÷·ú™d$\\.R4&W^\0n@:Å¹s\çšX:!!A=ZmÚ´I\Õ\Õ\Õ \Î‰‹íˆ„´}N_\ÙR†\ÉDbE\n$.\"	‘¼ŒH\Èÿ¹4V¡½¯kK	D\ÂðÁ°þ?8YüI–9r¤‘‘‡¼¼<µp\áBUQQA€ºN$Z«øÂ²¬ãº­\Ö«·,‘}\îÜ¹;N\ì\á¾ªH\È\"HD;‚\ÓØ¿¿š6mZS‘¤,?q\âDµ{÷nŠ$»Hˆ4\Ô\ë¿\Ï\ë2\Ì!5\Ý}(#\Ú\"ñð\Ã›XHQ¯ü\Ï\Ê})¤Œ\äµ\ïÿû\æñ‘#G\Ôo¼\Ñ\âI_j6n\Üh\î÷\î\Ý;\"‘ðgD¤\ÖN\ä‘p©H\È\Ò\ÑØ•\ê\êjµlÙ²;Š$lv´•ý- û‰„ˆ¥v?QD*lš\Æù¥/}\ÉL\ã”\å\Ô#yMŠ…¿û\Ý\ïšLCAAA‹ u@RPù\È#˜¡¾HDb\éÒ¥¦vB~1&\"\áB‘X·n¹r°’UØ¹s§***R)))&-žžž®^z\é%³U7t‘pÂ‰‚©X\n‘¸X¤žtg¤’|Þ¼yªÿþF¤\Þ\á¹\çž3)Z·o‚…H ˆ\"Ñ¥,Y²\ÄŸý8s\æŒc7‘™¢&² \Ò ò ±`Á#€H ˆ\"\ÑMýd<\ì…lK-ÿ«²¿ƒShex\"##Ãˆƒ[L˜0A\íÚµ‹\"ID‘@$‰\îŠT·1‚\Þ\Ífq\ï½÷ª\Ç{\Ì\Ü\ÚU&¤R\n\"EdýE’ƒ\rR¯½öš) D‘@$	 \Ó\âÆG\ïf3‰ðËƒ\\±\ÛE&$« S0\åN²\r25S\n}§OŸn\Ö3D‘@$	\"\' \çŸž\ÞÍ†\Ñ\Þó\ÝYôI\Ê\Í\ÍmZIrÔ¨Qf‘(Š$	D‚†H8\0Ö+B°§D4]2\á \'u\ÙÀ\'RdQ\ZYnZŠ$e¡3‘)’”e©OŸ>\Í	\Z\"\á4d|Z\n.Á¾\á\'\Üa\Ù\ÙR\Öa7£!›Í˜1\Ã,t#E’²€l„%b\É\ÆX\0ˆ\r‘p0ùùùjñ\â\Åôn6—ˆ@™¸\ï¾û‚\ÎL\È\ÐCRR’\0\ÙsE\æö\"É•+Wª¡C‡šI)””UôJJJ\ÌV\Ü\0ˆ\r‘p\Ù\ÙÙ¦r\ì/_\'2\Ñ\Þ\×\ÉZý\"\'µ´}¶I\îÙ³GMš4\É,§\î/’œ:uªù\0D‚†H¸X$\ä„ …o\à‰hþõ­e&dm~‚\æ;0Îž=Û¼~þüù¦\Å\Ê\ä}\"RO³v\íZuõ\êUþ@€H ˆ\"ñ\ä\nS6\î{I\Ä\í\ÎXµõÿ\ÚZ\Í\Ä\æÍ›[”i2T\áê¥Ó¥~\æÄ‰üQ\0‘@$	D¢e\ä¤![‰Cô¦\Î \ÒLD0\"\ÑRf¢¸¸¸U‰ð7™u\É\ï\0€H\Ð	!)kYš¢S\è\È\áŒ`E\"ðs%\ÛÐ–@ø›\ì€H ˆ\"rr!u]ü\'d\n\É\0sujMD(\"!\Èt\Ì>}ú¨˜˜•••eš3¬\æ%\Ó‘h™\Þ\Ì\É‘@$4’\æ¾p\á½[ˆ„¿\É	{õ\ê\ÕQ“ˆpDB˜<yò]³9dú§ül2#CVŸ”ŸU\0‘h›={ö4VUU!\0Qj\çÏŸ¯\Ð\"QH\Øô¤wùòez·	“z”\æ\Ã\á\Î\ÎG$üß¯½u&Xº\Z‰öyû\í·\'\íÚµ\ë\Ö\çŸ\ÞmO\Î×¯_·Dlß¾½A·iˆ„ÍõOt’h­É¢Cþ\ZýM®\\\å\n\Ö\ß\äD)«\ZJ“M™dFHjjª™b*MVO”-¢eDI­\Ë\Z²|²\\	\Ë\ÂX0\r8Ð¬¸9d\È³\è\Ñð\á\ÃMº]öh¥—\ÍFc’®/**2›@\Éµœ$§L™bv4•\í¨eµ\ÅY³f™™²Dó¼yóÌ¾²\0—9\ÈJ²Ó¤¬£±j\Õ*µf\Í\Z3½Q¦\ÃnÜ¸\Ñ\ÌnØ²e‹Ú¶m›Y¥Q¶³–\ÂT™:¹w\ï^µÿ~S_\"k/9r\Ä,1}\êÔ©vk$NúÓŸBžjk\r;môˆDwFŸø\Æ\ë«\è/$%\ßÝšôq\ÒgKÿ\Õ¾f­\ÞIáºŒ„È„4±B¹•ì„¬\\(\Û8\Ë*…²ž€¤¿\Ë\Ë\Ë\ÍIRN–ÇŽ3\'O9‰\Ê\ÉT%’“«,Z$\'[9\é\Ê?¯L+•“±œ”7l\Ø`®\Æ\åd-©tYQN\âr2—x9¹\ËI~Á‚\æ¤/\'Y\Ó`\æÌ™F\nd?Y\0IN¾\"\r\"\"\"cÇŽ5r!’!m\äÈ‘F>†\rfDD¤D\äDšÈŠH‹È‹HŒÈŒ4‘i\"<\">\"A\"C\"E\"G\"\0²D <‰LÊ•¸Á4ú[Ïž=ƒ\Î<DK$„§žzÊ¼\çÌ™3œ\Ù\0‘p½zõúº\î_nHC4	p\ÐÐ†ˆ‰ˆUóa¶†:2#AQ% \Î\Ä\ëõ¾\î\ïwúö\íûA$À\æ\"!\ÉÐ´Dg\×Hø÷\â`X	gbYV\ÝnôA»ˆ\n\"6	Yr÷\î\Ýí¾¿³fmDº\Õ8\0\"\Ñý\Ñ}Ï¡f3\r2\ÔAd	°\"¡nf\ÌlŠHDBjQBù|\0D\Â~\Ä\Å\ÅY-\r«z½\Þ¢ƒH€ð\×.s²¿\'Œ•-¥\è\0‘pt6\ârK\"aY\Ö\'D‘\0—\ÐQ{m €H8^\"·5C\Ì\ëõþŠ(!\à²\ÌDG\íþ	€H8-	H-D[\"aYÖ‡D\n‘\0—e&\"©i@\"\0‘pg˜–…JÝ¾¡h6k\Ã\ßnRt‰H\0™‰¨\0 \ÎEË„ˆ\ÅB)À”bKýxšL\r%2ˆ¸03Š €HÀ\í\áŽ\Ë\'‹H \0M‹Hµ7\Ì!S<)¬Dn_^\×\"ñ4‘@$\0‚\Ê4øk*@$\à¶H4²<6\"”L„²þ\0\"\á\Z‘P111\ß\"ˆ@‹2á—†`‡=\0	W\ÕG<ÀÎŸˆ@«ø3O>ù$»x\"-e#—\éžD‘\0h33!WH \ÐË²btÿpH \0m\"\"€H@s<\Ï@¯\×[C$	\0D	Ÿ\Ï7U÷Ÿ	D\0‘\0DÂ©‘(±,\ë8‘@$\0	@$ ‘Ø¬Eb/‘@$\0	@$ ‘(™ ˆ\0\"ˆ„#\Ëð‘@$\0	@$ d,\Ë:/»}	D\0‘\0DB\Æ\ëõþM·ÁD‘\0@$\0‘€p†6®\Å\Å\ÅYD‘\0@$\0‘€pD\â¦eYÿ—H \0ˆ ŽHÜ’»ˆ\"€H\0\"!‘‘‘ñO\ìü‰H\0 €H@XX–õS\Ý74	D\0‘\0D\Â\ÖønõD‘\0@$\0‘€ñx<Y^¯÷\n‘@$\0	@$ d|>\ß\Ý7T	D\0‘\0DÂ©‘X\àõzÿJ$	\0D	-¯k™øH \0ˆ N±\ån-o	D\0‘\0D\Â\Ú8¬\Ûj\"H\0 €H@8‰3º\Í!ˆ\0\"ˆ„#uM$	\0D	G$¾ðz½)D‘\0@$\0‘€\Ñq\ã\ÙgŸýO\"H\0 €H@8‰[\É\É\É?!ˆ\0\"ˆ„\Ê}\Ò/Œ7\îË„‘\0@$\0‘€HHHø‘eY·ˆ\"€H\0\"\á\ÔG<©û…D‘\0@$\0‘€p\ê#d\Ö‘@$\0	@$ d<\ÏH¯\×[M$	\0D	Ë²^\ÖýB‘@$\0	@$ d|>ßŸt¿p„H \0ˆ N\Äv\Ý\Þ%ˆ\0\"ˆ„Œ\×\ë\Ý\ïñx6	D\0‘\0D\Â\ÉHœ\Òm1‘@$\0	@$ ‘øL·ID‘\0@$\0‘€pD\â²ný‰\"€H\0\"\áˆ\ÄuŸ\Ï÷‘@$\0	@$ œb\ËF-	D\0‘\0D\Â\ÉH¨Þ½{‡H \0ˆ O?ýô¿HŸ@$	\0D	™¸¸¸Ÿ\ë>\á&‘@$\0	@$ œagu«#ˆ\0\"ˆ„ShY`YV\r‘@$\0	@$ d´DL\Ñ}Â§D‘\0@$\0‘€p†6^\Õ\í‘@$\0	@$ d<\Ï&¯\×û‘@$\0	@$ œŒD™n[‰\"€H\0\"\áˆ\Ä1¯×»œH \0ˆ ŽHœóx</	D\0‘\0D\Â‰¿\é6„H \0ˆ ŽH\\ójˆ\"€H\0\"!cYVC||ü/ˆ\"€H\0\"\ád$n%&&>H$	\0D	‰^½z}?	\0D	‹¸¸¸ž^¯·‘H \0ˆ 2>Ÿ\ï·Z$\ê‰\"€H\0\"\á\ÔG¤[–u…H \0ˆ ŽHŒ\Ó\ís\"H\0 €H@\ÈX–5_·Oˆ\"€H\0\"!\ãñx\Ö\éþ\à ‘@$\0	@$ d¼^\ï;º?\ØI$	\0D	§Fâ–‰5D‘\0@$\0‘€p2\å–e\Í%ˆ\0\"ˆ„“‘¨Ò­H \0ˆ ŽH\\µ,+H \0ˆ ŽH\Ü\Ð\"ñ\"H\0 €H@\Èh‰¸¥[\"H\0 €H@¨\Ü\'}ALL\ÌW	\"€H\0\"¡küP·[D‘\0@$\0‘€ñx<Oè¾ H \0ˆ 2^¯7^÷µD‘\0h“\Ì\ÌL#mµ¤¤$ˆ„û†6†\ëv‰H \0m²{÷\îvEbõ\ê\Õ\n	÷e$f\ê\ãÿ,‘@$\0\Ú%==½U‰HNNVõõõ		—aY\ÖJÝŽ	D ¢¬\ÄÊ•+	 \î\ÚØ¦[)‘p°H\ÈU\âºu\ë\ÔØ±c\Íe||ü\'\0ŸÏ§\Ò\Ò\ÒÔ˜1cÔ’%KTmm-=\r´JKµRA6	\×f$\Þ÷z½&‰ŠŠ\n5~üø»Ä¡½&b1d\Èuüøqz*+Am ®®‘8©\ÛR\"\á ‘+\ÃI“&!E Zj’¥ C\Í\É\Ê\Ê\"ˆø‡6>\Ó\"1™H8D$>l:ö\æB““£,X ö\îÝ«>ýôSUWWg\Þ/·UUU\êƒ>Pü\ãUAAÁ]_› ö\í\ÛG\ïM\ìØ±£\éÿC†\Í\0	W‹\Ä\ß-\Ë\Ê#	\éÜ›c:\ÔH\ÂÍ›7ƒþœƒªQ£F\Ýñ9\Ú6I_\Ãøk%\ÈF\0\"\áú\Z‰\ë\ç‰„\ÍEB$\"p(#..NmÜ¸1$hÎ›o¾i¦ô1-!µ}úô!€H‘¸©\ÛcD\Â\Æ\"!\Ã\"\Ã\'OžŒ\Êw\æ\Ì•——wGf‚a^|ñE\Ó!K\r\0\"\áj‘‹\Î\ï	›Š„¤•k\"D\"¤\æ!š\È\çÊ„\ÔLP€‰D\Ü{\ï½\ê±\Ç3·\È \î$&&\æŸ\å¼@$l,2;#p8#Z™ˆ–2\Ã\Ï=÷½‘\Ë%\Â/&L@&\0‘p¯Hü\Ú 6	Y\'\"°.Bj\":©™¬—!p·D´÷<\0\"\álô9¨>\Ô	›Š„,68;\ãÆ~\0>¼\é{Ê¢U€D4]2\0ˆ„;iŸ2ý“H\ØP$¤6\"pª§Lñ\ì$¸fMM\r½\Ñ\Ã€H¸YˆJŸ.	Š„L\Ã,°Œdšg¨.Z%{s´Å²eË\r—HD L\Üw\ß}d&\0‘p‡H,\Õ\ç‚DÂ†\"!pùO\æ‹/\îÔƒpùò\åw,¡\ÝR¶d\îÜ¹fv‡¼‡=;\Ü#_\'2Af	g£ûø²i‘°¡H\È.žþ“¹,{Ý™\È0Šÿ{§¦¦6=_]]­¦OŸ~Çšˆ„û$¢ù×“™\0D\Â\Ñ\"ñ\ÙFœH\ØP$\ë#>û\ì³N=e]‰À:	©›\áY¬ª¥¿Xs\Âþ\Ñ\Ø\Øh¶š—Û¶hþ>j&\0‘p|±\åQ\ÝÏ¯ 6‰Àµ®\ÎB¾_(;ˆ‚ý%¢G¦ó•\Û\Öd¢µ÷‘™\0D\Â\Ñ‰³ú\"r‘°¹Ht¡ˆDnn®\ÉX\ÈUY\ÈjÜ¸qf!-™3gŽZ¸p¡*))1¤²\Æö\í\ÛUii©:p\à€:q\â„:þ¼ºt\é›Cu\Ñp†dnw¼­\ÊD Dø[FFFÔ†I\0‰n+—<\Ï0\"AF\"¢Œ„V6\ßu4°«ùóç«™3gª)S¦˜+\Ó\Â\ÂB5b\Ä5xð`5`À\0Õ¿³›¤œ´RRRTbb¢ùL:‘!“ÀaÿcyM\Þ#ï•¯‘¯•Ï\Ï\Ê\Ï\Ï7Ÿ-\ßCN^EEE\ê…^P3f\Ì0?\ïÒ¥KÕŠ+\Ì\Ø[¶lQ»v\í2{ˆ\È0\Í\éÓ§Uee¥ºzõj»©|§KDk’(\í½\î‡a@$)µºùˆ5!Ñ¼FBld:zhC¾d\'$K!\Ù\n\ÉZHöB²’Í¬†d7$\Ë!\Ùù™$û!YÉ†HVD²#’%\É\Î\Î6E«ýúõ3û•\È,“@yi¾º</…¤ò>Y.\\¾N\ä%++\ËöY—ö2­\ÉBCCCPø}˜\Íˆ„£D¢Á\ãñ<A$l(\ÝqÖ† 37†\rv—h\Ø9!J±¨\ÈSyy¹:r\äˆ\É\\HC2\ë×¯W+W®´u\Öeò\ä\ÉAe\nZ’‰¯~õ«AKDs™ f	G[\Þ\Ò}\Ö‰„\rE¢;¯#!È‰Jv•“ tß¬‹\îL6CÐ’L„\"s\0\"\ázõ\êõõ\Û;\ÞG4l(r\ÜU+[\Ê\Õu°+[ŠP@÷Dvt•ÿµž={†ôu2œ\Ñ<!\åùPxê©§\Ì\×\Ê\Ï€H\Ø2\ÑCŸ\Z‰„MEB®Zwþd¯\r‡P§fF;#!\Ã2\0ˆ„mE\â7ú\\PO$l*‚¤±wÿìŒ¬Ä¨Q£\ØýÓ¡2\ÑY5þ½8\Ö\0D\Âö\"‘¦\ÏW‰„E¢¢¢\âŽ=?\ïH\Þ|ó\Í;f2Hv\Ü!ÑœµÁ\âT€H8Ÿ\Ï7VŸªˆ„EB,º”©‰\'Ož\ìOÆ±¥X\Ïÿ½$Î“‰–fSDk	)e¶ Ž‰yúb¶œH\Ø\\$dj¢—M\á¥LUŒ&òy2Àÿ=\äû±†3ñ\×.žì£¹²¥LW@$œ>¬µ,\ë ‘°¹H²6@\à‡\ÈD´2’‰”ù>òýÀ=\Ã\Ñ\Úk‰\0D\Âq\"±S·]D\Â\"!lØ°\á™a©™ˆ¤\0Sj\"‡3¤\É\Z\àž\ÌD LH†!˜\Ý?\ß\Çz€H8Z$JV‚H8D$Z’	ÿlŽƒ†ô9RD)«26_\"\Z‰p_f\"’š$	gcY\Ö\'º\Í\'	ÿ0G`\ÍD\àp‡¬€ùþûï›½9ü}É­\Ô@ˆlÈŠ•‹M\ÖD0œAf\"’\á\0DÂ‘\"Q¥\Ïãˆ„\ÃDBB\ÈÀ\Ù‘4™Aa%™‰P¤\0‰\0D\Â5CWuK\'	?²Î„¬¸f0M\Þ/‹M\É\0þ\ÌD0\Ã2Å“\ÂJ@$\\#õ111ÿM$,~d9mÙ›C²²S\à\ä~q]<\å\nRö\Î`\Ùk\'\Óà¯©@\"\0‘p^¯·±oß¾	ˆDs6o\Þ\Ü$Û¶m£Wˆe¢¥õ\'\0	\Çg$”\ì\0J$\\(’}ð‹„,6ŽLø¥!\Øa\0D\Â9$&&>¨\Ï!·ˆ„EbÝºuw\ÕD•€Pñg ž|òIvñDÂ\Ã\Z¿²,«H¸P$RRR\î‰\Ì\ÌLz+3!ÿ?H ®\Öð\évH¸L$–-[\Ö\êL²²2zùß‘b^\0D\Â]x<žaúø¿D$\\&--T\åo²Ÿ@¨ÈŠ§—/_&€H¸O$^\Ò\Çÿ9\"\á\"‘\éŸ\í­Á\ê•ŽHTWW@$\ÜW#±Ü²¬£D\ÂE\"\ÑV6\"pm€PE\âüùó	÷\ÕHlÕ­ŒH¸°\Ø\ÒÏ‰\'\ÌBT\0‘ ÿC\å\å\å	÷‰\Ä>Ç³‰H¸X$Ž;f¶\ZˆT$DJ	×‰\Ä	\Ý^%.	\Ù*‘€H‘ÿ!ù_@$\\\'t{H¸X$dC.\Ùs ¤öfÿþý	—aYV‰|\"\áb‘\Î_N\0‘˜˜\È\Z$€H¸3#Q\çóùú	‹\ÄÞ½{	ˆ˜\ä\ädµk\×.ˆ„ûD\âf\\\\\ÜÏ‰„‹E¢´´\Ô\\MD‚,¹¾}ûvˆ„ûDB=ýô\ÓÿB$\\,»w\ïVIIIô(ýúõS[¶l!€H¸ˆ\ä\ä\ä\ï‰H	—‹\ÄÎ;MZ\Z dú\r6@$Ü•xL·F\"\ár‘t´¤¥\"!==]­]»–@\0\"\á\"|>\ß3–e]\'.‰­[·š´4@$dee™}\\\0	We$ú\ëöw\"\ár‘Ø´i“JMM¥Gˆ\èß¿¿*))!€H¸K$&\éö‘p¹HÈ¸¶ŒoDB^^žZºt)\0D\ÂEx<ž%Z$N	—‹\Äúõ\ë	ˆ˜¨…@$\\„\×\ëý³nû‰„\ËEB\n\ä¤P \r\Z¤^y\åˆ„»†6J-\Ëz‹H¸\\$V¯^­233\éQ \"†¢^~ùeˆ„»D\âˆ‰•D\Â\å\"!•öRq	#FŒPÓ§O\'€H¸K$*¼^\ïL\"\ár‘x\íµ\×Tvv6=\nD\Ä\èÑ£\Õ/¼@ \0‘p—HT{<ž‘D\Â\å\"!Söd\ê@$Œ3F=ÿüó	aYV­–‰\"\ár‘(..V¹¹¹ô(\ãÇWEEE	we$\Z¼^\ï“D\Â\å\"±d\É³\0@$H6B²\0ˆ„«D\âVjj\êCD\Â\å\"!sÿe\r\0€Hú©“\0@$\ÜALL\ÌWo\ïüy\Ñp¹HÌŸ?_Ð£@DÈŒ\r™¹€H¸ƒ\ä\ä\äŸX–u‹H jÎœ9jð\àÁô(²†„¬%€H¸¯\×û_º\Ý ˆ„š5k–\Z:t(=\nD„¬j)«[ ®©\è§\ÛD‘P3f\ÌPÃ†\r£GˆX°`Cd€H¸K$\nu»H$	Æ¶!*\ÈÎŸ\ÌþD\Â=X–5W‹D9‘@$\ÔÔ©SÕ¨Q£\èQ \"X\Ø	×‰\Äj-‡ˆ\"Á´=ˆ\n\ì\Ùˆ„\ëD\âm¯\×û‘@$Ô¤I“XH\"†\í\è‘pZ\"\èö:‘@$\ÔÄ‰Õ¸q\ã\èQ \"6lØ \Ò\Ò\Ò \î)¶<mY\Ö\"H˜ýdŸ€HØ¼y³JMM%€H¸G$>\×\"1žH l¶Qaûö\í*%%\ÅÜ¯©©QÇW	\çm\\\Ñ-“H fXC†7\0‚ED!!!A\Å\Å\Å)Ý‘(Yo¿¥F¦	Gg$\ê}>\ßo‰\"a\n-¥\à ÆŽÛª@HÁ¨®®&P€H8W$\Zõ\ÅDO\"H¨\çž{NM™2…B\ÎJè«‘VEBþ¯\0	G‹„\Ê\È\Èø\'\"H¨‘#GªiÓ¦Ñ£@\ÈÈª¨­‰Ä… ¥OŸ>?\Ð\Ç9;\"ÿ`øð\áê¥—^¢G°²-\ÕH°\ä: \Î&>>þúXo ˆ„Avþœ9s&=\n„Å’%K\î‰²²2ˆ„ƒ‰‹‹³4×ˆ\"a2dˆš={6=\n„\Ì\àðKDNND\Â\áx½\ÞÁúxÿ‘@$ƒ\rR¯¼ò\n=\n„,F\å	¹€H8Ë²¦\é\ãý‘@$jþüùô(\É\ÉÉ¦^\0‘p>Z\"–\éö1‘@$P.¤GˆX·n\ÉH\0 ®\ÈH¼©÷2\"HòòòLÁtoÎž=kŠw\ìØ¡\Þz\ë-ZM–ñÞ½{·:u\êÿP€HDV#ñžno	DÂ››«Š‹‹\éQº¹D\ìÙ³GUUU©úúzZ\í\âÅ‹j×®]\ê\äÉ“üc\"~F\â¸‰?	D\ÂÐ¿URRBÒ‘L]™\Ì\0\"vÄ§Z&¦	DÂ­^{\í5z”nŒœô€\è6\ê\0@$\ÂÚ¨Ñ­€H †¬¬,µr\åJz”nŒœô8ù#€Ht£ŒDeY1D‘0dffªÕ«WÓ£8@$¾øûg\ê“÷‹\Õ\Ñ\íE¦\É}yq@$\0‘ˆ²H\Ü\Ô\íq\"H222\ÔÚµk\éQl.Wk>UG¶ªCo½£\Ésò\Zò€H\0\"E‘mÿ•H †ôôtµ~ýzz›‹Ä¹£¾K\"ü\íüÑ\È\"ˆDT\èÝ»÷wD$ˆ\"\ÑDZZšÚ¸q#=Š\ÍE\â\ã/¶*ò\Zò€H\0\"\rúö\íûˆ\×\ëm$ˆD©©©\ì\à\0‘8òÖ¸VEB^C	@$¢\Ç\ãy:66ö:‘@$š\è×¯ŸÚºu+=\n\"H\0\"\í\âõzst»L$‰&RRR\Ì\ÒÁ`o‘Y\Z­‰„¼†< €HDI$&Z–UI$‰&d\×Æ;wÒ£\Ø\\$N•\ÎiU$\ä5\ä‘\0D\"\Z\Ä\Æ\Æ.\Ö\í¯D‘h\"))\Éldö‰KŸVG¶½{XC?\'¯!ˆ Q‰õº}@$‰&Uii)=Š\ÍEBZùþ’»DBžC	@$¢({t\ÛN$‰&\ÔÞ½{\éQ\ì.×¯«S™w÷°†~N^C	@$¢eYi‘XE$‰;Dbÿþýô(6	Y¹òd\é\ìVk$\ä5V·D$\0‘ˆRF¢B·\ÙD‘h\">>^8p€ÅŽ\"qýºú\ì\Ô\Û\ê£7Gµ*þ&\ï‘÷’@$\0‘ˆ¯\×[\íóùF	D\â‘8|ø0=Š\ÍD¢½,\Ù	D‰\ÊH|\áñx’ˆ\"\ÑD\\\\œ:v\ì=Š\ÍD\"˜,D[\Ù	D‘\0D\"\Ò\"qC‹\Ä\nD\â‘8q\â=Š\ÍD\"\\‰ð7D‘\0D\"D†I¼´D\ÜJHHø\á@$šðù|\êô\é\Óô(v¬‘ !_úÒ—‰\à%\âÖ½÷\Þû¡	õ\å/y!A$\î‰ŠŠ\nzD‘\0W!ÿ¿ÿý\ïUll\ì¾\ä\ä\äŸpºi[\"tûqa³\Ç\àv‘ðz½\êüùóô*ˆ\"®\ã\ßø†’ut»¥û\Âw\ä´Ó¦D´÷<¸U$*++\éQ	D\\[#¡ûÁ_\Å\ÆÆžÒ­Q\ß\ãé§ŸþN?\íÊ‚ÿõÑ„\n‘P\Õ\Õ\Õô(ˆ\"®	?111ÿ­e\â¬n7-\ËZ­‰h“\Ñd&	#555ô(ˆ\"®	?qqq––‰J-\rº\\ª…\â«HD›2\ÑHf\Â\Å\"¡uõ\êUzD‘\0D¢ºL\×\"ñ7}[¯¥\âeý\Ô}HD«_\×Hf\Â\Å\"!+ ˆ ­\n\ÅÝ®\êV\çóù& \ÔL \ÍD¢±±‘\Å\á\"1e\Êõ£ýH}\å+_Q\ßþö·›\Ö‰\ä3owÂ¦\É\çö\è\ÑC\íØ±#\â\ÏC$ »‰„‘‘‰\ÛR1\ÄÁ!™—EAd`š¿š	·‰\Ä\åË—HLŸ>™p°H¼ò\Ê+¦\Ãü¯ÿú/UWW§6l\Ø`?ò\È#Q	¹üøqsÿ\á‡&#Ž	ÿ\É\Ó\ëõÎ”\áŽ\Û\Ã\é]}¢HMM}(\Êq\âvlN´!­½Ì„\Û2GŽQýúõS)))\êÐ¡Cô,‰G}\Ôt˜¯¿þzP™€À\Ç\"?ý\éOM\ÆA\æ\Ü?ñ\ÄM™Œ–¾N\Þ\'÷/^¼¨\Õ×¾ö5óu}ûö5ë•¬X±Â¼O6‹“÷\É{\äñò\å\Ë\ÉH€]D\Â ˜Rˆ)™Z&>—Í®:Qˆ\Ô\È\ÂZaEK\Ã‹³­\ÈD DøÛ‚(“€DBlÄŒ3\ÌŽ©S§’p˜H\È\É]þ—$ªH|÷»\ß5÷\Ë\Ë\ËÕ¾}û\ÌýŸÿü\çw½\ï\Ã?¼#Ë‘œœl\Ëó4÷Ÿz\ê)u\á\Âsÿ¡‡2\ï“\áy|\î\Ü9Dl%Bñ-™**SFe\ê¨\Ï\çûmˆ„ÈŒ,®uK\ßn\×}ù\ÔD´$	2\Ñ\Þ\ë÷0\Ì\áB‘ð#»€j£5\'\Ð\Ë8D$n\ï\' .]º²Hüò—¿l\Ê4ô\î\Ý\Û“H¶¡y„4\É|”••™\×$\ÑüuyN^“‡<Þ¹s§¹\íÙ³\'5`[‘ð#‹X\ÉbV²¨•,n%‹\\u¢H\È÷Tþv[(÷\ê\Õ\ë\ëaV¶&_R\"˜\Í\áV‘ðg\'fÏžm²“\'OV\r\r\rô66	\É„;´!5òýóóó\ÕøCó¼U6_nn®ú\æ7¿©\Þx\ã;DB¾¾ù÷\Ë\É\É1¯=ó\Ì3\æ633‘\0Û‹„Yf[Ÿ\Äw\É\É\\–\ß\Ö÷\ë‘P­4ò\æìŒ–d¢>‰h.\ÔL¸E$ü\È\Ö\âiii&;±ÿ~z‹\Äüùó\ÍAÿ»\ßýÎœ\Ø×®]kÿø\Ç?6¯ÿû\ß7¥^FD ð„þøã›û’iðK<ø\àƒ-\n‡\Æý÷\ßo†)dVˆ¼¶p\áÂ¦a_ÿú\×\æ½kÖ¬i\Êr\È\íªU«\îú¼`\î#\ÐEÂl¦Eb_`–@_ I\æà¦¾½¡_\×÷kõý+·‹6/\êvA·\nýø¯úö˜~\ÏA©}\ÐmYx<žMúv­n\Ëô{\É\Úúvr\"\áo\×ô×¾ ¬\á!7´$¡H\Ãn	?s\ç\Î5Ù‰‰\'²Þ„MEBšœ\Ðe\è!°h\Ò?ñê«¯šZy¾  \àŽ“µ\ìû‡?üÁ¼&_+õ\ï¼óN‹\'u\Éx\Èc\ÙfXöo	•¯“\ì„\ÔG\Èg\Éû¤V\Ã?\Ü\"·Í‡J	p‚H\ÔPüs\ïÞ½¿#™Š¾}û>¬O\ê?û\ì³ÿ©eûÝ·\Æë–©™’9)!ZÜ–…5úv£H„È„~ü\Þm¹8¦›\ÈF\ÅmùhO$TŸ>}ü¿\ï\Ñ…/·‰¨¿ý|(¼yûk\â\Ô\î2‘¤J?==]%%%©½{÷\Òû\ØP$hˆtHtRDkqN\ËGA\Ã\ZÁ3D;#1™ÓºKE\ÂÏ‚Lv¢¨¨ˆ\ì\"H\0\"\Ñ\r\Z\ÍÂ²¬=\Ïÿ†Yh\í\Z‰\Ñ\\\"w \Ó\0¥8N\æÿ—––\Ò!ˆ ]+¿º-R\Üù¡n=‚ø²ÎœµÁ\âTˆD\Ë,Z´\Èd\'Æg\n\í\0‘@$\0‘\è|úö\íûˆ\Ì	s1ª–fSDk‰fk \í\"\ÅsYYY*!!A\íÞ½›^	‘@$\0‘°£[\ÈDse\Ëiœ\Æ‰ (..6Ù‰\Â\ÂBU[[K\ï„H €HØ‡Ž\Úk‰@$BCöQ\È\Î\Î6\Ù	Y±	D	\Ûe&ebÁ=Á\íþø>Ö‹@$\"§¤¤\Ä,F4zôh²ˆ\"ˆ„½2‘\Ô4 ˆDôû÷\ïovxÜ¾};½\"H\0\"a\Ï\ÌD¸\Ã#€HD\Ù2Z²#GŽTW¯^¥\×B$	@$\ìW3D ]‹,•,>\Å\ÅÅ©­[·\Òs!ˆ ö\ÈL3Ì‘@a%\"\Ñi\È\ÆL’6l˜\Ùk	D	[g&ü5H\"\ÑyTUU©˜\ì\Ä\æÍ›\é\Å	D	{\ÊDK\ëO\0\"\Ñy\È6Ö’2dˆª©©¡7C$	@$º¿LŒq\Ø‰Ž¥ºº\ÚlY-Ù‰7Ò£!ˆ Ý»fBdb\×=\ì\â‰Ht7Ö¯_odbð\àÁ\êÒ¥Kôl-°c\ÇNþˆ ]ž™°,K!ˆD·DBDB„B\Ä\îdÏž=¦¾ˆN“™D\"g\0ˆDh\È.£111\ß\"ˆD·E†8D&d\ÈC†>\àœ>}Z\íÚµK}þù\çˆ@”$\â\äÉ“üc\"ºH\Ü\êÓ§\Ïˆ\"Ñ­‘\âK)Â”bL)Ê„ÿ\'o¿ý¶I\Éw\×&·u\çŸO\ZˆDD\"\ÑhYV\"H\Ø™*\Ù	™.*i}\è\Þ\ÈÕ¾¤=	G‹\ÄÍ˜˜˜ÿC$	\Û W\r>\Üd\'dA+\è¾\È\èˆ Ž‰\Çó‘@$l‡,­-\Ù	Yj[Æ¸¡û!³ˆ Ž‰z}a÷[\"H\ØöŠW6ÿ’\ì\Äò\å\Ë	H7COj$\0	G‹\Ä5Ë²bˆ\"akd[rÙž\\¶)—\íÊ¡{pö\ìYD	\ç‹\Äú8O!ˆ„í©­­U£G6Ù‰’’\Ò\rY%ò÷\0@$-—u\ëO$	\Ç k+$$$¨\ì\ìluþüyÒ…?~\ÜÔ±\0 Ž‰Kº\r!ˆ„\ã²………&­^\\\\L@ºˆÃ‡#€H8Ë²ª|>\ßX\"H8’w\ß}\×d\'²²²TEE\édö\ï\ßo\â€H8:#ñ©n/	DÂ±\Ô\ÕÕ©q\ãÆ™\ìÄ¢E‹H\'²w\ï^D	\ç‹D…eY/	D\Âñ”––ª\Ä\ÄD•™™©\Ê\Ë\Ë	H\'e„$\æ\0ˆ„£E\â¯úBm‘@$\\,\Ù\\TTd²ó\æ\Í# Œ\ìa‘œœL \0‘p¶H|¬[	‘@$\\—rOJJR\é\é\éfŠ\"tÛ¶mS)))	g‹\Ä!Ë²V	DÂ•Ù‰‰\'š\ì\ÄÜ¹s	H°i\Ó&•ššJ \0‘p0Z\"\Þ\×ýèŸ‰\"\áZdf¤\ß\Ó\Ò\ÒÔ‰\'HY¿~½\Éú\0 Ž\ÎH”ê¶H ®¦¡¡AMž<\Ùd\'fÏž­\Z	JX»v-\"ˆ„ó3o\ë¾ó\"H€\æÀ&;!\éøcÇŽY¹r¥Y\Ã\0‘p´H¼[F$	¸d#¦Nj²3f\Ì ;Ë–-S999	gm¬\×\í\"H@3:dfô\ë\×O9r„€„,Ož››K \0‘p0>Ÿ\ïO–e}D$	h%;1}út“[²¡!+‰\æ\ç\ç@$œ‘xU·D‘€6Œ„d&$C!™\nŽùóç«@$œ‘˜gY\Ö\'D‘€ ²R3!\Ù	©¡ ;\Ñ>s\æ\ÌQƒ&€H8\Ý\'\Î\Ð\í‘@$ Hd6‡\Ì\ê\Ù2\ËZg\æÌ™j\èÐ¡	gmL\Ò\í3\"H@ˆ\Ù	YoB²²þ„¬Cw#u%#FŒ €H8[$F\ëv‘H ²¦¬ˆ)\Ù	Y!\îdÊ”)\ê¹\çž#€H8\Ç3P_TýH ²W‡d\'d\ï\Ù\ÃþÁ¤I“Taa!\0D\Â\Ù5™º]!ˆDˆ\ì\"*\ËAË®¢²»((5a\Â5n\Ü8ˆ„³‡6,Ëª%ˆD‰˜\ìDQQ‘\ë³\"\"\0ˆ„sñù|}´L\Ô	D¢Hyy¹\Ê\Ì\ÌT‰‰‰ª´´Ôµq3fŒ\Þ\0@$œ‹eY¿\Ñ\"QO$	\è\0deG\ÉNÈ•y]]\ë~)´”‚K\0DÂ¹\Ä\Ç\ÇÿB\ËD‘@$ ƒ¨¨¨0;`&$$¨Ý»w»\êw—©Ÿ2\0‘p.}ûö}D_05	D:\ÙÀJ²2‹¡¶¶\Ö¿ó!C\Ô\Ë/¿\Ì	£/’~{‹H \Ð	œ?^egg›\ì\ÄÎ;ÿû\ÊòØ²L6\0\"\áh‘øW-\Ä‘€Î¤¤¤Dù|>5zôhGg\'dÃ®yó\æñD\ÂÁô\ê\Õ\ë\ëˆ\"]À…TÿþýU||¼Ú¾}»#Ç¼¼<µd\ÉþØ€H8‰q\ã\Æ}™H \Ð¬X±\Âd\'FŽ©®^½\ê¨\ß-77\×Ô†\0 \Î‰˜˜˜&ˆt•••*??_\Å\ÅÅ©­[·:\æ÷’z\×^{?0 Ç²¬[©©©	Dº˜U«V™\ìÄ°a\Ã\Ô\åË—mÿûÈ´Wù\0	\Çg$\Zõ…PO\"H@7 ªªJ\r0Àd\'6o\Þl\ë\ßEöY»v-T@$œ/7u{œH Ð°d\'d-†šš\Z[þ²\Åú†\røc\"\áp¼^\ïgŸ}ö?‰\"ÝŒ\ê\êjUPP`²7n´\ÝÏŸššjû¬\n T\Äu}\áó‘@$ ›²~ýz#²ÀÓ¥K—lós§¤¤¨mÛ¶ñD\ÂùCµºùˆ\"\Ý	\n;œœ\ìŠ<‘@$b¯Z–•F$	°2\Ä!2!C2ô\Ñ]\ÍÉŽ?~G=GRR’Ú³g4@$œ?´Q£e\"ŸH `\äd-E˜RŒ\Ù]fE\È\Ï#‹Ò´\Ôd³2‘\êpË†e€H¸¬Ø²\Ú\ãñŒ$ˆ\Ø)d”´L•i£]\É\éÓ§[	›1c4@$œ™‘¨\Ô6ˆ\"6D®\Z>|¸\ÉNtõ\âO²Vk!?\Ù@$[#qN\Ë\Ä4\"H€‘¥µ%;!KmË’\Û\Ý-+A6	G‹D¹‰¹D‘\0›#›~\É\æ_rõ¿|ùò.ùd\ëp²€H¸®F\â¤\Ç\ãYB$	p²-¹lO.Û”\Ëv\åÉ¾}û\î‰ðGD\Â\Ù5Gõ±¾‚H \à $0zôh“\r())\é\Ô\ï-›uù%\"11Q\Õ\×\×óD\Â\Ù‰g‘@$À\ìÚµK%$$˜-½ÏŸ?\ß)\ßsÇŽM\"±b\Å\nþ€H8?#±W\Ë\ÄD‘\0g\'\n\Íz\Å\ÅÅò=333H\ØiIo\0D\"\ìb\Ë=º\í ˆ8œw\ß}\×d\'d\èAV¢\ìHv\ïÞ­úô\éÃ° \î‰\í\"D‘\0PWW§Æg²‹-\ê°\ïó\â‹/šyÌ˜1	‡\ãñx6\é>\å=\"H€‹(--5…2Q^^u‰¸÷\Þ{\Õc=fn‘	@$Ÿ‘X«\ÛA\"H€Ëa‡¢¢\"“˜7o^T%\Â/&L@&\0‘p8ºY.S@‰\".e\ïÞ½f§\Îôôt³:e´$¢½\ç	\Çd$\ëvŠH \àò\ì\ÄÄ‰Mvb\îÜ¹Q“ˆ\æ¯K†\0‘pœHÌ‘e²‰\" ö\ïß¯’““UZZš:q\âDT$\Â\Ã€H8Ÿ\Ï7Õ²¬óD‘\00444¨É“\'›\ì\Ä\ìÙ³Uccc\Ä(÷\Ýw™	@$„–ˆñ±±±•D‘\0¸ƒ˜\ìDjjª:v\ìX\Äøu\"d&\0‘p\Ì\Ð\ÆpÝª‰\"p’˜:uª\ÉN\ÈV\àþ\ìD¤”\ÔL\0\"á¨ŒDž‰¿	D U:¤RRRT¿~ýÔ¨Q£\î‘©©hk¤¥÷Q3ˆ„cD\"M‹\ÄU\"H\0´+\"¿ÿý\ï\ÕÈ‘#›ž\ëÑ£‡\é|\å¶5™h\í}d&\0‘°?^‰kD‘\0j8\Â/‚dnw¼­\ÊD Dø[FF\Æ]ŸKf	{\âñxž\Ö\"qH \0\íJDó“}K’(\í½\î‡a@$l-ÿ¡E\â‘@$\0B’ˆödB¦‘#ß‡\Ù€HØ¸¸¸Ÿk‘¸I$	€%¢-™ø\êW¿\Z´D4—	j&\0‘°•Hôôz½D‘\0K\"Ú’‰P$‚a@$\ìIll\ìu»E$	€&Îœ9c:Ôž={†ôu2œ\Ñ<!\åùPxê©§\Ì\×\Ê\Ï€Hto’““¿§E‚¸!\0-g$‚fˆvFbÄˆü\0‘°÷!ˆ@D\ÃÑª‘ð\ï\ÅÁ° ¶Þi\ÝÿD$	€e\"š³6Xœ\n	ûŠ„\×\ë}€H \0­ž\ä[šM­u$JJJ˜­ˆ„½E\â–eYÿ‘@$\0\Úvhž1ˆ\æÊ–ƒ&È€H\ØW$\Z}>ß£D‘\0i˜#Z{m €H\Ø^$\Z¼^ï¯ˆ\"tf\"P&$\Ã\ÌîŸ\ïc½@$œƒ–ˆú˜˜˜ÿ&ˆ@Ð™‰Hj\Z@$—‘¨\Ó\íY\"H\0t¸°\Û\' Ž‰/tK ˆ@‡Jˆ„c‡6.{<ž,\"H\0„•™f˜C¦xRX	ˆ„c3\Ó21˜H \0’™ð\×T €H8V$ªt+$ˆ@\Ôe¢¥õ\'\0	Ç‰\Ä¯\×;™H \0Q‘	¿4;\ì€H\Ø^$\Îj‘˜A$	€ˆ)**R–e©\'Ÿ|’]<‘pHœ\Ö\Çý|\"H\0DLmm­º½¥0ˆ„K\Ðq\Ü\ëõþ‘H \0s\é\Ò%#gÎœ!€H¸G$\ë\ã~‘@$\0\"\æüùó²0\0D\ÂE\èc~¿\Ç\ã\Ù@$	€ˆ9}ú´òù|	w\ÕH”Y–õ&‘@$\0\"\æÈ‘#*..Ž@\0\"\á.‘Ø¥\ÛN\"H\0D\ÌþýûUBB\0D\Â]\"±U·¿	D bJKKUbb\"\0D\ÂEH}„\ÔI	D bv\ìØ¡’““	 \î\ÊH¬’™D‘\0ˆ˜-[¶¨~ýú@$\Ü%%²–‘@$\0\"fýúõ*==@\0\"\á\"´D,ðz½%ˆ@Ä¬^½Zeff@$\\„–ˆ™±±±D‘\0ˆ˜eË–©œœˆ„»Db²\ì\0J$	€ˆY¼x±\Ê\Ï\Ï\'€H¸«F¢P·*\"H\0D\ÌüùóUAA\0D\Â]\"1D·¿	D bfÍš¥†J \0‘p\×\ÐFŽ‰\ËD‘\0ˆ˜iÓ¦±}8 .\Ã\ãñ$i‘ø‚H \03i\Ò$5zôhˆ„»†6žÕ­ŽH \0STT¤ÆO \0‘p111ÿ\íõz\ë‰\"1………&+€H¸ªF\âW±±±\rD‘\0ˆ˜Q£F©©S§@$\Ü5´ñ˜n7‰\"12cc\æÌ™	‘œœüË²n	D b¨\æÎK \0‘p\×\Ð\Æ±±±ˆ\"9²ª\å¢E‹ .\"##ãŸ´H;D rú÷\ï¯JJJ î«“\Ø\ÝG$	€ˆ\È\Ê\ÊR+W®$€H¸P$z÷\îý\"H\0DDzzºZ·n\0D\ÂeH±ebb\âƒD‘\0ˆˆ\Ô\ÔTµi\Ó&ˆ„û\n.ûö\íû0‘@$\0\"\"%%Emß¾@\0\"á¾¡›qqq?\'ˆ@D$&&ªw\ß}—@\0\"\á>‘¸\áñxþƒH \0‘ ö\í\ÛG \0‘pŸH\\\×\"ñ4‘@$\0\"\"..N>|˜@\0\"\á¾b\Ëkúø·ˆ\"±Hœ8q‚@\0\"á¾Œ\ÄU\Ýú	D \"¼^¯:{ö,\0D\Â}\"ñwË²òˆ\"²(Muu5\0D\Â}\"Q­\Ûp\"H\0D,W¯^%€H¸O$>·,k<‘@$\0\"‰\Æ\ÆFˆ„ûD\âS-Sˆ\"6õõõF$\0	WŠ\Ä\Ýf	D ljjj	@$\Ü+§t[L$	€°©¬¬D$\0‘p)–eõz½Ë‰\"6\å\å\å\Ê\çó@$Ü™‘8¨\ÛZ\"H\0„Í±c\ÇÌ‚T\0ˆ„+EbŸn‰\"6Pñññ	wŠÄ»–e½E$	€°)++3» ®‰º\í&ˆ@\Ø\ìÚµK%%%@$\\ˆ\×\ë}Ã²¬½D‘\0›­[·ª~ýú@$\\ˆ\Ç\ãY§e\â\0‘@$\0\ÂfÃ†\r*--@\0\"\áB,\ËZ{„H \0a³f\Í\Z•‘‘A \0‘p\ç\Ð\ÆR-\'ˆ\"6Ë—/W999	wf$\æj™(\'ˆ@\Ø«\Ü\Ü\\ˆ„;EbZll\ì9\"H\0„Í‚TAA\0DÂ…ø|¾	Z&*‰\"6s\æ\ÌQƒÿÿö\î7´®ò\àø»1ðŒAñ•ô\Íð\Åðõ\Ù2!õž\ÜüÑ”´\Öÿ\éüÓ–¶¶«T[[øw*;:ªHe”‚£CGCŠM):Z\Ã(µ\í,*iL\Ó\æ\ìüBSNbMso\Ó$÷>Ÿc$ðs÷\Þo\Îó\Ü\ç<ö˜A $\Ò‰\ÕEHœ2	!uÛ²eK¾r\åJƒ@H¤¹\Ùryq1	!uÛ¼ys¾v\íZƒ@H$¨µµui–eßš„€ºmÜ¸1_¿~½A $\Ò‰¶\â\Z4	!u‹ˆˆ˜\0!‘\ä‰\ßgYö½I	¨[,k\Äò‰$÷Hü¶¸Î™„€º\ÅF\Ë\Øp	B\"=Y–ýªµµu\Ä$„\Ô-¾ú_!‘dHü²‰&!$ n===c‡RHOww÷ELŒš„€º\Åñ\ØqL6‰ô\Üu\×]?kmm5?!õ»ÿþûó·\Þz\Ë i†\ÄO„„€«²t\é\Ò|÷\î\ÝHT„D…I	¨Ë’%Kò={öB\"á¸\ãŽ;~nB\ê²xñ\â|ß¾}H7$F;;;š„€ºtuu\åû÷\ï7„D¢ª\Õê…–––›MBH@]Š¿Dò\Þ\Þ^ƒ@H$*Ë²‘ŽŽŽ_›„€ºo y¿A $\Ò]\Ú8Ge›„€º´··\çG5„Dº!1T©T\î4	!u)þ\É!‘\î\Ò\Æ`ñ>\ÐaB\ê‰“\'O\ZB\"\ÝÍ–\ß\×2“P—øù7\ß|c‰tC\â\ëJ¥ò“PwHB\"Ý¥Smmm«MBH@\Í.\\¸0 $’\Þly¢Z­n4	!5û\î»\ï„B\Â\Ò\Æ•Je‹I	¨\Ù\éÓ§…B\Â\Ò\Æ\Ú\Ú\Ú^6	!5ûüó\ÏÇ¾µB\"é¥cÅµ\Ý$„\Ô\ìØ±ccRH:$>nkkû‹I	¨Ù‘#G„B\Â\ÒÆ¡jµúŽI	¨Y__\ß\ØC»@H$}G\â@qý\Í$„\Ô\ì\Ã?\Ì\ï¾ûnƒ@H$¬Z­þ#Ë²¿›„€š\íÛ·/_¼x±A $Ò¾#±¯¸þiBjö\Þ{\ï\å\Ý\Ý\ÝH;$ödYv\Ð$„\Ôl÷\î\Ýù½÷\Þk‰´—6þZ„\Äa“P³;w\æ÷\ÝwŸA $Ò¾#±£¸þeBj¶}ûöüÁ4„D\Úw$þ\\„Ä¿MBH@\Í^{íµ¼§§\Ç 	Ë²\ìOEH˜„€š½ø\â‹ù£>j‰´—66\×q“P³­[·\æ+V¬0„D\Ú!ñ\Ç\âú\ï\ÅeŽ\Åõ›–––›MFHÀ=÷\Üsù\êÕ«\r!‘\Î~ˆY–-\Âa¤¸.\Ä\Ó\ä\ÚoZB®\èé§Ÿ\Î×­[g‰´\î@|0E@\Ä5\Ú\Ý\Ý}£I		¸¢\r6\äO=õ”A $»+Q\\SÝ\è3%!Ó²v\í\Ú|Ó¦MH/&\Þù±È²\ì&$$`ZV­Z•?ÿüóHð®\Ä\åöH\Ä#\ÅMGHÀ´=ñ\Äù/¼`‰µµµ½<9$\Ú\Û\Û3“0mË—/\Ï_y\åƒ@H$\ê\â78\ÆC\âP“Gy$ß¶m›A $\Ò]\âX>ñŸMDH@Mx\à|ÇŽHû®Ä·ED˜¡€©}ù\å—ùÑ£GóÓ§O_ú\ï–-[–\ïÚµ\Ëp‰¸õ\Ö[\Ú\ÚÚºö\âY§Škx\Ò>‰ó\Åõ¿\â:{(ººº®75!cžyæ™© ‰MVyGGÇ„\Ð\0!\Ñ\â\È\ë8­²ˆƒsW8Œj\Â\çMdYöI›mŠB‚\Ä\r\æÅ›È”o\ZkÖ¬1(„D“Ý(B`\ï•^ûÓ¼¸C!$HÜ³\Ï>;\åE,€h‹-º­Z­M~\ÇÞ¨W_}5\ï\í\íÍ?ž\r\r\Í1þù\ÕW_\å}ôQþ\ÆoŒ}«\ë2\çLœ­T*wš® Q\n±©\êr\Çeƒhš\r”K\Ú\Û\Û\'8\ç\ÆD$œ?~Ú³=|øðØƒý&?‹£øùLYH¨X¾¸\\H\Øhžˆ(/e\Äþ§={ö\Ô“\íÝ»7\ï\ê\êš|wBL	R\Ô\ß\ßÿƒˆxé¥—!\Ñ$\ËEDŒ–—1>ýô\Ó™ógŸ}–?üð\Ã\îLX\æ$ªüf­\nB¢	6V–÷DDDÄž‡™?¯üþ{&lÀ$\èÈ‘#—\Þ¶n\Ýj ‰\æX\Ò\Ø[þa¦\îD\\\î\ÎÄ¤e¤(£Š7“\'O\ZB¢Á\Å9\å}±\'\âZŠ=\å\å\ÑXRñQ/$hR±lñö\Ûo\ç\ë×¯Ï—.]:v\èTù\r \Þ|–,Y’¯[·.ýõ\×\ÇÎ›\0!\ÑXâ°©ò·3Î;w\Í\ç¾r\å\Êò\Ç\'>\ê…Mf```\ì+“\Ã\áJW„\Å\ã?>vœ6‰\Æ\ØQ>±2¾\â9\ÊK¤qfq-ðq/$h’;qöLœdw)Ü¡@H\Ìû½\Ê,¯\ækžµ*Z\Ï\æðq/$hpñ\Â=÷Ü“\Ï\äIvy__Ÿ\á\"$\æ\ï²\Æ\ã¯\×mÛ¶\Í\ê\ì\ß|ó\Í	Ghû¸4°÷\ßÿ\Ë3u’]œ†\é)¡‰y§\Æ_«ñ\Ç\ÂlŠ÷—\Òû\Ä÷B‚Žˆ\Ù8\ÉNL $\æŸ\âü\Òþˆ\'N\Ì\ê\ì\ãŽfù\ä>\î…\r(–3\"f\ã$»¸3a™!1\ï\îH\\zŽ/[Î–ø}\å\ß\ï\ã^H\Ð`bceyO\Älœd{&lÀDH\ÌÏ˜BBH\ÐÀ\â\Ûsq’]<ø„„;\îH	\ZXœ1—\'\ÙÅ’\n	{$\ì‘4¨8lj.O²‹C«@HøÖ†om	\ZP\ì(\Õs.N²‹»!gÎœñ/!1÷!\á	!µ‰¯aÎ‡“\ì\â\Ù $\æ|ic\Ó\\½ôôô8\ÙRHÐˆ\â\\ó\á/8B„\ÄÜŠgm\Äþ\Ï\Ú0mñ\Ïù°&\Ú\Ý\Ý\í_Bb~,oô•÷L\Í\Æ]‰ò	¸žþ)$h0\åýs¹K;öI€˜{---7¯\ÉÑ¹ú×¢E‹nóQ/$h ó\é{\ã $\æß¦\Ëk}®Ì¤‡ö™¾ C\"\Å\ßBâ‡ººº®Ï²\ì\ìµ>\éö¡‡*/iœ\ßkúBw$Ü‘@H4J¥rgy‰c¦Ÿ½SŽˆø=ñûL]HÐ€\ì‘\0!1EL¬(\Ç\ÄL=\rx\ÒrFÜ\Ø`\ÚB‚\å[ $j‰‰ños>|¸¦\Ù\ÆW<Ÿ|ò\É	?WD	\Zœs$@HLg™£¼g¢¼\Ü\ï»£9¾<\ZÿŒ;Žñ:/6U\Þa9CH\Ðv\îÜ™Ï‡“\ìœl‰˜ÿ0\Ë\ß\æ¸Ê«\Ï\ÆJ!A“ˆgm”Ÿü\éY	¦\çLdYv¨|\æt®8±2›*^\ï¿3E!A“Y³fM>—\'\Ùyú\'B¢ñ\Äq\ÚŸ\Íw)N•A^:\êúL<€+ž\á\Øk!Aˆ}>W\'\Ù\Å\Ý	 $h`\åM—³y’]\Ü\r!B‚788˜wvv\æ³y’]ü¾ø½ $@H\Ðúúú&,q\\Ë“\ì\â÷\Ä\ï!B‚&ò\î»\ïNˆ‰ku’Ý®]»!B‚bb&O²‹Ÿ+\" $H`™£¼gb&N²‹Ÿg9!B‚D\ÄF\Èò·9®\æŠog\ØX‰\0!A‚âœ‰U«VM8s:Wü\ïã°©þþ~CDH€ uqœv<›#\îR\ÄSCË ‡xŠg<€+ž\á\Øk„	\0!B\0!B@H€\0 $\0„	\0„B\0!B@H€\0 $\0„	\0„B\0!B@H€\0 $\0„„@H\0 $@H\0	\0B„€\0!€@H\0 $@H\0	˜\å\Z\Zòj˜a###£B‚¦·p\á\ÂÑƒz\ÅÌ°C‡\ro³\ç|\Ò\Ð\Ônº\é¦On¿ýv¯x€v\Ã\r7|]¼\ÍðIC³[p\Ýu\×}\Ë-·ŒöööŽŽŒŒxõ\\\ÅrFÜ‰¸\Ãñ\ëc†$b¢¸ö_ü?}\îr¹\\®«ºb9£OD\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W\íÿ7j\ÄÀn2-\0\0\0\0IEND®B`‚',1),('2509',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0#¡IDATx\Ú\í\ÝŒ]U½?ðF_hTb!Fÿ\Ä\à#\\\áF¯\Ü\ZŸ•T´´\ç\Ì9\Ó)£-…>(® µ\r\í‚ü±Š@Q. 4\Þ+FAz1\n(\ï\Û(R(PZ\Úò\èûA\Ûý_¿\ãœz:Ì´\Î\Ùó:ŸO²23=ó\ê\ï¬Yß³\Ö\Þ{\íAƒ\0\0\0 ß›|ÙYG­^€°\í Û‡iw\0a+l@\Ø€°¶\0 l W\Ã\Ö\Ù\È\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ðû²,;\ì\Ö[o½iÖ¬YgÎœ¹\ë\ì³\Ï\ÎZ[[³¦¦¦¬¥¥%;ó\Ì3³iÓ¦mŸ1cÆŠI“&¥b\0°Ÿ^z\é¥\æë¯¿~ýgœ‘?>»\æšk²û\î»/[¹re¶eË–,lß¾=[½zuö\àƒf³g\Ï\ÎÆ—Mœ8q×”)SþZ*•WE\0\èx&{øwÞ¹öô\ÓO\Ï\ÒL6{ô\ÑG+¡º¿–,Y’¥Yp6fÌ˜,Í‚g¨(\0´›\Í^zé¥»&Ožœ-Z´(\ëŽ\'Ÿ|2›4iRv\Úi§½\Ü\Ú\Úz˜\ê\Ðð6l\Ø0iÚ´i\Ùe—]–­_¿>«‡XnŽ\ï7aÂ„\×-+\Ðð3\ÚÚ‹/¾8Û±cGVoW\\qE\Ìp_<xð!ª\r@Ã‰c´±t3\Ð<‚¶\ê\ç?ÿy6r\ä\È\å*@Ã‰“¡\âm½–Ž÷¶¤<nÜ¸]¥Ri²ª\Ð0bù8\Î:Ž3Ž{Bœ4\Õ\ÜÜ¼\Óñ[\0\ZF\\G—÷ô¤.¸`{SS\Ó\Õ`À‹¡bÃŠžš\ÕV=ñ\ÄYšÙ¾\ád)\0¼\Ûo¿ýbg¨<OŠ\êLkk\ë\Îb±8Æ³\0À€{\ÇŒ½\á’K.\Ù\Ü\ÔÔ´À³\0À€7ˆ½Ž{Ã½÷Þ»#…\íž\0´¸{O\ÜT 7¬]»vW\n\Ûmž\0´¸=^õ\î==-nl·\èó,\00 E\Øõ&aÀ€wò\É\'÷\æ\Ìv—°`À;ë¬³z\í˜\í\êÕ«·;fÀ€w\Þy\çmë­³‘o½õ\Ö\Õ\ÎF`À;ÿüó—÷\Öu¶Ó¦M[\å:[\0¼I“&}wÜ¸q½²ƒTl\×h)\0\Z%pwöô\Þ\È.Œ%d{#\Ð¦Nz\×O~ò“\rÛ±cÇ®r\×\0\ZFkk\ëa§œrÊ®%K–ôH\Ð\ÞÿýkcV\ë~¶\04”‰\'N‹È¯_¿>× Ý¼yó\Îr¹¼=\ídU \áŒ7n\å%—\\’\ç\ÉR»\Ò\ÏX],—©6\0\r)NVJ3Üµ³f\Í\Ê#pwM™2\åù¸®6–­U€†Ü±cÇ®þ\éOšmÚ´©nK\Ç&Lˆ¢^pœ\0\Ú·¥¥eÙ©§žºkñ\â\Å\Ý>*Ž\Ñ\ÆÒ±-\0´\'19r\Çy\ç÷F„nW––z\è¡5q¸\í¬c\'C@gb6šf¥7\Ä\ìtÔ¨Q»fÎœ¹ù\î»\ïÞ±jÕªq?\Ú\ê\Ý{\â¦·\Ýv\Û\ÚØ‚1v†Š\ëh-@¤ðlIm^j\ËS\0oŽ\Û\ãÕ´mqL6µ…±£¡\0 ~œMŸ>ý •\0€\Ã\Ö,\0r\Û#F¼K%\0 Ç°uI\0\ä¶---R	\0\È/lw\r6\ì\Ã*\09†mjGª\0\ä¶---Q	\0\È/lw‹Å£U\0r\Û\æ\æ\æcT\0rR*•vžt\ÒIŸV	\0\Èof»#µQ	\0\È7lS	\0\ÈI±X|c\äÈ‘ŸW	\0\ÈofûF¡P8^%\0 ¿°Ýž\ÂöK*\0ù…\í¶b±ø5•\0€Ã¶\\.S%\0 ¿°\ÝZ(†ª\0\ä¶[\Ò\Ìv˜J\0@~a»¹X,ŽP	\0\È1lK‰J\0@NÒ¬vS\ÊÚ‘*\0ù\Íl7¦°ý®J\0@~a»!\ÍnÇ¨\0\ä$\Íj×§vªJ\0@~3\Ûu)lÇ«\0\ä¤X,¾–w’J\0@NÒ¬ö\ÕB¡p¦J\0@NÒ¬ö•\ÔþC%\0 ¿°]›Ú¹*\0ù…\íšÔ¦ª\0\ä¤X,®.—\Ë\ç©\0\ä7³]•w†J\0@~a»2µU\0ò\Û©]¤\0“b±øb¹\\þ‰J\0@NJ¥\Ò…B\ág*\09ijjZžf·—©\0\ä¶Ï¦6K%\0 \'iV»¬\\._¡\0“R©ô÷¸Wª\0\ä¶K…\Âª\0ä¤©©\é©Ô®U	\0\È/lŸH\í:•\0€œ‹\Å%¥Ri¶J\0@~aûX¹\\þo•\0€œ455-N{ƒJ\0@~a»(µ?ª\0\ä¶§v“J\0@NŠ\Åâƒ¥R\éf•\0€œ¤ ½¿P(üJ\0@Nššš¦ö•\0€ü\Âöž\ÔnS	\0\È/l¤6O%\0 \'¥R\é\îb±x§J\0@~3Û»R›¯\0_\ØÎ‹¥d•\0€ü\Âö¶8IJ%\0 \'\Åbqn\\þ£\0“R©tK\n\ÜûT\0òÛ›c\ËF•\0€œ\ÄM\âf*\09)\nJ³\ÛÿU	\0\ÈI\n\Ú?\Ä\r\äU\0rR.—ÿ»X,>¦\0“4«ý]\n\Û%*\0ù…\íõ©ýM%\0 ¿°½6µ§T\0rR(þ³T*-U	\0\ÈI\n\Úß¤™\í\ßU\0rR,•\Âö•\0€œ¤ •Ú³*\0ù\Íl/Ka»\\%\0 \'¥R\é’¶Ï«\0\ä7³™\Âö•\0€œ¤ ½(µ*\0ù…í…©­T	\0\ÈI¹\\>¿X,®R	\0\Èof;=µ—U\0òÛ©©­Q	\0\ÈI¡Pøa©TZ«\0_Øž“f¶¯¨\0\ä¶g¦™\í«*\09I³\ÚI\Åbñ5•\0€ü\ÂvBj¯«\0\ä¤P(œV*•Ö©\0\ä¤X,ŽI3\Û\r*\09I³\Úï¦°Ý¨\0“´-\Â\0ò\r\Ûrj›T\0rR,G¤°Ý¬\0“r¹<,…\í•\0€ü\Âö\Ä4»Ýª\0“4«=!5a\0yI³Ú¯¥°Ý¦\0“\áÃ‡¹T*mW	\0\ÈI\n\ÚO3[a\0y9r\ä\ç‹\Å\â*\09I³\Ú\ãRÛ¡\0“#F|V\Ø@Ž\Ê\åò±)lwª\0\ÔI\ì•Z¶ö‚JÀ*•J?\ÞW\Ø\n…o«\0\ä7»]®B\0\ÐM\Åbqfga\Û\Ü\Ü\\T!\0¨\Ï\ìvCa»Je\0 ~a;µ}Ø–J¥ñ*\0õ\r\Üu5aûŠŠ\0@¥™\ì\äšY\íd€g·*\0ù…\í¹\Â€~+Ë²C–-[ö\ÂÂ…³;\î¸#»ýöÛµhó\æ\Í\Ëþú×¿\îJ\í\n½J\×Ç=\Ä ´`Á‚lõ\ê\ÕÙ¶mÛ´n´5k\Ödó\ç\Ïß•¥™z–>®»Å«}ƒP}£4Ø¦g\é\ãú8°[,«@\ê\Ûb\ÉM\Ï\Ò\Çõq`·ø£1xˆôqM‡>0m|}e¶\ìÁk²%óþo¥\Åûño‘>®uˆ6¼¶\"{ü\Öi\Ù\â[¾¿G‹‹\Ç>\"}\\º9½°\ä\æ7\rB\Õö\â’9‘>®\Ýˆž¸\ëÿu:\Åc‘>®\Ýˆ¿}z§Q<fð1\é\ãú8` 2\é\ãú¸>}{ Š33;ˆ\â1ƒH\×ÇnDO\ß3«Ó(3øˆôq}\è\æ@ôÊŠG³\Ço;\ï\Í\Ëk\é\ß\â1ƒH\×ÇnDÑž}\èº7\rDño‘>®õˆ¶nÍž¾÷Š7/¯¥‹\Ç>\"}\\º1\Å\î9Kï¹¼\Ó\ãYñ˜vDú¸>\È@”^Í¯|ú\Îì±¹S:„ª->\'>\×À@¤\ë\ãÀ~Dûz¥o` \Ò\Çõq=º9\í\Ï+ý½\Í\0D\"}\\ö1\è Tm\"‘>®ûˆ4‘>®\é\ã` 2¡\ë\ã` 2u®©©©%µ—ô>}\\Ø‚H«ó@\Ô²«RË¢\é}ú¸°‘V§¨}\È\n[}\\Ø‚H«\Ó@T,\Ç\Ärqû¶úxGmk?\Ú0CØ‚°\íQG3Ya«wÖ–.]š577÷›À¶ lûJ\Øj}¨õõ>s\ÕUWe¥R)[¾|¹°…F\Ûx û\â¿˜½ý\ío\Ï\ÞñŽwd_ø\Â²{î¹§ò\Ø\Ýwßüñûü³g\Ï\Î?üð\ì­o}k\åó\Ûœ~¥\Ý\ímo{[vô\ÑGgw\Üq\Ç\n\Õ\ï\ÕQ¡P8\'\rô\Ìlû\ßÊ‹/¾8û\ÈG>R\éƒ\ï~÷»³r¹œ=ó\Ì3\Ý\êýýlÜ¸1;\å”S*}â—¿üen}¸öû\ì\ïß«°…^ˆ\"ø\âõ\ÑG\Íy\ä‘\ÊûGyd—„¼\âóÖ­[—mÙ²\åM\×~Ÿ\'Ÿ|²òþ\Ç?þñþ~‚\Ô\Ô\Ô\Ö	\Ûþ¶¿ø\Å/*ý\î«_ýj¥Oþù\Ï®|ü\éOº[ý¢³¿Ÿ›nºiwŸ5jT¶jÕª\Ü_0v÷{\n[\Èq ŠW\ãñ\Z!Xû\ïñJ½vFZ}\å|\Ì1\ÇT\Â4f®\×^{\í›>¯£¯k?Tg¸ñþš5k*ƒQufp\ÒI\'e/¾øbö»\ßý®òy#GŽ¬|^|N|³\æ\Ú\ï\×\Ù\×\Çcñ;žzê©•÷õ«_U¾\æ\ÒK/­||\Úi§Uf7\Ýˆ\Úfº\ë„m\ß\Ûc=¶òü\ßx\ãûTµG0ò“Ÿ¬ô\Ù\èc1{¬Îˆ;ûû9ó\Ì3÷xöÓŸþ´Ã¿‰1c\ÆT¾Gü~\Õ\ïQ}\ì3Ÿù\Ì\îYøyç—}\ç;ß©ôó\è\×ñwPû¹ý\Ý	[\èCQ,­\Å\ç;\ßù\Îlüøñ•W\è\r@´±lö\Â/Tþý½\ï}\ï>ªöW_ýWg­­­•\ã\ß-ZTyÿ\ë_ÿzö\ÒK/U\Þ?ê¨£*Ÿ\ËñqõgW¿_g_\Å\àô\á¸ò~,\ï\Åc\Çw\\\å\ã#Ž8\";ñ\Äë¹©E\Ìt7\è}}3lkW[º\Z¶\Ñ\Ï\ãýgŸ}¶\Òÿ\ãý\Ï}\îsþý,Y²¤\ÃC1\ãm¶\ä\ÕYvu	¸ú\Øÿø\Ç\ÊÏ¬~ü‡?ü!{ú\é§+\ï¿\ï}\ï{\Ó\ïif}| ŠcLZ1`\Äk ýñ\Æþ¹\çž[hö5s\í\è\ãj‹Wñ.\ìp]}•\Ål\">¾ë®»*o#\ì\Ûÿ½}ý~ô£=f\Ã\ÕA³úqu\Ök \Zø}<\Îˆ\çü•W^\ér\ØV_¨E`2¤²$+*ýýL˜0¡Ã°ýÖ·¾•t\ÐA{|ÿXÒ®j©öÛ®¼x¶Ð¢j«\Î\Z;û£\ã¬ññœ9s(l\ãý‰\'V¥[n¹e°Œ§ý\ï3…x,f µ\á\ØQ\Øvôõ1ˆ\Çbo\ã\ì\ÐÚ¯»\î:QƒôñXI9\Ðe\ä\è[ñó&Mš´{v\Z\Çj;úû9ø\àƒ³aÃ†uzõ\'>ñ‰N\Ã6–“…-Ð¨\Z ±<ö\ÐC\í1T_©WOtª[u)ø@\Â6¾O|ÿX‹Á)\Î\Ç~ý\ë_\ïþ¾qvgmXV—\0ÿûß¿\éû\í\í\ëã’‹\Ú\Ùtü[í¬¼+gDˆúw\ØVÙŸp\Â	•>K´ññ\Ç>ö±\Ê\ãü\à+?þø\ã•‚µ},=\Äû±\ZS=¼/\Ø:úûùÔ§>µ\×Ë•†ž­X±b÷÷U–\ê‹×˜5w\'l\Ûÿ½\n[\èCQ\ç¬^ºKm±dV]\â½ú\ê«+¡ÿƒB,Ÿ\Å\ç}\ï{\ß;à°³‹ø¸P(T\ÎÒŒ%¸xU\ß;Ž·V¯KŒA£ºüo«Kwµ\ßoo__;\0]~ù\å{œ•\ZmÓ¦M¢Z½‰dñ¢«öD§j_“ý\â0Cüû\äÉ“÷\ècÑŸ\âø<_/\Ø\âdÁŽþ~\"L\Ûl±X¬lnaú¥/})›7o\Þ\î\ï«5ñ=c\æ\Çc»¶\íÿ^…-ô\Ñed\Í@¤x{\íµ\×*!¼xñ\âÊ™\ÅñB0ÞŸ6mš>\"\Í@¤\çÕž{\î¹\Êe@ú8ˆ4‘>žS[»vm6zôh}DšHÏ£Å–7\ÜpCe\äõ\ë\×\ë\ã` \ÒDúx=\Ûý÷ßŸ~ú\é\ÙÌ™3+g\ë\ã` \ÒDúx\Úó\Ï?Ÿ]x\á…\ÙYgU¹M‘f \Ò\Ç\ë\Ôb™8.·‰;ý\Äö‹›7o\Ö\ÇÁ@¤ˆôñzµTv;»\ì²Ë²Õ«W\ë\ã` \ÒDúx½Ú²eË²3fd\çœsNö\Øc\é\ã` \ÒDúx½\Úë¯¿ž]s\Í5•%\ã¿ü\å/´5¢>\"\Í@¤wÐ¶n\ÝZ\ÙO;¶XŒ½–\ã\ZZ}DšH¯S[ºtie\ÛÅ¸mcû\Å\ë\ã` \ÒDúx7Z\Üÿ6n`³\Ùø™1»\Õ\Çak \Ò\Ç\ë´d<w\î\Ü\ÊqÙ¸r\Üd@„­H¯S[²dIöƒü ›>}zö\Ì3\Ï\è\ã@ÇºrSt\Í@¤ÿ£\Åý’gÍš•7n÷ýjõq S,\ØÙŸ/®\ïk\í\Å_\\ž¢mz\ÖÀ\ì\ã±\ÛÓœ9s²±c\Çf\×]w]¶n\Ý:}Ø·;\ï¼ó\Âùó\ç\ïzùå—…e¡yóæ½‘\ÚL=k\àõñE‹egŸ}vvÁT\î=«]’þpf¤Wªci¨¯¶¸õX_þý\Ú\Ú6ƒ\ÐÀ\ë\ã7\ÝtS6eÊ”lÌ˜1• úA?\ÔÇ®1b\ÄÁMMMŽ\Ñ\Óý\î]©\ßÝš\Ú\Î\Ôæ§ß¯*À@ô„-=&õ·i©mOme¡P8^E€F\Û÷[zBklj\ÛR›ª\"@\Ã6lØ‡\ÓÀ·K%\Èó]©Tº;–Œ‹\Å\â\ÜXMQ ¡Œ=ú¨4\0\n[r‘ö¢\Ô\ÞHmy\n\ÙÏªÐZ[[ÿ°%‡\Ù\ì7\Òlvm\n\Ù-\é\íd\ZZssó1±¼§\ÔC\n\Ö\ÃS»?µ…B\áOƒ>DU€†W.—¶\ÔC\êG³RÛ‘\Ú\Óñ\"NE\0þ9@¤JÐ>4<µ×‹\Å\â¦\ÔÆ¨@;¥R\é\ß\â• «\â\äº\Ôw·mLqýô\é\ÓR€\n…/\Å*A¼%õ™k\ã¸lzûxš\Í~TI\0ö\"\r”_‹MT‚ý|qvr\ê/SÐ®O­¤\"\0û!\rœ\'¤¶U%\ØÇ‹²£S{2Žï§·W\Æ\ìVU\0öS¹\\\×Bª‰U¤p½!–ŒS{hÔ¨QG¨\n@577§±´¸Y%h/½›\Ú\æ\Ô^-\nCU\à\0¥\Ù\ÊÈ¸dC%¨Šk¯S¿x6\ÎRO!û3\è~\Ø~7NxQ	ÆŽ{h\ês\Ú.\å¹g\èÐ¡P€:Hƒ\ê)if»^%\Z¾œ\Ûvë»—‡þe¨\ï \Ç\å^W‰\Æ4r\ä\ÈÏ§\çE\\k^t\ÍP€\ÄYR{M%\ZKkk\ëa)`\ïˆ;>¥·ó†òU\Èofû©½¢£\\.Ÿ\ß6“}1µU€œ\n…\Æ}GUb\à‹c±)\\W\Ç&&\éy?GE\0znf;-µ\Õ*1pµ´´|(=\Ç÷\ÆY\Æ\é…\Õ\ÍqÖ±ª\0ô XRL³U*10¥p½¤m‹\Åeqý¬Š\0ô\Î`ü\ã4¿¤\îEÔ‰\é¹}5v€JoÇ«@\ï\Ê?‰eTb`ˆ½‹SÀ>Ü¶1\Å\ïcocU\èý™m,3>¯ý\Þ[\ân<m!ûDÜ¥GI\0úˆ40_ž\Ús*Ñ¯_0…õ\éyÜZ‹Š\0ô1iô«4@?£ýò¹ûhjK\Únwõ ÷˜\è³3Û«R{Z%ú\éÓ§”\Âuv,§°]4zô\è£T o‡íµ©=¥ý\æù:%µM±Ÿu¹\\¦\"\0ýcð¾>µ¿©Dß–f°ŸL\Ï\Ó\ß\ãš\Ù8Î®\"\0ýkÿ¯4x?®}\Ó\àÁƒ)•J7\Æq\Ùô\\Ý—\Þ®*\0ýL\Z¼ÿ\ÇýT¢\ï)\ng¦\çfk\ì]=bÄˆo¨@ÿ\r\ÛÓ€þˆJô\Í\ÍÍŸkjjZž\Ú©]¤\"\0ý?loNaû Jô¾4{}W\n\×[\Û6¦˜Ÿ>~¿ª\0Œ°½%ŽªD\ïj»û\Òö\ÔV\n…\ãU``\rò1“ºW%zGklj\ÛR›ª\"\03l\ïH\í¯*Ñ³b‰¸T*\ÝÝ¶1\Å\ÜXBV€¶óS»K%z´\æµü´<…\ìgU`\àüR›§=2›ýF\\Æ“\ê½%½¬\"\0¶÷\Æq[•\ÈOlD‘\Úý±1E¡PøSlT¡*\0\r¤mW¢[T\"·3³Ú¶X|º¹¹ùh\ÌY\×Ci¶õg•¨{\È›¤3›R£\"\0¶ÿK›*Qq»»²‹\Û6¦¸>n‡§*\0f`‹\Ó\Ì\ë•è¶·\Ä\í\n\ã¸l\Ü\Ø!n\ì®$\0T\Ã6‚\á¿T\âÀ\n…“S7¦ ]ŸZIE\0h¶‹\åN•\èºô\"\å\èÔžŒ \Ò\Û+cv«*\0t¶O¥\É\Ø\Õ*±ÿFŒqp,½Ç’qœ`6jÔ¨#T€½…\í\ßS`üF%ö»^RÛœÚ«…Ba¨Š\0°Oi†¶¬\\._¡{—jtlzQòll³˜Bög*@WfjÏ¥v¹Jtl\ìØ±‡¦ú\Ìi»”çž¡C‡~@U\0\èj\Ø>Ÿfl—¨D‡µ9·\í\Öw/>ü\Ë*ÀÊŠb±x±Jü\ÓÈ‘#?u‰›¹§\Ú\ÌP\0º¶q\ãòUbÐ \Ö\Ö\Ö\Ã\âþ¾)`wÅ†òU a»\Ê\ì­r\Ôùm3\ÙSûW=€z†\í\êÔ¦5\êÿ?ŽÅ¦p\Zl-\n\ç\è\0\Ô]\Ü\Ì<…\Ì\íÿ\Ý\Ò\Òò¡¶{ù\Æ\Æ7\ÇY\Çz\0y\Íl_Masvƒ½À¸¤m‹Å¸\ÆøX½\0€\\¥Ày-Ï¤Fø¿¦`=1í«±Tz;Þ³@O\Íl\×\rô\à‰½‹\Óÿóá¶)~{{\æ\èÉ™\íú@§\Ðÿ\Þ[\ân<m!ûDÜ¥\Ç3@o\Ìl\ã>¬\ßhÿ¯\Ò?\Ä‰\r©µx¦\èÍ°Ý”Zy\0\Í\Ô?šÚ’¶\Û\ßÅ­\Ýc€^\Û\Í)œFô÷ÿ\Çô\é\ÓJ\á:;–Œ\Óÿg\Ñ\èÑ£ò\ì\ÐW\ÂvK¡Pøv?ÿ?œ\Ò6C½\\.ó¬\Ð×‚jkj\'ô\Ç\ß=\Í`?™~÷¿\Ç5³n@_\Ûm)´¾ÖŸ~\çÁƒR*•nŒ\ã²\éw¿/½=\Ü3	@_\Û\í)¬þ½¿ü¾…B\á\Ì°[c›\É#F|\Ã3@_\Ö\å©e´X†}£­­‹[\Íõµß½¹¹ùsm¿üŽy6\è“\Ê\åò7;	\Û\Ý-\Í\Zo\èK¿sš½¾+ý^·¶mL1?}ü~\Ï$\0}}vûtgA\Ç@ûÒ¬6ný\Ë\ÜqƒûB¡p¼g€~?»\í+³\Ú\Ö\Ø8y+µ©ž5\0ú¸µ\\G\Çm{{VK\Äiv}w\Û\Æsc	Ù³@¿›Xt¶Wõ\æ\ï\'=µü´<…\ìg=K\0ô{)\Ô^ªY>\Þ×®ö\ÒlöqO\ìd•\ÞNö\Ì\00`¤€Ssb\Ô=ýóc#Š\Ôî“²\ÒLûO½ö\0÷\ìvU„\íÐ¡C?\Ð\Ã?wVÛµ½O777\ã™\0` ‡mË°aÃ²¸cNý¼\áq³€X¶Ž™µg\0€FpNjYj3òü!q»»²‹\Û6¦¸¾§\Â\0úB\Ð\îJí‘¶·y\î[R¸^\Çe\Ó\Û\Ç\ã\Æ\î\Ê@£m5`§\Ö;p…\Â\É)`7¦ ]ŸZI\Éh\ä \Ý×¿wIš½Ú“qTz{e\Ìn•\0Aû\æÇ»¼E\âˆ#Ž\íc\É8µ‡F\Zu„r h;\Ö\å%\å4‹\Ú\æ\Ô^-\nC•\Z\0A»o¸;÷5\Ã-—\ËÇ¦Yì³±\Íb\nÙŸ)3\0‚¶\ë_·³£¯;v\ì¡)`\ç´]\ÊsOOoŠ\0!h\Ûý\în\n\×s\Ûn}÷òð\áÃ¿¬\Ä\0\Úmœü›Aû>;¸ý\çUŽ\áy\ä‘W§€]7s/‹3”\0Aû\æ }j\Ð?v‹zj/\Û\á\çz\è¡\ÓO<ñ\Ä\ì+_ù\Ê3C†yò hß¼tü›¶\0\Íö¸µA[mWVŒÀ”\ßNS\0Ð¯ƒ¶³ ­\r\Ü}=^U÷¦\0` \í¾÷ ý\ÚÚŸ³S\à h÷?p·u!h\Û\îT¥@\Ð\î_\àv%h«,)\ÐŽj\É%]üºƒ:˜\Ñnkû÷®˜\ÛöµGy*\0h„™\íþ.\é\Ö{fûcO\0¸=uÌ¶ºw²%d\0\î>‚ö@\ÏF> \ÛðÀ@	ÜŽ\Î®\×u¶-ƒœ…\0»¥\Öb·wª™\Ñ\ÎTb\0¨ó\ÞÈ‚\0ö>Ã­\r\Ü+\í\ß]j?\Ïõ´\0°nwŽ±\nZ\0\È10»{\ãy\0h¸nW‚S\ÐÀ\Îp÷gI¹e“¡\0 ·nõ¯ €·£\ës€n\îÔš µ3\0\ÔYu&;»÷\0@~3Ü¦¦¦L\Ð@Ž\Ú\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°€ƒuU„\ë>\ÚF•€Û–}…m±Xœ¡R\0Ð½À]³—°\Ý0xð\àCT	\0ršÝ–J¥«\0\Ô\'p;:v»Ñ¬\0rœ\Ý:V\0õÜ—\Ìj Gi&;¦&l§ª\0\ä3»­»5«€:ˆ@lj\Ú.ÿ\Ù\Ö\î¸\íŽ\Ô^Ima¹\\¾¢µµõ0U€ýp\ÒI\'}:\èü \Û÷c÷¨\ÚË€v‹\Å%\éí¿©\"\0t2“Ma97…lÖ•\í¤-4\Ó€\ZÃ‡ÿrš‘niš\ãÇÏ®¼ò\Ê\ì¾û\î\ËV¬X‘mÙ²%ñvõ\ê\Õ\Ù\Ã?œýö·¿\Í&Ož\Ü\Ñ6Ž›…Â·U€†g777\ï¬\r\Ê\ïÿû• Ý±cG¶¿-Z”M™2¥}\è\îr=.\0\r´µ\Ë\Æ)t³9s\æt)dÛ›;wn\Ö\Ú\Új\0ˆ¥\ã´»j—Œ—.]š\Õ\Ãs\Ï=—~ú\é{\Ìp-)\ÐP\âd¨\Úc´´q¶ž\âû\Õn\Ãu\Ò\0\r#\Î:®]:®×Œ¶£n»%\åT€/®£­=N\Çhó\Çpk\ß\Æòµg€-6¬¨=\ëxûö\íY\Þ\Î=÷\Ü\Ú\å\ä%ž\0¬8V[»3T\\\Þ\Ó}ô\Ñ=všJ\íp\Ï\0R\\‚S{RTw.ñ\éªÚ/b/e\Ï\0R\ÛM*w\ÕUWe=iö\ì\Ù{l\ç\è\Ù\0` †\íšj\à\ÅŒ=)–¬k–’_ól\00 ¥\Û}¼v\åÊ•=\Z¶q\Ým\í\íù<\0Ô™\í\îÀ«\ÞT §\ÄÏ«ýùž\r\0|\Øöa€™­™-\0tc¶\0ÿ\Ì\Ö\Ù\È\0sØº\Î\0ò”f”?\î­¤\Î8\ã;H0ð\Å\Þ\Èq¼\Ô\Þ\È\0£¸§l\í]zbv;e\Êwý q\ÄýlS\è\ír?[\0\Èwv»ûD©\æ\æ\æl\éÒ¥¹\ís\Ï=—|òÉµaû€\ê\ÐZ[[+‹›kO–Š\ë`\ë}]\íÄ‰k—7\Ç\ÏU}\0\ZF¡Pøv\írrn½f¸1£­\r\Úø9ñóT€F\Üsj7–”\ãnwNšŠc´í–ŽcV;Cµ¸5\ág)/Z´¨Ë—÷L›6m\ï+h\àû\í\Úc¸µKË±\ÓÔƒ>X\ÙK¹zó‚x\Çd#cg¨\Ú\r+j\ÑZ:€\ZqòR\íY\Ê\Ýl8\n\0:\×\á¦Y\é#µ;M\íO‹¡bÃŠr¹üMU€ý[;¶\í¥³\Ý5µ·\ç«\Ùvñµ¸©@\ìulF\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0úšÿ\È§Hh·k\0\0\0\0IEND®B`‚',1),('3',1,'/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562206221743\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestReport\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestReportID\" name=\"ID of test report\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewReport\" name=\"TMReviewReport\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TMReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"qmReviewReport\" name=\"QMReviewReport\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"qmReviewGate\" name=\"QMReviewGate\"/>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusReviewReport\" name=\"CUSReviewReport\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CUSReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitReport\" name=\"TSSubmitReport\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"_12\" sourceRef=\"start\" targetRef=\"tmReviewReport\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"tmReviewReport\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_14\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"qmReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" sourceRef=\"qmReviewReport\" targetRef=\"qmReviewGate\"/>\n    <sequenceFlow id=\"_16\" name=\"é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"cusReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_17\" sourceRef=\"cusReviewReport\" targetRef=\"cusReviewGate\"/>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_20\" name=\"ä¸é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_21\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_22\" sourceRef=\"tsSubmitReport\" targetRef=\"tmReviewReport\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestReport\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"25.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewReport\" id=\"Shape-tmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"210.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewReport\" id=\"Shape-qmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewGate\" id=\"Shape-qmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewReport\" id=\"Shape-cusReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitReport\" id=\"Shape-tsSubmitReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"20.0\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"tmReviewReport\" targetElement=\"tmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"start\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"57.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"qmReviewReport\" targetElement=\"qmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"tmReviewGate\" targetElement=\"qmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"237.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"cusReviewReport\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"525.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"qmReviewGate\" targetElement=\"cusReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"412.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"tmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"227.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"cusReviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"251.0\" y=\"617.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"qmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"396.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"tsSubmitReport\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"65.0\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"cusReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"601.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"420.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('4',1,'/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"SSSubmit\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\" activiti:candidateGroups=\"SM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\" activiti:candidateGroups=\"QM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestPlan\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestPlanID\" name=\"ID of test plan\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestPlan\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('6',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0&ŠIDATx\Ú\í\Ý°\Ô\å}7p&µ©M\Ó\Öf\Ò:™Œu2\í\ëdlš±\Í\ÛI›\éXÒ´il†1E\Î\î\Ù=€\'#¢xAðF$ðÑªUCU¢D\ÓhM\È¯ \âQ¼€QQ¼p‘›Àÿ}~›]º\Ï\ávönûù\Ì<³\ç\ìž\ëoŸ}¾û<ÿÛ A]È²\ìðA\0@\ã\\ò\ß/<“ö©}ü\Æ\å\Ù+\ç\Ï\\´\ëÿý\à©U“¾¿l\Íøo\Ïß\î/\Æ\×]tý’\é\ã/\Å\×\Å\ãµ6~Æ‚=õ_Wûy\Ï3oQm\0šR\n\Æ\Ó~°ò\í¯ýð¹\ç.úÞ’\×\Çÿ\ç‚=_ùÞ’]ÿÈŽ]Yv_\Ý\×\Ý7sñ\Ö\×\"T/ÿñše_½lû\Ä\ÙK·Ÿ1\Ïÿ¼œ½˜\î_÷T–]2û±ln\í\ëj\í\ÜÞ‰\Û\Ú\×@3…\í©™Ú¢Ø‹nxlû…3¿s\Ý{\Ö\Æmºÿƒõ_¿fWöð%·®\Ø2ù¦\å\Û\"˜Ï½\æ¾\Ý\ç]³0f¶\Ó\á\ç·%\Ë.Œv\Óòì¶¯\Î^úZ|\ÜÙ¬\0ô¬ö²\ÛVoL·ó.þÁŠ-\ç_{\ßî‹¾—÷ú%;¾y×¦\×\'|÷Áñu³—¾ó\ê„\ï>´3}\Ýe\ßøùª7\'\Ýô\ä¶Ï˜\Ù~\ë\Þ\×^?ÿÚ…\Û\â\ë\"Tc†\\]n>ó\Ê_¼þpÜ¿(Ë¾y\ïö\ì\Z \Ãös_û\ïU›\Ó\í7b\Ûë¸«\ï\ÍÎ¿nÑ®ôù\âÔ®ûŸ®³úuz\Þo\îÿ\Óÿ¸\í™M_½qÙ¶\ÒYK²5é¾‹\'\ÍY¾º6KŽ«³\åží¢­qÿ?\Ýðˆ\åc\0š\Öy\×Þ·5\á-\çþ\ç‚=i†ºkÜ·\ïÍ¾ó`¶v\âõ®¬}]q\ì©|\Þ5w\\z\ÛË›bl,3Ï¼wÕ†ú¯‹ŸWûø+³[\â¶\ZÀör )g¶GG`>ùVötšz>KÀoXZ\Ùf{ó\Ó\ÙËe\Ùµkuf{\ê·\î\Ú³\Þ\ÏL˜õ\ÐÎ‰7<²ãŠ¹¯=V÷u‡\×f¹\Õ\Ï?“RvÊ…\×\Ýÿ¶jÐŒA{v\ì\Ø4\é¦\'¶]s_ö\Ë\ç³l\Ù\æ,{le–MÛ˜eKbY9}Íœ\Ôþ\ï\ä9Om¡f=üö\Ú4\r~t{züòŸ®}k\Æü-\ëo]¹õ\åô5\ç¤ö\Ñ\Þ\Âoý\è¥\ì\æµY6\é\Ç\ë²\Ùqx\Ðw\È\î¨\îõ*@3…m„ß”\Ø9\Âq\Ú­\Ør\å\Ï\ß|£vü\ìM\Ïd¢ŸO\í\æ\Ôîˆ½ˆç¾–½3\Ú®{\à8·\Ö\Òc¤vúYvQ\í\ç}\í–\çVN¹ù\Ù\êÉm\Ä*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ýR–eG\Üq\Ç·Ï˜1c\Ëô\é\Ó÷œw\ÞyY{{{\Ö\ÚÚš1\"?~|6yò\äÓ¦M[=v\ì\ØsU\0Ð«¯¾\Úv\ÓM7m:\çœs²3\Î8#»\á†²x [³fM¶mÛ¶,\ìÜ¹3[·n]öð\Ãgs\æ\Ì\ÉÆŒ“u\ÖY{&Nœø«R©t¤*@\ç3\Ù#\ï½÷\Þ\rgŸ}v–f²Ù²e\Ë*¡z –/_ž¥Yp6jÔ¨,Í‚§©(\0t˜\Í~\ë[\ß\Ú3nÜ¸l\éÒ¥Yw<ó\Ì3\ÙØ±c³\ÓO?ýµööö#T€¦·yóæ±“\'OÎ®¾ú\êlÓ¦MY#\Ärsü¼3\Ï<ó-\Ë\Ê\04ýŒ6‚öŠ+®\Èv\íÚ•5Úµ\×^3\Ü7|¸j\Ðtbm,\Ç4 ­ù\æ7¿™\r>|•Š\Ðtbg¨\ØFÛ¨¥\ã}-)3fO©T\Z§\ê\04X>Ž½Žc\ãž;Mµµµ\í¶ý€¦\Ç\Ñ\Æ\á==\é’K.\Ù\Ù\Ú\Ú:Wõð\â\ÌPqÂŠžš\Õ\Ö<ýô\ÓYšÙ¾cg)\0¼»\îº\ë§qf¨<wŠ\êJ{{û\îb±8Ê³\0À€\ç:ŽS0ö†«®ºjkkk\ëB\Ï\0Z\\T \Îu\Ü\î¿ÿþ])l_ö,\00 \Å\Õ{\â¢½aÃ†\r{R\Ø\îð,\00 \Å\åñjW\ï\éiqaƒ¸DŸg€-Â®7	[\0¼“O>¹7g¶{„-\0Þ¹\çž\Ûk\Ûl×­[·\Ó6[\0¼)S¦\ìè­½‘\ï¸\ãŽuöF`À»ø\â‹Wõ\Öq¶“\'O^\ë8[\0¼±c\Ç~yÌ˜1½r©8]£3H\Ð,»»§Ï¼xñ\âXBvnd\0šÃ¤I“~y\å•WöhØŽ=z­«þ\0\Ð4\Ú\ÛÛ8õ\ÔS÷,_¾¼G‚öÁ\Ü³Z×³ ©œu\ÖY“\ãò›6m\Ê5h·nÝº»\\.\ïLA;N\Õh:cÆŒYs\ÕUWå¹³Ôžô;\Ö‹\Å\çU€¦;+¥\î†3f\ä¸{&NœøRW\ËÖª\r@S\î\èÑ£\×}ý\ë_\Ï\Þ~û\í†-Ÿyæ™±C\ÔË¶\Ó@5pGŒñüi§¶\çñ\Ç\ïö\ÎP±6–Ž\Íh ƒØ‰iøðá»¦L™òN„\îÁ,-/Y²d}l®\îulg(\0\èJ\ÌFÓ¬ô–˜Ž9r\Ïô\éÓ·.X°`\×Úµkw\ÇõhkWï‰‹\n\Üy\ç\âŒqf¨\Ù8ŽÖ²1\0„ž#R»;µU)€·\Æ\åñ\êÚŽ\Ø&›\Ú\â8£3C@\ã8›:u\êa*\09†­Y,\0\ä¶---T	\0\È1l\Ò\09‡\íˆ#þD%\0 ¿°\Ý3t\èÐ¨\0\ä¶©¥\0cØŽ1\âc*\0ù…\í\îb±xŒJ\0@Ža\Û\Ö\Öv¬J\0@NJ¥\Ò\î“N:\é“*\0ù\Ílw¥öW*\0ù†\í§U\0rR,\ß>|øgT\0ò›Ù¾S(ŽW	\0\È/lw¦°ý¬J\0@~a»£X,~^%\0 Ç°-—\Ëÿª\0_\Øn/\nCT\0ò\Ûmif;T%\0 ¿°\ÝZ,[T\0r\ÛR¢\0“4«};e\íp•\0€üf¶[R\Ø~Y%\0 ¿°Ýœf·£T\0r’fµ›R;M%\0 ¿™\í\Æ¶g¨\0\ä¤X,¾™w¬J\0@NÒ¬öB¡0^%\0 \'iVûzj\ç«\0\ä¶R› \0_Ø®Om’J\0@NŠ\Å\âºr¹<E%\0 ¿™\í\Ú¸\ÓT\0ò\Û5©]ª\0_Ø®N\ír•\0€œ‹\ÅW\Ê\åò•*\09)•J/\n…o¨\0ä¤µµuUš\Ý^­\0_Ø¾\Ú•\0€œ¤Y\íó\årùZ•\0€œ”J¥\çR\à\ÎT	\0\È/lW\n…\ï©\0ä¤µµõ\Ù\Ôf«\0\ä¶O§v£J\0@NŠ\Å\âòR©4G%\0 ¿°}¢\\.ÿ—J\0@NZ[[O{‹J\0@~a»4µÿQ	\0\È/lI\ív•\0€œ‹Å‡K¥\ÒOT\0r’‚öÁB¡ðS•\0€œ´¶¶.N\í\ç*\0ù…\í¢\Ô\îT	\0\È/l¦v·J\0@NJ¥Ò‚b±x¯J\0@~3\Û_¦6_%\0 ¿°½;–’U\0ò\Û;c\')•\0€œ‹\ÅyqøJ\0@NJ¥\Ò\ÏR\à> \0_\Øþ$NÙ¨\0“¸A\\Œ@%\0 \'…B\áGivû˜J\0@NR\Ð\Þ\ZW	\0\ÈI¹\\þ¯b±ø„J\0@NÒ¬ö\æ¶\ËU\0òÛ›R{J%\0 ¿°Ú³*\09)\n\ß+•J+T\0r’‚ö»ifûœJ\0@NŠ\Å\âu)l­\0“´3R{A%\0 ¿™\í\Õ)lW©\0\ä¤T*]•\Âö%•\0€üf¶\ÓSØ¾¬\0“´—§¶Z%\0 ¿°½4µ5*\09)—\Ë‹Åµ*\0ù\Íl§¦öšJ\0@~a;)µõ*\09)\n•J¥\r*\0ù…\í…ifûºJ\0@~a;>\Íl\ßP	\0\ÈIšÕŽ-‹oª\0\ä¶g¦ö–J\0@N\n…\Â\é¥Ri£J\0@NŠ\Å\â¨4³Ý¬\0“4«ýr\n\Û-*\09IA;B\Ø@¾a[N\ím•\0€œ‹Å–¶[U\0rR.—‡¦°Ý¦\0_Øž˜f·\ÛU\0r’fµ_LM\Ø@^Ò¬öó)lw¨\0\ädØ°aŸ+•J;U\0r’‚ö\Ò\ÌV\Ø@^†þ™b±øŽJ\0@NÒ¬öÓ©\íR	\0\ÈIKKË§„-\0\ä¨\\.—\Âv·J\0@ƒ\ÄÙ¢R\Ëö\Ó^V)\08D¥R\é²ý…m¡Pø’J@~³\ÛU*\0\ÝT,§w¶mmmE€\Æ\Ìn7w¶kU\0\Z¶“:†m©T:Ce\0 ±»±.l_W\0h°4“W7«§\"\0\ã\ìV%\0 ¿° lè·²,;üù\çŸyñ\â\Å\Ù=÷Ü“\Ýu\×]\Ú!´»\ï¾;ûÕ¯~µ\'µkõ*}\\\Þ%¡…f\ëÖ­\Ëv\ìØ¡u£­_¿>›?þž4(M×³ôq}\Ø+\Þ\í„\Z;¥YÀ=K\×Ç½bY\Í\0\Ò\ØKnz–>®{Å‹\Æ\àa \Ò\Ç5}úÀ@´\å­5\Ùóß-¿ûk•\Ç}‘>®\rˆ6¿¹:{òŽ\É\Ù\ã?»\à]-\î‹\Ç>\"}\\º9½¼ü\'\ï„j\í•\ås\r>\"}\\º;=ý\Ëÿ\èr Š\Ç>\"}\\º9=y\×\Ô.¢x\Ì\àc \Ò\ÇõqÀ@d \Ò\Çõq}úö@{fv5\Åc‘>®\ÝˆV.š\Ñ\å@|Dú¸>ts z}õ²\ì\É;§¼wy-\Ý|Dú¸>ts ŠöÂ’\ß3\Å}‘>®ˆ¶o\ÏV\Þ\í{—\×\Ò}ñ˜Á\Ç@¤\ë\ã@7¢8{ÎŠE\ß\îr{V<\æ;\"}\\e J\ï\æ×¬¼7{b\Þ\Ä.¡Z‹¯‰¯50\é\ãú8p€\Ñþ\Þ\é›ˆôq}\\Ï‚nDòN_3\0‘H\×ÇýD‡:Õš\È@¤\ë\ãÀ~\"\Í@¤kú8ˆD\è\ãú8ˆD]kmm‘Ú«zŸ>.lÁ@¤5x ª†\ì\ÚÔ²hzŸ>.lÁ@¤5h \ê²\ÂV¶` \Ò\Z4‹\ÅQ±\\\Ü1d…­>\ÞY\ÛÞN˜!lA\Øö‰¨³™¬°\ÕÇ»j+V¬\È\Ú\Ú\ÚúM\à\n[\è\ÃÑ­·Þšu\ÔQ\Ùoý\Öo\Åµ\Ëûòlñ;òþ=Õ°\ÕúP\ë\ë\á5kÖ¬¬T*e«V­ê‘¾\ÛÝŸ%l¡Aa»hÑ¢\ì¸\ãŽ\Ë~\çw~\'û\Ý\ßý\Ýì“Ÿüd·_¬ù\ÈG*\ßó\Â/\ìó¾\ÚÏŽöÛ¿ý\Û\Ù_ÿõ_g÷\ÜsO¿\nÛ¨m¡P¸0\rô›\Ílû\ÏÊ¥K—f\år9ûý\ßÿýJß‹\Ûù—iH¿\è\ê5µeË–\ì\ÔSO­ô‰k®¹¦W\Âö`¶°…\rDÿø\Ç+/¾eË–e\ë×¯\ÏÆŽ\Û\í~gß³¿û.\\XùøcûX\ÞAjRj…m\ß\Û%K–T\Âõ\ÏÿüÏ³G}´r\ß3\Ï<“µ··7¤_tõšºýö\Û÷ö‰‘#Gfk×®\íñ7Š\Âzi Šwõñ\â‹Á¦«f}\ëøX|¼‹¯ýüÎ¾§«Ÿ\Ó\ÙÏŒ\Ù@\íóŒbPú½\ßû½\Êýÿü\Ïÿ\\™¿þú\ë•ûŽ9\æ˜wý½ñy\Ì$b€\ëø³»úYµ\Çÿøÿ8û£?ú£\Ê\ÇÓ§O¯|o\Ü\Æ\çø‡˜}ø\Ã>\à¨:\Ó\Ý(lûf\Ø<¸òü\Þyç‡<#ü\áXycX\Û,RÿXW¯©ñ\ãÇ¿\ëM\Ø×¿þõ}þ®Z;ö\Øc\ßõ³:>^›=\Ç\êQü\î#<2»ù\æ›\ßó³÷õz¶ó@¡S\Íü\ÇÌ¦L™R	«}\'Ûž\âñ£>º[3\ÛT>þ\â¿¸÷ñ˜i\Ä}±,÷\ÔSOU>þô§?]ylÜ¸q•\Ïñ‹_T>3>û;û}ûúY\ÑN<ñ\Ä\Ê}›7o\Î>ñ‰OT>ŽÛ7V>þ·û·C9©E\Ìt7\ë}}+l\ã\ÍV<§Û¶m\Ûg\ØFv\Õ\ã\rX¼q‹Yò¼¦z\è¡N71\Üw\ß}]†\ím·Ý–ýø\Ç?®||\Â	\'¼\çñ\Ôx\ÃXû|ö\ì\Ù{?7–‘¡\rD1\ã»è¢‹öL´\ã?~Ÿ/Î¹s\çV¾¾ö~\Óþî«µ˜)üú×¿~Ï X\ßj¿g\åÊ••k\Û\Ù\â6>û;û}ûúYÑ¢q\ß\äÉ“+·§Ÿ~z\åvÚ´i•\Ûx\Ü@\Ô\\a[¿\ÊÒ±?\Å\ì1>\Ë\Äñn_¯©!C†t\Z¶cÆŒ\É;\ì°N1þ¾hµ\ÙkgwöyýNˆ\Âú\à@\ï\Òk\ï\È÷õ\âŒ%Õ¸\ï\É\'Ÿ\Ü;\ì\ï½¿û\Î?ÿü\Ê\Ç1\è8(\Æì²³¿÷¤“NÚ»·ñyW¿o?+–\ãñø\ßj³ôHkÿk\ìMm \ZX\Ë\Èûúúú\×Ag}<fª±\ÚQ{\Ã\Ûi»zM½ÿý\ïÏ†\Ú\å\ÔñqHa{ Ÿ[\è#Q‹/®|;‹Ô–O;†Tý\Î±„÷\Å,4–®\Z¶±|³…ø¼¶Grm\éwÂ„	þíµ¥\ç\Ú÷\ÅqW¿o?+fÄµ\ïù÷ÿ÷\Ê}—_~ù\Þû\êg\Ü¢þ¶\Ñ\Ïc©x3U[Žm¢±M¿~~<\ï\Ñ/n¼ñ\Æ.Cª¶¥¶l\Û\Ùk\ê/ÿò/÷y¸Ò°a\Ã*KÒ-#\Ç*RW\ËÈ‡¶½ž…-ôÀ@\Û*c ˆw\èñBŒ%\ä8,¢öx\ì$\ïª\ë_´±­¨pƒö±ó\ÔÁ\î¡!W¿Œ;Bq\Æ•—u±SG.÷ý\Ý\ßý\Ý>öü¬ø?£µ(¶]\Ç\çõ³\nQÿ\Ûh±§ðð\á\Ã+¡Ë®q[hñ&²c_é¬\Ç÷ÆŽy±mµ«\×TKK\Ë{¶X,V––\ãw~ö³Ÿ}\×^øg¼ù\íl©C	\Û\Î^\Ï\Âzi \Ò,±\é\ãio¾ùfe\æñ\Ç¯f¼‘‹c\ß\0}DšHÏ©½øâ‹•Ã€ôq0i\"}<§¶aÃ†\ì”SN\Ñ\ÇÁ@¤ˆôñ<Zœ²ñ–[n©œyÓ¦Mú8ˆ4‘>\Þ\Èö\àƒfgŸ}ve\'¥Õ«W\ë\ã` \ÒDúx£\ÚK/½”]z\é¥Ù¹çž»÷\\\Ìú8ˆ4‘>Þ€\Ë\Äs\æÌ©\\\é\'\rÚºu«>\"\Í@¤7ª\ÅU¬\â¸î«¯¾:[·n>\"\Í@¤7ª=ÿüó•ói_x\á…\ÙO<¡ƒH3\é\ãjo½õVv\Ã\r7T–ŒþóŸ\ïó\"ú8ˆ4‘>~mûö\í•syŸv\Úi\Ùu\×]W9†V‘f \Ò\Ç\ÔV¬XQ9\í\âW¿ú\Õ÷\\(^‘f \ÒÇ»\Ñ\â¢\ßù\Îw*³\Ùø1»\Õ\Çak \Ò\Ç´d<oÞ¼\Êv\ÙY³fU.2 \Â\Ö@¤7¨-_¾<û\ÊW¾’M:µ\Ók\ë\ã@E\í‚ìšH?ð\×4ž1cF6fÌ˜Ê¥òôq`Ÿ.\\¸»?\\\ß\×\Ú+¯¼²*\rD;ô¬\Ù\Ç\ãlOs\ç\Î\ÍF\Ýx\ã\ÙÆõq`ÿ\î½÷\ÞK\çÏŸ¿\çµ\×^–\r„\î¾û\îwR›®g\r¼>¾t\é\Ò\ì¼ó\Î\Ë.¹\ä’Êµgõqà ¤Î´ôNuK,\rõ\Õ—\ë\Ë_µ\í0\r¼>~û\í·g\'N\ÌF\ZU\ÙªôC}8x---\ïommµˆž\îwLý\îŽ\Ôv§6?}þ!Uú \'l\é1©¿MNmgjk\n…\Âñ*4C\Ø~H\Ø\Ò\"X#`SÛ‘\Ú$š\ÆÐ¡C?’¾=*Ažo\èJ¥Ò‚X2.‹ób5EU€¦r\Ê)§@aK.RÀ^ž\Ú;©­J!û)šR{{ûÿ¶\ä0›ýBš\ÍnH!»-ÝŽS ©µµµ\Ë{*A#¤`=2µS\Û](~4xð\à\ÃUhz\årù8aK#¤~4#µ]©­Œ7q*ð¿\ä§c€T	ºÑ‡†¥öV±X|;µQ*\ÐA©TúûØE%8X±s]\ê;WOLq\ÓÔ©SS€N\n…\Ï\Æ	T‚ƒð¾\Ôgf\Çv\Ùtûdš\Íþ™’\0\ìC\Z(?\'P	ð\Í\ÙÉ©¿lIA»)µ’Š\0€4p~1µ\í*Á~Þ”“\Ú3±}?\ÝÎŒÙ­ª\0 r¹<4Ž…T	:ªH\ázK,§¶d\äÈ‘U€ƒ\Ô\ÖÖ–\Æ\Ò\âV• £ô&\ì\ÌÔ¶¦öF¡P¢\"\0‡(\ÍV†\Ç!*AM{ú\Å±—z\n\Ùo¨@÷\ÃöË±Ã‹J0zô\è¤¾0·z(Ï¢!C†|XU\0\Z \rª§¦™\í&•hú~0¡z\é»×†\rö9h\ì \Û\å\ÞR‰\æ4|øðÏ¤\çuk\ÞtMS€\ÄYR{S%šK{{û)`\ï‰+>¥Û»O8\á„?P€üf¶\ç§öºJ4r¹|qu&ûJj«\"\09+\n\ÅuGUb\à‹m±)\\\×\ÅIL\Òó~¡Š\0ô\Ü\Ìvrj\ëTb\à\Z1bÄŸ¤\çøþ\Ø\Ë8½±úI\ìu¬*\0=(–\Ólg­JL)\\¯ªžbñù8~VE\0zg0¾,\rÆ¯ªÄ€{ubznßˆ3@¥\Û3T w\å+cG•\â\Ü\Å)`©ž˜\â‡qncU\èý™m,3¾¤ý\Þû\âj<Õ}:®Ò£$\0}D\Z˜¿Ú‹*Ñ¯\ß0…M\éyÜœ\Ú\èc\Ò\èº4@ÿZ%ú\ås÷g©-¯^þ\îúA®1\Ðgg¶³R[©ý\ÇÔ©SK\á:\'–ŒS\Ø.=\å”SŽV€¾¶³S{V%ú\Íóujjo\Çù¬\Ë\åòP\èƒ÷M©=¥}[šÁ~\"=O\Ï\Å1³±]E\0ú\× þƒ4x?©}\Ó\àÁƒ/•J·\Åv\Ùô\\=nT€~&\rÞ·\Æv?•\è{\n…\Âøô\ÜlsW·´´|AE\0úo\ØÞ–ôGU¢\ïhkkû›\Ö\Ö\ÖU©½“\Ú\å*\Ðÿ\Ãö\')lV‰Þ—f¯L\ázGõ\Äó\Ó\çR€¶?‹m*Ñ»ªW_Ú™ÚšB¡p¼Š\0¬A>fR÷«D\ïˆ`€MmGj“T``†\í=©ýJ%zV,—J¥\ÕSÌ‹%dU¸a;?µ_ªD\Öüò\ê\ÎO«R\È~JE\0þÀ¿0µ»U¢Gf³_ˆ\ÃxR½·¥\Ûq*\Ð<a{l·U‰üÄ‰(R{0NLQ(~\'ªP€&R=+\Ñ\ÏT\"·733ª§X\\\Ù\Ö\Öv¬Š\04\ç¬kIšmýX%\Z²\Ã\âb\é\Í\ÌÛ©R€\æ\Û\ÇbiS%\Z#.w—Böñ\ê‰)nŠ\Ë\á©\n€\Ø\ãi\æu‹Jt\Ûû\âr…±]6.\ìvW\0jaÁð•8t…B\á\äT\Ç-)h7¥VR\0:†\íS±Ü©/½I9&µgb¨t;3f·ª@gaûlšŒ]¯®¥¥\åý±ôKÆ±ƒ\ÙÈ‘#?ª*\0\ì+lŸKñ]•8\àz™\Ú\Ö\Ô\Þ(\nCT€ýJ3´\ç\Ë\åòµ*±o©FÇ¥7%/\ÄiS\È~CE\08˜™Ú‹©}[%:7zô\è¤úÌ­Ê³hÈ!V\06l_J3¶«T¢\Ó\ÚL¨^ú\îµaÃ†}NE\08\Ô@Y],¯P‰ÿ5|øð\ÏD]\âb\î©6\ÓT€\î†m\\¸üR•4¨½½ýˆ¸¾o\n\Ø=q%¤N8\áT€F„\íZ³·\ÊPWg²¯¤ö·z\0\Ûu©Mn\Öÿ?¶Å¦p\Zl/\n\ê\04\\\\\Ì<…\ÌE\Íö1\âOª\×òSü$ö:\Ö\0\ÈkfûF\n›óš\ì\r\ÆU\ÕS,\Æ1\Æ\Ç\é\0\ä*Î›)x\Æ6\Ãÿš‚õ\Ä´o\Ä \Ò\íž}\0zjf»q Oœ»8ýŸTOLñ\Ã8·±g€žœ\ÙnJt\ê\0ý÷\ÞWã©†\ì\Óq•\Ï8\0½1³\ë°~y ý_¥ßˆ7›S\á™ 7\Ãö\í\Ô\Êh¦þg©-¯^þ..\è\Z³\0ôz\ØnM\á\Ô\Ò\ßÿ©S§–\ÂuN,§ÿg\é)§œr´g€¾¶\Û\n…Â—úùÿpju†þV¹\\\êY ¯\ÕöÔ¾\Øÿö4ƒýDúÛŸ‹cf]&€¾¶;Rh}¾?ýÍƒ>¼T*\Ý\Ûe\Ó\ßþ@º=\Ò3	@_Û)¬þ¡¿ü½…Ba|\n\Ø\íqšÉ–––/x\èkÁº*µ¬“Ë°\ïT\ÛÆ¸\Ô\\_û\Û\Û\Ú\Úþ¦ú÷\Ç\ßx¹g€>©\\.ÿka»·¥Y\ã-}\éoN³\×¦¿\ëŽ\ê‰)\æ§\Ï?\ä™ ¯\ÏnWv´±\r´/\Íj\ã\Ò±\Ì¸/\n\Ç{ö\0\è÷³Û¾2«`€·R›\äY ß‰K\Ëu¶Ý¶·gµ±Dœf\×ª\'¦˜KÈž-\0ú¥8‰E\'a;«7ÿ¦\Øé©ºóÓª²Ÿò,\Ð\ï¥P{µnùø\í8vµ—f³_ˆ\Ãx\âLV\évœg€#ì¨º£.\é\é\ß\'¢H\íÁ\Ø)+Í´\Ô[a\0y\Ïn\×F\Ø2\ä\Ã=ü{gT\í]\Ù\Ö\Öv¬g€¶#†š\Åsz\è÷\r‹‹Ä²uÌ¬=\04ƒS\ËR›–\ç/‰\ËÝ¥}¼zbŠ›z*\Ü /\íž\Ô­\Þ\æ¸\ïK\á:;¶Ë¦\Û\'\ã\Â\î\Ê@³m-`\'5:p…\Â\É)`·¤ Ý”ZI\Éh\æ \Ý\ßý%\Í^I\í™\Ø*\ÝÎŒÙ­’ h\ßûøAŸ\"±¥¥\åýqº\ÇX2Nm\ÉÈ‘#?ª\Ü\0\Ú\Îô’ršÅž™\Ú\Ö\Ô\Þ(\nC”\Z\0A»¸»÷7\Ã-—\ËÇ¥Y\ìqš\Å²\ßPf\0\íÁ\ß\îÎ¾oô\è\ÑH;·z(Ï¢ž>)\0„ \íøý{g¸)\\\'T/}÷Ú°a\Ã>§\Ä\0\Úÿ\r\Ú\Ø+ø»ƒö¿wpÇ¯«l\Ã=ê¨£®O»:.\æ^,§)/\0‚ö½Aû\ì ßœ-\ê\Ù}n§_÷|`\ê‰\'ž˜ý\Ó?ýÓ¯O8\á„?P^\0\í{—Ž¿[\r\Ðl[´µ6³ö`\î ü\Î4\0ý:h»\n\ÒúÀ\Ý\ß\ã5\r?\Ó\0„ \Ý_\àv€A[ÿ{v\\\0\íîŽƒÚŽ;I\é´¸´5–”h\nGWCrùA~\ßa\ÌhwT\ï?óª\ß{´§€f˜\Ù\è’n£g¶—y\n\0h¦À\í©m¶µs\'[B@\à\î\'huo\äCº\0”À\íl/\áFg;b½`\ï¶\Ôú@\ìö¤\êf´Ó•\0\Z|ndA\0ûž\á\Ö\î\ÌAvÕŸú¯s<-\0\ìg†Ûm¬‚\0r\Ì\î^x\0šn†{0Á)h\àg¸²¤<b¡\0 ·nm¯ €·³\ãs€nî¤º uf(\0h°\ÚLvþ W\ï€üf¸­­­™ €U\Ã\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°€ƒum„\ë~\Ú•€C\Ûû\Ûb±8M¥\0 {»~a»yð\àÁ‡«\0\ä4»-•J—©\04&p;\Ûv»Å¬\0rœ\Ý\ÚV\0\ÜW\Íj Gi&;ª.l\'©\0\ä3»­l»5«€ˆ@lj«‡ÿ\ì\è°\ÝvWj¯§¶¸\\._\Û\Þ\Þ~„ªÀ8é¤“>™t~\nÐpö¨úÃ€v‹\Å\å\éö\ïU\0º˜É¦°œ—B6;˜\í¢-6\Ó€:Ã†\rû\\š‘n\ëšgœqF6s\æ\Ì\ì\ÈV¯^mÛ¶-q»nÝº\ì‘GÉ¾ÿý\ïg\ãÆ\ë\ì4Ž[…Â—T€¦{·µµ\í®\Ê.¸ ¤»v\í\Ê\ÔÒ¥K³‰\'v\Ý=Ž\Ç éƒ¶~\Ù8…n6w\îÜƒ\nÙŽ\æÍ›—µ··;\0\Ä\Òq\n\Ú=õK\Æ+V¬\È\Z\á\Å_\Ì\Î>û\ìw\Íp-)\ÐTbg¨úm´´±\r¶‘\â\ç\ÕnlÃµ\Ó\0M#ö:®_:nÔŒ¶³n‡%\å‡T€/Ž£­\ßN\Ûhó\Ûp\ë·\ß\Æòµg€-NXQ¿\×ñÎ;³¼M˜0¡~9y¹g€+¶\ÕÖŸ*\ï\é	Ë–-{×™¦R;Ò³À€‡\à\Ô\ïÕC|Vý‰/\â\\Êž\r\0¤\êE*7kÖ¬¬\'Í™3\ç]§sôl\00P\Ãv}-ð\âŒ=)–¬ë–’\ßôl\00 ¥Û»½vÍš5=\Z¶q\Ümý\åù<\0Ô™\í\ÞÀ«]T §\Ä\ï«ÿýž\r\0|\Øöa€™­™-\0tm¶\0ÿ\Ì\Ö\Þ\È\0s\Ø:\Î\0ò”f”—õ\Ö¤\Î9\çg`\à‹s#\ÇöR\çF€\Å5e\ë¯ú\Ó³Û‰\'º\ê\0\Í#®g›Bo\ë\Ù@¾³Û½;Jµµµe+V¬\È%h_|ñ\Å\ì\ä“O®Û‡T€¦\Ð\Þ\Þ~D±X\ÜZ¿³T\Û\è\ãj\Ï:\ë¬ú\å\ã­ñ{U€¦Q(¾T¿œÛ¨n\Ìh\ëƒ6~Oü>U ÷\ÂúÀ%\åØ†Û¦bm‡¥\ã˜\ÕNSm\0n]8\Æ^\ÊK—.=\è\Ã{&Ožü®Ÿ+h\à7û¥úm¸õK\Ëq¦©‡~¸r.\å\Ú\Å\â6¶\ÉF Ç™¡\êOXQ¿\Ö\Ò1\0Ô‰—\ê÷R\îf{\È\ÎP\0Ð…87\ÍJ­?\ÓÔ´83Tœ°¢\\.ÿ«*ÀˆS;VÏ¥³\Ýõõ—\ç«;\í\â›qQ8×±S0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ð\×ü1tšs‚‰\0\0\0\0IEND®B`‚',1),('7',1,'/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\ë\0\0\0tô«\Å\0\0B\âIDATx\Ú\í\rpT\å¹øS>Tj¯W[®\ãtoo§\ÃuÔŽC?”¦v¨¥EIr–\ÝMb*•BE½P ~\à­^¥\"#¶ŠŽýú+­©\ÊGˆ\\ˆ\" ‘¯‘oB’=ÿ\çYÏ¦\Ëf7\ÙÍž\Ý=\ç\ì\ï7ó\Ì\îžs’lžsö·\Ï{\Îyß· \0\0À«L|ª\Úü\Õ\Ü\á\Ð\ç±ñÿ\Ö|v*¼\Ý\ÓÕ¦ðªÄ¸‰s\ß6;\Â\ÚNxK·›ôÌŠ<Ÿ\ï\ïm\0\È\n‡Z\Í\æ\'+··ŠŒn•¨Q\Ýó\ìÿ…&?·JõŽ\Ä\êv¾Z\ß6in.{\ëžyµ!]8TŒòZ–o\Ð\í\Z[\Ì=þ\í£Ó‘\í\"þ½Q\Û\0dœÿôA[¸ú²d5ñ\éšH%öŸ\Ñ\Ûý\æ\å÷e»·ÿµÝ¿*¶™\Ñ\Û\É\ë)[5f¿¾\ë”UñmW\Í\0Ø†\nGš ZE}p–\Ô$&/XŠ4\'þ¾&4\éy\í›‘\Ù\ÓQamõû´Éº~òüºv]¾\æ`¨qñ\'gš\É8\0d‘\Ï@­¾&‰œ\"\ÂR=ðÊ†v]6ñ÷+Lk»[&>ý¶Š\í–\è\í¤iª\Ëvku\×ñûž/¨•^Dx“\çÕµ\Ó€¬ððk;N[\Í\È{£+6½\0©\Ü\"\ÛZ\Ûý\Ç\Ù\Í\Õ/„¨\âŠ\Þ.ò|Î’½\'\ÃË¾\Ýq\0\Ètµö•\í\Ï4[Ò©\Ó+œ\Ón>c	¬\îž_\Û>û¯´ý«WluS¼\Û&†¨R{fUû\'\Ç\Íý\Övÿ©Þ¬×ž4Í“¸\"\n\0Y\ÛOUJZuýÏ‹[U\\O½±£õH\Èüd\æŸ?lÑ¦¦ló´Ä¯;ª³ß¯ýú\Å÷\Ú½pýWE\ç®Mú}XŒ£\ß\ïW6?mš;¼ÿùQ\æ¯_®?c]8xš\Ì@&Å¶V\Ìõ‘<þ@E>w¦÷²EÝ£&Ì¯\Û}\æø5ûZ\äù/\ïyvE(\Þ\ÅaK\ì\ïû•H0|e5\æ÷‘y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0°\Ó4/\\²d\É\ß\çÎ{|Îœ9¡{\î¹Ç¬¨¨0G\Ze–••™“&M2§OŸ~fÖ¬Yû&L˜ð+2\0ŽeÿþýÁ—^z\é\è/ùKsüøñ\æÿøGów\Þ18`ž:uJx5Ïœ9c666šk×®5_~ùeóŽ;\î0\ïº\ë®\Ðý÷ß¿\Ò\ï÷÷\'‹\0\à”\n­uuõ¡»\ï¾Û”\n\ÍÜ´iSX`\ÉR__oJugŽ3Æ”\ên€œWiÿû¿ÿš8q¢¹a\Ã3¶m\ÛfJ\Ó\Ôü\Å/~qPš®’]\0\È:ÇŽ›0}útó©§ž2=jÚ6Yõ÷\ÝyçŸ\Ó4€¬Wj*µ\Ç{\Ìlkk3\ífÞ¼yZ¹}VXXx\Ù€Œ£\çÔ´ù©•U&¤\á\É\'Ÿ4KKKw“q\0\È8z¡@Ï©\Ù\Õü\ìªYz\Çw„¤I:‘¬@F› zõS¯|f½ \Û9\ß\0C\ïS\Ó[:²Éƒ>xfÔ¨Q•d\0lG{\èÍ·Ùª\Ö\"lÝºÕ”Š­•	\0`;Ë–-û§ö(\È\äƒDTTT´û|¾1\ì\0°\íû©Ý¤rÁO<qRš£µ\ì\0°\íÐ®}?sÁ\êÕ«\ÛDl{\Ø\0`+:J‡vh\Ï‡\n‰\ØZ\Ø\0`+:\äPd”Žl£\êu\Ø#ö\0ØŠŠ%— 6\0°[o½5—[±€\íü\êW¿\Ê\Ù9¶\Æ\Æ\Æ3œc\0Û™1cFK®®Š.Y²¤‘«¢\0`;<ðÀ\î\\\Ý\Ç6}úô\îc\0Û™0a\Â\ÏuŽ‚\\ô<\Ð.Uô<\0€LÉ­=\Û}E\ë\ê\ê´J_Q\0\ÈÓ¦M{ûñ\ÇÏª\ØÆŽ\ÛÀ\è\01t’•\Ûo¿=¤3Keƒw\ß}÷VkŒ\Ç\0å®»îš®ƒMfzÝ“\'O¶3Œ \0Y\áŽ;\î8ð\ÄOdòBBHþF£\Ï\ç\ÛI¶ +\è‰|©\Ü\éD\Ç›\Îÿ©Þ·\Æü¢\0u¹;¶ñ·¿ý­y\â\Ä	ÛšŸw\Þy§^,\Ø\Ãy5\0È™\Ü\Ê\Ê\ÊvŽ7.´q\ãÆ´/\è95m~R©@\Î\Ñü¥¥¥m3f\ÌhUÁ¥\Ò<]·n]“ž³³®~r¡\0\0œƒVYRmýU«®òòòÐœ9sN®X±¢­¡¡¡]\ÇS‹ŒÒ¡Ú—.]zH»IišÞ§F\Ó\0ˆªL¢Jb·\ÈN\ç+0£¢EÏ¡I\Ôi7)z\0€›eg\"1\0ðœ\ØJJJ.&\0\à¤\Ù*//¿ŒL\0€§\ÄVQQñM2\0^jŠ\êl\î\É\0xIlmÁ`ð:2\0^[«aƒ\É\0xIl-\Òý1™\0\0\Ï R;F	\0ð’\ØNƒA™\0\0/5EkW+2\0^ªØŽŠ\Øn\'\0à¥Š\ís‘\Û\Ýd\0¼$¶f‰\Éd\0¼$¶&‰id\0<ƒ4CÀd\0¼T±\í“x„L\0€—\Äö©\ß\ï‚L\0€g©\í’\æ\è3d\0¼T±m—X@&\0ÀKb\Û*±L\0€—Ä¶9ü™L\0€—Ä¶A\âU2\0žÁ\çó­õûý¯“	\0ðRÅ¦$/&\0\à%±­”XN&\0ÀKb[®r#\0\à%±-\Ñ\æ(™\0\0/‰­Rb\r™\0\0\Ï`\Æk~¿ÿ}2\0žAo\Îõù|	\0ðRSt¡v«\"\0\à%±-ÐŽðd\0¼\Ô\'MÑd\0<ƒ\ß\ïR*¶\Ýd\0<ƒTk\éð\àd\0¼\Ô}@\'t!\0\àt\ê=‚L\0€—\Ä6Y\'M&\0\à%±M¦\èa2\0žÁ\ï÷“8J&\0À3†q«Tm\Ç-\Éõ—¸¾¨¨\è*2\0n©\ÎúK³ó¤ˆ¬U¢]\ÂL5d\0\\ƒH«¶¡i„F}9™\0WUm]UkŒ\Í\0®”Û¢Db“¦\ê\02\0®¬\Ú\âc©­\';\0\àZtTX±ƒA™\0Wc]!ˆm\0/4I\'FÄ¦\Ï\É\0x¥j;ªb#\0\à¬\Ñ=\0$‡iš\ç\íÜ¹sO]]¹|ùrsÙ²eD¢ªª\Ê\\¹reHbG@ŽQ©\Õ\ÖÖšfKK‘F455™555!‘\ÜŽ,€¢•\ZR³WnRÁµpd\äm~\"${C›¦Y\09D?„\È±\ä¥ØŽ~ÀÜ¹öf}\ÕoÂ¡\Ïu\"Cl\0®Û±\Ãû\Ì\ÍK¦›ß¸÷¬\Ðeº™!6\0×‰mOýë¤‰½õ•\È±¸Ol[\ß~4¡\Øt2Cl\0®\Û\æe3ŠM\×!3\Ä€\Ø\0\äZlz4‘\Øt2Cl\0®\ÛöUsŠM\×!3\Ä\à:±5\ï\Ûdn^:£s3T–\é:d†\Ø\0\\\'6]\ëv›.Cdˆ\rÀb;}\ÚÜ¾z^\çf¨,\Óu\È±¸JlÚ³\à£UO\'<Ç¦\ë\è}€\Ø\0\Ü!6©\Äl¯6?X|B©EB·\Ñm©\Þ€c\Å\Ö]•Fõ†\Ø\0\\\'¶dª´®ª7Ä†\Ø\0\'¶žJ-ˆ\r±8ó\Ø\0\Ø\0b\0Ä†\Ø\0\0±!6\0\ÄF 6\0\ÄF 6\0Ä†\Ø\0Àb“_\ÑeDos\Ã\r7œõ³ú:z»\Ø\ß×·o_ó\Úk¯5\Ý6[=bðP\Å+©x²Ú°aCx\Ùúõ\ë;	0öw\Ô\ÖÖ†Ÿ_q\Åˆ\r\0œ)¶\ïÿû\æ˜1c\Â\ËÆ~Ý•\Ø\"¯\Ï=÷ÜŽ\×\r\r\rfyy¹yþùç‡—2\ÄÜµk—\Ù\Ü\Ü^6`À€³þ¶¾\î×¯Ÿ\Ù\ÔÔ„\Ø\0›ýb«¬¬7/7m\Ú~\Ô\×]‰mÅŠ\á\çÃ†\r\ëX_QQ^¶j\Õ*sË–-\á\çƒ\r\n¯›8qbøõ[o½~½t\é\Òðk]N\Å€\Ø2\"6}>p\àÀp¥‰*´\è\Ðf\èŽ;:\Ök•»M\ïÞ½¿˜tfûöðó›nº)üZõµ.Gl\0ˆ-cb[°`Aø¹>v%6}>yò\äðóo¼±“ØŽ9÷=…\×Gª5}\Í96\0Ä–Q±u·.úõ±c\Ç\Ìþýû‡_G®ŒFš¢S§Nûû\"\Í\×\È\Ïi“5™¿\Õ\ÝûDl\0ˆ\Í±i<ô\ÐC\á×ƒþb*À\æfsüøñ\æE]÷ªª†\Þ\"¢Ë¾û\Ý\ï¦ô·\0b#\0bCl\0\ÐcF\Z\Õ\àóù¶ùýþEG}9bCl\0n\ÛF	3:Dp\íòxJb·Ho±Ä¬`0x\Ý\âÅ‹‘bp>†aL‰[‚8£WOœ8€³Y](\Òj\ïFj\'À\ão¾ù&2Bl\0®iŽ\îK$5i–þ‰slˆ\rÀƒÁoI3ôy‘\×~‰P©½ý3ˆ\r±8iNŽ°.•P™}*\Ï\È\ã-q¤6;ö\çb\È9………ç‰ \îy­×“ÿò\Ø*±A/Œ;ö\Ë1\Í\Ñ\ã©\éU\Ðx¿±!6€œ ÷¡‰œž–ø\ÄjbQ-“\Ç\â®~Îª\äBcmƒ\Ø@Öª\ìzƒ­\È\ë3KN\rz~¬¨¨\èªdGqqñ\ä\çËº\Ú±!6€Œ1s\æ\Ì>\"¡\Û%V‹\ÄN\ë\rµ\Ú{ <PRRrq¦þ.bCl\0¶RVVö5=¡/2ûÐº\ïL{üŸ,û¹¬î•÷€\Ø@Úˆ¸®q½,­«˜\Íòúo\×\ç\âý 6\Ä\Ð#‚Á 8\ÌWmô‰\ÄvI<Q^^~Y®ß›Û¦¶Cl\09¢¤¤\ä+@\à~‘\Ø\"³6‘\Ø‰uò|‚¬;\ÇIïµ¶¶¶½±±!\Ù{÷\î\Ý-bk\áS\0ž ¢¢\â›\"²ù{õ–\Ù‰7Dp?uòû®®®~¸¦¦&tð\àA\ÄdƒÔªªªZ%\æð‰\07Wf?1\ãŸ\"²#\ÖýeûDfÏ‰\Ü¸\éÿ\â,©2ŽkÊ©¡7;ùýYÑ‚\ÔÀ\";G¤u·\ÄZù µh3Sb³Ä´¡C‡^@†2×´W±‘	\0›\ÐüR•ýNd¶ÓºQö„|\ÈÞ–\Ê\ÌOv²\ÃÈ‘#/ÕŠ˜L\0¤Aii\é÷D`•\Ó!Kfòü©¾Mv²uþ±¤H/©\Êny\ÕZ7\É\êÍ²\Û%Ñ›hIOn	W\ë>!\0Ý Ý”t\ÄùÀlµDvZ¢NZ˜\ã´{rzó²\ì›V2\Ù@ù€¼ qÀºQö3yþw©\Ö~Hv½\ß~¬k\È€…H\ëfùP,•8fÝ’±[bnWSÒãš¢#õ™€¼E[”Ád‰\r\Ú|Ñ\Ê\ì}];#¸¦)ZªW£\É\äeeeWhfUc!«:[¢\Õ\Z\Ùq?:œ“}N&ÀóXƒ(þ]¾\Í[£d\Ðógz\ìx®b›¨û™L€\ç\Ð+•RýB¯\\ZW0õJ\æ½²©óh’!\ï\"ûý>\Û!2^ib~M\Äõ˜\ÞS¦#\Ê\ê$¿+õž³‚,\r\Ä¹GGÖ¡\Ñ\É¸–`0x\Þ\å/\ÑhÝ’qHžÿEž‡\ì\ä­\Ø\×QS\È¸\nW@û_Jœ°š˜;\ä@ž£}\ÉDf\è\"\àht$9P§[#c´Y#e¬‘¸\Ói1‚#Ä¶@OG	pEEEWZ\è>ë–Œ\Ï%*õ®r²Ýˆ\í%½PD&À)\ä0‰7u4Yë–Œ=òø¬Ž\Ö@v Yt²\ížL@N(,,<O\ï9½§\ãü\ë]ÿr@n\Ò\Ëõ:X ‚Š\íuÜ“L@6«²¯Ë÷¤Î¼d51K,—±„\ì€M\Ç\ØHšL@¦¿Au™WuNL«‰y\Ð:r\rÙˆ­F¯š“	°›^r`\Ý&±*j F½ü\á\áÃ‡_Bz \Ãb[­U™€´QaIeö \nÌº\ë_…¶Z*´1\ÄYn!¬3\ãdz„5óB‰«‰ù™P¯I&;ÃŠm£\ÎAA& •ƒ¦X¢\Ê:\é¯2ûD¢§ô¢\0\Ù‡£[ô.™€„Xs4Nµ¾u \Æ3ò¸^ª²Iz»Š\ícˆšLÀYˆ¸¾!\Í\Ìyrp\ì±:–•\Ç\Å\"³\ád\\ ¶O´¿(™\0=\á:Dol´º.isŸˆ\ìy\í\ÚDvÀebÛ§\ÃW‘‰ülbž#\"/ñ®„v*o“ƒ¡^*µ\Ä.›^ÌšE&ò§*\ë¯cU\É\ã\ÇÖ½e\'\åù\nü¢€Á…ˆÀ\è\r\àÑ³ˆ\é˜|\Ú-\ì\ä\Ö\Ð?¦D“\È\í\Ïò8ˆ¬€Ä¶\Ø:®;…u’^ðjaúDo—\è&Y\0/¡§M¬\Â\Í.b\r™Bl\0n;®+»›6W\Ébp[st€u%?ž\Øj\Èbpë±½&\Þ96Î­¥ˆiš\ç\íÜ¹sO]]¹|ùrsÙ²eŽ\Ý\ÙN{OUUU\æÊ•+Có8ª §ŸÆŠ\Í\ï÷¿HfRD¥V[[k666š---D\Z\Ñ\Ô\Ôd\Ö\ÔÔ„Drs8² &\é\Î(±¡\Ë_\ÐJ\r©\Ù+7©\àZ8² §ÿ(Jl!#=@›Ÿ\É\ÞÐ¦)G¤y®­A\Å6r\äHÎ­õý\"#\ÄŽ[™H\Íd2 ‹\íø\çÌkÿh\ÖWý&ú\\—!2\ÄaŠ„GôÍ”ØŽ\Þgn^2\Ý\ÜøÆ½g….\Óu\È±\íRI¬·‘[&Ä¶§þõNR‹\Ä\ÞúJd†\ØÀ~©Ed6\r¹eHl[\ß~4¡\Øt2Cl©u·\Ò\Û\æe3ŠM\×!3\Ä“Z\ìúi¤\n±!6ð‚\Ô\nh–f@lz4‘\Øt2Clq©EË­\Ê\Í±m_57¡\Øt2Cl©Eÿ\\;•[šbkÞ·\ÉÜ¼tF\çf¨,\Óu\È±AÖ¤\Æ97»Ä¦±k\Ý\ÂNb\Óeˆ±A\ÚR\Óy:ž+\è~¾Ž\Ø\í8ç––\ØNŸ6·¯ž×¹*\Ët2Cl–\Ô>,ø¢—Á‡]\È-\ÑvTn=›ö,øh\Õ\Ó	Ï±\é:z 6\èqóó9KVfr‹–Z$\æ\ÛØ¬\Í#±I%v`{µùÁ\âûJ-ºnKõ†\Ø \åsjñ¤-·\î\Ö\Ð,MRl\ÝUiToˆ\rl‘Zwrë“¤Ô¢ÿWK‰-™*­«\ê\r±!6H¹™On-)H-Vn\Ó[\Ì³§R‹b\ë^l:›=Ÿy¤–„\ÜR‘\Z\Í\ÒnÏ±›\nmÔ¨Qµ\Çù\Ü{š\Ë-!Õ§øs}\âTj-\ÖòTXlý\ìåˆÈ˜\ØTh>Ÿ\ï¯\"´6k,û6>û™GG -//¿¬¨¨\èJ\Éù \ÙCÀH\Ã0n•\ç\ã\åqŠ\ì—Ysdù<\Ù\æg@Ö½.Ë–Y_Bk\äùy\Ü*±C\Ö\í‘\×\ròxH^®_R§$Z$Z%\Ú#óƒ\Êvf\n\ÍB»+¶\ÙTlD\Æ\Ä&€\Ù\í±Óªyý\Ø\ÒÙ•T\è\ßÁ|[$òC‘\ÇYV*1N\ây=C>üI>\æ\Ê\ë?\Èó?\Éó¿K,‘\×+\äõ;òø¾<\ÖË²%vK\×M²ü°<?&\ÏOÆ“JT„¬ü\ë—\ÊKB*£#\Í\Öü{¬Ù¡>”\ÇMk\åùÿIT\Éûþ§üü\ß\äùBYþ¬¼þ¼\ï\äñ>y}·¬û¹¬+–\ç?.--ýž<”\×_:t\è98\Ç6ˆ-£b“~¢õ¡‹7³wF\Å6s\æ\Ì>Ã‡¿¤¬¬\ì\nù^-\ÂÁò7‡\É{ò\Ë{\Z£\ïM^OS\é\Ê\ë§\äùyþ²l÷š<S\âm‰:‰÷$6Ëº\äñ‰}ŸÉ²£òxB\â´%Œ6\Ü7Þ„¿©\Èó\Ó\'¬ŸýLž7Z¿s—õ76[sµ¬«\Ö÷¢\ïIß›\ÄsOÊ²‡­÷®ù}:§þú¿\êÿ,\"½Xs\à’smv^\åf]Ä–9±YM³«\æƒOÈ‡s¾VZhu Ï—K¬’\×\ë´z\Ð*Bž\ï’\ç{\åùA«\Ê8iÉº°T¬ª¤SµbU1­–€T´Ç¬j§Ib¿U}¬U‘VG–\Ðj\äõb­ž´Š’÷õ¼<Z\â­²´\ÚÒªK^d\Ýpyþ­Ê´:±|MžŸCC8©«•v\Ý\ÇV\Æ\ÕPÄ–\r±%$>)hk«žÇ‘\ç\ï\Êó•Kõ<ž\ï\Ñó>²\î\Ê\ãz>H\Ï\éù!\ÉHž\ßl\ÍC9H\Ï#9òÒ±c\Ç~™#Û‘L‹SQ\Ù\Ùó€‰º[æ›¢\ÚLŠ™\Õû¬`†ï¼­\Ü2\ÑW©¹Yl‘o,7]<°*ªº\Øf¢T]\×s\æu\å-·ùÉ\î½÷«\Ù!¶‚ø—¡Ï’ÍªU«Ì«¯¾\Ú<÷\Üs\Í~ýú™W]u\ÕY¿£»õ^[©\ÞX·´#6*·4Ï‰!µLTl‰s\å•W†—oÚ´\Éljj2\'L˜\Òz/‹-BEEÅ…zb¾¨¨\è*Ž@*·‚ž ‹Ô²)¶¾}û†—oÛ¶-\î\Ïu·>ö÷&z‰o}\ë[gý®\Øõ‘ªð\ÒK/\rÿ\íþýû›¯¼ò\n}EÁ©\çÜš\Å6dÈðr•È7\ÞhÎ˜1#\\™%»^\×õ\îÝ»[±-Z´\Èü\Ç?þ~>t\è\ÐN\ëU^»v\í\êxý\Â/t¼þ\êW¿Š\ØÀi•[2\ÍÒ².\äFl\r\r\r\æ}÷\Ýg8°c›Áƒ\'½^_\ëù·\î\Äv\êÔ©pDª²x\ë\ã½Vifº)‹\Ø •[\äœRË…Ø¢cÝºu\ÕY²\ë£_G\Ä\Õ±%û\Z±\ä\ïþ7È¦\Øn¹\å³®®.ü|ýúõ\ám´:Kv½6u\Ùö\í\ÛÍ…v\Ù­¬¬L\ØM\æu¦$ˆ\ØÀ¹…%Ö§OŸ\éô(È½\ØFŒ–“V]Ú¤\Ôf\æ†\r’^¯\ç\Â.ºè¢¸·’Ä»8 RŒwñ\0±\ËÏ¹…z÷\î]c†)r{””dIlbƒŒWnfIIIH»Ê‘Ä†\ØÀ+\\n\r\\0ŒT 6\ÄžAG‰\Ñ1\ß\ÈbCl\à%±\í\ÓQ]\ÈbCl\à¬‘ƒ_!ˆ\r±—*64a9™@lˆ\r¼$¶Wu\0R2\ØxIl:ûn2\Øx^\ç¸ ˆ\r±gfh‰N\ØC&b/5E¯\Ñ—\ÉbCl\àt&û|˜\\±!6È¿ªM\'ú:™@lˆ\r¼$¶3:\Ó™@lˆ\r¼$¶c·“‰X¾|92Bl\à`|>_ƒ\ß\ïL¤@mmm{cc#B²)ö\îÝ»[\Ä\ÖÂ‘6VlJ¼@&R ººúáššš\ÐÁƒ“\rR«ªªj•`\Â\r°Slu:-™Hù Î’*\ã¸6¡ˆ´¢©\ÝH3ôu‰ud\Â[\çŽ\Æ\Þ\Ç#¯\×\è²\â\â\â‘dò\à30_Ž÷d\Â#y*0\r\Ã0n\Öe………\ç\é\Ø\Öò²y\Ð.\ÑD&<@EEÅ…²3[#b‹Œp \ß^s¢–™R¢O$[\àq±•I\'\ÞØ™•\Ñ\Óƒ\×\Éãž˜\å-*A2^E¾¼¯—/ôV2\árF}yTs³#¤iº&\Þr=\çF\ÖÀ«”••}þ¢@¾\ÖÇ‘—iõ™‹·¼\ã€G[0\æð\á\Ã/!.Eû\Ä%’WW!2<IöÀ\Ãbk---ý™p\ïl\ê‰Ø¬¨$ƒ\à\ÑV\Ì	½ˆ@&\\ˆuq Y/XWD[“™vÞ£\ÍW¿ß¿ˆ,‚‡¿ð§“	\ï|S=«7\'Š´f\Ëó§À\ïD€·\Ë\ëþòšqª _Ä¶Co\Ô%\ÞÙ¡/IlI°\î´a\Ã\Éx\íR¥]«È„wv\è\"‰÷ˆM›­S\É\äA\Ëe±v†\'Þ©Ø–H¬N°\îc‰d	ò\àsð‚_D&¼³CWJ,O°n•|“-#KŸƒ‡%	\ï\ì\Ð5‰n\ã±Õ“%ð:~¿œŽtC&¼sn\áX¢o16™,Aˆmˆ\Ä2\áú‘a\Ï\'›Žzp‚,×±úO‡È„wš¢»õþµMÑ«™%ò\è³`\ê\Êd\Â;ó@¢zfÎœ\ÙGwöØ±c¿L¦ >\íòe>\Ø\Z\ÆhŒŽMÈ]\îÝ™‡ººWMÖµ\Éþ™/!\Çô,9¶7Jì·º\r¶Ê²N\Ý	É”{\ÅvD¾¡\Æw±ž\ÉdÁsHeö\Ó\îúI\Ó7\Ú\Ýb;!;°´‹o¶½Z’“)ð\à±_\Ù\ÍP]È’{w\îi‰a]¬\ß`\Ækd\n¼†ô`\Äh•\ÚN2\än±µ\ê\É\Ò.vþ\r^E\ïH0bô²\ãn±µ\Ë\Î\ØÅŽF¶ù„L‡?\r±\rt\ZJ2\ã\î\Z\Z9r\ä¥]Tle›\Ï\Éx¸Iz}\Ì|ü\à±™]};iWÙ†®&\àõ\ÏAÇ…\î]s9z\ãmwÓŽ\é\Ì=LM^Ge&_\â\ít«ò\0\å\å\å—\éð\ß\É4We»o1ð2\Öùd\Ä\æ90™¾ ²Í©@ 0’ŒA:˜¦y\ÞÎ;÷\Ô\ÕÕ™Ë—/7—-[Fô ªªªÌ•+W†$\æqT\ÅÁ:iÚš„\0uŸid\ÒA¥V[[k666š---D\Z\Ñ\Ô\Ôd\Ö\ÔÔ„Dr\Ü<‹NÔ¢7\è&Q±}¨C\'“1H­Ôš½r“\n®…#«s\ÅVª\Å&!¶•²]5ƒt\Ð\æ\'B²7´iÊ‘\ÕYl\ãµ|Û½,\Ûm%cú!DFˆ-M\ÑûtØ¢$Î±Í’h$c\r±ÿü€¹s\í\Íúªß„CŸ\ë2D†Ø’\"Ù™y¤bó\Ëv\'\ÉdZl\Ç\ï37/™nn|\ãÞ³B—\é:d†Øº\Å\ê\0¼»»\í‚Á\à·\"²!¶=õ¯w’Z$ö\ÖW\"3Ä–\Ô9¶?\èd.Il\ÚK{:ô²™\ÛÖ·M(6]‡\Ì[2MÑ¿HÕ¶)\Ém[\r\ÃL\Ö “bÛ¼lfB±\é:d†Ø’‘Ue²c­Ie\×\å\â\0ˆ\r±9\å[µÞ£–¤?±=I\Ö “bÓ« ‰Ä¦\ëbKFVu\"·\ÅInûž4EÿA\Ö “bÛ¾jnB±\é:d†Ø’i^¾Ÿ\ì|²\í\ë*7²™[ó¾M\æ\æ¥3:7Ce™®Cfˆ-™*l‹\ÄKI6[õÖO\É\ZdRl\Z»\Ö-\ì$6]†\È[²\ç\ØvyIJðN½€@\Ö £b;}\ÚÜ¾z^\çf¨,\Óu\È±%#¶½\"¶Ç“lŠþ ™!Ž\0z*6\íYðÑª§žc\Óuô>@lÉˆ­Q\Ä6#™mõ\æ\\kˆð^dl›Tb¶W›,¾?¡\Ô\"¡\Û\è¶Toˆ­«*\ì°\ÎB•\Â9¹ö¢¢¢+\É\Ø%¶\îª4ª7Ä–2:¢\Äm)l2ú\È\Ø%¶dª´®ª7Ä†\Ø\â‰\ê”Dq*MW\Ù~&™»\Ä\ÖS©E±!¶xM\Ñ3:oh\n\"Üš\ì\í!\0IŸc#›\Í[[IIÉ·S\Øþm\á\n2ˆ\r±9Yl)\Í*R{Q\'v!s€\Ø›“\ÅfJ\Åvq\n\ÛO×©ø\È 6\Ä\æTz¥z_š^h\Ð¤bs$Z©YbKšŠŠŠojó•\ìbClŽDÏ­õDR©6_b\Ë\ZÁ`ð:½*\Ú±)..þÄ†\Ø‡Þ¿¦’\ê\Ø>—˜@!b[ºt©ùý\ï\ß\ì×¯_8ô¹.‹\ÞFþT8n¸á†³–\ë\ëÈº\Øm5úö\ík^{íµ¦›f¬GlÕ£ò3ŸH\Ì%ƒm±½õ\Ö[ašû÷\ï7\Z\Z\Â\ÏuY´Ü¢eµaÃ†ð²õ\ë×Ÿµ<v[}^[[~~\ÅW 6Ÿc£}E{ ¶5†aü“B¶\Å©¸\ê\ê\ê:–\éó\Ø\ê,\"+­\æÆŒ^6nÜ¸ð\ë®\Äy}\î¹\çv¼Vy–——›\çŸ~xù!C\Ì]»v™\Í\Í\Í\áe8\ë=\êk­$›šš[.9M’\æ\èg=h\Â.¹m ƒm±iS1ZB\Z§N\n/S™\ÄÊª²²2ü3›6m\n?\ê\ë®Ä¶bÅŠðóaÃ†u¬¯¨¨/[µj•¹eË–ðóAƒ…\×Mœ81üZ+\ÉH3Y_\ër*¶¡\ã°i§öñw:@%§‹MŸ80\\E\éc¢\n-:´ºcÇŽŽõZ¥\ÅnÓ»w\ï/&žÙ¾=üü¦›n\n¿\ÖG}­\Ë[îš¢sz\"(©\Ø\Æõ¤	®\Ø\"M\Éu\ë\ÖujŠ~÷»ß+¶„Ÿ\ëcWb\Ó\ç“\'O?¿ñ\Æ;‰\íÈ‘#q\ßSQQQ\Ç9>}\Ô×œcË­ØžA\íHõ\çJKK¿×“\ÛD\0\Ò[DzžK\ÏaE_<X´hQ\Âófñ®˜\Æ{}\ì\Ø1³ÿþ\á×‘+£‘¦\èÔ©S\ãþ¾Hó5òs\ÚdM\æou÷>[\Ñ\á‡t–ªTn\ìØ±_Ö›tgÎœÙ‡,B6\Å‘›^(ˆTR\Ú<]¸pa—òJVl\Z=ôPøõ\àÁƒ¿˜°¹\Ù?~¼y\ÑEÅ½ªª¡·ˆ\ÄVˆ-G\èE\0W´‡R\Ô!Â¯\"‹m±E‡VQ\Ñ\ÍLn\Ð•\Ó‰\Õ=ü\Ù\"\ÅR²¹›^8\Ðj\é’K.	ß‚\Ø@\å´Rby\Ï\Ï5ˆ\Ø$‹K±ˆ-ž\Ø\ÖHTöPlõ\"‹€\Ø›£1}þ\ÜC)VI¬\"‹€\Ø›£¦\äG†a<ß“ŸÕŸ±}L±!6§5EwK\ÕöT\ÅvŸü|3YÄ†Øœ&¶=½\0 M\Øòó§\É\" 6\Ä\æ4±’˜Ú“Ÿ=zô\åR\í1D8 6\Ä\æ8±‘Šm|\Z?o\Ê\Ï÷\'“€\Ø›“Ä–\ÖM¶òó-%%%?!“€\Ø›“\ÄvZbXO^\Çr“¸‡LbClN[«ˆ\éúžþ¼\Ï\çÛ©#„I@lˆ\ÍIbk1\rL\ã\ç\ë\ä\ç“I@lˆ\ÍIb9ò\Ò4š¢±m\"“€\Ø›“Ä¦ƒô—FSô1ùû\É$$‹›¦µCl.$2Xdšb¼M\â8Ù„d©­­mollDH6\ÅÞ½{w‹\ØZ8²,\Ê\Ë\Ë/K÷[k&ùv²	\ÉR]]ýpMMM\è\àÁƒŽ\Å\éÓ§]%µªªªV‰9YÿjFLWJÃ‡¿D«>\é\Ê\ï÷¿XTTt%™…\î\â,©2Žk\ÊiL\'¾¯Ñ‚\Ôb\Ð\Û<ôv\Î\Ó}]~×“V‡ú<~®CŽ\ë„/d\ÜDEE\Å7õ‚\Z™p1†a·»ûÐ¡C/°\æ*Ý¦Õ \ÄI¡W;Ì“qpA+\æ\Çr¼ž!\î®\ØJeGž\È\Ô\ï\×¬\ä÷\ß-±^¢Uy|GbŒ¬\î\Å\0Šmó\åº_l\ãµ|ÿž_\çXƒG»qµIl–ªqJ:·›\0Ø‰“3õ|1™pwSTŠ<”#©‘xC¿õœ†N\Ú,ñˆ^Œ`\Ï@+¶ù=™@œõ\íô°4\é€÷qÎ» £ñZökÿÓ²²²+\ØK\åcñ\ïz\ê„L¸û\Û\é)½’\é¤÷¤2S©\Éû\ÚgUrÍ–ô®aA\ÄV«“‘	#MÁ?\èd.N}\Ö=rX\ÍT•\Ü1m¾j3–½\Û\æž\Î\Ú\ÎÙ‰qKv½À \Ztº@½ð`]€\Ðo\×\0{lüL|ª÷d’	w\ï\ÄJ0Ù…o½—^–\×[G¬[HZ­[J\î\Ö[LØ³\Æg¢Y¿@É„‹T\ë\ínÿ?¬Ù²tò\æ\ÖMÁ\êe{½Y˜½)Š\í$­\0÷\ïD\Ï\r©Ý¸´;—vë²®°\îÖ¦E:c\ÎA^}&Z\é\n\èr\äÿ¾”Ý¯yõÿ\Óùr ¾ qP%GG}HBlÌºæ¸E\â¥|ø_µb££>t…žºHw|Bp\0:K ˜—0õ!\ÙÿWË—cz@l{eg>ž\Ï9 £>D0\ãf½ˆL¸_lZ¹‰AGýüEöõ=EA&\Üÿ!>,1‘L$\ÌõóKl\Ú\Ëe™pÿŽ\Ô\ìmd\"©\\\ÑQ\ßû_d/\ê=d\Âý\ÖS\Åd\"5\è¨\ï\Ù\ÏÃ›z~•L¸ÿ\ê\ÊÓƒŽú\ÞA¥¦ûŽL¸ÿª­¤¤\ä\Ûd\Â\è¨\ïúÏƒv\Å{L¸G\ê\Ýø\ß Žú\îû<\ì\×\ê›L¸GšR±]L&2õ]ñy\Ðþ\Åw“	—WV÷nB\Í2t\Ôw&z\ê€\Þ\'.G+5ú\Å\å:\ê;\íN¥ÝªÈ„»¿¾ÁŒ\×Î‚Žú9oŠê©™¯	¯\Ó+wdÂ™\ÐQ?û_*|\Ñ{£\ì¢W\ëÈ„ó¡£~\æÑªXsK&\Ü_vk\Ï2\á\Ê/%:\ê§Á\èÑ£/×©\'µŸtqqñ¬\ÖK@«b²\ãrô\Û^\ï’\'î¯¼\é¨ß£/v­|\Í8¡ËX\Ý\ä\æ‘)—!\ßð“\äñ™ðÔ‡•Žú\É\çª6\Ø\"’\Ï\Çõd\ÊeX\'¦É„7¡£~R\Í\ÑPbc6x—6E\ç\èºd\Âû\ÐQ?\ág`[©µ1¡‹{wª~›\ï ùõÿ…\Èk|<±\é…Ž÷žcxIg©\"yM\ÞwÔ—ÿ»%Fl\r\\]v÷·\Õ\"W”L@„|\ì¨/ÿ_e´Ø¸`\àþºDb5™€x\äKGýŠŠŠ-‰«\Øv±\ç\Ý/¶•\ÚE‡L@wx½£þ\Ï~ö³­*6©X+\Ø\Û\î\Û\Z-\Ã\É¤‚;\êO‘0o¸\á]õzUL\ïk\"\ÐS<\ÐQ_¥úÒ—¾ô~ß¾}\Í>}ú<À^u9ò-û‘aÏ“	°v\ÔKMb–¾\èÕ«\×ô\è\×\àÞ¦\èn\î×~q:¹£þ”›‚\Ü\Ü/¶r\ì=H& ’sRGý\î\äY?=\çN±’˜J& \Ë\Ç].;\ê\'[‘M£rs\ïvD»”	\ÈYî¨Ÿj3S\å\ÖN\å\æ>±±•’	p\î¨\ß\ÓsgS,¹Q¹¹HlzRw™\0§asGýt/p\Î\Íebk¥_¸€t:\ê\ÇJMo;y® û\ÛOb·ãœ›‹\Ä\Ö.\Ç@2n\"…Žúñ¤ö¡„i=ö\êBjñ¶£rs‰\ØB\Ì<n&QGý.¸\àÁ8\Ös–¬\Ì.\ä-µHÌ·±YY›É¸S\à\"õo¾ù\æc·\Ür‹y\Î9\ç<’„´¢\å\Ö\Ýúš¥g\ìØ±_V±‘	ð\áŠ*ŽÔº“[Ÿ$¥ýw¸Z\ê4\Ê\Ë\Ë/\ÓÒL€×¤–„l\âÉ­%©\ÅÊsnNA/\Z\è‰W2y&µ®ä–Š\Ôh–:½\ÍCo÷ \à.·„TŸ\â\Ïõ‰S©µX\ËSa±õ³—³+rŒa\Ãõ]2«Ø’m\Ú]±\Íf8£b+•\æ\è	2y\Øµ\ë[¤/)\ÍP‰M\çS<B& \Ï\äf\çUQn\Öu`Sô>¶ˆL€G\å\ïj¥]÷±•p5Ô™ˆ\ÔÖ&\Éx”iq**;{\Ì!\ÅD‡\×\î\'dò¨YjW_Q¤\æTü~ÿt22yR¹E\Ëm~Ar£{Do\Çýj.iŠþEª¶Mdò¤rK\çœRs‘\Ø*u\Âd2yZ¹õ´9NFªµj\ZL@žUn©H\n©¹°b«¹-&‡•[2\ÍÒ².¸¿\ßÿ¾a¯‘	 r‹»¾©¹³b\Û\"ñ™\0\äÖ©¢£G[‘f\è\Î@ 0L\0rûBb}úô™^@×‹m¯ˆ\íq2yN¸B\ëÝ»wa¦\È\íQR\ân±5Š\Øf	€p\åf–””„tfz\Ò\ábü~ÿa‰‰d \Ì\å:g©|&~@*\\Œ\ì\Äc·‘	€ŽVŒ\ÎSZF&\Ü-¶S\Åd \ã3\Ñ,1•L¸»)ªe÷2\Ð!¶O\å3ñ™p÷Nl+))ù6™\0\èhŠ\Ö\Ë\ç\â2\án±…dG~ƒL\0t|&\ê$–	w\ïD½¼}1™\0ø\Ã0þ)M\ÑwÉ„K‘\×_\Å&Á\Ö\0ÿú\\¼(Ÿ‰É„‹‘f\è	^‡\'\0\á\Ï\Äcò™\ØG&\\N ¡t4]²4EIRµ}F&¼Q~_¯w\\K¼M6 Ÿ	ƒ>ùœ$\ÞÙ¡ß’ªw]o,\è~’\0¯6E¿#ŸV2\á!\Ê\Ë\Ë/\Óþ£²c?;v\ì—\É\ä#GŽ¼Toƒ\"£¢¢\âBÙ±û%š†~	|C\ï(,,<LxŒ’’’st¾Q)Ë2„\är\ì·]I&¼»ƒßµ:\Ê_C6 *¶ùrÿ	™ð¶\Ü\ÞÐ“©t–‡<\Û1½Ç“Lx_n\Ð{\Ý\ä\ÑO6 \Ä\Ö(1L\ä‡\Üfk/‰	d<.¶]R±=C&òGn-¹=L6À«ˆ\Ô6Iü•L\ä×·Y@\åf\Æód<zŒ¯”XN&ò¯r¢$*\ÉxPl—Šm=™\ÈCt\ä]\Ùù§%\Þ!\à±/\î\çDn“‰<EGßµfºúPo\ê%#\à±=(\Çô2‘Ç”••}M×¤cX\r:ô2hŠ\Þ)q„L\ä9\Úa^„\Ý:Ž•v\"&#\àftŒB=\ÍB& `\æÌ™}\ä`ø@‡>¢Ÿ¸¼b»F¯ü“	ˆ>(j´¯]ii\é÷\È¸\àHGø pzs£vÁ2c8\Ù\0—~A›:„™€\Øc®\ÕK\á6².<~\Û\Õ\Óul+©\Ü\î#\à²c÷´^D \è\0¹]¿ýDpO’\rp\Ñq{DŽ\Ùñd\"\Û\Íz\ÎM¾ÿL6À\rø|¾½Q—L@—D¦ø“¦šl€Ž×µk™€n±¦ø;)r\ÛPÀ\à\ìŠm½ˆm™€¤\Ð)þ\ä \Ñ)þv1\Å8Xl\Õ:|™€¤±¦ø; C03\Å8´)ú7kòp€\ä\Ñ\Ñ@\äÀ\Ù.Sü+¶g\ä\Ø\ÜE& \'ô¹­\Ñ)þÀÕ¤œ‚3´EA& \Ç\Èô¦Ž\È[\\\\ü#²©\Ø\Æ\èXƒdÒ•\Ûz¯[0ô‘\r\È5:a²\æ@&À¹=¢½\ä\Ûòn²¹DoM\Ò\î€dlÁ0ŒIV,\îú†œa\rž\Ê\ÐE`\"µRkt…drØ‚1\"4ØŠ4G¬Dr¯“\rÈ‘\Ø\Ú\ä8ü™\0[\Ñ)þtø‰:²9›vÿ+!‰\Ê-<ÅŸ<ncŠ?\È&\ÒZ8,\Ç\ÝlÀAoÿ˜#1€Ì€-\èrpbŠ?\È†aL‘\ãK‡*\Ò~Ì§D`!½xm………\ç‘-°³Yú\âO‚)þ \ÕYW™u„ŽøA¦ÀvtŠ?9À6\Ë\Æ`;z¾+±\Ñ32}\0®”o\Ø®XAŽ­c	ªµd²q\0¾j5†‘\r°\í\ÒOlzŽ\ì@V°†–aŠ?°û¸\Ú#¶V.\Z@V\Ñ\áe,¹M%`“\Øh¯ƒ(±Õ\È:\"¶qVÿ\Ò\'\È\ØtL-ŠˆMš§×‘\ÈU\å6\Ò:\çö\nÙ€tÑ¦§Îª¦•Ù€œb\Æ`ù¦Õƒ±Šl€\rU\Û\ÄŽÀ\çó\r”8)$Sü9\Ó4\ÏÛ¹sçžºº:sùò\å\æ²eËˆDUU•¹r\åÊ\Ä<Ž*#Rûº\Ä\ç:W³œ‹J­¶¶\Ölll4[ZZˆ4¢©©É¬©©	‰\ä\æpdy\âO*·‰Æ’’’‹Éˆó\ÐJ\r©\Ù+7©\à\Î\Ü\ëX\'€?–\Ê\í\È\èÑ£/\'#\ÎB›Ÿ\É\ÞÐ¦)GV~\ÐKÄ¶Ž)þœ‡~‘bƒ4&\éb½|o\ÆÉ†»\Ävüó\æÎµ4\ë«~}®\Ëbƒ‚ðE……\ÖpÏŒŠ\ê±;¼\ÏÜ¼dº¹ñ{\Ï\n]¦\ëbƒ‚ð¼[\Å\ÜI6œ/¶=õ¯w’Z$ö\ÖW\"3\Äü~ÿ=*7‘\Üd\Ã\Ùb\Ûúö£	Å¦\ëbƒ³›¥e\Ö\ä\ÌóÉ†sÅ¶y\ÙÌ„b\Óu\È±A%%%?±µ\Z†ñ²\Øx¹Áš\âo5\Ùpž\Øô*h\"±\é:d†\Ø \ß±—Øªó*\çˆmûª¹	Å¦\ëbƒ.°f):$MÓ½Lñ\ç±5\ï\Ûdn^:£s3T–\é:d†Ø ûsn_Á\íÁ5«\è\ÈH\îÅ¦±k\Ý\ÂNb\Óeˆ±A’hSTª¶zmš2\ë·\Ävú´¹}õ¼\Î\ÍPY¦\ëbƒ±\ÕJ´H\"¹›ö,øh\Õ\Ó	Ï±\é:z 6H\Ã0^\ÓŠ˜\â/\Ëb“J\ìÀöjóƒ\Å÷\'”Z$tÝ–\ê\r±A\ny:–\Ä\Ï\ÉF\æ\Å\Ö]•Fõ†\ØÀ¾f\éL•“\æf^l\ÉTi]Uoˆ\r±Aj\Í\Ò_h,yü\ÙÈœ\Øz*µH 6\Ä©Wn\Å:\ì‘To/“žc#d‘\ÚtÀJŸÏ·Œl 6\Äž¡¨¨\è*‘\ÛI‘\Ûú¦øClˆ\r<\Ô,\rOñ\'±ƒ)þbÏ \Óú‰\Ø\Z$2\ÅbCl\à´Zóûý‹Ü˜\â±!6ð½Dl\ï\ézþt 6\Ä^:\ï¶T¯˜\ê•S²\ØxIn/\é½nz\Ï\ÙÈŽ\Ø6l\Ø`ó\ßþ\í\ßÌ¾}û†oºé¦Žõò§\Âý3±\ËV­Ze^}õ\Õ\æ¹\çžkö\ë\×Ï¼êª«\ân¯¡\ã\Úk¯58“=bƒŒ\áóù\æh/©\ÜÆ“ÌŠmÝºua‘ý\×ý—¹~ýúð²mÛ¶™)‰\í\Ê+¯¿Þ´i“\Ù\Ô\ÔdN˜0!\áöµµµ\á\çW\\qbƒ¼«\Ü&[³`\Í\"™[aaaX2K—.M¸M2b\Ó*L_«“ùú\\«»\Èë††³¼¼\Ü<ÿüó\ÃË‡b\îÚµ±÷0\ãV\í</r{–ldFl*•Ì©S§\Ò›Š(\ÒÌ¼ñ\Æ\Í3f„+·xÛ¯X±\"ü|Ø°a\ëµB\ÔeÚ¤Ý²eKøù Aƒx“@ ðS\âO·ˆl8WlZq\Ýw\ß}\æÀ;\Ö\r<8\î9¶H3tÇŽ\ÞGtô\î\Ý±§›¥ƒ¬\ÑxW‘\Ì4E»ú]±ò\Ó\ÇØ¦d\ìy»HõO„“\'O?\×\Ê.öo9r„sl?DMñ·…)þ\ì›^0Ð‹ZA©\"ô|Wd›¢¢¢°tž}ö\Ùð\ë„_\ßr\Ë-\Û\èóºººŽß©\ëµz‹\'¶cÇŽ™ýû÷¿Ž\\4E§Nšô9º®^#6p\r\Ö\Í{tF,\Äf\Ï\íz%³´´4,8mþ\é\ãÐ¡C;\Ö\ïß¿\ß3fŒù\ïÿþ\ïay\è\ãm·\Ý^\ÙfÄˆ\æW¿ú\Õp•¦Õ—6Cõ6’D\âyè¡‡\Îj®677›\ãÇ7/ºè¢³š£ˆ\ròšŠ)þ¸A—¦(x\nmŠj“T›¦\ÚDElbÏ òyŠ?Ä†\ØÀ»\ç\Ý\éz[b#x½×š\ëV\ÄF 6ð’\Üfi,íŠ…\Ø\Ä^j–Ž·ú—\ÎAlb\Ï™\âO‡?Blb/Un\á)þt\àJ\ÄF 6ð\Ö§t\ÈñNñ‡\Ø\ä!:9ŒN£“\ÅxqŠ?Ä†\Ø O±¦ø;¨\ÓüymŠ?Ä†\Ø \ÑjM\'f¶&hþ:b#x…^>Ÿo½ˆ\í¤W¦øClˆ\r Œ\Èm™W¦øClˆ\r ‘\Ú\Ë^˜\âÏ‰\Ó\×!6€b\Æï´—‚<þÂ­ÿCmmm{cc#B²)ö\îÝ»[\Ä\ÖÂ§\Ü.·)\Úy^7Óï¿ººúáššš\ÐÁƒ+‹Ó§O»FjUUU­sød€š¥?W¹yn|ÿòAœ%U\ÆqmB91t†y³Ô©\ï/*Z\Zx\n©Ø†\é˜nRÁ½F6ì£¬¬\ì\nŸ\Ï\"\0¹“[dŠ¿Z²a[5¬}v[\É@‘\êb€Î£ õLñgË—E@\â™\0\È}•\Ñßš‹)þ\Ò\Ûd\Í%™\0p\0C‡½@ª¶½ò¡<”\ïSü¥Y\Ï\Ñ<’	\0‡`Mñ·5ß§øK³b[(b\ÛF&\0œ÷\á\\-q:^G6RnÖ¿!ñ.™\0p †aüC*Ö’’’Ÿ”¿–	\0‡\"b›oÍ‚UF6’\ÎY½\ä\ë2\à`À*7i^\ÝC6’ª\Øv‹Üž\"\0\Îÿ°Þ©r\É=N6ºF¾\0Iž\î\'\0\îhb•X\Ã-$]~	×¾¸dÀ%†ñC°R$·˜l$›\è9„L\0¸if]­SüÉ‡w]G§øKSl\í\ÚML\0¸\âO\ÄvD>Äžœ\â/M±™\äÀ¥\è´~R™4J4TTT\\HF\n\nFŽy©ˆ!‹\0ÜŒV&R¹\íò\ÚiTk:TG€û\é%\æ\rR¹”˜\çb+\Öó\0\ÞùPWIõv\Æ0ŒÁyœƒ	Z½r4\0x\ëƒýŠ6\ÅÀ\È|üÿE\ì³\åÿ?À‘\0\à½÷V¬qùö¿Kµú¼ü\ï\Û9\n\0¼Y¹MµfÁš‘gÿ÷\ß%\Þ\ã\0ð\î‡ü6•›\Ï\ç{&þ\ç•\Ë\Ùû\0\Þþ ³ú—¾š\'ÿ\ïF‘ù\ß\Øó\0G*¶\ïÈ‡]§ø[\éõÿU\ï\és\ë$\Ô\0\"EEEWŠ\àNˆ\Ü6{yŠ?\í‰!ÿ\ãLö8@ž`u7úLbô\êR±\ÍÇ«Á\0yNñ\'bÛ§ƒ1–••}\ÍkÿŸN€£\ç\Ù\Ó\0y†Tk\ç\èôt\"€còø\rUlz‹\Ë\Õ\ìe€<E\ÄV§Žˆ\î\ÛúŸLF:\Ès¤\Ây]d\Ð*•Û\Ýþ¿¨\ÐTl\ìU\0\Ð*g\Õ«\Ô\Íÿ‡5²p;{\0\"•Ûƒ*\Ã0&¹õ÷>\\›\Ö\ìM\0\è@š£w[“3?\âR±ýBo÷`OÀYƒAŸ\Õ\ëŠy–¼\ïƒ\ìE\0\èDqqñô‚‚Ä›nz\ßÚ•Jä¶“=\0‰$ž\âObMK¦ø\Ó\Î\ï\"¶\r\ì=\0HHYY\Ùz\ÎJnÔ›z]\Ð­Î‡Žþ\0&Ã‡¿Dd¡\Ë8ý\ÆW\Ûzh’½\0\Ý2v\ì\Ø/‹0v‰8———_\æ\Ô÷©“G\ë=y\ì1\0H–^zþJ\Äq2~Ë¡b; ñ0»\n\0Rm\î\éy¬3~¿ÿzŠ\ís½½\0)þ¬÷º†q³\ÃÄ¦Wq‹\ÙC\0\Ð#¤b{\Ò\ê¥p»ƒÄ¦7b\ï\0@‘Š\í>ÿLd2\Ý!b\Éû\éÏž€ter›U¹\Í\Í\åû°®\Ü2d\0\ØV¹\é¨\Zm>Ÿï¯¹z:Y\rC€­”––~O\Ä\Ò\"MÁ¹øû:P¦^­eO\0@&ª¦\"™²=ÅŸ\Õ$>\Î^\0\0\Û\Ñ)þ¤jOñ§\ç½2T\r\ß_¦÷Ò=úr]\î—\åM\ì\0\È‘)þT4™˜\â\Ï›²,d]Õ›‡\Ëó&‰i\ì\r\0°\r\rD\Äòa¦¦ø“ß»1Vn1\Ñ©\æ\0\0ì®®Þ‘°}Š?k¤ß„b\Ë\åZ\0\ÈD4•:\"¯4‡\Øü{\'\Ú\É\Â\Â\Âó\È<\0d\Ã0ž·n\ä\r\Øõ;E”³\ã‰M–\'\ã\0­\Ê\íakþÒ‰6þÎ–±\í\'\Ó\0m¹M°\ä6ÛŽ\ß\'\Í\Î\Å1\Õ\Úõd\0²Ž\ÈÇ¯]°\ä\á\éþ®`0x]Ô¹5&r€œ\ÊmˆuA\át×ˆ#>U±†ñS2\0¹n–^£ƒCŠ\Ü\ÞM\ã\×L‘0o¸\á†÷­€#\Ð)þ¤	yT\äöQ¦øS©…¾ô¥/½ß·o_³OŸ>Q\0p\Ö\Új\nSü…¥&1\Ëz==\æ5\0@n±ŠüDûy&1\Åß”›‚\Ü\0Àiô²ú€ž\èbŠ¿\î\äYOx\0p\"¶·Lñ—lE6\Ê\r\0œ(·¿\è½n@`D›™*·v*7\0p>Ÿ\ï)\í¥ð\ßÿý\ß\ëa6Å’•\08‡ë®»nñ\Ï~ö3³_¿~÷ðWp\Î\r\0EXJQR\ë%ñœõ\Ø±\Ûq\Î\r\0œ#µ(©¤>”0­\Ç^]H-\ÞvTn\0\à(©X˜ñ\ä-µH\Ì\ï\æ÷\0\äDj‰¤-·\î\Ö\Ð,\0\'I­;¹õIRj\Ñ‡«¥\0s©u%·–¤+7Î¹@N¥Ö•\ÜR‘\Z\ÍR\0\È(—[BªOñ\çúÄ©\ÔZ¬å©°\ØúY\Ær€ŒTl\É6\í®\Øf³\0 —\ÍQ»Î±Eú’\Ò€œ\Ê\ÍÎ«¢Ü¬\0Y•[¼«•v\Ý\ÇVVÀ\ÕP\0\È\Ó\âTTvö<˜CŠÀ	\ÍR»úŠ\"5\0pD\å-·ùÉ\î½÷«€\ã*·tÎ‰!5\0pE\å\Ö\Ó\æ,\0€\ã*·T$…\Ô\0À5•[2\ÍÒ².\0€‡*·\È99¤\0ž[¼û\ß\0\0\\\'·i)6S\0M¤B«)`”\0ðR\å6j\Ô(©€§°\Ä\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ,\0\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0\Ä\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0\Ø&±Y7qœL€›\ÄVÖ\Ø|>\ß,2\0n“[Sb;VXXxY\0\ÏTm~¿6\0·\Ê-Þ¹¶\ãTk\0à©ªsk\0\à¹\í§Z\0O!Ú˜(±M##\0\à•ª-|®j\r\0\\‰\ÊK+3‰Zë––˜ólm\Íu@`^EEÅ…d\r\0IQQ\ÑU\"«\Z‘Õ™$zD\ßú\Ñ.\Í\Õzy¼ž,€c*4\Óbš™Š\ÐD\0\ä”\â\â\âI¥u*VP\ãÇ7\çÏŸo¾ó\Î;\æ¾}û\ÌS§N™Š>666š\ï½÷žù\â‹/š\'NŒ\×\Õ\ê¤a7“]\0\È:zµ3¶GK\é\Þ{\ï\rK«­­\ÍL–\r6˜÷\ß¬\àB\Ü\ï\0Y—Zt\ÓSgVVV¦$´X/^lJ3”›y 7\ÍO‘Z(º\Ùù\ÑG™vð\É\'Ÿ˜w\ß}÷Y•\ÍR\0\È(z¡ úœšJMÏ™Ù‰þ¾h¹\é97.(\0@&› ‹£›ŸvUjñ*·˜f\é\Z²\0¶£÷©EŸW\Ósj™DÏ¹EŸo\Ó&0{\0lEo¾¾úy\æ\Ì3\ÓL:5ºIZ\Ï^\0\0\Û\Ðsk\Ñ=\nô–Žl°iÓ¦³z(Hôgo\0€-\èm\ÑÒ¹­#U¢o\âÕ¾¥\ì\r\0°«Z‘Ë‚\Ìlòò\Ë/Ÿ\ÕåŠ½\0v‰­cb\í&•M´\Ù\Õ=\Ì\Þ\0\0[¡tœ_;p\à@VÅ¦÷µEy\Ä\Þ\0\0»*¶¹D:´gý{\ÑŸ½\0¶‹- 6\0 b\0\èÎ±€+6®Š€\ç\Ä\Æ}l\0à¹¦\è\ì\\õ<ø\å/I\Ï\0°kJ½6úŠ€×š£k¢G÷\ÈF\Õ=£{\0€\íXó††\r\0¼Vµ\Õfk\Ý[o½•t ó\è\Ü:A¦\ç<¸ë®»˜ó\0\0²‡\Î\Z\Ý$µ{–ªh©1K\0dSnS¢\åf×¼¢1\ÍO\æ€\Ü\Ê-rµTgvOõ–Ž\éÓ§3<\08§Y\Z}\Î-ºyª=Ö®]\î[\Z\é8¯zM\å§=\n¢o¾>§Fó\0rŠžØ¾Zšf¬\áB\08½\ÏMª­õ\Ñ=’	\íQ 7\ßŸ’E\0p$\Úý\Ê\ê[ªU\\SôGQ]£k‡v\íûI7)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0{ùÿavv\Ù]Q\0\0\0\0IEND®B`‚',1),('8',1,'/home/dell/stconline/server/target/classes/processes/Contract.Contract.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0k&IDATx\Ú\ì½tVÕ™øí¥­uÚ™©³Úº\æ¶:]ß”\Õquuj»fü·\ÓQþ\ÎgÇ±NAÞ“÷Í…„B @€p•p	7\åb@‹€Ø€Xð¡X\äƒ\Ä(ˆŒC0B!\Ù\ß~¶9™7÷¼—\\\Î9¿\ßZ{½·“7É“œ}~ï³Ÿ½÷-·\0\0\0\0DJ\Æ3»Õˆº–\ÑL»ü@­9n\án¥9©\Û\"¹_\ß\êŽÓœ\r:nEsß‡h\0\0¸Œg_;{s\ä’üZ}ñªJ©óF\ê$¡Z©úù5\"°4¿vÄ¢<9\îl‘Ð·\Ç/\Ô~!\Ç=ŸWR5ò\Ùü6\0\0\01rñ\Þ\Úz‰0·{\ìLÃ¿68\î\Ù7õq{\Zd#\êŽ\Û|œ~¼&¯\èú—\ÒF-ù\ê½\å~s\Ù\n\0\0\0p r—!K7Ô¥t\ßd#ž\Í3Ç½z\äËªC g¿Ÿ|ø…ª°ŸŸýÊ‰\êxÿ&\0\0pú‚ÿdF,lT#±$¿v\ÄÂ¯²uÇ“ûrÛ°–b\Ú}ò\Ë\ëA\Ç=Tw\ÜC’É¨}C\Z\0\0\0.\ÌH\Ô\rKü¾\á°\ÆÿÊ‚}l\Ýq=š?nOƒ\ã\ìû™\Ï\Ôj\Z¹\èA\Ä\0\0Ü“ø\î’\×\ÎÞ”‹ü\ÅjuA¤`\ä³_‰…y,39–\ä\×\Öûÿ\ÚÇøjV\ÆöŒ ™‹·t£\î¸vv¢\îñöÿoy\åfl\0\0\0¸N$†\ÙY…\Ï\æ¹´ ö\Åý*G,®\ÏT\ä\ë¶\áË«\ÍXœÿU“lÄ¢<s\\•R_¿\ßØ•o\Õn~÷‹k\ã^(¬±ß¿®\Ð2Ÿ\È\0\0¸€O®©‹¯Ÿ¸&÷$¹ðh\\@ùU\æa\ß\Ô5‡k\Æ,+\éœ+G.\Îkö¸‹\Õ\êJ{ß\È\0\0\0€«\Ñ\Òû\íÛ·oZ´hÑ—s\çÎ­5j”JLLT111*>>^1BeeeÝ˜:u\ê\'Ã†\rI\Ä\0\0\0\à–ó\ç\ÏÇ®^½úòð\á\Ã\Õ\àÁƒÕªU«\ÔþýûÕ§Ÿ~ª*++%«¦nÜ¸¡\Ê\Ê\Ê\Ô;ï¼£Ö¬Y£\Ò\Ò\ÒTzzz\í„	òý~ÿ\ÝD\0\0Àch?¸{÷\î\Ý\åC‡Us\ç\ÎUGŽ1\Â\Ð^Ž;¦-Z¤RRRÔ¨Q£¦Q\0\0\0e!,XP›‘‘¡:¤\"\áÄ‰jØ°ajÐ AŸ%&&~‡\è\0\0¸˜+W®\Ë\Ê\ÊR\Ï<óŒº|ù²Š2\"\ï7dÈ/\ê\0\0\0pq&B$bö\ì\Ù\ê\æÍ›*\Ú,Y²D2Ÿ÷\ì\Ùó›D\0\0ÀEHM„gH\æ #$\Âfþüù*..®˜ˆ\0\0¸)¬”šˆh\rg´6Ì‘––V\ë÷û3ˆ:\0\0€!\r™!33:)ÀŒ­¡^\0\0À\È:2Å³3™>}ú˜˜˜-D\0\0ÀÁÈŠ•²\ØTge#l>ø\à\å÷û«)¼\0\0p0¯¿þú«²beGX¶DbbbeY)ü\0\0\0Š\ì!\Ë^w999\×bbböòW\0\0\0p(²—\ì\Ñ¼õ\Ö[7µH|\Ì_\0\0À¡\È.ž²WWP^^^«E¢Š¿\0\0€C‘-À\í]<;\ÙL¶!\ç¯\0\0\0\àP\äBÞ• \0\0\0¦_¿~]™‘¨E$\0\0\0\ÌÈ‘#»¬F¢¬¬\ì5\0\0\0fò\ä\ÉU]5kcûö\íe\Ì\Ú\0\0\0p0Ó¦M+\îªu$²²²JYG\0\0ÀÁ6,)--­KV¶”%²Y\Ù\0\0Àù2Q\Ó\Ù{m\ìÛ·O†5\Øk\0\0À\éLœ8qÏœ9s:U$X\Ê\îŸ\0\0\0. 11ñ;¨=v\ìX§H\Ä\Ûo¿].\Ù¿\ß7\Ñ\0\0p\é\é\éYC‡U—/_\îP‰¸v\íZM ¸¡%\"ƒ¨\0\0¸ˆ´´´Osrr:²ð²V2Ë²>\"\Ú\0\0\0.C\n\Ó\Ó\Ó\Ë-Z\Ô2Q;aÂ„s²n„¥m\0\0\0—\Ê\ÄÀ\Ë\æÍ›§®^½\Zµ\áŒ!C†Hq\å\Ç\ÔE\0\0\0x@&\â\ã\ã?JMM­=|øpÄ…•R!\Ãd\"\0\0\0<„D\Æ\Å\ÅÝœ<yrµE(\Ã………¤\æ¢nv…•\0\0\0^D²–e­—¬BBBB\íÜ¹s¯½ñ\Æ7KKKknÜ¸Q¿‹§lÀµcÇŽrYöZV¬u\"\Ê\0\0\0\0ƒƒx\Ýv\êV¬\å\âšlÔª¤B·}²\ì5+V\0\0@{\äB!\r\0\0\0¶Hô\í\Û÷¯ˆ\0\0\0„ŒeYµ			K$\0\0\0 ,‘HLLü‘\0\0\0€‰‰‰©\Ñ2ñ\"\0\0\0\áˆ\Ä\Í\Ø\Ø\Ø!\0\0\0ŽHTû|¾û‰\0\0\0„#U–eý†H\0\0\0@\Èh‰¸#\0\0\0ŽH\\‹µˆ\0\0\0„LLLÌ—²t6‘\0\0\0€±,\ë²‰D\0\0\0BFK\ÄZ&†	\0\0\0G$.\ê–I$\0\0\0 ‘¸ \ÛD\"\0\0\0!cYVi ˜F$\0\0\0 dbbb>\Ñ\íI\"\0\0\0\áˆ\Ä9¿ßŸC$\0\0\0 d´Dœ±,k1‘\0\0\0€‰‰‰)\Òm‘\0\0\0€pD\â\Ýr‰\0\0\0„#GÀˆ\0\0\0„#‡t\Û@$\0\0\0 d,\Ëz\Ç\ï÷ÿ‘H\0\0\0@\È\Ä\Ä\Ä\ì\Ó2ñ\Z‘\0\0\0€pD\"_·]D\0\0\0\Â‰]\"D\0\0\0\Â‰\í2¼A$\0\0\0 ‘Ø¢\Û\"\0\0\0!\ãóù6úýþƒD\0\0\0BF£²,\ë}\"\0\0\0!#\Ëc\Ë2\ÙD\0\0\0\Â‰²q‘\0\0\0€	K,\ËúˆH\0\0\0@\Èøýþù111\ÅD\0\0\0BÆ²¬\ÙZ$>!\0\0\02@`š–‰R\"\0\0\0!3Q·D\0\0\0\Â‰L\Ý.	\0\0\0G$†Y–UA$\0\0\0 dü~ªn—‰\0\0\0„Œ\Ï\ç\ëóeTÜ­Û¯ûô\éóS\"\0\0\0\rQ°,\ëš‡j\ÝjtS-´<¢\0\0\0MÐ’°·V›œœü\"\0\0\0M¨¾h-q€(\0\0@k2ñJK\"aYV\"\0\0\0­‰\Ä\Ý\Í\ÕHh‰x\è\0\0\0@›È®ŸE\"66\Ö\"2\0\0\0\Ð.\êfp\Ø\"ñ1\0\0€v\ã÷û3l‘ûD\0\0\0BÂ²¬\Ë\"D\0\0\0B¦n÷OD\0À	¼ýöÛ©ƒ¾ñOÿôO\Òq\Óh4\Z-‚öw÷wªGEúþ\Ý\\aÀñ«_ýJý÷ÿ·z\çwTee¥\0€ð¨®®V\ï¿ÿ¾\êÓ§úö·¿}™\0×“žž^-\0\0\Ñ\å7¿ùM\îf÷q¥W#\Ã’‰\0\0€\èr\ìØ±Z\Ý\Í\Þ\àJn‡\á\0€@†9\ê\ê&\0\Ü-\0\0\Ð1 €H´q‚\Ü{\ï½mó\Øc\Õ\ß>|xýý?ý\éO\rŽ•\ÌH\ÝI§¾ÿý\ï7ÛŽ;\Ö\à½\ï¿ÿþ\ïq\àÀó|QQQƒ\ç\Ë\Ë\ËÕ–-[ÔŠ+\Ì\ëR`ºÿþ&\ß\ï\ÙgŸ¥\ç\0D \Ú\"q\åÊ•Ó›~øa\Ó\Z?\'·rÁ®©©QUUUõ{;\Å÷\È#ÔŸ\\Ë–-k’ü\Å/~aZ 0\í•W^1-..\Î|Í¼yó\ê?w\îœy\î…^P‰‰‰\êö\ÛoWuk˜&¥}ðÁ\æ½GŒQÿs\ÊÏ—››kggg«\×_\Ýü\Üò¸°°\Þ\0	€Ž‰õ\ë\×\×?\'_yN„!ø¤\É\É\É1\ã\ßý\îwõu‘¹0aBýqrLc9hŒd\ì÷øüó\Ï¼&2 MŸÁ‹¼¼<s_Dž·±¿¯d#‰¿ù›¿iò;\Ê\×\0 \00´a_\ÔÔ¯ý\ëú\Çw\Þy§i\'Ožlrüƒ>h\îK6BÏœ9\Ó\Ü\ÚÙƒ\à\áŠ`¶o\ßn^—lDcNŸ>m^“Y\'‚HFð÷*--5{õ\êU?\äa;3²{÷\î&\ÉL™2…ž\0	€Ž	¹X\ç\çç«‰\'\Ö\r\Èc¹ß¿ÿ\Ç\ÛY‰9s\æ\Ôgd±–\Æõ\r’Aø\×ýW\Ó}ôQ“-÷’\ãdˆCž“&\Ão¾ù¦ùš²²²ú\ì}¬4ùž\"C‡5>\ÜD„ÉˆHF\ã&\Ã \0\0ˆ@f$\äý?ÿó?7x,·R‡`gD\Z\ä¹ý\èGõ_+õ	öý\à\Z‰’’“\á&+\Âý\áP¬—yNš¼\ç[o½\Õ`\è#øg“ŒÈ¶m\Û\Ì\íó\Ï?o†+l<Xÿó\ÊpŠ\ÍHñ¥€\ÚÙ‹ø‡`:,\0 \0)k×®5÷\íbEF°_³‹)\åo_¸e¤-‘h{†…dš\ãÒ¥K\rj,\ìú»\0³¥lÄ†\r\Ì,‘‘‰\éÓ§\×\Ï(‘Ÿ\0\0‘\0\è\àŒ„)\Þu\×]\r7Wc\\·\ÐX$dhAš\Ô;„#O>ù¤y]2ö´O™¡ÑœH\È\ë2\Ôq\Çw\Ô|\ÊÉ!C\ê³)ò\Z\Ó?\0‘\0\è@‘¦qF¢¥“(X$n	šÁqö\ì\Ùf×‚hH\Ø3,d¸\Ã^BÖ°§œ\Ú\"!\â<ó– Yò\Ò$Cag3\ä15\0€H\0t‚H¬Y³¦\Í½4)¤¤(SKvÀ.¾”\\\Ç ,X°@\Ù[š\Ëú\ÍaO•\ï-µöû\Ø\"!uöû\Ï$	—[\Z\Í8±\ëHt=2\Ä$\Â)ÿ\'£F2ÿ2\Ë\'>>\Þ\Ô\áH\æ\ëé§ŸV{ö\ì!X€H\08U$\0¢Éµk\×L‘­Ôª<X­ZµÊ¬>úé§Ÿ\ÖÀÞ¸q\ÃÈ£l4\'\"›––f†¬ž{\î9UQQA‘\0@$À‹\ìÝ»\×ÁÜ¹sÕ‘#GŒ0´Y‡dÑ¢E*%%E½ö\Úk	\0D¼”…¡¬ŒŒu\èÐ¡ˆ\Þ\ëÄ‰jØ°ajô\è\Ñ\ê\êÕ«	\0DÜŒd²²²\Ô3\Ï<£._¾•÷”!y¿\Ì\ÌL†:\0‘\0@$ÀÍ™‘ˆÙ³g«›7oFýý—,Y¢FŽ\Ù`\0D\0‘\0— \Ã’9\è‰°™?~ý¶õ\0ˆ\0\".A\n+¥&\"Z\Ã­\rs\Èì­[·t@$\0	pË†\ÌÎ™`\Ên\ÔK\0\"€H€u\"dŠgg\"\Û\ÖK-\0\"€H€Ã‘š…\Î\ÊF\Ø\Èþ+’• ð	\0DŒ,{-5Y`\ÙIIIj×®]ü\0‘\0@$À©\È\Þ²\ìuW°p\áB5yòdþ€H\0 \àTd.\Ù;£+Ø·oŸÉ†\0 \0ˆ8\Ù\ÅS6\à\ê\n\Ê\Ë\ËM\0\"€H€C‘-À\í]<;YŽ[¶!@$\0	p(]}!G$\0‘\0@$ÀÁô\ë×Œ \0ˆ@xteDYY5€H\0 \àd²³³»l\ÖÆž={˜µˆ\0\"NFvû\ìªu$žz\ê)Ö‘\0D\0‘\0\'#Ùˆ´´´.Y\ÙR†5X\Ù	\0DNW\ìµñ\î»\ïª\Ø\ØXö\Ú\0D\0‘\0§³r\åJ³\Âeg’™™\ÉîŸ€H\0 \à®^½ª¨Ž;Ö©ÙˆŠŠ\n‚ˆ\0\"n`Û¶mj\èÐ¡\êò\å\Ëú}®]»fV\ÓÜºu+AD\0‘\071v\ìX•““Ó¡…—£G6\Â€H\0 \à2¤ðqÌ˜1jÑ¢E\"2\ÝSÖ¡\0D\0‘\0—Ê„¬v9oÞ¼¨]ðe8cÜ¸qF\"¨‹\0D\0‘\0\È\ÄÈ‘#Õ Aƒ\Ô\áÃ‡#z/)¬”š\Î ˆ\0\"B\n\"\ÔÔ©SP„2\Üq\è\Ð!Ss!³3(¬D\0‘\0\"Y)À”U(e§P¹ŸŸŸ¯JKK\ë“’]<e.\Ù;C\ê \äXY\'‚¡@$\0	\0ƒ\Äô\é\ÓUzzº®-À\í&ò 5“&M2\Ë^³b% \0ˆ@‹HF\Â\ï÷@$\0	€\Ð9zô¨¾\0@$\0	€°†9¤f\0‘\0@$\0BfÓ¦M*%%…@\0\"€H\0„\Î/¼ †B \0‘\0@$\0BgÁ‚f+p\0D\0‘\0™3f˜©ž\0ˆ\0\"2&L0N \0ˆ@\Èddd¨¥K—@$\0	€Ð‘\r½Ö®]K \0‘\0@$\0B§ÿþl\Æˆ\0\"²\×\Æþýû	 \0ˆ@\èUTTD \0‘\0@$\0BGvü¼t\é\0D\0‘\0\Ê\ÊJ#\0ˆ\0\"2\çÎcq@$\0	€ðx÷\ÝwU\\\\\0D\0‘\0;wª¤¤$ˆ\0\":\ë×¯W$€H\0 \0¡³|ùr5l\Ø0ˆ\0\":ó\æ\ÍScÇŽ%€H\0 \0¡3u\êT\Ó\0	\0D dÆŒ£ž~úiˆ\0\":C‡5u\0ˆ\0\"22c\ã\å—_&€H\0 \0¡“˜˜hÖ’\0@$\0	€‘U-<H \0‘\0@$\0BGöÙý6\0	\0D dd\çO\Ù\0‘\0@$\0B¢¢¢‚-\Ä‘\0@$\0Â£¨¨Hˆ\0\":ûö\íSñññ	\0D u\Ê\Ë\ËÕªU«\ÔÖ­[Õ‘#G\Ô\éÓ§\Íýþýû@$\0	€¶‰55›LMNNVP7n$P€H\0 \0M™<yr³\"a7™\n*™\0D\0‘\0hvx£5‘\È\É\É!H€H\0 \0-3bÄˆf%BŠ.«ªª \0ˆ@\Ë\ìØ±£Y‘\ç	\0D M¤¸2X\"\r\ZDP\0‘\0@$\0\Ú\Ç\ìÙ³ˆÄ‰\'\n \0ˆ@û¸zõª™¡!1zôhˆ\0\"\ZÃ‡7\"ñ\Þ{\ï@$\0	€öó\ÔSO©»\îºKY–¥\Ê\Ê\Ê \0ˆ@û%\â\Ö[oU?ÿùÏ•\Ï\çS“&M\"(€H\0 \0\í—[²³³<@$\0	€vID[\Ï \0ˆ@»dÁ~}Ú´i	\0D ôŒƒH™	@$\0	€°‡-D&n»\í62€H\0 €D„Wû _\'2Af	\0Dˆˆ¾ž\Ì \0ˆ -u¼ªµÿMj&\0‘\0@$\0‰[$\ÈL\0\"€H\0‘HDc˜\0‘\0@$ÀEªH0\Ìˆ\0\"HDD\"afs\0\"€H€\Ç%\"\\‘–	j&\0‘\0@$À,¡6†9\0‘\0@$À¥œ={\Ötž÷\ÜsO»3\Ñ	¡W¯^\æù9\0	\0Dœ‘hm˜¡#3\ãÆ\ã\0ˆ\0\"n\ÞhK0BÁÞ‹ƒa\r@$\0	ð°L„#3f\Ì`q*@$\0	p«LH¦`ò\ä\É\"+V¬P½{÷V>ŸOÍ›7O=z” \"€H€[8þ¼\n\ê±\Çk—L\Ü\ÆÊ–Ã‡W/½ô’\Z1b„òûý*..NM˜0A½úê«ªªªŠ? \0ˆ8òòr5e\Ê£ÆŒc$¢#ö\Ú5jTƒ\çkjj\ÔÞ½{\Í0G¿~ý\Ì÷<x°z\î¹\çTII	@$\0	\è\ÎTTT¨\éÓ§›Ì€dNž<YÿZ{\Öy¸%\Ê\ëEˆ<ˆD2\ÄH…\ÈEvv¶‘\r‘\0D\0‘€nÀ•+W\Ô\ìÙ³@:T9r¤\ÅLB$+PF²\è”s\Èp‡{\Èð‡-;2,\"€H\0 \Ð\ÉTVVªœœS!C………&\Ñ\Þ\íS\n3Ÿ~úi5`À\0#)))l\"€H@g Ÿ\î/^lb\àÀª   C¥ £·—Œ›€H\0 \ÐÁH]L¹”­|‚ßµkW\Ø\ïe/\"\Õ\Ö0Gnnn³…•ù;R°	ˆ\0\"Q¾¸¾ø\â‹*>>^%%%©­[·F\å}\Û\Ê4\Ø5%\ÍAÁ& \0ˆDÀ\Ë/¿¬\Ìt\ãÆQÿ–dÂ®¥\èN+VR°	ˆ\0\"\ídË–-*11\Ñd!\äBÙ‘4\Þè«½\Ã]\r›€H\0\"Ðˆ;v¨\ä\ädó‰{ÕªU–¾·3<ð€#wñ¤`	@$À\Ó\ä\ç\ç›OÖ±±±jÙ²eªººº\Ó\ÉL\Èÿ¥Ó·§`	@$À38p@\r\Z4\ÈL\å\\¸pa—z>{ö¬\ëbLÁ&\"€H€\ë8|ø°JOO7!\ãúW¯^%(\0›ˆ\0\"Ž\æÄ‰*##\Ã\\ÀfÎœ©.]ºDPº\n6	\0DÁ\éÓ§Uff¦I­O:U]¼x‘ t3(\ØD$\0	\èv\Èø¼/Š@Lœ8Q•––@Á&\"€H@—\"Â••e.@\"\çÎ#(B\n6	\0D:²Œ¤\Æeii\Ò\0wAÁ&\"€H@Ô‘¢IY‡A.*Ã‡WÇ\'(‚MD\0‘€°‘i›r‘ˆ¤½<HP<›ˆ\0\"\íNo/Z´È¬!J\íß¿Ÿ @(\ØD$\0	h‚,]-Y\ÊZR\Ùyyy\Ú›ˆ\0\"\áñO—¹¹¹&UÝ¿µ}ûv‚e´(\ØD$\0	°n\Ý:•`>AnÞ¼™€@Ô¡`‘\0@$\\È¦M›Œ<ˆD¬_¿ž€@§@Á&\"€H8œmÛ¶™\á\éÀe8ƒñk\è*(\ØD$\0	!…“’R–B\Ê\åË—#\Ð\í `‘\0@$º!ûö\íS©©©f*\ç³\Ï>KúAk›l\n‡H\0\"€,%Ÿ\ì¤\Î\É\É1‹K8•\à‚M\ÉVxýÿ‘\0D:Y¾Z–±e­eyk\0· \Ùù\ß&#H\0\"Q¦¨¨\Èl¤%¬Œ+“þ7r\æ\ÌD‘\0D¢Iqq±\Z;v¬I÷\Ê\Ö\Þeee\\\Ë\áÃ‡M\Í\"H\0\"RZZªžx\â	ó\élüøñL—Oð\æ›ošµO	D	“òòr5u\êT“=z´Iõx…­[·ª\ä\ädD‘\0DBEŠ&gÎœY?\r\îÄ‰<‡¬\Â*Ó™	D	h\'2\Ím\îÜ¹fˆôôt3F\àUžþys ˆ \Ð² Ï‚Œ@¤¥¥©ð<‹-2³“	D	h\ê\êjµd\É³”õÀMq€9}ú´Y™U†ñ¤‰\\Ï™3Ç¬v‰H €H@#d/U«V™©mRL¶s\çN‚žFVg•¢\âæšˆ¶´¤¤$µk\×.D\0‘ð6k×®Uñññ*11\Ñ\ì/\0\0_!»¶$\ÒD¼½¸\"ˆ6l\Ø`\æ\Ä\Ë.‡r\0\Z\"›tµ&ò:C\0ˆ„ç¹ð’’•,Ä‹/¾\È\É\0­ \çIs!\Ù\n¯‚H\0\"\áQd,7%%ÅŒ\í®X±\0hË–-kV$¼<“	‘\0D\Â!\ÈEÇŽ¿OAA™!S9/^\ì\É1]€p©¨¨0±KÄ¸q\ã<D	‡`wZ\"\áT†š5 D \æÏŸ¯*++¹*\0„¬\ê\Z,25‘\0@$#v0`@»2GŽQÃ†\r3Ÿ¢d\Þû•+W¸\0D€ˆƒ}\Êfu^‘\0DÂ¡\"œ¡hN(Nž<iöÁ˜>}ºI\É@t:t¨9ÿ>üðCD‘\0D\Â\Ù\"œ¡!\â\âb³§<7yòd³C\'\0DY\åR\Î1‘\0D\",Î;g:¹p¿þú\ë´0š¬–™ŸŸ¯ŠŠŠ¸*ç–ƒ\Ï-D‰0:º½{÷ª²²23\ã~»p\á‚\Ê\Ë\ËS§N\â\n\nœ[=·	@$\ÂHi\Ò\ÑE·\Ãó\âþÀ¹\å–s‘\0D\"D\äÄ¤“Šn“t,\0\ç–3\Ï-D‰‘“\n‘€\èÃ¹…H\0 A\í\Ë/>U½³JÛ™mšÜ—\ç\è\Ü	\à\ÜB$\0‰VÛ•ŠO\Ô\Ñ\íY\êðŸF7hòœ¼F‡H\0\ç\"€H´\Ø>>ö\Ç&\ÝJŽm¡ƒC$€s‘\0@$Zn\ìyª\Å\ÎN^£ƒC$€s‘\0@$ZlG_Ÿ\Òbg\'¯\ÑÁ!À¹…H\0 tvˆpn!ˆ \Ñ\ïì¤’¼¥\ÎN^£ƒC$€s‘\0@$ZlE‹Z\ì\ì\ä5:8D8·	\0D¢\Åvñ“#\ê\èŽ\ÉMS¯ú9y‘\0\Î-D\0‘hµ)\Ìm\Ò\Ù\Éstnˆpn!\0ˆD\ë\íúuUôÖ’¦©Wýœ¼F‡H\0\ç\"€H´¸òÞ©‚…-Ž\ã\Êk¬À‡H\0\ç\"€H4ù¤ôi\ÑnõþkZ\ì\è\ì&\ÇÈ±|‚B$€s‘\0@$\Úü¤\Ä\'(D8·	\0D¢\ÅÎ®=Ÿ”ZûEg‡H\0\ç\"\àa‘·£³\"œ[ˆ\0Å–4D8·	\0D‚\Î‘\0D‚s‘\0@$\è\ì\0‘\à\ÜB$\0	:;@$hˆ\0\"AC$€s‘\0@$\è\ì	@$8·	@$\è\ì	@$8·	\0D‚\Î	\Z\"\à!‘¨;\éÔ¿ÿû¿7x^Û¯Er¬´¯ý\ë\ê\ç?ÿ¹ÚµkxJ$v\ìØ¡þ\í\ßþM\Ýyç¦\É}y.\ÒsÐ‰\ç\"\àr‘v\è\Ð!ó\Ü{\ï½\×\àùHŽ•û{÷\î5÷ø\Ã\ÒÙgDbÛ¶m\æÿ¾gÏž\êüùóª´´\ÔÜ—\ç‚e\Â+\ç\"\àr‘OJ)))\æ¹\Ô\ÔTó¸¥N,”cƒ\ßq\Çõ¥SMHHP\ßúÖ·\Ìó=ô:sæŒºxñ¢y®G\r~Ny,Ÿ\è.\\¸€H€#D\Â\Î(\ìÛ·¯þ9¹\ß8û\à•ó\n‘\0p¹HlÙ²Å¤J9bn\åqKX(\Ç\Êý7\Þx\Ã\Ü\ä‘G\ê_OLL4\Ï¨\ãÇ›û÷\ÝwŸy-##\Ã<–OtvzX\Ëód$À)\"!\çFð9!­²²\Ò<\'o¯Wˆ€\ËEB\îÿ\ä\'?1ŸPä¶¥O?¡k7I¿ž>}ºþuù´\Ôø˜\Ûo¿Ý¼VTTd\î÷\ê\Õ\Ë<–[y,\Ï#\àV‘pûy…H\0x@$V¬Xa\î\Ëm[\"Ê±™™™\æþƒ>Ø¤Ã»t\éR³?WŸ>}\êÇ’\åVS#N	{h¢°°°\É\Ð\Æ/ùKÏWˆ€D¢­\×\Â=öÊ•+\ê\î»\ï6\í\ns;;v\ì\Øf\ß\ÏN\Û\Ú_\'©\Úöþ\\­ýœˆtÖ¹e_¬¥NAj‚‹-_y\åÏWˆ\0\"Ñ±3f\Ì0\ï¿ÿ~óXŠ¿¬\îº\ë®f«Ó¥\ÉÔ¶ÆŸ\Þ	pŠH\Ø2!…•v¦@†;rss£v:\é¼B$\0\\*4D:\çÜ’,Að°\ç\"€H\Ð\Ù\"\Ñ\î&…–’\rø\îw¿k¦drn!\0ˆ 4D\0‘ !À¹…H\0 4D8·	D	:;D	\Î-D\0‘ ³D‚†H\0 tv€H\Ð	\0D‚†H\0\ç\"€H\Ð\Ù!€Hpn!€H\Ð\Ù!€Hpn!\0ˆ 4D\0‘ !À¹…H\0 4D8·	—\\(¾ù\ÑG}¼o\ß>³M¼ÄŽzÛ¹s§\Ê\ÏÏ¯\Õm	\"Ag‡H\0\"Á¹\å‘‰Ø»w¯*++\ã\'\Âv\á\Â•——W«¥b.\"\Ñbªü£ }8·‰®D2HDteBÿÿU!Í€±F·•––š\0\ç–3\Ï-·ˆ\"\Û1\"‹H4\Ã\éÓ§%e£>û\ì³ný¼~ýºc:ºS§NqÇœ[N8\Ç:ó\Ür‹H0´†HtšH\Ø\Þ\îÝ»»m±ËŽ;”\ß\ï7·Ý¹(‰\0§[Á\çX \è¶\çXgž[^‰/¿øT}ô\Î*ulg¶ir_žC	Wq\é\Ò%#\0\Ðq\È9VQQ\áù8xI$®T|¢Žn\ÏR‡ÿ4ºA“\ç\ä5\ä‘p\r\çÏŸG$\0:A$Š‹‹	‰\Ä\Ç\Çþ\ØD\"\ìVrlò€H¸‡“\'Oª\Ø\ØXzz€DÎ±Ã‡#‰ö<Õ¢H\Èk\È\"\á\Z\Þ}÷]GOÐô\ë\×O½ùæ›ˆ„‡D\â\è\ëSZ	y\ry@$\\ƒtn			ôô\0HÿþýÕ¶m\Û	D‘@$\Ü\Çö\í\ÛM\'\0GjjªZ¿~=\"\á!‘Y\Z-‰„¼†< ®a\ãÆ*%%…ž IOOW«V­B$<$E‹Z	y\ry@$\\Ãš5k\Ô\àÁƒ\é\é:‘#GªE‹!‰‹ŸQGwLn:¬¡Ÿ“×D\Â5¬\\¹R\r:”ž ™0a‚š3g\"\á±©\Î\æ6	yq@$\\…|J\Z5j==@2u\êT•HxI$®_WEo-i:¬¡Ÿ«rÀ¶ˆ\"\Ñn\æÎ«ÆGOÐH6B²ˆ„7DBV®<U°°\Å\Z	y\Õ-	\×0}út5e\Êzz\02ˆD¤\"qýºú´h·zÿµ	-J„\Ý\ä9–\ì\"\áx&Mš¤fÌ˜AOÐ<ÿüóf\æ\"\á^‘h+Av‘p-2¬1o\Þ<zz€DÖµ$	÷ŠD{²­e\'	DÂ±Hº•ii\0\ËÖ­[Urr2\"\áb‘W\"\ì†H ŽeØ°ajÅŠôô\0KÑ»_$hˆ„gE\"--M­]»–ž ‘?\Ù‘ !®D–\ÇÞ´i==@r\æ\Ì\å÷û	D‚†H¸Ù°K6\î€Ž\ã\âÅ‹ˆD„\"ñ›\ßü\æûˆ\"HtCúõ\ëg\Æo ú\ìÛ·O=õ\ÔS¦\Ð2&&F]½z‘Ë²~/ñ“¦\ï\×j)«\Ñ÷o\ê\Ûúñu}ÿª¾Y·\Ïõýº×­X?þP\ß\×\ÇÒ·tÛ«\ÛNŸ\Ï÷ª¾Ý \Ûj}\Ìrýú3úv–~œ¥oGé–ª[œ>\îüñÿ\Ð\Ï\ß{OBB\Â\ß>üð\Ã±c\Ç.þˆ\"a#\ã¶¤\Çˆ\çÏŸ7»|>\\¥/>jÌ˜1\ê\å—_Vd$\Z‰„Ž\Ñ\é‹øk-u\Èr\á!Ð­R·G\ä\".\Ïõ\é\Ó\ç\Çrq—‹¼~\Ç\ä¢/}\á¡ŸŸ(R \Û|ý\Þ\Ë\êd\áe}»E$BdB?~»N.Ž\ëöa\Ý÷ù(\Ó\ís‘ýúUù¾\"+\"-ºÕˆ\Ä\ØB\Ã\Å‘@$êŽ\î\äÉ“\\\0\Â@:@ùt:yòd“Ý“\á‹Aƒ©…ª\ãÇ 6DB_˜?’‹²€1;cý\\?ýšd\ÞOLLü5ˆ\"\ÑM‘ŽO>E@ûñ–µWdÆ“\\E d…\ØmÛ¶™\Ú\'uC&†2TÑ§OŸŸÖ½t[]ö@†/ž¤\Ø2z­.þ\Ý\î½	‡#\'ñ¥K—\è\á\0Z@Î\r6¨±cÇš¡@‘o{ý•’’¦H\ØÙˆ vQ\ê¤\ÆA\Çø’~ýÿ¸m\ÖFAAú\Ù\Ï~¦\î¸\ãu\çwªŸþô§Q}½+E\"\Ò÷F$JMM9\å\0þ—¨Ù³g›\é\Ñ\"R,9s\æLÓ‘s¾D.R\ÑH\"\ì&5oö\ì\Ùó›nœþù\ãÿ\Ø\Ä\àÈ‘#\êÂ…FH£ùzgg¢ùÞˆ„ƒ?i1%\r@©\Ò\ÒRõ\Â/¨#F\ÔIfffªu\ë\ÖQ$\Ù\"QW\Ü\ØD$¤˜Q\Çþ_ÜºŽ\Ä×¿þuƒ\'Nt\È\ëme	\ì\Çv»\çž{\Z¼W\ã\×\í¬\Ç_ÿõ_›\ï}÷\Ýw›¿w\ã¯G(	‡\"µˆx‘\ê\êjµk\×.5u\êT•˜˜h.b²©\ÖüùóÍ§=\è8‘Ð±Žo!a·+n\ÍH<ô\ÐC&rQ~ðÁM‘®d¢õº¼vûí··)¯¼òŠÚ¼y³¹ÿð\Ã7y]dAQ³‹dÛ¿÷½\ï1´Hü/R4&Ÿ¼\0¼@QQ‘Z¼x±\Z<x°\èøøx5q\âDõê«¯ª\Ê\ÊJ\Ôy\"q¡\r‘vÀ\"!™¯ñ\ãÇ«Ÿü\ä\'õ\Þû\ï¿?j¯\Ëc©ŸhK$\äÿ]šuh\îõ\æ‹¤4\ÎB ‰w\ß}—õÿÁµ\È\âO²ü»t¼\"\r\"C‡U\Ï=÷œ*..&@]\'-\ÕF|iY\Ö	\Ý\Ö\ë¿\Õ`·/‘]XXXŸ]ˆ\Ö\ëÁmQG$\Úó‘@$\ìHnC:×¹s\ç\ÖI\ÊðÓ§OWùùùIv‘i¨\ÒŸWd˜Cj\"ºûPF´D\âw¿ûY\íT\î¿÷\Þ{&’]ˆ\Ö\ë2\ì \ÏIö-77·Õ¡-[¶´8´ŽHH&DK\Ö‘ð²Ç†t´\0N¥¼¼\\­^½ºA‘\ä¨Q£\Ì¯\ìo\ÝO$´@<\ïôE¸\"ñ\Øc™‹½d\r\ä\Â+\Ã‡Š\Ú\ëR\Ëp\×]wµXø\Øøy‘\æŠ-\Ã	x\ÉnPl\é1‘Ø¸q£ù\ä\à$«°g\Ï•­’’’LZ|À€\êé§Ÿ6[uC÷	7\\(XÙ’•-‰:Ö¬Yc\n\Ï\0º3R-¾d\É5d\È#R\ïð\ÄO˜Ô¬\×7ÁB$	D‘\èRV®\\iŠ\ÏÀyœ={Öµ¿›ÈLMYiy‰X¶l™‘\n@$	D‘\è&\È~2ž\ÎB¶¥–ÿU\Ù\ßÁ-\È´2<1p\à@#2l1m\Ú4•——G‘$\"H ˆDwEŠcÆG\ï\æ0‰¸õ\Ö[Õ½÷\Þkn*R)‘\"²v‘\äÈ‘#Õ‹/¾h\n(‘@$	D\ÂÈ´¸)S¦Ð»9L\"lyO\ìN‘	\É*\ÈLùŸ“lƒLÍ”B\ßyó\æ™õL\0‘@$	DÂ\ÈhÆŒôn”ˆ¶ž\ïÈ¢O²øSzzzýJ’&L0‹DQ$‰H 4D\ÂÈ°†|\"gJD\ã\×%CrQ—¹\ä‘\"+\å\Ér\ÓR$)‰<H‘¤,K}úôiþ€H\Ð	·!\ã\ÓRp	Î•›p‡9dgKY‡!ÜŒ†lp•““c6¼’\"I\Ù\0K6Â’\r±dc,\0D‚†H¸\Ù\Ë~ÅŠôn—ˆ`™¸\í¶\ÛÚ™¡‡~ýú=W\ädn)’|é¥—\Ô\èÑ£M¤Jfdd˜\åxei\\\0D‚†Hxˆ´´4S9Î—ˆ\à¯™h\ë\ë8`\ä!x\ã¤\æ¶Ï–\"É½{÷ª™3gš\å\Ô\í\"\É9s\æ˜÷\0@$hˆ„‡EB.Røîˆ\Æ_\ßRfB6ý!h¼\ãÂ…\Í\ë%%%õ‹•\Éq\"RO³a\Ãu\å\Êþ@€H ˆ\"ñò	S6\îgI\Ä-A›\î´6\Ì\Ñ\ÜûlÝºµY‰&CöP‡,.õ3\'Ož\äˆ\"H \Í#\r\ÙJ¢G{\ê\"\ÍD´G$š\ËL¬ZµªE‰°›Ìºˆ\äw\0@$hˆ„‡”µ,MÑ©t\äpF{E\"ø}%\ÛÐš@\ØMv„@$	D‘hrq!u]\ì²…d\0\Úó\é>ÔšˆPDBé˜½{÷V}ûöUƒ\r2\Í\Þ«qc\Ét@$\ÚF¦7sñG$	¤¹ÏŸ?O\ï\Ö\"a7¹`¯_¿>jŽH³f\Íj2›C¦\Ê\Ï&32dõIùYE€\0‰\ÖÙ»woMYY¥VRRR¬E¢\n‘p\èE\ïÒ¥Kôn(v“z”\Æ\Ã\á\Î\ÎG$\ì\ï\×\Ö:,]\rˆD\Û\ìÞ½{f^^^\ígŸ}\Öm/\Î×¯_wŒD\ìÜ¹³Z·¹ˆ„Ãõ‚/t’h©É¢Cöv“O®ò	\Önr¡”U\r¥É¦L2#$99\ÙL1•&«\'\ÊÑ²¢¤\Öe\rY>Y>	\Ë\ÂXÃ‡71Â¬¸™™™i=\Z;v¬I·\Ë\r²ôrVV–\ÙhL\Òõ\Ù\Ù\Ùf(ùD-\ÉÙ³g›Me;jYmqÁ‚f\æ,Ñ¼d\É³\ïƒ,À%C²€’\ì4)\ëh¬[·N½üò\Ëfz£L‡Ý²e‹™Ý°m\Û6µc\Ç³J£lg-…©2urÿþýª°°\ÐÔ—\È\ÚG5KLµYƒ qú\Ãþò\ìŒP[K8i£/@$º3ú\Â7UŠþRRòÝ­I\'}¶ô_\Ýñ\çkÔª\Ü$ž\ËHˆLH+”O¢’•egY¥P\Öô÷™3g\ÌER.–Ç7O¹ˆ\Ê\ÅT%’‹«,Z$[¹\è\Ê?¯L+•‹±\\”7o\Þl>\Ë\ÅZR\é²2¢\\\Ä\åb.ÿðrq—‹ü²e\Ë\ÌE_.þ²¦Áüùó\È~ ²\0’\\|E\ZDD\"D&&Ožl\äB$C\Úøñ\ã|Œ3ÆˆˆH‰È‰4‘‘‘‘‘i\"6\"9\ÒDxD|D‚D†DŠDŽD\0dÿˆ`y™\n–+9q\ÛS\Ðh·{î¹§Ý™‡h‰„Ð«W/s\ÌÙ³g¹²\"\á2zö\ìùMÝ¿Ü>†h à¢¡\r«\Æ\Ã\Z­\r3tdF‚¢J@$Ü‰\ß\ï\Å\îwúô\éóS\"‚H€\ÃEB2’¡iŽÎ®‘°÷\â`X	wbYV\Ýjƒú <¢‚H€CEBV†\Ì\Ï\ÏoóøÎšµ\éV\ã\0ˆD÷G÷=‡}˜©–¡\"ƒH€ƒu3«öÌ¦ˆD$¤%”÷@$œGll¬\ÕÜ°ª\ß\ï\Ï :ˆx\0»v¡=û[\ÂX\ÙRŠN	Wg#.5\'–e}Dt	ðµ\×ˆ„\ë%bEk3\Äü~ÿ¯‰\"\ËLt\Ô\îŸ\0ˆ„»Ð’p·\ÔB´&–e½G¤	ðXf\"’š$	\ï\àóù\ÆhY(\Õ\íKŠF³6\ìv“¢KD\ÈLDux\0‘p/Z&D,ž“L)¶Ô\ç\Ê\ÔP\"ƒH€3¡Hˆ\Ô\rw\\òù|ƒˆ\"P¿ˆT[\Ã2Å“\ÂJ@$ ®øòº‰G‰\"Ð®Lƒ]SD\0\"u\"Q\ÃòØˆ@»d\"”õ\'\0	Ïˆ„\êÛ·ï·‰\"Ð¬L\Ø\Ò\Ð\Þa\0D\ÂSõw³ó\'\"\Ð\"v\â`O@$ ¹l\Ä}2Ý“H \0­f&\äˆ4Æ²¬¾º¸F$	€V‘\0@$ 1>Ÿo„\ß\ï¯ ˆ\0\"ˆ„L ˜£û‡Oˆ\"€H\0\"\á\ÔH\äZ–u‚H \0ˆ ŽHl\Õ\"±ŸH \0ˆ ŽH\ì™ ˆ\0\"ˆ„#\Èð‘@$\0	@$ d,\Ë*‘\Ý>‰\"€H\0\"!\ã÷û?\×m‘@$\0	@$ œ¡k±±±‘@$\0	@$ ‘¸iY\Öÿ!ˆ\0\"ˆ„#µ²q‘@$\0	@$ $øg\ìü‰H\0 €H@XX–õ\Ý7\Ô	D\0‘\0D\Â\ÖxD·*\"H\0 €H@\Èø|¾A~¿ÿ2‘@$\0	@$ dÀ4\Ý7”	D\0‘\0DÂ©‘X\æ÷û?$ˆ\0\"ˆ„Œ–ˆW´L¼G$	\0D	§\Ø2_‹\Än\"H\0 €H@8CGt[O$	\0D	\'#qV·ED‘\0@$\0‘€pD\â‚n‰\"€H\0\"\áˆÄ—~¿?‰H \0ˆ 2Z\"n<þø\ãÿA$	\0D	\'#Q›˜˜ø#\"H\0 €H@¨\Ü&ýÂ”)S¾F(	\0D	‰øøøZ–UK$	\0D	§>\â\Ý/\Ü ˆ\0\"ˆ„S/³6ˆ\"€H\0\"!\ãóù\Æûýþr\"H\0 €H@\ÈX–õŒ\îŠ‰\"€H\0\"!þ û…£D‘\0@$\0‘€pj$v\êö&‘@$\0	@$ dü~¡\Ï\ç\ÛL$	\0D	\'#Q¤\Û\n\"H\0 €H@8\"ñ©n3‰\"€H\0\"\áˆ\Ä%Ý†	D\0‘\0D\Â‰\ë@\à1\"H\0 €H@8Å–5Z$~F$	\0D	\'#¡~ø\á¿ ˆ\0\"ˆ„Ä£>ú]\éˆ\"€H\0\"!û/ºO¸I$	\0D	gX\ãq\Ý*‰\"€H\0\"\áZfX–UA$	\0D	-³uŸð	‘@$\0	@$ œ¡t;I$	\0D	Ÿ\Ï÷ª\ß\ï›H \0ˆ NFbŸnÛ‰\"€H\0\"\áˆ\Äq¿ß¿†H \0ˆ ŽH|\ìóùž&ˆ\0\"ˆ„#Ÿ\ë–I$	\0D	G$®ù5D‘\0@$\0‘€±,«:..\îWD‘\0@$\0‘€p2µ			K$	\0D	‰ž={~“?	\0D	‹\Ø\Ø\Ø{ü~\r‘@$\0	@$ dÀi‘¨\"ˆ\0\"ˆ„S1À²¬\ËD‘\0@$\0‘€pDbŠnŸ	D\0‘\0DBÆ²¬¥º}D$	\0D	ŸÏ·Q÷‡ˆ\"€H\0\"!\ã÷û\ß\ÐýÁ\"H\0 €H@85‡µL¼L$	\0D	\'#qÆ²¬\ÅD‘\0@$\0‘€p2eºe	D\0‘\0D\Â‰+–e¥	D\0‘\0D\Â‰Z$~C$	\0D	-µºõ ˆ\0\"ˆ„\Êm\Òô\í\Û÷„‘\0@$\0‘€P‡5þ^·Z\"H\0 €H@\Èø|¾ûu_PM$	\0D	¿\ß§û‚«D‘\0h•\Ô\ÔT#­µ~ýú(@$¼7´1V·‹D‘\0h•üüü6Ebýúõ\n	\ïe$\æ\ëóÿ‘@$\0\ÚdÀ€-JDbb¢ªªª\"H€HxË²^\Ò\í‘@$\0\"\ÊJ¼ô\ÒK	om\ìÐ­€H¸X$\äS\âÆ\Õ\äÉ“\Í\'Ê¸¸¸€@  RRRÔ¤I“\ÔÊ•+\ÕÕ«W\éi Eš«•\Ú²€Hx6#ñŽ\ß\ïÿ#‘p¡H«©S§6‡¶šˆEff¦:q\â=´++Am ž®‘8¥\ÛóD\ÂE\"!ŸgÎœi„ h®I–‚4fÐ Ad#\0‘\0{h\ãS-³ˆ„KD\âÈ‘#¦co,ƒVË–-Sû÷\ïWŸ|ò‰ª¬¬4\Ç\ËmYY™z÷\Ýw\Õ\ïÿ{•‘‘\Ñ\äk\ã\ã\ãÕ\è} ž]»v\ÕÿÈ°\0\"\ái‘øÂ²¬¡D\Â\"!{\ãaŒÑ£GI¸yóf»\ß\çÐ¡CjÂ„	\r\ÞG\Û&\ékh€]+A6	\Ï\×H\\÷ù|ÿC$.\"ÁC±±±jË–-!	Dc^{\í53¥±ph©•\èÝ»7\0D‚Œ\ÄM\Ý\î%	\Îq\Æ8u\êTTN¸³gÏª¡C‡6\ÈL0\Ì\ÂSO=e:d©£@$<-ò¡ó;DÂ¡\"!i\å\àš‘©yˆ&ò~Á2!5`\"·\Þz«º÷\Þ{\Í-2ˆ„7\éÛ·\ï_\ÉuH8X$dvFðpF´2\Íe&‚‡9žx\â	z#K„-Ó¦MC&\0‘ð®HüB†6ˆ„CEBÖ‰®‹šˆŽDj&‚\ë%dH¼-m=€H¸}\rê­¯•DÂ¡\"!‹M\ÏÎ¸q\ãF‡Ÿ€cÇŽ­ÿž²h _—\0\"\á\rdÚ§Lÿ$	©ž\ê)S<;\ÉB¯€YQQA¯„D\Ô\Ã0 \ÞB¢\Ò×ƒóDÂ\"!\Ó0ƒ,#™\æ*Á‹V\É\Þ­±zõjd\Ã#,·\Ýv™	@$¼!\Ï\ëkÁI\"\á@‘\r¸\ì‹ùŠ+:õ$\\³fMƒ%´›Ë–,^¼\Ø\Ì\îcØ³\Ã;üu\"d&\0‘p7º\ß\"›v	Š„\ì\âi_\Ìe\Ù\ë\ÎD†Q\ìïœœ\\ÿ|yy¹š7o^ƒ5-	\ïID\ã¯\'3ˆ„«E\â-\ÙFœH8P$‚\ë#>ýô\ÓN=	e]‰\à:	©›\áY¬ª¹¿Xs\ÂùQSSc¶š—\Û\Öh|5€H¸¾\Øò˜\î\ç\×	ŠDð…\ÚÞ€«³\ï\Ê¢\à|‰\èÑ£‡\é|\å¶%™h\é82€H¸:#qNˆ\Ì!‰® ‘HOO7™¢*YM™2\Å,¤%\Ã ‹-R\Ï=÷œ\Ê\Í\Í5¤²\ÆÎ;UAA:xð :yò¤*))Q/^ds¨.\ZÎC]\ÇÛ¢LK„\Ýµa\0D¢ÛŠ\ÄEŸ\Ï7†H‘ˆ(#!…•w\rn«V­RK—.Uó\ç\ÏW³g\Ï6ŸL³²²Ô¸q\ãÔ¨Q£\Ôð\á\ÃÕ!C\Ìn’r\ÑJJJR			\æ=e\èD†L‚‡M\ì\Çòš#\Ç\Ê\×\È\×\Ê{\È{\r6Ì¼·|¹xegg«\'Ÿ|R\å\ää˜Ÿ÷ù\çŸWk×®5[`oÛ¶M\å\å\å™=Dd˜\æô\éÓª´´T]¹r¥\ÍT¾\Û%¢%I–‰¶^·a˜	WŠ\ÄU\ÝD‚\Z‰h\\#!H¶@2=´!\ßG²’¥l…d-${!Y\ÉfHVC²’\ål‡üL’ý,ˆdC$+\"\ÙÉ’¤¥¥™¢\Õþýû›ýJd–I°¼4\ÞF]ž—BR9N–—¯y4h\ã³.meZ’…\ê\ê\êvIDð÷a6 ®‰jŸ\Ïw?‘p Ht\ÇY‚\Ì\Ü3fL\Ñp*rA”bQ‘§3gÎ¨£GšÌ…d0$“±i\Ó&õ\ÒK/9:\ë2kÖ¬ve\nš“‰o|\ãí–ˆ\Æ2A\Í ®(¶¬\Õ}\Ö\ß	ŠDw^GB•\ì*A\è¾Y\Ý	˜\Ö\ÞAs2ŠD0\Ìˆ„{\èÙ³\ç7\ëvþ¼h8P$\äSpW­l)Ÿ®Û»²¥tOdGWù_»\çž{Bú:\Îhœ‰\Çò|(ô\ê\Õ\Ë|­ü\0ˆ„#³=ôu †H8T$\äSkðÎŸ\ìµ\á\ê\Ô\Ìhg$dX\0‘p¬HüF_ªˆ„CEB4vðîŸ‘•˜0a»ºT&:«F\ÂÞ‹ƒa\r@$/)úZp…H8X$Š‹‹\è\ÉøyGò\Úk¯5˜\É \Ù	ð†LDs\Ö‹S\"\áÀd}-(#	!¸\èR¦&ž:uªCN<Ç–b=û{I6\Ü\'\ÍÍ¦ˆ\Ö:R \Êl\r@$\\%Kô‡\Ù3D\Â\á\"!S\í]6\í\ÂK™ªM\äýd€ý=\äû±†;±k‚/ö\Ñ\\\ÙR¦« \î@_6X–uˆH8\\$Y xˆCd\"Z™	\ÉDK„|ù~\àaŽhíµD\0\"\á:‘Ø£[‘pH›7on 2\Ì!5‘`JMDðp†4Y\Ã\0¼“™–	\É0´g÷\Ï\à\ãX/	W‹\Ä!\ÉJ	—ˆDs2a\Ï\æ8t\èPH\ï#E”²*c\ã%¢‘\ïe&\"©i@\"\0‘p7–e}¤\ÛR\"\á\"‘°‡9‚k&‚‡;d\Ìw\Þy\Ç\ì\Íaoô%·R!²!+V/6\\Áp™‰H†G\0	WŠD™¾FL!.	A\n!ƒgsD\Òdv…•d&B‘$	\Ïm\\\Ñm\0‘p¡H\Ø\È:²r`ð\n˜\íir¼,6%{<\0Ø™‰ös\ÈO\n+‘ðŒHTõ\í\Û÷?‰„‹E\ÂF–Ó–½9$K!8oAn‹ƒ\ì\â)Ÿ e\ï–½†p2\rvMˆ„7ðûý5}úôù1‘ð€H4f\ëÖ­õ±c\ÇzˆX&š[\0‘p}FB\É DÂƒ\"!\Ù[$d±!€pdÂ–†ö{\0 \î!!!\áoõ5¤–HxP$6n\ÜØ¤&‚¬„Šx\à\Ø\Å	oküÚ²¬j\"\áA‘HJJj\"©©©ô,VfBþ@$<9¬\Ð\í\Z‘ð˜H¬^½ºÅ™\Zûö\í£w‘ÿ)\æ@$¼…\Ï\ç£\Ïÿ‹D\Âc\"\Ñ\ÜBUv“ý4\0BEV<½t\é\0D\Â{\"ñ´>ÿ?&	™þ\Ù\Öú¬^	\áˆDyy9\0D\Â{5k,\Ë:F$<$­e#‚—\ÑU$JJJ Þ«‘Ø®\Û>\"\áÁbK›“\'Oš…¨\0\"Aþ‡Îœ9C \0‘ðžHðù|¯	‹\Äñ\ã\Ç\ÍV\ã\0‘Š„H)\0\"\á9‘8©\ÛD\Â\Ã\"![…#)ò?$ÿK\0ˆ„\çD\â¼nO	‹„l\È%{n\0D‚\Ô\Þ@$<†eYZ$†	‹„tþr\0ˆ„„„\Ö DÂ›‰\Ê@ Ð›HxX$ö\ïßH@\Ä$&&ª¼¼<ˆ„÷D\âfll\ì¿	‹DAAù4		²\äúÎ;	 \Þ	õè£~—HxX$òóóU¿~ý\èQ \"ú÷ï¯¶m\ÛF \0‘ð‰‰‰\ß‘ ‰={ö˜´4@$\È6ô›7o&€Hx+q¯n5D\Â\ã\"!\éhIKDÂ€Ô†\r \"<fY\Öu\"\áq‘Ø¾}»IKDÂ Aƒ\Ì>.\0ˆ„§2Ctû‚Hx\\$^}õU•œœL1d\È•››K \0‘ð–H\Ì\Ô\íS\"\áq‘qm\ßˆ„¡C‡ª\çŸž@\0\"\á!|>\ßJ-ED\Â\ã\"±i\Ó&D\"føð\á\ê¹\çž#€Hx¿\ßÿG\Ý\n‰„\ÇEB\n\ä¤P FŽ©ž}öYˆ„·†6\n,\ËzHx\\$Ö¯_¯RSS\éQ \"233\Õ3\Ï<C \0‘ð–H\Õ\"ñ‘ð¸HH¥½T\ÜDÂ¸q\ãÔ¼yó \Þ‰b¿\ß?ŸHx\\$^|ñE•––F1q\âDõ\ä“O@$¼%\å>Ÿo<‘ð¸HÈ”=™º	“&MR3f\Ì €HxË²®j™ˆ\'‰U«V©ôôtzˆˆ©S§ª\ì\ìlˆ„·2\Õ~¿ÿ\"\áq‘X¹r¥Y\0 $!Y	\0D\ÂS\"Q›œœü\"\áq‘¹ÿ²\0@$H}„\ÔI\0 Þ oß¾ß¨\Ûùó6¢\áq‘Xºt©\Ê\ÈÈ Gˆ2s\0‘ð‰‰‰?²,«–H jÑ¢EjÔ¨Qô(²†„¬%€Hx¿\ßÿn7ˆ\"¡,X FM!«Z\Ê\ê–\0ˆ„g\ê#ú\ëö%‘@$TNNŽ\Z3f=\nDÄ²e\Ë\"D\Â[\"‘¥\Û\"H0¶\rQAvþdö \ÞÁ²¬\ÅZ$\Î	DBÍ™3GM˜0\"‚…\Í\0‘ðœH¬\×\"q˜H LÛƒ¨Àž-€HxN$vûýþ7ˆ\"¡fÎœ\ÉBB1lGˆ„·\ÐqP·Wˆ\"¡¦OŸ®¦L™B±yóf•’’B \0‘ðN±\åiË²–	D\Â\ì û$\0D\ÂÖ­[Urr2\0D\Â;\"ñ™‰©D‘`³%ˆ\n;w\îTIII\æ~EE…:q\â„*..&0€H¸wh\ã²n©D‘0\Ã\Z2¼\Ð^D\â\ã\ãUll¬\Ò‰’õö›kdº\0‘puF¢*ü‘@$L¡¥\\„\Â\äÉ“[i\"\å\å\å\n	÷ŠDþ0q‘@$\ÔO<¡fÏžM!g%ô§‘EBþ¯\0	W‹„\Z8p\àŸ	DB?^Í;—BFVEmI$ÎŸ?O€\0‘p)½{÷þk}ž³ó\'\"ñcÇŽUO?ý4=\n„••h®F‚%\×‘p7qqq¿\Ò\çz5‘@$²ó\çüùó\éQ ,V®\\\ÙD$ö\í\ÛG`\0‘p1±±±–\æ\Z‘@$™™™j\áÂ…ô(62ƒÃ–ˆÁƒ@$\\Ž\ß\ï¥\Ï÷Ï‰\"a9r¤zö\Ùg\éQ ld1*[$\ä>\0\"\án,Ëš«\Ï÷‰\"a\È\È\ÈPK—.¥GˆHLL4õ\0ˆ„û\Ñ±Z·ˆ\"a>|¸z\î¹\ç\èQ \"6n\Üh2\0ˆ„\'2¯\éó}‘@$C‡5sÐ½9w\îœ)bÜµk—zýõ\×ia4Y\Æ;??_ñˆDd5o\ëö\'\"H\Ò\Ó\ÓÕªU«\èQº¹D\ìÝ»W•••©ªª*Z\íÂ…*//O:uŠ,@$\Â\ÏHœ\Ð\"ñ{\"H†¢rss\éQº1’‰@\"¢+’\Ù@$Â®‘øD\Ë\Äl\"H\Ò\Ò\ÒÔ‹/¾HÒ‘‹\Ý&C\0ˆD\ØCºe	D\Â0h\Ð õ\ÒK/Ñ£tc\ä¢\Ç\Å‘\0D¢e$*-\Ë\êK$	CjjªZ¿~==ŠD\â\Ë/>U½³JÛ™mšÜ—\çD‰(‹\ÄM\Ý\î#ˆ„a\àÀjÃ†\rô(‰+Ÿ¨£Û³\Ô\á?n\Ð\ä9y\ry@$\0‘ˆ¢HÈŠ¶\ß\'ˆ„aÀ€jÓ¦Mô(‰ý±‰DØ­\ä\Ø\ä‘\0D\"*<üð\Ã!\"A$‰zRRRÔ–-[\èQ.\ìyªE‘×D‰hÐ§OŸŸúýþ\Z\"HÔ“œœ\Ìþ.‰£¯OiQ$\ä5\ä‘\0D\"\Zø|¾Gcbb®	D¢žþýû«\íÛ·Ó£ ˆ \Ð&~¿°n—ˆ\"QORR’Y:œ-2K£%‘×D‰(‰\ÄtË²J‰\"Q\ìÚ¸g\Ïz‡‹DQÁ¢EB^C	@$¢ALL\Ì\n\Ý>$ˆD=ýúõ3³E\â\â\'G\Ô\Ñ“›k\è\ç\ä5\ä‘\0D\"J\"±I·w‰\"QOBB‚*(( Gq¸HH;S˜\ÛD$\ä9\Ä‘\0D\"Š\"±W·D‘¨\'>>^\íß¿Ÿ\Å\é\"qýº*zkI\Óa\rýœ¼†< €HDË²\Þ\×\"±ŽH \rD¢°°\ÅÁ\"!+Wž*X\Øb„¼\Æê–ˆ Q\ÊHë¶H õ\Ä\ÅÅ©ƒÒ£8Q$®_WŸ\íV\ï¿6¡E‰°›#Ç’@$\0‘ˆ¿\ß_&	D¢H9r„\Åa\"\ÑV‚\ì\"ˆDe$¾ôù|ýˆ\"QOll¬:~ü8=Š\ÃD¢=YˆÖ²ˆ\"ˆDü@‹\Ä\r-ÿ—P \rD\â\äÉ“ô(‰p%\Ânˆ\"ˆDˆŒ‘xi‰¨ÿ!\á@$\ê	\êô\é\Óô(N¬‘ !·\ß~;\"\Ñ~‰¨½õ\Ö[\ß\Ó\"¡¾öµ¯M#$ˆD‘(..¦GA$	ðòð\Û\ßþV\Å\Ä\ÄHLLü—›\Ö%B·©u³\Z=¯‹„\ß\ïW%%%ô*ˆ\"ž\ã\Î;\ïT².‚nµº/|#!!\áo¹\ì´*m=^‰\Ò\ÒRzD‘\0\Ï\ÖH\è~ð\×111Eº\Õ\èûzô\ÑG¿\Ë\å§MY°_ŸH¨	U^^N‚H \àY‘°\éÛ·\ïj™8§\ÛMË²\Ö\ë\Ç\ßF\"Ze\"™	DÂˆDEE=\n\"H€\çE\Â&66\Ö\Ò2Qªe¢Z÷‘\Ïk¡øÑªLÔ™ð°H\è“E]¹r…‘@$\0‘h„\îh‘ø\\\ßVi©xF?u\Ñ\â\×Õ™ð°HH\Ç\nˆ\"ˆD‹B‘©\Û\Ý*À4$‚š	D¢‘H\Ô\Ô\ÔÐ£¸X$:d¦ùþùŸÿ¹úú×¿nn{õ\ê•r]Glš¼÷\Ïþsµk\×.D\\%6\"\"uR‘\éb‰\Ì\Ëòvd`\ZGÍ„\×D\âÒ¥KF$\æÍ›‡L¸T$dgW‡ü\ÇT\ï½÷žy\îÄ‰*111ª\"!÷÷\î\Ýk\îÿð‡?D$À•\"a_<ý~ÿ|\î¨ö\Ð\ÕŠ\ä\ä\äDY\"N\Ö\Å\æd+2\Ñ\Òqd&¼–‘8zô¨\êß¿¿JJJR‡¦gq™Hô\ì\Ù\Ót–;v\ìh—4÷xÝºuF\êVlõX¹\Çw\Ô?–©\Å			\ê[\ßú–yþ¡‡RgÎœQ/^4\Ïõ\èÑ£Á\Ï\"enÿ…	\è®\"aL)Ä”‚L-ŸIfW](Djda­0„¢¹\áŒ\åÁ™\Æd\"X\"\ì¶,Š\Ã$\à$‘$‘““cfpÌ™3‡ì„‹DB.\ÞòTYYÙªHˆ$´$ù—i.ú’\ÝhMB\Þx\ã\rsÿ‘G©]2ò\\AA\ÙN\î\ßw\ß}æµŒŒóxÛ¶m\æ±ÈŽ<–\ç\ÉH@w‰ ¡ø¶L•)£2u4üWˆ„ÈŒ,®U«ow\ê¾ü\îj\"š“„`™h\ëõ[\æð H\ØHG¯\Ötþ¤—ñHg\Z‹\Ä\Ýw\ßm^—¬Ä°a\Ã\ÌÿIs5ö°†\ì\Ý\Òøû7[ZŠŠŠ\Ì}»^Cn\å±<H€SD\ÂF±’Å¬dQ+Y\ÜJ¹\êD‘\ï©\ìV\'+zö\ìù\Í0+[’…¯µS\"˜\Í\áU‘°³.4Ù‰Y³f©\ê\êjzm´öv¡¤\Ü\áh,P¿û\Ý\ï\Ì1òüü\ãf¥#33\Ó\ÜðÁ›ˆ„\Ô\ã4÷½ûô\éS?ô\"·ò˜\Z	p¢H\Ø\È2\Ûú\"ž\'sY~[ß¿·DBµ\Ðd\Ècb˜³3š“‰ª$¢±LP3\á‘°‘­\ÅSRRLvBR\Ú\àL‘K)¶”L=4!Å–R·`ó½\ï}\Ït\n’	\È\Í\Ím\"v“\Í\Ý\äy9¾9‘õH${!\í™ö\Ð\ÆØ±c›ýù\ì\áû\ëd¤½µ-ýœˆt¥H\Ø\ÈF`Z$g	ô4\É\ÜÔ·7ô\ã\ëúþU}ÿr]\Ñ\æ\Ý\Î\ëV¬¨o\ëcI\íƒn{e\È\Â\çó½ªo7\è¶Z³\\Ö¶Ð·³Z	»]\Ó_û¤þ±Æ†8\ÜÐœL„\"sxY$l/^l²Ó§Og½	Š„´#GŽ¨¸¸8#2t ·?üpý\ë/¼ð‚ºë®»št/\ØòµR¹yó\æ/\æ3f\Ì0\ï¿ÿ~óXŠ*\Ü\äýƒ>™2*\Ïýò—¿©‘€\î,A5¥Ï·¿LEŸ>}~¬/\ê÷=þø\ãÿ\Ó}kœn©ú\"?B2\"2#DÂ²:YxY\ßn‰™Ðß®“‹ãº‰l\×\ÉG[\"¡z÷\îmÿ¾\ÇBü¾\ÖL&¢ª\îùPx­\îkÀ¥\Ýc\"!È˜÷€T¿~ý\Ôþýû\é}&4DºN$:©F¢%øX\ËGF3\Ã\Z\ífˆvFb—uŠ„Í²e\ËLv\";;›\ì\"H\0\"\Ñ\r\ZÂ²¬÷|>\ßÿ„Yh\í\Z‰‰\\\"\r5\0RSS\Í»Œg\"H\0\"Ñ¥\"ñ\ë:\â\Î÷t\ëÑŽ/\ë\ÌY,N…H4\Ïò\å\ËMvbÊ”)¦\Ò	D‰Î§OŸ>?•Y\"a.F\Õ\ÜlŠh­#\Ïl\rD¢M¤ŠÐ A*>>^\å\ç\ç\Ó+!ˆ \Îbb3ƒh®l9—\Ë8\"\Ñ.V­Ze²YYY\ê\êÕ«ôNˆ\"ˆ„sè¨½6D\"4JJJTZZš\ÉN\ìÙ³‡\n‘@$\0‘p^f\"X&–\ÝÒ¾\Ý?ƒc½D\"rdA#Ù²z\âÄ‰d\'	D	ge&\"©i@\"‰\èqþüy5d\È³\ÒÎ;\é­	D	gf&\ÂD\":¬]»\Öd\'Æo–OD‘\0D\Âq5H\"Ñµ”––š#ccc\Õö\í\Û\é¹	D	gd&\Ú3\ÌOa%\"\Ñi¬[·\Îd\'ÆŒcv‚D‘\0D\ÂÑ™	»¦‰@$:²²25|øp“Øºu+½\"H\0\"\áL™hný	@$:\r6˜\ìDff¦ª¨¨ 7C$	@$º¿LLq\Ø‰Ž¥¼¼\\edd˜\ìÄ–-[\è\Ñ	D‰\î]3!2‘w»x\"ÝM›6™5j”ºxñ\"=[3\ìÚµ‹‹?\"ˆD—g&,\ËRH\"\Ñ-‘¡±€†\ìÝ»\×Ô— \0\Ñi2“H\ä\0‘\r\Ùe´oß¾\ß&ˆD·E†8D&d\ÈC†>\à+NŸ>­òòò\ÔgŸ}†DI\"N:\Å? ¡‹Dm\ïÞ½ÿšH \Ý\Z)¾”\"L)Æ”¢Lø_™Ø½{·I\Éw\×&·u\çŸO\ZˆDD\"QcYV\"H8™*\Ù	™.*i}\è\ÞÈ§}I{ ®‰›}ûöý‘@$ƒ,\\5v\ìX“­ û\"K #€H¸^$ª}>\ßýD‘p²´¶d\'d©m\ã†\î‡\Ì\"€H¸^$ªô»ÿ\"ˆ„c?ñ\Ê\æ_’X³f\r\éfˆ\àI\0\"\áj‘¸fYV_\"H8\ZÙ–\\¶\'—m\Êe»r\èœ;w‘\0D\Âý\"ñ¥>Ï“ˆ\"\áx®^½ª&Nœh²¹¹¹¤ ³J\ä\ï€H¸Z$.\é6„H ®A\ÖVˆWiiiª¤¤„€t!\'Nœ0u,\0ˆ„«E\â¢n™D‘p]v\"++Ë¤\ÕW­ZE@ºˆ#GŽ €H¸Ë²\ÊÀd\"H¸’7\ß|\Ód\'\r\Z¤Š‹‹	H\'SXXh\â€H¸:#ñ‰nO	DÂµTVVª)S¦˜\ì\Äò\å\Ë	H\'²ÿ~D	÷‹D±eY\Ï	D\Âõ¨„„•ššªÎœ9C@:)#$1@$\\-\êjË‰\"\á	d\É\æ\ì\ìl“X²d	\é`d‹\Ä\ÄDˆ„»E\â\Ýr‰\"á¹”{¿~ýÔ€\ÌE\èv\ìØ¡’’’ \î‰Ã–e­\'ˆ„\'³Ó§O7Ù‰Å‹\à\ÕW_U\É\É\É	£%\âÝþ‘H žEfHú=%%E<y’€D‘M›6™¬\0\"\á\êŒDn;ˆ\"\áiª««Õ¬Y³Lvb\áÂ…ª¦¦† D\r6 €H¸?#±[÷o	D44\Ù	I\Ç?~œ€D\ÈK/½d\Öð\0@$\\-¯\Å\Ä\Ä\ì#ˆ\Ô!Ùˆ9s\æ˜\ìDNNÙ‰X½zµ\Z<x0\0D\Â\ÝC›t{—H ÐˆÃ‡›ýû÷WG% a Ë“§§§@$\\L øƒeY\ï	DZ\ÈNÌ›7\Ïd\'\ä–\ìDh\ÈJ¢Ã†\r#€H¸;#ñ‚n\'‰\"­ 	\ÉLH†B2\Ð>–.]ªFŒA \0‘pwFb‰eY	DÚ‘š	\ÉNH\rÙ‰¶Y´h‘\Z5j\0D\Â\Å\è>1G·‰\"\íDfsÈ¬™\Ý!³< e\æÏŸ¯FM \0‘p÷\Ð\ÆL\Ý>%ˆ„˜õ&$;!\ëO\È:\Ð©+7n\0D\Â\Ý\"1Q·D‘€0•0eEL\ÉN\È\n™ÐÙ³g«\'žx‚@\0\"\áb|>\ßý¡\ês\"H@\È^’½;døŠ™3gª¬¬,ˆ„»k$Ru»L$	ˆ\ÙET–ƒ–]EewQPjÚ´ijÊ”)	wm\Ä[–u•H %–-[f²\Ù\ÙÙž\ÏNˆDˆL\0 \î%ô\Ö2QI$	ˆ\"gÎœQ©©©*!!Ax6“&M2\Ã\0ˆ„{±,\ë7Z$ªˆ\"€¬\ì(\Ù	ùd^YY\é¹\ß_\n-¥\à\0‘p/qqq¿\Ò2QM$	\è Š‹‹\Í˜ñññ*??\ßS¿»Lý”) \0ˆ„{\éÓ§\ÏOõ¦\Z\"H@#XIvBf1\\½z\Õ¿sff¦z\æ™gø\ã\"\ábô‡¤\Æ\Ä\Ä\Ô	D:’’•––f²{ö\ìqý\ï+\Ëc\Ë2\Ù\0ˆ„«E\âûZ$ˆ\"Inn®\nj\âÄ‰®\ÎNÈ†]K–,\áˆ„‹\éÙ³\ç7	Dº€ó\çÏ«!C†¨¸¸8µs\çNWþŽC‡U+W®\ä\rˆ„\Ë‘˜2e\Ê×ˆ\"]ÀÚµkMvbüøñ\êÊ•+®ú\Ý\Ò\Ó\ÓMm\0\"\á~‘\èÛ·\ï_	Dºˆ\Ò\ÒR5l\Ø0«¶o\ß\îš\ßK\êA^|ñEþÀ€H¸Ë²j“““@$	\èbÖ­[g²cÆŒQ—.]rü\ï#\Ó^\åw@$\\Ÿ‘¨\Ñ„\î!ˆt\Ê\Ê\Ê\Ôð\á\ÃMvb\ëÖ­Žþ]d\ï‘\r6ðGD\Âý\"qS·ûˆ\"\Ý¹\0KvB\Öb¨¨¨p\ä\ï [¬oÞ¼™?& .\Ç\ï÷\ßxüñ\ÇÿƒH \Ð\Í(//W&;±e\Ë\Çýü\É\ÉÉŽÏª\0\"íª‘¸®?ø<F$	\è¦lÚ´\ÉÈ„,ðtñ\âE\Çü\ÜIIIjÇŽü‘pÿ\Ð\ÆU\ÝD‘€nŒ„ˆ„…ˆ…HLLô\Ä\nž€H 1W,\ËJ!ˆ8\0\â™!ú\è.\È\æd\'NœhP\ÏÑ¯_?µw\ï^þh€H¸h£B\Ë\Ä0\"H€C‹µaJ1fw™!?,J\Ó\\“\Í\ÊD~d¨\Ã+–\"\á±b\ËrŸ\Ï7žH \à0¤Q.\Ð2]T¦v%§OŸnQ$ì–““\Ã\r	wf$Jõ›iD‘\0\"W;\Öd\'ºzñ\'YH«%‰Ÿl ®­‘øX\Ë\Ä\\\"H€ƒ‘¥µ%;!KmË’\Û\Ý-+A6	W‹\Ä-‹‰\"G6ý’Í¿\ä\Óÿš5kº\äg­\Ã\ÉF\0\"\á¹\Z‰S>Ÿo%‘@$À%È¶\ä²=¹lS.Û•w&h\"Ë–-\ãˆ„»k$Ž\és}-‘@$ÀEH`\âÄ‰&››Û©\ß[6\ë²%\"!!AUUUñD\Â\Ý‰ƒ>Ÿo#‘@$À…\ä\å\å©øøx³¥wIII§|\Ï]»vÕ‹\ÄÚµkù#\0\"\áþŒ\Ä~-\"ˆ¸8;‘••e\ÖsXµjU§|\Ï\Ô\ÔT#NZ\Ò\0‘»\Ør¯n»ˆ\".\ç\Í7\ß4\Ù	z•(;’üü|Õ»wo†5\0‘ð†H\ì™ ˆx€\Ê\ÊJ5e\Ê“X¾|y‡}Ÿ§žz\ÊtÈ“&M\"\è€H¸Ÿ\Ï÷ª\îS\Þ&ˆxˆ‚‚S)CgÎœ‰ºD\Üz\ë­\ê\Þ{\ï5·\È ®\ÏHl\Ð\í‘@$ÀcÈ°Cvv¶\ÉN,Y²$ªa\ËÃ´iÓ	@$\\Ž\îC\Ö\ÈP\"H€GÙ¿¿Ù©sÀ€fu\ÊhID[\Ï ®\ÉH¬Ð­ˆH \àñ\ì\Äô\é\ÓMvbñ\â\ÅQ“ˆÆ¯K†\0‘pH,’e²‰\" \nUbb¢JIIQ\'OžŒŠD\Ø0\Ìˆ„;	s,\Ë*!ˆ€¡ººZÍš5\Ëd\'.\\¨jjj\"–ˆ`™¸\í¶\Û\ÈL\0\"\á\"´DL‰‰)%ˆ@<h²\É\É\É\êøñ\ãKDð×‰L™\0D\Â5Ccu+\'ˆ@$1g\Î“­À\í\ìD¤”\ÔL\0\"áªŒ\ÄP-_	D E>¬’’’TÿþýÕ„	\ZH„È…\ÔT´6\Ò\Üq\ÔL\0\"\á\Z‘H\Ñ\"q…H \0mŠ€ˆ\Äoû[5~üøú\çzô\èa:_¹mI&Z:Ž\Ì \ÎÇ¯\Ñ\"qH \0\í\ZŽ°%BC]\ÇÛ¢LK„\Ý\Ø\ä}\ÉL\0\"\áL|>ß£Z$®	D M‰h|±oN‚e¢­\×m\æ\0D\Â\Ñ\"ñµH\Ü ˆ@HÑ–L\È4\ÒöHDð÷a6 \Î#66ö_´H\Ü$ˆ@\ÈÑšL|\ã\ßh·D4–	j&\0‘p”H\Ü\ã÷ûkˆ\"–D´&¡H\Ã€H8“˜˜˜¿×­–H \0õœ={\Öt¨÷\ÜsOH_\'\Ã3òXž…^½z™¯•Ÿ\0‘\è\Þ$&&~G‹qC$\0š\ÏH´w˜!\Ú‰q\ã\ÆñG\0D\ÂÜ†H \0\roD«F\ÂÞ‹ƒa\r@$7¼!ÓºÿŒH \0!\ËD4gm°8 \Î	¿\ß7‘@$\0Z¼\È77›\"Z\ëH\ä\æ\æ2[	g‹D­eYÿ‘@$\0Zvhœ1ˆ\æÊ–£F\"È€H8W$jÀÏˆ\"\Ò0G´ö\Ú@\"\0‘p¼HTûýþ_	D Ý™‰`™C{vÿ>Žõ\"\0‘pZ\"ªúö\íûŸD‘\0hwf\"’š$	\×e$*u{œH \0.\ìö	ˆ„+E\âK\Ý\â‰\"Ð¡R€D\0\"\áÚ¡K>Ÿo‘@$\0\Â\ÊL´g˜C¦xRX	ˆ„k3Ÿk™E$	€\ÉL\Ø5H ®‰2Ý²ˆ\"u™hný	\0D\Âu\"q\Þ\ï÷\Ï\"ˆ@TdÂ–†ö{\0 Ž‰sZ$rˆ\"1\Ù\Ù\ÙÊ²,õÀ°‹\' \Þ‰\Óú¼_J$	€ˆ¹zõªª\ÛR‰\0D\Â#h‰8\á÷ûO$	€ˆ¹xñ¢‰³g\Ï@$¼#Gôy¿ŽH \0SRR\"\Û	@$<„>\ç}>\ßf\"H\0D\Ì\éÓ§U  €Hx«FbŸeY¯	D bŽ=ªbcc	 \Þ‰<\Ýö	D b\nU||<\0D\Â[\"±]··ˆ\"1*!!@\0\"\á!¤>B\ê$ˆ\"1»v\íR‰‰‰	oe$\Ö\É\Ì\r\"H\0DÌ¶m\ÛTÿþý	 \Þ‰\\YK‚H \0³i\Ó&5`À\0ˆ„‡\Ð±\Ì\ï÷H$	€ˆY¿~½JMM%€Hx-ócbbŠ‰\"1«W¯Vƒ&€HxK$f\É D‘\0ˆ˜+V¨aÃ†@$¼U#‘¥[‘@$\0\"f\éÒ¥*##ƒ@\0\"\á-‘\È\Ô\ís\"H\0DÌ‚\Ô\èÑ£	 \Þ\Z\Ú¬E\â‘@$\0\"f\îÜ¹lˆ„\Çðù|ý´H|I$	€ˆ™9s¦š8q\"\0D\Â[Cÿ{÷bÕ™pú¢”\r”¥,H\è‹%/Zò¢ú¢P\ÊR–B-„\rŒ\Þs\ï33Æ¨‰\æ¯\â\ß7ÿˆML\ÚÄ‰iþI¦tm16)v\×\â0Gd4-M\Æ`2§kQ3Ž3§\ç4\'®Î½wœ™{Ÿ\ÏY–e~\Ù{\ïw\Îó\Ü\ç\ÌÉ®ó&!$ f6lH»ºº!‘¹s\çþm©T\Z2	!5[»v\í\Ø]	Q\í‘øQ±X6	!5[µjUºq\ãFƒ@HÄµ´ñ\ç\Ùu\Ñ$„\Ô,|c\ã¹\çž3„DD\Ú\Ú\Úþ$I’Q“P³x Ý¼y³A $\âZÚ˜U,…„€Ú…S-_y\åƒ@HDd\áÂ…\ß\ËB\Â\ì„\ÔnÉ’%\é›o¾i‰øöI„\ÙýžI	¨É¢E‹\Ò\î\înƒ@HD³g\ÏþC“P“\Î\Î\Ît\çÎˆL\Øl9oÞ¼?6	!5iooO÷\ì\Ùc‰ø6\\Ž455\ÝjBj²`Á‚ô½÷\Þ3„D|K›››ÿ\Â$„\ÔdÞ¼y\é!_H\\(\nmBj\Ò\ÚÚšööö\ZB\"¾ø&‰;MBH@Mš››Ó£G\ZB\"¾Í–\ç²\×bBj‰\ãÇB\"¾;g²\ën“P“R©”ž8q\Â ñ…\Äÿ%IrŸI	¨I8”fpp\Ð ñ…\Ä`v­0	!5‡Ä™3g!_Hü&I’.“PsHŒŒŒB\"¾8™…\Ä\Ó&!$ jCCCc!B\"Êø4»þ\Ñ$„T\íô\é\ÓB!oHüWvm5	!U‰H%Iòa©T\ÚfBªö\É\'Ÿ¤\år\Ù qÞ‘8’];LBH@\Õ>úè£±©@HD½Ùµ\Û$„T­¯¯/mii1„Dœ!q I’3	!U;xð\à\Ø\Ó?AHD\ïg\×/MBH@\Õö\ïßŸÎŸ?\ß *•Jÿ’$II	¨Ú»ï¾›\Þ}÷\ÝˆP¡PØ™\ÅDŸI	¨Ú®]»ÒŽŽƒ@HD(I’\îb±øk“Pµw\Þy\']¸p¡A $\â\\\Úø§,$Ž›„€ªmÛ¶-]¼x±A $\â¼#±9‹‰OLBH@\Õ^{\íµt\éÒ¥ˆ3$þ¾X,~fBª¶eË–tùò\åˆP¹\\þY&!$ j/¼ðBú\ÐCB\"ÎX•…\Ä)“PµgŸ}6]±b…A $\â\Ül¹<»N›„€ª=õ\ÔS\éš5k!¡b±Ø™$\É\×&!$ j=öXº~ýzƒ@H\Ä\å\ì:kBª\"\"\Ä‰(÷Hü$I’oLBH@\ÕÂ²FX\Þ\0!\å‰¿É®&!$ ja£e\Øp	B\">I’üe±X6	!U_ý_!eHüY#&!$ jË–-;”\n„D|\Ú\Û\Û˜\ÅÄ¨I	¨Z8;“\rB\">s\ç\Îý£b±h~Bªw\ï½÷¦o¿ý¶A $\â‰\ßBj\Ò\ÙÙ™\îØ±\Ã ‘\n!‚\Â$„T¥££#Ý½{·A $\"‰;\ï¼ó&!$ *,H÷\í\Ûg‰xCb´µµõ“P•¶¶¶tÿþýˆT©T\Zijjº\Í$„T%ûK$\í\é\é1„D¤’$niiù+“P•\ì\r$\í\ë\ë3„D¼K\ÂQ\Ù&!$ *\Í\Í\Í\é±c\Ç!oHœ/\nw™„€ªd‰¤ýýýˆwi\ãlö>\ÐbBª‰ƒ@HÄ»\Ùò\ë\ìº\Ç$„T%|‡ü«¯¾2„D¼!ñ\ÛB¡ð€I	¨:$†††!\ï\ÒÆ©r¹¼\Ê$„Tlddd,$@HD½\Ùò‹R©ô˜I	¨Ø™3g„B\Â\Ò\Æg…B\áY“P±ÁÁA!°´ñ?\årù\ç&!$ b\'Nœû\Ö‰¨—6Žg\×\ë&!$ bÇ;\n„D\Ô!ñ\ër¹ü\Ï&!$ bG	K‡K¥\Ò/LBH@\Åz{{\Ç\ÚB\"\ê;³\ë_MBH@\Å8Î›7\Ï +•Jÿ‘$É¿›„€Š\íÛ·/]°`A $\â¾#±/»þ\Ó$„TlÏž=i{{»A $\â‰\ÝI’2	!Û±cGºp\áBƒ@HÄ½´ñNGLBH@Åº»»\ÓE‹B\"\î;oe\×G&!$ b¯¿þzºd\Éƒ@H\Ä}G\â•,$þ\Û$„T\ì\å—_N—-[f‰ˆ%IòYHô›„€Š½ø\â‹\éƒ>h‰¸—6žÊ®“&!$ b›6mJ}ôQƒ@H\Ä?Í®\ß\\Zæ˜•]?jjjº\Íd„\\\×Æ\ÓU«VB\"žý³’$9—…\Ãpv„§ÿþŽk¿i		¸®\Ç<]·nA $\âºñ«kD¸F\Û\Û\ÛhRB®«««+Ý°aƒA $\"»+‘]×º\ÑkJB&dÍš5\é“O>i‰øb\â¿+$’$ùS0!+W®LŸy\æƒ@HDxW\âj{$\Â#\ÅMGHÀ„=ò\È#\éó\Ï?o‰•\ËåŸ‰\æ\æ\æ\Äd„L\Øò\å\ËÓ—^z\É ‘ºô\rŽ\Ë!ñ™‰	¨\Èý÷ßŸnÝº\Õ ñ.q,¿\á?›ˆ€Š,^¼8}ë­·!÷]‰¯³ˆ0C!\×öùçŸ§ÇŽK¿ý\ï\î¹\çžtûöí†ƒˆ\Äw\Üñ\ÅbqÍ¥³$Ne\×Ð¸}³\ë³\ë`\ØC\Ñ\Ö\Öö}S0\æ‰\'ž¸\Ö4a“U\Ú\Ò\ÒrEh€h\á\È\ëpZe®s\ÕW8o\"I’Ã±Ù¦($ˆ\ÜÙ³g\Ó\ìM\äšo\Z«W¯6(„DƒÝ\ÈB`\ïõ^û¼ºC!$ˆ\Ü\ÓO?}\Í7Š°üB¢1Ì™3\çÇ¥R\éüø\×y\ØµeË–´§§\'=yòdzþüù±9†~ù\å—\é|¾ñ\Æc\ß\êº\Ê9\ç\n…\Â]¦+$ˆT…°©\êjŽ\Ë!\Ñ0(;š››¯8p*œ\"\á\âÅ‹ž\í‘#G\Æ\ì7þY\Ù\Ï\ï2e!A¤\Âò\Å\ÕB\Â\Þ„D\ãDD~)#\ìÚ½{wE1\ÞÞ½{Ó¶¶¶ñw\'Ä„ F}}}ß‰ˆÍ›7B¢A–3²ˆ\Í/c|üñÇ“2\çO?ý4½\ï¾û®¸3a™CH©ü›Aøkehh\ÈP\r°±2¿\'\"DD\Øó0™\Â\ÏË¿„=6`\n	\"tô\è\Ño\ß6m\Úd ‰\ÆX\ÒØ›ÿa²\îD\\\í\ÎÄ¸e\Ä(F\Þ!Q\ç\Â9ù}aOÄöL\ä—GÃ’Šz!Aƒ\n\Ë;w\îL×¯_ŸvvvŽ:•o>\éºu\ë\ÒW_}u\ì¼	õ%6•ÿvÆ…nø\ÜW¬X‘_\âø\ÐG½ Áô÷÷}¥s|8\\\ï\nañð\Ã§\rB¢>öF\äO¬_ñœ\nù%\Òpfv\Íòq/$h;\á8\ì\É8\É.Ü¥p‡!1\ã÷Ft\å7X\Öò5\ÏJ\å­\n\Ï\æðq/$¨s\á/„ùóç§“y’]kkk\Ú\Û\Ûk¸‰™»¬ñ«Ë¯×­[·N\é\ì·m\Ûv\Å\Ú>\î…u\ìý÷\ßÿ\Î2\ÆddN\Ãô”P„ÄŒ\r‰S—_«á…©\Þ_r\ï§}\Ü	\ê8\"¦\â$;1˜y²ðo÷G|ñ\ÅS:ûpG3ÿr÷B‚:–3B8L\ÅIv\áÎ„e„ÄŒ»#ñ\íkôò²\åT	¿/ÿû}\Ü	\êL\ØX™\ß1\'Ù…=6`\"$ffHL!!$¨c\á\Û\Óq’]xð	w$Ü‘Ô±pN\Ätžd–T@H\Ø#a„ N…Ã¦¦ó$»ph	\ß\Úð­\r!A\n{#ò_õœŽ“\ì\ÂÝÓ§Oû—˜þpŽ„€Ê„¯aÎ„“\ìÂ³9@HLû\ÒÆ“\Óõ~°l\Ù2\'[\n	\êQx\0\×Lø$¡\rBbz…gm„ý	žµ!$`\Â\ÂS<gÂšh{{»‰™±¼Ñ›\ß35w%ò\'\àzú§ \Î\ä÷GL\ç.\í°O„\Äôkjjº-{MŽN×·¸\æÌ™ócõB‚:2“¾7Bb\æmº¼\Ñ\çÊŒ{8`¯\é	\ê8$büý $¾«­­\íûI’œ»\Ñ\'\Ý.]º4¿¤q.ü^\Ó¸#\áŽB¢\n…»òK“ý\ì|D„\ß~Ÿ©	\ê= $®\æcb²ž<n9#Ü\è2m!Aò­\r•\Ä\Ä\åos9r¤¢Ù†¯x®]»öŠ€?WD	\êœs$@HLd™#¿g\"¿\Ü\Þ7:4vGóòòhøg¸\ãb#¼\Îó‡M\å÷DX\Î4€\î\î\ît&œd\çdK„\Ä\Ìß€™ÿ6GW¯•B‚žµ‘ò§gm $¸–p\ÎD’$‡ó\'`N\ä\n\'V†Ã¦²\×ûß™¢ Á¬^½:Î“\ì<ý!Q\ÂqÚ—ž\Í\îRœ\Ê?‚<w\Ôõ\éð\0®ð\ì\Ç^	\ZXxÑ§\Óu’]¸;B„u,¿\ér*O²wC@H€ Î={6mmmM§ò$»ðû\Â\ï!B‚\Ð\Û\Û{\ÅÇ<\É.üžðû@H€ \ìÚµëŠ˜¸Q\'\Ùmß¾Ý° $ˆ!&&ó$»ðsEB„,s\ä÷LL\ÆIv\á\çY\Î@H€ a#dþ\Ûµ\\\á\Û6V\"$@H¡p\Î\ÄÊ•+¯8s\"Wøß‡Ã¦úúú!B‚Ø…\ã´Ã³9\Â]Šð\Ô\Ðü#\È/‡CxŠgx\0Wxv†c¯ $\0„	\0„	\0!B@H€\0 $\0	\0„	\0!B@H€\0 $\0	\0„	\0!B@H€\0B!€\0! $@H\0	\0B„\0B!€\0! $`ŠC\âüùó^\í\0“lxxxTH\Ððn¹\å–\ÑC‡y\ÅL²Ã‡Ÿ\Í\Þf/ø¤¡¡\Ýz\ë­Îž=\Û+`’\Ý|óÍ¿\Í\Þfú¤¡\ÑÍºé¦›¾¹ýö\ÛG{zzF‡‡‡½újX\Îw\".E\ÄPxõ1C1‘]û/ýŸ>u¹\\.WMWX\Î\è\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\Íþ«•\Í-Bl#\Ý\0\0\0\0IEND®B`‚',1),('9',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0>gIDATx\Ú\í\Ýp¾\ïq\n_\èZ[®\åYŽµµ\ëµ,)Ë²,<\Þ-÷\áj\\¯{-ÎºI¦;=“qAPp  ««®r\ÔUv‘#*W÷®¨¨+ 1\nˆ	ò’‡wB^\Ó÷ÿŸ\í\á!™d2Ýù~ªþ\ÕóJÿyü\æ\ß\Ó\ÓÝ§\0\0ð§±\Ï/·‹\æ­o\Ö\ÒÓ­kÿ	û›\Ø\í^Xn‹\'¤nx\Ö\ê\æx\Åo\'þ¤·›øÊº9}\ç™ÿ\Î\n›n\0´›\Ö\ìk9$\Ëÿ#õ\ß\ZÄ¿cs\ã\ßß¡!<O\ê_õv+v\ÔýÏ—>mÑž<÷‹úq/¬°5\Ðc\áÿú\Æ&¹ü\ï\Î\ïûhVY\Ýþø\íâ¥·\Óeüv\0\0 ›\Þ\Ùp\ì˜\ì¸ÿ\å‡^”©úŸ\Óö¿&\Þî²ý\Ç\Ç\ÍX)·+9mBC[½)0¤>ÐšS\Þô\ÍC.mq\Î\ßI·\0\è\"\r\Õ	/­i”@};\Â\Z\Ú3?Š\ê\é§\ÞÿªA—z»‰¯®m÷Ï€.{xfit¬·†ñX™¾žµ:\Z¿]\Â\ï\Ó\Õ\ëoLý\ë¶zù·¶ýù\Ûþ‚Ž\0\ÐM°?zp\æ\ê\èC3WE\Ô\Õ\àÏ¯°5p\ß\ÝpøøƒYø\êg\Í\Î\í~ªA­Ë‡þ²*ª§õvÿù\Êg\ÍrY©N\éñß§§u©{üs\î©ÿw\Ë	V—\0/\ÖP\å¬ò6\Æ&|†­ýs/9µ‘™s»‹ô6j€;“úøWG5œo?ýú»R—N _D\Ç\0\è\Þ\Ô\ÝO\Æ\á\n\'X\çNœ³®ù¹%G:!=w\Ö\ÊýuK¾<qÌ¹\íÿr&\ï¹ø;\Ér¤÷8©)ó7\×\ÉùO\Û]ŸÂó#¥–\ë\Æmt\0€\î‡÷ÿ\Ö\à÷\ç•\Ñ\é|{hüKŸ¶|öM“nu¾òÏ¥\'jtµ¸œ~@*¬«¿5¬\'¾¼¦eAYM\Ý\ß\Ö}{\âÁ?ŠŽÿ\ïO[&\Ïû\\\Ãÿ­\Äß·h¿½[\Î\×\Û;ô\ëd/,?zÀ\ÙX\í:\0@\×\Ã{\Ôb©k4luƒ4ý;ñ;\Ür\Ý#-¶½{\çQ»VNÿö÷onl\Z\ß\Âü…ÿ)±¨õ\ï›0{M\ã#/~\Ò\Ôú÷\Ñy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02FÚ³xñ\â·gÌ˜q|úô\éÑ‡zÈŽD\"vAA‡\íq\ã\Æ\ÙS¦Liœ6mÚ¾1c\Æ<H\Ç\0\0p\É7\ß|š7o\Þ\ÑxÀ5j”ýê«¯ÚŸ|ò‰]UUe\×\×\×\ëq\ì\Æ\ÆF»¦¦\Æ^»v­=þ|û\Þ{\ïµ\ï¿ÿþ\è¤I“VY–ÕŸ.\0™I»ÿò\å\ËŒ=Ú–I\ÛÞ¸qc,¤“UQQaË”n>Ü–)}\Z\0 ‡§\í?ý\éOÑ±c\Ç\Ú\å\å\åvwlÙ²\Å3fŒ}\Ï=÷\ìD\"\Ñ]\0\0\Ò\ìØ±cc¦L™b?ÿüóöÑ£G\ít\Ð\Õ\ëúû\î»\ï¾Ã¬F\0 \Í·÷SO=e777\Û\é6s\æLÀ¿\Í\É\É\éG·\0\è&ýŒ[W•\ë„\ÜÁ÷\Üs\ÏÙ………{\è8\0\0Ý¤§\ég\Ü\éZU\Þ\Ñ*ô{\ï½7jY\ÖXº\0@\é\êrÝª\\·(\ÏÝˆ-\nµðù7\0\0]¤\ß\ãÖ¯ƒe\Òc=\ÖXPP°ˆ\î\0\"\Ýsš\î€%SSwÜ—_~i\Ë\ä\Ý\Ä\Æk\0\0¤h\éÒ¥\ï\éž\Ózr#µöD\"‘\Ó4‡s/\0\0\ÝW¹\îò\Ô\r\Ï>ûl]AAA)÷\0\0)ÐƒŒ\è¾\Ê\Ýðñ\Ç7KxWr/\0\0=:˜d\Ä\rˆJx7p/\0\0=œgü\è`™¦:\ÑCŠr/\0\0\rO7\Þ\0\0¤h\èÐ¡nN\ÞQ\Â\0€=ø\àƒ®}\æ]SS\Ó\Èg\Þ\0\0¤h\êÔ©\rnmm¾xñ\â\Z¶6\0 E>ú\è·¾\ç=eÊ”j¾\ç\r\0@ŠÆŒs×½÷\Þ\ë\Ê\Öt÷¨\ìa\r\0€®xK¦÷m^VV¦«\ÌÙ·9\0\0]1yò\äO?ýtF\Ã{Äˆ\ÕU\0€.ŠD\"\Ý}÷\ÝÑŠŠŠŒ÷§Ÿ~z@§nŽ\ç\r\0@7\ÜÿýSFm=z´Gƒ»®®®%6Jp¥\ë\0\0tÓ½÷\Þ[õ\ì³\Ïö\ä\ÆkQù7jL\Ó\ÜI·\0H\ÝxL&ð3f\Ì\è‰\0Nš4\éký^·®¦§\Û\0\0¤1ÀGŒQó_ÿõ_ö‰\'Ò¶ªü¾û\î\Ó\r\Ô*ùœ\0€\nðp8¼s\äÈ‘\Ñ\r6t{\ã4ýŒ[W•3q\0\Ð\Ãt£²\Â\Â\Â\æ©S§6iˆ§²*}Ýºuµúº³U9§\0):-\Ë\Ôü¦N\ÏC†‰NŸ>½n\åÊ•\Í\Õ\Õ\Õ-z<n\Õ\Ð\ÐÕƒŒ,Y²\ä€\îòT÷œ¦¡­\ß\ãf59\0\0.’0KK\í‘@¯\Ó\Ãy&Tƒ~¦-U¦»<e\Ïi\0\0x;Ô£\ápør:\0€Â»\Ñ0Œ[\è\0\0þ	\ï\ã\ÞC\é\0\0>aY\Ö	\ï‰t\0\0ÿLÞº\Ûót\0\0ÿ„÷&	\ï\×\é\0\0þ	\ï$¼—\Ò	\0\0|Â²¬w¥\Ö\Ñ	\0\0|\Â0Œ—%¼·\Ñ	\0\0|¢  \àq©*:\0€O˜¦9Z\Âû0\0\0À\'Ã¸SÂ»žN\0\0\à@\àz	\ïf:\0€\Âûb=²\0\0ÀG4¼õ\Ø\ßt\0\0ÿ„w‹\Ôut\0\0Ÿ0Mó¤n¸F\'\0\0ð\Ï\ä}X\ê>:\0€Â»Jw\ÖB\'\0\0ðOxo\×Ý¤\Ò	\0\0|BL\"\áý\0\0À?“w±\Z”N\0\0\àÁ`ð¯Þ›\è\0\0>aš\æó\Þ{\è\0\0þ™¼\'Y–u€N\0\0\à†a•\Éû8\0\0À?\á}‹„w#\0\0À\'LÓ¼B\Â;J\'\0\0ð‰¢¢¢³õ\Èbº¤\0\0ø„N\Þ\ápør:\0€Â»Q?û¦\0\0ø\'¼\ëV\çt\0\0Ÿ\Ð\ïyKxO¤\0\0øgòÞ£{Z£\0\0ø\'¼7Ix¿N\'\0\0ðOx$á½”N\0\0\à–e½«\Çõ¦\0\0ø„a/Kxo£\0\0øDAAÁ\ãRUt\0\0Ÿ0Ms´„÷a:\0€O†q§„w=\0\0À\'Àõ\Þ\Ít\0\0ÿ„÷\Åzd1:\0€hxG\"‘‹\è\0\0þ	\ï©\ë\è\0\0>aš\æI\ÝpN\0\0\àŸ\Éû°\Ô\ï-ËºQ‚|¸\Ôt©t\0\0	{¼uµõ!ýŠ˜„tT?ónU\Í999ý\è\0\0 ¡\Ý_Ã¹À>U\è\ë\é\0\0\"=»£ð\Î\ÏÏ¿•.\0\à½\0?\Ö\ÎÔ½“\î\0\0\àA¡P\Èl+¼õ3qº\0€GÉ”½¥Ux7±¡\Z\0\0\Þ\ïØ‰[›—\Ð\0\0<Î²¬…ñð…B?¦#\0\0xœ®&—\àn\Ô	œn\0\0\à\Ü\Ï\Þ\0\0$°m»\ßÎ;+\Ë\Ê\Ê\ìeË–\ÙK—.¥ºP\Å\Å\ÅöªU«¢R3yT\0z”wii©]SSc744PÝ¨\Ú\ÚZ»¤¤$*A>G\0 \Ç\è\ÄMp§7Àeo\à‘\0\è1ºªœ\ÐMo\éjtY\0€£AC\à\Þ\0€^\Þ\ÇW\Ù;×¾jWÿ>VzZ/#¬	o\0€\ÃûØ¡}ö¦\ÅS\ì\r\ï?rZ\éezMx\0<Þ•\ïž\Üñ\Ú[±ˆÀ&¼\0^\ï/Wü±\Ýð\Ö\ël\Â\0\à±ðÞ´´¨\Ýð\Ö\ël\Â\0@x\Þ\0\0t\'¼u\ëòö\Â[¯#°	o\0€\Ç\Â{û\êí†·^G`\Þ\0\0…÷Á}\íMK¦ž¹\Ê\\.\Ó\ël\Â\0\à±ð\ÖÚµn\îá­—Ö„7\0À‹\á}ò¤½ý\ã™g®2—\Ëô:›ð\0x(¼uj\ÛV¿\Ð\îg\Þz{Y#¼\0^o™¨«¶/·¿øpR»Á/½Þ–)œð\0¸ÞM\ÛL\á„7\0Àc\áÌ´\Ý\ÑNx\Þ\0€‡wWƒ;^„7\á\r\0\ÈpxS„7\0€ð&¼\0 ¼	o\0\0\áM\Þ\0\0Â›ð\0€ð&¼\0„7\áMx\0oÂ›ð\0x;¼—,Ybÿü\ç?·\Ï?ÿüX\éi½,ñ6òO\Å\ê¿ø\Åi—\ëùøu­o«u\Î9\ç\Øÿöoÿf/[¶Œð\0 \áýü#²999ö7\ß|cWWW\ÇN\ëe‰ž\È\å\å\å±\ËÖ¯_\Ú\å­o«§KKKc§/¿ür\Â\0€t„w|r.++;u™žn=e\ÇY§ò\áÃ‡\Ç.9rd\ì|G\á?\Þy\ç:¯o†b\ç;ß‰]~\Ûm·Ù»v\í²<»lÀ€§ýz^\×\Ô\Ö\Ö\Þ\0\0\Â[Wk\'­V}}}\ì2\r\ÌÖ¼hÑ¢\Ø\ÏlÜ¸1¶\Ôó…÷Ê•+c§\ï¸\ãŽS\×G\"‘\Øe«W¯¶7o\Þ;}\Ã\r7Ä®;vlì¼®ˆ¯\Ò\×óz9“7\0€ð\îBx\ë\ék®¹&6\rë²½I;±t•ùW_}u\êz¶[\ßæ¬³ÎŠ]·}ûö\Ø\éÿ÷×¥ž\×\Ë	o\0\0\á-_\í½nÝº3V›ÿô§?m3¼gÏž;­ËŽ\Â[O?üðÃ±Ó¿ü\å/\Ï\ï#GŽ´ù7\å\å\åú\Ì]—z\ÞKŸy6\ì2Ë²F,\à\0\Èxx\ÇR?w\ÖÏ”7X[¸pa»Ÿc·µ%z[\ç;f÷\ï\ß?v>¾\Åy|µù„	\Úü}ñU\íñŸ\Ó\Õ\ë\Éü[ý]\ro\rk\Ã0\ÆKX¯‘\Ð>$KÛ©J\0€Œ‡w<Àu\ã´øD¬«\Ò\çÎ\Ûa@\'\ÞZø\Ãb\çoº\é¦\Øy\Ý0mÔ¨Qö÷¾÷½6·V\×Ò¯—µžþ3\Þo¿ý¶ól©\rÖ	a}Z™¦ù!@\0€+\áX:\r÷IX%žmUWWg\Ú\ívb\å\ç\ç\ß\Ê#\0\àzx\ë\Æj:õ^r\É%±¯oec€\ë–\î\Î—Šv\Þ-<ú\0\0žo\ê>ó…B?–>\ÞÁjó\Z©¥–e<xð%<\Z\0„·ö°&Á\Ü_‚ººðþL®{B7b“\0?\ê\\v\\N¯—šò\è\0\Þ.~ULC91¼5¸¯D\"9_û@n[-¥«Ü›d¹S¿R&až[TTt6X\0\0\áÁ\ïyK\0\Ït\Â;š““Ó¯“»¦¯\Üþv¹\í	õm²lp½Vª\Ø0Œq\ápøû<‚€ð¦zx\'-À\Ãuš\î\Ê}%?7@‚ûq	óO¥N­j—ÓŸK˜?#§¯\ã\r\0„7\Õ{XKb\êNÊ Aƒ¾+¡}\Ô{\ÜUº»®j—0\ß%Aÿºœ\ÎgU;\0Þ”\Ç÷m.¡ý+	ó—%¸·\êªv]E/a~@._.§\Ö\r\èx\Ô\0\áMyøÀ$‘H\ä\Ê`0ø¨w™\ÔgUû		ór	ò\çô\ël<\0€ð&¼=|T±@ p¡„÷\ÝR‹¤¾‰¯j—\Ú-õ†„¹)·9—g\0Þ„·‡\É~›\î‹]¦ñ-²<\él\Õ~@j…P%77÷Rž)\0@x\Þ&\á}…\Ô4gUûag7¯uz ¹üyY\ÞÀ3\0o\Â\Û\ÃFŒqö\ïd\nG–ûœU\í\ÍR{djÿ›,ƒ¬j\0Â›ðö8	ò[d\nŸ%Á½Y–ñU\í%\ÌW\Êu‡òž]\0\ÐC–-[F\à\Þ\Ý‡/ƒS%ÀWKŠ¯j—\Ó_\ÈrFaa\á\Ïx¶@š”––¶\Ô\Ô\Ôºiª½{÷\î‘ðn\ÈöÇ•®j—)ü.	\î·%À÷\Ê\éøªö¯õp©r¾0];«€¬³|ùò\ÇKJJ¢û÷\ï÷|0ž<y\ÒóÁ]\\\\\Ü$5GÖ™$°o– QªB¼Þ™Î¿•Z%Sû$Yþ.@’$l¦É´x\\W÷zµ–,Y;\Z——ÿF¸	\î\ä\r6\ì2¹O\'K•J°ë„¹†ú&	ø¿†q]\0Ÿ\Óð\ÖýyÓ‰\ÞIW£\Ë}–\Ð~KÂ¼\ÒYÍ®U)\ç\Ê\åCY\Õ\0>£[4³sv‘Ð¾Q§p\Æ\ã«\Ú\å2\Ý \î#©):½\Ó%\0ðöyK^^\ÞUt\"{\é›7\çóñU\Î\ç\å±U\íú9º~ž®Ÿ«\Ó%\0ð]…Ê4HW£\ë–\ëº»³%{³¾\É\Ó-\ÜuKw\Ý\â]·|§S\0\à^x7\ê\ÎA\è:¢\ß)\×\ï–K€o”\ÒÝºFïž¯\Ö\ï¢\ëw\Ò\é\0d.¼OÊ‹\ïo\èR¡V‘\Ç\Î©\Ýœ³7¸“R_\ÊdþR~~þ­t	\0z.¼O\è~´\éºC÷\Ã.¡mIˆ¿©ûgw¶h×\Èì“‹ß•Ë‡\ë¡S\é\0¤¼¨\ÕcQ\Ó	ôÀ\Ãœ#¦mpŽ uŽ¨V¦GX\Ó#­\Ñ%\0\èýŠ\ÔX:<\Öú\ë±\Ìõ˜\æzlóøªv\ç˜\ç³õ\èt	\0’›¼kõkBt™VTTtv(2%¸ß\Ú-\Õ\ä\ì¯ý©EºFˆU\í\0\Ðy¬’zœNÀ$¬¯—\0V“\åò\ÆR·\Ç\Ð]ø\ÑU\írùc‘H\äJº€ð.(øZ_,\é¼(_Ÿ\É\ãt™®%rö\× Ë­²|E\Âþ\×t	@6†÷Wº-:?\ÐU\íò˜Í—\Ç\ì\ëÞ»tU»³U{•œ\ß0Œ{\ØW?€^O7’½\×\è|üô:	\íg\äqü¹œ>®«\Ú\åôQ©Oõ#!vÿ 7†÷F\Ý`ˆN ·<xð%\æ\ã\äq],U\ël\Õ\Þ a¾M–s‚Á\à\ír³¾t\n€Ÿ\Ã{­\îDƒN ·\ÒU\íØ¹\Üôc\"\Ý%°ºTµœþ@ÿ£\"‘\ÈEt\n€oè¾©¥–\Ð	d	óRO\Ëcÿ³øªv©cúfV–O†B¡«\é\0/O\Þ\ËeòXI\'\ÍÀ\Å\Úcô¬<\'jœ­\Úe¹Cj®aƒû°ª€‡&\ïô;´t8M_=`<7\æIˆk€7:»w\Ý/µX~´>m\à\nyaZ¨[\é\Ò	 c\Ø\×H=%Ï—uºŠ]Wµs\\s\0nM\Þ\ä©‚N\0)?wlv\ß\nÀ†a¼¬_¡¡@\Êá­Ÿ‹÷§\0\Üxš!µ‹N\0©‡7‡5\à\nýºŒ¼\0\í¥@\Ê\áÝ¢_9£\02N‚{šnAK\'€”Ÿ;M………?£\02\Î0Œñ\Þ\éò\ä\Ý þ+:À û¤\Ó	 \å\çN½¼ù½“N\0\È8Ë²\î\Ò\ÝC\Ò	 \åð>!¤\02\Î4Í€¼\0\Õ\Ñ	 \å\ç\ÎQy\î\ÜM\'\0d\\ øµL\ß\rtH9¼\éþ\Ð\é€Œ“\à¾Q^€š\èòs\ç€a\é€Œ\Ó\ï©\ê÷U\é\Zy\ÞT\ëW-\é€Œ\Ó=Déž¢\èrx\ï\Ó•\Ð	\0‡¿¯X @\Ê\á½[\ê: \ãÀ¹„7Ð¥ð\ÞaY\ÖKt€[/Bzh\Ãs\é\Òóf³\Ô<:Àµð<xð%tH\éy³Á4\Í7\é\0·^„¢\ápør:$Ï²¬u†a¼C\'\0¸õ\"Ä¡\r\Ô\ßô~,µ˜N\0p\ëE¨Iw\ÖB\'€”ž7%R+\è\0·&\ï\ÝM*\0R\n\ï\Å:}\Ó	\0n½\ÕK\å\Ó	 ¥7½ïš¦¹–N\0p+¼†1”N\0)…÷\ß$¼\Ë\é\0·\Âûˆ\Ô}tH\éy3O¿\ëM\'\0¸õ\"tP&\ïñtH\éy3[j;\0\àÖ‹\Ð~©\":¤ô¼yA÷oN\'\0¸õ\"\ÄÑ‘€ƒÁ§\åy³—N\0p+¼9:zx?*\á]M\'\0¸Â²¬m†a¼L\'€\ä\Ésf¢<w\Ð	\0®\é¡B&\ïtH\éM\ïX©Ct€[/BŸ\Ëñ\0’\'ox\ï–7¾G\é\0·&\ïO$Àß§@Joz\å¹s‚N\0pk‚X%µŒN\0\Éƒ¹ºka:À­ð^\"µšN\0É“©ûWò¼i \0\\Á€.=on\Ô\Ã\é\Ò	\0nMoÊ‹\Ð:$/”\çM\0\à\nyš+õ%\0’‰D®”7¾Q:À­\É{–„÷WtH^nn\î¥ò¼!¼¸Ã²¬g\åE\èk:$/\\(\Ï›N\0p…¼\0=.U\åy\Ý\'//\ïZ:7Ù¶\Ýo\çÎ•eeeö²e\Ë\ì¥K—z®4¼½øw%Vqq±½jÕª¨\ÔLU€§\ìþ¦i\Ö\éV²º±¾ø´S%tn\Ò\à.--µkjjì††ªU[[k—””D%È§ó\Èü;i—v\ÚZ\ÑaÃ†]F§\à&¸	\îô¸L\â|/ðóô-\Õ\ÑÔ½†.Ámºªœ\ÐMo\éjtY€¿|a{\ámš\æ\0:·i\Ð¸„7€V\Ów[ŸyKp¯§;ðSx?\\e\ï\\ûª]QüûX\éi½Œ°&¼^)\ÎlÞ¡PÈ¤3ðKx;´\ÏÞ´xŠ½\áýGN+½L¯#°	o Wr¶<‡w%ŸÂ»²\â\Ý3‚;^{+Ø„7\Ð;Y–56\ÞzšŽÀO\áý\åŠ?¶\ÞzMx½yú>\ê\ì)Š¯‡ÁW\á½iiQ»\á­\×Ø„7\Ðk\å\ç\çO¹\å–[ôI­5Ž€ð&¼xß„s\Î9GŸÔº¥y”\0‡_\Â[·.o/¼õ:›ðz«ñ­{2¿„÷ö\Õ3\Ú\ro½ŽÀ&¼l\î\Î.<\Þ÷m´7-™z\æ*s¹L¯#°	o [‚»õõ“i¼\Z\ÞZ»\Ö\Í=#¼õ2Âšð²-¸\ãX…o‡÷É“öögž¹\Ê\\.\Ó\ël\ÂÈ¶\àNð&px-¼uj\ÛV¿\Ð\îg\Þz{Y#¼l\îÄŸka‡\'\Â[&\êª\í\Ë\í/>œ\Ônp\ÇKo£·e\n\'¼l\î\Ö?\Ï\×Â»³i›)œðzsp÷•z\ÉYv¤õ\íø®†w2\ÓvGS8\áMx~\î­}þ¹7µ­x{·c‡k\á\Ý\Õ\àŽ\áMx~\î>\Î$m\'T[ž\Üñš\Õ\É\ï’’““Ó¯«\áM\Þ@6w{Áœ\à]\Ç*ttIAAAƒKžð&¼$Üø\ÙIw\â¿\ÃV\èH5¼ã‡ m4Móùö&qÂ›ð\î\ä¼!…\àn\à|Ž”\Â;^\àuR\Óo\Â ¸“\ÓV€§\Üq¬BG—\Ã;¡ŽKM&¼	o ›\\\æ„nEŠ?wvwƒsy*>\ì\àE9^\ÑV\ÕÒªšjrªQW­:\ËYžtª^K\'6Y\ê\Ôv\Ây\á?¦%·=*\Ë#R‡\åºCrþ[9}PKNe­\\^#\Ëý²¬–e•\Ô>§*¥¾–\Ú#µ[n¿K–_\Ér‡,·Km•Ÿ\Ù\"\Ë/eY!\ËM²üB–¤\Ê\åôzY~&Ëµò3Ÿ\Ê\é2§VK•\Êe+eY\"\×/—e±,—\Êr±\Ô†a¼\'\ËE²|Gn·PNÿ]–“\år»\×e¹@jž\\öš\Ô+r»—eù’\\÷¢\Ô_\äºº\ZZ.{V®{&>-—=)õ¸\\ö˜N·r\ÙT\rHYN’\å©‡\å¶\ã\äú±rýhYŽ’ó÷\È\åwKýNN•eX*\n…LY\æ\Ë\Ï\æJýFN\ß!\Ë\Û\å\ç~•ŸŸ«ü\ì\Írû›\n&\×\Ý®—\åuyyy\×\Ê\Ï^-Ë«\"‘È•=Nôþ”\ßó(\áMx\Ù6y\'»\n;Ý“÷ú3ò¢}®~Ž)\Ë\å\Åú¢Áƒ_‡¿Ÿ››{©¼8ÿPN_./\ÐWH\r\ÐuY^#!0\Ðy±¿A\ÎÿD‚\àF\r\'n“\ë~­a!/êƒ¥\î\Ô\Ñ0±þ©\Ð	™\ß\É\Ï—ó#5„4Œ\ä²1\ZNNH—šè„—†X‘,\ÕpÓ“\Û?%5]\ÃO\ê9¹\ì\rE\'g\Éù\Ù\Zš\Zžrz®,\çk¨\Ê\ïø«,\ßt\ÂVC÷mY¾\ë„ñr¾±Yâ„µ†ö\n\'\ÄK¥>’úX\Þ	û5²\\\ç¼	\Ð7Z7	úfa³ó\æa«\Ün›,w8o.ôM\Æ.\çM\Ç\×r¾Rn·\×yCR\åTµó¦Eß¼\Ô\Êò€ó†\æ[©CúfG\ßô\È\é#rýQ\ç\Í\Ðq§N8o–\âoœ\âo¤ôMUCüM–¾\é’\ëšÞˆ5\Ëu±7gº”\ë¢I¼\É;U.\á\r°\ê¼ó\à\î\Êg\Þñ}Ÿ³\Ê\ÝZm®o t\r€_W›ÇŸ7„7€ž\nðtnm\Î[\Ð\Ýð®\Õ5%­o—Jx·³ö\è´@]½zµ=p\à@û¼óÎ³\Ï?ÿ|û\Úk¯=\íwtv=\á\r S\Þ\ÖV\à\éúžw¸[™£{\á­\Û„Û»]W\'\ïöBôª«®Š]¾q\ãF»¶¶\Ö3fLJ\×\Þ\02er“q:÷°6£\á]©\Û-tv»t‡÷9\çœ»|Ë–-mþ\\g×·þ½í\×\ÕW_}\Ú\ïj}}|º¿ô\ÒKcÿvÿþý\í\Þ\0N\Út\ïÛœ\àFJwx\ßv\Ûm±\Ë5(ù\Ë_\ÚS§NM\Ø\É^¯×u\ÖY†÷Â…\íw\Þy\'vzÐ Ag\\¯½k×®S\ç\çÌ™s\êü¿üË¿\Þ\0Î˜À|VŸ\äŽ*–x;¾\Ï\rß†wuuµ=q\âDûšk®9u››nº)\é\ëõ¼~\ÞYx\×\×\×\Ç*>]·u}[\çõAŸ^\íNxþœÀ»ó5Á\r_‡wb­[·\îÔ”\ìõ‰\ç\ã\áÜ•ðNö<\á\r »\ÌQ\Ä\àûðþ\íok—••\ÅN¯_¿>v²“½^Wi\ëeÛ·o·\çÎ\Û\ájóE‹µ»\Ú<™ó=ô„7\à\ï	<• &¸\Ñ+\Âû7¿ùM,€uz\Ö\ÕßºJ¼¼¼<\é\ëõ³\é\ï}\ï{m~\r­­\r\Ò4ø\Û\Ú`ðÐ	<™U\è\á>lœŸ…7Ex\Ù<\Ç?#\'¸Ax\Þ\0|\àm}? ¼	o\0ð\É	ÁÍž\Ó@x\Þ\0<.>i—ôùŸ£ƒ„7\á\rÀ\ë¸\îoš\à\áMxð\ro=7\0\áMxðWx_H\'@x\Þ\0ü\Þ\Ó	Þ„7\0ÿ„wÔ²¬þt„7\á\rÀ\'LÓŒ6\ì2:Â›ð\à£ðŽD\"W\Ò	Þ„7\0Ÿ(((h	…BW\Ó	Þ„7\0…·\Ôut„7\á\rÀ?\á\Ý,u\0\áMxðOx7Y–u#€,[¶ŒÀ%¼$Þ†a\ÜB\'\à¥¥¥-555„nšj\ïÞ½{$¼xd½ŒL\Ý\r@\à\×t^°|ùò\ÇKJJ¢û÷\ï\'|\Ó\Ü\Å\Å\ÅMR\Óyd½oò>)“÷`:¯°™&\Ó\âq]\Ý\ëÅš3gŽ­{&ô\êß—P\r7\Ð{Ã»>\æ\Ò	 \é\ç\Ì\çh|\0\à\Ó4\ëB¡I\'€\ÎY–5Vƒ[KN¢#\0Üš\"ŽK…\éÜ›\ÝxxKU\Ò\0n…÷1©\ß\Ñ	 \Ó\àžžÜ±2\ãN: \ã,\Ë:*5’N\0>OúKµ´o©5t€“÷a™(F\Ó	 \Ãð^\ØFp\ÇJž?\è€L¿(}k\Æ8:´?u;»¶\Û)¦o\0Ÿ¼Jx§@»Ï‘\Ò‚[+:lØ°\Ë\è€Œ1M³6N¢@»S·~#£©“\0/¡[\029U\ì—*¢@Ò~—ºž…B?\Öû\ä\å\å]Kg\0d2¼«\ä\Å\ç1:$\Ç0Œ{\ä9s„N\0p3¼÷I=I\'€¤\'\ï±R‡\è\07_ˆ*e’x†N\0IO\Þ\åys€N\0psò\Þcš\æótHú9S¤ÛŠ\Ð	\0nNÞ»$¼ÿB\'€¤\ÃûIý¸‰N\0p3¼wHxÏ¢@\ÒÏ™g%¼¿¦\0Üœ\"¶Ê‹\Ñ+tHŽ®©\Ò5Vt€›\áý¥\Ô\\:$\Ç0Œ—%¼·\Ñ	\0nN\Þ\èô\ÞyR›\é\07_ˆ6H€¿I\'€¤\ßð¾©\Ï:À5–e}n\Æ[tHú\r\ï\ÛRŸ\Ñ	\0n†÷:	\ïw\èôs\æ}™¾?¡\0\Ü|!úT\Âû=:$=y\ëaB\é\07_ˆ>–ZL\'€¤\ßð®”\É{9\0\àfx—\ê$A\'€¤Ÿ3e¼\á\àöQ‰\Ô\n:$G¦\îµ2}¿K\'\0¸\Þ|~¤öœ)—ú;\0\à\æ\ÑbýÜ›N\0IO\Þ\ì\Ø€»ø\ÚòÞ­Rs\è\07\Ãû]ýN\0I?g8\0w\é\Þ\Õt/ktHzò\Þ#\áý<\0\à\Zö\Ó¤üœ\ÙŸ¦\0\Ü|!z]\Â{\0’~\ÎTKx?J\'\0¸\Æ9¼\á—tHú9S+5™N\0peY¯\èÖ³tH:¼J=L\'\0¸\Þ/\É\Ñ:$Þ‡¥\î£\0\\gš¦¹“N\0I‡÷1y\Î§\0\\£_yÑ¯¾\Ð	 \éð>!¤\0\\c\Æ3–eU\Ò	 \éð®ƒ¹t€›“÷Sòb´N\0I‡wƒ„÷\ít€›/DKU\Ñ	 \é\çL£eY7\Ó	\0n¾I\í§@\ÒÏ™f©\è\07_ˆ&\ëN\'\èôs¦%//\ïZ:À\Í¢	R\èôs&jš\æt€k\ÃgYÖ·tH>¼sss/¥\0\\#\Äh\Ýc\0’o{Ð Aß¥\0Üœ¼\ï‘\Éû\0’ï¢¢¢³\é\07\'\ïáº»G:tNC[Ã›N\0p{ŠK§@\ç\"‘\ÈE„7\0\×YB^Œ\ê\è\Ð9\ÝPM7X£\0Üž¼óu_\ÍtHjò¾\Ò4M\Â€»\Ã,\á}’N\0Ó³X–\ÕB\'\0¸*üZ^Œ\Z\è\Ð9\Ý-ª\î•N\0pU~~þ­ÞzZ7Æ‘\Ó7†B¡\Ó\àL†aÜ¢&¡\02J\Âù¼ø4\éª?\Ýj¶\ÚN§€3\é¡@õ t@¦\ÃûµB;V:}\Ó)\àLl\à	À999ýtòn/¸MÓ¬ K@»o~\å9r‚N\0ð\Ôô\Í\Ô\r´=p{únh#¼+\é\Ðaxs \0®¾Mkc\êEg€ö\Éó\äa©ƒt€›/DGÂ›$ ó\ç\Ì©Z:À52iM˜º\Ç\Ò \Ó\ç\Ìcò|©¢\0<1}\Ó	 sÁ`ði\Ó4÷\Ò	\0®2c\"\á\r$ýf÷©\Ýt\è\Ål\Û\î·s\ç\ÎÊ²²2{Ù²eöÒ¥K=Y–eyöo\Ó*..¶W­Z•šÉ£\nn’©{–<_v\Ð	 \Ó\à.--µkjjì††ªU[[k—””D%È§óÈ‚‹“÷©­t\è\Åt\â&¸\Ó\à2‰³_i¸9y¿.á½‰N\0½˜®*\'t\Ó[º\ZG\\œ¼ÿ.UN\'€^Lƒ†À%¼Ñ«\Â{‘\Ô\Z:\Þöñ\ÃUöÎµ¯\ÚÅ¿•ž\Ö\Ëk\Âž\ï\ÅR\Ó	 \Ë\ÃûØ¡}ö¦\ÅS\ì\r\ï?rZ\éezMx\Ã;L\Ó\\nY\ÖJ:dyxWV¼{Fp\Çko\Å\"›ð†·&\ï$À—\Ò	 \Ë\Ãû\Ël7¼õ:›ð†§&\ïOdò~ŸN\0YÞ›–µ\ÞzMx\ÃS\á½^\Â{!\0oÂ›ð†\Â{cAAÁt\ÈòðÖ­\Ë\Ûo½ŽÀ&¼\áÜ›¥\æ\Ñ	 \Ë\Ã{û\êí†·^G`\ÞðTxo—šM\'€,\ïƒû6Ú›–L=s•¹\\¦\×Ø„7¼Ã²¬]¦iþ…N\0Y\ÞZ»\Ö\Í=#¼õ2Âšð†\çÂ»\Ò0Œg\è\í\á}ò¤½ý\ã™g®2—\Ëô:›ð†w|#þ\0²8¼uj\ÛV¿\Ð\îg\Þz{Y#¼\á©ð\Þ/UD\'€lo™¨«¶/·¿øpR»Á/½Þ–)œð†\'\Âû€\Ô:dYxw6m3…\Þð.Ë²I¥@–…w2\ÓvGS8\áMx\Ã\Õð>j\Æ=tÈ²ð\îjpÇ‹ð&¼áž‚‚‚\ã\ÞC\ée\áM\Þð/\Ó4\ëB¡I\'\0Â›\"¼\áŸ\Éû¤LÞƒ\é@xS„7üÞ–e\ÝF\'\0Â›\"¼\áŸðn’ð¾‘N\0„7Ex\Ã?\á\Ý,u\0oŠð†O\È\ÔÝ’——w\0oŠð†&\ï¨\Ô\é@xS„7ü\Þö\àÁƒ/¡\0\á}ZÉuX‰·ù\Å/~q\Ú\Ï\êù\Ä\Û\Åkþüù§._°`\á\rt#¼GŒq\0\ïNƒ¼£€///]¶~ýú3B>^2)\Ø\çœsŽ}\ÖYg\ÅN\Þ@jŠŠŠÎ¶,k!“7@xw;¼þóŸ\ÛÃ‡]6r\ä\È\Øù\Ö?S[[\í;\î¸\ãTˆ<x°\ÝIÿê«¯¶·l\Ù\Ò\å\ë	oô6¦iþJ‚ûˆ,†q\ïn…÷¢E‹ba¼q\ã\Æ\ØRÏ·þ™_|ñ\Ô\êr-=ý\ç?ÿùŒßµp\áBûwÞ‰4hP\Ê\×gju<\áL	\çÊ¤½HªE\ê\r¹¨/]\ïn‡·ž¾\æšk\ìÄ–mý\ÌM7\Ýd\ç;ß±Oœ8+=­—µþ]õõõ±\Ò\Ó\çŸ~\Ê×³\Ú½‰„õRÇ¤¾e§,\0\áöðž={v\ì´.[_·gÏžv7|Ûµk\á\r´1m›¦ù¡~Ÿ[j>\Ó6@x÷HxwtÝ“O>;=dÈS\×\Æ.{ê©§\ÎX-_\í\Þ\ÞjóŽ®\ï\è\ï\ë\ì<\á\r/0\ãN=ä§„ö	ðŸ\Ð€ðv%¼¯½ö\Ú\Ø\éü\ã§®\×\Óz\ÙÀ\Û\Ü\àLW¿w´AZ{\×\Þð«œœœ~\Ú\Å:m\Ëro\Ïõª³ \í“\á\Õ\â„72I&\ì€v,kB¡Ð\é\0_„÷y\ç«®^OxÃtG+\Ú%º%¹L\Ü/\Ñ\0¾\novÒ‚l#”ª—ª\nƒ\é\0Â›ð†G%°?\Òi\Û4Í¿\Ð\0„7\á\r3c¨öI	\î}²¼†Ž\0 ¼	oxT$¹H»\Ìù\Þöst\0\áMx\Ã\Ã$´\ï–jú://\ï*:€ð&¼\áQ@\àb™²\×\ég\ÛÁ`ði:€ð&¼\áaÚ£$´¥vE\"‘+\é\0Â›ð†G\é1¶%°Ë¥š¥§#\0o\Â&a=F§m™ºw„\Ã\á\Ë\é\0Â›ð†GIX÷7Móg\Ú.¢#\0o\ÂÞž¶–j’\Ú*õC:€ð&¼\áQ¹¹¹—JXo\Ö\àƒ“\è\0Â›ð†‡iX;\Óö\æ!C†ü€Ž\0\èË–-#p	ot“®wVkp?LG\0ô¨\Ò\ÒÒ–šš\ZB7Mµw\ï\Þ=\Þ\r<²²jÚžª¤\é†iº\Z\Ð\ã–/_þxIIItÿþýžÆ“\'Oz>¸‹‹‹›¤¦ó\È\êýô+_ú\Õ/\ç+`c\é€Œ’°™&\Ó\âq]\Ý\ë\ÕZ²d‰-/’¶—ÿF¸	\î\ì aý˜óõ¯r\Ýù\n€vhx\ë˜\èÜ¢»3\ÕÝš:\Óö(:\00M3:lØ°\Ë\è\\zü=¥\ÑŠ\èE\è\0$7y\ë˜\Ò	d’ªS\Ù\éºón:\0©…w“a7\Ñ	dŠL\Ù\ÏJµ\È\Ôý	\Ù\0@\×\Âû¤„÷`:ž&a}<\Þö\écN\Âû.:\0]\ïòBZH\'\ÐÃ³ú\Ô\êAƒ}—Ž\0@7Hp‘\Éû:ž \ÛSH`WI\ÕK\é\0¤g\":(\á=žN \ÝLÓœ\ålI¾rÄˆ\Ð\0H_xWË‹\ì4:t	\×\ËcªFªN*@G\0 \Íd*ª”\Éû:4½œ£[’\ËrYNNN?:\0=óbû•LG/\Ò	t‡<†~\"¡}@O\Ç\å\Í\àt\0z6¼7KÍ£è¢¾\Úói{q 8—–\0@Ï‡w¹\Ô\ß\éR%}£nð(uL\ê:\0™\ï2©\èR™¶\å1ó†nIn\Æ{L\Û\0ùð.‘ZA\'	\ë[L\Ó<$S÷Q	\í_\Ó\0p\'¼?\Ð\é›N #EEEgKp¿\å\ì%\ím=OW\0À½I\ê-™¢>§h<>n“À>\"u8??ÿV:\0\îO\Þót‹s:¶¦m	\îw½¤ýM.\êKW\0Àt–òÂ¼ƒN Q0¼]·\"—\ÇÆ·2\0<F÷®¦{Y£Pº\å¸n\á|o{\Ó6\0xs\ÂzT÷oN\' …\ß\èÒ¤þŒŽ\0€w\'\ïñº£\r:‘½t\ä¦i.\Õi[\ê5:\0\'/Ö£ô˜\Þt\";\É·|©Rµ¡P\è\Çt\0üÞ…2u \ÙE¯­;\çq¾·=›Ž\0€†1X^¼OÒ‰¬z\Ãf\É}^§\Û:H]GG\0À/\ä7\Ëx#\èýÀ…r_—\ê´g\Ò\0ð)y¨/\æt¢w“û8,U/õM^^Þµt\0|,_./\èQ:\Ñ;\r\Z4\è»Î‘\ãZL\Ó|žŽ\0@/‰D.’v›Nô\Êiûwº=ƒTe(ºšŽ\0@\ïÑ—ð\î•o\È\Ö8\Óöt:\0½sB³õŸNøŸa÷\Èý\Ù µG‚{\0€^J^\ä£Ã†\r»ŒNø\×\àÁƒ/‘ûq½„v³eYO\Ð\0\èý“·~uh ðí›¯\ÑØ²\Ü)u€\ì\ï&û\è?\ápøûr\ßm\Ði[B{\Z€\ì\nï“º§5:\á2i?¤oº¤¶ó‘\0dgxŸ\Ð}œ\Ó	\ï\Ë\ÍÍ½T¦\ì\n\'¸\'\Ó\0\È\Þ)\îˆn¥L\'<ÿ&k‚w“Ô–!C†ü€Ž\0@v‡\ÂA=®7ð&\rj\rlgÚž@G\0\0\Z\Þ\Õlð\ä\ÙûfŠ³AZ…®2§#\0€Ë²*eò~†Nx‡n„¦£\é\ß\ä¾GG\0\0­§»¯d²{‘NxC0|Ô™¶\Ëõ\ë`t\0\ÐVxo–šG\'Ü¥;X±,k—³Ã•\Ñt\0\ÐQx—KýN¸z<©Ó¶\Ôgº«S:\0\è,8ôx\Ï\Ð	W¦\íz™¶¤F\Ò\0@²\á]\"µ‚Nd–n$(\Ý\"õ)Gu\0¤\Z\Þ\èôM\'2#\n]-÷^\Ý-­\Ô\ï\è\0 +\à[2ý}N\'2òF\é=Š›\ÔÇƒ\rú.\0t5P\æ\é\çt¢\ç\ä\å\å]+=®’ª—\n\Ó\0@·˜¦9K&\ït¢\Çúû¢3m¯\n\Ò\0@·9NUÒ‰ô’ ¾^{¿T](2\é\0 mœ=zUÓ‰´¾!zY·$—©{ùˆ#. #\0€t\Íx=²\è>\é\ã\rRµzŒtyS”KG\0\0=B&\ÄQzLo:\Ñ\í\àž«Ó¶,—\ä\ä\äô£#\0€ž\ïB\Ó4OÐ‰®),,ü™®¹:n\Æ`:\0\èq\Z8º\Ã:‘²¾ò¦\çuÝ’\\\Þ\0½Î¥%\0€LM\Þ7\ëq£\éDj=“:$\á}4\ÞNG\0\0%\á3P§G:‘Ü´-¡ý7\í—a\ïMK\0\0‡/—0ŠÒ‰Ž\å\ç\ç\ß*}:,uDü6:\0p\ÑJÉ¦m\Ó\éZúó¶³—4=\îy_º\0p[_Â»m@\à\×ú¹¶~¾­Ÿs\Ó\0€ghxsL\é\ÓBû\\\Ã0\Þ\Ói;þ•i\0\à92]F‡\rv8õÕ¹\ãú\Ým™¶o¤#\0\0¯N\Þ:a\Ì\æ\è^\Ñt\ïh\Î^\Ò\æñ¨\0\0x=¼›d\â¼)[ÿÿºr\ÝËœ”\î—ü\0\0?„÷\ÉlÜµ§ñKü¥Ó¶\Ô+<\0\0~\n\ïºólú?\ë1¶Es[½Í£\0\0\à+zT1™¼\ïÉ†ÿ«õ…Ø«ôs~	\ïY\Üû\0\0¿N\Þõ¸\ÞYð&¥Pþ¯õRUÙ¾\0Àÿ\á]-S\è´\Þúÿ4h\Ðw\åÿø±³—´\Ü\ã\0€\Þ0‘V\Ê\äýL/ý¿Ý¥\äÉ›“½¡P\èj\îm\0@o™¼¿’p{±7ýŸtqÜŸ\ê–\ä½õ	\0 »\Ã{so\Ú1‰öH©ù?\í‘7%¸‡\0½1¼Ë#fùZ ¸XþŸI5K=\É=\0\è\Í\á]&õ\Ïÿ÷É´\Ý(µK¦\í+¸W\0½=¼K¤Vøño‡\Ãß—°\Ö5\ÍÁ`ðQ\îM\0@¶„÷:}û\í\ï6cœüÝR;8*\Z\0 «H¾eY\Ö\ç~ù{\åo\í/½É™¶§r\0²qòž§[œû\ä\Æx=\nš\ÔV©r\ï\0²’\î\ã[¦\ÙzZW?\Ë\é½ö«!C†ü@\ÂúKù»ôð¥¹\×\0\0Y#\nýX·\Ê\Ö\éU‚0*K»š\í¡5“¿·\"77÷R\îE\0@6N\Ú;;m[\Ã=\'\'§Ÿ\Û§³`›·,\âž\0dõô\ÝQxK¸¿\é7\Ótƒ4YnÔ¯ƒq¯\0˜¾Ms};\áÝ¢ûw\ëï’ ¾\\÷µ\î|l÷\0\0]%\í\"³ux¯q\ëo²,\ë	¶õkkƒ¾„{	\0€3§\ï7\Ûø¼û\ÆLÿ2\é_)ÿön©\Ã0\î\áž\0 ºQšx]Bx\ïq\á\r\Ät] Ëµz`\î\0\0:\Ï\ç\ã\á-Sï™úwóòò®’)¿RþÝ“ò7\çž\0\0 µ\0?¦\á\É7\Üúy{Ù Aƒ¾\Ë=\0\0@Šdâžš››\Û\ã\á-\Óöµ\Øû$¼OÊ¿9”\Î\0\Ðu¤4¼§õ\Ô?g:[·.¤\å\0\0t\Ýx©¨\Ôzg™\Ö\0—°¾N&\íjY\Ö[‚v\0ž\àŽö\ät¸\îÝ™¶WŒ1\â\Ú\r\0@zƒ»³Ë“\æ\ì~µFJ¿†–O«\0\è¹\àn}ý\äT±eY¯\é–\ä¦i.õ\ÂÁM\0\0È†\àŽKiº„õOd\Ê> u<þ†6\0\Ù\àNð–N&ð¾\Øœ\ïmÎ¥\Í\0\0¸Ü‰?\×\Ò\Ö\Ï†q“ö·R\ÇdÚ¾\0\à~p·þùø\Þ\×9¨I‹L\Ü\ïM‹\0\è¹\à\î+õ’³\ìH\ë\Û\Å>ÿÑ~4WBû°„ö	ð_\Ñ^\0\0z>¸·öù\ç\ÞÔ¶v\àm\Þ\î‚.(úÿøû\æ›o®`\Ú\0 çƒ»3I\Û	\ÕV€\'w¼fÅ¯\Ô\0\ï\Ó{b\0€\àn;`\Û\n\æ\Ä\0\ï\ìú¸´\î‰\r\0\0‚»\ã`m/ \ÏN2¸ÿ\0€ž\r\îŽ¼!…\àn\à“i=\0\0=\Üx*Á\Ç*t\0\0º\à2\'t+Rü¹³Û˜¸œ\ËSñ¡ó³—qW\0\0ú\ä\ì*\ìtO\ÞOp\0\0\Ðõ\0\Ï\Ôg\Þñ}Ÿ³\Ê\0€ðtnmÞ¥Ã†\0€¶ƒµ­­À\Óõ=\ïp¶2\0 \í&·1w{k	÷tZ\0@\ÏL\àiÛ·9Á\r\0@f\'ð\Ä\0Ÿ\Õ\'¹£Š%ÞŽ\ïs\0\á	¼;ŸQ\Ü\0\0x`O%ø	n\0\0\\œÀS	b‚\0\0L\àÉ¬B÷a\ã4\0\0|3\Ç?#\'¸\0ðA€·õýp\0\0\à±\0Ÿ’\Ü\ì9\r\0\0›bš¦îŒ¥¤G\0ÀûÀ\ÅNx\Û7\0\0> Á}EAANÜ—\Ñ\r\0\0ü1y_/\á\ÝL\'\0\0ð‰üüü[-\Ëj¤\0\0øD0Ì•É»žN\0\0\à2u\ß%\á}œN\0\0\à\ÜcL\Ó<D\'\0\0ðOxO–ª¥\0\0ø\'¼Ÿ”\ÚG\'\0\0ðOxÏ\ÚE\'\0\0ðOxÏ‘\ÚJ\'\0\0ð	\Ó4ß”\ÚH\'\0\0ð	\Ã0Þ“\É{\r\0\0À?“÷r	\ïUt\0\0Ÿ\à.“ZL\'\0\0ð	Ë²>—ZH\'\0\0ð\Ï\ä½Y\Â{>\0\0À?\áý•iš³\è\0\0þ	\ïJ\Ã0ž¡\0\0ø\'¼«eòžF\'\0\0ðOx”z˜N\0\0\à–e•\ZI\'\0\0ð\Ï\ä]\'\ám\Ñ	\0\0ü\Þ\rÁ`ðv:\0€O˜¦\ÙTXXø3:\0€&\ï–P(t5\0\0À?\á\Í\ÍÍ½”N\0\0\àŸð¶srrú\Ñ	\0\0|@C[Ã›N\0\0\àºº\\W›\Ó	\0\0|B7T\Ó\r\Ö\è\0\0>¡_Ó¯Š\Ñ	\0\0|BwÎ¢;i¡\0\0ø„\îUwJ\'\0\0ðOx\Ô“\Ð	\0\0|Bª‡¥\0\0ø„iš\Ó$¼«\é\0\0>a\Æ3–eU\Ò	\0\0ü3yÏ’ð\ÞA\'\0\0ð		\îù\àt\0\0ÿ„÷B	\ïõt\0\0Ÿ(((X,õ1\0\0À?\á½Jj\0\0À?\á½Fj\0\0À\'L\Ó\Ü(\áý\0\0À?“÷VË²^¡\0\0ø\'¼wK½@\'\0\0ðOx#“÷t\0\0Ÿ0M³6N¢\0\0øgò>,>šN\0\0\àŸð>n\ÆP:\0€Â»^\ÂûN:\0€Â»Q\Âû:\0€Â»Y\ê::\0€\Â;\Z‡/§\0\0ø\'¼\íH$r\0\0Àújx\ë’V\0\0\à@\àb\'¼\0€˜¦y…~\æM\'\0\0ð\Ï\ä}½nmN\'\0\0ð‰üüü[-\Ëj¤\0\0øD0\Ì\Õ=¬\Ñ	\0\0|B¦\î»t\ß\æt\0\0Ÿ\àcš\æ!:\0€\Â{²T-\0\0À?\áý¤\Ô>:\0€\Â{†\Ô.:\0€\Â{Ž\ÔV:\0€O˜¦ù¦\ÔF:\0€O†ñžL\Þk\è\0\0þ™¼—Kx¯¢\0\0ø„w™\Ôb:\0€OX–õ¹\ÔB:\0€&\ï\Í\Þó\é\0\0þ	\ï¯LÓœE\'\0\0ðOxW\Z†ñ\0\0À?\á]-“÷4:\0€\Âû \Ô\Ãt\0\0Ÿ°,\ë¨\ÔH:\0€&\ï:	o‹N\0\0\àŸðnƒ·\Ó	\0\0|\Â4Í¦\Â\ÂÂŸ\Ñ	\0\0ü3y·„B¡«\é\0\0þ	\ïhnn\î¥t\0\0ÿ„·““ÓN\0\0\à\Z\Ú\Z\Þt\0\0Ÿ\Ð\Õ\åºÚœN\0\0\àº¡šn°F\'\0\0ð	ýŠ˜~UŒN\0\0\àºs\ÝI\0\0À\'t·¨º{T:\0€\Â{¤˜„N\0\0\àz(P=$(\0\0À\'LÓœ&\á]M\'\0\0ð	\Ã0ž±,«’N\0\0\àŸ\É{–„÷:\0€OHpÏ—\0¯ \0\0ø\'¼Jx¯§\0\0øDAAÁb©\é\0\0þ	\ïUR\Ë\è\0\0þ	\ï5R‹\è\0\0>aš\æF	\ï7\è\0\04lØ°\Ë,ËºQ{@\Â\ä½U.{…\î\0\0\à\Í)ûy	k»ŠJ5iiÀ\Ó-\0\0<Bÿ\ÙA€k±·5\0\0¼D¦\ê\×:\no¦n\0\0<&\'\'§Ÿ„ts[Ámš\æ:\0€IP·õ™w\â†l\0\0ÀC4¤\Û\ï:\0€·§\ï\í	Á\Ý‰D.¢+\0\0xX~~þ­	Ÿu/¤#\0\0øcú®v¶0¿Šn\0\0\à1\ÎVæ“¥J¥j\Ûø¾·n~Pª,\Îd5:\0\0.\É\ËË»V7F“@n\ìd\ç,­¿\ï\Ýbšf\ßû\0 ƒ“¶„\ï‡\Úv*¡\ÝN•1‰\0Ðƒtc4™˜\ë[‡ð¨Q£\ìY³fÙŸ|ò‰½o\ß>»¾¾\ÞVº¬©©±?û\ì3ûµ\×^³ÇŽ\Û\Ö\\\êÃ¸“\î\0f²\ÃC¡PKbð>ò\È#±`nnn¶“U^^nOš4©­¹L£\Ë\0\0¤1¸W“KˆÛ‹-J)´[ûð\Ã\íH$\Òz\n\'À\0\è.]U.ÁM\\E¾m\Û6;v\ï\Þm=ú´	œU\è\0\0tƒnœ–ø··~†Núû\\?g#6\0\0ºH·*O\\Už®‰»­	¼\Õ*ô5t\0€\é÷¸?\ç\ÖÏ¸{’~žøù·®®\ç^\0\0 º–Ä­\Ê\íž6aÂ„\Ä\Õ\ç\Ü\0\0$I?\ëN\Üsš~,6n\ÜxÚžØ¤úso\0\0ý\ÊV\âFj\ÝùJXªw\ä¢ûB\ç\Þ\0\0 	\ÎAFb:{öl;“\æÏŸ\Ú\îS¹7\0\0H.¼k\ãª»<\Í$]EŸ°\êü÷\0\0I\Ð<õywUUUF\Ã[¿÷x8Q\î\r\0\0’›¼Ohü #™¢ÿ^\â¿Ï½\0@Š\á\í\Â\0\0&o\0\0z7>ó\0À“7[›\0\à³ð\æ{\Þ\0\0ø‰L¼O¸µ‡µx€=¬\0*Ý·¹~\ÞÌ¾\Í\0ð=¦v\âQ\Å21}Oš4‰£Š\0\ÐUz<o	\Ñ(\Çó\0À_\Ó÷©\r\×B¡½mÛ¶	\îÝ»w\ÛC‡M\ï5t\0€.ˆD\"™¦Y—¸ñš~;\Ý\ß\ë¾ÿþûW—\×\é¿K÷\0\è\"\Ã0\îL\\}®ž®	\\\'\î\Ä\à\ÖGÿ=º\0@÷||b€\ë*tý¼;±\égÜ­V•\ë\Ô=n\0\ÐC\ß\n½¼¼<å¯ƒM™2\å´\Ð\Ö\ßKp\0\Ð3~g\âg\à‰«\ÒuOlk×®\í=~0]\êg\Ú\Zðº\ç´\Ä°$~\ÆÍªr\0\0znL–¸z7k\r§\0!ú=p™š\×\'\î‰-™\Ò=§\éX‚Á\à\ít\0\0\è®T}¡\ë4^›x8Ñ„ÝœÒƒŒ\è¾\Ê\Ù\å)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\ÏùÿÀ¨z(D¶Ù¯\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','5001',3),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-07-05 02:06:08.594',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-07-05 02:27:29.294',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:12',1,'http://www.activiti.org/test','åˆåŒ','Contract',1,'1','/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:2:2512',1,'http://www.activiti.org/test','åˆåŒ','Contract',2,'2501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:1:10',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'1','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:2513',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',2,'2501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('TestPlan:1:13',1,'http://www.activiti.org/test',NULL,'TestPlan',1,'1','/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png',NULL,0,1,1,'',NULL),('TestPlan:2:2510',1,'http://www.activiti.org/test',NULL,'TestPlan',2,'2501','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.TestPlan.png',NULL,0,1,1,'',NULL),('TestReport:1:11',1,'http://www.activiti.org/test',NULL,'TestReport',1,'1','/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png',NULL,0,1,1,'',NULL),('TestReport:2:2511',1,'http://www.activiti.org/test',NULL,'TestReport',2,'2501','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestReport.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestReport.TestReport.png',NULL,0,1,1,'',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (79,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010103','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','Worldè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL),(80,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010104','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','Gameè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902',NULL,NULL),(81,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010105','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','LittleBirdè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902',NULL,NULL),(77,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010101','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','ABCDEè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL),(78,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010102','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','Helloè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (81,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190609235901','CUSA'),(82,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190609235902','CUSB'),(83,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190609235903','CUSC'),(84,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,STAFF,USER','u20190609235911','SSA'),(85,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,STAFF,USER','u20190609235912','SSB'),(86,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,STAFF,USER','u20190609235921','TSA'),(87,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,STAFF,USER','u20190609235922','TSB'),(88,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,STAFF,USER','u20190609235931','SMA'),(89,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,STAFF,USER','u20190609235941','TMA'),(90,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,STAFF,USER','u20190609235951','QMA'),(91,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN','u20190609235900','admin');
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

-- Dump completed on 2019-07-05  6:24:44
