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
INSERT INTO `act_ge_bytearray` VALUES ('70002',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.bpmn','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\"/>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70003',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.bpmn20.xml','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"MM\" type=\"string\" value=\"MarketingManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"QM\" type=\"string\" value=\"QualityManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70004',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.bpmn20.xml','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\" activiti:candidateGroups=\"STAFF\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70005',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.myProcess_1.png','70001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0CaIDATx\Ú\í\Ý|TõÿŠ\Ôe-µ,ÕªÕŠ¶\êvm\×êº¶þ]WcµV´´6Éœ“3“XA„B)– >´\n\Å*Te½¡ V\\EE(—\0\ÈM¹\ÈE!r	I ùþ>Ÿ\ã™ü‡„™\Ü\æœ\äõ|øyœ\É\Ì$ÁOf\æ=ŸsÎœÓ¦0Æœ\Ý&r¿ÿ¯–\ë_¬öõ÷¹\0\0¨	\Ô%ýŸkŒ\Í7º¬©\Äßµ¼\Ëo½òQ\å¶›_\Ù\\~¥»t\ï7\Ïx?oPÿ±\îýúVÿ]z=\0 \á\á\ÝQ\ê\Æ\Î\×À½¦Ü˜5\Z\Æ÷¿º¾|\è\ï•\ë\ê}ô¾_\Zó¹†ô!c\nÿgÒª#±\Ð\Ö\å\Ð	\Ëõ¾s½Ÿ9sÀ¸ù•“·˜\Ï=µ\äH¬ô~ºŒ\Ý\0\04,\Ä\ÛK}ü\Õþ\Õ\Ä\íN\Õc\çi¨w»ß™;™\Ïôú?ümAeµ	ý/\Õ\ÞüNjŒ\Ôh-\ï>zùf:\0@=\ÍÜ¯=\Ï<5o\Ç\ác½)ú¹\åº|\äM\åz›\èû÷\ÄV¯\ï.7›ôò»\ïÿb@Uxu?¶õ\ç}~U©nK÷®ÿ¥þ.V›\0\ÐxS÷›\Z¬|ö½Š?ü­ òo³>-uƒZW‰5y÷ö\î÷°\Þo…1\ë>µ\è«\íÝ±)}\ÜüÊ¸ûu•©¼B/2fE\ì2\á\r\0@\ã÷‚\Ø*r\r\å±Ð–\å=Ðº,.5[«‡·Þ§†\Õ\æÇ…·÷õ«„7\0\0Þ·\ëG¸\îy\â\Ý\n\r\å\á/¬8ú\ÑÎŠ\í\Æ\å\ë$ý²\Ê#½û>¦_\ëýtsùú\É\Øk\Þý²½ûe\Þslx?&µL\ïC\Ç\0hxxŸ­ùÒ©xÈ„eº\Ê\\\Ã{­1òŸ™_b\Ìûr§vrù\'nHu§tS!.\×M>q\åÑ¥ÛŽ\ì\Óû\É\×t‡¶\Þ\Ï{jq\É.\rt]-?v\îþbY\Îó~g{:\0@ý\Ã{\é¨wŠö\é\Þ\áO,8°»j5ø\Øù•n\Ëd=q}\å¶7\Þÿ\â\Ð=O,\Ð\éúœ!\Ï.­ˆÿ˜X¬t›¹n\ã~ø­]úó:LXy\äs]ÿ\Õg\È\çw‡8	uý=t\0€\ÆóöµN\Æ2\'øC\Ú\ÑI\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z2=ñÌ™3\ß7n\ÜÁÑ£GW\Þs\Ï=&\'\'\Çdee™h4j`†^>r\ä\È\íýúõû\0 E>ÿüó\ÈÄ‰÷ÿþ÷¿7w\Ýu—yþù\çÍ’%KÌŽ;\Ì\áÃ‡õœ¦¼¼\Ü™eË–™I“&™Þ½{›»ï¾»r\èÐ¡\Ç9ƒ.\0\Ð<“ös\ç\Î-\îÛ·¯‘IÛ¬^½\Ú\r\éD­]»\ÖÈ”nn¿ýv#SúH:\n\0@OÛ=öXeÿþý\ÍÊ•+MC|ô\ÑG¦_¿~¦W¯^»rrr:\Ò]\0\0\ZÙú\r>\Ü<þø\ãfÿþý¦1\è\êuýy}úô\Ù\Çjt\0\0\Zy\â\Ö\à~\ä‘G\ÌÑ£GMc{ò\É\'uÿ\"--­=\Ý\0 t·®*\×	¹)‚;\æ¯ý«\É\Î\Î\ÞJ\Ç\0h \Ý9M·q7ÖªòºV¡÷\îÝ»\Òqœþt\0€z\Ò\Õ\åºW¹\îQ\Þt\'¶H$RÁöo\0\0\êI?Ç­kN<ð@yVV\ÖTº\0@’ô\Èiz\0–æšºcÖ¯_odò>\Â\Îk\0\0$iö\ì\Ù\ï\è‘Óšr\'µ\Ú\ä\ä\äTØ¶};\0\0’ \Ç*\×Cž¦Â£>Z’••UÀ_\0€$\èIFôXå©°hÑ¢£Þ…ü\0\0H‚žLO2’\n\Å\ÅÅ•\Þeü\0\0H‚ž\Î3vv°\æ¦\':\ÑSŠòW\0\0 	\Zž©Dx\0¤\îÝ»§rò®$¼\0H\Òþð‡”mó.***g›7\0\0I\Z1bDYªö6Ÿ9sf{›\0¤û\ï¿kª>\ç=|øð|\Î\0€$õ\ë\×\ï¶Þ½{§\äkzxTŽ°\0@ý¼¢¹m¾xñb]eÎ±\Í\0¨aÃ†\Í5jT³†wÏž=wrV1\0\0\ê)\'\'§\ãw\ÜQ¹v\í\Úf	\î¥K—\ë\Ô\Íù¼\0h€»\ï¾{xß¾}\Íþýû›4¸KJJ*\Â\áp¹wº\0@õ\î\Ý{Ç£>Ú”;¯U\Ê\ï(²m{\Ý\0 \è\Îc27®)¼r\èÐ¡Ÿ\é\çºu5=\Ý\0 ¼gÏžEù\Ë_Ì¡C‡\ZmUyŸ>}tµB¶s\0\ÐDF·\Üyç•«V­jð\Îiº[W•3q\0\Ð\Ät§²\ì\ì\ì£#FŒ8¢!žÌªô\åË—\ï\Öm\è\Þ^\å\ìœ\0@s\ÑiY¦\æ\É:=w\ëÖ­rô\è\Ñ%ó\ç\Ï?ºs\ç\Î\n=·*++«Ô“ŒÌš5«XyªGN\Ó\Ð\Ö\Ïq³š\0€’0ŽJ\åIm•@/\Ñ\Óy\ÆU™nÓ–Z¬‡<\å\Èi\0\0ø;\Ô+£\Ñ\èùt\0€\à„w¹eY\×\Ñ	\0\0‚\Þ%¼»\Ó	\0\0\Âqœb	\ï!t\0€\àLÞº\Û\ãt\0€\à„÷\Z	\ïW\è\0\0Á	\ïw%¼g\Ó	\0\0\Âqœ·¥–\Ó	\0\0Â²¬g%¼7\Ò	\0\0\"++\ëA©t\0€€°m»¯„÷>:\0@@X–u«„÷a:\0@@„B¡\Ë%¼\Ò	\0\0‚Þô\Ìbt\0€\0\Ñð\Ös\Ó	\0\0‚\ÞR—\Ñ	\0\0Â¶\íR\ÝqN\0\0œ\É{ŸT:\0@p\Â{‡¬…N\0\0œðÞ¤‡I¥\0\0„ž˜D\Âû-:\0@p&\ï<=5(\0\0  \Â\áð\ß%¼\×\Ð	\0\0Â¶\í\Ç%¼·\Ò	\0\0‚3yu§˜N\0\0–eu—\Éû \0\0 8\á}„w9\0\0  l\Ûþ„w%\0\0  rss\Û\é™\ÅtI7\0\0¼£\Ñ\èùt\0€\à„w¹nû¦\0\0\'¼\ê^\çt\0€€\Ð\ÏyKx¡\0\0gòÞªGZ£\0\0\'¼\×Hx¿B\'\0\0Nx¿+\á=›N\0\0Žã¼­\çõ¦\0\0„eY\ÏJxo¤\0\0DVVÖƒR;\è\0\0a\Ûv_	\ï}t\0€€°,\ëV	\ï\Ãt\0€€…B—Kx¥\0\0\'¼;\é™\Å\è\0\0¢á““Ó‘N\0\0œð®ºŒN\0\0¶m—\êŽkt\0€\àL\Þû¤\îs\çj	òÛ¥FK]Dg\0\0ð™°ï• \Þ)A½W?\"&!]©Û¼«\ÕÑ´´´öt\0\0\Ð>CÃ¹†À®*	ôt\n\0\0‘€~¦®ð\Î\ÌÌ¼ž.\0\à¿\0?P\ËÔ½…\î\0\0\àC‘HÄ®)¼u›8\Ý\0À§d\Êþ¨ZxaG5\0\0ü\ÞI`\Ç\ïmžOW\0\0ð9\Çq¦\Ä\Â;‰\\AG\0\0ð9]M.Á]®8\Ý\0\0  $¸\Ç\Þ\0\0\Ä1Æ´ß²eK\á\âÅ‹Íœ9s\Ì\ìÙ³©zT^^žY°`A¥Ô“<ª\0\0MJƒ»  À™²²2ªµ{÷n“ŸŸ_)A>šG\0 \É\è\ÄMp7n€\Ë$^\Æ#\0\ÐdtU9¡Û¸¥«\Ñyd\0šŒ\rKx\0Z`xÜ·\ÃlYö¼Y›wŸ[zY¯#¬	o\0€\ÃûÀ\Þ\íf\Í\Ì\áfÕ´AÇ”^§·Ø„7\0Àg\á]¸ö\í\ã‚;V\Û\ÖN%°	o\0€\ß\Â{ý¼‡k\ro½À&¼\0>\ï5³sk\ro½À&¼\0„7\á\r\0@C\Â[÷.¯-¼õ6›ð\0ø,¼7-Wkx\ëm6\á\r\0ðYx\ïÙ¾Ú¬™5\âøU\ær\ÞF`\Þ\0\0Ÿ…·\Ö\'\Ë_<.¼õ:Âšð\0ø1¼KKÍ¦EO¿\Ê\\®\Ó\Ûl\Â\0\à£ð\Ö#¨m\\8¶\Öm\ÞzGY#¼\0~o™¨wlšk>œ1´\Ö\àŽ•\ÞG\ï\ËNx\0R\Þ\'š¶™\Â	o\0€\Ï\Â;‘i»®)œð&¼\0\Í\Þõ\r\îXÞ„7\0 ™Ã›\"¼\0„7\á\r\0\0\áMx\0oŠð\0Þ„7\0\0„7\á\r\0 ¼\ë\Þ0Ÿ}öaMx\0ü\Þ\ë×¯7?ÿù\ÏM»v\í4 Ì·¾õ-3|øps\è\Ð!÷ö©S§º\×kM˜0Á½nÉ’%U\×=ò\È#fÖ¬YU_k}ý\ë_7gu–y\ì±\Ç\ê–Ó§Ow\Îó\Ï?Ox\0\ïøÚ·oŸ9ÿüóMÛ¶mÍ¯~õ+“››k.¸\à78ÿ\çþ\ç¸ð\îÖ­›{\ÝC=tLxÏœ9Ó½|\Ë-·˜Q£F™û\î»Ïœs\Î9\îu›7oN:,?ú\è#3l\Ø0³|ùr\Â\0@x\Ç\×s\Ï=\çl$©º®¨¨È\Â;t\è`JKK«\Âû›\ßü¦9û\ì³\Ýû\Üp\Ã\r\æ\ÔSO=.¼5\Ôc?\ç\î»\ïv¯+((p¿4h9\í´\Ó\Ìé§Ÿn\î¹\çSRRb®¾újs\Í5\×T}¾¸üò\Ë\ÍÜ¹s\Íy\çg^{\íµZ¿÷?ÿó?\Ím·\Ý\æ\Þ>p\à@÷þ|ðÙ²e‹{Y\ßD\Þ\0€\Þ÷\Þ{¯°“&M:\æz\rT½^ƒ0\Þ:U\ëR§\áSN9\Å\r\Ú\ê\áý¯ÿú¯¦K—.\î÷Ÿt\ÒIæ¢‹.r\ß\0,^¼¸\êMB,ÔŸ}öYó§?ýÉ½¼p\áB³n\Ý:÷r¿~ýÌ´iÓªV›\×ö½\Ñh\Ô}Cqð\àÁªµcÆŒ1O<ñ\Ä1o\Zo\0@‹\n\ï?þñnÐ½ø\â‹\Ç\\Ÿžž\î^¿u\ëÖªðÖ\Ö\åoû[w©“mM\áR ‹‹‹«&c½nÀ€U\í8Ž»J]W\Ù÷\î\Ý\Û:Ô½~ÕªUÇ„wm\ßûÿ÷UA®\Ëþ\ç6¿þõ¯\Ýú\îw¿\ë¾i ¼\0-.¼u´X\êªèŒŒóúë¯»«§;v\ìx\Ì6\ïÉ“\'›s\Ï=×½¬«\ÕuZnS\Ãjs„¯¼òJ÷\ëq\ãÆ¹?£{÷\î\î\×=zô0}úôqk\ìØ±\îm:©\ë\ï\ÓU\ÝW]u•{]|x\×ö½º½^\×\0\èŽqú\ï2dˆ»*ÿ\ßø†\éÕ«Û¼\0-3¼÷\ï\ßo¾ÿý\ï»\Ó\ï/~ñs\æ™gV\íˆ6xð\à\ã\Â[WU\ë\åŸþô§fõ\êÕµnóÞ°aƒ»\Í\\\ÃU/¿ô\ÒK\îíºš^\ß0\è¶óÿý\ßÿu\ï«ob¿ó™gž9.¼\ëú\Þ\ßü\æ7\îmúfa\éÒ¥U?gÆŒ\î\í+V¬pß˜Ì›7¯\ÖË\ÞòÆ¢³ü¼»²²²^\æ\0h\ÒðŽ}T\ìúë¯¯ú¨˜\îöOÿôO\îRV|x?ýô\Ó\îe]•ý\á‡÷Q±ø\Öôcbz\ÝM7\Ý\äNÉ™™™\îvpý=úûö\î\Ý\ë\ÞO\'~]Í­Q‹]ÿQ±º¾7¶\Ê\\§n]M®ÿ\æN:U}\Ì-þ\ç\Ôv¹>\á­amYÖ½\Ö\ïIhï•¥ñªG \0 \É\Ã;Vºº»°°ð«ó¯Ze$œÌ¶m\Û\Zuõ³ql;xs~oC\ë\Í7\ß\Ô`~Fj•„uy\\XS¶m\Ï\à\0h¶ð¦j.]3mj\ìø\Ê\ÌÌ¼žG \0€ðöAý\ãÿ\Ðp~]ª²Žð®\à\Ñ\0 ¼}vlóH$r…„ôÁ:V›I\Ív§×®]O\ã\Ñ\0 ¼}pxT	\æ3$¨w\Ö\Þ\ï\Ëm\éNl\àû½\ë\Ê\åR£\Ã\áð¥<:\0„w\nm®¡\Þ\Z\Üñ·\ç\ä\ätô>>6]\î»SJW¹‘\åýH™„yznnn;±\0\0Â»OL\"ü¤Þ•iii\íOð§i+÷¿Y\î;AB}£,Ë¼@\ß-•gYÖ€h4úÁ\0@xSM|„5	\à\Ûuš®\Ï\ßJ¾\ï\"	\î%Ì—JU­j—\ËH˜‘Ë—ñˆ\0Â›j‚Ã£&0u\'¤K—.§Jh÷’zG‚{‡\îÁ®«\Ú%\Ì?‘ E.g²ª\0o\Ê\ç\Ç6—Ð¾Q\ÂüY	\î\rºª]W\ÑK˜\Ëõs\åò@ÝŽG=\0Þ”OL’““sa8¾_‚{±Ô—ÞªöC\æ+%\Èÿªg\ãY\0\0„7\á\íã³Š…B¡\ÞwHM•ú<¶ª]\êS©W%\Ìm¹\Ï\É<3\0€ð&¼}L&ð_\è±\Øe\ZÿH–¥\Þ^\í\ÅRóô„*\é\é\égñL\0Â›ðö1	\ïHôVµ\ïóóZ¢\'Z‘\ë—\å\Ïx\æ\0\0\áMxûXÏž=O‘ÀþL\áo\Ér»·ªý¨\ÔV™\Ú_“e˜U\í\0@x\Þ>\'A~L\á\ã%¸\×\É2¶ª}„ù|¹mH·n\Ý\Î\æ\Ù\0MdÎœ9.\á\Ý`\Ñhôüp8<B|¡ù\ÞØªv¹ü¡,\Çegg_Å³\r\0\ZIAAAEQQ¡\ÛHµmÛ¶­\Þe­ýq¥«\Úe\n¿M‚ûM	ðmr9¶ªý3=]ª|\ÝX«€Vg\îÜ¹\æ\ç\çW\îÚµ\Ë÷ÁXZZ\êû\à\Î\Ë\Ë;\"5šG\Öñ$°¯• Jj­øao:ÿBjL\íCeù=º\0	’°)\Ó\âA]\Ý\ë×š5k–{6.?ÿu\â&¸×£G\Îò7&U Áþ…\æ\Z\êk$\àŸ°,\ë\Zº\0§\á­\Çó¦-“®F—¿qTBû\r	óBo5»V¡|=E®\ïÎªv\0Ý£™½˜[	\í«u\n\×i<¶ª]®\Ó\âÞ•\Z®\Ó;]\0¿WdddüN´^ú\æ\Í\Û>¾À\Û^\î®j\×\í\èº=]·«\Ó%\0ð]…Ê‰4OW£\ëž\ëº»·\'ûQ}“§{¸\ëž\îºÇ»\îùN§\0 u\á]®¡¨‹~¦\\?[.¾ZJ\ëZ\é}ö|¡~]?“N—\0 ùÂ»T^|C\'=±Š<vK\å\ëQà¼£Á•J­—\Éü\é\Ì\Ì\Ì\ë\é\04]x\Ò\ãh\Ó	4„‡]BÛ‘Ÿ¬\Çg÷öh×ƒ\Èl—«ß–\ëo\×S§\Ò)\0hò¢º_\ÏEM\'\Ðo\æ1m•wµJ\ïŒj‹õkz¦5º\0õ ’\êO\'\Ðµ3ô\\\æzNs=·ylU»w\Îógô\èt	\0›¼w\ëÇ„\èš[nnn»H$bKp¿*õ©\Ô\ïx\íŸKM\Õ5B¬j€\Z\È\ä©\éü@\Âúr	ðG\å1¹R\ÞX\êþz\ß/uU»\\ÿ@NNÎ…t	\0á•õ™¾X\Ò	øQ4\ZýŽ<>\ï‘\Ç\é]K\ä\r®L–dùœ„ýMt	@k\ïõ(ZtA «\Ú\å1›)\ÙW$¼?\ÑU\í\Þ^\í;\ä\ëi–eõ\âXý\0Z<\ÝYH^ô^ ð\Ð\Ë$´\Ç\È\ãø¹|PWµ\Ë\åýRKu“‡ÿ\Ð\Ã{µ\î0D\'\ÐRt\í\Úõ4	óò¸Î“\Ú\í\í\Õ^&a¾Q–\Â\áð\Ír·¶t\n@\Ã{™DƒN ¥\ÒU\í\Ø\é\Ü/\ëf\"=$°º\ÔN¹<]ÿw\å\ä\ät¤S\0CM-5‹N 5‘0¿Tj”<öß­j—: ofeù\çH$r1]\à\ç\É{®Ló\éZ³P(\ÔIB»Ÿ¾‘•\çD‘·W{¹,7K½hYV\×6¬j\à£\É{º~†–N\0\Çh«\'\ì‘\ç\ÆD	q\rðr\ïð®»¤fJÀ÷\ÕÀ§M\0RB^˜¦\è^ºt¨›ö¥‘\ç\Ër]Å®«\Ú9¯9€TM\Þ/\Ë\ÒZ:$ý\Ü1¾@JX–õ¬~„†N\0I‡·n?ƒN\0H\Å\Ð8©O\è|xsZS\0)¡—‘ mtH:¼+ô#gt@³“\à©{\Ð\Ò	 \é\çÎ‘\ì\ì\ì«\è€fgYÖ½\Þ{\èô\ä]&~#\0Š >Rû\èôsç°¼ù½•N\0hvŽ\ãÜ¦‡‡¤@\Ò\á}H*L\'\04;Û¶CòTB\'€¤Ÿ;û\å¹s\0\Ð\ìB¡\ÐM2}—\Ñ	 \éðÞ«\ÇC§\0š÷\Õòt„N\0I?wŠ-\Ë\ZB\'\04;ýœª~^•N\0É‘\ç\ÍNý¨%\0\Ð\ìôQz¤(:$\Þ\ÛõD%t@³‹F£\ß\Ñ,\Ð	 \éðþTj,\0\Ð\ìB¡\ÐÉ„7P¯ð\Þ\ì8\Î\Ót@ª^„ôÔ†\'\Ó	 ©\ç\Í:©‰t@\ÊÂ»k×®§\Ñ	 ©\ç\Í*Û¶\'\Ó	\0©zªŒF£\ç\Ó	 qŽ\ã,·,\ë-: U/Bœ\ÚHþM\ï\"©™t@ª^„Ž\èÁZ\è\Ôó&_j\0ªÉ»L“J\'€¤\Â{¦N\ßt@ª^„Ke\Ò	 ©7½oÛ¶½ŒN\0HUx´,«;\0’\n\ï\×$¼W\Ò	\0©\n\ï/¥ú\Ð	 ©\ç\ÍDý¬7\0ª¡=2y\ßK\'€¤ž7\ÏHm¢\0Rõ\"´K*—N\0I=o\Æ\êñ\Í\é€T½qv$ I\ápx”<o¶\Ñ	\0©\noÎŽ$\Þ÷Kx\ï¤\0R\Âqœ–e=K\'€\Ä\Ésfˆ<wŠ\é€”\éa­L\Þ/\Ó	 ©7½ý¥ö\Ò	\0©zú@¦ˆ7\è8y\Ã{‡¼ñ\ÝO\'\0¤jò^\">N\0I½\éÍ–\ç\Î!: U\Ä©9tH\\8N\×C\Ó	\0©\n\ïYR\é8™ºo”\çM\0œ`¨\×ó\æj=.\0ª	b²¼­¢@\â\Â\áð¥ò¼© \0RB^€^”ZO\'€\Ä\å\ä\ä\\(o|+\é€TM\Þ\ã%¼?¦@\â\Ò\Ó\ÓÏ’\ç\r\á\r 5\ÇyT^„>£@\âB¡Py\Þ: %\ä\èA©^Ÿ¡;\âddd\\BgJÆ˜ö[¶l)\\¼x±™3gŽ™={¶\ïJ\ÃÛÿ®ø\Ê\Ë\Ë3,¨”z’G\Ü)ûÛ¶Kt/Y\Ý\ÙF_|j©|º…T\Ò\à.((0EEE¦¬¬Œj@\íÞ½\Û\ä\ç\çWJ\æ‘w\Ò.¨#´µ*{ô\èÑ™N!•t\â&¸7Àe\çs\é@§o©º¦\î÷\èRMW•º[º\ZG\ì\0ŸR[xÛ¶}Bªi\Ð¸„7€j\ÓwMÛ¼%¸W\Ð)¼\î\Ûa¶,{Þ¬Í»\Ï-½¬\×Ö„7\Ð\"…\Ã\á\'«‡w$±\é‚\Þön7kf7«¦\r:¦ô:½À&¼\É\Ûó<Þ…tA\n\ïÂµoÜ±Ú¶v*Mx-“\ã8ýcá­—\é‚\Þ\ë\ç=\\kx\ëm6\á\r´\ä\é{¿w¤(>†@…÷šÙ¹µ†·\ÞF`\Þ@‹•™™9üº\ë®\Ó\'µ\ÖH:Â›ð\àƒ¿þõ¯\ë“Z÷4¯$À”ðÖ½\Ëko½À&¼–\ê\Þj=Œ\0GP\Â{\Ó\Âqµ†·\ÞF`\Þ@k\î]ø*¼÷l_m\Ö\Ì\Zqü*s¹No#°	o µwõÛ‡\Ñ*ø5¼µ>Yþ\âq\á­\×Ö„7\ÐÚ‚;†U\èðwx—–šM‹ž<~•¹\\§·Ø„7\ÐÚ‚;>À+˜À\á·ð\Ö#¨m\\8¶\Öm\ÞzGY#¼\Ö\Üñ\ßWÁ_„·L\Ô;6\Í5\ÎZkp\ÇJ\ï£÷e\n\'¼\Ö\ÜÕ¿Ÿ	)\ïM\ÛL\á„7Ð’ƒ»­\Ô\ÓÞ².\Õ\ï\Ç6p¤4¼™¶\ëš\Â	o\Ârpohó\Õ\Ñ\Ô6\Ô\àµÝ	)\ïúw¬o\Âbp·ñ&iW5x|p\Çjü	~.´´´öõ\roŠðZcp\×\Ìñ~¢\ÛcX…Žz\É\Ê\Ê*\Ós\ÉÞ„7€Ä‚ûD\Þ.Á\àŽÿ=ì…Žd\Ã;v\n\ÚrÛ¶¯m\'¼	o€\àN,ÀË’\î\ê\Î6p$Þ±’\0/‘\ZIx\Þ\0Á˜š<™\àŽa:\ê\ÞquPj\áMx­Ig/t\×&ù}\íj˜¸Ë¼\ë“1£Ž\åXUV«ŠjuÔ«#^•\ëªUoY&\ËR¯k\é\Ä&K\Úy/ü´\ä¾ûeù¥\Ô>¹m¯|ý…\\Þ£%—‹e¹[®/’\å.Y\î”\å©\í^J}&µU\êS¹ÿ\'²üX–›e¹Ijƒ|\ÏG²\\/Ëµ²\\#\Ëe¹Jj¥\\^!\Ë÷e¹L¾g©\\^\ì\ÕB©¹n¾,ó\åö¹²Ì“\ålYÎ”šnY\Ö;²œ*Ë·\ä~S\äò\ë²|M–¯\Êý^‘\å\ËR\åº¤ž“û=+Ë§å¶§¤ž\Û\Æ\éjh¹\îQ¹mL8%\×ýY\êA¹\în\åº\Z²*\ËÁR\å¾\äöþr{_Y\Þ%_÷’\ë\ïú\\\î.Ë¨T8‰Ø²Ì”\ïM—ú\\¾E–7\Ë÷Ý˜™™y½|\ïµrÿk²³³¯’\Û~\n….—\åe—\È÷^,\Ë\æ\ä\ä\\x¢Ç‰þ=\å\ç\ÜOx\Þ@k›¼]…\ÝØ“÷Cú=ò¢}²nÇ”ey±\îØµk\×Ó¢\Ñ\èw\Ò\Ó\ÓÏ’\ç\ï\É\åó\åúRé‹º,,!p©÷bÿ3ùúJ	‚«5¼Pø…\Üv“†…¼¨w•ºUCD\Ã\ÄùJ¶2¿“\ï½]¾¾SCH\ÃH®\ë§\á\ä…Ô½RC¼ð\ÒË•\åý\Zn\ZrrÿG¤FkøIýU®«¡\è…\ãxùú\rM\rO¹ü¢,\'i¨\Ê\Ïø»,\'{a«¡û¦,\ßö\ÂxºÜ¦olfya­¡=\Ïñ©w¥iÀ{aÿž,—{oôÍ€\Öj\ïM‚¾YX\ç½y\Ø ÷\Û(\Ë\ÍÞ›}“ñ‰÷¦\ã3ùºP\î·\Í{C²Ã«Þ›}ó²[–\Å\Þš/¤ö\ê›}\Ó#—¿”\Û÷{o†zu\È{³{\ã{#¥oª\Êbo²ôM—\Üv$\î\ØQ¹\Í}s¦K¹­27yU\Õ\Ø\áUZZj¶l\Ùb:”\Ôm„7\0¿¬:o¬mÞ±cŸ³\Ê\rZm®o t\r@}W›ÿ\èG?ª\éM¨\é×¯ŸÌƒ6:tp¯ûö·¿mzõ\ê\å^_\×muý¾—^zÉ½ÿ›o¾Y\ï0>}ºû3žþy÷÷=ýô\Ó\î\Ï%¼<\Ñ\à®\ï\Þ\æ°\r\r\ïÝº¦¤úý’\ro\rÀÑ£G›o¼\Ñ}\ìö\é\Ó\Çý://\Ï¸\×\ém\Z7\ß|³ûõë¯¿^\çm‰„÷”)S\ê¦}ô‘6l˜Y¾|¹Y´h‘ûóô\ßLx­;Àk\Ú¼±>\çm\Ã^\æhXx\ëþ\Ñ\Ú\îW\ßm\Þ#FŒp·ó\çÏ¯º.\Ð]ºt1.4Û·o7O=õ”{}]·Í˜1Ãœw\Þy\æ\í·\ßvÎ€Ü¯>\\Þ¿ü\å/\Íi§fþû¿ÿÛ¤õ~/¿ü²{¿\Ûo¿Ý\ä/¼ðB3~üxóoÿöo\æ_þ\å_\Ü£\Þo\îÜ¹\îý^{\í5sé¥—º?¯S§Nf\ìØ±„7ÐŠ\r«a2n\Ì#¬¦Å¨Gx\ê~\'º_c†·\Ö\r7\ÜPõxþ\îw¿kh<X\çm:}\ëu¯¼òŠ{¿h4\ê~\Þ\ßÿþ÷Í¨Q£L\çÎÍ™gž\é®þ\Öð\×Û®¼òJ3f\Ì÷òI\'d~øasñ\Å»_\ïÝ»\×L›6­jµù Aƒª\ÞD\è\Â`oŠc›\ÜhR\Þ%%%\æ\ïÿ»\É\Î\Î6§Ÿ~º{Ÿ¾}û\Öy[õð\ÖÛ«‡÷_þò÷¶û\î»\ÏýzÁ‚U\áýê«¯º·µo\ß\Þ\rò\Øô®·mÜ¸ñ˜ðfµ9€\Ú&ðø\0\ß&±³Š\Åß\Ïs#á­«¡ÿý\ßÿ\Ý,[¶\ÌýzÏž=n þ\ä\'?©ó¶Xx¿ø\â‹\îmÇ…÷c=\æÞ¦Ó·~ŸŸ_Þ±ÿ‡o}\ë[\î¶t½ü§?ýÉ½mÃ†\r„7€„&ð†l£&¸\Øð^¹r¥ù\Ú×¾f~ü\ã»!‰D\Üû\èjðºn\Óm\àzY·\Ñ\ëvo\Ý]=¼/¸\àó\ì³Ïº«\Ãuj\×\Ûj\n\ï[n¹¥\ÎðÖ\Öô²\ã8\æý÷\ß7+V¬p/Ï›7¯\ÖË„7\Ð:\'ðd‚Ÿ\àF`\Ã;6_r\É%\îm\íÚµ3\×]wÙºuk·8pÀüü\ç?w¯\×`ÖÒª‡·n£\Ö\íÙº\ã\ÙÄ‰ÝŸ§;§Å‡wÇŽo]mÿQ1\Ý~\Î9\ç¸_\ßs\Ï=\Ç\ÜV\Ûe\Âh]x2ALp#P\á}¢Ò½\É5”“¹\íó\Ï?¯ós\ß\Å\Å\Å\îvó†þ\Ûô\01Û¶mcµ9€Z\'ðDV¡GÛ°s\ZZXxsxT\0-ym#\'¸Ax\Þ\0\à5}> ¼	o\0>ðaqÁÍ‘\Ó@x\Þ\0|.6i\ç·ùÿ\ÏÞ„7\0¿O\àúYV‚„7\á\r @4¼õ\\\Üt„7\á\r X\áÝN€ð&¼+¼;\Ñ	Þ„7€\à„w¥\ã8g\Ð	Þ„7€€°m»²G\éo\Â@€\Â;\'\'\çB:Â›ðYYY‘H\äb:Â›ð ð–ºŒN€ð&¼\'¼JýŒN€ð&¼\'¼8Žs5€Ì™3‡À%¼$\Þ\å–e]G\'\àEEE„n#Õ¶mÛ¶Jx—ñ\ÈZ™º\ËB¡\ÐMt~0w\î\Üóóó+w\í\ÚEø6Bp\ç\å\å‘\Z\Í#hy“w©L\Þ]\éüB\Âf¤L‹uu¯kÂ„	FL\è\×_\\•\Ü@\Ë\r\ï\Ã\áp8N\0	?g¾ô\Î\Æ\0©a\ÛvI$±\épbŽ\ãô\×\àÖ’\Ëw\Ñ\0©š\"JE\éØ›\ÝXxK\Ò\0©\n\ïR¿£À	ƒ{t\\p»eYÖ­t@³sg¿Ôt¨óyr†TEõð–z\î\0H\Å\ä½O&Š¾t¨3¼§\Ô\Ün\Éó\ç\": ¹_”¾°,k\0\0jŸº½\Ã›ZŠ\é@³O\Þ{$¼\ï¥@­Ï‘‚:‚[«²G\é€fc\Ûö\îp8<”N\0µN\Ýú‰Œ#\'ð|º 9§Š]R¹tH8\Ðo\Ó@\×Ë‘H\ä\n=±OFF\Æ%t@s†÷yñy€N\0‰±,«—<g¾¤\0R\ÞÛ¥þL\'€„\'\ïþR{\é€T¾\Ê$1†N\0	O\ÞC\äySL\'\0¤rò\Þj\Ûö\ãtHø9“«ûŠ\Ð	\0©œ¼?‘ð~‚N\0	‡÷Ÿus\0\Êð\Þ,\á=žN\0	?g•ðþŒN\0H\å±A^Œž£@btM•®±¢\0R\Þ\ë¥^¤@b,\ËzV\Â{#\0\Ê)b­„÷\ËtHø\r\ïD©ut@*_ˆVI€O¦@\Âox\'\ëó†N\0H\Çq>°,\ë\r:$ü†÷M©÷\é€T†÷r	\ï·\èðsfšL\ßK\è€T¾-•ð~‡N\0	O\ÞyzšP: •/D‹¤f\Ò	 \á7¼óeòžK\'\0¤2¼t’ @\ÂÏ™Å¼\á\ê¢|©ytHŒL\Ý\Ëdú~›N\0Hex³ýH\î9³R\êu: •/D3u»7\0ž¼9°€\Ô\âc/@\Òox7HM \0R\Þo\ë6<:$üœ\áL|\0RK®¦GY£@Â“÷V	\ï\Ç\é€”\á8\Í@\ÒÏ™m\ápx\0\Ê¢W$¼\×\Ð	 \á\ç\ÌN	\ïû\é€”ñNo¸žN\0	?gvK\r£\0R\Æqœ\çt\ïY:$\Þ{¤\Ò	\0©\ï§\å…h3\0\ï}R}\è€”	‡\ÃOÚ¶½…N\0	‡÷y\Î\ÜN\'\0¤Œ~\äE?úB\'€„\ÃûT˜N\0HË²\Æ8ŽSH\'€„\Ãûp8N§\0R9y?\"/F\Û\épx—Ix\ßL\'\0¤ò…\èA©tHø9S\î8Îµt@*_ˆr¥v\Ñ	 \á\ç\ÌQ©Ÿ\Ñ	\0©|!\Z¦ @\ÂÏ™ŠŒŒŒK\è€T¾\r–*¦@\ÂÏ™JÛ¶@\'\0¤ŒeY\Çù‚N\0‰‡wzzúYt@\Ê\È\ÑWE\'€„\Ã\Ût\é\Ò\åT: •“w/™¼¿¤@\âá››ÛŽN\0H\å\ä}»\î‘N\0\'¦¡­\áM\'\0¤zŠˆJ¤À‰\å\ä\ät$¼¤œ#\äÅ¨„N\0\'¦;ª\ékt@ª\'\ïL=V3\0š¼/´m›ðZ–eu•ð.¥À‰\éÁYÇ© \0R*\n\Ý$/Fet81=,ª•N\0H©\Ì\Ì\Ì\ë%¼\Ëõ²\îŒ#—¯ŽD\"W\Ð\àx–e]§\'&¡\0š•„ó^yñ9¢«þt¯\ÙZjŽ§§\ÕS‚\Ò	\0\Í\Þ/\Ô\Ún\éôM§€ã±ƒ\'€”HKKk¯“wmÁm\ÛöZº\Ôú\æ7[ž#‡\è\0_M\ßL\Ý@\í8\"!€TO\ße5„w!\Ý\êoN\ä ¥/B#k˜º\ï¢3@\í\äy2Pj\0\Ê¢/\ãÂ›$\à\ÄÏ™\áR»\é€”‘I»\Ü\ÔÝŸŽ\0\'|\Î< Ï—t€/¦o:œX8e\Ûö6: ¥,\Ë\ZBx	¿\Ù+õ)\0Z0cLû-[¶.^¼\ØÌ™3\ÇÌž=Û—\å8ŽoÿmZyyyfÁ‚•ROò¨B*\É\Ô=^ž/›\éÐ‚ip˜¢¢\"SVVF5 v\ï\Þmòóó+%\ÈGó\ÈB\n\'\ï	R\èÐ‚\é\ÄMp7n€\Ë$\Îq¥‘\Ê\Éû	\ï5thÁtU9¡Û¸¥«\Ñyd!…“÷\ëR+\éÐ‚i\Ð¸„7ZTxO•zN\0„·9¸o‡Ù²\ìy³6\ï>·ô²^GX\Þð]xÏ”ZD\'€V\Þön7kf7«¦\r:¦ô:½À&¼\á¶m\Ïug>\0Zyx®}û¸\àŽÕ¶µS	l\Âþš¼ß•\0ŸM\'€V\Þ\ë\ç=\\kx\ëm6\á\r_M\ÞKdòžF\'€V\Þkf\ç\Ö\Z\ÞzMx\ÃW\á½B\Â{\n\0oÂ›ðFp\Â{uVVÖ«th\å\á­{—\×\ÞzMx\Ã?$¸\×IM¤@+\ïM\Ç\Õ\Z\ÞzMx\ÃW\á½I\ê:´òðÞ³}µY3k\Äñ«\Ì\å:½À&¼\áŽ\ã|b\Ûöth\å\á­õ\Éòo½Ž°&¼\á»ð.´,k\0Z{x—–šM‹ž<~•¹\\§·Ø„7ü#++\ës	ð‡\èÐŠ\Ã[ ¶q\á\ØZ·y\ëmeð†¯\Â{—T.\0Zcx\ËD½c\Ó\\óáŒ¡µw¬ô>z_¦p\Â¾\ïb©Áthe\á}¢i›)œð†9Ž³Wª?\0ZYx\'2m\×5…Þ„7R\Z\Þû-\Ë\êE\'€V\Þõ\r\îXÞ„7R\'++ë „ww:´²ð¦o—m\Û%‘HÄ¦\0\áM\Þ\Î\ä]*“wW:\Þ\á\à„w¹\ã8¿ \0\áM\ÞNx‘ð¾šN\0„7Ex#8\á}T\ê2:\Þá€©»\"##\ã‡t ¼)\ÂÁ™¼+¥¾G\'\0\Âû¸úÑ~¤u\\õ\ë\×\ÏL:µ\ê\ë	&¸÷_²dI\Õu<òH\Õ\ÏYºt©{\Ý7¾ñ\r³{÷n\Âhxx›®]»žF\'\0\Âû¸zþù\ç\Í\èÑ£Í7\Þ\è†oŸ>}Ü¯óòòŽ	\ïnÝº¹÷è¡‡j\ï^½zU]ÿø\ã\Þ@#„wÏž=O¡\0\á]k1\Â\r\Þùó\çW]\ïo~ó›\æ\ì³\Ïv¯»\á†Ì©§žzLx\ïÛ·\Ït\ì\Ø\Ñ\\y\å•\îò’K.©úÓ¦M3\çwž¹\ãŽ;Ì™gžiþ\ë¿þ\ËÌ˜1ã„·½ù\æ›\îm2y¸¿oò\ä\É\æ\ÕW_5ÿñÿaN9\å÷w-^¼˜ðF‹“››\Û\Îqœ)L\Þ\0\áÝ ð¾\å–[\Ü\åò\å\Ë\Ý\àüÕ¯~uLx\ëô®_?\Þ\rb½ü\î»ïº·i\è\ê\×\Zþ#GŽ4\ßû\Þ÷Ü .--­ó¶—^zÉ½\íœs\Îq§~\róv\íÚ™‹/¾\Øüñ4§Ÿ~º[»v\í\"¼\ÑbØ¶}£÷—²\ÜkY\Öut ¼\ë\Þ\ZÒºü\ío\ë.G\ZuLx_s\Í5\î\×\Z\Æ<ð€{9\'\'\ç˜ð~ðÁÝ¯~ø\áª\ßS\×m±ð~\ì±\Ç\ÜÛ†\â~­«óõk\r{ýúõ\×_\'¼x¡P\èd™´§JUH½*Wµ¥+\0\áÝ ðÖ=÷\Üs\Ý\Ë:ý.\\¸°*¼×­[g¾öµ¯·\Ã[lÇµ\ê­a¬_ë¿·®\Ûb\á­÷\Ñ\Û\ì~­¿[¿Ž½¡\ÐU\é„7‚L\Âú©R_pP€ðn\ÔðŽF£\î\åŸþô§fõ\ê\ÕU\á=h\Ð ÷òØ±cÍ¢E‹\Ü\Z0`@\Õ\Ô\è.¸À\Ýc]·‡û\Û\ß6%%%u\Þ\ï)S¦Tm×¯u\Ê\×\Õó\çŸ¾»-¾°°Ð¬X±\ÂÈ‹ž™7o^­—	oøqÚ¶m{†~ž[j\Ó6@x7zx?ýô\Ó\î\åš?üÐ½¬«¹uµn{>t\èP\Õ÷mÝºÕœt\ÒI\æ\ÒK/­\n\è+®¸Â´m\Û\Öt\î\ÜÙ¼ð\ÂÇ¬R¯\é¶Xx\ë¶\î\Ø\Ï\Õ7:ur¯?ë¬³\ÜŸ^?}út÷:\Ýö^\Ûe\Â~bYÖ­z\ÊO	\íb	ð+\é@xûªb­K]òu\ÝV[\é\ÎlÛ¶m\ã£b¤´´´ö\Úy:m\Ëroß‡w2·ñ9o´42a‡$°KdY‰D® #\0|\Þ\Å\Å\Å\æƒ>p—\É\ÜFx£¥\Ð­Hh\ç\ëž\ä2q?MG\0ø>¼9\Â\ZZ3	\ì°\Ôa©\ápøR:€ð&¼\áS¡P¨ƒö»:mÛ¶ý@x\Þð1Ë²ºK`—Jpo—\å\é\0Â›ð†O\å\ä\ät”À^\ì}nû¯t\0\áMx\Ã\Ç$´\ï*“ú,##\ã‡t\0\áMxÃ§B¡P\'™²—\ë¶\íp8<ŠŽ\0 ¼	oø˜„ö]\Ú\åRŸ\ä\ä\ä\\HG\0Þ„7|JÏ±-½R\ê¨Ôƒt\0\áMx\Ã\Ç$¬û\é´-S÷\æh4z>@x\Þð)	\ë3l\ÛþÐ›¶s\é\0Â›ð†¿§\íRG¤6H}Ž\0 ¼	oøTzzúY\Ö\ë4¸\Ã\áðP:€ð&¼\ác\Z\ÖÞ´½®[·ng\Ó\0MbÎœ9.\á\Ò\Õ\â\Þ\êq\r\ît@“*((¨(**\"t©¶mÛ¶UÂ»ŒGV«š¶G\èiºcš\î FG\04¹¹s\ç>˜ŸŸ_¹k\×.\ßcii©\ïƒ;//\ïˆ\ÔhY-Ÿ~\äK?ú\å}¬?Ð¬$lFÊ´xPW÷úµfÍše\äE\Òøùß¨7Á\Ý:HX?\à}ük¥|…Ž\0@-4¼õLt©¢‡3\ÕÃšz\Óö]t\0NÀ¶\í\Ê=zt¦H\Ñ\ã\ï=‘ˆžPDO,BG\0 ±\É[\ÏÀt)@s\ÒSu\ê);½Sw\ÞAG\0 ¹ð>bY\Ö5t\ÍE¦\ìG¥*d\ê^\Â&\0¨_x—Jxw¥hj\Ö?–\Ç\Ûv}\ÌIx\ßFG\0 þ\á}H^H³\éšøq6N7\ÑH-\ìÒ¥Ë©t\0\Z@‚ûK™¼{\Ñ	4ÝŸB{‡\Ôa©0€Æ™ˆöHx\ßK\'\Ð\Øl\Û\ï\íI>¿gÏž§\Ð\0h¼ð\Þ)/²#\é\ZK(º\\SER%R!:\0L¦¢B™¼\Ç\Ð	4Ò›Á	º\'¹,ç¤¥¥µ§#\0\Ð4/¶\Ëtô@C\Èc\èJ	\íby<”7ƒ·\Ò\0h\Úð^\'5‘N ž\ÚJhOò¦í™¡P\èdZ\0M\Þ+¥^§H–öÕºÃ£\Ô©[\è\04_x/–šN\'Ì´-™WuOrË²\Þa\Ú€\æ\ï|©yt‰°¾Î¶\í½2u\ï—Ð¾‰Ž\0@j\Â{ºN\ßtu\É\Í\Ím\'Áý†w”´7õkº\0©›¤Þ)\ê:\Ú\È\ã\ã\Ø_J\í\Ë\ÌÌ¼žŽ\0@\ê\'ï‰º\Ç9@MÓ¶÷\Û\ÞQ\Ò^“«\Ú\Ò\0ð=„¥¼0o¦ˆ‡oÖ½\È\å±ñ§Œ\0ŸÑ£«\éQ\Ö\è”\î9®ûAxŸ\Û~™i\0ü9aÝ¯\Ç7§\Ç\ÂoôiR\Å\Ù\Ù\ÙW\Ñ\0ð\ï\ä}¯hƒN´^zrÛ¶g\ë´-õ\0Ÿ“\ë»ôœ\Þt¢u’7n™R‡¤vG\"‘+\è\0#¼³e\ê:D\'Z=¿¶œ\Çû\Üö3t\0Ä²¬®ò\â]J\'Z\Õ6Gþ\æ%º¯ƒ\Ôet\0‚÷B~­¼€—Ó‰–/\nu¿uN\Û\ápøI:\0%/\â—\ê‹9h\Ù\äo•:,õyFF\Æ%t\0,\Zž//\è•t¢e\êÒ¥Ë©Þ™\ã*l\Û~œŽ\0@““\ÓQ^\Ø\rh‘\Óö\ït©\ÂH$r1€–£-\á\Ý\"ß½\çMÛ£\é\0´\Ì	\Í\è>>Ë²z\Éß³Lj«÷Et\0Z(y‘¯\ìÑ£Gg:\\]»v=MþŽ+$´:Žó€–?y\ëG‡.¥}ó\ÕW»\\–[¤~@G\0 u„÷Nû<\Ñhô;ò·[¥Ó¶„öH:\0­+¼KõHkt\"8dÒ¾G\ßtImb“\0´\Îð>¤\Ç8§þ—žž~–L\Ùk½\àFG\0 õNq_\ê^\Êt\Â÷o²Kp‘ú¨[·ng\Ó\0hÝ¡°G\Ï\ëM\'üIƒZÛ›¶\Ó\0€†÷Nvxò\í\ßf¸·C\ÚZ]eNG\0\0.\Çq\neòC\'üCwBÓ\ÑôŒoò·@G\0\0Õ§»e²{ŠNøC8¾ß›¶W\ê\ÇÁ\è\0 ¦ð^\'5‘N¤–`\ÅqœO¼®ô¥#\0€º\Â{¥\Ô\ët\"¥ƒ?\ë´-õ¾ê”Ž\0\0Nz¾\ç\ét\"%\ÓöEz™¶Ë¤\î¤#\0€D\Ã;_jh^º“ v…\ÔR\Î\ê\0H6¼§\ëôM\'šG$¹X&\îmzXZ©\ß\Ñ\0@}&À7dúû€N4\Ë¥±z7©E]ºt9•Ž\0\0\ê(us:\Ñt222.‘\ï:,¥#\0€±m{¼LÞ›\éD“õ÷)o\Ú^\n…:\Ð\0@ƒy;NÒ‰\Æ%A}¹ö.©’H$b\Ó\0@£ñŽèµ“N4\ê¢guOr™º\çö\ì\Ùó:\0hì ¹W\Ï,F\'\ZNúø3©\ÝzŽtyS”NG\0\0MB&Ä»ôœ\Þt¢ÁÁý¢NÛ²œ•––ÖžŽ\0\0š2¼³m\Û>D\'\ê\';;û*]s!uÐ²¬®t\0\Ð\ä4pô€!t\"im\åM\Ï+º\'¹¼š\n…N¦%\0€æš¼¯\ÕóFÓ‰\äz&µW\Â{8¾™Ž\0\0š•„Ï¥:=Ò‰Ä¦m	\í×´_–e½•››ÛŽ–\0\0š]4\Z=_Â¨’N\Ô-33óz\é\Ó>©/%ÀAG\0\0)£g´’@2t¢f:]K\ÞôŽ’¦\ç=oKW\0\0©Ö–ð®Y(ºI·k\ëöm\Ý\ÎMG\0\0¾¡\á\Í9¥	\í“-\ËzG§\íp8üw¦m\0€\ï\ÈtYÙ£G\Ît¢\ê£sõ³\Û2m_MG\0\0~¼uÂ¼´5÷@Š¦GGóŽ’6‘G\0À\ï\á}D&\ÎkZ\ëÿ¿‡\\2\'¥\Ç%ÿ\0@Â»´5\ÚS\Ïø¥gþ\Òi[\ê9	\0€ …÷!=\Æykú\Ösl‹=ç¶ž{›G\0 Pô¬b2y÷j\rÿ¯\Ô$°\èv~	\ïñüõ\0A¼÷\èy½[Á›”lù=,µ£µ\ï \0~x\ï”)tdKýÿ\ëÒ¥Ë©òÿ¸\È;J\Ú8þ\â\0€–0‘\Ê\ä=¦…þ¿Ý¦;\äÉ›“m‘H\äbþ\Ú\0€–2y,\áöTKú\Ò#\ÆIp/\Õ=\É[\ê\0@\ë\ïu-\éÀ$\ØwJ•\Éÿ\ÓVySra\0@K\ï•\Þ³-\nu’ÿ÷¥ŽJý™¿,\0 %‡÷b©\éÿ\è#\Óv¹\Ô\'2mÿ€¿*\0 ¥‡w¾Ô¼ þÛ£\Ñ\èw$¬u\ÍÁ\Ñp8|?M\0@k	\ï\é:}\í\ßmY\Ö\0ùw—Km\æ¬h\0€VEBð\r\Çq>Ê¿Wþ­gH`¯ñ¦\íü\0­qòž¨{œ\äÆ½z4©\rR\ß\ã¯\0h•ô\ß2\Ín\ÖËºúY._í·Xu\ë\Ö\íl	\ëõò\ï\ÒÓ—\á¯\0h5\"‘\ÈºW¶N¯„•²4µ\Ô3>Z30\Ìû÷®MOO?‹¿\"\0 5N\Ú[\êm£áž––\Ö>\ÕÿNo-ÀF\rnY\Þ\Ã_\0Ðª§\ïº\Â[\Â}²\Þ`Œ\Ô\Òd¹Z?\Æ_\r\0Àôm\Û+j	\ï\n=.xªþ]\Ô\ç\ë±Ö½€õ\ã/\0€GWI{§È¬\Þ\ï¥\ê\ß\ä8\ÎC:m\ë\ÇÖºv\íz\Z%\0\0ŽŸ¾\'×°½û\ê\æþwÈ¤¡ü\îO¥\Ê,\Ë\ê\Å_\0€Z\èNi\à%q\á½5o F\ë\Z\0Y.\Ó‹ðW\0\à\Ä\áùx,¼eê½µ¹~oFF\Æe\Ê/”\ß[*ÿ†\ÛùK\0\0\\€\Ððn\Î7Üº½}q—.]N\å/\0\0@’d\â‘žž\Þ\ä\á-\Óö%\Ø\Û%¼K\åwv§ó\0\0\Ô\ß`)\r\ï‘Mõ\Â\áð“\Þ\Þ\í\ï†B¡´\0€ú»WªRj…·l\Ô\0—°¾L&í²<\ì\Ú\r\0@\ãw,°‡5f€\ëñÑ½i{^Ïž=O¡\Ý\0\04npŸ\èú„y‡_-’Ò¡e\Òj\0\0š.¸«\ß>,\Ù\ì8\Îº\'¹mÛ³ýpr\0\0ZCp\Ç$µ\n]\ÂúJ™²‹¥†\Ã\á\ß\Ðf\0\0š7¸\ã¼\âx[	ì—½\ÏmO…B\'\Óf\0\0R\Üñ\ßWQ\Ó÷Y–uöRdÚ¾™\0ú\à®þý±	¼­wR“\n™¸\ß\Î\Í\ÍmG‹\0hº\àn+õ´·¬Kõû¹\ÛÀ\Ï=÷\Ü%´÷Ih)~#\í\0 \éƒ{C›¯Ž¦¶¡Ž\0¯ñ~§œrJ\î¯ýks\íµ×®e\Ú\0 éƒ»7I›¸ª)À\ãƒ;V\ãc7j€·i‚#±\0@p\×°5s|€Ÿ\èö˜F=\0\0w\ÝÁZ[@·K0¸\ãO\0@\Ów]^–DpWða´\0€¦\îº<™\àŽa:\0\0õ\Ð\ÙÝµI~_»\Z&\î2\ïúd\Ìð¾·3\n\0\0’Ÿ¼]…\ÝØ“÷Cü	\0\0¨€7\×6\ïØ±\ÏYe\0@xc\îm^¯Ó†\0€šƒµ¦½À\ës\Þ\Ñ6\ìe\0@£V\Ãd\Ü\à#¬\ÅMÜ£i1\0\0M37Ú±\Í	n\0\0šwðñm;«Xüýø<7\0\0\Í<7d5Á\r\0€&ðd‚Ÿ\à\0 …x2ALp\0\à“	<‘U\è\Ñ6\ìœ\0@`&ð\Ø6r‚\0€\0xMŸ\0\0>ð\áqÁÍ‘\Ó\0\0ð¹\á¶m\ëÁXò\Ûpv0\0\0ü/\nuò\Â\Û\Ü\0\0€÷²²²t\â\îL7\0\0\Æ\ä}¹„÷Q:\0@@dff^\ï8N9\0\0  \Â\ápºLÞ‡\é\0\0!S÷m\Þ\é\0\0!Á\ÝÏ¶\í½t\0€\à„÷0©\Ýt\0€\à„÷Ÿ¥¶\Ó	\0\0‚\Þ\ã¤>¡\0\0\'¼\'Hm \0\0„mÛ“¥V\Ó	\0\0Â²¬wdò~N\0\0œ\É{®„÷:\0@@Hp/–šI\'\0\0\Çq>šB\'\0\0\Î\ä½N\Â{\0\0 8\áý±m\Û\ã\é\0\0Á	\ïBË²\Æ\Ð	\0\0‚\Þ;eòI\'\0\0Nx\ï‘\ZH\'\0\0\ÇqöK\ÝI\'\0\0\Î\ä]\"\á\í\Ð	\0\0‚\Þe\ápøf:\0@@Ø¶}$;;û*:\0@p&\ïŠH$r1\0\0 8\á]™žž~\0\0 8\ám\Ò\Ò\Ò\Ú\Ó	\0\0@C[Ã›N\0\0ºº\\W›\Ó	\0\0BwT\Ó\Ö\è\0\0¡ÓŠ\Ñ	\0\0BÎ¢i¡\0\0„UJ\'\0\0Nxß©\'&¡\0\0„ž\nTO	J\'\0\0Û¶GJx\ï¤\0\0„eYc\Ç)¤\0\0gò/á½™N\0\0Ü“$À\×\Ò	\0\0‚\ÞS$¼W\Ð	\0\0\"++k¦\Ô\":\0@p\Â{\Ô:\0@p\Âû=©©t\0€€°m{µ„÷«t\0€\àL\Þ\ÇyŽN\0\0œðþTj,\0\0 8\áý¹L\Þ\Ñ	\0\0Â¶\í\Ý\ápx(\0\0 8“÷>	ð¾t\0€\à„÷AË²º\Ó	\0\0‚Þ‡%¼o¥\0\0\'¼\Ë%¼¯£\0\0\'¼J]F\'\0\0NxWF£\Ñó\é\0\0Á	o“““Ó‘N\0\0m5¼uI+\0\0€P(\Ô\Éo\0\0¶mÿ@·y\Ó	\0\0‚3y_®{›\Ó	\0\0\"33óz\Çq\Ê\é\0\0‡\Óõkt\0€€©û6=¶9\0\0  $¸ûÙ¶½—N\0\0œð&µ›N\0\0œðþ³\Ôv:\0@p\Â{œ\Ô\'t\0€\à„÷©\rt\0€€°m{²\Ôj:\0@@X–õŽL\Þ\ï\Ñ	\0\0‚3yÏ•ð^@\'\0\0	\î\ÅR3\é\0\0\á8\ÎRS\è\0\0Á™¼\×IxO¢\0\0\'¼?¶m{<\0\0 8\á]hY\Ö:\0@p\Â{§L\Þ#\é\0\0Á	\ï=R\é\0\0\á8\Î~©;\é\0\0Á™¼K$¼:\0@pÂ»,\ßL\'\0\0Û¶dgg_E\'\0\0\Î\ä]‰D.¦\0\0\'¼+\Ó\Ó\ÓÏ¢\0\0\'¼MZZZ{:\0@\0hhkx\Ó	\0\0BW—\ëjs:\0@@\èŽjº\Ã\Z\0\0  ô#búQ1:\0@@\èÁYô -t\0€€\ÐÃ¢\ê\áQ\é\0\0Á	\ï;õ\Ä$t\0€€\ÐS\ê)A\é\0\0a\ÛöH	\ït\0€€°,kŒ\ã8…t\0€\àL\Þ\ã%¼7\Ó	\0\0B‚{’øZ:\0@p\Â{Š„÷\n:\0@@deeÍ”ZD\'\0\0Nx/šC\'\0\0Nx¿\'5•N\0\0¶m¯–ð~•N\0\0\àC=zô\è\ì8\Î\Õ\Ø\ÅM\Þ\äº\ç\è\0\0þœ²—°6µT¥\Ô-\rxº\0€O\è\é?\ëp-Ž¶\0€Ÿ\ÈTýB]\á\Í\Ô\r\0€Ï¤¥¥µ—>ZSpÛ¶ý\0À‡$¨ój\Ú\æ¿#\0\0ð\r\é\Z\Â;Ÿ\Î\0\0\à\ï\é{S\\p—\ç\ä\ät¤+\0\0øXff\æõqÛº§\Ð\0\0‚1}\ïôö0ÿ!\Ý\0\0Àg¼½Ì‡IH\í®\áóÞºú©\Å\ápøIV£\0\"—\è\Îh\È\å\'88Kõ\Ï{WØ¶½–\Ï}\0ÐŒ“¶„\ï	m“Lh\×R‹™\Ä\0hBº3šLÌ‡«‡ð]w\ÝeÆo–,Yb¶o\ßn>l”.‹ŠŠ\Ìû\ï¿o^x\áÓ¿ÿš\àRbYÖ­t\0€F&!{{$©ˆ\ÞAƒ¹Á|ô\èQ“¨•+Wš¡C‡\Öt —‘t\0€F\îø\Õ\ä\âf\êÔ©I…vu3f\Ì0999Õ§p\0€†\ÒU\åÜ•ñ«\È7n\Üh\ZÃ§Ÿ~júö\í{\Ì\Î*t\0\0\Z@wN‹\ßÆ­Á­Û°“þ¼ø\0\×m\à\ì\Ä\0@=\é^\åñ«\Êk\â®i¯¶\ný=º\0@’ôs\ÜñÛ¹uwS\Òm\àñÛ¿uu=\0\0’ `‰ß«¼¼¼\Ü4µÁƒÇ¯>_\Ë_\0€\é¶\îø#§\é\ÇÁš\Ã\êÕ«9›\Ôü5\0\0H€~d+~\'µ†|$,Yñr\Ñc¡ó\×\0\0 \ÞIF\Ü\0}\æ™gLsš4i\Ò1‡O\å¯\0@b\á½; z\È\Óæ¤«\è\ãV\ï\å¯\0@$4«¶w\ïØ±£Y\Ã[?÷:Qþ\Z\0\0$6yWh\ì$#\ÍE_ü\ï\ç¯\0@’\á\n„7\0\0L\Þ\0\0´lló\0 x“7{›\0°ð\æs\Þ\0\0‰L¼¥\êk¿ÿý\ï9\Â\Z\0\0\É\Òc›\ëöfŽm\0@€\è9µ\ã\Ï*\Ö\Ó÷Ð¡C9«\0\0õ¥\çó–­\ä|\Þ\0\0kú®\Úq-‰˜76Ipúé§¦{÷\îñ\áý\Ý\0 rrr:Ú¶]¿óš~»±?\×}÷\ÝwÇ¯./\Ñ\ßK÷\0¨\'Ë²n_}®\ÞX¸N\ÜñÁ­¿G]\0 \á~o|€\ë*t\ÝÞ\ØtwµU\å:u¤\Û\0\04Q€\ÇöB_¹re\Ò>|ø1¡­?—\à\0 iü\Öøm\àñ«\ÒõHlË–-s…;™‰.u›¶¼9-þ\0,ñÛ¸YU\0@Ò\É\â÷Bo`½\Ç\Îi\0\04ý¸L\Í+\âÄ–H\é‘\Óô\0,\ápøfº\0@\n\è¡T½c¡\ë4¾;þt¢q‡9Ý«\'\Ñc•s\ÈS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€¦óÿ\0þ§Ç¶­y\0\0\0\0IEND®B`‚',1),('70006',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.Contract.png','70001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0p…IDATx\Ú\ì	x”Õ½ÿ+Zk­­\Öjm«]k[\Û\ë½mŸ\Ûzý·j7-µ^oA\æ\ÍLH„-ö}_EeÈ¾XdQ¼ ²\É&ADYd0\Èf#ûšœÿû=\Í\äNB2“u\Þ÷óyžód\æ\É$ùe\Þó~\æw~\çœ/|Á\ÅsÿÊ€û¼®\Å?v\Ñ|Z\äy–\åy\0\0\0ç¼²ñÄ…¶Ï®0¥µ¬S\æ\Ø%c>\Ó\í¹\æD§±™y\Å=/_\"\Ö\ê¶\ËÊ¢?+ü\0\0\0ð\îÿ®G/œnû\ìJ]ü{Y˜u\é_b°Ò´e…\à-=G\Ï\í:q]žŽ÷œüN±\"ñ¿ëŽž\Õó^\ßqæ”ž\×i\Ü\ÚRŸ\0\0\0\ÞŠ[M{?Wúv‘þ\É\ÄÜˆ\çý¶\ß\ÔÍ¹:\ÞN²ñ\\—½‘‚\â¶ù:\æ¶\ÕòŸ£\ÛD\0\0Àt¼þ_ò0*B\n2Þ°™„v£W\ç\å_ü—…)\Óðôœ6k\ÑaÌ›y\í\n‹\Ä2e!\Ú\å?OµùÇŸ\Ñ\Ïbh\0\0Àƒ|~ÉœP†!,\í\Â\"ñB°,?Ë°K\Ï\ë=}\ã¥ð\Ð\Çÿ}_¡\ç\Õq\Ý6çƒ‹\áÛˆ\0\0€Ç˜¾\æð¹°@H\ÚS\Ó\Ð\ïŸóŠŠDq\Ï+N$Ä‡Ÿ›D\0\0Àƒ¸ý…n\Ë.„Œ7òzLúW1\åÁ3\æX¾ ¼ŸÿÜ\ÂÂ¡™\îýED\â\åü\çý3R\Zô}Ï¾º\ç\"\0\0\à=‘¸?\\Ti(%“\ß\Î\ë÷\â–K\Ó\×}zvø‚]\Ü\']\ï>¯Y\äóž·\çÒœ‹\'\Ú>÷F^»±o\æ\éy\îs¾\ç¶ß„Ÿ§\Z\ÉÅ¦Ã—Žwpo¿”?[C…D\0\0ÀŒ^²÷‚\n-5Ë¢}~qe\äôO[T9.3¯\Ýs…—¿oûÜª‚\Â\ËB\Ã\îq[ñ¯z‰\ïu³\æ_\Ï\Ë/\äl—/ú9D\0\0À›Š[J\Ìs}_\äz\"	9nZ²d\ÉÜŒŒŒSC‡\Í\ëÐ¡ƒIII1			&))É´k\×\Îô\ê\Õ\ëB¿~ý¶nÝº=\0\0€/:t(ñ…^8Ñ¦MÓ¢E3e\Ê³n\Ý:søðasö\ìYe\ÜÌ…Lvv¶y\çwÌ´i\ÓLZZšIOO\Ï\ëÞ½û\ê`0xQ\0\0ð®Ü¶bÅŠ£­Zµ2C‡5[¶l±\ÂPV¶m\Ûf222L\ãÆM‡úQ\0\0\0e!FŽ™×¶m[³i\Ó&Sv\ì\ØaZ·nmš7oþIJJ\ÊMD\0\0ÀÃœ<y²u¯^½Ì³\Ï>kNœ8a*\r\èõZ¶lù9C\0\0\0\ÎDH\"l.]ºd*š1c\Æ(3ñÙƒ>x\Ñ\0\0ðª‰\Ðp†2•!aFŒa\ê×¯ŸE\Ä\0\0<„\n+UQQ\Ã¥\rs¤¥¥\åƒÁ¶D\0\0ÀhHC³343£*Pfbbb.õ\0\0\0@\ëDhŠgU2p\àÀ			ó‰>\0\0@£+µ\ØTUe#\Â|ðÁ&^¤ð\0\0 Žyýõ\×h\Å\Ê\Ê,°,‰”””\\\Çq\Zó_\0\0\0ˆS´w†–½®†~&!!a\rÿ\0\0€8Epi\ïŒ\êà­·Þº\äŠ\Ä\Çü\0\0\0\â\í\â©\r¸ªƒ£G\æ¹\"qžÿ\0\0@œ¢-ÀÃ»xV5\ÚLÛó_\0\0\0ˆSt!¯N	\0\0€8¦AƒÕ™‘\ÈC$\0\0\0\â˜ö\í\ÛW[Dvvöj$\0\0\0\â˜>}úœ¯®YK–,\Éf\Ö\0\0@3`À€¬\êZG¢W¯^GXG\0\0 ŽiÝºuÃ´´´jY\ÙRKd³²%\0\0@ü\ËDnUïµ±v\íZ\rk°\×\0\0@¼Ó³gÏ•C†©R‘hÚ´\évÿ\0\0ð\0)))75i\Ò$oÛ¶mU\"o¿ýöQe#‚Á\àmD\0\0À¤§§÷jÕª•9q\âD¥JÄ™3grC¡\ÐW\"\Úu\0\0\0‘––vxøð\á•Yx™\çþŒl\Çqöm\0\0\0¡\Â\Çôôô£•!yÝ»wß¯u#4”B´\0\0<*M›6\Í6l˜9}út…\rg´l\ÙRÅ•S\0\0\à™HJJ\ÚÛ¬Y³¼Í›7—»°R5\Z\Î \0\0\à#TY¿~ýK}úô¹(¡ˆf¸cÃ†\rŸª\æ\"v…•\0\0\0~DY\Çqf)«œœœ7t\è\Ð3o¼ñÆ¥#GŽ\ä^¸p¡`OmÀµt\éÒ£ZöZ+VJ ´NC\0\0\0`q\Å \Ém\ËÜ–\å\Ê\Åm\ÑÎ«\Âmkµ\ì5+V\0\0@Y\ä\Â \r\0\0\0³HÔ«W\ïf\"\0\0\0Q\ã8N^rrò\íD\0\0\0b‰”””	\0\0\0ˆš„„„\\W&~A$\0\0\0 ‘¸”˜˜øŸD\0\0\0b‰‹@\à~\"\0\0\0±ˆ\Äy\Çq\"\0\0\05®Dœ…B	\0\0\0ˆE$\Î$&&:D\0\0\0¢&!!á”–\Î&\0\0\05Ž\ãœpE¢	‘\0\0\0€¨q%\âsW&Z	\0\0\0ˆE$Ž¹­#‘\0\0\0€XD\âS·õ$\0\0\05Ž\ã	…Bˆ\0\0\0DMBB\ÂA·=E$\0\0\0 ‘\Ø‡	\0\0\0ˆ\ZW\"ö9Ž3šH\0\0\0@\Ô$$$\ìv\ÛD\"\0\0\0±ˆ\Än›J$\0\0\0 ‘\Ø\Z\n…^$\0\0\0‹Hlr\Ûl\"\0\0\0Q\ã8\Î;Á`ðU\"\0\0\0Q“°Ö•‰\ÅD\0\0\0b‰\Õn[N$\0\0\0 ‘X.™ \0\0\0‹H,\Ñð‘\0\0\0€XDb¾\Û\Ö	\0\0\0ˆš@ 0\'n$\0\0\05ZŒ\Êqœ÷‰\0\0\0D–\Ç\Ö2\ÙD\0\0\0b‰‰Ú¸‹H\0\0\0@Ô„B¡1Ž\ã\ì%\0\0\05Á`pDBBB‘\0\0\0€¨qg°+‰\0\0\0DM(\Z\à\Ê\Ä\"\0\0\0Q“\Ð\ÓmŸ	\0\0\0ˆE$:º\í‘\0\0\0€XD¢µ\ã89D\0\0\0¢&6s\Û	\"\0\0\0Q\Z$$$œÊ—Š\Û\Üö»ºu\ë\ÞCd\0\0\0 \ÇqÎ¸\âp\Ñm¹n3%´UD\0\0\0.Ã•„5¥„Z^jj\ê÷‰\0\0\0\\FþðEiÙˆõD	\0\0\0J“‰WJ	\Çq\î\"B\0\0\0PšH\ÜV\\„+\ï\0\0\0¸\"\Úõ³¨H$&&:D\0\0\0\ÊDþŽ°H|LD\0\0\0 \ÌƒÁ¶a‘\Ðm\"\0\0\0Q\á8\Î	‰‘\0\0\0€¨\É\ßý‘\0\0ˆ\Þ~û\íf-Z´¸ð³ŸýL7F£\Ñ\Ê\Ñ\î¸\ãs\×]w\ívo\ß\Æ|!÷\ÝwŸùû\ßÿn\Þy\çsö\ìY\0\0±qñ\âEóþûï›ºu\ëšn¸\á2ž\'==ý¢$\0\0*–‡z(\×\íf\×r¥O£\áe\"\0\0 bÙ¶m[ž\Û\Í^\àJ^‡\á\0€J@\Ãùu\0\Þ‰Xøüó\Ï\Í{\ï½W\â\ã\'Nœ0~ø¡½}\ä\È++¹¹¹fß¾}\æÂ…1Ÿ˜—.]º\ìDÝ°aƒ9~üx‰ß“——W®Ÿ	\0+ˆ ùH\nžyæ™‚ö\Øc™Zµj™!C†:ž••eŸÿ\ÒK/™o~ó›öö7\ÞhfÏžm>ýôS{RmÞ¼¹\ÐkKþ\ë¿þ«Ä¶{÷nû¼>ú\È|÷»\ß5S§N50[·n5\ï¾û®ù\ÊW¾bz÷\îm\ï«I*Ö¯_oš4ib~û\Û\ß\Ú\Ç[·nm\î¹\çžËš$\0\0‘\0¨d‘x\å•W\Ì5\×\\cþò—¿”\ØôZK—.µùž={š›nºÉ¼õ\Ö[W‰ƒš‘#Gj}úô1\×^{­¹ýö\ÛmF#œY\èÞ½»=®™&ù\'¨¹êª«lßž5k–Y½zµy\ä‘G\ì}ý.’=>t\èPû»8\Ð\ÞW–\0\0‘\0¨d‘xýõ\×\ÍOúS+jú\ä/±xó\Í7Žý\â¿0\ëÖ­3Ã‡·\Ù\n½ö~ô#+º¸ò\É\'ö\ØSO=ex\à³k×®b\ÖÊ•+\í<\ì\ßü\æ7\æÐ¡C\ÇÏŸ?oV­Zeö\ï\ßo\ïgdd˜o|\ã&;;\Ûþ>’Ž;vd/ô;K$”)\Ñt,ý\ìv\í\Ú\Ùû­ZµB$\0\0‘\0¨\Ê\Z	\rW|¡”EXFŒQè¹‘Czüþû\ï·_¯»\î:“ššZ0dQ”[o½\ÕÔ©S\ç²\"\ÐiÓ¦YA=z´™7ož\ÍL\Ü{ï½¦eË–vÎ¶¤A\Ãú¾aÃ†\Ù\Çõó¾ü\å/\ÛLÄ£>Z¨ix†¡\r\0@$\0ªP$n¾ùf;4¡!}\ïœ9s\ìý;\ï¼ó2‘@,\\¸\Ð~0`€\Í^\è{Ö®][ð<eT\ËÙ¾ô¥/™\ßÿþ÷…Ž½ñ\Æöù\Êfüú×¿¶u-£Ü¬Y3{\\Š\ï}\ï{&33\Ó>·W¯^ö\çõ\è\Ñ\Ã«_¿þe©¯\0€H\0Ô°Œ„\ê)t±×±Úµk—Z#¡\á‡P(T¨I$TdyL\Ïš}1}út;\ä¡\×RvB_õ¸¾ž;w®`hC™\ÓLRR’\éÖ­›ýªcmÛ¶µ÷5$\0€H\0T‘H|ý\ë_·Ÿ\â,X`O\ÓýÈŒ„Sñ\å-·\ÜR0´QT$4m³$4´¡ŒCqÌ;×Š†Š8õZ/¾øbA‘§¾†‡*RRR\ì²\ßW_}µ\éß¿¿ý>\Í\ÜÐ‰ž§,†d\0\0‘\0ˆƒ\Z‰¢\"¡!	\ÍÎˆV$þñX˜<y²ù\êW¿j‡<\"EBÂ !Ž\'Ÿ|\ÒlÚ´ÉŠ„†T´\î…j)\Â\"¡\Z\r\\\0 \0U$šBÙ±cG;¼ ¡}¯.Öº?xð\à‚:†\Ï>û\ÌN¯”H„/\æ¿úÕ¯¬\è{ÆŽ«ñ\Ìs\Ï=Wð\ÚZhjûö\ív]ˆë¯¿¾X‘8zô¨- \Ôp\Æm·\Ýf\Z7n\\Pw	\Í\Êø\Û\ßþV°pUX$$2£F²Y	=O¿¯\îk†\0\0\"P\"‰\Ö~\Ð÷Wcðüó\Ï\Û\Ç4“bÑ¢Ev©-ZØµ´@”\ÓT\Í\ÈéŸš\Úy\Ã\r7\Ø\ÇôU\Ó5‹¢!MAU\á\ä\Ïþssò\äI;\ÝTS@÷\î\Ýk\ÅE³:4C#LX$T°©E\Û\ÓO?MOWÙ¸q£7nœ]ð¬C‡v¨JY,Õ¸Hûö\ík§ñ\"‚€H\0Ä©H¨\ÆA½ (\ÊP;v\Ì\Þ.nz¥¦gw\\+R*›Q\Ük÷\ZEQ¢\èqe²<v|p\æ\Ì[óÒ¦M+žS¦L±¢xøð\á‚ÿ«þ—Z7DR©\éÀiiivˆjüøñ&\'\'‡ \"/\"P‘¬Y³\Æ\n²I[¶l‰Jþ¶m\Ûf\ëb4Ôµxñb‚	ˆ\0\"~\ÊB¨\èV3hTOS´ª©j`:u\êdNŸ>Mp‘\0@$À\Ë(\ë EÃž}öY»[lE !½žŠ‚\ê\0D\0‘\0g\"$š=StkøŠ`Ì˜1¦}ûöeª·@$\0	ˆ34œ¡\ÌAeHD­k¢\ÂM\0D\0‘\0¡\ÂJ\ÕDT\ÔpFi\Ãšý¡ý^\0	\0D<2¤¡\Ùš™Q¨\0S›³Q/ˆ\0\"@\ëDD.V\Z4\È\Öb\0 \0ˆ\Ä9ªY¨ªlD˜>øÀf%(¼D\0‘€8F+¡ªf¡2,K¢aÃ†fùò\åü\0‘\0@$ ^\Ñ\ÞZöº:\Ðm}úô\áŸ\0ˆ\0\"ñŠ6\à\Ò\Þ\ÕÁÚµkm6\0‘\0@$ N\Ñ.žÚ€«:\Ðôª“\0@$\0	ˆS´xq»¶VZŽ[Û \0ˆ\Ä)\Õ}!G$\0‘\0@$ ŽiÐ 	@$\0	€Ø¨\Î\Z‰\ì\ìlj$\0‘\0@$ ž\éß¿µ\Í\ÚX¹r%³6\0‘\0@$ ž\ÑnŸÕµŽ\Ä\ÓO?\Í:€H\0 \Ï(‘––V-+[jXƒ•-‘\0@$ Î©Ž½6\Þ}÷]“˜˜\È^€H\0 \ïLš4É®pY•t\ìØ‘\Ý?‘\0@$Àœ>}\Ú4m\Ú\ÔlÛ¶­J³999	\0D¼À¢E‹L«V­Ì‰\'*õ\çœ9sÆ®¦¹p\áB‚ˆ\0\"^¢K—.føð\á•ZxÙ©S\'+,\0ˆ\0\"C…;w6•\"š\î©u#4”€H\0 \àQ™\Ðj—Ã†\r«°¾†3ºv\íj%‚º@$\0	ðL´o\ß\Þ4o\Þ\ÜlÞ¼¹\\¯¥\ÂJ\ÕDh8ƒL \0ˆøD&\'\'›~ýúY¡ˆf¸cÓ¦M¶\æB³3(¬D\0‘\0Ÿ¢,‚\n0µ\n¥v\n\Õ\íÕ«W›#GŽ,&¥]<µ—ö\ÎP„ž+\Ð:e\0\"€H\0X$4\é\é\év¸B[€‡›\äA5½{÷¶\Ë^³b% \0ˆ@‰(#	 \0ˆ@ôlÝº\Õ_\0 \0ˆ@L\Ãª™\0@$\0	€¨™;w®iÜ¸1\0D\0‘\0ˆž\çŸÞ´lÙ’@\0\"€H\0D\ÏÈ‘#\íV\à\0ˆ\0\"5O<ñ„\ê	€H\0 \0QÓ½{w»\à\0\"€H\0DMÛ¶m\ÍØ±c	 \0ˆ@ôhC¯3f@$\0	€\èiÔ¨›q\"€H\0Ä†ö\ÚX·n\0D\0‘\0ˆžP(dv\ï\ÞM \0‘\0@$\0¢G;~?~œ@\0\"€H\0D\ÇÙ³g­H\0 \0ˆ@\Ô\ìß¿Ÿ-\Ä‘\0@$\0b\ã\Ýw\ß5õ\ë\×\'€H\0 \0Ñ³l\Ù2Ó°aCˆ\0\"=³f\Í2M›6%€H\0 \0\Ñ3a\ÂÓºukˆ\0\"=Ã†\r3]ºt!€H\0 \0\ÑÓ¯_?\Û\0	\0D j:w\îlžy\æˆ\0\"=­Zµ²u\0ˆ\0\"5š±ñò\Ë/@$\0	€\èIII±kI\0 \0ˆ@\ÔhUË7@$\0	€\è\Ñ>\Úo\0‘\0@$\0¢F;jP\0D\0‘\0ˆŠœœ¶D\0‘\0ˆÝ»w›P(D \0‘\0@$\0¢g\íÚµ&))‰@\0\"€H\0”\ÎÑ£GÍ”)S\ÌÂ…Í–-[Ìž={\ì\íF\Z@$\0	€+“˜˜hk\"Š6MMMM5Mš41s\æ\Ì!P€H\0 \0—Ó§OŸbE\"\Ü4T™\0D\0‘\0(vx£4‘>|8AD\0‘\0(™v\í\Ú+*º<þ<D\0‘\0(™¥K—+:€H\0 \0WDÅ•‘Ñ¼ys‚ˆ\0\"P6\\H$v\ì\ØAP\0‘\0@$\0\Ê\Æ\éÓ§\í\rID§N \0ˆ@t´i\ÓÆŠ\Ä{\ï½G0\0‘\0@$\0\Ê\Î\ÓO?m¾þõ¯\ÇqLvv6D\0‘\0(»D\\u\ÕU\æW¿ú•	¦w\ï\Þ	\0D \ì–‡þýûº€H\0 \0e’ˆ+@$\0	€2\ÉBøñ,@$\0	€\è3’2€H\0 \01[H&jÕªEf	\0Dˆ\Øjô}’	2€H\0 €D”\ëû\ÉL\0\"€H\0QR\ÇkJ{oR3ˆ\0\"HD\Ì\"Af	\0Dˆr‰DE“\0 \0ˆxH\"¢	†9\0‘\0@$\0‰(—H„³9\0‘\0@$À\ç«HD\Ê5€H\0 \à‰ˆ†h\Ã€H\0 \àQ>ú\è#\Ûy\Þ}÷\Ýe\Î<T”Hˆ‡~\Ø>G¿\0\"€H@g$Jf¨ÌŒD×®]ù\'\0\"€H€×‡7®$\ÑÞ‹ƒa\r@$\0	ð±L\Ä\"O<ñ‹S\"€H€WeB™‚>}úTŠHLœ8\ÑÔ©S\Ç3l\Ø0³u\ëV‚ˆ\0\"^\áÐ¡C&\n™\Ç{¬L2ñ…V¶lÓ¦™9s¦i×®	ƒ¦~ýú¦{÷\îfÁ‚\æüùóü\0‘\0@$ \Þ8zô¨\éÛ·¯IHH0;w¶Q{mt\èÐ¡\Ðñ\Ü\Ü\\³f\Í\Z;\ÌÑ Aûó[´haÆo8À?	\0Dj2999f\àÀ63 ÁÎ;+\Ë:_¨\àõ\"$’ˆ–-[Z©\\ô\ï\ß\ßÊ†¤\0‘\0@$ pò\äI3xð`+­Zµ2[¶l)1“Pž(Ë³è”†94Ü¡a\r„eG\Ã\" \0D\0‘€*\æ\ìÙ³føð\á¶BC6l¨4¨\è\Ý>U˜ù\Ì3Ï˜&MšX©hÜ¸1›€H\0 P\è\Óý\èÑ£­@4m\Ú\ÔdffVªTö–\á\ÊHP°	ˆ\0\"•Œ\ê\n4\åRZ}‚_¾|yÌ¯^D\êJ\ÃS§N-¶°²2ÿF\n6‘\0@$ ‚/®Ó§O7III¦aÃ†f\áÂ…òºW\Ê4„k*ªJ\"Šƒ‚M@$\0	(/¿ü²INN¶\Ð9s\æTø\ë—$\áZŠš´b%›€H\0 PF\æÏŸoRRRlB\ÊÊ¤\èF_eö¨n(\ØD	€\",]ºÔ¤¦¦\ÚO\ÜS¦L©²ô}8ñÀ\Ä\å.žl\"ˆøšÕ«W\ÛOÖ‰‰‰fÜ¸q\æ\âÅ‹Uþ;(3¡÷e¼oNÁ& €H€oX¿~½iÞ¼¹\Ê9jÔ¨jÿôü\ÑGy.\Æl\"\0ˆxŽÍ›7›ôôt+\Z\×?}ú4A©(\ØD$\0	ˆkv\ì\ØaÚ¶mk/`ƒ\r2Ç\'(\Õ›ˆ\0\"qÁž={LÇŽmj½_¿~\æØ±c¥†AÁ&\"€H@C\ãó*^”@ô\ì\Ù\Ó9r„ \Äl\"\0ˆT+†^½z\ÙDbÿþý%Î…‚MD\0‘€JGCºÀ(5®¥¥5¤Þ‚‚MD\0‘€\nGE“Z‡A•6mÚ˜\íÛ·Ÿ@Á&\"€H@\ÌhÚ¦.\"º€(\í½q\ãF‚\âc(\ØD$\0	(sz;##Ã®¡¥Ö­[GP l\"\0ˆ\\†–®Ö…@KY+•½j\Õ*‚e‚‚MD\0‘ðù§Ë©S§\ÚTu£FÌ’%K\n”+£EÁ&\"€Hø„—^z\É$\'\'\ÛOó\æ\Í# P\áP°‰H\0 d\îÜ¹V$³f\Í\" P%P°‰H\0 qÎ¢E‹\ìð…:p\rg0~\r\Õ›ˆ\0\"G¨pR)eRN˜0€\Z›ˆ\0\"QY»v­iÖ¬™\Êù\ÜsÏ‘>†¸ ´‚M6…C$\0‘€*@‹Gé“:\à\áÃ‡\ÛÅ¥\0\â•È‚Me+üþ~F$\0‘€JC\ËWkk	„–µ\Öò\Ö\0^A\Ù½·\ÉH €H@³{÷n»‘–:Y+“þ/²o\ß>D‘\0D*’¬¬,Ó¥K›\î\Õ\Ö\Þ\Ù\Ù\Ù<\Ë\æÍ›m\Í\"H\0\"\å\äÈ‘#¦Gö\ÓY·nÝ˜.¾\à\Í7ß´kŸ ˆ #G5ýúõ³ˆN:\ÙT/€_X¸p¡IMME$	@$ ZT49hÐ ‚ip;v\ì (\à;´\n«¦3#ˆ PF4\Ím\èÐ¡vˆôôt;F\àW&Ožl\ÏD‘\0D®€\ä9r¤ˆ´´4³~ýz‚¾\'##\Ã\ÎNB$	@$ .^¼hÆŒc—²nÚ´©-.ð#{ö\ì±+³jOMr=d\È»\Ú%\"H\0\"E\Ð^S¦L±S\ÛTL¶l\Ù2‚¾F«³ª¨¸¸&\ÑVkØ°¡Y¾|9\"€Hø›3f˜¤¤$“’’b÷\0€¡\Ý@K’	5‰·÷A$\0‘\0\Ë\ìÙ³\íœx\ír¨\Û\0Pm\ÒUšH\èq†6\0	ß¡¹ðJ\É*1}út¶H(\'\ÅI„²~‘\0DÂ§h,·q\ã\Ævlw\âÄ‰@7n\\±\"\á\ç™Lˆ q‚.úK—.-÷\ëdff\Úš\Ê9zôh_Ž\é\ÄJNNŽ]ˆ-R\"ºv\í\ê\ë˜ €H\Ä	\áNKBKeø†\r\ì\Zˆ#F˜³g\ÏrU\0ˆ­\ê\Z)š\ZŠH\0 q#\áÖ¤I“2e(¶l\ÙbZ·nm?Ei\ÞûÉ“\'¹\0”‰Cø<\Ôfu~‘\0D\"NE\"2CQœP\ìÜ¹\Ó\îƒ!8p M\É@\ÅÐªU+{þ}øá‡ˆ\"ˆD|‹Dd†BCYYYv\'N\ëÓ§Ý¡\0*­r©sAG$\0‘ˆ‰ýû÷ÛŽD\î\×_C\Ój™«W¯6»w\ï\æªœ[q|n!€H\Ä\ÐÑ­Y³\Ædgg\Û´\ØÛ§Ÿ~jV­Zev\í\Ú\Å8·\âô\ÜB$\0‘ˆ!¥IGW±ž÷\'\0\Î-¯œ[ˆ Q¢“Nªb›Ò±\0œ[ñyn!€HD‰NL:(D*\Î-D\0‘ˆh§>?lö¾3\Ål[\Ö\ß6\Ý\Ö1:7D8·	\0D¢\Ôv2\ç Ùº¤—\ÙüZ§BM\Çô\"œ[ˆ\0\"QbûxÛ«—ut\áv`\Û|:8D8·	\0D¢\äöÁÊ§K\ì\ìô\"œ[ˆ\0\"Qb\Ûúz\ß;;=F‡H\0\ç\"€H\Ð\Ù!À¹…H €HT|g§Jò’:;=F‡H\0\ç\"€H”\Øvgf”\Ø\Ù\é1:8D8·	\0D¢\Äv\ì\à³uiŸ\ËS¯\î1=F‡H\0\ç\"€H”\Úöm˜zYg§ctnˆpn!\0ˆD\é\í\Ü9³û­1—§^\ÝczŒ‘\0\Î-D\0‘(q\å½]™£J\Ç\Õc¬À‡H\0\ç\"€H\\öI\éð\î\æý\Å\ÝK\ì\è\ÂM\Ï\Ñsù…H\0\ç\"€H\\ñ“Ÿ 	\à\ÜB$\0‰;»²|R*\í\"œ[ˆ€E\"ÖŽ.\Ü\è\ì	\à\ÜB$\0(¶¤!À¹…H\0 tvˆ œ[ˆ\0\"Agˆ\ç\"€H\Ð\Ù\"AC$\0	\Z\"œ[ˆ\0\"Ag‡H\0\"Á¹…H\0\"Ag‡H€GE\â\äÉ“fÿþýœ[ˆ€÷Dbþüù\á“\Î<ÿüóöØºu\ë\nŽ\r<¸L\ÏYºtiÁ}µ/~ñ‹\æ\Û\ßþ¶9rdL¿\×Â…\í\ëL™2‘€¸‰>øÀüñ4\×\\s}?\ßxã¦W¯^\æô\é\Óe>ÿ8·	€¸‰\ä\äd{\ì\É\'Ÿ,Q$JzÎ’%K\ì\íGy\Ä2\Äô\ï\ß\ß\Üq\ÇöØ‡~õ\ïµc\ÇÓ³gO³a\ÃD\âR$>ÿüsó\Ãþ\ÐÔªU\Ëüý\ï7}ûö5w\Þy§=\'z÷\î]\æós‘\0ˆ‘ø\êW¿jn¿ýv{\ì\Ïþ³ù\Ú×¾v™H”öœpg§N0ü\Ú\é\é\éöØš5k\ìýN:™[n¹\Å\Üzë­¦C‡\æÌ™3\æw¿û¹ÿþû¾G\î¯ýk³b\Å\nóƒüÀ¼üò\Ë%~/\"5Y$&Ožl\ßÿ‰‰‰Ç²³³mv\â†n0\çÎ\ã\ÜB$\0¼#ú´£¯ú”rýõ\×\ÛN§¨H”öœpg÷“Ÿü\ÄÔ®]\Ûv`W_}µ¹ë®»l‡¹v\íÚ‚N5\Ü	Nš4\Éô\è\Ñ\Ã\Þ\Î\Ì\Ì4Û·o··[·nm^{íµ‚ôkIß‹H@M‰Î;\Û÷\ê´i\Ó\n×¹¡\ã{÷\î\å\ÜB$\0¼#\ê°ôõÿø‡ýªjQ‘(\í9‘]8}«O?Gµ?§cÇŽöX»v\í\n:¸`0hS³Jý¦¥¥™\îÝ»\Û\ã›7o.\ÔÙ•ô½ˆ\Ôd‘\èÚµ«}¯N:µ\Ðñ:u\ê\Ø\ãYYYœ[ˆ€wDbÖ¬Y\æ{\ßûž½­Ô«>\Å‰Òž™~=uê”¹÷\Þ{\íýŒŒûs\Z4h`ï§¦¦š–-[\Ú6j\Ô(û˜>e)­ªt\ë}÷\ÝgEvv¥}/\"5U$T<¾0k¸ nÝºfö\ì\Ùö½~\ÓM7•ùü\ã\ÜB$\0\âF$’’’\ì\í\ßü\æ7fË–-ÅŠDI\Ï):Ž»s\çN;¬4­nOŸ>\Ý>®t¯:X?\Þ>Wk¸¸l\âÄ‰—uv%}\ï{\ï½g;\é•+W–x‘€\ê:·Nœ8a~ô£Ù¬À_þòó­o}«\à}Þ¥K—2Ÿœ[ˆ@ÜˆÄ„	\ìm¥;\ßÿýbE¢¤ç„§¨E„izšŽýõ¯µ\ì?þ¸\Û\Õ\'®?ý\éO&\'\'\Ç>OŸÖ¾ó\ïØ©q\ác‘S\ÔJú\Þ\È\ç”t‘€\ê:·\Â\Ó?õ~\rOÿTQã—¾ô%ûU¯Í¹…H\0Ä½HTuS\ÇÛ­\Ê\ïE$ :\Ï-\rI|üñ\Çö¶\ê€9p\à\0\ç\"€H°ú 4D\0‘ !À¹…H\0 4D8·8·	@$\è\ì	@$8·	\0D‚\Î	\Z\"€H\Ð\Ù\"AC$\0	\Z\"œ[ˆ\0\"Ag‡H\0\"Á¹…H\0\"Ag‡H\0\"Á¹…H\0 tv€H\Ð	\0D‚†H\0\ç\"€H\Ð	\à\ÜB$	@$\è\ì	@$8·	\0D‚\Î	\Z\"\ë…âº½{÷~¼v\íZ³|ùr;ZômÙ²efõ\ê\ÕynƒH\Ð\Ù!€HpnùF$$kÖ¬1\Ù\ÙÙ¼w\Ê\Ù>ýôS³jÕª<W*†\"\Å Så‚H@\ÅÃ¹…HT\'\ÊD +\îû\ï<\"QkÅ¶#GŽ\Ø\0\çV|ž[^	D¶rD‘(†={ö(ec>ù\ä“\Zý<w\î\\\Ütt»v\í\â*\nqsn\Å\Ã9V•\ç–WD‚¡5D¢\ÊD\"\Ü\á­X±¢\Æ»,]º\ÔƒAûµ&\å o\çV\ä9\n…j\ì9V•\ç–\ßD\â\Ô\ç‡\Í\Þw¦˜m\ËúÛ¦\Û:†8 ž\âøñ\ãV$\0 ò\Ð9–““\ãû8øI$N\æ4[—ô2›_\ëT¨\é˜C	\Ïp\è\Ð!D \nD\"++‘ð‘H|¼\í\Õ\Ë$\"\Ül›< \Þa\çÎ&11‘ž \Ñ9¶yófD\ÂG\"ñÁÊ§K	=†< ž\á\Ýw\ß5õ\ë×§§¨D\Z4h`\Þ|óMD\ÂG\"±õõ¾%Š„C	Ï \Î-99™ž iÔ¨‘Y´h\"H ˆ„÷X²d‰\í\ä\0 òhÖ¬™™5k\"\á#‘\Ð,’DB!ˆ„g˜3gŽiÜ¸1==@%’žžn¦L™‚HøH$vgf”(zy@$<Ã´i\ÓL‹-\è\é*‘ö\íÛ›ŒŒD\ÂG\"q\ì\à³uiŸË‡5\Üczy@$<Ã¤I“L«V­\è\é*‘\îÝ»›!C† >[jß†©—‰„Ž!ˆ„§Ð§¤:\Ð\ÓT\"ýúõ3ýû÷G$ü$\çÎ™\Ýo¹|X\Ã=v>¶%@$‰23t\èPÓµkWzz€JD\Ùe%	ˆ„V®Ü•9ª\Ä\Z	=\Æê–ˆ„g8p \éÛ·/==\0™?D¢¼\"q\îœ9¼{…yq÷%\"\Üô=—\ì\"÷ô\î\Ý\Û<ñ\Äôô\0•\È\äÉ“\í\Ì\rDÂ»\"q¥,\Ù	DÂ³hXcØ°aôô\0•ˆÖ\ÐZˆ„wE¢,YˆÒ²ˆ\"·(\ÝÊ´4€\Êe\áÂ…&55‘ð°H\Ä*\á†H qK\ëÖ­\ÍÄ‰\é\é*–¢÷¾H\Ð	ßŠDZZš™1c==@%¢?\Ù‘ !žD\ËcÏ;—ž Ù·oŸ	ƒˆ\"AC$¼‡6\ì\Ò\Æ]\0Py;v‘(§H<ô\ÐC\ßD$	D¢Ò A;~\0\ÏÚµk\Í\ÓO?m-\Ì\éÓ§‰pçŸŠŸš{;Ï•²\\÷ö%÷\ë÷þ9÷öi÷ö	·}\æ\Þþ\Ôm‡Ü–\å\Þÿ\Ðýº\Ý}\Î&÷\ëz·­qÛ²@ °Àý:\Ûm/¸Ï™\à>þ¬ûõI÷~/÷k·5s[}÷yÿóø\ãÿ\É=þ\Û\Ä\ÄÄ»“““o¯]»ö×–.]\Ê\Å‘@$\Âh\Üv\ãÆôø\0À¡C‡\ì.ŸmÚ´1¡PÈ¸Ó¹sgóò\Ë/›œœ2EDÂ\Ñ\ßÜ‹ø\â’:d]¸%n;\ë¶Gt×±ºu\ëþTw]\ä\Ý\×xL}]ü\Ý;÷xOI\ÛF¸¯=._^v¿Î—DH&\Üûo\ç\Ë\Åv·}˜ÿ3$\ÙnûLR\â>~Z?W²\"iq[®$&,4\\ü	D\"ut;w\î\ä\n\0\ê\0õ\é´OŸ>6»§\á‹\æÍ››Q£F™\íÛ· +ˆ„{aÞ«‹²+\0‹v\Æ\î±\îc\Ê8¼Ÿ’’r5…Û¹s\ç\ÌÞ½{m–‘@$ªu|ú\0eCâ­µW4\ãIA	„Vˆ]´h‘\í¡l\"‘?d`c¨¡Šºu\ëÞ“ÿP­üì†/žòj±\å\Ïþóp<\n5MÉ¿’@t\é\Ò\Å\Üp\Ã\röù\ßø\Æ7¬¼ž»\ÂR\ÛÓ§O·\ÏWq}¬¿³\ÖC\Ñk(ë¦Ÿ7a\Âûºˆ„\ÏEB\'ññ\ã\Ç\é\á\0J@\ç\Ç\ìÙ³mç­¡@\Éwxý• E\"œˆh\ÇT‡ \Z7\Æ\Ç\Ý\Ç\ïõò¬\r]Œµi\âC=d\ãÒ²eK{Ù²e¥~ßš5k\ìóõ}ºÿ\ío³÷õ-‹H¼ò\Ê+1ÿ\Î;v\ì0={ö46l0o½õ–}=ýÎˆ„E\"77×žÀú\n\0ÿ\Çúõ\ë\Í\àÁƒ\íôh‰ƒŠ%\r\Zd2339_*@$TQD\"\ÂM5o>ø\àƒ\×ùeú§†\Å—7\Þx£\Ðñ—^z\Éü\êW¿2\×_½¹÷\Þ{m\án¤HÔ®]Û¾<hÆŽk/^¼\Øü\à?0¯¾úª}n»v\í\ìý³g\Ïˆ\Ä\Ã?ln¹\åóû\ßÿ\Þfô<­%¤\ç\éý®Çüc3n\Ü8ó³Ÿý\Ì|ý\ë_·¿£ž·b\Å\nû<\Õüü\Çü‡}½›o¾\Ù\å!>	}\ÒbJ\Z€1GŽ1\Ï?ÿ¼\íx\ÃE’;v´9E’/ùÅ—‰„Š\Ý\Øÿ§ŸÖ‘(N$$\×\\s¹û\î»\í~H·\Þz«mŸ|ò‰}ü\ÏþsÁP\Èw¾óû^=u\ê”\ÍJ\è\ØÌ™3\íó’’’\ìýH‘øÑ~d·µÿþ÷¿o¾õ­o\Ù!\n‰ˆ“°<ó\Ì3öö\ÕW_mg\éw\Ð}¯½öZÁ\ÐF§N\n„FƒHøT$TH€¹xñ¢Y¾|¹\é×¯ŸIII±1mª5b\Ä³e\ËT‰\"\á\Æ:©„lD¸ô{F¢[·nöXx˜C\ï\Ó\È\á‹3gÎ˜_|\ÑµI0ôX«V­.	=^T$´I£\ëß¿¿½¿zõ\ê‘8\ë±ë®»\ÎJE8«¡\Çv\í\ÚUH$\Ú@$,*\Z\Ó\'/\0?°{÷n3zôhÓ¢E+\Ðú´¦ñ\ÞØŽªL$>½‚H¨­÷³H¨GÇ”™\Ð}\r³…/ô\ZFø·û7ó\Î;\ï\ØÇ´Ø™.üÿþ\ïÿ^ S§NµÕ­[÷2‘9r¤}LY	\Ý_µjUH„ÿ®o¼\Ñ\Ö^\èv=\ìcº^ ˆ\Äe¼ûî»¬ÿžE\Ó\âT¡®Ow’Éƒ>µ?\Þdee \ê‰’j#N9Ž³\Ãm³\ÜÿU?‹Dø‚}ÿý÷\ÛZ…þð‡\æ«_ýªùø\ãÍ¦M›\ÌUW]e~ñ‹_XÐ‡A=W\ïq‰G8Æª“PýBQ‘¸ó\Î;Í¤I“ì…²z¬8‘x\ä‘GJ	\\\ê¶\Î+]K	ŸŠ;‚\×P\ç¦OH\á\"I-?p\à@›¾¥H²Æˆ„¤\á¼ûÿyE\Ãª‰¨\éC\ÕQl©,DX¾ý\ío›ùó\ç<&¸\çž{\ìcª¥ø\Ãþ`\åø\äÉ“\æü£=.IPAeQ‘PMƒ\êT4ù\Â/\Ø×“¬DŠ\ÄM7\Ýt™Hhh#rú§j&\î¸\ã{¿C‡ˆ„_EB{l¨£ˆWŽ=j;\Ã\È\"IujªBW\ÊjžH¸19\Þ/Uµ •\n!5Å¸¤\Ç5cCòPô¸\ê\ßJ[WB\ç\ê,\Êûû)\ëW\Ú\ï‡Hø€9s\æ\ØOn\0ñ‚²\n+W®´…b\r6´)\Ü&Mš\ØJsm\Õ\r5_$¼p¡`\Ó.V¶D$ò™6mš-<¨\Éh\î1c\Æ\Ø{$\ZVºU©^¿o‚…H ˆ\"Q­¨\àF\Åg|ô\ÑGžý\Û$ó\æÍ³² i<H\"4Ž+©\0D‘@$‰\Z‚ö\Ðx2\ÄZ$F\ïU\í\ï\à´­†\'š6mj\ÅA\Ã°S\Ó(’D$	D‘¨¡¨º]«¦A|I„¦~ýò—¿´_\ãU&T©‚H‰l¸H²}ûö¶²\\…`€H ˆ\"hZ\\ß¾}\é\Ý\âL\"\Âò O\ìñ\"\Ê*h\n¦\Þs\Ê6hj¦\n}µÊž\æ \"H ˆD¢\ÐO<A\ï‡q¥\ã5\Ík\×\âO\é\é\é+Iv\ï\Þ\Ý.E‘$\"H\Ð	 a\r}\"„ø”ˆ¢+Cº¨k{\àò¢Eo´Ü´Š$µÐ™\äAE’Z–zÏž=ü#‘ !^C\ã\Ó*¸„ø•ˆ0±shu:­\ÃkFC\\\r>\Ünx¥\"Im€¥\r†´!–6\Æ@$hˆ„‡iÝºµ™8q\"½[œKD¤LÔªU«Ì™	\r=4h\ÐÀ\n€ö\\\Ñ\É|%T$©µ…°\n$U(Ù¶m[»I¶\â@$hˆ„HKK³•óÿù}’‰+}\ßúõ\ë­<DnœT\Üö\Ù*’\\³f4h]N=\\$©µþõ\Z\0ˆ\r‘ð±Hè‚ \Â7ð†Dýþ’2k×®µBPtFmO,´v~x±2=OÂ¡z\ZmQ¬uý	D‘@$,ú„©» ¾$\"¿36¥½_Kª™\Ð\î}\ÅI„š†*\ÂCZ:]õ3\Ú:\0‘@$	D¢Xt\Ñ\ÐV\âPq”¥Î ¼™ˆ²ˆDq™	mý[’D„›f]”\ço\0@$hˆ„P\ÊZKC\Å\ÆT\Ã•9œQV‘ˆ|]eJˆpÓŽ°\0ˆ\"H eBR\×Kø‚,¡P ,Ÿî£­‰ˆF$„¦cÖ©S\ÇÔ«W\Ï4o\ÞÜ¶ðfXEK¦\"qe4½™‹?\"H¸(\Í}\è\Ð!z·J‰p\Ó{Ö¬Y&±ˆ„xò\É\'/›Í¡\éŸú\Ý4#C«O\êw•\0 ¥³fÍš\Ü\ì\ìl ‚Ú²\\‘8H\Ä\éE\ïøñ\ãôn•(\á¦z”¢\Ã±\ÎÎˆE$\Â?\ïJ\ëL°t5 WfÅŠƒV­Z•÷\É\'Ÿ\ÔØ‹ó¹s\ç\âF\"–-[v\ÑmC‰8C\ëD^è”(©iÑ¡ð\á¦O®únºPjUC5mÊ¤!©©©vŠ©šVO\Ô\ÑZQ©u­a¡\å“õIXcµi\Ó\Æ.lÔ®];»\âfÇŽ\í¢G]ºt±\év\íÑ ¥—{õ\êe7\ZSº¾ÿþv(}¢\ÖErð\àÁvGSmG­\ÕGŽigh‰\æ1c\Æ\Ø}´\0—†´€’vš\Ô:\Z/½ô’yù\å—\íôFM‡?¾Ý°h\Ñ\"³t\éR»J£¶³Vaª¦N®[·\ÎlØ°ÁÖ—hí…­[·\Ú%¦w\ï\Þ}\Å\Z\Å\é\Å_ŒzvF´­$\âi£/@$j2î…¯Ÿû)ú”Rò5­©SŸ­þ«&þ~E\Úy/I„\ï2’	5Y¡>‰*;¡•µ³V)\ÔzJ\ïÛ·\Ï^$u±Ü¾}»½x\ê\"ª‹©%\Ò\ÅU‹\éb«‹®Þ¼šVª‹±.\Êó\æÍ³Ÿ\Æu±V*]+#\ê\"®‹¹\Þðº¸\ë\"?n\Ü8{\Ñ\×\Å_k\ZŒ1\ÂJö\ÑHºøJ\Z$’\ÉDŸ>}¬\\H2Ôºu\ëf\å£s\ç\ÎVD$%’5ÉŠ¤Eò\"‰‘Ì¨Il$9j‰$H2$)’I\0´D¤<I¦\"\åJ\'nY\n\Z\Ã\í\î»\ï.sæ¡¢DB<üð\Ãö9}ôW6@$<Æƒ>xÛ¿\\PC4	ð\ÐÐ†\ÄDbUtX£´a†\Ê\ÌHPT	ˆ„7	ƒ¯„ûºu\ë\ÞCD	ˆs‘P†Cš\â¨\ê\Z‰ð^k\0\"\áMÇ¹\Ëmy}\Ð*¢‚H@œŠ„V†\\½zõŸ_U³6Ê»\Õ8\0\"Qóqûž\ÍE>\Ì\\\ÔP‘A$ Ž@D»™UYfS”G$T‹\Í\ë ñGbb¢SÜ°j0lKt	ð\áÚ…²\\\ì¿\ÃÊ–*:@$<8^œH8Ž³—\è \à*k¯\r$	\ÏK\Ä\Ä\ÒfˆƒÁ\ß%D|–™¨¬\Ý?	o\áJ\Âmª…(M$\ÇyH!\à³\ÌDyj\Z@$üC \è\ì\Ê\Â·’P™µn—(ºD$€\ÌD…\0 \ÞÅ•	‰\Åx`ª\ØÒ½?TSC‰\">\ÌLD#H ?\Üq<4\'ˆ@Á\"RW\Z\æ\ÐO\n+‘€ü\â\Ës®H<J$	€2e\Z\Â5H /¹,H\0”I&¢Y\0‘ðH˜zõ\ê\Ý@$	€be\",\reö\0@$|Uq;\"\0%\Î@<ðÀ\ì\â	ˆ—ø­¦{	D \ÔÌ„>q €H@QÇ©\çögˆ\"P*	\0DŠ\ÚƒÁ\"H\0 €H@Ô„B¡!nÿpH \0ˆ K\ÄT\Çqv	D\0‘\0Db‰…®H¬#ˆ\0\"ˆ\Ä\"k%D‘\0@$\0‘€XD\â\ro	D\0‘\0D¢\Æqœ\Ú\í“H \0ˆ 5Á`ð3·u ˆ\0\"ˆ\Ä2´q&11\Ñ!ˆ\0\"ˆ\Ä\"—Ç¹—H \0ˆ ‹H\äi\ã.\"H\0 €H@T4m\ÚôzvþD$\0	@$ &\Çù…\Û7\ä	D\0‘\0Db\Öx\Äm\ç‰\"€H\0\"QšƒÁD‘\0@$\0‘€¨	…BÜ¾\á‘@$\0	@$ –\Z‰qÁ`ðC\"H\0 €H@Ô¸ñŠ+\ï	D\0‘\0Db)¶\\\íŠ\Ä\n\"H\0 €H@,C[\Ü6‹H \0ˆ KF\â#·e	D\0‘\0Db‰O\ÝÖ“H \0ˆ ‹Hœ\nƒ\r‰\"€H\0\"Q\ãJÄ…\ÇüOD‘\0@$\0‘€X2y)))?&ˆ\0\"ˆDK-õ}ûö½†P \0ˆ III?t\'H \0ˆ K}\Än¿pH \0ˆ K}D’fm	D\0‘\0D¢&tƒG‰\"€H\0\"Q\ã8Î³n¿E$	\0D	ˆšP(ô¢\Û/l%ˆ\0\"ˆ\ÄR#±\Ìmo	D\0‘\0D¢&nóˆ\"€H\0\"±d$v»m\"‘@$\0	@$ ‘8\ì¶AD‘\0@$\0‘€XD\â¸\ÛZ	D\0‘\0Db‰s¡P\è1\"H\0 €H@,Å–¹®Hü‘@$\0	@$ –Œ„©]»ö×ˆ\"€H\0\"Qñè£Þ¢>H \0ˆ 5‰‰‰ÿ\éö	—ˆ\"€H\0\"±k<î¶³D‘\0@$\0‘€X\n-\Û:Ž“C$	\0D	ˆ\ZW\"»}\ÂA\"H\0 €H@,CÏ»m\'‘@$\0	@$ jÀ‚`0ø6‘@$\0	@$ –Œ\ÄZ·-!ˆ\0\"ˆ\Ä\"ÛƒÁ\à4\"H\0 €H@,\"ñq x†H \0ˆ ‹H|æ¶ŽD‘\0@$\0‘€XD\âLÐ…H \0ˆ 5Ž\ã\\¬_¿þ}D‘\0@$\0‘€X2y\É\ÉÉ·	D\0‘\0D¢\âÁ¼Ž?	\0D	ˆ‰\Ä\ÄÄ»ƒÁ`.‘@$\0	@$ jB¡\Ð\ß\\‘8O$	\0D	ˆ¥>¢‰\ã8\'ˆ\"€H\0\"±ˆD_·}B$	\0D	ˆ\Z\ÇqÆºm/‘@$\0	@$ jÀ·?\ØD$	\0D	ˆš`0ø†\Û¬$ˆ\0\"ˆ\ÄR#±Ù•‰—‰\"€H\0\"±d$ö9Ž3šH \0ˆ KF\"\Ûm½ˆ\"€H\0\"±ˆ\ÄI\Çq\Z	D\0‘\0Db‰®H<D$	\0D	ˆ\ZW\"ò\Üv‘@$\0	@$ Zj©/¨W¯Þµ„‘\0@$\0‘€h‡5¾\ë¶<\"H\0 €H@\ÔûÝ¾\à\"‘@$\0	@$ j‚Á`}·/8M$	€RiÖ¬™‡\ÒZƒ\r þ\Ú\è\â¶cD‘\0(•Õ«W_Q$fÍšE \0‘ð_Fb„{þ\ï\'ˆÀiÒ¤I‰‘’’bÎŸ?O\0‘ðŽ\ã\Ìt\Û6\"H\0”++1s\æLˆ„?‡6–º-“HxX$ô)qÎœ9¦OŸ>öeýúõ]\0B¡iÜ¸±\éÝ»·™4i’9}ú4=\r”Hqµª ˆ„o3\ïƒÁW‰„E\"++\Ëô\ë\×\ï2q¸R“Xt\ì\Ø\Ñ\ìØ±ƒÊ”• 6	_\×H\ìr\Ûd\"\á!‘\Ð\'\ÃAƒY!ˆF Šk\ÊR¡€¢4oÞœl \Ú8\ìŠÄ“D\Â#\"±e\ËÛ±‚-Z˜q\ãÆ™u\ëÖ™ƒš³g\Ï\Ú\ç\ëkvv¶y÷\Ýw\Í?ÿùOÓ¶m\ÛË¾7))É¬_¿ž\Þ\nX¾|yÁûC\Ãf\0ˆ„¯E\âs\ÇqZ	ˆ„:÷¢\Ã:u²’p\éÒ¥2¿Î¦M›L÷\î\Ý½Žk›¤¯¡\áZ	²€Hø¾F\â\\ ø\"\ç\"!‰ˆ\ÊHLL4ó\çÏJ Š²xñb;¥±p(\ÕJÔ©S‡@\0\"AF\â’\Û~I$\âX$4œ!qˆ\ÆØµkW…œp}ô‘iÕªU¡\Ì\Ã ž~úi\Û!«Ž\0‘ðµH\èC\çMD\"NEBi\åÈšI„j*½^¤L¨f‚L$âª«®2¿ü\å/\íWd	R¯^½›u] q,š9œQQ™ˆ\â2‘\Ã=zô 7ò¹D„\åaÀ€\È þ‰_khƒHÄ©HhˆÈº\ÕDT&ª™ˆ¬—Ð\nø[\"®t\0‘ð6\î5¨Ž{=8K$\âT$´\ØT\ä\ìŒ.Tú	Ø¥K—‚Ÿ©E«\0‰(ú¸2\0ˆ„?Ð´OMÿ$q(ªˆœ\ê©)žU²‘+`\æ\ä\ä\Ð+!0\Ìˆ„¿\ÐBT\îõ\à‘ˆC‘\Ð4\Ì\È\ËòLóŒ–\ÈE«´7Gi¼ð\ÂÈ†O$\"R&jÕªEf	ˆ\Äd÷Z°“HÄ¡Hh®ð\Å|\âÄ‰UzN›6­\Ð\Ú\ÅeKFmgw\è9\ì\Ù\á‰ˆü>\É™	@$¼\Û\Ç\Ï×¦]D\"EB»x†/\æZöº*\Ñ0Jøg§¦¦?zô¨6lX¡5-	ÿID\Ñ\ï\'3ˆ„§E\â-m#N$\âP$\"\ë#>\\¥\'¡Ö•ˆ¬“PÝ„†;´XUq±\æDüKDnn®\Ýj^_K£\èó¨™\0D\ÂóÅ–\Û\Ü~~‘ˆC‘ˆ¼P‡7\àª*ôó¢\ÙA\â_\"\îº\ë.\Ûù\êkI2Q\Òó\ÈL\0\"\á\éŒ\Ä~÷C\äp\"\ç\"QD#\é\é\é6c¡)ªZÈªoß¾v!-\rƒddd˜ñ\ãÇ›©S§\ÚR­…±l\Ù2“™™i6n\Ühv\î\Üi8`Ž;\Æ\æP\Õ4œ¡C~\Ç[¢LDJD¸5mÚ´Â†I\0‰\Z+\Ç@g\"AF¢\\	V\Ýu4²M™2ÅŒ;ÖŒ1\Â<\Ø~2\íÕ«—\éÚµ«\éÐ¡ƒiÓ¦iÙ²¥\ÝMR­†\rš\ä\ädûš\Z:ÑI\ä°Iø¾\Ósô\\}¾W¯¡\×jÝºµ}mý]¼ú÷\ïožz\ê)3|øpûûNž<\ÙÌ˜1\Ãn½h\Ñ\"³j\Õ*»‡ˆ†iö\ì\ÙcŽ9bNž<y\ÅT¾\×%¢$Iˆ”‰+=†a@$<)§\Ý\"\ÔHDE\Ñ\Z	¡l2•=´¡Ÿ£ì„²\ÊV(k¡ì…²\Êf(«¡ì†²\Êv\èwRöCYeC”QvDY’´´4[´Ú¨Q#»_‰f™D\ÊK\Ñm\Ôu\\…¤zž–\×÷I^š7o÷Y—+eJ’…‹/–I\"\"³9\0‘ð”H\\÷‰8‰š8kCh\æF\çÎ/xED‹Jžö\í\Ûg¶n\Ýj3\Ê`(“1w\î\\3s\æÌ¸Îº<ù\ä“e\Ê\'\×^{m™%¢¨LP3ˆ„\'Š-ó\Ü>\ë»D\"E¢&¯#!t¡ÒŽ¡ºB\ÍÍº¸€me\Í\'\ÑH\Ã€Hx‡|ðºü?k8	}\n®®•-õéº¬+[J( f¢]õ^»ûî»£ú>\rg\ÍDè¾ŽG\Ã\Ã?l¿W¿\0\"—Ùˆ»\Ü\ë@.‘ˆS‘Ð§\ÖÈ?\Ùkb!Ú©™‘Ð°\0\"·\"ñ{-8O$\âT$„\ÒØ‘»VEV¢{÷\î\ìþ\éQ™¨ª\Z‰ð^k\0\"÷\"\ÑØ½œ$q,YYY…\nô4~^™,^¼¸\ÐLe\'À2Q‘³6Xœ\n	o\n…ú¸×‚l\"\Ç\"!\"‹.55q×®]•r\âi[\ÅzáŸ¥lxO&Š›MQQ\ëH¨@”\Ù\Z€HxJ$Æ¸f÷‰8	MM\ï².¼\ÔTÅŠD¯§\0áŸ¡Ÿ\Çþ\Þ$\\»y±¯È•-5]\0‘ð\îõ`¶\ã8›ˆDœ‹„\Ð\Ú\0‘C’‰Š\ÊL()ú9úy\àŸaŽŠ\Úk‰\0D\Âs\"±\Òm«ˆ„DBÌ›7¯Lh˜C5\å)ÀTMD\äp†š\Ö0\0ÿd&\"eB†²\ìþù<Ö‹\0D\Â\Ó\"±IY	\"\á‘(N&Â³96m\Ú\Õë¨ˆR«2]\"\Z‰ð_f¢<5\rH \Þ\Æqœ½nK$<$\áaŽÈš‰\È\á­€ù\Î;\ïØ½9\Â}\é«j $Z±2r±©Èš†3\ÈL”gx\0‘ð¤Hd»×ˆ¾D\Âc\"!T9›£<M³3(¬$3 €Høfh\ã¤Ûš	ŠD­3¡•#WÀ,K\ÓóµØ”öx\0g&\Ê2Ì¡)žV\"\á‘8_¯^½¿	‹D-§­½9”¥\ÐN‘[‡\ÅA»x\ê¤ö\Î`\Ùkˆ%\Ó®©@\"\0‘ðÁ`0·nÝº?%>‰¢,\\¸°@\"–.]J¯å–‰\âÖŸ\0@$<Ÿ‘0\Ú”HøP$”}‹„ˆE&\Â\ÒP\Öa\0D\Â;$\'\'\ß\î^Còˆ„EbÎœ9—\ÕD•€h	g x\àvñDÂŸ\Ã\Z¿s\ç\"‘ð¡H4l\Øð2‘hÖ¬=Ä”™\Ðû‰\0DÂ—\Ã\Z!·!>‰^x¡Ä™\Zk×®¥w¨\Ñ{GÅ¼\0ˆ„¿\Ýóÿ‘ð™H·PU¸i?\r€hÑŠ§Ç\'€HøO$žq\Ïÿ‰„DB\Ó?¯´~«WB,\"qô\èQˆ„ÿj$¦9Ž³HøH$J\ËFD.£\r­H8p€@\0\"\á¿\Z‰%n[K$|Xlf\çÎv!*€ò ÷Ð¾}û þ‰õ@`‘ð±Hlß¾\Ýn5P^‘” ¾‰n{žHøX$´U8\"\åE\ï!½—\0	ß‰\Ä!·=E$|,ÚK{n\0”\Õ\ÞlØ°@\0\"\á3\Ç\ÉqE¢5‘ð±H¨ó\×E\0 <$\'\'³	 þ\ÌHœ\r…Buˆ„EbÝºuˆ”›””³j\Õ*ˆ„ÿD\âRbb\â	‹Dff¦ý4	P´\äú²e\Ë þ	óè£\ÞB$|,«W¯6\r\Z4 GrÑ¨Q#³h\Ñ\"ˆ„HII¹I\"A$|.+W®´ii€ò m\è\çÍ›G \0‘ðW6\â—n\Ë%>	¥£•–(Mš41³g\Ï&€HøˆP(ô˜\ã8çˆ„\ÏEbÉ’%6-\rPš7on÷q@$|•‘h\é¶Ï‰„\ÏEbÁ‚&55•\ÊEË–-\ÍÔ©S	 þ‰An;L$|.\Z\×\Öø6@yhÕª•™<y2\0D\ÂGI®H\ì&>‰¹s\ç\"PnÚ´icÆO \0‘ðÁ`ðU·m >	È©P <´o\ß\Þ<÷\Üs	\rmd:Žó:‘ð¹HÌš5\Ë4kÖŒ\ÊEÇŽÍ³\Ï>K \0‘ð—HluEb&‘ð¹H¨\Ò^÷\0\å¡k×®fØ°a	‰DV0A$|.Ó§O7iiiô(P.zö\ìižz\ê)ˆ„¿D\âh \èF$|.š²§©{\0\å¡w\ï\Þ\æ‰\'ž €Hø\ÇqN»2‘D$|.S¦L1\é\é\éô(P.úõ\ëgú÷\ïO \0‘ðWF\âb0|€Hø\\$&Mšd\×\0\0(\ÊF(+€HøJ$òRSS¿O$|.šû¯5\0\0Êƒ\ê#T\'€Høƒzõ\ê]›¿óg-¢\ás‘;v¬iÛ¶-=\n”\Í\Ø\Ð\Ì\r\0D\Â¤¤¤ü\Øqœ<\"H˜ŒŒÓ¡Cz(ZCBkI\0 þ þ\Åmˆ\"aFŽi:u\êD\åB«ZjuK\0D\Â7õ\ÜvŠH føð\á¦s\ç\Îô(P.Æ\Ç þ‰^nû”H ŒmC… ?™ýˆ„pg´+ûˆ\"a†bºw\ïNå‚…\Í\0‘ðH\ÌrEb3‘@$˜¶{¶\0\"\á;‘X\ß ˆ„4h	A¹a;z@$ü…+\Ýö\n‘@$\ÌÀMß¾}\éQ \\Ì›7\Ï4nÜ˜@\0\"\áŸb\Ë=Ž\ãŒ#ˆ„\ÝAû$\0”‡…š\Ô\ÔTˆ„D\âW$ú	D‚Í– BX¶l™iØ°¡½““cv\ì\Øa²²² \Þ\Ú8\á¶fD‘°\Ã\Z\Z\Þ\0(+…¤¤$“˜˜hÜŽ\Äh½ý\â\Z™.@$<‘8\n…þF$	[h©‚K€h\èÓ§O‰¡&Á8zô(DÂ»\"‘\ë~˜¸›H ¦Gfð\àÁô(uV\Âý4R¢H\è}€HxZ$LÓ¦M¯\'ˆ„\éÖ­›:t(=\nDVE-I$:D€\0‘ð(u\ê\Ôù¶{ž³ó\'\"ñ/ºt\ébžy\æzˆ)+Q\\K®\"\ám\ê×¯Ÿ{®_$ˆ„E;Ž1‚bbÒ¤I—‰\ÄÚµk	 &11\Ñq9C$	KÇŽÍ¨Q£\èQ f4ƒ#,-Z´  €Hxœ`0\ØÁ=\ß?#ˆ„¥}ûö\æ¹çž£G˜\ÑbTa‘\Ðm\0D\Â\Û8Ž3\Ô=\ß?&ˆ„¥mÛ¶f\ìØ±ô(P.RRRl½\0\"\á}\\‰xÁm	D\ÂÒ¦M3~üxz(s\æÌ±	\0D\Â‰\Å\îù¾–H –V­ZÙ‚9¨\Ù\ìß¿\ß1._¾Ü¼þú\ë´š–ñ^½zµÙ½{7o(@$\ÊW#ñ¶\Û^#ˆ„%==\ÝL™2…¥†KÄš5kLvv¶9þ<­\í\ÓO?5«V­2»v\í\âˆD\ì‰®Hü“H ––-[š©S§Ò£\Ô`”‰@\"*V&”\Ù@$b®‘8\è\Ê\Ä`\"HX\Ò\Ò\Ò\Ìô\é\Ó\éQj0º\è!\0\Û4\Ô€H\Ä<´‘ã¶¶D‘°4o\Þ\ÜÌœ9“¥£‹D‰\Z”‘8\ë8N=\"HXš5kffÍšE\â‘8õùa³÷)fÛ²þ¶é¶Ž!ˆ ,—\Üö[\"HXš6mjfÏžM\ç\"q2\ç Ùº¤—\ÙüZ§BM\Çôò€H\0\"Q\"¡m¿I$	K“&M\ÌÜ¹s\éQ\â\\$>\Þö\êen¶\ÍG	@$*„ÚµkM\"A$‰\Z7nl\æÏŸO\ç\"ñÁÊ§K	=†< €HTu\ëÖ½\'\æ	D¢€\Ô\ÔTöGð€Hl}½o‰\"¡ÇD‰Š <špŽH 4j\Ô\È,Y²„‘@$\0‘€+[¸\í8‘@$\nhØ°¡]:\â[$4K£$‘\Ðc\È\"ˆD‰\Ä@\ÇqŽ	D¢\0\íÚ¸r\åJz”8‰Ý™%Š„C	@$*‚„„„‰nûH 4h\ÐÀndñ-\Çn1[—ö¹|X\Ã=¦ÇD‰\n‰¹n{—H $\'\'›\Ì\ÌLz”8	µ}¦^&:†8 €HT H¬q\Û2\"H””dÖ­[G\ï\"q\îœ\ÙýÖ˜Ë‡5\Üczy@$\0‘¨\Çy\ß‰—ˆ\"QH$6l\Ø@\Ç\"¡•+weŽ*±FB±º%\"ˆDe$²\Ü6ŠH Ô¯_\ßlÜ¸‘%E\â\Ü9sx÷\nóþ\â\î%JD¸\é9z.\Ù	D‰ò†B¡\îD‘($[¶l¡G‰3‘¸R‚\ì\"ˆD%e$ND‘( 11\Ñlß¾%\ÎD¢,YˆÒ²ˆ\"ˆD|\ß‰®HüP …Db\çÎô(q&±JD¸!ˆ Q\ÒYñr%\"/))é‡„‘( \n™={öÐ£\Äc\r‘€rqõ\ÕW#e—ˆ¼«®º\ê=W$\Ì5\×\\3€ …D\"++‹‘@$ÀW\è}ð\ßÿý\ß&!!a}JJÊ¹Ü”.n\ë—¿W‘û\àw‘ƒ\æÀô*ˆ\"¾\ã\Ë_þ²Ñºn\Ësû\Â7’““o\ç²SªD\\\é8øU$Ž9B‚H \à\Û\Z	·ü]BB\Ân·åº·_{ô\ÑGo\áòsEY?Þ“P!\æ\èÑ£ô(ˆ\"¾‰0õ\ê\Õû«+û\Ýv\ÉqœY\îýˆR\éIf‘°\"‘““C‚H \à{‘“˜˜\è¸2qÄ•‰‹n9\ÙŠk‘ˆRe\"—Ì„E\Â=Y\ÌÉ“\'\éQ|$Ç·u1ˆ ¥Oÿtû\Ç&®H|\æ~=\ïJÅ³\î¡ZHD‰ß—Kf\Â\Ç\"¡Ž¼/»w\ï6úÓŸ\ÂS\Þ\Ìw¾óóò\Ë/\ÇüzK—.\rwÄ¶}ñ‹_4\ßþö·\ÍÈ‘#cz½…\Ú×™2e\n\"5B$\"„¢£\ÛNº\íl(\Z€DP3H‰\Ü\Ü\\z‹\Ä\éÓ§\Í\Ï~ö3s\íµ\×\Úe\Ñûõ\ëgn¹\åó•¯|\Å\ìÛ·/¦\×\\²d‰\íˆy\ä3d\ÈÓ¿s\Çw\Øc~øaÔ¯·c\ÇÓ³gO»‰\"5I$\ÂH\"$ùR\Ñ\Ñ\Ã¡\ÌË„2d`Š>š	¿‰„R\Ü‰aÃ†!	eô~jÐ AÁ±W^y\Å^üw\í\Úe/^l~ðƒ˜W_}\Õ>Ö®];{ÿ\ìÙ³\æð\á\Ãv\Ôo~ó›\æ†n0)))\æÜ¹s\"ñ\ä“O¼fzzº=¶f\Í\Z{¿S§NVXn½õVÓ¡Cs\æ\Ìó»\ßý\Î\Üÿý\ßó÷¿ÿ\Ýüú×¿6+V¬°?³<YD*S$\Â\Ï`08B\Ãù\ÃMªûB‘ššúý\n–ˆù±\ÙYŠL”ô<2~\ËHlÝº\Õ4j\Ô\È4l\Ø\ÐlÞ¼™žÅ£\"1`À\0\ÛiþóŸÿ,öñÙ³g\Û\ÇgÎœi\ïk{yÝ—H(K \Û\'N4½zõ2?ÿù\Ï\Í\êÕ«D\â\'?ù‰©]»¶•\r›\Üu\×]V4Ö®]k—„„cÒ¤I¦Gövff¦\Ý\çE·[·nm^{\í5†6 DÂ¢Lbª Ó•‰OT Y]\nIÖŠA(ŠÎ˜9dY‚LDJD¸«Àaˆ\'‘\ÊF>\Ü\Î\àPŠš\ì„÷DBCz?Í›7¯\àØ¹ˆ-Å‹Š„†?\Â\"±`Á{ûú\ë¯7ù\Ë_Ì˜1c\ìPI¤H\Üy\çö¶2šN¬\×\èØ±£=¦\ìFXôÓ°G­ZµLZZš\éÞ½»=.‰E$ žD\"B(n\ÐTQM\Õ\Ô\ÑP(ô·j	ÉŒ\×\Ês¿.sÏ³\Û\ÊQQœ$D\ÊÄ•ÿ\Ã>‰0út\è\Z­M]oÜ¸‘^\ÆC\"ñ\ÒK/\Ù¾s\ç\ÎÇ”iøñl³a‘˜:uª}¬nÝº\"¡ûº¸×©S\Ç|\ík_³\ÇG\ZUhh\ãÔ©S\æ\Þ{\ïµ÷322\ì÷hE÷õžjÙ²¥mú>=¦††;4”q\ß}÷\ÙcˆÄ£H„\Ñ\"VZ\ÌJ‹Ziq+-rU…\"¡Ÿi\Â-_(&>ø\àƒ\×\ÅXXY’,\\SF‰`6‡_E\"œPg¯OŽº@\\¼x‘\Þ\Æ\"¡½2\Zzp?A\ÙzZ*“p\â\Ä	;Ì ÷›:!\ÕI\Ü|ó\Í\"Ñ¥Ks\ÓM7™ùó\ç›ÿý\ßÿ-\È2­‘\Ð.²ª¡P\æB·§OŸ^ /\Ï?ÿ¼¹ýö\Û\Íøñ\ãe@\ÂC&EE\â½÷Þ³\ïÁ•+W–x‘€š$a´Ì¶{­\Ò\Å\\\Ëo»·Y\"aJh\Zò\è\ã\ìŒ\âd\â|QT&¨™ð‹H„Ñ… q\ã\Æ6;¡*zˆo‘ÏŠPƒ†4Uóøƒy\ã7\ìcZK\äü£\í”)øý\ï_ \Ú\Ô\íÿý¿ÿ§ÿ\ì\Þý\ë_\í:\áéŸ‘Å–šú©cz\Î\çŸnüq+/ú^M=\Õ\âgzžŠ.5ýô\Æo,89ý³,·	¨‰\"F¹\"±>2K\àJ°2—Ü¯\Üû\ç\ÜÛ§\Ý\Û\'ò‹6?u\Û!·e¹÷?t¿nwŸ³Iµn[£!‹@ °Àý:\Ûm/¸Ï™ µ-Ü¯O–\"\áv\ÆýÞ§\Ü_«K”\Ã\r\Å\ÉD4Á0‡ŸE\"\Ì\èÑ£\í\'À²\ÞDœ‹D¸\é\Â®c(\Ú:T¨v\"²;v\Ì\ÊA´?O\ßS\Ò\ÏcA*ðªHD\ÔP\Ü\\»v\í¯)SQ·nÝŸºõßº‚ý§P(ô˜Û·\Öw[3÷\"\ßN™If„¸‚0._^v¿Î—DH&\Üûo\ç\Ë\Åv·I6²ò\å\ãJ\"a‡&óÿ\ÞmQþ	\×“‰8Ÿ<\Z\ç\ï÷¹´ûL$Äž={L“&M\ì˜÷ºu\ë\è}\â\\$hˆTHTQDIñ±+m‹\Ö(\ë0CEg$ž\ä²\îS‘3n\Ü8›\Ð\Úd\'	D‰\êG34Š\n„\ã8\ïÿ‰±Ð²¢k$zRp‰HB« 6k\Ö\Ì$\'\'\Û=@$	@$ªU$~—/*\î|\Ïmw•\áÛªr\Ö‹S!\Å3a\Â›\èÛ·¯-\ÈD‘\0D¢\ê©[·\î=š%\ãbT\ÅÍ¦¨¨u$’˜­H\\Uó7o\ÞÜ®‚¨µ\0‘@$\0‘ˆ+z“1¨È•-‡rG$Ê„¦\â);¡å“µ\â! ˆ qCeíµD Ñ¡u´ä±²Z,	D‰¸\ËLD\ÊÄ¸/”m÷\Ï\È\ç±^\"Q~´\Är(²\Ë/“@$	@$\â*3Qžš$‘¨8´¨‘öU\Ð\ÆOË–-£·B$	@$\â33\ëð ÃŒ3lv¢[·nv	f@$	@$\â®f‰@$ª—#GŽ˜Ö­[›\Ä\ÄD»\É ˆ q‘™(\Ë0G…•ˆD•¡m¬•\ÐNÇ§C$	@$\â;3®©@\"‰ª#;;Û´i\Ó\Æf\'´‹# ˆ q)Å­?ˆD\Õ1{öl›\èØ±£Ý‰	D‰\Z/=£ö\0D¢rÑ¶\ÒmÛ¶µÙ‰ùó\çÓ£!ˆ 5»fB2±\ê\ì\â‰H\Ô4\æÎke¢C‡\æØ±côlÅ°|ùr.þˆ Õž™p\Ç ˆDD!‘PH, 0kÖ¬±õ%@\Å4\Í$’œ Ñ¡]F\ëÕ«w‘@$j,\Z\âLh\ÈCCð/ö\ì\ÙcV­Ze>ù\äD ‚$b×®]¼±\0‘ˆ^$ò\êÔ©óm\"H\ÔhT|©\"Lcª(þO&V¬XaSò5µiã¶šüû©!€H”K$rÇ¹‹H q¦‡*;¡\é¢J\ëC\ÍFŸö•ö@$<-—\êÕ«÷k\"H\Ä\rZ¸ªK—.6;¡­ \æ¢%\Ð	@$</ÀýD‘ˆ;´´¶²Zj[c\ÜPóPÁ,\"ˆ„\çE\â¼ûÁ\îoD‘ˆ\ÛO¼\ÚüKÙ‰iÓ¦\Z†O5\0ˆ„§E\âŒ\ã8õˆ\"\×h[rmO®mÊµ]9\Ôö\ïßH\0\"\á}‘8\åž\ç\r‰\"÷œ>}\Úô\ì\Ù\Óf\'¦NJ@j\0šU¢ÿ\0\"\ái‘8î¶–D‘ðZ[!))É¤¥¥™jdÇŽ¶Ž\0‘ð´Hs[G\"Hx.;Ñ«W/›VŸ2e\n©&¶lÙ‚H\0\"\áq\Ç\É…B}ˆ\"\áI\Þ|óM›hÞ¼¹\É\Ê\Ê\" UÌ†\rlü	Og$º\í)\"Hx–³gÏš¾}û\Ú\ìÄ„	H²n\Ý:D	\ï‹D–\ã8\Ï	D\Âódffš\ä\ädÓ¬Y3³o\ß>RE!\Å\0‘ð´H|\è~P›@$	_ %›û÷\ïo³cÆŒ! •Œö°HII!€Hx[$>p\ÛT\"Hø.\åÞ AÓ¤I;E*‡¥K—š†\r@$¼-›Ç™E$	_f\'h³£G& •À‚Ljj*\0D\ÂÃ¸ñŽÛ¾J$	ß¢™J¿7n\Ü\Ø\ìÜ¹“€T s\çÎµY\0D\Â\Ó‰L·-%ˆ„¯¹xñ¢yò\É\'mvbÔ¨Q&77— T\0³g\ÏF$\0‘ð~Fb…\Ûw¾A$	pÙ¸q£\ÍN(¿}ûvRNfÎœi\×ð\0@$<-‹\Ö	DòQ6bÈ!6;1|øp²\å\à…^0-Z´ €Hx{hc®\Û\Þ%ˆaó\æ\Ív\ÆA£F\ÌÖ­[	Hhyòôôtˆ„‡	…B/:Žó>‘@$ „\ìÄ°a\ÃlvB_\ÉND‡VmÝº5\0D\Â\Û‰\çÝ¶“H P\n\ÊH(3¡…2P6ÆŽkÚµkG \0‘ðvFbŒ\ã8{‰\"e\ÈN¨fB\Ù	\ÕP¸2¦C‡	\ãö‰\Ã\Ýö1‘@$ Œh6‡fuhv‡fy@ÉŒ1\Ât\êÔ‰@\0\"\áí¡An;L$	ˆ2;¡õ&”\ÐúZ‡.Gu%]»v%€Hx[$zº\íS\"H@h%L­ˆ©\ì„VÈ„\Â<\Øô\èÑƒ@\0\"\áa@;÷C\ÕgD‘€r ½:”\Ð\Þ\Ú\ÃþÅ AƒL¯^½ Þ®‘h\æ¶D‘€r¢]Dµ´v\Õ\î¢`Ì€Lß¾}	 \Þ\ÚHr\ç4‘@$ ‚7nœ\ÍNô\ï\ß\ß÷\Ù	I„d\0‘ð.¡P¨Ž+g‰\"È¾}ûL³f\ÍLrr²\É\Ì\Ìômz÷\îm‡7\0	\ï\â8\ÎC®Hœ\'ˆTZ\ÙQ\Ù	}2?{ö¬\ïþ~Zª\à\0‘ð.õ\ë×¿Ï•‰‹D‘€J\"++\Ëî€™””dV¯^í«¿]S?5\0‘ð.u\ëÖ½\ÇýÀ”K$	¨d´•²š\Åpúôi_ü\Í;v4\Ï>û,ÿ|@$<Œû!\é‡			yD‘€*\àÀ&--\Íf\'V®\\\éù¿W\Ëck™l\0D\Â\Ó\"ñMW$ˆ\"U\ÉÔ©SM(2={öôtvBv3†8 \æÁ¼‘@$ \Z8t\èiÙ²¥©_¿¾Y¶l™\'ÿ\ÆV­Z™I“&ñ\ÏD\Â\ãH$úö\í{\r‘@$ \Z˜1c†\ÍNt\ë\ÖÍœ<y\ÒS[zzº­\r@$¼/õ\êÕ»™H PM9rÄ´n\Ý\Ú$&&š%K–x\æ\ïR=\Èô\é\Óù\"\áq\Ç\ÉKMMý>‘@$ šyé¥—lv¢s\ç\Î\æøñ\ãqÿ÷hÚ«þ&\0D\Âó‰\\÷ƒ\Ð\ÝD‘€\Z@vv¶iÓ¦\ÍN,\\¸0®ÿ\í=2{ölþ©€Hx_$.¹\í·D‘€\Z„.À\ÊNh-†œœœ¸ü´\Åú¼yóøg\"\áq‚Á\à…\ÇüOD‘€\Z\ÆÑ£GMÛ¶mmvbþüùq÷û§¦¦\Æ}V	(S\Ä9÷ƒ\ÏcD‘€\Z\ÊÜ¹s­Lh§cÇŽ\Å\Í\ïÝ°aC³t\éRþ€Hxh\ã´\ÛBD‘€\ZŒB\"!¡X\Ä)))¾XÁ	D\"\á¤\ã8‰\"q€†8$\Zò\Ð\ÐGMA›“\íØ±£P=Gƒ\rÌš5kø§\"\áý¡W&Z	D\â]¬U„©bÌš2+B¿¥)®i³2É†:ü²a >+¶<\Zº	D\â2\ê­é¢š6Z\ìÙ³§D‘·\áÃ‡óODÂ›‰#\î›D‘€8DWu\é\Ò\Åf\'ª{ñ\'-¤U’D\è÷#ˆ„gk$>veb(‘@$ Ž\Ñ\Ò\Ú\ÊNh©m-¹]Ó²d#\0‘ð´H\ìsEb4‘@$ \ÎÑ¦_\ÚüKŸþ§M›V-¿ƒ¶\'ˆ„\ïj$vID‘\0 mÉµ=¹¶)\×v\åU\Éúõ\ë/‰q\ã\ÆñOD\Â\Û5\Û\Üs}‘@$ÀC(Ð³gO›\r˜:uj•þlm\Ö–ˆ\ä\ädsþüyþ!€Hx;#±1\Ì!ˆxU«V™¤¤$»¥÷ª\äg._¾¼@$fÌ˜Á?	\ïg$Ö¹2ñ\Z‘@$À\ÃÙ‰^½z\Ùõ¦L™R%?³Y³fV$\âiIo\0D\"\æb\Ë5n[N$	ð8o¾ù¦\ÍNh\èA+QV&«W¯6u\ê\ÔaX	ˆ\Ä2\É‘@$Àœ={\Öô\í\Û\×f\'&L˜Pi?\çé§Ÿ¶r\ïÞ½	: \',pû”·‰\">\"33\ÓBjbß¾}.W]õÿÛ»û+«;\ãYÿ0›6\Ù4›ML³\Ù4f³Æ˜M³þ\Ñd³i\Ó6Í¦u»M€û\Ü{‡™Š/`Q¡º #Vtµ•nI\Ùb %¸[e\Ë.»Å…Ô¡D	´u\êU”ZŠ\Ãpö97Œ¹Œ¼Ì½w`\æ\Þóù$Ol}ašŸ;_žsžóüQ¸þú\ë+‰–¿#±.¿v™„ 1q\Ùa\áÂ…•»?þø°F\Ä@<\Ü{\ï½b!\Ñ\âòÏ\ÕñP“$jûö\í•7uvwwWN§®ˆ¸ØŸ!\Ñ2w$V\æ×¯LBHøÝ‰E‹U\îN,[¶l\Ø\"bð_w(@H´\\H<\É6	!a\çÎ¡££#tuu…}ûö\rKD°ÌhM\åryI–e¯™„€Š¾¾¾°xñ\â\ÊÝ‰G}4ô÷÷7\Õ1q\ÅW¸3h!yD,(‹‡LBHÀYz{{+w\':;;Ãž={\ZŽˆ\ê.Æ„;‰–YÚ˜_‡MBHÀGÄ»K–,©Üˆ¯¸;\Ñ\èJ{&-uG\â–<$~gB\Î\ë¿øE˜4iR˜<yr˜;w\îY\ã\"î©¸\ÐÈ¹þ>{&-]yH5	!\r_ý\êW\Ã7¿ù\Íÿ\Ü5\×\\Sùð<_Lœ\ï\ïsg!\ÑüJ¹<$\Þ7	!CZŽˆˆ(\Þa8óÁ{Þ˜¨ŽˆkÊ”)ùuÝ™@H4§B¡pc˜„€‹F\Ä\àöçŠ„ê˜¸\Ø_`™!\Ñ\Ô!ñ\Å<$Nš„€š\"\âb1#JDTOs $šO[[\Ûgò8eBjŽˆ\ÅÄ•W^9\äˆöL $š*$®+•Jý&!$ ®ˆ¸PL\Ô–9Í©X,þE~6	!Ú¿\åõºë®«éŸ‹\Ëƒ\ïD\Äÿÿ|-¾ü\å/Wþ\Ùø¿„\Ä\è\Ö\Ñ\Ññ‰<$\ÌMHÀ¹\ïHu™a¸\ïHÌ™3Ç¿„Ds¸BH	hhyc¸öH¼‹Ã²B¢\é–7\âc\Ý3	!5\Ç\Äp>µ\áp*„Dó†D©Tº\Ê$„œ÷‡ü¹ž¦®s$V­Z\åi\r„Ds‡\Ä\é,\Ëþ\Ò$„\\p\Ùaðƒ\á<\ÙrÖ¬Y†ŒhÞ\è/—\ËcBjZ\æ®wmˆ„DÓ‡D_©Tú¬I	ò‰ê˜ˆw†òö\Ï\ê¿\Ïy‰Ö‘GÄ‰q\ã\Æ}\Å$„ù\ÎD#{\ZDB¢\å\îHÏ¯±&!$\à’Ç€·}\"$Z2$þ_\í&!$\à’Fˆ@H´\ì\Ò\Æ{…BašI	¨\ë\Î\ÄP–9\â#ž6V\"$ZöŽÄ»yL\Ì2	!—\ä\Î\ÄÀž\nhÙx+¿æ›„€a‰s?B¢\åB\âR©´\Ø$„KLD\ÃP—=@H4}H\ÌCb©I	h\ØÂ…C–e\áóŸÿ¼·x\"$\Ò	‰Wò\ïû\å&!$ aÇŽg^),\"‰\È#bo©Tz\Ê$„4\ìwÞ©„\Äþýû\r!‘NH\ìÎ¿\ïhB\Zö\Úk¯\Å\×	B\"!ù÷ü\ÎB¡°Á$„4\ì•W^	\år\Ù i\í‘Ø–e\Ùs&!$ a/½ôRhkk3„DZ!±%¿þ\Ë$„4l\çÎ¡½½\Ý i…\Äóùõ¿&!$ a/¼ðB˜0a‚A $÷G\Ä}&!$ a›7oH\ëŽ\Ä\ã“&!$ a?ù\ÉO\Â\äÉ“\r!‘VH¬ŠgI˜„€†ýø\Ç?\Ý\Ý\ÝHH+J¥Ò¯MBH@\ÃÖ®]¦Nj‰„\äñp±X<`B\Zöô\ÓO‡\éÓ§B\"­X\ß\0jB\Z¶r\å\Êpë­·\ZB\"­=óó\ë-“Ð°\åË—‡™3g\ZB\"­¸=¿\Þ5	!\r{\ä‘G\Âw\Üa‰´–6¦\ç!ñžI	hØƒ>\èõ\á‰\Ä\n…‰yHüÁ$„4\ì¾û\îó\æ\Í3„DZKcó\ë¸I	h\ØÂ…Ã‚!‘q\ã\Æ}¥T*0	!\r›?~\å®‰¤öH|¶X,ö™„€†Í;7,Y²\Ä i-m\\Ÿ_§LBH@\Ã\â?ü°A $\Ò\Ñ\ÑñWY–6	!\r»\í¶\ÛÂ²e\Ë!‘\Ö\Ò\ÆU\ÅbQH	h\\<\Õò‰\'ž0„DB¦L™ò±<$\ÌNH@\ãnºé¦°j\Õ*ƒ@H¤·O\"\Î\î\n“ÐiÓ¦…5k\ÖB\"Á¸\á†þ\Ä$„4¤»»;¬_¿\Þ ‰‰›-\'L˜ð\ç&!$ !\á\ÙgŸ5„Dz.ûÇŒs­I	hÈ¤I“\ÂOúSƒ@H¤·´qª­­\í3&!$ !&L[·n5„Dz!q²P(|\Ñ$„4¤½½=ôôôB\"½ø ‰MBH@C\Ú\Ú\Ú\Â\îÝ»\r!‘\Þf\Ë÷ó\ïÿ\Ì$„4ûö\í3„Dzw$Ž\æ\×d“ÐR©<h‰ôB\âwY–\ÝbB\Z¥9|ø°A $\Ò‰\Ãù5\Û$„4G5„Dz!ñ\Û,\Ë˜„€†C¢¿¿\ß \é…\Ä\ëyH<`B\êv\âÄ‰JH€H2$ö\ç×£&!$ nGŽ‰tC\âWùµ\Ò$„\Ô\íÐ¡CB!‘¨,\Ë^.•J«MBH@\Ý^}õ\ÕP.—\r!‘\æ‰]ùµ\Î$„\ÔmÏž=•©@H$=ùµ\Ñ$„Ô­··7Œ?\Þ i†\Ä\Ö,\Ëþ\Ã$„\ÔmÛ¶m•·‚H2$6\ç\×ÿ˜„€ºmÙ²%Lœ8\Ñ 	*•Jÿ–e\Ùv“P·\çŸ>Lž<\Ù 	*\n\ëó˜\è5	!uÛ°aC\è\ê\ê2„D‚²,[S,_2	!u{\æ™gÂ”)S!‘\æ\ÒÆ¿\ä!±\Ï$„\Ômõ\ê\Õaúô\éHóŽÄ²<&^5	!uûþ÷¿n¾ùfƒ@H¤‹\Åß˜„€º­X±\"Ìœ9\Ó 	*—\Ë÷\æ1q\È$„\Ô\í±\Ç³f\Í2„Dš!17‰·MBH@\Ýz\è¡0{ölƒ@H¤¹\Ùrf~1	!u»ÿþûÃ¼yó!‘ b±Øe\Ù\ïMBH@\Ý-Z\î¹\çƒ@H¤\åü:fB\ê#\"\Æ‰$÷Hüc–e˜„€º\Åe¸¼B\"\É=Ÿ_\'MBH@\Ý\âFË¸\á„Dz²,û\Ûb±\ØgB\êýŒ€‚H2$þ:‰~“P·3fT¥!‘ž\Î\Î\ÎO\å1q\Ú$„\Ô-\É!‘žq\ã\Æýi±X4?!õûú×¿~ðƒB\"Í¸RH	hHwwwX·nA $C\"…I	¨KWWWØ¸q£A $‰o¼ñ\ÏLBH@]&Mš6m\Úd‰tC\ât{{û\Õ&!$ .aË–-HT©T\ê3fÌ§MBH@]òß‰„\íÛ·B\"QY–õ?þ\ïLBH@]ò\Ð\Û\Ûk‰t—6NÆ£²MBH@]\Ú\Ú\Ú\ÂÞ½{\r!‘nH/\n_3	!u\É\'8`‰t—6Ž\åŸ\ãMBH@\Ý!q\è\Ð!ƒ@H¤»\Ùò÷ù5\Õ$„\Ô%>Cþ\Þ{\ïB\"Ýx·P(\ÜfB\ê‰\'NB\"Ý¥·\Ë\åò\\“P³þþþJH€Hz³å›¥Ri‘I	¨\ÙÑ£G…B\Â\Ò\Æo\n…\ÂC&!$ f‡	KÿW.—7	!5;xð`\å©\rI/m\ìË¯\'MBH@\Íö\í\ÛW9\n„D\Ò!ñR¹\\þW“P³Ý»w	„„¥K¥ÒLBH@\Ízzz*/\í!‘ô‰mùõ\ï&!$ f[·n\r&L0„D\ÂJ¥\ÒgYöŸ&!$ f›6m\n“&M2„D\Úw$6\å\×&!$ f\Ï>ûl\è\ì\ì4„D\Ú!±1Ë²&!$ f\ëÖ­S¦L1„D\ÚK\Ï\ä!±\Ë$„\ÔlÍš5aÚ´iHûŽ\Ä\Óùµ\Ç$„\Ô\ì\É\'Ÿ7\Ýt“A $Ò¾#ñD¿6	!5û\îw¿fÌ˜a‰„eYö\ÏyH0	!5û\Îw¾¾ñoB\"í¥ûó\ëu“P³¥K—†;\ï¼\Ó i‡\Ä?\å\×o\Ï,s\\•_Ÿ3fÌ§MFHÀE-Y²$Ì;\× \éì‡¸*Ë²÷óp\èË¯þøö\ßó\\[LKHÀE}\ë[\ß\nw\ß}·A $Òºñ³D¼Nwvv~Ê¤„\\Ô‚\ÂÂ…\r!‘\Ø]‰üº\ÐÝˆS0$ó\æ\Í‹/6„Dz1ñ£ó…D–e×˜€!™3gNøö·¿m‰\ïJœkD|¥¸\é	²;\î¸#<ò\È#HP¹\\~|pH´µµe&#$`\ÈfÎœ–/_n‰Dy‚c $~c\"Bjrë­·†•+W\ZB\"\Ý%Ž™!ÿ³‰	¨\Éô\é\Ó\Ã\ÓO?m‰´\ïJü>3pao¼ñFØ»wo8|øð‡n\êÔ©a\íÚµ†ƒH\Ä¾ð…?.‹óÎœ%ñv~´O\âT~½“_\Û\âŠŽŽŽO˜š€Šû\î»\ïB\Ð\ÄMVaüøñg…‰\Ö¼Ž§U\æqpò\"‡Qu\Åó&²,{9›mŠB‚\Ä;v,\ä\"üÐ¸ë®»\n!\Ñbw òx\îb\ßûC¼¶¹C!$H\Ü<pÁŠ¸üB¢5Œ;öK¥R\éø\à\ïó¸7jÅŠaûö\í\áõ\×_Ç¯\Ì1þñ­·\Þ\n?ÿù\Ï\ÃSO=Uyª\ë\çL¼_(¾fºB‚D\ÅPˆ›ª\Îñ¸l-³²«­­\í¬§\â¹11N:5\ä\Ù\îÚµ«òb¿Á\ï\â\Èý¦,$HT\\¾8WH\Øhˆ¨^ÊˆûŸ6n\ÜXS@ö\ÜsÏ…ŽŽŽÁw\'Ä„ E½½½‰ˆeË–B¢E–3òˆ8]½Œñ\Ë_þrX\æ¼ÿþp\Ë-·œug\Â2‡ Q\Õñw+\'Nœ0„Dl¬¬\Þ#\"\îyNñ×«þüˆ{&lÀ$h÷\î\Ý~,]º\Ô@­±¤ñ\\õo†\ëNÄ¹\îLZ\æð\Úq!AŠ\âaTñC\àÐ¡C†hrñœˆ\ê}qOÄ¥÷LT/\Æ%?\ê…-*.[¬_¿>\Üs\Ï=¡»»»r\èTõ@üð\é\ê\ê\nw\ß}wø\Þ÷¾W9o„Ds‰‡MU?qò\ä\ÉK>÷Ù³gW/q¼\ìG½ \Å8p òH\ç\àp¸\Ø\Ã\âö\Ûo¯§\rB¢9öFTŸXñ¼ª—H\ã	˜ùu•÷B‚¹\ÃŽ“\ì\â]\nw(£~oÄ‚\ê\r–<\æY«\êC«\â»9ü¸4¹ø;„‰\'†\á<É®½½=ôôô.Bbô.kül\àûu\åÊ•—uö«W¯>\ëm?\î…Mló\æ\ÍY\Æ®“\ì\âi˜\ÞŠµ!ñöÀ÷jü\Í\Â\å?_ª>\'Žøq/$hâˆ¸\'Ù‰	„\Ä\è“ÿ\0ÿpÄ›o¾yYg\ïhV¿‚Ü{!AŠ\Ë1.\ÇIvñÎ„e„Ä¨»#ñ\á÷\èÀ²\å\å¿^õ\×÷\ã^H\Ðd\â\Æ\Ê\ê=—\ã$»¸g\ÂL„\Ä\è‰‘ $„M,>1\'\Ù\ÅpG\Â	!A‹\çDŒ\äIvqI„„=öH	šT<lj$O²‹‡VðÔ†§6„M(î¨~\Ôs$N²‹wCŽ9\â_Bb\äC\Â9Bj\Ã\r\'\Ù\Åws€ñ¥\Å#õy0c\Æ\'[\n	šQ|\×høH<B„\ÄÈŠ\ïÚˆû¼kCHÀÅ·xŽ†5\Ñ\Î\ÎNÿ2£cy£§z\Ï\Ô\å¸+Q}®·\n	šLõþˆ‘Ü¥÷I€ycÆŒùtþ=yz¤ž\â\Z;v\ì—ü¨4‘\Ñô\Ü8‰Ñ·\éòRŸ+3\è\å€=¦/$h\âHñëƒø¨ŽŽŽOdYöþ¥>\éö\æ›o®^\Òx?~]\Ó¸#\áŽB¢\n…¯U/q÷»wª#\"~øõL]HÐ„\ì‘\0!q˜¸³:&†\ëmÀƒ–3\âÝˆ¦-$hRž\Ú\0!QKL<Í±k×®šfñœ?þY]!$hrÎ‘\0!1”eŽ\ê=\Õ\ËñscÇŽ•;šË£ññŽcŒø}^}\ØTõž\ËB‚°fÍš0\ZN²s²%BbôoÀ¬~š£Á«\Ç\ÆJ!A‹ˆ\ïÚ¨~ó§wm $¸x\ÎD–e/VŸ€9”+žX›Ê¿\ßÿÁ…-æ®»\î\n#y’·\"$šO<NûÌ»9\â]Š·«_A^u\Ôõ‘ø®ø\î\Ç^	ZØ\â7}©“\ì\â\Ý	 $hbÕ›./\çIvñn	4¹cÇŽ…öööp9O²‹_/~] $h===g-q\\Ê“\ì\â×‰_„	ZÈ†\rÎŠ‰Ku’\ÝÚµk\r!B‚bb8O²‹¿®ˆ@H€ eŽ\ê=\Ãq’]üõ,g $@Hˆ¸²úiŽF®øt†•	$(ž31gÎœ³NÀ\Êÿþx\ØToo¯!\"$@Hºxœv|7G¼K\ß\ZZý\nòpˆoñŒ/\àŠ\ï\Îp\ì5B„€\0!€\0! $@H\0	\0B„\0B!€\0! $@H\0	\0B„\0B!€\0! $@H\0	\0BBH $\0 $\0„	\0!B@H€\0@H $\0 $\0„\\\æ8~ü¸\ïv€a\Ö\×\×wZH\Ðò®¾ú\ê\Ó;v\ìð0\Ì^|ñ\Åcù\Ç\ìI?ihi\×^{\í\Ë7\Üpƒ\ïx€aö\ÉO~ò\Ýücv›Ÿ4´º«>þñð¹\Ï}\îôö\í\ÛO÷õõù\îh`9#Þ‰8\'\âg¬3$ùµ\å\Ìÿ\éƒ\Ë\år¹\Zº\ârFˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Zöÿ\Þ)Ë¹‡(ž\0\0\0\0IEND®B`‚',1),('70007',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.Entrust.png','70001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0\'`IDATx\Ú\í\Ý\r””\Õ}?pjmŽµ\ÖZ›6M\Óüm\Ú\Æþk\Ó\Ô\Ö\æ$Ç“ZrL­&µ\æ˜Ù™eu=\"\n(AP ZM”h£4Š\ï‰\ÆDM\Ôh\ÌE)¢4øEÀ7^\ç“\ÙÍ€¼3Ï²»óùœsÏ°³³/ü\æ\îýÎ½\Ï3÷\é\Ñ#É²\ìÀU\é\ßG¤ö=¶\"\Ýÿ¶qÿ©[||ð\Î<\0\ZB\nÀ\Ï¿\â×¦\Ûû\á\Ó\Ùm\ç^÷Øº“~ÿ\Ü\ë\æ-?\ë»3\×\r¿bÖš\ê\ã¹|Zº\É\Îúõ\ã\æ->iöÊ¸rÙ´¬\æqGW¿\ßQ[þ¬a\éû©8\0\ri\âŒ\×R`>ûÁ‚5)7F¨8cÓ‰\Ó7]1ý\å\å5Á|Çtº½\í\æg²—‡§ÇŽ¸\ê\Ñõñød‹g\Ù\Øx\Ü[Yv\îÈ«\ç¼s\Ës\Ù-co~\æÅ¶6\äò6\Åm\Û\ã\0 \Ñf¸û\ÎÚ˜]6ü\Êÿ\Ý³Û˜­þzvû\àú˜ý\Ö<\î€\Ônuýc\ë.¼ý¹ñ¸¢\Ùð+Ú\î\ïSó¸ýRûlÜ—Z\ïhgMœñ~õ\ßÿW\Åh¤zö¤‡ß¿t\Ê;oM_“=7,…\íÿûÁSk†ý\ÏÌ·¾˜½<\ì\ÊY¢g\ßõzöR„\ê˜\ÆñuCÓ¬7\Ý\Þ?,hÌ†c9}üù˜ÍŽ¸ò¡\Õÿuû\â…q,ø\ìI³W¥\ÛC\ãgYF Q\Ãö\Ø\Ô~>æ¦…k\ÎÿñK+#PÛ–\ßÌ²ù#¯}4f¶gW\Û\ë¬¬SVf“.Ÿ¶tù\Ø>½z\Ø¾7<r,G\ØVw\Ø9\×=¶,þýh–]\Úöoa@#\î\á—M_½\ì\Ü\ë[³\Ôs¯WYF¾d\Ê;o¹|úÆšm\Û\áßù\Þý\ä¹\çM1\Ë\Ý\âq\ía[ýx° \Ñ\ÃöŒ!¿^žõÃ§7½šnoýý\'\Ö\Æq\Ùs®™».\ÞT}\\qX5l\ãŒ\äôq\ßQ×¥€þŸ7¿b\æÚš\Ç}z\Ô\æa[œ›e†¦@Vm\0\Z1hÏY\ìˆI³\ßÿ¯;^~ò™uYký\É}\ïeW\Ä\Ù\ÇÃ¾û¿1c›\ÚG=ƒ–÷\ã—V¦\'¥6\ì–\ç²W\Ò\íŒ\ÙYvIºýPœ@5òš9o\Çòòµ¿\È~V}\ß\îÐ«\Î\î}1\Ë\ÆU\æ¾*@#…\í\ÍogÙ¼8{øÚ¹\Ù\äs¯›·n\äU¼?\âªGVŒ¸jöÊ¯\ïñ˜±Þ—Úœ‹~öF—=ð\êG\×,ú?36\r½lzo\Zzù•Û«\ç®_\Çh/`ýƒ¼7.\Ì\î8÷Ú¹ož=\é\áUq¢Tœ85ü\ÊYk\â\ç¨<\0l=™÷©\ë\ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ê.Ë²ƒ¦L™r\çÄ‰WM˜0aÓ°aÃ²\Ö\ÖÖ¬©©)kiiÉ†š3fýøñ\ã<ø,€ô\Úk¯5\ßx\ã+¾öµ¯eÌ®¿þú\ì\á‡\Î^ýõl\íÚµYX¿~}¶t\é\ÒlÎœ9\ÙM7Ý”\r0 ;\ãŒ36\Z5\êÁR©ôU€­\Ïd?2mÚ´\ågžyf–f²\Ù\ã?^	Õµp\á\Â,Í‚³~ýúei<^E`‹\Ù\ìw¾óMC†\É\æÏŸŸí‰§Ÿ~:<xpvúé§¿\Ñ\Ú\Úz\ê\ÐðV®\\9xÌ˜1\Ùe—]–­X±\"«‡XnŽ\ï7hÐ w,+\Ðð3\ÚÚ‹.º(Û°aCVoW\\qE\Ìp\ß\êÙ³\ç~ª\r@Ã‰c´±t3\Ð<‚¶\Íÿ÷g}ûö]¤\â\04œ8*Ž\Ñ\Ök\éx{K\Ê\ØT*•†¨:\0\r#–\ã¬\ã8\ã¸#\ÄIS\Í\Í\Í¿ a\Äûh\ã\í=\éüó\Ï_\ß\Ô\Ôt·\ê\Ð\í\Å\ÎP±aEG\Íj\Û<õ\ÔSYšÙ¾\ïd)\0º½û\î»\ïg±3Tž\'EmKkk\ë\Æb±\ØÏ³\0@·{\ÇŒ{Ã¥—^º¦©©i¦g€n-.*{\ï\r=ôÐ†¶¯x\0\è\Ö\â\ê=qQ½aùò\å›RØ®ó,\0Ð­\Å\åñÚ®\Þ\Ó\Ñ\â\Âq‰>\Ï\0\ÝZ„\Ý\Þ$l\èöN:é¤½9³\Ý$l\èö\Î:ë¬½v\Ìv\éÒ¥\ë³ \Û;vìº½u6ò”)S–:€n\ï¼ó\Î[´·\Þg;fÌ˜%\Þg@·7xð\à“°WvŠ\í\Z\í @£\îÆŽ\Þyö\ìÙ±„lod\0\Z\Ã\èÑ£¸ø\â‹;4lû÷\ï¿\ÄU\0h­­­zê©›.\\\Ø!Aû\È#,Y­\ë\Ù\ÐP\Î8\ãŒ1qù+V\ä\Z´kÖ¬\ÙX.—×§ ¢\ê\04œ¼~é¥—\æy²Ô¦ô3–‹\ÅT€†\'+¥\îò‰\'\æ¸›F\Zõr¼¯6–­U€†\Üþýû/ýö·¿­^½ºnKÇƒ\rŠ¢^qœ\0ª\Û\Ò\Òò\Âi§¶iÁ‚{|2T£¥c3Z\0\ØBœ\ÄÔ·o\ß\rcÇŽ}?BwW––\çÎ»,ŽW\Ï:v2\0lK\ÌFÓ¬ôÖ˜žxâ‰›&L˜°fÆŒ–,Y²1®G\Ûvõž¸¨À½÷Þ»<¶`Œ¡\"d\ã}´–`¤ðlImjj‹R\0¯‰\Ë\ãÕ´uqL6µÙ±£¡\0 ~œ7n_•\0€\Ã\Ö,\0r\Û>}ú \0c\ØzK\0\ä¶---¢\0_\Øn\êÕ«\×GU\0r\Û\Ô>®\0cØ¶´´|B%\0 ¿°\ÝX,U	\0\È1l›››S	\0\ÈI©T\ÚøÕ¯~õ\Ó*\0ù\Íl7¤ö*\0ù†\ígU\0rR,\ß\ïÛ·\ï‘*\0ù\Íl\ß/\nG©\0\ä¶\ëS\Ø~A%\0 ¿°]W,Q	\0\È1l\Ë\åò—T\0ò\Û÷\n…\Âñ*\0ù…\í\Ú4³\í¥\0_Ø®)‹}T\0r\ÛR¢\0“4«]²¶¯J\0@~3\ÛU)lOV	\0\È/lW¦\Ùm?•\0€œ¤Y\íŠ\ÔNS	\0\Èofûn\nÛ*\09)‹o§À¬\0“4«}«P(U	\0\ÈIšÕ¾™\Úp•\0€ü\Âvyj#U\0ò\Ûe©V	\0\ÈI±X\\Z.—Çª\0\ä7³]’w¼J\0@~aûzj¨\0\ä¶‹Sû¦J\0@NŠ\Å\â«\årùb•\0€œ”J¥W\n…\Â%*\09ijjZ”f·—©\0\ä¶/¦6Q%\0 \'iVûB¹\\¾B%\0 \'¥R\éù¸“T\0ò\Ûg…Âµ*\09ijjz&µT\0òÛ§Rû¾J\0@NŠ\Å\â\ÂR©t“J\0@~aûD¹\\þ‘J\0@Nššš¤À½U%\0 ¿°Ÿ\ÚOT\0ò\Ûy©Ý©\0“b±8§T*Ý¥\0“´\n…Ÿ©\0ä¤©©ivj?W	\0\È/lg¥v¯J\0@~a;3µ©*\09)•J3Š\Å\â4•\0€üf¶¤6]%\0 ¿°\ZK\É*\0ù…\í½q’”J\0@NŠ\Å\â\äxûJ\0@NJ¥\Ò=)pV	\0\È/l\ïŠ-U\0r!ˆ‹¨\0\ä¤P(Üžf·¿P	\0\ÈI\n\Ú\Û\âò*\09)—\Ë?*‹O¨\0\ä$\ÍjoNa»P%\0 ¿°½1µ\'U\0ò\ÛR{F%\0 \'…B\á\ÚR©ô¬J\0@NR\Ð^f¶Ï«\0\ä¤X,^™\ÂöW*\09IA;1µU\0ò›\Ù^–\Âv‘J\0@NJ¥Ò¥)l_V	\0\Èof;!…\í+*\09IAû\Í\Ô«\0\ä¶¤öºJ\0@N\Ê\åòy\Åbq‰J\0@~3\Ûq©½¡\0_ØŽNm™J\0@N\n…Â¹¥Ri¹J\0@~a;\"\Íl\ßT	\0\È/l‡¦™\í[*\09I³\ÚÁ\Åbñm•\0€ü\ÂvPj\ï¨\0\ä¤P(œ^*•\ÞU	\0\ÈI±X\ì—f¶+U\0r’fµ\'§°]¥\0“´-\Â\0ò\r\Ûrj«U\0rR,û¤°]£\0“r¹\Ü+…\íZ•\0€ü\Âö„4»}O%\0 \'iVû\åÔ„-\0\ä%\ÍjIa»N%\0 \'½{÷>ºT*­W	\0\ÈI\n\ÚM3[a\0y\éÛ·\ï‘\Åbñ}•\0€œ¤Y\ígSÛ \0“>}ú!l G\årùð¶U\0\ê$v‹J-\ÛA{E¥\0`7•J¥w¶…B\á+*\0ù\Ín©\0\ì¡b±8a[a\Û\Ü\Ü\\T!\0¨\Ï\ìv\åV\Âv‰\Ê\0@ý\Âvô–a[*•ª\0\Ô7pß­	\Û7U\0\ê,\Íd‡\Ô\Ìj‡¨\0\ä8»U	\0\È/lG\n[\0º¬,\Ëö{\á…^™={vvÿý÷g÷\ÝwŸ¶m\êÔ©Ùƒ>¸)µ+ô*}\\6ƒ\ÐÌ™3³¥K—f\ëÖ­\Óö -[¶,›>}ú¦4(MÐ³ôq}h¯ö\rBõŒ\Ò,`ž¥\ë\ã@»XV3€Ô·Å’›ž¥\ë\ã@»ø£1xˆôqM‡N0­z\çõ\ì…9\×g§~£\Ò\â\ßqŸ\Ç@¤\ë\ã@¢•o/\Î~9eL¶\àž³7kq_|\Î\àc \Ò\Çõq`¢W\ÞõA¨­½ºðnƒH\×Ç=ˆžz\à[\Ûˆ\âs‘>®{8ýò¾q\Ûˆ\âs‘>®\"‘>®\ë\ãÐ¹¢83s[Q|\Î\àc \Ò\Çõq`¢\çfM\Ü\æ@Ÿ3øˆôq}\ØÃ\è\ÍÅg¿¼w\ì—\×\Ò}ñ9ƒH\×Ç=ˆ¢½8÷ûˆ\â>H\×ÇzDï½—=÷\Ð\\^K÷\Å\ç>\"}\\ö` Š\Ýsžuù6g\Å\ç\ì°c \Ò\Çõq`w¢ôjþõ\ç¦eOLµ\ÍA¨­\Åc\â±f\0\"}\\vr \Ú\Ñ+}3\0‘>®\ëY°‡\ÑÎ¼\Ò\ß\ÞÀ@d \Ò\Çõq`\Ñ\îBm\Í@d \Ò\Çõq`‘f \Ò\Ç5}D\"ôq}D¢mkjjjI\í5½O¶` \Ò\ê<UCvIjY4½O¶` \Ò\ê4m²\ÂV¶` \Ò\ê4‹\Å~±\\¼e\È\n[}|k\í½.´a†°a\Û)¢­\Íd…m\ãöñ\Ò^x![½zõV?ÿ\ì³\Ïf\Í\Í\Í]&p…-ì…\è\ïþ\î\ï\â\ïmð\àÁ\Ûýº{\ï½w³\Çÿ\Î\ïüNöÑ~4û\Îw¾³[¿\Ç\Ïþó\Ê÷¹þú\ë;C\Øj¨\í­>\á9r\ä\È\ì€¨<þþè²\ÓO?ý¡z\Í5\×d¥R)[´hQ\å\ãü\à•\Ç\ßyç»ý;\×þ=\ÄÏ»ú\ê«+\ßW\ØB\r\Ûøcž0aBv\Ì1\ÇTþ¸\r\ZTùx\êÔ©\Ûýº)S¦Tÿ\å/9»øâ‹³o|\ãÙŸÿùŸW\î{þù\çwù÷xúé§³Ñ£Ggs\ç\Î\í¯ú…Âˆ4Ð¯4³m\Ü>>s\æ\Ì\Ê\ã\ã\ë\"\ì¾ô¥/U>þ\ÉO~\Òþ˜U«Ve§žzj¥O|÷»\ß\Ý,l\ï¸\ãŽ\Ýþkÿz\è¡\Ê÷‹\ßY\ØB_b;vl\åzÆŒ›\Ý\Ë-·dÿôOÿ”\í¿ÿþ\Ù\ç>÷¹lö\ìÙ›…\í…^\Øþ\Ø3\Î8£r_Rññ\ÙgŸ}ø\Ã\Îþøÿ86lX¶fÍš\ìóŸÿ|v\ÔQGµ\Íü\ÇdGqD6mÚ´\ì/þ\â/²\Ûn»m›_û\Ïÿü\Ï\Ù\É\'Ÿ\\ùüð\á\Ã+ÿ\Å/~QY\â‹G\è\çp‚\Ô\è\Ô\Þ¶\×\Ç\Û\Âö¸\ãŽ\ËfÍš•-^¼8»ò\Ê++÷Ož<¹\Ò\ç¾õ­oµ÷‰ô-{\íµ\×\Ú\Ãö\ßÿý\ß+}ø_þ\å_*3\Õøž7\ß|s\å\ëúõ\ëW™)ò“Ÿ\Ì&Mš”ý\í\ßþmö‡ø‡•\ß1Wû÷pø\á‡W¾\ßÁœ]~ù\å\Âº\Û@Ì¾û\î›v\Øa\Ù9\çœS	¾ho¼ñF{\Øþ\Í\ßüMe0Š\0ý\í\ßþ\í\ì\ÐC­,{Å€ŸcYm!|\íµ\×f_ÿú\×+ÿŽ\ïý\ä“O¶/\ç\Ýs\Ï=\í\Ëf\ÛúÚ–––\ì÷ÿ÷+³‰¿þë¿®\Ü\É%—Tfµ!Ÿ\Ç@T\é¾+l§\Ç\ç¿ø\Å/¶/;ÿÙŸýY\åE^ô¿˜\Ý\Æ}šµ/\Âbö\Ù¶ù—Yyx\È!‡dú§Zù»ˆ°Ž\ÏE¨Gß\Ç\ßM„vüññ\Ûo¿½\Ù\ßC¼ðlý<û8°—¢s\Ï=·r_\Ûr\Ûøñ\ãÛ—\ÑjÃ¶-øb†º|ùòö™g\Ü7t\è\Ðö€\ãZ±Ä¼\Ï>ûd\ÈF\ZU¹Á‚›\r.\Ûú\Úÿø\Ç\íÁ·¿û»¿›ý\çþg¥\Å@XTvbS‹˜\é®\ÔûºcE\åG?úQÖ·o\ßJ\Ç\ç\Î<ó\Ì\Ê\çcfºµC¸ñ¸oûÛ•\ï‡X\â\ã|°=lc6Ÿ\Ûo¿ý*ÁÿŽþŸ‹®jÿ,#C7ˆ\âä¶Yh||\ÑEµµ\Ë\ÈñJ?Œøx\âÄ‰•Çžt\ÒI•O9\å”\Ê1²hmK`ñ\n=®X&;ò\È#+÷\Õ.\Ûú\Úw\Þy§²\Ô\'b\Ål$\Ê<0û½\ßû½Ê‰+\"}¼ž}<ú\Ü\ßÿý\ßgs\æÌ©|\î\Í7ß¬„\ã?ü\Ã?T\Âö3Ÿù\ÌVÃ¶µµµ\Ò?\ÛNŒ\Ùm|\Ï\éÓ§·‡m\Ûÿ\ëþ\à*Ç‚\ã\ßm/,Ÿy\æa4µýÁ\ÇqWú\Ä\'>QY\Æ}\å•W>p\Ì6ˆ8k3\Â0þÝ¶”6bÄˆ\ì†n\È>ö±eW]uU\å±mKp\Ñ\âL\Î-\Ãv{_{\Â	\'´/\Ã=ò\È#\í\ß\'Ž¡ˆôñzöñùó\çg¿õ[¿•}\êSŸªfÖˆ\Ç\Æ\áŒx \ëÕ«\×6Ï Ž3 c\Å\'Vaby8^\\®]»v«a\'n/l\ã$©¶Õyó\æ\é\ã\Ð\Ý¢¶WúqbF|.f”w\ß}÷foý©=A*^\É\Ç}\Ç{leÚ»w\ï\Êñ¨x•ô\ÑGWŽEµ-\ÍÅ²o4m÷Õ¾\Õa{_Û¶„³\ÚX6ŽP\â÷\Û\Ö{ \rDúø\îöñ¶Y\é§?ý\é\Ê\ç¢/~\á_¨¼\Å\ç\Æo\Ü\îÛ•¢ÿFˆFŽœx||¿ôÚ°=è ƒ>¶±Œ\\û÷}¿\íLÿ8YP‡.<\í\èý†¯¾ú\ên}mg\ÛqÜŽüZ‘>^\Ï>g\"¯\\¹r³3\ï·Ø˜y\Æýq\ÎÁy\çW9ý7^\\\î\é\ï/&w÷oP‡.2\Ù7}ü7-fš1;Žû\âý°K–,©ü{Ì˜1ú8ˆ4‘>žW{é¥—*g\ë\ã` \ÒDúxN-–‹\ã\ìy}DšHÏ¡\Å[\ßn½õ\Ö\Ê1\Û+V\è\ã` \ÒDúx=[¼ý,6¹ˆ÷À\ÆITú8ˆ4‘>^§öò\Ë/g\\pAv\ÖYge=ö˜>\"\Í@¤×«\Å2ñM7\ÝT¹\Ò\ÏOúÓº¼­G‘°E¯¹\ä\ÞÀ³\Ë.»,[ºt©>\"\Í@¤×«\Å%\ã±}\èO<¡ƒH3\é\ãõj±ƒYl—KÆ±}b\ìm¬ƒH3\é\ãuÚºñþû\ï\ÏN;\í´Ê…:z\ËP}DÂ–n\Ý\Ç\ã\"\0±\íb\\ ¶b\Ô\Çak \Ò\Ç\ë\Ô\âZµqÇ˜\Í\ÆÏŒÙ­>[‘>^§%\ã¸r—k+·]\ÊQ„­H¯C[¸pav\Î9\çd\ãÆ\Ë~õ«_\é\ãÀ\Ö\ÅI\Ò@¤\ïZ[¶lY6q\â\ÄlÀ€¸¼>|ÀÌ™37v\å7\×w¶öê«¯.J\Ñ:=«{öñ\Ø\í\é\î»\ï\Îú÷\ïŸ}ÿû\ß\Ï\Þ}÷]}Ø±iÓ¦]0}úôMo¼ñ†°¬\Ã 4u\ê\Ô÷S› gu¿>>þülØ°a\Ùù\çŸ_¹ö¬>\ì’ô‡3>½R]KCµÅ¥\Ç:ó\ïWm\ëBÝ¯\ßy\çÙ¨Q£²~ýúUN€\êýPv]Ÿ>}>\Ô\Ô\Ô\ä\Ý\ïHýnJjS›ž>>XU€\î>\è	[:L\êocR[Ÿ\Ú\ë…B\á(\Z!l¶t„\Ö\Ø\ÔÖ¥6ZE€†Ñ«W¯¦o“J\çºR©4#–Œ‹\Å\â\äXMQ ¡œr\Ê)‡¤PØ’‹°\ßL\íý\Ô¥=BE€†\Ô\Ú\ÚúIaK³\Ùc\Ólvy\nÙµ\évˆŠ\0\r­¹¹ù°X\ÞS	\ê!\ëGR{$µ…B\áöž={\î§*@\Ã+—Ë‡[\ê!õ£‰©mH\í¹x§\"\0¿ ?¤J°}¨wj\ï‹\ÅÕ©õS€-”J¥\Ï\Ç	,*Á®Š“\ëR\ßYPÝ˜\â\Æq\ã\Æ\í«*\0[Q(¾¨»`Ÿ\Ôgnˆ\ã²\éö—i6ûWJ°i <&6P	vò\Å\ÙI©¿¬JA»\"µ’Š\0\ì„4p~9µ÷T‚¼(;4µ§\ãø~º³[U\ØI\år¹W¼R%Øš¸PE\n\×[c\É8µ¹\'žx\â\ÇT`577§±´¸F%\ØRz6(µ5©½U(ŽW€Ý”f+}\ã-*A›x\ïu\ê/\ÆY\ê)d/Q€=Û“\ã„• ÿþû§¾pwõ­<³Ž?þø«\n@¤Aõ\Ô4³]¡\r\ßFV/}÷F\ïÞ½V€ú²q\\\î•hL}ûö=2=ÿ‹\ã½\Ö\éE\×x\ÈA\\‘%µ·U¢±´¶¶”öþ¸\âSºz\Üq\Ç¨*\0ù\Íl‡§ö¦J4Žr¹|^u&ûjjŸS€œ\n…sãº£*\ÑýÅ±\Ø®Kc“ô¼P€Ž›ÙŽIm©Jt_---’ž\ã‡\â,\ãô\Â\ê®8\ëXU\0:P,)¦\Ù\Î•\èžR¸^Z\Ýbñ…xÿ¬Š\0\ìÁø\Â4¿¦\Ý\îE\Ô	\é¹}+v€J·U`\ï\ÊÇ‰2*\Ñ=\Ä\Þ\Å)`\çU7¦¸%ö6V€½?³eÆ—U¢\Ë\Û\'®\ÆS\rÙ§\â*=J\ÐI¤ùò\Ô^R‰.ý‚)¬H\Ï\ã\Ê\ÔZT “I3 +\Ó\0ý+•\è’\Ï\Ý_¥¶°zù»\ëz¸\Æ,@§\Ù^“\Ús*\ÑuŒ7n\ß®7Å’q\n\Ûù§œr\Ê!ªÐ¹\Ãö†ÔžQ‰.ó|š\Ú\ê\ØÏº\\.÷R€®1xß˜Ú“*Ñ¹¥\ì§\Òóô|¼g6Ž³«@\×\Z\Ä˜\ï_ªD\çÔ³g\ÏýJ¥\Òq\\6=W§Û¨\n@“\ï\Ûâ¸ŸJt>…BahznÞ‹½«ûô\és¬Š\0tÝ°½#\rè©D\ç\Ñ\Ü\Üü™¦¦¦E©½Ÿ\Ú7U \ë‡\í])l\ç¨\ÄÞ—f¯¤pRÝ˜bzúø`U\èa{OT‰½«zõ¥õ©½^(ŽR€\î5\È\ÇL\ê!•\Ø;\"X#`S[—\Úh\èža{jªDÇŠ%\âR©4£º1\Å\äXBV€\î¶\ÓS{@%:´\æß¬žü´(…\ì*\Ðýþ™©MU‰™\Ío\ãIõ^›n‡¨@\ã„\íCq\ÜV%òQ¤öHlLQ(n*T Tw%ºG%r{13±º\Å\âs\Í\ÍÍ‡©@cÎº\æ¦\Ù\ÖOU¢\î!\Û;.^Ì¬N­ŸŠ\04v\Øþ\"–6U¢>\ârw)dT7¦¸1.‡§*\0f`\Ò\Ì\ëV•\Øcû\Ä\å\n\ã¸l\\\Ø!.\ì®$\0´…m\ÃUb÷\n…“RW¥ ]‘ZIE\0\Ø2lŸŒ\åN•\Øu\éEÊ¡©=\'@¥\ÛI1»U\0¶¶Ï¤\É\Øu*±óúô\éó¡Xz%\ã8Á\ì\ÄOü˜ª\0°½°}>\Æ\Õ*±\Óõ\Z”Úš\Ô\Þ*\nÇ«\0;”fh/”\Ë\å+TbûRO/J^ŒmS\È^¢\"\0\ì\ÊL\í¥\Ô.W‰­\ëß¿ÿþ©>wW\ß\Ê3\ëø\ãÿ°ª\0°«aûrš±]ª[­\Í\È\ê¥\ï\Þ\èÝ»÷\Ñ*À\î\Ê\âb±x‘JüFß¾}Œº\Ä\Å\ÜSmÆ«\0{\Z¶q\áòT¢G\Ö\ÖÖƒ\âú¾)`7Å•Ž;\î¸U€z„\í³·\Ê	P\çUg²¯¦ö9=€z†\í\Ò\Ô\Æ4\êÿ?ŽÅ¦p\Z¼W(F\è\0\Ô]\\\Ì<…Ì¹öÿniiù“\êµ|ccŠ»\â¬c½€¼f¶o¥°\Ö`/0.­n±\ï1>\\/\0 W)p\ÞNÁ3¸þ¯)XOHAûV\ì\0•nzöè¨™\í»\Ý=xb\ï\âôÿœWÝ˜\â–\Ø\Û\Ø3@G\ÎlW¤\0:µ›þ÷ö‰«ñTCö©¸Jg€½1³ë°ž\Ü\Ýþ_¥_‹+SkñL°7\Ãvuj\ån4Sÿ«\ÔV/—tY\0özØ®I\áÔ§«ÿ?Æ·o\n×›b\É8ý\æŸr\Ê)‡xv\è,a»¶P(|¥‹ÿN­\Î\Ð\ß)—Ë½<«\0t¶ z/µ/w\Å\ß=\Í`?•~÷\ç\ã=³.@g\Ûu)´Ž\éJ¿sÏž=÷+•Jw\Äq\Ùô»?œn?\â™ 3‡\íúVÿ\ÚU~\ßB¡04\ì{±\ÍdŸ>}Žõ\ÐÙ‚uQj\ÙVZ,Ã¾_m\ïÆ¥\æ:\Û\ï\Þ\Ü\Üü™\ê\ï¿\ã7=›\0tJ\årùK\Û\Ûö–f·v¦\ß9\Í^H¿×”\ê\Æ\Ó\Ó\Ç{&\è\ì³\Û\ç¶´q´3\Íj\ã\Ò±\Ì¸/\nGyö\0\èò³\Û\Î2«`€“·R\íY Ë‰K\Ëm\í¸\íÞž\Õ\Æqš]Ï¨nL19–=[\0tI±‰\ÅV\Âöš½ù;\ÅIOÕ“Ÿ¥=Â³@——Bíµš\å\ã\Õñ\ÞÕ½4›=6\Þ\Æ;Y¥\Û!ž\0º°ýjNŒ:¿£~lD‘\Ú#qRVšiß¾·\Â\0òž\Ý.‰°=þø\ã?\ÜÁ?wbõ½½\Ï577\æ™\0 ;‡mK¯^½²¸bNý¼\Þq±€X¶Ž™µg\0€F0\"µ,µñyþ¸\Ü]\n\ÙÕ)n\ì¨p€\Î´›R{¬z›G\à\î“\Âõ†8.›nvWv\0\Z-h\Ûvt½·P(œ”vU\n\Ú©•”€F\ÚÝ¿K\Ò\ìõ\ÐÔžŽ \Òí¤˜\Ý*9\0‚öƒŸ\ß\å-ûô\éó¡\Ø\î1–ŒS›{\â‰\'~L¹´[·\ËK\Êi;(µ5©½U(ŽWj\0\íŽE\àn\Ü\Ñ·\\.žf±/\Æ6‹)d/Qf\0\í®\ÝÆ­}]ÿþý÷O{wõ­<³:zS\0\èA»\å×·\ÏpS¸Ž¬^ú\îÞ½{­\Ä\0\Ú\ßmœ|uŸ¼\å\ã*\Çp?þñ_—vq\\Ì½X,ŽW^\0\íƒö™¿\Þ-\ê™\í\îV·ÿþû;\á„²/~ñ‹¿:\î¸\ãT^\0\í—Ž¯®h¶À­\rÚ¶6©\í“¸=ò\Ûi\n\0ºt\Ðn+HkwGŸoS÷¦\0 ;\íŽwß\ÚÚŸ³Q\à hw>p\×\íB\Ðn¸£•\0A»s»+A\ÛÆ’2\0\r\ájH.\ÜÅ¯\Ûw+3\Úu\Õûw\Å\ä\ê\×\â©\0 f¶;»¤[\ï™í…ž\0\Z)p;\ê˜m\Û\ÞÉ–¸;\Ú\Ý=y·.\Ã\0\Ý%p·v–p½\Þg\Û\Ò\ÃY\È\0\Ð~,µ6÷x©š\í%€:\ï,h`û3\Ü\ÚÀ\Ôc\ç®úSû8\ï§€\Ìp÷\ä« €sO/<\0\r7\ÃÝ•\à´\0°›3ÜYRn\é\ád(\0\Èm†\ÛvŒW\Ð@»µ÷\ç\0{¸£k‚\Ö\ÎP\0Pgm3\Ù\é=\\½\0ò›\á655e‚\0rT\r[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0r\Ö%®;h«T\n\0v?l[v¶\Åbq¼JÀž\î²\í„\íÊž={\î§J\0\Ó\ì¶T*]¨B\0PŸÀ\ÝÚ±\ÛUfµ\0\ã\ìÖ±Z\0¨\à¾fV\09J3\Ù~5a;ZE\0 Ÿ\Ùm\åØ­Y-\0\ÔAj\Ì`S›Y}ûÏº-Ž\ÛnH\í\Í\Ôf—\Ë\å+Z[[R5\0\Ø	_ý\êW?tz\n\Ðõ;±{T\íÛ€6‹Å…\éöóª\0Û˜É¦°œœB6Û•\ÝF›m¦\05z÷\î}tš‘®\Ý24˜Mš4){øá‡³Å‹gk×®\ÍB\Ü.]º4›7o^ö½\ï}/2d\ÈÖ¶q\\S(¾¢º\04¼8Ë¸¹¹ycmPž}öÙ• Ý°aC¶³\æÏŸŸ\Z5j\Ë\Ð\Ý\äý¸\04|\Ð\Ö.§\Ð\Í\î¾û\î]\n\Ù-Mž<9kmmµ\0\Ä\Òq\n\ÚMµK\Æ\Ï>ûlV/½ôRv\æ™gn6Ãµ¤@C‰“¡j\ÑF\Ð\Æ1\ØzŠ\ïW¸q\×IS\04Œ8\ë¸v\é¸^3Ú­\Íp·XR~Tõ\èö\â}´µ\Çi\ãmž\ân\íñ\ÛX¾ö,\0Ð­Å†µg¯_¿>\Ë\ÛÈ‘#k—“z\0\è¶\âXm\í\ÎPñöžŽðø\ão¶\ÓTjñl\0\Ð-\Å[pjOŠÚ“·ø\ìªÚ/b/e\Ï\0\ÝRõ¢•À»\æšk²Žt\ÓM7m¶£g€\î\Z¶\Ë\Ú/¶`\ìH±d]³”ü¶g€n)…\\ûñ\Ú\×_½C\Ã6\Þw[{y>\Ï\0\Ýuf\Ûxm\è(ñój¾g€n¶{ƒ°À\Ì\Ö\Ì\0öŒc¶\0ÿ\Ì\Ö\Ù\È\0s\ØzŸ-\0\ä)\Í(/\Ü[;H}\ík_³ƒ\0\Ý_\ì\ÇK\í\09Šk\Ê\Ö^õ§#f·£Fr\Õ\0\ZG\\\Ï6…\Þ&×³€|g·\í\'J577g\Ï>ûl.Aû\ÒK/e\'tRm\Ø>ªú\04„\Ö\ÖÖƒŠ\Å\âšÚ“¥\â}°õ~_\ígœQ»|¼&~®\ê\Ð0\n…\ÂWj—“#p\ë5Ãmm\Ð\ÆÏ‰Ÿ§\ê\04b\àŽ¨\r\ÜXRŽc¸{r\ÒT£\Ýb\é8fµ\ãU\0[Žq–òüùówù\í=cÆŒ\Ù,d\ãû\nZ\0øu\à~¥ön\í\Òr\ì45gÎœ\Ê^\Êm/ˆ\Û8&;C\ÕnXQ{Œ\Ö\Ò1\0Ôˆ“—j\ÏR\Þ\Ãö¨“¡\0`\â}¸iVúX\íNS;\Óbg¨Ø°¢\\.I`\'\ÄÖŽÕ½”c¶»¬öò|5\Û.¾ˆ½ŽmÁ\0\0\0\0\0\0\0\0\0\0\0\0\0\0@góÿû<ÿ·KG§«\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','72501',30),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10006','Entrust:4:7508','10001','10005','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-03 10:57:11.575','2019-06-03 10:57:11.585',10,NULL,''),('10007','Entrust:4:7508','10001','10005','submitEntrust','10008',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:57:11.595',NULL,NULL,NULL,''),('12506','Entrust:4:7508','12501','12505','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-03 10:58:39.272','2019-06-03 10:58:39.276',4,NULL,''),('12507','Entrust:4:7508','12501','12505','submitEntrust','12508',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:58:39.279',NULL,NULL,NULL,''),('17506','Entrust:5:15006','17501','17505','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:15.331','2019-06-04 11:50:15.333',2,NULL,''),('17507','Entrust:5:15006','17501','17505','submitEntrust','17508',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:15.335',NULL,NULL,NULL,''),('17515','Entrust:5:15006','17510','17514','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.844',1,NULL,''),('17516','Entrust:5:15006','17510','17514','submitEntrust','17517',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:16.844',NULL,NULL,NULL,''),('17524','Entrust:5:15006','17519','17523','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257',0,NULL,''),('17525','Entrust:5:15006','17519','17523','submitEntrust','17526',NULL,'ToSubmit','userTask','u20190604195011','2019-06-04 11:50:18.258',NULL,NULL,NULL,''),('17533','Entrust:5:15006','17528','17532','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.366',1,NULL,''),('17534','Entrust:5:15006','17528','17532','submitEntrust','17535',NULL,'ToSubmit','userTask','u20190604195013','2019-06-04 11:50:19.366',NULL,NULL,NULL,''),('17542','Entrust:5:15006','17537','17541','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:21.269','2019-06-04 11:50:21.269',0,NULL,''),('17543','Entrust:5:15006','17537','17541','submitEntrust','17544',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:21.269',NULL,NULL,NULL,''),('17551','Entrust:5:15006','17546','17550','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-04 11:50:22.656','2019-06-04 11:50:22.656',0,NULL,''),('17552','Entrust:5:15006','17546','17550','submitEntrust','17553',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:22.656',NULL,NULL,NULL,''),('25006','Entrust:7:22506','25001','25005','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:29:40.828','2019-06-05 07:29:40.830',2,NULL,''),('25007','Entrust:7:22506','25001','25005','submitEntrust','25008',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:29:40.831',NULL,NULL,NULL,''),('25015','Entrust:7:22506','25010','25014','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:29:42.141','2019-06-05 07:29:42.141',0,NULL,''),('25016','Entrust:7:22506','25010','25014','submitEntrust','25017',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:29:42.141',NULL,NULL,NULL,''),('25024','Entrust:7:22506','25019','25023','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:29:43.450','2019-06-05 07:29:43.451',1,NULL,''),('25025','Entrust:7:22506','25019','25023','submitEntrust','25026',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:29:43.451',NULL,NULL,NULL,''),('25033','Entrust:7:22506','25028','25032','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:29:44.651','2019-06-05 07:29:44.651',0,NULL,''),('25034','Entrust:7:22506','25028','25032','submitEntrust','25035',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:29:44.651',NULL,NULL,NULL,''),('25042','Entrust:7:22506','25037','25041','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:29:45.838','2019-06-05 07:29:45.839',1,NULL,''),('25043','Entrust:7:22506','25037','25041','submitEntrust','25044',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:29:45.839',NULL,NULL,NULL,''),('25051','Entrust:7:22506','25046','25050','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:29:47.369','2019-06-05 07:29:47.369',0,NULL,''),('25052','Entrust:7:22506','25046','25050','submitEntrust','25053',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:29:47.369',NULL,NULL,NULL,''),('27506','Entrust:7:22506','27501','27505','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:50:33.057','2019-06-05 07:50:33.058',1,NULL,''),('27507','Entrust:7:22506','27501','27505','submitEntrust','27508',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:50:33.060',NULL,NULL,NULL,''),('27515','Entrust:7:22506','27510','27514','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:50:34.347','2019-06-05 07:50:34.347',0,NULL,''),('27516','Entrust:7:22506','27510','27514','submitEntrust','27517',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:50:34.347',NULL,NULL,NULL,''),('27524','Entrust:7:22506','27519','27523','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:50:35.673','2019-06-05 07:50:35.674',1,NULL,''),('27525','Entrust:7:22506','27519','27523','submitEntrust','27526',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:50:35.674',NULL,NULL,NULL,''),('27533','Entrust:7:22506','27528','27532','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:50:36.859','2019-06-05 07:50:36.859',0,NULL,''),('27534','Entrust:7:22506','27528','27532','submitEntrust','27535',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:50:36.859',NULL,NULL,NULL,''),('27542','Entrust:7:22506','27537','27541','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:50:38.811','2019-06-05 07:50:38.811',0,NULL,''),('27543','Entrust:7:22506','27537','27541','submitEntrust','27544',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:50:38.812',NULL,NULL,NULL,''),('27551','Entrust:7:22506','27546','27550','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:50:40.003','2019-06-05 07:50:40.003',0,NULL,''),('27552','Entrust:7:22506','27546','27550','submitEntrust','27553',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:50:40.003',NULL,NULL,NULL,''),('30006','Entrust:7:22506','30001','30005','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:56:51.901','2019-06-05 07:56:51.903',2,NULL,''),('30007','Entrust:7:22506','30001','30005','submitEntrust','30008',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:56:51.904',NULL,NULL,NULL,''),('30015','Entrust:7:22506','30010','30014','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:56:53.445','2019-06-05 07:56:53.445',0,NULL,''),('30016','Entrust:7:22506','30010','30014','submitEntrust','30017',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:56:53.445',NULL,NULL,NULL,''),('30024','Entrust:7:22506','30019','30023','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:56:54.804','2019-06-05 07:56:54.804',0,NULL,''),('30025','Entrust:7:22506','30019','30023','submitEntrust','30026',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:56:54.804',NULL,NULL,NULL,''),('30033','Entrust:7:22506','30028','30032','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:56:56.003','2019-06-05 07:56:56.003',0,NULL,''),('30034','Entrust:7:22506','30028','30032','submitEntrust','30035',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:56:56.003',NULL,NULL,NULL,''),('30042','Entrust:7:22506','30037','30041','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:56:57.731','2019-06-05 07:56:57.731',0,NULL,''),('30043','Entrust:7:22506','30037','30041','submitEntrust','30044',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:56:57.732',NULL,NULL,NULL,''),('30051','Entrust:7:22506','30046','30050','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-06-05 07:56:58.915','2019-06-05 07:56:58.915',0,NULL,''),('30052','Entrust:7:22506','30046','30050','submitEntrust','30053',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:56:58.916',NULL,NULL,NULL,''),('70015','Entrust:18:70010','70011','70014','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-02 07:36:24.411','2019-07-02 07:36:24.414',3,NULL,''),('70016','Entrust:18:70010','70011','70014','reviewEntrust','70017',NULL,'ToReview','userTask',NULL,'2019-07-02 07:36:24.417',NULL,NULL,NULL,''),('70023','Entrust:18:70010','70019','70022','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-02 07:36:33.123','2019-07-02 07:36:33.123',0,NULL,''),('70024','Entrust:18:70010','70019','70022','reviewEntrust','70025',NULL,'ToReview','userTask',NULL,'2019-07-02 07:36:33.123',NULL,NULL,NULL,''),('70031','Entrust:18:70010','70027','70030','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-02 07:36:40.897','2019-07-02 07:36:40.897',0,NULL,''),('70032','Entrust:18:70010','70027','70030','reviewEntrust','70033',NULL,'ToReview','userTask',NULL,'2019-07-02 07:36:40.897',NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('10009',NULL,'participant','201906031001',NULL,'10001'),('12509',NULL,'participant','201906031001',NULL,'12501'),('17509',NULL,'participant','u20190604195010',NULL,'17501'),('17518',NULL,'participant','u20190604195010',NULL,'17510'),('17527',NULL,'participant','u20190604195011',NULL,'17519'),('17536',NULL,'participant','u20190604195013',NULL,'17528'),('17545',NULL,'participant','u20190604195014',NULL,'17537'),('17554',NULL,'participant','u20190604195014',NULL,'17546'),('25009',NULL,'participant','u20190605134344',NULL,'25001'),('25018',NULL,'participant','u20190605134344',NULL,'25010'),('25027',NULL,'participant','u20190605134344',NULL,'25019'),('25036',NULL,'participant','u20190605134754',NULL,'25028'),('25045',NULL,'participant','u20190605134759',NULL,'25037'),('25054',NULL,'participant','u20190605134759',NULL,'25046'),('27509',NULL,'participant','u20190605134344',NULL,'27501'),('27518',NULL,'participant','u20190605134344',NULL,'27510'),('27527',NULL,'participant','u20190605134344',NULL,'27519'),('27536',NULL,'participant','u20190605134754',NULL,'27528'),('27545',NULL,'participant','u20190605134759',NULL,'27537'),('27554',NULL,'participant','u20190605134754',NULL,'27546'),('30009',NULL,'participant','u20190605134344',NULL,'30001'),('30018',NULL,'participant','u20190605134344',NULL,'30010'),('30027',NULL,'participant','u20190605134344',NULL,'30019'),('30036',NULL,'participant','u20190605134754',NULL,'30028'),('30045',NULL,'participant','u20190605134759',NULL,'30037'),('30054',NULL,'participant','u20190605134754',NULL,'30046'),('70018','STAFF','candidate',NULL,'70017',NULL),('70026','STAFF','candidate',NULL,'70025',NULL),('70034','STAFF','candidate',NULL,'70033',NULL);
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
INSERT INTO `act_hi_procinst` VALUES ('70011','70011',NULL,'Entrust:18:70010','2019-07-02 07:36:24.403',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('70019','70019',NULL,'Entrust:18:70010','2019-07-02 07:36:33.123',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('70027','70027',NULL,'Entrust:18:70010','2019-07-02 07:36:40.896',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('70017','Entrust:18:70010','reviewEntrust','70011','70014','ToReview',NULL,NULL,NULL,NULL,'2019-07-02 07:36:24.440',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('70025','Entrust:18:70010','reviewEntrust','70019','70022','ToReview',NULL,NULL,NULL,NULL,'2019-07-02 07:36:33.124',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('70033','Entrust:18:70010','reviewEntrust','70027','70030','ToReview',NULL,NULL,NULL,NULL,'2019-07-02 07:36:40.898',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('70012','70011','70011',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190605134344',NULL,'2019-07-02 07:36:24.405','2019-07-02 07:36:24.405'),('70013','70011','70011',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190606171309',NULL,'2019-07-02 07:36:24.406','2019-07-02 07:36:24.406'),('70020','70019','70019',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190605134344',NULL,'2019-07-02 07:36:33.123','2019-07-02 07:36:33.123'),('70021','70019','70019',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190606171310',NULL,'2019-07-02 07:36:33.123','2019-07-02 07:36:33.123'),('70028','70027','70027',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190605134344',NULL,'2019-07-02 07:36:40.897','2019-07-02 07:36:40.897'),('70029','70027','70027',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190606171311',NULL,'2019-07-02 07:36:40.897','2019-07-02 07:36:40.897');
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
INSERT INTO `act_id_group` VALUES ('Customers',1,'å®¢æˆ·ç»„',NULL),('Staff',1,'å·¥ä½œäººå‘˜ç»„',NULL);
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
INSERT INTO `act_id_membership` VALUES ('C1','Customers'),('C2','Customers'),('C3','Customers'),('S4','Staff'),('S5','Staff');
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
INSERT INTO `act_id_user` VALUES ('C1',1,NULL,NULL,NULL,NULL,NULL),('C2',1,NULL,NULL,NULL,NULL,NULL),('C3',1,NULL,NULL,NULL,NULL,NULL),('S4',1,NULL,NULL,NULL,NULL,NULL),('S5',1,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('15001','SpringAutoDeployment',NULL,NULL,'','2019-06-04 11:49:32.248',NULL),('20001','SpringAutoDeployment',NULL,NULL,'','2019-06-05 05:41:31.246',NULL),('22501','SpringAutoDeployment',NULL,NULL,'','2019-06-05 07:24:19.689',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('32501','SpringAutoDeployment',NULL,NULL,'','2019-06-06 09:13:05.403',NULL),('35001','SpringAutoDeployment',NULL,NULL,'','2019-06-11 10:27:19.951',NULL),('37501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-16 06:57:21.527',NULL),('42501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-16 07:02:58.463',NULL),('50001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 07:31:13.625',NULL),('5001','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('52501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 07:53:59.662',NULL),('55001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:10:11.456',NULL),('57501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:29:30.127',NULL),('60001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:30:15.072',NULL),('62501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:38:10.254',NULL),('65001','SpringAutoDeployment',NULL,NULL,'','2019-06-29 11:55:04.995',NULL),('67501','SpringAutoDeployment',NULL,NULL,'','2019-07-01 09:31:55.119',NULL),('70001','SpringAutoDeployment',NULL,NULL,'','2019-07-02 07:35:10.298',NULL),('7501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:65006',1,'http://www.activiti.org/test',NULL,'Contract',1,'65001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:2:67509',1,'http://www.activiti.org/test','åˆåŒ','Contract',2,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:3:70009',1,'http://www.activiti.org/test','åˆåŒ','Contract',3,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.bpmn20.xml','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:10:50004',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',10,'50001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:11:52507',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',11,'52501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:12:55006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',12,'55001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:13:57507',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',13,'57501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:14:60006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',14,'60001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:15:62507',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',15,'62501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:16:65007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',16,'65001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:17:67510',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',17,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:18:70010',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',18,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:1:2506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:5:15006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',5,'15001','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:6:20007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',6,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:7:22506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',7,'22501','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:8:32506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',8,'32501','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:9:35007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',9,'35001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:10:52506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',10,'52501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:11:55007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',11,'55001','EntrustProcess.bpmn','EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:12:57506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',12,'57501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:13:60007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',13,'60001','EntrustProcess.bpmn','EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:14:62506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',14,'62501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:3:15007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',3,'15001','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:4:20006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',4,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:5:22507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',5,'22501','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:6:32507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',6,'32501','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:7:35006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',7,'35001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:8:37504',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',8,'37501','processes/EntrustProcess.bpmn','processes/EntrustProcess.png',NULL,0,1,1,'',NULL),('entrust_process:9:42504',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',9,'42501','processes/EntrustProcess.bpmn','processes/EntrustProcess.png',NULL,0,1,1,'',NULL),('myProcess_1:1:67508',1,'http://www.activiti.org/test',NULL,'myProcess_1',1,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL),('myProcess_1:2:70008',1,'http://www.activiti.org/test',NULL,'myProcess_1',2,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.bpmn','/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL);
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
INSERT INTO `act_ru_execution` VALUES ('17501',1,'17501',NULL,NULL,'Entrust:5:15006',NULL,'17501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:15.275',NULL,NULL,0,0,0,0,0,0,0,0,0),('17505',1,'17501',NULL,'17501','Entrust:5:15006',NULL,'17501','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:15.330',NULL,NULL,0,0,0,0,0,0,0,0,0),('17510',1,'17510',NULL,NULL,'Entrust:5:15006',NULL,'17510',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:16.843',NULL,NULL,0,0,0,0,0,0,0,0,0),('17514',1,'17510',NULL,'17510','Entrust:5:15006',NULL,'17510','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:16.843',NULL,NULL,0,0,0,0,0,0,0,0,0),('17519',1,'17519',NULL,NULL,'Entrust:5:15006',NULL,'17519',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:18.257',NULL,NULL,0,0,0,0,0,0,0,0,0),('17523',1,'17519',NULL,'17519','Entrust:5:15006',NULL,'17519','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:18.257',NULL,NULL,0,0,0,0,0,0,0,0,0),('17528',1,'17528',NULL,NULL,'Entrust:5:15006',NULL,'17528',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:19.365',NULL,NULL,0,0,0,0,0,0,0,0,0),('17532',1,'17528',NULL,'17528','Entrust:5:15006',NULL,'17528','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:19.365',NULL,NULL,0,0,0,0,0,0,0,0,0),('17537',1,'17537',NULL,NULL,'Entrust:5:15006',NULL,'17537',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:21.268',NULL,NULL,0,0,0,0,0,0,0,0,0),('17541',1,'17537',NULL,'17537','Entrust:5:15006',NULL,'17537','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:21.269',NULL,NULL,0,0,0,0,0,0,0,0,0),('17546',1,'17546',NULL,NULL,'Entrust:5:15006',NULL,'17546',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:22.655',NULL,NULL,0,0,0,0,0,0,0,0,0),('17550',1,'17546',NULL,'17546','Entrust:5:15006',NULL,'17546','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:22.656',NULL,NULL,0,0,0,0,0,0,0,0,0),('25001',1,'25001',NULL,NULL,'Entrust:7:22506',NULL,'25001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:29:40.767',NULL,NULL,0,0,0,0,0,0,0,0,0),('25005',1,'25001',NULL,'25001','Entrust:7:22506',NULL,'25001','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:29:40.826',NULL,NULL,0,0,0,0,0,0,0,0,0),('25010',1,'25010',NULL,NULL,'Entrust:7:22506',NULL,'25010',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:29:42.140',NULL,NULL,0,0,0,0,0,0,0,0,0),('25014',1,'25010',NULL,'25010','Entrust:7:22506',NULL,'25010','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:29:42.141',NULL,NULL,0,0,0,0,0,0,0,0,0),('25019',1,'25019',NULL,NULL,'Entrust:7:22506',NULL,'25019',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:29:43.450',NULL,NULL,0,0,0,0,0,0,0,0,0),('25023',1,'25019',NULL,'25019','Entrust:7:22506',NULL,'25019','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:29:43.450',NULL,NULL,0,0,0,0,0,0,0,0,0),('25028',1,'25028',NULL,NULL,'Entrust:7:22506',NULL,'25028',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:29:44.651',NULL,NULL,0,0,0,0,0,0,0,0,0),('25032',1,'25028',NULL,'25028','Entrust:7:22506',NULL,'25028','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:29:44.651',NULL,NULL,0,0,0,0,0,0,0,0,0),('25037',1,'25037',NULL,NULL,'Entrust:7:22506',NULL,'25037',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:29:45.838',NULL,NULL,0,0,0,0,0,0,0,0,0),('25041',1,'25037',NULL,'25037','Entrust:7:22506',NULL,'25037','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:29:45.838',NULL,NULL,0,0,0,0,0,0,0,0,0),('25046',1,'25046',NULL,NULL,'Entrust:7:22506',NULL,'25046',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:29:47.368',NULL,NULL,0,0,0,0,0,0,0,0,0),('25050',1,'25046',NULL,'25046','Entrust:7:22506',NULL,'25046','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:29:47.369',NULL,NULL,0,0,0,0,0,0,0,0,0),('27501',1,'27501',NULL,NULL,'Entrust:7:22506',NULL,'27501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:50:32.987',NULL,NULL,0,0,0,0,0,0,0,0,0),('27505',1,'27501',NULL,'27501','Entrust:7:22506',NULL,'27501','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:50:33.056',NULL,NULL,0,0,0,0,0,0,0,0,0),('27510',1,'27510',NULL,NULL,'Entrust:7:22506',NULL,'27510',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:50:34.346',NULL,NULL,0,0,0,0,0,0,0,0,0),('27514',1,'27510',NULL,'27510','Entrust:7:22506',NULL,'27510','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:50:34.346',NULL,NULL,0,0,0,0,0,0,0,0,0),('27519',1,'27519',NULL,NULL,'Entrust:7:22506',NULL,'27519',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:50:35.673',NULL,NULL,0,0,0,0,0,0,0,0,0),('27523',1,'27519',NULL,'27519','Entrust:7:22506',NULL,'27519','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:50:35.673',NULL,NULL,0,0,0,0,0,0,0,0,0),('27528',1,'27528',NULL,NULL,'Entrust:7:22506',NULL,'27528',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:50:36.858',NULL,NULL,0,0,0,0,0,0,0,0,0),('27532',1,'27528',NULL,'27528','Entrust:7:22506',NULL,'27528','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:50:36.859',NULL,NULL,0,0,0,0,0,0,0,0,0),('27537',1,'27537',NULL,NULL,'Entrust:7:22506',NULL,'27537',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:50:38.810',NULL,NULL,0,0,0,0,0,0,0,0,0),('27541',1,'27537',NULL,'27537','Entrust:7:22506',NULL,'27537','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:50:38.811',NULL,NULL,0,0,0,0,0,0,0,0,0),('27546',1,'27546',NULL,NULL,'Entrust:7:22506',NULL,'27546',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:50:40.002',NULL,NULL,0,0,0,0,0,0,0,0,0),('27550',1,'27546',NULL,'27546','Entrust:7:22506',NULL,'27546','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:50:40.003',NULL,NULL,0,0,0,0,0,0,0,0,0),('30001',1,'30001',NULL,NULL,'Entrust:7:22506',NULL,'30001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:56:51.825',NULL,NULL,0,0,0,0,0,0,0,0,0),('30005',1,'30001',NULL,'30001','Entrust:7:22506',NULL,'30001','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:56:51.899',NULL,NULL,0,0,0,0,0,0,0,0,0),('30010',1,'30010',NULL,NULL,'Entrust:7:22506',NULL,'30010',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:56:53.444',NULL,NULL,0,0,0,0,0,0,0,0,0),('30014',1,'30010',NULL,'30010','Entrust:7:22506',NULL,'30010','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:56:53.445',NULL,NULL,0,0,0,0,0,0,0,0,0),('30019',1,'30019',NULL,NULL,'Entrust:7:22506',NULL,'30019',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:56:54.803',NULL,NULL,0,0,0,0,0,0,0,0,0),('30023',1,'30019',NULL,'30019','Entrust:7:22506',NULL,'30019','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:56:54.804',NULL,NULL,0,0,0,0,0,0,0,0,0),('30028',1,'30028',NULL,NULL,'Entrust:7:22506',NULL,'30028',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:56:56.002',NULL,NULL,0,0,0,0,0,0,0,0,0),('30032',1,'30028',NULL,'30028','Entrust:7:22506',NULL,'30028','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:56:56.002',NULL,NULL,0,0,0,0,0,0,0,0,0),('30037',1,'30037',NULL,NULL,'Entrust:7:22506',NULL,'30037',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:56:57.731',NULL,NULL,0,0,0,0,0,0,0,0,0),('30041',1,'30037',NULL,'30037','Entrust:7:22506',NULL,'30037','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:56:57.731',NULL,NULL,0,0,0,0,0,0,0,0,0),('30046',1,'30046',NULL,NULL,'Entrust:7:22506',NULL,'30046',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-05 07:56:58.915',NULL,NULL,0,0,0,0,0,0,0,0,0),('30050',1,'30046',NULL,'30046','Entrust:7:22506',NULL,'30046','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-05 07:56:58.915',NULL,NULL,0,0,0,0,0,0,0,0,0),('70011',1,'70011',NULL,NULL,'Entrust:18:70010',NULL,'70011',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-07-02 07:36:24.403',NULL,NULL,0,0,0,0,0,0,0,0,0),('70014',1,'70011',NULL,'70011','Entrust:18:70010',NULL,'70011','reviewEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-07-02 07:36:24.408',NULL,NULL,0,0,0,0,0,0,0,0,0),('70019',1,'70019',NULL,NULL,'Entrust:18:70010',NULL,'70019',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-07-02 07:36:33.123',NULL,NULL,0,0,0,0,0,0,0,0,0),('70022',1,'70019',NULL,'70019','Entrust:18:70010',NULL,'70019','reviewEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-07-02 07:36:33.123',NULL,NULL,0,0,0,0,0,0,0,0,0),('70027',1,'70027',NULL,NULL,'Entrust:18:70010',NULL,'70027',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-07-02 07:36:40.896',NULL,NULL,0,0,0,0,0,0,0,0,0),('70030',1,'70027',NULL,'70027','Entrust:18:70010',NULL,'70027','reviewEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-07-02 07:36:40.897',NULL,NULL,0,0,0,0,0,0,0,0,0);
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
INSERT INTO `act_ru_identitylink` VALUES ('70018',1,'STAFF','candidate',NULL,'70017',NULL,NULL),('70026',1,'STAFF','candidate',NULL,'70025',NULL,NULL),('70034',1,'STAFF','candidate',NULL,'70033',NULL,NULL);
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
INSERT INTO `act_ru_task` VALUES ('70017',1,'70014','70011','Entrust:18:70010','ToReview',NULL,NULL,'reviewEntrust',NULL,NULL,NULL,50,'2019-07-02 07:36:24.417',NULL,NULL,1,'',NULL,NULL),('70025',1,'70022','70019','Entrust:18:70010','ToReview',NULL,NULL,'reviewEntrust',NULL,NULL,NULL,50,'2019-07-02 07:36:33.123',NULL,NULL,1,'',NULL,NULL),('70033',1,'70030','70027','Entrust:18:70010','ToReview',NULL,NULL,'reviewEntrust',NULL,NULL,NULL,50,'2019-07-02 07:36:40.898',NULL,NULL,1,'',NULL,NULL);
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
INSERT INTO `act_ru_variable` VALUES ('70012',1,'string','ClientID','70011','70011',NULL,NULL,NULL,NULL,'u20190605134344',NULL),('70013',1,'string','EntrustID','70011','70011',NULL,NULL,NULL,NULL,'p20190606171309',NULL),('70020',1,'string','ClientID','70019','70019',NULL,NULL,NULL,NULL,'u20190605134344',NULL),('70021',1,'string','EntrustID','70019','70019',NULL,NULL,NULL,NULL,'p20190606171310',NULL),('70028',1,'string','ClientID','70027','70027',NULL,NULL,NULL,NULL,'u20190605134344',NULL),('70029',1,'string','EntrustID','70027','70027',NULL,NULL,NULL,NULL,'p20190606171311',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
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
INSERT INTO `tbl_sys_entrust` VALUES (1,'70011',1,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ',' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171309','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ',5,''),(2,'70019',1,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ',' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171310','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ',5,''),(3,'70027',1,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ',' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171311','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ',5,''),(4,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171312','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ',6,NULL),(5,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171313','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ',7,NULL),(6,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171314','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ',6,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062921 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062908 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062908 DEFAULT CHARSET=latin1;
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
