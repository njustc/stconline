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
INSERT INTO `act_ge_bytearray` VALUES ('70002',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.bpmn','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"myProcess_1\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\"/>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\"/>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"通过\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"通过\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"不通过\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"不通过\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approveTestPlanResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess_1\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70003',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.bpmn20.xml','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"合同\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"审批子流程\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"MM\" type=\"string\" value=\"MarketingManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"QM\" type=\"string\" value=\"QualityManager\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"子流程开始\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"不通过\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"reviewContractResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n          <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n          <activiti:formProperty id=\"reviewContractComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"通过\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"不通过\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"通过\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"不通过\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"通过\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewContractResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70004',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.bpmn20.xml','70001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\" activiti:candidateGroups=\"STAFF\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('70005',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.myProcess_1.png','70001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0�\0\0\0\�dZ\0\0CaIDATx\�\�\�|T����\�e-�,ժՊ�\�vm\�꺶�]Wc�V��6ɜ�3��XA�B)��>�\n\�*Te���V\\EE(�\0�\�M�\�E!r	I ��>�\������\�\�\��|�y�\�\�$�Of\�=�sΜӦ�0Ɯ\�&r����\�_�����\0\0�	\�%��k�\�7���\�ߵ�\�o��Q\��_\�\\~��t\�7\�x?oP��\���V�]z=\0�\�\�\�Q\�\�\�\����ܘ5\Z\�����|\�\��\�\�}��_\Z��!c\n�gҪ#�\�\�\�\�	\���s��9s�������\�=�\�H��~��\�\0\04,\�\�K}�\��\�\�\�N\�c\�i�w��ߙ;�\���?�mAe�	�/\�\��Nj�\�h-\�>z�f:\0@=\�ܯ�=\�<5o\�\�c�)��\��|\�M\�z�\����\�V�\�.7���\��b@Uxu?���\�}~U�nK�����.V�\0\�xS��\Z�|���?����o�>-u�ZW�5y��\���\�o�1\�>�\�\�ݱ)}\��ʸ�u���B/2fE\�2\�\r\0@\���\�*r\r\��Ж\�=к,.5[���ާ�\�\�ǅ�����7\0\0�޷\�G�\�y\�\�\n\r\�\�/�8�\�Ί\�\�\�\�$��\�#��>�_\��t�s��\�\�k\�����e\�slx?&�L\�C\�\0hxx���ҩxȄe�\�\\\�{�1�_b\��r�vr�\'nH�u�tS!.\�M>q\�ѥێ\�\��\�\�t��\�\�{jq\�.\rt]-?v\��bY\��~g{:\0@�\�{\�w��\�\�\�O,8��j5�\���n\�d=q}\�7\��\�\�=O,\�\���!\�.����X�t��n\�~��]��:LXy\�s]�\�g\�\�w�8	u�=t\0�\����N\�2�\'�C\�\�I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z2=�̙3\�7n\��ѣGW\�s\�=&\'\'\�dee�h4j`�^>r\�\�\�����\0 E>���\�ĉ�����7w\�u�y��\�͒%K̎;\�\�Ç�����\��e˖�I�&�޽{��ﾻr\�С\�9�.\0\�<��s\�\�-\�۷��I۬^�\�\r\�D�]�\�Ȕnn��v#S�H:\n\0@Oۏ=�Xe���\�ʕ+MC|�\�G�_�~�W�^�rrr:\�]\0\0\Zف�\r>\�<��\�f����1\�\�u�y}��\�\�jt\0\0\Zy\�\�\�~\�G\�ѣGMc{�\�\'u�\"--�=\�\0��t��*\�	�)�;\���\�\�\�\�J\�\0h \�9M�q7֪�V��\�ݻ\�q��t\0�z\�\�\�W�\�Q\�t\'�H$R��o\0\0\�I?ǭkN<�@yVV\�T�\0@��\�iz\0�暺c֯_od�>\�\�k\0\0$i�\�\�\�\�Ӛr\'�\�\�\�\�Tض};\0\0��\�*\�C��£�>Z���U�_\0�$\�IF�X婰hѢ�ޅ�\0\0H��LO2�\n\�\�ŕ\�e�\0\0H��\�3vv�\�\':\�S��W\0\0 	\Z��Dx\0��\�ݻ�r�$�\0H\�����m�.***g�7\0\0I\Z1bDY��6�9sf{�\0���\�k�>\�=|��|\�\0�$�\�\�\�޽{�\�kzxT��\0@�����m�x�b]eα\�\0��aÆ\�5jT��wϞ=wrV1\0\0\�)\'\'�\�w\�Q�v\�\�f	\�K�\�\�\���\0h��\�{x߾}\�����4�KJJ*\�\�p�w�\0@�\�\�{ǣ�>ڔ;�U\�\�(�m{\�\0�\�\�c2��7�)�r\�С�\�\�u5=\�\0��gϞE�\�_̡C�\ZmUy�>}t�B�s\0\�D�F�\�y睕�V�j�\�i��[W�3q\0\�\�t��\�\�\�#F�8�!�̪�\�˗\�\�m\�\�^\�\�\0@s\�iY�\�\�:=w\�֭r�\�\�%�\�\�?�s\�\�\n=�*++�ԓ�̚5�Xy�GN\�\�\�\�q��\0��0�J\�Im�@/\�\�y\�U�nӖZ��<\�\�i\0\0�;\�+�\�\��t\0�\��w�eY\�\�	\0\0�\�%��\�	\0\0\�q�b	\�!t\0�\�L޺\�\�t\0�\���\Z	\�W\�\0\0�	\�w%�g\�	\0\0\�q����\�	\0\0²�g%�7\�	\0\0\"++\�A�t\0���m����>:\0@@X�u���a:\0@@�B�\�%��\�	\0\0�ޝ�\�bt\0�\0\��\�s\�	\0\0�\�R�\�	\0\0¶\�R\�q�N\0\0�\�{�T:\0@p\�{���N\0\0��ޤ�I�\0\0���D\��-:\0@p&\�<=5(�\0\0  \�\��\�%�\�\�	\0\0¶\�\�%��\�	\0\0�3yu��N\0\0�eu�\�� �\0\0 8\�}��w9�\0\0  l\����w%�\0\0  rss\�\�\�tI7\0\0���\�\��t\0�\��w�n��\0\0\'�\�^\�t\0��\�\�yKx�\0\0g�ުGZ�\0\0\'�\�Hx�B\'\0\0Nx�+\�=�N\0\0�㼭\���\0\0�eY\�Jxo�\0\0DVVփR;\�\0\0a\�v_	\�}t\0���,\�V	\�\�t\0���B�Kx�\0\0\'�;\�\�\�\0\0�ᝓ�ӑN\0\0�𮐺�N\0\0�m�\�kt\0�\�L\���\�s\�j	�ۥFK]Dg\0\0���\�)A�W?\"&!]�ۼ�\�Ѵ���t\0\0�\�>Cù���*	�t\n\0\0��~���\�\�̼�.\0\�\0?P\�Խ�\�\0\0\�C�HĮ)�u�8\�\0��d\���ZxaG5\0\0�\�I`\�\�m�OW\0\0�9\�q�\�\�;�\\AG\0\0�9]M.�]�8\�\0\0  $�\�\�\0\0\�1ƴ߲eK\�\�ŋ͜9s\�\�ٳ�zT^^�Y�`A�ԓ<�\0\0MJ��������2��{�n���_)A>�G\0�\�\�\�Mp7n�\�$^\�#\0\�dtU9�۸��\�yd\0��\r�Kx\0Z`xܷ\�lY��Y�w�[zY�#�	o\0�\���\�\�f\�\�\�fմAǔ^��؄7\0�g\�]��\�\�;V\�\�N%�	o\0�\�\�{���k\ro���&�\0>\�5�sk\ro���&�\0�7\�\r\0@C\�[�.�-��6��\0�,�7-Wkx\�m6\�\r\0�Yx\�پڬ�5\��U\�r�\�F`\�\0\0���\�\'\�_<.��:�\0�1�KKͦEO�\�\\�\�\�l\�\0\��\�#�m\\8�\�m\�zGY#�\0~o��wl�k>�1�\�\���\�G\�\�Nx\0R\�\'���\�	o\0�\�\�;�i��)��&�\0\�\��\r\�Xބ7\0��Û\"�\0�7\�\r\0\0\�Mx\0o��\0ބ7\0\0�7\�\r\0 �\�\�0�}�aMx\0�\�\�ׯ7?��\�M�v\�4�̷��-3|�ps\�\�!���S��\�kM�0��nɒ%U\�=�\�#f֬YU_k}�\�_7g�u�y\�\�\��ӧOw\��\�?Ox\0\��ڷo�9���M۶mͯ~�+���k.�\�78�\��\��\�֭�{\�C=tLxϜ9ӽ|\�-��Q�F��\�Ϝs\�9\�u�7oN:,?�\�#3l\�0�|�r\�\0@x\�\�s\�=\�l$�����ȝ\�;t\�`JKK�\���\���9�\�\��\�p\�\r\�\�SO=.�5\�c?\�\�\�v�+((p�4h�9\�\�\�駟n\�\�SRRb���js\�5\�T}������\�\�ܹs\�y\�g^{\�Z��?��?\�m�\�\�\�>p\�@��|��ٲe�{Y\�D\�\0�\��\�{���&M:\�z\rT�^�0\�:U\�R�\�SN9\�\r\�\�\�������K�.\���t\�I梋.r\�\0,^��\�MB,ԟ}�Y�?�ɽ�p\�B�n\�:�r�~�̴iӪV�\���\�h\�}Cq�\����cƌ1O<�\�1o\Zo\0@�\n\�?��nн�\�\�\\���\�^�u\�֪�֐\�\�o�[w��mM\�R������&c�n��U�\�8��J]W\��\�\�\�:Խ~ժUǄwm\����UA�\��\�6����\��\�w�\�i �\0-.�u�X\�茌��믻��;v\�x\�6\�ɓ\'�s\�=׽��\�uZnS\�js�����J�\�q\�ƹ?�{�\�\�\�=z�0}��qk\�ر\�m:�\�\�\�U\�W]u�{]|x\�����^\�\0\�q�\�2d��*�\���\�իۼ\0-3��\�\�o���\�\�\�/~�s\�gV\�6x�\�\�\�[WU\�\����f�\�յn�ްa��\�\\\�U/��\�K\��^\�0\����\��u\�ob��g�9.�\��\�\��\�7\�m�fa\�ҥU?gƌ\�\�+V�pߘ̛7�\�ˍ\��Ƣ�������^\�\0h\���}T\��믯���\��O��O\�RV|x?��\�\�e]��\��Q��\��cbz\�M7\�\�Nə��\�vp�=���\�\�\�\�O\'~]ͭQ�]�Q���7�\�\\�n]M��\�N�:U}\�-�\�\�v�>\�amYֽ\�\�Ih�G \0�\�\�;V��������Ze$�̶m\�\Zu��ql;xs~oC\�\�7\�\�`~Fj��uy\\XS�m\�\�\0h��j.]3���mj\��\�\�̼�G \0���A�\��\�p~]����\�\�\0 �}vl�H$r����:V�I\�v�׮]O\�\�\0 �}pxT	\�3$�w\�\�\�\�m\�Nl\���\�\�\�R�\�\��<:\0�w\n�m��\�\Z\��\�\�\�t�>>6]\�SJW��\��H��yznnn;�\0\0»OL\"��ޕiii\�O�i+��Y\�;AB}�,˼@\�-�gYրh4��\0@xSM|�5	\�\�u��\�\�J�\�\"	\�%̗JU�j�\�H���˗�\0j�ã&0u\'�K�.�Jh��zG�{�\����\�%\�?��E.g��\0o\�\�\�6�оQ\��Y	\�\r��]W\�K�\��s\��@݁�G=\0ޔ�OL���sa8�_�{�ԗު�C\�+%\���g\�Y\0\0�7\�\�㳊�B�\�wHM��<��]\�S�W%\�m�\�\�<3\0��&�}L&�_\�\�e\Z�H��\�^\�\�R��*\�\�\�g�L\0��1	\�H��V�\���Z�\'Z�\��\�\�x\�\0\0\�Mx�XϞ=O����L\�o\�r�����\�V�\�_�e�U\�\0@x\�>\'A~�L\�\�%�\�\�2��}���|�mH�n\�\�\�\�\0MdΜ9.\�\�`\�h��p8<B|��\�تv���,\�egg_ų\r\0\ZIAAAEQQ�\�H�m۶�\�e��q��\�e\n�M��M	�mr9���3=]�|�\�X��Vg\�ܹ\�\�\�W\�ڵ\���XZZ\��\�\�\�\�;\"5�G\��$��� Jj��ao:�Bj�L\�Ce�=�\0	��)\�\�A]\�\�ך5k�{6.?�u\�&�ףG�\��7&U ���\�\Z\�k$\���,\�\Z�\0�\�\��-��F��qTB�\r	�Bo5�V�|=E�\�Ϊv\0ݣ���[	\�u\n\�i<��]�\�\�ޕ\Z�\�;]\0��Wddd��N�^�\�\�\�>��\�^\�j\�\�\�=]��\�%\0�]�ʉ4OW�\�\���\'�Q}��{�\�\�ǻ\��N�\0 u\�]����~�\\?[.�ZJ\�Z\�}�|�~]?�N�\0��»T^|C\'�=��<vK\�\�Q༣��J��\��\�\�\�\�\�\�\04]x\�\�h\�	4��]Bۑ��\�g��h׃\�l��ߖ\�o\�S�\�)\0h�_\�EM\'\�o\�1m�w�J\�j��kz�5�\0���\�O\'\���3�\\\�zNs=�ylU�w\��g�\�t	\0��w\�Ǆ\��[nnn�H$bKp�*��\�\�x\�KM\�5B�j�\Z\�\��\��@\��r	�G\�1�R\�X\��z\�/uU�\\�@NN΅t	\0᝕���X\�	�Q4\Z��<>\�\�\�]K\�\r�L�d����Mt	@k\��(ZtA��\�\�1�)�\�W$�?\�U\�\�^\�;\�\�i�e�\�X�\0Z<\�YH^�^��\�\�$�\�\�\���|PW�\�\��RKu���\�\�{�\�0D\'\�Rt\�\��4	��Γ\�\�\�\�^&a�Q�\�\��\�r��t\n@�\�{�D�N��\�U\�\�\�\�/\�f\"=$��\�N�<]�w\�\�\�t�S\0C�M-5�N�5�0�Tj�<�ߏ�j�:�ofe�\�H$r1]\�\�\�{�L�\�Z�P(\�IB�����\�D��W{�,7K�hYV\�6�j\�\�{�~��N\0\�h�\'\�\�\�D	q\r�r\�𮻤fJ��\���M\0RB^��\�^�t������\�\�r]Ů�\�9�9�TM\�/\�\�Z:$�\�1�@JX���~��N\0I��n?�N\0H\�\�8�O\��|xsZS\0)����mtH:�+�#gt@��\��{\�\�	 \�\�Α\�\�\�\��fgYֽ\�{\���\�]&~#�\0���>R�\���s簼���N\0hv�\�ܦ���@\�\�}H*L\'\04;۶C�TB\'���;�\�s�\0\�\�B�\�M2}�\�	 \��ޫ\�C�\0���\��t�N\0I?w�-\�\ZB\'\04;���~^�N\0ɑ\�\�N��%�\0\�\��Qz�(:$\�\��D%t@��F�\�\�,\�	 \���Tj,�\0\�\�B�\�Ʉ7P��\�\�8\�\�t@�^��Ԇ\'\�	 �\�\�:��t@\�»k׮�\�	 �\�\�*۶\'\�	\0�z��F�\�\�	 q�\�,�,\�-: U/B�\�H�M\�\"��t@�^��\��Z\��\��&_j�\0��ɻL�J\'��\�{�N\�t@�^�Ke\�	 �7�o۶��N\0HUx�,�;�\0�\n\�\�$�W\�	\0�\n\�/��\�	 �\�\�D��7�\0���=2y\�K\'���7\�Hm�\0R�\"�K*�N\0I=o\�\��\�\��T�qv$ I\�px�<o�\�	\0�\noΎ$\��Kx\�\0R\�q���e=K\'�\�\�sf�<w�\����\�a�L\�/\�	 �7����\�	\0�z�@��7\��8y\�{���\�O\'\0�j�^\">�N\0I�\�͖\�\�!: U\��9tH\\8N\�C\�	\0�\n\�YR\��8��o�\�M�\0��`�\��\�j=�.�\0��	b����@\�\�\��򼩠\0RB^�^�ZO\'�\�\�\�\�\\(o|+\��TM\�\�%�?�@\�\�\�\�ϒ\�\r\�\r 5\�yT^�>�@\�B�Py\�: %\�\�A�^���;\�ddd\\Bg�JƘ�[�l)\\�x��3g��={�\�J\�ۏ���\�\�\�3,��z�G\�)�۶Kt/Y\�\�F_|j�|��T\�\�.((0EEE����j@\�޽\�\�\�\�WJ��\�w\�.�#��*{�\�љN!�t\�&�7�e\�s\�@��o���\��\�RMW���[�\Z�G\�\0�R[x۶}B�i\���7�j\�wMۼ%�W\�)�\�\�a�,{ެͻ\�-��\�ք7\�\"�\�\�\'��w$�\��\��n7kf7��\r:��:���&��\�\��<ޅtA\n\�µoܱڶv*�Mx-�\�8�c᭗\��\�\�\�=\\kx\�m6\�\r�\�\�{�w�(>�@���ٹ���\�F`\�@����9��\�\�\'�\�H:�\������\�Z�4�$���ֽ\�ko���&���\�\�j�=�\0GP\�{\�\�q���\�F`\�@k\�]�*��l_m\�\�\Zq�*s�No#�	o��w�ۇ\�*�5��>Y�\�q\�\�ք7\�ڂ;�U\��wx���M��<~��\\��؄7\�ڂ;>�+��\��\�#�m\\8�\�m\�zGY#��\�\��\�W�_��L\�;6\�5\�Zkp\�J\��e\n\'��\�\�տ�	)\�M\�L\�7В���\�\�޲.\�\�\�6p�4���\�\�	o\�rpoh�\�\�\�6\�\�ݏ	)\��w�o\�bp��&iW5x|p\�j�	~.�������\ro��Zcp\�\��~�\�cX��z\�\�\�*\�s\�ބ7�Ă�D\�.�\���=셎d\�;v\n\�r۶�m\'�	o�\�N,�˒\�\�\�6p$ޱ�\0/�\ZIx\�\0����<�\��a:\�\�quPj\�Mx�Ig/t\�&�}\�j��˼\�1��\�XUV��juԫ#^�\�UoY&\�R�k\�\�&K�\�y/��\��e��\�>�m�|��\\ޣ%��e�[�/�\�.Y\�\��\�^J}&�U\�S��\'��X��e�Ij�|\�G�\\/˵�\\#\�e�Jj�\\^!\��e�L�g�\\^\�\�B��n�,�\����̓\�lYΔ�nY\�;��*˷\�~S\��\�|M��\��^�\�\�R\�����=+˧嶧���\�\�\�jh�\�Q�mL8%\��Y\�A�\��n\�\Z��*\��R\�\���r{_Y\�%_��\�\���\\\�.˨T8�ز̔\�M���\\�E�7\��ݘ��y�|\�r�k�����\�~\n�.�\�e�\��^,\�\�\�\�\\x�ǉ�=\�\�\�Ox\�@k��]�\�ؓ�C�=�}�nǔey�\�صk\�Ӣ\�\�w\�\�\�ϒ\�\�\�\��\��R鋺,,!p��b�3��J	��5�P��\�v�����w��UCD\�\��J�2��\�]��SCH\�H�\�\�\�ԽRC��\�˕\��\Zn\Zrr�G�Fk�I�U���\�\�x��\rM\rO���,\'i�\�\���,\'{a����,\��\�x�ܦolfya��=\���w�i�{a��,�{o�̀\�j\�M��YX\�y\� �\�(\�\�ޛ}����\�3��P\�\�{C�ë�ޛ}�[�\�\��/��\�}\�#���\��{o�zu\�{�{\�{#�o�\�bo��M�\�v$\�\�Q�\�}s�K��2�7yU\�\�\�UZZj�l\�b:�\�m�7\0��:o�mޱc��\�\rZm�o t\r@}W��\�G?�\�M�\�ׯ�̃6:tp�����mz�\�\�^_\�mu���^zɽ��o�Y\�0�>}��3��y��=��\�\�\�%�<\�\�\�\�\��\r\r\�ݺ�����\ro\r�ѣG�o�\�}\��\�\�\��://\��\�\�m\Z�7\�|���믿^\�m����)S\��}��6l�Y�|�Y�h����\�Lx�;�k\���>\�m\�^\�hXx\��\�\�\�W\�m\�#F�p��\�ϯ�.\�]�t1.4۷o7O=��{}]�͘1Üw\�y\�\�\�v΀ܯ>\\޿�\�/\�i��f����۝��~/���{�\�o�ݝ\�/��B3~�x�o��o\�_�\�_\��\�o\�ܹ\��^{\�5s饗�?�S�Nf\�ر�7Њ\r�a2n\�#���ŨGx\�~\'�_c��\�\r7\�P�x�\�w�kh<X\�m:}\�u���{�h4\�~\�\����ͨQ�L\�Ν͙g�\��\��\�ۮ��J3f\���I\'�d~�as�\��_\�ݻ\�L�6�j���A��\�D\�\�`o�c�\�hR�\�%%%\�\���\�\�\�6��~�{��}�\�y[��\�۫��_�����\�\��z��U\��ꫯ���o\�\�\r�\����mܸ��f�9�\�&��\0\�&���\�ߏ\�s#�᭫���\��\�,[�\��zϞ=n��\�\'?��Xx��\�\�mǅ�c�=\�ަӷ~���_ޱ��o}\�[\�t���?�ɽmÆ\r�7��&��l�&�\��^�r��\�׾f~�\��!�D\��\�j�n\�m\�zY�\�\�vo\�]=�/�\��\�Ϻ�\�uj\�\�j\n\�[n��\��֝\���\�8\���\�7+V�p/ϛ7�\�˄7\�:\'�d��\�F`\�;6_r\�%\�m\�ڵ3\�]w�ٺuk��8p���\�?w�\�`֝Ҫ��n�\�\�ٺ\�\�ĉݟ�;�Ňwǎ�o]m�Q1\�~\�9\�_\�s\�=\�\�V\�e\�h]x2ALp#P\�}�ҽ\�5���\��\�?��s\�\�\�\�\�v��\��\01۶mc�9�Z\'�DV�G۰s\ZZXxsxT\0-y�m#\'�Ax\�\0\�5}> �	o\0>�aq�͑\�@x\�\0|.6i\���\�ބ7\0�O\��YV��7\�\r @4��\\\�t�7\�\r X\�݁N��&�+�;\�	ބ7�\��w�\�8g\�	ބ7���m��G��\�o\�@�\�;\'\'\�B:�YYY�H\�b:��𖺌N��&�\'��J��N��&�\'��8�s5��̙3��%�$\�\�e]G\'\�EEE�n#նm۶Jx��\�Z��\�B�\�Mt~0w\�\����+w\�\�E�6Bp\�\�\��\Z\�#hy�w�L\�]\��B\�f�L�uu�k	F�L\�\�_\\�\�@\�\r\�\�\�p8�N\0	?g��\�\�\0�a\�vI$�\�pb�\��\�\�֒\�w\�\0��\"JE\��؛\�XxK\�\0�\n\�R���	�{t\\p�eY֭t@�sg�ԝt��yr�TE��z�\�\0H\�\�O&��t�3��\�\�n\��\�\":��_���,k\0�\0j���\��Z�\�@�O\�{$�\�@�ϑ�:�[��G��\��fc\��\�p8<�N\0�N\����#\'�|��9��]R�tH8\�o\�@\�ˑH\�\n=�OFF\�%t@s��y�y�N\0��,��<g��\0R\�ۥ�L\'��\'\��R{\��T�\�$1�N\0	O\�C\�ySL\'\0�r�\�j\��\�tH�9����\�	\0���?��~�N\0	���us�\0�\��\�,\�=�N\0	?g����N\0H\��A^���@btM����\0R\�\�^�@b,\�zV\�{#�\0�\�)b���\�tH�\r\�D�ut@*_�VI�O�@\�ox\'\��N\0H\�q>�,\�\r:$���M��\��T��r	\�\���sf�L\�K\��T�-��~�N\0	O\�yz�P: �/D��f\�	 \�7��e�K\'\0�2�t��@\�ϙż\��\��|�ytH�L\�\�d�~�N\0Hex��H\�9�R\�u: �/D3u�7�\0��9��\�\�c/@\�ox7HM�\0R\�o\�6<:$��\�L|\0RK���GY�@�V	\�\�\���\�8\�@\�ϙm\�px�\0�\��W$�\�\�	 \�\�\�N	\��\����No��N\0	?gvK\r�\0R\�q�\�t\�Y:$\�{�\�	\0�\�\�h3�\0\�}R}\���	�\�Oڶ��N\0	��y\�\�N\'\0��~\�E?�B\'��\���T�N\0H˲\�8�SH\'��\��p8N�\0R9y?\"/F\�\��px�Ix\�L\'\0��\�A�tH�9S\�8εt@*_�r�v\�	 \�\�\�Q��\�	\0�|!\Z���@\�ϙ����K\��T�\r�*�@\�ϙJ۶@\'\0��eY\���N\0��wzz�Yt@\�\�\�W�E\'��\�\�t\�\�\�T: ��w/����@\�᝛�ێN\0H\�\�}�\�N\0\'���\�M\'\0�z��J���\�\�\�t$���#\�Ũ�N\0\'�;�\�kt@�\'\�L=V3�\0��/�m���Z�eu��.���\��Yǩ�\0R*\n\�$/Fet81=,��N\0H�\�\�\�\�%�\���\�#���D\"W\�\�x�e]�\'&�\0����^y�9���t�\�Zj����\�S�\�	\0\�\�/\�\�n\��M��㱃\'��HKKk��wm�m\��Z�\��\�7[�#�\�\0_M\�L\�@\�8\"!�TO\�e5�w!\�\�oN\� �/B#k��\�3@\�\�y2Pj�\0�\��/\�$\�\�ϙ\�R�\����I�\�\�ݟ�\0\'|\�< ϗt�/�o:�X8e\��6: �,\�\ZBx	�\�+�)�\0Z0cL�-[�.^�\�̙3\�̞=ۗ\�8�o�mZyyyf���RO�B*\�\�=^�/�\�Ђip���\"SVVF5�v\�\�m���+%\�G�\�B\n\'\�	R\�Ђ\�\�Mp7n�\�$\�q��\�\��	\�5th�tU9�۸��\�yd!���\�R+\�Ђi\���7ZTxO�z�N\0��9�o�ٲ\�y�6\�>���^GX\��]xϔZD\'�V\��n7kf7��\r:��:���&�\��m\�ug>�\0Zyx�}��\��ն�S	l\����ߕ\0�M\'�V\�\�\�=\\kx\�m6\�\r_M\�Kd�F\'�V\�kf\�\�\Z\�z�Mx\�W\�B\�{\n�\0o�Fp\�{uVV֫th\�\�{�\�\�z�Mx\�?$�\�IM�@+\�M\�\�\Z\�z�Mx\�W\�I\�:���޳}�Y3k\��\�\�:���&�\��\�|b\��th\�\��\���o���&�\��.�,k�\0Z{x���M��<~��\\��؄7�#++\�s	��\�Њ\�[���q\�\�Z�y\�me����\�{�T.�\0Zcx\�D�c\�\\�ጡ�w��>z_�p\��\�b��the\�}�i�)���9��W�?�\0ZYx\'2m\�5�ބ7R\Z\��-\�\�E\'�V\��\r\�Xބ7R\'++렄ww:���o�m\�%�HĦ\0\�M\�\�\�]*�wW:\�\�\��w�\�8��\0\�M\�Nx��N\0�7Ex#8\�}T\�2:\�ፀ���\"##\�t �)\����+��G\'\0\����я~�u\\�\�\�\�L�:�\�\�	&��_�dI\�u�<�H\�\�Y�t�{\�7��\r�{�n\�hxx��]��F\'\0\���z��\�\�\�ѣ͍7\�\�o�>}ܯ���	\�nݺ��衇j\�^�zU]��\�\�@#�wϞ=O�\0\�]k�1\�\r\���\�W]\�o~�\�\�\�v��\�̩��zLx\�۷\�t\�\�\�\\y\�\��K.��ӦM3\�w��\�;̙g�i�\��\�̘1ㄷ��\�\�m2y��o�\�\�\�\�W_5���aN9\��w-^���F����\�\�q�)L\�\0\�ݠ�\�[\�\��\�\�\�\��կ~uLx\���_�?\�\rb��\�ﺷi\�\�\�\Z�#G�4\��\��ܠ.--��^zɽ\�s\�q�~\r�v\�ڙ�/�\���4��~�[�v\�\"�\�bض}����\�kY\�ut �\�\�\ZҺ�\�o\�.G�\ZuLx_s\�5\�\�\Z\�<��{9\'\'\��~��ݯ~�\�\�S\�m��~\�\�\�ۆ\�~����k\r{���\�_\'�x�P\�d���JUH�*W��+\0\�ݠ�֐=�\�s\�\�:�.\\��*�׭[g�����\�[lǵ\��a�_뿷�\�b\��\�\�\�~��[����\�U\�7�L\���R_pP��n\���F�\�\����f�\�\�U\�=h\� ��رc͢E�\�\Z0`@\�\�\�.��\�c]���\�\�6%%%u\�\�)S�Tmׯu\�\�\��\���-���ЬX�\�ȋ��7o^��	o�qڶm{�~�[j\�6@x7zx?��\�\�\��?�н���u�n{>t\�P\��mݺ՜t\�I\�\�K/�\n\�+��´m\�\�t\�\�ټ�\�ǬR�\�Xx\�\�\�\�\�7�:ur�?묳\��^?}�t�:\��^\�e\�~bY֭z\�O	\�b	�+\�@x��b�K]��u\�V[\�\�l۶m\�b�����\�y:m\�ro߇w2��9o�42a�$�KdY�D��#\0|\�\�\�\�\�>p�\�\�Fx��\��Hh\�\�\�2q?MG\0�>�9\�\ZZ3	\�\�a�\�p�R:��&�\�S�P����:m۶�@x\��1˲�K`�Jpo�\�\�\0��O\�\�\�t��^\�}n��t\0\�Mx\�\�$�\�*��,##\�t\0\�MxçB�P\'���\�\�p8<��\0 �	o����]\�\�R�\�\�\�\\HG\0ބ7|Jϱ-��R\�ԃt\0\�Mx\�\�$��\�-S�\�h4z>@x\��)	\�3l\��Л�s\�\0����\�RG�6H}��\0 �	o�Tzz�Y\�\�4�\�\��P:��&�\�c\Z\�޴��[�ng\�\0MbΜ9.\�\�\�\�\�\�q\r\�t@�*((�(**\"t��m۶U»�GV���G\�i�c�\�FG\04��s\�>���_�k\�.\�cii�\�;//\�\�hY-�~\�K?�\�}�?Ь$lFʴxPW���f͚e\�E\���ߨ7�\�:HX?\�}�k�|��\0@-4��Lt���3\�Úz\��]t\0N��\�\�=zt�H\�\�\�=���PDO,BG\0 �\�[\��t)�@s\�Su\�);�Sw\�AG\0 ��>bY\�5t\�E�\�G�*d\�^\�&\0�_x�Jxw�hj\�?�\�\�v}\�Ix\�FG\0��\�}H^H�\���q6N7\�H-\�ҥ˩t\0\Z@��K��{\�	4ݟB{�\�a�0�ƙ��Hx\�K\'\�\�l\�\�\�I>�gϞ�\�\0h��\�)/�#\�\ZK(�\\SER%R!:\0�L��B��\�\�	4қ�	�\'�,礥���#\0\�4/�\�t��@C\�c\�J	\�by<�7��\�\0h\��^\'5�N��\�JhO�홡P\�dZ\0M\�+�^�H��պã\��[\�\04_x/��N\'�̴-��WuOr˲\�a\��\�\�|�yt����ζ\�2u\�о��\0@j\�{�N\�tu\�\�\�m\'���w��7�k�\0���ސ)\�:�\�\�\�\�\�_J\�\�\�̼��\0@\�\'\�9�@MӶ�\�\�Q\�^��\�\�\0�=���0o���oֽ\�\����\0�ѣ�\�Q\�\��\�9��Ax�\�~�i\0�9aݯ\�7��\�\�o�iR\�\�\�\�W\�\0�\�\�}�h�N�^zr۶g\�-�\0��\���\�t�u�7n�R��vG\"�+\�\0#��e\�:D\'Z=���\��\��3t\0Ĳ���\�]J\'Z\�6G�\�%���\�et\0��B~����Ӊ�/\nu��u�N\�\�p�I:\0%/\�\�9�h\�\�o�:,�yFF\�%t\0,\Z��//\�t�e\�ҥ˩ޙ\�*l\�~��\0@���\�Q^\�\r�h�\��\�t�\�H$r1���-\�\�\"ߐ�\�Mۣ\�\0�\�	\�\�>�>˲z\�߳Lj��Et\0Z(y��\�ѣGg:\\]�v=M��+$��:����?y\�G�.��}�\�W�\\�[�~@G\0�u��N�<\�h�;�[�Ӷ��H:\0�+�K�Hkt\"8dҾG\�tImb�\0�\��>�\�8�����~�L\�k�\�FG\0��Nq_\�^\�t\��o�Kp���[�ng\�\0hݡ�G\�\�M\'�I�Zۛ�\�\0���Nvx�\�\�f��C\�Z]eNG\0\0.\�q\ne�C\'�CwBӝ\��o�@G\0\0է��e�{�N�C8�ߛ�W\�\��\�\0���^\'5�N��`\�q�O����#\0��\�{�\�\�t\"��?\�-��ꔎ\0\0Nz�\�\�t\"%\��Ez��ˤ\�#\0�D\�;_j�h^���v�\�R\�\�\0H6��\��M\'�G$�X&\�mzXZ�\�\�\0@}&�7d���N4\���z7�E]�t9��\0\0\�(u�s:\�t222.�\�:,�#\0��m{�Lޛ\�D���)o\�^\n�:\�\0@�y;N҉\�%A}��.��H$b\�\0@��赓N4\��guOr��\��\�\��:\0h젹W\�,F\'\ZN��3�\�z�tyS�NG\0\0MB&Ļ��\�t�����N۲����֞�\0\0�2��m\�>D\'\�\';;�*]s!uв��t\0\�\�4p�!t\"im\�M\�+�\'���\n�N�%\0�暼�\��FӉ\�z&�W\�{8���\0\0���ϥ:=҉Ħm	\�״_�e����ێ�\0\0�]4\Z=_¨�N\�-33�z\�\�>�/%�AG\0\0)�g��@2t�f:]K\�􎒦\�=oKW\0\0�֖�Y(�I�k\��m\�\�MG\0\0��\�\�9��	\�-\�zG�\�p8�w�m\0�\�\�tY٣G�\�t�\�s��\�2m_MG\0\0~��u¼�5�@���GG�6�G\0�\�\�}D&\�kZ\����\\�2\'�\�%��\0@»�5\�S\���g�\�i[\�9	\0� ��!=\�yk�\�sl�=綞{�G\0 P��b2y�j\r��\�$�\�v~	\����\0A���\�y�[���l�=,���\�\0~x\�)tdK��\�ҥ˩���\�;J\�8�\�\0��0�\�\�=����ݦ;\�ɛ�m�H\�b�\�\0��2y,\��TK�\�#\�Ip/\�=\�[\�\0@\�\�u-\��$\�wJ�\��\�VySra\0@K\�\��-\nu������J���,\0�%��b�\��\�#\�v�\�\'2m���*\0���w�Լ �ۣ\�\�w$�u\��\�p8|?M\0@k	\�\�:}\�\�mY\�\0�w�Km\�h\0�VEB�\r\�q>ʿW��gH`��\��\0�q�{�\�ƽz4�\rR\�\�\0h��\�2\�n\�˺�Y._�Xu\�\�\�l	\���\�\�ӗ\�\0h5\"�\��W�N����4�\�3>Z30\����MOO?��\"\0�5N\�[\�m�ព�\�>\��No-�F\rnY\�\�_\0Ъ�\�\�[\�}�\�`�\�\�d�Z?\�_\r\0��m\�+j	\�\n=.x��]\�\�\�ֽ���\�/\0�GWI{�Ȭ\�\�\�\�\�8\�C:m\�\�ֺv\�z\Z%\0\0���\'װ��\�\��wȤ��\�O�\�,\�\�\�_\0�Z\�Ni\�%q\�5o F\�\Z\0Y.\���W\0\�\�\��x,�e꽵�~oFF\�e\�/�\�[*��\��K\0\0�\\�\��n\�7ܺ�}q�.]N\�/\0\0@�d\����\�\�\�-\��%\�\�%�K\�wv��\0\0\�\�`)\r\�M�\�\��\�\�\�\�B��\0���W�Rj��l\�\0���L&흲<\�\�\r\0@\�w,��5f�\��ѽi{^Ϟ=O�\�\0\04np�\���y�_-�ҏ�e\�j\0\0�.��\�>,\�\�8\��\'�m۳�pr\0\0ZCp\�$�\n]\��J�����\�\�\�\�f\0\0�7�\��\�x[	엽\�mO�B\'\�f\0\0R\��\�WQ\��Y�u��Rdھ�\0��\����	��wR�\n��\�\�\�\�mG�\0h�\�n+����K���\��\�=�\�%��Ih)~#\�\0�\�{C�������\0��~��rJ\��ks\�׮e\�\0�郻�7I���)�\�;V\�c7j��i�#�\0@p\��5s|��\���F=\0\0w\��Z[@�K0�\�O\0@\�w]^�DpW�a�\0��\�<�\��a:\0\0�\�\�ݵI~_�\Z&\�2\��d\��3\n\0\0���]�\�ؓ�C�	\0\0��7\�6\�ر\�Ye\0@xc\�m^�ӆ\0�������\�s\�\�6\�e\0@�V\�d\�\�#�\�Mܣi1\0\0M3�7ڱ\�	n\0\0�w���m;�X���<7\0\0\�<�7d5�\r\0�&�d��\�\0 �x2ALp\0\��	<�U\�\�6\�\0@`&�\�6r�\0�\0xM�\0\0>�\�q�͑\�\0\0�\�m\��X�\�pv0\0\0�/\nu�\�\�\�\0\0�����t\�\�L7\0\0\�\�}���Q:\0@@dff^\�8N9�\0\0  \�\�p�Lއ\�\0\0!S�m\�\�\0\0!�\�϶\�t\0�\���0�\�t\0�\������\�	\0\0�\�\�>�\0\0\'�\'Hm�\0\0�mۓ�V\�	\0\0²�wd�~�N\0\0�\�{���:\0@@Hp/��I\'\0\0\�q>��B\'\0\0\�\�N\�{�\0\0 8\���m\�\�\�\0\0�	\�B˲\�\�	\0\0�\�;e�I\'\0\0Nx\�\ZH\'\0\0\�q�K\�I\'\0\0\�\�]\"\�\�\�	\0\0�\�e\�p�f:\0@@ض}$;;�*:\0@p&\�H$r1�\0\0 8\�]���~�\0\0 8\�m\�\�\�\�\�	\0\0@C[ÛN\0\0��\\W�\�	\0\0BwT\�\�\�\0\0�ӏ�\�	\0\0B΢i�\0\0�U�J\'\0\0Nxߩ\'&�\0\0��\nTO	J\'\0\0۶GJx\�\0\0�eYc\�)�\0\0g�/ὙN\0\0ܓ$�\�\�	\0\0�\�S$�W\�	\0\0\"++k�\�\":\0@p\�{�\�:\0@p\��=��t\0���m{����t\0�\�L\�\�y�N\0\0���Tj,�\0\0 8\���L\�\�	\0\0¶\�\�\�px(�\0\0 8��>	�t\0�\���A˲�\�	\0\0�އ%�o�\0\0\'�\�%���\0\0\'��J]F\'\0\0NxWF�\��\�\0\0�	o���ӑN\0\0m5�uI+\0\0�P(\�\�o\0\0�m�@�y\�	\0\0�3y_�{�\�	\0\0\"33�z\�q\�\�\0\0�\��kt\0�����6=�9�\0\0  $��ٶ��N\0\0��&��N\0\0����\�v:\0@p\�{�\�\'t\0�\����\rt\0���m{�\�j:\0@@X���L\�\�\�	\0\0�3yϕ�^@\'\0\0	\�\�R3\�\0\0\�8\�RS\�\0\0���\�IxO�\0\0\'�?�m{<�\0\0 8\�]hY\�:\0@p\�{�L\�#\�\0\0�	\�=R\�\0\0\�8\�~�;\�\0\0���K$�:\0@p»,\�L\'\0\0۶�dgg_E\'\0\0\�\�]�D.�\0\0\'�+\�\�\�Ϣ\0\0\'�MZZZ{:\0@\0hhkx\�	\0\0BW�\�js:\0@@\�j�\�\Z�\0\0  �#b�Q1:\0@@\��Y� -t\0��\�â\�\�Q\�\0\0�	\�;�\�$t\0��\�S�\�)A\�\0\0a\��H	\�t\0���,k�\�8�t\0�\�L\�\�%�7\�	\0\0B�{��Z:\0@p\�{���\n:\0@@dee͔ZD\'\0\0Nx/��C\'\0\0Nx�\'5�N\0\0�m���~�N\0\0\�C=z�\�\�8\�\�\�\�M\�\�\�\�\0\0�����6�T�\�-\rx�\0�O\�\�?\�p-��\0��\�T�B]\�\�\�\r\0�Ϥ�����>ZSp۶�\0��$��j\�\��#\0\0�\r\�\Z\�;�\�\0\0\�\�\�{S\\p�\�\�\�t�+\0\0�Xff\��qۺ�\�\0\0�1}\���0�!\�\0\0�g��̇IH\�\��޺��\�\�p�IV�\0�\"�\�\�h\�\�\'88K�\�{Wض��\�}\0Ќ���\�	m�Lh\�R��\�\0hB�3�L̇���]w\�eƏo�,Yb�o\�n>l�.���\��\�o^x\�ӿ��\�RbY֭t\0�F&!{{$��\�A���|�\�Q���+W��C�\�t ��t\0�F\��\�\�\�f\�ԩI�vu3f\�0999էp\0��\�U\�ܕ�\�7n\�h\Zç�~j��\�{\�\�*t\0\0\Z@wN�\�ƭ��۰����\0\�m\�\�\�\0@=\�^\��\�k\�i��\n�=�\0@��s\��۹uwS\�m\��ۿuu=\0\0��`�߫���\�4���ǯ>_\�_\0�\�\��#�\�\���\�\�ի�9�\��5\0\0H�~d+~\'��|$,Y�r\�c��\�\0\0 \�IF\�\0}\�gLs�4i\�1�O\�\0@b\�;�z\�\�椫\�\�V�\�\�\0@$4��w\�ر�Y\�[?�:Q�\Z\0\0$6yWh\�$#\�E_�\�\�\0@�\�\n�7\0\0L\�\0\0�ll�\0 x�7{�\0��\�s\�\0\0�L��\�k���\�9\�\Z\0\0\�\�c�\��f�m\0@�\�9�\�\�*\�\��СC9�\0\0��\���\�|\�\0\0k��\�q-���76Ip�駦{�\��\��\�\0�rrr:ڶ]��~��?\�}�\�wǯ./\�\�K�\0�\'˲n�_}�\�X�N\�����G]\0�\�~o|�\�*t\�ސ�\�tw�U\�:u��\�\0\04Q�\��B_�re\�>|�1��?�\�\0�i�\��m\��\��Hl˖-s��;��.u���9-�\0,�۸YU\0@ҝ\�\��Bo`�\�\�i\0\04��L\�+\�ĖH\�\��\0,\�p�f�\0@\n\�T�c�\�4�;�t�q�9ݫ\'\�c�s\�S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\0��Ƕ�y�\0\0\0\0IEND�B`�',1),('70006',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.Contract.png','70001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0p�IDATx\�\�	x�ս�+Zk��\�jm�]k[\�\�m�\�z��j7-�^oA\�\�LH�-�}_Ee�ȾXdQ� �\�&ADYd0\�f#�����=\�\�NB2�u\���y��d\�\�$�e\��~\�w~\�/|�\�s�ʀ���\�?v\�|Z\�y��\�y\0\0\0缲�ą�Ϯ0���S\�\�%c>\�\��\�D���y\�=/_\"\�\�\�ʢ?+�\0\0\0�\���G/�n�\�J]�{�Y�u\�_b�Ҵe�\�-=G\�\�:q]�����N�\"�뎞\��^\�q攞\�i\�\�R�\0\0\0\��[M{?W�v��\�\�܈\���\�\�͹:\�N��\\����\��:\�\��\�D\0\0�t���_�0*B\n2ް��v�W\�\�_����)\����6k\�a̛y\�\n�\�2e!\�\�?O��ǟ\�\�bh\0\0��|~ɜP�!,\�\�\"�B�,?˰K\�\�=}\��\�\��}_�\�\�q\�6烋\�ۈ\0\0�ǘ�\��@H\�S\�\�\��Dq\�+N$ć��D\0\0�����n\�.��7�zL�W1\��3\�X� ���܏\�¡�\��ED\�\��\��3R\Z�}Ͼ�\�\"\0\0\�=��?\\Ti(%�\�\�\��\�K\�\�}zv��]\�\']\�>�Y\�󞝷\�ҁ��\'\�>�F^��o\�\�y\�s�\�߄��\Z\�Ŧ×�wpo��?[C��D\0\0��^���\n-5ˢ}~qe\��O[T9.3�\�s���o�ܪ�\�\�B\�\�q[�z�\�u�\�_\�\�/\�l�/�9D\0\0���[J\�s}_\�z\"	9nZ�d\�܌��SC�\�\�С�III1			&))ɴk\�\��\�\�\�B�~��nݺ=\0\0�/:t(�^8ѦMӢE3e\��n\�:s��as�\�Ye\�̅Lvv�y\�w̴i\�LZZ�IOO\�\�޽�\�`0xQ\0\0��ܶbŊ��Z�2C�5[�l�\�PV�m\�f222L\�ƍM��Q\0\0\0e!F��׶m[�i\�&Sv\�\�aZ�nm�7o�IJJ\�MD\0\0�Ü<y�u�^�̳\�>kN�8a*\r�\��Z�l�9C\0\0\0\�DH\"l.]�d*�1c\�(3�ك>x\�\0\0���\�p�2�!aF�a\�ׯ�E\�\0\0<�\n+UQQ\��\rs���\����D\0\0�hHC�343�*Pfbbb.�\0\0\0@\�Dh�gU2p\��			�>\0\0@�+�\�TUe#\�|��&^��\0\0 �y��\�h\�\�\�,�,����\\\�q\Z�_\0\0\0�S�w�����~&!!a\r�\0\0�8Epi\�\�୷޺\�\�\��\0\0\0\�\�\�\r����G�\�\"q��\0\0@��-�ûxV5\�Lې�_\0\0\0�St!�N	\0\0�8�A�ՙ�\�C$\0\0\0\��\�\�W[�Dvv�j$\0\0\0\�>}����YK�,\�f\�\0\0@3`���\�ZG�W�^GXG\0\0 �iݺuô��jY\�RKd��%\0\0@�\�DnUﵱv\�Z\rk�\�\0\0@�ӳgϕC��R�hڴ\�v�\0\0�\0)))75i\�$o۶mU\"o���Qe#��\�mD\0\0�����jժ�9q\�D�Ję3grC�\�W\"\�u\0\0\0���vx��\�Yx�\���l\�q�m\0\0\0��\�\������!yݻw߯u#4�B�\0\0<*M�6\�6l�9}�t�\rg�l\�RŕS\0\0\��HJJ\�۬Y��͛7���R5\Z\� \0\0\�#TY�~�K}���(��f�cÆ\r��\�\"v��\0\0\0~DY\�qf)�����7t\�\�3o��ƥ#G�\�^�p�`Om��t\�ңZ�Z+VJ �NC\0\0\0`q\� \�m\�ܖ\�\�\�m\�Ϋ\�mk�\�5+V\0\0@Y\�\� \r\0\0\0�HԫW\�f\"\0\0\0Q\�8N^rr�\�D\0\0\0b����	\0\0\0�����\\W&~A$\0\0\0 �������D\0\0\0b���@\�~\"\0\0\0��\�y\�q\"\0\0\05�D��B�	\0\0\0�E$\�$&&:D\0\0\0�&!!ᔖ\�&\0\0\05�\�pE�	�\0\0\0��q%\�sW&Z	\0\0\0�E$���#�\0\0\0�XD\�S��$\0\0\05�\�	�B�\0\0\0DMBB\�A�=E$\0\0\0 �\��	\0\0\0�\ZW\"�9�3�H\0\0\0@\�$$$\�v\�D\"\0\0\0��\�n�J$\0\0\0 �\�\Z\n�^$\0\0\0�Hlr\�l\"\0\0\0Q\�8\�;�`�U\"\0\0\0Q����֕�\�D\0\0\0b�\�n[N$\0\0\0 �X.� \0\0\0�H,\���\0\0\0�XDb�\�\�	\0\0\0��@ 0\'n$\0\0\05Z�\�q���\0\0\0D��\�\�2\�D\0\0\0b��ڸ�H\0\0\0@ԄB�1�\�\�%\0\0\05�`pDBBB�\0\0\0��qg�+�\0\0\0DM(\Z\�\�\�\"\0\0\0Q���\�\�m�	\0\0\0�E$:�\��\0\0\0�XD��\�89D\0\0\0�&6s\�	\"\0\0\0Q\Z$$$�ʗ�\�\����u\�\�Cd\0\0\0�\�qθ\�p\�m�n3%�UD\0\0\0.Õ�5��Z^jj\���\0\0\0\\F��Eiو�D	\0\0\0J��WJ	\�q\�\"B\0\0\0P�H\�V\\��+\�\0\0\0�\"\����H$&&:D\0\0\0\�D���H|LD\0\0\0�\����a�\�m\"\0\0\0Q\�8\�	��\0\0\0��\�\���\0\0�\�~�\�f-Z����L7�F�\�\�\�\�\�s\�]w\�vo\�\�|!�\�w���\��n\�y\�s�\�Y\0\0�q�\�E���u\�n�\�2�\'==��$\0\0*��z(\�\�f\�r�O�\�e\"\0\0�bٶm[�\�\�^\�J^�\�\0�J@\��u\0\��X���\�\�{\�W\�\�\'N�0~���}\�\�++���f߾}\�1���.]�\�Dݰa�9~�x�ߓ��W��	\0+� �H\n�y時�\�c��Z�j�!C�:���e��\�K/�o~����7\�hfϞm>��S{Rm޼�\�kK�\���Ķ{�n���>�\�|��\�5S�N50[�n5\����\�W�bz�\�m\�I*֯_o�4ib~�\�\�\�\�[�nm\�\�˚$\0\0�\0�d�x\�W\�5\�\\c�򗿔\��ZK�.���={��n�ɼ�\�[W����#Gj}��1\�^{����\�mF#�Y\�޽�=��&�\'��ꪫlߞ5k�Y�z�y\�G\�}�.�=>t\�P��8\�\�W�\0\0�\0�d�x��\�\�O�S+j�\�/�x�\�7��\��0\�֭3Ç�\�\n���~�#+���\�\'�\�SO=ex\��k׮b\�ʕ+\�<\�\��\�7\�СC\�ϟ?oV�Ze�\�\�o\�gdd�o|\�&;;\��>��;vd/�;K$�)\�t,�\�v\�\�\���Z�B$\0\0�\0�\�\Z	\rW|��EXF�Q蹑Cz���\�_��\�:���Z0dQ�[o�\�ԩS\�\"\�iӦYA=z��7o�\�L\�{ｦe˖vζ�A\���aÆ\�\����\�/\�Lģ�>Z�ix��\r\0@$\0�P$n��f;4�!}\�9s\��;\��2��@,\\�\�~0`�\�^\�{֮][�<eT\�پ��/�\��������\���\�f��׿�u-�ܬY3{\\�\�}\�{&33\�>�W�^�\��\�\�\��_��e���\0�H\0԰��\�)t�ױڵk�Z#�\�P(T�I$TdyL\��}1}�t;\�\�RvB_����;w�`hC�\�LRR�\�֭���cm۶��5$\0�H\0T�H|�\�_��\�,X`O\��Ȍ�S�\�-�\�R0�QT$4m�$4���Cq̝;׊��8�Z/��bA�����*RRR\�\�W_}�\�߿��>\�\�А���,�d\0\0�\0��\Z��\"�!	\�ΈV$��X�<y��\�W�j�<\"EB !�\'�|\�lڴɊ��T�\�j)\�\"�\Z\r\\\0 \0U$�BٱcG;���}�.ֺ?x�\��:�\�>�\�N��H�/\��կ�\�{Ǝ���\�s\�=W�\�Zhj��\�v]�믿�X�8z��-�\�p\�m�\�f\Z7n\\Pw	\�\��\�\��V�pUX$$2�F��Y	=O��\�k�\0\0\"P\"�\�~\��Wc���\�\�\�4�bѢEv�-Zص�@�\�T\�\�韚\�y\�\r7\�\��U\�5��!MAU\�\�\��ss�\�I;\�TS@�\�\�k\�E�:4C#LX$T��E\�\�O?MOWٸq�7n�]�C�v�JY,ոH��\�k��\"��H\0ĩH�\�A���(\�P;v\�\�.nz��gw\\+R*�Q\�k�\ZEQ�\�qe�<v|p\�\�[�ҦM+�S�L��x��\�����Z7DR�\��iiiv�j���&\'\'� \"/\"P��Y�\�\n��I[�l�J��m\�f\�b4Եx�b�	�\0\"~\�B�\�V3hTOS���j`:u\�dN�>Mp�\0@$�\�(\�EÞ}�Y�[lE�!����\�\0D\0�\0g\"$�=Stk��`̘1�}��e��@$\0	�34��\�AeHD�k�\�M\0D\0�\0�\�J\�DT\�pFi\�����^\0	\0D<2��\���Q�\0S��Q/�\0\"@\�DD.V\Z4\�\�b\0 \0�\�9�Y��lD�>��f%(�D\0��8F+��f�2,K�aÆf��\��\0�\0@$ ^\�\�Z��:\�m}��\�\0�\0\"�6\�\�\�\��ڵkm6\0�\0@$ N\�.�ڀ�:\����\0@$\0	�S�xq��VZ�[ې \0�\�)\�}!G$\0�\0@$ �iР	@$\0	�ب\�\Z�\�\�lj$\0�\0@$ �\�߿�\�\�X�r%�6\0�\0@$ �\�n�յ�\�\�O?\�:�H\0 \�(���V-+[jX��-�\0@$ Ω��6\�}�]���\�^�H\0 \�L�4ɮpY�t\�ؑ\�?�\0@$��>}\�4m\�\�l۶�J�999	\0D���E�L�V�̉\'*�\�9sƮ��p\�B��\0\"^�K�.f��\�Zx٩S\'+,\0�\0\"C���;w6�\"�\�u#4��H\0 \�Q�\�j�Æ\r����3�v\�j%��@$\0	��L�o\�\�4o\�\�l޼�\\��\�J\�Dh8�L \0��D&\'\'�~��Y��f�cӦM�\�B�3(�D\0�\0��,�\n0�\n�v\n\�\�իW�#G�,&�]<���\�P��+�\�:e\0\"�H\0X$4\�\�\�v�B[���\�A5�{��\�^�b% \0�@�(#	 \0�@�lݺ\�_\0 \0�@L\���\0@$\0	���;w�iܸ1�\0D\0�\0��\�޴lْ@\0\"�H\0D\�ȑ#\�V\�\0�\0\"5O<�\�	�H\0 \0Qӽ{w�\�\0\"�H\0DM۶m\�رc	 \0�@�hC�3f@$\0	�\�iԨ�q\"�H\0Ć�\�X�n�\0D\0�\0��P(dv\�\�M \0�\0@$\0�G;~?~�@\0\"�H\0D\�ٳg�H\0 \0�@\�\�߿�-\��\0@$\0b\�\�w\�5�\�\�\'�H\0 \0ѳl\�2ӰaC�\0\"=�f\�2M�6%�H\0 \0\�3a\�Ӻuk�\0\"=Æ\r3]�t!�H\0 \0\�ӯ_?\�\0	\0D j:w\�l�y\��\0\"=�Z��u\0�\0\"5����\�/@$\0	�\�III�kI\0 \0�@\�hUˍ7@$\0	�\�\�>\�o\0�\0@$\0�F;jP\0D\0�\0�����D\0�\0��ݻw�P(D \0�\0@$\0�g\�ڵ&))�@\0\"�H\0�\�ѣG͔)S\�͖-[̞={\�\�F�\Z@$\0	�+���hk\"�6MMMM5M�41s\�\�!P�H\0 \0�ӧO�bE\"\�4T�\0D\0�\0(vx�4�>|8AD\0�\0(�v\�\�+*�<�<D\0�\0(��K�+:�H\0 \0WDŕ�Ѽys��\0\"P6\\H$v\�\�AP\0�\0@$\0\�\�\�ӧ\�\rID�N� \0�@t�i\�Ɗ\�{\�G0\0�\0@$\0\�\�\�O?m����\�qLvv6D\0�\0(�D\\u\�U\�W���	�w\�\�	\0D�\��������H\0 \0e��+@$\0	�2\�B��,@$\0	�\�3�2�H\0 \01[H&jժEf	\0D��\�j�}�	2�H\0 �D�\��\�L\0\"�H\0QR\�kJ{oR3�\0\"HD\�\"Af	\0D��r�DE�\0 \0�xH\"�	�9\0�\0@$\0�(�H��9\0�\0@$�\��HD\�5�H\0 \����h\��H\0 \�Q>�\�#\�y\�}�\�e\�<T�H��~\�>G�\0\"�H@g$Jf�̌D׮]�\'\0\"�H�ׇ7�$\�ދ�a\r@$\0	�L\�\"O<��S\"�H�WeB��>}�T�HL�8\�ԩS\�3l\�0�u\�V��\0\"^\�СC&\n�\�{�L2�V�lӦ��9s�i׮�	��~���{�\�f��\�����\0�\0@$ \�8z��\�۷�IHH0�;w�Q{mt\�С\��\�\�\\�f\�\Z;\�ѠA��[�haƏo8�?	\0Dj2999f\���63��Ν;+\�:_�\��\"$���-[Z��\\�\�\�\�ʆ�\0�\0@$�p�\�I3x�`+�Z�2[�l)1�P�(˳蔆94ܡa\r�eG\�\" \0D\0��*\�\�ٳf��\�BC6l�4�\�\�>U��\�3Ϙ&M�X�hܸ1��H\0 P\�\��\�ѣ�@4m\�\�dffV�T��\�\�HP�	�\0\"��\�\n4\�RZ}�_�|y̯^D\�J\�S�N-���2�F\n6�\0@$��/�ӧO7III�aÆf\��W\�4�k*�J\"���M@$\0	(/���INN�\�9s\�T�\�$\�Z���b%��H\0 PF\�ϟoRRRlB\�ʤ\�F_e��n(\�D	�\",]�Ԥ��\�O\�S�L���}8��\�\�.�l\"���իW\�O։��fܸq\�\�ŋU�;(3��e�oN�& �H�oX�~�i޼��\�9jԨj���\�Gy.\�l\"\0�x�͛7���t+\Z\�?}�4A�(\�D$\0	�kv\�\�aڶmk/`�\r2Ǐ\'(\���\0\"q��={Lǎmj�_�~\�رc��A�&\"�H@�C\��*^�@�\�\�\�9r��\�l\"\0�T+�^�z\��Db���%΅��MD\0��JGC��(5���5�ނ�MD\0��\nGE�Z�A�6mژ\�۷�@�&\"�H@\�hڦ.\"��(\�q\�F�\�c(\�D$\0	(sz;##î��֭[GP�l\"\0�\\���օ@KY+��j\�*�e��MD\0����˩S�\�Tu�F�̒%K\n�+�E�&\"�H���^z\�$\'\'\�O��\�\�# P\�P��H\0 d\�ܹV$�f\�\" P%P��H\0 q΢E�\���:p\rg0~\r\���\0\"G�pR)eRN�0��\Z��\0\"QY�v�i֬��\��\�sϑ>�����M6�C$\0��*@�G铝:\�\�Ç\�ť\0\�ȂMe+��~F$\0��JC\�Wkk	���\��\�\0^A\���\�H �H@�{�n���:Y�+��/�o\�>D�\0D*���,ӥK�\�\�\�\�\�\�\�<\�\�͛m\�\"�H\0\"\�\�ȑ#�G��\�Y�nݘ.�\�\�7ߴk� � #G�5�����N�:\�T/�_X�p�IMME$	@$ ZT49hР�ip;v\� (\�;�\n��3#� PF4\�m\�Сv���t;F\�W&O�l\�D�\0D��\�9r����4�~�z��\'##\�\�NB$	@$�.^�hƌc��nڴ�-.�#{�\�+�jOMr=d\��\�%\"�H\0\"E\�^S�L�S\�TL�l\�2��F������&\�Vkذ�Y�|9\"�H��3f���$���b�\0��\�@K�	5����A$\0�\0\�\�ٳ\�x\�r�\�\0Pm\�U�H\�q�6\0	ߡ��J\�*1}�t�H(�\'\�I��~�\0D§h,�q\�\�vlw\�ĉ@7n\\�\"\�\�L� q�.�K�.-�\�dff\��\�9z�h_�\�\�JNN�]�-R\"�v\�\�\� �H\�	\�NKBKe��\r\�\Z�#F��g\�rU\0��\�\Z)�\Z�H\0 q#\�֤I�2e(�l\�bZ�nm?Ei\��ɓ\'�\0��C�<\�fu~�\0D\"NE\"2CQ�P\�ܹ\�\�!�8p�M\�@\�ЪU+{�}�ᇈ\"�D|�Dd�BCYYYv\'N\�ӧ�ݡ\0*�r�sAG$\0������ێD\�\�_�C\�j��W�6�w\�\��[q|n!�H\�\�ѭY�\�dgg\��\�ۧ�~jV�Zev\�\�\�8�\��\�B$\0��!�IGW���\'\0\�-��[� Q��N�b�ұ\0�[�yn!�HD�NL:(D*\�-D\0��h�>?l��3\�l[\�\�6\�\�1:7D8�	\0D�\�v2\�ٺ��\��Z�BM\��\"�[�\0\"Qb�x۫�ut\�v`\�|:8D8�	\0D�\���ʧK\�\��\"�[�\0\"Qb\��z\�;;=F�H\0\�\"�H\�\�!���H �HT|g�J�:;=F�H\0\�\"�H�\�vgf�\�\�\�1:8D8�	\0D�\�v\�\��ui�\�S�\�1=F�H\0\�\"�H�\��m�zYg�ctn�pn!\0�D\�\�\�9���1��^\�cz��\0\�-D\0�(q\�]��J\�\�c���H\0\�\"�H\\�I\��\�\��\�\�K\�\�\�M\�\�s��H\0\�\"�H\\���	\�\�B$\0�;��|R*\��\"�[���E\"֎.\�\�\�	\�\�B$\0(��!���H\0 tv� �[�\0\"Ag�\�\"�H\�\�\"AC$\0	\Z\"�[�\0\"Ag�H\0\"���H\0\"Ag�H�GE\�\�ɓf����[���Db���\�\�<����غu\�\n�\r<�L\�Y�ti�}�/~�\�\�\���9rdL�\�\�\�L�2����>����4\�\\s�}?\�x㍦W�^\��\�\�e>�8�	���\�\�d{\�\�\'�,Q$JzΒ%K\�\�Gy\�2\��\�\�\�\�q\��؇~�\�c\�ӳgO�a\�D\�R$>��s�\��\�ԪU\���\�7}��5w\�y�=\'z�\�]\��s�\0���\�W�jn��v{\�\����\�׾v�H���pg�N0�\�\�\�\��ؚ5k\��N�:�[n�\�\�z뭦C�\�̙3\�w��������G\��k�b\�\n������\�%~/\"5Y$&O�l\�����ǲ��mv\�n0\�Ν\�\�B$\0�#������r��\�\�N��H���pg����\�Ԯ]\�v`W_}��뮻l��v\�ڂN5\�	N�4\��\�\�\�\�\�\�\�4۷o��[�nm^{��kIߋH@M�Ν;\��\�i\�\n׹�\�{�\�\�\�B$\0�#\��������jQ�(\�9��]8}�O?G��?�cǎ�X�v\�\n:�`0hS�J�����\�ݻ\�\�7o.\�ٕ���\�d�\�ڵ�}�N�:�\��:u\�\�\�YYY�[��wDb֬Y\�{\�����ԫ>\��Ҟ�~=uꔹ�\�{\�����s\Z4h`罹���-[\�6j\�(��>e)��t\�}�\�g�Evv�}/\"5U$T<�0k��nݺf�\�\���~\�M7���\�\�B$\0\�F$���\�\�\��\�7f˖-ŊDI\�):��s\�N;�4�nO�>\�>�t�:X��?\�>W�k��l\�ĉ�uv%}\�{\�g;\�+W�x��\�:�N�8a~��٬�_���o}�\�}ޥK�2��[�@܈Ą	\�m�;\���bE��焧�E�iz������\�?��\�\�\'�?�\�O&\'\'\�>O�־�\�ةq\�c�S\�J�\�\�\�t��\�:�\�\�?�~\rO�TQ㗾�%�U�͹�H\0ĽHTuS\�ۭ\�\�E$�:\�-\rI|��\���\���9p\�\0\�\"�H�� 4D\0��!���H\0 4D8�8�	@$\�\�	@$8�	\0D�\�	\Z\"�H\�\�\"AC$\0	\Z\"�[�\0\"Ag�H\0\"���H\0\"Ag�H\0\"���H\0 tv�H\�	\0D��H\0\�\"�H\�	\�\�B$	@$\�\�	@$8�	\0D�\�	\Z\"\�⺽{�~�v\�Z�|�r;Z�mٲef�\�\�yn�H\�\�!�Hpn�F$$k֬1\�\�ټw\�\�>��S�jժ<W*�\"\� S卂H@\�ù�HT\'\�D +\��\�<\"QkŶ#G�\�\0\�V|�[^	D�rD�(�={�(ec>�\�\Z�<w\�\\\�tt�v\�\�*\nqsn\�\�9V�\�WD��5D�\�D\"\�\�X��\��,]�\��A��&\� o\�V\�9\n�j\�9V�\�\�D\�\�\�\�\�w��m\��ۦ\�:�8 �\���\�V$\0��\�9���\��8�I$N\�4[��2�_\�T�\�C	\�p\�\�!D�\nD\"++��H|�\�\�\�$\"\�l��< \�a\�Ν&11���\�9�y�fD\�G\"��ʧK	=�< �\�\�w\�5�\�ק��D\Z4h`\�|�MD\�G\"����%��C	Ϡ\�-99���iԨ�Y�h\"�H ���X�d�\�\�\0��h֬��5k\"\�#�\�,��DB�!��g�3g�iܸ1==@%���n�L��H�H$vgf�(zy@$<ôi\�L�-\�\�*��\�ۛ��D\�G\"q\�\��ui�ˇ5\�czy@$<äI�L�V�\�\�*�\�ݻ�!C� >[�j߆�����!���Ч�:\�\�T\"���3���G$�$\�Ι\�o��|X\�=v>�%@$�23t\�PӵkWzz�JD\�e%	��V�ܕ9�\�\Z	=\�ꖈ�g8p�\�۷/==\0�?D��\"q\�9�{�yq�%\"\��=�\�\"��\�\�\�<�\���\0�\�\�ɓ\�\�\rD»\"q�,\�	D³hXcذa��\0��֐\�Z��wE�,Y�Ҳ�\"�(\�ʴ4�\�e\�&55��H\�*\�H qK\�֭\�ĉ\�\�*����H\�	ߊDZZ��1c==@%��?\���!�D\�cϝ;���ٷo�	��\"AC$��6\�\�\�]\0Py;v�(�H<�\�C\�D$	D�ҠA;~\0\�ڵk\�\�O?m-\�\�ӧ�p矊��{;ϕ�\\��%�\���9��i��	�}\�\��\�m�ܖ\�\��\���\�}\�&�\�z��q۲@ ���:\�m/�ϙ\�>����I�~/�k�5s[}�y���\��\�=�\�\�\�Ļ���o�]��ז.]\�\��@$\�h\�v\�ƍ��\0��C�\�.�mڴ1�Pȸӹsg��\�/���2ED\�\�܋�\�:d]�%n;\�Gtױ�u\��Tw]\�\�\�xL}]�\�;�xOI�\�F��=._^v�ΗDH&\��o\�\�\�v�}��3$\�n�LR\�>~Z?W�\"iq[�$&,4\\�	D\"ut;w\�\�\n\0\�\0�\�O�>6��\�\�͛�Q�F�\�۷�+��{aޫ��+\0��v\�\�\�c\�8����r5�۹s\�\�޽{m��@$�u|�\0eC⭵W4\�IA	�V�]�h�\��l\"�?d`c����u\�ޓ�P��쁆/��j�\�\���p<\n5Mɿ�@t\�\�\�\�p\�\r��\��\�7����\�R\�ӧO�\�Wq}���\�C\�k(릟7a\�����\�EB\'��\�\�\�\�\0J@\�\�\�ٳm筡@\�wx���E\"���h\�T��\Z7\�\�\�\�\���\r]��i\�C=d\�ҲeK{ٲe�~ߚ5k\���}���\�o���-�H��\�+1�\�;v\�0={�46l0o���}=�Έ��E\"77מ��\n\0�\���\�\�\���\��h���%\r\Zd2339_*@$TQD\"\�M5o>�\��\��e���\��7\�x�\��^z\��\�W�2\�_���\�{m\�n�HԮ]۾<hƎk�/^�\��\�?0����}n�v\�\���g\��\�\�?ln�\���\��\�f�<�%�\�\���Ǐ�c3n\�8��\�|�\�_�����b\�\n�<\���\���}��o�\�\�!>	}\�bJ\Z�1G�1\�?��\�x\�E�;v��9E�/�ō����\�\����֑(N$$\�\\s���\�\�~H�\�z�m�|�}�\��s�P\�w���^=u\�\�J\�\�̙3\�󒒒\��H��я~d������o���o\�!\n����<�\�3��\�W_mg\�w\�}����Z�\�F�N�\n�F�H�T$T�H��x�Y�|�\�ׯ�III�1m�5b\��e\�T�\"\�\�:��lD���{F�[�n�Xx�C\�\�\�\�3gΘ_|\��I0�X�V�.	=^T$�I�\�߿���z�\���8\�뮻\�JE8��\�v\�\�UH$\�@$,*\Z\�\'/\0?�{�n3z�hӢE+\�����\�؎�L$>��H����H�Gǔ�\�}\r��/�\ZF���7�\�;\�\�Ǵؙ.���\��^ S�N��խ[�2�9r�}LY	\�_�jU�H���o�\�\�^\�v�=\�c�^ �\�e����E\�\�T��Ow�Ƀ>��?\�dee�\���j#N9��\�m�\��U?�D��}���\�Z����\�_����\�ͦM�\�UW]e~�_XЇA=W\�q�G8ƪ�P�BQ���\�;ͤI�쐅�z�8�x\�GJ	\\\�\�+]K	��;�\�P\�OH\�\"I-?p\�@���H�ƈ��\���yE\����\�C\�Ql�,DX��\�o���\�<&��\�{\�c���\��`\��\�ɓ\���=.IPAeQ�PM�\�T4�\�/\�ד�D�\�M7\�t�Hhh#r��j&\�\�{�C���_EB{l���W�=j;\�\�\"Iuj�BW\�j�H�19\�/U� �\n!5Ÿ�\�5cC�P��\�\�J[WB\�\�,\���)\�W\�\�H��9s\�\�On\0�\n+W���b\r6�)\�&M�\�Jsm\�\r5_$�p�`\�.V�D$�6m�-<�\�h\�1c\�\�{$\ZV�U�^�o��H �\"Q��\�F\�g|�\�G��\�$�\�ͳ� i�<H\"4�+�\0D�@$�\Z��\�x2\�Z$F\�U\�\�\����\'�6mj\�A\��S\�(�D$	D�����]��A|I��~�򗿴_\�U&T��H�l�H�}����\\�`�H �\"hZ\\߾}\�\�\�L\"\��O\��\"\�*h\n�\�s\�6hj�\n}�ʞ\�\"�H �D�\�O<A\��q�\�5\�k\�\�O\�\�\�+Iv\�\�\�.E�$\"�H\�	�a\r}\"������+C��k{\��Eo�ܴ�$�Й\�AE�Z�zϞ=�#��!^C\�\�*�����0�shu:�\�kFC\\\r>\�nx�\"Im��\r��!�6\�@$h���iݺ��8q\"�[�KD�LԪU�̙	\r=4h\��\n��\\\�\�|%T$�����\n$U(ٶm[�I��\�@$h���HKK�����}��+}\���\�<Dn�T\��\�*�\\�f�4h�]N=\\$����\Z\0�\r��H肠\�7��D���2k׮�BPtFmO,�v~x�2=O¡z\ZmQ�u�	D�@$,����� �$\"�36��_K��\�\�}\�I���*\�CZ:]�3\�:\0�@$	D�Xt\�\�V\�Pq��Π�����Dq�	m�[�D��f]�\�o\0@$h���P\�ZKC\�\�T\��9�QV��|]eJ�pӎ�\0�\"�H eBR\�K��,�P�,���F$��c֩S\�ԫW\�4o\�ܶ�fXEK�\"qe4���?\"�H�(\�}\�\�!z�J�p\�{֬Y&���x�\�\'/�͡\��\�4#C�O\�w�\0 ��f͚\�\�\�l��ځ�\\�8�H\�\�E\���\��n�(\�z��\��\�ΈE$\�?\�J\�L�t5 WfŊ�V�Z��\�\'�\�؋�s\�\�F\"�-[v\�mC�8C\�D^蔝(�iѡ��\�O��n�PjUC5mʤ!���v���VO\�\�ZQ�u�a�\��IXc�i\�\�.lԮ];�\�fǎ\�G]�t�\�v\�Ѡ��{�\�e7\ZS����v(}�\�Er�\��vGSmG�\�G�igh�\�1c\�\�}�\0�����v�\�:\Z/���y�\�\��FM��?��ݰh\�\"�t\�R�J���Va��N�[�\�lذ�֗h텭[�\�%�w\�\�}\�\Z\�\�\�_�zvF��$\�i�/@$j2��)��R�5���S����&�~E\�y/I�\�2�	5Y�>�*;�����V)\�zJ\�۷\�^$u�ܾ}��x\�\"���%\�\�U�\�b���޼�V���.\��\�ͳ�\�u�V*]+#\�\"���\��\�\"?n\�8{\�\�\�_k\Z�1\�J��\�H��J\Z$�\�D�>}�\\H2Ժu\�f\�s\�\�VD$%�5Ɋ�E�\"��̨Il$9j��$H2$)�I\0�D�<I�\"\�J\'nY\n\Z\�\�\�\�.s桢DB<��\��9}�W6@$<ƃ>x�ۿ\\PC4	�\�І\�DbUtX��a�\�\�HPT	��7	������u\�\�CD	�s�P�C�\�\�\Z��^k\0\"\�Mǹ\�my}\�*��H@���V�\\�z��_U�6ʻ\�8\0\"Q�q��\�E>\�\\\�P�A$ ��@D��UYfS�G$T�\�\� �Gbb�Sܰj0lKt	�\�څ�\\\�\�ʖ*:@$<��8^�H8���\� \�*k�\r$	\�K\�\�\�f���\�%D|����\�?	o\�J\�m��(M$\�y�H!\�\�Dyj\Z�@$�C \�\�\�\����P��n�(�D$�\�D��\0 \�ŕ	�\�x`�\�ҽ?TSC�\">\�LD#H �?\�q<4\'�@�\"RW\Z\�\�O\n+���\�\�s�H<J$	�2e\Z\�5H �/�,��H\0�I&�Y\0���H�z�\�\�@$	�be\",\re�\0@$|Uq;\"\0%\�@<��\�\�	������{	D�\�̄>q �H@Qǩ\��g�\"P*	\0D�\���\"�H\0 �H@ԄB�!n�p�H \0� K�\�T\�qv	D\0�\0Db���H�#�\0\"�\�\"k%D�\0@$\0��XD\�\ro	D\0�\0D�\�q�\�\�H \0� 5�`�3�u �\0\"�\�2�q&11\�!�\0\"�\�\"�ǹ�H \0� �H\�i\�.\"�H\0 �H@T4m\��zv�D$\0	@$ &\���\�7\�	D\0�\0Db\�x\�m\�\"�H\0\"Q���D�\0@$\0���	�Bܾ\��@$\0	@$ �\Z�q�`�C\"�H\0 �H@Ը�+\�	D\0�\0Db)�\\\�\�\n\"�H\0 �H@,C[\�6�H \0� KF\�#�e	D\0�\0Db�O\�֓H \0� �H�\n�\r�\"�H\0\"Q\�Ją\��OD�\0@$\0��X2y)))?&�\0\"�DK-�}����P \0� III?t\'�H \0� K}\�n�p�H \0� K}D�fm	D\0�\0D�&t�G�\"�H\0\"Q\�8γn��E$	\0D	��P(��\�/l%�\0\"�\�R#�\�mo	D\0�\0D�&n�\"�H\0\"�d$v�m\"�@$\0	@$ �8\�AD�\0@$\0��XD\�\�Z	D\0�\0Db�s�P\�1\"�H\0 �H@,Ŗ��H��@$\0	@$ ����]��׈\"�H\0\"Q�裏ޢ>�H \0� 5����\��	��\"�H\0\"�k<D�\0@$\0��X\n-\�:��C$	\0D	�\ZW\"�}\�A\"�H\0 �H@,Cϻm\'�@$\0	@$ j���`0�6�@$\0	@$ ��\�Z�-!�\0\"�\�\"ۃ�\�4\"�H\0 �H@,\"�q x�H \0� �H|涎D�\0@$\0��XD\�LЅH \0� 5�\�\\�_��}D�\0@$\0��X2y\�\�ɷ	D\0�\0D�\�����?	\0D	��\�\�Ļ��`.�@$\0	@$ jB�\�\�\\�8O$	\0D	��>��\�8\'�\"�H\0\"��D_�}B$	\0D	�\Z\�qƺm/�@$\0	@$ j���?\�D$	\0D	��`0��\��$�\0\"�\�R#�ٕ���\"�H\0\"�d$�9�3�H \0� KF\"\�m��\"�H\0\"��\�I\�q\Z	D\0�\0Db��H<D$	\0D	�\ZW\"�\�v�@$\0	@$ Zj�/�W�޵��\0@$\0��h�5�\�<\"�H\0 �H@\���ݾ\�\"�@$\0	@$ j��`}�/8M$	�Ri֬��\�Z�\r �\�\�\�cD�\0(�իW_Q$f͚E�\0��_Fb�{�\�\'��iҤI����bΟ?O�\0���\�\�t\�6\"�H\0�++1s\�L��?�6��-�HxX$�)qΜ9�O�>�e���]\0B��iܸ�\�ݻ��4i�9}�4=\r�Hq��� ��o3\���W��E\"++\��\�\�\�2q�R�Xt\�\�\�\�ر�ʔ��6	_\�H\�r\�d\"\�!�\�\'\�A�Y!�F �k\�R����4oޜl \�8\�ēD\�#\"�e\�۱�-Z�q\�ƙu\�֙���g\�\�\�\�kvv�y�\�w\�?��OӶm\�˾7))ɬ_��\�\nX�|y��C\�f\0���E\�s\�qZ	��:��\��:u��p\�ҥ2�ΦM�L�\�\���k����\�Z	��H��F\�\\ �\"\�\"!��\�HLL4�\�ϏJ ��x�b;���p(\�JԩS�@\0\"AF\�\�~I$\�X$4�!q�\�صkW��p}��iժU�\�\� �~�i\�!��\0��H\�C\�MD\"NEBi\�ȚI�j*�^�L�f�L$⪫�2��\�/\�Wd	R�^��u] q,��9�QQ��\�2�\�=z��7�D�\�a��\� ��_kh�HĩHh��Ⱥ\�DT&�����А\n�[\"�t\0��6\�5��{=8K$\�T$�\�T\�\�.T�	إK����E�\0�(��2\0��?дOM�$q(����\�)�U���+`\�\�\�\�+!0\����\�BT\��\���C�\�4\�\�\��L�\�E��7Gi��\�ȆO$\"R&jժEf	�\�d�Z��HġHh��\�|\�ĉUzN�6�\�\�\�eKF�mgw\�9\�\�\����>\��	@$��\�\�\�צ]D\"EB�x�/\�Z��*\�0J�g���?z��6lX�5-	�ID\�\�\'3���E\�-m#N$\�P$\"\�#>\\�\'�֕���P݄�;�XUq�\�D�KDnn�\�j^_K�\��\0D\��Ŗ\�\�~~��C���P�7\�*��\�A\�_\"\�\�.\��\�kI2Q\��\�L\0\"\�\�\�~�C\�p\"\�\"QD#\�\�\�6c�)�ZȪo߾v!-\r�ddd��\�Ǜ�S�\�R���l\�2���i6n\�hv\�\�i8`�;\�\�P\�4��C~\�[�LDJD�5mڴI\0�\Z+\��@g\"AF�\\	V\�u4�M�2Ō;֌1\�<\�~2\�ի�\�ڵ�\�С�iӦ�iٲ�\�MR��\r�\�\�d��\Z:ѐI\�I��\�s�\\}��W��\�jݺ�}m�]���\�o�z\�)3|�p��N�<\�̘1\�n��h\�\"�j\�*����i�\�\�c�9bN�<y\�T�\�%�$I���+=�a@$<)�\�\"\�HDE\�\Z	�l�2�=����섲\�V(k�셲\�f(��솲\�v\�wR�CYeC�QvDY���4[�ڨQ#�_�f�D\�K\�m\�u\\��z��\��I^�7o�Y�+eJ���/�I\"\"�9\0��H\\��8��8kCh\�F\�Ν/�xED�J��\�\�g�n\�j3\�`(�1w\�\\3s\�̸κ<�\�e\�\'\�^{m�%��LP3��\'�-�\�>\�D\"E�&�#!t�Ҏ��B\�ͺ���me\�\'\�H\��Hx�|���?k�8	}\n���-�麬+[J(�f�]�^���>\rg\�D辎G\�\�?l�W�\0\"�و�\�\�@.��S�Ч\�ȝ?\�kb!ک���а\0\"�\"�{-8O$\�T$�\�ؑ�VEV�{�\�\��\�Q���\Z��^k\0\"�\"\�ؽ�$q,YYY�\n�4~^�,^��\�Le\'�2Q��6X�\n	o\n���ׂl\"\�\"!\"�.55q׮]�r\�i[\�z៥lxO&��MQQ\�H�@�\�\Z�HxJ$Ƹf��8	MM\�.�\�TŊD��\0១�\��\�$\\�y��ȕ-5]\0��\��`�\�8��D���\�\�\0�C���\�L()�9�y\��a��\�k�\0D\�s\"�\�m���DB̛7��Lh�C5\�)�TMD\�p��\�0\0�d&\"eB��\���<֋\0D\�\�\"�IY	\"\��(N&³96m\�\�먈R�2]\"\Z��_f�<5\rH \�\�q��nK$<$\�a�Ț�\�\����\�;\�ؽ9\�}\�j $Z�2r��Ț�3\�L�gx\0��Hd�׈�D\�c\"!T9��<M�3(�$3� �H�fh\�ۚ	�D�3��#W�,K\��ؔ�x\0g&\�2̡)�V\"\��8_�^��	�D-���9��\�N�[��\�A�x\���\�`\�k�%\���@\"\0���`0�nݺ?%>��,\\��@\"�.]J�喉\�֟\0@$<��0\��H�P$�}���E&\�\�P\�a\0D\�;$\'\'\�\�^C�EbΜ9�\�D���h	g x\�v�D\�\Z�s\�\"��H4l\��2�h֬=Ĕ�\���\0D\�\Z!��!>�^x�ę\Zk׮�w��\�{Gż\0����\�����H�PU�i?\r�hъ�Ǐ\'�H�O$�q\������DB\�?��~�WB,\"q�\�Q���j$�9���H�H$J\�FD.�\r�H8p�@\0\"\�\Z�%n[K$|Xlf\�Νv!*���о}� ����@`��Hl߾\�n5P^��� ���n{�H�X$�U8\"\�E\�!��\0	߉\�!�=E$|,ڐK{n\0�\�\�lذ�@\0\"\�3\�\�qE�5��H��\�E\0�<$\'\'�	 �\�H�\r�Bu���Ebݺu������j\�*���D\�Rbb\�	�Dff��4	P�\���e\� �	�裏\�B$|,�W�6\r\Z4�G�rѨQ#�h\�\"���HII�I\"A$|.+W��ii��m\�\�͛G \0��W6\�n\�%>	����(M�41�g\�&�H��P(��\�8爄\�Ebɒ%6-\rP�7on�q@$|��h\�ω�\�Eb��&55�\�E˖-\�ԩS	 ��An;L$|.\Z\�\��6@yhժ��<y2�\0D\�G�I�H\�&>��s\�\"PnڴicƏO \0���`�U�m >	ȩP�<�o\�\�<�\�s	\rmd:��:��H̚5\�4k֌\�Eǎͳ\�>K \0��HluEb&��H�\�^�\0\�k׮fذa	�DV0A$|.ӧO7iii�(P.z�\�i�z\�)���D\�h \�F$|.����{\0\�w\�\�\�\'� �H�\�qN�2�D$|.S�L1\�\�\��(P.��\�g��\�O \0��WF\�b0|�H�\\$&M�d\�\0\0(\�F(+�H�J$�RSS�O$|.���5\0\0ʃ\�#T\'�H��z�\�]���g-�\�s�;v�i۶-=\n�\�\�\�\�\r\0D\�����\�q�<\"�H���ӡCz(ZCBkI\0 � �\�m�\"aF�i:u\�D�\�B�ZjuK\0D\�7��\�v�H f��\�s\�\��(P.ƍ\� ��^n��H �mC���?����pg�+��\"a�b�w\�N�傅\�\0��H\�rEb3�@$��{�\0\"\�;�X\� ��4h	A�a;z@$��+\��\n�@$\���M߾}\�Q�\\̛7\�4nܘ@\0\"\�b\�=�\�#��\�A�$\0����\�\�T��D\�W$�	D�͖�BX�l�iذ�����cv\�\�a��� \�\�8\�fD��\�\Z\Z\�\0(+���$���h܎\�h��\�\Z�.@$<��8\n��F$	[h��K�h\�ӧO��&�8z�(�D»\"�\�~���H �G�f�\���(uV\��4R�H\�}�HxZ$LӦM�\'��\�֭�:t(=\nD�VE-I$:D�\0��(u\�\���{���\'\"�/�t\�b�y\�z�)+Q\\�K�\"\�m\�ׯ�{�_$��E;�1�bbҤI��\�ڵk	 &11\�q9C$	KǎͨQ�\�Q f4�#,-Z�  �Hx�`0\��=\�?#���}��\�瞣G��\�bTa�\�m\0D\�\�8�3\�=\�?&���m۶f\�ر�(P.RRRl�\0\"\�}\\�x�m	D\�ҦM3~�xz(s\�̱	\0D\��\�\����H �V�Zق9�\�\�߿\�1._�ܼ��\����^�z�ٽ{7o(@$\�W#�\�^#��%==\�L�2���KĚ5kLvv�9�<�\�\�O?5�V�2�v\�\��D\���H��H ��-[��S�ң\�`��@\"*V&�\�@$b��8\�\�\�`\"�HX\�\�\�\��\�\�\�Qj0�\�!\0\�4\��H\�<��㶶D��4o\�\�̜9����D�\Z��8\�8N=\"�HX�5kff͚E�\��8��a���)f۲��鶎!� ,�\��[\"�HX�6mjfϞM�\�\"q2\�ٺ��\��Z�BM\���H\0\"Q�\"�m�I$	K�&M\�ܹs\�Q\�\\$>\��\�en�\�G	@$*�ڵkM\"A$�\Z7nl\�ϟO�\�\"��ʧK	=�< �HTu\�ֽ\'\�	D��\�\�T�G��Hl}�o�\"�ǐD�� <���p�H 4j\�\�,Y���@$\0��+[�\�8�@$\nhذ�]:\�[$4K�$�\�c\�\"�D�\�@\�q�	D�\0\�ڸr\�Jz�8�ݙ%��C	@$*�����n��H 4h\��nd�-\�n1[���|X\�=�ǐD�\n��n{�H $\'\'�\�\�Lz�8	�}�^&:�8 �HT�H�q\�2\"�H���d֭[G�\�\"q\�\��֘ˇ5\�czy@$\0��\�y\����\"QH$6l\�@�\�\"��+we�*�FB���%\"�De$�\�6�H ԯ_\�lܸ�%E\�\�9sx�\n��\�\�%JD�\�9z.\�	D����B�\�D�($[�l�G�3��R�\�\"�D%e$N�D�( 11\�l߾�%\�D�,Y�Ҳ�\"�D|\���H��P �Db\�Ν�(q&�JD�!� Q\�Y�r%\"/))釄�( \n�={�У\�c�\r��rq�\�W#e������\�=W$\�5\�\\3�� �D\"++��@$�W\�}�\���\�&!!a}JJʏ�ܔ.n\��W��\�w��\����*�\"�\�\�_��Ѻn\�s�\�7���o\�S�D\\\�8�U$�9B��H \�\�\Z	��]BB\�n�康_{�\�Go\��sEY?ޓP!\�\�ѣ�(�\"��0�\�\���+�\�v\�q�Y\����R\�If��\"���C��H \�{����\�2qĕ��n9\��k��Re\"�̄�E\�=Y\�ɓ\'\�Q|$Ǐ�u1� �O�t�\�&�H|\�~=\�Jų\�ZHD�ߗKf\�\�\"���/�w\�6�ӟ\�S\�\�w����\�/\��zK�.\rwĶ}�_4\����\�ȑ#cz��\�י2e\n\"5B$\"���\�N�\�l(\Z�DP3�H�\�\�\\z��\�\�ӧ\�\�~�3s\�\�\�e\���\�gn�\��|\�\�۷/�\�\\�d�\�y\�3d\�ӿs\�w\�c~�aԯ�c\�ӳgO��\"5I$\�H\"$�R\�\�\��\�˄2d`�>��	���R\��aÆ!	e�~jРA��W^y\�^�w\�\�e/^l~���W_}\�>֮];{�\�ٳ\��\�\�v\�o~�\�n0)))\�ܹs\"�\�O�fzz�=�f\�\Z{�S�NVXn��VӡCs\�\��\��\�\���\�����\���׿6+V��?�<YD*S$\�\�`08B\��\�M��B�����\n�����\�Y�L��<2~\�Hlݺ\�4j\�\�4l\�\�l޼��ţ\"1`�\0\�i���,��ٳg\�\�gΜi\�k{yݗH(K�\�\'N4�z�2?��\�\�\�իD\�\'?���]���\r�\�u\�]V4֮]k���cҤI�G��vff�\�\�E�[�nm^{\�5�6 D¢Lb� ӕ�OT�Y]\nI�֊A(�Θ9dY�LDJD����a�\'�\�F>\�\�\�P��\��DBCz?͛7�\�ع�-ŋ���?\�\"�`�{��\�7�\�_̘1c\�PI�H\�y\���2�N�\�\�ر�=�\�FX�ӰG�Z�LZZ�\�޽�=.�E$ �D\"B(n\�TQM\�\�\�P(��j	Ɍ\�\�s�.sϳ\�\�QQ�$D\�ĕ�\�>�0�t\�\Z�M]oܸ�^\�C\"�\�K/\��s\�\�ǔi��l�a��:u�}�nݺ\"����שS\�|\�k_�\�G�\ZUhh\�ԩS\�\�{\��322\��hE���jٲ�m�>=���;4�q\�}�\�c�ģH�\�\"VZ\�J�Ziq+-rU�\"��i\�-_(&>�\��\�\�XXY�,\\SF�`6�_E\"��Pg�O��@\\�x�\�\�\"��2\Zzp?A\�zZ*�p\�\�	;̠��:!\�I\�|�\�\"ѥKs\�M7���\���\��-\�2��\�.���P\�B��O�^ /\�?�����\�\���\�e@\�C&EE\��޳\���+W�x���$a�̶{�\�\�\\\�o��Y\"aJh\Z�\�\�\�\�d\�|QT&����H�х�q\�\�6;�*z�o�ϊP��4U���y\�7\�cZK\���\��)��\�_ \�\�\�������\�\��\�_\�:\�韑Ŗ���cz\�\�n�q+/�^M=\�\�gz��.5��\�o,89��,�	��\"F��\"�>2K\�J�2�ܯ\��\�\�ۧ\�\�\'�6?u\�!�e��?t�nw��I�n[�!�@ ���:\�m/�ϙ��-ܯO�\"\�v\��ާ\�_�K�\�\r\�\�D4�0��E\"\�\�ѣ\�\'���\�D��D�\�\��c(\�:T�v\"�;v\�\�A�?O\�S\�\�cA*�HD\�P\�\\�v\�)SQ�nݟ��ߺ���P(��۷\�w[3�\"\�N�I�f���0._^v�ΗDH&\��o\�\�\�v�I6��\�\�J\"a�&��\�mQ�	\���8�<\Z\�\�����L$Ğ={L�&M\���u\�\�}\�\\$h�T�HTQ�DI�+m�\�(\�0CEg$�\�\�S�3n\�8��\�\�d\'	D�\�G34�\n�\�8\�����в�k$zRp�HB� 6k\�\�$\'\'\�=@$	@$�U$~�/*\�|\�mw�\�۪r\��S!\�3a\���\�۷�-\�D�\0D�\�[�\�=�%\�bT\�ͦ��u$����H\\U�7o\�ܮ���\0�@$\0��+z�1�ȕ-�rG$ʄ�\�);�哵\�! � qCe�D ѡu�䱲Z,	D��\�LD\�ĸ/�m�\�\�\�^\"Q~�\�r(�\�/��@$	@$\�*3Q��$��8����U\�\�O˖-��B$	@$\�33\�� Ì3lv�[�nv	f@$	@$\�f�@$��#G��֭[�\�\�D�\� � q��(\�0G���D��m���\�N�Ǐ�C$	@$\�;3��@\"��#;;۴i\�\�f\'��# � q)ŭ?�D\�1{�l��\�ر�݉	D�\Z/=��\0D�rѶ\�m۶�ى��\�ӣ!� 5�fB2�\�\�\�H\�4\�Νke�C�\�رc�lŰ|�r.�� ՞�p\� �D�D!��PH,�0k֬��%@\�4\�$�� ѡ]F\�իw�@$j,\Z\�Lh\�CC�/�\�\�cV�Ze>�\�D��$b׮]��\0��^$�\�ԩ�m\"�H\�hT|�\"Lc�(�O&V�XaS�5�i㶚���!�H�K$rǹ�H q���*;�\�J\�C\�F����@$<-�\�ի�k\"�H\�\rZ��K�.6;���\�%\�	@$</���D��;����Zj[c\�P�P�,\"��\�E\���\�oD��\�O�\��KىiӦ�\Z�O5\0���E\�\�8��\"\�h[rmO�mʵ]9\��\�ߏH\0\"\�}�8\�\�\r�\"��>}\��\�\�\�f\'�N�J@j\0�U��\0\"\�i�8D��Z[!))ɤ����jdǎ��\0��Hs[G\"�Hx.;ѫW/�V�2e\n�&�lقH\0\"\�q\�\��B}�\"\�I\�|�M��h޼�\�\�\�\" Ŭ\rl�	Og$�\�)\"�Hx��gϚ�}�\�\�Ą	H�n\�:D	\�D�\�8\�	D\��dff�\�\�dӬY3�o\�>RE!\�\0��H|\�~P�@$	_�%���\�o�cƌ! ����HII!�Hx[$>p\�T\"�H�.\�ޠAӤI;E*��K���\r@$�-�ǙE$	_f\'h��G�& ���Ljj*�\0D\�ø�ۏ�J$	ߢ�J�7n\�\�\�ܹ��T s\�εY\0D\�\��L�-%����x�y�\�\'mvbԨQ&77��T\0�g\�F$\0��~Fb�\�w�A$	pٸq�\�N(�}�vRNfΜi\��\0@$<-�\�	D�Q6bȐ!6;1|�p�\�\��^0-Z� �Hx{hc�\�\�%�a�\�\�v\�A�F�\�֭[	Hhy���t���	�B/:��>�@$��\�İa\�lvB_\�ND�Vmݺ5�\0D\�\��\�ݶ�H P\n\�H(3��2P6ƎkڵkG \0��vFb�\�8{�\"e\�N�fB\�	\�P���2�C�	\���\�\��1�@$��h6�fuhv�fy@Ɍ1\�t\�ԉ@\0\"\��An;L$	�2;��&��\��Z�.Gu%]�v%�Hx[$z�\�S\"�H@h%L���\�VȄ\�<\��\�у@\0\"\�a�@;�C\�gD��r��:��\�\�\�\��ŠA�L�^� ޮ�h\�D��r�]D��v\�\�`̀L߾}	 \�\�Hr\�4�@$��7n�\�N�\�\�\��\�	I�d\0��.�P��+g�\"Ⱦ}�L�f\�Lrr�\�\�\��mz�\�m�7\0	\�\�8\�C�H�\'�TZ\�Q\�	}2?{��\��~Z�\�\0��.�\�׿ϕ��D��J\"++\���dV�^�]S?5\0��.u\�ֽ\����K$	�d�����\�p��i_�\�;v4\�>�,�|@$<��!\�			yD��*\���&--\�f\'V�\\\���W\�ck�l\0D\�\�\"�MW$�\"U\�ԩSM(2={��tvBv�3�8 \����@$�\Z8t\�iٲ��_��Y�l�\'�\�V�Z�I�&�\�D\�\�H$��\�{\r�@$�\Z�1c�\�Nt\�\�͜<y\�S[zz��\r@$�/�\�ջ�H PM9rĴn\�\�$&&�%K�x\�\�R=\��\�\��\"\�q\�\�KMM�>�@$��y饗lv�s\�\�\���\�q��hګ�&\0D\���\\��\�\�D��\Z@vv�iӦ�\�N,\\�0��\�=2{�l���Hx_$.�\�D��\Z�.�\�Nh-�������\���y��g\"\�q��\��\��OD��\Z\�ѣGM۶mmvb���q�����\�}V	(S�\�9��\�cD��\Z\�ܹs�Lh��cǎ\�\�\�ݰaC�t\�R���Hxh\�\�BD��\Z�B\"!��X\�)))�X�	D\"\�\�8��\"q��8$\Z�\�\�GMA��\�ر�P=G�\r̚5k��\"\����W&Z	D\�]�U��b̚2+B���)�i�2ɏ�:��a >+�<\Z�	D\�2\��颚6Z�\�ٳ�D��\�Ç�OD�#\��D��8DWu\�\�\�f\'�{�\'-�U�D\��#��gk$>veb(�@$ �\�\�\�\�Nh�m-�]Ӳd#\0��H\�sEb4�@$ \�Ѧ_\��K���M�V-���\'��\�j$v�ID�\0��mɵ=��)\�v\�U\���\�/�q\�\��OD\�\�5\�\�s}�@$�C(гgO�\r�:uj��lm\���\�\�ds��y�!�Hx;#�1\�!�x�U�V���$�����\�g._��@$f̘�?	\�g$ֹ2�\Z�@$�\�ى^�z\���L�R%?�Y�fV$\�iIo\0D\"\�b\�5n[N$	�8o���\�Nh\�A+QV&�W�6u\�\�aX	�\�2\��@$��={\��\�\�\�f\'&L�Pi?\�駟�r\�޽	: \',p����\">\"33\�Bjb߾}.W]��ۻ�+�;�\�Y�0�6\�4�ML�\�4f�ƘM��\�d�i\�6ͦu�M��\�{�����/`Q�� #Vt��nI\�b�%�[e\�.�ŅԡD	�u\�U�Z�\�p�97����̽w`\�\���$Ol}a���;_�s���Q���\�+���#�.�v��� 1q\�a\����?���F\�@<\�{\�b!\�\��ϐ\��P�$j��\�7uvwwWN����؟!\�2w$V\�ׯLBH��݉E�U\�N,[�l\�\"b�_�w(@H�\\H<�\�6	!a\�Ν���#tuu�}��\rKD�́�hM\�ryI�e����������x�\�\�݉G}4���7\�1q\�W�3��h!yD,(��LBH�Yz{{+w\':;;Þ={\Z��\�.Ƅ;��Yژ�_�MBH�GĻK�,�ܝ���;\�\�J{&-uG\�<$~gB\�\���E�4iR�<yr�;w\�Y\�\"\�ȹ�>{&-]yH5	!\r�_�\�W\�7��\��\�5\�\\S���<_L�\�\�sg!\��J�<$\�7	!CZ���(\�a8��{ޘ����kʔ)�uݙ@H4�B�pc�����F\�\��犄꘸\�_`�!\�\�!�\�<$N�����\"\�b1#JDTOs $�O[[\�g�8eBj��\�ĕW^9\��L $�*$�+�J�&!$����PL\��9ͩX,�E~�6	!ڿ\���뮫韋\��\�D\���|-��\�/W�\����\�\�\�\�\��<$\�MH��\�Hu�a�\�H̙3ǿ�Ds�BH	hhyc��H��òB�\�7\�c\�3	!5\�\�p>�\�p*�D�D�T�\�$���������s$V�Z\�i\r�Ds�\�\�,\��\�$�\\p\�a��\�<\�r֬Y���hސ\�/�\�cBjZ\��wm��DӇD_�T��I	�ꘈw���\�\�\�y�֑Gĉq\�\�}\�$��\�D#{\ZDB�\�\�Hϯ�&!$\��ǀ�}\"$Z2$��_\�&!$\��F��@H�\�\�\�{�Ba�I	�\�\�\�P�9\�#�6V\"$Z��ĻyL\�2	!�\�\�\���\n��hِx+�曄��a��s�?B�\�B\�R��\�$�KLD\�P�=@H4}H\�Cb�I	h\�C�e\�����x\"$\�	�W�\��\�&!$�aǎg^),\"�\�#bo�Tz\�$�4\�wީ�\����\r!�NH\�ο\�hB\Z�\�k�\�\�	B\"!���\�B���$�4\�W^	\�r\� i\�ؖe\�s&!$�a/��Rhkk3�DZ!�%��\�$�4l\�Ν���\� i�\�����&!$�a/��B�0a�A $�G\�}&!$�a�7o��H\�\�\�&!$�a?�\�O\�\�ɓ\r!�VH��gI�������\�?\�\�\���HH+J�үMBH@\�֮]�N�j��\��p�X<`B\Z��\�O�\�ӧB\"��X\�\0jB\Z�r\�\�p뭷\ZB\"�=��\�-�а\�˗��3g\ZB\"���=�\�5	!\r{\�G\�w\�a���6�\�!�I	h؃>\��\��\�\n��yH��$�4\��\��\�\�3�DZKc�\�I	h\�Â!��q\�\�}�T*�0	!\r�?~\����H|�X,������͝;7,Y�\� i-m\\�_�LBH@\�\�?��A $\�\�\��WY��6	!\r�\�\�²e\�!�\�\�\�U\�bQH	h\\<\��\'�0�DB�L��<$\�NH@\�n�馰j\�*�@H��O\"\�\�\n�АiӦ�5k\�B\"���\��\�$�4���;�_�\� ���-\'L��\�&!$�!���\�\�g�5�Dz.�ǌs�I	hȤI�\�O�S�@H���q���\�3&!$�!&L[�n5�Dz!q�P(|\�$�4���=���B\"��� �MBH@C\�\�\�\�\�ݻ\r!�\�f\���\��\�$�4��\�3�Dzw$�\�\�d�АR�<h��B\�wY�\�bB\Z�9|��A $\��\��5\�$�4G�5�Dz!�\�,\������C���\� \�\�\�yH<`B\�v\�ĉJH��H2$�\�ף&!$�nG��tC\�W��\�$�\�\�СCB!��,\�^.�J�MBH@\�^}�\�P.�\r!�\��]��\�$�\�mϞ=��@H$=��\�$�ԭ��7�?\� i�\�\�,\��\�$�\�m۶m����H2$6\�\�������mٲ%L�8\� 	*�J��e\�v�P�\�>L�<\� 	*\n\��\�5	!u۰aC\�\�\�2�D��,[S,_2	!u{\�g)S!�\�\�ƿ\�!�\�$�\�m�\�\�a��\���H�Ĳ<&^5	!u����n��f�@H��\�ߘ�����X�\"̜9\� 	*�\��\�1q\�$�\�\�\��f\�2�D�!17��MBH@\�z\�0{�l�@H��\�rf~1	!u����üy�!��b�؝e\�\�MBH@\�-Z\�\��@H�\��:fB\�#\"\��$�H�c�e�����\�e���B\"\�=�_\'MBH@\�\�F˸\��Dz�,�\�b�\�gB\�������H2$�:�~�P�3fT�!��\�\�\�O\�1q\�$�\�-��\�!��q\�\��i�X4?!���׿~��B\"͐�RH	hHwwwX�n�A $C\"�I	�KWWWظq�A $�o��\�LBH@]&M�6m\�d�tC\�t{{�\�&!$�.a˖-��HT�T\�3f̧MBH@]�߉�\�۷B\"QY���?�\�LBH@]��\�\�\�k�t�6Nƣ�MBH@]\�\�\�\�޽{\r!�nH/\n_3	!u\�\'8`�t�6�\�\�MBH@\�!q\�\�!�@H��\����5\�$�\�%>C�\�{\�B\"ݐx�P(\�fB\��\'NB\"ݥ��\�\��\\�P����JH��Hz�囥Ri�I	�\�ѣG�B\�\�\�o\n�\�C&!$�f�	K�W.�7	!5;x�`\�\rI/m\�˯\'MBH@\��\�\�W9�\n�D\�!�R�\\�W�P�ݻw	����K�ҏLBH@\�zzz*/\�!���m��\�&!$�f[�n\r&L0�D\�J�\�gY��&!$�f�6m\n�&M2�D\�w$6\�\�&!$�f\�>�l\�\�\�4�D\�!�1˲&!$�f\�֭S�L1�D\�K\�\�!�\�$�\�l͚5aڴi��H��\�\���\�$�\�\�\�\'�7\�t�A $Ҿ#�D�6	!5�\�w�f̘a��eY�\�yH0	!5�\�w���oB\"���\�u�P��K��;\�\� i�\�?\�\�o\�,s\\�_�3f̧MFH�E-Y�$̝;\� \�쇸*˲��p\�˯���\��\\[LKH�E}\�[\�\nw\�}�A $Һ�D�Nwvv~ʤ�\\Ԃ\�\r!�\�]���\�݈S0$�\�\��/6�Dz1��D�eט���!�3gN����m�\�J�k�D|��\�	�;\�#<�\�#��HP�\\~|pH���e&#$`\�fΜ�/_n�D�y�c $~c\"Bjr뭷��+W\ZB\"\�%��!���	�\��\�\�\�\�O?m��\�J�>�3pao��Fػwo8|���n\�ԩa\�ڵ���H\����?.��Μ%�v~��O\�T~��_\�\�����O������\�\�B\�\�MVa���g��\�����U\�qp�\"�Q�u\��&�,{9�m�B�\�;v,\�\"�и뮻\n!\�bw �x\�b\��C���C!$H\�<p����B�5�;�K�R\��\�\��7jŊa��\�\��\�_Ǐ�\�1��\�\n?��\�\�SO=Uy�\�\�L�_(�f�B�D\�P���\��l-������\��\�11N�:5\�\�\�ڵ��b��\�\�\���,$HT\\�8WH\���h���^ʈ��6n\�XS@�\�sυ����w\'Ą� E�����e˖B�E�3�8]���\�_�rX\���p\�-��ug\�2�� Q\��w+\'N�0�Dl��\�#\"\�yN�׫���{&l�$h�\�\�~,]�\�@����\\�o�\�NĹ\�LZ\��\�q!A�\�aT�C\�СC���hr�\�}qOĥ�LT/�\�%?\�-*.[�_�>\�s\�=����r\�T�@��\�\�\�\nw\�}w�\���W9o�Ds��MU?�q�\�\�K>�ٳgW/q�\�G���\�8p��H\�\�p�\�\�\��\�o��\rB�9�FT�X���H\�	��u��B���\���\�\�]\nw(�~oĂ\�\r��<\�Y�\�C�\�9��4��;��\'�\�<ɮ��=���.Bb�.k�l\��u\�ʕ�u��W�>\�m?\�Ml�\�\�Y\���\�\�i�\����!����j�\�\�\�?_�>\'��q/$h∸\'ى	�\�\��\0�pěo�yYg\�hV��܏{!A�\�1.\�Iv�΄e�Ĩ�#�\��\���\�\��^�\��\�^H\�d\�\�\�\�=�\�$��g\�L�\�\��� $�M,>�1\'\�\���pG\�	!A�\�D�\�IvqI��=�H	�T<lj$O���V���Ԇ�6�M(~\�s$N��wC�9\�_Bb\�C\�9Bj\�\r\'\�\�ws���\�#�y0c\�\'[\n	�Q|\�h�H<B�\�Ȋ\�ڈ��kCH��ŷx��5\�\�\�N�2�cy��z\�\�\�+Q}��\n	�L����ܥ�I��ycƌ�t�=yz��\�\Z;v\���4�\��\�8�ѷ\��R�+3\�\�=�/$h\�H�냐�����OdY���>\��\�o�^\�x?~]\��#\�B�\n��U/q��w�#\"~���L]HЄ\�\0!q����:&�\�m���3\�݈�-$hR�\�\0!QKL<ͱk׮�f�?�Y]!$hrΑ\0!1�e�\�=\�\��scǎ�;�ˣ��c���}^}\�T��\�B��f͚0\ZN�s�%Bb�o��~����\�\�J!A��\�ڨ~�wm $��x\�D�e/V��9�+�X�ʿ\����-殻\�\n#y���\"$�O<N�̻9\�]���_A^u\������\�\�^	Z؁\�7}��\�\�\�	 $hb՛./\�Iv�n	4�cǎ����p9O��_/~] $h===g-q\\ʓ\�\�׉_�	ZȆ\rΊ�Ku�\�ڵk\r!B�bb8O�����@H�� �e�\�=\�q�]��,g $@H�����i�F��t���	$(�31gΜ�N�\���x\�Too�!\"$@H��x�v|7G�K\�\ZZ�\n�p�o�/\��\�\�p\�5B���\0!��\0! $@H\0	\0B�\0B!��\0! $@H\0	\0B�\0B!��\0! $@H\0	\0BBH $\0 $\0�	\0!B@H��\0@H $\0 $\0�\\\�8~��\�v�a\�\�\�wZH\���\�\�;v\��0\�^|�\�c�\�\�I?ihi\�^{\�\�7\�p�\�x�a�\�O~�\��cv��4���>���\�}\���\�\�O����\�h`9#މ8\'\�g�3$��\�\��\�\�\�r�\Z�\�rF��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z��\�)˹�(�\0\0\0\0IEND�B`�',1),('70007',1,'/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.Entrust.png','70001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0�\0\0\0T3\0\0\'`IDATx\�\�\�\r��\�}?pjm��\�Z�6M\��m\�\��k\�\�\�\�$ǓZrL�&�\��ٙeu=\"\n(AP ZM�h�4�\�\�DM\�h\�E)�4�E�7^�\��\�̀�3ϲ����sϰ��/�\�\��ν\�3�\�\�#ɲ\��U\�\�G���=�\"\���q��[||�\�<\0\ZB\n�\��\�צ\��\�\�\�m\�^�غ�~�\�\�\�-?\�3\�\r�b֚\�\��|Z�\�\���\�\�->i�ʸrٴ�\�qGW�\�Q[��a\���8\0\ri\�\�R`>�����5)7F��8cӐ�\�7]1�\�\�5�|ǐt��\�\�g����ǎ�\�\����d�g\�\�x\�[Yv\�ȫ\�s\�s\�-co~\�Ŷ6\��6\�m\�\�\0�\�f��\�ژ]6�\��\��ۘ��zv�\����\�<\�\�nu�c\�.�����\��+ڐ\�\�S��R�lܗZ\�hgM��~�\��W\�h���z���߿t\�;oM_�=7,�\����Sk��\�̍����<\�\�Y�g\��z�R�\�\��uCӬ7\�\�?,h̆c9}���͎��\��u�\�q,�\�I�W�\�C\�gYF�Q\��\�\�~>榅k\���K+#Pۖ�\�̲�#�}4f�gW\�\��SVf�.��t�\�>�z\��7<r,G\�Vw\�9\�=�,��h�]\��oa@#\�\�M_�\�\�\�[�\�s��WYF�d\�;o�|�ƚm\�\�ߝ�\��\�\�M1\�\�\�q\�a[�x���\�\���!�^��ç7��no��\'\�\�q\�s���.\�T}\\qX5l\�\��q\�Qץ���7�b\�ښ\�}z\�\�a[��e��@Vm\0\Z1hϏY\�I�\���;^~�uYk�\�}\�eW\�\�\�þ��1c�\�G=�����\�V��\'�6\�\�W\�\�\�YvI��P�@5�9o\���\�~V}\�\�Ы\�\�}1\�\�U\�*@#�\�\�ogټ8{�ڹ\�\�s���n\�U��?\�GV��j�ʯ\��ޗڜ�~�F�=�\�G\�,�?36\r�lzo\Zz��۫\�_\�h/`���7.\�\�8�ڹo�=\�\�Uq�T�85�\�Yk\�\�<\0l=���\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�.˲��L�r\�ĉWM�0aӰaò\�\�֬��)kiiɆ��3f���\�<�,���\�k�5\�x\�+����e̮���\�\�\�^��l\�ڵYX�~}�t\�\�lΜ9\�M7ݔ\r0 ;\�36�\Z5\��R��U��\�d?2mڴ\�g�yf�f�\�\�?^	՝�p\�\�,͂�~��ei<^E`�\�\�w��MC�\�\�ϟ�퉧�~:<xpv�駿\�\�\�z�\�\��V�\\9x̘1\�e�]��X�\"��Xn�\�7hРw,+\��3\�ڋ.�(۰aCVoW\\qE\�p\�\�ٳ\�~�\r@Éc��t3\�<��\���g}��]�\�\04�8*�\�\�k\�x{K\�\�T*���:\0\r#��\�\�8\�#\�IS\�\�\���a\��h\�\�=\���\�_\�\�\�t�\�\�\�\�\�P�aEG\�j\�<�\�SY�پ\�d)\0���\�\�g�3T�\'EmKkk\�\�b�\�ϳ\0@�{\��{å�^����i�g�n-.*{\�\r=�І��x\0\�\�\�\�=qQ��a��\�Rخ�,\0Э\�\��ڮ\�\�\�\�\�q�>\�\0\�Z�\�\�$l\��N:餽9�\�$l\��\�:묽v\�v\�ҥ\���\�;v캽u6�)S�:�n\��\�[��\�g;f̘%\�g@�7x�\���Wv��\�\Z\� @�\�Ǝ\�y�\�ٱ�lod\0\Z\�\�ѣ��\�;4l��\�\�U\0h����z꩛.\\\�!A�\�#�,�Y�\�\�\�P\�8\�1q�+V\�\Z�k֬\�X.�ק��\�\04��~饗\�y�Ԧ�3��\�T��\'+�\��\'\���F�\Z�r��6��U��\����/������^��nKǃ\r��^q�\0��\�\�\��\�i���i��{|2T���c3Z\0\�B�\�Էo\�\rcǎ}?BwW��\�Ν�,�W\�:v2\0lK\�FӬ�֘��x≛&L��fƌ�,Y�1�G\�v�������޻<�`���\"d\�}���`��lImjj�R\0��\�\�մuqL6�ٱ���\0�~��7n_�\0�\�\�,\0r\�>}��\0�c\�zK\0\��---�\0�_\�n\�ի\�GU\0r\�\�>�\0�cض��|B%\0 ��\�X,U	\0\�1l���S	\0\�I�T\��կ~�\�*\0�\�l7���*\0��\�gU\0rR,\�\�۷\�*\0�\�l\�/\nG�\0\��\�S\�~A%\0 ��]W,�Q	\0\�1l\�\��T\0�\��\n�\��*\0��\�\�4�\�\0�_خ)�}T\0r\�R�\0��4�]����J\0@~3\�U)lOV	\0\�/lW�\�m?�\0���Y\�\�NS	\0\�of�n\nہ*\09)�o���\0��4�}�P(U	\0\�I�վ�\�p�\0��\�vyj#U\0�\�e��V	\0\�I�X\\Z.�Ǫ\0\�7�]�w�J\0@~a�zj�\0\���S��J\0@N�\�\�\�r�b�\0���J�W\n�\�%*\09ijjZ�f���\0\��/�6Q%\0 \'iV�B�\\�B%\0 \'�R\����T\0�\�g�µ*\09ijjz&�T\0�ۧR��J\0@N�\�\�\�R�t�J\0@~a�D�\\��J\0@N������U%\0 ����\�OT\0�\�y�ݩ\0��b�8�T*ݥ\0����\n���\0䤩�ivj?W	\0\�/lg�v�J\0@~a;3��*\09)�J3�\�\�4�\0��f��6]%\0 ���\ZK\�*\0��\�q��J\0@N�\�\�\�x��J\0@NJ�\�=)pV	\0\�/l\�-U\0r!���\0\�P(ܞf��P	\0\�I\n\�\�\��*\09)�\�?*�O�\0\�$\�joNa�P%\0 ���1�\'U\0�\�R{F%\0 \'�B\�\�R���J\0@NR\�^�f�ϫ\0\�X,^�\��W*\09IA;1�U\0�\�^�\�v�J\0@NJ�ҥ)l_V	\0\�of;!�\�+*\09IA�\�\��\0\�����J\0@N\�\��y\�bq�J\0@~3\�q���\0�_؎Nm�J\0@N\n�¹�Ri�J\0@~a;\"\�l\�T	\0\�/l���\�[*\09I�\��\�b�m�\0��\�vPj\�\0\�P(�^*�\�U	\0\�I�X\�f�+U\0r�f�\'��]�\0���-\�\0�\r\�rj�U\0rR,���]�\0��r�\�+�\�Z�\0��\���4�}O%\0 \'iV�\�Ԅ-\0\�%\�j�Ia�N%\0 \'�{�>�T*�W	\0\�I\n\�M3[a\0y\�۷\�\�b�}�\0���Y\�gS۠\0��>}�!l G\�r���U\0\�$v�J-\�A{E�\0`7�J�w��B\�+*\0�\�n�\0\�b�8a[a\�\�\�\\T!\0�\�\�v\�V\�v�\�\0@�\�v��a[*��\0\�7p߭	\�7U\0\�,\�d�\�\�j��\0\�8�U	\0\�/lG\n[\0��,\��{\�^�={vv���g�\�w��m\�ԩك>�)�+�*}\\6�\�̙3��K�f\�֭\���-[�,�>}��4(Mг�q}h��\rB��\�,`����\�\�@�XV3�ԷŒ����\�\�@���1x��qM�N0�z\��\�9\�g�~�\�\�\�q��\�@��\�\�@��o/\�~9eL�\���7kq_|\�\�c \�\��q`�W\���A�����n���H\�ǁ=��z\�[\��\�s�>��{8��q\��\�s�>��\"�>��\�\�й�83s[Q|\�\�c \�\��q`�\�fM\�\�@�3���q}\�Á\�\�ŏg��w\��\�\�}�9���H\�ǁ=���8���\�>��H\�ǁzDｗ=�\�\\^K�\�\�>\"}\\�` �\�s��u�6�g\�\�\�c \�\��q`w��j��\�eOL�\�A��\�c\�f\0\"}\\vr \�\�+}3\0�>��\�Y��\�μ\�\�\��@d \�\��q`\�\�Bm\�@d \�\��q`�f \�\�5}D\"�q}D�mkjjjI\�5�O�` \�\�<UCvIjY4�O�` \�\�4m�\�V�` \�\�4�\�~�\\�e\�\n[}|k\�.�a��a\�)��\�d�m\���\�^x![�z�V?�\�\�f\�\�\�]&p�-셁\�\��\�\�\�\�m�\��\���{\�w�\��\�\��N�я~4�\�w��[�\�\���\�����\�;C\�j��\�>\�9r\�\�\��<���菲\�O?��z\�5\�d�R)[�hQ\�\��\��\�\�y睻�;\��=\�ϻ�\�+\�W\�B\r\��c�0aBv\�1\�T��\r\ZT�x\�ԩ\���)S�T�\�/9��⋳o|\�ٟ���W\�{��\�w��x�駳ѣGgs\�\�\����4Я4�m\�>>s\�\�\�\�\�\�\"\���/U>�\�O~\���U�Ve��zj�O|��\�\�,l\�\�\���k�z\�\���\�Y\�B_b;vl\�zƌ�\�\�-�d��O��\���\�\�>��l�\�ٛ�\�^\��\�3\�8�r_R��\�g��}�\�\�����86lX�f͚\���|v\�QG�\��\�dGqD6mڴ\�/�\�/�\�n�m�_�\���\�\�\�\'�\\���\�\�+��\�/~QY\�G\�\�p�\�\�\�\���\�\�\�\���\�\�f͚�-^�8��\�++�O�<�\�\���o����-{\�\�\�\��\���\�+}�_�\�_*3\���7\�|s\�\���\�W�)�\�&M���\�\��m�����\�1W��p�\�W�\���]~�\�\��\�@̾�\�v\�a\�9\�S	�ho��F{\��\�\��Me0�\0�\�\��\�\�\�C�,{ŀ��cYm!|\�\�f_��\�+��\��\�O�/\�\�s\�=\�\�f\��ږ��\����+����뿮\�\�%�Tf�!�\�@T�\�+l��\�\��\�/�/;�ٟ�Y\�E^���\�\�}��/\�b�\����Yyx\�!�d��Z�����\�E�Gߍ\�\�M�v���\�o��\�\�C��l�<�8���s\�=�r_\�r\���\�ۗ\�jö-�b��|����g\�7t\�\����\�Z�ļ\�>�d\�F�\ZU����\r.\��\���\�\���������\��g�\�@X�TvbS��\�\�����cE\�G?�Qַo\�J\�\�\�<�\�\�\�cf��C��o�ە\��X\�\�|�=lc6�\�o��*�������j�,#C7�\�䐶Yh||\�E��\�\��J?��x\�ĉ�Ǟt\�I��O9\�\�1�hmK`�\n=�X&;�\�#+�\�.\��\�w\�y��\�\'b\�l$\�<0��\���ʉ+\"}��}<�\�\���\�gs\�̩|\�\�7߬�\�?�\�?T\��3��\�Vö���\�?\�N�\�m|\�\�ӧ��m\��\��\�*ǂ\�\�m/,�y\�a�4���\�qW�\�\'>QY\�}\�W>p\�6�8k3\�0�ݶ�6bĈ\�n\�>���eW]uU\�mKp\�\�L\�-\�v{_{\�	\'�/\�=�\�#\�\�\'�����z����\�g��[��}\�S��fֈ\�\�\�x \�ի\�6Ϡ�3�c\�\'Vaby8^\\�]�v�a\'n/l\�$��՝y�\�\�\�\�\���W�qbF|.f�w\�}�fo��=A*^\�\�}\�{leڻw\�\��x��\�GW�E�-\�Ųo4m�վ\�a{_۶��\�X6�P\��\�\�{ \rD��\���Y\�?�\�\�\�/~\�_��\�\�\�o\�\�ە��F�F��x||��ڰ=蠃>���\\��}�\�L�8YP�.<\�\������\�n}mg\�q܎�Z�>^\�>g\"�\\�r�3\�ؘy\��q\��y\�W9�7^\\\�\�\�/&w�oP�.2\�7}�7-f�1;��\���K�,��{̘1�8�4�>�W{饗*g\�\�` \�D�xN-��\�\�y}D��Hϡ\�[\�n��\�\�1\�+V\�\�` \�D�x=[��,6����\�IT�8�4�>^���\�/g\\pAv\�Yge�=��>\"\�@��׫\�2�M7\�T�\�\�O�Ӻ��G��E��\�\����\�.�,[�t�>\"\�@��׫\�%\��}\�O<����H3\�\��j��Yl�KƱ}b\�m����H3\�\�uں���\�\�N;\�ʅ:z\�P}Dn\�\�\�\"\0�\�b\\ �b\�\�ak \�\�\�\�\�Z�qǘ\�\�ό٭>[�>^�%\�r��k+�]\�Q���H�C[�pav\�9\�d\�ƍ\�~��_\�\��\�\�I\�@��\�Z[�lY6q\�\�l�����>|�̙37v\�7\�w��ꫯ.J\�:=�{��\�\�\�\�\�\���\�}��\�\�\�}�]}رiӦ]0}��Mo�񆰬\� 4u\�\��S��gu�>>��lذa\��\�_���>\��3>�R]KC��ť\�:�\�Wm\�Bݯ�\�y\�٨Q��~��UN�\��Pv]�>}>\�\�\�\�\�\�H�nJjS��>>XU�\�>\�	[:L\�ocR[�\�\�B\�(\Z!l�t�\�\�\�֥6ZE��ѫW����o�J�\��R�4#���\�\�\�XMQ���r\�)��Pؒ��\�L\��\���=BE��\�\�\��IaK�\�c\�lvy\nٵ\�v��\0\r�����X\�S	\�!\�GR{$���B\���={\�*@\�+�ˇ[\�!����mH\�x�\"\0� ?�J�}�wj\��\�թ�S�-�J�\�\�	,*����\�R\�YPݘ\�\�q\�\�\�*\0[Q(���`�\�gn�\�\���i6�WJ�i�<&6P	v�\�\�I���JA�\"���\0\�4p~9��T��(;4��\��~���[U\�I\�r�W�R%ؚ�PE\n\�[c\�8��\'�x\�\�T`577����F%\�Rz6(�5��U(�W�ݔf+}\�-*A�x\�u\�/\�Y\�)d/Q�=ۓ\��������pw��<��?���\n@�A�\�4�]�\r\�FV/}�F\�޽�V���q\\\��hL}��=2=��\�\�\�E\�x\�A\\�%��U���������\�S��z\�q\��*\0�\�l����J4�r�|^u&�jj�S��\n�s㺣*\��ű\��Kc����P���َIm�Jt_---��\�\�,\��\�\�8\�XU\0:P,)�\�\��\�R�^Z\�b�x���\0\���\�4��\�\�E\�	\�}+v�J�U`\�\�ǉ2*\�=\�\�\�)`\�U7��%�6V��?��eƗU�\�\�\'�\�S\r٧\�*=J\�I����\�^R�.��)�H\�\�\�\�ZT��I3�+\�\0�+�\�\�\�_���z��\�z�\�,@��\�^�\�s*\�u�7n\��7Œq\n\����r\�!�й\���ԞQ�.�|��\�\�\�Ϻ\\.�R��1xߘړ*ѹ�\�\���|�g6���@\�\Z\��\�_�D\�Գg\��J�\�q\\6=W�ۏ�\n@�\�\�⸟Jt>�Bahznދ����\�s��\0tݰ�#\r菩D\�\�\�\������E���\�7U�\�\�])l\�\�ޗf��p�Rݘbz��`U\�a{OT���z�����^(�R�\�5\�\�L\�!�\�;\"X#`S[�\�h\�a{j�DǊ%\�R�4��1\�\�XBV�\��\�S{@%:�\�߬���(�\�*\�����MU��\�o\�I�^�n��@\�\�Cq\�V%�Q��HlLQ(n��*T��Tw%�G%r{13��\�\�s\�\�͇�@cκ\�\�\�OU�\�!\�;.�^̬N���\04v\��\"�6U�>\�rw)dT7��1.��*\0f`\�\�\�V�\�c�\�\�\n\�l\\\�!.\�$\0��m\�Ub�\n��RW��]�ZIE\0\�2l��\�N�\�u\�Eʡ�=\'@�\�I1�U\0��Ϥ\�\�u*����\��Xz�%\�8�\�\�O���\0���}>\�\�*�\��\Z�ښ\�\�*\nǫ\0;�fh/�\�\�+Tb�R�O/J^�mS\�^�\"\0\�\�L\�\�.W��\�߿���>wW\�\�3\��\����\0��a�r��]�[�\�\�\�\�\�\�ݻ�\�*�\�\�\�b�x�J�F߾}���\�\�\�Smƫ\0{\Z�q\��T�G�\�\�փ\���)`7ŕ��;\�U�z�\���\�	P\�Ug����9=�z�\�\�\�\�4\��?�Ŧp�\Z�W(F\�\0\�]\\\�<�̹���nii��\�|cc��\�c���f�o��\�`/0.�n�\�1>\\/\0 W)p\�N�3���)XOHA�V\�\0�nz�訙\�\�=xb\�\����Wݘ\�\�\�\�3@G\�lW�\0:��������TC���J�g��1��밞\�\��_�_�+Sk�L�7\�vuj\�n4S��\�V/�t�Y\0�zخI\�ԧ��?ƍ�o\nכb\�8�\�r\�)�xv\�,a��P(|���N�\�\�\�)�˽<�\0t��z/�/w\�\�=\�`?�~�\�\�=�.@g\�u)��\�J�sϞ=�+�Jw\�q\���?�n?\��3�\��V�\�U~\�B�04\�{�\�d�>}��\�قuQj\�VZ,þ_m\�ƥ\�:\�\�\�\�\���\�\��\�7=�\0tJ\�r�K\�\���f��v�\�9\�^H�ה\�\�\�\�\�{&\�\�\�\��q�3\�j\�\��\��/\nGy�\0\��\�\�2��`�����R\�Y�ˉK\�m\�\�ޞ\�\�q�]ϨnL19��=[\0tI��\�V\�����;\�IOՓ���=³@��B�\�\�\��\�ս4�=6\�\�;Y�\�!�\0����jN�:��~lD�\�#qRV�i߾�\�\0�\�.��=��\�?\��?wb���\�577\�\0�;�mK�^���bN��\�q��X����g\0�F0\"�,��y���\�]\n\�Ս)n\�p�\���R{�z�G\�\�\���8.�nvWv\0\Z-h\�vt��P(��vU\n\�����F\�ݿK\�\��\�Ԟ��\��\�*9\0����\�\�-��\��\�\�1��S�{\�\'~L��[�\�K\�i;(�5��U(�Wj\0\�E\�n\�\��\\.�f�/\�6�)d/Qf\0\�\�ƭ}]����O{w��<�:zS\0\�A�\�׷\�pS���^�\�޽{�\�\0\�\�m�|u���\�\�*\�p?��_�vq\\̽X,�W^\0\�����\�-\�\�\�V�����;\��/~�:\�\�T^\0\�����h����\rڶ6�\��=�\�i\n\0�t\�n+HkwG�oS���\0�;\�wߝ\�ڟ�Q\� hw>p\�\�B\�n���\0A�s��+A\�ƒ2\0\r\�jH.\�ů\�w+3\�u\��w\�\�\�\�\�\0�f�;��[\�텞\0\Z)p;\�m\�\�ɖ��;\�\�=y�.\�\0\�%p�v�p�\�g\�\�\�Y\�\0\�~,�6�x��\�%�:\�,h`�3\�\���\�c\��S�8\��\�p�\����sO/<\0\r7\�ݕ\��\0��3ܝYRn\�\�d(\0\�m�\�v�W\�@����\�\0{��k�\�\�P\0Pgm3\�\�=\\�\0�\�655e�\0rT\r[\0@\���\0�-\0[\0�\0��\0a\0\�\0�\0 l\0a\0\�\0�-\0 l@\���\0�-\0[\0�\0��\0a\0[\0�\0 l\0a\0\�\0�-\0 l@\�\0\�\0�-\0[\0@\���\0a\0[\0�\0 l\0a\0\�\0�\0 l@\�\0\�\0�-\0[\0@\���\0�-\0[\0�\0��\0a\0\�\0�\0 l@\�\0\�\0�-\0 l@\���\0�-\0[\0�\0��\0a\0[\0�\0 l\0a\0\�\0�-\0 l@\���\0�-\0[\0@\���\0a\0[\0�\0 l\0a\0\�\0�\0 l@\�\0\�\0�-\0[\0@\���\0a\0[\0�\0��\0a\0\�\0�\0 l@\�\0\�\0�-\0 l@\���\0�-\0[\0�\0��\0a\0\�\0�\0 l\0a\0\�\0�-\0 l@\���\0�-\0[\0@\���\0a\0[\0�\0 l\0a\0\�\0�-\0 l@\�\0\�\0r\�%�;h�T\n\0v?l[v�\�bq�J��\�\�\�ʞ={\�J\0�\�\�T*]�B\0P��\�ڱ\�Uf�\0�\�\�ֱZ\0�\�fV\09J3\�~5a;ZE\0 �\�m\�حY-\0\�Aj\�`S�Y}�Ϻ-�\�nH\�\�\�f�\�\�+Z[[R5\0\�	_�\�W?�tz\n\��;�{T\�ۀ6�Ņ\���\0ۘɦ���B6ە�\�F�m�\05z�\�}t���\�24�M�4){�ᇳŋgk׮\�B\�.]�4�7o^��\�}/2d\�ֶq\\S(���\04�8˸��ycmP�}�ٕ ݰaC��\�ϟ��\Z5j\�\�\�\���\04|\�\�.�\�\�\��\�]\n\�-M�<9kmm�\0\�\�q\n\�M�K\�\�>�lV/��Rv\�gn6õ�@C���j�\�F\�\�1\�z�\�W�q\�IS\04�8\�v\�^3ڭ\�p�XR~T�\��\�}��\�i\�m�\�n\��\�X��,\0Эņ�g�_�>\�\�ȑ#k��z\0\�\�Xm\�\�P������\�o�\�Tj�l\0\�-\�[pjO�ړ��\�ڍ/b/e\�\0\�R�����\�k��t\�M7m���g�\�\Z�\�\�/�`\�H�d]����g�n)�\\��\�\�_�C\�6\�w[{y>\�\0\�uf\�xm\�(��j�g�n�{���\�\�\�\0��c�\0��\�\�\�\�\0�s\�z�-\0\�)\�(/\�[;H}\�k_��\0\�_\�\�K\�\09�k\�\�^��#f��F�r\�\0\ZG\\\�6�\�&׳�|g�\�\'J577g\�>�l.A�\�K/e\'�tRm\�>��\04�\�\�փ�\�\�ړ�\�}��~_\�g�Q�|�&~�\�\�0\n�\�Wj��#p\�5Ímm\�\�ω��\�\04b\���\r\�XR�c�{r\�T�\�b\�8f�\�U\0�[�q�����w�\�=cƌ\�,d\��\nZ\0�u\�~��n\�\�r\�45gΜ\�^\�m/�\�8&�;C\�nXQ{�\�\�1\0Ԉ��j\�R\�\�����\0`\�}�iV�X\�NS;\�bg�ذ�\\.I`\'\�֎ս�c�����|5\�.����m�\0\0\0\0\0\0\0\0\0\0\0\0\0\0@g���<��KG��\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10006','Entrust:4:7508','10001','10005','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-03 10:57:11.575','2019-06-03 10:57:11.585',10,NULL,''),('10007','Entrust:4:7508','10001','10005','submitEntrust','10008',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:57:11.595',NULL,NULL,NULL,''),('12506','Entrust:4:7508','12501','12505','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-03 10:58:39.272','2019-06-03 10:58:39.276',4,NULL,''),('12507','Entrust:4:7508','12501','12505','submitEntrust','12508',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:58:39.279',NULL,NULL,NULL,''),('17506','Entrust:5:15006','17501','17505','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:15.331','2019-06-04 11:50:15.333',2,NULL,''),('17507','Entrust:5:15006','17501','17505','submitEntrust','17508',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:15.335',NULL,NULL,NULL,''),('17515','Entrust:5:15006','17510','17514','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.844',1,NULL,''),('17516','Entrust:5:15006','17510','17514','submitEntrust','17517',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:16.844',NULL,NULL,NULL,''),('17524','Entrust:5:15006','17519','17523','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257',0,NULL,''),('17525','Entrust:5:15006','17519','17523','submitEntrust','17526',NULL,'ToSubmit','userTask','u20190604195011','2019-06-04 11:50:18.258',NULL,NULL,NULL,''),('17533','Entrust:5:15006','17528','17532','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.366',1,NULL,''),('17534','Entrust:5:15006','17528','17532','submitEntrust','17535',NULL,'ToSubmit','userTask','u20190604195013','2019-06-04 11:50:19.366',NULL,NULL,NULL,''),('17542','Entrust:5:15006','17537','17541','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:21.269','2019-06-04 11:50:21.269',0,NULL,''),('17543','Entrust:5:15006','17537','17541','submitEntrust','17544',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:21.269',NULL,NULL,NULL,''),('17551','Entrust:5:15006','17546','17550','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:22.656','2019-06-04 11:50:22.656',0,NULL,''),('17552','Entrust:5:15006','17546','17550','submitEntrust','17553',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:22.656',NULL,NULL,NULL,''),('25006','Entrust:7:22506','25001','25005','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:29:40.828','2019-06-05 07:29:40.830',2,NULL,''),('25007','Entrust:7:22506','25001','25005','submitEntrust','25008',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:29:40.831',NULL,NULL,NULL,''),('25015','Entrust:7:22506','25010','25014','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:29:42.141','2019-06-05 07:29:42.141',0,NULL,''),('25016','Entrust:7:22506','25010','25014','submitEntrust','25017',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:29:42.141',NULL,NULL,NULL,''),('25024','Entrust:7:22506','25019','25023','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:29:43.450','2019-06-05 07:29:43.451',1,NULL,''),('25025','Entrust:7:22506','25019','25023','submitEntrust','25026',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:29:43.451',NULL,NULL,NULL,''),('25033','Entrust:7:22506','25028','25032','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:29:44.651','2019-06-05 07:29:44.651',0,NULL,''),('25034','Entrust:7:22506','25028','25032','submitEntrust','25035',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:29:44.651',NULL,NULL,NULL,''),('25042','Entrust:7:22506','25037','25041','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:29:45.838','2019-06-05 07:29:45.839',1,NULL,''),('25043','Entrust:7:22506','25037','25041','submitEntrust','25044',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:29:45.839',NULL,NULL,NULL,''),('25051','Entrust:7:22506','25046','25050','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:29:47.369','2019-06-05 07:29:47.369',0,NULL,''),('25052','Entrust:7:22506','25046','25050','submitEntrust','25053',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:29:47.369',NULL,NULL,NULL,''),('27506','Entrust:7:22506','27501','27505','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:50:33.057','2019-06-05 07:50:33.058',1,NULL,''),('27507','Entrust:7:22506','27501','27505','submitEntrust','27508',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:50:33.060',NULL,NULL,NULL,''),('27515','Entrust:7:22506','27510','27514','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:50:34.347','2019-06-05 07:50:34.347',0,NULL,''),('27516','Entrust:7:22506','27510','27514','submitEntrust','27517',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:50:34.347',NULL,NULL,NULL,''),('27524','Entrust:7:22506','27519','27523','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:50:35.673','2019-06-05 07:50:35.674',1,NULL,''),('27525','Entrust:7:22506','27519','27523','submitEntrust','27526',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:50:35.674',NULL,NULL,NULL,''),('27533','Entrust:7:22506','27528','27532','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:50:36.859','2019-06-05 07:50:36.859',0,NULL,''),('27534','Entrust:7:22506','27528','27532','submitEntrust','27535',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:50:36.859',NULL,NULL,NULL,''),('27542','Entrust:7:22506','27537','27541','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:50:38.811','2019-06-05 07:50:38.811',0,NULL,''),('27543','Entrust:7:22506','27537','27541','submitEntrust','27544',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:50:38.812',NULL,NULL,NULL,''),('27551','Entrust:7:22506','27546','27550','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:50:40.003','2019-06-05 07:50:40.003',0,NULL,''),('27552','Entrust:7:22506','27546','27550','submitEntrust','27553',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:50:40.003',NULL,NULL,NULL,''),('30006','Entrust:7:22506','30001','30005','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:56:51.901','2019-06-05 07:56:51.903',2,NULL,''),('30007','Entrust:7:22506','30001','30005','submitEntrust','30008',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:56:51.904',NULL,NULL,NULL,''),('30015','Entrust:7:22506','30010','30014','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:56:53.445','2019-06-05 07:56:53.445',0,NULL,''),('30016','Entrust:7:22506','30010','30014','submitEntrust','30017',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:56:53.445',NULL,NULL,NULL,''),('30024','Entrust:7:22506','30019','30023','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:56:54.804','2019-06-05 07:56:54.804',0,NULL,''),('30025','Entrust:7:22506','30019','30023','submitEntrust','30026',NULL,'ToSubmit','userTask','u20190605134344','2019-06-05 07:56:54.804',NULL,NULL,NULL,''),('30033','Entrust:7:22506','30028','30032','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:56:56.003','2019-06-05 07:56:56.003',0,NULL,''),('30034','Entrust:7:22506','30028','30032','submitEntrust','30035',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:56:56.003',NULL,NULL,NULL,''),('30042','Entrust:7:22506','30037','30041','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:56:57.731','2019-06-05 07:56:57.731',0,NULL,''),('30043','Entrust:7:22506','30037','30041','submitEntrust','30044',NULL,'ToSubmit','userTask','u20190605134759','2019-06-05 07:56:57.732',NULL,NULL,NULL,''),('30051','Entrust:7:22506','30046','30050','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-05 07:56:58.915','2019-06-05 07:56:58.915',0,NULL,''),('30052','Entrust:7:22506','30046','30050','submitEntrust','30053',NULL,'ToSubmit','userTask','u20190605134754','2019-06-05 07:56:58.916',NULL,NULL,NULL,''),('70015','Entrust:18:70010','70011','70014','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-02 07:36:24.411','2019-07-02 07:36:24.414',3,NULL,''),('70016','Entrust:18:70010','70011','70014','reviewEntrust','70017',NULL,'ToReview','userTask',NULL,'2019-07-02 07:36:24.417',NULL,NULL,NULL,''),('70023','Entrust:18:70010','70019','70022','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-02 07:36:33.123','2019-07-02 07:36:33.123',0,NULL,''),('70024','Entrust:18:70010','70019','70022','reviewEntrust','70025',NULL,'ToReview','userTask',NULL,'2019-07-02 07:36:33.123',NULL,NULL,NULL,''),('70031','Entrust:18:70010','70027','70030','start',NULL,NULL,'开始','startEvent',NULL,'2019-07-02 07:36:40.897','2019-07-02 07:36:40.897',0,NULL,''),('70032','Entrust:18:70010','70027','70030','reviewEntrust','70033',NULL,'ToReview','userTask',NULL,'2019-07-02 07:36:40.897',NULL,NULL,NULL,'');
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
INSERT INTO `act_id_group` VALUES ('Customers',1,'客户组',NULL),('Staff',1,'工作人员组',NULL);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('15001','SpringAutoDeployment',NULL,NULL,'','2019-06-04 11:49:32.248',NULL),('20001','SpringAutoDeployment',NULL,NULL,'','2019-06-05 05:41:31.246',NULL),('22501','SpringAutoDeployment',NULL,NULL,'','2019-06-05 07:24:19.689',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('32501','SpringAutoDeployment',NULL,NULL,'','2019-06-06 09:13:05.403',NULL),('35001','SpringAutoDeployment',NULL,NULL,'','2019-06-11 10:27:19.951',NULL),('37501','EntrustProcess测试',NULL,NULL,'','2019-06-16 06:57:21.527',NULL),('42501','EntrustProcess测试',NULL,NULL,'','2019-06-16 07:02:58.463',NULL),('50001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 07:31:13.625',NULL),('5001','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('52501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 07:53:59.662',NULL),('55001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:10:11.456',NULL),('57501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:29:30.127',NULL),('60001','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:30:15.072',NULL),('62501','SpringAutoDeployment',NULL,NULL,'','2019-06-16 08:38:10.254',NULL),('65001','SpringAutoDeployment',NULL,NULL,'','2019-06-29 11:55:04.995',NULL),('67501','SpringAutoDeployment',NULL,NULL,'','2019-07-01 09:31:55.119',NULL),('70001','SpringAutoDeployment',NULL,NULL,'','2019-07-02 07:35:10.298',NULL),('7501','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:65006',1,'http://www.activiti.org/test',NULL,'Contract',1,'65001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:2:67509',1,'http://www.activiti.org/test','合同','Contract',2,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Contract.Contract.png',NULL,0,1,1,'',NULL),('Contract:3:70009',1,'http://www.activiti.org/test','合同','Contract',3,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.bpmn20.xml','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:10:50004',1,'http://www.activiti.org/test','委托','Entrust',10,'50001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:11:52507',1,'http://www.activiti.org/test','委托','Entrust',11,'52501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:12:55006',1,'http://www.activiti.org/test','委托','Entrust',12,'55001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:13:57507',1,'http://www.activiti.org/test','委托','Entrust',13,'57501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:14:60006',1,'http://www.activiti.org/test','委托','Entrust',14,'60001','Entrust.bpmn20.xml','Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:15:62507',1,'http://www.activiti.org/test','委托','Entrust',15,'62501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:16:65007',1,'http://www.activiti.org/test','委托','Entrust',16,'65001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:17:67510',1,'http://www.activiti.org/test','委托','Entrust',17,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:18:70010',1,'http://www.activiti.org/test','委托','Entrust',18,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/Users/appke/Documents/SE/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:1:2506',1,'http://www.activiti.org/test','委托','Entrust',1,'2501','/home/czf/桌面/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/桌面/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','委托','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','委托','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','委托','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:5:15006',1,'http://www.activiti.org/test','委托','Entrust',5,'15001','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:6:20007',1,'http://www.activiti.org/test','委托','Entrust',6,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:7:22506',1,'http://www.activiti.org/test','委托','Entrust',7,'22501','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:8:32506',1,'http://www.activiti.org/test','委托','Entrust',8,'32501','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:9:35007',1,'http://www.activiti.org/test','委托','Entrust',9,'35001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:10:52506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',10,'52501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:11:55007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',11,'55001','EntrustProcess.bpmn','EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:12:57506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',12,'57501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:13:60007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',13,'60001','EntrustProcess.bpmn','EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:14:62506',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',14,'62501','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:3:15007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',3,'15001','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:4:20006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',4,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:5:22507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',5,'22501','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:6:32507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',6,'32501','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:7:35006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',7,'35001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:8:37504',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',8,'37501','processes/EntrustProcess.bpmn','processes/EntrustProcess.png',NULL,0,1,1,'',NULL),('entrust_process:9:42504',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',9,'42501','processes/EntrustProcess.bpmn','processes/EntrustProcess.png',NULL,0,1,1,'',NULL),('myProcess_1:1:67508',1,'http://www.activiti.org/test',NULL,'myProcess_1',1,'67501','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL),('myProcess_1:2:70008',1,'http://www.activiti.org/test',NULL,'myProcess_1',2,'70001','/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.bpmn','/Users/appke/Documents/SE/stconline/server/target/classes/processes/TestPlan.myProcess_1.png',NULL,0,1,1,'',NULL);
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
INSERT INTO `tbl_sys_entrust` VALUES (1,'70011',1,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无',' ','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171309','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','basic-form.radio.domestic','认真搬砖的一群小朋友','1.0.2','无',5,''),(2,'70019',1,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无',' ','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171310','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','basic-form.radio.domestic','认真搬砖的一群小朋友','1.0.2','无',5,''),(3,'70027',1,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无',' ','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171311','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','basic-form.radio.domestic','认真搬砖的一群小朋友','1.0.2','无',5,''),(4,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171312','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无',6,NULL),(5,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171313','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无',7,NULL),(6,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171314','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无',6,NULL);
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
