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
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('10002',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','10001','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('10003',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png','10001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('10006',1,'processes/Consign.bpmn20.xml','10005','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('10007',1,'processes/Consign.Consign.png','10005','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('12502',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','12501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('12503',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png','12501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('12506',1,'processes/Consign.bpmn20.xml','12505','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('12507',1,'processes/Consign.Consign.png','12505','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('2',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','1','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\n    <startEvent id=\"start\">\n      <extensionElements>\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\n      <extensionElements>\n       <!-- <activiti:taskListener event=\"create\"\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"gate1\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\n      </extensionElements>\n    </exclusiveGateway>\n    <endEvent id=\"end\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\n      </extensionElements>\n    </endEvent>\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\n      </extensionElements>\n    </sequenceFlow>\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\n      </extensionElements>\n    </sequenceFlow>\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\n      </extensionElements>\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\n      </extensionElements>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\n      <extensionElements>\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\n      </extensionElements>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2502',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','2501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('2503',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('3',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('5002',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','5001','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('5003',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('5006',1,'processes/Consign.bpmn20.xml','5005','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('5007',1,'processes/Consign.Consign.png','5005','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1),('7502',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','7501','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.activiti.org/processdef\" xmlns:modeler=\"http://activiti.com/modeler\"\r\n             modeler:version=\"1.0en\" modeler:exportDateTime=\"20180505135041889\" modeler:modelId=\"1001\"\r\n             modeler:modelVersion=\"1\" modeler:modelLastUpdated=\"1525499432839\">\r\n  <process id=\"Consign\" name=\"consign\" isExecutable=\"true\">\r\n    <startEvent id=\"start\">\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"ConsignID\" name=\"the ID of the trust\" type=\"String\" required=\"true\"/>\r\n      </extensionElements>\r\n    </startEvent>\r\n    <userTask id=\"submitconsign\" name=\"TobeSubmit\" activiti:assignee=\"${ClientID}\" >\r\n      <extensionElements>\r\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-AB045AD0-DCD5-45B2-ACD1-948752FB8A4E]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"reviewconsign\" name=\"TobeReview\" activiti:candidateGroups=\"${WorkerIDs}\">\r\n      <extensionElements>\r\n       <!-- <activiti:taskListener event=\"create\"\r\n                               class=\"com.njustctiviti.TaskListenerlmpl\"></activiti:taskListener>-->\r\n        <activiti:formProperty id=\"reviewconsignapproval\" name=\"Do you approve this request?\" type=\"enum\" required=\"true\"/>\r\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\r\n        <activiti:formProperty id=\"reviewconsigncomments\" name=\"reason about pass or reject the consign\" type=\"string\" required=\"true\"/>\r\n        <modeler:allow-send-email><![CDATA[true]]></modeler:allow-send-email>\r\n        <modeler:initiator-can-complete><![CDATA[false]]></modeler:initiator-can-complete>\r\n        <modeler:editor-resource-id><![CDATA[sid-BF1DA17F-62CD-42D0-8FB2-7C1AF61A3050]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-8E96F0AD-7B07-4123-A160-6D2E8F6F790D]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </exclusiveGateway>\r\n    <endEvent id=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-54A1159E-A89D-48E2-9387-F2D7C89BCD40]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </endEvent>\r\n    <sequenceFlow id=\"f1\" sourceRef=\"start\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-DF3EC220-C74A-4280-91B6-DDB4BF1B0CED]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f2\" sourceRef=\"submitconsign\" targetRef=\"reviewconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-747CB676-4CC8-413C-B4A7-25FCE3B87866]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f4\" name=\"通过\" sourceRef=\"gate1\" targetRef=\"end\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-D43AE9A4-86AA-4C13-B9CF-8FAF5660FEC5]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n     <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewPass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f5\" name=\"不通过\" sourceRef=\"gate1\" targetRef=\"submitconsign\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-4791BF60-AD89-40AA-820E-EECED7315C5F]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewconsignapproval == \'ReviewReject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"f3\" sourceRef=\"reviewconsign\" targetRef=\"gate1\">\r\n      <extensionElements>\r\n        <modeler:editor-resource-id><![CDATA[sid-0C82B910-196A-4377-81F7-92075C5E6DFE]]></modeler:editor-resource-id>\r\n      </extensionElements>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_entrust\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Consign\" id=\"BPMNPlane_entrust\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"submitconsign\" id=\"BPMNShape_submitentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"reviewconsign\" id=\"BPMNShape_checkentrust\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"gate1\" id=\"BPMNShape_gate1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"465.0\" y=\"158.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"550.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f1\" id=\"BPMNEdge_f1\">\r\n        <omgdi:waypoint x=\"130.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"175.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f2\" id=\"BPMNEdge_f2\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"178.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f3\" id=\"BPMNEdge_f3\">\r\n        <omgdi:waypoint x=\"420.0\" y=\"178.2164502164502\"/>\r\n        <omgdi:waypoint x=\"465.4130434782609\" y=\"178.41304347826087\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f4\" id=\"BPMNEdge_f4\">\r\n        <omgdi:waypoint x=\"504.62179487179486\" y=\"178.37820512820514\"/>\r\n        <omgdi:waypoint x=\"550.0002839785394\" y=\"178.0891701657418\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"f5\" id=\"BPMNEdge_f5\">\r\n        <omgdi:waypoint x=\"485.5\" y=\"158.5\"/>\r\n        <omgdi:waypoint x=\"485.5\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"75.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"138.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('7503',1,'F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png','7501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0L\0\0\0\�\0\0\0j�{i\0\0\nIDATx\�\�\�k�Te�\0`2�Qc�\�c�1\�?\�c���a�?\\�c�Ė�V\�E�\'f@\�Q��\�z\�(1\Zנ�D\�U1�\"��u +*W���(�\���t1��������N\��$_���NWS���o\�W\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�[o�51\�(Y�D\�\�U\0\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� %H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0@�\�\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0\0	�\0$H@>\0� �\0@�\�\0	�\0$H@>\0� �\0@�\�\0	R�\�\0	�\0�H��\"!�2�{�@\�\�\�ɰ������e�W\n4L\0͞w�i�~\Z>|�\�^%\�04{B,9\�4bĈ\�^!\�00�\�^��f�@\�\�U\0�GRl�w	\�0��w�]4L\0e����\�4Lӽ\"��	�\�\�\�e2�h�\0J\'\�6	\�05�$\�\�\�|�\�ֵk\�&˗/O�.]�\�	2�?��e˒?���0�CF3Ɛ�	�{Q\�V�^����\'4�h\�޽;Y�jUg��=!��f�!\rP�bV@�����t\�҃b\�h�\�0u/�P����\"��f�!\rP�\"�*2��C\Z&�(v���3�\�N�Z�p:\�����؉!1�a4L��\�\�\�\�\�%$_�w\�1#��)R\Z&1$�4L@\�7L[���\�\n]ql�j�\"�aCbH\�h��g\�c%�]ܧHi�Đ\�0M\�0m\\:�d���)\r�C\Z&@ä\�)vbHi�\0\rS�\�h*U\�\�>EJ\�$�Đ�	h��i�/Y\�\�>EJ\�$�Đ�	h��i\��\r\�ƿ<t�RJ\�kq�\"�aCbH\�4}\�c\�g�+v�5J�CbH\�h�b��k��\�\�_J)|-\�S�4LbHi���n�\�,̛\�<Sr�I\�\�L\�\Z&1$�4L@s6L���wn^���\�?�,t\���ǚ)\�0�!1�a��a\�mF�L�b\'�Đ�	h�����r3���I�!\r\��\rS_]q(Z\Z&1$��\����i�Դ\���C9��\�\�,�u]g\��b�؉!C\�t|�Tl�b��C\�(v��24L=7K�}@�S\�Đj*\�{i���\�\�}�$\�\�6l\��\�����>gΜλ\�;=zt�G�\Z�L�4)�6m\�\�\�{웹s\����\�P\�Đ�\�f��f\�LSF�yyKK\�\�\�\�#F*|\�\Z\�5Ǝ\�X��j5i��`���}\�G�ɓ\'\'/��B�\�\'�$۷oO~�\�$\�\����\��\�?O^}�\�\�{\�I�L�r��;\�xE\�d(vbHՅ?T9sT\�\�V�9�]h��>&��\�(<vokk\�s��&Qh��<k֬\��\�K��#G�$�Z�~}r���\'&L8x�\�7���\�P\�Đ\Z�fif�kʦ�\����0vW\�$��\Z�r��\�\�.\�;q\�\�dѢEU5J\�-^�8;vl\�(�M��b\'�\�P�4Ku|.���<\�\�ښ]rKF��̞=;Y�bE���\�\'?��cZ\�~��\�t\�e͚5ɼy󒶶�\�MS�٦m�V�\\����\�J6mڔ�o��6�\�kܸqoj�\r�C���\rރ�}�\�,\�\�.�E��\�k��[O*�w\�\���q\\�e�Wu\r$f��Y�40*\�o���\�;\�N���5K��\�3M1��m��N��\�&�E[Z�M���{�b&h�f�z�ijkk��\�:\r��a2\�P͗\�\�\�o\n\�O]�\����\�\�{��\�p=�\�\�e���\�G}���\�u\�\��R\�\�~�\�t\�R-�����#G��I\�dh�1T\�fif�\��[�����6M��kئ�\�0\�\�\�,��Y\�6M\�f��\�:r\�\�\�\����JjmҤIy��T\�;1$�r\�,\r\�!J2���)\�,\�=,�5\��\\ש�\�Y\�\�2\\�\�\�&Ks9�]��,ũ×_~�\�u�I�S\�Đ�S������rMS��o�=Mq��b3�k\�7\�0˔wq\�\�\�ݟ\�Tk̘1�^\\O�,��g�b�؉!1T\�1T�Y�\�\�&�\�\�\�\�*yM\�\�\�ō\�1�gϞ�Խx�\\���T�P\\\�䥗^JӼy�\�)\�\�藪\�{ZZZ\�)v��C�\ZC}lZzk��m��\�\�Q�3M���]�;I7w\�\�Z׾\�,\�\"H\�ĵ\�\�r\'�\�\�?�\�\�\�\�_�\�\�\�\�_%��b\'�\�\�P\�P?�\�J5E�\�c�\�\�r`.^Ӹ6\\��U�Vմ�\�\�-3?\�.H\�ątw\�\�9�\rӮ]�:\n�r�����U��\�R\�;1$��:��\�,�k���Y\�\�\�3\�iׅtӯ�f\�\�\�\���\�$gF�}�B��%�/&�TG�*�\�\\\�N�Cbh�ch\0ftzj��\�,U�<XW�i��@�J�\�)�ϧə�O\n���\�Ů��2�-�n��\�bc������=\�,\��z�\�\�\�eqv\�Ӂ\�\�\�\�>\�3L\�\�\�\����\��\�\�O��bv@��z��a��\��\�k\Zg\�6\�DE\��\�A\�ôcǎ�u���{�\Z��\'%�T\�\�U�|�~�ir\�UW%\'�tRr\�)�$W^ye��V\�W\��|��\�\�W_\�,Ůab(�\'�xbr�$˗/��\�0UC�0\r\�kj{\��\r��\�,Y\�^�\��)\��Z\"A\r\�\�@�E��E&�[�aÆdݺu\�\�\�{\�����uZ\�\Z.��\�}��\�\�\�^x��!��~\�\�4�\�J��\�%G\���\r�y�f̘\�^g\�a*��ܠ�8aڄ	ҙ����!\�۷\�Ǐ7.��\�K/M�Wܷ{�\�\�\�n;:�t\�M7%۶mK\�\�q\\�\�~�\�\�r\�W�\�\�.KgN;\��B�7\�pC�3�u\�Y\�\�r����W3�\�bװ1\�S�\��{�\�^���q�F�J��\�\�\�W\�y#�\�\��?���\�1O=�Tz;�]w\�C}�٩\�y�چ\��y�z}M����=�\���\�r�y�\�\�\�\�Cy<\�i��]��Z��\�z+�<\nC��.LG|^\\ފw:\�\�AZ�~}��5\�\\�\�	 n�z\�q�t������\�+޷`��d˖-Go\�ϼy�\���3\�8�\��ti�|\�P�y����\\rI\�\�v\�ؑ~~\�y祏;���\�\�[�n=\���{\�h�\�>�\���XJ����\���9眓\\��.�R\�O�\��=;\�/^�\�;{�Z�\�;��p�2eʡ���ܒ%K�\��::�.v\�Y�؄�83�}|O�u��\�\�#���0E\��EUi\�T\�g���\�0\�7��=f�֮]\�\�q_|qz{\�ʕ\�ǋ.�踟�\��ӦM;fV\��\�O?\�vq�I\�Tv��\�ג�\�/�k\�Q��c\��۽�\�;�L�����z�\�Z�\��Y��E�S�\�\�\�\�r\�Y�뾒Ƨ\��i��+��\��\���\�{\�^��͸/f��\rNO\rSO\�g\�b6)>\�ց\�\���\�k���i\�<��>,��\�4�PŌV\�\���\�,\�@o��\�߷�y��t)$�_-ZT\�n)�KEg]\�\Z}\��\��Dv9%�N���\�O�?\�\�\�^{mz_\�/��\�/]2�w\�\�}�97nǻ\�>�\���\���y\�\�\�7���榧\�\�k\�T�\�=5�5w\Z����\��\��[\�O,�F^\�\��\�~���\�o��\��\�w\�3�_���ˏ~�?\�\�kІ)\�\�L\���f#w�\�\�����h����S�\�)\�T1!��]\�k\r\����1c\�$�6m�I��aÆ��\�\�($\�\���\Z\rƆ\�ؐuǈB\�}\�n��(��\�~��o׮]i�,n�= Ql\�\�R<��	\'��\�).���\�+\�2G7y�\������\r\�\�/��\��9��\�5L�Cݟ\�w\�Io\�r\�-e��\��\�xl|�\r\�ݿ_�\�M�3\�<�\�~�\�g��H\�T\��\�o�f��=U@�\��{������f��\�\�\�Y�\�4E�Κ5+\�,u\��1jԨ��d\�\�\�>�\�R\�/\�}�`<��iH\'��p1$�r\�4\�b��ᴴ�<�=oS\�4�uy.�\�6�d)����Ǐ\�9P3M]3K���8﯍b�؉!1ԄMS]���V\n�\�K\�&\'�Ōx�˭\�w\�\�\�장�P)\�e\Z�\�w\�}���;�|�\�ͱ\���b�؉!1�3�]Fk\�e�r5�0:�7N�\�8�e\��\�b\�-\�\�\�F~�駓�\�X���w6J\r��X\�mmm���\'v|�\�UuJ�$�]�\�\��\�\Zi�V�S\�Đ\�q\�T\�Q\�n�fO7\�ǱϞ�\�괟�\�i�\�\�s\�\�����>:�m۶#\��ƅt\�\�p˖-�aƌ��=Au��@�S\�Đj�幦Z�\���qj\�\ZH�\�l������\�\�\�G\�8q��F>{�b�؉!1\�MS۰:)�\Z��b�a24L\�\�mOR�\�p�%@�S\�ĐѴ\rS��&\�p�b�؉!C\�T�9\�,��b\'�\rS��i�f	P\�;1dh�J�=Kɰ&=u\0�\�)vb\�\�0U\�</�\�)vb\�\�0(v��24L\0���a2\��bgh�1�a2;1$�\04L�b\'�\�\0��b\'�\�\0��b\'�\�\0��b\'�\r�b�؉!C\��\�\Z&C\��\�\Z&Ch�\r��;1�a2;1$�\04L��b\'�\�\0�-_�\\�Q\�Đ��իWw���+4u0�m\��]�\�CF�\�@\�[�bſ�Z���~Pp��\�-[�\�pa<!��f�!�\\($ؙ��J�\�T�1d\�`��C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}��{\�|���\0\0\0\0IEND�B`�',1);
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
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`) USING BTREE,
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-19 18:42:06.693',NULL),('10001','SpringAutoDeployment',NULL,NULL,'','2019-05-19 10:30:15.740',NULL),('10005',NULL,NULL,NULL,'','2019-05-19 10:30:17.384',NULL),('12501','SpringAutoDeployment',NULL,NULL,'','2019-05-19 10:31:15.444',NULL),('12505',NULL,NULL,NULL,'','2019-05-19 10:31:17.083',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-05-19 06:45:46.110',NULL),('5001','SpringAutoDeployment',NULL,NULL,'','2019-05-19 10:24:28.326',NULL),('5005',NULL,NULL,NULL,'','2019-05-19 10:24:30.254',NULL),('7501','SpringAutoDeployment',NULL,NULL,'','2019-05-19 10:28:15.155',NULL);
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('Consign:1:4',1,'http://www.activitiPre.org/processdef','consign','Consign',1,'1','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:2:2504',1,'http://www.activitiPre.org/processdef','consign','Consign',2,'2501','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:3:5004',1,'http://www.activitiPre.org/processdef','consign','Consign',3,'5001','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:4:5008',1,'http://www.activitiPre.org/processdef','consign','Consign',4,'5005','processes/Consign.bpmn20.xml','processes/Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:5:7504',1,'http://www.activitiPre.org/processdef','consign','Consign',5,'7501','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:6:10004',1,'http://www.activitiPre.org/processdef','consign','Consign',6,'10001','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:7:10008',1,'http://www.activitiPre.org/processdef','consign','Consign',7,'10005','processes/Consign.bpmn20.xml','processes/Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:8:12504',1,'http://www.activitiPre.org/processdef','consign','Consign',8,'12501','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.bpmn20.xml','F:\\Project github\\stconline\\server\\target\\classes\\processes\\Consign.Consign.png',NULL,0,1,1,'',NULL),('Consign:9:12508',1,'http://www.activitiPre.org/processdef','consign','Consign',9,'12505','processes/Consign.bpmn20.xml','processes/Consign.Consign.png',NULL,0,1,1,'',NULL);
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE,
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` varchar(255) NOT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_entrust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_project`
--

DROP TABLE IF EXISTS `tbl_sys_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_project` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_project`
--

LOCK TABLES `tbl_sys_project` WRITE;
/*!40000 ALTER TABLE `tbl_sys_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-20  8:22:15
