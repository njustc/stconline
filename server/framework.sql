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
INSERT INTO `act_ge_bytearray` VALUES ('70002',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.bpmn','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\"/>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70003',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.bpmn20.xml','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"MM\" type=\"string\" value=\"MarketingManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"QM\" type=\"string\" value=\"QualityManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70004',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.bpmn20.xml','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\" activiti:candidateGroups=\"STAFF\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70005',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.myProcess_1.png','70001','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0ï¿½\0\0ï¿½\0\0\0ï¿½dZ\0\0CaIDATxï¿½ï¿½ï¿½|Tï¿½ï¿½ï¿½ï¿½ï¿½e-ï¿½,ÕªÕŠï¿½ï¿½vmï¿½êº¶ï¿½]Wcï¿½Vï¿½ï¿½6Éœï¿½3ï¿½ï¿½XAï¿½B)ï¿½ï¿½>ï¿½\nï¿½*Teï¿½ï¿½ï¿½V\\EE(ï¿½\0ï¿½ï¿½Mï¿½ï¿½E!r	I ï¿½ï¿½>ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½yï¿½ï¿½ï¿½$ï¿½Ofï¿½=ï¿½sÎœÓ¦ï¿½0Æœï¿½&rï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½\0\0ï¿½	ï¿½%ï¿½ï¿½kï¿½ï¿½7ï¿½ï¿½ï¿½ï¿½ßµï¿½ï¿½oï¿½ï¿½Qï¿½ï¿½_ï¿½\\~ï¿½ï¿½tï¿½7ï¿½x?oPï¿½ï¿½ï¿½ï¿½ï¿½Vï¿½]z=\0ï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü˜5\Zï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½_\Zï¿½ï¿½!c\nï¿½gÒª#ï¿½ï¿½ï¿½ï¿½ï¿½	ï¿½ï¿½ï¿½sï¿½ï¿½9sï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½=ï¿½ï¿½Hï¿½ï¿½~ï¿½ï¿½ï¿½\0\04,ï¿½ï¿½K}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½cï¿½iï¿½wï¿½ï¿½ß™;ï¿½ï¿½ï¿½ï¿½?ï¿½mAeï¿½	ï¿½/ï¿½ï¿½ï¿½Njï¿½ï¿½h-ï¿½>zï¿½f:\0@=ï¿½Ü¯ï¿½=ï¿½<5oï¿½ï¿½cï¿½)ï¿½ï¿½ï¿½ï¿½|ï¿½Mï¿½zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Vï¿½ï¿½.7ï¿½ï¿½ï¿½ï¿½ï¿½b@Uxu?ï¿½ï¿½ï¿½ï¿½}~Uï¿½nKï¿½ï¿½ï¿½ï¿½ï¿½.Vï¿½\0ï¿½xSï¿½ï¿½\Zï¿½|ï¿½ï¿½ï¿½?ï¿½ï¿½ï¿½ï¿½oï¿½>-uï¿½ZWï¿½5yï¿½ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½1ï¿½>ï¿½ï¿½ï¿½Ý±)}ï¿½ï¿½Ê¸ï¿½uï¿½ï¿½ï¿½B/2fEï¿½2ï¿½\r\0@ï¿½ï¿½ï¿½ï¿½*r\rï¿½ï¿½Ð–ï¿½=Ðº,.5[ï¿½ï¿½ï¿½Þ§ï¿½ï¿½ï¿½Ç…ï¿½ï¿½ï¿½ï¿½ï¿½7\0\0ï¿½Þ·ï¿½Gï¿½ï¿½yï¿½ï¿½\n\rï¿½ï¿½/ï¿½8ï¿½ï¿½ÎŠï¿½ï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½#ï¿½ï¿½>ï¿½_ï¿½ï¿½tï¿½sï¿½ï¿½ï¿½ï¿½kï¿½ï¿½ï¿½ï¿½ï¿½eï¿½slx?&ï¿½Lï¿½Cï¿½\0hxxï¿½ï¿½ï¿½Ò©xÈ„eï¿½ï¿½\\ï¿½{ï¿½1ï¿½_bï¿½ï¿½rï¿½vrï¿½\'nHï¿½uï¿½tS!.ï¿½M>qï¿½Ñ¥ÛŽï¿½ï¿½ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½ï¿½{jqï¿½.\rt]-?vï¿½ï¿½bYï¿½ï¿½~g{:\0@ï¿½ï¿½{ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½O,8ï¿½ï¿½j5ï¿½ï¿½ï¿½ï¿½nï¿½d=q}ï¿½7ï¿½ï¿½ï¿½ï¿½=O,ï¿½ï¿½ï¿½ï¿½!ï¿½.ï¿½ï¿½ï¿½ï¿½Xï¿½tï¿½ï¿½nï¿½~ï¿½ï¿½]ï¿½ï¿½:LXyï¿½s]ï¿½ï¿½gï¿½ï¿½wï¿½8	uï¿½=t\0ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½2ï¿½\'ï¿½Cï¿½ï¿½I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z2=ï¿½Ì™3ï¿½7nï¿½ï¿½Ñ£GWï¿½sï¿½=&\'\'ï¿½deeï¿½h4j`ï¿½^>rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0 E>ï¿½ï¿½ï¿½ï¿½Ä‰ï¿½ï¿½ï¿½ï¿½ï¿½7wï¿½uï¿½yï¿½ï¿½ï¿½Í’%KÌŽ;ï¿½ï¿½Ã‡ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½eË–ï¿½Iï¿½&ï¿½Þ½{ï¿½ï¿½ï¾»rï¿½Ð¡ï¿½9ï¿½.\0ï¿½<ï¿½ï¿½sï¿½ï¿½-ï¿½Û·ï¿½ï¿½IÛ¬^ï¿½ï¿½\rï¿½Dï¿½]ï¿½ï¿½È”nnï¿½ï¿½v#Sï¿½H:\n\0@OÛ=ï¿½Xeï¿½ï¿½ï¿½ï¿½Ê•+MC|ï¿½ï¿½Gï¿½_ï¿½~ï¿½Wï¿½^ï¿½rrr:ï¿½]\0\0\ZÙï¿½\r>ï¿½<ï¿½ï¿½ï¿½fï¿½ï¿½ï¿½ï¿½1ï¿½ï¿½uï¿½y}ï¿½ï¿½ï¿½ï¿½jt\0\0\Zyï¿½ï¿½ï¿½~ï¿½Gï¿½Ñ£GMc{ï¿½ï¿½\'uï¿½\"--ï¿½=ï¿½\0ï¿½ï¿½tï¿½ï¿½*ï¿½	ï¿½)ï¿½;ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Jï¿½\0h ï¿½9Mï¿½q7Öªï¿½Vï¿½ï¿½ï¿½Ý»ï¿½qï¿½ï¿½t\0ï¿½zï¿½ï¿½ï¿½Wï¿½ï¿½Qï¿½t\'ï¿½H$Rï¿½ï¿½o\0\0ï¿½I?Ç­kN<ï¿½@yVVï¿½Tï¿½\0@ï¿½ï¿½ï¿½iz\0ï¿½æšºcÖ¯_odï¿½>ï¿½ï¿½k\0\0$iï¿½ï¿½ï¿½ï¿½ï¿½Óšr\'ï¿½ï¿½ï¿½ï¿½ï¿½TØ¶};\0\0ï¿½ï¿½ï¿½*ï¿½Cï¿½ï¿½Â£ï¿½>Zï¿½ï¿½ï¿½Uï¿½_\0ï¿½$ï¿½IFï¿½Xå©°hÑ¢ï¿½Þ…ï¿½\0\0Hï¿½ï¿½LO2ï¿½\nï¿½ï¿½Å•ï¿½eï¿½\0\0Hï¿½ï¿½ï¿½3vvï¿½ï¿½\':ï¿½Sï¿½ï¿½W\0\0 	\Zï¿½ï¿½Dx\0ï¿½ï¿½ï¿½Ý»ï¿½rï¿½$ï¿½\0Hï¿½ï¿½ï¿½ï¿½ï¿½mï¿½.***gï¿½7\0\0I\Z1bDYï¿½ï¿½6ï¿½9sf{ï¿½\0ï¿½ï¿½ï¿½ï¿½kï¿½>ï¿½=|ï¿½ï¿½|ï¿½\0ï¿½$ï¿½ï¿½ï¿½ï¿½Þ½{ï¿½ï¿½kzxTï¿½ï¿½\0@ï¿½ï¿½ï¿½ï¿½ï¿½mï¿½xï¿½b]eÎ±ï¿½\0ï¿½ï¿½aÃ†ï¿½5jTï¿½ï¿½wÏž=wrV1\0\0ï¿½)\'\'ï¿½ï¿½wï¿½Qï¿½vï¿½ï¿½f	ï¿½Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0hï¿½ï¿½ï¿½{xß¾}ï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½KJJ*ï¿½ï¿½pï¿½wï¿½\0@ï¿½ï¿½ï¿½{Ç£ï¿½>Ú”;ï¿½Uï¿½ï¿½(ï¿½m{ï¿½\0ï¿½ï¿½ï¿½c2ï¿½ï¿½7ï¿½)ï¿½rï¿½Ð¡ï¿½ï¿½ï¿½u5=ï¿½\0ï¿½ï¿½gÏžEï¿½ï¿½_Ì¡Cï¿½\ZmUyï¿½>}tï¿½Bï¿½s\0ï¿½Dï¿½Fï¿½ï¿½yç•ï¿½Vï¿½jï¿½ï¿½iï¿½ï¿½[Wï¿½3q\0ï¿½ï¿½tï¿½ï¿½ï¿½ï¿½ï¿½#Fï¿½8ï¿½!ï¿½Ìªï¿½ï¿½Ë—ï¿½ï¿½mï¿½ï¿½^ï¿½ï¿½\0@sï¿½iYï¿½ï¿½ï¿½:=wï¿½Ö­rï¿½ï¿½ï¿½%ï¿½ï¿½ï¿½?ï¿½sï¿½ï¿½\n=ï¿½*++ï¿½Ô“ï¿½Ìš5ï¿½Xyï¿½GNï¿½ï¿½ï¿½ï¿½qï¿½ï¿½\0ï¿½ï¿½0ï¿½Jï¿½Imï¿½@/ï¿½ï¿½yï¿½Uï¿½nÓ–Zï¿½ï¿½<ï¿½ï¿½i\0\0ï¿½;ï¿½+ï¿½ï¿½ï¿½ï¿½t\0ï¿½ï¿½ï¿½wï¿½eYï¿½ï¿½	\0\0ï¿½ï¿½%ï¿½ï¿½ï¿½	\0\0ï¿½qï¿½b	ï¿½!t\0ï¿½ï¿½LÞºï¿½ï¿½t\0ï¿½ï¿½ï¿½ï¿½\Z	ï¿½Wï¿½\0\0ï¿½	ï¿½w%ï¿½gï¿½	\0\0ï¿½qï¿½ï¿½ï¿½ï¿½ï¿½	\0\0Â²ï¿½g%ï¿½7ï¿½	\0\0\"++ï¿½Aï¿½t\0ï¿½ï¿½ï¿½mï¿½ï¿½ï¿½ï¿½>:\0@@Xï¿½uï¿½ï¿½ï¿½a:\0@@ï¿½Bï¿½ï¿½%ï¿½ï¿½ï¿½	\0\0ï¿½Þï¿½ï¿½bt\0ï¿½\0ï¿½ï¿½ï¿½sï¿½	\0\0ï¿½ï¿½Rï¿½ï¿½	\0\0Â¶ï¿½Rï¿½qï¿½N\0\0ï¿½ï¿½{ï¿½T:\0@pï¿½{ï¿½ï¿½ï¿½N\0\0ï¿½ï¿½Þ¤ï¿½Iï¿½\0\0ï¿½ï¿½ï¿½Dï¿½ï¿½-:\0@p&ï¿½<=5(ï¿½\0\0  ï¿½ï¿½ï¿½ï¿½%ï¿½ï¿½ï¿½	\0\0Â¶ï¿½ï¿½%ï¿½ï¿½ï¿½	\0\0ï¿½3yuï¿½ï¿½N\0\0ï¿½euï¿½ï¿½ï¿½ ï¿½\0\0 8ï¿½}ï¿½ï¿½w9ï¿½\0\0  lï¿½ï¿½ï¿½ï¿½w%ï¿½\0\0  rssï¿½ï¿½ï¿½tI7\0\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½t\0ï¿½ï¿½ï¿½wï¿½nï¿½ï¿½\0\0\'ï¿½ï¿½^ï¿½t\0ï¿½ï¿½ï¿½ï¿½yKxï¿½\0\0gï¿½ÞªGZï¿½\0\0\'ï¿½ï¿½Hxï¿½B\'\0\0Nxï¿½+ï¿½=ï¿½N\0\0ï¿½ã¼­ï¿½ï¿½ï¿½\0\0ï¿½eYï¿½Jxoï¿½\0\0DVVÖƒR;ï¿½\0\0aï¿½v_	ï¿½}t\0ï¿½ï¿½ï¿½,ï¿½V	ï¿½ï¿½t\0ï¿½ï¿½ï¿½Bï¿½Kxï¿½\0\0\'ï¿½;ï¿½ï¿½ï¿½\0\0ï¿½á“ï¿½Ó‘N\0\0ï¿½ð®ºï¿½N\0\0ï¿½mï¿½ï¿½kt\0ï¿½ï¿½Lï¿½ï¿½ï¿½ï¿½sï¿½j	ï¿½Û¥FK]Dg\0\0ï¿½ï¿½ï¿½ï• ï¿½)Aï¿½W?\"&!]ï¿½Û¼ï¿½ï¿½Ñ´ï¿½ï¿½ï¿½t\0\0ï¿½ï¿½>CÃ¹ï¿½ï¿½ï¿½*	ï¿½t\n\0\0ï¿½ï¿½~ï¿½ï¿½ï¿½ï¿½ï¿½Ì¼ï¿½.\0ï¿½\0?Pï¿½Ô½ï¿½ï¿½\0\0ï¿½Cï¿½HÄ®)ï¿½uï¿½8ï¿½\0ï¿½ï¿½dï¿½ï¿½ï¿½ZxaG5\0\0ï¿½ï¿½I`ï¿½ï¿½mï¿½OW\0\0ï¿½9ï¿½qï¿½ï¿½ï¿½;ï¿½\\AG\0\0ï¿½9]M.ï¿½]ï¿½8ï¿½\0\0  $ï¿½ï¿½ï¿½\0\0ï¿½1Æ´ß²eKï¿½ï¿½Å‹Íœ9sï¿½ï¿½Ù³ï¿½zT^^ï¿½Yï¿½`Aï¿½Ô“<ï¿½\0\0MJï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½2ï¿½ï¿½{ï¿½nï¿½ï¿½ï¿½_)A>ï¿½G\0ï¿½ï¿½ï¿½ï¿½Mp7nï¿½ï¿½$^ï¿½#\0ï¿½dtU9ï¿½Û¸ï¿½ï¿½ï¿½yd\0ï¿½ï¿½\rï¿½Kx\0Z`xÜ·ï¿½lYï¿½ï¿½Yï¿½wï¿½[zYï¿½#ï¿½	o\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fï¿½ï¿½ï¿½fÕ´AÇ”^ï¿½ï¿½Ø„7\0ï¿½gï¿½]ï¿½ï¿½ï¿½ï¿½;Vï¿½ï¿½N%ï¿½	o\0ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½k\roï¿½ï¿½ï¿½&ï¿½\0>ï¿½5ï¿½sk\roï¿½ï¿½ï¿½&ï¿½\0ï¿½7ï¿½\r\0@Cï¿½[ï¿½.ï¿½-ï¿½ï¿½6ï¿½ï¿½\0ï¿½,ï¿½7-Wkxï¿½m6ï¿½\r\0ï¿½Yxï¿½Ù¾Ú¬ï¿½5ï¿½ï¿½Uï¿½rï¿½ï¿½F`ï¿½\0\0ï¿½ï¿½ï¿½ï¿½\'ï¿½_<.ï¿½ï¿½:Âšï¿½\0ï¿½1ï¿½KKÍ¦EOï¿½ï¿½\\ï¿½ï¿½ï¿½lï¿½\0ï¿½ï¿½ï¿½#ï¿½m\\8ï¿½ï¿½mï¿½zGY#ï¿½\0~oï¿½ï¿½wlï¿½k>ï¿½1ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½Nx\0Rï¿½\'ï¿½ï¿½ï¿½ï¿½	o\0ï¿½ï¿½ï¿½;ï¿½iï¿½ï¿½)ï¿½ï¿½&ï¿½\0ï¿½ï¿½ï¿½\rï¿½XÞ„7\0ï¿½ï¿½Ã›\"ï¿½\0ï¿½7ï¿½\r\0\0ï¿½Mx\0oï¿½ï¿½\0Þ„7\0\0ï¿½7ï¿½\r\0 ï¿½ï¿½ï¿½0ï¿½}ï¿½aMx\0ï¿½ï¿½ï¿½×¯7?ï¿½ï¿½ï¿½Mï¿½vï¿½4ï¿½Ì·ï¿½ï¿½-3|ï¿½psï¿½ï¿½!ï¿½ï¿½ï¿½Sï¿½ï¿½ï¿½kMï¿½0ï¿½ï¿½nÉ’%Uï¿½=ï¿½ï¿½#fÖ¬YU_k}ï¿½ï¿½_7gï¿½uï¿½yï¿½ï¿½ï¿½ï¿½Ó§Owï¿½ï¿½ï¿½?Ox\0ï¿½ï¿½Ú·oï¿½9ï¿½ï¿½ï¿½MÛ¶mÍ¯~ï¿½+ï¿½ï¿½ï¿½k.ï¿½ï¿½78ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö­ï¿½{ï¿½C=tLxÏœ9Ó½|ï¿½-ï¿½ï¿½Qï¿½Fï¿½ï¿½ï¿½Ïœsï¿½9ï¿½uï¿½7oN:,?ï¿½ï¿½#3lï¿½0ï¿½|ï¿½rï¿½\0@xï¿½ï¿½sï¿½=ï¿½l$ï¿½ï¿½ï¿½ï¿½ï¿½Èï¿½;tï¿½`JKKï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½ï¿½ï¿½ï¿½ï¿½pï¿½\rï¿½ï¿½SO=.ï¿½5ï¿½c?ï¿½ï¿½ï¿½vï¿½+((pï¿½4hï¿½9ï¿½ï¿½ï¿½é§Ÿnï¿½ï¿½SRRbï¿½ï¿½ï¿½jsï¿½5ï¿½T}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü¹sï¿½yï¿½g^{ï¿½Zï¿½ï¿½?ï¿½ï¿½?ï¿½mï¿½ï¿½ï¿½ï¿½>pï¿½@ï¿½ï¿½|ï¿½ï¿½Ù²eï¿½{Yï¿½Dï¿½\0ï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½&M:ï¿½z\rTï¿½^ï¿½0ï¿½:Uï¿½Rï¿½ï¿½SN9ï¿½\rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½.ï¿½ï¿½ï¿½tï¿½Iæ¢‹.rï¿½\0,^ï¿½ï¿½ï¿½MB,ÔŸ}ï¿½Yï¿½?ï¿½É½ï¿½pï¿½Bï¿½nï¿½:ï¿½rï¿½~ï¿½Ì´iÓªVï¿½ï¿½ï¿½ï¿½ï¿½hï¿½}Cqï¿½ï¿½ï¿½ï¿½ï¿½cÆŒ1O<ï¿½ï¿½1o\Zo\0@ï¿½\nï¿½?ï¿½ï¿½nÐ½ï¿½ï¿½ï¿½\\ï¿½ï¿½ï¿½ï¿½^ï¿½uï¿½Öªï¿½Öï¿½ï¿½oï¿½[wï¿½ï¿½mMï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½&cï¿½nï¿½ï¿½Uï¿½ï¿½8ï¿½ï¿½J]Wï¿½ï¿½ï¿½ï¿½ï¿½:Ô½~ÕªUÇ„wmï¿½ï¿½ï¿½ï¿½UAï¿½ï¿½ï¿½ï¿½6ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½i ï¿½\0-.ï¿½uï¿½Xï¿½èŒŒï¿½ï¿½ë¯»ï¿½ï¿½;vï¿½xï¿½6ï¿½É“\'ï¿½sï¿½=×½ï¿½ï¿½ï¿½uZnSï¿½jsï¿½ï¿½ï¿½ï¿½ï¿½Jï¿½ï¿½qï¿½Æ¹?ï¿½{ï¿½ï¿½ï¿½ï¿½=zï¿½0}ï¿½ï¿½qkï¿½Ø±ï¿½m:ï¿½ï¿½ï¿½ï¿½Uï¿½W]uï¿½{]|xï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½\0ï¿½qï¿½ï¿½2dï¿½ï¿½*ï¿½ï¿½ï¿½ï¿½ï¿½Õ«Û¼\0-3ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½/~ï¿½sï¿½gVï¿½6xï¿½ï¿½ï¿½ï¿½[WUï¿½ï¿½ï¿½ï¿½ï¿½fï¿½ï¿½Õµnï¿½Þ°aï¿½ï¿½ï¿½\\ï¿½U/ï¿½ï¿½ï¿½Kï¿½ï¿½^ï¿½0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½uï¿½obï¿½ï¿½gï¿½9.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7ï¿½mï¿½faï¿½Ò¥U?gÆŒï¿½ï¿½+Vï¿½pß˜Ì›7ï¿½ï¿½Ëï¿½ï¿½Æ¢ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½\0hï¿½ï¿½ï¿½}Tï¿½ï¿½ë¯¯ï¿½ï¿½ï¿½ï¿½ï¿½Oï¿½ï¿½Oï¿½RV|x?ï¿½ï¿½ï¿½ï¿½e]ï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½ï¿½cbzï¿½M7ï¿½ï¿½NÉ™ï¿½ï¿½ï¿½vpï¿½=ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½O\'~]Í­Qï¿½]ï¿½Qï¿½ï¿½ï¿½7ï¿½ï¿½\\ï¿½n]Mï¿½ï¿½ï¿½Nï¿½:U}ï¿½-ï¿½ï¿½ï¿½vï¿½>ï¿½amYÖ½ï¿½ï¿½Ihï•¥ï¿½G \0ï¿½ï¿½ï¿½;Vï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ze$ï¿½Ì¶mï¿½\Zuï¿½ï¿½ql;xs~oCï¿½ï¿½7ï¿½ï¿½`~Fjï¿½ï¿½uy\\XSï¿½mï¿½ï¿½\0hï¿½ï¿½j.]3ï¿½ï¿½ï¿½mjï¿½ï¿½ï¿½ï¿½Ì¼ï¿½G \0ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½ï¿½p~]ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0 ï¿½}vlï¿½H$rï¿½ï¿½ï¿½ï¿½:Vï¿½Iï¿½vï¿½×®]Oï¿½ï¿½\0 ï¿½}pxT	ï¿½3$ï¿½wï¿½ï¿½ï¿½ï¿½mï¿½Nlï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Rï¿½ï¿½ï¿½ï¿½<:\0ï¿½w\nï¿½mï¿½ï¿½ï¿½\Zï¿½ï¿½ï¿½ï¿½ï¿½tï¿½>>6]ï¿½SJWï¿½ï¿½ï¿½ï¿½Hï¿½ï¿½yznnn;ï¿½\0\0Â»OL\"ï¿½ï¿½Þ•iiiï¿½Oï¿½i+ï¿½ï¿½Yï¿½;AB}ï¿½,Ë¼@ï¿½-ï¿½gYÖ€h4ï¿½ï¿½\0@xSM|ï¿½5	ï¿½ï¿½uï¿½ï¿½ï¿½ï¿½Jï¿½ï¿½\"	ï¿½%Ì—JUï¿½jï¿½ï¿½Hï¿½ï¿½ï¿½Ë—ï¿½\0Â›jï¿½Ã£&0u\'ï¿½Kï¿½.ï¿½Jhï¿½ï¿½zGï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½%ï¿½?ï¿½ï¿½E.gï¿½ï¿½\0oï¿½ï¿½ï¿½6ï¿½Ð¾Qï¿½ï¿½Y	ï¿½\rï¿½ï¿½]Wï¿½Kï¿½ï¿½ï¿½sï¿½ï¿½@Ýï¿½G=\0Þ”ï¿½OLï¿½ï¿½ï¿½sa8ï¿½_ï¿½{ï¿½Ô—Þªï¿½Cï¿½+%ï¿½ï¿½ï¿½gï¿½Y\0\0ï¿½7ï¿½ï¿½ã³Šï¿½Bï¿½ï¿½wHMï¿½ï¿½<ï¿½ï¿½]ï¿½Sï¿½W%ï¿½mï¿½ï¿½ï¿½<3\0ï¿½ï¿½&ï¿½}L&ï¿½_ï¿½ï¿½e\Zï¿½Hï¿½ï¿½ï¿½^ï¿½ï¿½Rï¿½ï¿½*ï¿½ï¿½ï¿½gï¿½L\0Â›ï¿½ï¿½1	ï¿½Hï¿½ï¿½Vï¿½ï¿½ï¿½ï¿½Zï¿½\'Zï¿½ï¿½ï¿½ï¿½ï¿½xï¿½\0\0ï¿½Mxï¿½XÏž=Oï¿½ï¿½ï¿½ï¿½Lï¿½oï¿½rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Vï¿½ï¿½_ï¿½eï¿½Uï¿½\0@xï¿½>\'A~ï¿½Lï¿½ï¿½%ï¿½ï¿½ï¿½2ï¿½ï¿½}ï¿½ï¿½ï¿½|ï¿½mHï¿½nï¿½ï¿½ï¿½ï¿½\0MdÎœ9.ï¿½ï¿½`ï¿½hï¿½ï¿½p8<B|ï¿½ï¿½ï¿½Øªvï¿½ï¿½ï¿½,ï¿½egg_Å³\r\0\ZIAAAEQQï¿½ï¿½Hï¿½mÛ¶ï¿½ï¿½eï¿½ï¿½qï¿½ï¿½ï¿½e\nï¿½Mï¿½ï¿½M	ï¿½mr9ï¿½ï¿½ï¿½3=]ï¿½|ï¿½ï¿½Xï¿½ï¿½Vgï¿½Ü¹ï¿½ï¿½ï¿½Wï¿½Úµï¿½ï¿½ï¿½XZZï¿½ï¿½ï¿½ï¿½ï¿½ï¿½;\"5ï¿½Gï¿½ï¿½$ï¿½ï¿½ï¿½ Jjï¿½ï¿½ao:ï¿½Bjï¿½Lï¿½Ceï¿½=ï¿½\0	ï¿½ï¿½)ï¿½ï¿½A]ï¿½ï¿½×š5kï¿½{6.?ï¿½uï¿½&ï¿½×£Gï¿½ï¿½ï¿½7&U ï¿½ï¿½ï¿½ï¿½\Zï¿½k$ï¿½ï¿½ï¿½,ï¿½\Zï¿½\0ï¿½ï¿½ï¿½ï¿½-ï¿½ï¿½Fï¿½ï¿½qTBï¿½\r	ï¿½Bo5ï¿½Vï¿½|=Eï¿½ï¿½Îªv\0Ý£ï¿½ï¿½ï¿½[	ï¿½u\nï¿½i<ï¿½ï¿½]ï¿½ï¿½ï¿½Þ•\Zï¿½ï¿½;]\0ï¿½ï¿½Wdddï¿½ï¿½Nï¿½^ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½ï¿½^ï¿½jï¿½ï¿½ï¿½=]ï¿½ï¿½ï¿½%\0ï¿½]ï¿½Ê‰4OWï¿½ï¿½ï¿½ï¿½ï¿½\'ï¿½Q}ï¿½ï¿½{ï¿½ï¿½ï¿½Ç»ï¿½ï¿½Nï¿½\0 uï¿½]ï¿½ï¿½ï¿½ï¿½~ï¿½\\?[.ï¿½ZJï¿½Zï¿½}ï¿½|ï¿½~]?ï¿½Nï¿½\0ï¿½ï¿½Â»T^|C\'ï¿½=ï¿½ï¿½<vKï¿½ï¿½Qà¼£ï¿½ï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\04]xï¿½ï¿½hï¿½	4ï¿½ï¿½]BÛ‘ï¿½ï¿½ï¿½gï¿½ï¿½h×ƒï¿½lï¿½ï¿½ß–ï¿½oï¿½Sï¿½ï¿½)\0hï¿½_ï¿½EM\'ï¿½oï¿½1mï¿½wï¿½Jï¿½jï¿½ï¿½kzï¿½5ï¿½\0ï¿½ï¿½ï¿½ï¿½O\'ï¿½ï¿½ï¿½3ï¿½\\ï¿½zNs=ï¿½ylUï¿½wï¿½ï¿½gï¿½ï¿½t	\0ï¿½ï¿½wï¿½Ç„ï¿½ï¿½[nnnï¿½H$bKpï¿½*ï¿½ï¿½ï¿½ï¿½xï¿½KMï¿½5Bï¿½jï¿½\Zï¿½ï¿½ï¿½ï¿½ï¿½@ï¿½ï¿½r	ï¿½Gï¿½1ï¿½Rï¿½Xï¿½ï¿½zï¿½/uUï¿½\\ï¿½@NNÎ…t	\0á•ï¿½ï¿½ï¿½Xï¿½	ï¿½Q4\Zï¿½ï¿½<>ï¿½ï¿½ï¿½]Kï¿½\rï¿½Lï¿½dï¿½ï¿½ï¿½ï¿½Mt	@kï¿½ï¿½(ZtAï¿½ï¿½ï¿½ï¿½1ï¿½)ï¿½ï¿½W$ï¿½?ï¿½Uï¿½ï¿½^ï¿½;ï¿½ï¿½iï¿½eï¿½ï¿½Xï¿½\0Z<ï¿½YH^ï¿½^ï¿½ï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½|PWï¿½ï¿½ï¿½ï¿½RKuï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½0D\'ï¿½Rtï¿½ï¿½ï¿½4	ï¿½ï¿½Î“ï¿½ï¿½ï¿½ï¿½^&aï¿½Qï¿½ï¿½ï¿½ï¿½ï¿½rï¿½ï¿½t\n@ï¿½ï¿½{ï¿½Dï¿½Nï¿½ï¿½ï¿½Uï¿½ï¿½ï¿½ï¿½/ï¿½f\"=$ï¿½ï¿½ï¿½Nï¿½<]ï¿½wï¿½ï¿½ï¿½tï¿½S\0Cï¿½M-5ï¿½Nï¿½5ï¿½0ï¿½Tjï¿½<ï¿½ßï¿½jï¿½:ï¿½ofeï¿½ï¿½H$r1]ï¿½ï¿½ï¿½{ï¿½Lï¿½ï¿½Zï¿½P(ï¿½IBï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Dï¿½ï¿½W{ï¿½,7Kï¿½hYVï¿½6ï¿½jï¿½ï¿½{ï¿½~ï¿½ï¿½N\0ï¿½hï¿½\'ï¿½ï¿½ï¿½D	q\rï¿½rï¿½ð®»¤fJï¿½ï¿½ï¿½ï¿½ï¿½M\0RB^ï¿½ï¿½ï¿½^ï¿½tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½r]Å®ï¿½ï¿½9ï¿½9ï¿½TMï¿½/ï¿½ï¿½Z:$ï¿½ï¿½1ï¿½@JXï¿½ï¿½ï¿½~ï¿½ï¿½N\0Iï¿½ï¿½n?ï¿½N\0Hï¿½ï¿½8ï¿½Oï¿½ï¿½|xsZS\0)ï¿½ï¿½ï¿½ï¿½mtH:ï¿½+ï¿½#gt@ï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½	 ï¿½ï¿½Î‘ï¿½ï¿½ï¿½ï¿½ï¿½fgYÖ½ï¿½{ï¿½ï¿½ï¿½ï¿½]&~#ï¿½\0ï¿½ï¿½ï¿½>Rï¿½ï¿½ï¿½ï¿½sç°¼ï¿½ï¿½ï¿½N\0hvï¿½ï¿½Ü¦ï¿½ï¿½ï¿½@ï¿½ï¿½}H*L\'\04;Û¶Cï¿½TB\'ï¿½ï¿½ï¿½;ï¿½ï¿½sï¿½\0ï¿½ï¿½Bï¿½ï¿½M2}ï¿½ï¿½	 ï¿½ï¿½Þ«ï¿½Cï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½N\0I?wï¿½-ï¿½\ZB\'\04;ï¿½ï¿½ï¿½~^ï¿½N\0É‘ï¿½ï¿½Nï¿½ï¿½%ï¿½\0ï¿½ï¿½ï¿½Qzï¿½(:$ï¿½ï¿½ï¿½D%t@ï¿½ï¿½Fï¿½ï¿½ï¿½,ï¿½	 ï¿½ï¿½ï¿½Tj,ï¿½\0ï¿½ï¿½Bï¿½ï¿½É„7Pï¿½ï¿½ï¿½ï¿½8ï¿½ï¿½t@ï¿½^ï¿½ï¿½Ô†\'ï¿½	 ï¿½ï¿½ï¿½:ï¿½ï¿½t@ï¿½Â»k×®ï¿½ï¿½	 ï¿½ï¿½ï¿½*Û¶\'ï¿½	\0ï¿½zï¿½ï¿½Fï¿½ï¿½ï¿½	 qï¿½ï¿½,ï¿½,ï¿½-: U/Bï¿½ï¿½Hï¿½Mï¿½\"ï¿½ï¿½t@ï¿½^ï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½ï¿½ï¿½&_jï¿½\0ï¿½ï¿½É»Lï¿½J\'ï¿½ï¿½ï¿½{ï¿½Nï¿½t@ï¿½^ï¿½Keï¿½	 ï¿½7ï¿½oÛ¶ï¿½ï¿½N\0HUxï¿½,ï¿½;ï¿½\0ï¿½\nï¿½ï¿½$ï¿½Wï¿½	\0ï¿½\nï¿½/ï¿½ï¿½ï¿½	 ï¿½ï¿½ï¿½Dï¿½ï¿½7ï¿½\0ï¿½ï¿½ï¿½=2yï¿½K\'ï¿½ï¿½ï¿½7ï¿½Hmï¿½\0Rï¿½\"ï¿½K*ï¿½N\0I=oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Tï¿½qv$ Iï¿½pxï¿½<oï¿½ï¿½	\0ï¿½\noÎŽ$ï¿½ï¿½Kxï¿½\0Rï¿½qï¿½ï¿½ï¿½e=K\'ï¿½ï¿½ï¿½sfï¿½<wï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½Lï¿½/ï¿½	 ï¿½7ï¿½ï¿½ï¿½ï¿½ï¿½	\0ï¿½zï¿½@ï¿½ï¿½7ï¿½ï¿½8yï¿½{ï¿½ï¿½ï¿½ï¿½O\'\0ï¿½jï¿½^\">ï¿½N\0Iï¿½ï¿½Í–ï¿½ï¿½!: Uï¿½ï¿½9tH\\8Nï¿½Cï¿½	\0ï¿½\nï¿½YRï¿½ï¿½8ï¿½ï¿½oï¿½ï¿½Mï¿½\0ï¿½ï¿½`ï¿½ï¿½ï¿½ï¿½j=ï¿½.ï¿½\0ï¿½ï¿½	bï¿½ï¿½ï¿½ï¿½@ï¿½ï¿½ï¿½ï¿½ò¼© \0RB^ï¿½^ï¿½ZO\'ï¿½ï¿½ï¿½ï¿½ï¿½\\(o|+ï¿½ï¿½TMï¿½ï¿½%ï¿½?ï¿½@ï¿½ï¿½ï¿½ï¿½Ï’ï¿½\rï¿½\r 5ï¿½yT^ï¿½>ï¿½@ï¿½Bï¿½Pyï¿½: %ï¿½ï¿½Aï¿½^ï¿½ï¿½ï¿½;ï¿½ddd\\Bgï¿½JÆ˜ï¿½[ï¿½l)\\ï¿½xï¿½ï¿½3gï¿½ï¿½={ï¿½ï¿½Jï¿½Ûï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3,ï¿½ï¿½zï¿½Gï¿½)ï¿½Û¶Kt/Yï¿½ï¿½F_|jï¿½|ï¿½ï¿½Tï¿½ï¿½.((0EEEï¿½ï¿½ï¿½ï¿½j@ï¿½Þ½ï¿½ï¿½ï¿½ï¿½WJï¿½ï¿½ï¿½wï¿½.ï¿½#ï¿½ï¿½*{ï¿½ï¿½Ñ™N!ï¿½tï¿½&ï¿½7ï¿½eï¿½sï¿½@ï¿½ï¿½oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½RMWï¿½ï¿½ï¿½[ï¿½\Zï¿½Gï¿½\0ï¿½R[xÛ¶}Bï¿½iï¿½ï¿½ï¿½7ï¿½jï¿½wMÛ¼%ï¿½Wï¿½)ï¿½ï¿½ï¿½aï¿½,{Þ¬Í»ï¿½-ï¿½ï¿½ï¿½Ö„7ï¿½\"ï¿½ï¿½ï¿½\'ï¿½ï¿½w$ï¿½ï¿½ï¿½ï¿½ï¿½n7kf7ï¿½ï¿½\r:ï¿½ï¿½:ï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½ï¿½ï¿½<Þ…tA\nï¿½ÂµoÜ±Ú¶v*ï¿½Mx-ï¿½ï¿½8ï¿½cá­—ï¿½ï¿½ï¿½ï¿½ï¿½=\\kxï¿½m6ï¿½\rï¿½ï¿½ï¿½{ï¿½wï¿½(>ï¿½@ï¿½ï¿½ï¿½Ù¹ï¿½ï¿½ï¿½ï¿½F`ï¿½@ï¿½ï¿½ï¿½ï¿½9ï¿½ï¿½ï¿½ï¿½\'ï¿½ï¿½H:Â›ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Zï¿½4ï¿½$ï¿½ï¿½ï¿½Ö½ï¿½koï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½ï¿½ï¿½jï¿½=ï¿½\0GPï¿½{ï¿½ï¿½qï¿½ï¿½ï¿½ï¿½F`ï¿½@kï¿½]ï¿½*ï¿½ï¿½l_mï¿½ï¿½\Zqï¿½*sï¿½No#ï¿½	oï¿½ï¿½wï¿½Û‡ï¿½*ï¿½5ï¿½ï¿½>Yï¿½ï¿½qï¿½ï¿½Ö„7ï¿½Ú‚;ï¿½Uï¿½ï¿½wxï¿½ï¿½ï¿½Mï¿½ï¿½<~ï¿½ï¿½\\ï¿½ï¿½Ø„7ï¿½Ú‚;>ï¿½+ï¿½ï¿½ï¿½ï¿½ï¿½#ï¿½m\\8ï¿½ï¿½mï¿½zGY#ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Wï¿½_ï¿½ï¿½Lï¿½;6ï¿½5ï¿½Zkpï¿½Jï¿½ï¿½e\n\'ï¿½ï¿½ï¿½ï¿½Õ¿ï¿½	)ï¿½Mï¿½Lï¿½7Ð’ï¿½ï¿½ï¿½ï¿½ï¿½Þ².ï¿½ï¿½ï¿½6pï¿½4ï¿½ï¿½ï¿½ï¿½ï¿½	oï¿½rpohï¿½ï¿½ï¿½ï¿½6ï¿½ï¿½Ý	)ï¿½ï¿½wï¿½oï¿½bpï¿½ï¿½&iW5x|pï¿½jï¿½	~.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\roï¿½ï¿½Zcpï¿½ï¿½ï¿½~ï¿½ï¿½cXï¿½ï¿½zï¿½ï¿½ï¿½*ï¿½sï¿½Þ„7ï¿½Ä‚ï¿½Dï¿½.ï¿½ï¿½ï¿½ï¿½=ì…Ždï¿½;v\nï¿½rÛ¶ï¿½m\'ï¿½	oï¿½ï¿½N,ï¿½Ë’ï¿½ï¿½ï¿½6p$Þ±ï¿½\0/ï¿½\ZIxï¿½\0ï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½ï¿½a:ï¿½ï¿½quPjï¿½Mxï¿½Ig/tï¿½&ï¿½}ï¿½jï¿½ï¿½Ë¼ï¿½1ï¿½ï¿½ï¿½XUVï¿½ï¿½juÔ«#^ï¿½ï¿½UoY&ï¿½Rï¿½kï¿½ï¿½&Kï¿½ï¿½y/ï¿½ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½>ï¿½mï¿½|ï¿½ï¿½\\Þ£%ï¿½ï¿½eï¿½[ï¿½/ï¿½ï¿½.Yï¿½ï¿½ï¿½ï¿½^J}&ï¿½Uï¿½Sï¿½ï¿½\'ï¿½ï¿½Xï¿½ï¿½eï¿½Ijï¿½|ï¿½Gï¿½\\/Ëµï¿½\\#ï¿½eï¿½Jjï¿½\\^!ï¿½ï¿½eï¿½Lï¿½gï¿½\\^ï¿½ï¿½Bï¿½ï¿½nï¿½,ï¿½ï¿½ï¿½ï¿½ï¿½Ì“ï¿½lYÎ”ï¿½nYï¿½;ï¿½ï¿½*Ë·ï¿½~Sï¿½ï¿½ï¿½|Mï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½=+Ë§å¶§ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½jhï¿½ï¿½Qï¿½mL8%ï¿½ï¿½Yï¿½Aï¿½ï¿½ï¿½nï¿½\Zï¿½ï¿½*ï¿½ï¿½Rï¿½ï¿½ï¿½ï¿½r{_Yï¿½%_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\\ï¿½.Ë¨T8ï¿½Ø²Ì”ï¿½Mï¿½ï¿½ï¿½\\ï¿½Eï¿½7ï¿½ï¿½Ý˜ï¿½ï¿½yï¿½|ï¿½rï¿½kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~\nï¿½.ï¿½ï¿½eï¿½ï¿½ï¿½^,ï¿½ï¿½ï¿½ï¿½\\xï¿½Ç‰ï¿½=ï¿½ï¿½ï¿½Oxï¿½@kï¿½ï¿½]ï¿½ï¿½Ø“ï¿½Cï¿½=ï¿½}ï¿½nÇ”eyï¿½ï¿½Øµkï¿½Ó¢ï¿½ï¿½wï¿½ï¿½ï¿½Ï’ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ré‹º,,!pï¿½ï¿½bï¿½3ï¿½ï¿½J	ï¿½ï¿½5ï¿½Pï¿½ï¿½ï¿½vï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½UCDï¿½ï¿½ï¿½Jï¿½2ï¿½ï¿½ï¿½]ï¿½ï¿½SCHï¿½Hï¿½ï¿½ï¿½ï¿½Ô½RCï¿½ï¿½ï¿½Ë•ï¿½ï¿½\Zn\Zrrï¿½Gï¿½Fkï¿½Iï¿½Uï¿½ï¿½ï¿½ï¿½ï¿½xï¿½ï¿½\rM\rOï¿½ï¿½ï¿½,\'iï¿½ï¿½ï¿½ï¿½ï¿½,\'{aï¿½ï¿½ï¿½ï¿½,ï¿½ï¿½ï¿½xï¿½Ü¦olfyaï¿½ï¿½=ï¿½ï¿½ï¿½wï¿½iï¿½{aï¿½ï¿½,ï¿½{oï¿½Í€ï¿½jï¿½Mï¿½ï¿½YXï¿½yï¿½ ï¿½ï¿½(ï¿½ï¿½Þ›}ï¿½ï¿½ï¿½ï¿½ï¿½3ï¿½ï¿½Pï¿½ï¿½{Cï¿½Ã«ï¿½Þ›}ï¿½[ï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½}ï¿½#ï¿½ï¿½ï¿½ï¿½ï¿½{oï¿½zuï¿½{ï¿½{ï¿½{#ï¿½oï¿½ï¿½boï¿½ï¿½Mï¿½ï¿½v$ï¿½ï¿½Qï¿½ï¿½}sï¿½Kï¿½ï¿½2ï¿½7yUï¿½ï¿½ï¿½UZZjï¿½lï¿½b:ï¿½ï¿½mï¿½7\0ï¿½ï¿½:oï¿½mÞ±cï¿½ï¿½ï¿½\rZmï¿½o t\r@}Wï¿½ï¿½ï¿½G?ï¿½ï¿½Mï¿½ï¿½×¯ï¿½Ìƒ6:tpï¿½ï¿½ï¿½ï¿½ï¿½mzï¿½ï¿½ï¿½^_ï¿½muï¿½ï¿½ï¿½^zÉ½ï¿½ï¿½oï¿½Yï¿½0ï¿½>}ï¿½ï¿½3ï¿½ï¿½yï¿½ï¿½=ï¿½ï¿½ï¿½ï¿½ï¿½%ï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\r\rï¿½Ýºï¿½ï¿½ï¿½ï¿½ï¿½\ro\rï¿½Ñ£Gï¿½oï¿½ï¿½}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½://ï¿½ï¿½ï¿½ï¿½m\Zï¿½7ï¿½|ï¿½ï¿½ï¿½ë¯¿^ï¿½mï¿½ï¿½ï¿½ï¿½)Sï¿½ï¿½}ï¿½ï¿½6lï¿½Yï¿½|ï¿½Yï¿½hï¿½ï¿½ï¿½ï¿½ï¿½Lxï¿½;ï¿½kï¿½ï¿½ï¿½>ï¿½mï¿½^ï¿½hXxï¿½ï¿½ï¿½ï¿½ï¿½Wï¿½mï¿½#Fï¿½pï¿½ï¿½ï¿½Ï¯ï¿½.ï¿½]ï¿½t1.4Û·o7O=ï¿½ï¿½{}]ï¿½Í˜1Ãœwï¿½yï¿½ï¿½ï¿½vÎ€Ü¯>\\Þ¿ï¿½ï¿½/ï¿½iï¿½ï¿½fï¿½ï¿½ï¿½ï¿½Ûï¿½ï¿½~/ï¿½ï¿½ï¿½{ï¿½ï¿½oï¿½Ýï¿½/ï¿½ï¿½B3~ï¿½xï¿½oï¿½ï¿½oï¿½_ï¿½ï¿½_ï¿½ï¿½ï¿½oï¿½Ü¹ï¿½ï¿½^{ï¿½5sé¥—ï¿½?ï¿½Sï¿½Nfï¿½Ø±ï¿½7ÐŠ\rï¿½a2nï¿½#ï¿½ï¿½ï¿½Å¨Gxï¿½~\'ï¿½_cï¿½ï¿½ï¿½\r7ï¿½Pï¿½xï¿½ï¿½wï¿½kh<Xï¿½m:}ï¿½uï¿½ï¿½ï¿½{ï¿½h4ï¿½~ï¿½ï¿½ï¿½ï¿½ï¿½Í¨Qï¿½Lï¿½ÎÍ™gï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Û®ï¿½ï¿½J3fï¿½ï¿½ï¿½I\'ï¿½d~ï¿½asï¿½ï¿½ï¿½_ï¿½Ý»ï¿½Lï¿½6ï¿½jï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½Dï¿½ï¿½`oï¿½cï¿½ï¿½hRï¿½ï¿½%%%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½6ï¿½ï¿½~ï¿½{ï¿½ï¿½}ï¿½ï¿½y[ï¿½ï¿½ï¿½Û«ï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½zï¿½ï¿½Uï¿½ï¿½ê«¯ï¿½ï¿½ï¿½oï¿½ï¿½\rï¿½ï¿½ï¿½ï¿½ï¿½mÜ¸ï¿½ï¿½fï¿½9ï¿½ï¿½&ï¿½ï¿½\0ï¿½&ï¿½ï¿½ï¿½ï¿½ßï¿½s#ï¿½á­«ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,[ï¿½ï¿½ï¿½zÏž=nï¿½ï¿½ï¿½\'?ï¿½ï¿½Xxï¿½ï¿½ï¿½ï¿½mÇ…ï¿½cï¿½=ï¿½Þ¦Ó·~ï¿½ï¿½ï¿½_Þ±ï¿½ï¿½o}ï¿½[ï¿½tï¿½ï¿½ï¿½?ï¿½É½mÃ†\rï¿½7ï¿½ï¿½&ï¿½ï¿½lï¿½&ï¿½ï¿½ï¿½^ï¿½rï¿½ï¿½ï¿½×¾f~ï¿½ï¿½ï¿½!ï¿½Dï¿½ï¿½ï¿½jï¿½nï¿½mï¿½zYï¿½ï¿½ï¿½voï¿½]=ï¿½/ï¿½ï¿½ï¿½ï¿½Ïºï¿½ï¿½ujï¿½ï¿½j\nï¿½[nï¿½ï¿½ï¿½ï¿½Öï¿½ï¿½ï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½7+Vï¿½p/Ï›7ï¿½ï¿½Ë„7ï¿½:\'ï¿½dï¿½ï¿½ï¿½F`ï¿½;6_rï¿½%ï¿½mï¿½Úµ3ï¿½]wï¿½Ùºukï¿½ï¿½8pï¿½ï¿½ï¿½ï¿½?wï¿½ï¿½`ÖÒªï¿½ï¿½nï¿½ï¿½ï¿½Ùºï¿½ï¿½Ä‰ÝŸï¿½;ï¿½Å‡wÇŽï¿½o]mï¿½Q1ï¿½~ï¿½9ï¿½_ï¿½sï¿½=ï¿½ï¿½Vï¿½eï¿½h]x2ALp#Pï¿½}ï¿½Ò½ï¿½5ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½ï¿½sï¿½ï¿½ï¿½ï¿½ï¿½vï¿½ï¿½ï¿½ï¿½\01Û¶mcï¿½9ï¿½Z\'ï¿½DVï¿½GÛ°s\ZZXxsxT\0-yï¿½m#\'ï¿½Axï¿½\0ï¿½5}> ï¿½	o\0>ï¿½aqï¿½Í‘ï¿½@xï¿½\0|.6iï¿½ï¿½ï¿½ï¿½Þ„7\0ï¿½Oï¿½ï¿½YVï¿½ï¿½7ï¿½\r @4ï¿½ï¿½\\ï¿½tï¿½7ï¿½\r Xï¿½ÝNï¿½ï¿½&ï¿½+ï¿½;ï¿½	Þ„7ï¿½ï¿½ï¿½wï¿½ï¿½8gï¿½	Þ„7ï¿½ï¿½ï¿½mï¿½ï¿½Gï¿½ï¿½ï¿½oï¿½@ï¿½ï¿½;\'\'ï¿½B:Â›ï¿½YYYï¿½Hï¿½b:Â›ï¿½ï¿½ð–ºŒNï¿½ï¿½&ï¿½\'ï¿½ï¿½Jï¿½ï¿½Nï¿½ï¿½&ï¿½\'ï¿½ï¿½8ï¿½s5ï¿½ï¿½Ì™3ï¿½ï¿½%ï¿½$ï¿½ï¿½e]G\'ï¿½EEEï¿½n#Õ¶mÛ¶Jxï¿½ï¿½ï¿½Zï¿½ï¿½ï¿½Bï¿½ï¿½Mt~0wï¿½ï¿½ï¿½ï¿½ï¿½+wï¿½ï¿½Eï¿½6Bpï¿½ï¿½ï¿½ï¿½\Zï¿½#hyï¿½wï¿½Lï¿½]ï¿½ï¿½Bï¿½fï¿½Lï¿½uuï¿½kÂ„	Fï¿½Lï¿½ï¿½_\\ï¿½ï¿½@ï¿½\rï¿½ï¿½ï¿½p8ï¿½N\0	?gï¿½ï¿½ï¿½ï¿½\0ï¿½aï¿½vI$ï¿½ï¿½pbï¿½ï¿½ï¿½ï¿½ï¿½Ö’ï¿½wï¿½\0ï¿½ï¿½\"JEï¿½ï¿½Ø›ï¿½XxKï¿½\0ï¿½\nï¿½Rï¿½ï¿½ï¿½	ï¿½{t\\pï¿½eYÖ­t@ï¿½sgï¿½Ôtï¿½ï¿½yrï¿½TEï¿½ï¿½zï¿½ï¿½\0Hï¿½ï¿½O&ï¿½ï¿½tï¿½3ï¿½ï¿½ï¿½ï¿½nï¿½ï¿½ï¿½\":ï¿½ï¿½_ï¿½ï¿½ï¿½,k\0ï¿½\0jï¿½ï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½@ï¿½Oï¿½{$ï¿½ï¿½@ï¿½Ï‘ï¿½:ï¿½[ï¿½ï¿½Gï¿½ï¿½ï¿½ï¿½fcï¿½ï¿½ï¿½p8<ï¿½N\0ï¿½Nï¿½ï¿½ï¿½ï¿½#\'ï¿½|ï¿½ï¿½9ï¿½ï¿½]Rï¿½tH8ï¿½oï¿½@ï¿½Ë‘Hï¿½\n=ï¿½OFFï¿½%t@sï¿½ï¿½yï¿½yï¿½N\0ï¿½ï¿½,ï¿½ï¿½<gï¿½ï¿½\0Rï¿½Û¥ï¿½L\'ï¿½ï¿½\'ï¿½ï¿½R{ï¿½ï¿½Tï¿½ï¿½$1ï¿½N\0	Oï¿½Cï¿½ySL\'\0ï¿½rï¿½ï¿½jï¿½ï¿½ï¿½tHï¿½9ï¿½ï¿½ï¿½ï¿½ï¿½	\0ï¿½ï¿½ï¿½?ï¿½ï¿½~ï¿½N\0	ï¿½ï¿½ï¿½usï¿½\0ï¿½ï¿½ï¿½ï¿½,ï¿½=ï¿½N\0	?gï¿½ï¿½ï¿½ï¿½N\0Hï¿½ï¿½A^ï¿½ï¿½ï¿½@btMï¿½ï¿½ï¿½ï¿½\0Rï¿½ï¿½^ï¿½@b,ï¿½zVï¿½{#ï¿½\0ï¿½ï¿½)bï¿½ï¿½ï¿½ï¿½tHï¿½\rï¿½Dï¿½ut@*_ï¿½VIï¿½Oï¿½@ï¿½ox\'ï¿½ï¿½N\0Hï¿½q>ï¿½,ï¿½\r:$ï¿½ï¿½ï¿½Mï¿½ï¿½ï¿½ï¿½Tï¿½ï¿½r	ï¿½ï¿½ï¿½ï¿½sfï¿½Lï¿½Kï¿½ï¿½Tï¿½-ï¿½ï¿½~ï¿½N\0	Oï¿½yzï¿½P: ï¿½/Dï¿½ï¿½fï¿½	 ï¿½7ï¿½ï¿½eï¿½K\'\0ï¿½2ï¿½tï¿½ï¿½@ï¿½Ï™Å¼ï¿½ï¿½ï¿½ï¿½|ï¿½ytHï¿½Lï¿½ï¿½dï¿½~ï¿½N\0Hexï¿½ï¿½Hï¿½9ï¿½Rï¿½u: ï¿½/D3uï¿½7ï¿½\0ï¿½ï¿½9ï¿½ï¿½ï¿½ï¿½c/@ï¿½ox7HMï¿½\0Rï¿½oï¿½6<:$ï¿½ï¿½ï¿½L|\0RKï¿½ï¿½ï¿½GYï¿½@Â“ï¿½V	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½8ï¿½@ï¿½Ï™mï¿½pxï¿½\0ï¿½ï¿½ï¿½W$ï¿½ï¿½ï¿½	 ï¿½ï¿½ï¿½N	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Noï¿½ï¿½N\0	?gvK\rï¿½\0Rï¿½qï¿½ï¿½tï¿½Y:$ï¿½{ï¿½ï¿½	\0ï¿½ï¿½ï¿½h3ï¿½\0ï¿½}R}ï¿½ï¿½ï¿½	ï¿½ï¿½OÚ¶ï¿½ï¿½N\0	ï¿½ï¿½yï¿½ï¿½N\'\0ï¿½ï¿½~ï¿½E?ï¿½B\'ï¿½ï¿½ï¿½ï¿½ï¿½Tï¿½N\0HË²ï¿½8ï¿½SH\'ï¿½ï¿½ï¿½ï¿½p8Nï¿½\0R9y?\"/Fï¿½ï¿½ï¿½pxï¿½Ixï¿½L\'\0ï¿½ï¿½ï¿½Aï¿½tHï¿½9Sï¿½8Îµt@*_ï¿½rï¿½vï¿½	 ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½	\0ï¿½|!\Zï¿½ï¿½ï¿½@ï¿½Ï™ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½Tï¿½\rï¿½*ï¿½@ï¿½Ï™JÛ¶@\'\0ï¿½ï¿½eYï¿½ï¿½ï¿½N\0ï¿½ï¿½wzzï¿½Yt@ï¿½ï¿½ï¿½Wï¿½E\'ï¿½ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½T: ï¿½ï¿½w/ï¿½ï¿½ï¿½ï¿½@ï¿½á›ï¿½ÛŽN\0Hï¿½ï¿½}ï¿½ï¿½N\0\'ï¿½ï¿½ï¿½ï¿½M\'\0ï¿½zï¿½ï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½t$ï¿½ï¿½ï¿½#ï¿½Å¨ï¿½N\0\'ï¿½;ï¿½ï¿½kt@ï¿½\'ï¿½L=V3ï¿½\0ï¿½ï¿½/ï¿½mï¿½ï¿½ï¿½Zï¿½euï¿½ï¿½.ï¿½ï¿½ï¿½ï¿½ï¿½YÇ©ï¿½\0R*\nï¿½$/Fet81=,ï¿½ï¿½N\0Hï¿½ï¿½ï¿½ï¿½ï¿½%ï¿½ï¿½ï¿½ï¿½ï¿½#ï¿½ï¿½ï¿½D\"Wï¿½ï¿½xï¿½e]ï¿½\'&ï¿½\0ï¿½ï¿½ï¿½ï¿½^yï¿½9ï¿½ï¿½ï¿½tï¿½ï¿½Zjï¿½ï¿½ï¿½ï¿½ï¿½Sï¿½ï¿½	\0ï¿½ï¿½/ï¿½ï¿½nï¿½ï¿½Mï¿½ï¿½ã±ƒ\'ï¿½ï¿½HKKkï¿½ï¿½wmï¿½mï¿½ï¿½Zï¿½ï¿½ï¿½ï¿½7[ï¿½#ï¿½ï¿½\0_Mï¿½Lï¿½@ï¿½8\"!ï¿½TOï¿½e5ï¿½w!ï¿½ï¿½oNï¿½ ï¿½/B#kï¿½ï¿½ï¿½3@ï¿½ï¿½y2Pjï¿½\0ï¿½ï¿½ï¿½/ï¿½Â›$ï¿½ï¿½Ï™ï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½Iï¿½ï¿½ï¿½ÝŸï¿½\0\'|ï¿½< Ï—tï¿½/ï¿½o:ï¿½X8eï¿½ï¿½6: ï¿½,ï¿½\ZBx	ï¿½ï¿½+ï¿½)ï¿½\0Z0cLï¿½-[ï¿½.^ï¿½ï¿½Ì™3ï¿½Ìž=Û—ï¿½8ï¿½oï¿½mZyyyfï¿½ï¿½ï¿½ROï¿½B*ï¿½ï¿½=^ï¿½/ï¿½ï¿½Ð‚ipï¿½ï¿½ï¿½\"SVVF5ï¿½vï¿½ï¿½mï¿½ï¿½ï¿½+%ï¿½Gï¿½ï¿½B\n\'ï¿½	Rï¿½Ð‚ï¿½ï¿½Mp7nï¿½ï¿½$ï¿½qï¿½ï¿½ï¿½ï¿½ï¿½	ï¿½5thï¿½tU9ï¿½Û¸ï¿½ï¿½ï¿½yd!ï¿½ï¿½ï¿½ï¿½R+ï¿½Ð‚iï¿½ï¿½ï¿½7ZTxOï¿½zï¿½N\0ï¿½ï¿½9ï¿½oï¿½Ù²ï¿½yï¿½6ï¿½>ï¿½ï¿½ï¿½^GXï¿½ï¿½]xÏ”ZD\'ï¿½Vï¿½ï¿½n7kf7ï¿½ï¿½\r:ï¿½ï¿½:ï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½mï¿½ug>ï¿½\0Zyxï¿½}ï¿½ï¿½ï¿½ï¿½Õ¶ï¿½S	lï¿½ï¿½ï¿½ï¿½ß•\0ï¿½M\'ï¿½Vï¿½ï¿½ï¿½=\\kxï¿½m6ï¿½\r_Mï¿½Kdï¿½F\'ï¿½Vï¿½kfï¿½ï¿½\Zï¿½zï¿½Mxï¿½Wï¿½Bï¿½{\nï¿½\0oÂ›ï¿½Fpï¿½{uVVÖ«thï¿½ï¿½{ï¿½ï¿½ï¿½zï¿½Mxï¿½?$ï¿½ï¿½IMï¿½@+ï¿½Mï¿½ï¿½\Zï¿½zï¿½Mxï¿½Wï¿½Iï¿½:ï¿½ï¿½ï¿½Þ³}ï¿½Y3kï¿½ï¿½ï¿½ï¿½:ï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½ï¿½|bï¿½ï¿½thï¿½ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½.ï¿½,kï¿½\0Z{xï¿½ï¿½ï¿½Mï¿½ï¿½<~ï¿½ï¿½\\ï¿½ï¿½Ø„7ï¿½#++ï¿½s	ï¿½ï¿½ï¿½ÐŠï¿½[ï¿½ï¿½ï¿½qï¿½ï¿½Zï¿½yï¿½meï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½T.ï¿½\0Zcxï¿½Dï¿½cï¿½\\ï¿½áŒ¡ï¿½wï¿½ï¿½>z_ï¿½pï¿½ï¿½ï¿½bï¿½ï¿½theï¿½}ï¿½iï¿½)ï¿½ï¿½ï¿½9ï¿½ï¿½Wï¿½?ï¿½\0ZYx\'2mï¿½5ï¿½Þ„7R\Zï¿½ï¿½-ï¿½ï¿½E\'ï¿½Vï¿½ï¿½\rï¿½XÞ„7R\'++ë „ww:ï¿½ï¿½ï¿½oï¿½mï¿½%ï¿½HÄ¦\0ï¿½Mï¿½ï¿½ï¿½]*ï¿½wW:ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½8ï¿½ï¿½\0ï¿½Mï¿½Nxï¿½ï¿½N\0ï¿½7Ex#8ï¿½}Tï¿½2:ï¿½á€ï¿½ï¿½ï¿½\"##ï¿½t ï¿½)ï¿½ï¿½ï¿½ï¿½+ï¿½ï¿½G\'\0ï¿½ï¿½ï¿½ï¿½Ñ~ï¿½u\\ï¿½ï¿½ï¿½ï¿½Lï¿½:ï¿½ï¿½ï¿½	&ï¿½ï¿½_ï¿½dIï¿½uï¿½<ï¿½Hï¿½ï¿½Yï¿½tï¿½{ï¿½7ï¿½ï¿½\rï¿½{ï¿½nï¿½hxxï¿½ï¿½]ï¿½ï¿½F\'\0ï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½Ñ£Í7ï¿½ï¿½oï¿½>}Ü¯ï¿½ï¿½ï¿½	ï¿½nÝºï¿½ï¿½è¡‡jï¿½^ï¿½zU]ï¿½ï¿½ï¿½ï¿½@#ï¿½wÏž=Oï¿½\0ï¿½]kï¿½1ï¿½\rï¿½ï¿½ï¿½ï¿½W]ï¿½o~ï¿½ï¿½ï¿½ï¿½vï¿½ï¿½ï¿½Ì©ï¿½ï¿½zLxï¿½Û·ï¿½tï¿½ï¿½ï¿½\\yï¿½ï¿½ï¿½K.ï¿½ï¿½Ó¦M3ï¿½wï¿½ï¿½ï¿½;Ì™gï¿½iï¿½ï¿½ï¿½ï¿½Ì˜1ã„·ï¿½ï¿½ï¿½ï¿½m2yï¿½ï¿½oï¿½ï¿½ï¿½ï¿½ï¿½W_5ï¿½ï¿½ï¿½aN9ï¿½ï¿½w-^ï¿½ï¿½ï¿½Fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½qï¿½)Lï¿½\0ï¿½Ý ï¿½ï¿½[ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Õ¯~uLxï¿½ï¿½ï¿½_ï¿½?ï¿½\rbï¿½ï¿½ï¿½ïº·iï¿½ï¿½ï¿½\Zï¿½#Gï¿½4ï¿½ï¿½ï¿½ï¿½Ü .--ï¿½ï¿½^zÉ½ï¿½sï¿½qï¿½~\rï¿½vï¿½Ú™ï¿½/ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½~ï¿½[ï¿½vï¿½\"ï¿½ï¿½bØ¶}ï¿½ï¿½ï¿½ï¿½ï¿½kYï¿½ut ï¿½ï¿½ï¿½\ZÒºï¿½ï¿½oï¿½.Gï¿½\ZuLx_sï¿½5ï¿½ï¿½\Zï¿½<ï¿½ï¿½{9\'\'ï¿½ï¿½~ï¿½ï¿½Ý¯~ï¿½ï¿½ï¿½Sï¿½mï¿½ï¿½~ï¿½ï¿½ï¿½Û†ï¿½~ï¿½ï¿½ï¿½ï¿½k\r{ï¿½ï¿½ï¿½ï¿½_\'ï¿½xï¿½Pï¿½dï¿½ï¿½ï¿½JUHï¿½*Wï¿½ï¿½+\0ï¿½Ý ï¿½Ö=ï¿½ï¿½sï¿½ï¿½:ï¿½.\\ï¿½ï¿½*ï¿½×­[gï¿½ï¿½ï¿½ï¿½ï¿½ï¿½[lÇµï¿½ï¿½aï¿½_ë¿·ï¿½ï¿½bï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½[ï¿½ï¿½ï¿½ï¿½ï¿½Uï¿½7ï¿½Lï¿½ï¿½ï¿½R_pPï¿½ï¿½nï¿½ï¿½ï¿½Fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fï¿½ï¿½ï¿½Uï¿½=hï¿½ ï¿½ï¿½Ø±cÍ¢Eï¿½ï¿½\Z0`@ï¿½ï¿½ï¿½.ï¿½ï¿½ï¿½c]ï¿½ï¿½ï¿½ï¿½ï¿½6%%%uï¿½ï¿½)Sï¿½Tm×¯uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½-ï¿½ï¿½ï¿½Ð¬Xï¿½ï¿½È‹ï¿½ï¿½7o^ï¿½ï¿½	oï¿½qÚ¶m{ï¿½~ï¿½[jï¿½6@x7zx?ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½Ð½ï¿½ï¿½ï¿½uï¿½n{>tï¿½Pï¿½ï¿½mÝºÕœtï¿½Iï¿½ï¿½K/ï¿½\nï¿½+ï¿½ï¿½Â´mï¿½ï¿½tï¿½ï¿½Ù¼ï¿½ï¿½Ç¬Rï¿½ï¿½Xxï¿½ï¿½ï¿½ï¿½ï¿½7ï¿½:urï¿½?ë¬³ï¿½ï¿½^?}ï¿½tï¿½:ï¿½ï¿½^ï¿½eï¿½~bYÖ­zï¿½O	ï¿½b	ï¿½+ï¿½@xï¿½ï¿½bï¿½K]ï¿½ï¿½uï¿½V[ï¿½ï¿½lÛ¶mï¿½bï¿½ï¿½ï¿½ï¿½ï¿½ï¿½y:mï¿½roß‡w2ï¿½ï¿½9oï¿½42aï¿½$ï¿½KdYï¿½Dï¿½ï¿½#\0|ï¿½ï¿½ï¿½ï¿½ï¿½>pï¿½ï¿½ï¿½Fxï¿½ï¿½ï¿½ï¿½Hhï¿½ï¿½ï¿½2q?MG\0ï¿½>ï¿½9ï¿½\ZZ3	ï¿½ï¿½aï¿½ï¿½pï¿½R:ï¿½ï¿½&ï¿½ï¿½Sï¿½Pï¿½ï¿½ï¿½ï¿½:mÛ¶ï¿½@xï¿½ï¿½1Ë²ï¿½K`ï¿½Jpoï¿½ï¿½ï¿½\0Â›ï¿½ï¿½Oï¿½ï¿½ï¿½tï¿½ï¿½^ï¿½}nï¿½ï¿½t\0ï¿½Mxï¿½ï¿½$ï¿½ï¿½*ï¿½ï¿½,##ï¿½t\0ï¿½MxÃ§Bï¿½P\'ï¿½ï¿½ï¿½ï¿½ï¿½p8<ï¿½ï¿½\0 ï¿½	oï¿½ï¿½ï¿½ï¿½]ï¿½ï¿½Rï¿½ï¿½ï¿½ï¿½\\HG\0Þ„7|JÏ±-ï¿½ï¿½Rï¿½Ôƒt\0ï¿½Mxï¿½ï¿½$ï¿½ï¿½ï¿½-Sï¿½ï¿½h4z>@xï¿½ï¿½)	ï¿½3lï¿½ï¿½Ð›ï¿½sï¿½\0Â›ï¿½ï¿½ï¿½ï¿½ï¿½RGï¿½6H}ï¿½ï¿½\0 ï¿½	oï¿½Tzzï¿½Yï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½P:ï¿½ï¿½&ï¿½ï¿½c\Zï¿½Þ´ï¿½ï¿½[ï¿½ngï¿½\0MbÎœ9.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½q\rï¿½t@ï¿½*((ï¿½(**\"tï¿½ï¿½mÛ¶UÂ»ï¿½GVï¿½ï¿½ï¿½Gï¿½iï¿½cï¿½ï¿½FG\04ï¿½ï¿½sï¿½>ï¿½ï¿½ï¿½_ï¿½kï¿½.ï¿½ciiï¿½ï¿½;//ï¿½ï¿½hY-ï¿½~ï¿½K?ï¿½ï¿½}ï¿½?Ð¬$lFÊ´xPWï¿½ï¿½ï¿½fÍšeï¿½Eï¿½ï¿½ï¿½ß¨7ï¿½ï¿½:HX?ï¿½}ï¿½kï¿½|ï¿½ï¿½\0@-4ï¿½ï¿½Ltï¿½ï¿½ï¿½3ï¿½Ãšzï¿½ï¿½]t\0Nï¿½ï¿½ï¿½ï¿½=ztï¿½Hï¿½ï¿½ï¿½=ï¿½ï¿½ï¿½PDO,BG\0 ï¿½ï¿½[ï¿½ï¿½t)ï¿½@sï¿½Suï¿½);ï¿½Swï¿½AG\0 ï¿½ï¿½>bYï¿½5tï¿½Eï¿½ï¿½Gï¿½*dï¿½^ï¿½&\0ï¿½_xï¿½Jxwï¿½hjï¿½?ï¿½ï¿½ï¿½v}ï¿½Ixï¿½FG\0ï¿½ï¿½ï¿½}H^Hï¿½ï¿½ï¿½ï¿½q6N7ï¿½H-ï¿½Ò¥Ë©t\0\Z@ï¿½ï¿½Kï¿½ï¿½{ï¿½	4ÝŸB{ï¿½ï¿½aï¿½0ï¿½Æ™ï¿½ï¿½Hxï¿½K\'ï¿½ï¿½lï¿½ï¿½ï¿½I>ï¿½gÏžï¿½ï¿½\0hï¿½ï¿½ï¿½)/ï¿½#ï¿½\ZK(ï¿½\\SER%R!:\0ï¿½Lï¿½ï¿½Bï¿½ï¿½ï¿½ï¿½	4Ò›ï¿½	ï¿½\'ï¿½,ç¤¥ï¿½ï¿½ï¿½#\0ï¿½4/ï¿½ï¿½tï¿½ï¿½@Cï¿½cï¿½J	ï¿½by<ï¿½7ï¿½ï¿½ï¿½\0hï¿½ï¿½^\'5ï¿½Nï¿½ï¿½ï¿½JhOï¿½í™¡Pï¿½dZ\0Mï¿½+ï¿½^ï¿½Hï¿½ï¿½ÕºÃ£ï¿½ï¿½[ï¿½\04_x/ï¿½ï¿½N\'ï¿½Ì´-ï¿½ï¿½WuOrË²ï¿½aï¿½ï¿½ï¿½ï¿½|ï¿½ytï¿½ï¿½ï¿½ï¿½Î¶ï¿½2uï¿½Ð¾ï¿½ï¿½\0@jï¿½{ï¿½Nï¿½tuï¿½ï¿½ï¿½m\'ï¿½ï¿½ï¿½wï¿½ï¿½7ï¿½kï¿½\0ï¿½ï¿½ï¿½Þ)ï¿½:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_Jï¿½ï¿½ï¿½Ì¼ï¿½ï¿½\0@ï¿½\'ï‰ºï¿½9ï¿½@MÓ¶ï¿½ï¿½ï¿½Qï¿½^ï¿½ï¿½ï¿½ï¿½\0ï¿½=ï¿½ï¿½ï¿½0oï¿½ï¿½ï¿½oÖ½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½Ñ£ï¿½ï¿½Qï¿½ï¿½ï¿½ï¿½9ï¿½ï¿½Axï¿½ï¿½~ï¿½i\0ï¿½9aÝ¯ï¿½7ï¿½ï¿½ï¿½ï¿½oï¿½iRï¿½ï¿½ï¿½ï¿½Wï¿½\0ï¿½ï¿½ï¿½}ï¿½hï¿½Nï¿½^zrÛ¶gï¿½-ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½uï¿½7nï¿½Rï¿½ï¿½vG\"ï¿½+ï¿½\0#ï¿½ï¿½eï¿½:D\'Z=ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3t\0Ä²ï¿½ï¿½ï¿½ï¿½]J\'Zï¿½6Gï¿½ï¿½%ï¿½ï¿½ï¿½ï¿½et\0ï¿½ï¿½B~ï¿½ï¿½ï¿½ï¿½Ó‰ï¿½/\nuï¿½ï¿½uï¿½Nï¿½ï¿½pï¿½I:\0%/ï¿½ï¿½9ï¿½hï¿½ï¿½oï¿½:,ï¿½yFFï¿½%t\0,\Zï¿½ï¿½//ï¿½tï¿½eï¿½Ò¥Ë©Þ™ï¿½*lï¿½~ï¿½ï¿½\0@ï¿½ï¿½ï¿½ï¿½Q^ï¿½\rï¿½hï¿½ï¿½ï¿½ï¿½tï¿½ï¿½H$r1ï¿½ï¿½ï¿½-ï¿½ï¿½\"ßï¿½ï¿½MÛ£ï¿½\0ï¿½ï¿½	ï¿½ï¿½>ï¿½>Ë²zï¿½ß³Ljï¿½ï¿½Et\0Z(yï¿½ï¿½ï¿½Ñ£Gg:\\]ï¿½v=Mï¿½ï¿½+$ï¿½ï¿½:ï¿½ï¿½ï¿½ï¿½?yï¿½Gï¿½.ï¿½ï¿½}ï¿½ï¿½Wï¿½\\ï¿½[ï¿½~@G\0ï¿½uï¿½ï¿½Nï¿½<ï¿½hï¿½;ï¿½[ï¿½Ó¶ï¿½ï¿½H:\0ï¿½+ï¿½Kï¿½Hkt\"8dÒ¾Gï¿½tImbï¿½\0ï¿½ï¿½ï¿½>ï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½Lï¿½kï¿½ï¿½FG\0ï¿½ï¿½Nq_ï¿½^ï¿½tï¿½ï¿½oï¿½Kpï¿½ï¿½ï¿½[ï¿½ngï¿½\0hÝ¡ï¿½Gï¿½ï¿½M\'ï¿½Iï¿½ZÛ›ï¿½ï¿½\0ï¿½ï¿½ï¿½Nvxï¿½ï¿½ï¿½fï¿½ï¿½Cï¿½Z]eNG\0\0.ï¿½q\neï¿½C\'ï¿½CwBÓï¿½ï¿½oï¿½@G\0\0Õ§ï¿½ï¿½eï¿½{ï¿½Nï¿½C8ï¿½ß›ï¿½Wï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½ï¿½^\'5ï¿½Nï¿½ï¿½`ï¿½qï¿½Oï¿½ï¿½ï¿½ï¿½#\0ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½t\"ï¿½ï¿½?ï¿½-ï¿½ï¿½ê”Ž\0\0Nzï¿½ï¿½ï¿½t\"%ï¿½ï¿½Ezï¿½ï¿½Ë¤ï¿½#\0ï¿½Dï¿½;_jï¿½h^ï¿½ï¿½ï¿½vï¿½ï¿½Rï¿½ï¿½\0H6ï¿½ï¿½ï¿½ï¿½M\'ï¿½G$ï¿½X&ï¿½mzXZï¿½ï¿½ï¿½\0@}&ï¿½7dï¿½ï¿½ï¿½N4ï¿½ï¿½ï¿½z7ï¿½E]ï¿½t9ï¿½ï¿½\0\0ï¿½(uï¿½s:ï¿½t222.ï¿½ï¿½:,ï¿½#\0ï¿½ï¿½m{ï¿½LÞ›ï¿½Dï¿½ï¿½ï¿½)oï¿½^\nï¿½:ï¿½\0@ï¿½y;NÒ‰ï¿½%A}ï¿½ï¿½.ï¿½ï¿½H$bï¿½\0@ï¿½ï¿½èµ“N4ï¿½ï¿½guOrï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:\0hì ¹Wï¿½,F\'\ZNï¿½ï¿½3ï¿½ï¿½zï¿½tySï¿½NG\0\0MB&Ä»ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½ï¿½ï¿½NÛ²ï¿½ï¿½ï¿½ï¿½Öžï¿½\0\0ï¿½2ï¿½ï¿½mï¿½>D\'ï¿½\';;ï¿½*]s!uÐ²ï¿½ï¿½t\0ï¿½ï¿½4pï¿½!t\"imï¿½Mï¿½+ï¿½\'ï¿½ï¿½ï¿½\nï¿½Nï¿½%\0ï¿½æš¼ï¿½ï¿½ï¿½FÓ‰ï¿½z&ï¿½Wï¿½{8ï¿½ï¿½ï¿½\0\0ï¿½ï¿½ï¿½Ï¥:=Ò‰Ä¦m	ï¿½×´_ï¿½eï¿½ï¿½ï¿½ï¿½ÛŽï¿½\0\0ï¿½]4\Z=_Â¨ï¿½Nï¿½-33ï¿½zï¿½ï¿½>ï¿½/%ï¿½AG\0\0)ï¿½gï¿½ï¿½@2tï¿½f:]Kï¿½ôŽ’¦ï¿½=oKW\0\0ï¿½Ö–ï¿½Y(ï¿½Iï¿½kï¿½ï¿½mï¿½ï¿½MG\0\0ï¿½ï¿½ï¿½ï¿½9ï¿½ï¿½	ï¿½-ï¿½zGï¿½ï¿½p8ï¿½wï¿½m\0ï¿½ï¿½ï¿½tYÙ£Gï¿½ï¿½tï¿½ï¿½sï¿½ï¿½ï¿½2m_MG\0\0~ï¿½ï¿½uÂ¼ï¿½5ï¿½@ï¿½ï¿½ï¿½GGï¿½6ï¿½G\0ï¿½ï¿½ï¿½}D&ï¿½kZï¿½ï¿½ï¿½ï¿½\\ï¿½2\'ï¿½ï¿½%ï¿½ï¿½\0@Â»ï¿½5ï¿½Sï¿½ï¿½ï¿½gï¿½ï¿½i[ï¿½9	\0ï¿½ ï¿½ï¿½!=ï¿½ykï¿½ï¿½slï¿½=ç¶ž{ï¿½G\0 Pï¿½ï¿½b2yï¿½j\rï¿½ï¿½ï¿½$ï¿½ï¿½v~	ï¿½ï¿½ï¿½ï¿½\0Aï¿½ï¿½ï¿½ï¿½yï¿½[ï¿½ï¿½ï¿½lï¿½=,ï¿½ï¿½ï¿½ï¿½\0~xï¿½)tdKï¿½ï¿½ï¿½Ò¥Ë©ï¿½ï¿½ï¿½ï¿½;Jï¿½8ï¿½ï¿½\0ï¿½ï¿½0ï¿½ï¿½ï¿½=ï¿½ï¿½ï¿½ï¿½Ý¦;ï¿½É›ï¿½mï¿½Hï¿½bï¿½ï¿½\0ï¿½ï¿½2y,ï¿½ï¿½TKï¿½ï¿½#ï¿½Ip/ï¿½=ï¿½[ï¿½\0@ï¿½ï¿½u-ï¿½ï¿½$ï¿½wJï¿½ï¿½ï¿½ï¿½VySra\0@Kï¿½ï¿½ï¿½-\nuï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Jï¿½ï¿½ï¿½,\0ï¿½%ï¿½ï¿½bï¿½ï¿½ï¿½ï¿½#ï¿½vï¿½ï¿½\'2mï¿½ï¿½ï¿½*\0ï¿½ï¿½ï¿½wï¿½Ô¼ ï¿½Û£ï¿½ï¿½w$ï¿½uï¿½ï¿½ï¿½p8|?M\0@k	ï¿½ï¿½:}ï¿½ï¿½mYï¿½\0ï¿½wï¿½Kmï¿½h\0ï¿½VEBï¿½\rï¿½q>Ê¿Wï¿½ï¿½gH`ï¿½ï¿½ï¿½ï¿½\0ï¿½qï¿½{ï¿½ï¿½Æ½z4ï¿½\rRï¿½ï¿½\0hï¿½ï¿½ï¿½2ï¿½nï¿½Ëºï¿½Y._ï¿½Xuï¿½ï¿½ï¿½l	ï¿½ï¿½ï¿½ï¿½ï¿½Ó—ï¿½\0h5\"ï¿½ï¿½ï¿½Wï¿½Nï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½3>Z30ï¿½ï¿½ï¿½ï¿½MOO?ï¿½ï¿½\"\0ï¿½5Nï¿½[ï¿½mï¿½áž–ï¿½ï¿½>ï¿½ï¿½No-ï¿½F\rnYï¿½ï¿½_\0Ðªï¿½ï¿½ï¿½[ï¿½}ï¿½ï¿½`ï¿½ï¿½ï¿½dï¿½Z?ï¿½_\r\0ï¿½ï¿½mï¿½+j	ï¿½\n=.xï¿½ï¿½]ï¿½ï¿½ï¿½Ö½ï¿½ï¿½ï¿½ï¿½/\0ï¿½GWI{ï¿½È¬ï¿½ï¿½ï¿½ï¿½ï¿½8ï¿½C:mï¿½ï¿½Öºvï¿½z\Z%\0\0ï¿½ï¿½ï¿½\'×°ï¿½ï¿½ï¿½ï¿½ï¿½wÈ¤ï¿½ï¿½ï¿½Oï¿½ï¿½,ï¿½ï¿½ï¿½_\0ï¿½Zï¿½Niï¿½%qï¿½5o Fï¿½\Z\0Y.ï¿½ï¿½ï¿½W\0ï¿½ï¿½ï¿½ï¿½x,ï¿½eê½µï¿½~oFFï¿½eï¿½/ï¿½ï¿½[*ï¿½ï¿½ï¿½ï¿½K\0\0ï¿½\\ï¿½ï¿½ï¿½nï¿½7Üºï¿½}qï¿½.]Nï¿½/\0\0@ï¿½dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½-ï¿½ï¿½%ï¿½ï¿½%ï¿½Kï¿½wvï¿½ï¿½\0\0ï¿½ï¿½`)\rï¿½Mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Bï¿½ï¿½\0ï¿½ï¿½ï¿½Wï¿½Rjï¿½ï¿½lï¿½\0ï¿½ï¿½ï¿½L&í²<ï¿½ï¿½\r\0@ï¿½w,ï¿½ï¿½5fï¿½ï¿½ï¿½Ñ½i{^Ïž=Oï¿½ï¿½\0\04npï¿½ï¿½ï¿½ï¿½yï¿½_-ï¿½Òï¿½eï¿½j\0\0ï¿½.ï¿½ï¿½ï¿½>,ï¿½ï¿½8ï¿½ï¿½\'ï¿½mÛ³ï¿½pr\0\0ZCpï¿½$ï¿½\n]ï¿½ï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½f\0\0ï¿½7ï¿½ï¿½ï¿½ï¿½x[	ì—½ï¿½mOï¿½B\'ï¿½f\0\0Rï¿½ï¿½ï¿½WQï¿½ï¿½Yï¿½uï¿½ï¿½RdÚ¾ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½	ï¿½ï¿½wRï¿½\nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½mGï¿½\0hï¿½ï¿½n+ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½=ï¿½ï¿½%ï¿½ï¿½Ih)~#ï¿½\0ï¿½ï¿½{Cï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½~ï¿½ï¿½rJï¿½ï¿½ksï¿½×®eï¿½\0ï¿½éƒ»ï¿½7Iï¿½ï¿½ï¿½)ï¿½ï¿½;Vï¿½c7jï¿½ï¿½iï¿½#ï¿½\0@pï¿½ï¿½5s|ï¿½ï¿½ï¿½ï¿½ï¿½F=\0\0wï¿½ï¿½Z[@ï¿½K0ï¿½ï¿½O\0@ï¿½w]^ï¿½DpWï¿½aï¿½\0ï¿½ï¿½ï¿½<ï¿½ï¿½ï¿½a:\0\0ï¿½ï¿½ï¿½ÝµI~_ï¿½\Z&ï¿½2ï¿½ï¿½dï¿½ï¿½3\n\0\0ï¿½ï¿½ï¿½]ï¿½ï¿½Ø“ï¿½Cï¿½	\0\0ï¿½ï¿½7ï¿½6ï¿½Ø±ï¿½Ye\0@xcï¿½m^ï¿½Ó†\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½ï¿½6ï¿½e\0@ï¿½Vï¿½dï¿½ï¿½#ï¿½ï¿½MÜ£i1\0\0M3ï¿½7Ú±ï¿½	n\0\0ï¿½wï¿½ï¿½ï¿½m;ï¿½Xï¿½ï¿½ï¿½<7\0\0ï¿½<ï¿½7d5ï¿½\r\0ï¿½&ï¿½dï¿½ï¿½ï¿½\0 ï¿½x2ALp\0ï¿½ï¿½	<ï¿½Uï¿½ï¿½6ï¿½\0@`&ï¿½ï¿½6rï¿½\0ï¿½\0xMï¿½\0\0>ï¿½ï¿½qï¿½Í‘ï¿½\0\0ï¿½ï¿½mï¿½ï¿½Xï¿½ï¿½pv0\0\0ï¿½/\nuï¿½ï¿½ï¿½ï¿½\0\0ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½ï¿½L7\0\0ï¿½ï¿½}ï¿½ï¿½ï¿½Q:\0@@dff^ï¿½8N9ï¿½\0\0  ï¿½ï¿½pï¿½LÞ‡ï¿½\0\0!Sï¿½mï¿½ï¿½\0\0!ï¿½ï¿½Ï¶ï¿½t\0ï¿½ï¿½ï¿½ï¿½0ï¿½ï¿½t\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½	\0\0ï¿½ï¿½ï¿½>ï¿½\0\0\'ï¿½\'Hmï¿½\0\0ï¿½mÛ“ï¿½Vï¿½	\0\0Â²ï¿½wdï¿½~ï¿½N\0\0ï¿½ï¿½{ï¿½ï¿½ï¿½:\0@@Hp/ï¿½ï¿½I\'\0\0ï¿½q>ï¿½ï¿½B\'\0\0ï¿½ï¿½Nï¿½{ï¿½\0\0 8ï¿½ï¿½ï¿½mï¿½ï¿½ï¿½\0\0ï¿½	ï¿½BË²ï¿½ï¿½	\0\0ï¿½ï¿½;eï¿½I\'\0\0Nxï¿½\ZH\'\0\0ï¿½qï¿½Kï¿½I\'\0\0ï¿½ï¿½]\"ï¿½ï¿½ï¿½	\0\0ï¿½ï¿½eï¿½pï¿½f:\0@@Ø¶}$;;ï¿½*:\0@p&ï¿½H$r1ï¿½\0\0 8ï¿½]ï¿½ï¿½ï¿½~ï¿½\0\0 8ï¿½mï¿½ï¿½ï¿½ï¿½ï¿½	\0\0@C[Ã›N\0\0ï¿½ï¿½\\Wï¿½ï¿½	\0\0BwTï¿½ï¿½ï¿½\0\0ï¿½Óï¿½ï¿½	\0\0BÎ¢iï¿½\0\0ï¿½Uï¿½J\'\0\0Nxß©\'&ï¿½\0\0ï¿½ï¿½\nTO	J\'\0\0Û¶GJxï¿½\0\0ï¿½eYcï¿½)ï¿½\0\0gï¿½/á½™N\0\0Ü“$ï¿½ï¿½ï¿½	\0\0ï¿½ï¿½S$ï¿½Wï¿½	\0\0\"++kï¿½ï¿½\":\0@pï¿½{ï¿½ï¿½:\0@pï¿½ï¿½=ï¿½ï¿½t\0ï¿½ï¿½ï¿½m{ï¿½ï¿½ï¿½ï¿½t\0ï¿½ï¿½Lï¿½ï¿½yï¿½N\0\0ï¿½ï¿½ï¿½Tj,ï¿½\0\0 8ï¿½ï¿½ï¿½Lï¿½ï¿½	\0\0Â¶ï¿½ï¿½ï¿½px(ï¿½\0\0 8ï¿½ï¿½>	ï¿½t\0ï¿½ï¿½ï¿½ï¿½AË²ï¿½ï¿½	\0\0ï¿½Þ‡%ï¿½oï¿½\0\0\'ï¿½ï¿½%ï¿½ï¿½ï¿½\0\0\'ï¿½ï¿½J]F\'\0\0NxWFï¿½ï¿½ï¿½ï¿½\0\0ï¿½	oï¿½ï¿½ï¿½Ó‘N\0\0m5ï¿½uI+\0\0ï¿½P(ï¿½ï¿½o\0\0ï¿½mï¿½@ï¿½yï¿½	\0\0ï¿½3y_ï¿½{ï¿½ï¿½	\0\0\"33ï¿½zï¿½qï¿½ï¿½\0\0ï¿½ï¿½ï¿½kt\0ï¿½ï¿½ï¿½ï¿½ï¿½6=ï¿½9ï¿½\0\0  $ï¿½ï¿½Ù¶ï¿½ï¿½N\0\0ï¿½ï¿½&ï¿½ï¿½N\0\0ï¿½ï¿½ï¿½ï¿½ï¿½v:\0@pï¿½{ï¿½ï¿½\'t\0ï¿½ï¿½ï¿½ï¿½ï¿½\rt\0ï¿½ï¿½ï¿½m{ï¿½ï¿½j:\0@@Xï¿½ï¿½ï¿½Lï¿½ï¿½ï¿½	\0\0ï¿½3yÏ•ï¿½^@\'\0\0	ï¿½ï¿½R3ï¿½\0\0ï¿½8ï¿½RSï¿½\0\0ï¿½ï¿½ï¿½ï¿½IxOï¿½\0\0\'ï¿½?ï¿½m{<ï¿½\0\0 8ï¿½]hYï¿½:\0@pï¿½{ï¿½Lï¿½#ï¿½\0\0ï¿½	ï¿½=Rï¿½\0\0ï¿½8ï¿½~ï¿½;ï¿½\0\0ï¿½ï¿½ï¿½K$ï¿½:\0@pÂ»,ï¿½L\'\0\0Û¶ï¿½dgg_E\'\0\0ï¿½ï¿½]ï¿½D.ï¿½\0\0\'ï¿½+ï¿½ï¿½ï¿½Ï¢\0\0\'ï¿½MZZZ{:\0@\0hhkxï¿½	\0\0BWï¿½ï¿½js:\0@@ï¿½jï¿½ï¿½\Zï¿½\0\0  ï¿½#bï¿½Q1:\0@@ï¿½ï¿½Yï¿½ -t\0ï¿½ï¿½ï¿½Ã¢ï¿½ï¿½Qï¿½\0\0ï¿½	ï¿½;ï¿½ï¿½$t\0ï¿½ï¿½ï¿½Sï¿½ï¿½)Aï¿½\0\0aï¿½ï¿½H	ï¿½t\0ï¿½ï¿½ï¿½,kï¿½ï¿½8ï¿½t\0ï¿½ï¿½Lï¿½ï¿½%ï¿½7ï¿½	\0\0Bï¿½{ï¿½ï¿½Z:\0@pï¿½{ï¿½ï¿½ï¿½\n:\0@@deeÍ”ZD\'\0\0Nx/ï¿½ï¿½C\'\0\0Nxï¿½\'5ï¿½N\0\0ï¿½mï¿½ï¿½ï¿½~ï¿½N\0\0ï¿½C=zï¿½ï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½Mï¿½ï¿½ï¿½ï¿½\0\0ï¿½ï¿½ï¿½ï¿½ï¿½6ï¿½Tï¿½ï¿½-\rxï¿½\0ï¿½Oï¿½ï¿½?ï¿½p-ï¿½ï¿½\0ï¿½ï¿½ï¿½Tï¿½B]ï¿½ï¿½ï¿½\r\0ï¿½Ï¤ï¿½ï¿½ï¿½ï¿½ï¿½>ZSpÛ¶ï¿½\0ï¿½ï¿½$ï¿½ï¿½jï¿½ï¿½ï¿½#\0\0ï¿½\rï¿½\Zï¿½;ï¿½ï¿½\0\0ï¿½ï¿½ï¿½{S\\pï¿½ï¿½ï¿½ï¿½tï¿½+\0\0ï¿½Xffï¿½ï¿½qÛºï¿½ï¿½\0\0ï¿½1}ï¿½ï¿½ï¿½0ï¿½!ï¿½\0\0ï¿½gï¿½ï¿½Ì‡IHï¿½ï¿½ï¿½Þºï¿½ï¿½ï¿½ï¿½pï¿½IVï¿½\0ï¿½\"ï¿½ï¿½ï¿½hï¿½ï¿½\'88Kï¿½ï¿½{WØ¶ï¿½ï¿½ï¿½}\0ÐŒï¿½ï¿½ï¿½ï¿½	mï¿½Lhï¿½Rï¿½ï¿½ï¿½\0hBï¿½3ï¿½LÌ‡ï¿½ï¿½ï¿½]wï¿½eÆoï¿½,Ybï¿½oï¿½n>lï¿½.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½o^xï¿½Ó¿ï¿½ï¿½ï¿½RbYÖ­t\0ï¿½F&!{{$ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½|ï¿½ï¿½Qï¿½ï¿½ï¿½+Wï¿½ï¿½Cï¿½ï¿½t ï¿½ï¿½t\0ï¿½Fï¿½ï¿½ï¿½ï¿½ï¿½fï¿½Ô©Iï¿½vu3fï¿½0999Õ§p\0ï¿½ï¿½ï¿½Uï¿½Ü•ï¿½ï¿½7nï¿½h\ZÃ§ï¿½~jï¿½ï¿½ï¿½{ï¿½ï¿½*t\0\0\Z@wNï¿½ï¿½Æ­ï¿½ï¿½Û°ï¿½ï¿½ï¿½ï¿½\0ï¿½mï¿½ï¿½ï¿½\0@=ï¿½^ï¿½ï¿½ï¿½kï¿½iï¿½ï¿½\nï¿½=ï¿½\0@ï¿½ï¿½sï¿½ï¿½Û¹uwSï¿½mï¿½ï¿½Û¿uu=\0\0ï¿½ï¿½`ï¿½ß«ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½Ç¯>_ï¿½_\0ï¿½ï¿½ï¿½ï¿½#ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Õ«ï¿½9ï¿½ï¿½ï¿½5\0\0Hï¿½~d+~\'ï¿½ï¿½|$,Yï¿½rï¿½cï¿½ï¿½ï¿½\0\0 ï¿½IFï¿½\0}ï¿½gLsï¿½4iï¿½1ï¿½Oï¿½\0@bï¿½;ï¿½zï¿½ï¿½æ¤«ï¿½ï¿½Vï¿½ï¿½ï¿½\0@$4ï¿½ï¿½wï¿½Ø±ï¿½Yï¿½[?ï¿½:Qï¿½\Z\0\0$6yWhï¿½$#ï¿½E_ï¿½ï¿½ï¿½\0@ï¿½ï¿½\nï¿½7\0\0Lï¿½\0\0ï¿½llï¿½\0 xï¿½7{ï¿½\0ï¿½ï¿½ï¿½sï¿½\0\0ï¿½Lï¿½ï¿½ï¿½kï¿½ï¿½ï¿½ï¿½9ï¿½\Z\0\0ï¿½ï¿½cï¿½ï¿½ï¿½fï¿½m\0@ï¿½ï¿½9ï¿½ï¿½ï¿½*ï¿½ï¿½ï¿½Ð¡C9ï¿½\0\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½\0\0kï¿½ï¿½ï¿½q-ï¿½ï¿½ï¿½76Ipï¿½é§¦{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½rrr:Ú¶]ï¿½ï¿½~ï¿½ï¿½?ï¿½}ï¿½ï¿½wÇ¯./ï¿½ï¿½Kï¿½\0ï¿½\'Ë²nï¿½_}ï¿½ï¿½Xï¿½Nï¿½ï¿½ï¿½ï¿½ï¿½G]\0ï¿½ï¿½~o|ï¿½ï¿½*tï¿½Þï¿½ï¿½twï¿½Uï¿½:uï¿½ï¿½ï¿½\0\04Qï¿½ï¿½ï¿½B_ï¿½reï¿½>|ï¿½1ï¿½ï¿½?ï¿½ï¿½\0ï¿½iï¿½ï¿½ï¿½mï¿½ï¿½ï¿½ï¿½HlË–-sï¿½ï¿½;ï¿½ï¿½.uï¿½ï¿½ï¿½9-ï¿½\0,ï¿½Û¸YU\0@Òï¿½ï¿½ï¿½Bo`ï¿½ï¿½ï¿½i\0\04ï¿½ï¿½Lï¿½+ï¿½Ä–Hï¿½ï¿½ï¿½\0,ï¿½pï¿½fï¿½\0@\nï¿½Tï¿½cï¿½ï¿½4ï¿½;ï¿½tï¿½qï¿½9Ý«\'ï¿½cï¿½sï¿½S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½Ç¶ï¿½yï¿½\0\0\0\0IENDï¿½B`ï¿½',1),('70006',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.Contract.png','70001','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0pï¿½IDATxï¿½ï¿½	xï¿½Õ½ï¿½+Zkï¿½ï¿½ï¿½jmï¿½]k[ï¿½ï¿½mï¿½ï¿½zï¿½ï¿½j7-ï¿½^oAï¿½ï¿½LHï¿½-ï¿½}_Eeï¿½È¾XdQï¿½ ï¿½ï¿½&ADYd0ï¿½f#ï¿½ï¿½ï¿½ï¿½ï¿½=ï¿½ï¿½NB2ï¿½uï¿½ï¿½ï¿½yï¿½ï¿½dï¿½ï¿½$ï¿½eï¿½ï¿½~ï¿½w~ï¿½/|ï¿½ï¿½sï¿½Ê€ï¿½ï¿½ï¿½ï¿½?vï¿½|Zï¿½yï¿½ï¿½ï¿½y\0\0\0ç¼²ï¿½Ä…ï¿½Ï®0ï¿½ï¿½ï¿½Sï¿½ï¿½%c>ï¿½ï¿½ï¿½ï¿½Dï¿½ï¿½ï¿½yï¿½=/_\"ï¿½ï¿½ï¿½Ê¢?+ï¿½\0\0\0ï¿½ï¿½ï¿½ï¿½G/ï¿½nï¿½ï¿½J]ï¿½{ï¿½Yï¿½uï¿½_bï¿½Ò´eï¿½ï¿½-=Gï¿½ï¿½:q]ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½\"ï¿½ëŽžï¿½ï¿½^ï¿½qæ”žï¿½iï¿½ï¿½Rï¿½\0\0\0ï¿½ï¿½[M{?Wï¿½vï¿½ï¿½ï¿½ï¿½Üˆï¿½ï¿½ï¿½ï¿½ï¿½Í¹:ï¿½Nï¿½ï¿½\\ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:ï¿½ï¿½ï¿½ï¿½D\0\0ï¿½tï¿½ï¿½ï¿½_ï¿½0*B\n2Þ°ï¿½ï¿½vï¿½Wï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½6kï¿½aÌ›yï¿½\nï¿½ï¿½2e!ï¿½ï¿½?Oï¿½ï¿½ÇŸï¿½ï¿½bh\0\0ï¿½ï¿½|~ÉœPï¿½!,ï¿½ï¿½\"ï¿½Bï¿½,?Ë°Kï¿½ï¿½=}ï¿½ï¿½ï¿½ï¿½ï¿½}_ï¿½ï¿½ï¿½qï¿½6çƒ‹ï¿½Ûˆ\0\0ï¿½Ç˜ï¿½ï¿½ï¿½@Hï¿½Sï¿½ï¿½ï¿½ï¿½Dqï¿½+N$Ä‡ï¿½ï¿½D\0\0ï¿½ï¿½ï¿½ï¿½ï¿½nï¿½.ï¿½ï¿½7ï¿½zLï¿½W1ï¿½ï¿½3ï¿½Xï¿½ ï¿½ï¿½ï¿½Üï¿½Â¡ï¿½ï¿½ï¿½EDï¿½ï¿½ï¿½ï¿½ï¿½3R\Zï¿½}Ï¾ï¿½ï¿½\"\0\0ï¿½=ï¿½ï¿½?\\Ti(%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½}zvï¿½ï¿½]ï¿½\']ï¿½>ï¿½Yï¿½óž·ï¿½Òï¿½ï¿½\'ï¿½>ï¿½F^ï¿½ï¿½oï¿½ï¿½yï¿½sï¿½ï¿½ß„ï¿½ï¿½\Zï¿½Å¦Ã—ï¿½wpoï¿½ï¿½?[Cï¿½ï¿½D\0\0ï¿½ï¿½^ï¿½ï¿½ï¿½\n-5Ë¢}~qeï¿½ï¿½O[T9.3ï¿½ï¿½sï¿½ï¿½ï¿½oï¿½Üªï¿½ï¿½ï¿½Bï¿½ï¿½q[ï¿½zï¿½ï¿½uï¿½ï¿½_ï¿½ï¿½/ï¿½lï¿½/ï¿½9D\0\0ï¿½ï¿½ï¿½[Jï¿½s}_ï¿½z\"	9nZï¿½dï¿½ÜŒï¿½ï¿½SCï¿½ï¿½ï¿½Ð¡ï¿½III1			&))É´kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Bï¿½~ï¿½ï¿½nÝº=\0\0ï¿½/:t(ï¿½^8Ñ¦MÓ¢E3eï¿½ï¿½nï¿½:sï¿½ï¿½asï¿½ï¿½Yeï¿½Ì…Lvvï¿½yï¿½wÌ´iï¿½LZZï¿½IOOï¿½ï¿½Þ½ï¿½ï¿½`0xQ\0\0ï¿½ï¿½Ü¶bÅŠï¿½ï¿½Zï¿½2Cï¿½5[ï¿½lï¿½ï¿½PVï¿½mï¿½f222Lï¿½ÆMï¿½ï¿½Q\0\0\0e!Fï¿½ï¿½×¶m[ï¿½iï¿½&Svï¿½ï¿½aZï¿½nmï¿½7oï¿½IJJï¿½MD\0\0ï¿½Ãœ<yï¿½uï¿½^ï¿½Ì³ï¿½>kNï¿½8a*\rï¿½ï¿½ï¿½Zï¿½lï¿½9C\0\0\0ï¿½DH\"l.]ï¿½d*ï¿½1cï¿½(3ï¿½Ùƒ>xï¿½\0\0ï¿½ï¿½ï¿½ï¿½pï¿½2ï¿½!aFï¿½aï¿½×¯ï¿½Eï¿½\0\0<ï¿½\n+UQQï¿½ï¿½\rsï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½D\0\0ï¿½hHCï¿½343ï¿½*Pfbbb.ï¿½\0\0\0@ï¿½Dhï¿½gU2pï¿½ï¿½			ï¿½>\0\0@ï¿½+ï¿½ï¿½TUe#ï¿½|ï¿½ï¿½&^ï¿½ï¿½\0\0 ï¿½yï¿½ï¿½ï¿½hï¿½ï¿½ï¿½,ï¿½,ï¿½ï¿½ï¿½ï¿½\\ï¿½q\Zï¿½_\0\0\0ï¿½Sï¿½wï¿½ï¿½ï¿½ï¿½ï¿½~&!!a\rï¿½\0\0ï¿½8Epiï¿½ï¿½à­·Þºï¿½ï¿½ï¿½ï¿½\0\0\0ï¿½ï¿½ï¿½\rï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½\"qï¿½ï¿½\0\0@ï¿½ï¿½-ï¿½Ã»xV5ï¿½LÛï¿½_\0\0\0ï¿½St!ï¿½N	\0\0ï¿½8ï¿½Aï¿½Õ™ï¿½ï¿½C$\0\0\0ï¿½ï¿½ï¿½ï¿½W[ï¿½Dvvï¿½j$\0\0\0ï¿½>}ï¿½ï¿½ï¿½ï¿½YKï¿½,ï¿½fï¿½\0\0@3`ï¿½ï¿½ï¿½ï¿½ZGï¿½Wï¿½^GXG\0\0 ï¿½iÝºuÃ´ï¿½ï¿½jYï¿½RKdï¿½ï¿½%\0\0@ï¿½ï¿½DnUïµ±vï¿½Z\rkï¿½ï¿½\0\0@ï¿½Ó³gÏ•Cï¿½ï¿½Rï¿½hÚ´ï¿½vï¿½\0\0ï¿½\0)))75iï¿½$oÛ¶mU\"oï¿½ï¿½ï¿½Qe#ï¿½ï¿½ï¿½mD\0\0ï¿½ï¿½ï¿½ï¿½ï¿½jÕªï¿½9qï¿½Dï¿½JÄ™3grCï¿½ï¿½W\"ï¿½u\0\0\0ï¿½ï¿½ï¿½vxï¿½ï¿½ï¿½Yxï¿½ï¿½ï¿½ï¿½lï¿½qï¿½m\0\0\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½!yÝ»wß¯u#4ï¿½Bï¿½\0\0<*Mï¿½6ï¿½6lï¿½9}ï¿½tï¿½\rgï¿½lï¿½RÅ•S\0\0ï¿½ï¿½HJJï¿½Û¬Yï¿½ï¿½Í›7ï¿½ï¿½ï¿½R5\Zï¿½ \0\0ï¿½#TYï¿½~ï¿½K}ï¿½ï¿½ï¿½(ï¿½ï¿½fï¿½cÃ†\rï¿½ï¿½ï¿½\"vï¿½ï¿½\0\0\0~DYï¿½qf)ï¿½ï¿½ï¿½ï¿½ï¿½7tï¿½ï¿½3oï¿½ï¿½Æ¥#Gï¿½ï¿½^ï¿½pï¿½`Omï¿½ï¿½tï¿½Ò£Zï¿½Z+VJ ï¿½NC\0\0\0`qï¿½ ï¿½mï¿½Ü–ï¿½ï¿½ï¿½mï¿½Î«ï¿½mkï¿½ï¿½5+V\0\0@Yï¿½ï¿½ \r\0\0\0ï¿½HÔ«Wï¿½f\"\0\0\0Qï¿½8N^rrï¿½ï¿½D\0\0\0bï¿½ï¿½ï¿½ï¿½	\0\0\0ï¿½ï¿½ï¿½ï¿½ï¿½\\W&~A$\0\0\0 ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½D\0\0\0bï¿½ï¿½ï¿½@ï¿½~\"\0\0\0ï¿½ï¿½ï¿½yï¿½q\"\0\0\05ï¿½Dï¿½ï¿½Bï¿½	\0\0\0ï¿½E$ï¿½$&&:D\0\0\0ï¿½&!!á”–ï¿½&\0\0\05ï¿½ï¿½pEï¿½	ï¿½\0\0\0ï¿½ï¿½q%ï¿½sW&Z	\0\0\0ï¿½E$ï¿½ï¿½ï¿½#ï¿½\0\0\0ï¿½XDï¿½Sï¿½ï¿½$\0\0\05ï¿½ï¿½	ï¿½Bï¿½\0\0\0DMBBï¿½Aï¿½=E$\0\0\0 ï¿½ï¿½ï¿½	\0\0\0ï¿½\ZW\"ï¿½9ï¿½3ï¿½H\0\0\0@ï¿½$$$ï¿½vï¿½D\"\0\0\0ï¿½ï¿½ï¿½nï¿½J$\0\0\0 ï¿½ï¿½\Z\nï¿½^$\0\0\0ï¿½Hlrï¿½l\"\0\0\0Qï¿½8ï¿½;ï¿½`ï¿½U\"\0\0\0Qï¿½ï¿½ï¿½ï¿½Ö•ï¿½ï¿½D\0\0\0bï¿½ï¿½n[N$\0\0\0 ï¿½X.ï¿½ \0\0\0ï¿½H,ï¿½ï¿½ï¿½\0\0\0ï¿½XDbï¿½ï¿½ï¿½	\0\0\0ï¿½ï¿½@ 0\'n$\0\0\05Zï¿½ï¿½qï¿½ï¿½ï¿½\0\0\0Dï¿½ï¿½ï¿½ï¿½2ï¿½D\0\0\0bï¿½ï¿½Ú¸ï¿½H\0\0\0@Ô„Bï¿½1ï¿½ï¿½ï¿½%\0\0\05ï¿½`pDBBBï¿½\0\0\0ï¿½ï¿½qgï¿½+ï¿½\0\0\0DM(\Zï¿½ï¿½ï¿½\"\0\0\0Qï¿½ï¿½ï¿½ï¿½ï¿½mï¿½	\0\0\0ï¿½E$:ï¿½ï¿½ï¿½\0\0\0ï¿½XDï¿½ï¿½ï¿½89D\0\0\0ï¿½&6sï¿½	\"\0\0\0Q\Z$$$ï¿½Ê—ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½uï¿½ï¿½Cd\0\0\0ï¿½ï¿½qÎ¸ï¿½pï¿½mï¿½n3%ï¿½UD\0\0\0.Ã•ï¿½5ï¿½ï¿½Z^jjï¿½ï¿½ï¿½\0\0\0\\Fï¿½ï¿½EiÙˆï¿½D	\0\0\0Jï¿½ï¿½WJ	ï¿½qï¿½\"B\0\0\0Pï¿½Hï¿½V\\ï¿½ï¿½+ï¿½\0\0\0ï¿½\"ï¿½ï¿½ï¿½ï¿½H$&&:D\0\0\0ï¿½Dï¿½ï¿½ï¿½H|LD\0\0\0ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½m\"\0\0\0Qï¿½8ï¿½	ï¿½ï¿½\0\0\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0\0ï¿½ï¿½~ï¿½ï¿½f-Zï¿½ï¿½ï¿½ï¿½L7ï¿½Fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½]wï¿½voï¿½ï¿½|!ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½nï¿½yï¿½sï¿½ï¿½Y\0\0ï¿½qï¿½ï¿½Eï¿½ï¿½ï¿½ï›ºuï¿½nï¿½ï¿½2ï¿½\'==ï¿½ï¿½$\0\0*ï¿½ï¿½z(ï¿½ï¿½fï¿½rï¿½Oï¿½ï¿½e\"\0\0ï¿½bÙ¶m[ï¿½ï¿½ï¿½^ï¿½J^ï¿½ï¿½\0ï¿½J@ï¿½ï¿½u\0ï¿½ï¿½Xï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½Wï¿½ï¿½\'Nï¿½0~ï¿½ï¿½ï¿½}ï¿½ï¿½++ï¿½ï¿½ï¿½fß¾}ï¿½Â…1ï¿½ï¿½ï¿½.]ï¿½ï¿½DÝ°aï¿½9~ï¿½xï¿½ß“ï¿½ï¿½Wï¿½ï¿½	\0+ï¿½ ï¿½H\nï¿½yæ™‚ï¿½ï¿½cï¿½ï¿½Zï¿½jï¿½!Cï¿½:ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½K/ï¿½o~ï¿½ï¿½ï¿½ï¿½7ï¿½hfÏžm>ï¿½ï¿½S{RmÞ¼ï¿½ï¿½kKï¿½ï¿½ï¿½ï¿½Ä¶{ï¿½nï¿½ï¿½ï¿½>ï¿½ï¿½|ï¿½ï¿½ï¿½5Sï¿½N50[ï¿½n5ï¿½ï¿½ï¿½ï¿½ï¿½Wï¿½bzï¿½ï¿½mï¿½I*Ö¯_oï¿½4ib~ï¿½ï¿½ï¿½ï¿½ï¿½[ï¿½nmï¿½ï¿½Ëš$\0\0ï¿½\0ï¿½dï¿½xï¿½Wï¿½5ï¿½\\cï¿½ò—¿”ï¿½ï¿½ZKï¿½.ï¿½ï¿½ï¿½={ï¿½ï¿½nï¿½É¼ï¿½ï¿½[Wï¿½ï¿½ï¿½ï¿½#Gj}ï¿½ï¿½1ï¿½^{ï¿½ï¿½ï¿½ï¿½ï¿½mF#ï¿½Yï¿½Þ½ï¿½=ï¿½ï¿½&ï¿½\'ï¿½ï¿½êª«lßž5kï¿½Yï¿½zï¿½yï¿½Gï¿½}ï¿½.ï¿½=>tï¿½Pï¿½ï¿½8ï¿½ï¿½Wï¿½\0\0ï¿½\0ï¿½dï¿½xï¿½ï¿½ï¿½ï¿½Oï¿½S+jï¿½ï¿½/ï¿½xï¿½ï¿½7ï¿½ï¿½ï¿½ï¿½0ï¿½Ö­3Ã‡ï¿½ï¿½\nï¿½ï¿½ï¿½~ï¿½#+ï¿½ï¿½ï¿½ï¿½\'ï¿½ï¿½SO=exï¿½ï¿½k×®bï¿½Ê•+ï¿½<ï¿½ï¿½ï¿½ï¿½7ï¿½Ð¡Cï¿½ÏŸ?oVï¿½Zeï¿½ï¿½ï¿½oï¿½gddï¿½o|ï¿½&;;ï¿½ï¿½>ï¿½ï¿½;vd/ï¿½;K$ï¿½)ï¿½t,ï¿½ï¿½vï¿½ï¿½ï¿½ï¿½ï¿½Zï¿½B$\0\0ï¿½\0ï¿½ï¿½\Z	\rW|ï¿½ï¿½EXFï¿½Qè¹‘Czï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½:ï¿½ï¿½ï¿½Z0dQï¿½[oï¿½ï¿½Ô©Sï¿½\"ï¿½iÓ¦YA=zï¿½ï¿½7oï¿½ï¿½Lï¿½{ï½¦eË–vÎ¶ï¿½Aï¿½ï¿½ï¿½aÃ†ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½/ï¿½LÄ£ï¿½>Zï¿½ixï¿½ï¿½\r\0@$\0ï¿½P$nï¿½ï¿½f;4ï¿½!}ï¿½9sï¿½ï¿½;ï¿½ï¿½2ï¿½ï¿½@,\\ï¿½ï¿½~0`ï¿½ï¿½^ï¿½{Ö®][ï¿½<eTï¿½Ù¾ï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fï¿½ï¿½×¿ï¿½u-ï¿½Ü¬Y3{\\ï¿½ï¿½}ï¿½{&33ï¿½>ï¿½Wï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½eï¿½ï¿½ï¿½\0ï¿½H\0Ô°ï¿½ï¿½ï¿½)tï¿½×±Úµkï¿½Z#ï¿½ï¿½P(Tï¿½I$TdyLï¿½ï¿½}1}ï¿½t;ï¿½ï¿½RvB_ï¿½ï¿½ï¿½ï¿½;wï¿½`hCï¿½ï¿½LRRï¿½ï¿½Ö­ï¿½ï¿½ï¿½cmÛ¶ï¿½ï¿½5$\0ï¿½H\0Tï¿½H|ï¿½ï¿½_ï¿½ï¿½ï¿½,X`Oï¿½ï¿½ÈŒï¿½Sï¿½ï¿½-ï¿½ï¿½R0ï¿½QT$4mï¿½$4ï¿½ï¿½ï¿½CqÌ;×Šï¿½ï¿½8ï¿½Z/ï¿½ï¿½bAï¿½ï¿½ï¿½ï¿½ï¿½*RRRï¿½ï¿½W_}ï¿½ï¿½ß¿ï¿½ï¿½>ï¿½ï¿½Ðï¿½ï¿½ï¿½,ï¿½d\0\0ï¿½\0ï¿½ï¿½\Zï¿½ï¿½\"ï¿½!	ï¿½ÎˆV$ï¿½ï¿½Xï¿½<yï¿½ï¿½ï¿½Wï¿½jï¿½<\"EBÂ !ï¿½\'ï¿½|ï¿½lÚ´ÉŠï¿½ï¿½Tï¿½ï¿½j)ï¿½\"ï¿½\Z\r\\\0 \0U$ï¿½BÙ±cG;ï¿½ï¿½ï¿½}ï¿½.Öº?xï¿½ï¿½ï¿½:ï¿½ï¿½>ï¿½ï¿½Nï¿½ï¿½Hï¿½/ï¿½ï¿½Õ¯ï¿½ï¿½{ÆŽï¿½ï¿½ï¿½ï¿½sï¿½=Wï¿½ï¿½Zhjï¿½ï¿½ï¿½v]ï¿½ë¯¿ï¿½Xï¿½8zï¿½ï¿½-ï¿½ï¿½pï¿½mï¿½ï¿½f\Z7n\\Pw	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Vï¿½pUX$$2ï¿½Fï¿½ï¿½Y	=Oï¿½ï¿½ï¿½kï¿½\0\0\"P\"ï¿½ï¿½~ï¿½ï¿½Wcï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½bÑ¢Evï¿½-ZØµï¿½@ï¿½ï¿½Tï¿½ï¿½éŸšï¿½yï¿½\r7ï¿½ï¿½ï¿½Uï¿½5ï¿½ï¿½!MAUï¿½ï¿½ï¿½ï¿½ssï¿½ï¿½I;ï¿½TS@ï¿½ï¿½ï¿½kï¿½Eï¿½:4C#LX$Tï¿½ï¿½Eï¿½ï¿½O?MOWÙ¸qï¿½7nï¿½]ï¿½Cï¿½vï¿½JY,Õ¸Hï¿½ï¿½ï¿½kï¿½ï¿½\"ï¿½ï¿½H\0Ä©Hï¿½ï¿½Aï¿½ï¿½ï¿½(ï¿½P;vï¿½ï¿½.nzï¿½ï¿½gw\\+R*ï¿½Qï¿½kï¿½\ZEQï¿½ï¿½qeï¿½<v|pï¿½ï¿½[ï¿½Ò¦M+ï¿½Sï¿½Lï¿½ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Z7DRï¿½ï¿½ï¿½iiivï¿½jï¿½ï¿½ï¿½&\'\'ï¿½ \"/\"Pï¿½ï¿½Yï¿½ï¿½\nï¿½ï¿½I[ï¿½lï¿½Jï¿½ï¿½mï¿½fï¿½b4Ôµxï¿½bï¿½	ï¿½\0\"~ï¿½Bï¿½ï¿½V3hTOSï¿½ï¿½ï¿½j`:uï¿½dNï¿½>Mpï¿½\0@$ï¿½ï¿½(ï¿½EÃž}ï¿½Yï¿½[lEï¿½!ï¿½ï¿½ï¿½ï¿½ï¿½\0D\0ï¿½\0g\"$ï¿½=Stkï¿½ï¿½`Ì˜1ï¿½}ï¿½ï¿½eï¿½ï¿½@$\0	ï¿½34ï¿½ï¿½ï¿½AeHDï¿½kï¿½ï¿½M\0D\0ï¿½\0ï¿½ï¿½Jï¿½DTï¿½pFiï¿½ï¿½ï¿½ï¿½ï¿½^\0	\0D<2ï¿½ï¿½ï¿½ï¿½ï¿½Qï¿½\0Sï¿½ï¿½Q/ï¿½\0\"@ï¿½DD.V\Z4ï¿½ï¿½b\0 \0ï¿½ï¿½9ï¿½Yï¿½ï¿½lDï¿½>ï¿½ï¿½f%(ï¿½D\0ï¿½ï¿½8F+ï¿½ï¿½fï¿½2,Kï¿½aÃ†fï¿½ï¿½ï¿½ï¿½\0ï¿½\0@$ ^ï¿½ï¿½Zï¿½ï¿½:ï¿½m}ï¿½ï¿½ï¿½\0ï¿½\0\"ï¿½6ï¿½ï¿½ï¿½ï¿½ï¿½Úµkm6\0ï¿½\0@$ Nï¿½.ï¿½Ú€ï¿½:ï¿½ï¿½ï¿½ï¿½\0@$\0	ï¿½Sï¿½xqï¿½ï¿½VZï¿½[Û \0ï¿½ï¿½)ï¿½}!G$\0ï¿½\0@$ ï¿½iÐ 	@$\0	ï¿½Ø¨ï¿½\Zï¿½ï¿½ï¿½lj$\0ï¿½\0@$ ï¿½ï¿½ß¿ï¿½ï¿½ï¿½Xï¿½r%ï¿½6\0ï¿½\0@$ ï¿½ï¿½nï¿½Õµï¿½ï¿½ï¿½O?ï¿½:ï¿½H\0 ï¿½(ï¿½ï¿½ï¿½V-+[jXï¿½ï¿½-ï¿½\0@$ Î©ï¿½ï¿½6ï¿½}ï¿½]ï¿½ï¿½ï¿½ï¿½^ï¿½H\0 ï¿½Lï¿½4É®pYï¿½tï¿½Ø‘ï¿½?ï¿½\0@$ï¿½ï¿½>}ï¿½4mï¿½ï¿½lÛ¶ï¿½Jï¿½999	\0Dï¿½ï¿½ï¿½Eï¿½Lï¿½Vï¿½Ì‰\'*ï¿½ï¿½9sÆ®ï¿½ï¿½pï¿½Bï¿½ï¿½\0\"^ï¿½Kï¿½.fï¿½ï¿½ï¿½ZxÙ©S\'+,\0ï¿½\0\"Cï¿½ï¿½ï¿½;w6ï¿½\"ï¿½ï¿½u#4ï¿½ï¿½H\0 ï¿½Qï¿½ï¿½jï¿½Ã†\rï¿½ï¿½ï¿½ï¿½3ï¿½vï¿½j%ï¿½ï¿½@$\0	ï¿½ï¿½Lï¿½oï¿½ï¿½4oï¿½ï¿½lÞ¼ï¿½\\ï¿½ï¿½ï¿½Jï¿½Dh8ï¿½L \0ï¿½ï¿½D&\'\'ï¿½~ï¿½ï¿½Yï¿½ï¿½fï¿½cÓ¦Mï¿½ï¿½Bï¿½3(ï¿½D\0ï¿½\0ï¿½ï¿½,ï¿½\n0ï¿½\nï¿½v\nï¿½ï¿½Õ«Wï¿½#Gï¿½,&ï¿½]<ï¿½ï¿½ï¿½ï¿½Pï¿½ï¿½+ï¿½ï¿½:e\0\"ï¿½H\0X$4ï¿½ï¿½ï¿½vï¿½B[ï¿½ï¿½ï¿½ï¿½A5ï¿½{ï¿½ï¿½ï¿½^ï¿½b% \0ï¿½@ï¿½(#	 \0ï¿½@ï¿½lÝºï¿½_\0 \0ï¿½@Lï¿½ï¿½ï¿½\0@$\0	ï¿½ï¿½ï¿½;wï¿½iÜ¸1ï¿½\0D\0ï¿½\0ï¿½ï¿½ï¿½Þ´lÙ’@\0\"ï¿½H\0Dï¿½È‘#ï¿½Vï¿½\0ï¿½\0\"5O<ï¿½ï¿½	ï¿½H\0 \0QÓ½{wï¿½ï¿½\0\"ï¿½H\0DMÛ¶mï¿½Ø±c	 \0ï¿½@ï¿½hCï¿½3f@$\0	ï¿½ï¿½iÔ¨ï¿½q\"ï¿½H\0Ä†ï¿½ï¿½Xï¿½nï¿½\0D\0ï¿½\0ï¿½ï¿½P(dvï¿½ï¿½M \0ï¿½\0@$\0ï¿½G;~?~ï¿½@\0\"ï¿½H\0Dï¿½Ù³gï¿½H\0 \0ï¿½@ï¿½ï¿½ß¿ï¿½-ï¿½ï¿½\0@$\0bï¿½ï¿½wï¿½5ï¿½ï¿½ï¿½\'ï¿½H\0 \0Ñ³lï¿½2Ó°aCï¿½\0\"=ï¿½fï¿½2Mï¿½6%ï¿½H\0 \0ï¿½3aï¿½Óºukï¿½\0\"=Ã†\r3]ï¿½t!ï¿½H\0 \0ï¿½Ó¯_?ï¿½\0	\0D j:wï¿½lï¿½yï¿½ï¿½\0\"=ï¿½Zï¿½ï¿½u\0ï¿½\0\"5ï¿½ï¿½ï¿½ï¿½ï¿½/@$\0	ï¿½ï¿½IIIï¿½kI\0 \0ï¿½@ï¿½hUË7@$\0	ï¿½ï¿½ï¿½>ï¿½o\0ï¿½\0@$\0ï¿½F;jP\0D\0ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½D\0ï¿½\0ï¿½ï¿½Ý»wï¿½P(D \0ï¿½\0@$\0ï¿½gï¿½Úµ&))ï¿½@\0\"ï¿½H\0ï¿½ï¿½Ñ£GÍ”)Sï¿½Â…Í–-[Ìž={ï¿½ï¿½Fï¿½\Z@$\0	ï¿½+ï¿½ï¿½ï¿½hk\"ï¿½6MMMM5Mï¿½41sï¿½ï¿½!Pï¿½H\0 \0ï¿½Ó§Oï¿½bE\"ï¿½4Tï¿½\0D\0ï¿½\0(vxï¿½4ï¿½>|8AD\0ï¿½\0(ï¿½vï¿½ï¿½+*ï¿½<ï¿½<D\0ï¿½\0(ï¿½ï¿½Kï¿½+:ï¿½H\0 \0WDÅ•ï¿½Ñ¼ysï¿½ï¿½\0\"P6\\H$vï¿½ï¿½AP\0ï¿½\0@$\0ï¿½ï¿½ï¿½Ó§ï¿½\rIDï¿½Nï¿½ \0ï¿½@tï¿½iï¿½ÆŠï¿½{ï¿½G0\0ï¿½\0@$\0ï¿½ï¿½ï¿½O?mï¿½ï¿½ï¿½ï¿½ï¿½qLvv6D\0ï¿½\0(ï¿½D\\uï¿½Uï¿½Wï¿½ï¿½ï¿½	ï¿½wï¿½ï¿½	\0Dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½H\0 \0eï¿½ï¿½+@$\0	ï¿½2ï¿½Bï¿½ï¿½,@$\0	ï¿½ï¿½3ï¿½2ï¿½H\0 \01[H&jÕªEf	\0Dï¿½ï¿½ï¿½jï¿½}ï¿½	2ï¿½H\0 ï¿½Dï¿½ï¿½ï¿½ï¿½L\0\"ï¿½H\0QRï¿½kJ{oR3ï¿½\0\"HDï¿½\"Af	\0Dï¿½ï¿½rï¿½DEï¿½\0 \0ï¿½xH\"ï¿½	ï¿½9\0ï¿½\0@$\0ï¿½(ï¿½Hï¿½ï¿½9\0ï¿½\0@$ï¿½ï¿½ï¿½HDï¿½5ï¿½H\0 ï¿½ï¿½ï¿½ï¿½hï¿½ï¿½H\0 ï¿½Q>ï¿½ï¿½#ï¿½yï¿½}ï¿½ï¿½eï¿½<Tï¿½Hï¿½ï¿½~ï¿½>Gï¿½\0\"ï¿½H@g$Jfï¿½ÌŒD×®]ï¿½\'\0\"ï¿½Hï¿½×‡7ï¿½$ï¿½Þ‹ï¿½a\r@$\0	ï¿½Lï¿½\"O<ï¿½ï¿½S\"ï¿½Hï¿½WeBï¿½ï¿½>}ï¿½Tï¿½HLï¿½8ï¿½Ô©Sï¿½3lï¿½0ï¿½uï¿½Vï¿½ï¿½\0\"^ï¿½Ð¡C&\nï¿½ï¿½{ï¿½L2ï¿½Vï¿½lÓ¦ï¿½ï¿½9sï¿½i×®ï¿½	ï¿½ï¿½~ï¿½ï¿½ï¿½{ï¿½ï¿½fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½\0@$ ï¿½8zï¿½ï¿½ï¿½Û·ï¿½IHH0ï¿½;wï¿½Q{mtï¿½Ð¡ï¿½ï¿½ï¿½ï¿½\\ï¿½fï¿½\Z;ï¿½Ñ Aï¿½ï¿½[ï¿½haÆo8ï¿½?	\0Dj2999fï¿½ï¿½ï¿½63ï¿½ï¿½Î;+ï¿½:_ï¿½ï¿½ï¿½\"$ï¿½ï¿½ï¿½-[Zï¿½ï¿½\\ï¿½ï¿½ï¿½ï¿½Ê†ï¿½\0ï¿½\0@$ï¿½pï¿½ï¿½I3xï¿½`+ï¿½Zï¿½2[ï¿½l)1ï¿½Pï¿½(Ë³è”†94Ü¡a\rï¿½eGï¿½\" \0D\0ï¿½ï¿½*ï¿½ï¿½Ù³fï¿½ï¿½ï¿½BC6lï¿½4ï¿½ï¿½ï¿½>Uï¿½ï¿½ï¿½3Ï˜&Mï¿½Xï¿½hÜ¸1ï¿½ï¿½H\0 Pï¿½ï¿½ï¿½ï¿½Ñ£ï¿½@4mï¿½ï¿½dffVï¿½Tï¿½ï¿½ï¿½ï¿½HPï¿½	ï¿½\0\"ï¿½ï¿½ï¿½\n4ï¿½RZ}ï¿½_ï¿½|yÌ¯^Dï¿½Jï¿½Sï¿½N-ï¿½ï¿½ï¿½2ï¿½F\n6ï¿½\0@$ï¿½ï¿½/ï¿½Ó§O7IIIï¿½aÃ†fï¿½Â…ï¿½Wï¿½4ï¿½k*ï¿½J\"ï¿½ï¿½ï¿½M@$\0	(/ï¿½ï¿½ï¿½INNï¿½ï¿½9sï¿½Tï¿½ï¿½$ï¿½Zï¿½ï¿½ï¿½b%ï¿½ï¿½H\0 PFï¿½ÏŸoRRRlBï¿½Ê¤ï¿½F_eï¿½ï¿½n(ï¿½D	ï¿½\",]ï¿½Ô¤ï¿½ï¿½ï¿½Oï¿½Sï¿½Lï¿½ï¿½ï¿½}8ï¿½ï¿½ï¿½ï¿½.ï¿½l\"ï¿½ï¿½ï¿½Õ«Wï¿½OÖ‰ï¿½ï¿½fÜ¸qï¿½ï¿½Å‹Uï¿½;(3ï¿½ï¿½eï¿½oNï¿½& ï¿½Hï¿½oXï¿½~ï¿½iÞ¼ï¿½ï¿½ï¿½9jÔ¨jï¿½ï¿½ï¿½ï¿½Gy.ï¿½l\"\0ï¿½xï¿½Í›7ï¿½ï¿½ï¿½t+\Zï¿½?}ï¿½4Aï¿½(ï¿½D$\0	ï¿½kvï¿½ï¿½aÚ¶mk/`ï¿½\r2Ç\'(ï¿½ï¿½ï¿½\0\"qï¿½ï¿½={LÇŽmjï¿½_ï¿½~ï¿½Ø±cï¿½ï¿½Aï¿½&\"ï¿½H@ï¿½Cï¿½ï¿½*^ï¿½@ï¿½ï¿½ï¿½ï¿½9rï¿½ï¿½ï¿½l\"\0ï¿½T+ï¿½^ï¿½zï¿½ï¿½Dbï¿½ï¿½ï¿½%Î…ï¿½ï¿½MD\0ï¿½ï¿½JGCï¿½ï¿½(5ï¿½ï¿½ï¿½5ï¿½Þ‚ï¿½MD\0ï¿½ï¿½\nGEï¿½Zï¿½Aï¿½6mÚ˜ï¿½Û·ï¿½@ï¿½&\"ï¿½H@ï¿½hÚ¦.\"ï¿½ï¿½(ï¿½qï¿½Fï¿½ï¿½c(ï¿½D$\0	(sz;##Ã®ï¿½ï¿½Ö­[GPï¿½l\"\0ï¿½\\ï¿½ï¿½ï¿½Ö…@KY+ï¿½ï¿½jï¿½*ï¿½eï¿½ï¿½MD\0ï¿½ï¿½ï¿½ï¿½Ë©Sï¿½ï¿½Tuï¿½Fï¿½Ì’%K\nï¿½+ï¿½Eï¿½&\"ï¿½Hï¿½ï¿½ï¿½^zï¿½$\'\'ï¿½Oï¿½ï¿½ï¿½ï¿½# Pï¿½Pï¿½ï¿½H\0 dï¿½Ü¹V$ï¿½fï¿½\" P%Pï¿½ï¿½H\0 qÎ¢Eï¿½ï¿½ï¿½ï¿½:p\rg0~\rï¿½ï¿½ï¿½\0\"Gï¿½pR)eRNï¿½0ï¿½ï¿½\Zï¿½ï¿½\0\"QYï¿½vï¿½iÖ¬ï¿½ï¿½ï¿½ï¿½ï¿½sÏ‘>ï¿½ï¿½ï¿½ï¿½ï¿½M6ï¿½C$\0ï¿½ï¿½*@ï¿½Gé“:ï¿½ï¿½Ã‡ï¿½Å¥\0ï¿½È‚Me+ï¿½ï¿½~F$\0ï¿½ï¿½JCï¿½Wkk	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0^Aï¿½ï¿½ï¿½ï¿½H ï¿½H@ï¿½{ï¿½nï¿½ï¿½ï¿½:Yï¿½+ï¿½ï¿½/ï¿½oï¿½>Dï¿½\0D*ï¿½ï¿½ï¿½,Ó¥Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½Í›mï¿½\"ï¿½H\0\"ï¿½ï¿½È‘#ï¿½Gï¿½ï¿½ï¿½Yï¿½nÝ˜.ï¿½ï¿½ï¿½7ß´kï¿½ ï¿½ #Gï¿½5ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½:ï¿½T/ï¿½_Xï¿½pï¿½IMME$	@$ ZT49hÐ ï¿½ip;vï¿½ (ï¿½;ï¿½\nï¿½ï¿½3#ï¿½ PF4ï¿½mï¿½Ð¡vï¿½ï¿½ï¿½t;Fï¿½W&Oï¿½lï¿½Dï¿½\0Dï¿½ï¿½ï¿½9rï¿½ï¿½ï¿½ï¿½4ï¿½~ï¿½zï¿½ï¿½\'##ï¿½ï¿½NB$	@$ï¿½.^ï¿½hÆŒcï¿½ï¿½nÚ´ï¿½-.ï¿½#{ï¿½ï¿½+ï¿½jOMr=dï¿½ï¿½ï¿½%\"ï¿½H\0\"Eï¿½^Sï¿½Lï¿½Sï¿½TLï¿½lï¿½2ï¿½ï¿½Fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½&ï¿½VkØ°ï¿½Yï¿½|9\"ï¿½Hï¿½ï¿½3fï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½bï¿½\0ï¿½ï¿½ï¿½@Kï¿½	5ï¿½ï¿½ï¿½ï¿½A$\0ï¿½\0ï¿½ï¿½Ù³ï¿½xï¿½rï¿½ï¿½\0Pmï¿½Uï¿½Hï¿½qï¿½6\0	ß¡ï¿½ï¿½Jï¿½*1}ï¿½tï¿½H(ï¿½\'ï¿½Iï¿½ï¿½~ï¿½\0DÂ§h,ï¿½qï¿½ï¿½vlwï¿½Ä‰@7n\\ï¿½\"ï¿½ï¿½Lï¿½ qï¿½.ï¿½Kï¿½.-ï¿½ï¿½dffï¿½ï¿½ï¿½9zï¿½h_ï¿½ï¿½ï¿½JNNï¿½]ï¿½-R\"ï¿½vï¿½ï¿½ï¿½ ï¿½Hï¿½	ï¿½NKBKeï¿½ï¿½\rï¿½\Zï¿½#Fï¿½ï¿½gï¿½rU\0ï¿½ï¿½ï¿½\Z)ï¿½\Zï¿½H\0 q#ï¿½Ö¤Iï¿½2e(ï¿½lï¿½bZï¿½nm?Eiï¿½ï¿½É“\'ï¿½\0ï¿½ï¿½Cï¿½<ï¿½fu~ï¿½\0D\"NE\"2CQï¿½Pï¿½Ü¹ï¿½ï¿½!ï¿½8pï¿½Mï¿½@ï¿½ÐªU+{ï¿½}ï¿½á‡ˆ\"ï¿½D|ï¿½Ddï¿½BCYYYv\'Nï¿½Ó§ï¿½Ý¡\0*ï¿½rï¿½sAG$\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ÛŽDï¿½ï¿½_ï¿½Cï¿½jï¿½ï¿½Wï¿½6ï¿½wï¿½ï¿½ï¿½[q|n!ï¿½Hï¿½ï¿½Ñ­Yï¿½ï¿½dggï¿½ï¿½ï¿½Û§ï¿½~jVï¿½Zevï¿½ï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½B$\0ï¿½ï¿½!ï¿½IGWï¿½ï¿½ï¿½\'\0ï¿½-ï¿½ï¿½[ï¿½ Qï¿½ï¿½Nï¿½bï¿½Ò±\0ï¿½[ï¿½yn!ï¿½HDï¿½NL:(D*ï¿½-D\0ï¿½ï¿½hï¿½>?lï¿½ï¿½3ï¿½l[ï¿½ï¿½6ï¿½ï¿½1:7D8ï¿½	\0Dï¿½ï¿½v2ï¿½Ùºï¿½ï¿½ï¿½ï¿½Zï¿½BMï¿½ï¿½\"ï¿½[ï¿½\0\"Qbï¿½xÛ«ï¿½utï¿½v`ï¿½|:8D8ï¿½	\0Dï¿½ï¿½ï¿½ï¿½Ê§Kï¿½ï¿½ï¿½\"ï¿½[ï¿½\0\"Qbï¿½ï¿½zï¿½;;=Fï¿½H\0ï¿½\"ï¿½Hï¿½ï¿½!ï¿½ï¿½ï¿½H ï¿½HT|gï¿½Jï¿½:;=Fï¿½H\0ï¿½\"ï¿½Hï¿½ï¿½vgfï¿½ï¿½ï¿½ï¿½1:8D8ï¿½	\0Dï¿½ï¿½vï¿½ï¿½ï¿½uiï¿½ï¿½Sï¿½ï¿½1=Fï¿½H\0ï¿½\"ï¿½Hï¿½ï¿½ï¿½mï¿½zYgï¿½ctnï¿½pn!\0ï¿½Dï¿½ï¿½ï¿½9ï¿½ï¿½ï¿½1ï¿½ï¿½^ï¿½czï¿½ï¿½\0ï¿½-D\0ï¿½(qï¿½]ï¿½ï¿½Jï¿½ï¿½cï¿½ï¿½ï¿½H\0ï¿½\"ï¿½H\\ï¿½Iï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½ï¿½Mï¿½ï¿½sï¿½ï¿½H\0ï¿½\"ï¿½H\\ï¿½ï¿½ï¿½	ï¿½ï¿½B$\0ï¿½;ï¿½ï¿½|R*ï¿½ï¿½\"ï¿½[ï¿½ï¿½ï¿½E\"ÖŽ.ï¿½ï¿½ï¿½	ï¿½ï¿½B$\0(ï¿½ï¿½!ï¿½ï¿½ï¿½H\0 tvï¿½ ï¿½[ï¿½\0\"Agï¿½ï¿½\"ï¿½Hï¿½ï¿½\"AC$\0	\Z\"ï¿½[ï¿½\0\"Agï¿½H\0\"ï¿½ï¿½ï¿½H\0\"Agï¿½Hï¿½GEï¿½ï¿½É“fï¿½ï¿½ï¿½ï¿½[ï¿½ï¿½ï¿½Dbï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½ï¿½ï¿½Øºuï¿½\nï¿½\r<ï¿½Lï¿½Yï¿½tiï¿½}ï¿½/~ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9rdLï¿½ï¿½Â…ï¿½ï¿½Lï¿½2ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½ï¿½ï¿½4ï¿½\\sï¿½}?ï¿½xã¦Wï¿½^ï¿½ï¿½ï¿½ï¿½e>ï¿½8ï¿½	ï¿½ï¿½ï¿½ï¿½ï¿½d{ï¿½ï¿½\'ï¿½,Q$JzÎ’%Kï¿½ï¿½Gyï¿½2ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½qï¿½ï¿½Ø‡~ï¿½ï¿½cï¿½Ó³gOï¿½aï¿½Dï¿½R$>ï¿½ï¿½sï¿½ï¿½ï¿½ï¿½ÔªUï¿½ï¿½ï¿½ï¿½7}ï¿½ï¿½5wï¿½yï¿½=\'zï¿½ï¿½]ï¿½ï¿½sï¿½\0ï¿½ï¿½ï¿½ï¿½Wï¿½jnï¿½ï¿½v{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½×¾vï¿½Hï¿½ï¿½ï¿½pgï¿½N0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Øš5kï¿½ï¿½Nï¿½:ï¿½[nï¿½ï¿½ï¿½zë­¦Cï¿½ï¿½Ì™3ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½kï¿½bï¿½\nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½%~/\"5Y$&Oï¿½lï¿½ï¿½ï¿½ï¿½ï¿½Ç²ï¿½ï¿½mvï¿½n0ï¿½Îï¿½ï¿½B$\0ï¿½#ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½rï¿½ï¿½ï¿½ï¿½Nï¿½ï¿½Hï¿½ï¿½ï¿½pgï¿½ï¿½ï¿½ï¿½ï¿½Ô®]ï¿½v`W_}ï¿½ï¿½ë®»lï¿½ï¿½vï¿½Ú‚N5ï¿½	Nï¿½4ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4Û·oï¿½ï¿½[ï¿½nm^{ï¿½ï¿½kIß‹H@Mï¿½Î;ï¿½ï¿½ï¿½iï¿½\n×¹ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½B$\0ï¿½#ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½jQï¿½(ï¿½9ï¿½ï¿½]8}ï¿½O?Gï¿½ï¿½?ï¿½cÇŽï¿½Xï¿½vï¿½\n:ï¿½`0hSï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý»ï¿½ï¿½7o.ï¿½Ù•ï¿½ï¿½ï¿½ï¿½dï¿½ï¿½Úµï¿½}ï¿½Nï¿½:ï¿½ï¿½ï¿½:uï¿½ï¿½ï¿½YYYï¿½[ï¿½ï¿½wDbÖ¬Yï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½Ô«>ï¿½ï¿½Òžï¿½~=uê”¹ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½s\Z4h`ï§¦ï¿½ï¿½ï¿½-[ï¿½6jï¿½(ï¿½ï¿½>e)ï¿½ï¿½tï¿½}ï¿½ï¿½gï¿½Evvï¿½}/\"5U$T<ï¿½0kï¿½ï¿½nÝºfï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½M7ï¿½ï¿½ï¿½ï¿½ï¿½B$\0ï¿½F$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7fË–-ÅŠDIï¿½):ï¿½ï¿½sï¿½N;ï¿½4ï¿½nOï¿½>ï¿½>ï¿½tï¿½:Xï¿½ï¿½?ï¿½>Wï¿½kï¿½ï¿½lï¿½Ä‰ï¿½uv%}ï¿½{ï¿½g;ï¿½+Wï¿½xï¿½ï¿½ï¿½:ï¿½Nï¿½8a~ï¿½ï¿½Ù¬ï¿½_ï¿½ï¿½ï¿½o}ï¿½ï¿½}Þ¥Kï¿½2ï¿½ï¿½[ï¿½@ÜˆÄ„	ï¿½mï¿½;ï¿½ï¿½ï¿½bEï¿½ï¿½ç„§ï¿½Eï¿½izï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½ï¿½ï¿½ï¿½\'ï¿½?ï¿½ï¿½O&\'\'ï¿½>Oï¿½Ö¾ï¿½ï¿½Ø©qï¿½cï¿½Sï¿½Jï¿½ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½:ï¿½ï¿½ï¿½?ï¿½~\rOï¿½TQã—¾ï¿½%ï¿½Uï¿½Í¹ï¿½H\0Ä½HTuSï¿½Û­ï¿½ï¿½E$ï¿½:ï¿½-\rI|ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9pï¿½\0ï¿½\"ï¿½Hï¿½ï¿½ 4D\0ï¿½ï¿½!ï¿½ï¿½ï¿½H\0 4D8ï¿½8ï¿½	@$ï¿½ï¿½	@$8ï¿½	\0Dï¿½ï¿½	\Z\"ï¿½Hï¿½ï¿½\"AC$\0	\Z\"ï¿½[ï¿½\0\"Agï¿½H\0\"ï¿½ï¿½ï¿½H\0\"Agï¿½H\0\"ï¿½ï¿½ï¿½H\0 tvï¿½Hï¿½	\0Dï¿½ï¿½H\0ï¿½\"ï¿½Hï¿½	ï¿½ï¿½B$	@$ï¿½ï¿½	@$8ï¿½	\0Dï¿½ï¿½	\Z\"ï¿½âº½{ï¿½~ï¿½vï¿½Zï¿½|ï¿½r;Zï¿½mÙ²efï¿½ï¿½ï¿½ynï¿½Hï¿½ï¿½!ï¿½Hpnï¿½F$$kÖ¬1ï¿½ï¿½Ù¼wï¿½ï¿½>ï¿½ï¿½Sï¿½jÕª<W*ï¿½\"ï¿½ Så‚H@ï¿½Ã¹ï¿½HT\'ï¿½D +ï¿½ï¿½ï¿½<\"QkÅ¶#Gï¿½ï¿½\0ï¿½V|ï¿½[^	Dï¿½rDï¿½(ï¿½={ï¿½(ec>ï¿½ï¿½\Zï¿½<wï¿½\\ï¿½ttï¿½vï¿½ï¿½*\nqsnï¿½ï¿½9Vï¿½ï¿½WDï¿½ï¿½5Dï¿½ï¿½D\"ï¿½ï¿½Xï¿½ï¿½ï¿½ï¿½,]ï¿½ï¿½ï¿½Aï¿½ï¿½&ï¿½ oï¿½Vï¿½9\nï¿½jï¿½9Vï¿½ï¿½ï¿½Dï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½mï¿½ï¿½Û¦ï¿½:ï¿½8 ï¿½ï¿½ï¿½ï¿½ï¿½V$\0ï¿½ï¿½ï¿½9ï¿½ï¿½ï¿½ï¿½ï¿½8ï¿½I$Nï¿½4[ï¿½ï¿½2ï¿½_ï¿½Tï¿½ï¿½C	ï¿½pï¿½ï¿½!Dï¿½\nD\"++ï¿½ï¿½H|ï¿½ï¿½ï¿½ï¿½$\"ï¿½lï¿½ï¿½< ï¿½aï¿½Î&11ï¿½ï¿½ï¿½ï¿½9ï¿½yï¿½fDï¿½G\"ï¿½ï¿½Ê§K	=ï¿½< ï¿½ï¿½ï¿½wï¿½5ï¿½ï¿½×§ï¿½ï¿½D\Z4h`ï¿½|ï¿½MDï¿½G\"ï¿½ï¿½ï¿½ï¿½%ï¿½ï¿½C	Ï ï¿½-99ï¿½ï¿½ï¿½iÔ¨ï¿½Yï¿½h\"ï¿½H ï¿½ï¿½ï¿½Xï¿½dï¿½ï¿½ï¿½\0ï¿½ï¿½hÖ¬ï¿½ï¿½5k\"ï¿½#ï¿½ï¿½,ï¿½ï¿½DBï¿½!ï¿½ï¿½gï¿½3gï¿½iÜ¸1==@%ï¿½ï¿½ï¿½nï¿½Lï¿½ï¿½Hï¿½H$vgfï¿½(zy@$<Ã´iï¿½Lï¿½-ï¿½ï¿½*ï¿½ï¿½ï¿½Û›ï¿½ï¿½Dï¿½G\"qï¿½ï¿½ï¿½uiï¿½Ë‡5ï¿½czy@$<Ã¤Iï¿½Lï¿½Vï¿½ï¿½ï¿½*ï¿½ï¿½Ý»ï¿½!Cï¿½ >[ï¿½jß†ï¿½ï¿½ï¿½ï¿½ï¿½!ï¿½ï¿½ï¿½Ð§ï¿½:ï¿½ï¿½T\"ï¿½ï¿½ï¿½3ï¿½ï¿½ï¿½G$ï¿½$ï¿½Î™ï¿½oï¿½ï¿½|Xï¿½=v>ï¿½%@$ï¿½23tï¿½PÓµkWzzï¿½JDï¿½e%	ï¿½ï¿½Vï¿½Ü•9ï¿½ï¿½\Z	=ï¿½ê–ˆï¿½g8pï¿½ï¿½Û·/==\0ï¿½?Dï¿½ï¿½\"qï¿½9ï¿½{ï¿½yqï¿½%\"ï¿½ï¿½=ï¿½ï¿½\"ï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½ï¿½É“ï¿½ï¿½\rDÂ»\"qï¿½,ï¿½	DÂ³hXcØ°aï¿½ï¿½\0ï¿½ï¿½Öï¿½Zï¿½ï¿½wEï¿½,Yï¿½Ò²ï¿½\"ï¿½(ï¿½Ê´4ï¿½ï¿½eï¿½Â…&55ï¿½ï¿½Hï¿½*ï¿½H qKï¿½Ö­ï¿½Ä‰ï¿½ï¿½*ï¿½ï¿½ï¿½ï¿½Hï¿½	ßŠDZZï¿½ï¿½1c==@%ï¿½ï¿½?ï¿½ï¿½ï¿½!ï¿½Dï¿½cÏ;ï¿½ï¿½ï¿½Ù·oï¿½	ï¿½ï¿½\"AC$ï¿½ï¿½6ï¿½ï¿½ï¿½]\0Py;vï¿½(ï¿½H<ï¿½ï¿½Cï¿½D$	Dï¿½Ò A;~\0ï¿½Úµkï¿½ï¿½O?m-ï¿½ï¿½Ó§ï¿½pçŸŠï¿½ï¿½{;Ï•ï¿½\\ï¿½ï¿½%ï¿½ï¿½ï¿½ï¿½9ï¿½ï¿½iï¿½ï¿½	ï¿½}ï¿½ï¿½ï¿½ï¿½mï¿½Ü–ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½&ï¿½ï¿½zï¿½ï¿½qÛ²@ ï¿½ï¿½ï¿½:ï¿½m/ï¿½Ï™ï¿½>ï¿½ï¿½ï¿½ï¿½Iï¿½~/ï¿½kï¿½5s[}ï¿½yï¿½ï¿½ï¿½ï¿½ï¿½ï¿½=ï¿½ï¿½ï¿½ï¿½Ä»ï¿½ï¿½ï¿½oï¿½]ï¿½ï¿½×–.]ï¿½ï¿½ï¿½@$ï¿½hï¿½vï¿½Æï¿½ï¿½\0ï¿½ï¿½Cï¿½ï¿½.ï¿½mÚ´1ï¿½PÈ¸Ó¹sgï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½2EDÂï¿½ï¿½Ü‹ï¿½ï¿½:d]ï¿½%n;ï¿½Gt×±ï¿½uï¿½ï¿½Tw]ï¿½ï¿½ï¿½xL}]ï¿½ï¿½;ï¿½xOIï¿½ï¿½Fï¿½ï¿½=._^vï¿½Î—DH&ï¿½ï¿½oï¿½ï¿½ï¿½vï¿½}ï¿½ï¿½3$ï¿½nï¿½LRï¿½>~Z?Wï¿½\"iq[ï¿½$&,4\\ï¿½	D\"ut;wï¿½ï¿½\n\0ï¿½\0ï¿½ï¿½Oï¿½>6ï¿½ï¿½ï¿½ï¿½Í›ï¿½Qï¿½Fï¿½ï¿½Û·ï¿½+ï¿½ï¿½{aÞ«ï¿½ï¿½+\0ï¿½ï¿½vï¿½ï¿½ï¿½cï¿½8ï¿½ï¿½ï¿½ï¿½r5ï¿½Û¹sï¿½ï¿½Þ½{mï¿½ï¿½@$ï¿½u|ï¿½\0eCâ­µW4ï¿½IA	ï¿½Vï¿½]ï¿½hï¿½ï¿½ï¿½l\"ï¿½?d`cï¿½ï¿½ï¿½ï¿½uï¿½Þ“ï¿½Pï¿½ï¿½ì†/ï¿½ï¿½jï¿½ï¿½ï¿½ï¿½ï¿½p<\n5MÉ¿ï¿½@tï¿½ï¿½ï¿½ï¿½pï¿½\rï¿½ï¿½ï¿½ï¿½ï¿½7ï¿½ï¿½ï¿½ï¿½ï¿½Rï¿½Ó§Oï¿½ï¿½Wq}ï¿½ï¿½ï¿½ï¿½Cï¿½k(ë¦Ÿ7aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½EB\'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0J@ï¿½ï¿½ï¿½Ù³mç­¡@ï¿½wxï¿½ï¿½ï¿½E\"ï¿½ï¿½ï¿½hï¿½Tï¿½ï¿½\Z7ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\r]ï¿½ï¿½iï¿½C=dï¿½Ò²eK{Ù²eï¿½~ßš5kï¿½ï¿½ï¿½}ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½ï¿½-ï¿½Hï¿½ï¿½ï¿½+1ï¿½ï¿½;vï¿½0={ï¿½46l0oï¿½ï¿½ï¿½}=ï¿½Îˆï¿½ï¿½E\"77×žï¿½ï¿½\n\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½ï¿½ï¿½%\r\Zd2339_*@$TQD\"ï¿½M5o>ï¿½ï¿½ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½ï¿½ï¿½7ï¿½xï¿½ï¿½ï¿½^zï¿½ï¿½ï¿½Wï¿½2ï¿½_ï¿½ï¿½ï¿½ï¿½{mï¿½nï¿½HÔ®]Û¾<hÆŽkï¿½/^ï¿½ï¿½ï¿½ï¿½?0ï¿½ï¿½ï¿½ï¿½}nï¿½vï¿½ï¿½ï¿½ï¿½gï¿½ï¿½ï¿½ï¿½?lnï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fï¿½<ï¿½%ï¿½ï¿½ï¿½ï¿½ï¿½Çï¿½c3nï¿½8ï¿½ï¿½ï¿½|ï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½bï¿½\nï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½oï¿½ï¿½ï¿½!>	}ï¿½bJ\Zï¿½1Gï¿½1ï¿½?ï¿½ï¿½ï¿½xï¿½Eï¿½;vï¿½ï¿½9Eï¿½/ï¿½Åï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö‘(N$$ï¿½\\sï¿½ï¿½ï¿½ï¿½ï¿½~Hï¿½ï¿½zï¿½mï¿½|ï¿½}ï¿½ï¿½ï¿½sï¿½Pï¿½wï¿½ï¿½ï¿½^=uï¿½ï¿½Jï¿½ï¿½Ì™3ï¿½ó’’’ï¿½ï¿½Hï¿½ï¿½Ñ~dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½ï¿½oï¿½!\nï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½3ï¿½ï¿½ï¿½W_mgï¿½wï¿½}ï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½Fï¿½Nï¿½\nï¿½Fï¿½Hï¿½T$Tï¿½Hï¿½ï¿½xï¿½Yï¿½|ï¿½ï¿½×¯ï¿½IIIï¿½1mï¿½5bï¿½ï¿½eï¿½Tï¿½\"ï¿½ï¿½:ï¿½ï¿½lDï¿½ï¿½ï¿½{Fï¿½[ï¿½nï¿½Xxï¿½Cï¿½ï¿½ï¿½ï¿½3gÎ˜_|ï¿½ï¿½I0ï¿½Xï¿½Vï¿½.	=^T$ï¿½Iï¿½ï¿½ß¿ï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½8ï¿½ë®»ï¿½JE8ï¿½ï¿½ï¿½vï¿½ï¿½UH$ï¿½@$,*\Zï¿½\'/\0?ï¿½{ï¿½n3zï¿½hÓ¢E+ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ØŽï¿½L$>ï¿½ï¿½Hï¿½ï¿½ï¿½ï¿½Hï¿½GÇ”ï¿½ï¿½}\rï¿½ï¿½/ï¿½\ZFï¿½ï¿½ï¿½7ï¿½ï¿½;ï¿½ï¿½Ç´Ø™.ï¿½ï¿½ï¿½ï¿½ï¿½^ Sï¿½Nï¿½ï¿½Õ­[ï¿½2ï¿½9rï¿½}LY	ï¿½_ï¿½jUï¿½Hï¿½ï¿½ï¿½oï¿½ï¿½ï¿½^ï¿½vï¿½=ï¿½cï¿½^ ï¿½ï¿½eï¿½ï¿½î»¬ï¿½ï¿½Eï¿½ï¿½Tï¿½ï¿½Owï¿½Éƒ>ï¿½ï¿½?ï¿½deeï¿½ï¿½ï¿½ï¿½j#N9ï¿½ï¿½ï¿½mï¿½ï¿½ï¿½U?ï¿½Dï¿½ï¿½}ï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½Í¦Mï¿½ï¿½UW]e~ï¿½_XÐ‡A=Wï¿½qï¿½G8Æªï¿½Pï¿½BQï¿½ï¿½ï¿½ï¿½;Í¤Iï¿½ì…ï¿½zï¿½8ï¿½xï¿½GJ	\\ï¿½ï¿½+]K	ï¿½ï¿½;ï¿½ï¿½Pï¿½OHï¿½\"I-?pï¿½@ï¿½ï¿½ï¿½Hï¿½Æˆï¿½ï¿½ï¿½ï¿½ï¿½yEï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½Qlï¿½,DXï¿½ï¿½ï¿½oï¿½ï¿½ï¿½ï¿½<&ï¿½ï¿½ï¿½{ï¿½cï¿½ï¿½ï¿½ï¿½ï¿½`ï¿½ï¿½ï¿½É“ï¿½ï¿½ï¿½=.IPAeQï¿½PMï¿½ï¿½T4ï¿½ï¿½/ï¿½×“ï¿½Dï¿½ï¿½M7ï¿½tï¿½Hhh#rï¿½ï¿½j&ï¿½ï¿½{ï¿½Cï¿½ï¿½ï¿½_EB{lï¿½ï¿½ï¿½Wï¿½=j;ï¿½ï¿½\"Iujï¿½BWï¿½jï¿½Hï¿½19ï¿½/Uï¿½ ï¿½\n!5Å¸ï¿½ï¿½5cCï¿½Pï¿½ï¿½ï¿½ï¿½J[WBï¿½ï¿½,ï¿½ï¿½ï¿½)ï¿½Wï¿½ï¿½Hï¿½ï¿½9sï¿½ï¿½On\0ï¿½\n+Wï¿½ï¿½ï¿½b\r6ï¿½)ï¿½&Mï¿½ï¿½Jsmï¿½\r5_$ï¿½pï¿½`ï¿½.Vï¿½D$ï¿½6mï¿½-<ï¿½ï¿½hï¿½1cï¿½ï¿½{$\ZVï¿½Uï¿½^ï¿½oï¿½ï¿½H ï¿½\"Qï¿½ï¿½ï¿½Fï¿½g|ï¿½ï¿½Gï¿½ï¿½ï¿½$ï¿½ï¿½Í³ï¿½ iï¿½<H\"4ï¿½+ï¿½\0Dï¿½@$ï¿½\Zï¿½ï¿½ï¿½x2ï¿½Z$Fï¿½Uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\'ï¿½6mjï¿½Aï¿½ï¿½Sï¿½(ï¿½D$	Dï¿½ï¿½ï¿½ï¿½ï¿½]ï¿½ï¿½A|Iï¿½ï¿½~ï¿½ò—¿´_ï¿½U&Tï¿½ï¿½Hï¿½lï¿½Hï¿½}ï¿½ï¿½ï¿½ï¿½\\ï¿½`ï¿½H ï¿½\"hZ\\ß¾}ï¿½ï¿½ï¿½L\"ï¿½ï¿½Oï¿½ï¿½\"ï¿½*h\nï¿½ï¿½sï¿½6hjï¿½\n}ï¿½Êžï¿½\"ï¿½H ï¿½Dï¿½ï¿½O<Aï¿½ï¿½qï¿½ï¿½5ï¿½kï¿½ï¿½Oï¿½ï¿½ï¿½+Ivï¿½ï¿½ï¿½.Eï¿½$\"ï¿½Hï¿½	ï¿½a\r}\"ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½+Cï¿½ï¿½k{ï¿½ï¿½Eoï¿½Ü´ï¿½$ï¿½Ð™ï¿½AEï¿½Zï¿½zÏž=ï¿½#ï¿½ï¿½!^Cï¿½ï¿½*ï¿½ï¿½ï¿½ï¿½ï¿½0ï¿½shu:ï¿½ï¿½kFC\\\r>ï¿½nxï¿½\"Imï¿½ï¿½\rï¿½ï¿½!ï¿½6ï¿½@$hï¿½ï¿½ï¿½iÝºï¿½ï¿½8q\"ï¿½[ï¿½KDï¿½LÔªUï¿½Ì™	\r=4hï¿½ï¿½\nï¿½ï¿½\\ï¿½ï¿½|%T$ï¿½ï¿½ï¿½ï¿½ï¿½\n$U(Ù¶m[ï¿½Iï¿½ï¿½ï¿½@$hï¿½ï¿½ï¿½HKKï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½+}ï¿½ï¿½ï¿½ï¿½<Dnï¿½Tï¿½ï¿½ï¿½*ï¿½\\ï¿½fï¿½4hï¿½]N=\\$ï¿½ï¿½ï¿½ï¿½\Z\0ï¿½\rï¿½ï¿½Hè‚ ï¿½7ï¿½ï¿½Dï¿½ï¿½ï¿½2k×®ï¿½BPtFmO,ï¿½v~xï¿½2=OÂ¡z\ZmQï¿½uï¿½	Dï¿½@$,ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½$\"ï¿½36ï¿½ï¿½_Kï¿½ï¿½ï¿½ï¿½}ï¿½Iï¿½ï¿½ï¿½*ï¿½CZ:]ï¿½3ï¿½:\0ï¿½@$	Dï¿½Xtï¿½ï¿½Vï¿½Pqï¿½ï¿½Î ï¿½ï¿½ï¿½ï¿½ï¿½Dqï¿½	mï¿½[ï¿½Dï¿½ï¿½f]ï¿½ï¿½o\0@$hï¿½ï¿½ï¿½Pï¿½ZKCï¿½ï¿½Tï¿½ï¿½9ï¿½QVï¿½ï¿½|]eJï¿½pÓŽï¿½\0ï¿½\"ï¿½H eBRï¿½Kï¿½ï¿½,ï¿½Pï¿½,ï¿½î£­ï¿½ï¿½F$ï¿½ï¿½cÖ©Sï¿½Ô«Wï¿½4oï¿½Ü¶ï¿½fXEKï¿½\"qe4ï¿½ï¿½ï¿½?\"ï¿½Hï¿½(ï¿½}ï¿½ï¿½!zï¿½Jï¿½pï¿½{Ö¬Y&ï¿½ï¿½ï¿½xï¿½ï¿½\'/ï¿½Í¡ï¿½ï¿½ï¿½4#Cï¿½Oï¿½wï¿½\0 ï¿½ï¿½fÍšï¿½ï¿½ï¿½lï¿½ï¿½Úï¿½\\ï¿½8ï¿½Hï¿½ï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½nï¿½(ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½ÎˆE$ï¿½?ï¿½Jï¿½Lï¿½t5 WfÅŠï¿½Vï¿½Zï¿½ï¿½ï¿½\'ï¿½ï¿½Ø‹ï¿½sï¿½ï¿½F\"ï¿½-[vï¿½mCï¿½8Cï¿½D^è”(ï¿½iÑ¡ï¿½ï¿½ï¿½Oï¿½ï¿½nï¿½PjUC5mÊ¤!ï¿½ï¿½ï¿½vï¿½ï¿½ï¿½VOï¿½ï¿½ZQï¿½uï¿½aï¿½ï¿½ï¿½IXcï¿½iï¿½ï¿½.lÔ®];ï¿½ï¿½fÇŽï¿½G]ï¿½tï¿½ï¿½vï¿½Ñ ï¿½ï¿½{ï¿½ï¿½e7\ZSï¿½ï¿½ï¿½ï¿½v(}ï¿½ï¿½Erï¿½ï¿½ï¿½vGSmGï¿½ï¿½Gï¿½ighï¿½ï¿½1cï¿½ï¿½}ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½vï¿½ï¿½:\Z/ï¿½ï¿½ï¿½yï¿½ï¿½ï¿½ï¿½FMï¿½ï¿½?ï¿½ï¿½Ý°hï¿½\"ï¿½tï¿½Rï¿½Jï¿½ï¿½ï¿½Vaï¿½ï¿½Nï¿½[ï¿½ï¿½lØ°ï¿½Ö—hí…­[ï¿½ï¿½%ï¿½wï¿½ï¿½}ï¿½\Zï¿½ï¿½ï¿½_ï¿½zvFï¿½ï¿½$ï¿½iï¿½/@$j2î…¯ï¿½ï¿½)ï¿½ï¿½Rï¿½5ï¿½ï¿½ï¿½Sï¿½ï¿½ï¿½ï¿½&ï¿½~Eï¿½y/Iï¿½ï¿½2ï¿½	5Yï¿½>ï¿½*;ï¿½ï¿½ï¿½ï¿½ï¿½V)ï¿½zJï¿½Û·ï¿½^$uï¿½Ü¾}ï¿½ï¿½xï¿½\"ï¿½ï¿½ï¿½%ï¿½ï¿½Uï¿½ï¿½bï¿½ï¿½ï¿½Þ¼ï¿½Vï¿½ï¿½ï¿½.ï¿½ï¿½ï¿½Í³ï¿½ï¿½uï¿½V*]+#ï¿½\"ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\"?nï¿½8{ï¿½ï¿½ï¿½_k\Zï¿½1ï¿½Jï¿½ï¿½ï¿½Hï¿½ï¿½J\Z$ï¿½ï¿½Dï¿½>}ï¿½\\H2Ôºuï¿½fï¿½sï¿½ï¿½VD$%ï¿½5ÉŠï¿½Eï¿½\"ï¿½ï¿½Ì¨Il$9jï¿½ï¿½$H2$)ï¿½I\0ï¿½Dï¿½<Iï¿½\"ï¿½J\'nY\n\Zï¿½ï¿½ï¿½ï¿½.sæ¡¢DB<ï¿½ï¿½ï¿½ï¿½9}ï¿½W6@$<Æƒ>xï¿½Û¿\\PC4	ï¿½ï¿½Ð†ï¿½DbUtXï¿½ï¿½aï¿½ï¿½ï¿½HPT	ï¿½ï¿½7	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½uï¿½ï¿½CD	ï¿½sï¿½Pï¿½Cï¿½ï¿½ï¿½\Zï¿½ï¿½^k\0\"ï¿½MÇ¹ï¿½my}ï¿½*ï¿½ï¿½H@ï¿½ï¿½ï¿½Vï¿½\\ï¿½zï¿½ï¿½_Uï¿½6Ê»ï¿½8\0\"Qï¿½qï¿½ï¿½ï¿½E>ï¿½\\ï¿½Pï¿½A$ ï¿½ï¿½@Dï¿½ï¿½UYfSï¿½G$Tï¿½ï¿½ï¿½ ï¿½Gbbï¿½SÜ°j0lKt	ï¿½ï¿½Ú…ï¿½\\ï¿½ï¿½Ê–*:@$<ï¿½ï¿½8^ï¿½H8ï¿½ï¿½ï¿½ï¿½ ï¿½*kï¿½\r$	ï¿½Kï¿½ï¿½ï¿½fï¿½ï¿½ï¿½ï¿½%D|ï¿½ï¿½ï¿½ï¿½ï¿½?	oï¿½Jï¿½mï¿½ï¿½(M$ï¿½yï¿½H!ï¿½ï¿½Dyj\Zï¿½@$ï¿½C ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Pï¿½ï¿½nï¿½(ï¿½D$ï¿½ï¿½Dï¿½ï¿½\0 ï¿½Å•	ï¿½ï¿½x`ï¿½ï¿½Ò½?TSCï¿½\">ï¿½LD#H ï¿½?ï¿½q<4\'ï¿½@ï¿½\"RW\Zï¿½ï¿½O\n+ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½H<J$	ï¿½2e\Zï¿½5H ï¿½/ï¿½,ï¿½ï¿½H\0ï¿½I&ï¿½Y\0ï¿½ï¿½ï¿½Hï¿½zï¿½ï¿½ï¿½@$	ï¿½be\",\reï¿½\0@$|Uq;\"\0%ï¿½@<ï¿½ï¿½ï¿½ï¿½	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½{	Dï¿½ï¿½Ì„>q ï¿½H@QÇ©ï¿½ï¿½gï¿½\"P*	\0Dï¿½ï¿½ï¿½ï¿½\"ï¿½H\0 ï¿½H@Ô„Bï¿½!nï¿½pï¿½H \0ï¿½ Kï¿½ï¿½Tï¿½qv	D\0ï¿½\0Dbï¿½ï¿½ï¿½Hï¿½#ï¿½\0\"ï¿½ï¿½\"k%Dï¿½\0@$\0ï¿½ï¿½XDï¿½\ro	D\0ï¿½\0Dï¿½ï¿½qï¿½ï¿½ï¿½H \0ï¿½ 5ï¿½`ï¿½3ï¿½u ï¿½\0\"ï¿½ï¿½2ï¿½q&11ï¿½!ï¿½\0\"ï¿½ï¿½\"ï¿½Ç¹ï¿½H \0ï¿½ ï¿½Hï¿½iï¿½.\"ï¿½H\0 ï¿½H@T4mï¿½ï¿½zvï¿½D$\0	@$ &ï¿½ï¿½ï¿½ï¿½7ï¿½	D\0ï¿½\0Dbï¿½xï¿½mï¿½\"ï¿½H\0\"Qï¿½ï¿½ï¿½Dï¿½\0@$\0ï¿½ï¿½ï¿½	ï¿½BÜ¾ï¿½ï¿½@$\0	@$ ï¿½\Zï¿½qï¿½`ï¿½C\"ï¿½H\0 ï¿½H@Ô¸ï¿½+ï¿½	D\0ï¿½\0Db)ï¿½\\ï¿½ï¿½\n\"ï¿½H\0 ï¿½H@,C[ï¿½6ï¿½H \0ï¿½ KFï¿½#ï¿½e	D\0ï¿½\0Dbï¿½Oï¿½Ö“H \0ï¿½ ï¿½Hï¿½\nï¿½\rï¿½\"ï¿½H\0\"Qï¿½JÄ…ï¿½ï¿½ODï¿½\0@$\0ï¿½ï¿½X2y)))?&ï¿½\0\"ï¿½DK-ï¿½}ï¿½ï¿½ï¿½ï¿½P \0ï¿½ III?t\'ï¿½H \0ï¿½ K}ï¿½nï¿½pï¿½H \0ï¿½ K}Dï¿½fm	D\0ï¿½\0Dï¿½&tï¿½Gï¿½\"ï¿½H\0\"Qï¿½8Î³nï¿½ï¿½E$	\0D	ï¿½ï¿½P(ï¿½ï¿½ï¿½/l%ï¿½\0\"ï¿½ï¿½R#ï¿½ï¿½mo	D\0ï¿½\0Dï¿½&nï¿½\"ï¿½H\0\"ï¿½d$vï¿½m\"ï¿½@$\0	@$ ï¿½8ï¿½ADï¿½\0@$\0ï¿½ï¿½XDï¿½ï¿½Z	D\0ï¿½\0Dbï¿½sï¿½Pï¿½1\"ï¿½H\0 ï¿½H@,Å–ï¿½ï¿½Hï¿½ï¿½@$\0	@$ ï¿½ï¿½ï¿½ï¿½]ï¿½ï¿½×ˆ\"ï¿½H\0\"Qï¿½è£Þ¢>ï¿½H \0ï¿½ 5ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½	ï¿½ï¿½\"ï¿½H\0\"ï¿½k<î¶³Dï¿½\0@$\0ï¿½ï¿½X\n-ï¿½:ï¿½ï¿½C$	\0D	ï¿½\ZW\"ï¿½}ï¿½A\"ï¿½H\0 ï¿½H@,CÏ»m\'ï¿½@$\0	@$ jï¿½ï¿½ï¿½`0ï¿½6ï¿½@$\0	@$ ï¿½ï¿½ï¿½Zï¿½-!ï¿½\0\"ï¿½ï¿½\"Ûƒï¿½ï¿½4\"ï¿½H\0 ï¿½H@,\"ï¿½q xï¿½H \0ï¿½ ï¿½H|æ¶ŽDï¿½\0@$\0ï¿½ï¿½XDï¿½LÐ…H \0ï¿½ 5ï¿½ï¿½\\ï¿½_ï¿½ï¿½}Dï¿½\0@$\0ï¿½ï¿½X2yï¿½ï¿½É·	D\0ï¿½\0Dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?	\0D	ï¿½ï¿½ï¿½ï¿½Ä»ï¿½ï¿½`.ï¿½@$\0	@$ jBï¿½ï¿½ï¿½\\ï¿½8O$	\0D	ï¿½ï¿½>ï¿½ï¿½ï¿½8\'ï¿½\"ï¿½H\0\"ï¿½ï¿½D_ï¿½}B$	\0D	ï¿½\Zï¿½qÆºm/ï¿½@$\0	@$ jï¿½ï¿½ï¿½?ï¿½D$	\0D	ï¿½ï¿½`0ï¿½ï¿½ï¿½ï¿½$ï¿½\0\"ï¿½ï¿½R#ï¿½Ù•ï¿½ï¿½ï¿½\"ï¿½H\0\"ï¿½d$ï¿½9ï¿½3ï¿½H \0ï¿½ KF\"ï¿½mï¿½ï¿½\"ï¿½H\0\"ï¿½ï¿½ï¿½Iï¿½q\Z	D\0ï¿½\0Dbï¿½ï¿½H<D$	\0D	ï¿½\ZW\"ï¿½ï¿½vï¿½@$\0	@$ Zjï¿½/ï¿½Wï¿½Þµï¿½ï¿½\0@$\0ï¿½ï¿½hï¿½5ï¿½ï¿½<\"ï¿½H\0 ï¿½H@ï¿½ï¿½ï¿½Ý¾ï¿½\"ï¿½@$\0	@$ jï¿½ï¿½`}ï¿½/8M$	ï¿½RiÖ¬ï¿½ï¿½ï¿½Zï¿½\r ï¿½ï¿½ï¿½ï¿½cDï¿½\0(ï¿½Õ«W_Q$fÍšEï¿½\0ï¿½ï¿½_Fbï¿½{ï¿½ï¿½\'ï¿½ï¿½iÒ¤Iï¿½ï¿½ï¿½ï¿½bÎŸ?Oï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½6\"ï¿½H\0ï¿½++1sï¿½Lï¿½ï¿½?ï¿½6ï¿½ï¿½-ï¿½HxX$ï¿½)qÎœ9ï¿½Oï¿½>ï¿½eï¿½ï¿½ï¿½]\0Bï¿½ï¿½iÜ¸ï¿½ï¿½Ý»ï¿½ï¿½4iï¿½9}ï¿½4=\rï¿½Hqï¿½ï¿½ï¿½ ï¿½ï¿½o3ï¿½ï¿½ï¿½Wï¿½ï¿½E\"++ï¿½ï¿½ï¿½ï¿½ï¿½2qï¿½Rï¿½Xtï¿½ï¿½ï¿½ï¿½Ø±ï¿½Ê”ï¿½ï¿½6	_ï¿½Hï¿½rï¿½d\"ï¿½!ï¿½ï¿½\'ï¿½Aï¿½Y!ï¿½F ï¿½kï¿½Rï¿½ï¿½ï¿½ï¿½4oÞœl ï¿½8ï¿½Ä“Dï¿½#\"ï¿½eï¿½Û±ï¿½-Zï¿½qï¿½Æ™uï¿½Ö™ï¿½ï¿½ï¿½gï¿½ï¿½ï¿½ï¿½kvvï¿½yï¿½ï¿½wï¿½?ï¿½ï¿½OÓ¶mï¿½Ë¾7))É¬_ï¿½ï¿½ï¿½\nXï¿½|yï¿½ï¿½Cï¿½f\0ï¿½ï¿½ï¿½Eï¿½sï¿½qZ	ï¿½ï¿½:ï¿½ï¿½ï¿½ï¿½:uï¿½ï¿½pï¿½Ò¥2ï¿½Î¦Mï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½kï¿½ï¿½ï¿½ï¿½ï¿½Z	ï¿½ï¿½Hï¿½ï¿½Fï¿½\\ ï¿½\"ï¿½\"!ï¿½ï¿½ï¿½HLL4ï¿½ï¿½ÏJ ï¿½ï¿½xï¿½b;ï¿½ï¿½ï¿½p(ï¿½JÔ©Sï¿½@\0\"AFï¿½ï¿½~I$ï¿½X$4ï¿½!qï¿½ï¿½ØµkWï¿½ï¿½p}ï¿½ï¿½iÕªUï¿½ï¿½ï¿½ ï¿½~ï¿½iï¿½!ï¿½ï¿½\0ï¿½ï¿½Hï¿½Cï¿½MD\"NEBiï¿½ÈšIï¿½j*ï¿½^ï¿½Lï¿½fï¿½L$âª«ï¿½2ï¿½ï¿½ï¿½/ï¿½Wd	Rï¿½^ï¿½ï¿½u] q,ï¿½ï¿½9ï¿½QQï¿½ï¿½ï¿½2ï¿½ï¿½=zï¿½ï¿½7ï¿½Dï¿½ï¿½aï¿½ï¿½ï¿½ ï¿½ï¿½_khï¿½HÄ©Hhï¿½ï¿½Èºï¿½DT&ï¿½ï¿½ï¿½ï¿½ï¿½Ð\nï¿½[\"ï¿½t\0ï¿½ï¿½6ï¿½5ï¿½ï¿½{=8K$ï¿½T$ï¿½ï¿½Tï¿½ï¿½.Tï¿½	Ø¥Kï¿½ï¿½ï¿½ï¿½Eï¿½\0ï¿½(ï¿½ï¿½2\0ï¿½ï¿½?Ð´OMï¿½$q(ï¿½ï¿½ï¿½ï¿½ï¿½)ï¿½Uï¿½ï¿½ï¿½+`ï¿½ï¿½ï¿½ï¿½+!0ï¿½ï¿½ï¿½ï¿½ï¿½BTï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½Lï¿½ï¿½Eï¿½ï¿½7Giï¿½ï¿½ï¿½È†O$\"R&jÕªEf	ï¿½ï¿½dï¿½Zï¿½ï¿½HÄ¡Hhï¿½ï¿½ï¿½|ï¿½Ä‰UzNï¿½6ï¿½ï¿½ï¿½ï¿½eKFï¿½mgwï¿½9ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½	@$ï¿½ï¿½ï¿½ï¿½ï¿½×¦]D\"EBï¿½xï¿½/ï¿½Zï¿½ï¿½*ï¿½0Jï¿½gï¿½ï¿½ï¿½?zï¿½ï¿½6lXï¿½5-	ï¿½IDï¿½ï¿½\'3ï¿½ï¿½ï¿½Eï¿½-m#N$ï¿½P$\"ï¿½#>\\ï¿½\'ï¿½Ö•ï¿½ï¿½ï¿½PÝ„ï¿½;ï¿½XUqï¿½ï¿½Dï¿½KDnnï¿½ï¿½j^_Kï¿½ï¿½ï¿½\0Dï¿½ï¿½Å–ï¿½ï¿½~~ï¿½ï¿½Cï¿½ï¿½ï¿½Pï¿½7ï¿½*ï¿½ï¿½ï¿½Aï¿½_\"ï¿½ï¿½.ï¿½ï¿½ï¿½kI2Qï¿½ï¿½ï¿½L\0\"ï¿½ï¿½ï¿½~ï¿½Cï¿½p\"ï¿½\"QD#ï¿½ï¿½ï¿½6cï¿½)ï¿½ZÈªoß¾v!-\rï¿½dddï¿½ï¿½ï¿½Ç›ï¿½Sï¿½ï¿½Rï¿½ï¿½ï¿½lï¿½2ï¿½ï¿½ï¿½i6nï¿½hvï¿½ï¿½i8`ï¿½;ï¿½ï¿½Pï¿½4ï¿½ï¿½C~ï¿½[ï¿½LDJDï¿½5mÚ´Â†I\0ï¿½\Z+ï¿½ï¿½@g\"AFï¿½\\	Vï¿½u4ï¿½Mï¿½2ÅŒ;ÖŒ1ï¿½<ï¿½~2ï¿½Õ«ï¿½ï¿½Úµï¿½ï¿½Ð¡ï¿½iÓ¦ï¿½iÙ²ï¿½ï¿½MRï¿½ï¿½\rï¿½ï¿½ï¿½dï¿½ï¿½\Z:ÑIï¿½Iï¿½ï¿½ï¿½sï¿½\\}ï¿½ï¿½Wï¿½ï¿½ï¿½jÝºï¿½}mï¿½]ï¿½ï¿½ï¿½ï¿½oï¿½zï¿½)3|ï¿½pï¿½ï¿½Nï¿½<ï¿½Ì˜1ï¿½nï¿½ï¿½hï¿½\"ï¿½jï¿½*ï¿½ï¿½ï¿½ï¿½iï¿½ï¿½ï¿½cï¿½9bNï¿½<yï¿½Tï¿½ï¿½%ï¿½$Iï¿½ï¿½ï¿½+=ï¿½a@$<)ï¿½ï¿½\"ï¿½HDEï¿½\Z	ï¿½lï¿½2ï¿½=ï¿½ï¿½ï¿½ï¿½ì„²ï¿½V(kï¿½ì…²ï¿½f(ï¿½ï¿½ì†²ï¿½vï¿½wRï¿½CYeCï¿½QvDYï¿½ï¿½ï¿½4[ï¿½Ú¨Q#ï¿½_ï¿½fï¿½Dï¿½Kï¿½mï¿½u\\ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½I^ï¿½7oï¿½Yï¿½+eJï¿½ï¿½ï¿½/ï¿½I\"\"ï¿½9\0ï¿½ï¿½H\\ï¿½ï¿½8ï¿½ï¿½8kChï¿½Fï¿½Î/ï¿½xEDï¿½Jï¿½ï¿½ï¿½ï¿½gï¿½nï¿½j3ï¿½`(ï¿½1wï¿½\\3sï¿½Ì¸Îº<ï¿½ï¿½eï¿½\'ï¿½^{mï¿½%ï¿½ï¿½LP3ï¿½ï¿½\'ï¿½-ï¿½ï¿½>ï¿½D\"Eï¿½&ï¿½#!tï¿½ÒŽï¿½ï¿½Bï¿½Íºï¿½ï¿½ï¿½meï¿½\'ï¿½Hï¿½ï¿½Hxï¿½|ï¿½ï¿½ï¿½?kï¿½8	}\nï¿½ï¿½ï¿½-ï¿½éº¬+[J(ï¿½fï¿½]ï¿½^ï¿½ï¿½î»£ï¿½>\rgï¿½Dè¾ŽGï¿½ï¿½?lï¿½Wï¿½\0\"ï¿½Ùˆï¿½ï¿½ï¿½@.ï¿½ï¿½Sï¿½Ð§ï¿½È?ï¿½kb!Ú©ï¿½ï¿½ï¿½Ð°\0\"ï¿½\"ï¿½{-8O$ï¿½T$ï¿½ï¿½Ø‘ï¿½VEVï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½\Zï¿½ï¿½^k\0\"ï¿½\"ï¿½Ø½ï¿½$q,YYYï¿½\nï¿½4~^ï¿½,^ï¿½ï¿½ï¿½Le\'ï¿½2Qï¿½ï¿½6Xï¿½\n	o\nï¿½ï¿½ï¿½×‚l\"ï¿½\"!\"ï¿½.55q×®]ï¿½rï¿½i[ï¿½záŸ¥lxO&ï¿½ï¿½MQQï¿½Hï¿½@ï¿½ï¿½\Zï¿½HxJ$Æ¸fï¿½ï¿½8	MMï¿½.ï¿½ï¿½TÅŠDï¿½ï¿½\0áŸ¡ï¿½ï¿½ï¿½ï¿½$\\ï¿½yï¿½ï¿½È•-5]\0ï¿½ï¿½ï¿½ï¿½`ï¿½ï¿½8ï¿½ï¿½Dï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½Cï¿½ï¿½ï¿½ï¿½L()ï¿½9ï¿½yï¿½ï¿½aï¿½ï¿½ï¿½kï¿½\0Dï¿½s\"ï¿½ï¿½mï¿½ï¿½ï¿½DBÌ›7ï¿½ï¿½Lhï¿½C5ï¿½)ï¿½TMDï¿½pï¿½ï¿½ï¿½0\0ï¿½d&\"eBï¿½ï¿½ï¿½ï¿½ï¿½<Ö‹\0Dï¿½ï¿½\"ï¿½IY	\"ï¿½ï¿½(N&Â³96mï¿½ï¿½ë¨ˆRï¿½2]\"\Zï¿½ï¿½_fï¿½<5\rH ï¿½ï¿½qï¿½ï¿½nK$<$ï¿½aï¿½Èšï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½Ø½9ï¿½}ï¿½j $Zï¿½2rï¿½ï¿½Èšï¿½3ï¿½Lï¿½gx\0ï¿½ï¿½Hdï¿½×ˆï¿½Dï¿½c\"!T9ï¿½ï¿½<Mï¿½3(ï¿½$3ï¿½ ï¿½Hï¿½fhï¿½Ûš	ï¿½Dï¿½3ï¿½ï¿½#Wï¿½,Kï¿½ï¿½Ø”ï¿½x\0g&ï¿½2Ì¡)ï¿½V\"ï¿½ï¿½8_ï¿½^ï¿½ï¿½	ï¿½D-ï¿½ï¿½ï¿½9ï¿½ï¿½ï¿½Nï¿½[ï¿½ï¿½ï¿½Aï¿½xï¿½ï¿½ï¿½ï¿½`ï¿½kï¿½%ï¿½ï¿½ï¿½@\"\0ï¿½ï¿½ï¿½`0ï¿½nÝº?%>ï¿½ï¿½,\\ï¿½ï¿½@\"ï¿½.]Jï¿½å–‰ï¿½ÖŸ\0@$<ï¿½ï¿½0ï¿½ï¿½Hï¿½P$ï¿½}ï¿½ï¿½ï¿½E&ï¿½ï¿½Pï¿½a\0Dï¿½;$\'\'ï¿½ï¿½^Cï¿½EbÎœ9ï¿½ï¿½Dï¿½ï¿½ï¿½h	g xï¿½vï¿½DÂŸï¿½\Zï¿½sï¿½\"ï¿½ï¿½H4lï¿½ï¿½2ï¿½hÖ¬=Ä”ï¿½ï¿½ï¿½ï¿½\0DÂ—ï¿½\Z!ï¿½ï¿½!>ï¿½^xï¿½Ä™\Zk×®ï¿½wï¿½ï¿½ï¿½{GÅ¼\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Hï¿½PUï¿½i?\rï¿½hÑŠï¿½Ç\'ï¿½Hï¿½O$ï¿½qï¿½ï¿½ï¿½ï¿½ï¿½ï¿½DBï¿½?ï¿½ï¿½~ï¿½WB,\"qï¿½ï¿½Qï¿½ï¿½ï¿½j$ï¿½9ï¿½ï¿½ï¿½Hï¿½H$Jï¿½FD.ï¿½\rï¿½H8pï¿½@\0\"ï¿½\Zï¿½%n[K$|Xlfï¿½Îv!*ï¿½ï¿½ï¿½Ð¾}ï¿½ ï¿½ï¿½ï¿½ï¿½@`ï¿½ï¿½Hlß¾ï¿½n5P^ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½n{ï¿½Hï¿½X$ï¿½U8\"ï¿½Eï¿½!ï¿½ï¿½\0	ß‰ï¿½!ï¿½=E$|,ÚK{n\0ï¿½ï¿½ï¿½lØ°ï¿½@\0\"ï¿½3ï¿½ï¿½qEï¿½5ï¿½ï¿½Hï¿½ï¿½ï¿½E\0ï¿½<$\'\'ï¿½	 ï¿½ï¿½Hï¿½\rï¿½Buï¿½ï¿½ï¿½EbÝºuï¿½ï¿½ï¿½ï¿½ï¿½ï¿½jï¿½*ï¿½ï¿½ï¿½Dï¿½Rbbï¿½	ï¿½Dffï¿½ï¿½4	Pï¿½ï¿½ï¿½ï¿½eï¿½ ï¿½	ï¿½è£ï¿½B$|,ï¿½Wï¿½6\r\Z4ï¿½Gï¿½rÑ¨Q#ï¿½hï¿½\"ï¿½ï¿½ï¿½HIIï¿½I\"A$|.+Wï¿½ï¿½iiï¿½ï¿½mï¿½ï¿½Í›G \0ï¿½ï¿½W6ï¿½nï¿½%>	ï¿½ï¿½ï¿½ï¿½(Mï¿½41ï¿½gï¿½&ï¿½Hï¿½ï¿½P(ï¿½ï¿½ï¿½8çˆ„ï¿½EbÉ’%6-\rPï¿½7onï¿½q@$|ï¿½ï¿½hï¿½Ï‰ï¿½ï¿½Ebï¿½ï¿½&55ï¿½ï¿½EË–-ï¿½Ô©S	 ï¿½ï¿½An;L$|.\Zï¿½ï¿½ï¿½6@yhÕªï¿½ï¿½<y2ï¿½\0Dï¿½Gï¿½Iï¿½Hï¿½&>ï¿½ï¿½sï¿½\"PnÚ´icÆO \0ï¿½ï¿½ï¿½`ï¿½Uï¿½m >	È©Pï¿½<ï¿½oï¿½ï¿½<ï¿½ï¿½s	\rmd:ï¿½ï¿½:ï¿½ï¿½HÌš5ï¿½4kÖŒï¿½EÇŽÍ³ï¿½>K \0ï¿½ï¿½HluEb&ï¿½ï¿½Hï¿½ï¿½^ï¿½\0ï¿½k×®fØ°a	ï¿½DV0A$|.Ó§O7iiiï¿½(P.zï¿½ï¿½iï¿½zï¿½)ï¿½ï¿½ï¿½Dï¿½h ï¿½F$|.ï¿½ï¿½ï¿½ï¿½{\0ï¿½wï¿½ï¿½ï¿½\'ï¿½ ï¿½Hï¿½ï¿½qNï¿½2ï¿½D$|.Sï¿½L1ï¿½ï¿½ï¿½ï¿½(P.ï¿½ï¿½ï¿½gï¿½ï¿½ï¿½O \0ï¿½ï¿½WFï¿½b0|ï¿½Hï¿½\\$&Mï¿½dï¿½\0\0(ï¿½F(+ï¿½Hï¿½J$ï¿½RSSï¿½O$|.ï¿½ï¿½ï¿½5\0\0Êƒï¿½#T\'ï¿½Hï¿½ï¿½zï¿½ï¿½]ï¿½ï¿½ï¿½g-ï¿½ï¿½sï¿½;vï¿½iÛ¶-=\nï¿½ï¿½ï¿½ï¿½ï¿½\r\0Dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½qï¿½<\"ï¿½Hï¿½ï¿½ï¿½Ó¡Cz(ZCBkI\0 ï¿½ ï¿½ï¿½mï¿½\"aFï¿½i:uï¿½Dï¿½ï¿½Bï¿½ZjuK\0Dï¿½7ï¿½ï¿½ï¿½vï¿½H fï¿½ï¿½ï¿½sï¿½ï¿½ï¿½(P.Æï¿½ ï¿½ï¿½^nï¿½ï¿½H ï¿½mCï¿½ï¿½ï¿½?ï¿½ï¿½ï¿½ï¿½pgï¿½+ï¿½ï¿½\"aï¿½bï¿½wï¿½Nï¿½å‚…ï¿½\0ï¿½ï¿½Hï¿½rEb3ï¿½@$ï¿½ï¿½{ï¿½\0\"ï¿½;ï¿½Xï¿½ ï¿½ï¿½4h	Aï¿½a;z@$ï¿½ï¿½+ï¿½ï¿½\nï¿½@$ï¿½ï¿½ï¿½Mß¾}ï¿½Qï¿½\\Ì›7ï¿½4nÜ˜@\0\"ï¿½bï¿½=ï¿½ï¿½#ï¿½ï¿½ï¿½Aï¿½$\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Tï¿½ï¿½Dï¿½W$ï¿½	Dï¿½Í–ï¿½BXï¿½lï¿½iØ°ï¿½ï¿½ï¿½ï¿½ï¿½cvï¿½ï¿½aï¿½ï¿½ï¿½ ï¿½ï¿½8ï¿½fDï¿½ï¿½ï¿½\Z\Zï¿½\0(+ï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½hÜŽï¿½hï¿½ï¿½ï¿½\Zï¿½.@$<ï¿½ï¿½8\nï¿½ï¿½F$	[hï¿½ï¿½Kï¿½hï¿½Ó§Oï¿½ï¿½&ï¿½8zï¿½(ï¿½DÂ»\"ï¿½ï¿½~ï¿½ï¿½ï¿½H ï¿½Gï¿½fï¿½ï¿½ï¿½ï¿½(uVï¿½ï¿½4Rï¿½Hï¿½}ï¿½HxZ$LÓ¦Mï¿½\'ï¿½ï¿½ï¿½Ö­ï¿½:t(=\nDï¿½VE-I$:Dï¿½\0ï¿½ï¿½(uï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½\'\"ï¿½/ï¿½tï¿½bï¿½yï¿½zï¿½)+Q\\ï¿½Kï¿½\"ï¿½mï¿½×¯ï¿½{ï¿½_$ï¿½ï¿½E;ï¿½1ï¿½bbÒ¤Iï¿½ï¿½ï¿½Úµk	 &11ï¿½q9C$	KÇŽÍ¨Qï¿½ï¿½Q f4ï¿½#,-Zï¿½  ï¿½Hxï¿½`0ï¿½ï¿½=ï¿½?#ï¿½ï¿½ï¿½}ï¿½ï¿½ï¿½çž£Gï¿½ï¿½ï¿½bTaï¿½ï¿½m\0Dï¿½ï¿½8ï¿½3ï¿½=ï¿½?&ï¿½ï¿½ï¿½mÛ¶fï¿½Ø±ï¿½(P.RRRlï¿½\0\"ï¿½}\\ï¿½xï¿½m	Dï¿½Ò¦M3~ï¿½xz(sï¿½Ì±	\0Dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½H ï¿½Vï¿½ZÙ‚9ï¿½ï¿½ï¿½ß¿ï¿½1._ï¿½Ü¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½zï¿½Ù½{7o(@$ï¿½W#ï¿½ï¿½^#ï¿½ï¿½%==ï¿½Lï¿½2ï¿½ï¿½ï¿½KÄš5kLvvï¿½9ï¿½<ï¿½ï¿½ï¿½O?5ï¿½Vï¿½2ï¿½vï¿½ï¿½ï¿½Dï¿½ï¿½ï¿½Hï¿½ï¿½H ï¿½ï¿½-[ï¿½ï¿½Sï¿½Ò£ï¿½`ï¿½ï¿½@\"*V&ï¿½ï¿½@$bï¿½ï¿½8ï¿½ï¿½ï¿½`\"ï¿½HXï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Qj0ï¿½ï¿½!\0ï¿½4ï¿½ï¿½Hï¿½<ï¿½ï¿½ã¶¶Dï¿½ï¿½4oï¿½ï¿½Ìœ9ï¿½ï¿½ï¿½ï¿½Dï¿½\Zï¿½ï¿½8ï¿½8N=\"ï¿½HXï¿½5kffÍšEï¿½ï¿½ï¿½8ï¿½ï¿½aï¿½ï¿½ï¿½)fÛ²ï¿½ï¿½é¶Ž!ï¿½ ,ï¿½ï¿½ï¿½[\"ï¿½HXï¿½6mjfÏžMï¿½ï¿½\"q2ï¿½Ùºï¿½ï¿½ï¿½ï¿½Zï¿½BMï¿½ï¿½ï¿½H\0\"Qï¿½\"ï¿½mï¿½I$	Kï¿½&Mï¿½Ü¹sï¿½Qï¿½\\$>ï¿½ï¿½ï¿½enï¿½ï¿½G	@$*ï¿½ÚµkM\"A$ï¿½\Z7nlï¿½ÏŸOï¿½ï¿½\"ï¿½ï¿½Ê§K	=ï¿½< ï¿½HTuï¿½Ö½\'ï¿½	Dï¿½ï¿½ï¿½ï¿½Tï¿½Gï¿½ï¿½Hl}ï¿½oï¿½\"ï¿½ÇDï¿½ï¿½ <ï¿½ï¿½ï¿½pï¿½H 4jï¿½ï¿½,Yï¿½ï¿½ï¿½@$\0ï¿½ï¿½+[ï¿½ï¿½8ï¿½@$\nhØ°ï¿½]:ï¿½[$4Kï¿½$ï¿½ï¿½cï¿½\"ï¿½Dï¿½ï¿½@ï¿½qï¿½	Dï¿½\0ï¿½Ú¸rï¿½Jzï¿½8ï¿½Ý™%ï¿½ï¿½C	@$*ï¿½ï¿½ï¿½ï¿½ï¿½nï¿½ï¿½H 4hï¿½ï¿½ndï¿½-ï¿½n1[ï¿½ï¿½ï¿½|Xï¿½=ï¿½ÇDï¿½\nï¿½ï¿½n{ï¿½H $\'\'ï¿½ï¿½ï¿½Lzï¿½8	ï¿½}ï¿½^&:ï¿½8 ï¿½HTï¿½Hï¿½qï¿½2\"ï¿½Hï¿½ï¿½ï¿½dÖ­[Gï¿½ï¿½\"qï¿½ï¿½ï¿½Ö˜Ë‡5ï¿½czy@$\0ï¿½ï¿½ï¿½yï¿½ï¿½ï¿½ï¿½\"QH$6lï¿½@ï¿½ï¿½\"ï¿½ï¿½+weï¿½*ï¿½FBï¿½ï¿½ï¿½%\"ï¿½De$ï¿½ï¿½6ï¿½H Ô¯_ï¿½lÜ¸ï¿½%Eï¿½ï¿½9sxï¿½\nï¿½ï¿½ï¿½ï¿½%JDï¿½ï¿½9z.ï¿½	Dï¿½ï¿½ï¿½ï¿½Bï¿½ï¿½Dï¿½($[ï¿½lï¿½Gï¿½3ï¿½ï¿½Rï¿½ï¿½\"ï¿½D%e$Nï¿½Dï¿½( 11ï¿½lß¾ï¿½%ï¿½Dï¿½,Yï¿½Ò²ï¿½\"ï¿½D|ï¿½ï¿½ï¿½Hï¿½ï¿½P ï¿½Dbï¿½Îï¿½(q&ï¿½JDï¿½!ï¿½ Qï¿½Yï¿½r%\"/))é‡„ï¿½( \nï¿½={ï¿½Ð£ï¿½cï¿½\rï¿½ï¿½rqï¿½ï¿½W#eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½=W$ï¿½5ï¿½\\3ï¿½ï¿½ ï¿½D\"++ï¿½ï¿½@$ï¿½Wï¿½}ï¿½ï¿½ï¿½ï¿½ï¿½&!!a}JJÊï¿½Ü”.nï¿½ï¿½Wï¿½ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½ï¿½*ï¿½\"ï¿½ï¿½ï¿½_ï¿½ï¿½Ñºnï¿½sï¿½ï¿½7ï¿½ï¿½ï¿½oï¿½Sï¿½D\\ï¿½8ï¿½U$ï¿½9Bï¿½ï¿½H ï¿½ï¿½\Z	ï¿½ï¿½]BBï¿½nï¿½åº·_{ï¿½ï¿½Goï¿½ï¿½sEY?Þ“P!ï¿½ï¿½Ñ£ï¿½(ï¿½\"ï¿½ï¿½0ï¿½ï¿½ï¿½ï¿½ï¿½+ï¿½ï¿½vï¿½qï¿½Yï¿½ï¿½ï¿½ï¿½Rï¿½Ifï¿½ï¿½\"ï¿½ï¿½ï¿½Cï¿½ï¿½H ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½2qÄ•ï¿½ï¿½n9ï¿½ï¿½kï¿½ï¿½Re\"ï¿½Ì„ï¿½Eï¿½=Yï¿½É“\'ï¿½Q|$Çï¿½u1ï¿½ ï¿½Oï¿½tï¿½ï¿½&ï¿½H|ï¿½~=ï¿½JÅ³ï¿½ZHDï¿½ß—Kfï¿½ï¿½\"ï¿½ï¿½ï¿½/ï¿½wï¿½6ï¿½ÓŸï¿½Sï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½zKï¿½.\rwÄ¶}ï¿½_4ï¿½ï¿½ï¿½ï¿½ï¿½È‘#czï¿½ï¿½ï¿½×™2e\n\"5B$\"ï¿½ï¿½ï¿½ï¿½Nï¿½ï¿½l(\Zï¿½DP3ï¿½Hï¿½ï¿½ï¿½\\zï¿½ï¿½ï¿½ï¿½Ó§ï¿½ï¿½~ï¿½3sï¿½ï¿½ï¿½eï¿½ï¿½ï¿½ï¿½gnï¿½ï¿½ï¿½|ï¿½ï¿½Û·/ï¿½ï¿½\\ï¿½dï¿½ï¿½yï¿½3dï¿½Ó¿sï¿½wï¿½c~ï¿½aÔ¯ï¿½cï¿½Ó³gOï¿½ï¿½\"5I$ï¿½H\"$ï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½Ë„2d`ï¿½>ï¿½ï¿½	ï¿½ï¿½ï¿½Rï¿½ï¿½aÃ†!	eï¿½~jÐ Aï¿½ï¿½W^yï¿½^ï¿½wï¿½ï¿½e/^l~ï¿½ï¿½ï¿½W_}ï¿½>Ö®];{ï¿½ï¿½Ù³ï¿½ï¿½ï¿½ï¿½vï¿½o~ï¿½ï¿½n0)))ï¿½Ü¹s\"ï¿½ï¿½Oï¿½fzzï¿½=ï¿½fï¿½\Z{ï¿½Sï¿½NVXnï¿½ï¿½VÓ¡Csï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½×¿6+Vï¿½ï¿½?ï¿½<YD*S$ï¿½ï¿½`08Bï¿½ï¿½ï¿½Mï¿½ï¿½Bï¿½ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½Lï¿½ï¿½<2~ï¿½HlÝºï¿½4jï¿½ï¿½4lï¿½ï¿½lÞ¼ï¿½ï¿½Å£\"1`ï¿½\0ï¿½iï¿½ï¿½ï¿½,ï¿½ï¿½Ù³gï¿½ï¿½gÎœiï¿½k{yÝ—H(Kï¿½ï¿½\'N4ï¿½zï¿½2?ï¿½ï¿½ï¿½ï¿½ï¿½Õ«Dï¿½\'?ï¿½ï¿½ï¿½]ï¿½ï¿½ï¿½\rï¿½ï¿½uï¿½]V4Ö®]kï¿½ï¿½ï¿½cÒ¤Iï¿½Gï¿½ï¿½vffï¿½ï¿½ï¿½Eï¿½[ï¿½nm^{ï¿½5ï¿½6 DÂ¢Lbï¿½ Ó•ï¿½OTï¿½Y]\nIï¿½ÖŠA(ï¿½Î˜9dYï¿½LDJDï¿½ï¿½ï¿½ï¿½aï¿½\'ï¿½ï¿½F>ï¿½ï¿½ï¿½Pï¿½ï¿½ï¿½ï¿½DBCz?Í›7ï¿½ï¿½Ø¹ï¿½-Å‹ï¿½ï¿½ï¿½?ï¿½\"ï¿½`ï¿½{ï¿½ï¿½ï¿½7ï¿½ï¿½_Ì˜1cï¿½PIï¿½Hï¿½yï¿½ï¿½ï¿½2ï¿½Nï¿½ï¿½ï¿½Ø±ï¿½=ï¿½ï¿½FXï¿½Ó°Gï¿½Zï¿½LZZï¿½ï¿½Þ½ï¿½=.ï¿½E$ ï¿½D\"B(nï¿½TQMï¿½ï¿½ï¿½P(ï¿½ï¿½j	ÉŒï¿½ï¿½sï¿½.sÏ³ï¿½ï¿½QQï¿½$Dï¿½Ä•ï¿½ï¿½>ï¿½0ï¿½tï¿½\Zï¿½M]oÜ¸ï¿½^ï¿½C\"ï¿½ï¿½K/ï¿½ï¿½sï¿½ï¿½Ç”iï¿½ï¿½lï¿½aï¿½ï¿½:uï¿½}ï¿½nÝº\"ï¿½ï¿½ï¿½ï¿½×©Sï¿½|ï¿½k_ï¿½ï¿½Gï¿½\ZUhhï¿½Ô©Sï¿½ï¿½{ï¿½ï¿½322ï¿½ï¿½hEï¿½ï¿½ï¿½jÙ²ï¿½mï¿½>=ï¿½ï¿½ï¿½;4ï¿½qï¿½}ï¿½ï¿½cï¿½Ä£Hï¿½ï¿½\"VZï¿½Jï¿½Ziq+-rUï¿½\"ï¿½ï¿½iï¿½-_(&>ï¿½ï¿½ï¿½ï¿½ï¿½XXYï¿½,\\SFï¿½`6ï¿½_E\"ï¿½ï¿½Pgï¿½Oï¿½ï¿½@\\ï¿½xï¿½ï¿½ï¿½\"ï¿½ï¿½2\Zzp?Aï¿½zZ*ï¿½pï¿½ï¿½	;Ì ï¿½ï¿½:!ï¿½Iï¿½|ï¿½ï¿½\"Ñ¥Ksï¿½M7ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½-ï¿½2ï¿½ï¿½ï¿½.ï¿½ï¿½ï¿½Pï¿½Bï¿½ï¿½Oï¿½^ /ï¿½?ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½e@ï¿½C&EEï¿½ï¿½Þ³ï¿½ï¿½ï¿½+Wï¿½xï¿½ï¿½ï¿½$aï¿½Ì¶{ï¿½ï¿½ï¿½\\ï¿½oï¿½ï¿½Y\"aJh\Zï¿½ï¿½ï¿½ï¿½ï¿½dï¿½|QT&ï¿½ï¿½ï¿½ï¿½Hï¿½Ñ…ï¿½qï¿½ï¿½6;ï¿½*zï¿½oï¿½ÏŠPï¿½ï¿½4Uï¿½ï¿½ï¿½yï¿½7ï¿½cZKï¿½ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½_ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½:ï¿½éŸ‘Å–ï¿½ï¿½ï¿½czï¿½ï¿½nï¿½q+/ï¿½^M=ï¿½ï¿½gzï¿½ï¿½.5ï¿½ï¿½ï¿½o,89ï¿½ï¿½,ï¿½	ï¿½ï¿½\"Fï¿½ï¿½\"ï¿½>2Kï¿½Jï¿½2ï¿½Ü¯ï¿½ï¿½ï¿½ï¿½Û§ï¿½ï¿½\'ï¿½6?uï¿½!ï¿½eï¿½ï¿½?tï¿½nwï¿½ï¿½Iï¿½n[ï¿½!ï¿½@ ï¿½ï¿½ï¿½:ï¿½m/ï¿½Ï™ï¿½ï¿½-Ü¯Oï¿½\"ï¿½vï¿½ï¿½Þ§ï¿½_ï¿½Kï¿½ï¿½\rï¿½ï¿½D4ï¿½0ï¿½ï¿½E\"ï¿½ï¿½Ñ£ï¿½\'ï¿½ï¿½ï¿½ï¿½Dï¿½ï¿½Dï¿½ï¿½ï¿½ï¿½c(ï¿½:Tï¿½v\"ï¿½;vï¿½ï¿½Aï¿½?Oï¿½Sï¿½ï¿½cA*ï¿½HDï¿½Pï¿½\\ï¿½vï¿½)SQï¿½nÝŸï¿½ï¿½ßºï¿½ï¿½ï¿½P(ï¿½ï¿½Û·ï¿½w[3ï¿½\"ï¿½Nï¿½Iï¿½fï¿½ï¿½ï¿½0._^vï¿½Î—DH&ï¿½ï¿½oï¿½ï¿½ï¿½vï¿½I6ï¿½ï¿½ï¿½ï¿½J\"aï¿½&ï¿½ï¿½ï¿½mQï¿½	ï¿½ï¿½ï¿½8ï¿½<\Zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½L$Äž={Lï¿½&Mï¿½ï¿½ï¿½uï¿½ï¿½}ï¿½\\$hï¿½Tï¿½HTQï¿½DIï¿½+mï¿½ï¿½(ï¿½0CEg$ï¿½ï¿½ï¿½Sï¿½3nï¿½8ï¿½ï¿½ï¿½ï¿½d\'	Dï¿½ï¿½G34ï¿½\nï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½ï¿½Ð²ï¿½k$zRpï¿½HBï¿½ 6kï¿½ï¿½$\'\'ï¿½=@$	@$ï¿½U$~ï¿½/*ï¿½|ï¿½mwï¿½ï¿½Ûªrï¿½ï¿½S!ï¿½3aï¿½ï¿½ï¿½ï¿½Û·ï¿½-ï¿½Dï¿½\0Dï¿½ï¿½[ï¿½ï¿½=ï¿½%ï¿½bTï¿½Í¦ï¿½ï¿½u$ï¿½ï¿½ï¿½ï¿½H\\Uï¿½7oï¿½Ü®ï¿½ï¿½ï¿½\0ï¿½@$\0ï¿½ï¿½+zï¿½1ï¿½È•-ï¿½rG$Ê„ï¿½ï¿½);ï¿½å“µï¿½! ï¿½ qCeï¿½D Ñ¡uï¿½ä±²Z,	Dï¿½ï¿½ï¿½LDï¿½Ä¸/ï¿½mï¿½ï¿½ï¿½ï¿½^\"Q~ï¿½ï¿½r(ï¿½ï¿½/ï¿½ï¿½@$	@$ï¿½*3Qï¿½ï¿½$ï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½Uï¿½ï¿½OË–-ï¿½ï¿½B$	@$ï¿½33ï¿½ï¿½ ÃŒ3lvï¿½[ï¿½nv	f@$	@$ï¿½fï¿½@$ï¿½ï¿½#Gï¿½ï¿½Ö­[ï¿½ï¿½ï¿½Dï¿½ï¿½ ï¿½ qï¿½ï¿½(ï¿½0Gï¿½ï¿½ï¿½Dï¿½ï¿½mï¿½ï¿½ï¿½ï¿½Nï¿½Çï¿½C$	@$ï¿½;3ï¿½ï¿½@\"ï¿½ï¿½#;;Û´iï¿½ï¿½f\'ï¿½ï¿½# ï¿½ q)Å­?ï¿½Dï¿½1{ï¿½lï¿½ï¿½ï¿½Ø±ï¿½Ý‰	Dï¿½\Z/=ï¿½ï¿½\0Dï¿½rÑ¶ï¿½mÛ¶ï¿½Ù‰ï¿½ï¿½ï¿½Ó£!ï¿½ 5ï¿½fB2ï¿½ï¿½ï¿½ï¿½Hï¿½4ï¿½Îkeï¿½Cï¿½ï¿½Ø±cï¿½lÅ°|ï¿½r.ï¿½ï¿½ Õžï¿½pï¿½ ï¿½Dï¿½D!ï¿½ï¿½PH,ï¿½0kÖ¬ï¿½ï¿½%@ï¿½4ï¿½$ï¿½ï¿½ Ñ¡]Fï¿½Õ«wï¿½@$j,\Zï¿½Lhï¿½CCï¿½/ï¿½ï¿½ï¿½cVï¿½Ze>ï¿½ï¿½Dï¿½ï¿½$b×®]ï¿½ï¿½\0ï¿½ï¿½^$ï¿½ï¿½Ô©ï¿½m\"ï¿½Hï¿½hT|ï¿½\"Lcï¿½(ï¿½O&Vï¿½XaSï¿½5ï¿½iã¶šï¿½ï¿½ï¿½!ï¿½Hï¿½K$rÇ¹ï¿½H qï¿½ï¿½ï¿½*;ï¿½ï¿½Jï¿½Cï¿½Fï¿½ï¿½ï¿½ï¿½@$<-ï¿½ï¿½Õ«ï¿½k\"ï¿½Hï¿½\rZï¿½ï¿½Kï¿½.6;ï¿½ï¿½ï¿½ï¿½%ï¿½	@$</ï¿½ï¿½ï¿½Dï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½Zj[cï¿½Pï¿½Pï¿½,\"ï¿½ï¿½ï¿½Eï¿½ï¿½ï¿½ï¿½oDï¿½ï¿½ï¿½Oï¿½ï¿½ï¿½KÙ‰iÓ¦ï¿½\Zï¿½O5\0ï¿½ï¿½ï¿½Eï¿½ï¿½8ï¿½ï¿½\"ï¿½h[rmOï¿½mÊµ]9ï¿½ï¿½ï¿½ßH\0\"ï¿½}ï¿½8ï¿½ï¿½\rï¿½\"ï¿½ï¿½>}ï¿½ï¿½ï¿½ï¿½ï¿½f\'ï¿½Nï¿½J@j\0ï¿½Uï¿½ï¿½\0\"ï¿½iï¿½8î¶–Dï¿½ï¿½Z[!))É¤ï¿½ï¿½ï¿½ï¿½jdÇŽï¿½ï¿½\0ï¿½ï¿½Hs[G\"ï¿½Hx.;Ñ«W/ï¿½Vï¿½2e\nï¿½&ï¿½lÙ‚H\0\"ï¿½qï¿½ï¿½ï¿½B}ï¿½\"ï¿½Iï¿½|ï¿½Mï¿½ï¿½hÞ¼ï¿½ï¿½ï¿½ï¿½\" UÌ†\rlï¿½	Og$ï¿½ï¿½)\"ï¿½Hxï¿½ï¿½gÏšï¿½}ï¿½ï¿½ï¿½Ä„	Hï¿½nï¿½:D	ï¿½Dï¿½ï¿½8ï¿½	Dï¿½ï¿½dffï¿½ï¿½ï¿½dÓ¬Y3ï¿½oï¿½>RE!ï¿½\0ï¿½ï¿½H|ï¿½~Pï¿½@$	_ï¿½%ï¿½ï¿½ï¿½ï¿½oï¿½cÆŒ! ï¿½ï¿½ï¿½ï¿½HII!ï¿½Hx[$>pï¿½T\"ï¿½Hï¿½.ï¿½Þ AÓ¤I;E*ï¿½ï¿½Kï¿½ï¿½ï¿½\r@$ï¿½-ï¿½Ç™E$	_f\'hï¿½ï¿½Gï¿½& ï¿½ï¿½ï¿½Ljj*ï¿½\0Dï¿½Ã¸ï¿½Ûï¿½J$	ß¢ï¿½Jï¿½7nï¿½ï¿½ï¿½Ü¹ï¿½ï¿½T sï¿½ÎµY\0Dï¿½ï¿½ï¿½Lï¿½-%ï¿½ï¿½ï¿½ï¿½xï¿½yï¿½ï¿½\'mvbÔ¨Q&77ï¿½ï¿½T\0ï¿½gï¿½F$\0ï¿½ï¿½~Fbï¿½ï¿½wï¿½A$	pÙ¸qï¿½ï¿½N(ï¿½}ï¿½vRNfÎœiï¿½ï¿½\0@$<-ï¿½ï¿½	Dï¿½Q6bÈ!6;1|ï¿½pï¿½ï¿½ï¿½ï¿½^0-Zï¿½ ï¿½Hx{hcï¿½ï¿½ï¿½%ï¿½aï¿½ï¿½ï¿½vï¿½Aï¿½Fï¿½ï¿½Ö­[	Hhyï¿½ï¿½ï¿½tï¿½ï¿½ï¿½	ï¿½B/:ï¿½ï¿½>ï¿½@$ï¿½ï¿½ï¿½Ä°aï¿½lvB_ï¿½NDï¿½VmÝº5ï¿½\0Dï¿½ï¿½ï¿½ï¿½Ý¶ï¿½H P\nï¿½H(3ï¿½ï¿½2P6ÆŽkÚµkG \0ï¿½ï¿½vFbï¿½ï¿½8{ï¿½\"eï¿½Nï¿½fBï¿½	ï¿½Pï¿½ï¿½ï¿½2ï¿½Cï¿½	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½1ï¿½@$ï¿½ï¿½h6ï¿½fuhvï¿½fy@ÉŒ1ï¿½tï¿½Ô‰@\0\"ï¿½ï¿½An;L$	ï¿½2;ï¿½ï¿½&ï¿½ï¿½ï¿½ï¿½Zï¿½.Gu%]ï¿½v%ï¿½Hx[$zï¿½ï¿½S\"ï¿½H@h%Lï¿½ï¿½ï¿½ï¿½VÈ„ï¿½<ï¿½ï¿½ï¿½Ñƒ@\0\"ï¿½aï¿½@;ï¿½Cï¿½gDï¿½ï¿½rï¿½ï¿½:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Å Aï¿½Lï¿½^ï¿½ Þ®ï¿½hï¿½Dï¿½ï¿½rï¿½]Dï¿½ï¿½vï¿½ï¿½`Ì€Lß¾}	 ï¿½ï¿½Hrï¿½4ï¿½@$ï¿½ï¿½7nï¿½ï¿½Nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½	Iï¿½d\0ï¿½ï¿½.ï¿½Pï¿½ï¿½+gï¿½\"È¾}ï¿½Lï¿½fï¿½Lrrï¿½ï¿½ï¿½ï¿½ï¿½mzï¿½ï¿½mï¿½7\0	ï¿½ï¿½8ï¿½Cï¿½Hï¿½\'ï¿½TZï¿½Qï¿½	}2?{ï¿½ï¿½ï¿½ï¿½~Zï¿½ï¿½\0ï¿½ï¿½.ï¿½ï¿½×¿Ï•ï¿½ï¿½Dï¿½ï¿½J\"++ï¿½î€™ï¿½ï¿½dVï¿½^ï¿½]S?5\0ï¿½ï¿½.uï¿½Ö½ï¿½ï¿½ï¿½ï¿½K$	ï¿½dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½pï¿½ï¿½i_ï¿½ï¿½;v4ï¿½>ï¿½,ï¿½|@$<ï¿½ï¿½!ï¿½			yDï¿½ï¿½*ï¿½ï¿½ï¿½&--ï¿½f\'Vï¿½\\ï¿½ï¿½ï¿½Wï¿½ckï¿½l\0Dï¿½ï¿½\"ï¿½MW$ï¿½\"Uï¿½Ô©SM(2={ï¿½ï¿½tvBvï¿½3ï¿½8 ï¿½ï¿½ï¿½ï¿½@$ï¿½\Z8tï¿½iÙ²ï¿½ï¿½_ï¿½ï¿½Yï¿½lï¿½\'ï¿½ï¿½Vï¿½Zï¿½Iï¿½&ï¿½ï¿½Dï¿½ï¿½H$ï¿½ï¿½ï¿½{\rï¿½@$ï¿½\Zï¿½1cï¿½ï¿½Ntï¿½ï¿½Íœ<yï¿½S[zzï¿½ï¿½\r@$ï¿½/ï¿½ï¿½Õ»ï¿½H PM9rÄ´nï¿½ï¿½$&&ï¿½%Kï¿½xï¿½ï¿½R=ï¿½ï¿½ï¿½ï¿½ï¿½\"ï¿½qï¿½ï¿½KMMï¿½>ï¿½@$ï¿½ï¿½yé¥—lvï¿½sï¿½ï¿½ï¿½ï¿½ï¿½ï¿½qï¿½ï¿½hÚ«ï¿½&\0Dï¿½ï¿½ï¿½\\ï¿½ï¿½ï¿½ï¿½Dï¿½ï¿½\Z@vvï¿½iÓ¦ï¿½ï¿½N,\\ï¿½0ï¿½ï¿½ï¿½=2{ï¿½lï¿½ï¿½ï¿½Hx_$.ï¿½ï¿½Dï¿½ï¿½\Zï¿½.ï¿½ï¿½Nh-ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½yï¿½ï¿½g\"ï¿½qï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ODï¿½ï¿½\Zï¿½Ñ£GMÛ¶mmvbï¿½ï¿½ï¿½qï¿½ï¿½ï¿½ï¿½ï¿½ï¿½}V	(Sï¿½ï¿½9ï¿½ï¿½ï¿½cDï¿½ï¿½\Zï¿½Ü¹sï¿½Lhï¿½ï¿½cÇŽï¿½ï¿½ï¿½Ý°aCï¿½tï¿½Rï¿½ï¿½ï¿½Hxhï¿½ï¿½BDï¿½ï¿½\Zï¿½B\"!ï¿½ï¿½Xï¿½)))ï¿½Xï¿½	D\"ï¿½ï¿½8ï¿½ï¿½\"qï¿½ï¿½8$\Zï¿½ï¿½ï¿½GMAï¿½ï¿½ï¿½Ø±ï¿½P=Gï¿½\rÌš5kï¿½ï¿½\"ï¿½ï¿½ï¿½ï¿½W&Z	Dï¿½]ï¿½Uï¿½ï¿½bÌš2+Bï¿½ï¿½ï¿½)ï¿½iï¿½2Éï¿½:ï¿½ï¿½a >+ï¿½<\Zï¿½	Dï¿½2ï¿½ï¿½é¢š6Zï¿½ï¿½Ù³ï¿½Dï¿½ï¿½ï¿½Ã‡ï¿½ODÂ›ï¿½#ï¿½ï¿½Dï¿½ï¿½8DWuï¿½ï¿½ï¿½f\'ï¿½{ï¿½\'-ï¿½Uï¿½Dï¿½ï¿½#ï¿½ï¿½gk$>veb(ï¿½@$ ï¿½ï¿½ï¿½ï¿½ï¿½Nhï¿½m-ï¿½]Ó²d#\0ï¿½ï¿½Hï¿½sEb4ï¿½@$ ï¿½Ñ¦_ï¿½ï¿½Kï¿½ï¿½ï¿½Mï¿½V-ï¿½ï¿½ï¿½\'ï¿½ï¿½ï¿½j$vï¿½IDï¿½\0ï¿½ï¿½mÉµ=ï¿½ï¿½)ï¿½vï¿½Uï¿½ï¿½ï¿½ï¿½/ï¿½qï¿½ï¿½ï¿½ODï¿½ï¿½5ï¿½ï¿½s}ï¿½@$ï¿½C(Ð³gOï¿½\rï¿½:ujï¿½ï¿½lmï¿½ï¿½ï¿½ï¿½ï¿½dsï¿½ï¿½yï¿½!ï¿½Hx;#ï¿½1ï¿½!ï¿½xï¿½Uï¿½Vï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½g._ï¿½ï¿½@$fÌ˜ï¿½?	ï¿½g$Ö¹2ï¿½\Zï¿½@$ï¿½ï¿½Ù‰^ï¿½zï¿½ï¿½ï¿½Lï¿½R%?ï¿½Yï¿½fV$ï¿½iIo\0D\"ï¿½bï¿½5n[N$	ï¿½8oï¿½ï¿½ï¿½ï¿½Nhï¿½A+QV&ï¿½Wï¿½6uï¿½ï¿½aX	ï¿½ï¿½2ï¿½ï¿½@$ï¿½ï¿½={ï¿½ï¿½ï¿½ï¿½ï¿½f\'&Lï¿½Pi?ï¿½é§Ÿï¿½rï¿½Þ½	: \',pï¿½ï¿½ï¿½ï¿½\">\"33ï¿½Bjbß¾}.W]ï¿½ï¿½Û»ï¿½+ï¿½;ï¿½ï¿½Yï¿½0ï¿½6ï¿½4ï¿½MLï¿½ï¿½4fï¿½Æ˜Mï¿½ï¿½ï¿½dï¿½iï¿½6Í¦uï¿½Mï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½/`Qï¿½ï¿½ #Vtï¿½ï¿½nIï¿½bï¿½%ï¿½[eï¿½.ï¿½Å…Ô¡D	ï¿½uï¿½Uï¿½Zï¿½ï¿½pï¿½97ï¿½ï¿½ï¿½ï¿½Ì½w`ï¿½ï¿½ï¿½ï¿½$Ol}aï¿½ï¿½ï¿½;_ï¿½sï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½ï¿½+ï¿½ï¿½ï¿½#ï¿½.ï¿½vï¿½ï¿½ï¿½ 1qï¿½aï¿½Â…ï¿½ï¿½ï¿½?ï¿½ï¿½ï¿½Fï¿½@<ï¿½{ï¿½b!ï¿½ï¿½ï¿½Ïï¿½ï¿½Pï¿½$jï¿½ï¿½ï¿½7uvwwWNï¿½ï¿½ï¿½ï¿½ØŸ!ï¿½2w$Vï¿½×¯LBHï¿½ï¿½Ý‰Eï¿½Uï¿½N,[ï¿½lï¿½\"bï¿½_ï¿½w(@Hï¿½\\H<ï¿½ï¿½6	!aï¿½Îï¿½ï¿½ï¿½#tuuï¿½}ï¿½ï¿½\rKDï¿½Ìï¿½hMï¿½ryIï¿½eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½xï¿½ï¿½ï¿½Ý‰G}4ï¿½ï¿½ï¿½7ï¿½1qï¿½Wï¿½3ï¿½ï¿½h!yD,(ï¿½ï¿½LBHï¿½Yz{{+w\':;;Ãž={\Zï¿½ï¿½ï¿½.Æ„;ï¿½ï¿½YÚ˜ï¿½_ï¿½MBHï¿½GÄ»Kï¿½,ï¿½Üï¿½ï¿½ï¿½;ï¿½ï¿½J{&-uGï¿½<$~gBï¿½ï¿½ï¿½ï¿½Eï¿½4iRï¿½<yrï¿½;wï¿½Yï¿½\"î©¸ï¿½È¹ï¿½>{&-]yH5	!\rï¿½_ï¿½ï¿½Wï¿½7ï¿½ï¿½ï¿½ï¿½ï¿½5ï¿½\\Sï¿½ï¿½ï¿½<_Lï¿½ï¿½ï¿½sg!ï¿½ï¿½Jï¿½<$ï¿½7	!CZï¿½ï¿½ï¿½(ï¿½a8ï¿½ï¿½{Þ˜ï¿½ï¿½ï¿½ï¿½kÊ”)ï¿½uÝ™@H4ï¿½Bï¿½pcï¿½ï¿½ï¿½ï¿½ï¿½Fï¿½ï¿½ï¿½çŠ„ê˜¸ï¿½_`ï¿½!ï¿½ï¿½!ï¿½ï¿½<$Nï¿½ï¿½ï¿½ï¿½ï¿½\"ï¿½b1#JDTOs $ï¿½O[[ï¿½gï¿½8eBjï¿½ï¿½ï¿½Ä•W^9ï¿½ï¿½L $ï¿½*$ï¿½+ï¿½Jï¿½&!$ï¿½ï¿½ï¿½ï¿½PLï¿½ï¿½9Í©X,ï¿½E~ï¿½6	!Ú¿ï¿½ï¿½ï¿½ë®«éŸ‹ï¿½ï¿½ï¿½Dï¿½ï¿½ï¿½|-ï¿½ï¿½ï¿½/Wï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½<$ï¿½MHï¿½ï¿½ï¿½Huï¿½aï¿½ï¿½HÌ™3Ç¿ï¿½Dsï¿½BH	hhycï¿½ï¿½Hï¿½ï¿½Ã²Bï¿½ï¿½7ï¿½cï¿½3	!5ï¿½ï¿½p>ï¿½ï¿½p*ï¿½Dï¿½Dï¿½Tï¿½ï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½s$Vï¿½Zï¿½i\rï¿½Dsï¿½ï¿½ï¿½,ï¿½ï¿½ï¿½$ï¿½\\pï¿½aï¿½ï¿½ï¿½<ï¿½rÖ¬Yï¿½ï¿½ï¿½hÞï¿½/ï¿½ï¿½cBjZï¿½ï¿½wmï¿½ï¿½DÓ‡D_ï¿½Tï¿½ï¿½I	ï¿½ê˜ˆwï¿½ï¿½ï¿½ï¿½ï¿½ï¿½yï¿½Ö‘GÄ‰qï¿½ï¿½}ï¿½$ï¿½ï¿½ï¿½D#{\ZDBï¿½ï¿½ï¿½HÏ¯ï¿½&!$ï¿½ï¿½Ç€ï¿½}\"$Z2$ï¿½ï¿½_ï¿½&!$ï¿½ï¿½Fï¿½ï¿½@Hï¿½ï¿½ï¿½ï¿½{ï¿½Baï¿½I	ï¿½ï¿½ï¿½ï¿½Pï¿½9ï¿½#ï¿½6V\"$Zï¿½ï¿½Ä»yLï¿½2	!ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½hÙx+ï¿½æ›„ï¿½ï¿½aï¿½ï¿½sï¿½?Bï¿½ï¿½Bï¿½Rï¿½ï¿½ï¿½$ï¿½KLDï¿½Pï¿½=@H4}Hï¿½Cbï¿½I	hï¿½Â…Cï¿½eï¿½ï¿½ï¿½ï¿½ï¿½x\"$ï¿½	ï¿½Wï¿½ï¿½ï¿½ï¿½&!$ï¿½aÇŽg^),\"ï¿½ï¿½#boï¿½Tzï¿½$ï¿½4ï¿½wÞ©ï¿½ï¿½ï¿½ï¿½ï¿½\r!ï¿½NHï¿½Î¿ï¿½hB\Zï¿½ï¿½kï¿½ï¿½ï¿½	B\"!ï¿½ï¿½ï¿½ï¿½Bï¿½ï¿½ï¿½$ï¿½4ï¿½W^	ï¿½rï¿½ iï¿½Ø–eï¿½s&!$ï¿½a/ï¿½ï¿½Rhkk3ï¿½DZ!ï¿½%ï¿½ï¿½ï¿½$ï¿½4lï¿½Îï¿½ï¿½ï¿½ï¿½ iï¿½ï¿½ï¿½ï¿½ï¿½ï¿½&!$ï¿½a/ï¿½ï¿½Bï¿½0aï¿½A $ï¿½Gï¿½}&!$ï¿½aï¿½7oï¿½ï¿½Hï¿½ï¿½ï¿½&!$ï¿½a?ï¿½ï¿½Oï¿½ï¿½É“\r!ï¿½VHï¿½ï¿½gIï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½ï¿½ï¿½ï¿½ï¿½HH+Jï¿½Ò¯MBH@ï¿½Ö®]ï¿½Nï¿½jï¿½ï¿½ï¿½ï¿½pï¿½X<`B\Zï¿½ï¿½ï¿½Oï¿½ï¿½Ó§B\"ï¿½ï¿½Xï¿½\0jB\Zï¿½rï¿½ï¿½pë­·\ZB\"ï¿½=ï¿½ï¿½ï¿½-ï¿½Ð°ï¿½Ë—ï¿½ï¿½3g\ZB\"ï¿½ï¿½ï¿½=ï¿½ï¿½5	!\r{ï¿½Gï¿½wï¿½aï¿½ï¿½ï¿½6ï¿½ï¿½!ï¿½I	hØƒ>ï¿½ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½yHï¿½ï¿½$ï¿½4ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3ï¿½DZKcï¿½ï¿½I	hï¿½Â…Ã‚!ï¿½ï¿½qï¿½ï¿½}ï¿½T*ï¿½0	!\rï¿½?~ï¿½ï¿½ï¿½ï¿½H|ï¿½X,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Í;7,Yï¿½ï¿½ i-m\\ï¿½_ï¿½LBH@ï¿½ï¿½?ï¿½ï¿½A $ï¿½ï¿½ï¿½ï¿½WYï¿½ï¿½6	!\rï¿½ï¿½ï¿½Â²eï¿½!ï¿½ï¿½ï¿½ï¿½Uï¿½bQH	h\\<ï¿½ï¿½\'ï¿½0ï¿½DBï¿½Lï¿½ï¿½<$ï¿½NH@ï¿½nï¿½é¦°jï¿½*ï¿½@Hï¿½ï¿½O\"ï¿½ï¿½\nï¿½ÐiÓ¦ï¿½5kï¿½B\"ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$ï¿½4ï¿½ï¿½ï¿½;ï¿½_ï¿½ï¿½ ï¿½ï¿½ï¿½-\'Lï¿½ï¿½ï¿½&!$ï¿½!ï¿½ï¿½ï¿½ï¿½ï¿½gï¿½5ï¿½Dz.ï¿½ÇŒsï¿½I	hÈ¤Iï¿½ï¿½Oï¿½Sï¿½@Hï¿½ï¿½ï¿½qï¿½ï¿½ï¿½ï¿½3&!$ï¿½!&L[ï¿½n5ï¿½Dz!qï¿½P(|ï¿½$ï¿½4ï¿½ï¿½ï¿½=ï¿½ï¿½ï¿½B\"ï¿½ï¿½ï¿½ ï¿½MBH@Cï¿½ï¿½ï¿½ï¿½ï¿½Ý»\r!ï¿½ï¿½fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$ï¿½4ï¿½ï¿½ï¿½3ï¿½Dzw$ï¿½ï¿½ï¿½dï¿½ÐRï¿½<hï¿½ï¿½Bï¿½wYï¿½ï¿½bB\Zï¿½9|ï¿½ï¿½A $ï¿½ï¿½ï¿½ï¿½5ï¿½$ï¿½4Gï¿½5ï¿½Dz!ï¿½ï¿½,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½yH<`Bï¿½vï¿½Ä‰JHï¿½ï¿½H2$ï¿½ï¿½×£&!$ï¿½nGï¿½ï¿½tCï¿½Wï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½Ð¡CB!ï¿½ï¿½,ï¿½^.ï¿½Jï¿½MBH@ï¿½^}ï¿½ï¿½P.ï¿½\r!ï¿½ï¿½ï¿½]ï¿½ï¿½ï¿½$ï¿½ï¿½mÏž=ï¿½ï¿½@H$=ï¿½ï¿½ï¿½$ï¿½Ô­ï¿½ï¿½7ï¿½?ï¿½ iï¿½ï¿½ï¿½,ï¿½ï¿½ï¿½$ï¿½ï¿½mÛ¶mï¿½ï¿½ï¿½ï¿½H2$6ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½mÙ²%Lï¿½8ï¿½ 	*ï¿½Jï¿½ï¿½eï¿½vï¿½Pï¿½ï¿½>Lï¿½<ï¿½ 	*\nï¿½ï¿½ï¿½5	!uÛ°aCï¿½ï¿½ï¿½2ï¿½Dï¿½ï¿½,[S,_2	!u{ï¿½gÂ”)S!ï¿½ï¿½ï¿½Æ¿ï¿½!ï¿½ï¿½$ï¿½ï¿½mï¿½ï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½Hï¿½Ä²<&^5	!uï¿½ï¿½ï¿½ï¿½nï¿½ï¿½fï¿½@Hï¿½ï¿½ï¿½ß˜ï¿½ï¿½ï¿½ï¿½ï¿½Xï¿½\"Ìœ9ï¿½ 	*ï¿½ï¿½ï¿½ï¿½1qï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½fï¿½2ï¿½Dï¿½!17ï¿½ï¿½MBH@ï¿½zï¿½0{ï¿½lï¿½@Hï¿½ï¿½ï¿½rf~1	!uï¿½ï¿½ï¿½ï¿½Ã¼yï¿½!ï¿½ï¿½bï¿½Øeï¿½ï¿½MBH@ï¿½-Zï¿½ï¿½ï¿½@Hï¿½ï¿½ï¿½:fBï¿½#\"ï¿½ï¿½$ï¿½Hï¿½cï¿½eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½B\"ï¿½=ï¿½_\'MBH@ï¿½ï¿½FË¸ï¿½ï¿½Dzï¿½,ï¿½ï¿½bï¿½ï¿½gBï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½H2$ï¿½:ï¿½~ï¿½Pï¿½3fTï¿½!ï¿½ï¿½ï¿½ï¿½ï¿½Oï¿½1qï¿½$ï¿½ï¿½-ï¿½ï¿½ï¿½!ï¿½ï¿½qï¿½ï¿½ï¿½iï¿½X4?!ï¿½ï¿½ï¿½×¿~ï¿½ï¿½B\"Íï¿½RH	hHwwwXï¿½nï¿½A $C\"ï¿½I	ï¿½KWWWØ¸qï¿½A $ï¿½oï¿½ï¿½ï¿½LBH@]&Mï¿½6mï¿½dï¿½tCï¿½t{{ï¿½ï¿½&!$ï¿½.aË–-ï¿½ï¿½HTï¿½Tï¿½3fÌ§MBH@]ï¿½ß‰ï¿½ï¿½Û·B\"QYï¿½ï¿½ï¿½?ï¿½ï¿½LBH@]ï¿½ï¿½ï¿½ï¿½ï¿½kï¿½tï¿½6NÆ£ï¿½MBH@]ï¿½ï¿½ï¿½ï¿½Þ½{\r!ï¿½nH/\n_3	!uï¿½\'8`ï¿½tï¿½6ï¿½ï¿½ï¿½MBH@ï¿½!qï¿½ï¿½!ï¿½@Hï¿½ï¿½ï¿½ï¿½ï¿½ï¿½5ï¿½$ï¿½ï¿½%>Cï¿½ï¿½{ï¿½B\"Ýxï¿½P(ï¿½fBï¿½ï¿½\'NB\"Ý¥ï¿½ï¿½ï¿½ï¿½ï¿½\\ï¿½Pï¿½ï¿½ï¿½ï¿½JHï¿½ï¿½Hzï¿½å›¥Riï¿½I	ï¿½ï¿½Ñ£Gï¿½Bï¿½ï¿½ï¿½o\nï¿½ï¿½C&!$ï¿½fï¿½	Kï¿½W.ï¿½7	!5;xï¿½`ï¿½\rI/mï¿½Ë¯\'MBH@ï¿½ï¿½ï¿½ï¿½W9ï¿½\nï¿½Dï¿½!ï¿½Rï¿½\\ï¿½Wï¿½Pï¿½Ý»w	ï¿½ï¿½ï¿½ï¿½Kï¿½ÒLBH@ï¿½zzz*/ï¿½!ï¿½ï¿½ï¿½mï¿½ï¿½ï¿½&!$ï¿½f[ï¿½n\r&L0ï¿½Dï¿½Jï¿½ï¿½gYï¿½ï¿½&!$ï¿½fï¿½6m\nï¿½&M2ï¿½Dï¿½w$6ï¿½ï¿½&!$ï¿½fï¿½>ï¿½lï¿½ï¿½ï¿½4ï¿½Dï¿½!ï¿½1Ë²&!$ï¿½fï¿½Ö­Sï¿½L1ï¿½Dï¿½Kï¿½ï¿½!ï¿½ï¿½$ï¿½ï¿½lÍš5aÚ´iï¿½ï¿½Hï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$ï¿½ï¿½ï¿½ï¿½\'ï¿½7ï¿½tï¿½A $Ò¾#ï¿½Dï¿½6	!5ï¿½ï¿½wï¿½fÌ˜aï¿½ï¿½eYï¿½ï¿½yH0	!5ï¿½ï¿½wï¿½ï¿½ï¿½oB\"ï¿½ï¿½ï¿½ï¿½uï¿½Pï¿½ï¿½Kï¿½ï¿½;ï¿½ï¿½ iï¿½ï¿½?ï¿½ï¿½oï¿½,s\\ï¿½_ï¿½3fÌ§MFHï¿½E-Yï¿½$Ì;ï¿½ ï¿½ì‡¸*Ë²ï¿½ï¿½pï¿½Ë¯ï¿½ï¿½ï¿½ï¿½ï¿½\\[LKHï¿½E}ï¿½[ï¿½\nwï¿½}ï¿½A $Òºï¿½Dï¿½Nwvv~Ê¤ï¿½\\Ô‚ï¿½Â…\r!ï¿½ï¿½]ï¿½ï¿½ï¿½ï¿½ÝˆS0$ï¿½ï¿½ï¿½ï¿½/6ï¿½Dz1ï¿½ï¿½Dï¿½e×˜ï¿½ï¿½ï¿½!ï¿½3gNï¿½ï¿½ï¿½ï¿½mï¿½ï¿½Jï¿½kï¿½D|ï¿½ï¿½ï¿½	ï¿½;ï¿½#<ï¿½ï¿½#ï¿½ï¿½HPï¿½\\~|pHï¿½ï¿½ï¿½e&#$`ï¿½fÎœï¿½/_nï¿½Dï¿½yï¿½c $~c\"Bjrë­·ï¿½ï¿½+W\ZB\"ï¿½%ï¿½ï¿½!ï¿½ï¿½ï¿½	ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½O?mï¿½ï¿½ï¿½Jï¿½>ï¿½3paoï¿½ï¿½FØ»wo8|ï¿½ï¿½ï¿½nï¿½Ô©aï¿½Úµï¿½ï¿½ï¿½Hï¿½ï¿½ï¿½ï¿½?.ï¿½ï¿½Îœ%ï¿½v~ï¿½ï¿½Oï¿½T~ï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Bï¿½ï¿½MVaï¿½ï¿½ï¿½gï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Uï¿½qpï¿½\"ï¿½Qï¿½uï¿½ï¿½&ï¿½,{9ï¿½mï¿½Bï¿½ï¿½;v,ï¿½\"ï¿½Ð¸ë®»\n!ï¿½bw ï¿½xï¿½bï¿½ï¿½Cï¿½ï¿½ï¿½C!$Hï¿½<pï¿½ï¿½ï¿½ï¿½Bï¿½5ï¿½;ï¿½Kï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½7jÅŠaï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_Çï¿½ï¿½1ï¿½ï¿½ï¿½\n?ï¿½ï¿½ï¿½ï¿½SO=Uyï¿½ï¿½ï¿½Lï¿½_(ï¿½fï¿½Bï¿½Dï¿½Pï¿½ï¿½ï¿½ï¿½ï¿½l-ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½11Nï¿½:5ï¿½ï¿½ï¿½Úµï¿½ï¿½bï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½,$HT\\ï¿½8WHï¿½ï¿½ï¿½hï¿½ï¿½ï¿½^Êˆï¿½ï¿½6nï¿½XS@ï¿½ï¿½sÏ…ï¿½ï¿½ï¿½ï¿½w\'Ä„ï¿½ Eï¿½ï¿½ï¿½ï¿½ï¿½eË–Bï¿½Eï¿½3ï¿½8]ï¿½ï¿½ï¿½ï¿½_ï¿½rXï¿½ï¿½ï¿½pï¿½-ï¿½ï¿½ugï¿½2ï¿½ï¿½ Qï¿½ï¿½w+\'Nï¿½0ï¿½Dlï¿½ï¿½ï¿½#\"ï¿½yNï¿½×«ï¿½ï¿½ï¿½{&lï¿½$hï¿½ï¿½ï¿½~,]ï¿½ï¿½@ï¿½ï¿½ï¿½ï¿½\\ï¿½oï¿½ï¿½NÄ¹ï¿½LZï¿½ï¿½ï¿½q!Aï¿½ï¿½aTï¿½Cï¿½Ð¡Cï¿½ï¿½ï¿½hrï¿½ï¿½}qOÄ¥ï¿½LT/ï¿½ï¿½%?ï¿½-*.[ï¿½_ï¿½>ï¿½sï¿½=ï¿½ï¿½ï¿½ï¿½rï¿½Tï¿½@ï¿½ï¿½ï¿½ï¿½ï¿½\nwï¿½}wï¿½ï¿½ï¿½ï¿½W9oï¿½Dsï¿½ï¿½MU?ï¿½qï¿½ï¿½ï¿½K>ï¿½Ù³gW/qï¿½ï¿½Gï¿½ï¿½ï¿½ï¿½8pï¿½ï¿½Hï¿½ï¿½pï¿½ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½\rBï¿½9ï¿½FTï¿½Xï¿½ï¿½ï¿½Hï¿½	ï¿½ï¿½uï¿½ï¿½Bï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½]\nw(ï¿½~oÄ‚ï¿½\rï¿½ï¿½<ï¿½Yï¿½ï¿½Cï¿½ï¿½9ï¿½ï¿½4ï¿½ï¿½;ï¿½ï¿½\'ï¿½ï¿½<É®ï¿½ï¿½=ï¿½ï¿½ï¿½.Bbï¿½.kï¿½lï¿½ï¿½uï¿½Ê•ï¿½uï¿½ï¿½Wï¿½>ï¿½m?ï¿½Mlï¿½ï¿½ï¿½Yï¿½ï¿½ï¿½ï¿½ï¿½iï¿½ï¿½ï¿½ï¿½ï¿½!ï¿½ï¿½ï¿½ï¿½jï¿½ï¿½ï¿½ï¿½?_ï¿½>\'ï¿½ï¿½q/$hâˆ¸\'Ù‰	ï¿½ï¿½ï¿½ï¿½\0ï¿½pÄ›oï¿½yYgï¿½hVï¿½ï¿½Ü{!Aï¿½ï¿½1.ï¿½Ivï¿½Î„eï¿½Ä¨ï¿½#ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½^Hï¿½dï¿½ï¿½ï¿½ï¿½=ï¿½ï¿½$ï¿½ï¿½gï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½ $ï¿½M,>ï¿½1\'ï¿½ï¿½ï¿½ï¿½pGï¿½	!Aï¿½ï¿½Dï¿½ï¿½IvqIï¿½ï¿½=ï¿½H	ï¿½T<lj$Oï¿½ï¿½ï¿½Vï¿½ï¿½ï¿½Ô†ï¿½6ï¿½M(î¨~ï¿½s$Nï¿½ï¿½wCï¿½9ï¿½_Bbï¿½Cï¿½9Bjï¿½\r\'ï¿½ï¿½wsï¿½ï¿½ï¿½ï¿½#ï¿½y0cï¿½\'[\n	ï¿½Q|ï¿½hï¿½H<Bï¿½ï¿½ÈŠï¿½Úˆï¿½ï¿½kCHï¿½ï¿½Å·xï¿½ï¿½5ï¿½ï¿½ï¿½Nï¿½2ï¿½cyï¿½ï¿½zï¿½ï¿½ï¿½+Q}ï¿½ï¿½\n	ï¿½Lï¿½ï¿½ï¿½ï¿½Ü¥ï¿½Iï¿½ï¿½ycÆŒï¿½tï¿½=yzï¿½ï¿½ï¿½\Z;vï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½8ï¿½Ñ·ï¿½ï¿½Rï¿½+3ï¿½ï¿½=ï¿½/$hï¿½Hï¿½ëƒï¿½ï¿½ï¿½ï¿½ï¿½OdYï¿½ï¿½ï¿½>ï¿½ï¿½ï¿½oï¿½^ï¿½x?~]ï¿½ï¿½#ï¿½Bï¿½\nï¿½ï¿½U/qï¿½ï¿½wï¿½#\"~ï¿½ï¿½ï¿½L]HÐ„ï¿½\0!qï¿½ï¿½ï¿½ï¿½:&ï¿½ï¿½mï¿½ï¿½ï¿½3ï¿½Ýˆï¿½-$hRï¿½ï¿½\0!QKL<Í±k×®ï¿½fï¿½?ï¿½Y]!$hrÎ‘\0!1ï¿½eï¿½ï¿½=ï¿½ï¿½ï¿½scÇŽï¿½;ï¿½Ë£ï¿½ï¿½cï¿½ï¿½ï¿½}^}ï¿½Tï¿½ï¿½ï¿½Bï¿½ï¿½fÍš0\ZNï¿½sï¿½%Bbï¿½oï¿½ï¿½~ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½J!Aï¿½ï¿½ï¿½Ú¨~ï¿½wm $ï¿½ï¿½xï¿½Dï¿½e/Vï¿½ï¿½9ï¿½+ï¿½Xï¿½Ê¿ï¿½ï¿½ï¿½ï¿½-æ®»ï¿½\n#yï¿½ï¿½ï¿½\"$ï¿½O<Nï¿½Ì»9ï¿½]ï¿½ï¿½ï¿½_A^uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^	ZØï¿½7}ï¿½ï¿½ï¿½ï¿½ï¿½	 $hbÕ›./ï¿½Ivï¿½n	4ï¿½cÇŽï¿½ï¿½ï¿½ï¿½p9Oï¿½ï¿½_/~] $h===g-q\\Ê“ï¿½ï¿½×‰_ï¿½	ZÈ†\rÎŠï¿½Kuï¿½ï¿½Úµk\r!Bï¿½bb8Oï¿½ï¿½ï¿½ï¿½ï¿½@Hï¿½ï¿½ ï¿½eï¿½ï¿½=ï¿½qï¿½]ï¿½ï¿½,g $@Hï¿½ï¿½ï¿½ï¿½ï¿½iï¿½Fï¿½ï¿½tï¿½ï¿½ï¿½	$(ï¿½31gÎœï¿½Nï¿½ï¿½ï¿½ï¿½xï¿½Tooï¿½!\"$@Hï¿½ï¿½xï¿½v|7Gï¿½Kï¿½\ZZï¿½\nï¿½pï¿½oï¿½/ï¿½ï¿½ï¿½ï¿½pï¿½5Bï¿½ï¿½ï¿½\0!ï¿½ï¿½\0! $@H\0	\0Bï¿½\0B!ï¿½ï¿½\0! $@H\0	\0Bï¿½\0B!ï¿½ï¿½\0! $@H\0	\0BBH $\0 $\0ï¿½	\0!B@Hï¿½ï¿½\0@H $\0 $\0ï¿½\\ï¿½8~ï¿½ï¿½ï¿½vï¿½aï¿½ï¿½ï¿½wZHï¿½ï¿½ï¿½ï¿½ï¿½;vï¿½ï¿½0ï¿½^|ï¿½ï¿½cï¿½ï¿½ï¿½I?ihiï¿½^{ï¿½ï¿½7ï¿½pï¿½ï¿½xï¿½aï¿½ï¿½O~ï¿½ï¿½ï¿½cvï¿½ï¿½4ï¿½ï¿½ï¿½>ï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½ï¿½ï¿½ï¿½Oï¿½ï¿½ï¿½ï¿½ï¿½h`9#Þ‰8\'ï¿½gï¿½3$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½rï¿½\Zï¿½ï¿½rFï¿½ï¿½\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Zï¿½ï¿½ï¿½)Ë¹ï¿½(ï¿½\0\0\0\0IENDï¿½B`ï¿½',1),('70007',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.Entrust.png','70001','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0ï¿½\0\0ï¿½\0\0\0T3\0\0\'`IDATxï¿½ï¿½ï¿½\rï¿½ï¿½ï¿½}?pjmï¿½ï¿½ï¿½Zï¿½6Mï¿½ï¿½mï¿½ï¿½ï¿½kï¿½ï¿½ï¿½ï¿½$Ç“ZrLï¿½&ï¿½ï¿½ï¿½Ù™eu=\"\n(AP ZMï¿½hï¿½4ï¿½ï¿½ï¿½DMï¿½hï¿½E)ï¿½4ï¿½Eï¿½7^ï¿½ï¿½ï¿½ï¿½Í€ï¿½3Ï²ï¿½ï¿½ï¿½ï¿½sÏ°ï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½Î½ï¿½3ï¿½ï¿½ï¿½#É²ï¿½ï¿½Uï¿½ï¿½Gï¿½ï¿½ï¿½=ï¿½\"ï¿½ï¿½ï¿½qï¿½ï¿½[||ï¿½ï¿½<\0\ZB\nï¿½ï¿½ï¿½ï¿½×¦ï¿½ï¿½ï¿½ï¿½ï¿½mï¿½^ï¿½Øºï¿½~ï¿½ï¿½ï¿½ï¿½-?ï¿½3ï¿½\rï¿½bÖšï¿½ï¿½ï¿½|Zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½->iï¿½Ê¸rÙ´ï¿½ï¿½qGWï¿½ï¿½Q[ï¿½ï¿½aï¿½ï¿½ï¿½8\0\riï¿½ï¿½R`>ï¿½ï¿½ï¿½ï¿½ï¿½5)7Fï¿½ï¿½8cÓï¿½ï¿½7]1ï¿½ï¿½ï¿½5ï¿½|Çtï¿½ï¿½ï¿½ï¿½gï¿½ï¿½ï¿½ï¿½ÇŽï¿½ï¿½ï¿½ï¿½ï¿½ï¿½dï¿½gï¿½ï¿½xï¿½[Yvï¿½È«ï¿½sï¿½sï¿½-co~ï¿½Å¶6ï¿½ï¿½6ï¿½mï¿½ï¿½\0ï¿½ï¿½fï¿½ï¿½ï¿½Ú˜]6ï¿½ï¿½ï¿½ï¿½ï¿½Û˜ï¿½ï¿½zvï¿½ï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½nuï¿½cï¿½.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½+Úï¿½ï¿½Sï¿½ï¿½Rï¿½lÜ—Zï¿½hgMï¿½ï¿½~ï¿½ï¿½ï¿½Wï¿½hï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ß¿tï¿½;oM_ï¿½=7,ï¿½ï¿½ï¿½ï¿½ï¿½Skï¿½ï¿½ï¿½Ìï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½Yï¿½gï¿½ï¿½zï¿½Rï¿½ï¿½ï¿½ï¿½uCÓ¬7ï¿½ï¿½?,hÌ†c9}ï¿½ï¿½ï¿½ÍŽï¿½ï¿½ï¿½ï¿½uï¿½ï¿½q,ï¿½ï¿½Iï¿½Wï¿½ï¿½Cï¿½gYFï¿½Qï¿½ï¿½ï¿½ï¿½~>æ¦…kï¿½ï¿½ï¿½K+#PÛ–ï¿½ï¿½Ì²ï¿½#ï¿½}4fï¿½gWï¿½ï¿½ï¿½SVfï¿½.ï¿½ï¿½tï¿½ï¿½>ï¿½zï¿½ï¿½7<r,Gï¿½Vwï¿½9ï¿½=ï¿½,ï¿½ï¿½hï¿½]ï¿½ï¿½oa@#ï¿½ï¿½M_ï¿½ï¿½ï¿½ï¿½[ï¿½ï¿½sï¿½ï¿½WYFï¿½dï¿½;oï¿½|ï¿½Æšmï¿½ï¿½ßï¿½ï¿½ï¿½ï¿½ï¿½M1ï¿½ï¿½ï¿½qï¿½a[ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½!ï¿½^ï¿½ï¿½Ã§7ï¿½ï¿½noï¿½ï¿½\'ï¿½ï¿½qï¿½sï¿½ï¿½ï¿½.ï¿½T}\\qX5lï¿½ï¿½ï¿½qï¿½Q×¥ï¿½ï¿½ï¿½7ï¿½bï¿½Úšï¿½}zï¿½ï¿½a[ï¿½ï¿½eï¿½ï¿½@Vm\0\Z1hÏYï¿½Iï¿½ï¿½ï¿½ï¿½;^~ï¿½uYkï¿½ï¿½}ï¿½eWï¿½ï¿½ï¿½Ã¾ï¿½ï¿½1cï¿½ï¿½G=ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Vï¿½ï¿½\'ï¿½6ï¿½ï¿½Wï¿½ï¿½ï¿½YvIï¿½ï¿½Pï¿½@5ï¿½9oï¿½ï¿½ï¿½ï¿½~V}ï¿½ï¿½Ð«ï¿½ï¿½}1ï¿½ï¿½Uï¿½*@#ï¿½ï¿½ï¿½ogÙ¼8{ï¿½Ú¹ï¿½ï¿½sï¿½ï¿½ï¿½nï¿½Uï¿½ï¿½?ï¿½GVï¿½ï¿½jï¿½Ê¯ï¿½ï¿½Þ—Úœï¿½~ï¿½Fï¿½=ï¿½ï¿½Gï¿½,ï¿½?36\rï¿½lzo\Zzï¿½ï¿½Û«ï¿½_ï¿½h/`ï¿½ï¿½ï¿½7.ï¿½ï¿½8ï¿½Ú¹oï¿½=ï¿½ï¿½Uqï¿½Tï¿½85ï¿½ï¿½Ykï¿½ï¿½<\0l=ï¿½ï¿½ï¿½ï¿½ï¿½\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ï¿½.Ë²ï¿½ï¿½Lï¿½rï¿½Ä‰WMï¿½0aÓ°aÃ²ï¿½ï¿½Ö¬ï¿½ï¿½)kiiÉ†ï¿½ï¿½3fï¿½ï¿½ï¿½ï¿½<ï¿½,ï¿½ï¿½ï¿½ï¿½kï¿½5ï¿½xï¿½+ï¿½ï¿½ï¿½ï¿½eÌ®ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½lï¿½ÚµYXï¿½~}ï¿½tï¿½ï¿½lÎœ9ï¿½M7Ý”\r0 ;ï¿½36ï¿½\Z5ï¿½ï¿½Rï¿½ï¿½Uï¿½ï¿½ï¿½d?2mÚ´ï¿½gï¿½yfï¿½fï¿½ï¿½ï¿½?^	Õï¿½pï¿½ï¿½,Í‚ï¿½~ï¿½ï¿½ei<^E`ï¿½ï¿½ï¿½wï¿½ï¿½MCï¿½ï¿½ï¿½ÏŸï¿½í‰§ï¿½~:<xpvï¿½é§¿ï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½Vï¿½\\9xÌ˜1ï¿½eï¿½]ï¿½ï¿½Xï¿½\"ï¿½ï¿½Xnï¿½ï¿½7hÐ w,+ï¿½ï¿½3ï¿½Ú‹.ï¿½(Û°aCVoW\\qEï¿½pï¿½ï¿½Ù³ï¿½~ï¿½\r@Ã‰cï¿½ï¿½t3ï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½g}ï¿½ï¿½]ï¿½ï¿½\04ï¿½8*ï¿½ï¿½ï¿½kï¿½x{Kï¿½ï¿½T*ï¿½ï¿½ï¿½:\0\r#ï¿½ï¿½ï¿½ï¿½8ï¿½#ï¿½ISï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½hï¿½ï¿½=ï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Pï¿½aEGï¿½jï¿½<ï¿½ï¿½SYï¿½Ù¾ï¿½d)\0ï¿½ï¿½ï¿½ï¿½ï¿½gï¿½3Tï¿½\'EmKkkï¿½ï¿½bï¿½ï¿½Ï³\0@ï¿½{ï¿½ï¿½{Ã¥ï¿½^ï¿½ï¿½ï¿½ï¿½iï¿½gï¿½n-.*{ï¿½\r=ï¿½Ð†ï¿½ï¿½x\0ï¿½ï¿½ï¿½ï¿½=qQï¿½ï¿½aï¿½ï¿½ï¿½RØ®ï¿½,\0Ð­ï¿½ï¿½ï¿½Ú®ï¿½ï¿½ï¿½ï¿½ï¿½qï¿½>ï¿½\0ï¿½Zï¿½ï¿½ï¿½$lï¿½ï¿½N:é¤½9ï¿½ï¿½$lï¿½ï¿½ï¿½:ë¬½vï¿½vï¿½Ò¥ï¿½ï¿½ï¿½ï¿½;vìº½u6ï¿½)Sï¿½:ï¿½nï¿½ï¿½ï¿½[ï¿½ï¿½ï¿½g;fÌ˜%ï¿½g@ï¿½7xï¿½ï¿½ï¿½ï¿½Wvï¿½ï¿½ï¿½\Zï¿½ @ï¿½ï¿½ÆŽï¿½yï¿½ï¿½Ù±ï¿½lod\0\Zï¿½ï¿½Ñ£ï¿½ï¿½ï¿½;4lï¿½ï¿½ï¿½ï¿½U\0hï¿½ï¿½ï¿½ï¿½zê©›.\\ï¿½!Aï¿½ï¿½#ï¿½,ï¿½Yï¿½ï¿½ï¿½ï¿½Pï¿½8ï¿½1qï¿½+Vï¿½\Zï¿½kÖ¬ï¿½X.ï¿½×§ï¿½ï¿½ï¿½\04ï¿½ï¿½~é¥—ï¿½yï¿½Ô¦ï¿½3ï¿½ï¿½ï¿½Tï¿½ï¿½\'+ï¿½ï¿½ï¿½\'ï¿½ï¿½ï¿½Fï¿½\Zï¿½rï¿½ï¿½6ï¿½ï¿½Uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½nKÇƒ\rï¿½ï¿½^qï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½iï¿½ï¿½ï¿½iï¿½ï¿½{|2Tï¿½ï¿½ï¿½c3Z\0ï¿½Bï¿½ï¿½Ô·oï¿½\rcÇŽ}?BwWï¿½ï¿½ï¿½Îï¿½,ï¿½Wï¿½:v2\0lKï¿½FÓ¬ï¿½Ö˜ï¿½ï¿½xâ‰›&Lï¿½ï¿½fÆŒï¿½,Yï¿½1ï¿½Gï¿½vï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Þ»<ï¿½`ï¿½ï¿½ï¿½\"dï¿½}ï¿½ï¿½ï¿½`ï¿½ï¿½lImjjï¿½R\0ï¿½ï¿½ï¿½ï¿½Õ´uqL6ï¿½Ù±ï¿½ï¿½ï¿½\0ï¿½~ï¿½ï¿½7n_ï¿½\0ï¿½ï¿½ï¿½,\0rï¿½>}ï¿½ï¿½\0ï¿½cï¿½zK\0ï¿½ï¿½---ï¿½\0ï¿½_ï¿½nï¿½Õ«ï¿½GU\0rï¿½ï¿½>ï¿½\0ï¿½cØ¶ï¿½ï¿½|B%\0 ï¿½ï¿½ï¿½X,U	\0ï¿½1lï¿½ï¿½ï¿½S	\0ï¿½Iï¿½Tï¿½ï¿½Õ¯~ï¿½ï¿½*\0ï¿½ï¿½l7ï¿½ï¿½ï¿½*\0ï¿½ï¿½ï¿½gU\0rR,ï¿½ï¿½Û·ï¿½*\0ï¿½ï¿½lï¿½/\nGï¿½\0ï¿½ï¿½ï¿½Sï¿½~A%\0 ï¿½ï¿½]W,ï¿½Q	\0ï¿½1lï¿½ï¿½ï¿½T\0ï¿½ï¿½ï¿½\nï¿½ï¿½ï¿½*\0ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½\0ï¿½_Ø®)ï¿½}T\0rï¿½Rï¿½\0ï¿½ï¿½4ï¿½]ï¿½ï¿½ï¿½ï¿½J\0@~3ï¿½U)lOV	\0ï¿½/lWï¿½ï¿½m?ï¿½\0ï¿½ï¿½ï¿½Yï¿½ï¿½NS	\0ï¿½ofï¿½n\nÛ*\09)ï¿½oï¿½ï¿½ï¿½\0ï¿½ï¿½4ï¿½}ï¿½P(U	\0ï¿½Iï¿½Õ¾ï¿½ï¿½pï¿½\0ï¿½ï¿½ï¿½vyj#U\0ï¿½ï¿½eï¿½ï¿½V	\0ï¿½Iï¿½X\\Z.ï¿½Çª\0ï¿½7ï¿½]ï¿½wï¿½J\0@~aï¿½zjï¿½\0ï¿½ï¿½ï¿½Sï¿½ï¿½J\0@Nï¿½ï¿½ï¿½ï¿½rï¿½bï¿½\0ï¿½ï¿½ï¿½Jï¿½W\nï¿½ï¿½%*\09ijjZï¿½fï¿½ï¿½ï¿½\0ï¿½ï¿½/ï¿½6Q%\0 \'iVï¿½Bï¿½\\ï¿½B%\0 \'ï¿½Rï¿½ï¿½ï¿½ï¿½T\0ï¿½ï¿½gï¿½Âµ*\09ijjz&ï¿½T\0ï¿½Û§Rï¿½ï¿½J\0@Nï¿½ï¿½ï¿½ï¿½Rï¿½tï¿½J\0@~aï¿½Dï¿½\\ï¿½ï¿½J\0@Nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½U%\0 ï¿½ï¿½ï¿½ï¿½ï¿½OT\0ï¿½ï¿½yï¿½Ý©\0ï¿½ï¿½bï¿½8ï¿½T*Ý¥\0ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½ï¿½\0ä¤©ï¿½ivj?W	\0ï¿½/lgï¿½vï¿½J\0@~a;3ï¿½ï¿½*\09)ï¿½J3ï¿½ï¿½ï¿½4ï¿½\0ï¿½ï¿½fï¿½ï¿½6]%\0 ï¿½ï¿½ï¿½\ZKï¿½*\0ï¿½ï¿½ï¿½qï¿½ï¿½J\0@Nï¿½ï¿½ï¿½ï¿½xï¿½ï¿½J\0@NJï¿½ï¿½=)pV	\0ï¿½/lï¿½-U\0r!ï¿½ï¿½ï¿½\0ï¿½P(Üžfï¿½ï¿½P	\0ï¿½I\nï¿½ï¿½ï¿½ï¿½*\09)ï¿½ï¿½?*ï¿½Oï¿½\0ï¿½$ï¿½joNaï¿½P%\0 ï¿½ï¿½ï¿½1ï¿½\'U\0ï¿½ï¿½R{F%\0 \'ï¿½Bï¿½ï¿½Rï¿½ï¿½ï¿½J\0@NRï¿½^ï¿½fï¿½Ï«\0ï¿½X,^ï¿½ï¿½ï¿½W*\09IA;1ï¿½U\0ï¿½ï¿½^ï¿½ï¿½vï¿½J\0@NJï¿½Ò¥)l_V	\0ï¿½of;!ï¿½ï¿½+*\09IAï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½J\0@Nï¿½ï¿½ï¿½yï¿½bqï¿½J\0@~3ï¿½qï¿½ï¿½ï¿½\0ï¿½_ØŽNmï¿½J\0@N\nï¿½Â¹ï¿½Riï¿½J\0@~a;\"ï¿½lï¿½T	\0ï¿½/lï¿½ï¿½ï¿½ï¿½[*\09Iï¿½ï¿½ï¿½ï¿½bï¿½mï¿½\0ï¿½ï¿½ï¿½vPjï¿½\0ï¿½P(ï¿½^*ï¿½ï¿½U	\0ï¿½Iï¿½Xï¿½fï¿½+U\0rï¿½fï¿½\'ï¿½ï¿½]ï¿½\0ï¿½ï¿½ï¿½-ï¿½\0ï¿½\rï¿½rjï¿½U\0rR,ï¿½ï¿½ï¿½]ï¿½\0ï¿½ï¿½rï¿½ï¿½+ï¿½ï¿½Zï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½}O%\0 \'iVï¿½ï¿½Ô„-\0ï¿½%ï¿½jï¿½Iaï¿½N%\0 \'ï¿½{ï¿½>ï¿½T*ï¿½W	\0ï¿½I\nï¿½M3[a\0yï¿½Û·ï¿½ï¿½bï¿½}ï¿½\0ï¿½ï¿½ï¿½Yï¿½gSÛ \0ï¿½ï¿½>}ï¿½!l Gï¿½rï¿½ï¿½ï¿½U\0ï¿½$vï¿½J-ï¿½A{Eï¿½\0`7ï¿½Jï¿½wï¿½ï¿½Bï¿½+*\0ï¿½ï¿½nï¿½\0ï¿½bï¿½8a[aï¿½ï¿½ï¿½\\T!\0ï¿½ï¿½ï¿½vï¿½Vï¿½vï¿½ï¿½\0@ï¿½ï¿½vï¿½ï¿½a[*ï¿½ï¿½\0ï¿½7pß­	ï¿½7U\0ï¿½,ï¿½dï¿½ï¿½ï¿½jï¿½ï¿½\0ï¿½8ï¿½U	\0ï¿½/lG\n[\0ï¿½ï¿½,ï¿½ï¿½{ï¿½^ï¿½={vvï¿½ï¿½ï¿½gï¿½ï¿½wï¿½ï¿½mï¿½Ô©Ùƒ>ï¿½)ï¿½+ï¿½*}\\6ï¿½ï¿½Ì™3ï¿½ï¿½Kï¿½fï¿½Ö­ï¿½ï¿½ï¿½-[ï¿½,ï¿½>}ï¿½ï¿½4(MÐ³ï¿½q}hï¿½ï¿½\rBï¿½ï¿½ï¿½,`ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½@ï¿½XV3ï¿½Ô·Å’ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½@ï¿½ï¿½ï¿½1xï¿½ï¿½qMï¿½N0ï¿½zï¿½ï¿½ï¿½9ï¿½gï¿½~ï¿½ï¿½ï¿½ï¿½qï¿½ï¿½ï¿½@ï¿½ï¿½ï¿½ï¿½@ï¿½ï¿½o/ï¿½~9eLï¿½ï¿½ï¿½ï¿½7kq_|ï¿½ï¿½c ï¿½ï¿½ï¿½q`ï¿½Wï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½ï¿½ï¿½nï¿½ï¿½ï¿½Hï¿½Ç=ï¿½ï¿½zï¿½[ï¿½ï¿½ï¿½sï¿½>ï¿½ï¿½{8ï¿½ï¿½qï¿½ï¿½ï¿½sï¿½>ï¿½ï¿½\"ï¿½>ï¿½ï¿½ï¿½ï¿½Ð¹ï¿½83s[Q|ï¿½ï¿½c ï¿½ï¿½ï¿½q`ï¿½ï¿½fMï¿½ï¿½@ï¿½3ï¿½ï¿½ï¿½q}ï¿½Ãï¿½ï¿½Ågï¿½ï¿½wï¿½ï¿½ï¿½ï¿½}ï¿½9ï¿½ï¿½ï¿½Hï¿½Ç=ï¿½ï¿½ï¿½8ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½Hï¿½ÇzDï½—=ï¿½ï¿½\\^Kï¿½ï¿½ï¿½>\"}\\ï¿½` ï¿½ï¿½sï¿½ï¿½uï¿½6ï¿½gï¿½ï¿½ï¿½c ï¿½ï¿½ï¿½q`wï¿½ï¿½jï¿½ï¿½ï¿½eOLï¿½ï¿½Aï¿½ï¿½ï¿½cï¿½f\0\"}\\vr ï¿½ï¿½+}3\0ï¿½>ï¿½ï¿½ï¿½Yï¿½ï¿½ï¿½Î¼ï¿½ï¿½ï¿½ï¿½@d ï¿½ï¿½ï¿½q`ï¿½ï¿½Bmï¿½@d ï¿½ï¿½ï¿½q`ï¿½f ï¿½ï¿½5}D\"ï¿½q}Dï¿½mkjjjIï¿½5ï¿½Oï¿½` ï¿½ï¿½<UCvIjY4ï¿½Oï¿½` ï¿½ï¿½4mï¿½ï¿½Vï¿½` ï¿½ï¿½4ï¿½ï¿½~ï¿½\\ï¿½eï¿½\n[}|kï¿½.ï¿½aï¿½ï¿½aï¿½)ï¿½ï¿½ï¿½dï¿½mï¿½ï¿½ï¿½ï¿½^x![ï¿½zï¿½V?ï¿½ï¿½ï¿½fï¿½ï¿½ï¿½]&pï¿½-ì…ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½Ñ~4ï¿½ï¿½wï¿½ï¿½[ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½;Cï¿½jï¿½ï¿½ï¿½>ï¿½9rï¿½ï¿½ï¿½ï¿½<ï¿½ï¿½ï¿½è²ï¿½O?ï¿½ï¿½zï¿½5ï¿½dï¿½R)[ï¿½hQï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½yç»ï¿½;ï¿½ï¿½=ï¿½Ï»ï¿½ï¿½+ï¿½Wï¿½B\rï¿½ï¿½cï¿½0aBvï¿½1ï¿½Tï¿½ï¿½\r\ZTï¿½xï¿½Ô©ï¿½ï¿½ï¿½)Sï¿½Tï¿½ï¿½/9ï¿½ï¿½â‹³o|ï¿½ÙŸï¿½ï¿½ï¿½Wï¿½{ï¿½ï¿½ï¿½wï¿½ï¿½xï¿½é§³Ñ£Ggsï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Âˆ4Ð¯4ï¿½mï¿½>>sï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\"ï¿½ï¿½ï¿½/U>ï¿½ï¿½O~ï¿½ï¿½ï¿½Uï¿½Veï¿½ï¿½zjï¿½O|ï¿½ï¿½ï¿½ï¿½,lï¿½ï¿½ï¿½ï¿½ï¿½kï¿½zï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½B_b;vlï¿½zÆŒï¿½ï¿½ï¿½-ï¿½dï¿½ï¿½Oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½lï¿½ï¿½Ù›ï¿½ï¿½^ï¿½ï¿½ï¿½3ï¿½8ï¿½r_Rï¿½ï¿½ï¿½gï¿½ï¿½}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½86lXï¿½fÍšï¿½ï¿½ï¿½|vï¿½QGï¿½ï¿½ï¿½ï¿½dGqD6mÚ´ï¿½/ï¿½ï¿½/ï¿½ï¿½nï¿½mï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\'ï¿½\\ï¿½ï¿½ï¿½ï¿½ï¿½+ï¿½ï¿½ï¿½/~QYï¿½Gï¿½ï¿½pï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fÍšï¿½-^ï¿½8ï¿½ï¿½ï¿½++ï¿½Oï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½ï¿½ï¿½-{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½+}ï¿½_ï¿½ï¿½_*3ï¿½ï¿½ï¿½7ï¿½|sï¿½ï¿½ï¿½ï¿½ï¿½Wï¿½)ï¿½ï¿½&Mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½1Wï¿½ï¿½pï¿½ï¿½Wï¿½ï¿½ï¿½ï¿½]~ï¿½ï¿½ï¿½ï¿½ï¿½@Ì¾ï¿½ï¿½vï¿½aï¿½9ï¿½S	ï¿½hoï¿½ï¿½F{ï¿½ï¿½ï¿½ï¿½ï¿½Me0ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½,{Å€ï¿½ï¿½cYm!|ï¿½ï¿½f_ï¿½ï¿½ï¿½+ï¿½ï¿½ï¿½ï¿½ï¿½Oï¿½/ï¿½ï¿½sï¿½=ï¿½ï¿½fï¿½ï¿½Ú–ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½+ï¿½ï¿½ï¿½ï¿½ë¿®ï¿½ï¿½%ï¿½Tfï¿½!ï¿½ï¿½@Tï¿½ï¿½+lï¿½ï¿½ï¿½ï¿½ï¿½ï¿½/ï¿½/;ï¿½ÙŸï¿½Yï¿½E^ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½/ï¿½bï¿½ï¿½ï¿½ï¿½ï¿½Yyxï¿½!ï¿½dï¿½ï¿½Zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Eï¿½Gßï¿½ï¿½Mï¿½vï¿½ï¿½ï¿½ï¿½oï¿½ï¿½ï¿½ï¿½Cï¿½ï¿½lï¿½<ï¿½8ï¿½ï¿½ï¿½sï¿½=ï¿½r_ï¿½rï¿½ï¿½ï¿½ï¿½Û—ï¿½jÃ¶-ï¿½bï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½gï¿½7tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Zï¿½Ä¼ï¿½>ï¿½dï¿½Fï¿½\ZUï¿½ï¿½ï¿½ï¿½\r.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½gï¿½ï¿½@Xï¿½TvbSï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½cEï¿½G?ï¿½QÖ·oï¿½Jï¿½ï¿½ï¿½<ï¿½ï¿½ï¿½ï¿½cfï¿½ï¿½Cï¿½ï¿½oï¿½Û•ï¿½ï¿½Xï¿½ï¿½|ï¿½=lc6ï¿½ï¿½oï¿½ï¿½*ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½jï¿½,#C7ï¿½ï¿½ä¶Yh||ï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½J?ï¿½ï¿½xï¿½Ä‰ï¿½Çžtï¿½Iï¿½ï¿½O9ï¿½ï¿½1ï¿½hmK`ï¿½\n=ï¿½X&;ï¿½ï¿½#+ï¿½ï¿½.ï¿½ï¿½ï¿½wï¿½yï¿½ï¿½ï¿½\'bï¿½l$ï¿½<0ï¿½ï¿½ï¿½ï¿½ï¿½Ê‰+\"}ï¿½ï¿½}<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½gsï¿½Ì©|ï¿½ï¿½7ß¬ï¿½ï¿½?ï¿½ï¿½?Tï¿½ï¿½3ï¿½ï¿½ï¿½VÃ¶ï¿½ï¿½ï¿½ï¿½?ï¿½Nï¿½ï¿½m|ï¿½ï¿½Ó§ï¿½ï¿½mï¿½ï¿½ï¿½ï¿½ï¿½*Ç‚ï¿½ï¿½m/,ï¿½yï¿½aï¿½4ï¿½ï¿½ï¿½ï¿½qWï¿½ï¿½\'>QYï¿½}ï¿½W>pï¿½6ï¿½8k3ï¿½0ï¿½Ý¶ï¿½6bÄˆï¿½nï¿½>ï¿½ï¿½ï¿½eW]uUï¿½mKpï¿½ï¿½Lï¿½-ï¿½v{_{ï¿½	\'ï¿½/ï¿½=ï¿½ï¿½#ï¿½ï¿½\'ï¿½ï¿½ï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½gï¿½ï¿½[ï¿½ï¿½}ï¿½Sï¿½ï¿½fÖˆï¿½ï¿½ï¿½x ï¿½Õ«ï¿½6Ï ï¿½3ï¿½cï¿½\'Vaby8^\\ï¿½]ï¿½vï¿½a\'n/lï¿½$ï¿½ï¿½Õyï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Wï¿½qbF|.fï¿½wï¿½}ï¿½foï¿½ï¿½=A*^ï¿½ï¿½}ï¿½{leÚ»wï¿½ï¿½ï¿½xï¿½ï¿½ï¿½GWï¿½Eï¿½-ï¿½Å²o4mï¿½Õ¾ï¿½a{_Û¶ï¿½ï¿½ï¿½X6ï¿½Pï¿½ï¿½ï¿½ï¿½{ \rDï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½?ï¿½ï¿½ï¿½ï¿½/~ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½Û•ï¿½ï¿½Fï¿½Fï¿½ï¿½x||ï¿½ï¿½Ú°=è ƒ>ï¿½ï¿½ï¿½\\ï¿½ï¿½}ï¿½ï¿½Lï¿½8YPï¿½.<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½n}mgï¿½qÜŽï¿½Zï¿½>^ï¿½>g\"ï¿½\\ï¿½rï¿½3ï¿½Ø˜yï¿½ï¿½qï¿½ï¿½yï¿½W9ï¿½7^\\ï¿½ï¿½ï¿½/&wï¿½oPï¿½.2ï¿½7}ï¿½7-fï¿½1;ï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½,ï¿½ï¿½{Ì˜1ï¿½8ï¿½4ï¿½>ï¿½W{é¥—*gï¿½ï¿½` ï¿½Dï¿½xN-ï¿½ï¿½ï¿½ï¿½y}Dï¿½ï¿½HÏ¡ï¿½[ï¿½nï¿½ï¿½ï¿½ï¿½1ï¿½+Vï¿½ï¿½` ï¿½Dï¿½x=[ï¿½ï¿½,6ï¿½ï¿½ï¿½ï¿½ï¿½ITï¿½8ï¿½4ï¿½>^ï¿½ï¿½ï¿½ï¿½/g\\pAvï¿½Ygeï¿½=ï¿½ï¿½>\"ï¿½@ï¿½ï¿½×«ï¿½2ï¿½M7ï¿½Tï¿½ï¿½ï¿½Oï¿½Óºï¿½ï¿½Gï¿½ï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½.ï¿½,[ï¿½tï¿½>\"ï¿½@ï¿½ï¿½×«ï¿½%ï¿½ï¿½}ï¿½O<ï¿½ï¿½ï¿½ï¿½H3ï¿½ï¿½ï¿½jï¿½ï¿½Ylï¿½KÆ±}bï¿½mï¿½ï¿½ï¿½ï¿½H3ï¿½ï¿½uÚºï¿½ï¿½ï¿½ï¿½ï¿½N;ï¿½Ê…:zï¿½P}DÂ–nï¿½ï¿½ï¿½\"\0ï¿½ï¿½b\\ ï¿½bï¿½ï¿½ak ï¿½ï¿½ï¿½ï¿½ï¿½Zï¿½qÇ˜ï¿½ï¿½ÏŒÙ­>[ï¿½>^ï¿½%ï¿½rï¿½ï¿½k+ï¿½]ï¿½Qï¿½ï¿½ï¿½Hï¿½C[ï¿½pavï¿½9ï¿½dï¿½Æï¿½~ï¿½ï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½Iï¿½@ï¿½ï¿½ï¿½Z[ï¿½lY6qï¿½ï¿½lï¿½ï¿½ï¿½ï¿½ï¿½>|ï¿½Ì™37vï¿½7ï¿½wï¿½ï¿½ê«¯.Jï¿½:=ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½ï¿½ï¿½ï¿½}ï¿½]}Ø±iÓ¦]0}ï¿½ï¿½Moï¿½ñ†°¬ï¿½ 4uï¿½ï¿½ï¿½Sï¿½ï¿½guï¿½>>ï¿½ï¿½lØ°aï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½>ï¿½ï¿½3>ï¿½R]KCï¿½ï¿½Å¥ï¿½:ï¿½ï¿½Wmï¿½BÝ¯ï¿½ï¿½yï¿½Ù¨Qï¿½ï¿½~ï¿½ï¿½UNï¿½ï¿½ï¿½Pv]ï¿½>}>ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Hï¿½nJjSï¿½ï¿½>>XUï¿½ï¿½>ï¿½	[:Lï¿½ocR[ï¿½ï¿½ï¿½Bï¿½(\Z!lï¿½tï¿½ï¿½ï¿½ï¿½Ö¥6ZEï¿½ï¿½Ñ«Wï¿½ï¿½ï¿½ï¿½oï¿½Jï¿½ï¿½ï¿½Rï¿½4#ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½XMQï¿½ï¿½ï¿½rï¿½)ï¿½ï¿½PØ’ï¿½ï¿½ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½=BEï¿½ï¿½ï¿½ï¿½ï¿½ï¿½IaKï¿½ï¿½cï¿½lvy\nÙµï¿½vï¿½ï¿½\0\rï¿½ï¿½ï¿½ï¿½ï¿½Xï¿½S	ï¿½!ï¿½GR{$ï¿½ï¿½ï¿½Bï¿½ï¿½ï¿½={ï¿½*@ï¿½+ï¿½Ë‡[ï¿½!ï¿½ï¿½ï¿½ï¿½mHï¿½xï¿½\"\0ï¿½ ?ï¿½Jï¿½}ï¿½wjï¿½ï¿½ï¿½Õ©ï¿½Sï¿½-ï¿½Jï¿½ï¿½ï¿½	,*ï¿½ï¿½ï¿½ï¿½ï¿½Rï¿½YPÝ˜ï¿½ï¿½qï¿½ï¿½ï¿½*\0[Q(ï¿½ï¿½ï¿½`ï¿½ï¿½gnï¿½ï¿½ï¿½ï¿½ï¿½i6ï¿½WJï¿½iï¿½<&6P	vï¿½ï¿½ï¿½Iï¿½ï¿½ï¿½JAï¿½\"ï¿½ï¿½ï¿½\0ï¿½4p~9ï¿½ï¿½Tï¿½ï¿½(;4ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½[Uï¿½Iï¿½rï¿½Wï¿½R%Øšï¿½PE\nï¿½[cï¿½8ï¿½ï¿½\'ï¿½xï¿½ï¿½T`577ï¿½ï¿½ï¿½ï¿½F%ï¿½Rz6(ï¿½5ï¿½ï¿½U(ï¿½Wï¿½Ý”f+}ï¿½-*Aï¿½xï¿½uï¿½/ï¿½Yï¿½)d/Qï¿½=Û“ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½pwï¿½ï¿½<ï¿½ï¿½?ï¿½ï¿½ï¿½\n@ï¿½Aï¿½ï¿½4ï¿½]ï¿½\rï¿½FV/}ï¿½Fï¿½Þ½ï¿½Vï¿½ï¿½ï¿½q\\ï¿½ï¿½hL}ï¿½ï¿½=2=ï¿½ï¿½ï¿½ï¿½ï¿½Eï¿½xï¿½A\\ï¿½%ï¿½ï¿½Uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Sï¿½ï¿½zï¿½qï¿½ï¿½*\0ï¿½ï¿½lï¿½ï¿½ï¿½ï¿½J4ï¿½rï¿½|^u&ï¿½jjï¿½Sï¿½ï¿½\nï¿½sãº£*ï¿½ï¿½Å±ï¿½ï¿½Kcï¿½ï¿½ï¿½ï¿½Pï¿½ï¿½ï¿½ÙŽImï¿½Jt_---ï¿½ï¿½ï¿½ï¿½,ï¿½ï¿½ï¿½ï¿½8ï¿½XU\0:P,)ï¿½ï¿½ï¿½ï¿½ï¿½Rï¿½^Zï¿½bï¿½xï¿½ï¿½ï¿½\0ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½Eï¿½	ï¿½}+vï¿½Jï¿½U`ï¿½ï¿½Ç‰2*ï¿½=ï¿½ï¿½ï¿½)`ï¿½U7ï¿½ï¿½%ï¿½6Vï¿½ï¿½?ï¿½ï¿½eÆ—Uï¿½ï¿½ï¿½\'ï¿½ï¿½S\rÙ§ï¿½*=Jï¿½Iï¿½ï¿½ï¿½ï¿½ï¿½^Rï¿½.ï¿½ï¿½)ï¿½Hï¿½ï¿½ï¿½ï¿½ZTï¿½ï¿½I3ï¿½+ï¿½\0ï¿½+ï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½zï¿½ï¿½ï¿½zï¿½ï¿½,@ï¿½ï¿½ï¿½^ï¿½ï¿½s*ï¿½uï¿½7nï¿½ï¿½7Å’q\nï¿½ï¿½ï¿½ï¿½rï¿½!ï¿½Ð¹ï¿½ï¿½ï¿½ÔžQï¿½.ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½Ïº\\.ï¿½Rï¿½ï¿½1xß˜Ú“*Ñ¹ï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½g6ï¿½ï¿½ï¿½@ï¿½\Zï¿½ï¿½ï¿½_ï¿½Dï¿½Ô³gï¿½ï¿½Jï¿½ï¿½q\\6=Wï¿½Ûï¿½\n@ï¿½ï¿½ï¿½â¸ŸJt>ï¿½BahznÞ‹ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½ï¿½\0tÝ°ï¿½#\rè©Dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Eï¿½ï¿½ï¿½ï¿½7Uï¿½ï¿½ï¿½])lï¿½ï¿½Þ—fï¿½ï¿½pï¿½RÝ˜bzï¿½ï¿½`Uï¿½a{OTï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½^(ï¿½Rï¿½ï¿½5ï¿½ï¿½Lï¿½!ï¿½ï¿½;\"X#`S[ï¿½ï¿½hï¿½a{jï¿½DÇŠ%ï¿½Rï¿½4ï¿½ï¿½1ï¿½ï¿½XBVï¿½ï¿½ï¿½ï¿½S{@%:ï¿½ï¿½ß¬ï¿½ï¿½ï¿½(ï¿½ï¿½*ï¿½ï¿½ï¿½ï¿½ï¿½MUï¿½ï¿½ï¿½oï¿½Iï¿½^ï¿½nï¿½ï¿½@ï¿½ï¿½Cqï¿½V%ï¿½Qï¿½ï¿½HlLQ(nï¿½ï¿½*Tï¿½ï¿½Tw%ï¿½G%r{13ï¿½ï¿½ï¿½ï¿½sï¿½ï¿½Í‡ï¿½@cÎºï¿½ï¿½ï¿½OUï¿½ï¿½!ï¿½;.ï¿½^Ì¬Nï¿½ï¿½ï¿½\04vï¿½ï¿½\"ï¿½6Uï¿½>ï¿½rw)dT7ï¿½ï¿½1.ï¿½ï¿½*\0f`ï¿½ï¿½ï¿½Vï¿½ï¿½cï¿½ï¿½ï¿½\nï¿½l\\ï¿½!.ï¿½$\0ï¿½ï¿½mï¿½Ubï¿½\nï¿½ï¿½RWï¿½ï¿½]ï¿½ZIE\0ï¿½2lï¿½ï¿½ï¿½Nï¿½ï¿½uï¿½EÊ¡ï¿½=\'@ï¿½ï¿½I1ï¿½U\0ï¿½ï¿½Ï¤ï¿½ï¿½u*ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Xzï¿½%ï¿½8ï¿½ï¿½ï¿½Oï¿½ï¿½ï¿½\0ï¿½ï¿½ï¿½}>ï¿½ï¿½*ï¿½ï¿½ï¿½\Zï¿½Úšï¿½ï¿½*\nÇ«\0;ï¿½fh/ï¿½ï¿½ï¿½+Tbï¿½Rï¿½O/J^ï¿½mSï¿½^ï¿½\"\0ï¿½ï¿½Lï¿½ï¿½.Wï¿½ï¿½ï¿½ß¿ï¿½ï¿½ï¿½>wWï¿½ï¿½3ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½aï¿½rï¿½ï¿½]ï¿½[ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý»ï¿½ï¿½*ï¿½ï¿½ï¿½ï¿½bï¿½xï¿½Jï¿½Fß¾}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½SmÆ«\0{\Zï¿½qï¿½ï¿½Tï¿½Gï¿½ï¿½ï¿½Öƒï¿½ï¿½ï¿½)`7Å•ï¿½ï¿½;ï¿½Uï¿½zï¿½ï¿½ï¿½ï¿½ï¿½	Pï¿½Ugï¿½ï¿½ï¿½ï¿½9=ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½?ï¿½Å¦pï¿½\Zï¿½W(Fï¿½\0ï¿½]\\ï¿½<ï¿½Ì¹ï¿½ï¿½ï¿½niiï¿½ï¿½ï¿½|ccï¿½ï¿½ï¿½cï¿½ï¿½ï¿½fï¿½oï¿½ï¿½ï¿½`/0.ï¿½nï¿½ï¿½1>\\/\0 W)pï¿½Nï¿½3ï¿½ï¿½ï¿½)XOHAï¿½Vï¿½\0ï¿½nzï¿½è¨™ï¿½ï¿½=xbï¿½ï¿½ï¿½ï¿½ï¿½WÝ˜ï¿½ï¿½ï¿½ï¿½3@Gï¿½lWï¿½\0:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½TCï¿½ï¿½ï¿½Jï¿½gï¿½ï¿½1ï¿½ï¿½ë°žï¿½ï¿½ï¿½_ï¿½_ï¿½+Skï¿½Lï¿½7ï¿½vujï¿½n4Sï¿½ï¿½ï¿½V/ï¿½tï¿½Y\0ï¿½zØ®Iï¿½Ô§ï¿½ï¿½?Æï¿½o\n×›bï¿½8ï¿½ï¿½rï¿½)ï¿½xvï¿½,aï¿½ï¿½P(|ï¿½ï¿½ï¿½Nï¿½ï¿½ï¿½ï¿½)ï¿½Ë½<ï¿½\0tï¿½ï¿½z/ï¿½/wï¿½ï¿½=ï¿½`?ï¿½~ï¿½ï¿½ï¿½=ï¿½.@gï¿½u)ï¿½ï¿½ï¿½Jï¿½sÏž=ï¿½+ï¿½Jwï¿½qï¿½ï¿½ï¿½?ï¿½n?ï¿½ï¿½3ï¿½ï¿½ï¿½Vï¿½ï¿½U~ï¿½Bï¿½04ï¿½{ï¿½ï¿½dï¿½>}ï¿½ï¿½ï¿½Ù‚uQjï¿½VZ,Ã¾_mï¿½Æ¥ï¿½:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7=ï¿½\0tJï¿½rï¿½Kï¿½ï¿½ï¿½ï¿½fï¿½ï¿½vï¿½ï¿½9ï¿½^Hï¿½×”ï¿½ï¿½ï¿½ï¿½ï¿½{&ï¿½ï¿½ï¿½ï¿½ï¿½qï¿½3ï¿½jï¿½ï¿½ï¿½ï¿½ï¿½/\nGyï¿½\0ï¿½ï¿½ï¿½ï¿½2ï¿½ï¿½`ï¿½ï¿½ï¿½ï¿½ï¿½Rï¿½Yï¿½Ë‰Kï¿½mï¿½ï¿½Þžï¿½ï¿½qï¿½]Ï¨nL19ï¿½ï¿½=[\0tIï¿½ï¿½ï¿½Vï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½IOÕ“ï¿½ï¿½ï¿½=Â³@ï¿½ï¿½Bï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Õ½4ï¿½=6ï¿½ï¿½;Yï¿½ï¿½!ï¿½\0ï¿½ï¿½ï¿½ï¿½jNï¿½:ï¿½ï¿½~lDï¿½ï¿½#qRVï¿½iß¾ï¿½ï¿½\0ï¿½ï¿½.ï¿½ï¿½=ï¿½ï¿½ï¿½?ï¿½ï¿½?wbï¿½ï¿½ï¿½ï¿½577ï¿½\0ï¿½;ï¿½mKï¿½^ï¿½ï¿½ï¿½bNï¿½ï¿½ï¿½qï¿½ï¿½Xï¿½ï¿½ï¿½ï¿½g\0ï¿½F0\"ï¿½,ï¿½ï¿½yï¿½ï¿½ï¿½ï¿½]\nï¿½Õ)nï¿½pï¿½ï¿½ï¿½ï¿½R{ï¿½zï¿½Gï¿½ï¿½ï¿½ï¿½ï¿½8.ï¿½nvWv\0\Z-hï¿½vtï¿½ï¿½P(ï¿½ï¿½vU\nï¿½ï¿½ï¿½ï¿½ï¿½Fï¿½Ý¿Kï¿½ï¿½ï¿½ï¿½Ôžï¿½ï¿½ï¿½ï¿½ï¿½*9\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½-ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½1ï¿½ï¿½Sï¿½{ï¿½\'~Lï¿½ï¿½[ï¿½ï¿½Kï¿½i;(ï¿½5ï¿½ï¿½U(ï¿½Wj\0ï¿½Eï¿½nï¿½ï¿½ï¿½\\.ï¿½fï¿½/ï¿½6ï¿½)d/Qf\0ï¿½ï¿½Æ­}]ï¿½ï¿½ï¿½ï¿½O{wï¿½ï¿½<ï¿½:zS\0ï¿½Aï¿½ï¿½×·ï¿½pSï¿½ï¿½ï¿½^ï¿½ï¿½Þ½{ï¿½ï¿½\0ï¿½ï¿½mï¿½|uï¿½ï¿½ï¿½ï¿½ï¿½*ï¿½p?ï¿½ï¿½_ï¿½vq\\Ì½X,ï¿½W^\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½-ï¿½ï¿½ï¿½Vï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½/~ï¿½:ï¿½ï¿½T^\0ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½ï¿½ï¿½ï¿½\rÚ¶6ï¿½ï¿½ï¿½=ï¿½ï¿½i\n\0ï¿½tï¿½n+HkwGï¿½oSï¿½ï¿½ï¿½\0ï¿½;ï¿½wßï¿½ÚŸï¿½Qï¿½ hw>pï¿½ï¿½Bï¿½nï¿½ï¿½ï¿½\0Aï¿½sï¿½ï¿½+Aï¿½Æ’2\0\rï¿½jH.ï¿½Å¯ï¿½w+3ï¿½uï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½fï¿½;ï¿½ï¿½[ï¿½í…ž\0\Z)p;ï¿½mï¿½ï¿½É–ï¿½ï¿½;ï¿½ï¿½=yï¿½.ï¿½\0ï¿½%pï¿½vï¿½pï¿½ï¿½gï¿½ï¿½ï¿½Yï¿½\0ï¿½~,ï¿½6ï¿½xï¿½ï¿½ï¿½%ï¿½:ï¿½,h`ï¿½3ï¿½ï¿½ï¿½ï¿½ï¿½cï¿½ï¿½Sï¿½8ï¿½ï¿½ï¿½pï¿½ï¿½ï¿½ï¿½ï¿½sO/<\0\r7ï¿½Ý•ï¿½ï¿½\0ï¿½ï¿½3ÜYRnï¿½ï¿½d(\0ï¿½mï¿½ï¿½vï¿½Wï¿½@ï¿½ï¿½ï¿½ï¿½ï¿½\0{ï¿½ï¿½kï¿½ï¿½ï¿½P\0Pgm3ï¿½ï¿½=\\ï¿½\0ï¿½ï¿½655eï¿½\0rT\r[\0@ï¿½ï¿½ï¿½\0ï¿½-\0[\0ï¿½\0ï¿½ï¿½\0a\0ï¿½\0ï¿½\0 l\0a\0ï¿½\0ï¿½-\0 l@ï¿½ï¿½ï¿½\0ï¿½-\0[\0ï¿½\0ï¿½ï¿½\0a\0[\0ï¿½\0 l\0a\0ï¿½\0ï¿½-\0 l@ï¿½\0ï¿½\0ï¿½-\0[\0@ï¿½ï¿½ï¿½\0a\0[\0ï¿½\0 l\0a\0ï¿½\0ï¿½\0 l@ï¿½\0ï¿½\0ï¿½-\0[\0@ï¿½ï¿½ï¿½\0ï¿½-\0[\0ï¿½\0ï¿½ï¿½\0a\0ï¿½\0ï¿½\0 l@ï¿½\0ï¿½\0ï¿½-\0 l@ï¿½ï¿½ï¿½\0ï¿½-\0[\0ï¿½\0ï¿½ï¿½\0a\0[\0ï¿½\0 l\0a\0ï¿½\0ï¿½-\0 l@ï¿½ï¿½ï¿½\0ï¿½-\0[\0@ï¿½ï¿½ï¿½\0a\0[\0ï¿½\0 l\0a\0ï¿½\0ï¿½\0 l@ï¿½\0ï¿½\0ï¿½-\0[\0@ï¿½ï¿½ï¿½\0a\0[\0ï¿½\0ï¿½ï¿½\0a\0ï¿½\0ï¿½\0 l@ï¿½\0ï¿½\0ï¿½-\0 l@ï¿½ï¿½ï¿½\0ï¿½-\0[\0ï¿½\0ï¿½ï¿½\0a\0ï¿½\0ï¿½\0 l\0a\0ï¿½\0ï¿½-\0 l@ï¿½ï¿½ï¿½\0ï¿½-\0[\0@ï¿½ï¿½ï¿½\0a\0[\0ï¿½\0 l\0a\0ï¿½\0ï¿½-\0 l@ï¿½\0ï¿½\0rï¿½%ï¿½;hï¿½T\n\0v?l[vï¿½ï¿½bqï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½Êž={ï¿½J\0ï¿½ï¿½ï¿½T*]ï¿½B\0Pï¿½ï¿½ï¿½Ú±ï¿½Ufï¿½\0ï¿½ï¿½ï¿½Ö±Z\0ï¿½ï¿½fV\09J3ï¿½~5a;ZE\0 ï¿½ï¿½mï¿½Ø­Y-\0ï¿½Ajï¿½`Sï¿½Y}ï¿½Ïº-ï¿½ï¿½nHï¿½ï¿½ï¿½fï¿½ï¿½ï¿½+Z[[R5\0ï¿½	_ï¿½ï¿½W?ï¿½tz\nï¿½ï¿½;ï¿½{Tï¿½Û€6ï¿½Å…ï¿½ï¿½ï¿½\0Û˜É¦ï¿½ï¿½ï¿½B6Û•ï¿½ï¿½Fï¿½mï¿½\05zï¿½ï¿½}tï¿½ï¿½ï¿½ï¿½24ï¿½Mï¿½4){ï¿½á‡³Å‹gk×®ï¿½Bï¿½.]ï¿½4ï¿½7o^ï¿½ï¿½ï¿½}/2dï¿½Ö¶q\\S(ï¿½ï¿½ï¿½\04ï¿½8Ë¸ï¿½ï¿½ycmPï¿½}ï¿½Ù• Ý°aCï¿½ï¿½ï¿½ÏŸï¿½ï¿½\Z5jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\04|ï¿½ï¿½.ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½]\nï¿½-Mï¿½<9kmmï¿½\0ï¿½ï¿½q\nï¿½Mï¿½Kï¿½ï¿½>ï¿½lV/ï¿½ï¿½Rvï¿½gn6Ãµï¿½@Cï¿½ï¿½ï¿½jï¿½ï¿½Fï¿½ï¿½1ï¿½zï¿½ï¿½Wï¿½qï¿½IS\04ï¿½8ï¿½vï¿½^3Ú­ï¿½pï¿½XR~Tï¿½ï¿½ï¿½ï¿½}ï¿½ï¿½ï¿½iï¿½mï¿½ï¿½nï¿½ï¿½ï¿½Xï¿½ï¿½,\0Ð­Å†ï¿½gï¿½_ï¿½>ï¿½ï¿½È‘#kï¿½ï¿½z\0ï¿½ï¿½Xmï¿½ï¿½Pï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½oï¿½ï¿½Tjï¿½l\0ï¿½-ï¿½[pjOï¿½Ú“ï¿½ï¿½ï¿½Ú/b/eï¿½\0ï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kï¿½ï¿½tï¿½M7mï¿½ï¿½ï¿½gï¿½ï¿½\Zï¿½ï¿½ï¿½/ï¿½`ï¿½Hï¿½d]ï¿½ï¿½ï¿½ï¿½gï¿½n)ï¿½\\ï¿½ï¿½ï¿½ï¿½_ï¿½Cï¿½6ï¿½w[{y>ï¿½\0ï¿½ufï¿½xmï¿½(ï¿½ï¿½jï¿½gï¿½nï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½ï¿½cï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0ï¿½sï¿½zï¿½-\0ï¿½)ï¿½(/ï¿½[;H}ï¿½k_ï¿½ï¿½\0ï¿½_ï¿½ï¿½Kï¿½\09ï¿½kï¿½ï¿½^ï¿½ï¿½#fï¿½ï¿½Fï¿½rï¿½\0\ZG\\ï¿½6ï¿½ï¿½&×³ï¿½|gï¿½ï¿½\'J577gï¿½>ï¿½l.Aï¿½ï¿½K/e\'ï¿½tRmï¿½>ï¿½ï¿½\04ï¿½ï¿½ï¿½Öƒï¿½ï¿½ï¿½Ú“ï¿½ï¿½}ï¿½ï¿½~_ï¿½gï¿½Qï¿½|ï¿½&~ï¿½ï¿½ï¿½0\nï¿½ï¿½Wjï¿½ï¿½#pï¿½5Ãmmï¿½ï¿½Ï‰ï¿½ï¿½ï¿½\04bï¿½ï¿½ï¿½\rï¿½XRï¿½cï¿½{rï¿½Tï¿½ï¿½bï¿½8fï¿½ï¿½U\0ï¿½[ï¿½qï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½=cÆŒï¿½,dï¿½ï¿½\nZ\0ï¿½uï¿½~ï¿½ï¿½nï¿½ï¿½rï¿½45gÎœï¿½^ï¿½m/ï¿½ï¿½8&ï¿½;Cï¿½nXQ{ï¿½ï¿½ï¿½1\0Ôˆï¿½ï¿½jï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½\0`ï¿½}ï¿½iVï¿½Xï¿½NS;ï¿½bgï¿½Ø°ï¿½\\.I`\'ï¿½ÖŽÕ½ï¿½cï¿½ï¿½ï¿½ï¿½ï¿½|5ï¿½.ï¿½ï¿½ï¿½ï¿½mï¿½\0\0\0\0\0\0\0\0\0\0\0\0\0\0@gï¿½ï¿½ï¿½<ï¿½ï¿½KGï¿½ï¿½\0\0\0\0IENDï¿½B`ï¿½',1),('72502',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn','72501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\"/>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('72503',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','72501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"MM\" type=\"string\" value=\"MarketingManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"QM\" type=\"string\" value=\"QualityManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('72504',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','72501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\" activiti:candidateGroups=\"STAFF\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('72505',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.myProcess_1.png','72501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0=IDATx\Ú\í\Ý\\u™?n\nAñ².Z*EY.E¹ReQ¨e±\å\"†µ\Ö5ZY1\Éô™\î\ÉÀhK¸W…’\"•dQt1‹þ€Z`ED pB„r!!\nˆ	w˜@B„@n“Ëœÿû\í\íÉ¿If’ždfº\Ï\ÌóT½uzº{&“wºû\Ó\ï9§\Ï\Ùk/\0\0\0`ˆM½p^\ÞW\r\Ö\í\0À„÷Î®\Û\Ó\Û\0\á\r\0\Â[x€ð\Þ\0 ¼€mAkos\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0h\ryž\ï\çwþ\æ\â‹/^;kÖ¬žoû\ÛyWWW\Þ\ÞÞžwvv\æ\ßúÖ·òiÓ¦mš9s\æKgœqÆ¿\é\04\É\Ë/¿\Üqõ\ÕW¿ñ\Ío~3Ÿ2eJþ‹_ü\"ÿý\ïŸ/_¾<ß°aCžlÚ´)_¹reþ\àƒ\æ\×\\sM~\Ê)§ä§vZ\Ï\ÙgŸ}o¹\\>@`x&\í\æÍ›·úô\ÓO\Ïc\Ò\Î}ô\ÑjH7jñ\â\ÅyL\éù	\'œÇ”>SG`ˆ§\íÿ÷ÿþ_\ÏÔ©SóE‹\å{\â\É\'Ÿ\Ì\Ï8\ãŒü\ä“O~¥««k\Ý€Aö\æ›ož1mÚ´ü\Â/\Ì\ßx\ã|0¤\Õ\ë\é\çzê©¯[\0ƒ<q§\à>ÿüóó-[¶\äƒ\í’K.Iø_ÇŒ³ŸnÀJÛ¸Óªò4!Ep÷ú\éOšOš4\éE€=”vNKÛ¸kUù\ÎV¡Ÿr\Ê)=\åryª®ÀnJ«\Ë\Ó^\åiò\ávb\ë\è\è\Øjû7\0\ì¦ô9\îôq°\áôý\ïS{{û­º\0”Žœ–À2\\Sw¯\'žx\"\É{³\×\0`€fÏžý\Ûtä´¡\ÜI­?]]][³,;Á_\0 «<ò´~ò“Ÿ¬ooo_\à¯\0\0N2’ŽU\Þ÷\ßÿ–\ï¥þ\n\00\0\é\ì`\é$#Í°zõ\êž\ïn\0€t:\ÏÞ³ƒ\r·t¢“tJQ\0€ž\Í$¼`€Ž?þøfN\Þ=\Â\0\è\ßþ\íßš¶\Í{\åÊ•›ló€š>}zw³ö6¿ó\Î;W\Ú\Û\0\è\Üs\Ï}±YŸóž6m\Ú\nŸó€:\ãŒ3¾v\Ê)§4\åk\éð¨Ž°\0»\à[‡û\Ø\æ.L«\Ì\Û\0v\Ç9\çœs÷ü\ãa\r\ïO<q…³ŠÀn\ê\ê\ê\Úÿ\ßøF\Ï\âÅ‹‡%¸ÿð‡?¬NS·óyÀ8\í´Ó¦~ú\éùo¼1¤Á½~ýú­•JeS÷T]€=t\Ê)§,ÿ\ÉO~2”;¯õÄ¿±2Ë²\çu\0A\Úy,&ð\Õ_|ñPx\Ï\ÙgŸý—ô¹î´š^·`ü\ÄO\\ùŸÿùŸùºu\ëmUù©§žšvP[j;7\0Q€wvv>\ÒI\'õ<ò\È#{¼sZ\ÚÆV•›¸`ˆ¥\Ê&Mš´eúô\é›SˆdUúC=´*mC¯\íUn\ç4\0.iZŽ©ùú4=w\Üq=³f\ÍZ\Ï=÷lY±b\Å\Öt>î¤»»»\'dä®»\îZyšŽœ–B;}Ž\Ûjr\0h¢\ãÎ¨9Q/F ¯O§ó¬«\î´M;ja:\ä©#§@k‡zOgg\çÁ:\0\Å	\ïM¥R\é\0€\â„÷\Ú\ï\ãu\0\n¢\\.¯ŽðþžN\0@q&\ï´Û…:\0\Å	\ï\Ç\"¼¥\0Pœðþ]„÷l\0€‚(—Ë·D=¤\0P¥R\é\ç\ÞO\ë\0D{{ûyQ\Ëu\0\n\"Ë²\Ó#¼_\×	\0(ˆR©tl„÷\0€‚hkkûT„÷\0€\â„÷ûÓ™\Åt\0\n$…w:÷·N\0@q\Â{k\Ô\'t\0\n\"Ë²i\Ç5\0€\âLÞ¯Gª\0Pœð^žÖ¢\0Pœð~&&U\'\0  Ò‰I\"¼o\Ö	\0(\Î\ä=\'\ZT\'\0  *•\ÊÿDx?¦\0PY–]\áý¢N\0@q&\ï³\Ë\åòj\0€‚(•J\Ç\Ç\ä½V\'\0 8\á}L„÷&\0€‚È²\ì£\Þ=:\01cÆŒ}Ò™\Å\ÒR7\0  \Ò\ä\Ý\Ù\Ùy°N\0@q\Â{S\Úö­\0Pœð^›ö:\×	\0(ˆô9\ï\ï\ï\é\0gò~1iM\'\0 8\áýX„÷¯t\0ŠÞ¿‹ðž­\0P\årù–t^o\0€‚(•J?ð~Z\'\0  \Ú\Û\ÛÏ‹Z®\0PY–\áýºN\0@A”J¥c#¼7\è\0D[[Û§\"¼·\è\0\'¼ßŸ\Î,¦\0P )¼»ººö\×	\0(Nxoú„N\0@AdY¶1í¸¦\0Pœ\Éûõ¨/—\ËGEŸ5+\ê€ö™\Ô+\"¨_K‹\îIÛ¼·«-cÆŒ\ÙO·\0 DhÂ¹À\ÞV\è\ë\0´\è\Ëw\Þ\'Nü¼.@\ëø›ýL\Ý\Ï\ë\0´ ŽŽŽ¬¯ðN\Û\Äu\0ZTL\ÙOnÞ›\í¨\0­Þ‡D`\×\ïm>_W\0 Å•\Ë\å›zÃ»££\ã\Ó:\0-.­&\àÞ”&p\Ý\0€‚ˆ\à¾@x@<\Ï÷{þù\ç—.\\¸0Ÿ;wn>{ölµ5gÎœü\Þ{\ïí‰ºÄ£\n€!•‚{Á‚ùÊ•+ó\î\înµµjÕª|þüù=\ä³<²\02i\âÜƒ\à1‰w{d0dÒªr¡;¸•V£{d0dR\Ð\\\á\rÀïµ¯/ÏŸðù\â9ÿ^­t9]\'¬…7\0-\Þo¾öRþØ\ÓòGnû\î[*]—n\Ø\Â€ï¥‹o\Ù!¸{k\Ù\â[¶ð \Õ\Âû‰»ÿ£\ßðN·	l\á\r@‹…÷c³gô\Þ\é6-¼\Þ\Â\0ö$¼\Ó\Þ\åý…wºM`o\0Z,¼Ÿ¹\ï\â~\Ã;\Ý&°…7\0-Þ¯¾ôhþ\Ø]\Ów\\e×¥\Û¶ð \Å\Â;Õ’‡®\Ú!¼\Óu\ÂZxÐŠ\á½qcþ\Ìý—\ì¸\Ê<®K·	l\á\r@…w:‚\Ú\Ó÷]\Ô\ï6\ït›£¬	o\0Z!¼c¢^þÌ¼ü\Ïwœ\Ýop÷VºOº¯)\\xÐ¤ð\ÞÕ´m\n\Þ\0´Xx72m\ïl\n\Þ\Â€a\ï\Ý\r\î\Þ\Þ\Â€ao%¼\Þ\Â\0„·ð@x+\á\r€ð\Þ\0 ¼…7\0\Â[xo\0„·ð\Þ\0´nx_z\é¥ù\ßÿý\ß\çû\î»ouy\ÅWl»-~ü¶Z¸paõº´¬¿~ûû¥Ÿs\È!‡\äs\ç\Î\Ý\íß©þgo\0„w]]{\íµÕ<\á„ò\r6\ä\'tRõ\ëo¼q‡Pž5kVõºó\Ï?¿\ßðN—Ÿ|ò\É\ê\åC=\Ô\ä\r\0ƒ\ÞGyd5hŸ{\î¹\ê\×K–,©~}ô\ÑG¿%”Sù\Ë_®^—–‡vX¿\á\ÝûušÀ\Ó\åU«V\å\Çw\\þŽw¼#\ç;ß™O˜0!_¶lÙ¶7“&Mª\Þ/\Ý\'}}\Í5×¼\å\çõ÷ý\Â€Q\Þ)`÷\Únõtú:…d}(O™2¥\Zž\ëÖ­«~Oúº¿ð~øá‡«—?üð\ê\×]]]Õ¯\Óõ‹-ª^þ—ù—ü\å—_®^>è ƒª÷;ø\àƒ«_/]ºô-?¯¿\ï\Þ\0\ï>¦\æ\Þ½\á†ª\Ë\éÓ§W—7\ÝtS¿Û¼Sq\ÄÛ¶‘§\Ð\ßþöt]º\í\ãÿxõ\ë»ï¾»ºLýöovöý\Â€Q\Þ)d÷ª­6ÿ\êW¿º-”\Ógõ!š&î·½\ímù‡?ü\áj°§¯û›¼O;\í´ü\Ý\ï~w~\Ûm·½%|\Ó6õ\íÿý\Þ	þ+_ùJu™¶¹÷\Þ}}³\Â{ò\ä\É•\Ë\å)\í\í\í\×z0¬\á}ù\å—o\Í.¸`[h¦Ò¶Ñ´<]3f\Ì·\Õ_N!›\Âÿ}\ï{_ux¥R©\Þö\ßÿý\ß\ÛV©ö³Ÿ­Þ·w¢\ï]p\Ýu\×\íðóvöýýý{\í\á\Þ\êÛ‡w\n\ëR©tf„õÚ¯\Å2¯\ÕR@\0†5¼S¥\Ð>ðÀ«“õ\'?ù\É\êö\îÞŸY‚3gÎ¬^þÁ~°Ë°\ì\à#ðò+VT·[§Ÿ›¦è´½ú\Å_¬\ÞoÍš5\Õ7\Ý7-\Ó\Îi\Ûÿ¼}ÿP…÷o~ó›Ì—G=a½©.¬\ßRY–\Ý\áÀ°‡÷öu\Ï=÷TCw´ eýúõ\Õ=\àû\ìúš8q\â\ç=hzx«\îüÿ÷S8\ßÕ³“ð\Þ\ê\Ñ€ðn±ƒ´ttt|:Bz\íNV›¯Œš].—§Ž7\î\0\ï8\ÂZó\Ô+ú\ï?\Æm?L;±E€¿Q»nm\\~8jV¥R9Â£\0\á\ÝÄŠ¥P®\ï\Üõ·wuu\í_ûø\Ø\íq\ßQi•û\æX>Ÿ>Ra>~ÆŒûx\Ä ¼‡ñs\ÞÀ—\ÔÂ»gÌ˜1û\í\âO³w\ÜÿKq\ß+#ÔŸŽew-\ÐWE\Í)•J\ß\ê\ì\ìüG0€ðVC|–\à\Ò4½;«ø¾C\"¸Ï‹0ÿCÔ¶U\íqùO\æ\Ä\åOxDo5GXk`\ên\ÈØ±c\ß¡}r\Ôo#¸—§=\ØÓªöó%ô¿Š\Ë­jÞªÅm¡ý…óŸGp?•Vµ§Uô\æ«\ãúyqù;i:z\0\á­Zø\Ä$]]]«T*\çFp/ŒZS[Õ¾.\Â|QùO\Ó\Ç\Ù<\0„·ðná³Šµµµ½\'\ÂûQ·F½Ü»ª=ê…¨\ë\"Ì³¸\Ï\Û=3\0„·ðna1ÿs:{L\ãO\Ærcm¯ö\ÕQw§ªŒ?þ@\Ï\0\á-¼[X„÷G£f\ÖVµ¿^;\Ì\ëút¢•¸þ\ÂX\é™ ¼…w;ñ\Ä\ßýõ˜\ÂoŽ\åKµU\í[¢^Œ©ý†XV¬j\ÞÂ»\ÅESøeÜÇ²wUû«\æ÷\Äm\ß;\î¸\ã>\ì\Ù0D\æÎ+p…÷\ë\ì\ì<¸R©L\0¿/‚üµ\ÞU\íqùÏ±¼xÒ¤IŸñl$,Øºr\åJ¡;HµlÙ²#¼»Gû\ã*­j)ükÜ¿‰\0_—{Wµÿ%.5¾ž4X«u\æÍ›w\Þüùó{^yå•–Æ7¶|pÏ™3gs\Ô,¬E`.‚üÒ¨\Å\àj\Óù_£î©ý\ìX~D—\0\Za33¦Åµiuo«\Ö]w\ÝU=W+ÿŽi\âÜ›<yòAñ7=\'jAû_kažBý±øÿ*•JG\ë@Á¥ðN\ÇóÖ‰‘)­F¿qg„ö¯#Ì—\ÖV³§Z\Z_\ß\×oU;@Á¤=š\í\Å<ºDh•¦ð4÷®j\ë\Òq¿‹š–¦w]h\íò­&L8T\'F¯ôæ­¶}ü\Þ\Úöò\êªö´=mOO\Û\Õu	 …¤U¨N¤A½´\Z=í¹žö`¯\íÉ¾%½\ÉK{¸§=\Ý\Ó\ïi\Ïwh^xoJ\Ñ	v&}¦<}¶<üÑ¨tX×ž\Úg\Ï\ïKŸEOŸI\×%€\á\ïñ\âû` Ò‰U\â±sV\Ôüt¸\Ú\Ñ\à6F=“ù\Ï&Nœøy]ºð^—Ž£­\ì‰tö\ír„øõ\éø\ìµ=\Ú\ÓAd^Š«o‰\ëOH§N\Õ)€A/ªo¤sQ\ëCð\Æð\È\Ú\Ó©A­§vFµ…\ék\éLkº°\ÒG„¢¦\ê\ÃðX; \Ë<\Ó<Û¼wU{\íœç—§s \ë@c“÷ªô1!`¸Í˜1cŸŽŽŽ,‚ûº¨¢6×Ž\×þrÔ­iU\í\0}ˆ\È\åQ\ç\é­ \ÂúS\à?‰\Ç\ä¢xc™ö\ÇH‡ð]“Vµ\Çõ\ß\ï\ê\êú˜.Â»½ý/\é\ÅR\'hEŠ\Ç\ç·\ãq:7­%ª\r®;–O\ÅòŠû/\ê0\Z\Ãû¹t- Òªöx\ÌNŒ\Ç\ì¯\"¼—¤Uíµ½Ú—\Ç×·•J¥“«ñ\Ò\ÎBñ¢÷K Ào@?¡}A<Žÿ—×¦U\íqù¨?¤MBÿŒ\Äð~4\í0¤Œ\ãÆû@„ù·\âq=\'jUm¯ö\îó§cye¥RùR\ÜmoŠ\Þ¦ƒh\è#UZ\Õ=>‚ûÚ´™(8zÔŠ¸|{<þ§tuu\í¯S@a¤cSGÝ¥Œ&\æGDý8û\ì]\Õõfz3\Ëutt¦K@+O\Þóbò¸G\'\Í\Ú\Ú\Ú\Þ¡}Fz#Ï‰•µ½\Ú7\ÅòÙ¨«J¥Ò¸½¬jZhò¾=}†V\'\à-öN\'\ì‰\ç\Æ\Õ\â)À7\Õ\ïúJÔð§§À\×& )\â…é¦´—®NÀ\ÎE`<\êüx¾<”V±§U\í\Îk4kò¾6^\ëø¹“;|+\Ð¥R\é\ç\é#4:\ï´]ü\0\0šñtq\Ô€‡·ÓšM‘>./@\Ët\Þ[\ÓG\Îtv\Ü3\Ó´:~\îlž4i\Ògtv¥R\é\Ì\ïWu<ywG€A\'€f¼\0\ZõºNÀ€Ÿ;\â\Í\ï±:»r¹üµtxH€‡÷º¨ŠN\0\Ã.Ë²¶xZ¯0\à\ç\Îñ\Üù†N\0Ã®­­\í‹1}w\ë8¼_K\ÇC\×	`\ØEp/@›uü\ÜY]*•¾§À°KŸSMŸW\Õ	˜xÞ¬Hµ\Ô	`Ø¥#D¥#E\é8¼_J\'*\Ñ	`\Øuvv~(`A\'`À\áýB\ÔE:»¶¶¶·oØ­ð~¶\\.ÿL\'€f½¥S¾]\'`@Ï›Ç£®\Ö	 i\á=nÜ¸\è\èyóH–e\×\ëÐ¬¡ž\Î\ÎÎƒu\ZW.—*•J7\ëÐ¬!§6„¿\é½?\êN\0šõ\"´9¬E\'`@Ï›ùQw\ëÐ¬É»;&U\'`@\á}gš¾uhÖ‹Ð†¨‰:z\Ó{K–e\êÐ¬ð^[*•Ž\×	Px\ß\á½H\'€f…÷š¨Suô¼¹:}\Ö[\'€f½½\Z“÷™:z\Þ\\õŒN\0\Ízz%j†NÀ€ž7¥\ã›\ëÐ¬!gG‚ªT*?Ž\ç\Í2\0š\ÞÎŽ\ïs#¼W\è\Ð\årù\éR©ôs€\Æ\Ås\æ{ñ\ÜY­@S\Äô°8&\ïkuô¦wj\Ôk:4\ëE\èO1EüZ\' qñ†÷ñ\Æ÷\r\0š5yÿ>ü6€½\éÏu:4k‚¸7j®N@\ã*•\Êøtha\0š\ÞwEÝ§Ð¸˜º¿Ï›n\0š\Â	`·ž7G¥\Ó\é\êÐ¬	\âúxzD\' q•J\åˆx\Þl\Õ	 )\âèª¨\'t\Z\×\Õ\Õõ±x\ãÛ£@³&\ï\Ë\"¼Ÿ\Ó	h\Üøñ\ãŒ\çðš£\\.ÿ$^„þ¢Ð¸¶¶¶÷\Äó&\×	 )\âè¼¨\åµ ? \íˆ3aÂ„\Ãu†f\Êó|¿\çŸ~\éÂ…ó¹s\ç\æ³g\Ïn¹J\áÝŠ¿W}Í™3\'¿÷\Þ{{¢.ñ¨‚\âN\ÙdY¶>\í%›v¶I/>ý\Ô|Ý¢™Rp/X° _¹re\Þ\ÝÝ­ö V­Z•ÏŸ?¿\'‚|–Gw\Ò^°“\ÐN\Õ3yò\äƒtŠfJ·\à\Ü\0I\Ü\çÒ¡\È\Ów\ÔÎ¦\ît‰fK«Ê…\î\àVZ\î‘\Åð›ú\ï,\Ë\Ñ!š-À\ÞÀv\Ów_Û¼#¸\ÖŠ\Þk__ž?ÿ\à/ò\Åsþ½Z\érºNXo‘*•\Ê%Û‡wGGG¦3%¼\ß|\í¥ü±;§\å\ÜöÝ·Tº.\Ý&°…7ŒHµ=\Ï{\Ã{©ŽP¤ð^ºø–‚»·–-¾U`o™\Ê\åò\Ô\ÞðN—u„\"…÷wÿG¿\án\Ø\ÂFòôýF\íHQ>F¡\Âû±\Ù3ú\r\ït›À\Þ0bMœ8q\Ú1\Ç“žÔ©f\ê\Â[x­\ï¬}÷\Ý7=©Óž\æ=œ¢„wÚ»¼¿ðN·	l\á\r#Õ™\Ûö9œ¢„÷3÷]\Üox§\Û¶ð†\ÑÜ»ºZ*¼_}\é\Ñü±»¦\ï¸\Ê<®K·	l\á\r£%¸·¿ý­¢U\Ã;Õ’‡®\Ú!¼\Óu\ÂZx\Ãh\î^V¡\Ó\Ú\á½qcþ\Ìý—\ì¸\Ê<®K·	l\á\r£-¸\ë|«	œV\ïtµ§ï»¨\ßm\Þ\é6GY\Þ0\Zƒ»þû¶šÀi‰ðŽ‰zù3óò?\ßqv¿Á\Ý[\é>é¾¦p\á\r£-¸·ÿ~8M\ï]MÛ¦p\á\r#9¸÷ŽúYm¹3\Û\ß\Ï6pš\ZÞL\Û;›Â…·ð†\"÷S{ý\ß\ÑÔž\ÚI€÷w?8M\ï\Ý\r\î\Þ\Þ\ÂŠ\Ü{\Õ&é¼®ú\nðú\à\î­\Ëvñs¡!cÆŒ\Ùow\Ã[	oÁ\Ý_0\×ø®n\ïe:»¥½½½;K^xo ±\à\ÞU€\ï\Ó`p\×ÿ;öBg \á\Ý{\n\ÚMY–]\Ø\ß$.¼…7\î\Æ¼{\0Á½}€\ÛÎ€Â»·\"À\×G\Í\Þ\Âwcú\nðw/«\Ð\Ù\íð®«µQ\ço\á\r£\ÉAµ\Ð]<À\ïÛ§‰»»vý@Ü±“\å\Þ\êÙ®¶nW[jµ¹V›Òª\ÕÚ²;–kµ!Uš\Øb™¦¶uµþ7S\Å}ßˆåš¨\×\ã¶\×\â\ë¿\Æ\åWS\Å\åÕ±\\×¯Œ\å+±\\\Ë\åQ/\Õji\Ô_¢^Œz!\î¿$–\Ï\Åò\ÙX>õT|Ï“±|\"–‹cùX,ÿ\ËG¢\Å\å‡cù\ÇX>\ßó‡¸¼°V÷E-ˆ\ë\î‰\åü¸}^,\ç\Ärv,ïŒº½T*ý6–·\Æò\æ¸\ßMqù\ÆX\Þ\Ë\ë\â~¿Š\åµQW\Çu¿Œº\"\î÷óXþ,n»4\ê¿â¶‹\Ój\è¸\î\'q\Û•J\å\ÇqÝ¢Î‹ë¾Ÿ¦Û¸nz\n\ÈXžË³¢¾÷ýV\Ü>5n?=–S\â\ë“\ãúoD}=.\ËÎ¨JGGGË‰ñ½ã£¾—¿\Ë/\Å÷}a\âÄ‰Ÿ\ïý\\\Üÿ\èI“&}&n;²­­\íS±üÄ„	\ï=,–‡vuu}lW“ô÷ŒŸs®ð\Þ0\Ú&\ïFWaö\äý\Ãô=ñ¢ýö´3–\ï‰\ëýÇ÷\Î\Î\Î?þÀxqþH\\>8^ ?\ZuHzQ\å\Ç#Ž¨½\Ø_ÿCÁQ)j¡ð\Ïq\ÛSXÄ‹ú¸¨cSˆ¤0)ÿŸIµùz|\ï	ñõI)„R\Åug¤pª…Ô™Qß«…W\n±±<7…[\n¹¸ÿùQ³RøEý4®»(…b-/‹¯/O¡™\Â3._\ËkR¨\Æ\ÏøŸX^_\Ûº¿‰\å-µ0¾=nKolîª…u\n\í»k!¾ \êwQ÷§€¯…ý±|¨ö& ½Hõh\íMBz³ðx\í\Í\ÃSq¿§cùl\í\ÍEz“±¤ö¦\ã/ñõÒ¸ß²\Ú’\åµZQ{Ó’Þ¼¬Š\å\ê\Úš¿F½–\Þ\ì¤7=qyM\ÜþF\í\Í\Ð\ÚZ­«½Y\ê}\ã\ÔûF*½©\ê\î}“•\Þt\Åm›\ëÞˆm‰Ûªo\Î\Ò2n\ëi\àMÞ¶¸\Â¬:\ßup\ï\Î6\ï\ÞcŸ[e\Î­6Oo \Ò\Z\0«Í…7ðÆƒ{w÷6wÀö4¼W¥5%\Û\ßo \á\Ý\Ï\Z¤\êm<ð@þ\Ù\Ï~6\Ç;Þ‘¿ó\ï\Ìÿñÿ1¿\ï¾ûvy[#ÿÞžjýÏ¹\çž{ò£>Zx\Ã(ð¾ö¬\Ïyw\îe/sö,¼\Óþý\Ýow\'\ï¾BõC©^÷è£\æ?üpõòG>ò‘]\Þ6\á=\Ô?SxCñœ\Ó\Çd<˜GX›¥\Å\ìFx/Mû-\ì\ê~ƒ\Þi¢N\×=ù\ä“;\Üg·mÿ³\ê¿\î½|\Â	\'T\ÆG±\ígô\Þö\ÉO~2\ßw\ß}ó¿ù›¿É§OŸžõ«_­Nøp@~\Í5×¼\å¾\éú\í\×o\ÝøP\Û\\p3¤3¼\Ï?ÿü\êu\ï~÷»ó)S¦T§\ìFnk$¼o¾ù\æj¥Ë½«¼{o»ñ\Æó%K–lûú†nÈŸy\æ™\ê\å÷½\ï}ýþL“7P?\×øe{5vV±úûù<7…\ïTi;vWWW5¤\Ó\í)´wu[#\á½aÃ†jõNÏ»ú¾¶ðúšÀ÷dµ\à¦\Ð\á\Ý[K—.}K\Ð\îì¶†wZ}.¼¡žÀü‚›Â†÷¡‡Z½.\íYþ\ÐCU/§\Õvu\Û?øÁ\ê×=öX~\Ûm·õ´i\Ûõ­·\ÞZ½<v\ì\Ø=\n\ï\Þ\ÉÍš5\Û\Þf\Èo(ö> \Ü>¼-Z´\í\ã`o{\ÛÛª[¸p\á.o»ò\Ê+ó¿ýÛ¿­N\ÔS§N\í3@O:\é¤\êNi‡~xu{öž„÷W\\Q\Ýž~ô¦@x\ÛO\à¬B\ï\Ü\Ë\Îi,¼•ð†\Ñ<÷n#\Üo\á\r Àûú|8o\á\r´X€ŸSÜŽœ†ð\Þ@‹ë´\ç\ïõÿŸ„·ðZ}OÇ›\Üo\á\rH\n\ït.n@xo X\áý@xo X\áý~@xo 8\á\ÝS.—\Ð	„·ð\n\"Ë²žÉ“\'¤o\á\r(¼»ºº>¦o\á\rD{{ûÖŽŽŽ\Ãt\á-¼…w\Ô\'t\á-¼\â„÷–¨#u\á-¼\â„÷\ær¹|”N\Ð\n\æÎ+p…7\Ð@xo*•J\Ç\è­`Á‚[W®\\)t©–-[öb„w·GŒ01uw·µµ}Q\'hó\æ\Í;oþüù=¯¼òŠð„\àž3g\Î\æ¨YY0ò&\ï1y\Ó	ZE„\ÍÌ˜×¦Õ½­XW^yežŽLØª¿_]un¹á½¡R©Œ\×	hø9³¦v6>€\æÈ²l}GGG¦°k\åryj\n\îTqyŠŽ\0Íš\"\ÖFu\ê4öf·7¼£–\êÐ¬ð~3\ê\ë:»\îYuÁ]­R©t¬\Î\0Ã®\\.¿u’NÀNŸ\'Dm\Ý>¼£\Ð “÷\ë1Qœ®°\Óð¾©\à®V<\Ñ!`¸_”þZ*•¾¥\Ðÿ\Ô];Œp\ÞO™¾aŸ¼_ð>S\' \ß\çÈ‚wªžÉ“\'¤SÀ°É²lU¥R9[\' ß©;}\"có.|¾n\Ã9U¼5C\' \á@ÿZ\nôt¹££\ã\Ó\é\Ä>&L8\\g€\á\ï\åñ\âó}€Æ”J¥“\ã9³F\'€f†÷KQ?\Ò	hxòž\ZõšN\0\Í|!Z\Z“\Ä:\rO\Þß‹\ç\Íj\0š9y¿˜eÙ…:\r?gf¤}Eth\æ\ä½$\Âû¿t\Z\ï¥\ÍM:43¼Ÿð¾L\' \á\ç\ÌO\"¼ÿ¢@3§ˆ§\â\Å\è\n€Æ¤5Ui•N\0\Í\ï\'¢®\Ò	hL©Túy„÷\Ó:4sŠX\á}­N@\Ãox¯Žz\\\'€f¾=~½N@\Ãox¯O\Ï\0š¦\\.ÿ©T*ýZ\' \á7¼¿‰ú£N\0\Í\ï‡\"¼o\Ö	hø9s[Lß¿\×	 ™/Dˆðþ­N@Ã“÷œtšP\0šùBtÔ:\r¿\á½\'&\ïy:43¼¤IB\' \á\ç\ÌBoxf¿Íº[\' 11u?\Ó÷-:43¼m¿ƒ=gEÝ¨@3_ˆ\îLÛ½u\Zž¼\Øh.{¿\á}*\êJ\0šÞ·¤mx:\r?gœ‰h®ttµt”5€†\'\ï#¼/\Ô	 i§üœYV©T~¬@3_ˆ~\áý˜N@\ÃÏ™\Þ\ç\ê\Ð4µ\Ó>¡\ÐðsfU\Ô9:4M¹\\¾\"\í=«\Ðpx¿\Zõ\0š\Þ?‹¢gu\Z\ï×£N\Õ	 i*•\Ê%Y–=¯\Ðpx¿Ï™thšô‘—ô\Ñ€†\Ã{]TE\'€¦)•J”\Ë\å¥:\r‡÷†J¥2^\'€fN\Þ\çÇ‹\ÑK:\r‡ww„÷—th\æ\ÑyQ\Ëu\Z~\Îl*—ËŸ\Ó	 ™/D3¢^\Ñ	hø9³%\êH\0šùBtN:\è„N@\ÃÏ™­&L8\\\'€f¾µZ\' \á\çLO–e\Õ	 iJ¥Ò·\Ê\åò_u\Z\ïñ\ã\Ç¨@\Ó\Äqz:b”N@\Ãá;ö½:4sò>9&\ï5:‡÷Œ3ö\Ñ	 ™“÷	\ép:»–B;…·N\0Íž\":£\Ö\ê\ìZWW\×þ\Âhºrˆ£õ:»–vTK;¬\é\Ð\ì\É{b:V³N@C“÷Ç²,\Þ@s•J¥q\Þuv-œ¥\\.o\Õ	 ©\Ú\ÚÚ¾/F\Ý:»–‹šª@SMœ8ñóÞ›\Ò\å´3N\\>ª££\ã\Ó:;*•JÇ¤“\è0¬\"œ_‹Ÿ\Íi\Õ_\Úk¶ŸzF§`G\éT é” :wxÿr\'¡]­4}\ë\ì\Èž@SŒ3f¿4y÷\ÜY–-\Ö%\è÷\Í\ï¤xŽ¬\Ó	 ¥¦oS7ô\Ï	fO\ß\Ý}„÷RÝ†·ù\0M}š\Ù\Ç\Ô=Eg ñ<ùNÔ«:4ó…hM]x{A‚]?g¦E­\Ò	 ibÒžZ7uO\Õ\Ø\ås\æûñ|Y®@KL\ß:»V©T~œe\Ù2\0šªT*}OxC\Ãov/ŠzA\'`\Ëó|¿\çŸ~\éÂ…ó¹s\ç\æ³g\Ïn\É*—\Ë-û»¥š3gN~\ï½÷öD]\âQE3\Å\Ô}Y<_ž\Õ	ÁRp/X° _¹re\Þ\ÝÝ­ö V­Z•ÏŸ?¿\'‚|–GMœ¼¯ŒzJ\'`K·\à\Ü\0I\Üq¥i\æ\äý«\ï\ÇtF°´ª\\\èn¥\Õ\èY4qò¾1j‘NÀ–‚F\à\noFTx\ß\Zõ€N€ð\Î×¾¾<þÁ_\ä‹\çü{µ\Ò\åt°Þ´\\x\ßu¿NÀ(\ï7_{)\ì\Îiù#·}÷-•®K·	l\áM\ëÈ²l^¹\\¾G\'`”‡÷\ÒÅ·\ìÜ½µlñ­[x\ÓZ“÷\ï\"Àg\ëŒòð~\â\îÿ\è7¼\Óm[x\ÓR“÷\ïcò¾M\'`”‡÷c³gô\Þ\é6-¼i©ð~8\Âû&\0\á-¼…7\Å	\ïG\Û\ÛÛ¯\Ó	\å\áö.\ï/¼\Óm[x\Ó:\"¸ºZ\'`”‡÷3÷]\Üox§\Û¶ð¦¥\Âû™¨\ËuFyx¿úÒ£ùcwM\ßq•y\\—n\ØÂ›\ÖQ.——dYö_:£<¼S-y\èª\Â;]\'¬…7-\ÞKK¥\Ò:£=¼7nÌŸ¹ÿ’W™\Çu\é6-¼i\í\í\í/G€ÿP\'`‡w:‚\Ú\Ó÷]\Ô\ï6\ït›£¬	oZ*¼_‰š¡0\Z\Ã;&\ê\å\Ï\Ì\Ëÿ|\Ç\Ùýwo¥û¤ûšÂ…7-Þ«£\Î\Ò	eá½«i\Û.¼i]\årùµ¨©:£,¼™¶w6…o\áMS\ÃûR©t²NÀ(\ï\Ý\r\î\Þ\ÞÂ›\æioo_\á}¼NÀ(o%¼)®,\Ë\Öwttd:\Â[	oŠ3yoŒ\É{œN€ðVÂ›\â„÷¦r¹ü\Ï:\Â[	oŠÞ›#¼\Ò	\ÞJxSœð\Þõ	\0á­„7S÷\Ö	&ª ¼•ð¦8“wO\ÔGt„·\Þ\'¼óq\ã\Æ}@\'@x¿¥\â\Ûú¬\ío[¸paõº´\Üþ~½uø\á‡o»~É’%\Â!¼O<ñ\Äw\éï†xÁ>kÖ¬\êu\çŸ~Ÿ\áý\ÐC½\åúK/½Tx\Ãnš1c\Æ>\årù&“7\ï\Ý\ïC=4ÿò—¿\\½.-;\ì°\î\ÆgT¿\î\ê\êª.K¥\Ò?\'\Ýö\Îw¾³:¡?ù\ä“\r\ßvô\ÑG\çŸþô§«×½ú\ê«ùI\'T½\ï;\ÞñŽü\ä“O\Î×¬Y#¼1²,ûB÷šX¾Ï£ct„÷n…÷”)SªA¹nÝº|\ß}÷­~]ÿ\r6\äü\àó<0_±bEõú®\éúúŸs\ã7\æ7\ß|sõò?ý\Ó?5|\ÛÜ¹só—_~¹z]\n\îtÝµ\×^›\ßp\Ã\r\Õ\Ë)À…7E\×\Ö\Ööö˜´o\Ú\Zu]\\µ·®€ð\Þ\íð\î\r\É\éÓ§W—7\Ýt\Ó[îŸ‚7]>ë¬³ª_ò“Ÿ¬~\Ýûûô\Þ7…yªt9½\Èm½¿Sº­¿ûoŠ*\Âú\ËQoFý\ÕAY@xJx§‰ûmo{[þ\á¸:y§¯\ë\ï?nÜ¸>wz\ë\ró¾:M\æ\ÞVÿ;¥Û¶¿ÿ»\ßýn\áMa§\í,\Ë\îHŸçŽºÆ´\r\Â{\Ð\Â;]NÛ\Ó\å1cÆ¼å¶´š<ûW¿ú\Õm\ßw\ÅWTo;\âˆ#\Þrß«®º*¿õ\Ö[«—{·¡7r[ý\ïÔ»M½~µyZ¿ýýû»,¼i¥R\é\Øt\Ê\Ï\í\Õ\àÿ # ¼=¼gÎœY½üƒü\à-·]t\ÑE\Õ\å´iÓ¶}_\Ú\á¬÷ö_|q\Û\å´m:}\Úù¬÷£d\ÜVÿ;¥\ÖN8\á„\êªòT)¸{wX\ÞA¼\Þ/B{Nš¶cy¥Ž€ðnÉ[\í,<÷$X}TŒ¢‰	»-{},Wvtt|ZG€–\r\ï\Þ)y ·	oFŠt •\íùiOò˜¸¦#@Ë‡·ƒ´0šE`W¢6D-¯T*G\è ¼…7-ª­­\í=Ø¿K\Óv–eÿ¥#€ðÞ´°R©t|ö\Æ\î—bùq„·ð¦Euuu\í½°ö¹\íŸ\ê ¼…7-,BûQ\ÝQ™0aÂ¡:o\áM‹jkk{L\Ù¥mÛ•J\å\Ç:o\áM‹Ðž¡½)jIWW\×\Çt\ÞÂ›•Î±½(jK\Ôy:o\áM‹°>#M\Û1u?\Û\Ù\Ùy°Ž\0\Â[xÓ¢\"¬È²\ìÏµi{†Ž\0\Â[x\Ó\Ú\Óöw¢6G=õ„·ð¦E?þÀ\ë\ÇSpW*•³u\ÞÂ›–Âº6m?~\Üq\Ç}XG€!1w\î\\+¼\ÙCiµxmõx\n\î\ï\è0¤,X°u\åÊ•BwjÙ²e/Fxw{dªi{z\Ú!-í˜–vP\Ó`\ÈÍ›7\ï¼ùó\ç÷¼ò\Ê+-Œ7nlù\àž3g\Î\æ¨YY#_ú\ÈWú\èW\í#`SuV63cZ\\›V÷¶j\Ýu\×]y¼H\æ­ü;¦‰[p\Öß¯}ükQ:øŠŽ\0ô#…w:“N\Ð,\ép¦é°¦µi{ŠŽ\0\ìB–e=“\'O>H\'h\Ò\ã\ïüt\"‘tB‘tbhlòNg`:B\'N\éTé”µSw~CG\0Þ›K¥\Ò\Ñ:Áp‰)û\'Q[c\êþ½M6\0»\Þ#¼\Ç\éC-\Âú\ãñx{)=\æ\"¼¿¦#\0»\Þ\ë\â…t’N0Ä³‹\Ó&š¨ûÆŽû^\Ø\Ükbò>Y\'\niŠ\ì\åQ¢*:08Ñ«\Þg\êƒ-Ë²\Ëj{’\ßs\â‰\'¾KG\0/¼WÄ‹\ìL`°´µµ}*S+£\ÖGµ\éÀ ‹©hiL\Þ\èƒôfðÊ´\'y,\çŽ3f?š\Û\çb:ºT\'\Øñú‡\í\ÕñxZo\Õ€¡\r\ïÇ£®\Ö	v\Ó\Þ\Ú\×Ô¦\í;\Û\Ú\ÚÞ®%\0CÞ‹¢n\Ô	*û¨´\ÃcÔ›Q_\Ö€\á\ï…Q·\ë™¶\ã1s]Ú“¼T*ýÖ´\r0ü\á=?\ên \Ö\ÇdYöZL\ÝoDhQG\0šÞ·§\é[\'Ø™3f\ìÁý\ë\ÚQ\Ò~“¾\Ö€\æMR¿Ž)\êO:A\âññ\Ï\Øk¢^Ÿ8q\â\çu ù“÷\Õis ¯i;‚û–\ÚQ\Ònˆ«ö\Ö€a/\Ì\Ï\êõ*•Ê—\Ò^\äñ\Øø«S\Æ´˜ttµt”5 I{Ž§ý jŸÛ¾Ö´\rÐšÖ¹\éø\æ:A<¾’ŽµzÒ¤IŸ\Ñ€Ö¼\ÏL\ÚÐ‰\Ñ+ƒ<Ë²\ÙiÚŽú¥Ž\0´¸x±ž’\Î\é­£S¼q›µ.jUGGÇ§u \á=)¦®u:1º¤ók§ƒó\Ô>·}¹Ž\0H©T\Z/\ÞubT½a+\Ç\ß|}\Ú\×!\ê:P¼ò\Ï\Åø&ù\Ú\Ú\Ú\Þ\ëiÚ®T*—\è@AÅ‹ø\é\Å\\\'F¶øwFmˆzyÂ„	‡\ë@uvv/\è=:12;ö½µ3\ÇmÍ²\ìBºººöö\\\'F\ä´ýõ´?C\ÔÒŽŽŽ\Ãt`\ä\Ø[x\È7dÔ¦\íY:02\'´<½\à\ëDñ•J¥“\ã\ï\Ùõb÷!:0BÅ‹|\Ï\äÉ“Ò‰\â\Z7n\Ü\â\ïøp„ö–r¹üCù“wú\è\Ð:Q\Ø7_§G`oŠ\åóQ\Õ€\ÑÞ›ö±x:;;?»GÒ´¡=SG\0FWxoLGZÓ‰\âˆIû\Û\éMW\Ô36y\0Œ\Îð^—Žq®­oüøñÆ”½¸\Ü\ç\èÀ\è\âÖ¤½”u¢\å\ßdÁ½9\ê\É\ãŽ;\î\Ã:0ºC\á\Õt^ohM)¨S`×¦\í³t€\Þ+\ìðÔ²›iµ\Ò§U\æ:@U¹\\^\Z“÷:\Ñ:\ÒNhig´tÆ·ø\Û|KG\0\Ø~º{.&»Ku¢5T*•sk\Óö¢ôq0 ¯ð~<\êjh®t€•r¹¼¤vÀ•\Óu€…÷¢¨u¢©ƒ¥i;\ê\éP§:À®‚#\ïùvhÊ´}H:‰HL\Û\ÝQ\'\é\0†÷ü¨»ubx¥#°·FýÁY\Ý\0hxßž¦o‡\ÅÄ½,–6\ê\ë:À\îL€¿Ž\é\ïO:1,o”.Jgq‹º\ìØ±\ï\Õ\0v7P®N{œ\ë\ÄÐ™0a\Â\á\Ñ\ã\åQ¢:u€=’e\Ùe1y?«C\Ö\ßKk\Óö½mmm\ï\Ñ\0öXmÇ©¥:1¸\"¨?ýJ\ÔúŽŽŽLG\04µ#z­Ð‰A}Côó´\'yL\ÝóN<ñ\Äw\é\0ƒ4g¦3‹\éÄž‹>µ*#=\Þ\×\0†DLˆS\Ò9½ubƒûª4m\Çò®1c\Æ\ì§#\0exOÊ²lN\ìžI“&}&­¹ˆZ[*•\Æ\é\0C.N:`ˆN\Ø\Þñ¦\çWiOòxt[[[\ÛÛµ€áš¼?—\Î­\ëY\Ôk\ÞoT*•/\é\0\Ã*\Â\çˆ4=\êDc\Óv„ö\r©_¥R\é\æ3f\ì£%\0»\Î\ÎÎƒ#Œztb\ç&Nœøù\è\Ó\ëQk\"ÀÿYG\0hštF«¤\\\'ú–¦\ë\è\ÏojGIK\ç=\ß[W\0h¶½…w\ß\Ú\ÚÚ¾˜¶k§\í\Ûi;·Ž\0\Ð2Rx;§ô[Bû\í¥R\é·iÚ®T*ÿc\Ú \å\Ät\Ù3yò\äƒtb\ÛG\çÖ¦\ÏnÇ´}”Ž\0Ðª“wš0\Í=HGEKGG«%\íj\n\0Z=¼7\Ç\Äyôhýÿ§ã§£\ÌE¥\ã’\é@\Â{\ãh<´g:\ãW:óWš¶£®ðH\0 H\á½.\ã|4ýŸ\Ó9¶\Ãút\Î\ít\îm\0\n%U,&\ï“G\Ãÿ5‚ú=\Ø÷¦\íüÞ—ù\ëP\Ô\Éû\Õt^\ïQð&eRü_7D-\í;\èPüð^S\èÌ‘úÿ;v\ì{\ãÿx\í(iû‹0&Ò¥1y_0Bÿo_K;\äÅ›“e‡ùk0R&\ï\ç\"\Ü.Iÿ§tÄ¸\î?¤=\ÉG\ê\0Fwx?>’L}RTwüŸ^Œ7%‡ø0\Ã{Q\íŒY…\Ö\Ö\Ööþøü1jKÔüe\É\á½0\êö‚ÿNi{SÔ’˜¶?\ê¯\nÀH\ïùQwñw\ï\ì\ìüP„uZs°¥R©œ\ë¯	Àh	\ï\Û\Óô]´ß»T*}+~\ïMQ\Ï:+\Z\0£J„\à¯\Ë\åòŸŠòû\Æ\ïz@öcµi{º¿ \0£qò¾:\íq^7\Zg¦³ E=õ=\0F¥tŒ\ï˜fŸM—\Ó\ê\ç¸|T«}\Ä\ê¸\ãŽûp„õñ{¥Ó—~\Ï_\r€Q£££\ã\Ói¯\ì4½Fö\Ä2\ï§.o¡5\ç\Ô~\ß\Å\ãÇ?\Ð_€\Ñ8i?¿“\Ð\ÎS¸3f¿fÿžµµ\0O§\àŽ\å·ý\å\0\Õ\Ó÷\Î\Â;\Âýúxƒ13\í\ËG\Ó\ÇÁü\Õ\00}g\Ù\Ãý„÷\Öt\\ðfý^\Ô§c­\×>v†¿\0Ô¤UÒµSdn\Þ4\ëw*—\Ë?L\Óvú\ØÚ¸q\ã>\à¯\0;N\ß\×÷±½û¨\áþ=b\ÒÿXü\Û/Du—J¥“ýe\0 i§´ðõu\áýb\Þ@\ÌJk\0bù`:±ˆ¿\n\0\ì:</\ì\r\ï˜z®wÂ„	‡Æ”¿4þÝñ;œ\à/\0ð7Sx\ç†î´½}\áØ±c\ß\ë/\0\0÷ôñ\ã\ÇyxÇ´}xöK\Þ\ã\ß<^\ç`÷•\Â{\æPý•J\å’\Ú\Þ\í¿kkk{–À\î;3ª\'\ê\á\ÚrP<\Âú1i¯ˆ\å†r\Ðn\0œ\à\î\r\ìs3À\Óñ\Ñk\Óö\Ý\'žxâ»´\07¸wu}\Ãj‡_]•>†6Q«`\è‚{û\Û\Ï\è.—Ë¿L{’gY6»Nn\0£!¸{\rhz„õ?Ä”½:jm¥RùŠ6Àðw}€o\Ý\Å¾wöµµ\Ïm\ß\Þ\Ö\Öövm€\æwý÷m\í\ëûJ¥\Ò\Ñ\Øz3¦\í/i1\04?¸·ÿþ\Þ	|\ï\ÚIM¶\Æ\Ä}ËŒ3ö\Ñb\0º\à\Þ;\êgµ\å\Îl¿\ê6ð¿û»¿»*Bûõ\í5\à_\Ð^\0ú\à~j¯ÿ;š\ÚS;	ð>\ï÷®w½kÆ¿þ\ë¿\æŸû\Ü\ç›¶`\èƒ{¯\Ú$\×U_^Ü½uY\ï)À÷\Z‚#±€\à\î;`û\n\æú\0\ß\Õ\í½õHl\0 ¸w¬ýô>\rwý¿³U€À\Ð÷\Î¼{\0Á½}€Ÿ£õ\00tÁ½³\0Hp÷²\n\0v\ÃAµ\Ð]<À\ïÛ§‰»»vý@\ÜQûÞƒü)\0`\à“w£«°{òþ¡?\0\ì~€\×6\ï\ÞcŸ[e\0C\àƒ¹·ùn6\0\è;Xû\Ú|°>\çÝ¹—½\Ì`Ð\Ó\Çd¼\ÇGX«›¸gi1\0\Í>h\Ç6\Ü\00¼x}€_¶Wcg«¿Ÿ\ÏsÀ0O\à{²Zp@L\à	~Á\r\0MœÀÄ‚\0Zdodz\ç^vN€\ÂL\à½\Û\È7\0 Àûú|8\0\Ðb>­.¸9\r\0ZÜ´,\Ë\ÒÁX\æ\ï\å\ì`\0\Ðú\Ú\Ú\Ú\Þ_\ï\\p@Dp´½½=M\Ü\é\0còþT„÷\0€‚˜8q\â\ç\Ë\åò&\0€‚¨T*\ãcòÞ \0P1u-\Â{­N\0@ADpŸ‘e\Ùk:\0\Å	\ïs¢V\é\0\'¼õ’N\0@q\Âû\â¨%:\0\Å	\ï+£ž\Ò	\0(ˆ,Ë®zT\'\0  J¥\Òocò~@\'\0 8“÷¼\ï{u\0\n\"‚{aÔ:\0Q.—ÿu“N\0@q&\ï\Ç#¼¯\Ñ	\0(Nx?—e\Ùe:\0\Å	ï¥¥R\é\0€\â„÷Š˜¼g\ê\0\'¼_úŽN\0@A”\Ë\å7¢N\Ò	\0(\Î\ä½>Â»¬\0Pœð\î®T*_\Ò	\0(ˆ,\Ë6Oš4\é3:\0Å™¼·vtt¦\0Pœð\î?~ü:\0\Å	\ï|Ì˜1û\é\0@\n\í\Þ:\0‘V—§\Õ\æ:\0‘vTK;¬\é\0DúˆXú¨˜N\0@A¤ƒ³¤ƒ´\è\0D:,j:<ªN\0@q\Âû¤tb\0€‚H§M§\Õ	\0(ˆ,\ËfFx¯\Ð	\0(ˆR©tA¹\\^ª\0Pœ\Éû²\ïgu\0\n\"‚ûšð\Å:\0\Å	\ï›\"¼\Ö	\0(ˆööö;£\î\×	\0(Nx\ß5W\'\0 8\áý@Ô­:\0‘eÙ£\Þ\×\é\0gò~ª\\._¡\0Pœð~!\ê\"\0€\â„÷\Ë1yÿP\'\0  ²,[U©T\Î\Ö	\0(\Î\äýzø\é:\0\Å	ïµ¥R\éx\0€\â„÷†\ïcu\0ŠÞ›\"¼\Ñ	\0(Nxo‰ú„N\0@qÂ»§³³ó`\0€\â„w\Þ\ÕÕµ¿N\0@1\ì\Â;-µ\0\n ­­\íýµð\0Š Ë²¦m\Þ:\0Å™¼?•ö6\×	\0(ˆ‰\'~¾\\.o\Ò	\0(ˆJ¥2>aM\'\0  b\êþZ:¶¹N\0@ADpŸ‘e\Ùk:\0\Å	\ïs¢V\é\0\'¼õ’N\0@q\Âû\â¨%:\0\Å	\ï+£ž\Ò	\0(ˆ,Ë®zT\'\0  J¥\Òocò~@\'\0 8“÷¼\ï{u\0\n\"‚{aÔ:\0Q.—ÿu“N\0@q&\ï\Ç#¼¯\Ñ	\0(Nx?—e\Ùe:\0\Å	ï¥¥R\é\0€\â„÷Š˜¼g\ê\0\'¼_úŽN\0@A”\Ë\å7¢N\Ò	\0(\Î\ä½>Â»¬\0Pœð\î®T*_\Ò	\0(ˆ,\Ë6Oš4\é3:\0Å™¼·vtt¦\0Pœð\î?~ü:\0\Å	\ï|Ì˜1û\é\0@\n\í\Þ:\0‘V—§\Õ\æ:\0‘vTK;¬\é\0DúˆXú¨˜N\0@A¤ƒ³¤ƒ´\è\0D:,j:<ªN\0@q\Âû¤tb\0€‚H§M§\Õ	\0(ˆ,\ËfFx¯\Ð	\0(ˆR©tA¹\\^ª\0Pœ\Éû²\ïgu\0\n\"‚ûšð\Å:\0\Å	\ï›\"¼\Ö	\0(ˆööö;£\î\×	\0(Nx\ß5W\'\0 8\áý@Ô­:\0‘eÙ£\Þ\×\é\0´ É“\'T.—ŠÀ>¤nò~*®»Bw\0 5§\ì#¬ó~ª\'jsªðº\0-\"þs\'ž\Ê\Ñ\Ö\0 •\ÄTýË…·©\0ZÌ˜1cö‹\Þ\ÒWpgYö¤@Š ž\Ó\×6\ïú\Ù\0€’Bºðž¯3\0\Ð\Ú\Ó÷3uÁ½©««k]€6q\â\Ä\Ï\×m\ë¾IG\0 \Ó÷Š\Ú\æ‡\ê\0´˜\Ú^\æ\çD-ˆZ\Õ\Ç\ç½\Ó\è¯F-¬T*—X\0M2aÂ„\Ã\Ó\ÎhÈ›vqp–\í?\ï½5Ë²\Å>÷\r\0\Ã8iGø\Þ¡$´û©…&q\0Big´˜˜7l\ÂS¦L\É/»\ì²ü÷¿ÿ}þ\ÒK/\å6lÈ“´\\¹reþ\Ç?þ1ÿ\å/™O:µ¯¸¬/•J\Ç\ê.\0²\Ù:::¶\Ö\ïw¿û\Ýj0oÙ²%oÔ¢E‹ò³\Ï>»¯¹\Ì\Ôe\0\Ä\à®_M!ž\ßz\ë­\n\í\í\Ýq\ÇyWW\×öS¸\0€=•V•Gp÷Ô¯\"ú\é§óÁð\Â/ä§Ÿ~ú[&p«\Ð`¤\Ó\ê·q§\àNÛ°Súyõž¶Û‰\r\0vSÚ«¼~Uù`M\Ü}M\àÛ­B@÷`€\Ò\ç¸\ë·s§m\ÜC)m¯\ßþV\×û+\0À\0¤°\Ô\ïU¾iÓ¦|¨u\ÖYõ«\Ïû+\0@ƒÒ¶\îú#§¥ƒ\r‡G}ô-Gb‹:À_\0\Z>²U¿“Úž|$l \êä’Ž…\î¯\0\r¨d¤\Z —_~y>œ®¹æš·>\Õ_\0\Z\ïU½šy:œ\Ò*úºU\ç¯ùk\0@\"4·m\ï^¾|ù°†wú\Üwý\éDý5\0 ±\É{[€öždd¸¤¯þ\ß÷\×\0€†w3o\00yÀ\Èf›7\0oò¶·9\0,¼}\Î\0Š$&\Þ6\ëk\ßü\æ7a\r\0*\Û<movls\0(tN\íú³Š\r\Çô}ö\Ùg;«\0\ì®t>\ï\Ñ\çó€bM\ß\Ûv\\\ë\è\èÈŸ~ú\é!	\î^x!?þø\ã\ë\Ãû\Ý€\Ý\Ð\ÕÕµ–e\ë\ëw^KŸ\Ã\ì\ÏuŸv\Úiõ«\Ë×§W÷`7•J¥c\ëWŸ§\0¬	<M\ÜõÁþô\ï\é:\0\ìy€ŸY\àiz\Ú¾\';±¥m\ÜÛ­*OS÷L\Ý€!\nðÞ½\Ð-Z4\àƒM›6\í-¡~®\à€¡	ðcë·×¯JOGb{ðÁ«\ÇB\ï=™IZ¦m\Ú)\àÓ‘\Ó\êÀR¿Ûªr\0Big²ú½\Ð÷°°s\Z\0“ô9ð˜š®?[#•Žœ–ÀR©T¾¤‹\0\Ð\éPªµc¡§i|Uý\éD\ësúZ:\ÉH:V¹Cž\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÐ¤a\ák,uS\0\0\0\0IEND®B`‚',1),('72506',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png','72501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0f\ÃIDATx\Ú\ì½	pUÇ™°m;ûdõ\Ôd\\)OÊ•ú\ÊC¥\\v¾Jù«,6SS\É8ž€u\îÕŽv!‰}5!0\Ø,f9C€CÀ`0V„16‹³Æ²Q\0!„\è¿\ßW\ßEh¹›–s\ÎóTu\ÝUW\Ò+>\Ïyû\í\î{\î\0\0\0\0\0\0\0\è¾ü¶j©E\ëu\0\0\0p¸H´õ\\¤¯\0\0\0\"H\0\0\0\0\"\0\0\0ˆ\0\0\0 \0\0\0`{‘`\Ö\0\0\0\0\0\0\0\0@w@)õ½­[·®Ÿ3g\ÎÓ¦M»5d\È•œœ¬bccUBB‚\Z4h*((¸1~üøOóóó1\0\0\0¸\çÂ…qË–-»2`À\0•““£Š‹‹\ÕÞ½{\ÕgŸ}¦\ê\ê\ê”p\ã\Æ\rUUU¥\Þÿ}µ|ùr•­rsso=z·\×\ë}€(\0\0¸\í¼ýö\Û\ÕyyyjÚ´i\êð\á\ÃF‚\å\èÑ£jÎœ9*--M\r2d<\0\0pQbÖ¬Y·¨<¨\"\áøñ\ã*??_eee}žœœü=¢\0\0\à`®^½š_PP ^~ùeu\å\Ê\rdD>¯ÿþg¨\0\0ÀÁ™‘ˆ)S¦¨›7oªh3o\Þ<\ÉLü­W¯^_\'\Ú\0\0\0Bj\"d8C2!~fÎœ©\â\ã\ã+ˆ8\0\0€ƒ\ÂJ©‰ˆ\ÖpF[\Ã\Ù\ÙÙ·¼^\ï@¢\0\0\à\0dHCfg\ÈÌŒ\Î@\n0\ã\â\â\Z©—\0\0\0p\0²N„Lñ\ìL&Nœx#66v#\Ñ\0\0°1²b¥,6\ÕY\Ù?ü±òz½\r^\0\0Ø˜·\Þzk“¬XÙ‘–­‘œœ\ÜhYV\Z\0\0\0›\"{gÈ²\×]ÁŒ3®\Å\Æ\Æ\î\á¯\0\0\0`Sd.\Ù;£+ø\Ë_þrS‹\Ä9þ\n\0\0\06Evñ”\r¸º‚\ê\ê\ê[Z$\êù+\0\0\0\Ø\ÙÜ¿‹gg#›€\É6\äü\0\0\0lŠœÈ»D\0\0À\Æ$%%ueF\â\"\0\0`c\Üe5UUU7¨‘\0\0\0°1\ãÆ«\ïªY[·n­b\Ö\0\0€™0aBEW­#QPPP\É:\0\0\06&???%;;»KV¶”%²Y\Ù\0\0Àþ2\Ñ\Ø\Ù{m”••É°{m\0\0\0Ø1c\Æ\ìœ:uj§ŠDFFF%»\0\08€\ä\ä\äï¥§§\ß:zôh§H\Ä{\ï½W-\Ù¯\×û\0\Ñ\0\0p\0¹¹¹yyy\êÊ•+*×®]kôù|7´D$\ê\0\0\0\";;û³3ftd\á\å-ý=ª,\Ëú„h\0\08)|\Ì\ÍÍ­ž3gNG\ÈÄ­Ñ£GŸ•u#d(…h\0\08T&222ª¦OŸ®jkk£6œÑ¿)®<G]\0\0€d\"!!\á“\Ì\Ì\Ì[‡Š¸°Rj\"d8ƒL\0\0€‹‚\Èøøø›\ãÆk¡e¸cÿþý¥\æ\âö\ì\n+\0\0Üˆd,\ËZ-Y…\Ä\Ä\Ä[Ó¦M»ö\Î;\ïÜ¬¬¬l¼q\ãF\Ó.ž²×¶mÛªe\ÙkY±RBÖ‰`(\0\0\0ZtÛ®[…–‹k²x@«—\Z\Ý\Êd\ÙkV¬\0\0€`\äB!\r\0\0\0¶H\Ä\Ä\Äü3‘\0\0\0€±,\ëVbb\âƒD\0\0\0\Â‰\ä\ä\äŸ	\0\0\0™\Ø\Ø\ØF-?%\0\0\0ŽHÜŒ‹‹û9‘\0\0\0€pD¢Á\ãñ<A$\0\0\0 ‘¨·,\ë7D\0\0\0BFK\ÄuŸ\Ï÷‘\0\0\0€pD\âZ\\\\œE$\0\0\0 dbcc¿¥³‰\0\0\0„ŒeYW´H¤	\0\0\0-\×2‘G$\0\0\0 ‘¸¤\ÛP\"\0\0\0\áˆ\ÄE\Ý\Æ	\0\0\0Ë²*}>\ß\"\0\0\0!û©n/	\0\0\0G$\Îz½\ÞD\0\0\0BFKD¹eYs‰\0\0\0„Lll\ì)\Ý	\0\0\0G$>Ö­„H\0\0\0@8\"q\Ä\çóý‰H\0\0\0@8\"qP·µD\0\0\0BÆ²¬÷½^ïŸ‰\0\0\0„Llll™–‰7‰\0\0\0„#»u\ÛA$\0\0\0 ‘\Ø!2A$\0\0\0 ‘\Ø*\ÃD\0\0\0\Â‰º\í#\0\0\02g\×\ë=@$\0\0\0 dd1*Ë²>\"\0\0\02²<¶,“M$\0\0\0 ‘X,w	\0\0\0Ÿ\Ï7Ï²¬Oˆ\0\0\0„Œ\×\ë[A$\0\0\0 d,Ëš¢E\âS\"\0\0\0!\ãóù&h™¨$\0\0\02±±±ct»H$\0\0\0 ‘ª\Û%\"\0\0\0\áˆD¾eY5D\0\0\0B\Æ\ëõf\êv…H\0\0\0@\Èx<ž¤\Ø\Ø\Ø/nK\Åºýªoß¾\0\0\0¸Ë²®iqhÐ­Q7\ÕJ\ÛE´\0\0\0\à.´$\ìiC ¤\ÝJMM}ˆH\0\0À]\Ü¾h+±(\0\0@[2ñzk\"aYV\"\0\0\0m‰\Ä-\ÕHh‰ø\è\0\0\0@»È®Ÿ\ÍE\"..\Î\"2\0\0\0·gpøE\â\0\0€ ñz½ý\"!÷‰\0\0\0„„eYWD$ˆ\0\0\0„\Ì\í\Ý?	\0\0;ð\Þ{\ïe\æ\ä\ä\Üø÷ÿw\é¸i4\ZAû·û7Õ£GSúþœaÀñ‹_üBý\Ïÿüzÿý÷U]]\0€ðhhhP}ô‘\êÛ·¯úÖ·¾u™\0Ç“››\Û \0\0\Ñ\å7¿ùM£\îf\Ë8Ó€£‘\á\ÉD\0\0@t9zô\è-\Ý\Í\Þ\àLN‡\á\0€@†9n\×M\08[$\0\0 c@$\0‘\0\0\0D \Z\"qO+Sº\Ë\ë\0\0ˆ@7‰¶ž\ë\ê\×\0	\0D‘\0\0D\0‘@$\0\0	@$	\0\0D\0‘\0\0@$\0	D\0	\0ûŠ\Ä=Lÿ\0@$\0\Â	€\Î\âÀjÁ‚j\êÔ©jÈ!*99Y\Å\ÆÆª„„5h\Ð UXX¨^z\é%µs\çN‚ˆ\0\" Ôµk\×ÔŸþô\'5`À\0•““£Š‹‹\ÕÞ½{\ÕgŸ}Ö´Ì7TUU•\Ùhnùò\å*;;[\å\åå©…ªšš\Z‚ˆ\0\"ndÏž=F¦M›¦>l„!XŽ=ª\æÌ™£\Ò\Ò\ÒÔ›o¾I0‘\0@$ÀMYˆY³f©ªƒFôYÇWùùùjØ°aª¶¶–\à\"€H€“‘¬CAAzù\å—Õ•+W¢ò™2\"Ÿ7t\èP†:\0‘\0@$ÀÉ™‘ˆ)S¦¨›7oFýó\çÍ›§¬\ê\ë\ë	6 \0ˆ8\rÎ\ÌAGH„Ÿ™3gš\ÂM\0D\0‘\0!…•R­áŒ¶†9dö\Ç\æÍ›	: \0ˆ8eHCfg\ÈÌŒ\Î@\n0\ã\ãã©—\0D\0‘\0\' \ëD\È\Ï\ÎdÒ¤I¦\0‘\0@$À\æH\ÍBge#ü|üñ\Ç&+A\á% \0ˆ\ØYöZj:²À²5RRRÔŽ;ø#\0\"€H€]‘½3d\Ù\ë®`ö\ì\ÙjÜ¸qü\0‘\0@$À®\È\\²wFWPVVf²!\0ˆ\0\"6Evñ”\r¸º‚\ê\êjS\'€H\0 `Sdpÿ.ž,\Ç-Û \0ˆØ”®>‘#€H\0 `c’’’\ÈH\0\"€H\0„GW\ÖHTUUQ#ˆ\0\"v¦¨¨¨\Ëfm\ìÜ¹“Y€H\0 `gd·Ï®ZG\â\Å_d	@$\0	°3’\È\Î\Îî’•-eXƒ•-‘\0@$À\æt\Å^|ðŠ‹‹c¯\r@$\0	°;K–,1+\\v&C‡e÷O@$\0	pµµµ*##C=z´S³555	\0DœÀ–-[T^^žºr\åJ‡~Ÿk×®™\Õ47o\ÞL\Ð‘\0@$ÀIŒ1BÍ˜1£C/‡\rf„\0‘\0@$ÀaH\á\ãð\á\ÃÕœ9s:D&dº§¬!C)\0ˆ\0\"•	Y\írúô\éQ;\á\Ëp\ÆÈ‘#DPˆ\0\".‰Áƒ«¬¬,u\èÐ¡ˆ>K\n+¥&B†3\ÈD\0\"€H€‹‚\È\Ä\ÄD5~üx#¡w<x\Ð\Ô\\\È\ì\n+‘\0@$À¥HA\n0eJ\Ù)T\î\ïÞ½[UVV6-&%»x\Ê\\²w†\ÔA\È{E d†2\0‘\0@$\0\"\'NT¹¹¹f¸B¶\0÷7‘©;v¬Yöš+‘\0@$\0ZE2^¯—@\0\"€H\0„Î‘#G\Ìð\0\"€H\0„5\Ì!5\0ˆ\0\"2\ë×¯Wiii	\0D t^}õUÕ¿ˆ\0\":³f\Í2[ \0ˆ@\È<ÿüófª\'\0\"€H\0„\Ì\èÑ£Í‚S\0ˆ\0\"2Tó\ç\Ï\'€H\0 \0¡#z­X±‚@\0\"€H\0„N¿~ýØŒ	\0D <d¯½{÷@$\0	€\Ðñù|\êÔ©S	\0D td\Ç\ÏË—/@$\0	€Ð¨««3\"€H\0 \0!sö\ìY¶D\0‘\0>ø@\Å\Ç\Ç@$\0	€\ÐÙ¾}»JII!€H\0 \0¡³zõj•‘‘A \0‘\0@$\0BgÑ¢E*??Ÿ@\0\"€H\0„\Îô\é\ÓÕˆ# \0ˆ@\èŒ?\Þ4\0D\0‘\0™\áÃ‡«—^z‰@\0\"€H\0„N^^ž©“\0@$\0	€‘kÖ¬!€H\0 \0¡“œœlÖ’\0@$\0	€‘U-8@ \0‘\0@$\0BGöÙý6\0	\0D dd\çO\Ù\0‘\0@$\0B¢¦¦†-\Ä‘\0@$\0\Â\ãÔ©S\Ê\çó@$\0	€\Ð)++S				\0D mª««Uqq±Ú¼y³:|ø°:}ú´¹ß¯_?‚ˆ\0\"\Ð>qqq¦&¢y“) ©©©*==]­[·Ž@\"€H\0\ÜÍ¸q\ãZ	“© ’¹\0@$\0	€‡7\Ú‰3f$@$\0	€\Ö4hP‹!E—õõõ	\0D u¶m\ÛÖ¢H\Èó\0ˆ\0\"\Ð.R\\(YYY	\0D 8¦L™r‡H?~œ \0\"€H\0Gmm­™¡!1l\Ø0ˆ\0\"\Z0\"ñ\á‡@$\0	€\àyñ\Å\Õý÷ß¯,\ËRUUU	\0D x‰¸÷\Þ{\Õ\Ï~ö3\åñx\ÔØ±c	\n \0ˆ@ðá—‡¢¢¢; \0ˆ@P\Ñ\Þó\0ˆ\0\"”,ø_Ÿ0aÁD\0‘\0=\ã Af	\0D \ìa‘‰ûî»\Ì \0ˆ \á\Õ>\È×‰L™\0D\0‘\0$\"¢¯\'3ˆ\0\"HDk¯j\ë“š	@$\0	@\"\Â	2€H\0 €DD$\Ñ&@$\0	pD„*s\0\"€H\0‘Hø¿³9\0‘\0@$À\å®H\Ê5€H\0 \à‰†P\Ã€H\0 \àPÎœ9c:Ïž={yˆ–HO=õ”yü\0ˆ\0\"6\ÎH´5\ÌÐ‘‰‘#GòG\0D\0‘\0§o´\'¡\àß‹ƒa\r@$\0	p±L„#\Ï?ÿ<‹S\"€H€SeB2\ãÆ\ë‘X¼x±\êÓ§òx<júô\é\êÈ‘#	\0DœÂ…”\Ï\çS\Ï<óLP2qO+[0@­\\¹R\r\Z4Hy½^¯F­6mÚ¤\ê\ë\ëù#\0\"€H€Ý¨®®V………*66V\r>\ÜHDG\ìµ1dÈ;žollT{ö\ì1\ÃIII\æû\ç\ää¨…ªó\ç\Ïó‡D\0‘€\îLMMš8q¢\ÉH†\àÄ‰M¯³\Î\Ã=Q^/B\äA$¢ÿþF*D.ŠŠŠŒlˆt\0 \0ˆt®^½ª¦L™b\"//O>|¸\ÕLB$+PF²\è”s\Èp‡{\Èð‡_vdXD\0‘\0@$ “©««S3f\Ì0u2„°ÿþ“h\ïö)…™/½ô’JOO7R‘––FÁ& \0ˆtru?w\î\\#ª´´´C¥ £·—Œ›€H\0 \ÐÁH]L¹”­\\Á\ïØ±#\ì\Ïò/\"\Õ\Þ0GIII‹…•ù;R°	ˆ\0\"Q>¹¾ö\Úk*!!A¥¤¤¨Í›7G\ås\Û\Ë4øk*:K\"Z‚‚M@$\0	ˆ€5kÖ¨\Ä\ÄDs]·n]\Ô?¿5™ð\×Rt§+)\ØD\0‘€ Ù¸q£JNN6Y9Qv$\Í7ú\nvØ£«¡`	@$\0š±m\Û6•ššj®¸‹‹‹;-}\ï\Ï@<ùä“¶\ÜÅ“‚M@$\0‘\0W³{÷nse§,X \Z\Z\Z:ýgÌ„ü_\Ú}+p\n6‘\0D\\Ã¾}ûTVV–™\Ê9{ö\ì.¿z>s\æŒ\ãbLÁ&\"€H€\ã8t\è\Ê\Í\Í5!\ãúµµµ¥ `‘\0@$À\Ö?~\\\r8ÐœÀ&Mš¤._¾LPº\n6	\0DlÁ\éÓ§\ÕÐ¡CMj}üøñ\êÒ¥K¥›AÁ&\"€H@·C\Æ\ç¥xQbÌ˜1ª²²’ \Ø\0\n6	\0Dº†‚‚s‘8{ö,A±¹R°‰H\0 \Ð\áÈ…œ`$5.KKË8\n6	\0D¢ŽM\Ê:rR0`€:v\ìAq	l\"\0ˆ„LÛ”“ˆœ@$\í}\àÀ‚\âb(\ØD$\0	:½=g\Î³„,(µw\ï^‚w@Á&\"€HÀ]\È\Ò\Õr\"¥¬%•½k\×.‚AAÁ&\"€H¸üê²¤¤Ä¤ªûõë§¶n\ÝJP ¢Œ›ˆ\0\"\áV­Z¥\Í\ä†\rD\n6	\0DÂ¬_¿\ÞÈƒH\Ä\êÕ«	t\nl\"\0ˆ„\ÍÙ²e‹¾\\†3¿†®‚‚MD\0‘°R8))e)¤\\´h\Ý\n6	\0D¢RVV¦233\ÍT\ÎW^y…ô1Ø‚¶\n6\Ù‘\0D:Y<J®\ì¤ž1c†Y\\\nÀ®lJ¶\Â\íÿÏˆ \Ða\ÈòÕ²Œµ„,k-\Ë[8\ÉF\Èÿ6	D	ˆ2§N2iI\'+\ãÊ¤Á‰”——#ˆ M***Ôˆ#LºW¶ö®ªª\"(\àX:dj&	D	ˆ\Ê\ÊJõ\ÜsÏ™«³Q£F1]\\Á»\ï¾k\Ö>A$	@$ Lª««\Õøñ\ãMbØ°a&\Õ\à6oÞ¬RSS	D	)šœ4iR\Ó4¸\ãÇp²\n«LgF$	@$ HdšÛ´i\Ó\Ì:¹¹¹fŒÀ­,]º\Ôˆ\"ˆ´ƒ,\È3k\Ö,#\Ù\Ù\Ùjß¾}\\Ïœ9s\Ì\ì$D‘\0DZ¡¡¡AÍ›7\Ï,e‘‘aŠ\Ë\0\Ü\È\éÓ§\ÍÊ¬2Œ\'M\äz\êÔ©fµKD‘\0Dš!{	›©mRL¶}ûv‚®FVg•¢â–šˆ¶´””µc\ÇD\0‘p7+V¬P			*99\Ù\ì/\0\0ÿ@vmM&¤‰x»qÿD	0¬]»\ÖÌ‰—]\å>\0Ü‰l\ÒÕ–H\È\ëm\0 ®C\æ\ÂKJV²¯½ö\Z[$´\'-I„d+\Ü\n\"ˆ„K‘±Ü´´43¶»xñb ,XÐ¢H¸y&\"ˆ„M“þ¶m\Û\"þœ\Ò\ÒR3C¦rÎ;×•cº\0\áRSScb”ˆ‘#Gº:&ˆ 6Á\ßi‰P„S¾ÿ~³„\ÄÌ™3U]]g€0U]EB¦†\"\0ˆ„mD\Â\ß\Ò\ÓÓƒ\ÊP>|X\å\çç›«(™÷~õ\êU\Î\0 \â\à?e³:·ƒH\0\"aS‘\ÌP´$\'Nœ0û`ˆ@Lœ8Ñ¤d :\ä\å\å™\ã\ï¯ý+\"H\0\"ao‘\ÌPÈGEE…Ù‰Sž7nœÙ¡\0¢‹¬r)\Ç‚ŽH\0\"gÏž5‰œ¸\ßz\ë-ZMV\ËÜ½{·:u\êg%\àØ²ñ±…H\0\"FG·g\ÏUUUef<\Ð\Âo/^T»v\íR\'Ož\ä\n[6=¶	@$\ÂHi\Ò\ÑE·\Ãs\ãþÀ±\å”c‘\0D\"D\äÀ¤“Šn“t,\0Ç–=-D‰‘“\n‘€\èÃ±…H\0 í‹¿¦>y¿X\Ý^dšÜ—\ç\è\Ü	\à\ØB$\0‰6\ÛÕšOÕ‘­\ê\Ð\Ã\îhòœ¼F‡H\0\Ç\"€H´\Ú\Îýó]¿?º‘‘\0Ž-D\0‘h½}¼ó\ÅV;;y‘\0Ž-D\0‘hµy«°\Õ\ÎN^£ƒC$€c‘\0@$\è\ì	\à\ØB$	@$¢\ß\ÙI%yk¼F‡H\0\Ç\"€H´\ÚN•\Îiµ³“\×\è\à	\à\ØB$\0‰VÛ¥O«#\Û\ÆÝz\Õ\Ï\Éktpˆpl!\0ˆD›­|\É]<G\ç†H\0\Ç\"€H´Ý®_W§þ2\ï\îÔ«~N^£ƒC$€c‘\0@$Z]y\ïd\é\ìV\Çq\å5V\àC$€c‘\0@$\îºRú\ì\Ô\Û\ê£7G·\Ú\Ñù›¼G\Þ\Ë\"[ˆ\0\"\Ñ\î•WPˆpl!\0ˆD«]0WJm]A\Ñ\Ù!À±…H\0¸X$\Â\í\èü\Î‘\0Ž-D€bK\Z\"[ˆ\0\"Ag‡H\0\"Á±…H\0 tv€Hpl!\0ˆ 4D\0‘ !À±…H\0 tvˆ [ˆ tvˆ [ˆ\0\"Agˆ\r‘\0p™H\Ü>ðL+++3\Ï\Ém\àó\á¾\ï+_ùŠ\êÑ£‡Ú±cG\Ä?\"v‰ùó\ç«ÿø\Ç\æxÛ¥K—Ftü\Ùñ¸B$\0\\\"Ó¦M3\ÏM™2¥ÍŽ,˜÷\Éý\ãÇ›û?ü0WM\àJ‘X±b…9\Ò\Ò\ÒT]]\Ê\Ì\Ì4×®]\ëª\ã\n‘\0pHH§ô»\ßý\Î<\'·={öl±#ö}Ÿ/WPrÿ\âÅ‹*11Q}\ík_S\ßø\Æ7Tß¾}\Õùó\ç›:\Ûøøxó>y<^¾|9	°µH<þø\ã\æÿ÷ô\é\Ó\æqyy¹yü\ÄO¸\ê¸B$\0\\ 999¦#ª­­5”<n©#ö}rÿ\Ã?4÷y\äó899\Ù<–\ç<h\î?õ\ÔS\êÂ…\æþC=d\Þ÷£ý\È<>w\î\"¶	9Fšÿÿ\Êc9\á»\é¸B$\0\\ kÖ¬1·\ãÆ3·¯¿þz‹Y°\ïó·G}´i\ìW:\Ê\æ¯\Ësò\ÚOúSóx\çÎ\æV®È¨‘\0§Š„?›\à–\ã\n‘\0pHÈ•Ð—¾ô%õ\àƒšNN·Ô‘û>¹Ÿ››«¾ù\Íoª7\Þx\ãŽOÆŠ›ÿþ+°gžy\Æ\Ü\ÊX2\"v	9\áû‡6þð‡?4	‚Kº\é¸B$\0\\ r_\Æm\å~¯^½\îz-œ÷I\Ç&\æý÷\ßoÒ©>ŸÏ¼¶p\áÂ¦ô\ì¯ýkó^ÿ™ÿ\nnÕªUm~v[\ãÇˆt‘X¼xq\Ó	ü¥—^jú_•‚J7Wˆ€KDbüøñ\æþó\Ï?\ßf§\ìû¤ù¯À<ª¬¬4\ã¹2>,WQ2Ž[QQa\ÞwùòesE&\ï•[) C$À\î\"!M\â?øù¿þ\Ù\Ï~fþÿýŸ\ï–\ã\n‘\0p°H\Ð	\è\Üc\ëw\Þ1À±…H\0 tv€H\Ð	\0D‚†H\0\Ç\"€H\Ð	\à\ØB$\0	:;D	Ž-D\0‘ ³D‚†H\0 tv€H\Ð	\0D‚†H\0\Ç\"€H\Ð\Ù!€Hpl!€H\Ð\Ù!€Hpl!\0ˆ 4D\0‘ !À±…H\0 4D8¶	\0D‚\Î‘\0D‚cËµ\"¡•¯ò\É\'\ç\Ê\Ê\ÊÔŽ;L\ìh¡·\íÛ·«Ý»w\ß\Òm\"Ag‡H\0\"Á±\å\Z‘‰Ø³gªªª\â\'\Âvñ\âEµk×®[Z*¦!- ¦\Ê?\n\"Ñ‡c‘\èJ$DDW&ôÿ_=\"\Ñkt[ee¥9\0pl\Ùó\ØrŠH ²#²ˆDœ>}ZR6\êó\Ï?\ï\ÖÀ\ë×¯Û¦£;yò$gQ°Í±e‡c¬3-§ˆCkˆD§‰„¿\Ã{ûí·»m±Ë¶mÛ”\×\ë5·Ý¹(‰\0»[Ç˜\Ï\ç\ë¶\ÇXg[n‰/þþ™ú\äýbut{‘ir_žC	Gqùòe#\0\Ðq\È1VSS\ãú8¸I$®\Ö|ªŽl-P‡\ÞvG“\ç\ä5\ä‘p.\\@$\0:A$***	‰Ä¹£¾K\"ü\íüÑ\È\"\áNœ8¡\â\â\â\è\é:9\Æ:„H¸H$>\Þùb«\"!¯!ˆ„cø\àƒT||<==@’””¤\Þ}÷]D\ÂE\"q\ä­\ÂVEB^C	\Ç [bb\"==@Ò¯_?µe\ËD‘@$	\ç±u\ëV\Ó\É@Ç‘™™©V¯^H¸H$d–Fk\"!¯!ˆ„cX·nJKK£§\è@rssUqq1\"\á\"‘8U:§U‘×D\Â1,_¾\\\å\ä\ä\Ð\Ót ƒVs\æ\ÌA$\\$—>=¬Žlw÷°†~N^C	Ç°d\É•——GOÐŒ=ZM:‘pÙ‚T\åûK\î	yq@$…\\%\r2„ž ?~¼***B$\Ü$×¯«S™w÷°†~®\Þ\Û ˆD\ÐL›6M9’ž ‘l„d%	wˆ„¬\\y²tv«5ò\Z«[\"Ža\âÄ‰ª°°ž€\Ì\"©H\\¿®>;õ¶ú\è\ÍÑ­J„¿\É{\ä½d\'	\Û3v\ìXõüó\Ï\Ó\Ót K—.537	\çŠD{Y²ˆ„c‘a\éÓ§\Ó\Ót ²†„¬%H8W$‚\ÉB´•@$	\Û\"\éV¦¥t,›7oV©©©ˆ„ƒE\"\\‰ð7D‘°-ùùùjñ\â\Åôô\0K\Ñ;_$hˆ„kE\";;[­X±‚ž ‘?\Ù‘ !ŽD–\Ç^¿~===@R^^®¼^/\"H\Ð	\ç!v\É\Æ]\0\Ðq\\ºt	‘ˆP$~ó›\ßü+\"H Ý¤¤$3~\0Ñ§¬¬L½øâ‹¦\Ð266V\Õ\Ö\Ö\"a`Y\Ö%~\Òôý[Z\Ê\Zõý›úö†~|]ß¯\Õ÷¯\èö7}ÿ¢nt«Ðÿªo\é÷Ô·ûtÛ£\ÛvÇ³Iß®\Õm™~\Ï\"ýú\Ëúv²~\\ o‡è–©[¼~\ßÿ>û\ì³ÿ©Ÿ<..®gbbâƒ½{÷þÎ¶m\Û8ù#ˆ„·=p\à\0=>@¸p\á‚\Ù\åsÀ€\Ê\çó)}òQÃ‡WkÖ¬Q555d$š‰„Ž\ÑoõIü\Í\Ö:d9q‹\èV§\Û\ï\ä$.\Ïõ\í\Û÷a9¹\ËI^\Æ3rÒ—“¿>ñ\ÒÏ)\Ðm¦þ\ì·ea¾\Ý(!2¡¿w[.Ž\éö\×\Û\ßC\ä£J·¿‰”\è\×k\åûŠ¬ˆ´\è\Ö(\ã\ZNþˆ\"q\é\èNœ8Á\0 ¤”«\Óq\ãÆ™\ìž_dee©Ù³g«cÇŽ vDBŸ˜?‘“²€\á\Í;cý\\’~M2%\'\'\Z	D‘\è¦H\Ç\'WQ\0\"Þ²öŠ\Ìx’“ „¬»e\Ë\Ó!Bp\"q{\ÈÀ\ÄP†*úö\íû\È\í—î»=\á‹(¶D$‰nŽÄ—/_¦‡h9>Ö®]«FŒa†E¾ýë¯œ?ž\0…)þlD@»$uR\ã c|Y¿þ:k\ãv\îj\í}Ý¾}ûÔ¯ýkõµ¯}M}\ã\ßP¿ü\å/Uiii\Ð\ß/Ò“}\à\ç¼ó\Î;\ê‰\'ž@$\Ü.\æ\0–[\0øH‡=e\Ê3=Z\ÄAŠ%\'Mšd:mŽ—\ÈEBj#šI„¿I\rÂ»½zõúº¦†z‚\ïÑ£‡yÿ\áÃ‡Õ‡~h\îÿð‡?\ì4‘\è\È\ÏD$l|¥Å”4\0¥*++Õ«¯¾ª\r\Z\ÔT$9t\èPµj\Õ*Š$;@$n7\Þ%RÌ¨cÿs·¬#\Ñ\Ò\ÉX¦\nË¾,’qÌƒ\Ô\ÜH_-¯\Ésòþ\ãÇ·ûYý÷EŒ\å3}ôÑ¦\Ïð¿ö³ŸýL}\å+_Q\ßþö·M\Í\Ïþðóýx\àµ|ùò;\Þ+Ï‡’IA$Œ\ÔF \àF\Z\Z\ZÔŽ;\Ôøñ\ãUrr²9‰I\ç=s\æLsµ\':\Ö	­d#üíª›3ò(\ÏÉŠ\Ã2\ÛG\î‹L\Èk’%“\Ç\ßü\æ7UNNŽù_\rE$6l\Ø`š\Ü÷Kø_“\á;Y8\ÍÿX¾÷©S§\Ìýûï¿¿\Õ\Ï$#\ár‘¢1¹òp\Ò)Î;\×tÀ\"\Ð			jÌ˜1jÓ¦Mª®®Ž\0užH\\lG$¤\ís«Hø¯ö\åRš?\à]†\×D~E&\ä5‘‹`E¢¥\Ïl\ë\ëÚ’D‘0|ðÁ¬ÿŽE’\å\ßG\Ze¤A\ä!//O-\\¸PUTT ®‰\Öj#¾°,\ë¸n«õ\ß*Ç­\"\á¾<\é‹44ÿ\Ús\ç\Î--‰„|D‘ˆv$§±ÿ~5mÚ´¦\"IY~\âÄ‰j÷\î\ÝIv‘i¨\×Ÿ\×e˜Cj\"ºûPFgŠ„dšmHM^{ø\á‡\Íc)–ÿu¹/˜ò\Ú÷¿ÿ}óøÈ‘#\ê7\Þhñ¤/µ7n4÷{÷\î‘Hø3\"R¿!r‚H¸T$d\r\éh\ìJuuµZ¶l\ÙE’C†1°­A÷	-K\í~¢\è\èbKa\É4H‰ð[<x°iúç—¾ô%3ýS–a—×¤Xø»\ßý®\É48°Eú)¨|\ä‘G\ÌP_$\"±t\éRS;!?‡¿‘p¡H¬[·\Îü\Ã\Ø\É*\ìÜ¹S©””“OOOW/½ô’Ùªº¿H8\áDÁ‚T,H…H\ÜF,Rl ;#•\äó\æ\ÍSýû÷7\â õ\Ï=÷œIÑº},D‘@$‰.eÉ’%¦ø\ìÇ™3gû»‰\È5‘‘‘‘ˆ©\0D‘@$‰n‚\ì \ã\É`/d[jù_•ýœ‚\ì@+\ÃFd\ØbÂ„	j×®]I\"ˆ\"HtW¤º}\äÈ‘ôn6“ˆ{\ï½W=ö\Øc\æÖ®2!eR)\"\ë/’<x°z\íµ\×L% ˆ\"H\Ø\0™WXXH\ïf3‰ðËƒ\\±\ÛE&$« S0\åN²\r25S\n}§OŸn\Ö3D‘@$	\"\' \çŸž\ÞÍ†\Ñ\Þó\ÝYôI\Ê\Í\ÍmZIrô\è\Ñf‘(Š$	D‚†H8\0Ö+B°§D4]2\á \'u\ÙÀ\'RdQ\ZYnZŠ$e¡3‘)’”e©OŸ>\Í	\Z\"\á4d|Z\n.Á¾\á\'\Üa\Ù\ÙR\Öa7£!›Í˜1\Ã,t#E’²*Ÿl„%b\É\ÆX\0ˆ\r‘p0ùùùjñ\â\Åôn6—ˆ@™¸\ï¾û‚\ÎL\È\ÐCRR’\0\ÙsE\æö\"É•+WªaÃ†™I)””UôJJJ\ÌV\Ü\0ˆ\r‘p\Ù\ÙÙ¦r\ì/_\'2\Ñ\Þ\×\ÉZý\"\'µ´}¶I\îÙ³GMš4\É,§\î/’œ:uªù\0D‚†H¸X$\ä„ …o\à‰hþõ­e&dm~‚\æ;0Îž=Û¼~þüù¦\Å\Ê\ä}\"RO³v\íZuõ\êUþ@€H ˆ\"ñ\ä\nS6\î{I\Ä\í\ÎXµõÿ\ÚZ\Í\Ä\æÍ›[”i2T\áê¥Ó¥~\æÄ‰üQ\0‘@$	D¢e\ä¤![‰Cô¦\Î \ÒLD0\"\ÑRf¢¸¸¸U‰ð7™u\É\ï\0€H\Ð	!)kYš¢S\è\È\áŒ`E\"ðs%\ÛÐ–@ø›\ì€H ˆ\"rr!u]ü\'d\n\É\0sujMD(\"!\Èt\Ì>}ú¨˜˜•••eš3¬\æ%\Ó‘h™\Þ\Ì\É‘@$4’\æ¾p\á½[ˆ„¿\É	{õ\ê\ÕQ“ˆpDB˜<yò]³9dú§ül2#CVŸ”ŸU\0‘h›={ö4VUU!\0Qj\çÏŸ¯\Ð\"QH\Øô¤wùòez·	“z”\æ\Ã\á\Î\ÎG$üß¯½u&Xº\Z‰öyû\í·\'\íÚµ\ë\Ö\çŸ\ÞmO\Î×¯_·Dlß¾½A·iˆ„ÍõOt’h­É¢Cþ\ZýM®\\\å\n\Ö\ß\äD)«\ZJ“M™dFHjjª™b*MVO”-¢eDI­\Ë\Z²|²\\	\Ë\ÂX0\r\Z4È¬¸9t\èP³\èÑˆ#Lº]öh¥—\n\n\ÌFc’®/**2›@\Éµœ$§L™bv4•\í¨eµ\ÅY³f™™²Dó¼yóÌ¾²\0—9\ÈJ²Ó¤¬£±j\Õ*µf\Í\Z3½Q¦\ÃnÜ¸\Ñ\ÌnØ²e‹Ú¶m›Y¥Q¶³–\ÂT™:¹w\ï^µÿ~S_\"k/9r\Ä,1}\êÔ©vk$NúÓŸBžjk\r;môˆDwFŸø\Æ\ë«\è/$%\ßÝšôq\ÒgKÿ\Õ¾f­\ÞIáºŒ„È„4±B¹•ì„¬\\(\Û8\Ë*…²ž€¤¿\Ë\Ë\Ë\ÍIRN–ÇŽ3\'O9‰\Ê\ÉT%’“«,Z$\'[9\é\Ê?¯L+•“±œ”7l\Ø`®\Æ\åd-©tYQN\âr2—x9¹\ËI~Á‚\æ¤/\'Y\Ó`\æÌ™F\nd?Y\0IN¾\"\r\"\"\"\ãÆ3r!’!mÔ¨QF>†nDD¤D\äDšÈŠH‹È‹HŒÈŒ4‘i\"<\">\"A\"C\"E\"G\"\0²D <‰LÊ•¸Á4ú[Ïž=ƒ\Î<DK$„§žzÊ¼\çÌ™3œ\Ù\0‘p½zõúº\î_nHC4	p\ÐÐ†ˆ‰ˆUóa¶†:2#AQ% \Î\Ä\ëõ¾\î\ïwúö\íûA$À\æ\"!\ÉÐ´Dg\×Hø÷\â`X	gbYV\ÝnôA»ˆ\n\"6	Yr÷\î\Ýí¾¿³fmDº\Õ8\0\"\Ñý\Ñ}Ï¡f3\r2\ÔAd	°\"¡nf\ÌlŠHDBjQBù|\0D\Â~\Ä\Å\ÅY-\r«z½ÞD‘\0\à¯]\ædO+[J\Ñ)\0\"\á\èl\Ä\å–DÂ²¬Oˆ\".¡£ö\Ú@\"\0‘p¼D,nk†˜\×\ëýQB$Àe™‰Ž\Úý\0‘pZZˆ¶DÂ²¬‰\".\ËLDRÓ€D\0\"\á<\Ïp-•º}!B\ÑlÖ†¿Ý¤\è‘\02Q@$œ‹–	‹…R€)Å–úñ4™\ZJd	paf\")@\"\0‘€\Û\Ã—=O‘@$\0š‘jo˜C¦xRX	ˆ\Ü.¾¼®E\âi\"H\0•ið\×T €HÀm‘hdylD (™eý	\0D\Â5\"¡bbb¾E$	€e\Â/\rÁ{\0 ®ªx€?	€Vñg ž|òIvñDZ\ÊF<.\Ó=‰\"\ÐffB®8@$ 9–e\Å\èþ\á\Z‘@$\0\ÚDD\0‘€\æx<žA^¯·†H \0ˆ 2>Ÿoª\î>%ˆ\0\"ˆ„S#QbY\Öq\"H\0 €H@8\"±Y‹\Ä^\"H\0 €H@8\"Q&2A$	\0D	G$>–\á\r\"H\0 €H@\ÈX–u^vû$ˆ\0\"ˆ„Œ\×\ëý›nCˆ\"€H\0\"\ám\\‹‹‹³ˆ\"€H\0\"\áˆ\ÄMË²þ/‘@$\0	@$ ‘¸%w	D\0‘\0DB\"##\ãŸ\Øù‘\0@$\0‘€°°,ë§ºoh$ˆ\0\"ˆ„3¬ñ;\Ý\ê‰\"€H\0\"!\ãñx²¼^\ï\"H\0 €H@\Èø|¾	ºo¨$ˆ\0\"ˆ„S#±À\ëõþ•H \0ˆ 2Z\"^\×2ñ!‘@$\0	@$ œb\Ë\ÝZ$\Þ&ˆ\0\"ˆ„3´qX·\ÕD‘\0@$\0‘€p2gt›C$	\0D	G$.\ê6†H \0ˆ ŽH|\áõzSˆ\"€H\0\"!£%\âÆ³\Ï>ûŸD‘\0@$\0‘€p2·’““B$	\0D	•û¤_(,,ü2¡@$\0	@$ $~dY\Ö-\"H\0 €H@8õO\ê~\á‘@$\0	@$ œúˆ™µA$	\0D	\Ç3\Ê\ëõV	D\0‘\0DBÆ²¬—u¿PA$	\0D	Ÿ\Ï÷\'\Ý/!ˆ\0\"ˆ„S#±]·w‰\"€H\0\"!\ãõz÷{<ž\rD‘\0@$\0‘€p2§t[L$	\0D	G$>\Óm‘@$\0	@$ ‘¸¬[\"H\0 €H@8\"q\Ý\çó=C$	\0D	§Ø²Q‹Ä£D‘\0@$\0‘€p2ªw\ï\Þ\ß!ˆ\0\"ˆ„\Ä\ÓO?ý/\Ò\'	D\0‘\0DB&..\î\çºO¸I$	\0D	gX\ãY\Ý\êˆ\"€H\0\"\áZ´,«†H \0ˆ 2Z\"¦\è>\áS\"H\0 €H@8C¯\êv‚H \0ˆ 2g“\×\ë}H \0ˆ NF¢L·­D‘\0@$\0‘€pD\â˜\×\ë]N$	\0D	G$\Îy<ž—ˆ\"€H\0\"\áˆ\Ä\ßtJ$	\0D	G$®y5D‘\0@$\0‘€±,«!>>þD‘\0@$\0‘€p2·$ˆ\0\"ˆ„D¯^½¾\ÎÎŸˆ\0\"ˆ„E\\\\\\O¯\×\ÛH$	\0D	Ÿ\Ï÷[-õD‘\0@$\0‘€p\ê#\Ò-ËºB$	\0D	G$\nuûœH \0ˆ 2–e\Í\×\í\"H\0 €H@\Èx<žuº?8H$	\0D	¯\×ûŽ\îv	D\0‘\0DÂ©‘8¤eb\r‘@$\0	@$ œŒD¹eYs‰\"€H\0\"\ád$ªt+ ˆ\0\"ˆ„#W-\ËJ#ˆ\0\"ˆ„#7´Hü†H \0ˆ 2Z\"n\éÖƒH \0ˆ *÷I_óUBH\0 €H@¨\Ã\Z?\Ô\í‘@$\0	@$ d<\Ïº/h ˆ\0\"ˆ„Œ\×\ë\×}A-‘@$\0\Ú$33ÓˆC[-))‰@\"á¾¡º]\"ˆ@›\ìÞ½»]‘X½z5D\Â}‰™úø?K$	€vIOOoU\"’““U}}=AD\ÂeX–µR·£D‘\0ˆ(+±r\åJˆ„;‡6¶\éVJ$,r•¸n\Ý:5n\Ü8sE\Ç	À\çó©´´45v\ìXµd\ÉU[[KO­\ÒR­„\ÔF\0DÂµ‰÷½^ïŸ‰„E¢¢¢B?þ.qh¯‰X:T?~œ‚\ÊJPˆ„«k$Nê¶”H8H$\ä\ÊpÒ¤IFBˆ–šd)\ÈP@s²²²\ÈF\0\"þ¡Ï´HL&‰Ã‡›Ž½¹\ä\ä\ä¨¨½{÷ªO?ýT\Õ\ÕÕ™÷\ËmUU•ú\àƒ\ÔÿøG5p\àÀ»¾6!!A\íÛ·\ÞšØ±cG\Óÿ‡› ®‰¿[–•G$ Ò¹7\Æ6l˜‘„›7oý9T£G¾\ãs´m’¾†;ð\×J\0D\Âõ5\×=\Ïÿ	›‹„HD\àPF\\\\œÚ¸qcHÑœ7\ß|\ÓL\éc,ZBj%úô\éC \0‘ #qS·Çˆ„EB†3D‡1Nž<•\îÌ™3*//\ïŽ\Ì\Ã ¼øâ‹¦C–:\Z\0D\Â\Õ\"!\ß#6	I+\ÖDˆDH\ÍC4‘\Ï”	©™ \0‰¸÷\Þ{\Õc=fn‘	@$\ÜILL\Ì?\ËyH\ØX$dvF\àpF´2-e&‡9ž{\î9z#—K„_&L˜€L\0\"\á^‘ø?2´A$l*²ND`]„\ÔDt$R3X/!C*\àn‰h\ïy\0D\Â\Ù\èsP}>¨#6	Yl*pvÆ7:ü\01bD\Ó÷”E«\0‰hþºd(\0	w \Ó>eú\'‘°¡HHmD\àTO™\â\ÙH\"pÌšš\Zz%$¢	†9\0‘p²•>\\ 6	™†X`\É4\ÏP	\\´Jö\æh‹eË–!.‘ˆ@™¸\ï¾û\ÈL\0\"\á‘Xª\Ï\'ˆ„\rEB6\àòŸ\Ì/^Ü©\áò\å\Ë\ïXB»¥l\ÉÜ¹s\Í\ìy{v¸G\"¿Nd‚\Ì \ÎF÷ñe\Ó.\"aC‘]<ý\'sYöº3‘aÿ÷NMMmz¾ººZMŸ>ýŽ5-	÷IDó¯\'3ˆ„£E\â/²8‘°¡H\ÖG|ö\ÙgzÊºuR7!\Ã²XUK±\æ„ý%¢±±\Ñl5/·m\Ñü}\ÔL\0\"\áøbË£ºŸ_A$l(\'jÿ\\…|¿PvûKD=L\ç+·­\ÉDk\ï#3ˆ„£3gõE\ä\"as‘\è\nB‰\Ü\Ü\\“±)ª²Uaa¡YHK†A\æÌ™£.\\¨JJJL©¬…±}ûvUZZª8 Nœ8¡ÎŸ?¯.]º\Ä\æP]4œ!†\Ûo«2(þ–‘‘µa\0D¢ÛŠ\Ä%\Ç3œH‘ˆ(#!…•\Íw\rl\Å\Å\Åjþüùj\æÌ™jÊ”)\æÊ´  @9R\r2D\r0@õ\ï\ß\ß\ì&)\'­””•˜˜h>S†Nd\È$p\Ø\ÄÿX^“÷\È{\åk\äk\å3\ä³òóó\Íg\Ë÷“WQQ‘z\á…ÔŒ3\ÌÏ»t\éRµb\Å\n³ö–-[Ô®]»\Ì\"2LsúôiUYY©®^½\Ún*\ß\éÑš$\ÊD{¯ûa˜	GŠD­n>\"ADH4¯‘$[ †ŽÚ\ï#\Ù	\ÉRH¶B²’½,†d3$«!\Ù\r\ÉrH¶C~&\É~HD²!’‘\ìˆdI²³³M\Ñj¿~ý\Ì~%2\Ë$P^šo£.\ÏK!©¼O–—¯y\É\ÊÊ²}Ö¥½ŒAk²\Ð\Ð\Ð”D~fs\0\"\á(‘hðx<O	ŠDwœµ!\ÈÌ\áÃ‡\ß%\ZvENˆR,*òT^^®Ž9b2’ÁL\Æúõ\ë\ÕÊ•+mu™<yrP™‚–d\â«_ýj\Ð\Ñ\\&¨™\0D\ÂÅ–·tŸõC\"aC‘\è\Î\ëHr¢’C\å$\Ý7\ë¢;Ó‚\Í´$¡H\Ã€H8‡^½z}ýöÎŸ÷\rŠ„\\w\ÕÊ–ru\ìÊ–\"\Ð=‘]\å­gÏž!}g4\ÏD\Ècy>žz\ê)óµòs\0 ¶\ÌFô\Ð\çF\"aS‘«\ÖÀ?\Ùk\Â!Ô©™\Ñ\ÎHÈ°\0\"a[‘ø>\Ô	›Š„ i\ìÀ\Ý?;#+1zôhvÿt¨LtV„/†5\0‘°½H¤\ésÁU\"ac‘¨¨¨¸£@O\Æ\Ï;’7\ß|óŽ™’\0w\ÈD4gm°8 \ÎÀ\çó\Ó\ç‚*\"ac‘‹.ej\âÉ“\';\äÀ“ql)\Öó/É†€ód¢¥\Ù\ÑZGB\nD™­ˆ„£Dbž¾˜-\'6	™š\è\ße\Ó_x)S£‰|ž\Ì\0ðù~\ìŸ\áLüµ\'ûh®l)\ÓU	g \Ïk-\Ë:H$l.‚¬\r8\Ä!2­Ì„d\"%B¾|?p\Ï0G´ö\Ú@\"\0‘pœH\ì\Ôm‘p€H6l¸C&d˜Cj&\")À”šˆÀ\ái²†¸\'3(’af÷\ÏÀ÷±^ Ž‰ƒ’• ‰–d\Â?›\ã\àÁƒ!}ŽQÊªŒÍ—ˆF\"Ü—™ˆ¤¦‰\0D\Â\ÙX–õ‰nó‰„ƒD\Â?\ÌX38\Ü!+`¾ÿþûfoÿF_r+5\"²be\àbS5g™ˆdx\0‘p¤HT\ésD!‘p˜HR8›#’&³3(¬$3Š €H¸fh\ãªn\éDÂ\"\áGÖ™•WÀ¦\Éûe±)\Ù\ãÀŸ™f˜C¦xRX	ˆ„kD¢>&&æ¿‰„ƒEÂ,§-{sH–B6p\nÜ‚\Ü/²‹§\\A\Ê\Þ,{\r\ád\Zü5H \îÀ\ëõ6ö\í\Û÷a\"\á‘h\Î\æÍ››$bÛ¶mô*±L´´þ\0\"\áøŒ„’@‰„EB²~‘Å†\0Â‘	¿4;\ì€H8‡\Ä\Ä\Äõ9\ä‘p¡H¬[·î®š²*þÄ“O>\É.ž€H¸sX\ãW–e5	ŠDJJ\Ê]\"‘™™I\Ïae&\äÿ‰\0DÂ•\Ã\Z>Ý®	—‰Ä²e\ËZ©QVVF\ï!#ÿ;R\Ì€H¸\Ç3\\ÿ—ˆ„\ËD¢¥…ªüMö\Ó\0Yñôò\å\Ë	÷‰\ÄKúø?G$\\$2ý³½õ#X½\Â‰\ê\êjˆ„ûj$–[–u”H¸H$\Ú\ÊF.£\rªHœ?ž@\0\"\á¾\Z‰­º•	[ú9q\â„Yˆ\n \ä¨¼¼œ@\0\"\á>‘\Ø\çñx6	‹Ä±c\Ç\ÌV\ã\0‘Š„H)\0\"\á:‘8¡Û«D\Â\Å\"![…#)ò?$ÿK\0ˆ„\ëD\â‚n/	‹„l\È%{n\0D‚\Ô\Þ\ìß¿Ÿ@\0\"\á2,Ëª\Ñ\"‘O$\\,\Òù\ËI\0 Yƒ	wf$\ê|>_\"\áb‘Ø»w/\"“œœ¬v\í\ÚE \0‘pŸHÜŒ‹‹û9‘p±H”––š«I€H%×·o\ßN \0‘pŸH¨§Ÿ~ú_ˆ„‹Eb÷\î\Ý*))‰\"¢_¿~jË–-	‘œœü=	\"\ár‘Ø¹s§IKD‚lC¿a\Ãˆ„»²\é\ÖH$\\.’Ž–´4@$¤§§«µk\×@$\\„\Ï\ç{Æ²¬\ëD\Â\å\"±u\ëV“–ˆ„¬¬,³\0\"áªŒD\ÝþN$\\.›6mR©©©ô(ýû÷W%%%	w‰\Ä$\Ý>#.	×–ñm€H\È\Ë\ËSK—.%€H¸Ç³D‹\Ä)\"\ár‘X¿~=\"3`À\0µp\áBˆ„‹ðz½\Öm?‘p¹HHœ\ÊD\Â\àÁƒ\Õ+¯¼B \0‘p\×\ÐF©eYo	—‹\Ä\êÕ«Uff&=\nD\ÄÐ¡C\Õ\Ë/¿L \0‘p—H\Ñ\"±’H¸\\$¤\Ò^*\î\"a\äÈ‘júô\é	w‰D…\×\ëI$\\.¯½öš\Ê\ÎÎ¦Gˆ3fŒz\á… \î‰j\Ç3ŠH¸\\$dÊžL\Ýˆ„±cÇª\çŸž@\0\"\á\",Ëª\Õ2‘@$\\.\Å\Å\Å*77—\"büøñª¨¨ˆ@\0\"á®ŒDƒ\×\ë}’H¸\\$–,Yb\Ö\0\0ˆ\ÉFHV\0‘p•H\ÜJMM}ˆH¸\\$dî¿¬\0	R!u\0ˆ„;ˆ‰‰ù\ê\í?\ï#\Z.‰ùóç«Ò£@DÈŒ\r™¹€H¸ƒ\ä\ä\äŸX–u‹H jÎœ9jÈ!ô(²†„¬%€H¸¯\×û_º\Ý ˆ„š5k–\Z6l=\nD„¬j)«[ ®©\è§\ÛD‘P3f\ÌPÃ‡§GˆX°`Cd€H¸K$\nt»H$	Æ¶!*\ÈÎŸ\ÌþD\Â=X–5W‹D9‘@$\ÔÔ©S\Õ\èÑ£\éQ \"X\Ø	×‰\Äj-‡ˆ\"Á´=ˆ\n\ì\Ùˆ„\ëD\âm¯\×û‘@$Ô¤I“XH\"†\í\è‘pZ\"\èö:‘@$\ÔÄ‰Uaa!=\nDÄ†\rTZZ\Z\0D\Â=Å–§-\ËZ@$	³?‚\ì“\0	›7oV©©©	÷ˆ\Ä\çZ$\Æ	D‚Í– *lß¾]¥¤¤˜û555\êøñãª¢¢‚À\0\"\áÜ¡+ºe	D\Âk\Èð@°ˆ($$$¨¸¸8¥;%\ë\í·\Ô\Èt\"\á\èŒD½\Ï\çû-‘@$L¡¥\\„Â¸q\ãZi\"\Õ\Õ\Õ\n	\çŠD£¾˜\èI$	õ\ÜsÏ©)S¦Ð£@\ÈY	}5ÒªH\Èÿ\0\"\áh‘PÿD$	5j\Ô(5m\Ú4zYµ5‘¸p\áDÂ¡ô\é\Ó\çú8g\çOD\âŒ1B½ô\ÒKô(VV¢¥\Z	–\\D\Â\Ù\Ä\Ç\ÇÿB\ë\rD‘0\ÈÎŸ3gÎ¤G°X²d\É]\"QVVF`\0‘p0qqq–\æ\Z‘@$C‡U³gÏ¦G°‘~‰\È\É\É! €H8¯\×;D\ï#ˆ„að\àÁ\ê•W^¡G°‘Å¨ü\"!÷	gcY\Ö4}¼Ÿ#ˆ„a\àÀjþüùô(\É\ÉÉ¦^\0‘p>Z\"–\éö1‘@$P.¤GˆX·n\ÉH\0 ®\ÈH¼©÷2\"HòòòLÁtoÎž=kŠw\ìØ¡\Þz\ë-ZM–ñÞ½{·:u\êÿP€HDV#ñžno	DÂ››«Š‹‹\éQº¹D\ìÙ³GUUU©úúzZ\í\âÅ‹j×®]\ê\äÉ“üc\"~F\â¸‰?	D\ÂÐ¿URRBÒ‘L]™\Ì\0\"vÄ§Z&¦	DÂ­^{\í5z”nŒœô€\è6\ê\0@$\ÂÚ¨\Ñm ‘@$YYYj\åÊ•ô(\Ý9\éqòG$\0‘\èF‰:Ë²bˆ\"a\È\Ì\ÌT«W¯¦Gq€H|ñ÷\Ï\Ô\'\ï«£Û‹L“ûò\â€H\0\"e‘¸©\Û\ãD‘0ddd¨µk\×Ò£\Ø\\$®\Ö|ªŽl-P‡\ÞvG“\ç\ä5\ä‘\0D\"Š\"!+\Úþ+‘@$\é\é\éjýúõô(6‰sGÿ|—Dø\Ûù£‘D‰¨Ð»w\ï\ïˆH	D¢‰´´4µq\ãFz›‹\Ä\Ç;_lU$\ä5\ä‘\0D\"\Zô\í\Û÷¯\×\ÛH$‰&RSS\ÙÁ\"q\ä­\ÂVEB^C	@$¢\Ç\ãy:66ö:‘@$š\è×¯ŸÚºu+=\n\"H\0\"\í\âõzst»L$‰&RRR\Ì\ÒÁ`o‘Y\Z­‰„¼†< €HDI$&Z–UI$‰&d\×Æ;wÒ£\Ø\\$N•\ÎiU$\ä5\ä‘\0D\"\Z\Ä\Æ\Æ.\Ö\í¯D‘h\"))\Éldö‰KŸVG¶»{XC?\'¯!ˆ Q‰õº}@$‰&Uii)=Š\ÍEBZùþ’»DBžC	@$¢({t\ÛN$‰&\ÔÞ½{\éQ\ì.×¯«S™w÷°†~N^C	@$¢eYi‘XE$‰;Dbÿþýô(6	Y¹òd\é\ìVk$\ä5V·D$\0‘ˆRF¢B·\ÙD‘h\">>^8p€ÅŽ\"qýºú\ì\Ô\Û\ê£7G·*þ&\ï‘÷’@$\0‘ˆ¯\×[\íóùF	D\â‘8|ø0=Š\ÍD¢½,\Ù	D‰\ÊH|\áñx’ˆ\"\ÑD\\\\œ:v\ì=Š\ÍD\"˜,D[\Ù	D‘\0D\"\Ò\"qC‹\Ä\nD\â‘8q\â=Š\ÍD\"\\‰ð7D‘\0D\"D†K¼´D\ÜJHHø\á@$šðù|\êô\é\Óô(v¬‘ !_úÒ—‰\à%\âÖ½÷\Þû¡	õ\å/y!A$\î‰ŠŠ\nzD‘\0W!ÿ¿ÿý\ïUll\ì¾\ä\ä\äŸpºi[\"tûqA³\Ç\àv‘ðz½\êüùóô*ˆ\"®\ã\ßø†’ut»¥û\Âw\ä´Ó¦D´÷<¸U$*++\éQ	D\\[#¡ûÁ_\Å\ÆÆžÒ­Q\ß\ãé§ŸþN?\íÊ‚ÿõ1„\n‘P\Õ\Õ\Õô(ˆ\"®	?111ÿ­e\â¬n7-\ËZ­‰h“1d&	#555ô(ˆ\"®	?qqq––‰J-\rº\\ª…\â«HD›2\ÑHf\Â\Å\"¡uõ\êUzD‘\0D¢ºL\×\"ñ7}[¯¥\âeý\Ô}HD«_\×Hf\Â\Å\"!+ ˆ ­\n\ÅPÝ®\êV\çóù& \ÔL \ÍD¢±±‘\Å\á\"1e\Êõ£ýH}\å+_Q\ßþö·›\Ö‰\ä3owÂ¦\É\çö\è\ÑC\íØ±#\â\ÏC$ »‰„‘‘‰\ÛR1\ÔÁ!™—EAd`š¿š	·‰\Ä\åË—HLŸ>™p°H¼ò\Ê+¦\Ãü¯ÿú/UWW§6l\Ø`?ò\È#Q	¹üøqsÿ\á‡&#Ž	ÿ\É\Ó\ëõÎ”\áŽ\Û\Ã\é]}¢HMM}(\Êq\âvlN´!­½Ì„\Û2GŽQýúõS)))\êÐ¡Cô,‰G}\Ôt˜¯¿þzP™€À\Ç\"?ý\éOM\ÆA\æ\Ü?ñ\ÄM™Œ–¾N\Þ\'÷/^¼¨\Õ×¾ö5óu}ûö5ë•¬X±Â¼O6‹“÷\É{\äñò\å\Ë\ÉH€]D\Â ˜Rˆ)™Z&>—Í®:Qˆ\Ô\È\ÂZaEK\Ã‹³­\ÈD DøÛ‚(“€DBlÄŒ3\ÌŽ©S§’p˜H\È\É]þ—$ªH|÷»\ß5÷\Ë\Ë\ËÕ¾}û\ÌýŸÿü\çw½\ï\Ã?¼#Ë‘œœl\Ëó4÷Ÿz\ê)u\á\Âsÿ¡‡2\ï“\áy|\î\Ü9Dl%Bñ-™**SFe\ê¨\Ï\çûmˆ„ÈŒ,®uK\ßn\×}ù\ÔD´$	2\Ñ\Þ\ë÷0\Ì\áB‘ð#»€j£5\'\Ð\Ë8D$n\ï\' .]º²Hüò—¿l\Ê4ô\î\Ý\Û“H¶¡y„4\É|”••™\×$\ÑüuyN^“‡<Þ¹s§¹\íÙ³\'5`[‘ð#‹X\ÉbV²¨•,n%‹\\u¢H\È÷Tþv[(÷\ê\Õ\ë\ëaV¶&_R\"˜\Í\áV‘ðg\'fÏžm²“\'OV\r\r\rô66	\É„;´!5òýóóó\ÕøCó¼U6_nn®ú\æ7¿©\Þx\ã;DB¾¾ù÷\Ë\É\É1¯=ó\Ì3\æ633‘\0Û‹„Yf[Ÿ\Äw\É\É\\–\ß\Ö÷\ë‘P­4ò\æìŒ–d¢>‰h.\ÔL¸E$ü\È\Ö\âiii&;±ÿ~z‹\Äüùó\ÍAÿ»\ßýÎœ\Ø×®]kÿø\Ç?6¯ÿû\ß7¥^FD ð„þøã›û’iðK<ø\àƒ-\n‡\Æý÷\ßo†)dVˆ¼¶p\áÂ¦a_ÿú\×\æ½kÖ¬i\Êr\È\íªU«\îú¼`\î#\ÐEÂl¦Eb_`–@_ I\æà¦¾½¡_\×÷kõý+·‹6/\êvA·\nýø¯úö˜~\ÏA©}\ÐmYx<žMúv­n\Ëô{\É\Úúvr\"\áo\×ô×¾ ¬!7´$¡H\Ãn	?s\ç\Î5Ù‰‰\'²Þ„MEBšœ\Ðe\è!°h\Ò?ñê«¯šZy~\àÀwœ¬eg\Ø?ü\á\æ5ùZ©x\çwZ<©K\ÆC\Ë6Ã²‹H¨|d\'¤>B>K\Þ\'µ\Zþ\á¹m>T‚H€D\" †\âŸ{÷\îý\ÉTô\í\Û÷a}Rü\ÙgŸýO-\Û\Ï\è¾5^·L}\Ì’ÌH\ÌÑ‚°\à¶,¬Ñ·E\"D&ô\ã÷n\Ë\Å1\ÝD6*n\ËG{\"¡úô\é\ãÿ}†ø+|¹…LDý\í\çC\á\Í\Û_û§v—‰„ Uú\é\é\é*))I\íÝ»—\ÞÇ†\"AC$ kD¢“j$ZˆsZ>¶0¬\ì0C´3“9­»T$ü,X°Àd\'ŠŠŠ\ÈN ˆ \Ý\0™¡\Ñ\\ ,\Ëú\Ð\ãñüo˜…–Ñ®‘CÁ%\"q2\rPŠ\ãdþii)=\"H\0\"Ñµ\"ñ«\Û!Å\ê\Ö#ˆ/\ë\ÌY,N…H´Ì¢E‹Lv¢°°\Ð\Ú\"H\0\"\Ñùô\í\Û÷™%\æbT-Í¦ˆ\Ö:	\Ì\Ö@$\ÚEŠç²²²TBB‚Ú½{7½\"H\0\"a/Æ´1ˆ\æÊ–\Ó8#AQ\\\\l²ª¶¶–\Þ	‘@$\0‘°µ\×H„†ì£m²²b! ˆ ¶\ËL\ÊÄ‚{‚\Ûý3ð}¬HDNII‰YŒhÌ˜1d\'	D	{e&\"©i@\"‰\è!+ ö\ï\ß\ß\ìð¸}ûvz+D‘\0DÂž™‰p‡G\0‘ˆ²e´d\'F\Z¥®^½J¯…H €HØ¯f‰@$ºY*Y6|Š‹‹S[·n¥\çB$	@$ì‘™f˜#\ÂJD¢Ó™$;1|øp³\× ˆ ¶\ÎLøk*D¢ó¨ªªR0Ù‰Í›7Ó‹!ˆ ö”‰–ÖŸ\0D¢óm¬%;1t\èPUSSCo†H €Ht™\â° KuuµÙ²Z²7n¤GC$	@$ºwÍ„\ÈÄ®{\Ø\Å‘\èn¬_¿\Þ\ÈÄ!CÔ¥K—\è\ÙZ`ÇŽœü	@$º<3aY–B\"‰n‰„ˆ„…ˆ\ÜÉž={L}	&3‰D\Î\0‰Ð]Fcbb¾E$‰n‹qˆLÈ‡}À?8}ú´Úµk—úüó\Ï(I\ÄÉ“\'ù\ÇD\"t‘¸Õ§OŸ	D¢[#Å—R„)Å˜R”	ÿO&\Þ~ûm“’\ï®M6n\ë\Î?Ÿ4$‰ˆD¢Ñ²¬D‘°2=T²2]T\ÒúÐ½‘«}I{ Ž‰›111ÿ‡H ¶A®\Z1b„\ÉNÈ‚V\Ð}‘%\Ð	@$/\r\ç	\"H\ØYZ[²²Ô¶ŒqC÷C\nf	@$/õú\Â\î·D‘°\í¯lþ%Ù‰\åË—n†ž\ÔH\0 Ž‰k–e\Å	D\Â\ÖÈ¶\ä²=¹lS.Û•C÷\à\ìÙ³ˆ \Î‰/ôqžB$	\ÛS[[«ÆŒc²%%%¤ ³J\ä\ï€H8Z$.\ëÖŸH ŽA\ÖVHHHP\Ù\Ù\Ù\êüùó¤9~ü¸©c@$-—tJ$	\Çe\'\n\n\nLZ½¸¸˜€t‡F$\0‘p8–eUù|¾qD‘p$\ï¾û®\ÉNdee©ŠŠ\n\Ò\É\ìß¿\ß\Ä\0‘ptF\âS\Ý^ ˆ„c©««S………&;±h\Ñ\"Ò‰\ìÝ»‘\0D\Âù\"QaY\Ö\ËD‘p<¥¥¥*11Qeffªòòr\ÒI!‰9\0\"\áh‘ø«¾P[D$	W K6™\ìÄ¼yóH#{X$\'\'@$œ-\ëVB$	×¥Ü“’’Tzzº™¢Ã¶m\ÛTJJ\n\0D\Â\Ù\"qÈ²¬\ÕD‘pevb\âÄ‰&;1w\î\\\ÒlÚ´I¥¦¦@$Œ–ˆ÷u?úg\"H¸™Y \é÷´´4u\â\Ä	EÖ¯_o²>\0ˆ„£3¥ºm#ˆ„«ihhP“\'O6Ù‰Ù³g«\Æ\ÆF‚Ö®]‹H\0\"\áüŒ\ÄÛº\ï|‡H  9p\à€\ÉNH:þØ±c$BV®\\i\Öð\0@$-o\Æ\ÆÆ–	Dn#Ùˆ©S§š\ìÄŒ3\ÈNDÀ²e\ËTNN\0D\Â\ÙC\ëuû€H ÐŒC‡™ýúõSGŽ! a Ë“\ç\æ\æ@$Œ\Ï\çû“eY	DZ\ÉNLŸ>\Ýd\'\ä–\ìDh\ÈJ¢ùùù	gg$^\Õ\í‘@$ \r$#!™	\ÉPH¦‚cþüùjÐ A	gg$\æY–õ	‘@$ ˆ\ì„\ÔLHvBj(\ÈN´Ïœ9sÔ!C F÷‰3t;G$	™\Í!³:dv‡\Ìò€Ö™9s¦\Z6l\0D\Â\ÙC“tûŒH bvBÖ›ì„¬?!\ëPÀ\ÝH]\ÉÈ‘#	 \Î‰1º]$ˆ„¬„)+bJvBVÈ„;™2eŠz\î¹\ç \Æ\ãñ\ÒU#ˆD€\ì\Õ!\Ù	Ù»Cöð€0i\Ò$UPP@ \0‘pvD¦nWˆ\"\"»ˆ\ÊrÐ²«¨\ì.\nJM˜0A@$œ=´‘`YV-‘@$ J,X°Àd\'ŠŠŠ\\Ÿ‰™\0@$œ‹\Ï\ç\ë£e¢ŽH E\Ê\Ë\ËUff¦JLLT¥¥¥®\ÃØ±c\Íð\0\"\á\\,\Ëú‰z\"H@ +;JvB®\Ì\ë\ê\ê\\÷ûK¡¥\\ \Î%>>þZ&\Zˆ\"DEE…\Ù3!!A\íÞ½\ÛU¿»Lý”) \0ˆ„s\éÛ·\ï#ú‚©‘H \ÐÁ\ÈV’Yµµµ®ø‡ª^~ùeþø€H8}‘ô£\Ø\Ø\Ø[D‘€N\àüùó*;;\Ûd\'v\î\Ü\éø\ßW–Ç–e²	G‹Ä¿j‘ fˆt&%%%\Ê\çó©1c\Æ8:;!vÍ›7?8 ¦W¯^_G$	\è.\\¸ ú÷\ï¯\â\ã\ã\Õö\í\Ûù;\æ\å\å©%K–ð\ÇD\Â\áˆH~™H \Ð¬X±\Âd\'F\Z¥®^½\ê¨\ß-77\×Ô†\0 \Î‰˜˜˜&ˆt•••*??_\Å\ÅÅ©­[·:\æ÷’z\×^{?0 Ç²¬[©©©	Dº˜U«V™\ì\Äð\á\Ã\Õ\åË—mÿûÈ´Wù\0	\Çg$\Zõ…PO\"H@7 ªªJ\r0Àd\'6o\Þl\ë\ßEöY»v-T@$œ/7u{œH Ð°d\'d-†šš\Z[þ²\Åú†\røc\"\áp¼^\ïgŸ}ö?‰\"ÝŒ\ê\êj5p\à@“Ø¸q£\í~þ\Ô\ÔT\ÛgU\0‘€ j$®\ëŸgˆ\"Ý”õ\ë\×™ž.]ºd›Ÿ;%%EmÛ¶?  \ÎÚ¨\Õ\ÍG$	\èÆˆ@ˆHˆPˆXØ\ä\ädW¬\à	ˆ\"{Õ²¬4\"H€\r!‘	ò¡\î‚lNvüøñ;\ê9’’’Ôž={ø£\"\áü¡\Z-ùD‘\0› \'k)Â”b\Ì\î2+B~Y”¦¥&›•‰ü\ÈP‡[6,D\ÂeÅ–\Õg‘@$ÀfH!£œ eº¨L\íJNŸ>ÝªHøÛŒ3ø£\"\áÌŒD¥¾°™@$	°!²pÕˆ#Lv¢«’…´Z“ùù\ÈF\0\"\á\Ø\Z‰sZ&¦	DlŒ,­-\Ù	Yj[–\Ü\înY	²€H8Z$ÊµH\Ì%ˆ\Ø\ÙôK6ÿ’«ÿ\åË—w\É\Ï [‡“\0D\Âu5\'=\Ï\"H€Cm\Ée{rÙ¦\\¶+\ïLö\í\Ûw—H,X°€?\n Î®‘8ªõD‘\0!€1cÆ˜l@III§~oÙ¬\Ë/‰‰‰ª¾¾ž? \Î\ÎHðx<\ëˆ\"d×®]*!!Ál\é}þüùNùž;v\ìh‰+VðG\0D\Âù‰½Z&\Þ ˆ88;QPP`\Ös(..\î”ï™™™iD\ÂNKz a[\î\Ñm‘@$À\á¼û\î»&;!C²eG²{÷nÕ§O†5\0‘p‡Hl™ ˆ¸€ºº:UXXh²‹-\ê°\ïó\â‹/šy\ìØ±	‡\ãñx6\é>\å=\"H€‹(--5…2Q^^u‰¸÷\Þ{\Õc=fn‘	@$Ÿ‘X«\ÛA\"H€Ëa‡¢¢\"“˜7o^T%\Â/&L@&\0‘p8ºY.S@‰\".e\ïÞ½f§\Îôôt³:e´$¢½\ç	\Çd$\ëvŠH \àò\ì\ÄÄ‰Mvb\îÜ¹Q“ˆ\æ¯K†\0‘pœHÌ‘e²‰\" ö\ïß¯’““UZZš:q\âDT$\Â\Ã€H8Ÿ\Ï7Õ²¬óD‘\00444¨É“\'›\ì\Ä\ìÙ³Uccc\Ä(÷\Ýw™	@$„–ˆñ±±±•D‘\0¸ƒ˜\ìDjjª:v\ìX\Äøu\"d&\0‘p\Ì\Ð\ÆÝª‰\"p’˜:uª\ÉN\ÈV\àþ\ìD¤”\ÔL\0\"á¨ŒDž‰¿	D U:¤RRRT¿~ý\Ô\èÑ£\ï‘©©hk¤¥÷Q3ˆ„cD\"M‹\ÄU\"H\0´+\"¿ÿý\ïÕ¨Q£šž\ëÑ£‡\é|\å¶5™h\í}d&\0‘°?^‰kD‘\0j8\Â/‚dnw¼­\ÊD Dø[FF\Æ]ŸKf	{\âñxž\Ö\"qH \0\íJDó“}K’(\í½\î‡a@$l-ÿ¡E\â‘@$\0B’ˆödB¦‘#ß‡\Ù€HØ¸¸¸Ÿk‘¸I$	€%¢-™ø\êW¿\Z´D4—	j&\0‘°•Hôôz½D‘\0K\"Ú’‰P$‚a@$\ìIll\ìu»E$	€&Îœ9c:Ôž={†ôu2œ\Ñ<!\åùPxê©§\Ì\×\Ê\Ï€Hto’““¿§E‚¸!\0-g$‚fˆvFb\äÈ‘ü\0‘°÷!ˆ@D\ÃÑª‘ð\ï\ÅÁ° ¶Þi\ÝÿD$	€e\"š³6Xœ\n	ûŠ„\×\ë}€H \0­ž\ä[šM­u$JJJ˜­ˆ„½E\â–eYÿ‘@$\0\Úvhž1ˆ\æÊ–C†!È€H\ØW$\Z}>ß£D‘\0i˜#Z{m €H\Ø^$\Z¼^ï¯ˆ\"tf\"P&$\Ã\ÌîŸ\ïc½@$œƒ–ˆú˜˜˜ÿ&ˆ@Ð™‰Hj\Z@$—‘¨\Ó\íY\"H\0t¸°\Û\' Ž‰/tK ˆ@‡Jˆ„c‡6.{<ž,\"H\0„•™f˜C¦xRX	ˆ„c3\Ó21„H \0’™ð\×T €H8V$ªt+ ˆ@\Ôe¢¥õ\'\0	Ç‰\Ä¯\×;™H \0Q‘	¿4;\ì€H\Ø^$\Îj‘˜A$	€ˆ)**R–e©\'Ÿ|’]<‘pHœ\Ö\Çý|\"H\0DLmm­º½¥0ˆ„K\Ðq\Ü\ëõþ‘H \0s\é\Ò%#gÎœ!€H¸G$\ë\ã~‘@$\0\"\æüùó²0\0D\ÂE\èc~¿\Ç\ã\Ù@$	€ˆ9}ú´òù|	w\ÕH”Y–õ&‘@$\0\"\æÈ‘#*..Ž@\0\"\á.‘Ø¥\ÛN\"H\0D\ÌþýûUBB\0D\Â]\"±U·¿	D bJKKUbb\"\0D\ÂEH}„\ÔI	D bv\ìØ¡’““	 \î\ÊH¬’™D‘\0ˆ˜-[¶¨~ýú@$\Ü%%²–‘@$\0\"fýúõ*==@\0\"\á\"´D,ðz½%ˆ@Ä¬^½Zeff@$\\„–ˆ™±±±D‘\0ˆ˜eË–©œœˆ„»Db²\ì\0J$	€ˆY¼x±\Ê\Ï\Ï\'€H¸«F¢@·*\"H\0D\Ìüùó\ÕÀ	 \î‰¡ºýH \03k\Ö,5l\Ø0ˆ„»†6r´H\\&ˆ@\ÄL›6\í\Ã‘p\'I‹\ÄD‘\0ˆ˜I“&©1c\Æ@$\Ü5´ñ¬nuD‘\0ˆ˜¢¢\"5~üxˆ„‹ˆ‰‰ùo¯\×[O$	€ˆ)((0Y	\0D\ÂU5¿Šm ˆ@ÄŒ=ZM:•@\0\"á®¡\Çt»I$	€ˆ‘3g\Î$€H¸ˆ\ä\ä\äŸX–u‹H \03h\Ð 5w\î\\ˆ„»†6ˆE$	€È‘U--ZD \0‘pÿ¤E‚\Ø!\0‘Ó¿URRB \0‘p_„\Ä\î>\"H\0DDVV–Z¹r%\0DÂ…\"Ñ»w\ï\ï	D \"\Ò\Ó\ÓÕºu\ë .CŠ-$ˆ@D¤¦¦ªM›6@$\ÜWp\ÙØ·oß‡‰\")))jûö\í	÷\rmÜŒ‹‹û9‘@$\0\"\"11Q½û\î»	÷‰\Ä\r\ÇóD‘\0ˆˆ„„µo\ß>ˆ„ûD\âº‰§‰\"qqq\êð\á\Ã	÷[^\ÓÇ¿E$	€ˆE\âÄ‰	÷e$®\êÖH \0\áõz\ÕÙ³g	 \î‰¿[–•G$	€ˆEiª««	 \î‰j\ÝF	D b‘¸zõ*\0D\Â}\"ñ¹eY\ã‰\"±H466@$\Ü\'Ÿj‘˜B$	€°©¯¯7\"€H¸R$\Î\è6›H \0aSSSƒH\0\"\á^‘8¥\Ûb\"H\0„Mee%\"ˆ„K±,\ë¨\×\ë]N$	€°)//W>Ÿ@\0\"\áÎŒ\ÄA\Ý\Ö	D lŽ;f¤@$\\)ût\ÛH$	€°9p\à€Š\'€H¸S$Þµ,\ë-\"H\0„MYY™\Ùý\0‘p¥H\ì\Ðm7‘@$\0\Âf×®]*))‰@\0\"\áB¼^\ï–e\í%ˆ@\ØlÝºUõ\ë×@\0\"\áB<\Ï:-ˆ\"66lPiii	bY\Ö\Ê\Ø\Ø\Ø#D‘\0›5kÖ¨ŒŒˆ„;‡6–j‘8A$	€°Y¾|¹\Ê\É\É!€H¸3#1W\ËD9‘@$\0Â¦¸¸X\å\æ\æ@$\Ü)\Óbcc\Ï	D lþÿö\î/´\Îò\àø\Ýx#cP¼’\Þ/†\×cLddBj\Þ\ä¤Ñ”´\Öÿ\ÉüÓ–6¶««¶(¶8üWW¡R±££ŠTF)8:t4¤Ø”2G+c¥¶³E%iÚ¼{¡)obMsN\Ó$\ç<Ÿ¼8\ÆH\à\ç\Î9ß¼\Ïsžw\ëÖ­yww·A $T©TþP\Ä\ÄI“P³_|1\ì±\Ç!‘fH¬.B\â”I	¨\Ù\æÍ›ó•+W\ZB\"\ÍÍ–\Ý\Åu\Æ$„\ÔlÓ¦MyOOA $\Ô\ÒÒ²,Ë²oLBH@\Í6lØ¯[·\Î i†D¥¸MBH@\Í\"\"\"&@H$¹G\â·Y–}gBj\Ë\Z±¼B\"\É=¿.®s&!$ f±\Ñ26\\‚HO–e¿hii1	!5‹¯~\ÆW@AH$?/B\â‚I	¨YWW\×Ø¡T $\Ò\Ó\Ù\Ùyc£&!$ fq<v“\rB\"=w\Ýu\×OZZZ\ÌOH@\í\î¿ÿþü­·\Þ2„Dš!ñ#!!$\àª,[¶,ß½{·A $!AaBj²t\é\Ò|Ïž=H8$\î¸ãŽŸš„€š,Y²$ß·oŸA $\Ò\r‰\Ñööö…&!$ &ùþýû\r!‘¨\Ö\Ö\ÖMMM7›„€š‰ä½½½HT–e#‹/þ¥I	¨Iñ’÷÷÷B\"Ý¥sqT¶I	¨I[[[~ô\èQƒ@H¤C\Í\Í\Íwš„€š‰\äHwic°xXlBj‰“\'O\ZB\"\ÝÍ–\ß\×r“P“øù\×_m‰tC\â«\æ\æ\æß™„€šCbxx\Ø \é.mœªT*«MBH@\Õ.\\¸0 $’\Þly¢µµuƒI	¨Ú·\ß~+$–6>onn\ÞlBªvúôi!°´ñŸJ¥òŠI	¨\ÚgŸ}6ö­\rI/m+®\í&!$ jÇŽ;\n„D\Ò!ñ\ÏJ¥òg“Pµ#GŽ	„„¥C­­­ï˜„€ªõõõ=´„D\Òw$\×_MBH@\Õ>üð\Ãü\î»\ï6„D\ÂZ[[ÿže\Ù\ßLBH@\Õö\íÛ—/Y²\Ä iß‘\ØW\\ÿ0	!U{\ï½÷ò\Î\ÎNƒ@H¤{²,;hBª¶{÷\îü\Þ{\ï5„D\ÚK)B\â°I	¨\ÚÎ;óû\î»\Ï iß‘\ØQ\\ÿ2	!UÛ¾}{þ\àƒ\ZB\"\í;*B\â\ß&!$ j¯½öZ\Þ\Õ\Õe‰„eYö\Ç\"$LBH@\Õ^z\é¥ü\ÑG5„D\ÚK›Š\ë¸I	¨Ú–-[ò+VB\"\íø}qý÷\â2Ç‚\âúUSS\Ó\Í&#$\àŠž{\î¹|õ\ê\ÕHg?Ä‚,\Ë\Î\á0R\\\â\é¿?p\í7-!Wôô\ÓO\çk×®5„DZw >˜\" \â\Z\í\ì\ì¼Ñ¤„\\\Ñúõ\ëó§žz\Ê ‰Ý•(®©\îFô™’€i\é\é\é\É7n\Üh‰ôb\â\n‰,\Ë~fBB¦eÕªUùó\Ï?o‰\ïJ\\nD<R\Üt„L\ÛO<‘¿ð\ÂHP¥RyerH´µµe&#$`Úº»»óW_}\Õ ‰ºø\rŽñø\ÜD„T\å‘GÉ·m\Ûf‰t—8º\ÇC\"þ³‰	¨\Ê<\ïØ±\Ã iß•ø¦ˆ30µ/¾ø\"?zôh~úô\éKÿ\Ýò\å\Ëó]»vB\"·\Þz\ë[ZZz.ž%qª¸†\'\í“8_\\ÿ+®±‡¢££\ãzS0\æ™gž™\ê\0š\Ød•/^¼xBh€hq\äuœVY\ÄÁ¹+F5\áŠó&²,û8Ž\Í6E!A\âó\âMd\Ê75k\ÖB¢Á\î@!°÷J¯ýi^Ü¡$\î\ÙgŸò\"–?@H4†E‹\Ý\Ö\Ú\Ú:4ùu{£¶nÝš÷öö\æÇÏ‡††\Æ\æÿüò\Ë/ó>ú(\ã7Æ¾\Õu™s&\Î677\ßiºB‚DE(Ä¦ª\ËED—\rB¢a6P.mkk›p\àTœ‘pþüùi\Ïöð\á\Ãcö›ü,Ž\â\ç¯7e!A¢bù\âr!aoB¢q\"¢¼”ûŸö\ì\ÙSU@L¶w\ïÞ¼££cò\Ý	1!$HQÿ÷\"\â\å—_6„Dƒ,g1Z^\Æø\ä“OfdÎŸ~úiþð\ÃO¸3a™CH¨ò›Aüµ2<<l(‰\ØXY\Þ{fRü¼òûGì™°SH #GŽ\\z#Ø²e‹ $\ZcIcoù„™ºq¹;“–9<v\\H¢8Œ*\ÞNž<i‰:\çD”÷EÄžˆk)öL”—GcI\ÅG½ AÅ²\Å\Ûo¿¯[·._¶l\ÙØ¡S\å7€xóYºti¾v\í\Úüõ\×_;o„D}‰Ã¦\Ê\ß\Î8w\î\Ü5ŸûÊ•+\ËKû¨4˜±¯tN‡+]?þø\Øq\Ú $\êcoDù\Ä\ÊøŠ\çl(/‘\Æ	˜ÅµÀÇ½ A\î@\Äq\Ø3q’]Ü¥p‡!1\ï÷F¬/o°¼š¯yV«|hU<›\ÃÇ½ \Î\Å_÷\ÜsO>“\'Ùµ··\ç}}}†‹˜¿\Ë\ZŒ¿^·m\Û6«³ó\Í7\'¡\í\ã^HP\Ç\Þÿý\ï-c\Ì\ÔIvq\Z¦§„\"$\æmHœ\Z­\Æ³)\Þ_J\ïg|\Ü	\ê8\"f\ã$;1˜ŠðKû#Nœ81«³;š\åGû¸Ô¡XÎˆp˜“\ì\âÎ„e„Ä¼»#q\é5:¾l9[\â÷•¿{!A‰•\å=³q’]ì™°!1?Cb.	!A‹og\Ì\ÅIvñ\à/\îH¸#!$¨cqN\Ä\\ždK* $ì‘°GBHP§â°©¹<\É.­!\á[¾µ!$¨C±7¢üUÏ¹8\É.î†œ9sÆ¿„\ÄÜ‡„s$„T\'¾†9N²‹gs€˜ó¥sõ~\Ð\Õ\Õ\ådK!A=ŠpÍ‡¿@\âms+žµû<kCHÀ´\ÅS<\çÃšhgg§‰ù±¼\ÑW\Þ35w%\Ê\'\àzú§ Î”÷G\Ì\å.\í\Ø\'Bb\î555\Ý\\¼&G\ç\ê[\\‹-º\ÍG½ ŽÌ§ïƒ˜›.¯õ¹2“\ØgúB‚:‰?‰\ï\ë\è\è¸>Ë²³\×ú¤Û‡z¨¼¤q6~¯\é	Ü‘pG!\Ñ\0š››\ï,/q\Ìô³w\Ê¿\'~Ÿ©	\ê= $¦ˆ‰å˜˜©§OZÎˆ»\ëM[HP§|k„D511þmŽÃ‡W5\ÛøŠ\ç“O>9! \â\çŠ!AsŽ‰\é,s”÷L”—;\â}\ã\àÁƒcw4Ç—G\ãŸq\Ç1b#^\ç\åÃ¦\Ê{\",g	\ZÀÎ;óùp’“-ófù\ÛWyõ\ÙX)$hñ¬ò“?=k!ÁTâœ‰,\Ë•OÀœ\Î\'V\ÆaS\Å\ëý7¦($h0kÖ¬\É\çò$;OÿDHÔŸ8Nû\â³9\â.Å©ò#\ÈKG]Ÿ‰pÅ³3{-$h`ñ¢\Ï\ç\ê$»¸;B„u¬¼\ér6O²‹»! $@HP\çóööö|6O²‹\ß¿„	\Z@__ß„%Žky’]üžø} $@H\Ð@\Þ}÷\Ý	1q­N²Ûµk—a#$@HBL\Ì\äIvñsEB„	,s”÷L\Ì\ÄIvñó,g $@Hˆ\ØYþ6\Ç\Õ\\ñ\í+ $HPœ3±jÕª	\'`N\çŠÿ}6\Õ\ß\ßoˆ	¤.ŽÓŽgs\Ä]Šxjhù\ä\ã\áOñŒpÅ³3{\0! $@H\0 $@H\0	\0B„€\0!€@H\0 $@H\0	\0B„€\0!€@H\0 $@H\0	\0B„€	\0„	\0!B@H€\0 $\0	\0„	\0!³CCC^\í\03ldddTH\Ðð.\\8zð\àA¯x€v\èÐ¡Á\âmöœO\Z\Z\ÚM7\Ýôñ\í·\ß\î0\Ãn¸á†¯Š·\Ù>iht®»\îº\ïn¹\å–\Ñ\Þ\Þ\ÞÑ‘‘¯~€«XÎˆ;#b8\Þc}ÌDL\×þ‹ÿ§\Ï].—\ËuUW,gô‰\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\àªý-\ä\n7·O2\0\0\0\0IEND®B`‚',1),('72507',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png','72501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0\"…IDATx\Ú\í\Ý\r\Õu½?p¦\ÌÌž¬©œ\Æqœ¦þN\ãT\ã­i¼S7/wj*j\ÈBöœ=gwqDADÔ›Áóo”¥”Y^5eºeSš^TTŒQ|¾ ’Š‰¢\"ø\Ä3üþ\ß\Ïi—\Ë.°\ìù\í\Ã9¯\×\Ìwö\é\ìŸó\åû>\ß\ß\Ã÷;l\0\0\0yS.½3\ë®\Õ\ê\ë\0 l»	Æ®aÚ—¯€°¶\0 l@\Ø\n[\0¶\00 a\ëjd\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0xY–vë­·\Þ8{ö\ì\r³f\Í\Úyö\Ùgg\í\í\íYsss\Ö\ÖÖ–y\æ™\Ùô\éÓ·Íœ9s\Å\äÉ“\ÏR1\0\ØO/½ôR\Ëu\×]·\îŒ3\Î\È&Nœ˜]}õ\Õ\Ù}÷Ý—­\\¹2Û¼ys¶mÛ–­^½:{ðÁ³9s\æd&L\È&Mš´s\êÔ©-•J‡«\"\0t?“=ü\Î;\ï\\{ú\é§gi&›=úè£•P\Ý_K–,\É\Ò,87n\\–fÁ3U\0º\Ìfö³Ÿ\íœ2eJ¶hÑ¢¬/ž|ò\Élò\ä\ÉÙ©§žúr{{ûaª@\Ã[¿~ý\ä\éÓ§g—^zi¶nÝº¬\âpsü¼\ÓN;\íu‡•høm\í\Å_œmß¾=«µ\Ë/¿<f¸¯>ü\Õ \á\Ä9\Ú8t3\Ð<‚¶\ÓOúÓ¬µµu¹Š\Ðp\âb¨8G[«C\Ç{;¤<aÂ„¥RiŠª\Ð0\âðq\\uW÷‡¸hª¥¥e‡ó·\04Œ¸6n\ï\éO\\pÁ¶\æ\æ\æ›U€º+CÅ‚ý5«\íô\ÄOdifû¦‹¥\0¨{·\ß~ûÿ\Ä\ÊPy^Õ“ööö\Åbqœg€ºk\ÇŒ\á’K.\Ù\Ô\ÜÜ¼À³\0@]‹Mb­\ãp\ï½÷nOaû‚g€º»÷Ä¦a\íÚµ;S\Ønõ,\0P\×b{¼\Î\Ý{ú[ll[ôy\0¨kvI\ØP÷N:é¤œ\Ù\î¶\0Ô½³\Î:kÀ\ÎÙ®^½z›s¶\0Ô½ó\Î;o\ë@]|ë­·®v52\0u\ïüó\Ï_>P÷\ÙNŸ>}•ûl¨{“\'Oþö„	d©X®\Ñ\nR\04J\à\î\èïµ‘.\\‡­@c˜6m\Ú]?úÑú5lÇ¿Ê®?\04Œööö\ÃN>ù\äK–,é— ½ÿþû\×Æ¬\Ö~¶\04”I“&M\r\ä×­[—k\ÐnÚ´iG¹\\Þ–‚vŠª\Ðp&L˜°ò’K.\Éób©\éw¬.‹\ËT€†+¥\î\ÚÙ³g\ç¸;§Nú|\ÜW‡­U€†\Üñ\ãÇ¯þñœmÜ¸±f‡ŽO;í´¸ \ê\çi #p\Û\ÚÚ–r\Ê);/^\Üç‹¡\âm:6£€.\â\"¦\Ö\Ö\Ö\í\çwÞ›º½9´ü\ÐC­‰sÀW»\n\0z³\Ñ4+½>f§cÆŒ\Ù9kÖ¬Mw\ß}÷öU«V\íˆýh;w\ï‰Mn»í¶µ±c¬!÷\Ñ:l\0½Â³-µy©-O¼)¶Ç«j[\ãœljc	F+C@\í8›1c\ÆA*\09†­Y,\0\ä¶MMM\ïR	\0\È1l\Ý\Ò\09‡m[[Û‡T\0òÛ£Fú°J\0@Ža›Ú‘*\09†m[[\ÛGT\0ò\Û\Åbñh•\0€Ã¶¥¥\å•\0€œ”J¥\'žx\â§T\0ò›\ÙnO\í_T\0ò\r\Û\ãT\0rR,\ßlmmýœJ\0@~3\Û7…\Âñ*\0ù…\í¶¶ÿ¡\0_\Øn-‹_V	\0\È1l\Ë\åò\×T\0ò\Û-…Ba¤J\0@~a»9\ÍlG©\0\ä¶›Š\Åb“J\0@Ža[JT\0r’fµSÖ¶ª\0\ä7³Ý\Âö\Û*\0ù…\íú4»§\0“4«]—\Ú)*\0ù\Íl\ßHa;Q%\0 \'\Åbñµ¸“U\0r’fµ¯\n…3U\0r’fµ¯¤öŸ*\0ù…\í\Ú\Ô\ÎU	\0\È/l×¤6M%\0 \'\Åbqu¹\\>O%\0 ¿™\íª¸3U\0òÛ•©]¨\0_Ø®H\í\"•\0€œ‹\Å\Ë\åòT\0rR*•^(\n?Q	\0\ÈIssóò4»½T%\0 ¿°}6µ\Ù*\09I³\Úe\årùr•\0€œ”J¥¿§À½B%\0 ¿°]Z(þK%\0 \'\Í\Í\ÍO¥vJ\0@~aûDj×ª\0\ä¤X,.)•JsT\0ò\Û\Ç\Ê\åò\ïT\0r\Ò\ÜÜ¼8\îõ*\0ù…\í¢\Ôþ¨\0_\Ø>œÚ*\09)‹–J¥›T\0r’‚öþB¡ð?*\09inn^˜\Ú_T\0ò\Û{R»M%\0 ¿°]\Ú<•\0€œ”J¥»‹\Å\â*\0ù\Íl\ïJm¾J\0@~a;/%«\0\ä¶·\ÅER*\09)‹s\ãö•\0€œ”J¥[R\àÞ§\0_\Ø\ÞK6ª\0\ä$6!ˆ\ÍT\0rR(þ”f·ÿ«\0“´ˆ\r\äU\0rR.—W,S	\0\ÈIš\Õþ6…\í•\0€ü\Âöº\Ôþ¦\0_\Ø^“\ÚS*\09)\nÿU*•–ª\0\ä$\í¯\Ó\Ìö\ï*\09)‹¿LaûŒJ\0@NR\Ð\ÎN\íY•\0€üf¶—¦°]®\0“R©tI\n\Û\çU\0ò›\Ù\ÎJaû‚J\0@NR\Ð^”\Ú\n•\0€ü\Âö\Â\ÔVª\0\ä¤\\.Ÿ_,W©\0\ä7³‘\Ú\Ë*\0ù…\í´\ÔÖ¨\0\ä¤P(|¿T*­U	\0\È/l\ÏI3\ÛWT\0ò\Û3\Ó\ÌöU•\0€œ¤Y\í\äb±øšJ\0@~a{Zj¯«\0\ä¤P(œZ*•\ÞP	\0\ÈI±X—f¶\ëU\0r’fµ\ßNa»A%\0 \')hÛ„-\0\ä¶\å\Ô6ª\0\ä¤X,6¥°Ý¤\0“r¹<*…\íf•\0€ü\Âö„4»Ý¢\0“4«ýzj\Â\0ò’fµ_Na»U%\0 \'£Gþb©TÚ¦\0“´ÿžf¶\Â\0ò\Ò\Ú\Úú¹b±ø¦J\0@NÒ¬ö¸Ô¶«\0ä¤©©\é3\Â\0rT.—Ma»C%\0 Fbµ¨Ô²}´T\n\0P©Tú\á¾Â¶P(|S¥\0 ¿\Ù\ír€>*‹³z\nÛ–––¢\n@mf·\ë»	\ÛU*\0µ\Ûi]Ã¶T*MT\0¨m\à¾Q¶¯¨\0\ÔXš\ÉN©š\ÕNQ\0\Èqv«\0_Øž+l²²,;dÙ²e/,\\¸0»\ãŽ;²\Ûo¿];€6oÞ¼\ì¯ý\ë\Î\Ô.×«ôq}\ØMB,\ÈV¯^mÝºU\ëC[³fM6þüiPš¥g\é\ãú8°K¼\Ú7\Õv0J³€­z–>®»\Äa5Hm[rÓ³ôq}\Ø%þ\Ó<Dú¸¦\Ã ˆ6¼¾2[ö\à\ÕÙ’yÿ·\Ò\âýøœ\Ç@¤\ë\ã@\r¢õ¯­\È¿uz¶ø–\ï\î\Ö\âsñ5ƒH\×Ç>D/,¹iA¨³½¸\äfƒH\×Ç¾DO\Üõÿzˆ\âk‘>®}ˆ¿}FQ|\Í\àc \Ò\ÇõqÀ@d \Ò\Çõq}÷@Wfö4\Å\×>\"}\\ú8=}\Ï\ì¢øšÁ\Ç@¤\ë\ã@¢WV<š=~\Ûy{^KŸ‹¯|Dú¸>ôq Šö\ìC\×\î1\Å\ç<\"}\\j1mÙ’=}\ï\å{^KŸ‹¯|Dú¸>ôa Š\Õs–\ÞsY\ç³\âkV\Ø1\é\ãú8p Qz5¿ò\é;³\Ç\æN\íq\êlñ˜x¬€H\×ÇýˆöõJ\ßÀ@¤\ë\ãzôq ÚŸWú{›ˆDú¸>\ìc :\ÐA¨³ˆDú¸>\ìc \ÒDú¸¦ƒ\È@„>®ƒ\È@Ô³\æ\æ\æ¶\Ô^\Òûôqa\"­\ÆQGÈ®J-‹¦÷\é\ã\ÂDZ¢®!+lõqa\"­FQ±X‡‹»†¬°\ÕÇ»k[†Ð‚\Â„\í ˆº›\É\n[}¼§¶t\éÒ¬¥¥e\È®°a;X\ÂVDm°÷™+¯¼2+•J\Ùò\åË…-\Û=[úÝ¶\Þ|\ß\Û\Þö¶\ìè£\Î\î¸\ãŽ>ÿƒi *\nç¤~½™mcöñx û\Â¾½ý\ío\Ï\ÞñŽwdŸÿü\ç³{\î¹g\ÇmØ°!;ù\ä“+}\â¿øE\ÍúrõÏ¹ûî»³\ã?^\Ø\ÂPŸ\Ùöv€¨~ü“O>Yyÿ\ãÿx½^ 5-µ7„mcõñxô\ÑG³Gy¤òþ‘G¹\Ç\ãn¼ñ\Æ]}bÌ˜1Ù¡‡ZóŽµ~1*la\rD¯¼òJv\Ê)§T^\ÕÇ«ûSO=5{\ã7º}|\ç7\Þ_³fMe\Ð\éœœx\â‰Ù‹/¾˜ýö·¿­<®µµµò¸xL|<gÎœ\Ý~^O\ß_;üð\Ã+S¼ÿ\Ë_þ²ò=?û\Ù\Ï*\Ç\ß÷\îw¿;·¨c¦û†°mŒ>Ÿ‹\ÇÇ‹É½ý¬3\Ï<s·a1Ž¯7®ò3Ž=ö\Ø]?£óû>ý\éOWþ¿D=\ï¼ó²o}\ë[•\ßý;þ?T?6>ß›¹°…!6\Å Ÿ‹ü\ÃþPy?£®\ï|\Õÿ©O}ªòq{{{\å\ãøü¢E‹*\ï\å+_\É^z\é¥\ÊûGuT\åqù\ÈG*¿ð\Â»ý¼ž¾?¾ƒÒ‡?ü\á\Êûƒ\Úq\ÇWùøˆ#Ž\ÈN8\á„þX\Ô\"fº\ëõ¾ú\î\ã_|q\å\ãw¾ó\ÙÄ‰+3Ü®?kÉ’%ÝžbˆðŸÿü\çJ‹\Çu\îü¾?þñÙ³\Ï>»\ë\ãø\ÝO?ýt\åý÷½\ï}{ü½f¶P\ÇQ\ç+\êÍ›7WZ\ç«\ì\îÎƒÅ«÷…\îö}Õ­óû>ñ‰OT>¾ë®»*o9\æ˜=~ÿÞ¾ÿ?øÁn³\á÷¾÷½»}\Ü9\ë5\é\ã}\í\ã\Ñ\âm¼ø‹À¯E\0Wÿ¬\Ë/¿¼Û°ý\Æ7¾‘½ö\Úk=þ¿\é\éo\ê)`…-\Ôñ@\Ôy­z ŠA§\ë\ã\'MšTùü-·Ü²\Ç\0\Öõ÷\Ä!¾3\Ð\êp\ì.l»ûþ\Î\ÙG\Ìb\ãm\\Zýñµ\×^k \Ò\Çk\ÒÇ«[\çÑ—\ê\Ð<ø\àƒ³\ï|\ç;=^A}ýõ\×\ïú™ñ{„-ˆºý\Ï\Üy8·ú[„e\×\ÇÇ€“\Ä\á¯”\Ê\år\åk¿úÕ¯vbŽ«:«\Ã2\ÎW\Å\Û\ßÿþ÷{ü¼½}\ÜZQ=›Ž\Ï}ö³Ÿ\Ýõ¹¾\\m \ÒÇ«ûx\\ð\ÇU\É=ôP\åý\è\çñµ~ðƒ\Ù\'?ùÉ½Þ®\×&ü\îw¿«|ßˆ#ú¶3\ë8Ÿ\ÜÝ‹P}†ð@\ÄEñj>ZB=] u\Ã\r7T>.\nÙªU«*ƒX\çE\'q¾µóþ\Ãøþ·¾õ­•\Ç\ÆÛ¸ª\ë\Ï\Û\Û÷W<—]vY\å\ãŸÿüç»¾\ãÆ\"}¼&}<®\è¼õ\'új\\#\Ðyª\äšk®©\é\Z°q¯\íÈ‘#+\á\Zaû±}¬r-Cœ\íK\Ø^u\ÕU•³ñwt^@¥\Ãˆ4‘>¾ÿ-\Î\ÇÆ½¯‹/®\\i/\ãý\éÓ§\ë\ã` \ÒDúx^\í¹çž«\Ü¤ƒH3\é\ã9µµk\×fcÇŽ\Õ\ÇÁ@¤ˆôñ<Z,\ÙW\Ç9\Ûu\ë\Ö\é\ã` \ÒDúx-\Ûý÷ßŸ~ú\éÙ¬Y³²+V\è\ã` \ÒDúx­\Úó\Ï?Ÿ]x\á…\ÙYgU¹EM‘f \Ò\Çk\Ô\â0q\Ü~;ý\ÄrŒ›6m\Ò\ÇÁ@¤ˆôñZµT\îÅ½ô\ÒK³Õ«W\ë\ã` \ÒDúx­Ú²eË²™3gf\çœsNö\Øc\é\ã` \ÒDúx­\Úë¯¿ž]}õÕ•C\Æù\Ë_j²T¢>\"\Í@¤§¶eË–\Ê:Û±QF\ì›÷\Ð\ê\ã` \ÒDúx\ÚÒ¥K+\Ë.\ÆvŽ\Ým¯ƒH3\é\ã\ØbS‚\Øi*f³ñ;cv«\Â\Ö@¤\×\èñÜ¹s+\çec\ä\Ød@„­H¯Q[²dIö½\ï}/›1cFö\Ì3\Ï\è\ã@÷j±Yºf j´>û(Ïž=;›0aBe«<}Ø«\ì\Ê7\×¶ö\â‹/.O\ÑV=«>ûx¬ötó\Í7g\ãÇÏ®½ö\Ú]\Å\ë\ãÀ^\Ýy\çÎŸ?\ç\Ë/¿,,k0Í›7\ï\Í\Ôf\éYõ\×\Ç-Z”}ö\Ù\Ù\\P\Ù{Vz%ýÇ™™^©nˆCCƒµ\Å\Öcƒù\ï\ëh[\rBõ\×\Ço¼ñ\Æl\êÔ©Ù¸q\ã*@\r~¨½\×\Ô\Ôtpss³sDôw¿{W\êw·¦¶#µù\é\ã÷«\nPïƒž°¥ß¤þ6=µm©­,\nÇ«\Ðaû~aKˆ`€Mmkj\ÓTh£Fúp\Zøvªy¾ +•Jw\Ç!\ãb±87Ž¦¨\n\ÐPÆŽ{T\Z\0…-¹H{Qjo¦¶<…\ìgThH\í\í\íÿGØ’\Ãlö«i6»6…\ì\æôvŠŠ\0\r­¥¥\å˜8¼§\ÔB\n\Ö\ÃS»?µ…B\áOÃ‡?DU€†W.—¶\ÔB\êG³SÛž\Ú\Óñ\"NE\0þ9@¤JÐ‡>4:µ×‹\Å\â\Æ\ÔÆ©@¥R\é\ß\â• ·\â\âº\Ôww,LqÝŒ3R€n\n…ÿˆT‚^xK\ê3\×\Äy\Ùôöñ4›ý¨’\0\ìE\Z(¿‹¨ûù\â\ì¤\Ô_6¤ ]—ZIE\0öC\Z8¿ž\Ú•`/ÊŽN\í\É8¿Ÿ\Þ^³[U\ØO\åryT\Ü©t\'6ªH\áz}2N\í¡1c\Æ¡*\0½\Ô\ÒÒ’\Æ\Ò\â&• «ô\"\ì´\Ô6¥öj¡P©\"\0(\ÍVZ\ã–\r• S\Ü{úÅ³q•z\nÙŸ¨@\ß\Ãö\ÛqÁ‹J0~üøCS_¸¹\ãVž{FŽùU¨4¨žœf¶\ëT¢\áûÁ¹[ß½<zô\è/ª@m\Ù8/÷ºJ4¦\Ö\Ö\ÖÏ¥\çE\Ük^t\ÍT€ÄŽ,©½¦¥½½ý°°wÄŽO\é\í¼#F¼GU\0ò›\Ùþgj¯¨D\ã(—\Ë\çw\Ìd_L\í_U g…B\áû±\ï¨JÔ¿8›\Âuu,b’ž÷sT ÿf¶\ÓS[­õ«­­\íC\é9¾7®2N/¬nŠ«ŽU \Å!\Å4\ÛY¥õ)…\ë%K,.‹ûgU``\ã¦Áø%•¨»Q\'¤\çö\ÕX*½¨\"\0;(ÿ(.”Q‰úk§€}¸caŠ\ß\Ç\ÚÆª0ð3\Û8\Ìø¼Jyo‰\Ýx:Bö‰Ø¥GI\0‰40_–\Ús*1¤_0…u\éy\\ŸZ›Š\02iô\Ë4@?£Cò¹ûhjK:¶¿»j˜=f\í\Ìö\ÊÔžV‰¡cÆŒ¥p‡ŒS\Ø.\Z;v\ìQª0¸\ÃöšÔžR‰!ó|œ\Ú\ÆXÏº\\.R€¡1x_—\Ú\ßTbpK3\ØO¤\ç\é\ïq\ÏlœgW€¡5ˆÿw\Z¼W‰Áiøðá‡”J¥\â¼lz®\îKoW€!&\r\Þˆó~*1ø\n…3\Ós³%Ö®njjúªŠ\0Ý°½!\rè¨\Ä\à\Ñ\Ò\Òò\Ù\æ\æ\æå©½™\ÚE*0ô\Ãö¦¶ª\ÄÀK³\×w¥p½µcaŠù\é\ã÷«\n@}„\í-q.P%V\Ç\îK\ÛR[Y(ŽW€ú\Z\äc&u¯JŒ\Ö\ØÔ¶¦6ME\0\ê3l\ïH\í¯*Ñ¿\âq©Tº»caŠ¹qYU\0\ê7l\ç§v—Jôk\Í/\ê¸øiy\n\ÙÏ¨@ýüR›§ý2›ýj\ÜÆ“\ê½9½¢\"\0¶÷\Æy[•\ÈO,D‘\Úý±0E¡PøS,T¡*\0\r¤cU¢[T\"·3³;–X|º¥¥\åh\ÌY\×Ci¶õg•¨yÈŽŽ\ÍÒ‹™©S€\Æ\ÛÿC›*Q±\Ý]\n\Ù\ÅS\\\Û\á©\n€\Ø\â4óº^%ú\ì-±]aœ—bcw% 3l#þ[%\\¡P8)\ÕqC\n\Úu©•T€®aû·8Ü©½—^¤Ú“qTz{E\ÌnU€\î\Âö©4»J%ö_SS\ÓÁq\è=\ÇfcÆŒ9BU\0\Ø[\Øþ=Æ¯Ub¿\ëuZj›R{µP(ŒT\0ö)\ÍÐ–•\Ë\å\ËUb\ïRŽM/JžeS\ÈþDE\0\è\ÍL\í¹\Ô.S‰\î?þ\ÐTŸ›;n\å¹g\äÈ‘P\0z¶Ï§\Û%*\Ñmm\Î\í\Øú\î\åÑ£GQE\08\Ð@YQ,/V‰jmmý\\\Ô%6sOµ™©\"\0ô5lc\ãòUbØ°ööö\Ãb\ß°;c\'¤#F¼GU\0¨EØ®2{«\\\0u~\ÇLö\Å\ÔþU\Ï\0 –a»:µ\éú\ïs±)\\£[\n…\Â9z\05›™§ù~£ý»\Û\Ú\Ú>Ô±—o,LqS\\u¬7\0\×\Ìö\Õ6g7\ØŒK:–XŒ{Œ\Õ\0\ÈU\nœ\×RðLn„k\n\ÖRÐ¾\Z+@¥·=û\0ô\×\ÌözžX»8ý;\îX˜\â÷±¶±g€þœÙ®Ktrþó\Þ»ñt„\ì±Kg€˜\Ù\Æ>¬ß®·W\é\â…\Äú\Ô\Ú<\Ó\0d\ØnL­\\G3õ¦¶¤cû»\Ø:\Ð³\0x\ØnJ\á\Ô4\Ôÿ3f\Ì8(…\ëœ8dœþ=‹ÆŽ{”g€Á¶›…\Â7‡ø¿\á\äŽú\ë\åry”g€ÁT[RûúPü\Û\Óö\éoÿ{\Ü3k›@\0s\ØnM¡õ\å¡ô7>üR©tCœ—Mû}\é\í\ážI\0s\ØnKaõ\ïC\å\ï-\ng¦€\Ý\ËL655}\Õ3À`\Ö\å©eÝ´8ûfG{#¶šl{KK\Ëg;þþø/òl0(•\Ë\å¯õ¶»Zš5^?˜þ\æ4{}Wú»n\íX˜b~úøýžI\0û\ìöéž‚6Î¦Ymlý‡¹cƒûB¡p¼g€!?»,³\Ú\ÖØ¸x+µiž5\0†œ\ØZ®»ó¶=«C\Äiv}w\Ç\Âs\ã²g€!)±\è&l¯È¿).z\ê¸øiy\n\Ù\Ïx–\0òR¨½TuøxcÜ»:@³Ù¯\Æm<±’Uz;\Å3@\ÝH;®\êÂ¨úû÷\ÇB©\Ýe¥™öŸ*\ì \ï\Ù\íªÛ‘#G~ Ÿ\ï\ìŽ{{Ÿnii9\Æ3@=‡mÛ¨Q£²\Ø1§Ÿ~\ß\è\Ø, [\Ç\Ì\Ú3\0@#8\'µ,µ™yþ’\Ø\î.…\ìâŽ…)®\ë¯p€Á´;S{¤\ãmû–®\×\Äy\Ùôöñ\Ø\Ø]\Ùh´ \í\Øiµ\ÜB¡pR\n\Ø\r)h×¥VRr\0\Z9h÷õù^I³×£S{2.€Jo¯ˆÙ­’ h÷üz¯—Hljj:8–{ŒCÆ©=4fÌ˜#”\0AÛ½^RN³\Ø\ÓRÛ”Ú«…Ba¤R h÷-wÇ¾f¸\årù\Ø4‹}6–YL!ûe@\Ðöþûvt÷}\ãÇ?4\ì\Í·ò\Ü\Óß‹b\0@=m\×\ï\ß5\ÃM\ázn\Ç\Öw/=ú‹J€ ýg\Ð\ÆUÁ¿¶ï«ƒ»>®r÷\È#¼*\ìŠ\ØÌ½X,\ÎT^\0\ížAûÔ°¬õ\Ô^·\Û\Çz\è¡3N8\á„\ìK_ú\Ò3#FŒxò h÷<tü\ëŽ\0\Íö¸\ÕA\ÛÙ®\èüb\î°üVš€!´=iu\à\î\ë\ëj¾\Ò\0\ÔC\Ð\î+p\ÚÏ ­þ=;.\0‚vÿwk/‚¶k\àNSz\0\íþno‚¶“C\Ê\04„£:BrI/¿\ï nf´[;>\ßs;¾÷(O\00³\Ý\ßCºµž\Ùþ\ÐS\0@#n³\í\\;\Ù!d\0\î>‚ö@¯F> mø\0 ^·»«„kuŸm\Û0W!À®s©Õ\Ø\ç¤ªf´³”\0j¼6² €½\Ïp«÷Šaû·\ëOõ\ã\ÜO\0û˜\áö\å« €³¯\Ï@\Ã\Íp{œ‚\0p†»?‡”Û†¹\n\0r›\ávž\ã´\0C\àvw.\0\Ð\ÇÀV´V†€\Z\ëœ\É\Îf÷\0\Èo†\Û\ÜÜœ	Z\0\ÈQG\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0c°®Šp\ÝGÛ R\0p\àaÛ¶¯°-‹3U\n\0ú¸kö¶\ë‡~ˆ*@N³\ÛR©ôC€\Únw\çn7˜\Õ@Ž³[\çj öû’Y-\0\ä(\Íd\ÇU…\í4€|f·•s·fµ\0P¨1ƒMmA\Ç\í?[»œ·Ýž\Ú+©-,—Ë—···¦j\0°N<ñ\ÄO¥\0Ÿt\Û~¬U}ÐŽb±¸$½ý7U€f²),ç¦\Íz²=´…fº\0Peô\è\Ñ_L3\Ò\Í]Cs\âÄ‰\ÙW\\‘\Ýw\ß}ÙŠ+²Í›7g!Þ®^½:{øá‡³\ßü\æ7Ù”)Sº[\ÆqS¡Pø¦\ê\Ðð\â*ã–––\ÕAù\Ý\ï~·¤Û·o\Ïö×¢E‹²©S§v\rÝ\î\Ç áƒ¶ú°q\n\Ý\ì\æ›o\îU\Èv5w\îÜ¬½½\Ý\0‡ŽS\Ð\î¬>d¼t\éÒ¬ž{\î¹\ìô\ÓO\ßm†\ë2\0\r%.†ª>GA\ç`k)~^u\à\Æ9\\M\Ð0\âª\ã\êCÇµš\Ñv7\Ã\írHù\Õ \î\Å}´\Õ\çi\ãmž\ânõù\Û8|\íY\0 ®Å‚\ÕWoÛ¶-\ËÛ¹\çž[}8y‰g€º\çj«W†Š\Û{úÃ£>º\ÛJS©\î\Ù\0 .\Å-8\ÕEõ\åŸÞª^ø\"\ÖRöl\0P—:6¨Þ•W^™õ§9s\æì¶œ£g€z\r\Û5K0ö§8d]u(ù5\Ï\0u)…Ü®óµ+W®\ì×°ûn«·\çól\0P¯3\Û]×¹©@‰\ßWýû=\0\Ô}\Øa€™­™-\0ôs¶\0ÿ\Ì\Ö\Õ\È\0sØº\Ï\0ò”f”?¨¤\Î8\ã+HPÿbm\ä8_jmd\0\ÈQ\ì)[½\ëO\Ìn§Nj\×\0\ZG\ìg›Bo§ýl \ß\Ù\í®¥ZZZ²¥K—\æ´\Ï=÷\\v\ÒI\'U‡\íª@Choo?¬X,nª¾X*îƒ­õ}µ“&Mª>|¼)~¯\ê\Ð0\n…\Â7«\'G\à\Öj†3\Úê \ß¿O\Õh\ÄÀ=§:p\ãrœ\Ã\í\ËESqŽ¶Ë¡\ã˜\Õ\ÎTm\0nU8\ÆUÊ‹-\êõ\í=Ó§O\ß-d\ã\ç\nZ\0øG\à~³únõ¡\åXi\êÁ¬¬¥Ü¹yA¼s²È±2Tõ‚\Õ\çh:€*qñRõU\Ê}l¸\n\0z÷\á¦Y\é#\Õ+M\íO‹•¡bÁŠr¹ü5U€ýK;v¬¥³\Ý5\Õ\ÛóU-»øZl*k[‚\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Á\æÿ8³À\Ê;y‘k\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','75001',31),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('15001','SpringAutoDeployment',NULL,NULL,'','2019-06-04 11:49:32.248',NULL),('20001','SpringAutoDeployment',NULL,NULL,'','2019-06-05 05:41:31.246',NULL),('22501','SpringAutoDeployment',NULL,NULL,'','2019-06-05 07:24:19.689',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('32501','SpringAutoDeployment',NULL,NULL,'','2019-06-06 09:13:05.403',NULL),('35001','SpringAutoDeployment',NULL,NULL,'','2019-06-11 10:27:19.951',NULL),('37501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-16 06:57:21.527',NULL),('42501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-16 07:02:58.463',NULL),('50001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 07:31:13.625',NULL),('5001','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('52501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 07:53:59.662',NULL),('55001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:10:11.456',NULL),('57501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:29:30.127',NULL),('60001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:30:15.072',NULL),('62501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:38:10.254',NULL),('65001','SpringAutoDeployment',NULL,NULL,'','2019-06-29 11:55:04.995',NULL),('67501','SpringAutoDeployment',NULL,NULL,'','2019-07-01 09:31:55.119',NULL),('70001','SpringAutoDeployment',NULL,NULL,'','2019-07-02 07:35:10.298',NULL),('72501','SpringAutoDeployment',NULL,NULL,'','2019-07-03 09:32:15.017',NULL),('7501','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcessæµ‹è¯•',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:65006',1,'http://www.activiti.org/test',NULL,'Contract',1,'65001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:2:67509',1,'http://www.activiti.org/test','åˆåŒ','Contract',2,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:3:70009',1,'http://www.activiti.org/test','åˆåŒ','Contract',3,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.bpmn20.xml','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:4:72509',1,'http://www.activiti.org/test','åˆåŒ','Contract',4,'72501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:10:50004',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',10,'50001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:11:52507',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',11,'52501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:12:55006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',12,'55001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:13:57507',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',13,'57501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:14:60006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',14,'60001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:15:62507',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',15,'62501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:16:65007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',16,'65001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:17:67510',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',17,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:18:70010',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',18,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:19:72510',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',19,'72501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:1:2506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:5:15006',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',5,'15001','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:6:20007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',6,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:7:22506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',7,'22501','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:8:32506',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',8,'32501','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:9:35007',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',9,'35001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:10:52506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',10,'52501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:11:55007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',11,'55001','EntrustProcess.bpmn','EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:12:57506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',12,'57501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:13:60007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',13,'60001','EntrustProcess.bpmn','EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:14:62506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',14,'62501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/æ¡Œé¢/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:3:15007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',3,'15001','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:4:20006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',4,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:5:22507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',5,'22501','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:6:32507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',6,'32501','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:7:35006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',7,'35001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:8:37504',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',8,'37501','processes/EntrustProcess.bpmn','processes/EntrustProcess.png',NULL,0,1,1,'',NULL),('entrust_process:9:42504',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',9,'42501','processes/EntrustProcess.bpmn','processes/EntrustProcess.png',NULL,0,1,1,'',NULL),('myProcess_1:1:67508',1,'http://www.activiti.org/test',NULL,'myProcess_1',1,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL),('myProcess_1:2:70008',1,'http://www.activiti.org/test',NULL,'myProcess_1',2,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.bpmn','/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL),('myProcess_1:3:72508',1,'http://www.activiti.org/test',NULL,'myProcess_1',3,'72501','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL);
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
  `user_id` bigint(20) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_contract`
--

LOCK TABLES `tbl_sys_contract` WRITE;
/*!40000 ALTER TABLE `tbl_sys_contract` DISABLE KEYS */;
INSERT INTO `tbl_sys_contract` VALUES (1,'p20190606171309','13',0,'A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','85733','A','A','A',5,'A',NULL),(2,'p20190606171310','34',0,'B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','2357','B','B','B',5,'B',NULL),(3,'p20190606171311','21',0,'C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','5225','C','C','C',5,'C',NULL),(4,'p20190606171312','31',0,'D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','36432','D','D','D',6,'D',NULL),(5,'p20190606171313','2',0,'E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','12343','E','E','E',7,'E',NULL),(6,'p20190606171314','4',0,'F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','1123','F','F','F',6,'F',NULL),(7,'p20190701205847','7',0,'G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','1141','G','G','G',5,'G',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (1,'70011',1,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ',' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171309','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134344','',NULL),(2,'70019',1,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ',' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171310','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134344','',NULL),(3,'70027',1,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ',' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171311','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134344','',NULL),(4,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171312','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134754',NULL,NULL),(5,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171313','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134759',NULL,NULL),(6,'',0,'æµ‹è¯•æ‰€éœ€ææ–™ä¸å…¨ï¼Œæœªè¾¾åˆ°å—ç†æ¡ä»¶ã€‚','å·²å®Œæˆ','æºä»£ç ','90','2','æ— ','Linux','100000','ä¸­æ–‡çš„ABC','ABC','NJUse','æœºå¯†','æ— ','2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®žå®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¥½å¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æž—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','ç”¨æˆ·æ‰‹å†Œ','p20190606171314','ç”±æœ¬å®žéªŒå®¤é”€æ¯','.TXT,B/TXT','Uç›˜','mySQL','5000','PCæœåŠ¡å™¨','æ— ','100','Java','C/S','æ— ','19.0','æ— ','Linux','little mushroom','æ“ä½œç³»ç»Ÿ','GB/T 16260.1-2006','åŠŸèƒ½æ€§,å¯é æ€§,æ˜“ç”¨æ€§,æ•ˆçŽ‡,å¯ç»´æŠ¤æ€§,å¯ç§»æ¤æ€§,ä»£ç è¦†ç›–åº¦,ç¼ºé™·æ£€æµ‹çŽ‡,ä»£ç é£Žæ ¼ç¬¦åˆåº¦,ä»£ç ä¸ç¬¦åˆé¡¹æ£€æµ‹çŽ‡,äº§å“è¯´æ˜Žè¦æ±‚,ç”¨æˆ·æ–‡æ¡£é›†è¦æ±‚','è½¯ä»¶ç¡®è®¤æµ‹è¯•','ç§‘ç ”é™¢æ ¡','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190605134833',NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062921 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testcase`
--

LOCK TABLES `tbl_sys_testcase` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testcase` DISABLE KEYS */;
INSERT INTO `tbl_sys_testcase` VALUES (2019062909,'p20190606171311','3',0,'note3','d3','3','note3','c3','p20190606171311-20190629205845',NULL,NULL,NULL),(2019062908,'p20190606171310','2',0,'note2','d2','2','note2','c2','p20190606171310-20190629205816',NULL,NULL,NULL),(2019062907,'p20190606171309','1',0,'note1','d1','1','note1','c1','p20190606171309-20190629205733',NULL,NULL,NULL),(2019062910,'p20190606171312','4',0,'note4','d4','4','note4','c4','p20190606171312-20190629205922',NULL,NULL,NULL),(2019062911,'p20190606171313','5',0,'note5','d5','5','note5','c5','p20190606171313-20190629210039',NULL,NULL,NULL),(2019062912,'p20190606171314','6',0,'note6','d6','6','note6','c6','p20190606171314-20190629210242',NULL,NULL,NULL),(2019062917,'p20190606171312','7',0,'note7','d7','7','note7','c7','p20190606171312-20190629223943',NULL,NULL,NULL),(2019062918,'p20190606171309','8',0,'note8','d8','8','note8','c8','p20190606171309-20190629224200',NULL,NULL,NULL),(2019062919,'p20190606171312','9',0,'note9','d9','9','note9','c9','p20190606171312-20190629224229',NULL,NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062908 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testplan`
--

LOCK TABLES `tbl_sys_testplan` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testplan` DISABLE KEYS */;
INSERT INTO `tbl_sys_testplan` VALUES (2019062901,'p20190606171309','2019062901',0,'AA','Aser1','Aser2','Abody','ssd',NULL,'nju','Aser3',NULL,NULL),(2019062902,'p20190606171310','2019062902',0,'BB','Bser1','Bser2','Bbody','ssd',NULL,'stc','Bser3',NULL,NULL),(2019062903,'p20190606171311','2019062903',0,'CC','Cser1','Cser2','Cbody','ssd',NULL,'dev','Cser3',NULL,NULL),(2019062904,'p20190606171312','2019062904',0,'DD','Dser1','Dser2','Dbody','ssd',NULL,'online','Dser3',NULL,NULL),(2019062905,'p20190606171313','2019062905',0,'EE','Eser1','Eser2','Ebody','ssd',NULL,'2019062905','Eser3',NULL,NULL),(2019062906,'p20190606171314','2019062906',0,'FF','Fser1','Fser2','Fbody','ssd',NULL,'2019062906','Fser3',NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testrecord`
--

LOCK TABLES `tbl_sys_testrecord` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testrecord` DISABLE KEYS */;
INSERT INTO `tbl_sys_testrecord` VALUES (1,'p20190606171312','11',0,'a4','000','note4','d4',NULL,NULL,'4','\0',NULL,NULL,'note4','c4','p20190606171312-20190629205922',NULL,NULL,NULL),(2,'p20190606171312','12',0,'a7','000','note7','d7',NULL,NULL,'7','\0',NULL,NULL,'note7','c7','p20190606171312-20190629223943',NULL,NULL,NULL),(3,'p20190606171309','9',0,'a1','001','note1','d1',NULL,NULL,'1','\0',NULL,NULL,'note1','c1','p20190606171312-20190629205733',NULL,NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062908 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testreport`
--

LOCK TABLES `tbl_sys_testreport` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testreport` DISABLE KEYS */;
INSERT INTO `tbl_sys_testreport` VALUES (2019062901,'p20190606171309','2019062901',0,'A1','20190620','A2','20190620',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3','20190620','1.0',NULL,NULL),(2019062902,'p20190606171310','2019062902',0,'B1','20190621','B2','20190621',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B3','20190621','1.1',NULL,NULL),(2019062903,'p20190606171311','2019062903',0,'C1','20190622','C2','20190622',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C3','20190622','1.2',NULL,NULL),(2019062904,'p20190606171312','2019062904',0,'D1','20190623','D2','20190623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D3','20190623','1.3',NULL,NULL),(2019062905,'p20190606171313','2019062905',0,'E1','20190624','E2','20190624',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E3','20190624','1.4',NULL,NULL),(2019062906,'p20190606171314','2019062906',0,'F1','20190625','F2','20190625',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F3','20190625','1.5',NULL,NULL);
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

-- Dump completed on 2019-07-03  9:57:02
