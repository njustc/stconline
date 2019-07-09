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
INSERT INTO `act_ge_bytearray` VALUES ('10',1,'/home/dell/stconline/server/target/classes/processes/Contract.Contract.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0jmIDATx\Ú\ì½xUUz¸\ïe\ÇÎ´3ö™Û§\í3şZk­µ:}ú³N•ß´u¬csv\Î				„p	\ÂU\"n\ÊÅ  ™	ˆ#şA\äƒ\Ä(¹ˆŒˆ!!„¬ÿú–\Ù\éI\ÈI\Î-—½÷û>\Ïz\Î5\'É—\ìµ\ßı­o­u\Í5\0\0\0\0±’ó\ì5¤¡\å´\ĞF.\ÜYo\Ş7{‹\Ò\Òm\Üol\r\ï\Ózß¢–¾\Ñ\0\0pÏ½~ü\Ê\Ğy\Åõú\äÿTR\'4HB­R§õóÿ×ˆÀü\âú!sŠ\ä}Ç¯	}{\àtı—ò¾Š\Êk†>W\Ü\æû\0\0\0ÀE»­¾Q\"\Ì\íV;\Óğ›¼ï¹·ôû¶6\ÉF4¼oMğûô\ãeEG.}%mØ¼¯?[î·”­\0\0\0\0\"\'x\Ò8{Ym\"A÷M6\â¹\"ó¾\×ö~U\Óddv\Ó÷ÙŸ\'C }©ª\ìç§½z°vòo?¸B\Ä\0\0\\„>\á\ß/Ù…!³›\ÕH\Ì+®2û\ë¬D\ÃûF\É}¹mZK±Um9ôÕ¥ ÷\İ\ßğ¾û%“\Ñ(\"ú}i\0\0\0¸0#\Ñ0,ñ›¦\Ã\Zÿ+ö{\Şwk\Ë\ï\Û\Ú\ä}öı\Ü\çK\Z\n5\\\ÜJ\Ä\0\0Ü“øş¼×_‘“ü™ZuZ¤`\ès_‹…y,39\æ\×7¼÷?\í÷\rùzVÆ†œ ™s7||¹\á}·\ÚÙ‰†\Çş¿•\ÕC˜±\0\0\à:‘È¶³\nC+61t~Iı‹;NW™Û˜©(\Öm\åÿ¾¯¨>gnñ\×M²sŠ\Ìûj”ú2øóF.~»~\Í{_^õ\ë\Ò:ûó\n-‹‰<\0\0€øô¢:ó\ÆÁ‹rrO“ÿ\æ”_g¶OX¶§nÄ‚™Î¹x\èÜ¢\ßw¦V÷óˆ<\0\0\0\0¸\Z-½\ßÛ°a\Ã\ê9s\æ|5cÆŒúaÃ†©\Ô\ÔT•˜˜¨’““Õ!CT^^\Ş\å	&|š=”ˆ\0\0À5\'OLZºt\é¹Áƒ«şıû«%K–¨;v¨\Ï>ûLUWWKVM]¾|YUTT¨w\ß}W-[¶Leee©Ö3¦\Ø\ï÷\ßB\0\0<†öƒ[¶l\ÙR9h\Ğ 5c\Æµw\ï^#\á²ÿ~5g\Î•‘‘¡†\r6ˆ\0\0x(ñ\Ì3\Ï\Ô\ç\ä\ä¨İ»w«X8xğ \Ê\Î\ÎVıúõû<55õ{D\0\0ÀÅœ?>;//O=û\ì³\êÜ¹s*\Èˆ|Ş€¾d¨\0\0ÀÅ™‘ˆiÓ¦©+W®¨x3o\Ş<\ÉL|Ñ­[·om\0\0\0!52œ!™ƒö›Y³f©={–q\0\0\0!…•R¯\áŒÖ†9²²²\êı~Q\0\0p2¤!³3dfFG ˜IIIu\ÔK\0\0\0¸\0Y\'B¦xv$“&Mºœ˜˜¸–\è\0\08Y±R›\ê¨l„Í‡~¨ü~-…—\0\0\0\æ7\ŞxMV¬l\Ï\ËP¤¦¦\ÖY–•Á_\0\0À¡\È\Ş²\ìugPPPp111q\0\0\0‡\"p\É\ŞÁ\Ûo¿}E‹\Ä\'ü\0\0\0Š\ì\â)pu•••õZ$jø+\0\0\08\Ù\Ü\ŞÅ³£‘MÀdrş\n\0\0\0EN\ä	\"\0\0\à`zõ\êÕ™‰zD\0\0ÀÁ:´\Ój$***.S#\0\0\à`ÆW\ÓY³66l\ØPÁ¬\r\0\0\03q\âÄ²\ÎZG\"//\ï\ëH\0\0\08˜\ì\ìì´¬¬¬NY\ÙR–\ÈfeK\0\0\0\ç\ËD]Gïµ±}ûv\Ö`¯\r\0\0\0§3v\ìØ­Ó§O\ïP‘\èÛ·\ï)vÿ\0\0p©©©\ß\ëÓ§Oışıû;D\"\Şy\çJ\ÉFøış[ˆ>\0\0€8p`Ş AƒÔ¹s\ç\ÚU\".^¼X.k‰\È!\ê\0\0\0.\"++ë³‚‚‚ö,¼¬\×ß£Â²¬‰6\0\0€Ë\ÂÇVÎ™3§=d¢~Ì˜1\'d\İJ!\Ú\0\0\0.•‰¾}ûVÌœ9S]¸p!n\Ã\â\ÊO¨‹\0\0\0ğ€L$\'\'œ™™Y¿gÏ˜+¥&B†3\ÈD\0\0\0x)ˆ\ìÙ³\ç•q\ã\ÆÕŠPD2\ÜQZZzZj.\ZfgPX	\0\0\àE$‹`Y\Ö\n\É*¤¤¤\ÔÏ˜1\ã\â›o¾y\åÔ©Su—/_n\Ü\ÅS6\àÚ¸qc¥,{-+VŠ@\È:e\0\0\0€A‹A²n›t+\ÓrqQ¶\0j5R¡\ÛvYöš+\0\0 ¹PH\0\0\0D-			L$\0\0\0 b,ËªOIIù3\"\0\0\0Q‰Djj\ê\ß	\0\0\0ˆ˜\Ä\Ä\Ä:-w	\0\0\0ˆF$®$%%ı3‘\0\0\0€hD¢\Ö\çó\İK$\0\0\0 \Z‘¨±,\ëD\0\0\0\"FKÄ¥@ ğ‘\0\0\0€hD\âbRR’E$\0\0\0 b¿’¥³‰\0\0\0DŒeY\ç´Hô!\0\0\01Z\"¾\Ô21ˆH\0\0\0@4\"qF·\\\"\0\0\0Ñˆ\Äi\İ\Æ	\0\0\0ˆË²N‰D\0\0\0\"&11ñSİ$\0\0\0HœğûıD\0\0\0\"FK\Ä1Ë²\æ	\0\0\0ˆ˜\Ä\Ä\Ä#º-\"\0\0\0H|¨[!‘\0\0\0€hDb_ ø-‘\0\0\0€hDb·n+‰\0\0\0DŒeY\ïúış\ß	\0\0\0ˆ˜\Ä\Ä\Ä\íZ&^\'\0\0\0Hë¶™H\0\0\0@4\"±Yd‚H\0\0\0@4\"±A†7ˆ\0\0\0D#ku\ÛI$\0\0\0 b|>\ß*¿ß¿‹H\0\0\0@\Ä\ÈbT–e}@$\0\0\0 bdylY&›H\0\0\0@4\"±H6\î\"\0\0\01@`eY	\0\0\0ˆ¿\ß?+11±ŒH\0\0\0@\ÄX–5M‹Ä§D\0\0\0\"&L\Ô2qŠH\0\0\0@\Ä$&&\Õ\í4‘\0\0\0€hD\"W·3D\0\0\0¢‰lË²ªˆ\0\0\0DŒ\ß\ï\Ï\Ô\í‘\0\0\0€ˆñù|½¿jŠ[tûY=\î$2\0\0\0\ĞË².jq¨Õ­N7¢-\0\0\0¸\n-	\ÛZiõ\é\é\é?\"R\0\0\0p\r\Ã­e#v%\0\0\0hM&^\r%–e\İJ„\0\0\0 5‘¸¥¥\Z	-\ï\0\0\0h\Ùõ³¹H$%%YD\0\0\0Â¢a‡-Ÿ\0\0\0¿ßŸc‹„\Ü\'\"\0\0\0–e‘ \0\0\01\r»\"\0\0N\àw\Ş\É\ìß¿ÿ\å¿û»¿“›F£\Ñh1´?ÿó?W·\Şz\ë}ÿ\Î0\à	‰ø\éOªşû¿ÿ[½ûî»ªººZ\0@t\Ô\ÖÖª>ø@õ\è\ÑC}\ç;ß¹ŒL€\ë8p`­H\0\0Ä—_ü\âuº›\İÎ™\\gH&\0\0\â\Ëşıû\ëu7{™3\r¸†3\0\0\Ú\æh¨›\0p·H\0\0@û€H\0\"ÿª+\äôv\0€H\0´·H\ìÜ¹S\İ}÷\İ\ê\ÆoT7\İt“ú\Çü\Ç9i_4­\ê†nPÿôOÿ¤Š‹‹	\0@$\0œ$ö:~ø¡:{ö¬\Z2dH‡Š„°c\Çsÿ¯ş\ê¯\è¡\0\0‘\0p’HH6@\Şô\èÑ°D!\Ôc»ıı\ßÿ}\È\Ïj\ës%+bó\Å_¨\Ô\ÔTõ\ío\Û<ÿÀ¨òòruşüyó\Ü\ßş\í\ß6ù<y,‘¡\æŸ\ê³l~ø\Ãª›o¾\Ù\Ü/((0_+·\Âw¿û]õı\ïŸ\0	@$ZBNªöğ\Âş\çªüü|s2>`®¿şú6Eb\íÚµ\ê÷¿ÿ½¹ÿ\ĞCE$o¿ı¶¹ÿğ\Ã7¾Ş»woóœ½9r\Ä\Üÿ—ùóÚ°a\Ã\Ì\ã7\Şx\Ã<Ş²e‹y,Ï·ô3¶öYÂ£>j«©©Qÿğÿ`\îË­\Ì|‘û²\r\0\0\"ˆD\È\ÕúØ±cO Òºu\ë2SJ$\ê\ê\êL“û’W$\ì&\Ã\Z\'Nœh|]¾gó÷\ØBsüøqsÿÁ4\åV\Ëó-ıŒ­}– ¿¿<7~üxs;`À\0s;i\Ò$s+¯\0 €H´Á={\Z³ÁŒı\Ø…xŠ„0r\äHs_2\"\ÍOş¡\Ö\ÃHHH0¯\Û\ÙyJv\Úú¬•+Wš\×e\ã/ÿò/\Ís\"6òXõ\ÕW\é9\0‘\0D¢%$m_ZZj\î\ËZòvZ\ßF\ê\ä9¹\Ú_¾|y«C\ë×¯jhC†ş\äOş\Ä<¶gn\Ø\ÃcÆŒiñ\ë\í\áû\ëd\Ø\"”H´õYò»\Ù_ó\ä“Oš\ç¦OŸ\Şø\\p¦\0\0‘\0D\"©Y¬ƒ\\¹Ë°\Æşıû__¶l™)Dl>4jˆB$$šbK9«HQ\å Aƒ®ú\ŞÁÈ”QyN6(k\í³\Ãù,É¢Hd¨G:yNv\0	\0†6\0Ú™]»v©˜l\Æ\ÊLš\Ä\ÄD•œœl¦K\Ê\ÓO?­¶n\İJ°\0‘\0@$\0”ºxñ¢ú\ío«¬ú÷ï¯–,Yb\Ö\rù\ì³\Ï\ZkV._¾¬***\ÌFs’\Ë\Ê\Ê2¤\çŸ^UUUD@$\0¼*2T\ÒRo°m\Û6#3f\ÌP{÷\î5\Â.2¼6g\Î•‘‘¡^ıu‚	ˆ\0	ğR\â™gQ999j÷\î\İ1}\ÖÁƒUvv¶\Z>|¸ºp\áÁD\0‘\07#Y‡¼¼<õ\ì³Ïªs\ç\Î\Å\å3eD>/77—¡@$\0	ps&B$bÚ´i\êÊ•+qÿüyóæ©¡C‡š\é\Â\0ˆ\0\".C†3$s\Ğa3k\Ö,S¸	€H\0 \à\"¤°Rj\"\â5œ\Ñ\Ú0‡\ÌşX·nAD\0‘\0·i\È\ì™™\ÑHfÏ=©—\0D\0‘\07 \ëD\ÈÏdÊ”)¦\0‘\0@$À\áH\ÍBGe#l>üğC“• ğ	\0DŒ,{-5\íY`Š´´4µyófş€H\0 \àTd\ïYöº3˜={¶\Z7n@$\0	p*²—\ì\Ñlß¾\İdC\0	\0DŠ\ì\â)pu•••¦N\0‘\0@$À¡\È\àö.,\Ç-Û \0ˆ8”\Î>‘#€H\0 \à`zõ\êEF	\0D ::³F¢¢¢‚\Z	@$\0	p2ùùù6kc\ëÖ­\Ì\Ú\0D\0‘\0\'#»}v\Ö:O=õ\ëH\0\"€H€“‘lDVVV§¬l)\Ã\Z¬l	ˆ\0\"§3ö\Úx\ï½÷TRR{m\0\"€H€\ÓY¼x±Y\á²#\É\Í\Íe÷O@$\0	p.\\P}ûöUû÷\ï\ï\ĞlDUUÁD\0‘\07°~ız5h\Ğ u\îÜ¹vı>/^4«i®[· \"€H€›9r¤*((h\×\Â\Ë\áÃ‡a@$\0	pRø8b\Ä5gÎœv‘	™\î)\ëF\ÈP\n\0\"€H€KeBV»œ9sf\ÜNø2œ1j\Ô(#\ÔE\0\"€H€db\èĞ¡ª_¿~jÏ=1}–VJM„g‰\0D\0‘\0!‘)))jÂ„	F(\"\îØ½{·©¹\ÙV\"€H€G‘,‚`\Ê*”²S¨\Ü/..V§Nj\\LJvñ”\r¸d\ï©ƒ÷Š@\È:e\0\"€H\0D &Mš¤h†+dp»‰<H\r\ÄO<a–½f\ÅJ@$\0	€HF\Â\ï÷@$\0	€\ÈÙ·oŸ¾\0@$\0	€¨†9¤f\0‘\0@$\0\"fõ\ê\Õ*##ƒ@\0\"€H\0DÎ¯ık5`À\0ˆ\0\"9\Ï<óŒ\Ù\n\0‘\0@$\0\"fò\ä\Éfª\'\0\"€H\0DÌ˜1cÌ‚S\0ˆ\0\"1999jşüù	\0D rdC¯\åË—@$\0	€\È\éİ»7›q\"€H\0D‡ìµ±c\Çˆ\0\"9@@9r„@\0\"€H\0D\ìøyö\ìYˆ\0\"\Õ\Õ\ÕF$\0	\0D bNœ8Á\â€H\0 \0\Ññ\Ş{ï©={@$\0	€\ÈÙ´i“JKK#€H\0 \0‘³b\Å\nÕ·o_ˆ\0\"9.T\Ù\Ù\Ù	\0D rfÎœ©FI \0‘\0@$\0\"gÂ„	¦ \0ˆ@ÄŒ1B=ıô\Ó	\0D r\r\Zd\ê$\0	\0D bd\Æ\Æ+¯¼B \0‘\0@$\0\"\'55Õ¬%€H\0 \0#«Z\îÚµ‹@\0\"€H\0D\ì³!ûm\0 \0ˆ@\Ä\ÈÎŸ²(\0\"€H\0DDUU[ˆ\"€H\0DÇ‘#GT  €H\0 \0‘³}ûv•œœL \0‘\0@$\0Z§²²R-Y²D­[·N\íİ»W=z\Ô\Ü\ïİ»7ÁD\0‘\0h›¤¤$SÑ¼\É\ĞôôtÕ§Oµj\Õ*ˆ\0\"p5\ãÆkQ$\ì&SA%s€H\0 \0-o´&		\0D 4C†iQ\"¤è²¦¦†\0\"€H\0„f\ãÆ-Š„<€H\0 \0m\"Å•ÁÑ¯_?‚ˆ\0\"Ó¦Mk\"$(€H\0 \0\áq\á\Â3CC$bøğ\á	\0D 2lD\âı÷\ß\'€H\0 \0\áó\ÔSO©›o¾YY–¥*** \0ˆ@øq\íµ×ªŸü\ä\'\Ê\çó©\'x‚ \0\"€H\0„/¶<\ä\ç\ç7y€H\0 \0aID[\Ï \0ˆ@X²`¿>q\âD‚ˆ\0\"y\ÆA$‚\Ì \0ˆ@\Ô\Ã\"\×]w™	@$\0	@\"¢«}¯™ 3ˆ\0\"HDL_Of	\0DˆP¯j\í“š	@$\0	@\"¢	2€H\0 €D\Ä$ñ&@$\0	p‘DD*s\0\"€H\0“H\Øß‡\Ù€H\0 \àq‰ˆV$‚e‚š	@$\0	ğ€DC¤a@$\0	p)Ç7\ç\í·\ßv\æ!^\"!<ğÀ\æ=òs\0 \0ˆ88#\Ñ\Ú0C{f$F\Z\Å	\0D\Ü>¼Ñ–`D‚½\Ã\Z€H\0 \àa™ˆF$&O\Ì\âT€H\0 \àV™LÁ¸q\ã\ÚE$-Z¤ºw\ï®|>Ÿš9s¦Ú·oAD\0‘\0·pò\äI\Ô#<–L\\\ÅÊ–ƒV/½ô’\Z2dˆòûıªgÏjÌ˜1\êµ\×^S555ü\0‘\0@$ÀiTVVªñ\ãÇ«\Ä\ÄD5b\Ä#\í±\×Æ°aÃš<_WW§¶m\Ûf†9zõ\êe¾ÿşı\Õó\Ï?¯\Ê\Ë\Ëù\Ã\0\"€H@W¦ªªJMš4\Éd$Cp\èĞ¡\Æ\×\ÂY\ç\áš8¯!ò 1`À\0#\"ùùùF6D:\0	\0Dº\0\çÏŸWÓ¦M31h\Ğ µw\ïŞ™„XV Œe\Ñ)\æ\áö\á[vdXD\0‘\0@$ ƒ©®®V¦B†JKK\ÛM\â½Û§f>ıôÓªOŸ>F*222(\ØD\0‘€@®\î\çÎk¢oß¾ª¤¤¤]¥ ½·—Œ›€H\0 \Ğ\ÎH]L¹”­\\ÁoŞ¼9\êÏ²‘jk˜£°°°\Å\Â\Êöü)\ØD\0‘€8Ÿ\\_|ñE•œœ¬\Ò\Ò\ÒÔºu\ë\âò¹me\ZìšŠ’ˆ– `	\0Db\à•W^Q)))\æºjÕª¸~(™°k)ºÒŠ•l\"€H@˜¬]»V¥¦¦š,„œ(Û“\æ}…;\ì\Ñ\ÙP°	ˆ \0\ÍØ¸q£JOO7W\ÜK–,\é°ô½¸\ï¾û¹‹\'›€H\0\"¦¸¸\Ø\\Y\'%%©¨\Ú\Ú\Úÿ$3!ÿ—N\ß\nœ‚M@$\0‘\0Ï°s\çNÕ¯_?3•sö\ìÙ~õ|üøq\×Å˜‚MD\0‘\0×±g\Ï5p\à@#2®\á\Â‚\ÒP°‰H\0 \àh<¨rrr\Ì	lÊ”)\ê\ìÙ³¥¡`‘\0@$À=zT\å\æ\æš\Ôú„	Ô™3gJƒ‚MD\0‘€.‡Œ\ÏKñ¢\ÄØ±cÕ©S§Š `‘\0@$ Sa\È\Ë\Ë3\' ‰\'N‡!›ˆ\0\"\íY\È	FRã²´´i€» `‘\0@$ \îHÑ¤¬\Ã \'•Áƒ«@Á&\"€H@\ÔÈ´M9‰\È	D\ÒŞ»v\í\"(†‚MD\0‘€°\Ó\Ûs\æ\Ì1\ë@È‚R;v\ì (\Ğ\n6	\0D®B–®–,e-©ì¢¢\"‚aAÁ&\"€Hxüê²°°Ğ¤ª{÷\î­6l\Ø@P ¦Œ›ˆ\0\"\á^~ùe•’’b® ×¬YC@ \îP°‰H\0 .dõ\ê\ÕFD\"V¬XA@ C `‘\0@$\Îúõ\ë\Íğ…t\à2œÁø5tl\"\0ˆ„ƒ\ÂII)K!\åÂ…\èrP°‰H\0 ]\íÛ·«\Ì\ÌL3•ó¹\ç#} µ‚M6…C$\0‘€@’+;\é€\n\n\Ì\âR\0N%¸`S²^ÿF$\0‘€vC–¯–e¬E dYkY\Ş\ZÀ-H6Bş·\ÉH €H@œ9r\äˆ\ÙHK:YW&ın\äØ±cˆ\"ˆÄ“²²25r\äH“î•­½+**\n¸–={ö˜š	D‘\0Db\äÔ©S\êñ\Ç7Wg£Gfºx‚·\ŞzË¬}‚H €H@”TVVª	&˜\Äğ\á\ÃMªÀ+¬[·N¥§§#ˆ )R49eÊ”\Æip$(\à9dV™ÎŒH €H@˜\È4·3f˜u hÆˆ¼\Ê/¼`D‘\0D\Ú@\äy\æ™gŒ@dee©;wğ<s\æ\Ì1³“	D	Amm­š7oYÊºoß¾¦¸À‹=zÔ¬\Ì*\Ãx\ÒD®§OŸnV»D$	@$ ²—À’%K\Ì\Ô6)&Û´iAO#«³JQqKMD[ZZZšÚ¼y3\"€Hx›\åË—«\ä\äd•ššjö\0€¯‘\İ@CÉ„4o/\îƒH\0\"†•+Wš9ñ²Ë¡\Ü€¦\È&]­‰„¼\Î\Ğ\0\"\á9d.¼¤d%ñ\â‹/²E2@+\ÈqÒ’DH¶Â« €Hx\Ë\Í\È\È0c»‹-B \0\Â`Á‚-Š„—g2!€H89\éoÜ¸1\æ\Ï)))130d*\çÜ¹s=9¦-UUUf!¶`‰5j”§c‚H\0\"\á\ìNK„\"š\Êğ\Ò\ÒR³„Ä¬Y³Tuu5g€(U]ƒEB¦†\"\0ˆ„cD\Ân}úô	+C±w\ï^•m®¢d\Şûùó\ç9\0Ä€ˆƒ}\Êfu^‘\0DÂ¡\"œ¡hI(:döÁ˜4i’I\É@|4h9ş>ú\è#D‘\0D\Â\Ù\"œ¡!²²2³§<7n\Ü8³C\'\0\ÄY\åR1‘\0D\"*Nœ8a:9q¿ñ\Æ´(š¬–Y\\\\¬9\ÂY	8¶|l!€HD\Ñ\ÑmÛ¶MUTT˜´\è\Û\éÓ§UQQ‘:|ø0gP\à\Ørè±…H\0\"EJ“.¾÷\'\0-·[ˆ \"&T|›¤c8¶œyl!€HDˆ˜tPˆ\Ä-D\0‘j_}ù™úø\İ%jÿ¦|\Ó\ä¾<G\ç†H\0\Ç\"€H´\Ú\ÎW}ªöm\ÈS{~?¼I“\ç\ä5:8D8¶	\0D\"dûdÿ\ï®\ê\è\ìV¾-\"[ˆ\0\"º}¸õ©¼F‡H\0\Ç\"€H„lû\Ş²³“\×\è\à	\à\ØB$\0	:;D8¶	D‰øwvRIª³“\×\è\à	\à\ØB$\0‰\íHÉœ¼F‡H\0\Ç\"€H„lg>İ«ömwu\êU?\'¯\ÑÁ!À±…H\0 ­¶c¥…Wuvò\"[ˆ\0\"\Ñz»tIy{\ŞÕ©Wıœ¼F‡H\0\Ç\"€H„\\y\ïp\É\ì\ã¸ò\Z+ğ!À±…H\0 W])}vd‹ú\àõ1!;:»\É{\ä½\\A!À±…H\0 m^)q…H\0\Ç\"€H„\ì\ìÂ¹Rj\í\nŠ\Î‘\0-DÀ\Ã\"mGg7:;D8¶	\0Š-iˆpl!\0ˆ\"ˆ\Ç\"€H\Ğ\Ù\"Á±…H\0 tv€H\Ğ	\0D‚†H\0\Ç\"€H\Ğ\Ù!€Hpl!€H\Ğ\Ù!€Hpl!\0ˆ 4DÀƒ\"QRR¢\îº\ë.u\ã7ª›nºI\İy\çM^o88Õ¿ÿû¿7y^Û¯µõ=\ì÷I»\á†\ÔO~òµyófD\\-7nTÿöoÿf+ir_ó\âñ…H\0¸X$n»\í6s\0\îİ»W>}Zegg‡\ì¤v\ï\Şm{ÿı÷›<nG\'÷·m\Ûf\îÿø\Ç?F$Àµ\"±~ızóŞ­[7uò\äIu\ê\Ô)s_–	¯_ˆ€‹EB®`\äg;xğ`«”\\Medd˜\ç233\Í\ãh::û±d@\ì\Ç\ÒÉ¦¤¤¨oû\Û\æùû\ï¿_;v‘\0ÇŠ„QØ¾}{\ãsr¿yöÁ+\Ç\"\àb‘N\ÅN‰şü\ç?W\ãÆ3™‰\æ\ÔÚµk\Í{$s!·ò8š\î\Í7\ß4÷z\è¡\Æ\×SSS\Ís2\Ìr\àÀsÿ{\îA$À±\"azğs\Õ\Õ\Õ\æ9\æğ\Úñ…H\0¸X$\äjeô\è\Ñ\ê;\îh\ì\î½÷\Ş;)yÏ­·\Şjn[º\ng\×N»=z´ñu¹Jjşë¯¿‘\0Ïˆ„Û/DÀ\Å\"\ÜJKK³-ut‹-2÷\å6šN\î\ç\æ\æšû’ıh\ŞÑ={–\Z	p…H\ØCrL5\Úø\×ıW\Ï_ˆ€‹E\â\ÑGmÇµ‹¼\ì+¢¶:³h:ºó\çÏ«[n¹\Å<¶+\Ë\í\Ô\ëÈ‘#\Ãn\í1\"}lIA¥üO\ÊĞ¡[¾úê«;¾	\0‹\Ä#<¢~ğƒ˜,„\\¹È°†]=\Ş´É“\'7B9s\æŒ\êß¿¿ºù\æ›[¬VG$Ài\"aË„V\Ú9\Æ\n\Ã>†\Üt|!\0\Ú`\ÑD\Ú\çØ’l@ğ°\Ç\"€H\Ğ\Ù\"v“BKY(\êû\ßÿ~§LmF$\0‰./’¾m©\Ñ\Ù\"Áñ…H\0 \\5\"AC$\0	\Z\"[ˆ\0\"Ag‡H\0\"Á±…H\0\"Ag‡H\0\"Á±…H\0 tv€H\Ğ	\0D‚\Î‘\0-D\0‘ !À±…H\0 tvˆ [ˆ\0\"Agˆ\Ç\"€H\Ğ\Ù\"AC$\0	\Z\"[ˆDW>Q|\ë\ã?şdûö\íf+x‰-ò¶i\Ó&U\\\\\\¯\Û<D‚\Î‘\0D‚c\Ë3\"!±m\Û6UQQÁÿNŒ\íô\éÓª¨¨¨^K\ÅD¢\ÄTùGA$ şpl!‰d\"ˆøÊ„şÿ«A$Z\0co;u\ê”9\0pl9ó\Ør‹H ²\í#²ˆD=zTR6\êó\Ï?\ï\ÒÀK—.9¦£;|ø0gQpÌ±\å„c¬#-·ˆCkˆD‡‰„\İ\ámÙ²¥\Ë»lÜ¸Qùı~sÛ•‹rpÚ±|Œ.{Œu\ä±\å5‘ø\ê\Ë\Ï\Ô\Ç\ï.Qû7\å›&÷\å9\Ä‘pgÏ5\"\0\í‡cUUUƒ—D\â|Õ§jß†<µ\ç÷Ã›4yN^C	\×pò\äID D¢¬¬‘ğH|²ÿwWI„\İ\Ê÷¯E	÷p\è\Ğ!•””DOĞ\È1¶g\ÏD\ÂC\"ñ\áÖ§BŠ„¼†< ®\á½÷\ŞS={ö¤§hGzõ\ê¥\Şz\ë-D\ÂC\"±\ïñ!EB^C	\× [JJ\n==@;Ò»woµ~ızD‘@$	÷±a\Ã\Ó\É@û‘™™©V¬XHxH$d–F(‘×D\Â5¬ZµJedd\Ğ\Ó´#TK–,A$<$GJ\æ„	y\ry@$\\Ã²e\ËTÿşı\é\éÚ‘¡C‡ª9s\æ ‰3Ÿ\îUû6»zXC?\'¯!ˆ„kX¼x±\Z4h==@;2f\Ì5}útD\ÂcR+-¼J$\ä9\Ä‘pr•4l\Ø0zz€vdÂ„	*??‘ğ’H\\º¤¼=\ï\êa\rı\\¶%@$‰°™1c†\Z5j==@;\"\Ù\ÉJ \Ş	Y¹òp\É\ì5ò\Z«[\"®aÒ¤Ijüøñôô\0dş‰XE\â\Ò%õÙ‘-\êƒ\×Ç„”»\É{\ä½d\'	\Çó\ÄO¨É“\'\Ó\Ó´#/¼ğ‚™¹H¸W$\Ú\ÊB@$\\‹kÌœ9“ ‘5$d-	DÂ½\"N¢µ\ì\"H8I·2-\r }Y·nJOOG$\\,\ÑJ„\İ	DÂ±dgg«E‹\Ñ\Ó´#,E\ï~‘ !‰¬¬,µ|ùrzz€vDvşds<D‚†H¸Y{õ\ê\Õôô\0\íÈ±cÇ”\ß\ïG$	\Z\"\á>d\Ã.Ù¸\0Ú3g\Î 1Š\Ä/~ñ‹\"ˆ\"\Ñ\éÕ«—¿€ø³}ûvõ\ÔSO™B\Ë\Ä\ÄDu\á\ÂD\"\n,\Ëú\ÄOš¾_¯¥¬Nß¿¢o/\ëÇ—ôıúş9İ¾\Ğ÷O\ëvR·2ıø#}{@¿g·¾İ©\Û6\İ6ù|¾\×ô\íJİ–\ê÷,Ô¯?«o§\ê\Çyúv˜n™ºõ\Ô\ïûŸ\Ç{\ì?ôó÷$%%İ’’òg>ø\àmÜ¸‘“?\"H\ØÈ¸\í®]»\èñ\âÀÉ“\'\Í.ŸƒV@@é“\Z1b„z\å•WTUU‰f\"¡côK}=T‡,\'nİªu{HN\âò\\=n““»œ\äõg<\"\'}9ù\ëÿıüX‘\İf\é\Ï^\Ğ ¯\èÛµ\"\"úñ;\rrq@·\Z¾‡\ÈG…n_ˆ”\è\×/\È÷YiÑ­N$\Æ\ZNşˆ\"Ñ€tt‡\â\0\Ò\Ê\Õ\é¸q\ãLvO†/úõ\ë§fÏ­8@€\Ú	}bşXN\ÊZ\0F4\ïŒõs½ôk’qø 55õ{\ÔH ˆDE:>¹Š€ğñ–µWdÆ“œE d…\Øõ\ë×›\Â‰†!Cª\èÑ£Ç\r/]×=\á‹\')¶lŸ\Öğ·\è2Ÿ…H89ˆÏ=K9>V®\\©Fi†E¾\íõW\Ê\Ë\Ë	P”\"ag#‚\Ú©C\Z\ã³úõqÃ¬’’u\×]w©o¼Q\İt\ÓM\ê\Î;\ïŒ\èõh?·3E\"š\ÏF$J]]9€\å\0ş—;wªiÓ¦™\é\Ñ\"R,9e\Ê\Óys¼\Ä.R\ÑL\"\ì&5ou\ë\Ö\í[n™şy\Ûm·™\ß{\ïŞ½\êô\é\ÓFB#y=\Ú\Ï\íH‘ˆ\Çg#¾\ÒbJ\Z€R§NR¿şõ¯Õ!C\Z‹$sss\Õ\Ë/¿L‘d;ˆDCq\ãU\"!ÅŒ:öÿ\ì¦u$n¸\áó{<x0ª×£ıÜ¶²öc»\İ~û\íM>«ù\ëv\Ö\ãOÿôO\Í÷¾\å–[\Ìb†\Í?»ù×…+ˆ„C‘\ÚD¼Hmm­Ú¼y³š0a‚JMM5\'1\ÙTkÖ¬Y\æ\n\ÚO$t¬“Cd#\ìv\ŞM‰û\ï¿\ßü\Şròıù\Ïn\ns%ƒ\î\ë\Ñ~®¼vıõ×·)¯¾úªZ³f¹ÿ\àƒ^õºÈ‚,¨f?\á¶ÿ\à?`h\Ã\ë\"!Ecr\å\à9¢\æÎ«ú÷\ïo:99Y;V½ö\Úkªººš\0uœHœnC$¤\ít‹HH¶kô\è\Ñ\ê;\îh<Á\Ş{\ï½a¿\í\ç\Êc©ŸhK$\ä_šuh\éõ–‹¤4\ÏB ‰÷\Ş{õÿÁµ\È\âO²ü»t¶\"\r\"ƒ\rR\Ï?ÿ¼*++#@\'¡j#¾²,\ë n+ôßª¿—\È.--m\Ì\"Dóz$Ÿü\Ø…hD\"œÇˆ„‡E‚	ÁmH‡:cÆŒ\Æ\"IY~Ò¤Iª¸¸˜\"É®#\"\r5ú\ïóªsHMDWÊˆE$}ôQ³Â©\Üÿı÷M$‹\î\ë\Ñ~®;\Ès’‰+,,luhc\íÚµ!‡6¢	É„\ÈcÉš .GöØÀ©TVVª¥K—6)’6l˜×•ı- ë‰„ˆœ~¢ˆD$y\äsR—ì€œ`eøa÷\î\İa¿\í\çJ-\Ã\Í7\ß²ğ±ùó\"!-[F#\"ó’İ \Ø\Ò¬Zµ\Ê\\¹8\É*lİºU\å\çç«´´4“\ïÓ§zú\é§\ÍV\İ\ĞõE\Â\r\'\nV¶deKD¢eË–™\Â3€®ŒTˆÏ›7O\r0Àˆƒ\Ô;<şø\ã&\ëõM°	D‘@$:•Å‹›\â3pÇw\í\ï&r \Ó\ÑDD\ZDD\",X`¤	¯ˆ„Y´\Ô	D¢\Ë û\Èx28Ù–ZşWe· ;\Ğ\ÊğDß¾}8È°\ÅÄ‰UQQE’ˆ	2ˆDWE\nbF\ZE\ï\æ0‰¸ö\Úk\Õ\İw\ßmn*R)‘\"²v‘\äĞ¡CÕ‹/¾h\n(‘@$	D\ÂÈ´¸ñ\ã\ÇÓ»9L\"ly+v§È„dd\n¦ü\ÏI¶A¦fJ¡\ïÌ™3\Íz&€H ˆ\"\á@\ä4yòdz7JD[\Ïwd\Ñ\'Yüi\àÀ+I3\Æ,E‘$\"H\Ğ	 \Ã\ZrEÎ”ˆ\æ¯K†\"\Z\ä¤.ó\ÇcEVÇ“å¦¥HR:y\"IY–ú\èÑ£ü!‘ !nCÆ§¥\àœ+6\Ñs\ÈÎ–²C´\r\Ùàª  Àlx%E’²–l„%b\É\ÆX\0ˆ\r‘p1²ı¢E‹\è\İ.Á2q\İu×…™¡‡^½z=W\ä`n)’|é¥—\Ôğ\á\ÃM¤J\æ\ä\ä˜%xe9\\\0D‚†Hxˆ¬¬,S9Î—ˆ\à¯™h\ë\ëv\î\Üi\ä!xã¤–¶Ï–\"\ÉmÛ¶©)S¦˜\å\Ô\í\"\É\éÓ§›\Ï\0@$hˆ„‡EBNRøîˆ\æ_*3!ıˆ4ßqö\ì\Ù\æõòòò\Æ\Å\Ê\ä}\"RO³r\åJuşüyş@€H ˆ\"ñ5r…)w³$âš vZ\æh\ésÖ­[×¢DH“¡\n{¨C–N—ú™C‡ñGD‘@$‰–‘“†l%ñ#œ:ƒX3\áˆDK™‰%K–„”»É¬‹X~\0D‚†HxIY\Ë\Ò\Äß˜Ê°@{g„+ÁŸ+Ù†\Ö\Ân²#,\0\"H ˆDX\ÈÉ…\Ôu|±O\È\"’\ç\ê>ÒšˆHDB\é˜İ»wW			ª_¿~¦Ù›a5o,™ˆD\Û\ÈôfNşˆ\"¡‘4÷É“\'\é\İ\ÚA$\ì&\'\ì+V\ÄM\"¢	a\êÔ©W\Í\æ\éŸò³ÉŒY}R~V \0D¢u¶m\ÛVWQQ\0Ä©•———i‘¨A$z\Ò;{ö,½[;Š„İ¤¥ù°A´³3¢	ûûµµ\ÎKW\"\Ñ6[¶l™RTTTÿù\çŸwÙ“ó¥K—#›6mª\Õm\"\á0d}€\àd\'B5Yt\ÈŞ¡\Ñnr\å*W°v“¥¬j(M6e’!\é\é\éfŠ©4Y=Q¶ˆ–%µ.kX\Èò\Ér%,c\r<\Ø,l4d\È³\âfnn®Yôh\äÈ‘&\İ.{4\È\Ò\Ëyyyf£1I\×\ç\ç\ç›M \äŠZN’Ó¦M3;š\ÊvÔ²\Ú\â3\Ï<cf\È\Íó\æ\Í3û>\È\\2\ä (\ÉN“²\Æ\Ë/¿¬^y\å3½Q¦Ã®]»\Ö\ÌnX¿~½Ú¸q£Y¥Q¶³–\ÂT™:¹c\ÇUZZj\êKd\í…}ûö™%¦9\Òf\r‚\Äé·¿ımÄ³3\"m¡p\ÒF_€Hteô‰o‚¾ŠşJRò]­I\'}¶ô_]ñ\çk\Öj\Ü$\ËHˆLH+”+Q\ÉN\ÈÊ…²³¬R(\ë	HúûØ±c\æ$)\'\Ë˜“§œD\åd*‹\É\ÉU-’“­œt\åŸW¦•\Ê\ÉXN\ÊkÖ¬1W\ãr²–Tº¬Œ(\'q9™\Ë?¼œ\Ü\å$¿`ÁsÒ—“¿¬i0k\Ö,#²ˆ,€$\'_‘‘‘‘‰q\ã\Æ¹É6zôh##FŒ0\"\"R\"r\"MdE¤E\äE$FdFšˆH4‘ ‘!‘\"‘#\0\Ù?\"XD¦‚\åJ\Üp\n\Z\ívûí·‡yˆ—H<ğ€y\Ïñ\ã\Ç9³\"\á2ºu\ëö-İ¿\\–>†h à¢¡\r«\æ\Ã\Z­\r3´gF‚¢J@$Ü‰\ß\ï\Õ\îwzô\èq\'A$À\á\"!\ÉĞ´DG\×H\Ø{q0¬ˆ„;±,\ëV\İ\êƒú \"¢‚H€CEBV†,..nóı5k#Ö­\Æ‰®\î{ö4»˜©•¡\"ƒH€ƒˆt3«pfS\Ä\"R‹\É\ç \Î#))\ÉjiX\Õ\ï÷\çD<€]»\Î\Éşš(V¶”¢S\0D\Â\ÕÙˆ³-‰„eYD<B{íµD\0\"\áz‰X\Ô\Ú1¿\ßÿ3¢„H€\Ç2\íµû\'\0\"\á.´$\Ü\"µ­‰„eY\ï)D<–™ˆ¥¦‰\0D\Â;ø|¾ZN\éö•E³Yv»B\Ñ%\"d&\â:<€H¸-\"\ÏK¦[\ê\Ç3dj(‘A$Àƒ™‰H¤\0‰\0D\Z†;\Îú|¾~D‘\0h\\Dª­a™\âIa% \ĞP|yI‹\Ä\ÃD‘\0+\Ó`\×T €H@ƒHÔ±<6\"–LD²ş\0\"\á‘P			\ß!ˆ@‹2aKC¸\Ã\0ˆ„§\ê#na\çOD $v\â¾û\îcO@$ ¥l\Ä=2İ“H \0­f&\äŠ‰\0DšcYV‚\î.	D UD$\0	h\Ï\ç\â÷û«ˆ\"€H\0\"¦\ëş\áS\"H\0 €H@45…–e$ˆ\0\"ˆD#\ë´H\ì ˆ\0\"ˆD#\ÛE&ˆ\"€H\0\"ÑˆÄ‡2¼A$	\0D	ˆË²\Êe·O\"H\0 €H@\Äøış/tF$	\0D	ˆfh\ãbRR’E$	\0D	ˆF$®X–õ/D‘\0@$\0‘€hD¢^6\î\"ˆ\0\"ˆDDß¾}ÿ€?	\0D	ˆ\nË²\î\Ğ}C‘@$\0	@$ ša‡t«!ˆ\0\"ˆDŒ\Ï\ç\ë\ç÷û\Ï	D\0‘\0D\"&L\Ô}\Ã)\"H\0 €H@45ü~ÿGD‘\0@$\0‘€ˆ\Ññª–‰÷‰\"€H\0\"\Ñ[k‘\ØB$	\0D	ˆfhc¯n+ˆ\"€H\0\"\Ñd$\ë6‡H \0ˆ Hœ\Öm,‘@$\0	@$ \Z‘ø\Ê\ï÷§	D\0‘\0D\"FK\Ä\å\Ç{\ì?ˆ\"€H\0\"\Ñd$\êSSSÿ†H \0ˆ )\×I¿0~üøo\nD\0‘\0D\"\"99ùÇ–e\Õ	D\0‘\0D¢©¸O÷—‰\"€H\0\"\Ñ\ÔG$Ë¬\r\"H\0 €H@\Äø|¾\Ñ~¿¿’H \0ˆ 1–e=«û…2\"H\0 €H@\Ä\ß\ê~a‘@$\0	@$ š\Z‰Mº½E$	\0D	ˆ¿\ß_\êóù\Ö	D\0‘\0D¢\ÉH\Ñm‘@$\0	@$ \Z‘øL·)D‘\0@$\0‘€hD\â¬nˆ\"€H\0\"ÑˆÄ¥@ ğ‘@$\0	@$ šb\Ë:-w	D\0‘\0D¢\ÉH¨|ğˆ\"€H\0\"ñğ\Ã_ú\"H\0 €H@\Ä$%%ı³\î®	D\0‘\0D¢\ÖxL·j\"H\0 €H@4…–9–eU	D\0‘\0D\"FK\Ä4\İ\'|J$	\0D	ˆfh\ã×º\"ˆ\0\"ˆDŒ\Ï\ç{\Í\ï÷¿C$	\0D	ˆ&#±]·\rD‘\0@$\0‘€hD\â€\ß\ï_F$	\0D	ˆF$>ñù|O	D\0‘\0D¢‰/t\Ë%ˆ\0\"ˆD#ı\Z\"H\0 €H@\ÄX–UÛ³gÏŸ	D\0‘\0D¢\ÉHÔ§¤¤ü‘@$\0	@$ \"ºu\ëö-vşD$\0	@$ *’’’n÷ûıuD‘\0@$\0‘€ˆ	¿\Ô\"QC$	\0D	ˆ¦>¢eY\çˆ\"€H\0\"Ñˆ\Äx\İ>\'ˆ\0\"ˆDŒeYóuû˜H \0ˆ 1>Ÿo•\îv	D\0‘\0D\"\Æ\ï÷¿©ûƒ­D‘\0@$\0‘€hj$öh™x…H \0ˆ MF\â˜eYs‰\"€H\0\"\Ñd$*t\Ë#ˆ\0\"ˆD#\ç-\Ë\Ê ˆ\0\"ˆD#—µHü‚H \0ˆ 1Z\"\êu»•H \0ˆ )\×I_ğMBH\0 €H@¤\Ã\Z¡[=‘@$\0	@$ b|>ß½º/¨%ˆ\0\"ˆDŒ\ß\ï\ï©û‚D‘\0h•\Ì\ÌL#­µ^½z(@$¼7´1R·3D‘\0h•\â\â\â6EbÅŠ\n	\ïe$f\é\ãÿ‘@$\0Ú¤OŸ>!%\"55U\Õ\Ô\Ô$@$<†eY/é¶ŸH \01e%^z\é%ˆ„7‡66\êVB$\\,r•¸j\Õ*5n\Ü8sEÙ³g\Ï&\'€@  222\ÔO<¡/^¬.\\¸@O!i©VBj#\ÈF\0\"\áÙŒÄ»~¿ÿwDÂ…\"QVV¦&L˜p•8´\ÕD,rss\ÕÁƒ\éq ¬¬µ€HxºF\â°n/	‰„\\N™2\ÅA$\ÑR“,\nhN¿~ı\ÈF\0\"ö\Ğ\ÆgZ$¦	—ˆ\ÄŞ½{M\Ç\Ş\\ú÷\ï¯,X v\ìØ¡>ıôSU]]m\Ş/·\ê½÷\ŞS¿ù\ÍoTNN\ÎU_›œœ¬v\î\ÜI\ïlŞ¼¹ñÿC†\Í\0	O‹Ä—–e\r\".	\éÜ›c>\ÜHÂ•+W\Âşœİ»w«1c\Æ4ùm›¤¯¡	v­\Ù@$<_#q\É\çóı‘p¸HˆDe$%%©µk\×F$\Íyıõ\×Í”>\ÆÂ¡%¤V¢{÷\î	2Wt»›H8X$d8C\Ä!x\ãğ\á\Ãq9\à?®\r\Z\Ô$3Á0O=õ”é¥\0‘ğ´H\ÈE\ç÷ˆ„CEB\Ò\ÊÁ5\"RóO\äó‚eBj&(ÀD\"®½öZu÷\İw›[d	o’ğ\Çr^ 	™<œ¯LDK™‰\àa\Çœ\Ş\È\ãa\Ë\ÃÄ‰‘	@$¼+ÿ$CDÂ¡\"!\ëD\×EHMD{\"5Áõ2¤Ş–ˆ¶@$Ü>u\×\çƒj\"\áP‘Å¦‚gg\\¾|¹\İÀ‘#G6~OY´\nˆ\æ¯K†\0‘ğ2\íS¦	Š„\ÔFOõ”)d!‚WÀ¬ªª¢WB\"\Za˜	o!Q\éóÁI\"\á@‘i˜Á–±LóŒ”\àE«do\ÖXºt)²\á‰–‰ë®»\Ì \Ş‰ô¹\à‘p H\È\\ö\É|Ñ¢Ez.[¶¬\É\Ú-eK\æÎkfw\È{Ø³\Ã;üu\"d&\0‘p7º_+›v	Š„\ì\âiŸ\Ìe\Ù\ëD†Q\ìï\Şø|ee¥š9sf“5-	\ïIDó¯\'3ˆ„«E\âm\ÙFœH8P$‚\ë#>û\ì³=e]‰\à:	©›\áY¬ª¥¿Xs\ÂùQWWg¶š—\Û\Öhş>j&\0‘p}±\å~\İ\Ï/\'‰\àµ½WG!\ß/’DÁùqë­·š\ÎWnC\ÉD¨÷‘™\0D\Â\Õ‰ú\"²€H8\\$:ƒHDb\àÀ&c!STe!«ñ\ãÇ›…´ddÎœ9\êù\çŸW………¦€T\Ö\ÂØ´i“*))Q»v\íR‡R\å\å\å\êÌ™3l\ÕI\Ã’ah\èxC\ÊD°DØ­oß¾q&@$º¬Hœñù|#ˆ‰˜2RX\Ù|\×\Ñ\à¶d\É5ş|5k\Ö,5m\Ú4seš——§F\Z¥†\r¦¬`v“”“VZZšJII1Ÿ)C\'2d<lb?–\×\ä=ò^ù\ZùZùù¬\ì\ìló\Ùò=\ää•ŸŸ¯|òIUPP`~\Ş^xA-_¾\Ül½~ızUTTdö‘aš£GªS§N©ó\çÏ·™\Êw»D„’„`™h\ëu†9\0‘p¥H\\\Ğ-@$¨‘ˆˆ\æ5‚d$\Ã\Ğ\ŞCò}$;!Y\n\ÉVH\ÖB²’Ål†d5$»!Y\Év\È\Ï$\ÙÉ‚H6D²\"’‘,IVV–)Z\íİ»·Ù¯Df™\ËKóm\Ô\åy)$•÷\Ér\áòu\"/ıúõs|Ö¥­ŒA(Y¨­­\rK\"‚¿³9\0‘p•H\Ôú|¾{‰„E¢+\Î\Úd\æÆˆ#®\r§\"\'D)y:v\ì˜Ú·oŸ\É\\HC2«W¯V/½ô’£³.S§N\r+SĞ’L|ó›\ß[\"š\Ë5€H¸¢Ø²^÷YA$(]y	ANT²c¨œ¡\ëf]t\'`Z¸‚–d\"‰`˜	÷Ğ­[·o5\ìüy\Ñp H\ÈUpg­l)W\×\á®l)B]\Ù\ÑUş\×n¿ıöˆ¾N†3šg\"\ä±<	<ğ€ùZù9\0	Gf#n\Õ\ç:\"\áP‘«\Ö\à?\Ùk¢!Ò©™ñ\ÎHÈ°\0\"\áX‘ø…>\Ô	‡Š„ i\ì\à\İ?;\"+1f\Ìvÿt©LtT„½\Ã\Z€H8^$2ô¹\à<‘p°H”••5)Ğ“ñóö\äõ\×_o2“A²\à\r™ˆ\ç¬\r§D\Âqú\\PA$,BpÑ¥LM<|øp»x2-\Åzö÷’l¸O&ZšM¯u$¤@”\Ù\Z€H¸J$\æ\é‹\ÙcD\Â\á\"!S\í]6\í\ÂK™ªO\äód€ı=\äû±†;±k‚Oöñ\\\ÙR¦« \î@ŸVZ–µ›H8\\$Y xˆCd\"^™	\ÉDK„|ù~\àaxíµD\0\"\á:‘Øª[‘pHkÖ¬i\"2\Ì!5±`JMDğp†4Y\Ã\0¼“™–	\É0„³ûgğûX/	W‹\Än\ÉJ	—ˆDK2a\Ï\æØ½{wDŸ#E”²*có%¢‘\ïe&b©i@\"\0‘p7–e}¬\Û|\"\á\"‘°‡9‚k&‚‡;d\Ìw\ß}\×\ì\Íaoô%·R!²!+V/6\\Áp™‰X†G\0	WŠD…>GŒ\'.	A\n!ƒgs\Ä\Òdv…•d&\"‘$	\Ïmœ×­‘p¡H\Ø\È:²r`ğ\n˜\á4y¿,6%{<\0Ø™‰p†9dŠ\'…•€HxF$jş‹H¸X$ld9mÙ›C²²Sğ\ä¶8\È.r){g°\ì5D“i°k*@$¼\ß\ï¯\ëÑ£\ÇmD\Â\"Ñœu\ë\Ö5J\ÄÆ\éU f™hiı	\0D\Âõ	%;€	Š„dl‘Å†\0¢‘	[\Z\Âö\0@$\ÜCJJÊŸ\ésH=‘ğ H¬Zµêªš²)v\â¾û\îcO@$¼9¬ñ3Ë²j‰„E\"--\í*‘\È\ÌÌ¤g¨2òÿƒD\0\"\á\Éa€n‰„\ÇDb\éÒ¥!gjlß¾\Ş\"Fşw¤˜\0‘ğ>Ÿo„>ş\Ï	‰DKU\ÙMö\Ó\0ˆYñô\ìÙ³	\ï‰\Ä\Óúøÿ„HxH$dúg[\ëG°z%D#•••	\ï\ÕH,³,k?‘ğH´–^F R‘(//\'€Hx¯FbƒnÛ‰„‹-m:d¢ˆù:v\ì\0D\Â{\"±\Ó\çó½F$<,0[\Ä*\"¥\0ˆ„\çD\ân¿&	\Ù*‘€X‘ÿ!ù_@$<\'\'u{’HxX$dC.\Ùs ¤ö¦´´”@\0\"\á1,Ëª\Ò\"‘M$<,\Òù\ËI\0 RRRXƒ	of$ª@w\"\áa‘Ø±c\"1“ššªŠŠŠ \Ş‰+IIIÿL$<,%%%\æj d\ÉõM›6@$¼\'\ê\á‡ş>‘ğ°H«^½zÑ£@Lô\î\İ[­_¿@\0\"\á!RSS¿\'\"A$<.[·n5ii€Xm\è×¬YC \0‘ğV6\ân\İêˆ„\ÇEB\ÒÑ’–ˆ…>}ú¨•+W@$<D xÄ²¬KD\Â\ã\"±a\Ã“–ˆ…~ıú™}\\\0	Oe$\èö%‘ğ¸H¼ö\Úk*==bbÀ€ª°°@\0\"\á-‘˜¢\ÛgD\Â\ã\"!\ã\Ú2¾\rƒ\rR/¼ğ\0D\ÂCø|¾\ÅZ$	‹\Ä\êÕ«	ˆ™Áƒ«\çŸ@\0\"\á!ü~ÿ\ït+%	)“B9€X:t¨z\î¹\ç \Ş\Z\Ú(±,\ë\r\"\áq‘X±b…\Ê\ÌÌ¤G˜\È\Í\ÍU\Ï>û,\0D\Â[\"±O‹\ÄKD\Â\ã\"!•öRq£FR3g\Î$€HxK$\Êü~ÿ,\"\áq‘xñ\ÅUVV=\n\Ä\ÄØ±cÕ“O>I \0‘ğ–HTú|¾\ÑD\Â\ã\"!Söd\ê@,<ñ\Äjò\ä\É	aY\Ö-\ÉD\Â\ã\"±d\É5p\à@zˆ‰	&¨üü|ˆ„·2µ~¿ÿ>\"\áq‘X¼x±Y\0 $!Y	\0D\ÂS\"QŸş#\"\áq‘¹ÿ²\0@,H}„\ÔI\0 \Ş !!\á›\r;^G4<.ó\ç\ÏW999ô(2cCfn\0 \Ş 55õo,Ëª\'ˆ„š3g\Z6l=\nÄ„¬!!kI\0 \ŞÀ\ï÷ß¯\Ûe\"H¨gyF\r>œbBVµ”\Õ-	\Ï\ÔGô\Ö\í+\"H¨‚‚5b\Äzˆ‰0Dˆ„·D\"O·\ÓD‘`l\â‚\ìü\É\ì@$¼ƒeYsµH#ˆ„š>}º\Z3f=\n\Ä›\"\á9‘X¡Eb‘@$˜¶q=[\0‘ğœHlñûıo	DBM™2……„ fØ	o¡%b—n¯	DBMš4I?bbÍš5*##ƒ@\0\"\ábË£–e- ˆ„\ÙAöI\0ˆ…u\ëÖ©ôôtˆ„wD\âs-ˆ\"ÁfK6mÚ¤\Ò\Ò\Ò\Ìıªª*uğ\àAUVVF`\0‘p\ï\Ğ\Æ9\İ2‰\"a†5dx \\D’““URR’\Ò‰’õö[jdº\0‘puF¢&ü’H ¦\ĞR\n.\"aÜ¸q!BšFee%DÂ½\"Q§/&n\'ˆ„züñ\ÇÕ´i\Ó\èQ â¬„¾\Z	)ò€H¸Z$Tß¾}ÿ€H jô\è\ÑjÆŒô(1²*j(‘8yò$DÂ¥t\ï\ŞıOõq\ÎÎŸˆ\Ä×Œ9R=ıô\Óô(UV¢¥\Z	–\\D\Â\İô\ì\Ùó§úX¯%ˆ„Avşœ5k=\nD\Å\âÅ‹¯‰\íÛ·@$\\LRR’¥¹H$	Cnn®š={6=\nD\Ì\à°%¢ÿş	—\ã÷û‡\é\ãı\"H†ª{\î9zˆ\ZYŒ\Ê	¹€H¸Ë²f\è\ãı\"Hrrr\Ôüùó\éQ &RSSM½\0\"\á~´D,\Õ\íC\"H¬şyzˆ‰U«V™Œ\0\"á‰Œ\Ä\ëúx\ßN$	Ã AƒLÁtmNœ8aŠ7oŞ¬\Şx\ã\rZM–ñ...VG\á\n‰\Øj$\Ş\Ñ\í÷D‘08P-Y²„¥‹KÄ¶m\ÛTEE…ª©©¡\Å\ĞNŸ>­ŠŠŠ\Ô\áÃ‡ù\ÇD\"úŒ\ÄA-¿!ˆ„aÀ€ª°°¥#™$\"¾2!™\0D\"\ê\Z‰OµLL#ˆ„!++K½ø\â‹ô(]9\é!\0ñm2\Ô€HD=´Q¥[‘@$ıúõS/½ô=JFNzœü	@$ºPF¢Ú²¬\"H233ÕŠ+\èQ\\ _}ù™úø\İ%jÿ¦|\Ó\ä¾<‡8 €H\ÄY$®\èv‘@$}ûöU+W®¤Gq¸Hœ¯úT\íÛ§öü~x“&\Ï\Ék\È\"ˆDEBV´ı!‘@$}úôQ«W¯¦Gq¸H|²ÿwWI„\İ\Ê÷¯E	@$\âÂƒ>øG\"D‘h$##C­]»–\Å\á\"ñ\áÖ§BŠ„¼†< €HÄƒ=z\Ü\é÷û\ëˆ\"\ÑHzz:û#¸@$ö½1>¤H\Èk\È\"ˆD<ğù|\'&&^\"ˆD#½{÷V6l GA$	@$ Mü~\İ\Î	D¢‘´´4³t08[$d–F(‘×D‰8‰\Ä$Ë²N	D¢Ùµq\ëÖ­ô(‰#%sBŠ„¼†< €HÄƒ\Ä\Ä\ÄEº}D$‰Fzõ\êe62g‹Ä™O÷ª}\Ç]=¬¡Ÿ“×D‰8‰\Äj\İ\Ş#ˆD#)))ª¤¤„\Å\á\"!\íXi\áU\"!\Ï!ˆ q‰mºm\"ˆD#\É\É\ÉjÇô(N‰K—Ô‘·\ç]=¬¡Ÿ“×D‰x`Y\ÖZ$^&ˆD‘(--¥Gq°H\ÈÊ•‡Kf‡¬‘\×X\İ‘\0D\"N‰2\İf	D¢‘={ª]»vÑ£8Q$.]RŸÙ¢>x}LH‰°›¼G\ŞKv‘\0D\"ü~e C$‰&\"±w\ï^z‡‰D[Y²ˆ í”‘ø\Ê\çóõ\"ˆD#III\êÀô(‰p²­e\'	D‰(ø‘‰\ËZ$ş¡@$šˆÄ¡C‡\èQ&\ÑJ„\İ	D‰!ñ\ÒQŸœœücÂH4\ÔÑ£G\éQœX#AC$ &®¿şzD\"|‰¨¿ö\Úk\ß\×\"¡¾ñoL$$ˆD‘(++£GA$	ğòğ«_ıJ%&&\îLMMıN7­K„n\Z\ç5{^	¿ß¯\Ê\Ë\Ë\éU	D<\ÇM7İ¤d]\İ\êu_øfJJÊŸq\ÚiU\"\Úz¼*§N¢GA$	ğl„\î–˜˜xD·:}ÿ÷?üğ÷9ı´)ö\ëc	\"¡*++\éQ	D<+6			ÿ¥e\â„nW,\ËZ¡‰h•±d&	#UUUô(ˆ\"	›¤¤$K\Ë\Ä)-µº|A\Å7‘ˆVe¢Ì„‡EB,\êüùóô(ˆ\"ˆD3tÿ\ØG‹\Äú¶FKÅ³ú©ëˆ_WGf\Â\Ã\"!+ ˆ !…\"W·óºU‰H5ˆD3‘¨««£Gq©H\ìŞ½\ÛLñı\Ã?üCu\Ã\r7˜\Ûx ñõ†´\É\×4N¶™¿ë®»Ô7\Şhª\Ü\ï¼óÎ°¾·ı9\Ò\ä{ÿ\ä\'?Q›7oF$Àq\"a#!2\Ñ ¹.–É¼,#\Óü}\ÔLxM$Î=kDb\æÌ™È„EBvuqø\ë¿şkõşû\ï›\ç<¨RSS#‰\Ûn»\Í<–=YNŸ>­²³³#	¹¿m\Û6sÿ\Ç?ş1\"	û\ä\é÷ûg\ÉpGÃ°GŸ\Î>Q¤§§ÿ(\Îq¨!6‡Z‘‰P\ï#3áµŒÄ¾}ûT\ïŞ½UZZšÚ³g=‹‹D¢[·n¦£Ü¸qcX\'ûP\ÏI6A‹„Dòı›Ü—¬†ıX¦§¤¤¨oû\Û\æùû\ï¿_;v‘€®.)À”BL)\È\Ô2ñ¹hvÖ‰B¤FÖŠB(Z\Z\ÎXœM!Áa·q&\'‰„ Ùˆ‚‚3ƒcúô\éd\'\\\"rr–ÿ¡\ê\ê\ê˜DBNğöğ\Ä\Ïşs5n\Ü8“™ˆD$\Ş|óMsÿ¡‡j|]2#òœ\È\Æqrÿ{\îA$À\"$ß‘©¢2eT¦_v‚Hˆ\Ì\È\âZõúv“\î\Ëo‰¡&¢%I–‰¶^¿†aŠ„t\æ\ÚhM¿k\×.zD¢1s0zôhu\Çw4¾v\ï½÷FT#akÈ¾.\Í¾\à&{ \à$‘°‘E¬d1+Y\ÔJ·’E®:P$\ä{*»5Å¢nİº}+\Ê\Â\ÊP²ğ0%‚\Ù^	;;1{öl“˜:uªª­­¥·qø\ĞFk_\ß\\6\ä¶ùDóº;;IF\"77\×Ü—ŒFó\ï-µ:\ÔH€\ÓE\ÂF–\Ù\Ö\'ñ\"9™\Ëò\Ûúş\İ *D“!±Q\Î\ÎhI&j\"ˆ\æ2AÍ„WD\ÂF¶\Ï\È\È0\Ù	9y€óDB\n,¥\ØR2ò7´‹-¥.Á~O=L‡0ş|óxÑ¢E\æñ£>\Úø¹¿}ûö\ÆÏ”\×%;‰H\ÈZ%·\Ür‹yl\ÏÜ°‡6FvEk	\è\n\"a#i‘\Øœ%\Ğh’9¸¢o/\ëÇ—ôıúş¹†¢\ÍÓºÔ­L?şH\ß\Ğ\ï\Ù-µºm“!Ÿ\Ï÷š¾]©\ÛRı…²¶…¾ÚŠH\Ø\í¢ş\Ú\'õ52\Âá†–d\"‰`˜\Ã\Ë\"a3w\î\\“˜4i\ëM8L$¤\ÉL‹={\Z¡a¹}ğÁ_?yò¤\Æ\ï~÷»¦s[)¾•\ç\í÷<ò\È#\ê?ø\ÉBHA†5dZi¤Å–“\'On2,r\æ\ÌÕ¿uó\Í77\é 	pƒH\ÕPü±>\æşH2Z\Üo\Ó\'õ{{\ì±ÿè¾µ§n™ú$?D2\"2#DÂ‚YxEß®‰™Ğ\ßi‹º‰l”5\ÈG[\"¡ºw\ïnÿ¾û#ü¾\ÑB&¢¦\áùHx½\ákÄ©\İc\"!È¸vŸ>}T¯^½Ô;\è}$4D:W$:¨F\"”@|¢\å#§…ap‡â‘˜\Êiİ£\"a³`Á“\È\Ï\Ï\';H €Htd†Fs°,\ë}Ÿ\Ï÷?QZÆ»Fb,—ˆDdff¦g—i{\àm‘¡–\Z\"ˆD‡‰\Ä\Ï\ZBŠ;\ß\×\í\Ö0¾¬#gm°8\"\Ñ2.4Ù‰ñ\ãÇ›J #AF‰§Gw\Ê,‘(£ji6E¼Ö‘Hf¶\"\Ñ&eeeª_¿~*99Y\Ó+!ˆ \Îblƒx®l9ƒ\Ó8\"K–,1Ù‰¼¼<u\á\Âz\'D‘\0D\Â9´\×^H\"\å\å\å*++\Ëd\'¶n\İJ…H €H8/3,®	o÷\Ï\à÷±^\";………f\Û\ê±cÇ’@$	@$œ•™ˆ¥¦‰@$\â‡,f4`À\0³Ò¦M›\è­	D	gf&¢D\">,_¾\Üd\'d\Ã\'Y\"	D	\Ç\ÕL ˆD\ç\";Gfgg«¤¤$µa\Ãz.D‘\0D\Â™‰p†9’)¬D$:Œ—_~\Ùd\'FŒav{D‘\0D\ÂÑ™	»¦‰@$:ŠŠ\n5xğ`“X·n½\"H\0\"\áL™hiı	@$:•+Wš\ìDnn®ªªª¢7C$	@$º¾LŒp\Ø‰ö¥²²R\å\ä\ä˜\ì\ÄÚµk\é\Ñ	D‰®]3!2Qt\r»x\"]Õ«W™6l˜:s\æ=[lŞ¼™“?\"ˆD§g&,\ËRH\"\Ñ%‘¡±€¦lÛ¶\ÍÔ— \0ñi2“H\ä\0‘ˆ\Ùe4!!\á;D‘\è²\È‡È„y\È\Ğ|\ÍÑ£GUQQ‘úüó\Ï8I\Ä\áÃ‡ù\ÇD\"r‘¨\ïŞ½ûŸ	D¢K#Å—R„)Å˜R”	ÿ+[¶l1)ù®\Údã¶®üóIC\"\0‘ˆI$\ê,Ëº•H @¦‡JvB¦‹JZº6rµ/iO\0D\Â\Õ\"q%!!áŸˆ\"\ádáª‘#Gš\ì„,h]Y‘\0D\Âõ\"Q\ëóù\î%ˆ„ã¥µ%;!Km\Ë7t=¤`‘\0D\Âõ\"Q£/\ì~I$	\Ç^ñ\Ê\æ_’X¶l\ébˆ\àI\0\"\áj‘¸hYV‘@$lK.Û“\Ë6\å²]9t\rNœ8H\0\"\á~‘øJ\çiD‘p<.\\PcÇ5Ù‰\Â\ÂB\ÒY%ò÷\0@$\\-gu@$	\× k+$\'\'«¬¬,U^^N@:‘ƒš:\0D\Â\Õ\"qF·\\\"H¸.;‘——g\Ò\êK–,! \ÄŞ½{	@$\\eY@`‘@$\\\É[o½e²ıúõSeee¤ƒ)--5ñ@$\\‘øT·\'‰\"\áZª««\Õøñ\ãMvb\áÂ…¤Ù±c\"ˆ„ûE¢Ì²¬g‰\"\ázJJJTJJŠ\Ê\Ì\ÌTÇ# ”’˜ ®‰ô…\ÚB\"HxY²9??\ßd\'\æÍ›G@\Ú\Ù\Ã\"55•@\0\"\án‘øP·B\"Hx.\åŞ«W/Õ§O3EÚ‡7ª´´4ˆ„»EbeY+ˆ\"\á\É\ìÄ¤I“Lvb\îÜ¹¤x\íµ\×Tzz:\0D\Â\Åh‰xW÷£¿#ˆ„g‘™’~\Ï\È\ÈP‡\" qdõ\ê\Õ&\ë€H¸:#Q¢\ÛF\"Hxš\Ú\ÚZ5u\êT“˜={¶ª««#(q`\åÊ•ˆ \î\ÏHl\Ñ}\ç›D‘\0Í®]»LvB\Òñ  1ò\ÒK/™5<\0	W‹\Äë‰‰‰Û‰\"\rH6búô\é&;QPP@v\"–.]ªú÷\ïO \0‘p÷\Ğ\Æj\İ\Ş#ˆ4cÏ=f\ÆA\ïŞ½Õ¾}ûH\Èò\ä$€H¸˜@ ğ[Ë²> ˆ„\ÈNÌœ9\Ód\'\ä–\ìDd\ÈJ¢\Ù\Ù\Ù	wg$~­\Û!\"H@+HFB2’¡L„\ÇüùóÕ!C \î\ÎHÌ³,\ëc\"H@\Ù	©™\ì„\ÔPh›9s\æ¨aÃ†@$\\Œ\îtû„H &2›Cfu\È\ì™\å¡™5k–\Z>|8\0D\Â\İCStûŒH avBÖ›ì„¬?!\ëPÀ\ÕH]É¨Q£ \î‰±º&ˆD¬„)+bJvBVÈ„¦L›6M=şø\ã	\ãóù†è‹ª/ˆ\"1 {uHvBö\î=<\àk¦L™¢òòò î®‘\È\Ô\í‘@$ FdQYZv•\İEA©‰\'ªñ\ã\Ç@$\Ü=´‘lY\Ö\"H@œX°`\ÉN\ä\ç\ç{>;!!2€H¸—@ \Ğ]\ËD5‘@$ ;vLeffª””URR\â\Ù8<ñ\Äfx\0‘p/–eıB‹D\r‘@$ •%;!W\æ\Õ\ÕÕûı¥\ĞR\n.	÷Ò³gÏŸj™¨%ˆ´eeef\Ì\ä\ädU\\\\\ì©\ß]¦~\ÊP\0DÂ½ô\è\Ñ\ãN}ÁTG$	hgd+\ÉN\È,†.x\âw\Î\Í\ÍU\Ï>û,|@$\\Œ¾Húqbbb=‘@$ (//WYYY&;±u\ëV\×ÿ¾²<¶,“\r€H¸Z$~¨E‚˜!Ğ‘ª@  Æ\ë\ê\ì„l\Ø5o\Ş<ş\à€H¸˜nİº}‘@$ 8yò¤\Z0`€\êÙ³§Ú´i“+\ÇAƒ©Å‹ó\ÇD\Â\åˆHŒ?şD‘€N`ùò\å&;1zôhuşüyWın4µ!\0ˆ„ûE\"!!á‰\"Ä©S§Tvv¶JJJR6lp\Í\ï%õ /¾ø\"`@$\\eYõ\é\é\é?\"ˆt2/¿ü²\ÉNŒ1B={\Öñ¿L{•\ß	\0‘p}F¢N_\İN$	\èTTT¨Áƒ›\ìÄºu\ëı»\È\Ş#+W®\ä\nˆ„ûE\âŠn÷	Dºr–ì„¬\ÅPUU\å\È\ßA¶X_³f\rL@$\\\ß\ï¿ü\Øcı‘@$ ‹QYY©rrrLvb\íÚµûù\Ó\Ó\ÓŸUDÂª‘¸¤/|!ˆtQV¯^mdBx:s\æŒc~î´´4µq\ãFş€€H¸h\ã‚n\"H@FBDB„B\Ä\Â	¤¦¦zbO@$‰\Äó–ee	D€qˆLÈ‡}tds²ƒ6©\ç\èÕ«—Ú¶m4@$\Ü?´Q¥e\"›H \à\äd-E˜RŒ\ÙUfE\È\Ï#‹Ò´\Ôd³2‘\êğÊ†e€Hx¬Ø²\Ò\çó&ˆ8)d”´L•i£\ÉÑ£GCŠ„\İ\n\n\nø£\"\áÎŒ\Ä)}a3‘H \à@dáª‘#Gš\ìDg/ş$i…’ùù\ÈF\0\"\á\Ú\Z‰O´L\Ì ˆ8YZ[²²Ô¶,¹\İÕ²d#\0‘pµH\Ó\"1—H \àpd\Ó/\ÙüK®ş—-[\Ö)?ƒlN6	\Ï\ÕHöù|‹‰\".A¶%—\í\Ée›rÙ®¼#Ù¹s\çU\"±`Áş(€H¸»Fb¿>Ö—	D\\„d\0Æk²………ú½e³.[\"RRRTMM\r@$Ü‘\Ø\åóùV	D\\HQQ‘JNN6[z———w\È÷Ü¼ys£H,_¾œ? \î\ÏH\ì\Ğ2ñ{\"H€‹³yyyf=‡%K–t\È÷\Ì\Ì\Ì4\"\á¤%½‰¨‹-·é¶™H \àr\Şz\ë-“¡Y‰²=)..Vİ»wgX	oˆ\Ä&‘	\"H€¨®®V\ãÇ7Ù‰…¶\Û÷yê©§L‡ü\ÄOt@$\\\Ï\ç{M÷)\ï	D<DII‰)„”!ˆcÇ\Å]\"®½öZu÷\İw›[d	\×g$Vê¶›H \à1d\Ø!??\ßd\'\æÍ›W‰°\åa\âÄ‰\È .G÷!\Ëd\n(‘@$À£\ìØ±\Ã\ì\ÔÙ§O³:e¼$¢­\ç	\×d$\év„H \àñ\ìÄ¤I“Lvb\îÜ¹q“ˆ\æ¯K†\0‘pHÌ‘e²‰\" JKKUjjª\Ê\È\ÈP‡Š‹D\Ø0\Ìˆ„;	\Ó-\Ë*\'ˆ€¡¶¶VM:\Õd\'fÏ­\ê\ê\êb–ˆ`™¸\îº\ë\ÈL\0\"\á\"´DLHLL<E$	€&\ìÚµ\Ëd\'\Ò\Ó\ÓÕb–ˆ\à¯™ 3ˆ„k†6F\êVI$	€«l\Äô\é\ÓMvB¶·³±PR3ˆ„«2ƒ´H|I$	€\ìÙ³G¥¥¥©Ş½{«1c\Æ4‘‘©©hm¤¥÷Q3ˆ„kD\"C‹\Äy\"H\0´)\"¿úÕ¯\Ô\èÑ£Ÿ»õ\Ö[M\ç+·¡d\"\Ôû\ÈL\0\"\á|ü\Z-‰\"\Öp„-‚d\Z:Ş2,v\ëÛ·\ïUŸKf	g\âóù\Ö\"q‰H \0mJDó“}K’,m½n\Ã0 ‰ÿ§E\â2‘@$\0\"’ˆ¶dB¦‘†#Áß‡\Ù€H8¤¤¤\Ö\"q…H \0KDk2ñ\Ío~3l‰h.\ÔL\0\"\á(‘¸\İ\ï÷\×	D *‰hM&\"‘†9\0‘p&‰‰‰¡[=‘@$\0\Z9~ü¸\éPo¿ıöˆ¾N†3šg\"\ä±<	<ğ€ùZù9\0‰®Mjj\ê÷´H7D \åŒD¸\Ãñ\ÎHŒ\Z5Š? \Î\à:D‘\0ˆix#^5ö^k\0\"\á¸\á\r™\ÖıD‘\0ˆX&\â9kƒÅ©\0‘p®Høış[ˆ\"ò$\ß\ÒlŠx­#QXX\Èl\r@$œ-õ–eı\"H\0´:\ì\Ğ<cÏ•-‡\rF‘p®H\Ô»ˆ\"\Ñ0G¼ö\Ú@\"\0‘p¼H\ÔúışŸ	D \ì\ÌD°LH†!œ\İ?ƒ\ß\Çz€H¸-5			ÿE$	€°3±\Ô4 €H¸.#Q­\ÛcD‘\0hw`·O@$\\)_\é–L$	€v•$	\×mœõù|ıˆ\"Uf\"œa™\âIa% ®\ÍH|¡eb‘@$\0\Ú%3a\×T €H¸V$*t\Ë#ˆ@\Üe¢¥õ\'\0	×‰\ÄI¿\ß?•H \0q‘	[\Z\Âö\0@$/\'´H	D fòóó•eY\ê¾û\îcO@$¼#Gõq?ŸH \01s\á\ÂÕ°¥0ˆ„G\Ğq\Ğ\ï÷ÿ†H \01s\æ\Ì#Ç\'€HxG$ö\ê\ãşe\"H\0\ÄLyy¹l\'L \0‘ğú˜/õù|kˆ\"3GU@€@\0\"\á­\Z‰\í–e½N$	€˜Ù·oŸJJJ\"€HxK$Št\ÛJ$	€˜)--U\É\É\É	o‰\Ä\İ\Ş&ˆ@Ì”””¨””ˆ„‡ú©“ ˆ@\ÌlŞ¼Y¥¦¦@$¼•‘xYfn	D fÖ¯_¯z÷\îM \0‘ğ–H\ÊZD‘\0ˆ™Õ«W«>}ú@$<„–ˆ~¿ÿ#\"H\0\ÄÌŠ+Tff&\0D\ÂCh‰˜•˜˜XF$	€˜Yºt©\êß¿?\0D\Â[\"1Uv\0%ˆ@\Ì,Z´Hegg@$¼U#‘§[‘@$\0bfşüù*\'\'‡@\0\"\á-‘\È\Õ\í\"H\0\Ä\Ì3\Ï<£†N \0‘ğ\Ö\ĞF-g‰\"33f\Ì`ûp@$<†\Ï\ç\ë¥E\â+\"H\0\ÄÌ”)S\ÔØ±c	 \Ş\Z\ÚxL·j\"H\0\ÄL~~¾š0a\0D\ÂC$$$ü—\ß\ï¯!ˆ@\Ì\ä\åå™¬\0\"\á©\Z‰Ÿ%&&\Ö	D fÆŒ£¦OŸN \0‘ğ\Ö\Ğ\Æİº]!ˆ@\ÌÈŒY³f@$<Djj\ê\ßX–UO$‰ÿ¿½û\r±ò\Ê8}Q\ÊÊ²,H\è‹%oJ^”¼+”\Ò@\Ê\ÒBc\îs\ïü\Ñ13cŒšhş*j´¦ùG\ÒD\Ò&nLLóO2Å ‹h‹±Iqw-#qD6A³¥\ÉLf\ãtm\"jFOŸ3hxœ¸:÷\Şqf\î=Ÿ<dY–øe\ï½\ßyÎ¹çº\İÿıaÃ†\rHkicV¹\\B\êOµ|õ\ÕW\r!‘ü 	³P¿Å‹‡·\Şz\Ë \éí“ˆ³û“P—…†\Ş\Ş^ƒ@H$³g\Ïşc“P—°m\Û6ƒ@H$&n¶œ;wîŸ˜„€ºtuu…;w\ZB\"½\r—£---7›„€ºÌŸ??¼ÿşûHoi\ã|[[ÛŸ›„€ºÌ;7\ìİ»\× \é…\Ä\ÙR©ô\×&!$ .¡¿¿\ß \é…Ä·yH\ÜnB\ê\Ò\Ö\Ö:d‰ô6[\Î_ÿ™I	¨;$9b‰ô\îHœÌ¯»LBH@]*•J8zô¨A $\Ò‰ÿË²\ì^“P—x(\Íğğ°A $\Ò‰\áüZnB\ê‰“\'O\ZB\"½øm–e\ëLBH@\İ!1::j‰ôB\âXÏ˜„€šŒŒŒ…‰$C\â³üúg“P³\'N	„Dº!ñ›ü\ÚdBj644$$‰Ê²\ì£J¥²\Ù$„\Ô\ì\ÓO?\r­­­Hó\ÄÁü\ÚjBjöñ\ÇHB\"É\èÏ¯&!$ f¡½½\İ i†\Ä\Ş,\Ëş\Ã$„\Ôlß¾}cOÿ!‘dH|_¿4	!5Û³gO˜7oA $T©Tş-Ë²>“P³÷\Ş{/\Üu\×]HP©TÚ–\ÇÄ€I	¨\Ùö\í\ÛCww·A $”eYo¹\\şµI	¨Ù»\ï¾,X`‰4—6ş%‰#&!$ f›7o‹-2„Dšw$6\ä1ñ©I	¨\Ùë¯¿–,Yb‰4C\â\Ë\åò\ç&!$ f7nË–-3„D‚Z[[ÿ!‰!“P³_|1<ø\àƒH3$V\æ!q\Ü$„\Ô\ìù\çŸË—/7„Dš›-—\å\×	“P³§Ÿ~:¬^½\Ú 	*—\Ë=Y–}cBjöøã‡µk\×\ZB\"ÍhÍ¯S&!$ f1\"bL€Hr\Ä\ßeYö­I	¨Y\\Öˆ\Ë $’\Ü#ñ7ùu\Ö$„\Ô,n´Œ.AH¤\'Ë²¿(—\Ë\çLBH@\Í\âW?\ãW@AH$–‡Ä¨I	¨\ÙÒ¥K\Ç¥!‘®®®Ÿ\ä1qÁ$„\Ô,\É!‘;\ï¼óG\år\Ùü„\Ô\î{\î	\ï¼óA $\Ò‰?B\ê\Ò\Ó\Ó¶n\İj‰DÅˆAaBj\Ò\İ\İv\ì\Øa‰„C\âö\Ûoÿ±I	¨\Éüùó\Ã\îİ»\r!‘nH\\\è\è\è¸\É$„Ô¤³³3\ìÙ³\Ç ‰ªT*£---·˜„€š\ä‰„¾¾>ƒ@H$*Ë²s\í\í\íiBj’¿„ƒ@H¤»´q6•mBj\Ò\Ö\Ö>l‰tC\âL©Tº\Ã$„\Ô$ÿK$\ZB\"İ¥Sùû@»I	¨9$†††!‘\îf\Ëoò\ën“P“øò¯¿ş\Ú \é†\Ä\ïJ¥\Òı&!$ \æ1„DºK\Ç[[[Wš„€ª…‰¤7[~Y©T7	!U;yò¤@HX\Úø¼T*=oBª6<<,$–6ş§µµõg&!$ jGû\Ö‰¤—6\ä\×&!$ jG;\n„D\Ò!ñ\ë\Ö\Ö\Ö5	!U;tè@HX\Ú8P©T~nBª\Ö\ß\ß?ö\Ğ.Iß‘Ø—_ÿnBª¶w\ï\Ş0w\î\\ƒ@H$¬R©ü\"Ë²ÿ4	!UÛ½{w˜?¾A $Ò¾#±;¿ş\Ë$„Tm\çÎ¡««\Ë i‡Ä,\Ëö›„€ªmİº5,X°À i/m¼›‡\ÄA“Pµ\Ş\ŞŞ°p\áBƒ@H¤}G\â\íüú\Ø$„T\í7\Ş‹/6„D\Úw$^\ÍC\â¿MBH@\Õ^yå•°t\éRƒ@H$,Ë²\ÊCb\Ğ$„Tí¥—^\n<ğ€A $\Ò^\Úx:¿™„€ª­_¿><ò\È#H;$ş>¿~{q™cV~ıUKK\Ë-&#$\àš}öÙ°r\åJƒ@H¤³bV–e§óp8—_£ñé¿¿\ç\ÚcZB®\é‰\'kÖ¬1„DZw ~u•€ˆ×…®®®Ÿ˜”€kZ·n]x\ì±\Ç!‘\Ø]‰üº\Úİˆ~S0!«W¯O=õ”A $Ò‹‰Ÿÿ¾È²\ìOMHHÀ„¬X±\"<÷\ÜsHğ®Ä•öH\ÄGŠ›€	{ø\á‡\Ã/¼`‰µ¶¶şl|H´µµe&#$`Â–-[^~ùeƒ@H$\ê\â78.…\Ä\ç&\"$ *÷\İw_Ø´i“A $\Ò]\âXv)$\â6!UY´hQxû\í·\r!‘ö]‰oòˆ0C!W÷\Å_„Ã‡‡\á\á\á\ïş»»\ï¾;lÙ²\Åp‰¸\í¶\Ûş¨\\.¯¾x–\Äñü\Z·O\â|~ıo~\í‹{(:;;hjB\Æ<ù\ä“W;€&n²\n\í\íí—…‰\æ¼§U\æqpö\Z‡Q]v\Åó&²,û(›mŠB‚Ä:u*\äo\"W}\ÓXµj•A!$š\ìD»®õÚŸ\àµ\Ï\n!A\âyæ™«¾Q\Ä\å\ÍaÎœ9?­T*gÆ¿\Î\ãŞ¨7†¾¾¾p\ìØ±p\æÌ™±9\Æ~õ\ÕW\á\Ã?o¾ù\æØ·º®p\Î\Ä\éR©t‡\é\n	C!nªºRD\Ä\ã²AH4\Í\Êî¶¶¶\ËœŠ\ç\Æ\ÄH8şü„g{ğ\àÁ±ûGşó×™² Qqù\âJ!aoB¢y\"¢¸”÷?\íØ±£ª€o×®]¡³³sü\İ	1!$H\ÑÀÀÀ÷\"bÃ†\rƒh’\åŒ<\".—1>ù\ä“I™ógŸ}\î½÷\Ş\Ë\îLX\æ$ªøfÿZ1„Dl¬,î‰ˆ÷<L¦øóŠ\ïqÏ„\r˜B‚:t\è»7‚õ\ë\×B¢9–4vÿ@˜¬;Wº31n™\ÃcÇ…)Š‡Q\Å7¡¡!\Ã@H4¸xNDq_D\Üq=\Å=\Å\åÑ¸¤\â£^HĞ¤\â²Å¶m\Û\ÂÚµkCOO\ÏØ¡S\Å7€ø\æ\Ó\İ\İÖ¬Y^{íµ±ó&@H4–x\ØTñ\ÛgÏ½\îs_¾|yq‰\ã#õB‚&3888ö•\Îñ\áp­+†\ÅC=4vœ6‰\Æ\ØQ<±2~\Ås*—H\ã	˜ù5\ËÇ½ I\î@\Ä\ã°\'\ã$»x—\Â\n„ÄŒ\ß±®¸Á²¯yV«xhU|6‡{!Aƒ‹!Ì›7/L\æIv¡¿¿\ßp3wY\ãW—^¯›6mš\Ò\ÙoŞ¼ù²#´}\Ü	\Z\Ø|ğ½eŒ\É:\É.†\é)¡‰\Ç/½V\ãS)¾¿\Ş\'Nø¸4pDL\ÅIvb!1ó\ä\à\ß\íøò\Ë/§töñfñ\ä>\î…\r(.g\Äp˜Š“\ì\â	\Ë‰wG\â»\×\è¥eË©_ñ÷û¸4˜¸±²¸\'b*N²‹{&lÀDH\ÌÌ˜BBH\ĞÀ\â·3¦\ã$»ø\à/\îH¸#!$h`ñœˆ\é<\É..©€°G\Â	!AƒŠ‡MM\çIvñ\Ğ*¾µ\á[B‚÷F¿\ê9\'\ÙÅ»!\'Nœğ/!1ı!\á	!Õ‰_Ãœ	\'\Ù\Ågs€˜ö¥§¦\ëı`\éÒ¥N¶4¢ø\0®™ğH<B„\ÄôŠ\ÏÚˆû<kCHÀ„Å§xÎ„5Ñ®®.ÿ23cy£¿¸gj*\îJOÀõôO!Aƒ)î˜\Î]\ÚqŸ‰\é\×\Ò\ÒrKşš¼0]\ß\âš3g\ÎO}\Ô	\Z\ÈLú\Ş8‰™·\éòzŸ+3\î\á€ı¦/$h\àHñ÷ƒø¾\Î\Î\ÎfYvúzŸt»dÉ’\â’\Æ\éø{M_H\à„;‰&P*•\î(.qLö³wŠOü}¦.$h@öH€¸JL<RŒ‰\Éz\Zğ¸\åŒx7bi	\Z”om€¨&&.}›\ã\àÁƒU\Í6~\Åó\ÑG½, \â\ÏB‚\ç	Y\æ(\î™(.w\Ä÷ıû÷\İÑ¼´<\Zÿ\ï8\ÆØˆ¯ó\âaS\Å=–3„M ··7Ì„“\ìœl‰˜ù0‹\ß\æ¨óê·±RH\Ğ$\â³6ŠOşô¬\r„WÏ™È²\ì@ñÌ‰\\ñ\Ä\Êx\ØTşzÿ[S4™U«V…\é<\É\Î\Ó?\'§}ñ\Ùñ.\Åñ\â#\ÈG]Ÿˆ\àŠ\Ï\Îpìµ ‰\r\Æ}˜®“\ì\â\İ	 $h`\ÅM—Sy’]¼B„\r\îÔ©S¡££#L\åIvñ÷\Å\ßB„M ¿¿ÿ²%\ëy’]ü=ñ÷\0!AÙ¾}ûe1q½N²Û²e‹a#$@HBLL\æIvñ\çŠ„	X\æ(î™˜Œ“\ì\âÏ³œ\0!A\"\âF\È\â·9\ê¹\â·3l¬DH€ Añœ‰+V\\v\æD®ø¿‡M\r\"B„©‹\Çi\ÇgsÄ»ñ©¡\ÅG_\n‡ø\Ïø\0®ø\ì\Ç^#$@H\0	\0	\0B„€\0! $@H\0 $\0	\0B„€\0! $@H\0 $\0	\0B„€\0! $„B\0!B@H€\0 $\0„	\0„B\0!B@HÀ‡Ä™3g¼\Ú&Ù¹s\ç.	š\ŞM7\İtaÿşı^ñ\0“\ìÀ§ò·Ù³>ihj7\ß|óG³g\ÏöŠ˜d7\Şx\ã\ïò·\Ù}>ihv³n¸\á†oo½õ\Ö}}}Î;\ç\ÕP\ÇrF¼q1\"F\â{¬’ˆ‰ü\ÚsñÿôÁ\år¹\\u]q9£_D\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0uûÀ¼ŒL\Õ6m9\0\0\0\0IEND®B`‚',1),('11',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0>IDATx\Ú\í\İpT…\İ÷qohulyœN\ë\ë82\ã8øøv\ì\Åj¬¯¢Ã£M²\ç\ä\ìfa-Š‚\àBµj•G[¥EQxµÚ·¢¢V @ b\ä&&$ ÷„\Üö¼ÿÿö,\Ïr\ÙM6{\Î\É~?3ÿ9›\İ\r—ÿ^~û?{.}ú\0\0\0\Z÷\Ür»hşúf-½ÜºöŸ°¿‰\İ\ïù\å¶xBê¶‡g¯nWü~\â\Ïz¿I/¯k\Ëwù÷¬°\é6\0\0i A»iÍ¾–C²ü?Rÿ­Aüû767şñı\Z\Âó¥şM\ï·bGı\Ñÿ|ñ\Ó\r\é)ó¾¨ÿü\n[=ş¯ol’\ëÿ\áüy\Í.«\Û¿_¼ô~ºŒ\ß\0\0t\Ó;Ó€?ó_¡ü\Ğ2Uÿk\Úş·\Äû½Q¶ÿøø™+\å~%§M\èbX«†\ÔZsË›¾y\è/¥-\Î\Ïw\Òm\0\0ºHCu\â‹k\Z%Pß…°†ö¬¢zù©÷¿jĞ¥\Şo\Ò+k[\Æÿ+ \ËU\Z\'Á­a<N¦\ï‡g¯\Æ\ï—ğ\ç\é\êõ7¦ım\Û	½ş[\Ûş|‡mA\Ç\0\è&	\Ø?8kuô¡Y«¢\êjğ\çV\Ø\Z¸\ïn8|üÁ¿®ŒNz\å³f\ç~?Ó \Ö\åC]\Õ\Ëz¿ÿ|ù³f¹®T§ôøŸ§—u©{ü{\îiÿw\Ë	V—\0/}\ÖP\å¬ò6\Æ%|‡­ık/9µ‘™s¿şzŸ5ÀI}\Â«£\ZÎ‰÷‹_~}‡]©K\'\Ğû\Óq\0\0º7u÷“q¸\Â	\Öy“\æ®kşÓ’#7{\åşº%_8\æ\Ü÷9“÷¼?ü¿\Çd9Jƒ{¼\Ô\Ô›\ë\ä\çOûõO\á\ÎÏ£¤–\ë\Æmt\0€\î‡÷ÿ\Ö\àÿ—•\Ñ|{hÂ‹Ÿ¶|öM“nu¾ò/¥\'jtµ¸\\~@*¬«¿5¬\'½´¦åµ²šº¿¯ûöÄƒ/|ğßŸ¶L™ÿ¹†ÿ[‰Ş¢ıönù¹¸¸\ŞŞ¡»“=¿ü\ègcµ\è<\0\0]\ï×¤K]­a«¤\éwØ‰ûp\Ëm´\Øö\îG\íZ¹ü\Ûß¿¹±i||ó\çÿ§Ä¢\Ö\Ş\Ä9k\Zyá“¦\Ö\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 cô¤=‹/~{\æÌ™\ÇgÌ˜}è¡‡\ìH$b\Ø\áp\Ø?~¼=u\ê\Ô\Æ\éÓ§\ï;v\ìƒt\0\0—|ó\Í7¡ùó\ç}\à\ìÑ£GÛ¯¼òŠı\É\'Ÿ\ØUUUv}}½Ànll´kjj\ìµk\×\Ú,°\ï½÷^ûşû\ïN<y•eY\è\"\0\0™™´,_¾üÀ˜1cl™´\í7\ÆB:Y¶L\éöˆ#l™Ò§\ÓQ\0\0zx\ÚşóŸÿ7nœ]^^nwÇ–-[\ì±c\Ç\Ú÷\Üs\ÏşH$ÒŸ\î\0fÇ;u\êTû¹ç³=j§ƒ®^\×?\ï¾û\î;\Ìjt\0\0\Ò<qkp?õ\ÔSvss³n³f\Í\Ò	üÛœœœ~t\0€n\Ò\ï¸uU¹N\È=\ÜqúÓŸ\ì\Â\Â\Â=t\0€nÒ\Óô;\ît­*\ïhú½÷\Şµ,k]\0 ‹tu¹nU®[”g‚n\Ä\n…Zøş\0€.\Òı¸uw°Lz\ì±\Ç\Z\n\n\Ñ}\0\0R¤GN\Ó°dj\êûò\Ë/m™¼›\Øx\r\0€-]ºô==rZOn¤ÖH$\Òbš\æ\0\0R \Ç*\×Cº\á\ÙgŸ­+(((\åQ\0\0 z’=V¹>şø\ãf	\ïJ\0\0R gÓ“Œ¸\áÀQ	\ï\0\0R §óŒŸ,\ÓôD\'zJQ\0\0R \á\é&\Â\0€\r6\Ì\Í\É;Jx\0¢|Ğµ\ï¼kjj\Zù\Î\0€M›6­Á­­\Í/^\\\Ã\Ö\æ\0\0¤\è\ÑG\İ\ã\Ö~\ŞS§N­f?o\0\0R4v\ìØ»\î½÷^W°¦‡G\åk\0\0t-À[2}ló²²2]eÎ±\Í\0\èŠ)S¦¬xú\é§3\Z\Ş#G¬\æ¬b\0\0tQ$\é÷\İwG+**2ÜŸ~ú\éº9Ÿ7\0\0\İpÿı÷O3fŒ}ô\è\Ñ\rîººº–`0\Ø(Á=®\0\ĞM÷\Ş{oÕ³\Ï>Û“¯E\å\ï¨1Ms\'\İ\0 \rt\ã1™ÀÌœ9³\'<:yò\ä¯u¿n]MO·\0Hc€9²\æ¿ş\ë¿\ì\'N¤mUù}÷İ§¨Uò=7\0\0=\à\ápx\ç¨Q£¢6l\èö\Æiú·®*g\â\0 ‡\éFe………\ÍÓ¦Mk\ÒOeUúºu\ëjõ;tg«r6N\0 StZ–©ùM‡\Z1cF\İÊ•+›«««[ô|Üª¡¡!ª\'Y²d\É=\ä©9MC[÷\ãf59\0\0.’0KK\í‘@¯\Ó\Óy&Tƒ~§-U¦‡<\å\Èi\0\0x;Ô£\ápø2:\0€Â»\Ñ0Œ›\é\0\0ş	\ï\ã\Ş\Ã\è\0\0>aY\Ö	\ïIt\0\0ÿLŞº\Ûst\0\0ÿ„÷&	\ï\×\é\0\0ş	\ï$¼—\Ò	\0\0|Â²¬w¥\Ö\Ñ	\0\0|\Â0Œ—$¼·\Ñ	\0\0|¢  \àq©*:\0€O˜¦9F\Âû0\0\0À\'Ã¸SÂ»N\0\0\à@\à:	\ïf:\0€\Âû\"=³\0\0ÀG4¼õ\Ü\ßt\0\0ÿ„w‹Ôµt\0\0Ÿ0Mó¤n¸F\'\0\0ğ\Ï\ä}X\ê>:\0€Â»J\ÖB\'\0\0ğOxo\×Ã¤\Ò	\0\0|BOL\"\áı\0\0À?“w±\Z”N\0\0\àÁ`ğoŞ›\è\0\0>aš\æs\Ş{\è\0\0ş™¼\'[–u€N\0\0\à†a“\Éû8\0\0À?\á}³„w#\0\0À\'LÓ¼\\\Â;J\'\0\0ğ‰¢¢¢³õ\Ìbº¤\0\0ø„N\Ş\ápø2:\0€Â»Q¿û¦\0\0ø\'¼\ëV\çt\0\0Ÿ\Ğı¼%¼\'\Ñ	\0\0ü3y\ï\Ñ#­\Ñ	\0\0üŞ›$¼_§\0\0ø\'¼?’ğ^J\'\0\0ğ	Ë²\Ş\Õóz\Ó	\0\0|\Â0Œ—$¼·\Ñ	\0\0|¢  \àq©*:\0€O˜¦9F\Âû0\0\0À\'Ã¸SÂ»N\0\0\à@\à:	\ïf:\0€\Âû\"=³\0\0ÀG4¼#‘H:\0€Â»E\êZ:\0€O˜¦yR7\\£\0\0øgò>,õ{Ë²n !5Cj \0ÀdÂ A]-A}Hw“\êwŞ­ª9\'\'§\İ\0À$´h8·Ø§J}=\0ÀC$ \çt\Şùùù·\Ğ%\0\0¼\à\ÇÚ™ºw\Ò\0\0<(\n™m…·~\'Nw\0\0ğ(™²·´\n\ï&6T\0À\Û\á=P;qkóº\0€\ÇY–µ0Ş¡P\è\'t\0\0\Ó\Õ\äÜ:\Ó\r\0\0|B‚û\Â\0€¶m÷Û¹sgeYY™½l\Ù2{\éÒ¥Tª¸¸\Ø^µjUTj\Ï*\0@\Ò\à.--µkjjì††ªU[[k—””D%\Ègğ\Ì\0ô¸	\îô¸L\â\r<³\0\0=FW•º\é-]\Î3\0\Ğc4h\\\Â\0\Ğ\Ãûø\á*{\ç\ÚW\ìŠ\â\ß\ÇJ/\ëu„5\á\r\0ğ`x;´\ÏŞ´xª½\áıGN+½No#°	o\0€\ÇÂ»²\â\İ3‚;^{+Ø„7\0Àk\áı\åŠ?¶\ŞzMx\0<Ş›–µ\ŞzMx\0o\Â\0€î„·n]\Ş^x\ëm6\á\r\0ğXxo_=³\İğ\Ö\Ûl\Â\0\à±ğ>¸o£½iÉ´3W™\ËuzMx\0<\ŞZ»\Ö\Í;#¼õ:Âšğ\0x1¼O´·<\ë\ÌU\ær\ŞF`\Ş\0\0…·Am\Û\ê\ç\Ûı\Î[o\ã(k„7\0À\á-u\Õö\åöNn7¸\ã¥÷\Ñû2…\Ş\0\0—Â»³i›)œğ\0x,¼“™¶;š\Â	o\Â\0\áğ\îjpÇ‹ğ&¼\0oŠğ\0Ş„7\0\0„7\á\r\0 ¼)\Â\0@x\Ş\0\0Ş„7\0€ğ&¼	o\0\0\áMx\Ş\0\0\ï‡÷’%K\ì_ü\âöù\çŸ+½¬\×%\ŞGşºXıò—¿<\ízı9~[gOü~Z\çœsı\ïÿş\ïö²e\Ëo\0\0\áJıóŸÿŒ…iNNı\Í7\ß\Ø\Õ\ÕÕ±\Ëz]b€\'oyyy\ìºõ\ë×Ÿv}²á­—KKKc—/»\ì2\Â\0@x§RñÉ¹¬¬\ì\Ôuz¹õ”^\ÊGŒ»nÔ¨Q±Ÿ»\ŞñŸ\Ï;\ï¼S?\ë‡¡C‡\Ú\ßù\Îwb\×\ßz\ë­ö®]»o\0\0\áXºúºuğ\Ö\×\×Ç®\ÓUè­ƒwÑ¢E±\ßÙ¸qcl©?w%¼W®\\»|ûí·Ÿº=‰Ä®[½zµ½yó\æ\Ø\åë¯¿ğ\0\Ş\İ	o½|õ\ÕW\ÛŒ-Ûš¨“ùÎ»³\Êü«¯¾:u»NÛ­\ïs\ÖYg\Ş\0\0\Â;±â«½×­[w\ÆjóŸı\ìgm†÷œ9sb—uÙ•ğ\Ö\Ë?üp\ìò¯~õ«3\ÂûÈ‘#ı\Î{øğ\á—Z–5º  \à5\0\0W\Â[7J\ÓÀ\Ô\ï—kkkO\Û`m\áÂ…\í~_\İ\Ñw\ÙÉ„÷±c\Ç\ì\Ä~oq_m>q\âÄ¤¿3\ï\è\çt„·†µa$¬\×Hh’¥\íT%\Ï@\0€+\áp\İ8->ù\êªôyó\æ%\Ğ}º¸Á\Úşğ‡\Ø\Ï7\Şxc\ì\çƒÚ£G¶¿÷½ïµ¹{&\Âû\í·\ß\Ö`#µAÂº1!¬O+\Ó4?\ä\0p-¼K§\Ş>	«Ä³©\ê\ê\ê\ì\Â\ÂB»½ÀN¬üüü[x\0<Şº±š<\å\â‹/\ÎønZ^(\İ\ï]\ÂùR\ÑÂ»…g\0À3\á\İ\İ\ÒU\ïm•\ß\Z\n…~\"!}¼ƒ\Õ\æ5RK-\Ë\Z7dÈ‹y6\0|Ş½\é\Ø\æ\Ì$¨«\Û\ï\Ï\ä¶\'t#6	ğ£\Îu\Ç\åòz©Á`p\ÏN\0\0\á\í\â®b\ZÊ‰\á­Áx{$\é\ï\ì>öÜ·ZJW¹7\Ér§\îR&a[TTt6\ÏX\0\0\áÁı¼%€g9\á\Í\É\É\é\×\ÉC\ÓW\î›\Üw®„ú6Y68^+Ul\Æøp8üÁ\0@xS=|	\à:Mwå±’\ß(Áı¸„ù§R§Vµ\Ë\å\Ï%ÌŸ‘\Ë\×òŒ\0Â›\ê#¬%1u\'eğ\àÁß•Ğ¾G\ê=	\î*İ‚]WµK˜ï’ ].ç³ª\0o\Ê\ã\Ç6—\Ğşµ„ùK\Ü[uU»®¢—0? \×/—\Ë\ët<\ë€ğ¦<|b’H$rE0|T‚»Lêˆ³ªı„„y¹ùŸtw6^\0@x\Ş>«X ¸P\Âûn©ER\ß\ÄWµK\í–zC\ÂÜ”ûœ\Ë+\0o\Â\Û\Ãd¿U\Å.\ÓøYt¶j? µBO¨’››{	¯\0 ¼	o“ğ¾\\jº³ªı°s˜\×:=ÑŠ\\ÿœ,¯\ç•\0„7\á\ía#G¼@ûw2…¿#\Ë}Îªöf©=2µÿ]–AVµ\0\áMx{œù\Í2…Ï–\à\Ş,\Ëøªöƒ\æ+\å¶IC‡ı!¯.\0\è!Ë–-#p	\ïn‡Ã—ƒÁi\à«%\È\ÅWµ\Ë\å/d9³°°ğ\ç¼\Ú\0 MJKK[jjj\İ4\ÕŞ½{÷Hx7dûóJWµ\Ë~—÷\Û\à{\år|Uû\×zºTù¹0]«€¬³|ùò\ÇKJJ¢û÷\ï÷|0<y\ÒóÁ]\\\\\Ü$5ƒgÖ™$°o’ AªB¼Ş™Î¿•Z%SûdYşˆ.@’$l¦Ë´x\\W÷zµ–,Y;——ÿ:q\Ü\É>|ø¥ò˜N‘*•`ÿ\Ö	s\rõMğ5\ãFº\0>§\á­\Çó¦½“®F—\Ç8,¡ı–„y¥³š]«R~^(\×cU;\0øŒn\Ñ\ÌV\Ì\ÙEBû\Âu\Z¯j—\ëtƒ¸¤¦\êôN—\0À\Ûo\ä-yyyWÒ‰\ì¥Şœ\ï\ÇW9ß—\ÇVµ\ë÷\èú}º~¯N—\0ÀCt*\'\Ò@\"]®[®\ë\ìÎ–\ì\Íú!O·p\×-\İu‹w\İòN€{\áİ¨¡\èˆ\îS®û–K€o”\ÒÃºF}\ÏW\ë¾\èºO:]€Ì…÷Iyó½ƒN zby\îL”*Ñ£À9Gƒ;)õ¥L\æ/\æ\ç\ç\ßB—\0 \ç\Âû„G›N ;ô8\ìÚ–„ø›z|vg‹v=ˆ\Ì>¹ú]¹~„:•N@\ZÈ›\êQ=5@|0¼\Ş9c\Ú\çjQ\çŒjez†5=\Ó\Z]€.\Ğ]„¤\Æ\Ñ	d\à¹6@\Ïe®\ç4\×s›\ÇWµ;\ç<Ÿ£\ç@§K\0\Ü\ä]«»	\Ñ	dZQQ\ÑÙ¡PÈ”\à~Cj·T“s¼öo¤\é\Z!Vµ@\ä\r²J\êq:/°¾NüYyN–\ËK\İC\á{DWµ\ËõE\"‘+\è\0Â» \àk}³¤ğ¢p8üy~>$\Ï\Óeº–\È9\Z\\ƒ,·\Êòe	û\ß\Ğ%\0\Ù\Ş_\éQ´\èü@Wµ\Ës6_³¯Kx\ï\ÒU\í\ÎV\íUòóû†a\ÜÃ±úôzº±¼\é½J\'\à\ã \×Jh?#\Ï\ã\Ï\åòq]\Õ.—J}ª_	qø_\0½1¼7\êCt½Å!C.–0/\Ï\ëb©Zg«ö	óm²œo“»õ¥S\0ü\Şkõ \Zt½•®j—ÀÎ•\à~M¿&\ÒCk KU\Ë\å\äù?:‰ô§S\0|CM-µ„N ›H˜’zZûŸ\ÅWµK\Ó³²|2\n]E—\0xyò^.“\ÇJ:l.’\Ğ«d\å5Q\ãl\Õ\Ş(\ËRó\ÃÒ‡U\í\0<4y û\Ğ\Ò	\à4}õ„=òÚ˜/!®\Ş\è\Şu¿\Ôb	ø1\Zø´	€+\äi¡n¥K\'€I`_-õ”¼^\Ö\é*v]\Õ\Îy\Í¸5y¿&oHtHùµcsøV\0®0\ã%İ…†N\0)‡·~/>€N\0p\ã\rh¦\Ô.:¤Şœ\Ö€+twy\ÚK\'€”Ã»Ew9£\02N‚{ºnAK\'€”_;M………?§\02\Î0Œ	\Ş\éò\ä\İ şk:À7 û¤\Ó	 \å\×N½|ø½“N\0\È8Ë²\î\Ò\ÃC\Ò	 \åğ>!¤\02\Î4Í€¼\Õ\Ñ	 \å\×\ÎQy\í\ÜM\'\0d\\ øL\ß\rtH9¼\éñ\Ğ\é€Œ“\à¾AŞ€š\èòk\ç€a“\è€Œ\ÓıTuU:¤F^7Õº«%\0qz„(=R\0R\ï}z¢: \ã\Â\áğôtH9¼wK=O\'\0d\\ 8—ğº\Ş;,\Ëz‘N\0p\ëMHOmx.\0Rz\İl–šO\'\0¸\ŞC†¹˜N\0)½n6˜¦ù&\0\àÖ›P4_F\'€\äY–µ\Î0Œw\è\0·Ş„8µ!ú‡Ş¥\Ó	\0n½	5\éÁZ\è\Ò\ë¦Dj\0\à\Ö\äİ ‡I¥@J\á½X§o:À­7¡z©|:¤ô¡÷]\Ó4\×\Ò	\0n…÷q\Ã0†\Ñ	 ¥ğş»„w9\0\àVx‘ºN\0)½n\æ\ë¾\Şt€[oBeò@\'€”^7s¤¶\Ó	\0n½	\í—*¢@J¯›\çõø\æt€[oBœ	HQ0|Z^7{\é\0·Â›³#©‡÷£\Ş\Õt€+,\Ë\Úf\ÆKtH¼f&\Ék\ç\0\0\à\n™*dò~N\0)}\è\'uˆN\0p\ëM\ès™\"Ş¢@ò\ä\ï\İòÁ÷(\0\à\Ö\äı‰øûtH\éCo¡¼vN\Ğ	\0nM«¤–\Ñ	 yÁ`0W-L\'\0¸\ŞK¤V\Ó	 y2uÿZ^7\rt€+8ÁĞ¥\×\Í\rz:]:À­	\âMy\Ú@\'€\äƒÁAòºi¡\0\\!o@ó¤¾¤@ò\"‘\ÈòÁ7J\'\0¸5yÏ–ğşŠN\0\É\Ë\ÍÍ½D^7„7\0wX–õ¬¼	}M\'€\ä\åuc\Ó	\0®7 Ç¥ªœ  \â\ä\å\å]Cg\à&Û¶û\íÜ¹³²¬¬\Ì^¶l™½t\éRÏ•†·ÿ]‰U\\\\l¯Zµ**5‹g\à\ß){€išuº•¬nl£o>\íT	İ‚›4¸KKKíšš\Z»¡¡\êF\Õ\Ö\Ö\Ú%%%Q	ò<³\0ÿNÚ¥„¶Vtøğ\á—\Ò)¸I\'n‚;½.“8û¥~¾¥:šº\×\Ğ%¸MW•º\é-]\Î3ğw€/l/¼M\ÓH‡\à6\r\Z—ğ\Ğjún\ë;o	\îõt~\n\ïã‡«\ìk_±+Š+½¬\×Ö„7\Ğ+ƒÁY­\Ã;\n™t~	\ïc‡öÙ›Oµ7¼ÿ\Èi¥\×\ém6\á\rôJÎ–\çñğ®¤#ğSxWV¼{Fp\Çko\Å\"›ğz\'Ë²\Æ\Å\Ã[/\Óø)¼¿\\ñ\Çv\Ã[o#°	o 7O\ßG#E±{|Ş›–µ\ŞzMx½V~~şÔ›o¾Y_\ÔZ\Ó\éo\Â€÷M<\çœsôE­[šG	pø%¼u\ëòö\Â[o#°	o ·š\Ğ*°§\àğKxo_=³\İğ\Ö\Ûl\ÂÈ†\à\î\ìzÀS\á}p\ßF{Ó’ig®2—\ëô6›ğ²%¸[\ß>…VÁ«á­µkİ¼3\Â[¯#¬	o Û‚;U\èğvxŸ<ioÿxÖ™«\Ì\å:½À&¼l\î\Ä\0oa‡\×\Â[ ¶mõó\í~ç­·q”5\Â\È\Æ\àNü½&px\"¼e¢®Ú¾\Üş\â\Ã\É\íw¼ô>z_¦p\ÂÈ¶\ànıûL\àp-¼;›¶™\Â	o 7w_©eGZß\ïÀ\ájx\'3mw4…Ş„7\à\ç\à\Ş\Ú\ç_GS\Û\ÚA€·w?&p¸\Ş]\r\îxŞ„7\à\Ç\à\î\ãL\ÒvBµ\à‰Á¯Ùü¹@Rrrrúu5¼)\Â\È\Æ\àn/˜¼³\Û\ãX….)((h\Ğs\ÉŞ„7€ä‚»³\0?;\É\àNü{\Ø\n©†wü´¦i>\×\Ş$Nx\Ş\0Á\\€7¤Ü­œ\ïÀ‘Rx\ÇK¼Nj:\áMxwr\Ú\nğT‚;U\è\èrx\'\Ôq©)„7\á\rd“KĞ­Hñ÷\Înc\ânp®OÅ‡¼)\Ç+ÚªZZU³SMN5\êªUg\Ù Ë“N\Õk\é\Ä&K\ÚN8oüÇ´\ä¾GeyD\ê°\ÜvH~şV.Ô’\ËdY+\×\×\Èr¿,«eY%µÏ©J©¯¥öH\í–û\ï’\åW²\Ü!\Ë\íR[\åw¶\ÈòKYV\Èr“,¿\å©r¹¼^–Ÿ\Ér­üÎ§r¹Ì©\ÕR¥r\İJY–\È\í\ËeY,Ë¥²\\,õa\ï\Ér‘,ß‘û-”\Ëÿ\å\ßeù†\Ü\ïuY¾&5_®{U\êe¹\ßK²|Qn{A\ê¯r\ÛL]\r-\×=+·=Ÿ–ë”z\\®{L§[¹nš¤,\'\Ër¢\Ô\Ãr\ßñrû8¹}Œ,G\Ë\Ï÷\ÈõwKıN.“eX*\n…LY\æ\Ë\ï\æJ\İ!—o—\åmò{¿\Î\ÏÏ¿E~÷&¹ÿ………?—Û®\×\ÉòÚ¼¼¼k\äw¯’å•‘H\äŠÎ\'úxÊŸó(\áMx\Ù6y\'»\n;İ“÷ú;ò¦}®~)\Ë\åÍºÿ!C.‡\Ã?\È\ÍÍ½DŞœ$—/“7\èË¥ê›º,¯–\ä¼\Ù_/?ÿT‚\à\r\'n•\Û~£a!o\êC¤\î\Ô\Ñ0±ş¥\Ğ	™\ß\ÉïŸGii\Éuc5œœš 5\É	/\r±\"Y>ª\á¦!\'÷Jj††ŸÔŸ\äº\ç5pœ-?\Ï\Ñ\Ğ\Ôğ”\Ëód¹@CUşŒ¿\ÉòM\'l5tß–\å»N ·\é›%NXkh¯pB¼T\ê#©5\à°_#\ËuÎ‡\0ı0 µ\Ñù 6;¶\Êı¶\Ér‡ó\áB?d\ìr>t|-?W\Êıö:Hªœªv>´è‡—ZYp>\Ğ|+uH?\ì\è‡¹|Dn?\ê|:\î\Ô	\ç\ÃRüƒSüƒ”~¨jˆ\È\Ò]r[S\Â±f¹-ö\áL—r[4‰y§ŠÀ%¼Vw\Ü]ù\Î;~\ìsV™£[«\Íõ„®\èÍ«\Í\ã¯-\Â@W<[›sÀt7¼kuMI\ëûu5¼\ÛY“tZp®^½\Ú4h}\Şy\ç\Ù\çŸ¾}\Í5\×$õgwõ÷o\0©x[[§k?\ïp¶2G÷\Â[·/·w¿tL\Ş\í…\å•W^»~\ãÆvmm­=v\ìØ¤ş¼®ş\á\r SÚ˜Œ\Óy„µ´]\ïJ\İn¡³ûõdxŸs\Î9±\ë·lÙ’ÒŸ\×\Ù\ïµşû\Úû9^W]uU\Êÿ\ÂÈ	¼\'mNp£Gõdx\ßzë­±\ë5Œõ«_\ÙÓ¦M‹MÒıyı\Şv\ÖYgu\Z\Ş.´\ßy\ç\Ø\åÁƒ\Ş\0:œÀ|vŸ\ä\Î*–x?ö\çF¯\ï\ê\êj{Ò¤Iö\ÕW_}\ê>7\Şxc§^g¿§?\ë÷á…w}}}¬ô²~wNx\èh\ï\Îw\Ô7zMx\'Öºu\ëNMÓ©ü\Ùmı^\â\Ïñp&¼¤{O%ø	nôšğş\íok—••\Å.¯_¿>v¦;ûó:û½\ïÿû±\ë¶o\ßnÏ›7¯\Ã\Õ\æ‹-:cµyŸ$¿3\'¼\ìœÀS	b‚½.¼\ï¸\ãX\Ğê”¬«¹u\Õwyyy§^g¿7w\î\\û{\ßû^›»§µµÁš\âk„7€\Î&ğdV¡‡û°q\Z|\Ş\á\rd\Ûÿœ\à\áMxğA€·µ8á­«\Ã\Û*\Â€|JBps\ä40y3yğ¸ø¤]\Ò\ç\ÎŞ„7\0¯O\àz¼i‚„7\á\rÀG4¼õ\\\Üt„7\á\rÀ_\á}!\0\áMxğWx_D\'@x\Ş\0ü\ŞQË²\Ğ	Ş„7\0Ÿ0M3:|øğK\éo\Â€\Â;‰\\A\'@x\Ş\0|¢   %\n]E\'@x\Ş\0|\ŞR\×\Ò	Ş„7\0ÿ„w³\Ôõt„7\á\rÀ?\á\İdY\Ö\rt^°l\Ù2—ğDx7\Z†q3€”––¶\Ô\Ô\Ôºiª½{÷\î‘ğn\à™ô22u7\ß\Ğ	xÁò\å\Ë/))‰\îß¿ŸğMCp7I\Í\à™ô¾\Éû¤L\ŞC\è¼B\ÂfºL‹\Çuu¯k\îÜ¹¶™Ğ«ÿ¾„j ¸\Ş\ŞõÁ`0—N\0I¿f8g\ã\0w˜¦Y\n…L:tÎ²¬q\Z\ÜZry4\à\Öq\\*L\'€\ä>\ì\Æ\Ã[ª’\0p+¼IıN\0÷Œ„\à•aw\Ò\0gY\ÖQ©Qt\èğu2@ª¥uxK­¡;\0Ü˜¼\ËD1†N\0†÷\Â6‚;VòúH‡\0dúM\é[\Ã0\Æ\Ó	 ı©\Û9Œ°\İN1}\Èø\ä}P\Â{\0\Ú}”v\ÜZ\Ñ\áÃ‡_J§\0dŒišµÁ`p2\0ÚºuŒ¦N¼„n\È\äT±_ªˆN\0Iú]\Z\èz9\nıDOì“——w\r\Éğ®’7Ÿ\Ç\è\Ã0\î‘\×\Ì:À\Íğ\Ş\'õ$\0’¼\ÇI¢\0\Ü|#ª”I\â:$=yO’\×\Í:À\Í\É{iš\Ï\Ñ	 \é\×L‘n+B\'\0¸9y\ï’ğş+\0’\ï\'õ\ë&:À\Íğ\Ş!\á=›N\0I¿f•ğşšN\0psŠ\Ø*oF/\Ó	 9º¦J\×X\Ñ	\0n†÷—Ró\è\Ã0^’ğ\ŞF\'\0¸9ETHx¿F\'€¤?ğÎ—\ÚL\'\0¸ùF´AüM:$ı÷M}\İ\Ğ	\0®±,\ës\Ã0Ş¢@\Òxß–úŒN\0p3¼\×Ix¿C\'€¤_3\ï\Ëôı	\0\à\æÑ§\Ş\ï\Ñ	 \éÉ»XOJ\'\0¸ùFô±\Ôb:$ıw¥L\Ş\Ë\é\07Ã»T\'	:$ıš)\ã/\0·ßˆJ¤V\Ğ	 92u¯•\éû]:À\Íğ\æû; µ\×L¹\Ô?\è\07ßˆ\ë÷\ŞtHzò\æÀF\0\Ü\Ån/@\Êx·JÍ¥\0\Ü\ïwõ;<:$ıš\áL|\0Ü¥GWÓ£¬\Ñ	 \é\É{„÷st€k8N3òkfo0|šN\0pó\èu	\ïMtHú5S-\áı(\0\à\Z\çô†_\Ò	 \é\×L­\Ô:À5–e½¬[\Ï\Ò	 \éğ>(õ0\0\àfx¿(oD;\ètx–ºN\0pM0œeš\æN:$\Ş\Ç\ä53‚N\0p\îò¢»¾\Ğ	 \éğ>!¤\0\\c\Æ3–eU\Ò	 \éğ®ƒ¹t€›“÷Sòf´N\0I‡wƒ„÷mt€›oDKU\Ñ	 \é\×L£eY7\Ñ	\0n¾I\í§@Ò¯™f©\ë\é\07ßˆ¦\èA\'\èôk¦%//\ï\Z:À\Í7¢‰R\èôk&jš\æ\åt€k\ÃoYÖ·tH>¼sss/¡\0\\#\Ä=b\0’o{ğ\àÁß¥\0Üœ¼\ï‘\Éû\0’ï¢¢¢³\é\07\'\ïz¸G:tNC[Ã›N\0p{ŠK§@\ç\"‘H\Â€\ë,!oFut\èœn¨¦¬\Ñ	\0nO\Şùz¬f:$5y_aš&\á\rÀ]†a‘ğ>I\'€\Î\éÁY,\Ëj¡\0\\~#oF\rt\èœUJ\'\0¸*??ÿ	\ïF½¬\ã\È\åB¡\ĞO\èp&\Ã0n\Ö“\Ğ	\0%\á|H\Ş|štÕŸn5\ÛNm§SÀ™ôT zJP: \Ó\áıj¡+¾\ép&6ğ\àŠœœœ~:y·Ü¦iV\Ğ% \İ¿…ò\Z9A\'\0xjúf\ê\Ú\Ç	¸=}7´Ş•t\è0¼9‘\0Wß„¦·1u¦3@û\äuò°\ÔA:À\Í7¢#	\á\Í\ĞùkfªT-\0\à\Z™´\Ç%L\İ\ã\è\Ğ\ék\æ1y½T\Ñ	\0˜¾\éĞ¹`0ø´iš{\é\0W†1‰ğ’ş°û¼\Ôn:ôb¶m÷Û¹sgeYY™½l\Ù2{\éÒ¥,Ë²<ûo\Ó*..¶W­Z•šÅ³\nn’©{¶¼^v\Ğ	 \Ó\à.--µkjjì††ªU[[k—””D%\ÈgğÌ‚‹“÷\\©­t\è\Åt\â&¸\Ó\à2‰s\\i¸9y¿.á½‰N\0½˜®*\'t\Ó[º\Zg\\œ¼ÿ!UN\'€^Lƒ†À%¼Ñ«\Â{‘\Ô\Z:\Şöñ\ÃUöÎµ¯\ØÅ¿•^\Ö\ëk\Â\ï\ÅR\Ó	 \Ë\ÃûØ¡}ö¦\ÅS\í\r\ï?rZ\éuzMx\Ã;L\Ó\\nY\ÖJ:dyxWV¼{Fp\Çko\Å\"›ğ†·&\ï$À—\Ò	 \Ë\Ãû\Ël7¼õ6›ğ†§&\ïOdò~ŸN\0YŞ›–µ\ŞzMx\ÃS\á½^\Â{!\0oÂ›ğ†\Â{cAAÁt\ÈòğÖ­\Ë\Ûo½À&¼\áÜ›¥\æ\Ó	 \Ë\Ã{û\ê™í†·\ŞF`\ŞğTxo—šC\'€,\ïƒû6Ú›–L;s•¹\\§·Ø„7¼Ã²¬]¦iş•N\0Y\ŞZ»\Ö\Í;#¼õ:Âšğ†\çÂ»\Ò0Œg\è\í\á}ò¤½ı\ãYg®2—\ëô6›ğ†w|#ş\0²8¼õj\ÛV?\ß\îw\ŞzGY#¼\á©ğ\Ş/UD\'€lo™¨«¶/·¿øpr»Á/½Ş—)œğ†\'\Âû€\ÔD:dYxw6m3…\Şğ.Ë²I£@–…w2\ÓvGS8\áMx\Ã\Õğ>j\Æ=tÈ²ğ\îjpÇ‹ğ&¼á‚‚‚\ã\Ş\Ã\èe\áM\Şğ/\Ó4\ëB¡I\'\0Â›\"¼\áŸ\Éû¤L\ŞC\è@xS„7üŞ–e\İJ\'\0Â›\"¼\áŸğn’ğ¾N\0„7Ex\Ã?\á\İ,u-\0oŠğ†O\È\Ôİ’——w%\0oŠğ†&\ï¨Ô\è@xS„7ü\Şö!C.¦\0\á}ª\äW:¬\Äûüò—¿<\íwõ\ç\ÄûuV,8uÿ\×^{ğ’\ï‘#G^@\'\0Â»\Ã \ï(\à\Ë\Ë\Ëc×­_¿şŒ\ï¬dz°\Ï9\çû¬³ÎŠ]&¼ömY\ÖB&o€ğ\îVxÿ\â¿°GŒ»nÔ¨Q±Ÿ“\r\ï\Ú\Ú\ÚXh\ß~û\í§Bü\àÁƒ\í®¸êª«\ì-[¶$};\á\Ş\Ä4\Í_Kp‘\å!\Ã0n¦#\0\á\İ\åğ^´hQ,t7n\Ü[\ê\ÏÉ†÷/¼pju¹–^ş\Ë_şr\Æß±p\áBûwŞ‰]<xpÒ·\Ş\è\rÀ¹2i/’j‘zC®\êKW\0Â»[á­—¯¾új{\àÀ±eG¿Óºn¼ñFû;\ßù}\âÄ‰X\ée½®õ\ßQ__+½|şù\ç\'};\á\r¿“°¾]\ê˜Ô·” ¼\Ó\Z\Şs\æÌ‰]\Öe²\á½gÏv7ˆÛµká¬Ÿ¶M\ÓüP÷\ç–ZÀ´\r\Şi\ïTn‹×“O>»\ÏĞ¡CO]WXX»î©§:cµx|u|{«\Í;º=ÙŸ	oxaw\ê)?%´H€ÿ”\0„·g\Âûšk®‰\İ\çŸÿü\ç©\ëô²^7hĞ 67H\Ó\Õòm°\Ö\Ş\í„7ü \'\'§Ÿ„v±NÛ²œKG\0\ÂÛ—B\é,\\»¾¬6‡—È„À®“eM(ú	\à\Ûğ>\ï¼ób\Õ\Õ\Û	oxhEB»D·$—‰ûE:À\á\Ø\Ö\Å\áQ‘\í$°ƒRõRUÁ`p\Ğ+&o\Â½Q ¸Pû#¶M\Óü+@x\Şğ0\Ã0†I`Ÿ”\à\Ş\'Ë«\é\0Â›ğ†GE\"‘ş\Øe\Î~\Û¢#\0o\Â&¡}·Tƒ\Ô\×yyyW\Ò\0„7\á\r\nÉ”½N¿\ÛƒO\Ó\0„7\á\r“\Ğ-¡\İ(µ+‰\\AG\0Ş„7<JÏ±-].\Õ,õ8@x\Şğ0	\ë±:m\ËÔ½#_FG\0Ş„7<J\Âz€iš_8\Óv@x\Şğö´ı°T“\ÔV©\Ñ\0„7\á\r\Ê\ÍÍ½D\Âz³w0œLG\0Ş„7<L\ÃÚ™¶7:ô‡t@X¶lKx£›tµ¸³z\\ƒûa: G•––¶\Ô\Ô\Ôºiª½{÷\î‘ğn\à™•U\Óö4\İ M7L\Ó\r\Ô\è€·|ùò\ÇKJJ¢û÷\ï÷|0<y\ÒóÁ]\\\\\Ü$5ƒgVï§»|\é®_\Î.`\ã\è€Œ’°™.\Ó\âq]\İ\ë\ÕZ²d‰-o’¶—ÿ:q\Ü\ÙA\Âú1g÷¯r=ø\n€vhx\ë˜\èÜ¢‡3\ÕÃš:\Óöh:\00M3:|øğK\é\\zş=¥\'\ÑŠ\è‰E\è\0$7y\ë˜\Ñ	d’ªSO\Ùéœºón:\0©…w“a7\Ò	dŠL\Ù\ÏJµ\È\Ôı	_\Ù\0@\×\Âû¤„÷:&a}µ<\ßö\ésN\Âû.:\0]\ïòFZH\'\Ğ\ÃÏ³™ú\Ô\êÁƒ—\0@7Hp‘\Éû: \ÛSH`WI\ÕK\é\0¤g\":(\á=N \İLÓœ\ílI¾r\äÈ‘\Ğ\0H_xWË›\ìt:t	\×\ÉsªFªN*@G\0 \Íd*ª”\Éû:4}œ«[’\ËrYNNN?:\0=ófû•LG/\Ğ	t‡<‡~*¡}@O\Ç\å\Ã\àt\0z6¼7KÍ§è¢¾\Úœi{q 8—–\0@Ï‡w¹\Ô?\èR%}ƒnğ(uL\êv:\0™\ï2©\èR™¶\å9ó†nIn\Æ{L\Û\0ùğ.‘ZA\'	\ë›M\Ó<$S÷Q	\í\ß\Ğ\0p\'¼?\Ğ\é›N #EEEgKp¿\å%\ímı™®\0€{“\Ô[2E}N\'\Ğy~\Ü*}D\êp~~ş-t\0ÜŸ¼\ç\ë\çtmM\Û\Ü\ï:GIû»\\Õ—®\0€\è!,\åy@¢`0x›nE.Ïo9e,\0xŒ]M²F\' t\Ëq\İ\Â\Ùoû5¦m\0ğ\æ„õ¨ßœN@w\èÒ¤şœ\0€w\'\ï	z \r:‘½ô\ä¦i.\Õi[\êU:\0\'oÖ£õœ\Şt\";\É·|©Rµ¡P\è\'t\0üŞ…2u \ÙEÏ¯­\çqöÛCG\0ÀG\Ã\"o\Ş\'\éDV}`³\ä1¯\Óm¤®¥#\0\à¿7ò›\ä\r¼‘Nô~@\àBy¬Ku\Úƒ³\è\0ø”¼‰\Ò7s:Ñ»\Éc–ª—ú&//\ï\Z:\0>‡/“7ô(\èü]\ç\Ìq-¦i>GG\0 ˆD\"ı\åİ¦½r\Úşn\Ï U\n…®¢#\0\Ğ{ô%¼{\å²5Î´=ƒ\0@\ïœ\Ğl}Ã§şg\Æ=òx6H\í‘\àHG\0 —’7ù\èğ\á\Ã/¥ş5dÈ‹\åq\\/¡\İlY\Öt\0zÿä­»\r¢¾ığ5F»Q–;¥.§#\0\á\İ\Äiı\'ÿ@»\r:mKhO§#\0]\á}R´F\'üC&\í‡ôC—\Ôv¾ò\0€\ì\ïzŒs:\á}¹¹¹—È”]\á÷:\0\Ù;\ÅÑ­”\é„\ç?dM”\àn’\Ú2t\è\Ğ\Ò\0\È\îP8¨\çõ¦Ş¤A­\íL\Û\é\0@Ã»š\r<û\ØLu6H«\ĞU\æt\0cYV¥L\Ş\Ï\Ğ	\ïĞ\Ğtc4=\ã›<6\ã\é\0 õt÷•Lv/\Ğ	oƒ:\Óv¹\îFG\0\0m…÷f©ùt\Â]z€Ë²v9\\CG\0\0…w¹\Ô?è„«Á“:mK}¦‡:¥#\0€Î‚C\Ï÷üpe\Ú¨\'‘i»Aj\0$\Ş%R+\èDf\éF‚\Ø-RŸrV7\0@ª\áıN\ßt\"3B¡\ĞU2q\ï\Õ\Ã\ÒJı\0\0º2¾%\Ó\ß\çt\"#”×³¸I}<xğ\à\ï\Ò\0@We¾nqN\'zN^^\Ş5\Ò\ã*©z©0\0t‹iš³eò\ŞA\'z¬¿/8\Óöª@ p!\0t›³\áT%H/	\ê\ë$°÷KÕ…B!“\0\0\Ò\Æ9¢W5H\ë¢—tKr™º—9ò:\0Hw\ĞL\Ğ3‹Ñ‰\î“>^/U«\çH—E¹t\0\Ğ#dB­\çô¦\İ\îy:m\ËrINNN?:\0\è\Éğ.4Mó\èš\Â\ÂÂŸ\ëš©\ã†a¡#\0€§£¡)\ë+z^\×-\É\å\Ğû@\à\\Z\0\È\Ô\ä}“7šN¤\Ö3©C\ŞGƒÁ\àmt\0Q>ƒtz¤\ÉM\Û\Ú\×~†ñNQQ\ÑÙ´\0q\ápø2	£(\èX~~ş-Ò§\ÃRG$Ào¥#\0\0\×\è­$l:\Ñ6®¥?o;GI\Óó÷¥+\0\0·õ%¼\Û~£\ßk\ë÷\Ûú=7\0x††7\ç”>-´\Ï5\ã=¶ƒÁ\àß˜¶\0#\Óetøğ\á—Ò‰S»\Î\×}·eÚ¾\0\0¼:y\ë„9(›{ GEÓ££9GI›Ï³\0\àõğn’‰ó\Ælıÿ\ëq\Èõ(sRz\\ò\ëyF\0\0ü\Ş\'³ñĞz\Æ/=ó—N\ÛR/óL\0\0ø)¼O\è1Î³\éÿ¬\ç\Øuz\Îm=÷6\Ï\0€¯\èY\Ådò¾\'ş¯\ÔJ`¯\Ò\ïù%¼gó\è\0ü:y\ÔózgÁ‡”Bù¿\ÖKUeûz\0\0ÿ‡wµL¡\Ó{\ëÿoğ\àÁß•ÿ\ã\Ç\ÎQ\Òfòˆ\0z\ÃDZ)“÷3½ôÿv—n\'Nö†B¡«x´\0½eòşJ\Â\í…\Şô\Ò#\ÆIpª[’÷\Ö&\0€\ì\ïÍ½\éÀ$Ø£¤\Z\äÿ´G>”\ä\0ô\Æğ.wÎ˜\åk@\à\"ù|&\Õ,õ$,\0 7‡w™\Ô>ÿ?\Ü\'\Óv£\Ô.™¶/\çQ\0ôöğ.‘Z\á\Ç{8ş„µ®9hƒòh\0²%¼?\Ğ\é\Ûoÿn\Ã0\ÆË¿»QjgE\0d	Á·,\Ëú\Ü/ÿ^ù·À\Ş\äL\Û\Óx\0\Ù8y\Ï\×-\Î}òAc‚Mj«Ôxô\0\0YIñ-\Ó\ì½¬«Ÿ\åò\r^\Û\Åj\èĞ¡?”°şRş]zú\ÒI<j\0€¬\n…~¢[e\ëô*A•¥\İN\ÍñĞš)Î¿·\"77÷E\0@6N\Ú;;m[\Ã=\'\'§Ÿ\ÛÿNg-À6\rnY>\Ä#\0\È\êé»£ğ–p\Ó0¦\ëi²Ü¨»ƒñ¨\0˜¾Ms};\áİ¢\Çw\ë\ß%A}™k\İ\Ùl,\0\0]%\íœ\"³ux¯q\ë\ßdY\Ö:m\ënkC†¹˜G	\0€3§\ï7\Ûø¾û†Lÿ;dÒ¿Bş\î\İR\r†a\Ü\Ã#\0@;t£4	ğº„ğ\Ş\ã\Âˆº@–kõ\Ä\"<*\0\0t\Ï\Å\Ã[¦\Ş;3õ÷\æ\å\å])S~¥ü½\'\å\ß0‚G\0€\Ôü˜†w&?0Hp\ë÷\íeƒş.\0\0\0)’‰{Znnn‡·L\Û\×H`\ï“ğ>)\ç0:\0@\×M”\Òğ\ŞSA0œ\ål\İşQ ¸–\0\Ğu¤¢R\ëeZ\\\ÂúZ™´«eYo	\Ú\r\0@z‚;\ØS\Ò\àz|tg\Ú^1r\ä\Èh7\0\0\é\r\îÎ®Ošsø\Õ\Z)\İ\r-ŸV\0\ĞsÁ\İúö)©şÁ–e½ª[’›¦¹\Ô\'7\0 ‚;.¥U\è\Ö?•)û€\Ôñ`0xm\0 ³Á\à-L\à}%°_sö\Ûş œK›\0p\'¸¯¥­\ß3\ãF	\ìo¥É´}-\0Àı\ànıûñ	¼¯sR“™¸\ß-**:›\0\ĞsÁ\İW\êEgÙ‘\Ö÷‹}ş\ãÿx„öa	\í#à¿¦½\0\0ô|po\íó¯£©m\í ÀÛ¼\ß\\PôÿñöM7\İTÁ´\r\0@\Ïwg’¶ª­\0O\îxÍß¨Ş§\Ä\0\0Á\İvÀ¶Ì‰\Ş\Ù\íqi=\0\0w\ÇÁ\Ú^@Ÿdp\'ş=-8\0\0=\ÜxC\nÁ\İ:À§\Ğz\0\0z.¸;\nğT‚;U\è\0\0tÁ¥N\èV¤ø{g·1q78×§\âC\çw/\å¡\0\0 õ\É;\ÙU\Øé¼Ÿ\à!\0\0 \ë©\ï¼\ã\Ç>g•9\0\0=\à\é\ÜÚ¼K§\r\0\0mk[[§k?\ïp¶2\0 í¦´1wûk	÷Z\0@\ÏL\ài;¶9Á\r\0@f\'ğ\Ä\0Ÿ\İ\'¹³Š%Şı¹\0\ÈğŞ\ï¨	n\0\0<0§ü7\0\0.N\à©1Á\r\0€G&ğdV¡‡û°q\Z\0\0¾™À\ãß‘\Ü\0\0ø À\Û\Ú?\0\0x,À§&7GN\0Àã¦š¦©c)\é\Ã\ÙÁ\0\0ğ¾@ p‘\Ş6Á\r\0€Hp_^PP ÷¥t\0\0L\Ş\×Ix7\Ó	\0\0|\"??ÿË²\Z\é\0\0>seò®§\0\0ø„L\İwIx§\0\0ø„÷X\Ó4\Ñ	\0\0ü\ŞS¤j\é\0\0ş	\ï\'¥ö\Ñ	\0\0ü\Ş3¥v\Ñ	\0\0ü\Şs¥¶\Ò	\0\0|\Â4\Í7¥6\Ò	\0\0|\Â0Œ÷dò^C\'\0\0ğ\Ï\ä½\\\Â{\0\0À\'$¸Ë¤\Ó	\0\0|Â²¬Ï¥\Ò	\0\0ü3yo–ğ^@\'\0\0ğOxeš\æl:\0€Â»\Ò0Œg\è\0\0ş	\ïj™¼§\Ó	\0\0ü\Ş¥¦\0\0ø„eYG¥F\Ñ	\0\0ü3y\×Ix[t\0\0ÿ„wC0¼N\0\0\à¦i6şœN\0\0\àŸÉ»%\n]E\'\0\0ğOxGsss/¡\0\0ø\'¼íœœœ~t\0\0\Ğ\Ğ\Öğ¦\0\0ø„®.\×\Õ\æt\0\0Ÿ\Ğ\r\Õtƒ5:\0€O\è.bº«\0\0À\'ô\à,z:\0€O\èaQõğ¨t\0\0ÿ„÷(=1	\0\0À\'ôT zJP:\0€O˜¦9]Â»šN\0\0\à†a<cYV%\0\0À?“÷l	\ït\0\0Ÿ\à^ ^A\'\0\0ğOx/”ğ^O\'\0\0ğ‰‚‚‚\ÅR\Ó	\0\0üŞ«¤–\Ñ	\0\0ü\Şk¤\Ñ	\0\0|\Â4Í\Şo\Ğ	\0\0ü3yoµ,\ëe:\0€\Â{·\Ôót\0\0ÿ„÷72y?A\'\0\0ğ	\Ó4kƒÁ\àd:\0€&\ï\Ã\àc\è\0\0ş	\ï\ã†a£\0\0ø\'¼\ë%¼\ï¤\0\0ø\'¼%¼o¦\0\0ø\'¼›¥®¥\0\0ø\'¼£\ápø2:\0€\ÂÛD\"ı\é\0\0ş\ĞW\Ã[—´\0\09\á\r\0\0üÀ4\Í\Ëõ;o:\0€&\ï\ëtks:\0€O\ä\ç\ç\ßbYV#\0\0À\'‚Á`®aN\0\0\à2uß¥\Ç6§\0\0ø„÷X\Ó4\Ñ	\0\0ü\ŞS¤j\é\0\0ş	\ï\'¥ö\Ñ	\0\0ü\Ş3¥v\Ñ	\0\0ü\Şs¥¶\Ò	\0\0|\Â4\Í7¥6\Ò	\0\0|\Â0Œ÷dò^C\'\0\0ğ\Ï\ä½\\\Â{\0\0À\'$¸Ë¤\Ó	\0\0|Â²¬Ï¥\Ò	\0\0ü3yo–ğ^@\'\0\0ğOxeš\æl:\0€Â»\Ò0Œg\è\0\0ş	\ïj™¼§\Ó	\0\0ü\Ş¥¦\0\0ø„eYG¥F\Ñ	\0\0ü3y\×Ix[t\0\0ÿ„wC0¼N\0\0\à¦i6şœN\0\0\àŸÉ»%\n]E\'\0\0ğOxGsss/¡\0\0ø\'¼íœœœ~t\0\0\Ğ\Ğ\Öğ¦\0\0ø„®.\×\Õ\æt\0\0Ÿ\Ğ\r\Õtƒ5:\0€O\è.bº«\0\0À\'ô\à,z:\0€O\èaQõğ¨t\0\0ÿ„÷(=1	\0\0À\'ôT zJP:\0€O˜¦9]Â»šN\0\0\à†a<cYV%\0\0À?“÷l	\ït\0\0Ÿ\à^ ^A\'\0\0ğOx/”ğ^O\'\0\0ğ‰‚‚‚\ÅR\Ó	\0\0üŞ«¤–\Ñ	\0\0ü\Şk¤\Ñ	\0\0|\Â4Í\Şo\Ğ	\0\0<høğ\á—Z–uƒöÀ„\É{«\\÷2\İ\0À›Sös\Öv;•j\ÒÒ€§[\0\0x„ş³ƒ\0\×\âhk\0\0x‰LÕ¯v\ŞL\İ\0\0xLNNN?	\éæ¶‚\Û4\Í-t\0\0’ .n\ë;\ï\Ä\r\Ù\0\0€‡hH·\Ş%t\0\0oO\ß\Û‚»1‰ô§+\0\0xX~~ş-	\ßu/¤#\0\0øcú®v¶0¿’n\0\0\à1\ÎV\æS¤J¥j\Û\Ø\ß[·@?(Ug±\Z\0\0—\ä\å\å]££I 7vrp–\Öû{·˜¦YÁ~\ß\0\0dpÒ–ğıPB\ÛN%´Û©2&q\0\0znŒ&s}\ë=z´={ölû“O>±÷\í\Ûg\×\×\×\ÛJ—555ögŸ}f¿ú\ê«ö¸q\ã\Ú:€Kaw\Ò]\0\0\ÒLBvD(jI\ŞGy$\Ì\Í\Í\Ív²\Ê\Ë\Ë\íÉ“\'·u —\ét\0€4w\âjr	q{Ñ¢E)…vk~ø¡‰DZO\á8\0\0İ¥«\Ê%¸£‰«È·m\Ûf§\Ã\îİ»\í1cÆœ6³\n\0€nĞ\Ó¿\ã\Ö\à\Ö\ï°\ÓIÿ¼\Ä\0\×\ïÀÙˆ\r\0€.Ò­\ÊW•§k\ânkoµ\n}\r\İ\0 Eºw\â÷\ÜúwO\Ò\ïÀ¿ÿ\Ö\Õõ<\n\0\0¤@À’¸Uycc£\İ\Ó&Nœ˜¸ú¼‚G\0€$\éwİ‰GN\Ó\İÁ2a\ãÆ§‰Mj\0\0\0I\Ğ]¶7R\ë\Î.a©J<‹G\0€$8\'‰\èœ9s\ìLZ°`Ái‡O\å\Ñ\0\0 ¹ğ®¨ò4“t}ÂªóC<\Z\0\0$ABó\Ô÷\İUUU\ro\İ\ï;ñt¢<\Z\0\0$7yŸ\n\ĞøIF2Eÿ¾Ä¿ŸG\0€\Ã\Û\r„7\0\0L\Ş\0\0ôn|\ç\r\0€ÿ&o¶6\0Àg\á\Í~\Ş\0\0ø‰L¼O¸u„µx€#¬\0*=¶¹~\ßÌ±\Í\0ğ=§v\âY\Å21}O<™³Š\0\ĞUz>o	\Ñ(\çó\0À_\Ó÷©\r\×B¡½mÛ¶	\îİ»w\ÛÃ†\rK\ï5t\0€.ˆD\"ıMÓ¬K\ÜxM÷\ÃN÷~\İ÷\ß\â\êò:ı{\é>\0\0]dÆ‰«\Ï5À\Ó5\ëÄ\Üú÷\è\ßG\×\0\è~€OHp]…®ßwg#6ı»Õªrº§\Óm\0\0z(À\ã[¡———§¼;\ØÔ©SOmıs	n\0\0z&À\ïLü<qUº‰m\íÚµ±c¡\ÇOf¢KıN[^œ–x\0–\Ä\ï¸YU\0@Ò\É·B\ïf­a\ã4\0\02D÷—©y}\â‘Ø’)=rš€%\ŞF\0pJ\Õ9ºNãµ‰§M8\Ì\é!=Éˆ«œC\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ôœÿeô ¨EO¦\ë\0\0\0\0IEND®B`‚',1),('2',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"CUS_Submit\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"SS_Review\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('3',1,'/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562206221743\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestReport\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestReportID\" name=\"ID of test report\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewReport\" name=\"TM_ReviewReport\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TM_ReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"qmReviewReport\" name=\"QM_ReviewReport\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"qmReviewGate\" name=\"QM_ReviewGate\"/>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusReviewReport\" name=\"CUS_ReviewReport\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CUS_ReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitReport\" name=\"TS_SubmitReport\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"_12\" sourceRef=\"start\" targetRef=\"tmReviewReport\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"tmReviewReport\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_14\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"qmReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" sourceRef=\"qmReviewReport\" targetRef=\"qmReviewGate\"/>\n    <sequenceFlow id=\"_16\" name=\"é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"cusReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_17\" sourceRef=\"cusReviewReport\" targetRef=\"cusReviewGate\"/>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_20\" name=\"ä¸é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_21\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_22\" sourceRef=\"tsSubmitReport\" targetRef=\"tmReviewReport\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestReport\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"25.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewReport\" id=\"Shape-tmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"210.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewReport\" id=\"Shape-qmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewGate\" id=\"Shape-qmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewReport\" id=\"Shape-cusReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitReport\" id=\"Shape-tsSubmitReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"20.0\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"tmReviewReport\" targetElement=\"tmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"start\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"57.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"qmReviewReport\" targetElement=\"qmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"tmReviewGate\" targetElement=\"qmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"237.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"cusReviewReport\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"525.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"qmReviewGate\" targetElement=\"cusReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"412.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"tmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"227.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"cusReviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"251.0\" y=\"617.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"qmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"396.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"tsSubmitReport\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"65.0\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"cusReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"601.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"420.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('4',1,'/home/dell/stconline/server/target/classes/processes/TestRecord.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562315654060\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestRecord\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestRecordID\" name=\"ID of test record\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewTestRecord\" name=\"TM_ReviewTestRecord\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitTestRecord\" name=\"TS_SubmitTestRecord\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TM_ReviewGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_7\" sourceRef=\"start\" targetRef=\"tmReviewTestRecord\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"tmReviewTestRecord\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_9\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_10\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitTestRecord\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_11\" sourceRef=\"tsSubmitTestRecord\" targetRef=\"tmReviewTestRecord\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestRecord\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewTestRecord\" id=\"Shape-tmReviewTestRecord\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"120.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitTestRecord\" id=\"Shape-tsSubmitTestRecord\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"355.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"390.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"211.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"120.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"211.0\" y=\"175.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_5\" targetElement=\"_6\">\n        <omgdi:waypoint x=\"211.0\" y=\"292.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"390.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"_4\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"400.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"255.0\" y=\"147.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"226.0\" y=\"275.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"275.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5',1,'/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"SS_Submit\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"Sub_Review\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"smContractReview\" name=\"SM_ReviewContract\" activiti:candidateGroups=\"SM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QM_ReviewContract\" activiti:candidateGroups=\"QM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"smContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"smContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CUS_ReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewCosment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"smContractReview\" id=\"Shape-smContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"smContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"smContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('6',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestPlan\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestPlanID\" name=\"ID of test plan\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QM_ReviewTestPlan\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TM_ApproveTestPlan\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TS_SubmitTestPlan\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QM_ReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TM_ApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestPlan\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0&&IDATx\Ú\í\İ\Õ\å}7p&µ­µikÓ´N&“\×É´¯“±™Œoóv\Òf:–6m\Z›aL‘=g\ÏY7Q¼ x#xh\Õ*‰‰¡*\Æ(Q\Æ4\Ú\Æ$\ä‚\×@ÑˆŠ(^À¨¨^¸\ÈM\àÿ>¿“s\èqİ…]vÿ{;Ÿ\Ï\Ì3g÷œ½ñ;\Ï÷<\Ïÿÿ°aÈ²\ìğa\0@\ï¹\ä¿^x&\ì\ÇSû\Ø\Í+³WÎŸ³d\Ïÿû\îSk¦~gÅºI\ß\\¸7\İ_Œ¯»\è\Æe»\Ò\Ç_ˆ¯‹\Çkm\Ò\ìEûê¿®öó\Úÿ\æ,İ¦\Ú\04¤Œ‹f~wõ\Û_ù\Şs\Ï]ô\íe¯OúEû¾ô\íe».ºñ‘]{²\ìşº¯»\Î\Ò\í¯E¨^ş\Ãu+¾<w\Å\Î)s—\ïœ4{\á¾ÿ~9{1\İ?!¾\î©,»d\îc\Ùü\Ú\×\ÕÚ¹³½·µ¯€F\n\Û#S;*µ%°\İô\Ø\Î\ç,}\çº÷­\Ûtÿû\ë¿~İ\ì\áKn_µm\Ú-+wD0Ÿ{\Íı{Ï»fq\Ìlÿ²\İ\Ï=n[–]í–•\Ù_»üµø¸£Y/\0\éY\íew¬İœn\\ü\İU\ÛÎ¿öş½};\î\Ëv}ı\î-¯Oş\ÖC»\ã\ë\æ.\ç\Õ\É\ßú\å\îôu—}\í§kŞœzË“;\"<cfûû^{ıükïˆ¯‹Pru¹ù\Ì+öú\Ãqÿ’,ûú};³kT€F\Û\Ï|\å¿\ÖlM·_‹c¯¯¾/;ÿº%{\Ò\çKS»\î\ß¼ñ\Í\ê\×ı¯ó~}ÿÿú÷;\Ùò\å›W\ìˆ ½aY¶.\İwñ\Ôy+\×\Öf\Éñqu¶üşó¯]²=\î¿\âÇ›±|@\Ã:\ï\Úû·§ ¼\í\ÜÿX´/\ÍP÷Lü\æ}\Ùõe\ë§\Üø\è\Æ\É\Ú\×EÇ™\Ê\ç]³x×¥w¼¼%Á\Æ2óœû\Ölªÿºøyµ¿»:»-n«\ì,g\0\Zrf{t\æ“oeO§©\çS±<\å¦\å•c¶·>½üX–]Q›±Vg¶§~\ã\î-1\ëıô\ä~¹{\ÊM\ìºbşk\Õ}\İ\áµYnõóO§”~\áu¼­\Ú\04bĞ\'6M½\å‰\×ÜŸıüù,[±5\Ë[e37gÙ²XVN_3/µÿ;m\ŞS\Û\ãd¨~{}š?º3=~ù×¿5{á¶·¯\ŞşrúšsRûpo\ná·¾ÿRv\ëú,›ú\Ã\r\Ù\Üx{\ĞõfwVOú[• ‘\Â6\Âozœ‰\á8ó?Wm»ò§o¾Q{ÿ\ì-\Ïd¢ŸM\í\Ö\ÔîŒ³ˆç¿–½3\Ú®{ğx?n­¥\Ç.H\íô7²\ì¢\Ú\Ïû\ÊmÏ­~\ë³/Ô¿\'7«<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0JY–y\çwş`ö\ì\Ù\ÛfÍšµ\ï¼ó\Î\Ë\Ú\ÚÚ²\æ\ææ¬µµ5›4iR6mÚ´\İ3g\Î\\;aÂ„sU\0º\è\ÕW_m¹\å–[¶œs\Î9\Ùgœ‘\İt\ÓMÙƒ>˜­[·.Û±cGv\ïŞmØ°!{øá‡³yó\æe\ãÇ\Ï\Î:\ë¬}S¦LùE©T:J \ã™\ìQ÷\İwß¦³\Ï>;K3\ÙlÅŠ•Píª•+Wfiœ;6K³\à™*\n\0\íf³\ßø\Æ7öMœ81[¾|y\Ö\Ï<óL6aÂ„\ìô\ÓO­­­\íH\Õ \ámİºuÂ´iÓ²«¯¾:Û²eK\Öb¹9~Ş™gù–ee\0\Z~FA{\ÅWd{ö\ì\ÉzÛµ\×^3\Ü7†~¸j\Ğp\âm,\Ç4 ­ùú×¿=zŠ\Ğp\âd¨8F\Û[K\ÇZR?~ü¾R©4Q\Õh±|g\Ç\Ç}!Nšjii\Ù\ëø-\0\r#\ŞGo\ï\éK—\\r\É\î\æ\æ\æùªÀ;CÅ†}5«­yúé§³4³}\Ç\ÉR\0yw\ß}÷cg¨<OŠ\êL[[\Û\Şb±8Ö³\0À{\ÇŒıáª«®\Ú\Ş\ÜÜ¼Ø³\0Àˆ½û\Ã<°\'…\íË\0†´¸zO\\T ?lÚ´i_\n\Û]\0†´¸<^\í\ê=}-.l—\èó,\00¤E\Øõ\'aÀwò\É\'÷\ç\ÌvŸ°`\È;÷\Üsû\í˜\í†\rv;fÀ7}úô]ıu6òwŞ¹Á\Ù\È\0y_|ñšşzŸ\í´i\Ó\Ö{Ÿ-\0CŞ„	¾8~üø~\ÙA*¶k´ƒ\0¸{ûzo\ä¥K—\Æ²½‘hS§Nıù•W^Ù§a;nÜ¸õ®ú@\Ãhkk;ò\ÔSOİ·r\å\Ê>	Ú‡zhS\Ìj]\Ï€†r\ÖYgM‹\ÈoÙ²%× İ¾}û\Şr¹¼;\íDU \áŒ?~\İUW]•\ç\ÉRû\Ò\ï\ØP,ŸWm\0\ZRœ¬”f¸›fÏG\à\î›2e\ÊKñ¾\ÚX¶Vm\0\Z:pÇ·\á«_ıjöö\Ûo÷\Ú\Òñ™g\'D½\ì8-\0T·µµõù\ÓN;m\ß\ã?\Şã“¡\âm,›\Ñ@;q\Ó\èÑ£÷LŸ>ı\İ\î,-/[¶lc®u\ìd(\0\èL\ÌFÓ¬ô¶˜3fß¬Y³¶/Z´h\Ïúõ\ë÷\ÆõhkWï‰‹\n\Üu\×]›b\Æ\Ø*B6\ŞGk\Ù\0º!…gkj÷¤¶&ğö¸<^]\Û\ÇdS[\Z[0\Ú\n\0z/€³3f¦\0cØš\Å@\Îa\Û\Ô\Ôô~•\0€\Ã\Ö[z\0 \ç°mmmı•\0€ü\Âv\ßÈ‘#?¤\0cØ¦ö•\0€Ã¶µµõ£*\0ù…\í\Şb±xŒJ\0@a\Û\Ò\Òr¬J\0@NJ¥\ÒŞ“N:\é*\0ù\Íl÷¤öT\0ò\r\ÛO©\0\ä¤X,¾3zô\èO«\0\ä7³}§P(¯\0_\Ø\îNaûw*\0ù…\í®b±øY•\0€Ã¶\\.ÿ³J\0@~a»³P(ŒP	\0\È/lw¤™\íH•\0€ü\Âv{±XlR	\0\È1lK‰J\0@NÒ¬öí”µ£U\0ò›\ÙnKaûE•\0€ü\ÂvkšİU	\0\ÈIš\ÕnI\í4•\0€üf¶›SØ¡\0“b±øf\n\Ü	*\09I³\Ú7\n…\Â$•\0€œ¤Y\íë©¯\0_\ØnJm²J\0@~a»1µ©*\09)‹\Ê\åòt•\0€üf¶\ëS\à\ÎT	\0\È/l×¥v©J\0@~a»6µ\ËU\0rR,_)—\ËWª\0\ä¤T*½\\(¾¦\0“\æ\æ\æ5iv{µJ\0@~aûBj³U\0r’fµÏ—\Ë\åkU\0rR*•K;G%\0 ¿°]U(¾­\0“\æ\æ\ægS›«\0_\Ø>\Ú\Í*\09)‹+K¥\Ò<•\0€ü\Âö‰r¹üŸ*\09inn~<\îm*\0ù…\íò\Ôş[%\0 ¿°}$µ¨\0\ä¤X,>\\*•~¤\0“´\n…«\0ä¤¹¹yij?U	\0\È/l—¤v—J\0@~a»8µ{T\0rR*•‹\ÅûT\0ò›\Ùş<µ…*\0ù…\í=±”¬\0_\Ø\Ş\'I©\0\ä¤X,.ˆ·ÿ¨\0\ä¤T*ı$\îƒ*\0ù…\íb\ËF•\0€œ\ÄE\âb*\09)\n\ßO³\Û\ÇT\0r’‚öö¸€¼J\0@N\Ê\åò‹\Å\'T\0r’fµ·¦°]©\0_\ØŞ’\ÚS*\0ù…\í\ÜÔU	\0\ÈI¡Pøv©TZ¥\0“´\ßJ3\Û\çT\0rR,¯Kaû+•\0€œ¤ \Ú*\0ù\Íl¯Na»F%\0 \'¥R\éª¶/©\0\ä7³•\Âöe•\0€œ¤ ½<µµ*\0ù…í¥©­S	\0\ÈI¹\\¾¸X,®W	\0\Èof;#µ\×T\0òÛ©©mT	\0\ÈI¡P¸¨T*mR	\0\È/l/L3\Û\×U\0ò\ÛIifû†J\0@NÒ¬vB±X|S%\0 ¿°=3µ·T\0rR(N/•J›U\0rR,Ç¦™\íV•\0€œ¤Y\íS\ØnS	\0\ÈI\n\ÚVa\0ù†m9µ·U\0rR,›R\ØnW	\0\ÈI¹\\™\Âv‡J\0@~a{bš\İ\îT	\0\ÈIš\Õ~>5a\0yI³\ÚÏ¦°İ¥\0“Q£F}¦T*\íV	\0\ÈI\nÚ¿M3[a\0y=zô§‹\Å\â;*\09I³\ÚO¥¶G%\0 \'MMMŸ¶\0£r¹|\\\nÛ½*\0½$v‹J-;H{Y¥\0\à•J¥\Ë¶…B\á*\0ù\Ín×¨\0ôP±Xœ\ÕYØ¶´´U\0zgv»µƒ°]¯2\0\Ğ{a;µ}Ø–J¥3T\0z7p7×…\í\ë*\0½,\Íd\'\Ö\Íj\'ª\0\ä8»U	\0\È/l\'[\0­,\Ëşù\ç_^ºtiv\ï½÷fw\ß}·v\í{\î\É~ñ‹_\ìK\íZ½J\×Çw‰Ahñ\â\ÅÙ†\r²]»vi=h7n\Ì.\\¸/\rJ³ô,}\\ö‹Wû¡\ŞŒ\Ò,`—¥\ë\ãÀ~±¬f\0\é\İKnz–>®û\Å\Zƒ‡H\×ôq\0Ñ¶·\Öe\Ï?|S¶ò¯TZ|÷xDú¸>ô\Â@´õÍµÙ“wN\Ëÿ\É\ïjq_<fğ1\é\ãú8\ĞÃ\è\å•?z\Ï Tk¯¬œoğ1\é\ãú8\ĞÓ\è\éŸÿ{§Q<fğ1\é\ãú8\ĞÃ\èÉ»gt:\Åc‘>®\"‘>®\ë\ã0°¢83³³(3øˆôq}\è\á@´z\É\ìN¢x\Ì\àc \Ò\Çõq ‡\Ñ\ëkWdO\Ş5ı½\Ëk\é¾x\Ì\àc \Ò\Çõq ‡Q´–\İü(\î3ğˆôq}èh\ç\Îlõ×¾wy-\İ|Dú¸>ô` Š\İsV-ùf§Ç³\â1;\ìˆôq}8”(½š_·ú¾\ì‰S:„j-¾&¾\ÖÀ@¤\ë\ã@¢ƒ½\Ò70\é\ãú¸=ˆºòJÿ@3\0‘H\×ÇƒD‡:Õš\È@¤\ë\ãÀA\"\Í@¤kú8ˆD\è\ãú8ˆDknnnM\íU½O¶` \Òzy ª†\ìúÔ²hzŸ>.lÁ@¤õ\Ò@\Ô>d…­>.lÁ@¤õ\Ò@T,\Ç\Ærqû¶úxGm\ç \Ú0CØ‚°QG3Ya«w\ÖV­Z•µ´´šÀ¶ l\ß\Õ\Ò?±\Òú!lµ\Ôz?½\á†²R©”­Y³¦_úvw–°…\ÃvÉ’%\Ùq\Ç—ıöoÿvö;¿ó;\Ù\'>ñ‰n=~°ÿ\è\Ñ~ó73û‹¿ø‹\ì\Ş{\ï\Ôaµ-\n¦~«™\íÀ\í\ãË—/\Ï\Ê\årö{¿÷{•¾·ÿôOÿtÀş\Óş¾C\í÷µ\ï;\âˆ#²‘#GVú\Ä5\×\\3 \Âö`?[\ØBaû±}¬òpÅŠ\ÙÆ³	&t\ëñ®üG_¼xq\å\ã~ô£C\é©©©m¶«/[¶¬®ög–=úè£•ûyæ™¬­­­[a{¨ı¾ö}\×_ış>1fÌ˜lıúõışBR\ØB?†m¼òÿ€1 \Ê\ã\İyU³„\Ú\ç1ø\Ä ô»¿û»•ûÿñÿ1{\á…²\×_½r\ß1\Çó®ŸŸ\Ç#¾ö?»³ŸU{üÿø³?ü\Ã?¬|<kÖ¬\Ê÷\Æm|şğ\Ù?øÁC^b«\Ît7Û\ÑÇ‡^y~\ïº\ë®n…Nûûµ\ß×¾ï¬³\Îz×‹°¯~õ«]šmÖ¯E;ö\Øc\ßõ7´¼6\ëşĞ‡>Tù\İGuTvë­·¾\çg·ÿ¾BW\ØBaÁT[\êıû¿ÿûlúô\é•@\ë\ê\ã]\Ğ-ZTùøóŸÿüş\Çc¦÷Å²\ÛSO=UùøSŸúTå±‰\'V>ÿ\Ù\Ï~Vù<\Îø<\î\ïh€:\ĞÏŠv\â‰\'V\îÛºuköñ¼òq\ÜnŞ¼¹òñ¿üË¿ôÆ¦1\Óİª÷õo[ñœ\îØ±£Ga{¨ı>¾\ïş\è:<\Äpÿı÷W~\æoü\Æo4l\ï¸\ã\ì‡?üa\å\ãN8\á=G \Æ\Ê\Ú\çs\ç\Î\İÿy¼¸´Œ,lcVx\ÑE\í¡h\Ç|—\ï\Ê1\Û\Úò¯~õ«÷Šõ­6­^½ºòq\í8[\Ü\Æ\çqGƒÆ~V´øû\ã¾iÓ¦UnO?ıô\Ê\íÌ™3+·ñ¸“G„mûÕ’C\é÷ñ}cÇ\í0lÇŸv\Øa\ïZ\á\é,\ã\ïV›½vôxGŸG¿o?›¶0\0Â¶ıñ®Ú«ùCy¼³Á\ëüóÏ¯|3„öƒb\Ì.;úş“N:iÿr`\Ü\Æ\ç\r\ZûY\ßû\Ş÷*\Çrñ\ÑG]¹/\Â?>ûo¿ıva;Ä–‘ô } \×B­>µß¿ù\æ›Ù¿ş\ë¿vzõŸÿùŸ\ïÿ9µ\ß{(aÛ•Ï…- °%Ô¥K—V>JjK¬]}¼+aË·q,)>¯‘\\[ú<yr‡\ß_[z®}_,w6h\ìgÅŒ¸ö=ÿöoÿV¹\ïò\Ë/\ß_ıŒ\Û@4¸ûxô\Ñ8A*^LEH\ÖNŠcú\í_\È]w\İuûß¢3¬\İ\á„C\í÷£F:\àÛ•ššš*\çDŸ¼ù\æ›¸Œ<şüN—‘%lk/2:;YK‡\Ã6g\Æ1xµÿc©,\Ş:\Ñ\ÕÇ»ºT!W¿\'Bq\Æ•—†ur\ÒF¼](\îû\ë¿ş\ëş\ì®ü¬˜Ä¿¡6\Ğ\Äñ·ø¼~\Ö l‡F3ˆG]	\İXV\ÛúÀzõ\ÕW+K½qr\\ô“¸\Ùh\Ü\ß\Ó~_,\ß°ñ^\Û8a*Vx\â¶~iz\ØANŠ¯\í\è©C	\Û8)0úû0\'HAÿ.#k\ÂV?ôKÈ±\"óø\ãW2^\Ø\Å\Çq®€>\"\Í@¤\ç\Ô^|ñ\ÅlÒ¤Iú8ˆ½\ÅòZGM\Ø2”Ã¶;ı~Ó¦M\Ù)§œ¢ƒH3\é\ãy´mÛ¶e·\İv[\å˜\í–-[ôq0i\"}¼7\ÛC=”}öÙ•“’Ö®]«ƒH3\é\ã½\Õ^z\é¥\ì\ÒK/\Í\Î=÷\Üı{3\ë\ã` \ÒDúx/´X&7o^vê©§V¶YÜ¾}»>\"\Í@¤÷V‹«Z\Åû¼¯¾ú\êlÃ†\rú8ˆ4‘>\Ş[\íùçŸ¯\ì¯}\á…fO<ñ„>\"\Í@¤÷V{ë­·²›nº©²düÓŸşô€=\Ğ\ÇÁ@¤ˆôñn´;wVöö>\í´\Ó*û*\Ç{hõq0i\"}¼—ÚªU«*\Û.~ù\Ë_\îö\åõq0i\"}ü\0-.rqıõ\×Wf³ñ;cv«\Â\Ö@¤÷Ò’ñ‚*\Çe\ã|q‘}¶\"}¼—\ÚÊ•+³/}\éKÙŒ3ºt­c}\ZT\ííšH\ïz‹kÏ=;?~|\åRyú8p@‹/\Ş;˜\ß\\?\Ğ\Ú+¯¼²&\rD»ô¬¡\Ù\Çc·§ùó\çg\ãÆ\Ën¾ù\æló\æ\Íú8pp÷\İwß¥.\Ü÷\Úk¯	\Ë^„\î¹\çwR›¥g\r½>¾|ùò\ì¼ó\Î\Ë.¹\ä’Êµgõq [\Òœ™\é•\ê¶X\Z\Z¨-.=6ÿ¾j\Ûe\Zz}ü?øA6eÊ”l\ìØ±• A?\ÔÇ\îkjjú­\æ\æfÇˆ\è\ë~÷ş\Ô\ï\îLmoj\Ó\çP`¨zÂ–>“úÛ´\Ôv§¶®P(¯\"@#„\í„-}!‚56µ]©MU aŒ9òCi\àÛ§\äù‚®T*-Š%\ãb±¸ VSTh(§œr\Ê\Ñi\0¶\ä\"\ìå©½“Úš²ŸT !µµµıoaK³\ÙÏ¥\Ù\ì¦²;\Ò\íD\ZZKKË±±¼§ô†¬G¥öPj{…\Â÷‡~¸ª\0\r¯\\.\'l\é\r©\ÍNmOj«\ãEœŠ\0ü\Ï\0ù© U‚ô¡Q©½U,\ßNm¬Š\0´S*•ş&N`Q	º+N®K}\çñ\ê\Æ·Ì˜1\ã0U\è@¡Pø»\Ø`@%\è†÷¥>37Ë¦\Û\'\ÓlöO•\à\0\Ò@ù\Ù\Ød@%\èâ‹³“SÙ–‚vKj%\è‚4p~>µ*ÁA^”“\Ú3q|?\İÎ‰Ù­ª\0tQ¹\\\ï…T	:ªH\áz[,§¶lÌ˜1V€njiiIciq»J\Ğ^zvfj\ÛS{£P(ŒP€C”f+£\ã-*AM¼÷:õ‹\â,õ²_S€‡\í\ã„•`Ü¸qG¤¾0¿úV%#FŒø ª\0ô‚4¨šf¶[T¢\áûÁ\ä\ê¥\ï^5j\ÔgT w\Ù8.÷–J4¦Ñ£G:=ÿk\ã½\Ö\éE\×L\ÈA\\‘%µ7U¢±´µµ™öŞ¸\âSº½\ç„Nø}U\Èof{~j¯«D\ã(—\ËWg²¯¤öW*³B¡pQ\\wT%†¾8›\ÂuClb’÷U \ïf¶\ÓRÛ CWkkëŸ¤\çø8\Ë8½°úQœu¬*\0}(–\Ólg½JM)\\¯ªn±ø|¼VE\0úg0¾,\rÆ¯ªÄ{ubznßˆ \Ò\í*Ğ¿ƒò•q¢ŒJ\r±wq\n\ØGªS|/ö6V€şŸ\Ù\Æ2\ãK*1\è½/®\ÆS\rÙ§\ã*=J0@¤ù›©½¨ƒúSØ’Ç­©µªÀ\0“f@×¥úW*1(Ÿ»?Mmeõòw7sY€;³½!µ\Õ*1xÌ˜1\ã°®ób\É8…\íòSN9\åhU\Øa;7µgUb\Ğ<_§¦öv\ìg].—GªÀ\à¼oI\í)•\Ø\Òö\ã\éyz.\Ş3\Ç\ÙU`p\r\â\ßMƒ÷“*10\r>üğR©tG—M\ÏÕƒ\éö(Ud\Ò\à}{÷S‰§P(LJ\Ï\Í\ÎØ»º©©\és*0x\Ãö4 ?ªGKK\Ë_677¯I\í\Ô.W€Á¶?Jaû°Jô¿4{}\n\×;«S,LŸ@U\0†F\Øş$ªDÿª^}iwj\ë\n…\Âñ*0´ù˜I= ı#‚56µ]©MU€¡¶÷¦ö•\è[±D\\*•U7¦XKÈª0t\Ãvaj?W‰>­ù\åÕ“ŸÖ¤ı¤Š\0ıqj÷¨DŸ\Ìf?o\ãIõŞ‘n\'ª@\ã„\íq\ÜV%òQ¤öPlLQ(¾U¨\n@©\îJô•\È\í\Å\Ì\ì\ê‹«[ZZU€Æœu-K³­ªD¯‡ì¨¸X@z1óvjcU ±\Ãö±X\ÚT‰\Ş—»K!ûxucŠ[\ârxª`öxšyİ¦=ö¾¸\\a—;Ä…İ•€Z\ØF0|W%]¡P89\Õq[\n\Ú-©•T€öaûT,wªD÷¥)Ç¤öLœ\0•n\ç\Ä\ìVU\0\è(lŸM“±U¢ëššš~+–\Şc\É8N03fÌ‡U€…\ís)0¾¥]®×™©mO\íB¡0BE\08¨4C{¾\\._«–jt\\zQòBl³˜Bök*@wfj/¦öM•\èØ¸q\ãHõ™_}+Ï’#F|PU\0\ènØ¾”flW©D‡µ™\\½ô\İk£FúŒŠ\0p¨²¶X,^¡ÿcô\èÑŸº\Ä\Å\ÜSmfª\0=\rÛ¸pù¥*1lX[[Û‘q}\ß°û\âJH\'œp\Â\ï«\n\0½¶\ë\Í\Ş*\'@]\\É¾’\Ú_\é\0ôf\ØnHmZ£şû\ãXl\n×¨Á\ÎB¡p¡@¯‹‹™§¹¨\Ñşİ­­­R½–olLñ£8\ëXo\0 ¯™\í)l\Îk°WU·XŒ÷§\0«8o¦\à™\Ğÿ\Ö¬\'¦ }#v€J·gxöè«™\í\æ¡<±wqúw>Rİ˜\â{±·±g€¾œ\ÙnIt\êı\ç½/®\ÆS\rÙ§\ã*=q\0úcf\×aı\âPûw•~-^HlM­\Õ3\r@†\íÛ©•‡\ĞLıOS[Y½ü]\\:\Ğ5f\è÷°İÂ©i°ÿ;fÌ˜qX\n\×y±dœş=\ËO9å”£=»\0”°\İQ(¾0\Èÿ\r§Vg\èo•\Ëå‘U\0ZP\íL\íóƒñoO3Ø§¿ı¹xÏ¬\Ë0\ÃvW\n­\Ï¦¿yøğá‡—J¥;\â¸lú\ÛL·Gy&\Èa»;…\Õ\ß–¿·P(LJ»3¶™ljjúœg€¬kR\Ë:h±ûNµmK\Í\r´¿½¥¥\å/«ü—{6\Ê\åò?w¶û[š5\Ş6ş\æ4{}ú»\î¬nL±0}ş\Ï$\0}v»º³ c iV—ş‹e\î¸À}¡P8Ş³À Ÿ\İ”Ymklœ¼•\ÚT\Ï\Z\0ƒN\\Z®£\ã¶ı=«%\â4»^Tİ˜bA,!{¶\0”b‹\Âö†şü›â¤§\ê\ÉOkR\È~Ò³À —B\íÕº\å\ã·ã½«ı4›ı\\¼\'v²J·=3\0)`\ÇÖuI_ÿşØˆ\"µ‡â¤¬4\Óş~…=\0\ä=»]a;bÄˆöñ\ï]}o\ïê–––c=\0\å°m9rdW\Ì\é£\ß7*.\Ë\Ö1³ö\0\Ğ.L-Kmf¿$.w—Böñ\ê\Æ·ôU¸À@\Ú}©=Z½\Í#pß—\Âun—M·OÆ…İ•€F\ÚZÀN\í\íÀ-\n\'§€İ–‚vKj%% ‘ƒö`÷wKš½“\Ú3qTº³[%@Ğ¾÷ñno‘\Ø\Ô\Ôô[±\İc,§¶lÌ˜1Vn\0mÇº½¤œf±g¦¶=µ7\n…\Â¥@\Ğ\\\îŞƒ\Íp\Ë\åòqiûBl³˜Bök\Ê€ \íş÷\í\í\èûÆwD\n\ØùÕ·ò,\é\ëM1\0`(mû\ï\ß?\ÃM\á:¹z\é»\×F\Zõ%@\ĞşO\Ğ\ÆYÁ\ß\Zvğ³ƒ\Û]\å\îG>ò‘SÀ®‹¹‹Å™\Ê€ }o\Ğ>;\ì×»E={€À\íğ\ë8\âˆ\'xböÿğ¿:\á„~_y´\ï]:şV5@³n}\Ğ\ÖÚœÚƒ¸\Ãò\Ûi\n\0u\Ğv¤õ{°\Çkz}§)\0\nA{°À=¬‹A[ÿ{ö\n\\\0m\×wW7‚¶}\àNUz\0m\×·;A[cI€†pt5$Wvóû\ë`F»«zw,¨~\ïÑ\n\0\Zaf\Û\Õ%\İŞ\Ù^\æ)\0 ‘·¯\Ù\ÖöN¶„€À=H\Ğ\ê\ÙÈ‡t>\0*\Û\ÑYÂ½õ>\Û\Öa\ÎB€ı\ÇR\ë±\Ç;H\Õ\Íhg)1\0ôò\ŞÈ‚\0<Ã­\Ü9ÃºvÕŸú¯ó~Z\08\È·\'\ÇX-\0\ä˜=½ğ<\04\Ü·;Á)h\àg¸]YRn\æd(\0\Èm†[;\Æ+h ‡À\í\èı¹\0@wj]\Ğ\Ú\n\0zYm&»p˜«÷\0@~3\Ü\æ\æ\æL\Ğ@ªa\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø@Áº>\Âõ m›JÀ¡‡m\ëÁÂ¶X,\ÎT)\0\èY\àn<@\Øn>|ø\áª\09\ÍnK¥\Òe*\0½¸»\İfV\09\În«€\Ş\ÜW\Íj Gi&;¶.l§ª\0\ä3»­»5«€^\Z3\Ø\ÔW\ßş³«\İq\Û=©½\Ú\Òr¹|m[[Û‘ª\0]p\ÒI\'}\"\è\Â »»°{TıÛ€ö‹Å•\éöoT\0:™É¦°\\B6\ëN\ÈvÒ–š\é@Q£F}&\ÍHw´\Í3\Î8#›3gNö\àƒfk×®\Ív\ìØ‘…¸İ°aCö\È#d\ßù\Îw²‰\'v´\ãöB¡ğ\Õ \á\ÅY\Æ---{\ëƒò‚.¨\é={²®Z¾|y6eÊ”ö¡»\Ïûqhø ­_6N¡›ÍŸ?¿[!\ÛŞ‚²¶¶6`\0@,§ \İW¿d¼jÕª¬7¼ø\â‹\Ù\ÙgŸı®®%e\0\ZJœUŒ6‚6Áö¦øyõ\Çp4@Ãˆ³ë—{kF\Û\Ñ·İ’ò/U€!/\ŞG[œ6\Ñ\æ)\á\Ö¿\åk\Ï\0CZlXQ\Öñ\îİ»³¼M<¹~9y¥g€!+\Õ\Ö\ïo\ï\é+V¬x\×NS©\å\Ù\0`HŠ·\àÔŸÕ“·øtWı\Æ±—²g€!©zQJ\à\İp\Ã\rY_š7oŞ»¶sôl\00T\Ãvc-ğbÆ¾K\ÖuK\Éoz6\0’R\È\í?^»nİº>\r\Ûx\ßmı\åù<\0Õ™\íşÀ«]T ¯\Ä\ï«ÿı\r\0†|\Øöa€™­™-\0ôŒc¶\0ÿ\Ì\Ö\Ù\È\0s\ØzŸ-\0\ä)\Í(/\ë¯¤\Î9\ç;H0ô\Å\Ş\Èq¼\Ô\Ş\È\0£¸¦lıUúbv;e\ÊWı q\ÄõlS\è\ís=[\0\Èwv»ÿD©–––lÕªU¹\í‹/¾˜|ò\ÉõaûK\Õ !´µµY,·×Ÿ,\ïƒ\í\í÷Õu\ÖYõ\Ë\Ç\Û\ã÷ª>\0\r£P(|¡~99··f¸1£­\Úø=ñûT€F\Ü\ë7–”\ãnONšŠc´í–cV;Sµ¸u\ág)/_¾¼\Ûo\ï™6mÚ»B6~® €_\î\ê\á\Ö/-\ÇNS?üpe/\å\Ú\Å\â6\ÉF \Ç\ÎPõV\Ô£µt\0u\â\ä¥ú³”{\Ø~\éd(\0\èD¼7\ÍJ­\ßiª+-v†Š\r+\Ê\åò?«\"\0tAl\íX\İK9f»\ë/\ÏW·\í\â›qQ\Ø\ë\ØŒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04ÿø\æ|kLi\Ô\0\0\0\0IEND®B`‚',1),('8',1,'/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\ë\0\0\0tô«\Å\0\0BIDATx\Ú\ípTõ½øS*µ×«[n\Ç\é8\Ş\Ş2N‡\ë¨‡>”¦vhKŠ’\ä,»›\ÄT**…Š0z¡@}\àƒV¯R‘[E§\Ï¥5U„È…( @y…D\Ş	Iöü¿\ßõl\\’\İdgw\Ï9ûù\Ì|gw\Ï\î\æñ=g?ûıó{\0\0x•\ÉOÖ˜¿œ¿2z¿kü¿µŸ	¿\î©\ZSø»Ä„\Éó\ß0;\Ãzğº¾n\Ê\Ó+CrR¬\ßC¶ +n3<Q¹£Mdt‹D­\n\è\îgş/4õ\Ù\Õ*¨7%şS_÷\È\ßÚ§Ì¯\Õm¯ß½ .¤¢‡ŠQ\Ëöúº¦Vs\ï{¿%òºH„n\Ô\ë\0\02\Îz·=\\}Y²šüTm¤û\Ï\è\×ıú¥w\äuo|öº\Ï*¶\ÙÑ¯“\Ç\Ó$¶i\Ì}e÷«\â\Û«š\0°\r4AµŠz÷©IL]´&i>Nş]mhÊ§ò\Ú?%\"³§¢\Âz]\Ô\Ï\Ó&ë†©\ë;tû\ÚC¡¦ª\Ï!\ã\0qD>ƒµúš\"rŠKetÿ7v\è¶É¿[iZ¯»yòSo¨\Øn~4Mu\Û­\î:\ŞS\ámƒµÒ‹o\ê‚úš \0zyg‹ÕŒ¼\'ºb\Ó\0‘\Ê-òZ\ëuÿqnsõS!ª¸¢_¹?o\é¾\Ó\ámŸ\Ê\î?\È8\0dºZûÂCgXÒ©\×+œ3o9k	¬ş[\×1÷¯\ï¶V‰…+¶ú\é‹\Şj—\ÛG\ÂT©=½º\ãÃ“\æ\ëuÿ©Ş¬Çœ6\Í]S¸\"\n\0Y\ÛOTJZuı\Ï›\ÚT\\O¾º³\íX\ÈüpöŸ\ßkÕ¦¦¼\æ)‰_uVg¿[ú\Õowüjñ†O¯Š\Î_šò»°7Eÿ¼ß­j<\Ùbš;½ó\Éq\æ¯^j8k]8xŠ\Ì@&Å¶N\Ìõ¾\Ü~OE>w¦}Ù¢ú¨	\ë÷œ=ù|\íşV¹ÿ‹»ŸYŠuñ@\Ø\Úõ\çıR$¾²\Ú\å\ç‘y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0°\Ó4/^ºt\é?\æÏŸrŞ¼y¡»\ï¾Û¬¨¨0ÇŒc–••™S¦L1gÎœyvÎœ9û\'MšôK2\0\åÀÁ_|ñø/~ñs\âÄ‰\æşğó\Í7\ß4<h9sF\'x5Ï=k655™\ëÖ­3_z\é%óö\Ûo7\ï¼ó\Î\Ğ}÷İ·\Ê\ï÷$‹\0\à”\nm`MM\Í\á»\îºË”\n\ÍÜ¼ysX`‰\Ò\Ğ\Ğ`Jug7Î”\ên€œWiÿû¿ÿš<y²¹q\ãF3¶o\ßnJ\Ó\Ôüù\Ï~Hš®“]\0\È:\'Nœ˜4s\æLó\É\'Ÿ4?nÚ6Yõ\ç\İq\ÇŸ\Ğ4€¬Wj*µG}\Ôloo7\ífÁ‚Z¹}\\XXx\Ù€Œ£\çÔ´ù©•U&¤\á‰\'0KKK÷q\0\È8z¡@Ï©\Ù\Õü\ì©Yzûí·‡¤I:™¬@F› zõS¯|f½ ;8\ß\0Cû©i—lòÀœ3fL%\Ù\0\Û\Ñ\Úù6[\ÕZ„mÛ¶™R±µq!\0lgùò\åÿ\Ò™¼`ŠŠŠŸ\Ï7½\0\0¶¢c?u˜T.xüñ\ÇOKs´½\0\0¶¢\Úu\ìg.X³fM»ˆm/{\0lEg\é\Ğ\í¹\àğ\á\Ã![+{\0lE§Š\ÌÒ‘mtP½N{\Ä^\0\0[Q±\ä\Ä\0¶s\Ë-·\ä²b!6\0°_şò—9;\Ç\Ö\Ô\Ôt–sl\0`;³f\Íj\Í\ÕUÑ¥K—6qU\0l\çşû\ïß“«~l3g\Îl¤\0\ØÎ¤I“~¦k\äb\ä©b\ä\0dJn\Ù+Z__¯\ÍPÆŠ@f˜1c\Æ=öXV\Å6~üøFf÷\0€Œ¡‹¬\Üv\Ûm!]Y*¼õ\Ö[‡µZc>6\0\È(w\Şy\çLl2\Ó3\è>}º#œe]\0\È\n·\ß~ûÁ\Ç<“Bò;š|>\ß.²\r\0YAO\äK\åvX:Î€\Üteø´\ß\Z\ë‹@\Ö\å6~üø¦\ßü\æ7\æ©S§lk~\Şq\Çz±`/\ç\Õ\0 gr+++\Û5aÂ„Ğ¦M›Ò¾P \çÔ´ùI¥\09GOğ—––¶Ïš5«M—Lótıúõ\Íz\ÎÎºúÉ…\0pZeIµõW­º\Ê\Ë\ËCó\æ\Í;½r\å\Êö\Æ\Æ\ÆO-2K‡h_¶l\Ùa&¥#\nTh\ÚO¦\'\08\ZU™Dµ\Ä‘®W`FE«C“¨\×aRŒ(\0\07\Ë\ÎDb\0\à9±•””|‘L\0€gfg¨¼¼ü22\0[EE\Å\×\É\0x©)ª«¹&\0\à%±µƒÁ\ë\È\0xIlm†a%\0\à%±µJSô‡d\0<ƒH­%Œ\"\0\à%±ƒ>2\0^jŠÔ¡Vd\0¼T±±\İF&\0ÀK\Û\'\"·»\È\0xIlG$¦’	\0ğ’Øš%f	\0ğ\Òm÷“	\0ğRÅ¶_\âa2\0^\ÛG~¿ÿq2\0A¤¶[š£O“	\0ğRÅ¶Cb™\0\0/‰m›\Äb2\0^Û–@ ğg2\0^\ÛF‰¿“	\0ğ>Ÿo\ß\ï…L\0€—*6] ¹ŠL\0€—Ä¶Jb™\0\0/‰m…ÊL\0€—Ä¶T›£d\0¼$¶J‰µd\0<ƒa/ûışw\È\0x\íœ\ëóù\Ş%\0à¥¦\èbVE&\0ÀKb[¤\á\É\0x©)º@š¢»\È\0x¿\ßÿ„Tl{\È\0x©\Ö\Õ\éÁ\É\0x©)z¿.\èB&\0À3\è\Ò{º™\0\0/‰mª.šL&\0ÀKb›$MÑ£d\0<ƒ\ß\ïŸ qœL\0€g0\ã©\ÚNZ’(q}QQ\ÑUd\0\ÜR\r”f\çiY›D‡„\'j\É\0¸‘V]B\Ó;ör2\0®ª\Ú$zªÖ˜›\r\0\\)·%ñ\Ä&M\ÕAd\0\\Yµ\Å:\Ç&R\Û@v\0Àµ\è¬]\Å}d\0\\u…4\"¶½d\0¼\Ğ$›\Ş\'#\0\à•ªí¸ŠL\0€g°f÷@l\0¦i^°k×®½õõõ\æŠ+\Ì\åË—)Duuµ¹jÕª\Ä*€£R«««3›šš\Ì\Ö\ÖV\"hnn6kkkC\"¹yY\09D+5¤f¯Ü¤‚k\å\È\È!\ÚüDHö†6M9²\0rˆ~‘b\ÈK±üä ¹k\İÌ†\ê_‡C\ï\ë6D†\Ø\0\\)¶G÷›[–\Î47½z\Ï9¡\Ûô9d†\Ø\0\\\'¶½\r¯t“Z$ö5T\"3\Ä\à>±m{ã‘¸b\Ó\çbpØ¶,ŸWlú2Cl\0ˆ\r±@®Å¦WA\ã‰MŸCfˆ\rÀubÛ±z~\\±\és\È±¸NlGöo6·,›Õ½*\Ûô9d†\Ø\0\\\'6\İ\ëw›nCdˆ\rÀbki1w¬YĞ½*\Ûô9d†\Ø\0\\%6Yğş\ê§\âc\Ó\ç}€\Ø\0\Ü!6©\Ä\î¨1ß­º/®\Ô\"¡¯\Ñ\×R½!6\0ÇŠ­·*\ê\r±¸Nl‰Ti=Uoˆ\r±8Nl©J-ˆ\r±8ó\Ø\0\Ø\0b\0Ä†\Ø\0\0±!6\0\ÄF 6\0\ÄF 6\0Ä†\Ø\0À¡b“·õÑ¯¹\á†\Îy¯>~]¢¿§ÿş\æµ\×^kºa\åz\Ä\àòŠ-¤¢¥´q\ã\Æğ¶\r6t`¢?»®®.|ÿŠ+®@l\0[±}÷»\ß5Ç\Ş6aÂ„ğ\ãT\Äy|şù\çw>nll4\Ë\Ë\Ë\Í/¼0¼}Ø°a\æ\îİ»\Í#G„·\r\Z4èœŸ§`677#6\0Ä–º\Ø*++\Ã\Í\ÈÍ›7‡oõq*b[¹reøşˆ#:Ÿ¯¨¨o[½zµ¹u\ë\Öğı!C†„Ÿ›<yrøñë¯¿~¼lÙ²ğc\İN\Å€\Ø\Ò›\Ş<xp¸Z\ÒÛ\Ş\ÓÛ¹<m†\îÜ¹³óy­Òº¾¦oß¾Ÿ.@³cGøş~ô£ğc½\ÕÇº± ¶´Å¶hÑ¢ğ}½MElz\êÔ©\áû7\Şxc7±;v,\æû‹ŠŠ\Â\ÏGª5}\Ì96\0\Äf‹Ø’y.\Ş\ëNœ8a80ü8re4\Ò>}z\Ì÷Gš¯‘÷i“µ§ów==Fl\0ˆ\Ív±i<ø\àƒ\á\ÇC‡ıtYÀ#GÌ‰\'š—\\rIÜ«­\ÚED·}û\Û\ß\îõ\Âb@lb@lˆ\r\0RfÌ˜1>Ÿo»\ß\ï_\"1y\ìØ±—;Ulz V 6\0\è*¶Mftˆ\à:\äöŒ\Ä‘^•Äœ`0x]UUUbp>†aL\ë*¶8qV¯,:u\n!!6\0g#²ºX¤\ÕÑ‹\ÔN\Ç^{\í5d„\Ø\0\\\Ó\İOj\Ò,ı“SÎ±!6\0\è‘`0ø\ri†>\'ò: Š#µ¢ßƒ\Ø€\ã\æ\ä(\ëbÀq	•\ÙGrû´\Ü\ŞCjs»¾±!6€œSXXx\ên‘\×=ù/·mõ‚Áøñ\ã?ß¥9z2\"5½\n\Z\ë\ç!6\Ä´š\È\é)‰­&\æI\Õr¹-\î\é}V%’\ï5ˆ\r±d\r©Ê¾§lE^[rj\ÔócEEEW%ú3Š‹‹ \ï/\ë\é5ˆ\r±dŒÙ³g÷	\İ&±F$Ö¢juô@ ¸¿¤¤ä‹™ú½ˆ\r±\ØJYYÙ—õ„¾\È\ì=«ß™ø?\Ùö3yºO6şÄ†\Ø\0\ÒF\Äuˆ\ë%¹=d]\Å<\"ÿ&q}.şÄ†\Ø\0R\"Š\Ã|5\ÖIÿHl·\Ä\ã\å\å\å—\åúos\Ãrvˆ\rÀ”””|!\Ü\'{Wd\Ö.;+±^\îO’\ç\Îs\Ò\ßZWW\×\Ñ\ÔÔ„lŠ}ûö\í±µò)\0OPQQñu\ÙB‰}\Ú%CDvL\âU\ÜOœüw\×\Ô\Ô<T[[:t\èb²Aj\Õ\Õ\ÕmóøD€›+³†ñ/\Ù1«\Ù~‘Ù³\"·Anú?\äƒ8GªŒ“Ú„rjh\'c\'ÿ}V´\"5p£\È\Îi\İ%±N>h­\ÚÌ”\Ø\"1cøğ\á‘¡\Ì5\íUldÀ&ô¿Te¿™\í²:Ê’\ÙR™ù\ÉNv=zôW´\"&\0iPZZú\Ø_\å\ÃtØ’Y“\Üÿ£T\ß$;\Ù\Ç:‰\Ø\0’¤Te·ˆ¼\ê¬N²\ÚYv‡\Ä\ÃÚ‰–ô\ä–@ pµ\î2\Ğ:LIg¼\Ì6Kd-õ\ÒÂœ Ã›Ès\Ğ\ÎË²o\Ú\È@Ddƒ\åò¼\ÄA«£\ì\ÇrÿR­}Ÿ\ì8z¿ıP/Ö	\0‘\ÖMò¡X&q\Âê’±Gb~OKÒãš¢£õ™€¼E\'[”ÁT‰\Ú|Ñ\Ê\ì\İ\Öu\"FpMS´T¯F“	\È+\Ê\ÊÊ®\Ğ*Ìª\ÆBVu¶T«5²\ã~t:\'úœL€\ç±&Qü‡|›µf\É8¨\ç\Ïô<\Z\Ùñ\\\Å6Y÷3™\0Ï¡W*¥û¹^¹´®`\ê•Ì­zeS\×\Ñ$C\ŞEöû½\"¶\Ãd¼\Ò\Äü²ˆ\ëQ\íS¦3\Ê\ê\"¿«´\ÏYA–&b„Ü£³\ë\Ô\èd\\K0¼N{ùK4Y]2\Ëı¿\Èıo‘¼\Ûc:k\n™\0W!\â\n\èøK‰SVs§\ÈótŒ Ù\È\n]dÎ„!\êLkfŒvk¦Œµw8m\"Fp„\Ø\é\é2£¨¨\èJ\ë\0\İou\ÉøD¢R{•“\èEl/\ê…\"2N9 GH¼¦³\ÉZ]2ö\Ê\í3:[ÙD\Ñ\Åntµ{29¡°°ğ\ís${[\çù\×^ÿr@n\Ö\Ëõ:Y ‚\ÅöŠN\îI& ›U\ÙW\åÀ{BW^²š˜\'%VÈXBvÀ¦cl©.$M& \Óß :\Ì\ßuML«‰y\È:r\rÙˆ­V¯š“	°›>r`\İ*±:j\"F]½ü¡‘#G^Jz \Ãb[£U™€´QaIeö€\n\Ì\êõ¯B[#\Ú8&b„,·\Ö†ñO2)aMÁ¼X¢\Ñjb~,\Ô\ËC\É\ä°bÛ¤kP	H\æ )–¨¶Nú«\Ì>”ƒ\èI½(@vÀ!\Ç\èV=‡K& .\Ö\ZÓ­oAˆñ¬\ÜnªlŠv\× C\à@±} Q“	8\××¤™¹@½\ÖÀò\ãr[%2IvÀbûPÇ‹’	\Ğ®Ã´c£5tI›˜ûEd\Ï\é\Ğ&².\Û~¾ŠL\ägó<\ÙD‰·$tPy»\rR©\Íb\"Fp¹\Øôb\Ö2‘?U\Ù@«Jn?°ú––û+uñ‹&b\"¤À£W\Ó9ùtX\Ù\É¬©L‰f‘ÛŸ\åvYˆ­\Ê:®»…\ÕI/xµ²|¢·Kt“,€—\Ğ\Ó&V‡p³‡XK¦€Û\ëÊÄ¦\ÍU²„\Ø\0\Ü\Öd]É%¶Z2„\Ø\0\Üzl¯uskIbš\æ»v\í\Ú[__o®X±\Â\\¾|¹\ãCw¶\Óş¦\ê\êjsÕªU!‰U*@\à\']\Å\æ÷û_ 3I¢R«««3›šš\Ì\Ö\ÖV\"hnn6kkkC\"¹yYF“tW”\Ø\Î2\ä/´RCjö\ÊM*¸V,H•\â\â\âD‰\í/d$´ù‰\ì\rmšrdAš\ç\Ú\ZUl£G\æ\ÜZ*\è‡!6pœ\Ø\ÊDj&‹eXl\'?9h\îZ÷³¡ú\×\á\Ğûº\r‘!6\È\Ó$ô8b¬h¦\Äv\â\è~s\ËÒ™\æ¦W\ï9\'t›>‡\Ì\Ø.µ\Ä\ë¹eBl{^\é&µH\ìk¨Dfˆ\r\ì—ZDf3[†Ä¶\íG\âŠMŸCfˆ\r2\"µŞ¶C:bÛ²|v\\±\és\È±AÆ¤\Öõù¤\n±!6ğ‚\Ô\nh–f@lz4\Øô9d†\Ø \ãR‹–[•›\rbÛ±z~\\±\és\È±AV¤ı¾*·4\ÅvdÿfsË²Yİ›¡²MŸCfˆ\r²&5Î¹\Ù%6\İ\ëw›nCdˆ\rÒ–š®\ÓñlA\ï\ëut}\ç\Ü\Ò[K‹¹cÍ‚\î\ÍPÙ¦\Ï!3\ÄiIí½‚OG¼×ƒ\Üâ½\Ê-±\éÈ‚÷W?÷›>\Ç\è\Ä)7?Ÿµdeö ·h©Eb¡\Í\Ú<›TbwÔ˜\ïV\İWj‘\Ğ\×\èk©\Ş$}N-–´¢\å\Ö\Ûó4K[oU\Z\Õb[¤Ö›\Üú%(µ\è\ß\Ã\Õ\ÒxbK¤J\ë©zClˆ\r’n&Æ’[kR\ë*·ˆ­\Ë3U©E±õ.6]Í\Ï<RK@n\ÉHfi¯\çØˆŒˆM…6fÌ˜:‰“|\î=\Íå–\Z’|_¿•Z«µ=ª¬÷^ØˆŒ‰M…\æóùş*Bk·\æ²oç³Ÿyt\ÚòòòËŠŠŠ®”œ‘ı0,Œ6\ã¹?Qn§\É~™#1O¶/\×<¯\ë\Ès¯È¶\åÖ—\ĞZ¹¿Qn·I\ì”\çö\Ê\ãF¹=,?\Ñ/)‰3­m‘õA\åuf\ÍB»+¶¹TlD\Æ\Ä&€¹]—Uóú±¥«+©\Ğ+**¾.‚ù¦H\äû\"Q²­Tb‚\Ä\İòx–|ø•|Ì—Ç¿—û’ûÿX*W\Ê\ã7\åö¹mmH\ì‘8(›eûQ¹BîŸ%•¨Yù\×/•³–„TF\Ç$X\ë\ìµV‡zOn7K¬“ûÿ\'Q-÷¿\äı“û‹eû3òø·òw\ß/·÷\Ê\ã»ä¹Ÿ\És\Årÿ‡¥¥¥ß‘\ÛÁòø«Ã‡¿(\ç\Øfp±eTlrÀO¶>t±VöÎ¨\ØfÏ\İo\äÈ‘—–••]!Â«\åC8T~\çù›üò7Ó¿M\ÏP\é\Ê\ã\'\åş\"¹ÿ’¼\îe¹ÿš\ÄõoKl‘\çŞ—\Û%öK4I|,Û\Ë\í)‰Kíº¸o¬#R‘û-§¬÷~,÷›¬Ÿ¹\Ûú[¬ß¹F«Ñ¿Eÿ&ı\Û$•xB¶=dı\íš\ßqÁ`Ğ§\ëq\êÿ¨ÿ«ş\Ï\"\Ò/j\\r®\ÍÎ«¢t\ÖEl™›\ÕD1{\nù`> ñ¸|8j5 UVr…\Äjy¼^«­\"\äşn¹¿O\î²ªŒc‘&<–ŠU•t«V¬*¦\ÍŠö„U\í4K°ª ´*\Ò\ê\ÈZ­<®\Ò\êI«(ù»“ûOI<¬U–V[Zu\É\ã€<7R\îO«2­\ÎD,_–û\ç\ÑN\èj¥]ı\ØÊ¸\ZŠØ²!¶D\â \ÄG\"mbm\Óó8rÿ-¹¿Jb™\ç\Ñó=z\ŞG{Z„ò˜\ÒóBz~HW2’û7Y\ëP\ÑóH£Gş\Êøñ\ã?Ï‘\íHfÄ¨¨\ìyÀBİˆ-óMQm&uY\Õûœ`…ï¼­\Ü21V©y]l‘o5§\\<°*ªú®\ÍD©º®\ç\Ì\ë\Ê-Zn›\İ#úuôW³[l±/IŸ#•Õ«W›W_}µyşù\ç›0¯ºêª„~vª\ïsª\Ø\"Hõ6\È\ê>ĞØ¨\Ü\Ò<\'†\Ô2]±\ÅÉ•W^Ş¾yóf³¹¹Ùœ4iRB?/\Õ÷9]l***.\ÖóEEEWqR¹¤6ƒ.RË•\Øú÷\ïŞ¾}ûö¤~^o\ï\ëúû\â=\Ä7¾ñ¤ÿÆŠBÎ¹!5§‹mØ°a\á\í*ªo¼Ñœ5kV¸\ë\í\çõö>}®oß¾½ŠmÉ’%\æ?ÿù\Ïğı\áÃ‡#6pr\å–H³´¬€¹[cc£y\ï½÷šƒ\î|\ÍĞ¡C{ıy½½O\ëù·\Ş\Äv\æÌ™p\è}=W‡\ØÀÅ•[\äœRËµØ¢cıúõUX2?;\Öû¢GÄ…\ØÀ\Ãr‹\Õÿ\rr%¶›o¾Ù¬¯¯\ßß°aCø5Z…õöóz{ß—¾ô¥ğ¶;v˜‹/\î±)ZYYÙ­)š\è9:\Ä9”[Xbıúõ›YÀˆg‰mÔ¨Qa	iu¥MGmNnÜ¸±×Ÿ\×\Ûûşyó’K.‰\Ù\Å$\Ö\Å•bô\Å\Ä.8\ç\êÛ·o­a¦\È\íR’±ˆ\r2R¹™%%%!*G:b¯p¹5qÁR\á±i3V 6€\Ï\ĞYbt\Î72AÅ†\ØÀKbÛ¯³º	Ä†\ØÀ3X3ÿ‘L 6\Ä^ª\ØtÒ„d±!6ğ’\Øş®’	Ä†\ØÀKb\Ó\é\Ø÷	Ä†\ØÀ3\è4ğº\Æ™@lˆ\r<ƒ4CKtÁ2\Øx©)zÎ¸L&bÏ +\Ù\ç\Ã\âÚˆ\r±AşUmº\ĞW\ÉbCl\à%±Õ•\Î\ÈbCl\à%±¸L$ÁŠ+b\ãóù\Zı~ÿd\"	\ê\ê\ê:ššš’M±oß¾=\"¶V,°±b{O\ây2‘555\Õ\ÖÖ†:„˜lZuuu›n€b«\×uh\ÉD’\ÈqT\'µ	E¤­H\r\ìFš¡¯H¬\'\Ş:¿p¼k?y¼V·&CŸ…r¼\ï$!,Pi†q“n+,,¼@{b[\Û\É\äASt¦D3™ğ\0\Ë\Îl‹ˆ-2Ã|{Í‹\ÚfJ‰>™l\Ç\ÅV&q’LxcgVFL#^\'·{»loU	’1ğ*ò\å}½|¡·‘	—3v\ì\ØË£š›!MÓµ±¶\ë97²^¥¬¬\ìËŒõ\0ò\í´!†¼Lk\Ì\\¬\í\ç\à\0<Ú‚1Gy)™p):&.¼z\n‘\ái²[[ii\éwÈ„{w`s*b³¢’‚G[1§ô\"™p!\ÖÅ#zAÀº\"Ú–€\Ìt€ğ^m¾úış%d<ü…?“Lx\ç›\ê\íœ(Òš+÷Ÿ¿\Ş&\Êcæ©‚|\ÛN\í¨K&¼³C_”\Ø\Z\ç¹\Ã0F’%ğ::¤J‡V‘	\ï\ì\Ğ%\ï\Ä›6[§“%Èƒ–K•†\'Ş©Ø–J¬‰ó\Ü‹\È\äÁ\ç\ày¾ˆLxg‡®’X\ç¹\ÕòM¶œ,A|’8H&¼³C\×\Æ\ë\Æş,bk K\àuü~ÿ\é†Lx\ç\ÜÂ»*°x\ßb:m2Y‚<\Û0‰³d\Â;;ô}\Ã0‹#6õ\àY¯cŸ‘	\ï4E÷hÿµ8MÑ«Y%ò\è³`\ê\Êd\Â;ó`¼zfÏ\İOwöøñ\ã?O¦ >òe>Ôš\Æhœ\ÎMÈ”]\îİ™‡{\ê«&Ïµ\Ëş™/!\Çô9¶7I°†\r¶É¶n\Ã	É”{\ÅvL¾¡&öğ<‹É‚\ç\Ê\ì\'½“fl´»\ÅvJv`i\ßlû´$\'S\àÁc¿²—©º‘%÷\î\Ü‰=<¿\Ñ0Œ—\Éx\r\è!ÎŒ\Ñ*µ]d\È\İbkÓ“¥=\ìüW™\Z¼Šöˆ3cô4²\ãn±u\È\Î\ÜÃZ^ó!™\Z»^4\Ğe(ÉŒ»wjhô\è\Ñ_\é¡b›,¯ù„L‡›¤\×wYïƒ‰< 6³§o\'j\"¯a¨	xıs\Ğy!¾k.G;\Şö¶ì˜®\Ü\Ã\Òd\àuTfò%\ŞÁ°*P^^~™NÿHsU^÷52^\Æ:ŸŒ\Ø<°#\'2T^s&Œ&c¦i^°k×®½õõõ\æŠ+\Ì\åË—)Duuµ¹jÕª\ÄªX\'M\Û ®\à3ƒŒA:¨\Ô\ê\ê\êÌ¦¦&³µµ•H#š››\Í\Ú\ÚÚH\Îó]Ñ…Z´ƒn\Û{:u2ƒt\ĞJ\r©\Ù+7©\àZ9²ºWl¥ºPlb[%¯«!c\ÚüDHö†6M9²º‹m¢‚O\àu/\Éë¶‘1Hı\"#Ä–¦\è½:mQ\ç\Ø\æH4‘1È†\ØN~r\ĞÜµ\îfCõ¯Ã¡÷u\"Cl	‘\è\Ê<R±ù\åu§\ÉdZl\'\î7·,inzõsB·\és\È±õŠ5\0xOo¯ƒ\ß`ŠpÈ†\Øö6¼\ÒMj‘\Ø\×P‰\Ì[B\ç\Ø~¯‹¹$ğ\Ò>:ú`øğ\á‘5È¤Ø¶½ñH\\±\és\È±%\Òı‹Tm›|m›aC\É\ZdRl[–Ï+6}™!¶DdU™\è\\kR\Ùõ8…8\0bClN9\ÇV£}\Ô”\àG\"¶\'\È\ZdRlz4\Øô9d†\Ø‘U½È­*Á×¾-M\Ñ’5È¤\Øv¬Wlú2Cl‰4/\ßIt=y\í+*7²™Û‘ı›\Í-\Ëfuo†\Ê6}™!¶Dª°­/&\ØlÕ®!‘5È¤\Ø4v¯_\ÜMlº\r‘!¶DÏ±\í\n”\àz¬AF\Å\Ö\Òb\îX³ {3T¶\és\È±%\"¶}\"¶\ÇlŠ~/‘)\0R›,xõSqÏ±\ésŒ>@l‰ˆ­I\Ä6+‘\×j\ç\\kŠğ>dl›TbwÔ˜\ïV\İWj‘\Ğ\×\èk©\Ş[OU\ØQ]…*‰srEEEW’9°Kl½UiToˆ-itıD‰[“xı\é`0\è#s`—\Ø©\Òzª\Şb‹%ª3\Å\É4]\åõ³\É\Ø%¶T¥	Ä†\Øb5E\Ïêº¡Iˆp[¢\İC\0>\ÇF 6›+¶ö’’’o&ñú7D„+\É 6\Ä\æd±%µ^¨H\í]Ø…\ÌbClN›)\Û“xıL]Š\ÌbClN¥O²ı\ÒôBƒ^p u€\Ø›#\ÑJ\Í[\ÂTTT|]›¯dbs$zn-I%\Û|@lˆ-kƒÁ\ëôªh\nb;[\\\\ü2ˆ\r±9í¿¦’JAlŸHL\"ƒ+±-[¶\Ìü\îw¿k0 z_·E¿F~]8n¸\á†s¶\ë\ã\Ès½ı\È\ë4ú÷\ïo^{íµ¦\ÓV³Gl\İ•Ò…\0yÏ‡ó\É \äBl¯¿şzX4………\æ\Ì\Æ\Æ\Æğ}\İ-·h)mÜ¸1¼mÃ†\r\çlOTlz¿®®.|ÿŠ+®@l?\Ç6NÇŠ¦ ¶µ†aü‹B.\Ä©¸\ê\ë\ë;·\éı®\ÕYDJZÍ7.¼mÂ„	\áÇ©ˆ-òøüó\Ï\ï|¬R-//7/¼ğ\ÂğöaÃ†™»w\ïFl¹D\ä4Eš£§Ğ„]\"r\ÛH!b\Ó&aW)9s&¼M›¥]¥TYY~\Ï\æÍ›Ã·ú8±­\\¹2|Äˆ\ÏWTT„·­^½\ÚÜºukøş!C[.\Ñy\ØtP{\nBü­NPIÁ\rb\Óûƒ6\r\Z¾U‰%r-\Òİ¹sg\çóZ¥u}Mß¾}[›¢óR”TlRi\Â\Ø!¶HSrıúõİš¢\ßşö·cŠmÑ¢E\áûz›Š\ØôşÔ©S\Ã÷o¼ñ\Ænb;v\ì\ç\Ø$¶gDP;“}_ii\éwR\é&`‡\Øô\ÊD\Ïg577Ÿsñ`É’%qÏõt\î,±8q\Â8p`øq\ä\Êh¤):}úô„\Ï\Ñõô±Ù€N?¤«T%û¾ñ\ã\Ç^;\éÎ=»Y„l‹-\"7½P©˜´yºxñ\â„\åU\âÅƒ|0üx\èĞ¡Ÿ.x\äˆ9q\âDó’K.‰yµ±\å\0½ ëŠ¦(E\"ü*²¹[thµ\İÌ¤ƒ.\ÛR‰5)¾÷”H±”,B®Å¦´\ãì¥—^šõ®ˆÍ™b[%±\"\Åós\"¶\È\"\äZl\é†6gcbs¯\Ø\ÖJT¦(¶‰?‘Ep»Ø¨\Ø<†ˆ\é\İ@ ğ\ç¥X-±š,bClBš’\ï†ñ\\*\ï\Õ÷‰\Ø> ‹€\Ø›Óš¢{¤j{2E±\İ+\ï?B±!6§‰\í`ª\0¤	;J\Ş\ßB±!6§‰\í°\ÄôT\Ş;v\ì\ØË¥\ÚcŠp@lˆ\Íqb;&\Û\Ä4\Şo\Êû’I@lˆ\ÍIbK«“­¼¿µ¤¤\ä\Çdbs’\ØZ$F¤ú~\ËM\ân2	ˆ\r±9Ilm\"¦\ëS}¿\Ï\çÛ¥3„I@lˆ\ÍIb\ë1\rN\ãıõòş*2	ˆ\r±9Il¡Ñ£G%¦\è\ßDl›\É$ 6\Ä\æ$±\é}¤\Ñ}T~\Æ2	‰â´¥\ë›ÇˆL™¦o•8I6!Q\ê\ê\ê:ššš’M±oß¾=\"¶V,‹òòò\Ë\Ò\í`k­$\ßA6!Qjjjª­­\r:tÈ‘¢hiiq•Ôª««\Û$\æqd}ÖŒœ®”Fy©V}ºÒ•\ß\ï¡¨¨\èJ2½!\Ä9Reœ\Ô&”\Ó\"˜Nü»\âD+R\ë‚vó\Ğ\î6œ§ûªü¬\'¬õ!¹ıD§\×_\È2¸‰ŠŠŠ¯\ë52\áb\Ãi÷ ö\áÃ‡_d­Uº]«A‰\Ó:C¯˜\'\ã\à‚V\Ì\åx=K&\Ü]±•Ê<•©Ÿ¯+X\ÉÏ¿KbƒD›0rû¦\Ä8yº{\0(¶q¬—\ë~±M\ÔAğYü}~]cA\Æ\Õ.±Eª\Æi\ét7°9&g\ëùb2\áî¦¨Ny8GR&ñª~;\ê9\r]´Y\âa½ÁVlSY@œõ\íôN4é€¿\ã\Z]wAg\ãµ.>\Ğñ§eeeW°— \Ë\Ç\â?ô\Ô	™p÷·Ó“z%\ÓI“\ÊL¥&\×~«’;bI\ï\ZödAluºH™p1\Òü½.\æ\âÔ¿\Ï\ê#÷°\ÕLUÉ\Ğ\æ«6c\Ù{!±mIu\Õ6p\ÎNü‹[°\ë½Ğ \Ë\ê…\ë„~»Ø“`\ãg\â#\í“I&Ü½+uÁdş\é}ô²¼v±º´Y]J\î\Ò.&\ìYH\ã3qD¿@É„‹\Ôh÷·ÿ\ÖjYºxó)«Sğ{z\Ù^;³—!I±¦\àş\è¹I\"u—\ç\Òa]\Ö\Ö=Ú´Hg\Î9È«\ÏDC]|\àß‘²ûe¯ş: _\Ô\ç%©\ä¨	ˆU\×<°·J¼˜ÿ«VlÔ‡\ĞS\é\ÎO@b	òñ\0f >tEöÿ\Õòe\ÇÜ‚\Û>Ù™\ås¨Ã¸I»‘	÷‹­I+2ñ\Ô\Ï_d_O\ÒSd\Âı\â£“\ÉD\Üü0P?¿Ä¦£\\ö“	÷\ïHıÀ\ŞJ&\Êõ½ÿEö‚ö$\îÿ°‘(&\ÉÁ@}\Ï~^\Óó«d\Âı\ßPgP\Ô÷*5\İwd\Âı\ßP\í%%%\ß$öÀ@}\×t(\Şód\Âı;R{\ãLd\ê»\ïóp@«o2\áşiJ\ÅöE2‘y¨\ïŠÏƒ/¾‹L¸¼¢°†\Ğ	5\Ë0Pß™\è©FŸ¸­\Ô—{¨\ït8•«\"\îşvú\Z+^;\ê\ç¼)ª§f¾@&\\L0¼N¯Ü‘	g\Â@ı\ì©ğEï²{˜^­#Î‡ú™G«b\Í-™p\Ù]¬#È„+¿”¨ŸcÇ½\\—\Ôq\Ò\Å\Å\Å?°Z/­ŠÉ\Ë\Ño{\í%O&\Ü_y3P?¥/v­|\Í¡ÛY\Ã\ä)—!\ßğS\äñ1™ğÔ‡•ú‰\çª.\Ø\"’\Ï\Çõd\ÊeX\'¦›È„7a ~B\Í\ÑPbc5x—6E\ç\éºd\Âû0P?\îg`{©µ³ ‹{wª~›\ï$ùõ?C\ä51–\Øô\ÂGŠ{\Ï1¼¨«T‘‰¼&\ï\ê\Ëÿ\İ\ÚEl\\]v÷·\Õ]W”L@„|¨/ÿ_e´Ø¸`\àşºTb\r™€X\ä\Ë@ıŠŠŠ‹-‰«\Øv³\ç\İ/¶U:D‡L@ox} şOú\Óm*6©X+\Ø\Û\î\ÛZ-\Ã\É$ƒ\êO“0o¸\á&]õzULû5‘	H\ÔW©…>÷¹Ï½Ó¿³_¿~÷³W]|Ë¾o\Æsd\ìÀ…õ\ÃR“˜£úô\é33ú1¸·)º‡ş:Á/N\'ÔŸGbÓ›û\ÅvP½\ÈdArN\Z¨ß›¼\"\Ï\Ï`Ï¹Sl‡%¦“	\Èòq—Ëú‰Vd3¨\Ü\Ü{€\Ó!%drE–\ê\'\Û\ÌT¹uP¹¹Ol§Dl¥dœ@†\ê§z\îlš%7*7‰MO\ê \à4l¨Ÿ\îÎ¹¹LlmŒ‹\Î@ı®R\Ón\'\Ïô\Şı¤\ë\ë8\ç\æ\"±u\ÈÁ1˜L€›Hb ~,©½\'aZ·}zZ¬\×Q¹¹Dl!V7o şE]ô@Œ\n\ëYKVfr‹–Z$\ÚØ¬…,ˆ\Íd\Ş)ğ\n‘ú7\İtÓ‰›o¾\Ù<\ï¼óN@Z\Ñr\ë\íùš¥güøñŸW±‘	ğ\áŠ*†\Ôz“[¿¥ı{¸Z\ê4\Ê\Ë\Ë/\ÓÒL€×¤–€lbÉ­5	©u•\çÜœ‚^4\Ğ¯dòLj=\É-©\Ñ,u\"\Ú\ÍC»{	ğ\0—[BjHò}ıbTj­\Ööd¨²\Ş{9»\"\Ç†1R;\è’	ğXÅ–h³\Ğ\îŠm.»À[©4GO‘	\È\Ã\æ¨]\ç\Ø\"cIi†:Hlº\â12y&7;¯Š\ÒY×M\Ñ{u\Ú\"2•[¬«•võc++\àj¨3©=¤M’	ğ(3bTTv<˜GŠˆN	®\ÃO\È\äQ³Ô®±¢HÍ©øış\ß\ëb.dò¤r‹–\ÛÂ‚\Äf÷ˆ~ı\Õ\\\Òı‹Tm›\É\äI\å–\Î91¤\æ\"±U\ê‚\Édò´rKµ9NFªµ\Z]\ZL@Un\ÉH\n©¹°b«¹U‘	\È\Ã\Ê-‘fiY\nÜ‡\ß\ï\Ç0Œ—\ÉP¹\Å|¾©¹³b\Û*ñ\"™\0\äÖ­¢cD[‘f\è®@ °€L\0rûTbıúõ›YÀˆ×‹mŸˆ\í12yN¸B\ëÛ·o­a¦\È\íR\ân±5‰\Øf‘	€p\åf–””„tez\Ò\ábü~ÿQ‰\Éd \Ì\åºf©|&¾G*\\Œ\ì\Ä·’	€\ÎVŒ®SZF&\Ü-¶3\Åd ó3qDb:™pwST\Ë\îad Sl\Ég\âq2\á\î\Ø^RRòM2\Ğ\Ùm\Ï\ÅÉ„»\Å’ù52\Ğù™¨—XJ&Ü½õòö\ÉÀ§†ñ/iŠ¾E&\\Šì¼*6	zX|ö¹xA>\ï‘	#\Í\Ğqº¼NN6\0ÂŸ‰G\å3±ŸL¸œ@ 0J/\"\èlºdhŠ\ZS¤jû˜Lx£ü¾^{\\K¼A6 Ÿ	ƒ>ùœ&\ŞÙ¡ßª½®7ô¾\È€W›¢ß’\Ï@™ğ\å\å\å—\éøQÙ±?şódòÑ£GE»A‘	QQQq±\ì\Ø\Í#G¼”Œ@¾¡½\n/ £¤¤\ä<]oT\Êò\ãL\áù†ûEEEW’	\ï\îà·¬ò×\rÈ£Š­U¾\ÜL&¼-·Wõd*ƒ\å!\ÄvBûx’	\ï\Ë\í÷\Ú\×Mnıdò@lM3\ÉD~\Èm®R˜D6À\ãb\Û-\Û\Ód\"\ä6Ù’\ÛCd¼ŠHm³\Ä_\ÉD~}›Tn†a<G6À£\Çø*‰d\"ÿ*·azAA¢’l€\Åö©\Ø6‰<DgŞ•\ß\"ñ&\Ù\0}q?+rû€L\ä):û®µ\Ò\Õ{Ú©—Œ€G\Äö€\Ó\ÉDSVVöe\\³\Îa5|øğ‹\Èx )z‡\Ä12‘\ç\è€y9ö\è<V:ˆ˜Œ€›\Ñ9\nõ4™€‚Ù³g÷“ƒ\á]úˆqv\àòŠ\í\Z½òO& ú ¨Õ±v¥¥¥\ß!\àFt#\áƒLÀ9h\çF‚e\ÆH².ı‚6u\n/2]Œù\Ö(…[\É¸ğø\í`Vˆwp\ÌÔ¹­¤r»—l€Ë\İ½ˆ@& \Şr›~û‰\à \à¢\ãö˜³\É\ÄE*¶›ôœ›|ş™l€ğù|\ÚQ—L@D–ø“¦†l€\×th™€^±–ø;-r\ÛXÀ\à\ìŠmƒˆm	™€„\Ğ%ş\ä \Ñ%şv³\Ä8Xl5:}™€„±–ø;¨S0³\Ä8´)ú7kñp€\Ä\Ñ\Ù@\äÀ\Ù!Kü+¶§\å\Ø\ÜM& úˆ\Ü\Ö\ê@\àj\ÒNA\ÇYÚ¢ 2r\0½¦3òÿ€l€C*¶q:\× ™€t\åö¼öuƒ>²¹FL\Ö\É\È\Ø!·‡u”‚|[\ŞE6 —h\×$H&ÀÃ˜b\rÁ¢\×7\äkòT¦.û©•Z³+,\"\ÃDˆ¡ÁV¤9úC½  ’{…l@\Ä\Ö.\Ç\á·\ÈØŠ.ñ§\Ó\ÇHÔ“\rÈ\Øtø_	™€LTn\á%ş\äv;KüA6‘\Ö\ÂQ9\î\æ\ê\ÚıCb\Ä 2¶ Kü\ÉÁu˜%ş S†1M/ªH\Ç1Ÿ…ô\âA—h/,,¼€l\Í\Ò/\è,ñ™¨\Îª¸bÈ¬3t\Æ2¶£Kü\É¶E0–ø\ÛÑ«ğ=‰‘1\ép•|Ã¶r\Å\n2plˆS­\í\";ğ\ïV\Óa\Ù\0»\Ğ!}±Ä¦\ç\à\Èdkj–ø»«\í]\Ä\Ö\ÆE\È*:½Œ%·\édl\Û u%¶Z²YG\Ä6Á\Z_ú8\Ù\0›©%±Ióô:2¹ª\ÜF[\ç\ÜşH6 ]´é©«ªi\åF6 §†1T¾iõ`¬&`C\Õ6±#ğù|ƒ%N\Ë\É\Ç4\Ív\íÚµ·¾¾\Ş\\±b…¹|ùr\"…¨®®6W­Z’XÀQ\åaDj_•øD\ã\àj–sQ©\Õ\ÕÕ™MMMfkk+‘F477›µµµ!‘\Ü<,£KüI\å\Ö(\ÑTRRòE2\â<´RCjö\ÊM*8¦3÷:\Ö	\à¤r;6v\ì\Ø\ËÉˆ³\Ğ\æ\'B²7´iÊ‘•ô±­g‰?\ç¡Bd„\Ø \r¤IZ¥—\ï\r\Ãø>\Ùp—\ØN~r\ĞÜµ\îfCõ¯Ã¡÷u\"ClP¾¨°Øš\î™YQ]\"¶G÷›[–\Î47½z\Ï9¡\Ûô9d†Ø  Ü‘÷1k¡˜;È†óÅ¶·\á•nR‹Ä¾†Jd†\Ø ‚\ß\ï¿[\å&’»Ÿl8[l\Û\Şx$®\Øô9d†\Ø\à\Üfi™µ8óB²\á\\±mY>;®\Øô9d†Ø %%%?±µ†ñO²\Øx¹ÁZ\âo\r\Ùp\Øô*h<±\és\È±A***¾.b;)±M\×U #\ÎÛ\Õó\ãŠMŸCfˆ\rzÀZ¥\è°4M÷±ÄŸs\ÄvdÿfsË²Yİ›¡²MŸCfˆ\rz?\çö\Ü^\ÜÉ½\Ø4v¯_\ÜMlº\r‘!6HmŠJ\ÕÖ MSVıv€\ØZZ\Ìkto†\Ê6}™!6H[D«\Ä²‘±\éÈ‚÷W?÷›>\Ç\è\ÄIb\ÆËºBKüeYlR‰\ÜQc¾[u_\\©EB_£¯¥zCl@`®‚%ñ3²‘y±õV¥Q½!6°¯Y:[\åÆ¢¹™[\"UZO\ÕbCl\\³ô\ç:KnK62\'¶T¥	Ä†\Ø ùÊ­X§=’\ê\í%²‘Áslbƒ\ì\"RûNX\éóù–“\rÄ†\ØÀ3]%r;-r\ÛPÀˆ\r±‡š¥\á%ş$v²\ÄbCl\àtY?[£\Ä!–øClˆ\r<ƒVk~¿ÿ‘Kü!6\Ä¢ˆ\ím]\âOÏ¿‘Ä†\ØÀK\çİ–\éS½rJ6b/\É\íE\í\ë¦}\Ş\ÈF\æÄ¶q\ãF3˜ÿöoÿfö\ï\ß?|û£ı¨óyùñ\áˆ~O\×m«W¯6¯¾újóüó\Ï7`^u\ÕU	ı\î\È\Ï\Ñ\Ğ\ß}\íµ×šNY\Õ±A\Æğù|ót”‚TnÉ†ıb[¿~}Xdÿõ_ÿenØ°!¼mûö\ífEEERb»ò\Ê+Ã7o\Şl677›“&MJJlz¿®®.|ÿŠ+®@l•\ÛTk¬9d\Ã^±†e²lÙ²„\äo›V[úX¥˜\Ì\ï\ïúsô¾V}‘Çfyy¹y\á…†·6\ÌÜ½{7bo`\Æ-:x^\äöÙ°Ol*•É™3g\Ò›\n\'Òœ¼ñ\Æ\ÍY³f…+·dÄ¶r\å\Êğı#Ft>¯•£nÓ¦\îÖ­[\Ã÷‡‚\ØÀ;Ÿ\è\"¸%d\ÃYb\Ó\Ê\ê\Ş{\ï5\Üù\ÜĞ¡C“:\Çi†\îÜ¹³\Û\ß}ûöEl\à¹f\ék6\Ş\ÕdÃ¾¦hO\ï\ï*?½\í\Úd\ìz\Ş.R½%S±M:5|_+¾®¿ûØ±cœcoµ\Ä\ßV–øKOlzÁ@/h¥¤BŠ\\<\ĞóZ‘\×…\åò\Ì3Ï„/Z´(üø\æ›o\î|Ş¯¯¯\ïü™ú¼VoÉˆ\íÄ‰\æÀÃ#WF#M\Ñ\éÓ§\'|®§Çˆ\rµ\Ä\ß‰½º\"bK½»‡^\É,--\rN›yz;|øğ\Î\ç8`7\Îü÷ÿ÷°$ôö\Ö[o\ro¼fÔ¨Qæ—¾ô¥p•¦U–6CµI²|ğÁsš±G1\'Nœh^r\É%\ç4GxšŠ%ş\è KS<…6EµIªMSm¢\"6±gĞ‹	ù¼ÄŸ“Å¦M\ÓX\Ø\0;\ï¶D—ø\Ón!ˆ@l\à´¯µ\n\Ö-ˆ@l\à%¹\Í\Ñ!X:±ˆ\r¼\Ô,h/‡\Ø\Ä!²ÄŸN„\Ø\Ä^ª\Ü\ÂKü\éÄ•ˆ@l\à¬%ş\Î\è”\ã]\â±!6\ÈCtq]$F‹ñ\âˆ\r±Ab-ñwH—ùó\Úˆ\r±A£Õš.\Ìl-\ĞüU\ÄF 6ğ\n}|>\ß\Ûi¯,ñ‡\Ø@‘\Ûr¯,ñ‡\Ø@\'\"µ—¼°ÄŸS–¬Cl\0Á0Œ\ß\ê(¹ı¹[ÿ‡ººº¦¦&„dS\ìÛ·oˆ­•O¸]n\Ótğ¼n¶ÿşššš‡jkkC‡r¬,ZZZ\\#µ\ê\ê\ê6‰y|2À\ÍÒŸ©\ÜÀ7şıòAœ#U\ÆImB91tµy]¿Ô©_T´\"5ğR±\Ğ9İ¤‚{™l\ØGYY\Ù>Ÿ/D&\0r\'·\ÈudÃ¶jX\Çì¶‘	€\"\Õ\Å ]GAnX\âÏ–/‹€\Ä)2û*c µKü¥/¶©šK2\à\0†~‘Tmû\äCy8ß—øK³§y$\0ÁZ\âo[¾/ñ—fÅ¶XÄ¶L\08\ïÃ¹F¢%^G6’nÖ¿*ñ™\0p †aüS*¶’’’“¤¿–’	\0‡\"b[h­‚UF6\ÎYƒ\ä\ëdÀÁûUnÒ¼º›l$T±\í¹=I&\0œÿa½C\å&’{ŒlôŒ|–<\İG&\0\Ü\Ñ\Ä*±¦=ZL6zü8©cq\É€K0\ãû:a¥H®Šl\Ä›N\è9ŒL\0¸if]­KüÉ‡w}G—øKSl:LL\0¸]\âO\ÄvL>Ä\\\â/M±™\äÀ¥\è²~R™4I4VTT\\LF\n\nFıS¸­L¤r\Û\íµ%şÒ¨\Öt\Z¨v\0÷\ÓG>\Ì¥r;-18\Ï\ÅV¬\ç9$\0¼ó¡®–\ê\í¬aCó8“´z\åh\0ğ\Öû\Ú£óñÿ±Ï•ÿÿ G€÷>Ü[C°&\ä\Ûÿ.\Õ\êsò¿\ï\à(\0ğf\å6\İZkVı\ßÿx›#\0À»ò[Un>Ÿ\ï\é<úŸWI¬`\ïxûƒ>\Â\Z_ú÷<ù7‰\ÌÿÆğ8R±}K>\ìº\Ä\ß*¯ÿ¯Ú§Ï­‹P@’])‚;%r\Û\â\å%şt$†ü³\Ù\ã\0y‚5\Ü\ècˆÑ«KüI\Åv<¯\ä5ºÄŸˆm¿N\ÆXVVöe¯ıº\0WdO\äR­§\ËÓ‰\0N\È\í\×<V±i—«\Ù\Ë\0yŠˆ­^+\İ7=ô?™\Ìt\çH…óŠÈ M*·ºıQ¡©\ØØ«\0 U\Î\"kV©›ÿkf\áö(\0D*·T\n†aLq\ëÿ ûHmZ³7 i\Şe-\Îü°K\Åös\í\îÁ€sƒ>k\Öó.óù»± \Å\Å\Å?\Ğ\n¯¹\é\ïÖ¡T\"·]\ìA\0ˆ\'‰ğk\\²ÄŸ~±md\ï@\\\Ê\ÊÊ®\ĞsV:q£v\êuAS´&ú@šŒ9òR‘…,?\èô¯\"¶\r:\Ñ${\r\0zeüøñŸa\ìq-//¿Ì©§.­}ò\Øc\0(}ôü•ˆ\ãt0ü†C\ÅvP\â!v\0$\Û\Ü\ÓóXgı~ÿõ\Û\'\Ú½\0Iş¬}\İÃ¸\ÉabÓ«¸\Å\ì!\0H	©Ø°F)\Ü\æ ±i\Ç\â!\ì\0H©\Ø\î\Õù\ÏD&3\"¶ü=\Ù3\0®Lnµ*·ù¹ü;¬+·LY\0¶Un:«F»\Ï\çûk®ş]¬†)‹\0ÀVJKK¿#bi•¦\à\Ê\\ü~(S¯Ö²\'\0 U\Ó)‘Ì»\Ù^\â\ÏjŸd/\0€\í\èRµ…—ø\Óó^ª\Î\É\Ï/Ó¾tcÇ½\\·ûd{3{\0\02Bd‰?M&–ø³\ÄfF‡lYWEµóğQ¹\ß,1ƒ½\0¶¡³ˆX\Ş\Ë\Ôòs7u•[—\èˆTs\0\0vWWoJØ¾ÄŸ5\Óo\\±\åò\n-\0\ä\"šJ‘Wšˆ\Ãlş¹\'\ãH\ítaa\ád\02Ša\ÏYyvıL\å\ÜXb“\í\É8\0d«r{\ÈZ¿t²?³µ‹\Øi\0È¶\Ü&Yr›k\ÇÏ“fgU—j\íz²\0YG\ä\ã\×!XróûtV0¼.\ê\Ü\Z¹\0@N\å6Ìº ğjº?kÔ¨Q©\Ø\Ãø	™€\\7K¯\Ñ\É!Eno¥ñc¦I˜7\ÜpCˆ~k\0\àt‰?iB¹½Ÿ\Â*µ\Ğ\ç>÷¹wú÷\ïoö\ë\×\ï~2\n\0ÀZ\âO‡@Hb‰¿°\Ô$\æXgvy\0[¬‰\"?\Ôq	,ñ7-Ä¦!7\0p\Z}¬1 §zX\â¯7yEg\0<\08\Ûq–øK´\"›A\å\0N”\Û_´¯[ •b3S\å\ÖA\å\0\Â\çó=©£şû¿ÿûo)V`\Ó,¹Q¹€s¸\îº\ëª~úÓŸšx,\ÅÁ97\0pa)EI­Ä³\ÖmOt}\ç\Ü\0À9R‹’‘J\ê=	Óº\íÓƒ\Ôb½\Ê\r\0%µ«3£\"–Ü¢¥‰…½ü\\\0€œH-´¢\å\Ö\Ûó4KÀIR\ëMnı”Zô\ï\áj)\0\ä\\j=É­5	©u•\ç\Ü\0 §R\ëIn\ÉHf)\0d”\Ë-!5$ù¾~1*µVk{2TY\ïe.7\0\ÈHÅ–h³\Ğ\îŠm.»\0\0r\Ùµ\ë[d,)\ÍP\0È©\Ü\ì¼*Jg]\0Èª\Üb]­´«[YWC ÌˆQQ\Ù9ò`)\0\'4K\í\Z+Š\Ô\0À•[´\Ü$6»Gô\ë\è¯\0«\Ü\Ò9\'†\Ô\0À•[ª\ÍY\0\0\ÇUn\ÉH\n©€k*·Dš¥e\\(\0\0Un‘srH\r\0<!·Xı\ß\0\0\\\'·I6S\0M¤B«-`–\0ğR\å6f\Ì©€§°\Ä\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ,\0\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0\Ä\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0\Ø&±FY/q’L€›\ÄVÖ›\Ø|>\ß2\0n“[sb;QXXxY\0\ÏTm~¿.\0·\Ê-Ö¹¶“Tk\0à©ªsk\0\à¹ Z\0O!Ú¸(±\Í #\0\à•ª-|®j\r\0\\‰\ÊK+3‰:«\ËGk—ól\íG$\êÀ‚ŠŠŠ‹\É\Z\08’¢¢¢«DVµ\"«³	Œ:ˆ\îú\Ñ!\Í\Õ¹½,€c*4S•\ÍLFhq¢\n\0rJqqñ¤\Ò:\ÓUP\'N4.\\h¾ù\æ›\æşıû\Í3gÎ˜Š\Ş655™o¿ı¶ù\Â/˜“\'O5\Ô\ê´a7‘]\0\È:zµ3vDK\é{\î	K«½½\İL”7š÷\İw_WÁ…\è\ï\0Y—Zt\ÓSgVVV&%´®TUU™\Ò¥3/\0\ä¦ù)RE7;\ßÿ}\Ó>üğCó®»\î:§r£Y\n\0E/DŸSS©\é93;ÑŸ-7=\ç\Æ\0\Èd´*ºùiW¥«r\ë\Ò,]KöÀv´ŸZôy5=§–Iôœ[ôù6m³\0ÀV´ómô\ÕÏ³gÏš™fúô\é\ÑM\Òö\0Ø†[‹Q ]:²Á\æÍ›\Ï¡ 1½\0¶ \İ.¢/¤Ó­#Y¢;ñ\ê\ØRö\0\Ø\Õ­‹\ÈeÑ¢Ef6yé¥—\Îr\Å\Ş\0\0»\ÄÖ¹0‹“\Ê&\Ú\ìjeo\0€-ˆP:Ï¯<x0«b\Ó~m\ÑS±7\0À®Š­S.‘\í\ÙB_ô\ïgo\0€\íb\Ëˆ\r\0¨\Ø\0\0zƒsl\0\àÅŠ«¢\0\à9±Ñ\r\0<\×›«‘¿ø\Å/y\0\0öc-©\×\ÎXQ\0ğZstmô\ìÙ¨Ú¢\×B`v\0°k\İ\Ğó±€×ª¶ºlÍ {\Ë-·0ƒ.\0d]{@\× \Èôšw\Şy\'k\0@ö\ĞU£¢›¤v¯R-5V©€l\ÊmZ´\Ü\ìZW´Kó“uE ·r‹\\-Õ•İ“\í\Ò1s\æLV‚\0\ç4K£Ï¹E7Ou„Âºu\ë\ÂcK#\çõVÏ¡©ütDAt\ç\Û\èsj4? §\è‰ıè«¥i\ÆZ.\0€c\Ğ~nRmmˆ¡H\èˆ\í|~BÀ‘\èğ+kl©Vq\Í\ÑSE\r:ª\Úu\ì\'Ã¤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ì\åÿ\í\âO\æT\0\0\0\0IEND®B`‚',1),('9',1,'/home/dell/stconline/server/target/classes/processes/TestRecord.TestRecord.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Â\0\0°\0\0\0:òe\0\0 \ÍIDATx\Ú\í\İ	•\å™/p+Æ¨7©)“šŒukjn*5\ËJYV&sS™l†h™Ä¤¬¡\Ï\éÓ€vF\ÜP7,	IL4J¢Q\"2a\âzñ¹5˜m±QP‘ˆŠDV7–†f\é\ï¾O\ç\ëˆ4\r\Øô\é>\ß\ïWõ\Ôwv\Ì\Ó\'\ßÿ¼\ßò~\0\0pÀe¿}¢ı‹\ŞùkÔ¨\Éó¶U\ê\â›\ænyıƒYr\Ï\ß^· =\İ>)Õ‘?ºó\Ùe•º`\âC\Ü0gGz¼¯»\âÿ½ò|º}\Ô\Îÿ\Î%“[7\ê6\0}N\n­_§š\ê3©N½x\Ò#Û§­Ê–¶dY\Ú©>V~\İ#“[\ÛVG\à]u\ï\ÊE?¼eÑ–Ñ·,\ÜrÁ\Ä9ÿ½<{5=>\"^÷l–]q\ËSÙ´\Ê\ë*u\áÄ‡¶Å²ò:\0\èS:²ì±‘7<˜ıh\ê³m£&?ºm\Ì‹WDxU‚°b\åölş¿{q\ã\Ø\Ûo¾\à\×u\\x\ã#;.º±%F„_\Ø)`?·1\ËFEİ¾8»û‡·,\\·w5Z€šˆ€úñ½ôR\n§.úuË‘7\ÌÎ®¹o\í[#\Ó(\ï‘4\"¼xR\Ë\æx\İ-·½~\éoßš^w\å/ÿ´\ì­1·?³9‚-F„¿š½ú\Ê\ëª>/6¡sÍŸß˜\ÏÍ²\ëfo\Én\Ôq\0ú”V‡Møó[o^=\íùõ\ãş\Ïs›F\ßüÔ–¯ôø\ã?½û¹\rS\È^/¿\î]t\Ó\Ü\í±üù\İÏ¯ÿ\ám‹6\Ç\ë¦,\ÈV¦\Ç~£\Ç\Ê\ç\Å\íX\ÆHò\âIs\Û\âñ«\ï[÷„M¢\0ô9·>\İûøb3\æ¨ÿ˜·mÔ”Ç·\Æ\æ\Ğ8\àe\ÔM­\Û\Æ\İñÜ¦\ÊkG^»³C.º±¥ıgw/_¯5¹u\Û\ä\Ù\Ë\ÖE\ĞU^wÑ¤G\Ú*·\ï\\’\İ\Ër8¢\ã\0ô¥\Ñ\à‡SM*‡\Ô\é7?•½>ù\ÑlfY\Ü1ËN\Ë\Ö\ÊH¯<\"<ıW3×·¦\å—/M¡9ú\æ\'Ú¯¶ú©§²\ì\êò\ë©Œ\Ë÷¿œ>|Ü¨›İ¤\ã\0ôµ ü\Ç±ho\ßøHö\àMó\Ö\Ç¡³—d\Ùø)Od*o\"ızªÿ=ög\Û\âÀ˜)ó7­J)ù\ä–,[p\Õ}«Ş8g\ã\Ú\ß-i[^s~õ\çış¯\Ù\ÔUY6\æ\Ş5\Ù-qŠ\Å\Ì\Ëf””ùº\Î\ĞW‚ğ¬7³ì²´<<‚+†ù\Ï\'²×«\ÏL\Ï—jjªq´\ç´\ÕÙ«1¼\ä¦y\Û.<w{¥\Òs—\ìüy?¾\ë¥%ã¦¾ğ\ÊÎŸ§ó\0\0ıó\Ç\ãa3fÌ¸g\âÄ‰\'L˜\Ğq\ÑEe\Í\Í\ÍYccc6t\è\Ğ\ì‚.\ÈÆ»uüøñ+FŒq¡P^ıõÁ·\ß~ûúó\Ï??>|xvó\Í7gó\æ\Í\ËV®\\™mŞ¼9\"Ë¶nİš­Y³&›?~v\ÇwdgŸ}vv\î¹\çvŒ=ú\áR©t¸.\ĞG€‡Ï={\İyç—¥`¶hÑ¢\ÎÀ\ÛS‹/\Î\Ò\è16lX–F\ãu€~5\nüÕ¯~\Õ1r\ä\Èl\áÂ…\Ùñüó\Ïg#FŒ\È\Î:\ë¬\Õ\Í\ÍÍ‡\é.\0}Ú†\rFŒ;6»şú\ë³õ\ë\×g=!6¡\Æ\çs\Î9o\ÛT\n@Ÿ	F^}õ\Õ\Ùö\íÛ³6iÒ¤¾9`À\0L\0Ğ·\Ä>Á\Ø\Z#·ı‚\×]w]6dÈe:@Ÿ\Æ\Ä>Á\Úº»Í¤gŸ}vG©T\Z©\ë\0ô	±I4#C{C@3xğ\àö\Ğ\'\Äy‚qŠDoº\âŠ+¶666N\Ó}\0j*fŒ‰“\å{k4Xñ\Üs\ÏeiD¸Í3\0\Ô\ÔÌ™3\ï‹cö\ç2]inn\ŞQ,‡ù+\0P31whL›V\×^{m[ccc‹¿\05h\ÇÜ¡µğè£nOA¸\Ü_€š‰«H\ÄÚµ°nİº„\íş\n\0\ÔL\\B©r‰\Ş“x\Çeœü\0¨™¢Z„\0\ÔÔ©§Z\Ëa‡  ¦.¼ğÂš\í#\\³f\ÍVû¨©q\ãÆµ\×\ê¨\Ñ3f¬q\Ô(\05õ“ŸüdY­\Î#;v\ì*\çPS#FŒøÁ\ÙgŸ]“™ebŠ53\Ë\0\Ğ\ÂpGo\Ï5\Ú\Ú\Ú\Z›E\Í5\n@\í3\æÁk®¹¦WƒğŒ3\ÎX\å\ê\0ô	\Í\ÍÍ‡~ú\é‹/\î•|\ì±\Ç\Ö\Åh\Ğõ\è3\Î=÷Ü±qq\Şı}…ú¶¶¶MMM[]¡€>\ç\ì³\Ï^y\íµ\×\î\Ïg:Ò¿±¦X,.\Õm\0úœ8p%\×Mœ8q„a\Ç\èÑ£ÿ\Z\ç\rÆ¦X\İ Ï†\ágœ±\æ¿øE¶iÓ¦\Ûz\Î9\ç\ÄÁ1\Ë\í _„\áĞ¡C—y\æ™O?ıô>0&ö	\Æ\æP#A\0ú•8 eÈ!\ÛÇ·-qo6—.X°`m\ìs,\êÀ\0ú§Å¥\Ñ\Ü]1ª;\å”S:&L˜\Ğö\ĞCm_µjÕ¸`\å*1öı÷ß¿.¦M‹c\"\0\ã<A›B¨)Ø†¦š•jY\nÇ¶¸„RUµ\Ç>ÀT­1mšc\0\ÈK8f\r\r\r\Ñ	\0ò„\Ó	\0ò„Ÿ\Ğ	\0ò\Z„ˆ ·Š\Åb\Çi§ö)\0 ·A\Ø\Ü\Üü\0 —\Zw<ø³:@nƒ0Õ¿\è\0y\r\Âí©¾¨\0\ä5c.Ñ¯\ê\0y\rÂ­…B\á:@.¥\Ñ`{CCÃ·u€¼·¤\á‰:@^ƒpsSS\Ó\É:@.\Å\å˜\\\Ô	\0ò:\"\Ü\×)\Ô	\0ò\Z„Rı»N\0K¥Ri}ª3u€¼\ß.‹\ç\é\0y¾Y(.\Ğ	\0ò:\"|#\á(\0 —Š\Å\âÚ¦¦¦\Ñ:@^G„«S]®\0\ä5W–J¥+t€¼\áŠTW\é\0¹”Fƒ\Ë…\Â/u€¼—‹\Å\ëu€¼_IAx£N\0\× |)\ád\0 —\Z_Haø[\0 ¯Aø\\ª\Ût€\\*‹‹SN\Õ	\0ò:\"|:…\á]:@.•J¥§\n…\Â\ïu€¼\á‚„÷\ê\0y\r\Â\ÇRŞ§\0\äRccã£©f\è\0y\rÂ–T³t€¼\áœT\ê\0y\r\ÂY1*\Ô	\0ò\Z„3b?¡N\0K¥R\é\ÅbqN\0\× üC\n\Âù:@.Å¬21»ŒN\0K1\Ïh\Ì7ª\0\ä5\ïLAøŒN\0K)ok\ê\0¹W§«\Ô\ë\0y\r\Âß¤ |I\'\0È¥¦¦¦I\Åbq©N\0K)¯O#\Âe:@.\n…_–J¥\å:@^G„W§\á\n\0 —Rş,\ÕJ\0 ¯Axyª\Õ:@^ƒpLªµ:@^ƒğ\ÒT\ët€\\*\n”J¥7u€\\*‹\ç¥\á\Û:@^G„g¥\á;:@^G„\ÃÒˆpƒN\0K)‡¦Ú¨\0\äR)IAØ¦\0\äuD8(\Õf\0 —\n…Â‰)·\è\0¹\Ô\Ğ\Ğğ\íR©Ô®\0\äÒ AƒKA¸5n777–nuğ\àÁ_\Ğ\0\êR\nº·\Z·¥å´Ìº¨%:@½á­»	ÀÎŠQ¡NP—pHŒ»\nÁb±¸X—\0\È\í¨\Ğh€¼Œ\n\Ûw„\Ëu€\\(‹\ãw1\Z®3\0\äF\n¿wª‚ğ\r W\Òpd\Õhp¤\0\ÛQ¡N\0K…B\á2AÀ~‘e\Ù!K—.]\Ş\ÚÚš=ğÀ\ÙÌ™3\Õ>Ô¬Y³²‡~¸#\Õ$\ß*€~$B°¥¥%[³fM\Ö\ŞŞ®>@­]»6›3gNG\n\Å	¾Y\0ıDŒ…`Ï†a\Z!ºR@›CX\ÏVl*õ\Í\è\'b¥-¼!€ \ì¦6¾½2[:ÿ\ælñ¬wVÜ\ÇŸ ¨û \ÜğÖŠ\ì™c³§ÿx\É{*‹ç„Ÿ ¨\ë \\¾ø\ïÁJ½¶xšğ„\0õ„\Ï=øó.ƒ0~‚ ®ƒğ™™—w„ñœğ„\0‚P	B€z\r\Â8J´« Œç„Ÿ ¨\ë \\2wb—A\Ï	?AP\×AøÆŠE\Ù3÷{ÿf\ÑôX<\'ü!@]a\Ô+n{_\Æc‚O\ÔnÙ’-yt\Òû7‹¦\Ç\â9\á\'\ê6c\æ˜\ç\Ş\Ğ\å>\Âx\Î\ì2‚ ş‚0ôV.™ıeú\è.C°Rñšx­Ñ¡ ¨‹ \ìnht(\ê:÷d¸»Ñ¡ „\0ı:÷5+%!@¿B%¡„\0‚P	B\0A¨!€ T‚@*A • „J\ä7\Ó\Ûv[Õ¯ù\Ú×¾ö÷\Æı\ê\×\í\é¿s\ĞAeŸÿü\ç³x@\ĞwF„]…Zuˆ-\\¸°ó±\'Ÿ|ò}¹§Ÿ\İ\Ò\Ò\ÒyûÓŸş´  ÿ\áW¾ò•lØ°ayæ™÷÷%+÷>ø\àw\ï¯Zµ*;\å”S²~ô£üñ\Ù+¯¼’½ñ\Æq\Ä\ïù¼¸è¡‡fk×®„\0ôNN›6­s³\æ¢E‹:—q_‚ğ¡‡\ê¼ı\İ\ï~÷\İç›››;›;wnö\ì³\Ïv\Şş\â¿\Øù\ÜÈ‘#;\ïÿù\Ï\î¼ÿı÷wŞÇ\èµ Œ\ÛGuT\çh,–»{Owû\"c³\è\Ë/¿ü\îó1\n\Üù5x`\çsK–,\é¼ı­o}«ó~,\ã~<^\Ë <\í´\Ó>U,Ç§z¾±±ñq\ß@€\á”)S:o\Çr_‚0n_|ñÅ·=ö\Ø÷\á;ï¼³\Ë÷8°óù\Êh0\î÷ö>\Â’ohªY©6¤\Ê*•\Âpºo @‚po\ë\êu6l\È?üğ\Îû•#G+›F/½ô\Ò]¾¿²9µò¾Ø„º»ı»»¿7u\Ï=÷D\ĞMIµ,\Õö\êğ«®B¡0\Ê7@\îñgÿô§?\í¼\Ì1\ÇtŞƒb†}ü\ã\ïòh\Ô8\å\"ûÒ—¾\Ô\í8=„mmmÙ!C²®\Âo§\á¾\0ı<\Õûkúô\ér×§°\ë\ØM\î8\á„ş\Î7@\Ö\í\Ì2¥R\éğx«º¶¥\åiyg¡P8U8\ä,ã€—]U=M±–‚n\Î.Bğ\é½¿t{jEZE\á`DXs¦\Ñ\á\ÈT;*A\Ø\Ô\Ô4iW\á \ëv\Ò\í\ÂlcùˆÑ“öôo$a\İ\\}¢|^\á\ã±ü 7\á Mº-¡ \0‚P\nG\0A(…#€ „\Â@\nB\á ¡p„‚P8BA(ºV¹È­„\ÂÈ¥–––kÖ¬`=T¯½öÚ²„\í¾Y\Â\è\'fÏı³9s\æt¬^½Zõ@Îš5k[ª	¾Y\Â\èGÒŠ{|\Z\ÅlŒMz}µJ¥RÖ—ÿû\Ê\Õ.…#@khhøH¬\àt\á\ä5?&@ƒğ‚\á\äV©T:<­œ:t\á\äRZ	ı“ D8¹•V6ÿ,@n\r8ğ\ÈR©´C\'@^ƒğhAˆpr«¡¡\á_ÓŠc»N \\J+‡K+‰m:Á¾È²ì¥K—.omm\Íb’ù¾6#\Ñô\éÓ³©S§f7\ÜpCö£ı(>|x\á8cÆŒ>õ\ß9kÖ¬\ì\á‡\îH5É·\nzYú…|Œ d_E¶´´dıirù¶¶¶>ùßµv\í\Ú,\æ&6• ô²AƒW*•¶\êû\"F‚®°Ò³a\è\n+\Ğ\Ë\Z\Z\Z¾‚\Ğÿñ\Ø\'®¹éš›\Ğ\ï\n…·\èû\"V\Ú\ÂKB¿\Ö\Ô\Ôtr\n\Â\Í:ÁşÂo¯Ì–Î¿9[<\ëÇ·\ã1Á\'¡\æ\\Œ\Ã\Ëu‚ı„\ŞZ‘=3clöô/yO\Åcñœğ„PS¥RiH\n\ÂM:Áş\n\Â\å‹ÿğ¾¬\Ôk‹§	?A5\Â466n\Ô	öW>÷\àÏ»\ÂxNø	B¨©‚§§\áz`\á33/\ï2\ã9\á\'¡\Ö#\Â\á)\ß\Ñ	¡ „¼G¤\á[:Áş\n\Â8J´« Œç„Ÿ „Z/Jaø¦N°¿‚p\ÉÜ‰]a<\'ü!\ÔzDxiªu:Áş\n\Â7V,Ê¹\Üû7‹¦\Ç\â9\á\'¡\ÖA8&\ÕZ`a\Ô+n{_\Æc‚OB_\Â\ËS­\Ö	ö[nÙ’-yt\Òû7‹¦\Ç\â9\á\'¡¦J¥\Ò)W\êû#c\æ˜\ç\Ş\Ğ\å>\Âx\Î\ì2‚j=\"¼*\Õ\n Gƒ0ôV.™ıeú\è.C°Rñšx­Ñ¡ „š(‹R.\×	z*»\Z\nB\èSJ¥\Òu)—\é=„{2\n\Ü\İ\èP\nB\èU)\'¦zE\'\è© \Ü\×¬” „Ğ«Š\Å\âM)_\Ö	z*• „ş6\"œ’j‰N !\ä5oIõ‚N !\ä5oOõ¬N !\äR±X¼3\á3: „\× ¼+\á\Ó: „K…B\á÷¥R\é)@\nB\ÈkŞ›‚pN ÿV\éVg	B\ÈOŞ—‚ğ1 7ƒ°6]U¼f\îÜ¹\Ù\ç>÷¹\ì\àƒ\Î=ô\Ğ\ìè£Ş£\Ï\Ş\×÷	BÈ©b±8½±±±U\'¨Õˆ°«\à9ò\È#;_´hQ¶v\í\ÚlÄˆ{ôyûú>Aù\rÂ™)\Ñ	úZt\ĞA?ÿüó{õyİ½o\ç¯«û•ú\ìg?»\×ÿ\r‚úW\Î.•J\é}-?şø\Î\Ç#Ø=ö\ØlÜ¸q#¼\î>¯»÷\Åsx`·Ax÷\İwg÷\Ş{o\ç\íN8AB½ŠŒ0\Ô	úZ®Zµ*»\ì²Ë²£:\ê\İ\×s\Ì1\İ~^w\ï‹û±ÿ°» Ü¼ysg\Å\í\Ø\×(¡N\Åf\Ñ\Ø<ªôµ ¬®¼;\ÊÛ›\Ï\Ş\Õûª\ïW‚NB¾ƒ°5˜\Ñ	úZ~ÿû\ß\ÏZ[[;o?ùä“¯‰Q^wŸ\×\İû>ù\ÉOv>¶dÉ’\ì¶\Ûn\Û\í¦\ÑiÓ¦½o\Ó\è{¸QB?§N\Ä):A_\Â\ï}\ï{¡£·Ø”›7.\\\Ø\í\çu÷¾[n¹%ûø\Ç?¾\ËS6vu°L„hõÁ2‚\ê/\ÄIõ:A­‚P	B¨u>Ó¬\é‚PB.Å„\Û1ñ¶NĞŸ‚06y\îª!°/AøL\\ŠI\'0\"„\× |6.Î«BAy\r\ÂRİ¢BAy\r\Â%©¦\è‚PB^ƒğ\åb±x“N !\ä5_I5Q\'„‚ò\Z„\ËJ¥\Òu: „\× \\^,\'\è‚PB^ƒpEª«tA(!¯A¸²T*]¡BAy\r\ÂÕ©.\×	¡ „¼\á\ÚTctA(!¯A¸.Õ¥:Á¾x\à„— „ş­T*½™\ê\"`_´´´\ìX³f\0\ë¡z\íµ×–¥ l÷Í‚\Ş¾],\Ï\Ó	ö\Å\ìÙ³6gÎœÕ«W÷‹ Ù²eKŸÁY³fmK\åt&\è\å\á;…B\á,`_¥÷ø4Š\Ù›ôúrM:5K?üúòc»„ÚŒ7¤\á0 \ßõU„\ßü\æ7ÿA7€\ê•\Ã\Æ4\"<U\'¨gƒ\r:.B°\\Su¨\ÂM©št‚zV,—V\á\Ö¢+@%\Û\ÒJ¢A\'\È\Éh°³ššš&\éP	\ÂÍ…B\á$ ¿\ã-;a©T\Úq\Úi§}Jw€XIlIõ] ‹\Å#\Ò÷»c\ç ,\×\"\Û\Ó\Ê\â›:A~¿§u‚A©K`E±µP(|C\'¨7\Í\ÍÍ‡\Å&\Ğ\İaª\Çu\ná¶´²øªNPo\Òhoú\îB°’\íiy¸nA~BoY7¿£\Úã—´nQAxDüÈ‹ª|§]mr®©©\é;\İ¡\ÃÊ©óƒ¯§`¼R\' \ß+‚%»\ÙT\äDc\êıû¿,}Ï¯\Ó	0*4\Z$—R¾T,\'\ë\ä\ÜN\ÓM½»o\ĞhŒŸMu»N@\Î\ÅL2»8Ÿ\êz!?¦Q\á\ït\è<h *7\r’“\ïı\ãq’½N\0ñ\ËxX\ÕA2W\è9	Â˜wt–N\0••B\ç…J\Z\Z>¡\ä\ä;?+\ÂP\'€\ÊJa\è\É\'Ÿœ]~ù\å\Ö\rò P(\ÜW*•\Ó	 bTª,\Õx­ \'?şş;˜\Ñ	 ‚©,/…!y\Â\Û\ã\n\0F\í~c„!yP*•~“‚ğ%\0!¸«\Ğ%©wq¾lL³¦ \Çwó¼\Ùù©\×\á•q­N€\Ü›I©[)Ç¦Z£ »a¸\ÃÈ:^”‚ğM\0!¸§\ï\ÛadHá™©\Ö\ëÁ½}¿‘!õ„CŠ\Å\â&€|†\à‡Rı¦¼Ü_gŸ!u£|\å•\Í:ùÁø\Û,2/\ì&»z‘!uaĞ AÇ¥Q\áV€|…\à\å^VU»\n\Ã\ê¬\Ô\än>ú•4\Zübª\í:ù\nÁ®B®:»{¾\ÂfRúµÁƒ6\á€|…`waø\á=Á\ê\ÇÑ¤ôK§œr\Ê?‹\Å€ü…\à\îÂ°}/Bp\ç0´Ï~\å„Nø»¸§N@>Cpwa¸7!XQ½™ôC\r\r\r0`À!iù±X\Ù\Ä\Å~O<ñÄ¿/•J‡Ÿ|ò\Éÿ3­|ş\é´\ÓNûTú5ş\Ï\Í\ÍÍŸI\Ë#b3UZ\Õ\Ô\Ôô¹ôü¿¤û_ˆ}8C†ùrz\ßWS}½P(|#-O¯ûfz\İw\Òó\ßM\Ëï•ş”oHÏ—\Òí¦¸¾bzüÔ´ü÷ôø°´<=\İ?+==<\İ?/\İ‘\î_\'U§\å¨tÿ\ÒôY£\ÓrLZK\Ë\Ë\Óò\'\éù+\ÊSq]•\î_“\Ş;!İ¿6\Õu\é±RMLOJß”jrº?%}\Ş¦\å-\é5·\Æ\ÒòôÜ\éuÿ7-\ïJ÷—^óû´¼;-\ïM\Ë?”¯÷\Çôüôôi93.›–³\ÓòÁTsR=\\¾ªú\ÜT¦jM\Ï\ÏK\Ë\Ç\Ór~Z>‘–O¦\åÂ¸¼PªE©ş’jqTzü¹´|>-_HÿÖ‹1\átZ¾”[š–¯¤ûQË¢\Òı\åiµ¢\\+\Ëp^3²¤Z›^·.-£Şˆ“\Ó\Óı·\Òç½•n¿\ê8O/\İ_ŸnoHµ1*NYH\ËMiÙ––Q›Ëµ%*½§=-\Û\ã@–´Œ\ÚVU\Û+•\ß›6+\ËTQ1Ê‹*\ßÏº+«\r¨Ÿ*\Ø\â½|ß‡w1l/?¾7¦\ïÁJ§£zeUµÜ±S½»²K\ÏWV€[«ª½\\[\Òó[ªV¤•\ë¦\ÊJ·¼\Ş+\ã´\Â|\'VÎ±’•uºÿf¬¼\Ë+ñué±µ±rO\ËXÉ¯N\ËU\å•ÿ\ë\éşk\åpøk90^ğˆ IË—#T\ÒrI9d^(‡Î³\åz&B)-ŸJ¯y*B+-Dˆ\ÅbË¡\ÖZ¹G\"ô\Ò\ã•C0\ÂğòU\Õï°Lõ§Ï´œaš–÷D¸\Æuö\"l\Óò¿\"|\Órj„qZ\Ş\áœ\ê·\Öqõ…\ïr\ß¡QGÈ§\ç¡Ÿ\ê\êø\êgñ£ \İ?\ÊÓ“I¯»,~D¤º8~T¤\Z?2R?:\â¤õø?H\Ò\íÄ“8/~¬¤;\Åøñ’şı“\ã\ÇLª\ã\ÇMú\áô\íø±GuÆŸT\ÇÄ¡ôØ¿Å£ôü¿Æ¥?\Òò\Èø1?¬†ú\éø‘›=\ãGWºÿñ#,ı\à:,~”q\Æÿ#~¤•/@ı!«\r¨\ß\án¦\ì\é\á•ş\0ô—Í£=µ°2©f\0\è7aØ“G:¹€>†»:š³§\Î#z€£E\è\ã\Æ\ìb\ÄÖ“3\ËL\Ğb\0ú\Ã\Èp\Ì5*\èw#\Ã\ê0œ|À]}¢úu¦U _?\È>=!@İ÷&D… \0u32Ü›P‚\0\Ô\å\ÈpO6“=À1\0\ätdXÙ§(\È]\î\êüC\0¨\ë0S‚fŒ W*#À9¸Š\0y–/R*\È\'W\ë@€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A€ „\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0ğACoU_7µQ§\0¨\× \Ú]‹\Åñ:@=‡\á\Ú\İ\á†¢K\0\ärTX*•®\Ô!\0ò†»\ÚW¸\Ñh€Ü\n\í oaøº\Ñ \0¹•F€Ãª‚pŒ\0\ÇQa\ç¾B£A\0\ê^„]ŒüRµ”O¡h\ßi?\áöTo¤jmjjš\Ô\Ü\Ü|˜®\Ğ\ï\r8ğ\ènsR¸mİƒYeªO¥\ØQ,§\åWu€~9LA6=`¶7\ØEµ\Z!\Ğo\Z4\è¸4’Û¼s \r><›<yr6oŞ¼lÅŠ\Ù\æÍ›³\Ë5k\ÖdO<ñDvë­·f#G\Ü\Õ\Ôkm…B\á$\İ O‹£A¼£:\Ä.¹\ä’ÎÛ¾}{¶§.\\˜=z\ç@\ìp¾!\0}:«7…¦@Ì¦M›¶W¸³\éÓ§g\Í\Í\ÍN¾ o‹Í¡);ª7ƒ¾ø\â‹YOxõ\ÕW³ó\Î;\ï=#C›I\è3\âÀ˜\ê}‚‚±Ï¯\'\Å\çU‡a\ì3t\0\r\0}BZ½9´§F‚»\Zî´™ôq\İ ¦\â<Á\êı‚±OpŠ}†\Õûc“¬¿\05\'\ËWºu\ë\Öl»ô\ÒK«7‘.öW\0 &b\ß`õŒ1qŠDoX´h\Ñ{f Iu¸¿\0½.Nc¨>@æƒœ&±·ªOº¹Iı5\0\èu\å	´;\ÃhÊ”)Yoº\ã;\Ş3›¿\0µÂµ•0Ši\ÓzSl†­\Ú<ú–¿\0½.Ğ»ûW®\\Ù«A\çV_\Â\É_€ZŒ\ß\r£\ÊÚ½%ş½\ê\ß_€ša-B\0Œ!\0µb!\0y:j€\\¡óÈ¯4»²V3Ëœşùf– ¶b®\Ñ\Ø?g®Q\0r+®	X}õ‰\Ş=\Ú\Õ\'\0\è\âz„):\\€<\n[z\ë\nõ§zª+\ÔĞ·477V,Ûªœ‰óüzú¼Ás\Ï=·z“h[ü»º@ŸP(Nª\ŞD\Za\ØS#\Ã	V‡`ü;ñ\ï\é:\0}-GU‡al&}†\ä\0š\Ø\'¸\Ó\æ\Ğ\r\×m\0úEV&]¸p\á^Ÿ\"1v\ì\Ø÷`|® ?„\áI\Õû«7—\Æ4ó\ç\Ïïœ›´2Qw,c`„e\ÌS}²|õ>A›C\è7\â@–\ê£I?`=\îÀ\0ú¥8\Ï0æ¬fO*fŒ‰“å›šš¾£‹\0ô{1[yn\Ò%®­¾„S\ÕTio\Å\Ú1w¨i\Ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0 6ş?ø¡\äõq=È¡\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_hi_actinst` VALUES ('2505','Entrust:1:12','2501','2504','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:04.235','2019-07-09 11:57:04.236',1,NULL,''),('2506','Entrust:1:12','2501','2504','reviewEntrust','2507',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:04.237','2019-07-09 11:59:12.234',127997,NULL,''),('2513','Entrust:1:12','2509','2512','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:11.385','2019-07-09 11:57:11.385',0,NULL,''),('2514','Entrust:1:12','2509','2512','reviewEntrust','2515',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:11.385','2019-07-09 11:59:15.636',124251,NULL,''),('2524','Entrust:1:12','2520','2523','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:21.148','2019-07-09 11:57:21.148',0,NULL,''),('2525','Entrust:1:12','2520','2523','reviewEntrust','2526',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:21.148','2019-07-09 11:59:30.491',129343,NULL,''),('2532','Entrust:1:12','2528','2531','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:24.604','2019-07-09 11:57:24.604',0,NULL,''),('2533','Entrust:1:12','2528','2531','reviewEntrust','2534',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:24.604','2019-07-09 11:59:03.705',99101,NULL,''),('2540','Entrust:1:12','2536','2539','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:36.062','2019-07-09 11:57:36.062',0,NULL,''),('2541','Entrust:1:12','2536','2539','reviewEntrust','2542',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:36.062','2019-07-09 11:58:52.867',76805,NULL,''),('2548','Entrust:1:12','2544','2547','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:40.289','2019-07-09 11:57:40.289',0,NULL,''),('2549','Entrust:1:12','2544','2547','reviewEntrust','2550',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:40.290','2019-07-09 11:59:40.388',120098,NULL,''),('2556','Entrust:1:12','2552','2555','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:57:58.350','2019-07-09 11:57:58.350',0,NULL,''),('2557','Entrust:1:12','2552','2555','reviewEntrust','2558',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:57:58.350','2019-07-09 11:59:40.692',102342,NULL,''),('2564','Entrust:1:12','2560','2563','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:58:13.375','2019-07-09 11:58:13.375',0,NULL,''),('2565','Entrust:1:12','2560','2563','reviewEntrust','2566',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:58:13.376','2019-07-09 11:59:32.632',79256,NULL,''),('2572','Entrust:1:12','2568','2571','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 11:58:34.845','2019-07-09 11:58:34.845',0,NULL,''),('2573','Entrust:1:12','2568','2571','reviewEntrust','2574',NULL,'SS_Review','userTask',NULL,'2019-07-09 11:58:34.845','2019-07-09 11:59:24.201',49356,NULL,''),('2578','Entrust:1:12','2536','2539','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:58:52.868','2019-07-09 11:58:52.874',6,NULL,''),('2579','Entrust:1:12','2536','2539','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:58:52.874','2019-07-09 11:58:52.874',0,NULL,''),('2590','Entrust:1:12','2528','2531','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:03.706','2019-07-09 11:59:03.706',0,NULL,''),('2591','Entrust:1:12','2528','2531','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:03.706','2019-07-09 11:59:03.706',0,NULL,''),('2594','Entrust:1:12','2501','2504','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:12.234','2019-07-09 11:59:12.234',0,NULL,''),('2595','Entrust:1:12','2501','2504','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:12.235','2019-07-09 11:59:12.235',0,NULL,''),('2598','Entrust:1:12','2509','2512','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:15.637','2019-07-09 11:59:15.637',0,NULL,''),('2599','Entrust:1:12','2509','2512','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:15.637','2019-07-09 11:59:15.637',0,NULL,''),('2602','Entrust:1:12','2568','2571','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:24.201','2019-07-09 11:59:24.201',0,NULL,''),('2603','Entrust:1:12','2568','2571','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:24.201','2019-07-09 11:59:24.201',0,NULL,''),('2606','Entrust:1:12','2520','2523','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:30.491','2019-07-09 11:59:30.491',0,NULL,''),('2607','Entrust:1:12','2520','2523','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:30.492','2019-07-09 11:59:30.492',0,NULL,''),('2610','Entrust:1:12','2560','2563','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:32.632','2019-07-09 11:59:32.632',0,NULL,''),('2611','Entrust:1:12','2560','2563','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:32.633','2019-07-09 11:59:32.633',0,NULL,''),('2614','Entrust:1:12','2544','2547','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:40.388','2019-07-09 11:59:40.388',0,NULL,''),('2615','Entrust:1:12','2544','2547','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:40.389','2019-07-09 11:59:40.389',0,NULL,''),('2618','Entrust:1:12','2552','2555','approveGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 11:59:40.692','2019-07-09 11:59:40.692',0,NULL,''),('2619','Entrust:1:12','2552','2555','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 11:59:40.692','2019-07-09 11:59:40.692',0,NULL,''),('2624','Contract:1:15','2620','2623','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:01:35.734','2019-07-09 12:01:35.734',0,NULL,''),('2626','Contract:1:15','2620','2625','subProcess',NULL,NULL,'Sub_Review','subProcess',NULL,'2019-07-09 12:01:35.736','2019-07-09 12:05:36.075',240339,NULL,''),('2628','Contract:1:15','2620','2627','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-09 12:01:35.736','2019-07-09 12:01:35.736',0,NULL,''),('2629','Contract:1:15','2620','2627','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-09 12:01:35.736','2019-07-09 12:01:35.737',1,NULL,''),('2631','Contract:1:15','2620','2627','smContractReview','2632',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-09 12:01:35.737','2019-07-09 12:04:55.409',199672,NULL,''),('2634','Contract:1:15','2620','2630','qmContractReview','2635',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-09 12:01:35.737','2019-07-09 12:05:04.685',208948,NULL,''),('2641','Contract:1:15','2637','2640','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:02:29.692','2019-07-09 12:02:29.692',0,NULL,''),('2643','Contract:1:15','2637','2642','subProcess',NULL,NULL,'Sub_Review','subProcess',NULL,'2019-07-09 12:02:29.695','2019-07-09 12:05:18.749',169054,NULL,''),('2645','Contract:1:15','2637','2644','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-09 12:02:29.695','2019-07-09 12:02:29.695',0,NULL,''),('2646','Contract:1:15','2637','2644','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-09 12:02:29.695','2019-07-09 12:02:29.695',0,NULL,''),('2648','Contract:1:15','2637','2644','smContractReview','2649',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-09 12:02:29.696','2019-07-09 12:04:41.738',132042,NULL,''),('2651','Contract:1:15','2637','2647','qmContractReview','2652',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-09 12:02:29.696','2019-07-09 12:04:42.259',132563,NULL,''),('2658','Contract:1:15','2654','2657','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:03:00.669','2019-07-09 12:03:00.669',0,NULL,''),('2660','Contract:1:15','2654','2659','subProcess',NULL,NULL,'Sub_Review','subProcess',NULL,'2019-07-09 12:03:00.671','2019-07-09 12:05:33.771',153100,NULL,''),('2662','Contract:1:15','2654','2661','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-09 12:03:00.671','2019-07-09 12:03:00.671',0,NULL,''),('2663','Contract:1:15','2654','2661','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-09 12:03:00.671','2019-07-09 12:03:00.671',0,NULL,''),('2665','Contract:1:15','2654','2661','smContractReview','2666',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-09 12:03:00.672','2019-07-09 12:04:50.909',110237,NULL,''),('2668','Contract:1:15','2654','2664','qmContractReview','2669',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-09 12:03:00.672','2019-07-09 12:04:59.553',118881,NULL,''),('2675','Contract:1:15','2671','2674','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:03:21.324','2019-07-09 12:03:21.324',0,NULL,''),('2677','Contract:1:15','2671','2676','subProcess',NULL,NULL,'Sub_Review','subProcess',NULL,'2019-07-09 12:03:21.326','2019-07-09 12:05:22.018',120692,NULL,''),('2679','Contract:1:15','2671','2678','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-09 12:03:21.326','2019-07-09 12:03:21.326',0,NULL,''),('2680','Contract:1:15','2671','2678','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-09 12:03:21.326','2019-07-09 12:03:21.327',1,NULL,''),('2682','Contract:1:15','2671','2678','smContractReview','2683',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-09 12:03:21.327','2019-07-09 12:04:53.207',91880,NULL,''),('2685','Contract:1:15','2671','2681','qmContractReview','2686',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-09 12:03:21.327','2019-07-09 12:05:02.402',101075,NULL,''),('2692','Contract:1:15','2688','2691','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:03:31.927','2019-07-09 12:03:31.928',1,NULL,''),('2694','Contract:1:15','2688','2693','subProcess',NULL,NULL,'Sub_Review','subProcess',NULL,'2019-07-09 12:03:31.929','2019-07-09 12:05:15.600',103671,NULL,''),('2696','Contract:1:15','2688','2695','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-09 12:03:31.929','2019-07-09 12:03:31.930',1,NULL,''),('2697','Contract:1:15','2688','2695','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-09 12:03:31.930','2019-07-09 12:03:31.930',0,NULL,''),('2699','Contract:1:15','2688','2695','smContractReview','2700',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-09 12:03:31.930','2019-07-09 12:04:45.910',73980,NULL,''),('2702','Contract:1:15','2688','2698','qmContractReview','2703',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-09 12:03:31.931','2019-07-09 12:04:52.475',80544,NULL,''),('2709','Contract:1:15','2705','2708','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:04:16.831','2019-07-09 12:04:16.831',0,NULL,''),('2711','Contract:1:15','2705','2710','subProcess',NULL,NULL,'Sub_Review','subProcess',NULL,'2019-07-09 12:04:16.833','2019-07-09 12:05:17.858',61025,NULL,''),('2713','Contract:1:15','2705','2712','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-09 12:04:16.833','2019-07-09 12:04:16.833',0,NULL,''),('2714','Contract:1:15','2705','2712','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-09 12:04:16.833','2019-07-09 12:04:16.833',0,NULL,''),('2716','Contract:1:15','2705','2712','smContractReview','2717',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-09 12:04:16.833','2019-07-09 12:04:48.375',31542,NULL,''),('2719','Contract:1:15','2705','2715','qmContractReview','2720',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-09 12:04:16.834','2019-07-09 12:04:56.258',39424,NULL,''),('2728','Contract:1:15','2637','2644','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:41.738','2019-07-09 12:04:41.738',0,NULL,''),('2729','Contract:1:15','2637','2647','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:42.259','2019-07-09 12:04:42.260',1,NULL,''),('2730','Contract:1:15','2637','2647','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-09 12:04:42.263','2019-07-09 12:04:42.263',0,NULL,''),('2731','Contract:1:15','2637','2647','cusContractReview','2732',NULL,'CUS_ReviewContract','userTask','u20190609235903','2019-07-09 12:04:42.264','2019-07-09 12:05:18.744',36480,NULL,''),('2736','Contract:1:15','2688','2695','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:45.910','2019-07-09 12:04:45.910',0,NULL,''),('2739','Contract:1:15','2705','2712','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:48.375','2019-07-09 12:04:48.375',0,NULL,''),('2742','Contract:1:15','2654','2661','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:50.909','2019-07-09 12:04:50.910',1,NULL,''),('2743','Contract:1:15','2688','2698','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:52.475','2019-07-09 12:04:52.476',1,NULL,''),('2744','Contract:1:15','2688','2698','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-09 12:04:52.479','2019-07-09 12:04:52.480',1,NULL,''),('2745','Contract:1:15','2688','2698','cusContractReview','2746',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-09 12:04:52.481','2019-07-09 12:05:15.587',23106,NULL,''),('2750','Contract:1:15','2671','2678','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:53.207','2019-07-09 12:04:53.207',0,NULL,''),('2753','Contract:1:15','2620','2627','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:55.409','2019-07-09 12:04:55.409',0,NULL,''),('2754','Contract:1:15','2705','2715','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:56.258','2019-07-09 12:04:56.259',1,NULL,''),('2755','Contract:1:15','2705','2715','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-09 12:04:56.262','2019-07-09 12:04:56.262',0,NULL,''),('2756','Contract:1:15','2705','2715','cusContractReview','2757',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-09 12:04:56.263','2019-07-09 12:05:17.851',21588,NULL,''),('2759','Contract:1:15','2654','2664','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:04:59.553','2019-07-09 12:04:59.555',2,NULL,''),('2760','Contract:1:15','2654','2664','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-09 12:04:59.560','2019-07-09 12:04:59.560',0,NULL,''),('2761','Contract:1:15','2654','2664','cusContractReview','2762',NULL,'CUS_ReviewContract','userTask','u20190609235902','2019-07-09 12:04:59.561','2019-07-09 12:05:33.765',34204,NULL,''),('2764','Contract:1:15','2671','2681','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:05:02.402','2019-07-09 12:05:02.404',2,NULL,''),('2765','Contract:1:15','2671','2681','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:02.410','2019-07-09 12:05:02.410',0,NULL,''),('2766','Contract:1:15','2671','2681','cusContractReview','2767',NULL,'CUS_ReviewContract','userTask','u20190609235903','2019-07-09 12:05:02.411','2019-07-09 12:05:22.013',19602,NULL,''),('2769','Contract:1:15','2620','2630','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-09 12:05:04.685','2019-07-09 12:05:04.686',1,NULL,''),('2770','Contract:1:15','2620','2630','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:04.689','2019-07-09 12:05:04.689',0,NULL,''),('2771','Contract:1:15','2620','2630','cusContractReview','2772',NULL,'CUS_ReviewContract','userTask','u20190609235902','2019-07-09 12:05:04.690','2019-07-09 12:05:36.069',31379,NULL,''),('2774','Contract:1:15','2688','2698','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:15.587','2019-07-09 12:05:15.587',0,NULL,''),('2775','Contract:1:15','2688','2698','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-09 12:05:15.588','2019-07-09 12:05:15.588',0,NULL,''),('2777','Contract:1:15','2688','2776','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:15.603','2019-07-09 12:05:15.603',0,NULL,''),('2778','Contract:1:15','2688','2776','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:05:15.603','2019-07-09 12:05:15.603',0,NULL,''),('2779','Contract:1:15','2705','2715','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:17.851','2019-07-09 12:05:17.851',0,NULL,''),('2780','Contract:1:15','2705','2715','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-09 12:05:17.852','2019-07-09 12:05:17.852',0,NULL,''),('2782','Contract:1:15','2705','2781','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:17.860','2019-07-09 12:05:17.860',0,NULL,''),('2783','Contract:1:15','2705','2781','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:05:17.861','2019-07-09 12:05:17.861',0,NULL,''),('2784','Contract:1:15','2637','2647','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:18.744','2019-07-09 12:05:18.744',0,NULL,''),('2785','Contract:1:15','2637','2647','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-09 12:05:18.745','2019-07-09 12:05:18.745',0,NULL,''),('2787','Contract:1:15','2637','2786','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:18.751','2019-07-09 12:05:18.751',0,NULL,''),('2788','Contract:1:15','2637','2786','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:05:18.751','2019-07-09 12:05:18.751',0,NULL,''),('2789','Contract:1:15','2671','2681','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:22.013','2019-07-09 12:05:22.013',0,NULL,''),('2790','Contract:1:15','2671','2681','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-09 12:05:22.015','2019-07-09 12:05:22.015',0,NULL,''),('2792','Contract:1:15','2671','2791','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:22.020','2019-07-09 12:05:22.021',1,NULL,''),('2793','Contract:1:15','2671','2791','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:05:22.021','2019-07-09 12:05:22.021',0,NULL,''),('2797','Contract:1:15','2654','2664','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:33.765','2019-07-09 12:05:33.765',0,NULL,''),('2798','Contract:1:15','2654','2664','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-09 12:05:33.766','2019-07-09 12:05:33.766',0,NULL,''),('2800','Contract:1:15','2654','2799','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:33.773','2019-07-09 12:05:33.773',0,NULL,''),('2801','Contract:1:15','2654','2799','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:05:33.773','2019-07-09 12:05:33.773',0,NULL,''),('2802','Contract:1:15','2620','2630','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:36.070','2019-07-09 12:05:36.070',0,NULL,''),('2803','Contract:1:15','2620','2630','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-09 12:05:36.071','2019-07-09 12:05:36.071',0,NULL,''),('2805','Contract:1:15','2620','2804','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:05:36.078','2019-07-09 12:05:36.078',0,NULL,''),('2806','Contract:1:15','2620','2804','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:05:36.078','2019-07-09 12:05:36.078',0,NULL,''),('2811','TestPlan:1:16','2807','2810','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:07:58.527','2019-07-09 12:07:58.527',0,NULL,''),('2812','TestPlan:1:16','2807','2810','QMTestPlanReview','2813',NULL,'QM_ReviewTestPlan','userTask',NULL,'2019-07-09 12:07:58.527','2019-07-09 12:09:38.245',99718,NULL,''),('2819','TestPlan:1:16','2815','2818','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:08:33.068','2019-07-09 12:08:33.068',0,NULL,''),('2820','TestPlan:1:16','2815','2818','QMTestPlanReview','2821',NULL,'QM_ReviewTestPlan','userTask',NULL,'2019-07-09 12:08:33.068','2019-07-09 12:09:32.624',59556,NULL,''),('2825','TestPlan:1:16','2815','2818','QMReviewGate',NULL,NULL,'QM_ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:09:32.624','2019-07-09 12:09:32.624',0,NULL,''),('2826','TestPlan:1:16','2815','2818','TMTestPlanApprove','2827',NULL,'TM_ApproveTestPlan','userTask',NULL,'2019-07-09 12:09:32.625','2019-07-09 12:09:57.979',25354,NULL,''),('2833','TestPlan:1:16','2807','2810','QMReviewGate',NULL,NULL,'QM_ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:09:38.245','2019-07-09 12:09:38.245',0,NULL,''),('2834','TestPlan:1:16','2807','2810','TMTestPlanApprove','2835',NULL,'TM_ApproveTestPlan','userTask',NULL,'2019-07-09 12:09:38.245','2019-07-09 12:10:00.518',22273,NULL,''),('2841','TestPlan:1:16','2837','2840','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-09 12:09:40.043','2019-07-09 12:09:40.043',0,NULL,''),('2842','TestPlan:1:16','2837','2840','QMTestPlanReview','2843',NULL,'QM_ReviewTestPlan','userTask',NULL,'2019-07-09 12:09:40.043','2019-07-09 12:09:46.446',6403,NULL,''),('2847','TestPlan:1:16','2837','2840','QMReviewGate',NULL,NULL,'QM_ReviewGate','exclusiveGateway',NULL,'2019-07-09 12:09:46.446','2019-07-09 12:09:46.446',0,NULL,''),('2848','TestPlan:1:16','2837','2840','TMTestPlanApprove','2849',NULL,'TM_ApproveTestPlan','userTask',NULL,'2019-07-09 12:09:46.446','2019-07-09 12:10:02.670',16224,NULL,''),('2851','TestPlan:1:16','2815','2818','TMApproveGate',NULL,NULL,'TM_ApproveGate','exclusiveGateway',NULL,'2019-07-09 12:09:57.979','2019-07-09 12:09:57.979',0,NULL,''),('2852','TestPlan:1:16','2815','2818','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:09:57.980','2019-07-09 12:09:57.980',0,NULL,''),('2853','TestPlan:1:16','2807','2810','TMApproveGate',NULL,NULL,'TM_ApproveGate','exclusiveGateway',NULL,'2019-07-09 12:10:00.518','2019-07-09 12:10:00.519',1,NULL,''),('2854','TestPlan:1:16','2807','2810','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:10:00.519','2019-07-09 12:10:00.519',0,NULL,''),('2855','TestPlan:1:16','2837','2840','TMApproveGate',NULL,NULL,'TM_ApproveGate','exclusiveGateway',NULL,'2019-07-09 12:10:02.670','2019-07-09 12:10:02.670',0,NULL,''),('2856','TestPlan:1:16','2837','2840','end',NULL,NULL,'End','endEvent',NULL,'2019-07-09 12:10:02.671','2019-07-09 12:10:02.671',0,NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('2508','SS','candidate',NULL,'2507',NULL),('2516','SS','candidate',NULL,'2515',NULL),('2527','SS','candidate',NULL,'2526',NULL),('2535','SS','candidate',NULL,'2534',NULL),('2543','SS','candidate',NULL,'2542',NULL),('2551','SS','candidate',NULL,'2550',NULL),('2559','SS','candidate',NULL,'2558',NULL),('2567','SS','candidate',NULL,'2566',NULL),('2575','SS','candidate',NULL,'2574',NULL),('2633','SM','candidate',NULL,'2632',NULL),('2636','QM','candidate',NULL,'2635',NULL),('2650','SM','candidate',NULL,'2649',NULL),('2653','QM','candidate',NULL,'2652',NULL),('2667','SM','candidate',NULL,'2666',NULL),('2670','QM','candidate',NULL,'2669',NULL),('2684','SM','candidate',NULL,'2683',NULL),('2687','QM','candidate',NULL,'2686',NULL),('2701','SM','candidate',NULL,'2700',NULL),('2704','QM','candidate',NULL,'2703',NULL),('2718','SM','candidate',NULL,'2717',NULL),('2721','QM','candidate',NULL,'2720',NULL),('2733',NULL,'participant','u20190609235903',NULL,'2637'),('2747',NULL,'participant','u20190609235901',NULL,'2688'),('2758',NULL,'participant','u20190609235901',NULL,'2705'),('2763',NULL,'participant','u20190609235902',NULL,'2654'),('2768',NULL,'participant','u20190609235903',NULL,'2671'),('2773',NULL,'participant','u20190609235902',NULL,'2620'),('2814','QM','candidate',NULL,'2813',NULL),('2822','QM','candidate',NULL,'2821',NULL),('2828','TM','candidate',NULL,'2827',NULL),('2836','TM','candidate',NULL,'2835',NULL),('2844','QM','candidate',NULL,'2843',NULL),('2850','TM','candidate',NULL,'2849',NULL);
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
INSERT INTO `act_hi_procinst` VALUES ('2501','2501',NULL,'Entrust:1:12','2019-07-09 11:57:04.170','2019-07-09 11:59:12.241',128071,NULL,'start','end',NULL,NULL,'',NULL),('2509','2509',NULL,'Entrust:1:12','2019-07-09 11:57:11.385','2019-07-09 11:59:15.646',124261,NULL,'start','end',NULL,NULL,'',NULL),('2520','2520',NULL,'Entrust:1:12','2019-07-09 11:57:21.148','2019-07-09 11:59:30.499',129351,NULL,'start','end',NULL,NULL,'',NULL),('2528','2528',NULL,'Entrust:1:12','2019-07-09 11:57:24.604','2019-07-09 11:59:03.718',99114,NULL,'start','end',NULL,NULL,'',NULL),('2536','2536',NULL,'Entrust:1:12','2019-07-09 11:57:36.062','2019-07-09 11:58:52.883',76821,NULL,'start','end',NULL,NULL,'',NULL),('2544','2544',NULL,'Entrust:1:12','2019-07-09 11:57:40.289','2019-07-09 11:59:40.397',120108,NULL,'start','end',NULL,NULL,'',NULL),('2552','2552',NULL,'Entrust:1:12','2019-07-09 11:57:58.349','2019-07-09 11:59:40.698',102349,NULL,'start','end',NULL,NULL,'',NULL),('2560','2560',NULL,'Entrust:1:12','2019-07-09 11:58:13.375','2019-07-09 11:59:32.640',79265,NULL,'start','end',NULL,NULL,'',NULL),('2568','2568',NULL,'Entrust:1:12','2019-07-09 11:58:34.844','2019-07-09 11:59:24.207',49363,NULL,'start','end',NULL,NULL,'',NULL),('2620','2620',NULL,'Contract:1:15','2019-07-09 12:01:35.734','2019-07-09 12:05:36.083',240349,NULL,'start','end',NULL,NULL,'',NULL),('2637','2637',NULL,'Contract:1:15','2019-07-09 12:02:29.692','2019-07-09 12:05:18.757',169065,NULL,'start','end',NULL,NULL,'',NULL),('2654','2654',NULL,'Contract:1:15','2019-07-09 12:03:00.668','2019-07-09 12:05:33.779',153111,NULL,'start','end',NULL,NULL,'',NULL),('2671','2671',NULL,'Contract:1:15','2019-07-09 12:03:21.324','2019-07-09 12:05:22.026',120702,NULL,'start','end',NULL,NULL,'',NULL),('2688','2688',NULL,'Contract:1:15','2019-07-09 12:03:31.927','2019-07-09 12:05:15.611',103684,NULL,'start','end',NULL,NULL,'',NULL),('2705','2705',NULL,'Contract:1:15','2019-07-09 12:04:16.831','2019-07-09 12:05:17.870',61039,NULL,'start','end',NULL,NULL,'',NULL),('2807','2807',NULL,'TestPlan:1:16','2019-07-09 12:07:58.527','2019-07-09 12:10:00.527',122000,NULL,'start','end',NULL,NULL,'',NULL),('2815','2815',NULL,'TestPlan:1:16','2019-07-09 12:08:33.068','2019-07-09 12:09:57.989',84921,NULL,'start','end',NULL,NULL,'',NULL),('2837','2837',NULL,'TestPlan:1:16','2019-07-09 12:09:40.043','2019-07-09 12:10:02.677',22634,NULL,'start','end',NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('2507','Entrust:1:12','reviewEntrust','2501','2504','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:04.247',NULL,'2019-07-09 11:59:12.233',127986,NULL,50,NULL,NULL,NULL,''),('2515','Entrust:1:12','reviewEntrust','2509','2512','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:11.385',NULL,'2019-07-09 11:59:15.635',124250,NULL,50,NULL,NULL,NULL,''),('2526','Entrust:1:12','reviewEntrust','2520','2523','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:21.148',NULL,'2019-07-09 11:59:30.490',129342,NULL,50,NULL,NULL,NULL,''),('2534','Entrust:1:12','reviewEntrust','2528','2531','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:24.604',NULL,'2019-07-09 11:59:03.704',99100,NULL,50,NULL,NULL,NULL,''),('2542','Entrust:1:12','reviewEntrust','2536','2539','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:36.062',NULL,'2019-07-09 11:58:52.866',76804,NULL,50,NULL,NULL,NULL,''),('2550','Entrust:1:12','reviewEntrust','2544','2547','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:40.290',NULL,'2019-07-09 11:59:40.386',120096,NULL,50,NULL,NULL,NULL,''),('2558','Entrust:1:12','reviewEntrust','2552','2555','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:57:58.350',NULL,'2019-07-09 11:59:40.691',102341,NULL,50,NULL,NULL,NULL,''),('2566','Entrust:1:12','reviewEntrust','2560','2563','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:58:13.376',NULL,'2019-07-09 11:59:32.631',79255,NULL,50,NULL,NULL,NULL,''),('2574','Entrust:1:12','reviewEntrust','2568','2571','SS_Review',NULL,NULL,NULL,NULL,'2019-07-09 11:58:34.845',NULL,'2019-07-09 11:59:24.199',49354,NULL,50,NULL,NULL,NULL,''),('2632','Contract:1:15','smContractReview','2620','2627','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:01:35.737',NULL,'2019-07-09 12:04:55.408',199671,NULL,50,NULL,NULL,NULL,''),('2635','Contract:1:15','qmContractReview','2620','2630','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:01:35.737',NULL,'2019-07-09 12:05:04.684',208947,NULL,50,NULL,NULL,NULL,''),('2649','Contract:1:15','smContractReview','2637','2644','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:02:29.696',NULL,'2019-07-09 12:04:41.736',132040,NULL,50,NULL,NULL,NULL,''),('2652','Contract:1:15','qmContractReview','2637','2647','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:02:29.696',NULL,'2019-07-09 12:04:42.258',132562,NULL,50,NULL,NULL,NULL,''),('2666','Contract:1:15','smContractReview','2654','2661','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:03:00.672',NULL,'2019-07-09 12:04:50.908',110236,NULL,50,NULL,NULL,NULL,''),('2669','Contract:1:15','qmContractReview','2654','2664','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:03:00.673',NULL,'2019-07-09 12:04:59.551',118878,NULL,50,NULL,NULL,NULL,''),('2683','Contract:1:15','smContractReview','2671','2678','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:03:21.327',NULL,'2019-07-09 12:04:53.206',91879,NULL,50,NULL,NULL,NULL,''),('2686','Contract:1:15','qmContractReview','2671','2681','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:03:21.327',NULL,'2019-07-09 12:05:02.401',101074,NULL,50,NULL,NULL,NULL,''),('2700','Contract:1:15','smContractReview','2688','2695','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:03:31.930',NULL,'2019-07-09 12:04:45.909',73979,NULL,50,NULL,NULL,NULL,''),('2703','Contract:1:15','qmContractReview','2688','2698','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:03:31.931',NULL,'2019-07-09 12:04:52.474',80543,NULL,50,NULL,NULL,NULL,''),('2717','Contract:1:15','smContractReview','2705','2712','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:04:16.833',NULL,'2019-07-09 12:04:48.374',31541,NULL,50,NULL,NULL,NULL,''),('2720','Contract:1:15','qmContractReview','2705','2715','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-09 12:04:16.834',NULL,'2019-07-09 12:04:56.257',39423,NULL,50,NULL,NULL,NULL,''),('2732','Contract:1:15','cusContractReview','2637','2647','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235903','2019-07-09 12:04:42.264','2019-07-09 12:05:18.672','2019-07-09 12:05:18.743',36479,NULL,50,NULL,NULL,NULL,''),('2746','Contract:1:15','cusContractReview','2688','2698','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-09 12:04:52.481','2019-07-09 12:05:15.507','2019-07-09 12:05:15.586',23105,NULL,50,NULL,NULL,NULL,''),('2757','Contract:1:15','cusContractReview','2705','2715','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-09 12:04:56.263','2019-07-09 12:05:17.783','2019-07-09 12:05:17.849',21586,NULL,50,NULL,NULL,NULL,''),('2762','Contract:1:15','cusContractReview','2654','2664','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235902','2019-07-09 12:04:59.561','2019-07-09 12:05:33.701','2019-07-09 12:05:33.764',34203,NULL,50,NULL,NULL,NULL,''),('2767','Contract:1:15','cusContractReview','2671','2681','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235903','2019-07-09 12:05:02.411','2019-07-09 12:05:21.710','2019-07-09 12:05:22.012',19601,NULL,50,NULL,NULL,NULL,''),('2772','Contract:1:15','cusContractReview','2620','2630','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235902','2019-07-09 12:05:04.690','2019-07-09 12:05:35.887','2019-07-09 12:05:36.068',31378,NULL,50,NULL,NULL,NULL,''),('2813','TestPlan:1:16','QMTestPlanReview','2807','2810','QM_ReviewTestPlan',NULL,NULL,NULL,NULL,'2019-07-09 12:07:58.528',NULL,'2019-07-09 12:09:38.244',99716,NULL,50,NULL,NULL,NULL,''),('2821','TestPlan:1:16','QMTestPlanReview','2815','2818','QM_ReviewTestPlan',NULL,NULL,NULL,NULL,'2019-07-09 12:08:33.068',NULL,'2019-07-09 12:09:32.623',59555,NULL,50,NULL,NULL,NULL,''),('2827','TestPlan:1:16','TMTestPlanApprove','2815','2818','TM_ApproveTestPlan',NULL,NULL,NULL,NULL,'2019-07-09 12:09:32.625',NULL,'2019-07-09 12:09:57.977',25352,NULL,50,NULL,NULL,NULL,''),('2835','TestPlan:1:16','TMTestPlanApprove','2807','2810','TM_ApproveTestPlan',NULL,NULL,NULL,NULL,'2019-07-09 12:09:38.246',NULL,'2019-07-09 12:10:00.517',22271,NULL,50,NULL,NULL,NULL,''),('2843','TestPlan:1:16','QMTestPlanReview','2837','2840','QM_ReviewTestPlan',NULL,NULL,NULL,NULL,'2019-07-09 12:09:40.043',NULL,'2019-07-09 12:09:46.445',6402,NULL,50,NULL,NULL,NULL,''),('2849','TestPlan:1:16','TMTestPlanApprove','2837','2840','TM_ApproveTestPlan',NULL,NULL,NULL,NULL,'2019-07-09 12:09:46.446',NULL,'2019-07-09 12:10:02.669',16223,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('2502','2501','2501',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235903',NULL,'2019-07-09 11:57:04.232','2019-07-09 11:57:04.232'),('2503','2501','2501',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545996',NULL,'2019-07-09 11:57:04.233','2019-07-09 11:57:04.233'),('2510','2509','2509',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-09 11:57:11.385','2019-07-09 11:57:11.385'),('2511','2509','2509',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545941',NULL,'2019-07-09 11:57:11.385','2019-07-09 11:57:11.385'),('2521','2520','2520',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235903',NULL,'2019-07-09 11:57:21.148','2019-07-09 11:57:21.148'),('2522','2520','2520',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195546002',NULL,'2019-07-09 11:57:21.148','2019-07-09 11:57:21.148'),('2529','2528','2528',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-09 11:57:24.604','2019-07-09 11:57:24.604'),('2530','2528','2528',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545880',NULL,'2019-07-09 11:57:24.604','2019-07-09 11:57:24.604'),('2537','2536','2536',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-09 11:57:36.062','2019-07-09 11:57:36.062'),('2538','2536','2536',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545924',NULL,'2019-07-09 11:57:36.062','2019-07-09 11:57:36.062'),('2545','2544','2544',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235903',NULL,'2019-07-09 11:57:40.289','2019-07-09 11:57:40.289'),('2546','2544','2544',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545990',NULL,'2019-07-09 11:57:40.289','2019-07-09 11:57:40.289'),('2553','2552','2552',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235902',NULL,'2019-07-09 11:57:58.350','2019-07-09 11:57:58.350'),('2554','2552','2552',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545979',NULL,'2019-07-09 11:57:58.350','2019-07-09 11:57:58.350'),('2561','2560','2560',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235902',NULL,'2019-07-09 11:58:13.375','2019-07-09 11:58:13.375'),('2562','2560','2560',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545958',NULL,'2019-07-09 11:58:13.375','2019-07-09 11:58:13.375'),('2569','2568','2568',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235902',NULL,'2019-07-09 11:58:34.844','2019-07-09 11:58:34.844'),('2570','2568','2568',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p190709195545971',NULL,'2019-07-09 11:58:34.845','2019-07-09 11:58:34.845'),('2576','2536','2536',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:58:52.864','2019-07-09 11:58:52.864'),('2577','2536','2536',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:58:52.864','2019-07-09 11:58:52.864'),('2588','2528','2528',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:03.703','2019-07-09 11:59:03.703'),('2589','2528','2528',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:03.703','2019-07-09 11:59:03.703'),('2592','2501','2501',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'daa',NULL,'2019-07-09 11:59:12.232','2019-07-09 11:59:12.232'),('2593','2501','2501',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:12.232','2019-07-09 11:59:12.232'),('2596','2509','2509',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:15.632','2019-07-09 11:59:15.632'),('2597','2509','2509',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:15.632','2019-07-09 11:59:15.632'),('2600','2568','2568',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:24.198','2019-07-09 11:59:24.198'),('2601','2568','2568',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:24.198','2019-07-09 11:59:24.198'),('2604','2520','2520',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:30.489','2019-07-09 11:59:30.489'),('2605','2520','2520',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:30.489','2019-07-09 11:59:30.489'),('2608','2560','2560',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:32.629','2019-07-09 11:59:32.629'),('2609','2560','2560',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:32.629','2019-07-09 11:59:32.629'),('2612','2544','2544',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:40.384','2019-07-09 11:59:40.384'),('2613','2544','2544',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:40.384','2019-07-09 11:59:40.384'),('2616','2552','2552',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 11:59:40.689','2019-07-09 11:59:40.689'),('2617','2552','2552',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 11:59:40.689','2019-07-09 11:59:40.689'),('2621','2620','2620',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235902',NULL,'2019-07-09 12:01:35.734','2019-07-09 12:01:35.734'),('2622','2620','2620',NULL,'ContractID','string',0,NULL,NULL,NULL,'p190709195545979',NULL,'2019-07-09 12:01:35.734','2019-07-09 12:01:35.734'),('2638','2637','2637',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235903',NULL,'2019-07-09 12:02:29.692','2019-07-09 12:02:29.692'),('2639','2637','2637',NULL,'ContractID','string',0,NULL,NULL,NULL,'p190709195546002',NULL,'2019-07-09 12:02:29.692','2019-07-09 12:02:29.692'),('2655','2654','2654',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235902',NULL,'2019-07-09 12:03:00.668','2019-07-09 12:03:00.668'),('2656','2654','2654',NULL,'ContractID','string',0,NULL,NULL,NULL,'p190709195545958',NULL,'2019-07-09 12:03:00.669','2019-07-09 12:03:00.669'),('2672','2671','2671',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235903',NULL,'2019-07-09 12:03:21.324','2019-07-09 12:03:21.324'),('2673','2671','2671',NULL,'ContractID','string',0,NULL,NULL,NULL,'p190709195545990',NULL,'2019-07-09 12:03:21.324','2019-07-09 12:03:21.324'),('2689','2688','2688',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-09 12:03:31.927','2019-07-09 12:03:31.927'),('2690','2688','2688',NULL,'ContractID','string',0,NULL,NULL,NULL,'p190709195545941',NULL,'2019-07-09 12:03:31.927','2019-07-09 12:03:31.927'),('2706','2705','2705',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-09 12:04:16.831','2019-07-09 12:04:16.831'),('2707','2705','2705',NULL,'ContractID','string',0,NULL,NULL,NULL,'p190709195545880',NULL,'2019-07-09 12:04:16.831','2019-07-09 12:04:16.831'),('2726','2637','2637',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-09 12:04:41.734','2019-07-09 12:05:18.741'),('2727','2637','2637',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:04:41.734','2019-07-09 12:05:18.742'),('2734','2688','2688',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-09 12:04:45.908','2019-07-09 12:05:15.584'),('2735','2688','2688',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:04:45.908','2019-07-09 12:05:15.584'),('2737','2705','2705',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-09 12:04:48.373','2019-07-09 12:05:17.844'),('2738','2705','2705',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:04:48.373','2019-07-09 12:05:17.847'),('2740','2654','2654',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-09 12:04:50.907','2019-07-09 12:05:33.762'),('2741','2654','2654',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:04:50.907','2019-07-09 12:05:33.762'),('2748','2671','2671',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-09 12:04:53.204','2019-07-09 12:05:22.010'),('2749','2671','2671',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:04:53.204','2019-07-09 12:05:22.010'),('2751','2620','2620',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-09 12:04:55.407','2019-07-09 12:05:36.066'),('2752','2620','2620',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:04:55.407','2019-07-09 12:05:36.066'),('2808','2807','2807',NULL,'TestPlanID','string',0,NULL,NULL,NULL,'p190709195545990',NULL,'2019-07-09 12:07:58.527','2019-07-09 12:07:58.527'),('2809','2807','2807',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235903',NULL,'2019-07-09 12:07:58.527','2019-07-09 12:07:58.527'),('2816','2815','2815',NULL,'TestPlanID','string',0,NULL,NULL,NULL,'p190709195545941',NULL,'2019-07-09 12:08:33.068','2019-07-09 12:08:33.068'),('2817','2815','2815',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-09 12:08:33.068','2019-07-09 12:08:33.068'),('2823','2815','2815',NULL,'ReviewComment','string',1,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 12:09:32.621','2019-07-09 12:09:57.971'),('2824','2815','2815',NULL,'ReviewResult','string',1,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:09:32.621','2019-07-09 12:09:57.972'),('2831','2807','2807',NULL,'ReviewComment','string',1,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 12:09:38.242','2019-07-09 12:10:00.515'),('2832','2807','2807',NULL,'ReviewResult','string',1,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:09:38.242','2019-07-09 12:10:00.516'),('2838','2837','2837',NULL,'TestPlanID','string',0,NULL,NULL,NULL,'p190709195545958',NULL,'2019-07-09 12:09:40.043','2019-07-09 12:09:40.043'),('2839','2837','2837',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235902',NULL,'2019-07-09 12:09:40.043','2019-07-09 12:09:40.043'),('2845','2837','2837',NULL,'ReviewComment','string',1,NULL,NULL,NULL,'æ— ',NULL,'2019-07-09 12:09:46.443','2019-07-09 12:10:02.667'),('2846','2837','2837',NULL,'ReviewResult','string',1,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-09 12:09:46.443','2019-07-09 12:10:02.668');
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
INSERT INTO `act_id_group` VALUES ('QM',1,NULL,NULL),('SM',1,NULL,NULL),('SS',1,NULL,NULL),('STAFF',1,NULL,NULL),('TM',1,NULL,NULL),('TS',1,NULL,NULL);
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
INSERT INTO `act_id_membership` VALUES ('u20190609235951','QM'),('u20190609235999','QM'),('u20190609235931','SM'),('u20190609235999','SM'),('u20190609235911','SS'),('u20190609235912','SS'),('u20190609235999','SS'),('u20190609235911','STAFF'),('u20190609235912','STAFF'),('u20190609235921','STAFF'),('u20190609235922','STAFF'),('u20190609235931','STAFF'),('u20190609235941','STAFF'),('u20190609235951','STAFF'),('u20190609235999','STAFF'),('u20190609235941','TM'),('u20190609235999','TM'),('u20190609235921','TS'),('u20190609235922','TS'),('u20190609235999','TS');
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
INSERT INTO `act_id_user` VALUES ('u20190609235911',1,NULL,NULL,NULL,NULL,NULL),('u20190609235912',1,NULL,NULL,NULL,NULL,NULL),('u20190609235921',1,NULL,NULL,NULL,NULL,NULL),('u20190609235922',1,NULL,NULL,NULL,NULL,NULL),('u20190609235931',1,NULL,NULL,NULL,NULL,NULL),('u20190609235941',1,NULL,NULL,NULL,NULL,NULL),('u20190609235951',1,NULL,NULL,NULL,NULL,NULL),('u20190609235999',1,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-07-09 11:55:41.309',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:15',1,'http://www.activiti.org/test','åˆåŒ','Contract',1,'1','/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:1:12',1,'http://www.activiti.org/test','å§”æ‰˜','Entrust',1,'1','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('TestPlan:1:16',1,'http://www.activiti.org/test',NULL,'TestPlan',1,'1','/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png',NULL,0,1,1,'',NULL),('TestRecord:1:14',1,'http://www.activiti.org/test',NULL,'TestRecord',1,'1','/home/dell/stconline/server/target/classes/processes/TestRecord.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestRecord.TestRecord.png',NULL,0,1,1,'',NULL),('TestReport:1:13',1,'http://www.activiti.org/test',NULL,'TestReport',1,'1','/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png',NULL,0,1,1,'',NULL);
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
  `modify_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `modify_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_contract`
--

LOCK TABLES `tbl_sys_contract` WRITE;
/*!40000 ALTER TABLE `tbl_sys_contract` DISABLE KEYS */;
INSERT INTO `tbl_sys_contract` VALUES (120,'p190709195546002','2637',2,'NJUSTC','','','ä¸­å›½å·¥å•†é“¶è¡Œè‚¡ä»½æœ‰é™å…¬å¸å—äº¬æ±‰å£è·¯åˆ†ç†å¤„','å—äº¬å¤§å­¦','å—äº¬å¤§å­¦è®¡ç®—æœºè½¯ä»¶æ–°æŠ€æœ¯å›½å®¶é‡ç‚¹å®éªŒå®¤','','','','','','43010113090141656','å°å›¢é˜Ÿ','','','','','','62661627','','','','',NULL,'','10000','é²æ£’æ€§','2019.7.9','å—äº¬å¤§å­¦','u20190609235903','',NULL,'','','Ibæµ‹è¯•','Ib'),(118,'p190709195545971','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ç½‘æ˜“',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235902',NULL,NULL,NULL,NULL,NULL,'ç½‘æ˜“äº‘éŸ³ä¹'),(116,'p190709195545941','2688',2,'NJUSTC','','','ä¸­å›½å·¥å•†é“¶è¡Œè‚¡ä»½æœ‰é™å…¬å¸å—äº¬æ±‰å£è·¯åˆ†ç†å¤„','å—äº¬å¤§å­¦','å—äº¬å¤§å­¦è®¡ç®—æœºè½¯ä»¶æ–°æŠ€æœ¯å›½å®¶é‡ç‚¹å®éªŒå®¤','','','','','','43010113090141656','ç™¾åº¦','','','','','','62661627','','','','',NULL,'','10000','','7/9','208','u20190609235901','',NULL,'','','ç™¾åº¦äº‘æµ‹è¯•','ç™¾åº¦äº‘'),(114,'p190709195545996','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WDSJå…¬å¸',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235903',NULL,NULL,NULL,NULL,NULL,'æˆ‘çš„ä¸–ç•Œ'),(112,'p190709195545880','2705',2,'NJUSTC','','','ä¸­å›½å·¥å•†é“¶è¡Œè‚¡ä»½æœ‰é™å…¬å¸å—äº¬æ±‰å£è·¯åˆ†ç†å¤„','å—äº¬å¤§å­¦','å—äº¬å¤§å­¦è®¡ç®—æœºè½¯ä»¶æ–°æŠ€æœ¯å›½å®¶é‡ç‚¹å®éªŒå®¤','','','','','','43010113090141656','èš‚èšé‡‘æœ','','','','','','62661627','','','','',NULL,'','10000','','7/9','208','u20190609235901','',NULL,'','','æ”¯ä»˜å®æµ‹è¯•','æ”¯ä»˜å®'),(110,'p190709195545924','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è…¾è®¯',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901',NULL,NULL,NULL,NULL,NULL,'QQ'),(122,'p190709195545958','2654',2,'NJUSTC','','','ä¸­å›½å·¥å•†é“¶è¡Œè‚¡ä»½æœ‰é™å…¬å¸å—äº¬æ±‰å£è·¯åˆ†ç†å¤„','å—äº¬å¤§å­¦','å—äº¬å¤§å­¦è®¡ç®—æœºè½¯ä»¶æ–°æŠ€æœ¯å›½å®¶é‡ç‚¹å®éªŒå®¤','','','','','','43010113090141656','ç¾å›¢','','','','','','62661627','','','','',NULL,'','10000','','7/9','208','u20190609235902','',NULL,'','','ç¾å›¢æµ‹è¯•','ç¾å›¢å¤–å–'),(124,'p190709195545990','2671',2,'NJUSTC','','','ä¸­å›½å·¥å•†é“¶è¡Œè‚¡ä»½æœ‰é™å…¬å¸å—äº¬æ±‰å£è·¯åˆ†ç†å¤„','å—äº¬å¤§å­¦','å—äº¬å¤§å­¦è®¡ç®—æœºè½¯ä»¶æ–°æŠ€æœ¯å›½å®¶é‡ç‚¹å®éªŒå®¤','','','','','','43010113090141656','ä»»å¤©å ‚','','','','','','62661627','','','','',NULL,'','20000','é²æ£’æ€§','2019.7.9','å—äº¬å¤§å­¦','u20190609235903','',NULL,'','','å£è¢‹å¦–æ€ªæµ‹è¯•','å£è¢‹å¦–æ€ª'),(126,'p190709195545979','2620',2,'NJUSTC','','','ä¸­å›½å·¥å•†é“¶è¡Œè‚¡ä»½æœ‰é™å…¬å¸å—äº¬æ±‰å£è·¯åˆ†ç†å¤„','å—äº¬å¤§å­¦','å—äº¬å¤§å­¦è®¡ç®—æœºè½¯ä»¶æ–°æŠ€æœ¯å›½å®¶é‡ç‚¹å®éªŒå®¤','','','','','','43010113090141656','äº¬ä¸œ','','','','','','62661627','','','','',NULL,'','10000','é²æ£’æ€§','7/9','208','u20190609235902','',NULL,'','','äº¬ä¸œè´­ç‰©æµ‹è¯•','äº¬ä¸œè´­ç‰©');
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
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (194,'2501',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','WDSJå…¬å¸','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545996','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','æˆ‘çš„ä¸–ç•Œ','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235903','daa',NULL),(195,'2520',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','å°å›¢é˜Ÿ','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195546002','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Ib','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235903','æ— ',NULL),(193,'2544',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä»»å¤©å ‚','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545990','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','å£è¢‹å¦–æ€ª','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235903','æ— ',NULL),(192,'',0,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','è…¾è®¯','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545985','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','å¤©å¤©çˆ±æ¶ˆé™¤','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235903',NULL,NULL),(191,'2552',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','äº¬ä¸œ','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545979','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','äº¬ä¸œè´­ç‰©','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902','æ— ',NULL),(189,'2560',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ç¾å›¢','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545958','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','ç¾å›¢å¤–å–','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902','æ— ',NULL),(190,'2568',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ç½‘æ˜“','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545971','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','ç½‘æ˜“äº‘éŸ³ä¹','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902','æ— ',NULL),(187,'2509',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ç™¾åº¦','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545941','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','ç™¾åº¦äº‘','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(184,'2528',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','èš‚èšé‡‘æœ','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545880','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','æ”¯ä»˜å®','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(185,'2536',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','è…¾è®¯','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545924','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','QQ','','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(186,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545932','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','Worldè½¯ä»¶','basic-form.radio.system1','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL),(188,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709195545950','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','ABCDEè½¯ä»¶','basic-form.radio.system1','[\"basic-form.radio.basis1\",\"basic-form.radio.basis2\",\"basic-form.radio.basis3\",\"basic-form.radio.basis5\",\"basic-form.radio.basis4\"]','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902',NULL,NULL),(196,'',0,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','8G','2G','æ— ','[\"basic-form.radio.opsystem1\"]','2000','å—äº¬å¤§å­¦','NJU','stcé¡¹ç›®ç»„','basic-form.others.SecLev.public',NULL,'20190710','14','','10','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','12','miao','123','014030','14956563232','www.miaomiaomiao.io',NULL,'p190709220358595','form.sample.radio.destruction','æ— ','basic-form.mediumg.label','mySQL','1G','[\"basic-form.checkbox.architecture1\"]','æ— ','100M','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','1.0','æ— ','æ— ','å—å¤§æµ‹è¯•','','[\"basic-form.radio.basis1\"]','[\"basic-form.radio.target1\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','','1.0','æ¬ç –','u20190609235901','',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062939 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testplan`
--

LOCK TABLES `tbl_sys_testplan` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testplan` DISABLE KEYS */;
INSERT INTO `tbl_sys_testplan` VALUES (2019062933,'p190709195545941','2815',2,'æ›¹è€æ¿','Peter','Jack',NULL,'MAC',NULL,'ubuntu','Jack','æ— ',NULL,'u20190609235901'),(2019062934,'p190709195545880','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901'),(2019062935,'p190709195546002','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235903'),(2019062936,'p190709195545990','2807',2,'CAO','CAO','CAO',NULL,'hard',NULL,'soft','staff','æ— ',NULL,'u20190609235903'),(2019062937,'p190709195545958','2837',2,'C','B','A',NULL,'DELL',NULL,'windows','D','æ— ',NULL,'u20190609235902'),(2019062938,'p190709195545979','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235902');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062927 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testreport`
--

LOCK TABLES `tbl_sys_testreport` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testreport` DISABLE KEYS */;
INSERT INTO `tbl_sys_testreport` VALUES (2019062924,'p190709195545941','',0,NULL,NULL,NULL,NULL,NULL,'ç™¾åº¦',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ç™¾åº¦äº‘',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901'),(2019062925,'p190709195545990','',0,NULL,NULL,NULL,NULL,NULL,'ä»»å¤©å ‚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'å£è¢‹å¦–æ€ª',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235903'),(2019062926,'p190709195545958','',0,NULL,NULL,NULL,NULL,NULL,'ç¾å›¢',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ç¾å›¢å¤–å–',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235902');
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
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (176,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,STAFF,USER','u20190609235951','QMA'),(175,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,STAFF,USER','u20190609235941','TMA'),(174,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,STAFF,USER','u20190609235931','SMA'),(173,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,STAFF,USER','u20190609235922','TSB'),(172,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,STAFF,USER','u20190609235921','TSA'),(171,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,STAFF,USER','u20190609235912','SSB'),(170,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,STAFF,USER','u20190609235911','SSA'),(169,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190609235903','CUSC'),(167,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190609235901','CUSA'),(168,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190609235902','CUSB'),(166,'$2a$10$swEZoj6b1JAogCMQhLvus.4pOGCLM8.ykawX1e7v8b12tDQ2idzzK','USER,ADMIN,CUS,STAFF,SS,SM,TS,TM,QM','u20190609235999','BOSS'),(177,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN','u20190609235900','admin');
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

-- Dump completed on 2019-07-09 16:15:41
