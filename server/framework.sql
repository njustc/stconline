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
INSERT INTO `act_ge_bytearray` VALUES ('10',1,'/home/dell/stconline/server/target/classes/processes/Contract.Contract.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0kTIDATx\Ú\ì½	tUUš°\íPU–]\Õ\İe¯ªrõ´ªkı],\Ûå²µzuûuuµòÙ¿eÛ¶ErO\î\Í@B!!@%aR‚b\Ä\nb0‚eA„`\Ä‚B\Éş÷»\ÍIß„w\Êp\Îyµöº\Ó\ÉMò&gŸ\ç¾û\İ{\ßp\0\0\0@´d=·]\r«oYÍ´\ÑKöÔ™\ã\æmWš£ºÍ—û\r­ş8Í© \ã–6÷}ˆ6\0\0€\Ëxş\ÍS×†/,¬\Óÿgª•:cÄ ^j”:«Ÿÿ#‹\n\ë†\Í/\ãN]\'úöğÙº¯\å¸J«‡?_\Ø\æq\0\0\0\à\"†/\ØY\× \æv‡iø—F\Ç=ÿ>nG£lDıqëƒÓW¿ò´¿}o¹\ß\\¶\0\0\0ˆ\\\àeH\ãüUu¾‘D\İ7Ùˆ\ç\Ìqoø¦º\ÑÈ¼\Æ\Ç\Ù\ï\'C Ÿ|­*\í\çg¼~¤f\ê\ï?ºF\Ä\0\0\\„¾\à?$Ù…aóš\ÔH,,¬6\ïÛ¬Dıqc\ä¾\Ü6®¥Ø¡¶ı\æJ\Ğq\Õ÷d2\ZDDÇ\0\0€3õ\Ã¿k<¬ñ¿²`[\\·\æ\Û\Ñ\è8û~öEõ…šF.ºq\0\0\0÷d#~¼ğ\ÍS\×\ä\"®F)şü·ba\ËL……uõ\Çş¿öqÃ¾•±9+h¦Ç‚ÍŸ^­?®›¨¼ùÿ\Û]Q5Œ\0\0\0®‰L;«0\ìùB#\ÃÕ½¼ûlÕ°\r™ŠB\İ\Öü\ïquY\n¿m’˜_`«V\ê\ë\à÷½\ìİºõ|}y\ÌKÅµöû\×Zy\0\0\0ğùeu\î­#—\å\â\"şaM(¿\Í<ìš´r\í¨\ÅE2s\Ùğ\Íw®F]õıˆ<\0\0\0\0¸\Z-½?Ú¼yóºùó\ç3kÖ¬º#F¨\ä\äd§Õ°a\ÃTNN\Î\ÕI“&}™™9œˆ\0\0À\rgÎœ‰_±bÅ…¡C‡ªª\åË—«İ»w«/¾øBUUUIVM]½zU•——«÷\ß_­\\¹Redd¨Áƒ×7®\Ğ\ï÷\ßN\0\0<†öƒÛ·o\ß^1d\È5k\Ö,u\àÀ#¡r\è\Ğ!5ş|•––¦FŒ1‰ˆ\0\0x(1w\îÜº¬¬,µo\ß>\rGQ™™™jÀ€_&\'\'ÿˆ\è\0\0¸˜‹/f\æ\ä\ä¨\ç{N]¸pA\Å‘÷4h\Ğ\×u\0\0\0¸8!1c\Æu\í\Ú5k.\\(™‰¯ºw\ïş}¢\r\0\0\à\"¤&B†3$s\Ğa3g\Î•PB\Ä\0\0\\„VJMD¬†3Z\æ\È\ÈÈ¨óûıYD\0\0ÀÈ†\ÌÎ™`\Æ\Ç\Ç\×R/\0\0\àd™\âÙ‘L™2\åj\\\\\Ü¢\0\0\à`d\ÅJYlª£²6ü±òûı5^\0\08˜·\Şz\ë\rY±²=,[\"99¹Ö²¬4ş\n\0\0\0EöÎe¯;ƒ¼¼¼\Ëqqq;ù+\0\0\08Ù€Kö\Î\è\Ş}÷\İkZ$>\ã¯\0\0\0\àPdOÙ€«3¨¨¨¨\Ó\"Q\Í_\0\0À¡\È\àö.l&ÛóW\0\0\0p(r!\ïL	\0\0\0Ó§OŸ\Î\ÌH\Ô!\0\0\0føğ\áV#Q^^~•\Z	\0\0\03aÂ„\êÎšµ±yó\ærfm\0\0\08˜É“\'—t\Ö:999e¬#\0\0\à`233S222:eeKY\"›•-\0\0œ/µ½\×Æ®]»dXƒ½6\0\0\0œ\Îøñ\ãwÌœ9³CE¢ÿşe\ìş	\0\0\à’““Ô¯_¿ºC‡uˆD¼÷\Ş{’ğûı·}\0\0\00xğ\àœ!C†¨.´«D\\¾|¹6\\\Õ‘E\Ô\0\0\\DFF\Æyyy\íYxY§¿G¹eYŸm\0\0\0—!…ƒ®˜?~{\ÈDİ¸q\ãNËº2”B´\0\0\\*ıû÷/Ÿ={¶ºt\éRÌ†3\r\Z$Å•ŸQ\0\0\à™HLLü4==½nÿşıQVJM„g‰\0\0\0ğR™pmÂ„	5\"\áwŸ•š‹ú\ÙV\0\0x\É\"X–µZ²\nIIIu³fÍºüö\Ûo_+++«½zõj\Ã.²×–-[*d\ÙkY±RBÖ‰`(\0\0\0ZuÛª[‰–‹Ë²xP«–\Z\İvÉ²×¬X	\0\0\0¡È…B\Z\0\0\0 b‘\èİ»÷_	\0\0\0Ë²ê’’’şšH\0\0\0@D\"‘œœü\"\0\0\0aW«e\â.\"\0\0\0‘ˆÄµøøø&\0\0\0‰H\Ôø|¾û‰\0\0\0D\"Õ–eı†H\0\0\0@\Øh‰¸z	\0\0\0ˆD$.\Ç\Ç\Ç[D\0\0\0\Â&..\îY:›H\0\0\0@\ØX–uA‹D?\"\0\0\0a£%\âk-Cˆ\0\0\0D\"\çt\Ë&\0\0\0‰Hœ\Õm<‘\0\0\0€°±,«,L&\0\0\06qqqŸ\ëö4‘\0\0\0€HD\â´\ß\ï\Ï#\0\0\06Z\"NZ–µ€H\0\0\0@\Ø\Ä\Å\Å\×m)‘\0\0\0€HD\âc\İò‰\0\0\0D\"À\ï‰\0\0\0D\"ût[C$\0\0\0 l,\Ëz\ß\ï÷ÿH\0\0\0@\Ø\Ä\Å\Å\í\Ò2ñ&‘\0\0\0€HD¢P·mD\0\0\0\"‰m\"D\0\0\0\"‰\Í2¼A$\0\0\0 ‘Ø \Û\"\0\0\0a\ãóù\Öúış½D\0\0\0\ÂF£²,\ë#\"\0\0\0a#\Ëc\Ë2\ÙD\0\0\0\"‰¥²q‘\0\0\0€°	-\Ëú”H\0\0\0@\Øøış9qqq%D\0\0\0\ÂÆ²¬Z$>\'\0\0\06@`²–‰2\"\0\0\0a7^·³D\0\0\0\"‰l\İ\Î	\0\0\0ˆD$2-Ëª$\0\0\06~¿?]·D\0\0\0\Â\Æ\çóõ‰‹‹û¦^*n\×\í×½zõº›\È\0\0\0@#D,Ëº¬Å¡F·Z\İT­€h\0\0ÀuhI\ØÙŠ@H«KMMı‘\0\0€\ë¨¾h-±‡(\0\0@k2ñzK\"aYV7\"\0\0\0­‰\Ä\í\Í\ÕHh‰ø\è\0\0\0@›È®ŸME\">>\Ş\"2\0\0\0õ38l‘øŒˆ\0\0\0@\Èøış,[$\ä>\0\0€°°,ë‚ˆ‘\0\0\0€°©\ßı‘\0\0p\ï½÷^úÀ¯ş\Ã?üƒt\Ü4\ZF‹¢ı\Í\ßü\êÖ­\Ûq}ÿv®0\à	‰øÕ¯~¥şû¿ÿ[½ÿşûªªªJ\0@d\Ô\ÔÔ¨>úHõ\ê\ÕKığ‡?¼ŠL€\ë<xpH\0\0Ä–\ßü\æ7µº›\İÅ•\\gH&\0\0bË¡C‡\êt7{•+\r¸†3\0\0\Úæ¨¯›\0p·H\0\0@û€H\0\"\Ñ\Æ	r\ï½÷¶yL=\Z\î:´\áşÿø\ÇF\ÇJf¤ş¤S?ı\éO›m‡jô\Ş÷\ß£÷Ø³gyşøñã¯¨¨P6lPK—.5¯K\é\îİ»¯û~\Ï?ÿ<=\0 \0±‰‹/6š\Şô\È#˜\Öô9¹•vmm­ª®®n¸\Ø\Û)¾G}´\á\äZ¼xñuiÀú§2-˜öúë¯›–`¾fö\ì\Ù\rÇŸ>}\Ú<÷\ÒK/©\ä\äduó\Í7«úµL“\Ç\Ò>şøcó\ŞÃ†\rkø9\å\ç\Ë\Ï\Ï7sss\Õ[o½e~ny\\\\\\L\ï\0ˆ@{ˆ\Ä\êÕ«“‹¯<\'\Â|\Ò\ä\åå™‹ñ\ã?\ŞpQi\Ûq\ã\Æ5\'\Ç4•ƒ¦HfÁ~¯¾úª\Ñk\"\Òùl±(((0÷E@\äyûûûJ6B‘ø«¿ú«\ë~Gù:\0\0D †6\ì‹zRR’úõ¯\İğø\Ö[o5\í\èÑ£\×ÿ\àƒšû’\ÇÓ¦M3·vö x¸\"˜Í›7›\×%Ñ”\'N˜\×dÖ‰ ’ü½\Ê\Ê\Ê\Ì\ã‡~¸a\È\Ãşşvfdûö\í\×-$3q\âDz>\0@$\0\ÚS$\äb]XX¨Æ\ß04 \å~ß¾}og%fÎœÙ\r\ÅZš\Ö7H\á_ş\å_L{\ì±\ÇL¶@\ŞK“!yNš{¼ó\Î;\æk\Ê\Ë\Ë²ö±\Ò\ä{Š|2\Ä<Ş¿ÿu\"$HFD\ê4š6\0@$\0\Ú1#!Ÿ\èÿñÿ±\Ñc¹•:;› \Ò \Ïı\â¿høZ©O°\ï\×H”––š‡4Y\î÷¿ÿ½\êß¿ƒœ\Ès\Ò\ä=\ß}÷\İFCÁ?›dD6m\Údn_|ñE3\\a³w\ïŞ†ŸW†SdhFŠ/¥\0\Ô\Î^ü\İ\ßı\Óa\0‘\0hO‘Xµj•¹o+\Ê0‚ıš]L)xû\Â-\Ã m‰Ds\Ø3,$ó\Ğ\çÏŸoTca\×G\Ø˜-e#Ö¬Ycfqˆ¼ˆLL™2¥aF‰ü\Ì\0\0ˆ@;g$¤Hñ¶\Ûnkô¸¹\Zƒàº…¦\"!CÒ¤\Ş!‘xú\é§\Í\ë’A°§}\Ê\æDB^—¡[n¹¥¡\àS†H\r\ZÔM‘×˜ş	\0ˆ@;ŠD0M3-DÁ\"qC\ĞS§N5»D(\"aÏ°\á{ı	YÂrj‹„ˆKğt\Î‚fm\È{H“…Í\Ç\ÔH\0\0\"\Ğ\"±r\å\Ê6/ôÒ¤R¢Ly,\Ù»øRZpƒ0w\î\\eoi.\ëC4‡=uT¾·\ÔB\Ø\ïc‹„\ÔQ\Ø\ï<“$X\\nh2\ã\Än¬#\Ñù\È“§üŸŒ1\Âü\È,Ÿ\Ä\ÄDS‡#™¯gŸ}V\íØ±ƒ`\"\àT‘\0ˆ%—/_6E¶R«2p\à@µ|ùr³ú\è_|\ÑP\0{õ\êU#²ÑœˆlFF†²z\á…Tee%AD\0‘\0/²s\çN#³f\ÍR0\Â*²\ÉüùóUZZšzó\Í7	& \0ˆx)!CYYYYjß¾}Q½×‘#GTff¦\Z9r¤ºt\éÁD\0‘\07#Y‡œœõ\ÜsÏ©.\Ä\ä=eD\Ş/;;›¡@$\0	ps&B$bÆŒ\êÚµk1ÿ…ª\áÃ‡7\Ú\0‘\0@$À%\Èp†d\ÚC\"l\æÌ™Ó°m=\0\"€H€K\ÂJ©‰ˆ\ÕpFk\Ã2ûc\ãÆ	\0D\Ü2¤!³3dfFG ˜²õ€H\0 \àd™\âÙ‘È¶õR‹€H\0 \àp¤f¡£²6²ÿŠd%(¼D\0‘\0#\Ë^K\ÍB{X¶DJJŠÚ¶m@$\0	p*²w†,{\İÌ›7OM˜0? \0ˆ8Ù€Kö\Î\èv\í\Úe²!\0ˆ\0\"Evñ”\r¸:ƒŠŠ\nS\'€H\0 \àPdp{ÏF–\ã–m\È	\0DJg_\È	@$\0	p0}úô!#ˆ\0\"Y#Q^^N \0ˆ8™\Ü\Ü\ÜN›µ±c\Çfm\0\"€H€“‘\İ>;k‰gy†u$\0‘\0@$À\ÉH6\"##£SV¶”a\rV¶D\0‘\0‡\Ó{m|ğÁ*>>½6\0‘\0@$À\é,[¶Ì¬pÙ‘dgg³û\' \0ˆ¸K—.©şıû«C‡uh6¢²²’\à\"€H€Ø´i“\Z2dˆºp\áB»~ŸË—/›\Õ47n\ÜH\Ğ‘\0@$ÀMŒ=Z\å\å\åµk\á\åÈ‘#°\0 \0ˆ¸)|5j”š?~»È„L÷”u#d(\0‘\0@$À¥2!«]Î=;f|\Î3fŒ‘\ê\"\0‘\0@$À21|øp5`À\0µÿş¨\ŞK\n+¥&B†3\ÈD\0\"€H€‡‚È¤¤$5i\Ò$#\áw\ìÛ·\Ï\Ô\\\È\ì\n+‘\0@$À£HA\n0eJ\Ù)T\îª²²²†Å¤dOÙ€KöÎ:9VBÖ‰`(	\0DÀ 1e\Ê5xğ`3\\![€\ÛM\äAj z\ê)³\ì5+V\"€H\0´ˆd$ü~?\0D\0‘\0Ÿƒš\á\0D\0‘\0ˆh˜Cj&\0	\0D lÖ­[§\Ò\Ò\Ò \0ˆ@ø¼ô\ÒKjĞ A	\0D |\æÎk¶@$\0	€°™:uª™\ê	€H\0 \0a3n\Ü8³\à\0\"€H\0„MVV–Z´h\0D\0‘\0\Ù\ĞkÕªU	\0D |úö\í\Ëf\\€H\0 \0‘!{m\ìŞ½›@\0\"€H\0„O PÇ\'€H\0 \0\á#;~?@\0\"€H\0„GUU•	\0D\0‘\0›Ó§O³…8 \0ˆ@d|ğÁ*!!@\0\"€H\0„\ÏÖ­[UJJ\n\0D\0‘\0ŸÕ«W«şıû@$\0	€ğY²d‰\Ê\Ì\Ì$€H\0 \0\á3{öl5zôhˆ\0\">“&M2\r\0‘\0@$\0\ÂfÔ¨Q\ê\ÙgŸ%€H\0 \0\á3d\ÈS\'€H\0 \0a#36^{\í5ˆ\0\">\É\É\Éf-	\0D\0‘\0Y\Õr\ïŞ½	\0D |dŸ\r\Ùo\0‘\0@$\0\ÂFvş”@	\0D ,*++\ÙB	\0D 2?®\0\0D\0‘\0Ÿ]»v©\Ä\ÄDˆ\0\"\Ğ:jùò\åj\ãÆ\êÀ\êÄ‰\æ~ß¾}	 \0ˆ@\Û\Ä\ÇÇ›šˆ¦M¦€¦¦¦ª~ıú©µk\×(@$\0	€\ë™0aB³\"a7™\n*™\0D\0‘\0hvx£5‘\È\Ë\Ë#H€H\0 \0-3lØ°f%BŠ.«««	 \0ˆ@\ËlÙ²¥Y‘\ç	\0D M¤¸2X\"@P\0‘\0@$\0BcÆŒD\âÈ‘#	\0D 4.]ºdfhˆDŒ9’€\0\"€H\0„\ÇĞ¡CH|ø\á‡	\0D ty\æu\Ûm·)Ë²Tyy9D\0‘\0]\"n¼ñFõ\Ë_şRù|>õ\ÔSO@$\0	€\Ğ%Â–‡\Ü\Ü\ÜF	\0D $‰h\ëy\0D\0‘\0I\ì\×\'OL°\0‘\0@$\0\Â\Ï8ˆD™\0D\0‘\0ˆx\ØBdâ¦›n\"3ˆ\0\"HDdµòu\"d&\0‘\0@$\0‰ˆ\ê\ë\ÉL\0\"€H\0\ÑRÇ«Zûß¤f	\0DˆˆE‚\Ì \0ˆ Q‰D,†I\0	\0D\\$\áŠ\Ã€H\0 €DD%ö÷a6 \0ˆx\\\"\"‰`™ f	\0D< Á\Ânc˜	\0D\\Ê©S§L\çy\çw†œyˆ•H?ü°9F~\0D\0‘\0g$ZfhÏŒÄ˜1cø#\0\"€H€Û‡7\ÚŒp°÷\â`X	\0D<,‘ˆ\ÄÔ©SYœ\n	\0D\Ü*’)˜0aB»ˆ\ÄÒ¥KUÏ=•\Ï\çS³g\ÏV$\è€H\0 \àÎœ9£€\êÑ£GH2qC+[:T½ò\Ê+jØ°a\Ê\ï÷«„„5n\Ü8õ\Æo¨\ê\êjş€H\0 \à4***\ÔÄ‰U\\\\œ\Z5j”‘ˆö\ØkcÄˆ¯­­U;w\î4\Ã}úô1\ß\àÀ\ê…^P¥¥¥üa\0‘\0@$ +SYY©¦L™b2’!8zôh\Ãk¡¬ópCŒ×‹y‰4h‘\n‘‹\Ü\Ü\\#\"\0ˆ\0\"]€‹/ª3f2dˆ:p\à@‹™„hV Œf\Ñ)\æ\áö\á[vdXD\0‘\0@$ ƒ©ªªRyyy¦B†Š‹‹\ÛMb½Û§f>ûì³ª_¿~F*\Ò\Ò\Ò(\ØD\0‘€@>\İ/X°ÀDÿşıUQQQ»JA{o.	\n6‘\0@$ ‘º™r)Zù¿mÛ¶ˆ\ß\Ë^Dª­aüüüf+\Ûów¤`	\0Db|q}ù\å—Ubb¢JIIQ7nŒ\Éû¶•i°k*:J\"šƒ‚M@$\0	ˆ‚\×^{M%%%™\èÚµkcşş-É„]KÑ•V¬¤`	\0DBdÃ†\r*99\Ùd!\äBÙ4\İ\è+\ÔaÎ†‚M@$\0‘\0hÂ–-[TjjªùÄ½|ùòK\ß\ÛˆxÀ‘»xR°	ˆ \ài\n\Í\'\ëøøxµxñbUSS\Ó\á?ƒd&\äÿ\Ò\é[S°	ˆ \àö\ìÙ£`¦rÎ›7¯\Ó?=Ÿ:u\Êu1¦`‘\0@$Àu\ìß¿_\r<\Ø„Œ\ë_ºt‰ t\0l\"\0ˆ8š#G¨¬¬,s›6mš:ş<A\éD(\ØD$\0	p\'NœP\Ù\Ù\Ù&µ>i\Ò$u\î\Ü9‚\ÒÅ `‘\0@$ \Ë!\ãóR¼(1~üxUVVFP\0›ˆ\0\"ŠCNN¹\0‰Hœ>}š 8\\)\ØD$\0	hwd\ÈB.0’\Z—¥¥eH\Ü›ˆ\0\"1GŠ&e¹¨:T>|˜ x\n6	\0D\"F¦m\ÊED. ’öŞ»w/Añ0l\"\0ˆ„œŞ?¾YB”Ú½{7AFP°‰H\0 p²tµ\\d)kIe	\n6	\0D\Â\ãŸ.óóóMªºoß¾jó\æ\Í¢\ÊhQ°‰H\0 \á\ÕW_UIII\æ\äúõ\ë	\Ä\n6	\0DÂ…¬[·\ÎÈƒH\Ä\êÕ«	tl\"\0ˆ„\ÃÙ´i“¾\\†3¿†Î‚‚MD\0‘pR8))e)¤\\²d	]\n6	\0D¢²k\×.•n¦r>ÿüó¤Á´V°É¦pˆ \Ğ\È\âQò\ÉN:à¼¼<³¸€S	.Ø”l…\×ÿŸ	@$ İ\å«ekY\ÖZ–·p’ÿm2ˆ c?n6Ò’NVÆ•Iÿ‚9yò$\"H\0\"±¤¤¤D=Ú¤{ek\ïòòr‚®eÿşı¦f‘@$\0‘€()++SO>ù¤ùt6v\ìX¦Ë\'x\çw\Ì\Ú\'ˆ\"ˆDHEE…š4i’\É@Œ9Ò¤z¼\ÂÆUjj*\"H\0\"\á\"E“Ó¦Mk˜w\ä\È‚CVa•\éÌˆ\"ˆ„ˆLs›5k–Ybğ\àÁfŒÀ«¼ø\â‹\æ<@$	@$ \rdA¹s\ç\Z\È\È\ÈP{ö\ì!(\ày\æÏŸof\'!ˆ \Ğ555j\áÂ…f)\ëşıû›\â2\0/r\â\Ä	³2«\ãI¹9s¦Y\í‘@$\0‘€&\È^Ë—/7SÛ¤˜l\ëÖ­<¬\Î*E\Å\Í5mi)))jÛ¶mˆ\0\"\ámV­Z¥Urr²\Ù_\0\0¾EvmI&¤‰x{qÿD	0¬Y³\ÆÌ‰—]\å>\04F6\éjM$\äu†6\0	\Ï!s\á%%+Yˆ—_~™-’ZAÎ“\æ$B²^‘\0DÂ£\ÈXnZZš\Û]ºt)‹/nV$¼<“	‘\0D\Â!\ÈEË–-Q¿OQQ‘™!S9,X\à\É1]€H©¬¬4±KÄ˜1c<D	‡`wZ\"‘T†›5 D \æÌ™£ªªª¸*\0D€¬\ê\Z,25‘\0@$#v\ë×¯_HŠ¨\Ì\ÌLó)J\æ½_¼x‘+@ˆ8\Ø\ç¡lV\çu	@$*ÁŠ\æ„\â\èÑ£fˆ)S¦˜”,\0Ä†!C†˜ó\ï“O>A$	@$œ-Á\nò())1;q\Ês&L0;t@l‘U.\åC\Ğ	@$\"\âô\éÓ¦#‘÷[o½E‹ \Éj™………\êøñ\ã\\•€s\ËÁ\ç\"ˆD\İÎ;Uyy¹™ñ@‹¼={V¨cÇq\Î-‡[ˆ ¤4\é\èb\Û\áyq\à\ÜrË¹…H\0\"&rb\ÒIÅ¶I:€sË™\ç\"ˆD˜È‰I…H@\ì\á\ÜB$\0‰ ö\Í\×_¨O\ß_®m\Í5M\î\Ëstnˆpn!\0ˆD«\íb\å\ç\ê\à\æµÿ#5yN^£ƒC$€s‘\0@$ZlŸú\Ãu\İJm ƒC$€s‘\0@$Zn\ïx¦\Å\ÎN^£ƒC$€s‘\0@$Zlßš\Øbg\'¯\ÑÁ!À¹…H\0 tvˆpn!ˆ ±\ïì¤’¼¥\ÎN^£ƒC$€s‘\0@$ZlÇ‹\æ·\Ø\Ù\Éktpˆpn!\0ˆD‹\í\Ü\ç\ÔÁ-®O½\ê\ç\ä5:8D8·	\0D¢\Õv²8ÿº\ÎN£sC$€s‘\0@$ZoW®¨\ã\ï.¼>õªŸ“\×\è\à	\à\ÜB$\0‰W\Ş;V4¯\Åq\\yø	\à\ÜB$\0‰\ë>)}q|»ú\è\Íq-vtv“c\äX>A!À¹…H\0 m~R\â\"œ[ˆ\0\"\Ñbg\Ê\'¥\Ö>A\Ñ\Ù!À¹…H\0xX$\"\í\è\ìFg‡H\0\ç\"@±%\r‘\0\Î-D\0‘ ³C$\0‘\à\ÜB$\0	:;@$8·	\0D‚\Î	\Z\"€H\Ğ	\à\ÜB$\0	:;D	\Î-D	:;D	\Î-D\0‘ ³D‚†H\0xP$ŠŠŠ\Ô=÷Ü£n¹\åuë­·ª»ï¾»\Ñ\ëõ\'§ú÷ÿ÷F\Ï\Ëcûµ¶¾‡}œ´\ï~÷»ê—¿ü¥Ú¶m\"®‰-[¶¨û·3\ç•4¹/\ÏyñüB$\0\\,w\Üq‡98 Î=«233[\ì¤ö\í\Ûgûğ\Ã=jG\'÷w\î\Üi\îÿü\ç?G$Àµ\"±i\Ó&óŞ½{wu\æ\ÌUVVf\î\ËsÁ2\á•ó‘\0p±H\È\'ùÙ9\Òj\'%Ÿ¦\Ò\Ò\Ò\Ìs\é\é\é\æq$ıX2 öc\éd“’’\Ô~ğóüC=¤N<‰H€cE\Â\Î(\ìÚµ«\á9¹\ß4û\à•ó‘\0p±HH§b§D|ğA5a\Â“™h\ÚImØ°Á#™¹•Ç‘tto¿ı¶¹ÿè£6¼œœl“a–Ã‡›û÷\İw\"	[ĞƒŸ«ªª2\Ï\É0‡\×\Î/DÀ\Å\"!ŸVÆ«\îºë®†\éşû\ïo¶“’cºu\ëfn›û$\Ê®v=q\âD\Ã\ëò)©\é17\ß|3\"	·Ÿ_ˆ€‹E\"¸7d\'š\ë\è–.]j\î\Ëm$\Ü\Ï\Î\Î6÷%ûÑ´£;ş<5\à\n‘°‡&\äœj:´ñ¯ÿú¯;¿	\0‹\Ä\ã?\Ş0kyÙŸˆ\Ú\ê\Ì\"\é\è.^¼¨n¿ıvóØ®,·S¯£Gy¸µÇˆtö¹%•ò?)C‡2T\\lùú\ë¯{\îüB$\0\\,=zôP?ù\ÉOLB>¹È°†]=\Ş´©S§6\ZB9w\îœ\Z8p º\í¶Ûš­VG$Ài\"aË„V\Ú9\ÇòóóC>‡\Üt~!\0\Ú`\ÑD\Ú\çÜ’l@ğ°\ç\"€H\Ğ\Ù\"r“BKY(\ê\Ç?şq§LmF$\0‰./’¾m®\Ñ\Ù\"Áù…H\0 |jD‚†H\0 4D8·	\0D‚\Î‘\0D‚s‘\0D‚\Î‘\0D‚s‘\0@$\è\ì\0‘ !\0ˆ\"œ[ˆ\0\"AC$€s‘\0@$\è\ì	@$8·	\0D‚\Î	\Î-D\0‘ ³D‚†H\0 4D8·‰®|¡øş§Ÿ~úÙ®]»\ÌVğ;Zøm\ëÖ­ª°°°N·…ˆ\"ˆ\ç–gDB$b\çÎª¼¼œÿ(\ÛÙ³gUAAA–ŠYˆD3ˆ©ò‚H@\ì\á\ÜB$:\ÉD ±•	ıÿWH4\Æ\Z\ÛVVVf. \0œ[\Î<·\Ü\"ˆlûˆ,\"\Ñ\'Nœ”úò\Ë/»ôğÊ•+\é\è;\ÆUsn9\á\ë\Ès\Ë-\"Á\Ğ\Z\"\Ña\"awxÛ·o\ï²\Å.[¶lQ~¿\ß\Üv\å¢$œvnŸc@ ËcynyM$¾ùúõ\éû\ËÕ¡­¹¦\É}yq@$\\\Åùó\çH\0@û!\çXee¥\ç\ã\à%‘¸Xù¹:¸9G\íÿ\ã\ÈFM“×D\Â5œ9s‘\0\è\0‘())A$<$Ÿú\Ãua·\ÒCD\Â==zT\Å\Ç\Ç\Ó\Ó´#r\íß¿‘ğH|¼\ã™EB^C	\×ğÁ¨„„zz€v¤OŸ>\êw\ŞA$<$ßšØ¢H\Èk\È\"\á\Z¤sKJJ¢§hGúö\í«6mÚ„H ˆ\"\á>6o\Şl:9\0h?\Ò\Ó\Ó\Õ\êÕ«	‰„\Ì\ÒhI$\ä5\ä‘p\rk×®Uiiiôô\0\í\È\àÁƒ\Õò\å\Ë	‰\Äñ¢ù-Š„¼†< ®a\åÊ•j\àÀôô\0\í\Èğ\á\Ã\Õüùó	‰Ä¹\Ï¨ƒ[&\\?¬¡Ÿ“×D\Â5,[¶L\r2„ 7nœš9s&\"\á±©N\ç_\'ò\â€H¸\nù”4b\Äzz€vdÒ¤I*77‘ğ’H\\¹¢¿»ğúa\rı\\µ¶%@$‰™5k–\Z3f==@;\"\Ù\ÉJ \Ş	Y¹òXÑ¼k$\ä5V·D$\\Ã”)S\ÔÄ‰\é\é\Èü!ÑŠÄ•+\ê‹\ã\Û\ÕGokQ\"\ì&\ÇÈ±d\'	\Çó\ÔSO©©S§\Ò\Ó´#/¾ø¢™¹H¸W$\Ú\ÊB@$\\‹kÌ=› ‘5$d-	DÂ½\"J¢µ\ì\"H8I·2-\r }Ù¸q£JMME$\\,‘J„\İ	DÂ±dffª¥K—\Ò\Ó´#,E\ï~‘ !‰ŒŒµj\Õ*zz€vDvşds<D‚†H¸Y{İºuôô\0\í\ÈÉ“\'•\ß\ïG$	\Z\"\á>d\Ã.Ù¸\0Ús\ç\Î!QŠ\Äo~ó›Ÿ\"ˆ\"\Ñ\éÓ§¿€Ø³k\×.õ\Ì3Ï˜BË¸¸8u\é\Ò%D\",\Ëú\ÄOš¾_§¥¬Vß¿¦o¯\ê\ÇWôıKúşİ¾\Ò÷\Ï\êvF·ıø}{X³O\ß\î\Ñm§n[}>\ßúvn+ô1Kô\ë\Ï\é\Û\éúq¾¡[ºn	ú¸ÿy\â‰\'şC?_||üIIIı\È#üÙ–-[¸ø#ˆ„Œ\Û\îİ»— œ9s\Æ\ìò9t\èP”¾ø¨Q£F©\×^{MUVV’‘h\":Fÿ¥/\âo¶\Ô!Ë…[„@·*\İ•‹¸<×«W¯;\ä\â.yı=\ä¢/}\á¦Ÿ/R \ÛıŞ‹\ëe\á5}»A$BdB?~¯^.\ëöIı÷ù(\×\í+‘ıú%ù¾\"+\"-ºÕŠ\Ä\ØB\Ã\Å‘@$ê‘\î\èÑ£\\\0\"@:@ùt:a\Â“İ“\á‹¨yó\æ©Ã‡ 6DB_˜?•‹²€QM;cı\\ıšd>JNNş5ˆ\"\ÑE‘O>E@hˆx\Ë\Ú+2\ãI.‚\"²B\ì¦M›L‡¡‰Dı‰¡Uô\ê\Õ\ë\îú—nª\Ï\Èğ\Å\Ó[¶O«ÿ[t™÷B$Œœ\Ä\çÏŸ§‡h9?Ö¬Y£Fm†E¾\íõWJKK	P„\"ag#‚\Ú9©C\Z\ãóúõÿ\ã†YEEE\ê{\îQ·\Ür‹ºõ\Ö[\Õ\İw\ß\Öë‘¾ogŠD$\ïH8”\Ú\ÚZs\Ë-\0ü/{ö\ìQ3f\Ì0Ó£E¤XrÚ´i¦ó\æ|‰^$¤6¢‰D\ØMj\Ş\éŞ½û÷\İ2ıó;\î0¿÷\ÔÙ³g„†óz¤\ïÛ‘\"‹÷F$üI‹)i\0J•••©—^zI\r6¬¡H2;;[½ú\ê«I¶ƒH\Ô7^\'RÌ¨cÿ\ÏnZG\â»\ßı®ù½9\Ñë‘¾o[Yû±\İ\î¼ó\ÎF\ï\Õôu;\ëñ—ù—\æ{\ß~û\íf1Ã¦\ï\İô\ëB\nDÂ¡Hm\"^¤¦¦FmÛ¶MMš4I%\'\'›‹˜lª5g\Îó	\ÚO$t¬[\ÈF\Øí¢›2=ôù½\å\âû\àƒš\Â\\\É „úz¤\ï+¯\İ|ó\ÍmŠ\Äë¯¿®Ö¯_o\î?ò\È#×½.² ªÙE¸\í\Ç?ù\ÉO\ÚğºHHÑ˜|òğÇW,P4˜˜¨Æ¯\Şx\ã\rUUUE€:N$Î¶!\Òö¸E$$\Û5v\ìXu\×]w5\\`\ï¿ÿş_ô}\å±\ÔO´%ò¿/\Í\Î:4÷zsERšf!	Š\Ä|Àúÿ\àZdñ\'Yş]:[‘‘‡!C†¨^xA•”” \Î‰–j#¾±,\ëˆn«õ\ßj —\È...n\È\"Dòz8\ïü\Ø…HD\"”Çˆ„‡E‚	ÁmH‡:kÖ¬†\"IY~Ê”)ª°°\"É®#\"\r\Õú\ïóºsHMDWÊˆF$üq³Â©\Üÿğ\ÃM$‹\êë‘¾¯;\Ès’‰\Ë\Ï\ÏouhcÃ†\r-mD\"’	‘Ç’5A$\\\ì±!-€S©¨¨P+V¬hT$9b\Ä3®+û[@\×	-/:ıBHô\è\Ñ\Ã\\\Ô%; X~Ø·o_È¯Gú¾R\Ëp\Ûm·µXø\Øôy‘\æŠ-#	‘y\ÉnPl\éÖ®]k>¹8\É*\ìØ±C\å\ææª””“\ï×¯Ÿzö\Ùg\ÍV\İ\ĞõE\Â\r\nV¶deKD¢•+Wš\Â3€®ŒTˆ/\\¸P\r\Z4Èˆƒ\Ô;<ù\ä“&\ëõM°	D‘@$:•eË–™\â3p§Nr\í\ï&r \Ó\ÑDD\ZDD\"/^l¤	¯ˆ„Y4\×	D¢\Ë û\Èx28Ù–ZşWe· ;\Ğ\ÊğDÿşı8È°\Å\äÉ“UAAE’ˆ	2ˆDWE\nbÆŒC\ï\æ0‰¸ñ\ÆÕ½÷\Şkn*R)‘\"²v‘\äğ\á\Ã\Õ\Ë/¿l\n(‘@$	D\ÂÈ´¸‰\'Ò»9L\"lyO\ìN‘	\É*\ÈLùŸ“lƒLÍ”B\ßÙ³g›õL\0‘@$	DÂ\Èh\êÔ©ôn”ˆ¶\ï\nÈ¢O²ø\Ó\àÁƒV’7nœY$Š\"ID‘ !.@†5\ä!8S\"š¾.ŠH‹º\ÌYO–›–\"IY\èL\äAŠ$eY\ê\'Nğ‡D‚†H¸\rŸ–‚Kp®D\ØD:\Ì!;[\Ê:‘f4dƒ«¼¼<³\á•I\ÊX²–lˆ%c 4D\Â\Å\ÈşõK—.¥ws¸D\Ë\ÄM7\İrfB†úô\éc@ö\\‘“¹-¤Hò•W^Q#G4’R(™••e–\à•\åp	\Z\"\á!222L\å<8_\"‚¿Nd¢­¯Û³g‘‡\à“š\Û>[Š$w\îÜ©¦M›f–S·‹$gÎœi\Ş\0‘ !	¹ H\á¸C\"š~}K™	\Ù\èG„ \éŒó\æ\Í3¯—––6,V&Ç‰pH=Íš5k\ÔÅ‹ù\"H ˆÄ·\È\'LÙ¸œ%7m´\Ó\Ú0Gs\ï³q\ã\Æf%BšU\ØC²tº\Ô\Ï=z”?\n ˆ\"H4\\4d+qˆ¡\ÔD›‰E$š\ËL,_¾¼E‰°›Ìºˆ\æw\0@$hˆ„‡”µ,M±©´\çpF¨\"ü¾’mhM \ì&;\Â ˆ\"H„„\\\\H]\Çû‚,B!€P>İ‡[H2³gÏªw\ï\ŞjÀ€¦Ù›a5m,™ˆD\Û\Èôf.şˆ\"¡‘4÷™3g\è\İ\ÚA$\ì&\ìÕ«W\ÇL\"\"	aúô\é\×\Í\æ\éŸò³ÉŒY}R~V \0D¢uv\î\ÜY[^^\0Ä¨•–––h‘¨F$z\Ñ;ş<½[;Š„İ¤¥\é°A¤³3\"	ûûµµ\ÎKW\"\Ñ6Û·oŸVPPP÷\å—_vÙ‹ó•+W#[·n­\Ñm\"\á0d}€\àd\'Zj²è½C£\İä“«|‚µ›\\(eUCi²)“\ÌIMM5SL¥\Éê‰²E´¬€(©uY\ÃB–O–OÂ²0\ÖĞ¡C\Í\ÂFÃ†\r3+nfgg›EFm\Ò\í²Gƒ,½œ““c6\Z“t}nn®\ÙJ>Q\ËErÆŒfGSÙZV[œ;w®™y K4/\\¸\Ğ\ìû pÉƒ, $;M\Ê:\Z¯¾úªz\íµ\×\ÌôF™»a\Ã3»aÓ¦MjË–-f•F\Ù\ÎZ\nSe\ê\ä\îİ»Uqq±©/‘µ<h–˜>~üx›5§\ßÿş÷a\Ï\Î·µ„“6úD¢+£/|“ô§\èo$%\ßÕšôq\ÒgKÿ\Õ¾&­\ÚMá¹Œ„È„4±Bù$*\Ù	Y¹P¶q–U\ne=IŸ<y\Ò\\$\åbyøğasñ”‹¨\\LeQ\"¹¸Ê¢Er±•‹®üóÊ´R¹\ËEyıúõ\æÓ¸\\¬%•.+#\ÊE\\.\æò/w¹\È/^¼\Ø\\ô\å\â/k\ZÌ™3\ÇH\ì\" \É\ÅW¤A\äA$BdbÂ„	F.D2¤;\Ö\ÈÇ¨Q£Œˆˆ”ˆœHYiy‰™‘&b#’#M„G\ÄG$HdH¤H\äH@ö–\'‘©`¹’7”‚F»\İy\ç!gb%\Â\Ã?l9u\êW6@$\\F÷\îİ¿¯û—«\Ò\Ç\rD\\4´!b\"b\ÕtX£µa†ö\ÌHPT	ˆ„;ñûı¯\ÛıN¯^½\î&\"ˆ8\\$$\Ã!š\æ\è\è\Z	{/†5\0‘p\'–euÓ­.¨* *ˆ8T$de\È\Â\Â\Â6\ï¨Y\Ñn5€Ht}tß³¿É‡™\Z\ê 2ˆ8ˆp7³\ne6E4\"!µ(\á¼?\0\"\á<\â\ã\ã­\æ†Uı~\ÑA$ÀØµ¡\\\ìoˆ`eK):@$\\8ßœHX–õ)\ÑA$À#´\×^H ®—ˆ¥­\Íóûı¿&Jˆx,3\Ñ^» \îBK\Â\íRÑšHX–õ!‘B$Àc™‰hj\Z@$¼ƒ\Ï\ç¥e¡L·oD(š\ÌÚ°\Û5Š.	 3\Ó\á\0DÂ½h™±xA\n0¥\ØR?%SC‰\"\ÌL„#H P?\Üq\Ş\çó\r ˆ@\Ã\"Rm\rs\ÈO\n+‘€ú\â\Ë+Z$#ˆ@H™»¦‰\0D\êE¢–\å±	€d\"œõ\'\0	Ïˆ„\êİ»÷‰\"Ğ¬L\Ø\Ò\ê°\0\"\á©úˆ\Û\Ùù‘\0h;ñÀ°‹\' \Ğ\\6\â>™\îI$	€V3ò‰‰\0DšbYVo\İ?\\&ˆ@«ˆH\0 \ĞŸ\Ï7\Ì\ï÷W	D\0‘\0D\Â&\Ì\Ôı\Ã\çD‘\0@$\0‘€Hj$ò-\Ë:B$	\0D	ˆD$6j‘\ØM$	\0D	ˆD$v‰L	D\0‘\0D\"‰exƒH \0ˆ 6–e•\ÊnŸD‘\0@$\0‘€°ñûı_\é6‚H \0ˆ \É\Ğ\Æ\åøøx‹H \0ˆ ‰H\\³,\ëÿ	D\0‘\0D\"‰:Ù¸‹H \0ˆ ıû÷ÿvşD$\0	@$ \",ËºK÷\rµD‘\0@$\0‘€H†5Õ­šH \0ˆ 6>Ÿo€\ß\ï¿@$	\0D	›@ 0Y÷\reD‘\0@$\0‘€Hj$ûışOˆ\"€H\0\"a£%\âu-	D\0‘\0D\")¶,\Ô\"±H \0ˆ \É\Ğ\Æ\İV	D\0‘\0D\"\ÉHœ\Òm>‘@$\0	@$ ‘8«\Ûx\"H\0 €H@$\"ñ\ß\ïO!ˆ\0\"ˆ„–ˆ«O<ñ\Ä	D\0‘\0D\"\ÉH\Ô%\'\'ÿ‚H \0ˆ .7I¿0q\â\Ä\ï\nD\0‘\0D\Â\"11ñ\ç–e\Õ	D\0‘\0D\"©x@÷W‰\"€H\0\"‘\ÔG$Ê¬\r\"H\0 €H@\Øø|¾±~¿¿‚H \0ˆ 6–e=§û…\"H\0 €H@\Ø\ß\ë~\á ‘@$\0	@$ ’\Z‰­º½C$	\0D	¿\ß_\ìóù\Ö	D\0‘\0D\"\ÉH\×m)‘@$\0	@$ ‘øB·iD‘\0@$\0‘€HD\â¼nƒˆ\"€H\0\"‘ˆÄ•@ ĞƒH \0ˆ I±e­‰{ˆ\"€H\0\"‘d$\Ô#<ògD‘\0@$\0‘€°x\ì±\Ç~,}‘@$\0	@$ l\â\ã\ãÿY÷	×ˆ\"€H\0\"‘k<¡[‘@$\0	@$ ’B\Ë,Ë²*‰\"€H\0\"a£%b†\î>\'ˆ\0\"ˆD2´ñ’nG‰\"€H\0\"a\ãóù\Şğûı\ï	D\0‘\0D\"\ÉH\ì\Òm3‘@$\0	@$ ‘8\ì÷ûW	D\0‘\0D\"‰\Ï|>ß³D‘\0@$\0‘€HD\â+İ²‰\"€H\0\"‘ˆ\Äe¿†H \0ˆ 6–e\Õ$$$üŠH \0ˆ IF¢.))é¯‰\"€H\0\"aÑ½{÷\ï³ó\'\"€H\0\"§\ß\ï¯%ˆ\0\"ˆ„M ø/-\ÕD‘\0@$\0‘€H\ê#úY–uH \0ˆ ‰HL\Ô\íK\"H\0 €H@\ØX–µH·O‰\"€H\0\"a\ãóù\Ö\êş`‘@$\0	@$ lü~ÿÛº?\ØA$	\0D	ˆ¤Fb¿–‰×ˆ\"€H\0\"‘d$NZ–µ€H \0ˆ IF¢\\·\"H\0 €H@$\"qÑ²¬4\"H\0 €H@$\"qU‹\Äoˆ\"€H\0\"a£%¢N·nD‘\0@$\0‘€p¹Iú‚Ş½{P \0ˆ \î°\Æ\ß\êVG$	\0D	Ÿ\Ïw¿\îjˆ\"€H\0\"a\ã÷ût_p‰H \0­’nÄ¡µÖ§Oˆ„÷†6F\ëvH \0­RXXØ¦H¬^½š@\"á½Œ\Ä}şŸ&ˆ@›ô\ë×¯E‰HNNV\Õ\Õ\Õ		aY\Ö+º\"ˆ@TY‰W^y…\0\"\áÍ¡-º	‹„|J\\»v­š0a‚ùD™\Ğ\èTZZšzê©§Ô²e\ËÔ¥K—\èi Eš«•\Ú²€Hx6#ñ¾\ß\ïÿ‘p¡H”””¨I“&]\'m5‹\ì\ìlu\ä\Èz)+Am ®‘8¦Û‹D\ÂE\"!Ÿ§M›f„ h®I–‚4eÀ€d#\0‘\0{h\ã-Ó‰„KD\âÀ¦co*T‹/V»w\ïVŸş¹ªªª2\Ç\Ëmyy¹ú\àƒ\Ô\ï~÷;•••u\İ\×&&&ª={ö\Ğû@Û¶mkøÿa3\0D\Â\Ó\"ñµeYCˆ„DB:÷¦\Ã#G4’p\íÚµ\ßgß¾}jÜ¸q\ŞG\Û&\ékh„]+A6	\Ï\×H\\ñù|ÿC$.\"ÁCñññjÃ†\ra	DS\Ş|óM3¥±ph©•\èÙ³\'\0D‚Œ\Ä5\İ\î%	\Îq\Æ8v\ìXLN¸S§N©!C†4\ÊL0\Ì\Â3\Ï<c:d©£@$<-ò¡óGDÂ¡\"!i\å\àš‘©yˆ%ò~Á2!5`\"7\Şx£º÷\Ş{\Í-2ˆ„7\éİ»÷_\ÈuH8X$dvFğpF¬2\Íe&‚‡9|òIz#K„-“\'OF&\0‘ğ®Hü“m	‡Š„¬\\!5\í‰\ÔL\×KÈ\nx[\"\Úz\0‘p7ú\Z\ÔS_ªˆ„CEB›\nqõ\ê\Õv?G\İğ=e\Ñ*@\"š¾.\n\0D\ÂÈ´O™şI$(R<\ÕS¦xv’…^³²²’^	‰h€a@$¼…,D¥¯gˆ„EB¦aXF3\Í3\\‚­’½9ZcÅŠÈ†G$\"X&nº\é&2€HxC$^\Ô×‚£DÂ\"!p\Ùó¥K—v\èI¸r\å\ÊFKh7—-Y°`™\İ!Ç°g‡w$\"ø\ëD&\ÈL\0\"\ánt¿A6\í\"	\Ù\ÅÓ¾˜Ë²\×‰£\Ø\ß;55µ\áùŠŠ\n5{ö\ìFkZ Ş“ˆ¦_Of	W‹Ä»²8‘p H\×G|ñ\ÅzÊºÁuR7!\Ã²XUs±\æ„ó%¢¶¶\Öl5/·­\Ñô8j&\0‘p}±\å!\İÏ¯\"‰\àµ½WG!\ß/œDÁùÑ­[7\Óù\ÊmK2\Ñ\Òqd&\0‘puF\â´ş™G$.A8\"1xğ`“±)ª²\ÕÄ‰\ÍBZ22ş|õ\Â/¨üü|S@*kalİºU©½{÷ª£Gª\Ò\ÒRu\î\Ü96‡\ê¤\á\É0\Ôw¼-\ÊD°DØ­ÿş1&@$º¬Hœóù|£ˆ‰¨2RX\Ùt\×\Ñ\à¶|ùrµh\Ñ\"5g\Î5c\Æó\É4\'\'G3F1B\r:T\r\Z4\È\ì&)­””•””d\ŞS†Nd\È$x\Ø\Ä~,¯\É1r¬||­¼‡¼Wff¦yoùrñ\Ê\Í\ÍUO?ı´\Ê\Ë\Ë3?\ï‹/¾¨V­Ze¶ÀŞ´i“*((0{ˆ\È0Í‰\'TYY™ºxñb›©|·KDK’,m½n\Ã0 ®‰Kºˆ5aÑ´FBld\Ú{hC¾d\'$K!\Ù\n\ÉZHöB²’Í¬†d7$\Ë!\Ùù™$û!YÉ†HVD²#’%\É\È\È0E«}ûö5û•\È,“`yiºº</…¤rœ,._\'ò2`À\0\Çg]\Ú\Ê´$555!IDğ÷a6 ®‰\ZŸ\Ïw?‘p Ht\ÅY‚\Ì\Ü5j\Ôu¢\áT\ä‚(Å¢\"O\'OT4™\É`H&cİºu\ê•W^qt\Öeúô\é!e\nš“‰\ï}\ï{!KDS™ f	W[\Ö\é>\ëo‰„E¢+¯#!È…Jv•‹ tİ¬‹\îL5CĞœL„#s\0\"\áºw\ïşıú?o\"\Z	ù\ÜY+[Ê§\ëPW¶¡€®‰\ì\è*ÿkw\ŞygX_\'\ÃM3òX‡‡~\Ø|­ü\0ˆ„#³\İôu –H8T$\äSkğÎŸ\ìµ‘\î\Ô\ÌXg$dX\0‘p¬HüF_ª‰„CEB4vğ\îŸ‘•7n»ºT&:ªF\ÂŞ‹ƒa\r@$/iúZp‘H8X$JJJ\Z\è\Éøy{ò\æ›o6š\É \Ù	ğ†L\Är\Ö‹S\"\áÀ}-(\'	!¸\èR¦&;v¬]N<Ç–b=û{I6\Ü\'\ÍÍ¦ˆ\Õ:R \Êl\r@$\\%õ‡Ù“D\Â\á\"!S\í]6\í\ÂK™ªK\äıd€ı=\äû±†;±k‚/ö±\\\ÙR¦« \î@_\ÖX–µH8\\$Y xˆCd\"V™	\ÉDK„|ù~\àaXíµD\0\"\á:‘Ø¡[‘pH\ë×¯o$2\Ì!5\Ñ`JMDğp†4Y\Ã\0¼“™–	\É0„²ûgğq¬ˆ„«EbŸd%ˆ„KD¢9™°gs\ìÛ·/¬÷‘\"JY•±\é\ÑH„÷2\Ñ\Ô4 €H¸Ë²>\Õm‘p‘H\Ø\ÃÁ5Á\Ã²\æû\ï¿oö\æ°7ú’[©Ù+ƒ›\n®‰`8ƒ\ÌD4\Ã#\0ˆ„+E¢\\_#&	—‰„ …Á³9¢i2;ƒ\ÂJ2\áHˆ„g†6.\êÖH¸P$ld	Y90x\ÌPš/‹M\É\0vf\"”a™\âIa% ‰\êŞ½{ÿ\'‘p±H\Ø\ÈrÚ²7‡d)d§\à-\Èmq]<\å¤\ìÁ²\×I¦Á®©@\"\0‘ğ~¿¿¶W¯^w	ˆDS6n\Ü\Ø [¶l¡W¨e¢¹õ\'\0	\×g$”\ì\0J$<(’}°EBˆD&liu\Ø\0‘pIII­¯!uDÂƒ\"±v\í\Ú\ëj\"\ÈJ@¸\Øˆx€]<‘ğ\æ°Æ¯-Ëª!‰”””\ëD\"==\"\ÊL\Èÿˆ„\'‡5º]&‰+V´8Sc×®]ô.6ò¿#Å¼\0ˆ„·ğù|£ôùHxL$š[¨\Ên²Ÿ@¸ÈŠ§\çÏŸ\'€HxO$\Õ\çÿgD\ÂC\"!\Ó?\ÛZ?‚\Õ+!‘¨¨¨ €Hx¯Fb¥eY‡ˆ„‡D¢µlDğ2\Ú\0\áŠDii)\0D\Â{5›u\ÛE$<Xlisô\èQ³@4\Èÿ\ĞÉ“\'	 \Ş‰=>Ÿ\ï\r\"\áa‘8|ø°\Ùj Z‘)@$<\'Gu{‰HxX$d«pD¢Eş‡\ä	\0‘ğœHœ\Ñ\íi\"\áa‘\r¹d\Ï\r€hÚ›\â\âbˆ„Ç°,«R‹D&‘ğ°HH\ç/€hHJJb\r@$¼™‘¨\n=‰„‡Eb÷\îİˆDMrr²*(( €HxO$®\Å\Ç\Çÿ3‘ğ°H™O“\0\Ñ K®oİº•@\0\"\á=‘P=öØ‰„‡E¢°°Põ\éÓ‡¢¢oß¾jÓ¦M	‘œœü#	\"\áq‘Ø±c‡IKDƒlC¿~ızˆ„·²÷\êVK$<.’–´4@4ô\ë\×O­Y³†@\0\"\á!@Ë²®	‹\Ä\æÍ›MZ\Z \Z`öq@$<•‘¤\Û\×D\Â\ã\"ñ\Æo¨\Ô\ÔTzˆŠAƒ©üü|ˆ„·Dbšn_	‹„Œk\Ëø6@42D½ø\â‹	\áóù–i‘8N$<.\ëÖ­C$ j†ª^x\áˆ„‡ğûıĞ­˜Hx\\$¤@N\n\å\0¢aøğ\á\êù\çŸ\'€Hxkh£È²¬·ˆ„\ÇEbõ\ê\Õ*==¢\";;[=÷\Üs	o‰\ÄA-¯	‹„T\ÚK\Å=@4Œ3FÍ=›@\0\"\á-‘(ñûısˆ„\ÇE\â\å—_Vô(\ãÇWO?ı4\0D\Â[\"Q\áóù\Æ	‹„LÙ“©{\0\Ñğ\ÔSO©©S§@$<„eY—´L$	‹\Äò\å\Ë\Õ\àÁƒ\éQ *&Mš¤rss	 \Ş\ÊH\Ôøışˆ„\ÇEbÙ²ef\r\0€hl„d%\0	O‰D]jj\êÏˆ„\ÇEB\æş\Ë\Z\0\0\Ñ õR\'€HxƒŞ½{¯~\çÏ›ˆ†\ÇEbÑ¢E*++‹¢Bfl\È\Ì\r\0D\Â$\'\'ÿÂ²¬:\"H¨ùó\ç«#FĞ£@T\È\Z²–\0\"\á\rü~ÿCº]%ˆ„š;w®\Z9r$=\nD…¬j)«[ ©\è«\Û7D‘PyyyjÔ¨Qô(‹/fˆ	o‰Dng‰\"Á\Ø6\Ä\Ùù“\Ù?€HxË²h‘8I$	5s\æL5n\Ü8zˆ\n6D\Âs\"±Z‹\Ä~\"H0mb{¶\0\"\á9‘\Ø\î÷û\ß&ˆ„š6m\Z	AÔ°= \ŞBK\Ä^\İ^\'ˆ„š2eŠš8q\"=\nD\Åúõ\ëUZZ\Z\0D\Â;Å–\',\ËZL$	³?‚\ì“\0\r7nT©©©	\ïˆÄ—Z$&	D‚Í– &lİºU¥¤¤˜û•••\êÈ‘#ª¤¤„À\0\"\áŞ¡º¥	D\Âk\Èğ@¨ˆ($&&ªøøx¥;%\ë\í7\×\Èt\"\á\êŒDu ø/\"H˜BK)¸‡	&´(\ÒD0*** \î‰Zıa\âN\"H¨\'Ÿ|RÍ˜1ƒ\Â\ÎJ\èO#-Š„ü_ ®	Õ¿ÿ?!ˆ„\Z;v¬š5k=\n„¬ŠÚ’Hœ9s†\0\"\áRzö\ìù—ú<g\çOD\â[F­}öYzˆ(+\Ñ\\K®\"\án~¥\Ïõ\Z\"Hd\ç\Ï9s\æĞ£@D,[¶\ì:‘ØµkD\Â\Å\Ä\Ç\Ç[š\ËD‘0dgg«yó\æÑ£@\Ä\È[\"H@\0‘p9~¿„>ß¿\"ˆ„aøğ\á\êùçŸ§Gˆ‘Å¨l‘û\0ˆ„»±,k–>\ß?#ˆ„!++K-Z´ˆ¢\"99\Ù\ÔK\0 \îGK\Ä\n\İ>&ˆ„a\èĞ¡\ê…^ G¨X»v­\ÉH\0 \ÈH¼©\Ï÷]D‘02\Ä\ÌA\×\æô\éÓ¦ˆqÛ¶mê­·Ş¢E\Ğd\ï\Â\ÂBuüøqş¡\0‘ˆ®F\â=\İşH$	\Ã\àÁƒ\Õò\å\Ë\éQº¸D\ìÜ¹S•——«\ê\êjZ\í\ìÙ³ª  @;vŒ,@$\"\ÏH\Ñ\"ñ;\"H\r\Z¤òóó\éQº0’‰@\"b+’\Ù@$\"®‘ø\\\Ë\Ä\"H222\Ô\Ë/¿LÒ…‘‹\Û&C\0ˆD\ÄC•ºe	D\Â0`À\0õ\Ê+¯Ğ£ta\ä¢\Ç\Å‘\0D¢e$ª,\Ë\êM$	CzzºZ½z5=ŠDâ›¯¿PŸ¾¿\\ÚškšÜ—\çD‰‹\Ä5\İ\î#ˆ„¡ÿşjÍš5ô(‰‹•Ÿ«ƒ›s\Ôş?l\Ô\ä9y\ry@$\0‘ˆ¡HÈŠ¶?%ˆ„¡_¿~jİºuô(‰\Ïı\á:‰°[\é¡\r\È\"ˆDLx\ä‘GşLD‚H \r¤¥¥©\r6Ğ£8\\$>\ŞñL‹\"!¯!ˆ ± W¯^wûışZ\"H4šš\Êş.‰ƒoMlQ$\ä5\ä‘\0D\"ø|¾\Ç\â\â\â®	D¢¾}ûªÍ›7Ó£ ˆ \Ğ&~¿ n\ç‰\"\Ñ@JJŠY:œ-2K£%‘×D‰‰\ÄË²Êˆ\"Ñ€\ìÚ¸c\Çz‡‹\Äñ¢ù-Š„¼†< €HÄ‚¸¸¸¥º}B$‰úô\éc62g‹Ä¹\Ï¨ƒ[&\\?¬¡Ÿ“×D‰‰\Ä:\İ> ˆDIIIª¨¨ˆ\Å\á\"!\ídqşu\"!\Ï!ˆ 1‰ºm%ˆD‰‰‰j÷\î\İô(N‰+W\Ôñw^?¬¡Ÿ“×D‰X`Y\ÖGZ$^%ˆD#‘(..¦Gq°H\ÈÊ•ÇŠ\æµX#!¯±º%\"ˆDŒ2%º\Í#ˆD			j\ïŞ½ô(N‰+W\ÔÇ·«\Ş×¢D\ØM‘c\ÉN €HDƒ\ß\ï¯\ãˆ\"\ÑH$8@\â0‘h+Av‘\0D¢2\ßø|¾>D‘h >>^>|˜\Åa\"J¢µ\ì\"H\0\"?\Ó\"qU‹\Äÿ%ˆD#‘8zô(=Š\ÃD\"R‰°\"H\0\"&£$^Z\"\êN8‰€:q\â=Šk$hˆD\Å\Í7ßŒH„.u7\Şx\ã‡Z$\Ôw¾óÉ„‘h$%%%ô(ˆ\"Bş~û\Ûßª¸¸¸=\É\ÉÉ¿\àrÓºD\è6©şqN“\Ç\àu‘ğûıª´´”^‘@$Às\Üz\ë­J\ÖEĞ­N÷…o\'%%ı5—V%¢­\çÁ«\"QVVF‚H \à\Ù\Z	\İş:..\î¸nµúş{\ì±sùiS\ì\×\Ç*DBUTTĞ£ ˆxV$lz÷\îıŸZ&N\ëvÍ²¬\Õúñ‘ˆVOf‘0\"QYYI‚H \ày‘°‰·´L”i™¨\Ñ}\ä‹Z(¾‡D´*µd&<,údQ/^¤GA$	@$š û\Ç~Z$¾Ò·\ÕZ*\ÓOİ„D´øuµd&<,Ò±\"H\0\"Ñ¢Pd\ëvQ·ª@ 0‰ f‘h\"µµµô(.‰}ûö™)¾ú§ª¾û\İ\ïšÛ‡~¸\áõú´\Ñ\×4}N¶™¿\ç{\Ô-·\Übª\Ü\ï¾ûî¾·ı>\Ò\ä{ÿò—¿TÛ¶mC$Àq\"a#!2Q/\Ù.–É¼,	!\Óô8j&¼&\çÏŸ7\"1{öldÂ…\"!»ºŠ8üı\ßÿ½úğ\Ã\ÍsGQ\É\É\Éa‰\Äw\ÜaË,gÏU™™™a‰„\Üß¹s§¹ÿóŸÿ‘\0ÇŠ„}ñôûısd¸£~Ø£_g_(RSSc‰8Z›£­\ÈDKÇ‘™ğZF\â\àÁƒªoß¾*%%E\íß¿Ÿ\ÅE\"Ñ½{w\ÓQnÙ²%¤‹}K\ÏI6A‹„„óı›¾Ü—¬†ıX¦\'%%©ü\à\æù‡zH<y‘€®.)À”BL)\È\Ô2ñ¥hvÖ…B¤FÖŠ@(š\ÎXœMlA&‚%\Ân‹c8LN	A²yyyf\ÇÌ™3\ÉN¸D$\ä\â,ÿCUUUQ‰„\\\à\í\á‰|PM˜0Ád&\Â‰·\ß~\Û\Üô\ÑG^—Ìˆ<\'C\'²qœÜ¿\ï¾û	p„H	\Åeª¨L•©£@\à¿:A$Dfdq­:}»U÷\å·GQÑœ$\ËD[¯\ßÀ0‡E\ÂF:sm´¦ƒß»w/½\"Ñ9;v¬ºë®»\Z^»ÿşûÃª‘°‡5d_—¦?_p“½	p’H\Ø\È\"V²˜•,j%‹[\É\"W(ò=•\İ\ê…bi÷\îİ¿aaeK²ğ%‚\Ù^	;;1o\Ş<“˜>}ºª©©¡·qø\ĞFk_\ßT6\ä¶\éDÓº;;NF\";;\ÛÜ—ŒF\Ó\ï-µ:\ÔH€\ÓE\ÂF–\Ù\Öñ¹˜\Ëò\Ûúş½ ª…&C\ã#œÑœLT‡!Me‚š	¯ˆ„l-––f²rñ\0ç‰„XJ±¥d\äoh[J]‚}L¯^½L‡°h\Ñ\"óx\éÒ¥\æñ\ã?\ŞpŒ\ÜßµkW\Ã{\Êë’G$d­’\Ûo¿\İ<¶gn\ØC£G¹Æ¢µÇˆt‘°‘À´H\ì	\Î\èh’9¸¦o¯\ê\ÇWôıKúş…ú¢Í³ºÑ­D?şD\ß\Ö\Ç\ì“\Ú\İvÊ…\Ï\ç{Cß®\Ñm…>f‰¬m¡o§·\"v»¬¿öiıcs¸¡9™G\"\æğ²H\Ø,X°Àd\'¦L™\Âz	i2\Ó\"!!Á…\È\í#<\Òğú™3gŒ0şùŸÿ¹\é\äVŠo\åyû˜=z¨Ÿü\ä\'&!YÖi¥\á[N:µÑ°È¹s\ç\ÔÀ\Õm·\İÖ¨ƒB$À\r\"TCñúœû3\ÉThq¿C_\Ô\ï{\â‰\'ş#ô\Ğ}k‚n\éú\"?L2\"2#D\Â\âzYxM\ßn‰™Ğß«—‹Ãº‰l”\Ô\ËG[\"¡zö\ìiÿ¾‡\Âü¾\ÓL&¢ºşùpx³şkÆ¥\İc\"!È¸v¿~ıTŸ>}\Ô\îİ»\é}$4D:W$:¨F¢%øL\ËGV3\Ã\Z¡3\Ä:#1ËºGE\Âfñ\â\Å&;‘››Kv‘@$\0‘\è\È¦aYÖ‡>Ÿ\ï\",´Œu\Äx\n.‰F\È<ÿôôt3\Î.\ÓöÀ\Û\"!C\Í5D‰‰_\×„w~¨[·¾¬#gm°8\"\Ñ<K–,1Ù‰‰\'šJ #AF‰§W¯^w\Ë,‘£jn6E¬Ö‘Hd¶\"\Ñ&%%%jÀ€*11Q\Ò+!ˆ \Îb|3ƒX®l9‹\Ë8\"Ë—/7Ù‰œœu\é\Ò%z\'D‘\0D\Â9´\×^H\"¥¥¥*##\Ãd\'v\ì\ØA…H €H8/3,‹om÷\Ï\à\ãX/‘ˆüü|³mõøñ\ã\ÉN ˆ \Î\ÊLDSÓ€D ±C3\Z4hYi\ëÖ­ôVˆ\"ˆ„33‘\0\"V­Ze²²\á“,‘ˆ\"ˆ„\ãj&D¢s‘#333U||¼Ú¼y3=\"H\0\"\áŒ\ÌD(\Ã‰V\"Æ«¯¾j²£F2»=\"H\0\"\á\èÌ„]SD Gyy¹\Z:t¨\ÉNlÜ¸‘^‘@$\0‘p¦L4·ş Çš5kLv\";;[UVVÒ›!ˆ ]_&Æ‡9\ìˆDûRQQ¡²²²LvbÃ†\rôhˆ\"ˆD×®™™(¸]<‰®Æºu\ëŒLŒ1B;w­¶m\Û\Æ\Å‘\0D¢\Ó3–e)$‘è’ˆ@ˆHˆPˆX@cv\î\Üi\êK€\Ø4™I$r€H„‡\ì2Ú»w\ï	D¢\Ë\"C\"2\ä!Cğ-\'NœP\ê\Ë/¿Db$Ç\ã‰ğE¢®gÏI$‰._J¦cJQ&ü¯Llß¾İ¤\ä»j“Ûºò\Ï\'\r‰\0D\"*‘¨µ,«‘@$L•\ì„L•´>tm\äÓ¾¤=	W‹ÄµŞ½{ÿ‘@$ƒ,\\5zôh“­ \ë\"K #€H¸^$j|>\ßıD‘p²´¶d\'d©mã†®‡\Ì\"€H¸^$ªõ»ÿ\"ˆ„c?ñ\Ê\æ_’X¹r%\ébˆ\àI\0\"\áj‘¸lYVo\"H8\ZÙ–\\¶\'—m\Êe»r\è\Zœ>}\Z‘\0D\Âı\"ñ>\ÏSˆ\"\áx.]º¤Æo²ùùù¤ ³J\ä\ï€H¸Z$\Î\ë6ˆH ®A\ÖVHLLTª´´”€t\"G1u,\0ˆ„«E\âœn\ÙD‘p]v\"\'\'Ç¤Õ—/_N@:‰ €H¸Ë²\ÊÀ\"H¸’w\Şy\Çd\' JJJHS\\\\l\â€H¸:#ñ¹nO	DÂµTUU©‰\'š\ìÄ’%KH²{÷nD	÷‹D‰eY\Ï	D\Âõ©¤¤$•®N<I@:(#$1@$\\-Ÿ\èjKˆ\"\á	d\É\æ\Ü\Ü\\“X¸p!igd‹\ä\ädˆ„»E\âc\İò‰\"á¹”{Ÿ>}T¿~ı\ÌEh¶lÙ¢RRR \î‰ı–e­&ˆ„\'³S¦L1Ù‰v\à7\ŞP©©©	£%\â}İşH EfHú=--M=z”€Äu\ëÖ™¬\0\"\á\êŒD‘n[ˆ\"\áijjj\Ôô\é\ÓMvbŞ¼yª¶¶– Ä€5k\Ö €H¸?#±]÷o	D4{÷\î5\Ù	I\Ç>|˜€D\É+¯¼b\Öğ\0@$\\-o\Æ\Å\Å\í\"ˆ\Ô#Ùˆ™3gš\ìD^^Ù‰(X±b…\Z8p \0D\Â\İC\ëtû€H Ğ„ıû÷›}ûöU$  Ë“<˜@\0\"\ábÀ\ï-\ËúˆH \ĞBvbö\ì\Ù&;!·d\'\ÂCV\Í\Ì\Ì$€H¸;#ñ’nG‰\"­ 	\ÉLH†B2\Z‹-RÃ†\r#€H¸;#±Ğ²¬O‰\"!d\'¤fB²RCAv¢m\æÏŸ¯FŒA \0‘p1ºO\Ì\Ó\í3\"H@ˆ\Èl™\Õ!³;d–´Ìœ9s\ÔÈ‘#	 \îÚ˜¦\ÛD‘€0³²Ş„d\'dı	Y‡®G\êJÆŒC \0‘p·HŒ\×\í,‘@$ d%LYS²²B&4fÆŒ\ê\É\'Ÿ$€H¸Ÿ\Ï7L¨úŠH ²W‡d\'d\ï\Ù\Ã¾eÚ´i*\'\'‡@\0\"\á\î\Z‰t\İ.	D¢Dv•\å eWQ\Ù]”š<y²š8q\"\0D\Â\İC‰–e]\"ˆÄˆÅ‹›\ìDnn®\ç³\"\"\0ˆ„{	=µLT	Db\ÈÉ“\'UzzºJJJREEE\ÃSO=e†7\0	÷bY\Öo´HT	D\ÚY\ÙQ²òÉ¼ªª\Ês¿¿ZJÁ%\0\"\á^~¥e¢†H \ĞN”””˜0Uaa¡§~w™ú)S@	÷Ò«W¯»õ¦Z\"H@;#XIvBf1\\ºt\É¿svv¶z\î¹\çø\ã\"\ábô‡¤Ÿ\Ç\Å\Å\Õ	D:€\Ò\ÒR•‘‘a²;v\ìpı\ï+\Ëc\Ë2\Ù\0ˆ„«E\â§Z$ˆ\"I~~¾\njüøñ®\ÎNÈ†].\äˆ„‹\éŞ½û÷	D:3gÎ¨Aƒ©„„µu\ëVWşC†QË–-\ã\rˆ„\Ë‘˜8q\âwˆ\"ÀªU«Lvb\ìØ±\ê\âÅ‹®ú\İljC\0	÷‹D\ïŞ½ÿ‚H \ĞI”••©\Ì\ÌL¯6o\Ş\ìš\ßK\êA^~ùeşÀ€H¸Ë²\êRSSF$	\èd^}õU“5j”:ş¼\ã™ö*¿\0\"\áúŒD­ş t\'‘@$ P^^®†j²7ntô\ï\"{¬Y³†?* \î‰kº\İG$	\èB\ÈX²²Cee¥#\Ùb}ıúõü1‘p9~¿ÿ\êO<ñD‘€.FEE…\Ê\Ê\Ê2Ù‰\r68\î\çOMMu|V	©F\âŠş\àÓƒH \ĞEY·n‘	Y\à\éÜ¹sù¹SRRÔ–-[ø\"\áş¡Kºˆ\"]	\n\'œœ\ì‰<‘@$\â.Z–•F$	p\02\Ä!2!C2ô\ÑU\ÍÉ9Ò¨£OŸ>j\çÎü\Ñ\0‘pÿ\ĞF¥–‰L\"H€C‹µaJ1fW™!?,J\Ó\\“\Í\ÊD~d¨\Ã+–\"\á±b\Ë\nŸ\Ï7–H \à0¤Q.\Ğ2]T¦v&\'NœhQ$ì–——\Ç\r	wf$\Êô›\ÉD‘\0\"W=\Úd\':{ñ\'YH«%‰Ÿl ®­‘øL\Ë\Ä,\"H€ƒ‘¥µ%;!KmË’\Û]-+A6	W‹\ÄI-ˆ\"G6ı’Í¿\ä\ÓÿÊ•+;\åg­\Ã\ÉF\0\"\á¹\Z‰c>Ÿo‘@$À%È¶\ä²=¹lS.Û•w${ö\ì¹N$/^\Ì	w\×H\Ò\çú*\"H€‹Àøñ\ãM6 ??¿C¿·l\ÖeKDRR’ª®®\æˆ„»3{}>\ßZ\"H€)((P‰‰‰fK\ï\Ò\Ò\ÒùÛ¶mk‰U«VñG\0D\Âı‰\İZ&şH$	pqv\"\'\'Ç¬\ç°|ùòù\é\é\éF$œ´¤7\0\"q±\åNİ¶	D\\\Î;\ï¼c²2ô +Q¶\'………ªgÏk\0\"\á\r‘\Ø*2A$	ğ\0UUUj\âÄ‰&;±dÉ’vû>\Ï<óŒéŸz\ê)‚ˆ„\Ëñù|o\è>\å=\"H€‡(**2…2qò\äÉ˜KÄ7Ş¨\î½÷^s‹L\0\"\áúŒ\Ä\Z\İö	D<†;\ä\æ\æš\ì\ÄÂ…c*¶<L<™\0D\Â\å\è>d¥L%ˆx”İ»w›:ûõ\ëgV§Œ•D´õ<\0\"ášŒ\ÄRİ	D<˜2eŠ\ÉN,X° f\Ñôu\ÉP\0 ®‰ù²L6‘@$\0Tqq±JNNViii\ê\èÑ£1‘†9\0‘p\'@`¦eY¥D‘\00\Ô\ÔÔ¨\éÓ§›\ìÄ¼yóTmmm\Ô,7\İt™	@$\\„–ˆIqqqeD‘\0h\ÄŞ½{Mv\"55U>|8j‰ş:‘	2€H¸fhc´nD‘\0¸\ÉFÌœ9\Ód\'d+p;;m%5€H¸*#1D‹\Ä\×D‘\0h‘ıû÷«””Õ·o_5nÜ¸F!r!5­\r4w5€H¸F$Ò´H\\$ˆ@›\" \"ñ\Û\ßşV;¶\á¹nİº™\ÎWn[’‰–#3ˆ„óñk´H\\&ˆ@H\Ã¶D’a¨\ïx[”‰`‰°[ÿşı¯{_2€H8Ÿ\Ï÷˜‰+D‘\0hS\"š^ì›“„`™h\ëu†9\0‘p´Hü_-W‰\"–D´%24‰ş>\Ì\æ\0D\Ây\Ä\Ç\Çÿ³‰kD‘\0[\"Z“‰\ï}\ï{!KDS™ f	G‰Ä~¿¿–H \0IDk2D0\Ìˆ„3‰‹‹û[\İ\êˆ\"\ĞÀ©S§L‡z\çw†õu2œ\Ñ4!\åùpxø\á‡\Í\×\Ê\Ï€Htm’““¤E‚¸!\0\Íg$BfˆuFbÌ˜1ü\0‘p7!ˆ@T\Ã±ª‘°÷\â`X	\Ç\roÈ´\î?!ˆ@\Ø2\ËY,Nˆ„sE\Â\ï÷\ßN$	€/ò\ÍÍ¦ˆ\Õ:ùùù\Ì\Ö\0D\Â\Ù\"QgY\ÖÿC$	€V‡šfb¹²\åˆ#2 \Î‰\Ú@ p‘@$\0\Â\Z\æˆ\Õ^H ‰\Z¿\ßÿk\"H\0„œ™–	\É0„²ûgğq¬ˆ„{\ĞQİ»w\ïÿ$ˆ@È™‰hj\Z@$\\—‘¨\Ò\í	\"H\0´»°\Û\' ®‰otK$ˆ@»Jˆ„k‡6\Îû|¾D‘\0ˆ(3\Ê0‡Lñ¤°	\×f$¾\Ò21‚H \0í’™°k*@$\\+\åº\å	D \æ2\Ñ\Üú\0ˆ„\ëD\âŒ\ß\ïŸN$	€˜È„-\r¡{\0 ‰\ÓZ$òˆ\"5¹¹¹Ê²,õÀ°‹\' \Ş‰ú¼_D$	€¨¹té’ª\ßR‰\0D\Â#h‰8\â÷ûG$	€¨9w\îœ‰S§N@$¼#ôyÿ*‘@$\0¢¦´´T¶&€Hx}\Îû|¾õD‘\0ˆš\'N¨@ @ \0‘ğV\Ä.Ë²\Ş$ˆ@\Ô<xP\Å\Ç\Ç@$¼%º\í ˆ@\Ô«\Ä\ÄDˆ„·Db³n\ï	D jŠŠŠTRR\0D\ÂCH}„\ÔI	D j¶mÛ¦’““	 \Ş\ÊH¼*37ˆ\"5›6mR}ûö%€HxK$òe-	\"H\0DÍºu\ëT¿~ı BK\Äb¿\ßÿ	‘@$\0¢fõ\ê\Õ*==@\0\"\á!´DÌ‰‹‹+!ˆ@Ô¬X±B\r8@\0\"\á-‘˜.;€	D j–.]ª233	 Şª‘\ÈÑ­œH \0Q³h\Ñ\"•••E \0‘ğ–Hd\ëö‘@$\0¢f\îÜ¹j\äÈ‘	o\rm\Ô\"qH \0Q3k\Ö,¶D\Âcø|¾>Z$¾!ÿ{÷bÕ™pú¢”\ÊR\núbÉ‹–¼(¾(”²”¥Pa£÷\Ü;t&3cŒšhş*:j\Ç&&\Ä&&m\â\Æ\Ä4ÿ$Sºˆ¶›»kq‰#²	š–&c0™Óµ‰¨Ç™\Óó\ZW\ç\Ş;\ÎÌ½\Ï\ç‡,\Ë2¿\ì½÷;\çy\îs„Tm\ãÆiWW—A $\âZÚ˜—]LBH@\Õ6lØvwwB\"\"ó\ç\Ïÿ\ëR©4lBª¶v\í\Úñ» $¢\Ú#ñ£b±8bBª¶zõ\êtÓ¦Mˆki\ãO³\ë’I	¨Zø\Æ\Æó\Ï?o‰ˆ´¶¶şQ’$c&!$ j=ôPºe\Ëƒ@HÄµ´1§X,\n	!\Õ§Z¾ú\ê«ˆÈ¢E‹~7	³P½¥K—¦o½õ–A $\â\Û\'f÷[&!$ *‹/N{zz!aHÌ;÷÷LBH@U:;;\Ó]»vB\"2a³\å‚ş\Ğ$„T¥½½=İ»w¯A $\â\Ûp9\Ú\Ğ\Ğp»I	¨J[[[úşû\ïB\"¾¥KMMMfBª²`Á‚ô\àÁƒˆ/$.\n…¿4	!UiiiIûúú!_H|›…\Ä\İ&!$ *MMM\é±c\Ç!\ßf\Ëó\Ù\ë?1	!U‡Ä‰\'!\ß‰³\Ùu¯I	¨J©TJO<i‰øB\âÿ’$yÀ$„T%J344d‰øBb(»Vš„€ªC\â\ìÙ³ˆ/$~•$I·I	¨:$FGG\r!_Hœ\ÊB\â“P±\á\á\áñ\0!eH|–]ÿhB*v\æ\Ì!ˆ7$ş+»¶™„€Š\r\n	„D¤’$ù¨T*m7	!ûô\ÓO\Ó\Æ\ÆFƒ@H\ÄyG\âhv\í4	!ûø\ã\Ç¤!eHôe\×“P±şşş´¹¹\Ù q†\ÄÁ$Iş\Í$„T\ìĞ¡C\ãOÿ!eH|]?7	!;p\à@ºp\áBƒ@HD¨T*ıK’$½&!$ b\ï½÷^z\ï½÷\ZB\"B…BaWı&!$ b»w\ïN;::!¡$IzŠ\Å\â/MBH@\Å\Ş}÷\İtÑ¢EˆsiãŸ²8aB*¶}ûötÉ’%ˆóÄ–,&>5	!{ıõ\×\ÓeË–B\"Îøûb±ø¹I	¨\ØÖ­[\Ó+VB\"B—\ÅÄ I	¨Ø‹/¾˜>ò\È#ˆ3$Vg!q\Ú$„T\ì¹\çKW®\\i‰87[®È®3&!$ bO?ıt\Ú\Õ\Õe‰‹\Å\Î$I¾1	!{\â‰\'\Òõ\ë\×B\"ÎhÌ®s&!$ b!\"BL€ˆr\ÄO’$ù\Ö$„T,,k„\å\rQ\î‘ø«\ìºhB*6Z†\r— $\â“$ÉŸ‹\Å“P±ğ\Õ\ÏğPQ†ÄŸd!1jB*¶|ùòñC©@HÄ§½½ı‡YLŒ™„€Š…\ã±\Ã1\Ù $\â3şü\ß/‹\æ\'$ r÷\ßú\Î;\ïB\"Îøm!!$ *\éÎ;\r!©!(LBH@E:::\Ò={öB\"â¸û\î»ÿÀ$„T¤­­-İ¿¿A $\â\r‰±–––\ÛLBH@EZ[[\ÓB\"R¥Ri´¡¡\á“P‘\ì/‘´··\× ‘J’d¤¹¹ù/LBH@E²7´¿¿\ß ñ.m\\Ge›„€Š455¥Ç7„D¼!q¡P(\ÜcB*’ı%’B\"Ş¥s\Ùû@³I	¨8$\r!\ïf\Ëo²\ë>“P‘ğò¯¿ş\Ú ñ†Ä¯…\ÂC&!$ \â6„D¼K§W›„€²‡‰¨7[~Y*•0	!e;{ö¬@HX\Úø¼P(<gB\Ê644$$–6ş§±±ñ§&!$ l\'Oÿ\Ö‰¨—6Nd\×&!$ l\'Nœ?\n„D\Ô!ñ\Ë\Æ\Æ\Æ6	!e;vì˜@HX\Ú8R*•~fB\Ê\Ö\×\×7ş\Ğ.Qß‘8”]ÿjB\Êvğ\àÁtÁ‚ˆX©Tú$Iş\İ$„”mÿşıi[[›A $\â¾#±?»ş\Ó$„”m\ïŞ½i{{»A $\â‰=I’6	!eÛ¹sgºh\Ñ\"ƒ@HÄ½´ñnGMBH@\Ùzzz\ÒÅ‹B\"\î;og\×\Ç&!$ lo¼ñFºt\éRƒ@H\Ä}G\â\Õ,$ş\Û$„”\í•W^I—/_n‰ˆ%IòYH˜„€²½ô\ÒK\é\Ã?l‰¸—6Î®S&!$ l›7oNüqƒ@H\Ä›]¿º¼\Ì1\'»~\Ô\Ğ\Ğp‡\É	¸¡M›6¥«W¯6„D<û!\æ$Ir>‡‘\ì\Z\rOÿı\r\×\ÓpCO>ùdºn\İ:ƒ@H\Äu\â\×	ˆpµ··ÿĞ¤„\ÜPwwwºa\Ãƒ@HDvW\"»®w7¢Ï”„LJWWWú\ÔSOB\"¾˜ø\Ùo\n‰$IşØ„„LÊªU«\ÒgŸ}\Ö Ş•¸\Ö‰ğHq\Ó0i=öXú\Â/B\"B?MMM‰\É	˜´+V¤/¿ü²A $\"uùWB\âsP–|0İ¶m›A $\â]\âXq%$\Â6!eY²dIúö\ÛoB\"\î»\ßda†B®\ï‹/¾H?\r\r}÷\ß\İw\ß}\é;!‰»\îº\ëwŠ\Åb\×\å³$Ng\×ğ„}—²\ë³\ëP\ØC\Ñ\Ú\ÚúS0n\ãÆ\×;€&l²J›››¯\n\rõ!yN«\Ì\â\à\â\r£º\ê\n\çM$IòQ86\Û…‘;w\î\\š½‰\\÷McÍš5…¨³;Y\ì»\Ñk’\×!w(„‘{\æ™g®ûF–?@HÔ‡yó\æı¸T*]˜ø:{£¶nİšööö¦§NJ/\\¸0>\ÇğÏ¯¾ú*ığ\Ã\Ó7\ß|sü[]\×8g\â|¡P¸\Çt…‘\n¡6U]+\"\Âq\Ù $\êfeGSS\ÓUN…scB$\\ºtiÒ³=zô\èøƒı&>‹#ûùİ¦,$ˆTX¾¸VH\Ø¨Ÿˆ\È/e„ıO{ö\ì)+ &Ú·o_\Ú\Ú\Ú:ñî„˜Ä¨¿¿ÿ{±e\ËƒAH\Ô\ÉrFcùeŒO>ùdJ\æü\ÙgŸ¥<ğÀUw&,s	\"•3­\nB¢6V\æ÷D„ˆ{¦Røyù÷°g\ÂL!A„;ö\İÁ\æÍ›\r!QK\Zûò LÕˆkİ™˜°\Ì\á±\ãB‚…Ã¨Â›À\à\à a $j\\8\'\"¿/\"ì‰¸™Â‰üòhXRñQ/$¨Sa\Ùb×®]\éúõ\ë\Ó\Î\Î\ÎñC§òo\0\áÍ§££#]·n]ú\Úk¯Ÿ7B¢¶„Ã¦ò\ßÎ¸xñ\âMŸûÊ•+óKù¨Ô™ñ¯tN‡]!,}ô\Ññ\ã´AH\Ô\ÆŞˆü‰•\á+\Ó!¿D\ZNÀÌ®9>\î…ur\"‡=\'Ù…»\îP $fıŞˆ\îü\Ëj¾\æY®ü¡U\á\Ù>\î…5.ü…°p\á\Ât*O²kiiIûúú!1{—5~q\åõºmÛ¶iıö\íÛ¯:B\ÛÇ½ †}ğÁ\ß[Æ˜ª“\ì\Âi˜Š˜µ!qú\Êk5ü±0\ÂûK\î}âŒ{!A\rG\Ätœd\'&³Oöş\İşˆ/¿ürZg\îh\æA\î\ã^HPƒ\ÂrF‡\é8\É.Ü™°Ì˜uw$¾{^Y¶œ.\á÷\å¿{!A	+ó{\"¦\ã$»°g\ÂL„\Ä\ì‰™ $„5,|;c&N²ş!á„;B‚\ZÎ‰˜É“\ìÂ’\n	{$\ì‘Ô¨p\Ø\ÔLd­!\á[¾µ!$¨AaoDş«3q’]¸r\æ\Ìÿ23Î‘Pğ5\Ì\Ùp’]x6‰_\Úxj¦\Ş–/_\îdK!A-\n\àš\r„#´AHÌ¬ğ¬°?Á³6„LZxŠ\çlXmoo÷/!1;–7úò{¦¦\ã®Dş\\OÿÔ˜üşˆ™Ü¥öI€˜y\r\r\rwd¯É±™ú×¼yó~\ì£^HPCf\Ó÷\ÆAHÌ¾M—7û\\™	\ì3}!A\r‡DŒ¿„\Ä÷µ¶¶ş I’ó7û¤\ÛeË–\å—4Î‡\ßkúBw$Ü‘@HÔB¡pO~‰cªŸ½“ˆğ{\Â\ï3u!A\r²G„\Äub\âñ|LL\ÕÓ€\',g„»İ¦-$¨Q¾µB¢œ˜¸òm£G–5\ÛğÏµk\×^\á\çŠ!As‰\É,s\ä÷L\ä—;\Âû\Æ\áÃ‡\Ç\ïh^Y\rÿwCl„\×yş°©ü\ËB‚:\Ğ\ÓÓ“Î†“\ìœl‰˜ı0ó\ß\æ¨òê³±RHP\'Â³6òOşô¬\r„\×Î™H’\äHş\Ì\É\\\á\Ä\Êp\ØTözÿSÔ™5kÖ¤3y’§\"$jO8Nûò³9\Â]Š\ÓùGçº>À\á\Øk!A/út¦N²w\'@H€ †\å7]N\çIv\án	Ô¸s\çÎ¥---\étd~_ø½ $@HPúúú®Zâ¸™\'Ù…\ß~	Ô‘İ»w_7\ë$»;v6B„1\Ä\ÄTd~®ˆ@H€ ‚eü‰©8\É.ü<\Ë	D\"l„\Ì›£š+|;\Ã\ÆJ„	\"Î™Xµj\ÕU\'`N\æ\nÿûp\ØT¿!\"$@H»pœvx6G¸K\Zšù•pOñ\à\n\Ï\Îp\ì5B„€\0!€\0! $@H\0	\0B„\0B!€\0! $@H\0	\0B„\0B!€\0! $@H\0	\0BBH $\0 $\0„	\0!B@H€\0@H $\0 $\0„LsH\\¸pÁ«`ŠŒŒŒ		\ê\Şm·\İ6vøğa¯x€)v\äÈ‘s\Ù\Û\ìEŸ4Ôµ\Ûo¿ı£¹s\çz\ÅL±[o½õ\×\Ù\Û\ì!Ÿ4Ô»9·\ÜrË·w\Şy\çXoo\ï\Ø\ÈÈˆW?@\Ë\áN\Ä\åˆ\ï±>fˆ\"&²\ëÀ\åÿÓ§.—\Ë\åª\ê\n\Ë}\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨\ÚÿöõN\'\ì\Ø\0\0\0\0IEND®B`‚',1),('11',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\ï\0\0¥\0\0\0\â¢dZ\0\0>IDATx\Ú\í\İpT…\İ÷qohulyœN\ë\ë82\ã8øøv\ì\Åj¬¯¢Ã£M²\ç\ä\ìfa-Š‚\àBµj•G[¥EQxµÚ·¢¢V @ b\ä&&$ ÷„\Üö¼ÿÿö,\Ïr\ÙM6{\Î\É~?3ÿ9›\İ\r—ÿ^~û?{.}ú\0\0\0\Z÷\Ür»hşúf-½ÜºöŸ°¿‰\İ\ïù\å¶xBê¶‡g¯nWü~\â\Ïz¿I/¯k\Ëwù÷¬°\é6\0\0i A»iÍ¾–C²ü?Rÿ­Aüû767şñı\Z\Âó¥şM\ï·bGı\Ñÿ|ñ\Ó\r\é)ó¾¨ÿü\n[=ş¯ol’\ëÿ\áüy\Í.«\Û¿_¼ô~ºŒ\ß\0\0t\Ó;Ó€?ó_¡ü\Ğ2Uÿk\Úş·\Äû½Q¶ÿøø™+\å~%§M\èbX«†\ÔZsË›¾y\è/¥-\Î\Ïw\Òm\0\0ºHCu\â‹k\Z%Pß…°†ö¬¢zù©÷¿jĞ¥\Şo\Ò+k[\Æÿ+ \ËU\Z\'Á­a<N¦\ï‡g¯\Æ\ï—ğ\ç\é\êõ7¦ım\Û	½ş[\Ûş|‡mA\Ç\0\è&	\Ø?8kuô¡Y«¢\êjğ\çV\Ø\Z¸\ïn8|üÁ¿®ŒNz\å³f\ç~?Ó \Ö\åC]\Õ\Ëz¿ÿ|ù³f¹®T§ôøŸ§—u©{ü{\îiÿw\Ë	V—\0/}\ÖP\å¬ò6\Æ%|‡­ık/9µ‘™s¿şzŸ5ÀI}\Â«£\ZÎ‰÷‹_~}‡]©K\'\Ğû\Óq\0\0º7u÷“q¸\Â	\Öy“\æ®kşÓ’#7{\åşº%_8\æ\Ü÷9“÷¼?ü¿\Çd9Jƒ{¼\Ô\Ô›\ë\ä\çOûõO\á\ÎÏ£¤–\ë\Æmt\0€\î‡÷ÿ\Ö\àÿ—•\Ñ|{hÂ‹Ÿ¶|öM“nu¾ò/¥\'jtµ¸\\~@*¬«¿5¬\'½´¦åµ²šº¿¯ûöÄƒ/|ğßŸ¶L™ÿ¹†ÿ[‰Ş¢ıönù¹¸¸\ŞŞ¡»“=¿ü\ègcµ\è<\0\0]\ï×¤K]­a«¤\éwØ‰ûp\Ëm´\Øö\îG\íZ¹ü\Ûß¿¹±i||ó\çÿ§Ä¢\Ö\Ş\Ä9k\Zyá“¦\Ö\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 cô¤=‹/~{\æÌ™\ÇgÌ˜}è¡‡\ìH$b\Ø\áp\Ø?~¼=u\ê\Ô\Æ\éÓ§\ï;v\ìƒt\0\0—|ó\Í7¡ùó\ç}\à\ìÑ£GÛ¯¼òŠı\É\'Ÿ\ØUUUv}}½Ànll´kjj\ìµk\×\Ú,°\ï½÷^ûşû\ïN<y•eY\è\"\0\0™™´,_¾üÀ˜1cl™´\í7\ÆB:Y¶L\éöˆ#l™Ò§\ÓQ\0\0zx\ÚşóŸÿ7nœ]^^nwÇ–-[\ì±c\Ç\Ú÷\Üs\ÏşH$ÒŸ\î\0fÇ;u\êTû¹ç³=j§ƒ®^\×?\ï¾û\î;\Ìjt\0\0\Ò<qkp?õ\ÔSvss³n³f\Í\Ò	üÛœœœ~t\0€n\Ò\ï¸uU¹N\È=\ÜqúÓŸ\ì\Â\Â\Â=t\0€nÒ\Óô;\ît­*\ïhú½÷\Şµ,k]\0 ‹tu¹nU®[”g‚n\Ä\n…Zøş\0€.\Òı¸uw°Lz\ì±\Ç\Z\n\n\Ñ}\0\0R¤GN\Ó°dj\êûò\Ë/m™¼›\Øx\r\0€-]ºô==rZOn¤ÖH$\Òbš\æ\0\0R \Ç*\×Cº\á\ÙgŸ­+(((\åQ\0\0 z’=V¹>şø\ãf	\ïJ\0\0R gÓ“Œ¸\áÀQ	\ï\0\0R §óŒŸ,\ÓôD\'zJQ\0\0R \á\é&\Â\0€\r6\Ì\Í\É;Jx\0¢|Ğµ\ï¼kjj\Zù\Î\0€M›6­Á­­\Í/^\\\Ã\Ö\æ\0\0¤\è\ÑG\İ\ã\Ö~\ŞS§N­f?o\0\0R4v\ìØ»\î½÷^W°¦‡G\åk\0\0t-À[2}ló²²2]eÎ±\Í\0\èŠ)S¦¬xú\é§3\Z\Ş#G¬\æ¬b\0\0tQ$\é÷\İwG+**2ÜŸ~ú\éº9Ÿ7\0\0\İpÿı÷O3fŒ}ô\è\Ñ\rîººº–`0\Ø(Á=®\0\ĞM÷\Ş{oÕ³\Ï>Û“¯E\å\ï¨1Ms\'\İ\0 \rt\ã1™ÀÌœ9³\'<:yò\ä¯u¿n]MO·\0Hc€9²\æ¿ş\ë¿\ì\'N¤mUù}÷İ§¨Uò=7\0\0=\à\ápx\ç¨Q£¢6l\èö\Æiú·®*g\â\0 ‡\éFe………\ÍÓ¦Mk\ÒOeUúºu\ëjõ;tg«r6N\0 StZ–©ùM‡\Z1cF\İÊ•+›«««[ô|Üª¡¡!ª\'Y²d\É=\ä©9MC[÷\ãf59\0\0.’0KK\í‘@¯\Ó\Óy&Tƒ~§-U¦‡<\å\Èi\0\0x;Ô£\ápø2:\0€Â»\Ñ0Œ›\é\0\0ş	\ï\ã\Ş\Ã\è\0\0>aY\Ö	\ïIt\0\0ÿLŞº\Ûst\0\0ÿ„÷&	\ï\×\é\0\0ş	\ï$¼—\Ò	\0\0|Â²¬w¥\Ö\Ñ	\0\0|\Â0Œ—$¼·\Ñ	\0\0|¢  \àq©*:\0€O˜¦9F\Âû0\0\0À\'Ã¸SÂ»N\0\0\à@\à:	\ïf:\0€\Âû\"=³\0\0ÀG4¼õ\Ü\ßt\0\0ÿ„w‹Ôµt\0\0Ÿ0Mó¤n¸F\'\0\0ğ\Ï\ä}X\ê>:\0€Â»J\ÖB\'\0\0ğOxo\×Ã¤\Ò	\0\0|BOL\"\áı\0\0À?“w±\Z”N\0\0\àÁ`ğoŞ›\è\0\0>aš\æs\Ş{\è\0\0ş™¼\'[–u€N\0\0\à†a“\Éû8\0\0À?\á}³„w#\0\0À\'LÓ¼\\\Â;J\'\0\0ğ‰¢¢¢³õ\Ìbº¤\0\0ø„N\Ş\ápø2:\0€Â»Q¿û¦\0\0ø\'¼\ëV\çt\0\0Ÿ\Ğı¼%¼\'\Ñ	\0\0ü3y\ï\Ñ#­\Ñ	\0\0üŞ›$¼_§\0\0ø\'¼?’ğ^J\'\0\0ğ	Ë²\Ş\Õóz\Ó	\0\0|\Â0Œ—$¼·\Ñ	\0\0|¢  \àq©*:\0€O˜¦9F\Âû0\0\0À\'Ã¸SÂ»N\0\0\à@\à:	\ïf:\0€\Âû\"=³\0\0ÀG4¼#‘H:\0€Â»E\êZ:\0€O˜¦yR7\\£\0\0øgò>,õ{Ë²n !5Cj \0ÀdÂ A]-A}Hw“\êwŞ­ª9\'\'§\İ\0À$´h8·Ø§J}=\0ÀC$ \çt\Şùùù·\Ğ%\0\0¼\à\ÇÚ™ºw\Ò\0\0<(\n™m…·~\'Nw\0\0ğ(™²·´\n\ï&6T\0À\Û\á=P;qkóº\0€\ÇY–µ0Ş¡P\è\'t\0\0\Ó\Õ\äÜ:\Ó\r\0\0|B‚û\Â\0€¶m÷Û¹sgeYY™½l\Ù2{\éÒ¥Tª¸¸\Ø^µjUTj\Ï*\0@\Ò\à.--µkjjì††ªU[[k—””D%\Ègğ\Ì\0ô¸	\îô¸L\â\r<³\0\0=FW•º\é-]\Î3\0\Ğc4h\\\Â\0\Ğ\Ãûø\á*{\ç\ÚW\ìŠ\â\ß\ÇJ/\ëu„5\á\r\0ğ`x;´\ÏŞ´xª½\áıGN+½No#°	o\0€\ÇÂ»²\â\İ3‚;^{+Ø„7\0Àk\áı\åŠ?¶\ŞzMx\0<Ş›–µ\ŞzMx\0o\Â\0€î„·n]\Ş^x\ëm6\á\r\0ğXxo_=³\İğ\Ö\Ûl\Â\0\à±ğ>¸o£½iÉ´3W™\ËuzMx\0<\ŞZ»\Ö\Í;#¼õ:Âšğ\0x1¼O´·<\ë\ÌU\ær\ŞF`\Ş\0\0…·Am\Û\ê\ç\Ûı\Î[o\ã(k„7\0À\á-u\Õö\åöNn7¸\ã¥÷\Ñû2…\Ş\0\0—Â»³i›)œğ\0x,¼“™¶;š\Â	o\Â\0\áğ\îjpÇ‹ğ&¼\0oŠğ\0Ş„7\0\0„7\á\r\0 ¼)\Â\0@x\Ş\0\0Ş„7\0€ğ&¼	o\0\0\áMx\Ş\0\0\ï‡÷’%K\ì_ü\âöù\çŸ+½¬\×%\ŞGşºXıò—¿<\ízı9~[gOü~Z\çœsı\ïÿş\ïö²e\Ëo\0\0\áJıóŸÿŒ…iNNı\Í7\ß\Ø\Õ\ÕÕ±\Ëz]b€\'oyyy\ìºõ\ë×Ÿv}²á­—KKKc—/»\ì2\Â\0@x§RñÉ¹¬¬\ì\Ôuz¹õ”^\ÊGŒ»nÔ¨Q±Ÿ»\ŞñŸ\Ï;\ï¼S?\ë‡¡C‡\Ú\ßù\Îwb\×\ßz\ë­ö®]»o\0\0\áXºúºuğ\Ö\×\×Ç®\ÓUè­ƒwÑ¢E±\ßÙ¸qcl©?w%¼W®\\»|ûí·Ÿº=‰Ä®[½zµ½yó\æ\Ø\åë¯¿ğ\0\Ş\İ	o½|õ\ÕW\ÛŒ-Ûš¨“ùÎ»³\Êü«¯¾:u»NÛ­\ïs\ÖYg\Ş\0\0\Â;±â«½×­[w\ÆjóŸı\ìgm†÷œ9sb—uÙ•ğ\Ö\Ë?üp\ìò¯~õ«3\ÂûÈ‘#ı\Î{øğ\á—Z–5º  \à5\0\0W\Â[7J\ÓÀ\Ô\ï—kkkO\Û`m\áÂ…\í~_\İ\Ñw\ÙÉ„÷±c\Ç\ì\Ä~oq_m>q\âÄ¤¿3\ï\è\çt„·†µa$¬\×Hh’¥\íT%\Ï@\0€+\áp\İ8->ù\êªôyó\æ%\Ğ}º¸Á\Úşğ‡\Ø\Ï7\Şxc\ì\çƒÚ£G¶¿÷½ïµ¹{&\Âû\í·\ß\Ö`#µAÂº1!¬O+\Ó4?\ä\0p-¼K§\Ş>	«Ä³©\ê\ê\ê\ì\Â\ÂB»½ÀN¬üüü[x\0<Şº±š<\å\â‹/\ÎønZ^(\İ\ï]\ÂùR\ÑÂ»…g\0À3\á\İ\İ\ÒU\ïm•\ß\Z\n…~\"!}¼ƒ\Õ\æ5RK-\Ë\Z7dÈ‹y6\0|Ş½\é\Ø\æ\Ì$¨«\Û\ï\Ï\ä¶\'t#6	ğ£\Îu\Ç\åòz©Á`p\ÏN\0\0\á\í\â®b\ZÊ‰\á­Áx{$\é\ï\ì>öÜ·ZJW¹7\Ér§\îR&a[TTt6\ÏX\0\0\áÁı¼%€g9\á\Í\É\É\é\×\ÉC\ÓW\î›\Üw®„ú6Y68^+Ul\Æøp8üÁ\0@xS=|	\à:Mwå±’\ß(Áı¸„ù§R§Vµ\Ë\å\Ï%ÌŸ‘\Ë\×òŒ\0Â›\ê#¬%1u\'eğ\àÁß•Ğ¾G\ê=	\î*İ‚]WµK˜ï’ ].ç³ª\0o\Ê\ã\Ç6—\Ğşµ„ùK\Ü[uU»®¢—0? \×/—\Ë\ët<\ë€ğ¦<|b’H$rE0|T‚»Lêˆ³ªı„„y¹ùŸtw6^\0@x\Ş>«X ¸P\Âûn©ER\ß\ÄWµK\í–zC\ÂÜ”ûœ\Ë+\0o\Â\Û\Ãd¿U\Å.\ÓøYt¶j? µBO¨’››{	¯\0 ¼	o“ğ¾\\jº³ªı°s˜\×:=ÑŠ\\ÿœ,¯\ç•\0„7\á\ía#G¼@ûw2…¿#\Ë}Îªöf©=2µÿ]–AVµ\0\áMx{œù\Í2…Ï–\à\Ş,\Ëøªöƒ\æ+\å¶IC‡ı!¯.\0\è!Ë–-#p	\ïn‡Ã—ƒÁi\à«%\È\ÅWµ\Ë\å/d9³°°ğ\ç¼\Ú\0 MJKK[jjj\İ4\ÕŞ½{÷Hx7dûóJWµ\Ë~—÷\Û\à{\år|Uû\×zºTù¹0]«€¬³|ùò\ÇKJJ¢û÷\ï÷|0<y\ÒóÁ]\\\\\Ü$5ƒgÖ™$°o’ AªB¼Ş™Î¿•Z%SûdYşˆ.@’$l¦Ë´x\\W÷zµ–,Y;——ÿ:q\Ü\É>|ø¥ò˜N‘*•`ÿ\Ö	s\rõMğ5\ãFº\0>§\á­\Çó¦½“®F—\Ç8,¡ı–„y¥³š]«R~^(\×cU;\0øŒn\Ñ\ÌV\Ì\ÙEBû\Âu\Z¯j—\ëtƒ¸¤¦\êôN—\0À\Ûo\ä-yyyWÒ‰\ì¥Şœ\ï\ÇW9ß—\ÇVµ\ë÷\èú}º~¯N—\0ÀCt*\'\Ò@\"]®[®\ë\ìÎ–\ì\Íú!O·p\×-\İu‹w\İòN€{\áİ¨¡\èˆ\îS®û–K€o”\ÒÃºF}\ÏW\ë¾\èºO:]€Ì…÷Iyó½ƒN zby\îL”*Ñ£À9Gƒ;)õ¥L\æ/\æ\ç\ç\ßB—\0 \ç\Âû„G›N ;ô8\ìÚ–„ø›z|vg‹v=ˆ\Ì>¹ú]¹~„:•N@\ZÈ›\êQ=5@|0¼\Ş9c\Ú\çjQ\çŒjez†5=\Ó\Z]€.\Ğ]„¤\Æ\Ñ	d\à¹6@\Ïe®\ç4\×s›\ÇWµ;\ç<Ÿ£\ç@§K\0\Ü\ä]«»	\Ñ	dZQQ\ÑÙ¡PÈ”\à~Cj·T“s¼öo¤\é\Z!Vµ@\ä\r²J\êq:/°¾NüYyN–\ËK\İC\á{DWµ\ËõE\"‘+\è\0Â» \àk}³¤ğ¢p8üy~>$\Ï\Óeº–\È9\Z\\ƒ,·\Êòe	û\ß\Ğ%\0\Ù\Ş_\éQ´\èü@Wµ\Ës6_³¯Kx\ï\ÒU\í\ÎV\íUòóû†a\ÜÃ±úôzº±¼\é½J\'\à\ã \×Jh?#\Ï\ã\Ï\åòq]\Õ.—J}ª_	qø_\0½1¼7\êCt½Å!C.–0/\Ï\ëb©Zg«ö	óm²œo“»õ¥S\0ü\Şkõ \Zt½•®j—ÀÎ•\à~M¿&\ÒCk KU\Ë\å\äù?:‰ô§S\0|CM-µ„N ›H˜’zZûŸ\ÅWµK\Ó³²|2\n]E—\0xyò^.“\ÇJ:l.’\Ğ«d\å5Q\ãl\Õ\Ş(\ËRó\ÃÒ‡U\í\0<4y û\Ğ\Ò	\à4}õ„=òÚ˜/!®\Ş\è\Şu¿\Ôb	ø1\Zø´	€+\äi¡n¥K\'€I`_-õ”¼^\Ö\é*v]\Õ\Îy\Í¸5y¿&oHtHùµcsøV\0®0\ã%İ…†N\0)‡·~/>€N\0p\ã\rh¦\Ô.:¤Şœ\Ö€+twy\ÚK\'€”Ã»Ew9£\02N‚{ºnAK\'€”_;M………?§\02\Î0Œ	\Ş\éò\ä\İ şk:À7 û¤\Ó	 \å\×N½|ø½“N\0\È8Ë²\î\Ò\ÃC\Ò	 \åğ>!¤\02\Î4Í€¼\Õ\Ñ	 \å\×\ÎQy\í\ÜM\'\0d\\ øL\ß\rtH9¼\éñ\Ğ\é€Œ“\à¾AŞ€š\èòk\ç€a“\è€Œ\ÓıTuU:¤F^7Õº«%\0qz„(=R\0R\ï}z¢: \ã\Â\áğôtH9¼wK=O\'\0d\\ 8—ğº\Ş;,\Ëz‘N\0p\ëMHOmx.\0Rz\İl–šO\'\0¸\ŞC†¹˜N\0)½n6˜¦ù&\0\àÖ›P4_F\'€\äY–µ\Î0Œw\è\0·Ş„8µ!ú‡Ş¥\Ó	\0n½	5\éÁZ\è\Ò\ë¦Dj\0\à\Ö\äİ ‡I¥@J\á½X§o:À­7¡z©|:¤ô¡÷]\Ó4\×\Ò	\0n…÷q\Ã0†\Ñ	 ¥ğş»„w9\0\àVx‘ºN\0)½n\æ\ë¾\Şt€[oBeò@\'€”^7s¤¶\Ó	\0n½	\í—*¢@J¯›\çõø\æt€[oBœ	HQ0|Z^7{\é\0·Â›³#©‡÷£\Ş\Õt€+,\Ë\Úf\ÆKtH¼f&\Ék\ç\0\0\à\n™*dò~N\0)}\è\'uˆN\0p\ëM\ès™\"Ş¢@ò\ä\ï\İòÁ÷(\0\à\Ö\äı‰øûtH\éCo¡¼vN\Ğ	\0nM«¤–\Ñ	 yÁ`0W-L\'\0¸\ŞK¤V\Ó	 y2uÿZ^7\rt€+8ÁĞ¥\×\Í\rz:]:À­	\âMy\Ú@\'€\äƒÁAòºi¡\0\\!o@ó¤¾¤@ò\"‘\ÈòÁ7J\'\0¸5yÏ–ğşŠN\0\É\Ë\ÍÍ½D^7„7\0wX–õ¬¼	}M\'€\ä\åuc\Ó	\0®7 Ç¥ªœ  \â\ä\å\å]Cg\à&Û¶û\íÜ¹³²¬¬\Ì^¶l™½t\éRÏ•†·ÿ]‰U\\\\l¯Zµ**5‹g\à\ß){€išuº•¬nl£o>\íT	İ‚›4¸KKKíšš\Z»¡¡\êF\Õ\Ö\Ö\Ú%%%Q	ò<³\0ÿNÚ¥„¶Vtøğ\á—\Ò)¸I\'n‚;½.“8û¥~¾¥:šº\×\Ğ%¸MW•º\é-]\Î3ğw€/l/¼M\ÓH‡\à6\r\Z—ğ\Ğjún\ë;o	\îõt~\n\ïã‡«\ìk_±+Š+½¬\×Ö„7\Ğ+ƒÁY­\Ã;\n™t~	\ïc‡öÙ›Oµ7¼ÿ\Èi¥\×\ém6\á\rôJÎ–\çñğ®¤#ğSxWV¼{Fp\Çko\Å\"›ğz\'Ë²\Æ\Å\Ã[/\Óø)¼¿\\ñ\Çv\Ã[o#°	o 7O\ßG#E±{|Ş›–µ\ŞzMx½V~~şÔ›o¾Y_\ÔZ\Ó\éo\Â€÷M<\çœsôE­[šG	pø%¼u\ëòö\Â[o#°	o ·š\Ğ*°§\àğKxo_=³\İğ\Ö\Ûl\ÂÈ†\à\î\ìzÀS\á}p\ßF{Ó’ig®2—\ëô6›ğ²%¸[\ß>…VÁ«á­µkİ¼3\Â[¯#¬	o Û‚;U\èğvxŸ<ioÿxÖ™«\Ì\å:½À&¼l\î\Ä\0oa‡\×\Â[ ¶mõó\í~ç­·q”5\Â\È\Æ\àNü½&px\"¼e¢®Ú¾\Üş\â\Ã\É\íw¼ô>z_¦p\ÂÈ¶\ànıûL\àp-¼;›¶™\Â	o 7w_©eGZß\ïÀ\ájx\'3mw4…Ş„7\à\ç\à\Ş\Ú\ç_GS\Û\ÚA€·w?&p¸\Ş]\r\îxŞ„7\à\Ç\à\î\ãL\ÒvBµ\à‰Á¯Ùü¹@Rrrrúu5¼)\Â\È\Æ\àn/˜¼³\Û\ãX….)((h\Ğs\ÉŞ„7€ä‚»³\0?;\É\àNü{\Ø\n©†wü´¦i>\×\Ş$Nx\Ş\0Á\\€7¤Ü­œ\ïÀ‘Rx\ÇK¼Nj:\áMxwr\Ú\nğT‚;U\è\èrx\'\Ôq©)„7\á\rd“KĞ­Hñ÷\Înc\ânp®OÅ‡¼)\Ç+ÚªZZU³SMN5\êªUg\Ù Ë“N\Õk\é\Ä&K\ÚN8oüÇ´\ä¾GeyD\ê°\ÜvH~şV.Ô’\ËdY+\×\×\Èr¿,«eY%µÏ©J©¯¥öH\í–û\ï’\åW²\Ü!\Ë\íR[\åw¶\ÈòKYV\Èr“,¿\å©r¹¼^–Ÿ\Ér­üÎ§r¹Ì©\ÕR¥r\İJY–\È\í\ËeY,Ë¥²\\,õa\ï\Ér‘,ß‘û-”\Ëÿ\å\ßeù†\Ü\ïuY¾&5_®{U\êe¹\ßK²|Qn{A\ê¯r\ÛL]\r-\×=+·=Ÿ–ë”z\\®{L§[¹nš¤,\'\Ër¢\Ô\Ãr\ßñrû8¹}Œ,G\Ë\Ï÷\ÈõwKıN.“eX*\n…LY\æ\Ë\ï\æJ\İ!—o—\åmò{¿\Î\ÏÏ¿E~÷&¹ÿ………?—Û®\×\ÉòÚ¼¼¼k\äw¯’å•‘H\äŠÎ\'úxÊŸó(\áMx\Ù6y\'»\n;İ“÷ú;ò¦}®~)\Ë\åÍºÿ!C.‡\Ã?\È\ÍÍ½DŞœ$—/“7\èË¥ê›º,¯–\ä¼\Ù_/?ÿT‚\à\r\'n•\Û~£a!o\êC¤\î\Ô\Ñ0±ş¥\Ğ	™\ß\ÉïŸGii\Éuc5œœš 5\É	/\r±\"Y>ª\á¦!\'÷Jj††ŸÔŸ\äº\ç5pœ-?\Ï\Ñ\Ğ\Ôğ”\Ëód¹@CUşŒ¿\ÉòM\'l5tß–\å»N ·\é›%NXkh¯pB¼T\ê#©5\à°_#\ËuÎ‡\0ı0 µ\Ñù 6;¶\Êı¶\Ér‡ó\áB?d\ìr>t|-?W\Êıö:Hªœªv>´è‡—ZYp>\Ğ|+uH?\ì\è‡¹|Dn?\ê|:\î\Ô	\ç\ÃRüƒSüƒ”~¨jˆ\È\Ò]r[S\Â±f¹-ö\áL—r[4‰y§ŠÀ%¼Vw\Ü]ù\Î;~\ìsV™£[«\Íõ„®\èÍ«\Í\ã¯-\Â@W<[›sÀt7¼kuMI\ëûu5¼\ÛY“tZp®^½\Ú4h}\Şy\ç\Ù\çŸ¾}\Í5\×$õgwõ÷o\0©x[[§k?\ïp¶2G÷\Â[·/·w¿tL\Ş\í…\å•W^»~\ãÆvmm­=v\ìØ¤ş¼®ş\á\r SÚ˜Œ\Óy„µ´]\ïJ\İn¡³ûõdxŸs\Î9±\ë·lÙ’ÒŸ\×\Ù\ïµşû\Úû9^W]uU\Êÿ\ÂÈ	¼\'mNp£Gõdx\ßzë­±\ë5Œõ«_\ÙÓ¦M‹MÒıyı\Şv\ÖYgu\Z\Ş.´\ßy\ç\Ø\åÁƒ\Ş\0:œÀ|vŸ\ä\Î*–x?ö\çF¯\ï\ê\êj{Ò¤Iö\ÕW_}\ê>7\Şxc§^g¿§?\ë÷á…w}}}¬ô²~wNx\èh\ï\Îw\Ô7zMx\'Öºu\ëNMÓ©ü\Ùmı^\â\Ïñp&¼¤{O%ø	nôšğş\íok—••\Å.¯_¿>v¦;ûó:û½\ïÿû±\ë¶o\ßnÏ›7¯\Ã\Õ\æ‹-:cµyŸ$¿3\'¼\ìœÀS	b‚½.¼\ï¸\ãX\Ğê”¬«¹u\Õwyyy§^g¿7w\î\\û{\ßû^›»§µµÁš\âk„7€\Î&ğdV¡‡û°q\Z|\Ş\á\rd\Ûÿœ\à\áMxğA€·µ8á­«\Ã\Û*\Â€|JBps\ä40y3yğ¸ø¤]\Ò\ç\ÎŞ„7\0¯O\àz¼i‚„7\á\rÀG4¼õ\\\Üt„7\á\rÀ_\á}!\0\áMxğWx_D\'@x\Ş\0ü\ŞQË²\Ğ	Ş„7\0Ÿ0M3:|øğK\éo\Â€\Â;‰\\A\'@x\Ş\0|¢   %\n]E\'@x\Ş\0|\ŞR\×\Ò	Ş„7\0ÿ„w³\Ôõt„7\á\rÀ?\á\İdY\Ö\rt^°l\Ù2—ğDx7\Z†q3€”––¶\Ô\Ô\Ôºiª½{÷\î‘ğn\à™ô22u7\ß\Ğ	xÁò\å\Ë/))‰\îß¿ŸğMCp7I\Í\à™ô¾\Éû¤L\ŞC\è¼B\ÂfºL‹\Çuu¯k\îÜ¹¶™Ğ«ÿ¾„j ¸\Ş\ŞõÁ`0—N\0I¿f8g\ã\0w˜¦Y\n…L:tÎ²¬q\Z\ÜZry4\à\Öq\\*L\'€\ä>\ì\Æ\Ã[ª’\0p+¼IıN\0÷Œ„\à•aw\Ò\0gY\ÖQ©Qt\èğu2@ª¥uxK­¡;\0Ü˜¼\ËD1†N\0†÷\Â6‚;VòúH‡\0dúM\é[\Ã0\Æ\Ó	 ı©\Û9Œ°\İN1}\Èø\ä}P\Â{\0\Ú}”v\ÜZ\Ñ\áÃ‡_J§\0dŒišµÁ`p2\0ÚºuŒ¦N¼„n\È\äT±_ªˆN\0Iú]\Z\èz9\nıDOì“——w\r\Éğ®’7Ÿ\Ç\è\Ã0\î‘\×\Ì:À\Íğ\Ş\'õ$\0’¼\ÇI¢\0\Ü|#ª”I\â:$=yO’\×\Í:À\Í\É{iš\Ï\Ñ	 \é\×L‘n+B\'\0¸9y\ï’ğş+\0’\ï\'õ\ë&:À\Íğ\Ş!\á=›N\0I¿f•ğşšN\0psŠ\Ø*oF/\Ó	 9º¦J\×X\Ñ	\0n†÷—Ró\è\Ã0^’ğ\ŞF\'\0¸9ETHx¿F\'€¤?ğÎ—\ÚL\'\0¸ùF´AüM:$ı÷M}\İ\Ğ	\0®±,\ës\Ã0Ş¢@\Òxß–úŒN\0p3¼\×Ix¿C\'€¤_3\ï\Ëôı	\0\à\æÑ§\Ş\ï\Ñ	 \éÉ»XOJ\'\0¸ùFô±\Ôb:$ıw¥L\Ş\Ë\é\07Ã»T\'	:$ıš)\ã/\0·ßˆJ¤V\Ğ	 92u¯•\éû]:À\Íğ\æû; µ\×L¹\Ô?\è\07ßˆ\ë÷\ŞtHzò\æÀF\0\Ü\Ån/@\Êx·JÍ¥\0\Ü\ïwõ;<:$ıš\áL|\0Ü¥GWÓ£¬\Ñ	 \é\É{„÷st€k8N3òkfo0|šN\0pó\èu	\ïMtHú5S-\áı(\0\à\Z\çô†_\Ò	 \é\×L­\Ô:À5–e½¬[\Ï\Ò	 \éğ>(õ0\0\àfx¿(oD;\ètx–ºN\0pM0œeš\æN:$\Ş\Ç\ä53‚N\0p\îò¢»¾\Ğ	 \éğ>!¤\0\\c\Æ3–eU\Ò	 \éğ®ƒ¹t€›“÷Sòf´N\0I‡wƒ„÷mt€›oDKU\Ñ	 \é\×L£eY7\Ñ	\0n¾I\í§@Ò¯™f©\ë\é\07ßˆ¦\èA\'\èôk¦%//\ï\Z:À\Í7¢‰R\èôk&jš\æ\åt€k\ÃoYÖ·tH>¼sss/¡\0\\#\Ä=b\0’o{ğ\àÁß¥\0Üœ¼\ï‘\Éû\0’ï¢¢¢³\é\07\'\ïz¸G:tNC[Ã›N\0p{ŠK§@\ç\"‘H\Â€\ë,!oFut\èœn¨¦¬\Ñ	\0nO\Şùz¬f:$5y_aš&\á\rÀ]†a‘ğ>I\'€\Î\éÁY,\Ëj¡\0\\~#oF\rt\èœUJ\'\0¸*??ÿ	\ïF½¬\ã\È\åB¡\ĞO\èp&\Ã0n\Ö“\Ğ	\0%\á|H\Ş|štÕŸn5\ÛNm§SÀ™ôT zJP: \Ó\áıj¡+¾\ép&6ğ\àŠœœœ~:y·Ü¦iV\Ğ% \İ¿…ò\Z9A\'\0xjúf\ê\Ú\Ç	¸=}7´Ş•t\è0¼9‘\0Wß„¦·1u¦3@û\äuò°\ÔA:À\Í7¢#	\á\Í\ĞùkfªT-\0\à\Z™´\Ç%L\İ\ã\è\Ğ\ék\æ1y½T\Ñ	\0˜¾\éĞ¹`0ø´iš{\é\0W†1‰ğ’ş°û¼\Ôn:ôb¶m÷Û¹sgeYY™½l\Ù2{\éÒ¥,Ë²<ûo\Ó*..¶W­Z•šÅ³\nn’©{¶¼^v\Ğ	 \Ó\à.--µkjjì††ªU[[k—””D%\ÈgğÌ‚‹“÷\\©­t\è\Åt\â&¸\Ó\à2‰s\\i¸9y¿.á½‰N\0½˜®*\'t\Ó[º\Zg\\œ¼ÿ!UN\'€^Lƒ†À%¼Ñ«\Â{‘\Ô\Z:\Şöñ\ÃUöÎµ¯\ØÅ¿•^\Ö\ëk\Â\ï\ÅR\Ó	 \Ë\ÃûØ¡}ö¦\ÅS\í\r\ï?rZ\éuzMx\Ã;L\Ó\\nY\ÖJ:dyxWV¼{Fp\Çko\Å\"›ğ†·&\ï$À—\Ò	 \Ë\Ãû\Ël7¼õ6›ğ†§&\ïOdò~ŸN\0YŞ›–µ\ŞzMx\ÃS\á½^\Â{!\0oÂ›ğ†\Â{cAAÁt\ÈòğÖ­\Ë\Ûo½À&¼\áÜ›¥\æ\Ó	 \Ë\Ã{û\ê™í†·\ŞF`\ŞğTxo—šC\'€,\ïƒû6Ú›–L;s•¹\\§·Ø„7¼Ã²¬]¦iş•N\0Y\ŞZ»\Ö\Í;#¼õ:Âšğ†\çÂ»\Ò0Œg\è\í\á}ò¤½ı\ãYg®2—\ëô6›ğ†w|#ş\0²8¼õj\ÛV?\ß\îw\ŞzGY#¼\á©ğ\Ş/UD\'€lo™¨«¶/·¿øpr»Á/½Ş—)œğ†\'\Âû€\ÔD:dYxw6m3…\Şğ.Ë²I£@–…w2\ÓvGS8\áMx\Ã\Õğ>j\Æ=tÈ²ğ\îjpÇ‹ğ&¼á‚‚‚\ã\Ş\Ã\èe\áM\Şğ/\Ó4\ëB¡I\'\0Â›\"¼\áŸ\Éû¤L\ŞC\è@xS„7üŞ–e\İJ\'\0Â›\"¼\áŸğn’ğ¾N\0„7Ex\Ã?\á\İ,u-\0oŠğ†O\È\Ôİ’——w%\0oŠğ†&\ï¨Ô\è@xS„7ü\Şö!C.¦\0\á}ª\äW:¬\Äûüò—¿<\íwõ\ç\ÄûuV,8uÿ\×^{ğ’\ï‘#G^@\'\0Â»\Ã \ï(\à\Ë\Ë\Ëc×­_¿şŒ\ï¬dz°\Ï9\çû¬³ÎŠ]&¼ömY\ÖB&o€ğ\îVxÿ\â¿°GŒ»nÔ¨Q±Ÿ“\r\ï\Ú\Ú\ÚXh\ß~û\í§Bü\àÁƒ\í®¸êª«\ì-[¶$};\á\Ş\Ä4\Í_Kp‘\å!\Ã0n¦#\0\á\İ\åğ^´hQ,t7n\Ü[\ê\ÏÉ†÷/¼pju¹–^ş\Ë_şr\Æß±p\áBûwŞ‰]<xpÒ·\Ş\è\rÀ¹2i/’j‘zC®\êKW\0Â»[á­—¯¾új{\àÀ±eG¿Óºn¼ñFû;\ßù}\âÄ‰X\ée½®õ\ßQ__+½|şù\ç\'};\á\r¿“°¾]\ê˜Ô·” ¼\Ó\Z\Şs\æÌ‰]\Öe²\á½gÏv7ˆÛµká¬Ÿ¶M\ÓüP÷\ç–ZÀ´\r\Şi\ïTn‹×“O>»\ÏĞ¡CO]WXX»î©§:cµx|u|{«\Í;º=ÙŸ	oxaw\ê)?%´H€ÿ”\0„·g\Âûšk®‰\İ\çŸÿü\ç©\ëô²^7hĞ 67H\Ó\Õòm°\Ö\Ş\í„7ü \'\'§Ÿ„v±NÛ²œKG\0\ÂÛ—B\é,\\»¾¬6‡—È„À®“eM(ú	\à\Ûğ>\ï¼ób\Õ\Õ\Û	oxhEB»D·$—‰ûE:À\á\Ø\Ö\Å\áQ‘\í$°ƒRõRUÁ`p\Ğ+&o\Â½Q ¸Pû#¶M\Óü+@x\Şğ0\Ã0†I`Ÿ”\à\Ş\'Ë«\é\0Â›ğ†GE\"‘ş\Øe\Î~\Û¢#\0o\Â&¡}·Tƒ\Ô\×yyyW\Ò\0„7\á\r\nÉ”½N¿\ÛƒO\Ó\0„7\á\r“\Ğ-¡\İ(µ+‰\\AG\0Ş„7<JÏ±-].\Õ,õ8@x\Şğ0	\ë±:m\ËÔ½#_FG\0Ş„7<J\Âz€iš_8\Óv@x\Şğö´ı°T“\ÔV©\Ñ\0„7\á\r\Ê\ÍÍ½D\Âz³w0œLG\0Ş„7<L\ÃÚ™¶7:ô‡t@X¶lKx£›tµ¸³z\\ƒûa: G•––¶\Ô\Ô\Ôºiª½{÷\î‘ğn\à™•U\Óö4\İ M7L\Ó\r\Ô\è€·|ùò\ÇKJJ¢û÷\ï÷|0<y\ÒóÁ]\\\\\Ü$5ƒgVï§»|\é®_\Î.`\ã\è€Œ’°™.\Ó\âq]\İ\ë\ÕZ²d‰-o’¶—ÿ:q\Ü\ÙA\Âú1g÷¯r=ø\n€vhx\ë˜\èÜ¢‡3\ÕÃš:\Óöh:\00M3:|øğK\é\\zş=¥\'\ÑŠ\è‰E\è\0$7y\ë˜\Ñ	d’ªSO\Ùéœºón:\0©…w“a7\Ò	dŠL\Ù\ÏJµ\È\Ôı	_\Ù\0@\×\Âû¤„÷:&a}µ<\ßö\ésN\Âû.:\0]\ïòFZH\'\Ğ\ÃÏ³™ú\Ô\êÁƒ—\0@7Hp‘\Éû: \ÛSH`WI\ÕK\é\0¤g\":(\á=N \İLÓœ\ílI¾r\äÈ‘\Ğ\0H_xWË›\ìt:t	\×\ÉsªFªN*@G\0 \Íd*ª”\Éû:4}œ«[’\ËrYNNN?:\0=ófû•LG/\Ğ	t‡<‡~*¡}@O\Ç\å\Ã\àt\0z6¼7KÍ§è¢¾\Úœi{q 8—–\0@Ï‡w¹\Ô?\èR%}ƒnğ(uL\êv:\0™\ï2©\èR™¶\å9ó†nIn\Æ{L\Û\0ùğ.‘ZA\'	\ë›M\Ó<$S÷Q	\í\ß\Ğ\0p\'¼?\Ğ\é›N #EEEgKp¿\å%\ímı™®\0€{“\Ô[2E}N\'\Ğy~\Ü*}D\êp~~ş-t\0ÜŸ¼\ç\ë\çtmM\Û\Ü\ï:GIû»\\Õ—®\0€\è!,\åy@¢`0x›nE.Ïo9e,\0xŒ]M²F\' t\Ëq\İ\Â\Ùoû5¦m\0ğ\æ„õ¨ßœN@w\èÒ¤şœ\0€w\'\ï	z \r:‘½ô\ä¦i.\Õi[\êU:\0\'oÖ£õœ\Şt\";\É·|©Rµ¡P\è\'t\0üŞ…2u \ÙEÏ¯­\çqöÛCG\0ÀG\Ã\"o\Ş\'\éDV}`³\ä1¯\Óm¤®¥#\0\à¿7ò›\ä\r¼‘Nô~@\àBy¬Ku\Úƒ³\è\0ø”¼‰\Ò7s:Ñ»\Éc–ª—ú&//\ï\Z:\0>‡/“7ô(\èü]\ç\Ìq-¦i>GG\0 ˆD\"ı\åİ¦½r\Úşn\Ï U\n…®¢#\0\Ğ{ô%¼{\å²5Î´=ƒ\0@\ïœ\Ğl}Ã§şg\Æ=òx6H\í‘\àHG\0 —’7ù\èğ\á\Ã/¥ş5dÈ‹\åq\\/¡\İlY\Öt\0zÿä­»\r¢¾ığ5F»Q–;¥.§#\0\á\İ\Äiı\'ÿ@»\r:mKhO§#\0]\á}R´F\'üC&\í‡ôC—\Ôv¾ò\0€\ì\ïzŒs:\á}¹¹¹—È”]\á÷:\0\Ù;\ÅÑ­”\é„\ç?dM”\àn’\Ú2t\è\Ğ\Ò\0\È\îP8¨\çõ¦Ş¤A­\íL\Û\é\0@Ã»š\r<û\ØLu6H«\ĞU\æt\0cYV¥L\Ş\Ï\Ğ	\ïĞ\Ğtc4=\ã›<6\ã\é\0 õt÷•Lv/\Ğ	oƒ:\Óv¹\îFG\0\0m…÷f©ùt\Â]z€Ë²v9\\CG\0\0…w¹\Ô?è„«Á“:mK}¦‡:¥#\0€Î‚C\Ï÷üpe\Ú¨\'‘i»Aj\0$\Ş%R+\èDf\éF‚\Ø-RŸrV7\0@ª\áıN\ßt\"3B¡\ĞU2q\ï\Õ\Ã\ÒJı\0\0º2¾%\Ó\ß\çt\"#”×³¸I}<xğ\à\ï\Ò\0@We¾nqN\'zN^^\Ş5\Ò\ã*©z©0\0t‹iš³eò\ŞA\'z¬¿/8\Óöª@ p!\0t›³\áT%H/	\ê\ë$°÷KÕ…B!“\0\0\Ò\Æ9¢W5H\ë¢—tKr™º—9ò:\0Hw\ĞL\Ğ3‹Ñ‰\î“>^/U«\çH—E¹t\0\Ğ#dB­\çô¦\İ\îy:m\ËrINNN?:\0\è\Éğ.4Mó\èš\Â\ÂÂŸ\ëš©\ã†a¡#\0€§£¡)\ë+z^\×-\É\å\Ğû@\à\\Z\0\È\Ô\ä}“7šN¤\Ö3©C\ŞGƒÁ\àmt\0Q>ƒtz¤\ÉM\Û\Ú\×~†ñNQQ\ÑÙ´\0q\ápø2	£(\èX~~ş-Ò§\ÃRG$Ào¥#\0\0\×\è­$l:\Ñ6®¥?o;GI\Óó÷¥+\0\0·õ%¼\Û~£\ßk\ë÷\Ûú=7\0x††7\ç”>-´\Ï5\ã=¶ƒÁ\àß˜¶\0#\Óetøğ\á—Ò‰S»\Î\×}·eÚ¾\0\0¼:y\ë„9(›{ GEÓ££9GI›Ï³\0\àõğn’‰ó\Ælıÿ\ëq\Èõ(sRz\\ò\ëyF\0\0ü\Ş\'³ñĞz\Æ/=ó—N\ÛR/óL\0\0ø)¼O\è1Î³\éÿ¬\ç\Øuz\Îm=÷6\Ï\0€¯\èY\Ådò¾\'ş¯\ÔJ`¯\Ò\ïù%¼gó\è\0ü:y\ÔózgÁ‡”Bù¿\ÖKUeûz\0\0ÿ‡wµL¡\Ó{\ëÿoğ\àÁß•ÿ\ã\Ç\ÎQ\Òfòˆ\0z\ÃDZ)“÷3½ôÿv—n\'Nö†B¡«x´\0½eòşJ\Â\í…\Şô\Ò#\ÆIpª[’÷\Ö&\0€\ì\ïÍ½\éÀ$Ø£¤\Z\äÿ´G>”\ä\0ô\Æğ.wÎ˜\åk@\à\"ù|&\Õ,õ$,\0 7‡w™\Ô>ÿ?\Ü\'\Óv£\Ô.™¶/\çQ\0ôöğ.‘Z\á\Ç{8ş„µ®9hƒòh\0²%¼?\Ğ\é\Ûoÿn\Ã0\ÆË¿»QjgE\0d	Á·,\Ëú\Ü/ÿ^ù·À\Ş\äL\Û\Óx\0\Ù8y\Ï\×-\Î}òAc‚Mj«Ôxô\0\0YIñ-\Ó\ì½¬«Ÿ\åò\r^\Û\Åj\èĞ¡?”°şRş]zú\ÒI<j\0€¬\n…~¢[e\ëô*A•¥\İN\ÍñĞš)Î¿·\"77÷E\0@6N\Ú;;m[\Ã=\'\'§Ÿ\ÛÿNg-À6\rnY>\Ä#\0\È\êé»£ğ–p\Ó0¦\ëi²Ü¨»ƒñ¨\0˜¾Ms};\áİ¢\Çw\ë\ß%A}™k\İ\Ùl,\0\0]%\íœ\"³ux¯q\ë\ßdY\Ö:m\ënkC†¹˜G	\0€3§\ï7\Ûø¾û†Lÿ;dÒ¿Bş\î\İR\r†a\Ü\Ã#\0@;t£4	ğº„ğ\Ş\ã\Âˆº@–kõ\Ä\"<*\0\0t\Ï\Å\Ã[¦\Ş;3õ÷\æ\å\å])S~¥ü½\'\å\ß0‚G\0€\Ôü˜†w&?0Hp\ë÷\íeƒş.\0\0\0)’‰{Znnn‡·L\Û\×H`\ï“ğ>)\ç0:\0@\×M”\Òğ\ŞSA0œ\ål\İşQ ¸–\0\Ğu¤¢R\ëeZ\\\ÂúZ™´«eYo	\Ú\r\0@z‚;\ØS\Ò\àz|tg\Ú^1r\ä\Èh7\0\0\é\r\îÎ®Ošsø\Õ\Z)\İ\r-ŸV\0\ĞsÁ\İúö)©şÁ–e½ª[’›¦¹\Ô\'7\0 ‚;.¥U\è\Ö?•)û€\Ôñ`0xm\0 ³Á\à-L\à}%°_sö\Ûş œK›\0p\'¸¯¥­\ß3\ãF	\ìo¥É´}-\0Àı\ànıûñ	¼¯sR“™¸\ß-**:›\0\ĞsÁ\İW\êEgÙ‘\Ö÷‹}ş\ãÿx„öa	\í#à¿¦½\0\0ô|po\íó¯£©m\í ÀÛ¼\ß\\PôÿñöM7\İTÁ´\r\0@\Ïwg’¶ª­\0O\îxÍß¨Ş§\Ä\0\0Á\İvÀ¶Ì‰\Ş\Ù\íqi=\0\0w\ÇÁ\Ú^@Ÿdp\'ş=-8\0\0=\ÜxC\nÁ\İ:À§\Ğz\0\0z.¸;\nğT‚;U\è\0\0tÁ¥N\èV¤ø{g·1q78×§\âC\çw/\å¡\0\0 õ\É;\ÙU\Øé¼Ÿ\à!\0\0 \ë©\ï¼\ã\Ç>g•9\0\0=\à\é\ÜÚ¼K§\r\0\0mk[[§k?\ïp¶2\0 í¦´1wûk	÷Z\0@\ÏL\ài;¶9Á\r\0@f\'ğ\Ä\0Ÿ\İ\'¹³Š%Şı¹\0\ÈğŞ\ï¨	n\0\0<0§ü7\0\0.N\à©1Á\r\0€G&ğdV¡‡û°q\Z\0\0¾™À\ãß‘\Ü\0\0ø À\Û\Ú?\0\0x,À§&7GN\0Àã¦š¦©c)\é\Ã\ÙÁ\0\0ğ¾@ p‘\Ş6Á\r\0€Hp_^PP ÷¥t\0\0L\Ş\×Ix7\Ó	\0\0|\"??ÿË²\Z\é\0\0>seò®§\0\0ø„L\İwIx§\0\0ø„÷X\Ó4\Ñ	\0\0ü\ŞS¤j\é\0\0ş	\ï\'¥ö\Ñ	\0\0ü\Ş3¥v\Ñ	\0\0ü\Şs¥¶\Ò	\0\0|\Â4\Í7¥6\Ò	\0\0|\Â0Œ÷dò^C\'\0\0ğ\Ï\ä½\\\Â{\0\0À\'$¸Ë¤\Ó	\0\0|Â²¬Ï¥\Ò	\0\0ü3yo–ğ^@\'\0\0ğOxeš\æl:\0€Â»\Ò0Œg\è\0\0ş	\ïj™¼§\Ó	\0\0ü\Ş¥¦\0\0ø„eYG¥F\Ñ	\0\0ü3y\×Ix[t\0\0ÿ„wC0¼N\0\0\à¦i6şœN\0\0\àŸÉ»%\n]E\'\0\0ğOxGsss/¡\0\0ø\'¼íœœœ~t\0\0\Ğ\Ğ\Öğ¦\0\0ø„®.\×\Õ\æt\0\0Ÿ\Ğ\r\Õtƒ5:\0€O\è.bº«\0\0À\'ô\à,z:\0€O\èaQõğ¨t\0\0ÿ„÷(=1	\0\0À\'ôT zJP:\0€O˜¦9]Â»šN\0\0\à†a<cYV%\0\0À?“÷l	\ït\0\0Ÿ\à^ ^A\'\0\0ğOx/”ğ^O\'\0\0ğ‰‚‚‚\ÅR\Ó	\0\0üŞ«¤–\Ñ	\0\0ü\Şk¤\Ñ	\0\0|\Â4Í\Şo\Ğ	\0\0ü3yoµ,\ëe:\0€\Â{·\Ôót\0\0ÿ„÷72y?A\'\0\0ğ	\Ó4kƒÁ\àd:\0€&\ï\Ã\àc\è\0\0ş	\ï\ã†a£\0\0ø\'¼\ë%¼\ï¤\0\0ø\'¼%¼o¦\0\0ø\'¼›¥®¥\0\0ø\'¼£\ápø2:\0€\ÂÛD\"ı\é\0\0ş\ĞW\Ã[—´\0\09\á\r\0\0üÀ4\Í\Ëõ;o:\0€&\ï\ëtks:\0€O\ä\ç\ç\ßbYV#\0\0À\'‚Á`®aN\0\0\à2uß¥\Ç6§\0\0ø„÷X\Ó4\Ñ	\0\0ü\ŞS¤j\é\0\0ş	\ï\'¥ö\Ñ	\0\0ü\Ş3¥v\Ñ	\0\0ü\Şs¥¶\Ò	\0\0|\Â4\Í7¥6\Ò	\0\0|\Â0Œ÷dò^C\'\0\0ğ\Ï\ä½\\\Â{\0\0À\'$¸Ë¤\Ó	\0\0|Â²¬Ï¥\Ò	\0\0ü3yo–ğ^@\'\0\0ğOxeš\æl:\0€Â»\Ò0Œg\è\0\0ş	\ïj™¼§\Ó	\0\0ü\Ş¥¦\0\0ø„eYG¥F\Ñ	\0\0ü3y\×Ix[t\0\0ÿ„wC0¼N\0\0\à¦i6şœN\0\0\àŸÉ»%\n]E\'\0\0ğOxGsss/¡\0\0ø\'¼íœœœ~t\0\0\Ğ\Ğ\Öğ¦\0\0ø„®.\×\Õ\æt\0\0Ÿ\Ğ\r\Õtƒ5:\0€O\è.bº«\0\0À\'ô\à,z:\0€O\èaQõğ¨t\0\0ÿ„÷(=1	\0\0À\'ôT zJP:\0€O˜¦9]Â»šN\0\0\à†a<cYV%\0\0À?“÷l	\ït\0\0Ÿ\à^ ^A\'\0\0ğOx/”ğ^O\'\0\0ğ‰‚‚‚\ÅR\Ó	\0\0üŞ«¤–\Ñ	\0\0ü\Şk¤\Ñ	\0\0|\Â4Í\Şo\Ğ	\0\0<høğ\á—Z–uƒöÀ„\É{«\\÷2\İ\0À›Sös\Öv;•j\ÒÒ€§[\0\0x„ş³ƒ\0\×\âhk\0\0x‰LÕ¯v\ŞL\İ\0\0xLNNN?	\éæ¶‚\Û4\Í-t\0\0’ .n\ë;\ï\Ä\r\Ù\0\0€‡hH·\Ş%t\0\0oO\ß\Û‚»1‰ô§+\0\0xX~~ş-	\ßu/¤#\0\0øcú®v¶0¿’n\0\0\à1\ÎV\æS¤J¥j\Û\Ø\ß[·@?(Ug±\Z\0\0—\ä\å\å]££I 7vrp–\Öû{·˜¦YÁ~\ß\0\0dpÒ–ğıPB\ÛN%´Û©2&q\0\0znŒ&s}\ë=z´={ölû“O>±÷\í\Ûg\×\×\×\ÛJ—555ögŸ}f¿ú\ê«ö¸q\ã\Ú:€Kaw\Ò]\0\0\ÒLBvD(jI\ŞGy$\Ì\Í\Í\Ív²\Ê\Ë\Ë\íÉ“\'·u —\ét\0€4w\âjr	q{Ñ¢E)…vk~ø¡‰DZO\á8\0\0İ¥«\Ê%¸£‰«È·m\Ûf§\Ã\îİ»\í1cÆœ6³\n\0€nĞ\Ó¿\ã\Ö\à\Ö\ï°\ÓIÿ¼\Ä\0\×\ïÀÙˆ\r\0€.Ò­\ÊW•§k\ânkoµ\n}\r\İ\0 Eºw\â÷\ÜúwO\Ò\ïÀ¿ÿ\Ö\Õõ<\n\0\0¤@À’¸Uycc£\İ\Ó&Nœ˜¸ú¼‚G\0€$\éwİ‰GN\Ó\İÁ2a\ãÆ§‰Mj\0\0\0I\Ğ]¶7R\ë\Î.a©J<‹G\0€$8\'‰\èœ9s\ìLZ°`Ái‡O\å\Ñ\0\0 ¹ğ®¨ò4“t}ÂªóC<\Z\0\0$ABó\Ô÷\İUUU\ro\İ\ï;ñt¢<\Z\0\0$7yŸ\n\ĞøIF2Eÿ¾Ä¿ŸG\0€\Ã\Û\r„7\0\0L\Ş\0\0ôn|\ç\r\0€ÿ&o¶6\0Àg\á\Í~\Ş\0\0ø‰L¼O¸u„µx€#¬\0*=¶¹~\ßÌ±\Í\0ğ=§v\âY\Å21}O<™³Š\0\ĞUz>o	\Ñ(\çó\0À_\Ó÷©\r\×B¡½mÛ¶	\îİ»w\ÛÃ†\rK\ï5t\0€.ˆD\"ıMÓ¬K\ÜxM÷\ÃN÷~\İ÷\ß\â\êò:ı{\é>\0\0]dÆ‰«\Ï5À\Ó5\ëÄ\Üú÷\è\ßG\×\0\è~€OHp]…®ßwg#6ı»Õªrº§\Óm\0\0z(À\ã[¡———§¼;\ØÔ©SOmıs	n\0\0z&À\ïLü<qUº‰m\íÚµ±c¡\ÇOf¢KıN[^œ–x\0–\Ä\ï¸YU\0@Ò\É·B\ïf­a\ã4\0\02D÷—©y}\â‘Ø’)=rš€%\ŞF\0pJ\Õ9ºNãµ‰§M8\Ì\é!=Éˆ«œC\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ôœÿeô ¨EO¦\ë\0\0\0\0IEND®B`‚',1),('2',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"å§”æ‰˜\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"CUS_Submit\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"SS_Review\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"æ˜¯å¦é€šè¿‡\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"é€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"æœªé€šè¿‡\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('3',1,'/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562206221743\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestReport\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestReportID\" name=\"ID of test report\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewReport\" name=\"TM_ReviewReport\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TMReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"qmReviewReport\" name=\"QM_ReviewReport\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"qmReviewGate\" name=\"QMReviewGate\"/>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusReviewReport\" name=\"CUS_ReviewReport\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CUSReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitReport\" name=\"TSSubmitReport\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"_12\" sourceRef=\"start\" targetRef=\"tmReviewReport\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"tmReviewReport\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_14\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"qmReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" sourceRef=\"qmReviewReport\" targetRef=\"qmReviewGate\"/>\n    <sequenceFlow id=\"_16\" name=\"é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"cusReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_17\" sourceRef=\"cusReviewReport\" targetRef=\"cusReviewGate\"/>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_20\" name=\"ä¸é€šè¿‡\" sourceRef=\"qmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_21\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_22\" sourceRef=\"tsSubmitReport\" targetRef=\"tmReviewReport\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestReport\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"25.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewReport\" id=\"Shape-tmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"210.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewReport\" id=\"Shape-qmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewGate\" id=\"Shape-qmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewReport\" id=\"Shape-cusReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitReport\" id=\"Shape-tsSubmitReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"20.0\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"tmReviewReport\" targetElement=\"tmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"start\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"57.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"qmReviewReport\" targetElement=\"qmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"tmReviewGate\" targetElement=\"qmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"237.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"cusReviewReport\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"525.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"qmReviewGate\" targetElement=\"cusReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"412.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"tmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"227.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"cusReviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"251.0\" y=\"617.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"qmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"396.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"tsSubmitReport\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"65.0\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"cusReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"601.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"420.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('4',1,'/home/dell/stconline/server/target/classes/processes/TestRecord.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562315654060\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestRecord\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestRecordID\" name=\"ID of test record\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewTestRecord\" name=\"TM_ReviewTestRecord\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitTestRecord\" name=\"TS_SubmitTestRecord\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TMReviewGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_7\" sourceRef=\"start\" targetRef=\"tmReviewTestRecord\"/>\n    <sequenceFlow id=\"_8\" sourceRef=\"tmReviewTestRecord\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_9\" name=\"é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_10\" name=\"ä¸é€šè¿‡\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitTestRecord\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_11\" sourceRef=\"tsSubmitTestRecord\" targetRef=\"tmReviewTestRecord\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestRecord\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewTestRecord\" id=\"Shape-tmReviewTestRecord\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"120.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitTestRecord\" id=\"Shape-tsSubmitTestRecord\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"355.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"390.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"_2\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"211.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"120.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_5\">\n        <omgdi:waypoint x=\"211.0\" y=\"175.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"260.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_5\" targetElement=\"_6\">\n        <omgdi:waypoint x=\"211.0\" y=\"292.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"390.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"_4\" targetElement=\"_3\">\n        <omgdi:waypoint x=\"400.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"255.0\" y=\"147.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_5\" targetElement=\"_4\">\n        <omgdi:waypoint x=\"226.0\" y=\"275.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"275.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"240.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5',1,'/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"åˆåŒ\" processType=\"None\">\n    <startEvent id=\"start\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"SS_Submit\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"å®¡æ‰¹å­æµç¨‹\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"smContractReview\" name=\"SM_ReviewContract\" activiti:candidateGroups=\"SM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewCosment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QM_ReviewContract\" activiti:candidateGroups=\"QM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewCosment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"å­æµç¨‹å¼€å§‹\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"smContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"smContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CUS_ReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewCosment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"é€šè¿‡\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"ä¸é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"ä¸é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"é€šè¿‡\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"smContractReview\" id=\"Shape-smContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"smContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"smContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('6',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestPlan\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestPlanID\" name=\"ID of test plan\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QM_ReviewTestPlan\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TM_ApproveTestPlan\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TS_SubmitTestPlan\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"ä¸é€šè¿‡\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"ä¸é€šè¿‡\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestPlan\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Û\0\0–\0\0\0T3\0\0&&IDATx\Ú\í\İ\Õ\å}7p&µ­µikÓ´N&“\×É´¯“±™Œoóv\Òf:–6m\Z›aL‘=g\ÏY7Q¼ x#xh\Õ*‰‰¡*\Æ(Q\Æ4\Ú\Æ$\ä‚\×@ÑˆŠ(^À¨¨^¸\ÈM\àÿ>¿“s\èqİ…]vÿ{;Ÿ\Ï\Ì3g÷œ½ñ;\Ï÷<\Ïÿÿ°aÈ²\ìğa\0@\ï¹\ä¿^x&\ì\ÇSû\Ø\Í+³WÎŸ³d\Ïÿû\îSk¦~gÅºI\ß\\¸7\İ_Œ¯»\è\Æe»\Ò\Ç_ˆ¯‹\Çkm\Ò\ìEûê¿®öó\Úÿ\æ,İ¦\Ú\04¤Œ‹f~wõ\Û_ù\Şs\Ï]ô\íe¯OúEû¾ô\íe».ºñ‘]{²\ìşº¯»\Î\Ò\í¯E¨^ş\Ãu+¾<w\Å\Î)s—\ïœ4{\á¾ÿ~9{1\İ?!¾\î©,»d\îc\Ùü\Ú\×\ÕÚ¹³½·µ¯€F\n\Û#S;*µ%°\İô\Ø\Î\ç,}\çº÷­\Ûtÿû\ë¿~İ\ì\áKn_µm\Ú-+wD0Ÿ{\Íı{Ï»fq\Ìlÿ²\İ\Ï=n[–]í–•\Ù_»üµø¸£Y/\0\éY\íew¬İœn\\ü\İU\ÛÎ¿öş½};\î\Ëv}ı\î-¯Oş\ÖC»\ã\ë\æ.\ç\Õ\É\ßú\å\îôu—}\í§kŞœzË“;\"<cfûû^{ıükïˆ¯‹Pru¹ù\Ì+öú\Ãqÿ’,ûú};³kT€F\Û\Ï|\å¿\ÖlM·_‹c¯¯¾/;ÿº%{\Ò\çKS»\î\ß¼ñ\Í\ê\×ı¯ó~}ÿÿú÷;\Ùò\å›W\ìˆ ½aY¶.\İwñ\Ôy+\×\Öf\Éñqu¶üşó¯]²=\î¿\âÇ›±|@\Ã:\ï\Úû·§ ¼\í\ÜÿX´/\ÍP÷Lü\æ}\Ùõe\ë§\Üø\è\Æ\É\Ú\×EÇ™\Ê\ç]³x×¥w¼¼%Á\Æ2óœû\Ölªÿºøyµ¿»:»-n«\ì,g\0\Zrf{t\æ“oeO§©\çS±<\å¦\å•c¶·>½üX–]Q›±Vg¶§~\ã\î-1\ëıô\ä~¹{\ÊM\ìºbşk\Õ}\İ\áµYnõóO§”~\áu¼­\Ú\04bĞ\'6M½\å‰\×ÜŸıüù,[±5\Ë[e37gÙ²XVN_3/µÿ;m\ŞS\Û\ãd¨~{}š?º3=~ù×¿5{á¶·¯\ŞşrúšsRûpo\ná·¾ÿRv\ëú,›ú\Ã\r\Ù\Üx{\ĞõfwVOú[• ‘\Â6\Âozœ‰\á8ó?Wm»ò§o¾Q{ÿ\ì-\Ïd¢ŸM\í\Ö\ÔîŒ³ˆç¿–½3\Ú®{ğx?n­¥\Ç.H\íô7²\ì¢\Ú\Ïû\ÊmÏ­~\ë³/Ô¿\'7«<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0JY–y\çwş`ö\ì\Ù\ÛfÍšµ\ï¼ó\Î\Ë\Ú\ÚÚ²\æ\ææ¬µµ5›4iR6mÚ´\İ3g\Î\\;aÂ„sU\0º\è\ÕW_m¹\å–[¶œs\Î9\Ùgœ‘\İt\ÓMÙƒ>˜­[·.Û±cGv\ïŞmØ°!{øá‡³yó\æe\ãÇ\Ï\Î:\ë¬}S¦LùE©T:J \ã™\ìQ÷\İwß¦³\Ï>;K3\ÙlÅŠ•Píª•+Wfiœ;6K³\à™*\n\0\íf³\ßø\Æ7öMœ81[¾|y\Ö\Ï<óL6aÂ„\ìô\ÓO­­­\íH\Õ \ámİºuÂ´iÓ²«¯¾:Û²eK\Öb¹9~Ş™gù–ee\0\Z~FA{\ÅWd{ö\ì\ÉzÛµ\×^3\Ü7†~¸j\Ğp\âm,\Ç4 ­ùú×¿=zŠ\Ğp\âd¨8F\Û[K\ÇZR?~ü¾R©4Q\Õh±|g\Ç\Ç}!Nšjii\Ù\ëø-\0\r#\ŞGo\ï\éK—\\r\É\î\æ\æ\æùªÀ;CÅ†}5«­yúé§³4³}\Ç\ÉR\0yw\ß}÷cg¨<OŠ\êL[[\Û\Şb±8Ö³\0À{\ÇŒıáª«®\Ú\Ş\ÜÜ¼Ø³\0Àˆ½û\Ã<°\'…\íË\0†´¸zO\\T ?lÚ´i_\n\Û]\0†´¸<^\í\ê=}-.l—\èó,\00¤E\Øõ\'aÀwò\É\'÷\ç\ÌvŸ°`\È;÷\Üsû\í˜\í†\rv;fÀ7}úô]ıu6òwŞ¹Á\Ù\È\0y_|ñšşzŸ\í´i\Ó\Ö{Ÿ-\0CŞ„	¾8~üø~\ÙA*¶k´ƒ\0¸{ûzo\ä¥K—\Æ²½‘hS§Nıù•W^Ù§a;nÜ¸õ®ú@\Ãhkk;ò\ÔSOİ·r\å\Ê>	Ú‡zhS\Ìj]\Ï€†r\ÖYgM‹\ÈoÙ²%× İ¾}û\Şr¹¼;\íDU \áŒ?~\İUW]•\ç\ÉRû\Ò\ï\ØP,ŸWm\0\ZRœ¬”f¸›fÏG\à\î›2e\ÊKñ¾\ÚX¶Vm\0\Z:pÇ·\á«_ıjöö\Ûo÷\Ú\Òñ™g\'D½\ì8-\0T·µµõù\ÓN;m\ß\ã?\Şã“¡\âm,›\Ñ@;q\Ó\èÑ£÷LŸ>ı\İ\î,-/[¶lc®u\ìd(\0\èL\ÌFÓ¬ô¶˜3fß¬Y³¶/Z´h\Ïúõ\ë÷\ÆõhkWï‰‹\n\Üu\×]›b\Æ\Ø*B6\ŞGk\Ù\0º!…gkj÷¤¶&ğö¸<^]\Û\ÇdS[\Z[0\Ú\n\0z/€³3f¦\0cØš\Å@\Îa\Û\Ô\Ôô~•\0€\Ã\Ö[z\0 \ç°mmmı•\0€ü\Âv\ßÈ‘#?¤\0cØ¦ö•\0€Ã¶µµõ£*\0ù…\í\Şb±xŒJ\0@a\Û\Ò\Òr¬J\0@NJ¥\ÒŞ“N:\é*\0ù\Íl÷¤öT\0ò\r\ÛO©\0\ä¤X,¾3zô\èO«\0\ä7³}§P(¯\0_\Ø\îNaûw*\0ù…\í®b±øY•\0€Ã¶\\.ÿ³J\0@~a»³P(ŒP	\0\È/lw¤™\íH•\0€ü\Âv{±XlR	\0\È1lK‰J\0@NÒ¬öí”µ£U\0ò›\ÙnKaûE•\0€ü\ÂvkšİU	\0\ÈIš\ÕnI\í4•\0€üf¶›SØ¡\0“b±øf\n\Ü	*\09I³\Ú7\n…\Â$•\0€œ¤Y\íë©¯\0_\ØnJm²J\0@~a»1µ©*\09)‹\Ê\åòt•\0€üf¶\ëS\à\ÎT	\0\È/l×¥v©J\0@~a»6µ\ËU\0rR,_)—\ËWª\0\ä¤T*½\\(¾¦\0“\æ\æ\æ5iv{µJ\0@~aûBj³U\0r’fµÏ—\Ë\åkU\0rR*•K;G%\0 ¿°]U(¾­\0“\æ\æ\ægS›«\0_\Ø>\Ú\Í*\09)‹+K¥\Ò<•\0€ü\Âö‰r¹üŸ*\09inn~<\îm*\0ù…\íò\Ôş[%\0 ¿°}$µ¨\0\ä¤X,>\\*•~¤\0“´\n…«\0ä¤¹¹yij?U	\0\È/l—¤v—J\0@~a»8µ{T\0rR*•‹\ÅûT\0ò›\Ùş<µ…*\0ù…\í=±”¬\0_\Ø\Ş\'I©\0\ä¤X,.ˆ·ÿ¨\0\ä¤T*ı$\îƒ*\0ù…\íb\ËF•\0€œ\ÄE\âb*\09)\n\ßO³\Û\ÇT\0r’‚öö¸€¼J\0@N\Ê\åò‹\Å\'T\0r’fµ·¦°]©\0_\ØŞ’\ÚS*\0ù…\í\ÜÔU	\0\ÈI¡Pøv©TZ¥\0“´\ßJ3\Û\çT\0rR,¯Kaû+•\0€œ¤ \Ú*\0ù\Íl¯Na»F%\0 \'¥R\éª¶/©\0\ä7³•\Âöe•\0€œ¤ ½<µµ*\0ù…í¥©­S	\0\ÈI¹\\¾¸X,®W	\0\Èof;#µ\×T\0òÛ©©mT	\0\ÈI¡P¸¨T*mR	\0\È/l/L3\Û\×U\0ò\ÛIifû†J\0@NÒ¬vB±X|S%\0 ¿°=3µ·T\0rR(N/•J›U\0rR,Ç¦™\íV•\0€œ¤Y\íS\ØnS	\0\ÈI\n\ÚVa\0ù†m9µ·U\0rR,›R\ØnW	\0\ÈI¹\\™\Âv‡J\0@~a{bš\İ\îT	\0\ÈIš\Õ~>5a\0yI³\ÚÏ¦°İ¥\0“Q£F}¦T*\íV	\0\ÈI\nÚ¿M3[a\0y=zô§‹\Å\â;*\09I³\ÚO¥¶G%\0 \'MMMŸ¶\0£r¹|\\\nÛ½*\0½$v‹J-;H{Y¥\0\à•J¥\Ë¶…B\á*\0ù\Ín×¨\0ôP±Xœ\ÕYØ¶´´U\0zgv»µƒ°]¯2\0\Ğ{a;µ}Ø–J¥3T\0z7p7×…\í\ë*\0½,\Íd\'\Ö\Íj\'ª\0\ä8»U	\0\È/l\'[\0­,\Ëşù\ç_^ºtiv\ï½÷fw\ß}·v\í{\î\É~ñ‹_\ìK\íZ½J\×Çw‰Ahñ\â\ÅÙ†\r²]»vi=h7n\Ì.\\¸/\rJ³ô,}\\ö‹Wû¡\ŞŒ\Ò,`—¥\ë\ãÀ~±¬f\0\é\İKnz–>®û\Å\Zƒ‡H\×ôq\0Ñ¶·\Öe\Ï?|S¶ò¯TZ|÷xDú¸>ô\Â@´õÍµÙ“wN\Ëÿ\É\ïjq_<fğ1\é\ãú8\ĞÃ\è\å•?z\Ï Tk¯¬œoğ1\é\ãú8\ĞÓ\è\éŸÿ{§Q<fğ1\é\ãú8\ĞÃ\èÉ»gt:\Åc‘>®\"‘>®\ë\ã0°¢83³³(3øˆôq}\è\á@´z\É\ìN¢x\Ì\àc \Ò\Çõq ‡\Ñ\ëkWdO\Ş5ı½\Ëk\é¾x\Ì\àc \Ò\Çõq ‡Q´–\İü(\î3ğˆôq}èh\ç\Îlõ×¾wy-\İ|Dú¸>ô` Š\İsV-ùf§Ç³\â1;\ìˆôq}8”(½š_·ú¾\ì‰S:„j-¾&¾\ÖÀ@¤\ë\ã@¢ƒ½\Ò70\é\ãú¸=ˆºòJÿ@3\0‘H\×ÇƒD‡:Õš\È@¤\ë\ãÀA\"\Í@¤kú8ˆD\è\ãú8ˆDknnnM\íU½O¶` \Òzy ª†\ìúÔ²hzŸ>.lÁ@¤õ\Ò@\Ô>d…­>.lÁ@¤õ\Ò@T,\Ç\Ærqû¶úxGm\ç \Ú0CØ‚°QG3Ya«w\ÖV­Z•µ´´šÀ¶ l\ß\Õ\Ò?±\Òú!lµ\Ôz?½\á†²R©”­Y³¦_úvw–°…\ÃvÉ’%\Ùq\Ç—ıöoÿvö;¿ó;\Ù\'>ñ‰n=~°ÿ\è\Ñ~ó73û‹¿ø‹\ì\Ş{\ï\Ôaµ-\n¦~«™\íÀ\í\ãË—/\Ï\Ê\årö{¿÷{•¾·ÿôOÿtÀş\Óş¾C\í÷µ\ï;\âˆ#²‘#GVú\Ä5\×\\3 \Âö`?[\ØBaû±}¬òpÅŠ\ÙÆ³	&t\ëñ®üG_¼xq\å\ã~ô£C\é©©©m¶«/[¶¬®ög–=úè£•ûyæ™¬­­­[a{¨ı¾ö}\×_ış>1fÌ˜lıúõışBR\ØB?†m¼òÿ€1 \Ê\ã\İyU³„\Ú\ç1ø\Ä ô»¿û»•ûÿñÿ1{\á…²\×_½r\ß1\Çó®ŸŸ\Ç#¾ö?»³ŸU{üÿø³?ü\Ã?¬|<kÖ¬\Ê÷\Æm|şğ\Ù?øÁC^b«\Ît7Û\ÑÇ‡^y~\ïº\ë®n…Nûûµ\ß×¾ï¬³\Îz×‹°¯~õ«]šmÖ¯E;ö\Øc\ßõ7´¼6\ëşĞ‡>Tù\İGuTvë­·¾\çg·ÿ¾BW\ØBaÁT[\êıû¿ÿûlúô\é•@\ë\ê\ã]\Ğ-ZTùøóŸÿüş\Çc¦÷Å²\ÛSO=UùøSŸúTå±‰\'V>ÿ\Ù\Ï~Vù<\Îø<\î\ïh€:\ĞÏŠv\â‰\'V\îÛºuköñ¼òq\ÜnŞ¼¹òñ¿üË¿ôÆ¦1\Óİª÷õo[ñœ\îØ±£Ga{¨ı>¾\ïş\è:<\Äpÿı÷W~\æoü\Æo4l\ï¸\ã\ì‡?üa\å\ãN8\á=G \Æ\Ê\Ú\çs\ç\Î\İÿy¼¸´Œ,lcVx\ÑE\í¡h\Ç|—\ï\Ê1\Û\Úò¯~õ«÷Šõ­6­^½ºòq\í8[\Ü\Æ\çqGƒÆ~V´øû\ã¾iÓ¦UnO?ıô\Ê\íÌ™3+·ñ¸“G„mûÕ’C\é÷ñ}cÇ\í0lÇŸv\Øa\ïZ\á\é,\ã\ïV›½vôxGŸG¿o?›¶0\0Â¶ıñ®Ú«ùCy¼³Á\ëüóÏ¯|3„öƒb\Ì.;úş“N:iÿr`\Ü\Æ\ç\r\ZûY\ßû\Ş÷*\Çrñ\ÑG]¹/\Â?>ûo¿ıva;Ä–‘ô } \×B­>µß¿ù\æ›Ù¿ş\ë¿vzõŸÿùŸ\ïÿ9µ\ß{(aÛ•Ï…- °%Ô¥K—V>JjK¬]}¼+aË·q,)>¯‘\\[ú<yr‡\ß_[z®}_,w6h\ìgÅŒ¸ö=ÿöoÿV¹\ïò\Ë/\ß_ıŒ\Û@4¸ûxô\Ñ8A*^LEH\ÖNŠcú\í_\È]w\İuûß¢3¬\İ\á„C\í÷£F:\àÛ•ššš*\çDŸ¼ù\æ›¸Œ<şüN—‘%lk/2:;YK‡\Ã6g\Æ1xµÿc©,\Ş:\Ñ\ÕÇ»ºT!W¿\'Bq\Æ•—†ur\ÒF¼](\îû\ë¿ş\ëş\ì®ü¬˜Ä¿¡6\Ğ\Äñ·ø¼~\Ö l‡F3ˆG]	\İXV\ÛúÀzõ\ÕW+K½qr\\ô“¸\Ùh\Ü\ß\Ó~_,\ß°ñ^\Û8a*Vx\â¶~iz\ØANŠ¯\í\è©C	\Û8)0úû0\'HAÿ.#k\ÂV?ôKÈ±\"óø\ãW2^\Ø\Å\Çq®€>\"\Í@¤\ç\Ô^|ñ\ÅlÒ¤Iú8ˆ½\ÅòZGM\Ø2”Ã¶;ı~Ó¦M\Ù)§œ¢ƒH3\é\ãy´mÛ¶e·\İv[\å˜\í–-[ôq0i\"}¼7\ÛC=”}öÙ•“’Ö®]«ƒH3\é\ã½\Õ^z\é¥\ì\ÒK/\Í\Î=÷\Üı{3\ë\ã` \ÒDúx/´X&7o^vê©§V¶YÜ¾}»>\"\Í@¤÷V‹«Z\Åû¼¯¾ú\êlÃ†\rú8ˆ4‘>\Ş[\íùçŸ¯\ì¯}\á…fO<ñ„>\"\Í@¤÷V{ë­·²›nº©²düÓŸşô€=\Ğ\ÇÁ@¤ˆôñn´;wVöö>\í´\Ó*û*\Ç{hõq0i\"}¼—ÚªU«*\Û.~ù\Ë_\îö\åõq0i\"}ü\0-.rqıõ\×Wf³ñ;cv«\Â\Ö@¤÷Ò’ñ‚*\Çe\ã|q‘}¶\"}¼—\ÚÊ•+³/}\éKÙŒ3ºt­c}\ZT\ííšH\ïz‹kÏ=;?~|\åRyú8p@‹/\Ş;˜\ß\\?\Ğ\Ú+¯¼²&\rD»ô¬¡\Ù\Çc·§ùó\çg\ãÆ\Ën¾ù\æló\æ\Íú8pp÷\İwß¥.\Ü÷\Úk¯	\Ë^„\î¹\çwR›¥g\r½>¾|ùò\ì¼ó\Î\Ë.¹\ä’Êµgõq [\Òœ™\é•\ê¶X\Z\Z¨-.=6ÿ¾j\Ûe\Zz}ü?øA6eÊ”l\ìØ±• A?\ÔÇ\îkjjú­\æ\æfÇˆ\è\ë~÷ş\Ô\ï\îLmoj\Ó\çP`¨zÂ–>“úÛ´\Ôv§¶®P(¯\"@#„\í„-}!‚56µ]©MU aŒ9òCi\àÛ§\äù‚®T*-Š%\ãb±¸ VSTh(§œr\Ê\Ñi\0¶\ä\"\ìå©½“Úš²ŸT !µµµıoaK³\ÙÏ¥\Ù\ì¦²;\Ò\íD\ZZKKË±±¼§ô†¬G¥öPj{…\Â÷‡~¸ª\0\r¯\\.\'l\é\r©\ÍNmOj«\ãEœŠ\0ü\Ï\0ù© U‚ô¡Q©½U,\ßNm¬Š\0´S*•ş&N`Q	º+N®K}\çñ\ê\Æ·Ì˜1\ã0U\è@¡Pø»\Ø`@%\è†÷¥>37Ë¦\Û\'\ÓlöO•\à\0\Ò@ù\Ù\Ød@%\èâ‹³“SÙ–‚vKj%\è‚4p~>µ*ÁA^”“\Ú3q|?\İÎ‰Ù­ª\0tQ¹\\\ï…T	:ªH\áz[,§¶lÌ˜1V€njiiIciq»J\Ğ^zvfj\ÛS{£P(ŒP€C”f+£\ã-*AM¼÷:õ‹\â,õ²_S€‡\í\ã„•`Ü¸qG¤¾0¿úV%#FŒø ª\0ô‚4¨šf¶[T¢\áûÁ\ä\ê¥\ï^5j\ÔgT w\Ù8.÷–J4¦Ñ£G:=ÿk\ã½\Ö\éE\×L\ÈA\\‘%µ7U¢±´µµ™öŞ¸\âSº½\ç„Nø}U\Èof{~j¯«D\ã(—\ËWg²¯¤öW*³B¡pQ\\wT%†¾8›\ÂuClb’÷U \ïf¶\ÓRÛ CWkkëŸ¤\çø8\Ë8½°úQœu¬*\0}(–\Ólg½JM)\\¯ªn±ø|¼VE\0úg0¾,\rÆ¯ªÄ{ubznßˆ \Ò\í*Ğ¿ƒò•q¢ŒJ\r±wq\n\ØGªS|/ö6V€şŸ\Ù\Æ2\ãK*1\è½/®\ÆS\rÙ§\ã*=J0@¤ù›©½¨ƒúSØ’Ç­©µªÀ\0“f@×¥úW*1(Ÿ»?Mmeõòw7sY€;³½!µ\Õ*1xÌ˜1\ã°®ób\É8…\íòSN9\åhU\Øa;7µgUb\Ğ<_§¦öv\ìg].—GªÀ\à¼oI\í)•\Ø\Òö\ã\éyz.\Ş3\Ç\ÙU`p\r\â\ßMƒ÷“*10\r>üğR©tG—M\ÏÕƒ\éö(Ud\Ò\à}{÷S‰§P(LJ\Ï\Í\ÎØ»º©©\és*0x\Ãö4 ?ªGKK\Ë_677¯I\í\Ô.W€Á¶?Jaû°Jô¿4{}\n\×;«S,LŸ@U\0†F\Øş$ªDÿª^}iwj\ë\n…\Âñ*0´ù˜I= ı#‚56µ]©MU€¡¶÷¦ö•\è[±D\\*•U7¦XKÈª0t\Ãvaj?W‰>­ù\åÕ“ŸÖ¤ı¤Š\0ıqj÷¨DŸ\Ìf?o\ãIõŞ‘n\'ª@\ã„\íq\ÜV%òQ¤öPlLQ(¾U¨\n@©\îJô•\È\í\Å\Ì\ì\ê‹«[ZZU€Æœu-K³­ªD¯‡ì¨¸X@z1óvjcU ±\Ãö±X\ÚT‰\Ş—»K!ûxucŠ[\ârxª`öxšyİ¦=ö¾¸\\a—;Ä…İ•€Z\ØF0|W%]¡P89\Õq[\n\Ú-©•T€öaûT,wªD÷¥)Ç¤öLœ\0•n\ç\Ä\ìVU\0\è(lŸM“±U¢ëššš~+–\Şc\É8N03fÌ‡U€…\ís)0¾¥]®×™©mO\íB¡0BE\08¨4C{¾\\._«–jt\\zQòBl³˜Bök*@wfj/¦öM•\èØ¸q\ãHõ™_}+Ï’#F|PU\0\ènØ¾”flW©D‡µ™\\½ô\İk£FúŒŠ\0p¨²¶X,^¡ÿcô\èÑŸº\Ä\Å\ÜSmfª\0=\rÛ¸pù¥*1lX[[Û‘q}\ß°û\âJH\'œp\Â\ï«\n\0½¶\ë\Í\Ş*\'@]\\É¾’\Ú_\é\0ôf\ØnHmZ£şû\ãXl\n×¨Á\ÎB¡p¡@¯‹‹™§¹¨\Ñşİ­­­R½–olLñ£8\ëXo\0 ¯™\í)l\Îk°WU·XŒ÷§\0«8o¦\à™\Ğÿ\Ö¬\'¦ }#v€J·gxöè«™\í\æ¡<±wqúw>Rİ˜\â{±·±g€¾œ\ÙnIt\êı\ç½/®\ÆS\rÙ§\ã*=q\0úcf\×aı\âPûw•~-^HlM­\Õ3\r@†\íÛ©•‡\ĞLıOS[Y½ü]\\:\Ğ5f\è÷°İÂ©i°ÿ;fÌ˜qX\n\×y±dœş=\ËO9å”£=»\0”°\İQ(¾0\Èÿ\r§Vg\èo•\Ëå‘U\0ZP\íL\íóƒñoO3Ø§¿ı¹xÏ¬\Ë0\ÃvW\n­\Ï¦¿yøğá‡—J¥;\â¸lú\ÛL·Gy&\Èa»;…\Õ\ß–¿·P(LJ»3¶™ljjúœg€¬kR\Ë:h±ûNµmK\Í\r´¿½¥¥\å/«ü—{6\Ê\åò?w¶û[š5\Ş6ş\æ4{}ú»\î¬nL±0}ş\Ï$\0}v»º³ c iV—ş‹e\î¸À}¡P8Ş³À Ÿ\İ”Ymklœ¼•\ÚT\Ï\Z\0ƒN\\Z®£\ã¶ı=«%\â4»^Tİ˜bA,!{¶\0”b‹\Âö†şü›â¤§\ê\ÉOkR\È~Ò³À —B\íÕº\å\ã·ã½«ı4›ı\\¼\'v²J·=3\0)`\ÇÖuI_ÿşØˆ\"µ‡â¤¬4\Óş~…=\0\ä=»]a;bÄˆöñ\ï]}o\ïê–––c=\0\å°m9rdW\Ì\é£\ß7*.\Ë\Ö1³ö\0\Ğ.L-Kmf¿$.w—Böñ\ê\Æ·ôU¸À@\Ú}©=Z½\Í#pß—\Âun—M·OÆ…İ•€F\ÚZÀN\í\íÀ-\n\'§€İ–‚vKj%% ‘ƒö`÷wKš½“\Ú3qTº³[%@Ğ¾÷ñno‘\Ø\Ô\Ôô[±\İc,§¶lÌ˜1Vn\0mÇº½¤œf±g¦¶=µ7\n…\Â¥@\Ğ\\\îŞƒ\Íp\Ë\åòqiûBl³˜Bök\Ê€ \íş÷\í\í\èûÆwD\n\ØùÕ·ò,\é\ëM1\0`(mû\ï\ß?\ÃM\á:¹z\é»\×F\Zõ%@\ĞşO\Ğ\ÆYÁ\ß\Zvğ³ƒ\Û]\å\îG>ò‘SÀ®‹¹‹Å™\Ê€ }o\Ğ>;\ì×»E={€À\íğ\ë8\âˆ\'xböÿğ¿:\á„~_y´\ï]:şV5@³n}\Ğ\ÖÚœÚƒ¸\Ãò\Ûi\n\0u\Ğv¤õ{°\Çkz}§)\0\nA{°À=¬‹A[ÿ{ö\n\\\0m\×wW7‚¶}\àNUz\0m\×·;A[cI€†pt5$Wvóû\ë`F»«zw,¨~\ïÑ\n\0\Zaf\Û\Õ%\İŞ\Ù^\æ)\0 ‘·¯\Ù\ÖöN¶„€À=H\Ğ\ê\ÙÈ‡t>\0*\Û\ÑYÂ½õ>\Û\Öa\ÎB€ı\ÇR\ë±\Ç;H\Õ\Íhg)1\0ôò\ŞÈ‚\0<Ã­\Ü9ÃºvÕŸú¯ó~Z\08\È·\'\ÇX-\0\ä˜=½ğ<\04\Ü·;Á)h\àg¸]YRn\æd(\0\Èm†[;\Æ+h ‡À\í\èı¹\0@wj]\Ğ\Ú\n\0zYm&»p˜«÷\0@~3\Ü\æ\æ\æL\Ğ@ªa\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0a\0[\0¶\0 l\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0[\0@\Ø€°\0„-\0[\0¶\0€°\0a\0\Â\0¶\0 l@\Ø\0\Â\0„-\0 l@\Ø€°\0„-\0[\0¶\0€°\0a\0[\0¶\0 l\0a\0\Â\0„-\0 l@\Ø€°\0„-\0[\0@\Ø@Áº>\Âõ m›JÀ¡‡m\ëÁÂ¶X,\ÎT)\0\èY\àn<@\Øn>|ø\áª\09\ÍnK¥\Òe*\0½¸»\İfV\09\În«€\Ş\ÜW\Íj Gi&;¶.l§ª\0\ä3»­»5«€^\Z3\Ø\ÔW\ßş³«\İq\Û=©½\Ú\Òr¹|m[[Û‘ª\0]p\ÒI\'}\"\è\Â »»°{TıÛ€ö‹Å•\éöoT\0:™É¦°\\B6\ëN\ÈvÒ–š\é@Q£F}&\ÍHw´\Í3\Î8#›3gNö\àƒfk×®\Ív\ìØ‘…¸İ°aCö\È#d\ßù\Îw²‰\'v´\ãöB¡ğ\Õ \á\ÅY\Æ---{\ëƒò‚.¨\é={²®Z¾|y6eÊ”ö¡»\Ïûqhø ­_6N¡›ÍŸ?¿[!\ÛŞ‚²¶¶6`\0@,§ \İW¿d¼jÕª¬7¼ø\â‹\Ù\ÙgŸı®®%e\0\ZJœUŒ6‚6Áö¦øyõ\Çp4@Ãˆ³ë—{kF\Û\Ñ·İ’ò/U€!/\ŞG[œ6\Ñ\æ)\á\Ö¿\åk\Ï\0CZlXQ\Öñ\îİ»³¼M<¹~9y¥g€!+\Õ\Ö\ïo\ï\é+V¬x\×NS©\å\Ù\0`HŠ·\àÔŸÕ“·øtWı\Æ±—²g€!©zQJ\à\İp\Ã\rY_š7oŞ»¶sôl\00T\Ãvc-ğbÆ¾K\ÖuK\Éoz6\0’R\È\í?^»nİº>\r\Ûx\ßmı\åù<\0Õ™\íşÀ«]T ¯\Ä\ï«ÿı\r\0†|\Øöa€™­™-\0ôŒc¶\0ÿ\Ì\Ö\Ù\È\0s\ØzŸ-\0\ä)\Í(/\ë¯¤\Î9\ç;H0ô\Å\Ş\Èq¼\Ô\Ş\È\0£¸¦lıUúbv;e\ÊWı q\ÄõlS\è\ís=[\0\Èwv»ÿD©–––lÕªU¹\í‹/¾˜|ò\ÉõaûK\Õ !´µµY,·×Ÿ,\ïƒ\í\í÷Õu\ÖYõ\Ë\Ç\Û\ã÷ª>\0\r£P(|¡~99··f¸1£­\Úø=ñûT€F\Ü\ë7–”\ãnONšŠc´í–cV;Sµ¸u\ág)/_¾¼\Ûo\ï™6mÚ»B6~® €_\î\ê\á\Ö/-\ÇNS?üpe/\å\Ú\Å\â6\ÉF \Ç\ÎPõV\Ô£µt\0u\â\ä¥ú³”{\Ø~\éd(\0\èD¼7\ÍJ­\ßiª+-v†Š\r+\Ê\åò?«\"\0tAl\íX\İK9f»\ë/\ÏW·\í\â›qQ\Ø\ë\ØŒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04ÿø\æ|kLi\Ô\0\0\0\0IEND®B`‚',1),('8',1,'/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\ë\0\0\0tô«\Å\0\0B¸IDATx\Ú\í\rpT\å¹øS>Tj¯W;¶\\\Ç\é8\Ş\Ş2N‡\ë¨‡~(M\íĞ–2%\ÉYv7‰© TT\naô\Â\ê~p«W©Èˆ­¢c¿ş•\ÖT\rb ¢€H\0E@\ä+$ òd\ÏÿyÖ³\é’\ì&ûqv÷œ³¿\ß\Ì3»{\În>s\ÎoŸ÷œó¾oA\0€W™üTù«ù+Ã¡Ï»\Æÿ[û\é™ğû®1…¿JL˜<ÿ-³3¬÷	o\êû¦<³2$\Ï\'\Åú=d\0²\Â\á6óÈ“•;\ÚDF·JÔª€\îyöÿBSŸ[­‚z[\â\ßõ}şµ¡}\ÊüZ]ö\æ=\êB*ºp¨\åµ,ß¨\ïkj5÷>ø—[\"\ï‹Dø\çF½\0 \ã<ø‡÷\Û\ÃÕ—%«\ÉO\×F*±~ß¯_~O\Ş÷\Ö?\ß÷ÏŠmvôû\äõ4‰m\Zs_\Û}Æªø¶Åª\æ\0\0lC…#MP­¢\Ş?GjS­	Eš“[šò¹¼öO‰\È\ìé¨°\Şõó´Éºa\ê\Âú]¾öP¨©\ê\ã³G\È8\0d‘\Ï`­¾¦ˆœ\"\ÂR=ğ\Ê\Æ]6ù·+M\ë}·L~ú-\Û-\Ñï“¦©.Û£\Õ]\ç\Ï{:¼l°Vz\áM]P\ßA\0²\ÂÃ¯\îl±š‘÷FWlz R¹E\Şk½\ï\ß\Îm®~.DWôû\"\Ï\ç-\İw:¼\ìs\Ùı€LWk_\Úq\è\ìK:õz…s\æ\â-g-\Õÿ\×ó\ë:\æşùıöVbáŠ­~ú¢w\Ú\åñÑ°\0UjÏ¬\îøø¤yÀzß¿Eª7\ëõ£§Ms\×®ˆ@–\ÄöS•’V]ÿõ\â¦6\×S¯\ïl;2?ı\ÇZµ©)\ïyZ\â¿;«³ß®ı÷‹\ïvü÷\â\rŸ_¿24\å·a1nŠşy¿]\Õx²\Å4w.z\ï³\ã*\Ìÿ~¹\á¬u\á\ài2\0™\Û:1×‡òø}QøÜ™\Ş\Ëuš°°~\ÏÙ“/\Ô\îo•ç¿¼\çÙ•¡X„­]Ş¯D‚\á+«]~™\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;1Mó\â¥K—şmşüù\'\çÍ›º\ç{ÌŠŠ\nsÌ˜1fYY™9e\Ês\æÌ™g\çÌ™³Ò¤I¿\"c\0\àX8|é¥—ÿò—¿4\'Nœhşş÷¿7\ß~ûmó\àÁƒ\æ™3gt€Wó\ìÙ³fSS“¹n\İ:ó\å—_6\ï¸\ãó®»\î\n\İÿı«ü~ÿ@²\0N©\Ğ\Ö\Ô\Ô¾û\î»M©\Ğ\ÌÍ›7‡–(\r\r\r¦Tw\æ¸q\ãL©\î\æQ\0\Èy•ö¿ÿû¿¡É“\'›7n4\Óaûö\í¦4M\Í_ü\â‡¤\éz1\Ù€¬s\âÄ‰I3g\Î4Ÿz\ê)óøñ\ã¦h“UŞw\ŞùMS\0\Èz¥¦R{\ì±\Ç\Ìööv\Ón,X •Û§………m\0\È8zNM›ŸZYeBj|òI³´´t€Œ£\nôœš]\ÍÏš¥w\ÜqGHš¤“\É:\0d´	ªW?õ\Êg6\Ğ\nÁ`°ƒóm\01ô>5½¥#›<ø\àƒgÇŒSIöÀv´G\Ş|›­j-Â¶m\ÛL©\ØÚ¸\0\0¶³|ùòh‚L^0ˆGEEE‡\Ï\ç\ÇV\0\0[Ñ¾Ÿ\ÚM*<ñ\Ä§¥9Z\ÇV\0\0[\Ñ\í\Ú÷3¬Y³¦]Ä¶—­\0\0¶¢£th‡ö\\pøğáˆ­•­\0\0¶¢CEF\é\È6Ú©^‡=b+\0€­¨Xr	b\0Û¹õ\Ö[sY±…\0\ØÎ¯~õ«œckjj:\Ë96\0°Y³fµ\æ\êª\èÒ¥K›¸*\n\0¶óÀ\ì\É\Õ}l3g\Îl\ä>6\0°I“&ı\\\ç(\ÈE\Ï\íRE\Ï\0È”\Ü:²\İW´¾¾^›¡ô€\Ì0cÆŒ·üñ¬ŠmüøñŒ\î\0C\'Y¹ıö\ÛC:³T6x\çwkµ\Æxl\0Q\îºë®™:\Ød¦G\Ğ=}útG 8\Ëº\0\î¸ãƒO<ñD&/$„\äw4ù|¾]d\0²‚È—\Ê\í°Ntœ¹\é\ÌğŸ\è}k\Ì/\n\0Y—\Ûøñ\ã›ş\çş\Ç<u\ê”m\Í\Ï;\ï¼S/\ì\å¼\Z\0\äLneee»&L˜Ú´iS\Ú\nôœš6?©\Ô\0 \ç\è	ş\Ò\Ò\ÒöY³fµ©\à’i®_¿¾Y\Ï\ÙYW?¹P\0\0\ÎA«,©¶ş¬UWyyyhŞ¼y§W®\\\Ù\Ş\Ø\ØØ¡\ã©EF\é\Ğ\íË–-;¬İ¤´G\nM\ïS£\é	\0FDU&Q-±Gd§ó˜QÑª\ç\Ğ$êµ›=\n\0ÀÍ²3‘\0xNl%%%_&\0\à¤\Ù*//¿œL\0€§\ÄVQQñ\r2\0^jŠ\êl\îƒ\É\0xIl\íÁ`ğz2\0^[›aC\É\0xIl­\Òı™\0\0\Ï Rk	£\È\0xIl§ƒÁ L\0€—š¢\'µ«™\0\0/Ul\ÇEl·“	\0ğR\Åö™\È\ín2\0^\Û‰©d\0¼$¶f‰d\0<ƒ4CÀd\0¼T±\í—x„L\0€—\Äö‰\ß\ï‚L\0€g©\í–\æ\è3d\0¼T±\íXD&\0ÀKb\Û&±˜L\0€—Ä¶%ü‘L\0€—Ä¶Q\â¯d\0<ƒ\Ï\ç[\ç÷û_#\0à¥ŠM\'H®\"\0\à%±­’XA&\0ÀKb[¡r#\0\à%±-\Õ\æ(™\0\0/‰­Rb-™\0\0\Ï`Æ«~¿ÿ=2\0Ao\Îõù|\ï“	\0ğRSt±v«\"\0\à%±-Òğd\0¼\Ô] M\Ñ]d\0<ƒ\ß\ïR*¶=d\0<ƒTk\éğ\àd\0¼\Ô}@\'t!\0\àt\ê=‚L\0€—\Ä6U\'M&\0\à%±M’¦\èQ2\0Á\ï÷O8N&\0À3†q«Tm\'-\É\r”¸¡¨¨\èj2\0n©\ÎJ³ó´ˆ¬M¢CÂŒµd\0\\ƒH«®¡i„Æ{™\0WUm=UkŒ\Í\0®”Û’xb“¦\ê 2\0®¬\Úbc©m ;\0\àZtT®bƒ>2\0®ÆºB\Z\Û^2\0^h’NˆMŸ“\0ğJ\Õv\\\ÅF&\0À3X£{ 6\0H\Ó4/Øµk\×\ŞúúzsÅŠ\æò\åË‰¢ºº\Ú\\µjUHb{@Q©\Õ\ÕÕ™MMMfkk+‘F477›µµµ!‘\Ü<ö,€¢•\ZR³WnRÁµ²g\äm~\"${C›¦\ìY\09DBd„\Ø\0òRl\'?;h\îZ÷{³¡ú\×\á\Ğ\çº‘!6\0WŠ\í\Ä\Ñıæ–¥3\ÍM¯\ß{N\è2]‡\Ì€\ëÄ¶·\áµnR‹Ä¾†Jd†\Ø\0\Ü\'¶mo=\ZWlº™!6\0×‰m\Ëò\ÙqÅ¦\ëb@lˆ\r\0r-6½\n\ZOlº™!6\0×‰m\Ç\êùqÅ¦\ëbpØ\ì\ßlnY6«{3T–\é:d†\Ø\0\\\'6\İ\ëw›.Cdˆ\rÀbki1w¬YĞ½*\Ët2Cl\0®›ö,øpõ\ÓqÏ±\é:z 6\0wˆM*±ƒ;j\Ì÷«\î+µH\è{ô½Toˆ\rÀ±b\ë­J£zCl\0®[\"UZO\ÕbCl\0[ªR‹bCl\0\Î<\ÇF 6\0\ÄF 6\0Ä†\Ø\0\0±!6\0@lˆ\r\0±ˆ\r\0±ˆ\r\0±!6\0p¨\Ø\äc=Fô{n¼ñ\Æs>«¯£ß—\è\ï\éß¿¿y\İu×™n˜¹±¸¼b‹\'©h)mÜ¸1¼lÃ†\r\İ˜\èÏ®««?¿ò\Ê+\0\äVl\ßû\Ş÷\Ìq\ãÆ…—M˜0!ü:±E^Ÿşù¯\Íòòró\Â//6l˜¹{÷nóÈ‘#\áeƒ\r:\ç\ç\é\ë˜\Í\ÍÍˆ\r\0±¥.¶\Ê\Ê\Êp3ró\æ\Í\áG}Š\ØV®\\~>bÄˆ\Îõ\áe«W¯6·n\İ\Z~>dÈğºÉ“\'‡_¿ù\æ›\á\×Ë–-¿\Ö\åTl\0ˆ--±\éóÁƒ‡«%}\ì\é3½\Ë\Óf\èÎ;;\×k•\Öõ=}ûöı|š;\Â\Ïü\ã‡_ë£¾\Ö\åˆ\r\0±¥-¶E‹…Ÿ\ëc*b\Ó\çS§N\r?¿é¦›º‰\íØ±c1?_TT^©\Öô5\ç\Ø\0›-bKf]¼÷8q\Â8p`øu\ä\Êh¤):}úô˜Ÿ4_#Ÿ\Ó&kO\ç\ïzz\Ø\0›\íb\Óxè¡‡Â¯‡úù´€G˜\'N4/¹ä’¸W[õ]ö\ï|§\×ˆ\r\0±ˆ\r\0±!6\0H™1c\Æ4ú|¾\í~¿‰\Ä\ä±c\Ç^\áT±\é€X\Ø\0 «\Ø6I˜\Ñ!‚\ë\Ç3{DzUs‚Á\àõUUUTYˆ\rÀù†1­«\Ø\â\ÄY½²x\ê\Ô)„„\Ø\0œ\È\êb‘VG/R;\ã7bpMst<©I³ôN9Ç†\Ø\0 G‚Á\à7¥ú¼\È\ë€D(\Ô^ŒşbCl\0Cš“£¬‹\Ç%TfŸ\È\ã3òxK©\Í\íúyÄ†\Ø\0rNaa\á\"¨{D^ô\ä¿<¶Il\Ô\ãÇÿb—\æ\èÉˆ\Ôô*h¬Ÿ‡\Ø@N\Ğû\ĞDNOK|l51OŠ¨–\ËcqOŸ³*¹Ä¸x\ïAlˆ\r kHUö}½ÁV\äõ©%§F=?VTTtu¢?£¸¸ø‡òù²Şƒ\Ø@Æ˜={v?‘\Ğ\íkDb-zC­ö”””|9S¿±!6\0[)++ûª\Ğ™}`\İw¦=şO–ı\\V÷\É\Æß€\Ø@Úˆ¸®q½,‡¬«˜G\äõ_$n\È\Åßƒ\Ø@JƒAq˜¯\Æ:\é‰\í–x¢¼¼üò\\ÿmn˜\Î±8€’’’/ûEb\ï‹\Ì\ÚEbg%\Ö\ËóI²\î<\'ı­uuuMMMÉ¦Ø·o\ß[+Gx‚ŠŠŠoˆ\ÈJ\ì\Ó[2Dd\Ç$^Áı\Ô\ÉwMM\ÍÃµµµ¡C‡!&¤V]]\İ&1#\Ü\\™ı\Ä0ŒˆÈY÷—\í™=\'r\ä¦ÿC\Ä9Reœ\Ô&”SCo2vò\ßgE+R7Š\ì<‘\Ö\İ\ë\ä@k\Õf¦\Ä‰Ã‡¿ˆe®i¯b#\06¡\'ø¥*û\Èl—u£\ì)9\ÈŞ’\Ê\ÌOv²\Ã\èÑ£/ÓŠ˜L\0¤Aii\éwE`–ƒ\é°%³&yşŠT\ß\";\Ù\Ç:‰\Ø\0’¤Te·Š¼ê¬›dõf\Ù\èM´¤\'·kt›	€^\ĞnJ:\â…0\Û,‘µH\ÔKs‚vo\"C\ÎAo^–m\ÓF&\0b \",\È­e?•\ç“j\íd\Ç\Ñ\Û\íGz±†L\0Xˆ´n–ƒb™\Ä	ë–Œ=ó{š’\×­§\È\ä-:Ø¢S%6jóEC*³÷tY×Á5M\ÑR½\ZM& ¯(++»R«0«\ZY\Õ\ÙR­\ÖÈû\Ñ\áœt\ès2\Ç\ZDñoòm~\Ô\Z%ã ?\Óóhd\Çs\Ûd\İ\Îd<‡^©”\n\ìz\åÒº‚©W2·\ê•MG“y\Ù\î÷‰\Ø“	ğJó«\"®\Çô2QV\'ù•X¥÷œdi F\È=:Š°N&ÀµƒÁ\ëõ.‰&ë–Œ\ÃòüOòü\Ûd\'o\Åö¸šB&ÀUˆ¸\ÚÿR\â”\Õ\Ä\Ü);ò<\í#Hv 2C™\0G£#aÈ:\Ó\Z£\İ\Z)c­ÄNˆ!¶Ez:‚L€\ã(**º\Ê\ÚA÷[·d|&Q©w•“\èEl/\é…\"2N\Ù!GH¼¡£\ÉZ·d\ì•\Çgu´²‰¢“\İ\èl÷drBaa\ázÏ‘\ì]\ç_\ïú—r³^®\×Á\É¤(¶\×tpO2Ù¬Ê¾&;Ş“:ó’\Õ\Ä<)±Bv\Ä²6\ícKu\"i2™ş\ÕadşªsbZM\ÌC\Öyk\Éd@lµzÕœL€\İô‘\ë6‰\ÕQ1\ê\ì\å9òR\Ò\Û\Z­\Ú\È¤\nK*³U`\Ö]ÿ*´5R¡c F\Èra½a\'\ÖÌ‹%\Z­&æ§²C½*1”\ì@+¶M:™€dvšb‰jë¤¿\Ê\ìcÙ‰Ò‹d²n\Õs¸d\âb\Í\Ñ8\İúÔ\Ï\Ê\ã©Ê¦\è\í\Zd(¶t\"j2\ç \âúº43\ÈÎ±\×\êX~\\«Df#\É¸@lkQ2z\Âu˜\Ş\Øhu]\Ò&\æ~\ÙóÚµ‰\ì€\ËÄ¶_‡¯\"ù\Ù\Ä<OD6Q\â	\íT\Ş.;CƒTj³ˆ\\.6½˜5‡L\äOU6PÇª’Ç¬{\ËN\Ëó•:ùE1‚\r\ÒÀ£g\Ó1ù´[\Ù\É¬¡L‰f‘\Û\åqYˆ­\ÊÚ¯»…u’^ğjeúDo—\è&Y\0/¡§M¬\Â\Íb-™Bl\0nÛ¯+{›6W\Ébp[stu%?–\Øj\Ébpë¾½6\Ö96Î­%‰iš\ìÚµko}}½¹b\Å\nsùò\å\İ\ØNû›ª««\ÍU«V…$°WAªŸv›\ß\ï‘\Ì$‰J­®®\Îljj2[[[‰4¢¹¹Ù¬­­\r‰\ä\æ±gA\ZM\Ò]Qb;K—¿\ĞJ\r©\Ù+7©\àZÙ³ UŠ‹‹%¶?‘‘\Ğ\æ\'B²7´iÊikkT±=šsk© !2Bl\à8±•‰\ÔL&Ê°\ØN~v\ĞÜµ\î÷fCõ¯Ã¡\Ïu\"Cl¦I\è~D_\ÑL‰\í\Ä\Ñıæ–¥3\ÍM¯\ß{N\è2]‡\Ì\Ø.µ\Ä\ë¹eBl{^\ë&µH\ìk¨Dfˆ\r\ì—ZDf3[†Ä¶\í­G\ãŠM\×!3\Ä‘Zo\Ë!±mY>;®\Øt2Cl1©u]?ƒT!6\Ä^Z\Í\ÒˆM¯‚\Æ›®Cfˆ\r2.µh¹uP¹\Ù ¶«\ç\Ç›®Cfˆ\r²\"µ\è\ÏuP¹¥)¶#û7›[–\Í\ê\Ş•eº™!6Èš\Ô8\çf—\Ø4v¯_\ÜMlº‘!6H[j:O\Çs½\Ï\×\Ñõ}œsKKl--\æ5º7Ce™®Cfˆ\rÒ’\ÚŸ÷2ø ¹\Å{•[*bÓ®~:\î96]G\ï\Ä)7?Ÿ³deö ·h©Eb¡\Í\Ú<›TbwÔ˜\ïW\İWj‘\Ğ÷\è{©\Ş$}N-–´¢\å\Ö\Ûúš¥	Š­·*\ê\r±-R\ëMnı”Zô\ï\áji<±%R¥õT½!6\ÄI7cÉ­5	©u•\Û\Ä\Ö\åÀLUj‘@l½‹Mg³\ç˜Gj	\È-©\Ñ,\íõ‘±©\ĞÆŒS\'q’\ã\Ş\Ó\\a	©!\É\Ïõ‹Q©µZË“¡\Êú\ìˆÈ˜\ØTh>Ÿ\ï\Ï\"´vk,ûvıÌ£#Ğ–——_^TTt•\ä|ˆl‡a@`´a·\Êó‰ò8M¶\Ë‰y²|¼\çg@Ö½&Ë–[_Bk\åùFy\Ü&±S\Ö\í•×òxX^¦_Rg$Z%\Ú$:\"óƒ\Êû\Ì$š…vWls©ØˆŒ‰M€¹]§Uóú¾¥³+©\Ğ+**¾!‚ù–H\ä\"Q²¬Tb‚\Ä=òz–üI>\æ\Ë\ë\ß\Éó?\Èó¿I,•\×+\åõ\Ûòø<6È²$öH”\×Í²ü¨<?!\ÏOÇ’JT„¬ü\ë—\ÊYKB*£cG¬ùöZ³C} ›%\Ö\Éóÿ“¨–¿ûòù¿\ÈóÅ²üYyıù»\Çû\äõİ²\îç²®Xÿ¨´´ô»ò8X^møğ\á\å\à\Û.  ¶ŒŠMvø\É\ÖAkfïŒŠmö\ì\ÙıFyiYYÙ•r^#\áPù#\äoò\Ë\ß4Nÿ6y=C¥+¯Ÿ’\ç‹\äù\Ëò¾W\åùoI\ÔK¼+±E\Ö}(K\ì—h’øT–—\ÇS-–0\Úur\ßXşF¤\"\Ï[$NYŸıT7Y?s·õ;¶X¿s¬«Ñ¿Eÿ&ı\Û$“xR–=lı\íš\ßqÁ`Ğ§óq\êÿ¨ÿ«ş\Ï\"\Ò/k\\r®\ÍÎ«¢Ü¬‹\Ø2\'6«‰bör`>(ñ„œµ\ZĞª@«y¾Bbµ¼^¯ÕƒVò|·<\ß\'\ÏYUÆ±HHÖ…¥bU%İª«Ši³¤¢=aU;\Í¬*\è#­Š´:²„V+¯«´z\Ò*Jş®\ç\åù\Óh•¥Õ–V]ò: \ëF\Êó\ïkU¦Õ™ˆ\å«òü<\Z\Â	]­´\ë>¶2®†\"¶lˆ-‘8(ñ‰HA›X\Ûô<<G¯’X¦\çyô|÷‘uÏˆP\×óAz^H\Ï\éLFòüfk\Ê!ziô\èÑ—?ş‹\ìÙdFŒŠ\ÊÎLÔ\Ø2\ß\ÕfR—Y½\Ï	fø\Î\Û\Ê-}E‘š›\Åù\Ær\Ó\Å«¢ª\ï\ÚL”ª\ëöÀ¼®Ü¢å¶° ±\Ñ=¢\ß\Çıjvˆ­ öe\èsd³zõjóšk®1\Ï?ÿ|sÀ€\æ\ÕW_}\Î\Ï\èm½\ÅAª·A\Ö\íˆ\Ê-\ÍsbH-[<Á\\u\ÕU\á\å›7o6›››\ÍI“&%µ\Ş\Ëb‹PQQq±˜/**ºš=Ê­ µt‘Z6\ÅÖ¿ÿğò\íÛ·\Çü\\o\ë»ş\Üx¯#ñ\Ío~óœŸ\Õu}¤*¼\ì²\ËÂ¿{\àÀ\æ+¯¼B_Qp\ê97¤\æD±\r6,¼\\%r\ÓM7™³f\Í\nWf‰®\×u}ûö\íUlK–,1ÿş÷¿‡Ÿ>¼\Ûz•\×\îİ»;_¿ğ\Â¯¿ò•¯ 6pZ\å–H³´¬€¹[cc£y\ß}÷™ƒ\î|\ÏĞ¡C^¯¯õü[ob;s\æL8\"UY¬õ±^«43İ”El\Ê-rN©\åBlÑ±~ıú\Î\ê,\ÑõÑ¯#\âJEl‰¾Fl\à¹Åºÿ\r²)¶[n¹Å¬¯¯?ß°aCø=Z%º^›‰ºlÇ\æ\âÅ‹{lŠVVV\ÆmŠ&ò:SDl`ƒ\Ü\Â\ë×¯\ß\Ìz\ä^l£F\n\ËI«.mRj3s\ãÆ	¯\×sa—\\rI\Ì[Ib]P)Æºx€\ØÀ\å\ç\ÜB}ûö­5\Ã¹=JJ²$6±A\Æ+7³¤¤$¤]\åHbCl\à®°.A*bÏ £\Ä\è˜od±!6ğ’\Øö\ë¨.d±!6ğ\Ö\ÈÁ¯	Ä†\ØÀK›š°‚L 6\Ä^\Û_u\0R2\ØxIl:û2\Øx^\ç¸ ˆ\r±gfh‰N\ØC&b/5E¯\Õ—\ÉbCl\àt&û|˜\\±!6È¿ªM\'ú\Z™@lˆ\r¼$¶³:\Ó™@lˆ\r¼$¶·“‰$X±b2Bl\à`|>_£\ß\ïL$A]]]GSSB²)ö\íÛ·G\Ä\ÖÊ6VlH¼@&’ ¦¦\æ\á\Ú\Ú\ÚĞ¡C‡“\rR«®®n“`\Â\r°Slõ:-™H9\çH•qR›PDZÑŠ\ÔÀn¤úš\Äz2\á­óÇ»\Ş\Ç#¯\×\ê²\â\â\â\Ñdò\àX(ûûN2\áÀ˜†a7\ë²\Â\Â\ÂôNlky#Y‚<hŠÎ”h& ¢¢\âbÙ˜m±EF8o¯yQ\ËL)\Ñ\'“-ğ¸\Ø\Ê$N’	ol\Ì\ÊhiƒÁ\ë\åqo—\å­*A2^E¾¼o/ô62\árÆ{ETs³3¤iº6\Ör=\çF\ÖÀ«”••}•ş¢@¾6Ä—iõ™‹µ¼ó€G[0\æÈ‘#/%.Eû\ÄÅ“WO!2<MöÀ\Ãbk+--ı.™p\ïlNElVT’Ağh+\æ”^D .Äº8pD/XWD\Û™vŞ«\ÍW¿ß¿„,‚‡¿ğg’	\ï|S=«7\'Š´\æ\Êó§ÀoD€·\Ë\ëòšqª _Ä¶So\Ô%\ŞÙ /Il³®\Å0Œ‘d	¼v©Ò®Ud\Â;t‰\Ä{qÄ¦\Í\Ö\éd	ò \åR¥\áÉ„w*¶¥k\â¬ûHbY‚<8^\Ğ\á‹È„w6\è*‰qÖ­–o²\åd	ò\à8xX\â ™ğ\Î]\ï6@ ğG[Y¯\ã÷û\'\èH7d\Â;\ç\ŞW\Åû\Óa“\É\äØ†Iœ%\ŞÙ \Z†ñ|±\é¨§\Èx«ÿtˆLx§)ºG\ï_‹\Ó½†Y²!S\'P&\ŞØ˜\ã\Í\Ğ3{ö\ì~º±ÇÿE2yp,tÈ—ùPk£q:6!Cv¹wc\î\é^5Y\×.ø\Ûd\n¼„\ì\Ósd\ß\Ş$qÀ\ê6\Ø&Ëºu\'$S\î\Û1ù†š\Ø\Ãz&“\Ï!•\ÙO{\ë\'M\ßhw‹\í”lÀ\Ò¾\ÙöiIN¦Àƒû~e/Cu\r\"K\îİ¸-#zX¿\Ñ0ŒW\Éx\r\è!Îˆ\Ñ*µ]d\È\İbkÓ“¥=lü\×\Z¼Š\Şg\Ä\èid\Ç\İbë;¸‡\rÿŒ¼\çc2>\Z»^4\Ği(ÉŒ»7jhô\èÑ—õP±M–÷|F¦À\ÃM\Òº\Ì÷ÁÀ›\ÙÓ·“v5‘÷\Ğ\Õ¼~t^H\à\Ş5—£7\Şö6\í˜\Î\Ü\Ã\Ôd\àuTfò%\ŞA·*P^^~¹ÿHsU\Ş÷u2^\Æ:ŸŒ\Ø<°!\'\ÒT\Şs&Œ&c¦i^°k×®½õõõ\æŠ+\Ì\åË—)Duuµ¹jÕª\ÄöªX\'M\Û \Î\à3ƒŒA:¨\Ô\ê\ê\êÌ¦¦&³µµ•H#š››\Í\Ú\ÚÚH›ç»¢µ\è\rº	Tl\è\Ğ\Éd\ÒA+5¤f¯Ü¤‚ke\Ï\ê^±•\êD±	ˆm•¼¯†ŒA:hó!\Ù\Ú4e\Ï\ê.¶‰\Ú	>÷½,\ï\ÛF\Æ ô DFˆ-M\ÑûtØ¢Î±Í‘h\"c\r±üì ¹k\İ\ïÍ†\ê_‡CŸ\ë2D†\Ø\"Ñ™y¤bó\ËûN“1È´\ØN\İonY:\Ó\Üôú½\ç„.\Óu\È±õŠ\ÕxOo\ïƒ\ßdˆpÈ†\Øö6¼\ÖMj‘\Ø\×P‰\Ì[B\ç\Ø~§“¹$ğ\Ö>\Úû`øğ\á‘5È¤Ø¶½õh\\±\é:d†\ØiŠşIª¶\Í	¾·\Í0Œ¡d\r2)¶-\Ëg\Ç›®Cfˆ-YU&:ÖšTv=!€\Ø›SÎ±\Õ\è=j	JğÛ“d\r2)6½\n\ZOlº™!¶DdU/r«Jğ½\ïJSô\ïd\r2)¶«\ç\Ç›®Cfˆ-‘\æ\å{‰\Îg \ï}M\åF\Ö “b;²³¹eÙ¬\î\ÍPY¦\ëbK¤\n\Û*ñR‚\ÍV½5\ä²™›\Æ\îõ‹»‰M—!2Ä–\è9¶]@`A‚¼S/ 5È¨\ØZZ\Ìkto†\Ê2]‡\Ì[\"b\Û\'b{<Á¦\è÷\â U±iÏ‚W?÷›®£÷bKDlM\"¶Y‰¼WoÎµ†\ïC\æÀV±I%vpGù~\Õıq¥	}¾—\ê\r±õT…\ÕY¨’8\'\×QTTt™»\Ä\Ö[•Fõ†Ø’F\çO”¸-‰÷Ÿƒ>2v‰-‘*­§\ê\r±!¶X¢:#QœL\ÓU\Ş?›Ì]bKUj‘@lˆ-VSô¬\Îš„·%z{@\Â\ç\Ø\Äfs\Å\Ö^RRò­$\Şÿ–ˆp%™Ä†Øœ,¶¤\æ©½¨»9@lˆ\Í\Éb3¥bûrïŸ©Sñ‘9@lˆÍ©ôIö¾4½Ğ H 6\Ä\æH´R³Ä–0\ß\Ğ\æ+\ÙÄ†\Ø‰[KER\É6_b\Ë\ZÁ`ğz½*š‚\Ø\ÎÿbClC\ï_SI¥ ¶\Ï$&‘AÈ•Ø–-[f~\ï{\ß3}®Ë¢\ß#¿.7\Şx\ã9\Ëõud]o¿\'ò>şıû›\×]w\é´\Ù\ì[wA¥t!@>ó±\Ä|2¹Û›o¾Maa¡y\àÀ³±±1ü\\—E\Ë-ZJ7n/Û°a\Ã9\Ë›>¯««?¿ò\Ê+›\ÃÏ±Ó¾¢)ˆm­aÿ ƒ±E*®úúú\Îeú¼ku‘’Vs\ãÆ/›0aBøu*b‹¼>ÿüó;_«T\Ë\Ë\Ë\Í/¼0¼|Ø°a\æ\îİ»[.9M‘\æ\è§)4a—ˆ\Ü6’AÈ…Ø´I\ØUJgÎœ	/\ÓfiW)UVV†?³yó\æğ£¾NEl+W®?1bD\çúŠŠŠğ²Õ«W›[·n\r?2db\Ë%:›vjOAˆ¿\Ñ*\É ¸Alú|ğ\àÁ\æ AƒÂ±*±DÎ±Eš¡;w\î\ì\\¯UZ\×÷ô\í\Û±\å¸):/AI\Å6!•&,€b‹4%×¯_ß­)ú\ï|\'¦\Ø-Z~®©ˆMŸO:5üü¦›n\ê&¶cÇq\ÍAb{Vµ3\ÙÏ•––~7•\ÛD\0\ì›^ P™\èù¬\æ\æ\æs.,Y²$\îù±Î%\"¶\'N˜¿\\4E§OŸğ9º^#6\Ğ\á‡t–ªd?7~üø/\êMº³g\Ï\îG!\Ûb‹\ÈM/D*&m.^¼8ay¤xñà¡‡\n¿:t\è\çS9bNœ8Ñ¼\ä’Kb^mEl9@/è¼¢)JQ‡¿š,B.\ÄZ-E73¹A—Šm©Äš?{J¤XJ!\×b\Óz\ãì¥—^šõ[-›3Å¶JbEŠ\ç\ç\ZEl’EÈµ\Ø\Ò\rm\Î\Æ\n\Ä\æ^±­•¨LQl\r ‹\àv±Q±y\Óû@\à)J±Zb5YÄ†\Ø…4%?4\ãùT>«Ÿ±}D±!6§5E÷H\ÕöTŠb»O>„,bClN\ÛÁT/\0Hv”|¾…,bClN\Ûa‰\é©|v\ìØ±WHµ\Ç\á€\Ø›\ã\ÄvL*¶‰i|Ş”\Ï$“€\Ø›“Ä–\ÖM¶òùÖ’’’ŸI@lˆ\ÍIbk‘‘\ê\çu,7‰{\È$ 6\Ä\æ$±µ‰˜nHõó>Ÿo—B&±!6\'‰­C\Ä48\Ï\×\Ë\ç«\È$ 6\Ä\æ$±…F}Y\ZMÑ¿ˆ\Ø6“I@lˆ\ÍIb\Óú.H£)ú˜üŒd\ÅiS\×!6,2M1\Ş&q’lB¢\Ô\Õ\Õu455!$›bß¾}{Dl­\ìY\å\åå—§{ƒ­5“|Ù„D©©©y¸¶¶6t\è\Ğ!GŠ¢¥¥\ÅUR«®®n“˜Çõ\Ïf\ä\àt¥4r\ä\ÈKµ\êÓ™®ü~ÿ‹EEEW‘Y\è\r9\çH•qR›PN‹@ `:ñ\ïŠ­H­z›‡\Ş\îa\Ãyº¯\É\Ïz\Ò\êP’\Ç\Ït\Èqğ…,ƒ›¨¨¨ø†^P#.\Æ0Œ‘vwb>|øE\Ö\\¥Ûµ\Z”8­#ôj‡y2.h\ÅüHö×³d\Â\İ[©l\ÈS™úù:ƒ•üü»%6H´\é#oKŒ“\Õ}\Ø\à@±c¾\\÷‹m¢v‚\Ï\â\ïó\ë²óh7®v‰-R5NK\çv\0;‘}r¶/&\înŠ\ê@‘‡s$\Õa¯ë·£\Ó\ĞI›%Ñ‹l\ÈaÅ¶0•	\ÄÁY\ßN\ë@“ø;®\Õyt4^\ë\â\Ã\íZVVv%[	²¼/şMO	w;=¥W2ô7©\ÌTjòw\í·*¹#–ô®e‹A\ÄV§“‘	#MÁ\ß\éd.Nıû¬{\ä±š©*¹\Ú|\Õf,[2$¶-©\Î\Ú\ÎÙˆrKv½À \Ztº@½ğ`]€\Ğo\×\0[l<&>\Ñ{2É„»7b¥N˜\ì\Â?½^–\×[G¬[HÚ¬[J\î\Ö[LØ²\Æ1qD¿@É„‹\Ô\è\ínÿ?¬Ù²tò\æS\ÖMÁ\èe{½Y˜­IŠ\í4­\0÷oD\Ï\r©İ¸´;—vë²®°\îÑ¦E:c\ÎA^mtt9rÀ¿\'e÷«^ıÿ´C¾\ì¨/HR\É\ÑQ³®y`#n•x)şW­\Ø\è¨=¡§.\ÒŸ€N\Ä\ä\ãLG}\èŠlÿk\äË±= ¶}²1\Ï\ç\ĞQ\"†q³\ŞFD&\Ü/¶&­\\\È\Ä?¡£~ş\"\Ûz’¢ \î?ˆJL&qóCGıü›ör\ÙO&Ü¿!õ€½L$”+:\ê{ÿ‹\ìE½’L¸ÿ`=#QL&’ƒú=\Ş\Ğó«d\Âı\ßPg\éPt\Ô÷*5\İvd\Âı\ßP\í%%%\ß\"ö@G}\×\Ú\ï2\áş\r©w\ãLd:\ê»\ïx8 \Õ7™pÿ†4¥bû2™\È<t\Ôw\Åñ ı‹\ï&.¯(¬\î#Ü„še\è¨\ïLô\Ô½O\\Vjô‹\Ë=t\ÔwÚJ»U‘	w;}¯õs\Ş\ÕS3_\".&^¯W\îÈ„3¡£~ö¿Tø¢÷F\Ù=L¯Ö‘	\çCGıÌ£U±\æ–L¸¿\ì.ÖdÂ•_Jt\ÔOƒ±c\Ç^¡SOj?\é\â\â\âZ­—€V\Åd\Ç\åè·½\Ş%O&\Ü_y\ÓQ?¥/v­|\Í¡ËY\İ\ä)—!\ßğS\ä€ø”Lx\ê`¥£~â¹ª‹#¶H„\äø¸L¹\ë\Ät™ğ&t\ÔO¨9\Z\êAl\Ì\ïÒ¦\è<A—Lx:\ê\Ç=¶Ç‘Z;º¸w£\ê·ùN2‘_\ĞQÿŸˆ¼&\Æ›^X`Oq\ï9†—t–*2‘\×\ä}G}ù¿[»ˆ­‘«\Ë\îş¶Z¢óŠ’	ˆõ\åÿ«ŒÜ¿A—J¬!‹|\é¨_QQq±%q\Ûn¶¼ûÅ¶J»\è	\è\r¯w\Ôÿ\Ù\Ï~¶M\Å&k[\Ûıb[«e8™€dğ`Gıi\æ7\ŞÈ «^@¯Š\é}MdR\ÅõUj¡/|\á\ïõ\ï\ß\ß\ì×¯\ßlU—#ß²\Z†ñ<™\0;paGı°\Ô$\æ\è‹>}úÌŒ~\r\îmŠ\î\á~\È\à§“;\êO‹#±i\È\Íıb;(ûŞƒd² 9\'u\Ô\ïM^‘õ3\Ør\î\Ûa‰\éd²¼\ßå²£~¢\Ù*7÷\î`Ç´K	™€\\‘\åú\É63UnTn\î\Û)[)™\0\'\áú©;›fÉ\Ê\ÍEbÓ“º#\È8\r›;\ê§{A€sn.[ı\âÀ¤\ÓQ¿«\Ôô¶“\ç\nz¿ı¤\ëû8\ç\æ\"±u\È\Î1˜L€›H¢£~,©} aZ}zZ¬÷Q¹¹Dl!f7¯£şE]ô`Œ\n\ë9KVfr‹–Z$\ÚØ¬…,ˆ\Íd\Ü)ğ\n‘ú7\ß|ó‰[n¹\Å<\ï¼óI@Z\Ñr\ëm}\ÍR‡3~üø/ª\Ø\ÈxŒpECj½É­_‚R‹ş=\\-u\Z\å\å\å—k\éN&ÀkRK@6±\äÖš„ÔºÊsnNA/\Z\è‰W2y&µä–Œ\Ôh–:½\ÍCo÷ \à®°„Ô\ä\çúÅ¨\ÔZ­\å\ÉPe}ö\n6E1c¤Ş K&Àc[¢\ÍB»+¶¹lgTl¥\Ò=E& ›£vc‹ô%¥\ê ±\é|Š\Ç\È\ä™\Ü\ì¼*\ÊÍºlŠŞ§\Ã‘	ğ¨\Üb]­´\ë>¶²®†:‘\Ú\Ã:\Ğ$™\02#FEegÏƒy¤Ø\è\à\Úı„L@5K\í\ê+ŠÔœŠ\ß\ïÿN\æB& O*·h¹-,Hlt\è÷q¿šKš¢’ªm3™€<©\Ü\Ò9\'†\Ô\\$¶J0™L@Vn©6gÁ\ÉHµV£S£‘	È³\Ê-I!5Vlõ\"·*2yX¹%\Ò,-+\àBûğûı\ï†ñ*™\0*·˜\ë;š;+¶­/‘	@n\İ*:z¸i†\î\n\È ·\Ï%Ö¯_¿™ô(p½\Øö‰\Ø\'\ç„+´¾}û\Ö\Z†aŠ\Ü%%\î[“ˆm™\0WnfIIIHg¦\'.\Æ\ï÷•˜L&\0\Â\\¡s–\Ê1ñ}R\ábd#¸L\0t¶bt\Ò22\án±‘(&\0\Ç\Ä‰\éd\Â\İMQ-»‡‘	€N±}\"\Ç\Äd\Â\İ±½¤¤\ä[d ³)\Ú \Ç\Å+d\Â\İbÉ†ü:™\0\è<&\ê%–’	woD½¼ıe2ğ9†aüCš¢\ï	—\"o ŠM‚;¬şy\\¼(\Ç\Äd\Â\ÅH3tœ\Î¯C„“\r€ğ1ñ˜ûÉ„\Ë	£ô\"‚¦K6€¦¨1Eª¶OÉ„7\Ê\ïôk‰·\È\ä3Á`\Ğ\'\ÇÁi2\á\rúMÙ z\×õ¦‚\Ş\'¹\0ğjSô\Ûr´‘	Q^^~¹ö•\rûñøñ\ã¿HF \ß=zôez™ğË†= \Ñ<r\ä\ÈK\É\äz·@aa\ád\Âc”””œ§óJY~œ!\\ ß}¿£¨¨\è*2\á\İ\rü\ÕQşZ²yT±µÊ—ûOÈ„·\åöºL¥³<\ä‘\ØN\è=d\Âûrû\Ş\ë&~²y ¶&‰™d\"?\ä6W{)HL\"\àq±í–Š\í2‘?r›l\É\ía²^E¤¶Y\â\Ïd\"¿¾\Í*7\Ã0\'\à\Ñ}|•\Ä\n2‘•\Û0½  QI6Àƒbû›Tl\ÈD¢#\ï\Ê\Æo‘x›l€Ç¾¸Ÿ¹}D&ò}×š\é\ê½©—Œ€G\Äö \ì\Ó\ÉDSVVöU\\³a5|øğ‹\Èx )z§\Ä12‘\çh‡y\Ùö\è8VÚ‰˜Œ€›\Ñ1\nõ4™€‚Ù³g÷“\á}úˆ~v\àòŠ\íZ½òO& z§¨Õ¾v¥¥¥\ß%\àFt‚#\áƒLÀ9\èÍ\Ú\Ë0Œ‘d\\úm\ê^dº\îó­^\n·‘\rp\áş\ÛÁ¨6oç˜©c[I\åv\Ù\0—\í»-zL@¼\ävıöÁ=I6ÀEû\í1\Ùg\'’	ˆ‹Tl7\ë97ùü#\Ù\07\àóù\ZõF]2=™\âOv˜\Z².\Ø_?Ò®UdzÅš\â\ï´\ÈmcSü³+¶\r\"¶%dB§ø“F§ø\Û\Í\à`±\Õ\èğEdÆš\â\ï Á\Ì\àĞ¦\è_¬\É\ÃGG‘g‡\ì@LñN¬Ø‘}s7™€T\è#r[«SükH8\Ùgi‹‚L@\Ê\Èô†\È[\\\\üC²©\Ø\Æ\éXƒdÒ•\Ûz¯[0ô‘\r\È5:a²\æ@&À¹=¢½\ä\Ûòn²¹DoM\Ò\î€dlÁ0Œ)V,\îú†œa\r\Ê\ĞE`\"µRkt…EdrØ‚1\"4ØŠ4G¤Dr¯‘\rÈ‘\Ø\Úe?ü6™\0[\Ñ)ştø‰z²9›vÿ+!‰\Ê-<ÅŸ<ngŠ?\È&\ÒZ8*û\İ\\ÀAoÿ˜\'1ˆÌ€-\è²sfŠ?\È†aL“ıK‡*\Ò~\ÌgD`!½x\Ğ%\Ú/ [`g³ôK:ÅŸSüA&ª³*®2\ëñƒL\í\è²ƒm‘Œ)şÀvô*|Ob£gdz\\%ß°­\\±‚\ì[\'\âTk»\Èdcü«\ÕtA6À.´K_,±\é98²YÁ\ZZ†)şÀ\îıj{±µq\Ñ\0²Š/c\Ém:\Ù\0›\Ä6H{D‰­–¬@\Ö±M°ú—>A6À¦}jIDl\Ò<½Œ@®*·\Ñ\Ö9·W\È¤‹6=uV5­\Ü\È\ä\Ã0†\Ê7­\îŒ\Õdl¨\Ú\æ!6p>Ÿo°\Äi\Ù!™\â\Ïá˜¦yÁ®]»ö\Ö\××›+V¬0—/_N¤\Õ\Õ\Õ\æªU«BØ«<ŒH\íkŸ\éd\\\Ír.*µºº:³©©\Élmm%Òˆ\æ\æf³¶¶6$’›Ç\åatŠ?©\Ü\Z%šJJJ¾LFœ‡VjH\Í^¹I\Çp\æ^\Ç:ü‘Tn\ÇÆ{q\ÚüDHö†6MÙ³òƒ>\"¶õLñ\ç<ô DFˆ\r\Ò@š¤Uzù\Ş0Œ\rw‰\í\äg\Í]\ë~o6Tÿ:ú\\—!2\Ä\á‹\n‹­\á\Õ%b;qt¿¹e\éLs\Ó\ë÷ºL\×!3\Ä\áy·&Š¹“l8_l{^\ë&µH\ìk¨Dfˆ\r\"øış{Tn\"¹È†³Å¶\í­G\ãŠM\×!3\Ä\ç6KË¬É™’\r\çŠm\Ëò\ÙqÅ¦\ëbƒ.”””üD\Ä\Öf\Æ\ß\ÉbCl\àt\äkŠ¿5d\ÃybÓ« ñÄ¦\ëbƒ8TTT|C\ÄvRb›Î«@Fœ#¶«\ç\Ç›®Cfˆ\rzÀš¥\è°4M÷1ÅŸs\ÄvdÿfsË²Yİ›¡²L\×!3\Ä½Ÿsû’n¯îˆŠŒ\ä^l\Z»\×/\î&6]†\È$ˆ6E¥jkĞ¦)³~;@l--\æ5º7Ce™®Cfˆ\r’@\ÄV\'\Ñ*1„l\äFlÚ³\à\Ã\ÕO\Ç=Ç¦\ë\è}€\Ø I\ÃxUg(bŠ¿,‹M*±ƒ;j\Ì÷«\î+µH\è{ô½Toˆ\r’ ,\ĞY°$~N62/¶Şª4ª7\Äö5Kg«Ü˜47óbK¤J\ë©zClˆ\r’k–şB»`\É\ão\ÈF\æÄ–ª\Ô\"\Ø$_¹\ë°GR½½L62x@l]Dj\ß\×+}>\ßr²\Øx†¢¢¢«En§En\n˜\â±!6ğP³4<ÅŸ\ÄN¦øClˆ\r<ƒN\ë\'bk”8\Äˆ\r±g\Ğj\Í\ï÷$rcŠ?Ä†\ØÀSô±½«Sü\éù7Ò\Øx\é¼\Û2½bªWN\ÉbCl\à%¹½¤÷º\é=od#sbÛ¸q£\Ìù—1û÷\ï~üñÜ¹^~|8¢?\Óu\Ù\êÕ«\Ík®¹\Æ<ÿüó\Í˜W_}uB¿;òs4ôw_w\İu¦SfµGl1|>\ß<\í¥ •\ÛD²a¿\ØÖ¯_\Ùü\Ç˜6l/Û¾}»YQQ‘”Ø®º\êªğ\ëÍ›7›\Í\Í\Í\æ¤I“’›>¯««?¿ò\Ê+\äE\å6ÕškÙ°Wl………a™,[¶,!ù\Ä[¦Õ–¾V)&óû»ş}®U_\äucc£Y^^n^x\á…\á\åÃ†\r3w\ïŞ\ØÀ†q«v¹=K6\ì›\ÊBer\æÌ™´Ä¦Â‰4\'oº\é&sÖ¬Y\á\Ê-±­\\¹2ü|Äˆ\ëµr\Ôe\Ú\Ôİºukøù!Cx‡@ ğS\âO·„l8KlZY\İw\ß}\æ\àÁƒ;\×\r:4©sl‘f\èÎ;»ı}\ÑÑ·o_\Äk–±F\ã]M6\ìkŠöôù®ò\ÓÇ®MÆ®\ç\í\"\Õ[2\ÛÔ©S\ÃÏµ\â\ëú»;\Æ96ğ6QSümeŠ¿ôÄ¦ô\âVJ*¤\È\Å=¯yOQQQX.\Ï>ûløõ¢E‹Â¯o¹\å–\Î÷\èóúúúÎŸ©\ëµzKFl\'Nœ0~¹2\ZiŠNŸ>=\ást=½Fl\àh¬)şH\ì\Õ±[\ê·{\è•\Ì\Ò\ÒÒ°à´™§Ã‡\ï\\\àÀsÜ¸q\æ¿şë¿†%¡·\İv[xy\ä=£F2¿ò•¯„«4­²´ª·‘${ñà¡‡:§{\ä\Ès\âÄ‰\æ%—\\rNs±gQ¡©Ø˜\âtiŠ‚§Ğ¦¨6IµiªMT\ÄF 6ğz1!Ÿ§øs²Ø´i\Z+@b\çİ–\èz[b#x½×š\ëV\ÄF 6ğ’\Ü\æh,íŠ…\Ø\Ä^j–N´ú—\ÎClb\Ï™\âO‡?Blb/Un\á)şt\àJ\ÄF 6ğ\Ögt\ÈñNñ‡\Ø\ä!:9ŒN£“\ÅxqŠ?Ä†\Ø O±¦ø;¤\ÓüymŠ?Ä†\Ø \ÑjM\'f¶&hş\Zb#x…>>Ÿoƒˆ\í´W¦øClˆ\r Œ\Èm¹W¦øClˆ\r ‘\Ú\Ë^˜\â\Ï)S\Ö!6\0‡`\Æo´—‚<şÂ­ÿC]]]GSSB²)ö\íÛ·G\Ä\Ö\Ê\Ñn—\Û4\í</‚›\íÆ¿¿¦¦\æ\á\Ú\Ú\ÚĞ¡C‡+‹––\×H­ºººMbGx¡Yús•[ X\àÆ¿_\Ä9Reœ\Ô&”Cg›\×ùKú÷EE+RO!\Û\ÓM*¸WÉ†}”••]\éóùBd wr‹LñWG6l«†µ\Ïn™\0\È!R]\Òyä±)şlù²Hœ\"\0¹¯2Z3`1\Å_úb›ª¹$\0`øğ\áIÕ¶O\Ê\Ãù>\Å_šğ<\Í#™\0p\Ö\Ûò}Š¿4+¶\Å\"¶\ídÀy\ç\Z‰–`0x=\ÙHºYÿº\Ä;dÀ†ñw©<\ÚJJJ~B6’şRXJ&\0Šˆm¡5V\ÙH8g\r’¯W\È€ƒ	¨Ü¤yu\ÙH¨b\Û#r{ŠL\08ÿ`½S\å&’{œlôŒ|–<\İO&\0\Ü\Ñ\Ä*±†=ZL6zü8©}q\É€K0\ã:`¥H®Šl\Ä›\è9ŒL\0¸if]£Sü\ÉÁ»¾À£Sü¥)¶\í¦F&\0\\†Nñ\'b;&±\'§øKSl&9p):­ŸT&M“‘‚‚Ñ£G_&bc\È\"\07£•‰Tn»½6\Å_\ZÕš\ÕÎ\à~ú\ÈÁ¼Q*·\Óƒó\\l\Åzş‘]À;uµTog\r\Ãš\Ç9˜¤\Õ+{€·\ìW´)F\ç\ãÿ/bŸ+ÿÿAö\0\ï\ÜOX]°&\ä\Ûÿ.\Õ\êóò¿\ï`/\0ğf\å6İškVı\ß“x—=\0À»ùm*7Ÿ\Ï÷LıÏ«$V°õ¼} °ú—ş5Oş\ßM\"ó¿°\å<Tlß–ƒ]§ø[\åõÿU\ï\és\ë$\Ô\0$EEEW‰\àN‰Ü¶xyŠ?\í‰!ÿ\ãl¶8@`u7úTbô\êR±\ÏÇ«Á\0yNñ\'bÛ¯ƒ1–••}\ÕkÿŸN€£\ç\Ù\Ò\0y†Tk\ç\éôt\"€òøuUlz‹\Ë5le€<E\ÄV¯ˆ\î[úŸLF:\Ès¤\ÂyMd\Ğ&•Û\Üş¿¨\ĞTllU\0\Ğ*g‘\Õ«\Ô\Íÿ‡5²p[\0\"•Ûƒ*\Ã0¦¸õ¿}¤6­Ùš\0Ğ‰4G\ï¶&g~Ä¥bû…\Ş\îÁ–€sƒ>«\Ö.óù»± \Å\Å\Å?\Ô\no¸\é\ïÖ®T\"·]lA\0ˆ\'‰ğk\\2ÅŸv~±md\ë@\\\Ê\ÊÊ®\ÔsV:p£\Ş\Ôë‚¦hM>tô€49r\ä¥\"\íX~\Ğ\é7¾Š\Ø6\è@“l5\0\è•ñ\ã\ÇQ„±[\Äq´¼¼ür§ş:y´Ş“\Ç€D\é£\ç¯D§ƒÁ\à7*¶ƒ³©\0 \Ùæ\Ç:\ë÷ûop \Ø>\Ó{ñ\ØJ\04@\àz¯›a7;Llz·˜-\0)!Û“V/…\Û$6½±x[\0RF*¶ûtü3‘\ÉL‡ˆ-$\Ï@¶\0¤+“Û¬\Êm~.ÿ\ë\Ê-C€m•›ª\Ñ\îóùşœ«¿A\'«a\È\"\0°•\Ò\Ò\Ò\ïŠXZ¥)¸2¿_\ÊÔ«µl	\0\ÈD\ÕtJ$ó~¶§ø³š\Ä\'\Ù\n\0`;:ÅŸTm\á)şô¼W†ª³Aòó\Ëô^º±c\Ç^¡\ËÀı²¼™-\0\0!2ÅŸŠ&SüYb3£C–…¬«¢zóğQy\Ş,1ƒ­\0¶¡£ˆX>\È\Ôòs7u•[—\èˆTs\0\0vWWoK\Ø>ÅŸ5\Òo\\±\åò\n-\0\ä\"šJ‘Wšˆ\Ãlş¹\'\ãH\ítaa\ád\02Ša\Ï[7ò\ìú™\"Ê¹±\Ä&\Ë\'’q\0\ÈV\åö°5\édfk± \Ó\0m¹M²\ä6×Ÿ\'\ÍÎª.\Õ\Ú\rd\0²\ÈÇ¯]°\ä\áw\éş¬`0x}Ô¹5&r€œ\Êm˜uA\áõtÖ¨Q£>Q±†ñS2\0¹n–^«ƒCŠ\Ü\ŞI\ã\ÇL“0o¼ñ\Æ÷­€#\Ğ)ş¤	y\\\äöa\nSü©\ÔB_ø\Â\Ş\ëß¿¿Ù¯_¿\È(\08kŠ?\íu ‰)ş\ÂR“˜c½\Ù\å5\0@n±ŠüXûy&0\Åß´8›†\Ü\0Àiô±ú€\êaŠ¿\Ş\äYOx\0p\"¶·\âLñ—hE6ƒ\Ê\r\0œ(·?\é½n@`TŠ\ÍL•[•\08\nŸ\Ï÷”öRø\ÏÿüÏ¿¤XM³\äF\å\0\Î\áúë¯¯ú\Ù\Ï~f0\àñ\ç\Ü\0ÀQ„¥%µ>\ÏY=\Ñõ}œs\0\çH-JF*©$L\ë±OR‹õ>*7\0p”\Ô\n¬\nÌŒŠXr‹–Z$öòs\0r\"µxÒŠ–[o\ëh–€“¤Ö›\Üú%(µ\è\ß\Ã\ÕR\0È¹\Ôz’[kR\ë*7Î¹@N¥Ö“Ü’‘\Z\ÍR\0\È(WXBjHòsıbTj­\Öòd¨²>\ËXn\0‘Š-\Ñf¡\İ\Û\\6\0\ä²9j\×9¶H_Rš¡\0S¹\ÙyU”›u «r‹uµÒ®û\Ø\Ê\n¸\Z\n\09`FŒŠ\ÊÎóH1\08¡YjW_Q¤\0¨Ü¢å¶° ±\Ñ=¢\ß\Çıj\0\à¸\Ê-sbH\r\0\\Q¹¥Úœ\0p\\å–Œ¤\Z\0¸¦rK¤YZVÀ…\0ğP\å9\'‡\Ô\0Àr‹uÿ\0€\ë\ä6#\Éf*\0€£‰ThµŒ\Ò\0^ª\ÜÆŒc\"5\0ğ–\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±‘\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Ä\0€\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0Ä†\Ø\0\0±\0 6\0\0\Ä\0€\Ø\0\0\0 6\0\0\Ä\0€\Ø\0\0\0\0b\0\Ä\0€\Ø\0\0\0\0b\0@l\0€\Ø\0\0\0\0b\0@l\0\0ˆ\r\0\0±\0b\0@l\0\0ˆ\r\0\0±\0 6\0@l\0\0ˆ\r\0\0±\0 6\0\0\Ä\0ˆ\r\0\0±\0 6\0\0\Û$Ö¨\"\ë%N’)\0p“\Ø\Êz›\Ï\ç›C¦\0Àmrk\îAl\'\n/ K\0\à™ª\Í\ï÷\Ï%C\0\àV¹\Å:\×v’j\r\0<Uµqn\r\0¼ ·Tk\0\à)¤B%¶d\0¼Rµ…ÏµQ­€+Qyie&Qg\İò\Ñ\Ú\å<[»\Ä‰ú@ ° ¢¢\âb²\0¤¨¨\èj‘U­\È\êl½¢oı\è\æjƒ<\Ş@À1šˆ©J„f&#´8QO\09¥¸¸ø‡Ri\é*¨‰\'š.4\ß~ûmsÿşı\æ™3gLE›šš\Ìw\ß}\×|ñ\Å\ÍÉ“\'\Ç\êju\Ú0Œ›\É.\0d½\Ú;¢¥t\ï½÷†¥\Õ\Ş\Şn&\ÊÆ\Íûï¿¿«\àB\Ü\ï\0Y—Zt\ÓSgVVV&%´®TUU™\Ò\åf^\0\ÈMóS¤Šnv~øá‡¦|üñ\Ç\æ\İw\ß}N\åF³\02Š^(ˆ>§¦R\Ósfv¢?/ZnzÎ\n\0\É&hUtóÓ®J-V\åÖ¥Yº–\ì€\í\è}j\Ñ\ç\ÕôœZ&\Ñsn\Ñ\çÛ´	\ÌV\0\0[Ñ›o£¯~={\Ö\Ì4Ó§On’6°\0À6ô\ÜZt½¥#lŞ¼ùœ\n\Ù\Z\0`z\ÛEôƒtn\ëH–\è›xµo)[\0\ìj†\ÖE\ä²h\Ñ\"3›¼üò\Ë\çt¹bk\0€]bëœ˜E»IemöF5G²5\0ÀD(\ç\×<˜U±\é}m\ÑC±5\0À®Š­S.‘\í\ÙB_ô\ïgk\0€\íb\Ëˆ\r\0¨\Ø\0\0zƒsl\0\àÅŠ«¢\0\à9±q\0x®):7W=~ù\Ë_\Òó\0\0\ìÇšR¯¾¢\0\àµ\æ\è\Ú\è\Ñ=²QµEÏ…À\è\0`;Ö¼¡!\Æc\0¯Umu\Ù\ZA÷\Ö[oe]\0\È<:÷€\ÎA\é9\îº\ë.\æ<\0€ì¡³FE7Ií¥*Zj\ÌR\0Ù”Û´h¹\Ù5¯h—\æ\'óŠ@n\å¹Zª3»\'{K\ÇÌ™3™	\0œ\Ó,>\ç\İ<\Õ\n\ëÖ­÷-tœ\×G=‡¦ò\Ó\Ñ7\ßFŸS£ù	\09EO\ìG_-M3\Ör¡\0\0ƒ\Ş\ç&\ÕÖ†\è\n‰„ö(Ğ›oÀO\É\"\08\í~eõ-\Õ*®9zÈ£¨®QGµC»öı¤›\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€½üõJ.H\í˜\ë\0\0\0\0IEND®B`‚',1),('9',1,'/home/dell/stconline/server/target/classes/processes/TestRecord.TestRecord.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Â\0\0°\0\0\0:òe\0\0 \ÍIDATx\Ú\í\İ	•\å™/p+Æ¨7©)“šŒukjn*5\ËJYV&sS™l†h™Ä¤¬¡\Ï\éÓ€vF\ÜP7,	IL4J¢Q\"2a\âzñ¹5˜m±QP‘ˆŠDV7–†f\é\ï¾O\ç\ëˆ4\r\Øô\é>\ß\ïWõ\Ôwv\Ì\Ó\'\ßÿ¼\ßò~\0\0pÀe¿}¢ı‹\ŞùkÔ¨\Éó¶U\ê\â›\ænyıƒYr\Ï\ß^· =\İ>)Õ‘?ºó\Ùe•º`\âC\Ü0gGz¼¯»\âÿ½ò|º}\Ô\Îÿ\Î%“[7\ê6\0}N\n­_§š\ê3©N½x\Ò#Û§­Ê–¶dY\Ú©>V~\İ#“[\ÛVG\à]u\ï\ÊE?¼eÑ–Ñ·,\ÜrÁ\Ä9ÿ½<{5=>\"^÷l–]q\ËSÙ´\Ê\ë*u\áÄ‡¶Å²ò:\0\èS:²ì±‘7<˜ıh\ê³m£&?ºm\Ì‹WDxU‚°b\åölş¿{q\ã\Ø\Ûo¾\à\×u\\x\ã#;.º±%F„_\Ø)`?·1\ËFEİ¾8»û‡·,\\·w5Z€šˆ€úñ½ôR\n§.úuË‘7\ÌÎ®¹o\í[#\Ó(\ï‘4\"¼xR\Ë\æx\İ-·½~\éoßš^w\å/ÿ´\ì­1·?³9‚-F„¿š½ú\Ê\ëª>/6¡sÍŸß˜\ÏÍ²\ëfo\Én\Ôq\0ú”V‡Møó[o^=\íùõ\ãş\Ïs›F\ßüÔ–¯ôø\ã?½û¹\rS\È^/¿\î]t\Ó\Ü\í±üù\İÏ¯ÿ\ám‹6\Ç\ë¦,\ÈV¦\Ç~£\Ç\Ê\ç\Å\íX\ÆHò\âIs\Û\âñ«\ï[÷„M¢\0ô9·>\İûøb3\æ¨ÿ˜·mÔ”Ç·\Æ\æ\Ğ8\àe\ÔM­\Û\Æ\İñÜ¦\ÊkG^»³C.º±¥ıgw/_¯5¹u\Û\ä\Ù\Ë\ÖE\ĞU^wÑ¤G\Ú*·\ï\\’\İ\Ër8¢\ã\0ô¥\Ñ\à‡SM*‡\Ô\é7?•½>ù\ÑlfY\Ü1ËN\Ë\Ö\ÊH¯<\"<ıW3×·¦\å—/M¡9ú\æ\'Ú¯¶ú©§²\ì\êò\ë©Œ\Ë÷¿œ>|Ü¨›İ¤\ã\0ôµ ü\Ç±ho\ßøHö\àMó\Ö\Ç¡³—d\Ùø)Od*o\"ızªÿ=ög\Û\âÀ˜)ó7­J)ù\ä–,[p\Õ}«Ş8g\ã\Ú\ß-i[^s~õ\çış¯\Ù\ÔUY6\æ\Ş5\Ù-qŠ\Å\Ì\Ëf””ùº\Î\ĞW‚ğ¬7³ì²´<<‚+†ù\Ï\'²×«\ÏL\Ï—jjªq´\ç´\ÕÙ«1¼\ä¦y\Û.<w{¥\Òs—\ìüy?¾\ë¥%ã¦¾ğ\ÊÎŸ§ó\0\0ıó\Ç\ãa3fÌ¸g\âÄ‰\'L˜\Ğq\ÑEe\Í\Í\ÍYccc6t\è\Ğ\ì‚.\ÈÆ»uüøñ+FŒq¡P^ıõÁ·\ß~ûúó\Ï??>|xvó\Í7gó\æ\Í\ËV®\\™mŞ¼9\"Ë¶nİš­Y³&›?~v\ÇwdgŸ}vv\î¹\çvŒ=ú\áR©t¸.\ĞG€‡Ï={\İyç—¥`¶hÑ¢\ÎÀ\ÛS‹/\Î\Ò\è16lX–F\ãu€~5\nüÕ¯~\Õ1r\ä\Èl\áÂ…\Ùñüó\Ïg#FŒ\È\Î:\ë¬\Õ\Í\ÍÍ‡\é.\0}Ú†\rFŒ;6»şú\ë³õ\ë\×g=!6¡\Æ\çs\Î9o\ÛT\n@Ÿ	F^}õ\Õ\Ùö\íÛ³6iÒ¤¾9`À\0L\0Ğ·\Ä>Á\Ø\Z#·ı‚\×]w]6dÈe:@Ÿ\Æ\Ä>Á\Úº»Í¤gŸ}vG©T\Z©\ë\0ô	±I4#C{C@3xğ\àö\Ğ\'\Äy‚qŠDoº\âŠ+¶666N\Ó}\0j*fŒ‰“\å{k4Xñ\Üs\ÏeiD¸Í3\0\Ô\ÔÌ™3\ï‹cö\ç2]inn\ŞQ,‡ù+\0P31whL›V\×^{m[ccc‹¿\05h\ÇÜ¡µğè£nOA¸\Ü_€š‰«H\ÄÚµ°nİº„\íş\n\0\ÔL\\B©r‰\Ş“x\Çeœü\0¨™¢Z„\0\ÔÔ©§Z\Ëa‡  ¦.¼ğÂš\í#\\³f\ÍVû¨©q\ãÆµ\×\ê¨\Ñ3f¬q\Ô(\05õ“ŸüdY­\Î#;v\ì*\çPS#FŒøÁ\ÙgŸ]“™ebŠ53\Ë\0\Ğ\ÂpGo\Ï5\Ú\Ú\Ú\Z›E\Í5\n@\í3\æÁk®¹¦WƒğŒ3\ÎX\å\ê\0ô	\Í\ÍÍ‡~ú\é‹/\î•|\ì±\Ç\Ö\Åh\Ğõ\è3\Î=÷Ü±qq\Şı}…ú¶¶¶MMM[]¡€>\ç\ì³\Ï^y\íµ\×\î\Ïg:Ò¿±¦X,.\Õm\0úœ8p%\×Mœ8q„a\Ç\èÑ£ÿ\Z\ç\rÆ¦X\İ Ï†\ágœ±\æ¿øE¶iÓ¦\Ûz\Î9\ç\ÄÁ1\Ë\í _„\áĞ¡C—y\æ™O?ıô>0&ö	\Æ\æP#A\0ú•8 eÈ!\ÛÇ·-qo6—.X°`m\ìs,\êÀ\0ú§Å¥\Ñ\Ü]1ª;\å”S:&L˜\Ğö\ĞCm_µjÕ¸`\å*1öı÷ß¿.¦M‹c\"\0\ã<A›B¨)Ø†¦š•jY\nÇ¶¸„RUµ\Ç>ÀT­1mšc\0\ÈK8f\r\r\r\Ñ	\0ò„\Ó	\0ò„Ÿ\Ğ	\0ò\Z„ˆ ·Š\Åb\Çi§ö)\0 ·A\Ø\Ü\Üü\0 —\Zw<ø³:@nƒ0Õ¿\è\0y\r\Âí©¾¨\0\ä5c.Ñ¯\ê\0y\rÂ­…B\á:@.¥\Ñ`{CCÃ·u€¼·¤\á‰:@^ƒpsSS\Ó\É:@.\Å\å˜\\\Ô	\0ò:\"\Ü\×)\Ô	\0ò\Z„Rı»N\0K¥Ri}ª3u€¼\ß.‹\ç\é\0y¾Y(.\Ğ	\0ò:\"|#\á(\0 —Š\Å\âÚ¦¦¦\Ñ:@^G„«S]®\0\ä5W–J¥+t€¼\áŠTW\é\0¹”Fƒ\Ë…\Â/u€¼—‹\Å\ëu€¼_IAx£N\0\× |)\ád\0 —\Z_Haø[\0 ¯Aø\\ª\Ût€\\*‹‹SN\Õ	\0ò:\"|:…\á]:@.•J¥§\n…\Â\ïu€¼\á‚„÷\ê\0y\r\Â\ÇRŞ§\0\äRccã£©f\è\0y\rÂ–T³t€¼\áœT\ê\0y\r\ÂY1*\Ô	\0ò\Z„3b?¡N\0K¥R\é\ÅbqN\0\× üC\n\Âù:@.Å¬21»ŒN\0K1\Ïh\Ì7ª\0\ä5\ïLAøŒN\0K)ok\ê\0¹W§«\Ô\ë\0y\r\Âß¤ |I\'\0È¥¦¦¦I\Åbq©N\0K)¯O#\Âe:@.\n…_–J¥\å:@^G„W§\á\n\0 —Rş,\ÕJ\0 ¯Axyª\Õ:@^ƒpLªµ:@^ƒğ\ÒT\ët€\\*\n”J¥7u€\\*‹\ç¥\á\Û:@^G„g¥\á;:@^G„\ÃÒˆpƒN\0K)‡¦Ú¨\0\äR)IAØ¦\0\äuD8(\Õf\0 —\n…Â‰)·\è\0¹\Ô\Ğ\Ğğ\íR©Ô®\0\äÒ AƒKA¸5n777–nuğ\àÁ_\Ğ\0\êR\nº·\Z·¥å´Ìº¨%:@½á­»	ÀÎŠQ¡NP—pHŒ»\nÁb±¸X—\0\È\í¨\Ğh€¼Œ\n\Ûw„\Ëu€\\(‹\ãw1\Z®3\0\äF\n¿wª‚ğ\r W\Òpd\Õhp¤\0\ÛQ¡N\0K…B\á2AÀ~‘e\Ù!K—.]\Ş\ÚÚš=ğÀ\ÙÌ™3\Õ>Ô¬Y³²‡~¸#\Õ$\ß*€~$B°¥¥%[³fM\Ö\ŞŞ®>@­]»6›3gNG\n\Å	¾Y\0ıDŒ…`Ï†a\Z!ºR@›CX\ÏVl*õ\Í\è\'b¥-¼!€ \ì¦6¾½2[:ÿ\ælñ¬wVÜ\ÇŸ ¨û \ÜğÖŠ\ì™c³§ÿx\É{*‹ç„Ÿ ¨\ë \\¾ø\ïÁJ½¶xšğ„\0õ„\Ï=øó.ƒ0~‚ ®ƒğ™™—w„ñœğ„\0‚P	B€z\r\Â8J´« Œç„Ÿ ¨\ë \\2wb—A\Ï	?AP\×AøÆŠE\Ù3÷{ÿf\ÑôX<\'ü!@]a\Ô+n{_\Æc‚O\ÔnÙ’-yt\Òû7‹¦\Ç\â9\á\'\ê6c\æ˜\ç\Ş\Ğ\å>\Âx\Î\ì2‚ ş‚0ôV.™ıeú\è.C°Rñšx­Ñ¡ ¨‹ \ìnht(\ê:÷d¸»Ñ¡ „\0ı:÷5+%!@¿B%¡„\0‚P	B\0A¨!€ T‚@*A • „J\ä7\Ó\Ûv[Õ¯ù\Ú×¾ö÷\Æı\ê\×\í\é¿s\ĞAeŸÿü\ç³x@\ĞwF„]…Zuˆ-\\¸°ó±\'Ÿ|ò}¹§Ÿ\İ\Ò\Ò\ÒyûÓŸş´  ÿ\áW¾ò•lØ°ayæ™÷÷%+÷>ø\àw\ï¯Zµ*;\å”S²~ô£üñ\Ù+¯¼’½ñ\Æq\Ä\ïù¼¸è¡‡fk×®„\0ôNN›6­s³\æ¢E‹:—q_‚ğ¡‡\ê¼ı\İ\ï~÷\İç›››;›;wnö\ì³\Ïv\Şş\â¿\Øù\ÜÈ‘#;\ïÿù\Ï\î¼ÿı÷wŞÇ\èµ Œ\ÛGuT\çh,–»{Owû\"c³\è\Ë/¿ü\îó1\n\Üù5x`\çsK–,\é¼ı­o}«ó~,\ã~<^\Ë <\í´\Ó>U,Ç§z¾±±ñq\ß@€\á”)S:o\Çr_‚0n_|ñÅ·=ö\Ø÷\á;ï¼³\Ë÷8°óù\Êh0\î÷ö>\Â’ohªY©6¤\Ê*•\Âpºo @‚po\ë\êu6l\È?üğ\Îû•#G+›F/½ô\Ò]¾¿²9µò¾Ø„º»ı»»¿7u\Ï=÷D\ĞMIµ,\Õö\êğ«®B¡0\Ê7@\îñgÿô§?\í¼\Ì1\ÇtŞƒb†}ü\ã\ïòh\Ô8\å\"ûÒ—¾\Ô\í8=„mmmÙ!C²®\Âo§\á¾\0ı<\Õûkúô\ér×§°\ë\ØM\î8\á„ş\Î7@\Ö\í\Ì2¥R\éğx«º¶¥\åiyg¡P8U8\ä,ã€—]U=M±–‚n\Î.Bğ\é½¿t{jEZE\á`DXs¦\Ñ\á\ÈT;*A\Ø\Ô\Ô4iW\á \ëv\Ò\í\ÂlcùˆÑ“öôo$a\İ\\}¢|^\á\ã±ü 7\á Mº-¡ \0‚P\nG\0A(…#€ „\Â@\nB\á ¡p„‚P8BA(ºV¹È­„\ÂÈ¥–––kÖ¬`=T¯½öÚ²„\í¾Y\Â\è\'fÏı³9s\æt¬^½Zõ@Îš5k[ª	¾Y\Â\èGÒŠ{|\Z\ÅlŒMz}µJ¥RÖ—ÿû\Ê\Õ.…#@khhøH¬\àt\á\ä5?&@ƒğ‚\á\äV©T:<­œ:t\á\äRZ	ı“ D8¹•V6ÿ,@n\r8ğ\ÈR©´C\'@^ƒğhAˆpr«¡¡\á_ÓŠc»N \\J+‡K+‰m:Á¾È²ì¥K—.omm\Íb’ù¾6#\Ñô\éÓ³©S§f7\ÜpCö£ı(>|x\á8cÆŒ>õ\ß9kÖ¬\ì\á‡\îH5É·\nzYú…|Œ d_E¶´´dıirù¶¶¶>ùßµv\í\Ú,\æ&6• ô²AƒW*•¶\êû\"F‚®°Ò³a\è\n+\Ğ\Ë\Z\Z\Z¾‚\Ğÿñ\Ø\'®¹éš›\Ğ\ï\n…·\èû\"V\Ú\ÂKB¿\Ö\Ô\Ôtr\n\Â\Í:ÁşÂo¯Ì–Î¿9[<\ëÇ·\ã1Á\'¡\æ\\Œ\Ã\Ëu‚ı„\ŞZ‘=3clöô/yO\Åcñœğ„PS¥RiH\n\ÂM:Áş\n\Â\å‹ÿğ¾¬\Ôk‹§	?A5\Â466n\Ô	öW>÷\àÏ»\ÂxNø	B¨©‚§§\áz`\á33/\ï2\ã9\á\'¡\Ö#\Â\á)\ß\Ñ	¡ „¼G¤\á[:Áş\n\Â8J´« Œç„Ÿ „Z/Jaø¦N°¿‚p\ÉÜ‰]a<\'ü!\ÔzDxiªu:Áş\n\Â7V,Ê¹\Üû7‹¦\Ç\â9\á\'¡\ÖA8&\ÕZ`a\Ô+n{_\Æc‚OB_\Â\ËS­\Ö	ö[nÙ’-yt\Òû7‹¦\Ç\â9\á\'¡¦J¥\Ò)W\êû#c\æ˜\ç\Ş\Ğ\å>\Âx\Î\ì2‚j=\"¼*\Õ\n Gƒ0ôV.™ıeú\è.C°Rñšx­Ñ¡ „š(‹R.\×	z*»\Z\nB\èSJ¥\Òu)—\é=„{2\n\Ü\İ\èP\nB\èU)\'¦zE\'\è© \Ü\×¬” „Ğ«Š\Å\âM)_\Ö	z*• „ş6\"œ’j‰N !\ä5oIõ‚N !\ä5oOõ¬N !\äR±X¼3\á3: „\× ¼+\á\Ó: „K…B\á÷¥R\é)@\nB\ÈkŞ›‚pN ÿV\éVg	B\ÈOŞ—‚ğ1 7ƒ°6]U¼f\îÜ¹\Ù\ç>÷¹\ì\àƒ\Î=ô\Ğ\ìè£Ş£\Ï\Ş\×÷	BÈ©b±8½±±±U\'¨Õˆ°«\à9ò\È#;_´hQ¶v\í\ÚlÄˆ{ôyûú>Aù\rÂ™)\Ñ	úZt\ĞA?ÿüó{õyİ½o\ç¯«û•ú\ìg?»\×ÿ\r‚úW\Î.•J\é}-?şø\Î\Ç#Ø=ö\ØlÜ¸q#¼\î>¯»÷\Åsx`·Ax÷\İwg÷\Ş{o\ç\íN8AB½ŠŒ0\Ô	úZ®Zµ*»\ì²Ë²£:\ê\İ\×s\Ì1\İ~^w\ï‹û±ÿ°» Ü¼ysg\Å\í\Ø\×(¡N\Åf\Ñ\Ø<ªôµ ¬®¼;\ÊÛ›\Ï\Ş\Õûª\ïW‚NB¾ƒ°5˜\Ñ	úZ~ÿû\ß\ÏZ[[;o?ùä“¯‰Q^wŸ\×\İû>ù\ÉOv>¶dÉ’\ì¶\Ûn\Û\í¦\ÑiÓ¦½o\Ó\è{¸QB?§N\Ä):A_\Â\ï}\ï{¡£·Ø”›7.\\\Ø\í\çu÷¾[n¹%ûø\Ç?¾\ËS6vu°L„hõÁ2‚\ê/\ÄIõ:A­‚P	B¨u>Ó¬\é‚PB.Å„\Û1ñ¶NĞŸ‚06y\îª!°/AøL\\ŠI\'0\"„\× |6.Î«BAy\r\ÂRİ¢BAy\r\Â%©¦\è‚PB^ƒğ\åb±x“N !\ä5_I5Q\'„‚ò\Z„\ËJ¥\Òu: „\× \\^,\'\è‚PB^ƒpEª«tA(!¯A¸²T*]¡BAy\r\ÂÕ©.\×	¡ „¼\á\ÚTctA(!¯A¸.Õ¥:Á¾x\à„— „ş­T*½™\ê\"`_´´´\ìX³f\0\ë¡z\íµ×–¥ l÷Í‚\Ş¾],\Ï\Ó	ö\Å\ìÙ³6gÎœÕ«W÷‹ Ù²eKŸÁY³fmK\åt&\è\å\á;…B\á,`_¥÷ø4Š\Ù›ôúrM:5K?üúòc»„ÚŒ7¤\á0 \ßõU„\ßü\æ7ÿA7€\ê•\Ã\Æ4\"<U\'¨gƒ\r:.B°\\Su¨\ÂM©št‚zV,—V\á\Ö¢+@%\Û\ÒJ¢A\'\È\Éh°³ššš&\éP	\ÂÍ…B\á$ ¿\ã-;a©T\Úq\Úi§}Jw€XIlIõ] ‹\Å#\Ò÷»c\ç ,\×\"\Û\Ó\Ê\â›:A~¿§u‚A©K`E±µP(|C\'¨7\Í\ÍÍ‡\Å&\Ğ\İaª\Çu\ná¶´²øªNPo\Òhoú\îB°’\íiy¸nA~BoY7¿£\Úã—´nQAxDüÈ‹ª|§]mr®©©\é;\İ¡\ÃÊ©óƒ¯§`¼R\' \ß+‚%»\ÙT\äDc\êıû¿,}Ï¯\Ó	0*4\Z$—R¾T,\'\ë\ä\ÜN\ÓM½»o\ĞhŒŸMu»N@\Î\ÅL2»8Ÿ\êz!?¦Q\á\ït\è<h *7\r’“\ïı\ãq’½N\0ñ\ËxX\ÕA2W\è9	Â˜wt–N\0••B\ç…J\Z\Z>¡\ä\ä;?+\ÂP\'€\ÊJa\è\É\'Ÿœ]~ù\å\Ö\rò P(\ÜW*•\Ó	 bTª,\Õx­ \'?şş;˜\Ñ	 ‚©,/…!y\Â\Û\ã\n\0F\í~c„!yP*•~“‚ğ%\0!¸«\Ğ%©wq¾lL³¦ \Çwó¼\Ùù©\×\á•q­N€\Ü›I©[)Ç¦Z£ »a¸\ÃÈ:^”‚ğM\0!¸§\ï\ÛadHá™©\Ö\ëÁ½}¿‘!õ„CŠ\Å\â&€|†\à‡Rı¦¼Ü_gŸ!u£|\å•\Í:ùÁø\Û,2/\ì&»z‘!uaĞ AÇ¥Q\áV€|…\à\å^VU»\n\Ã\ê¬\Ô\än>ú•4\Zübª\í:ù\nÁ®B®:»{¾\ÂfRúµÁƒ6\á€|…`waø\á=Á\ê\ÇÑ¤ôK§œr\Ê?‹\Å€ü…\à\îÂ°}/Bp\ç0´Ï~\å„Nø»¸§N@>Cpwa¸7!XQ½™ôC\r\r\r0`À!iù±X\Ù\Ä\Å~O<ñÄ¿/•J‡Ÿ|ò\Éÿ3­|ş\é´\ÓNûTú5ş\Ï\Í\ÍÍŸI\Ë#b3UZ\Õ\Ô\Ôô¹ôü¿¤û_ˆ}8C†ùrz\ßWS}½P(|#-O¯ûfz\İw\Òó\ßM\Ëï•ş”oHÏ—\Òí¦¸¾bzüÔ´ü÷ôø°´<=\İ?+==<\İ?/\İ‘\î_\'U§\å¨tÿ\ÒôY£\ÓrLZK\Ë\Ë\Óò\'\éù+\ÊSq]•\î_“\Ş;!İ¿6\Õu\é±RMLOJß”jrº?%}\Ş¦\å-\é5·\Æ\ÒòôÜ\éuÿ7-\ïJ÷—^óû´¼;-\ïM\Ë?”¯÷\Çôüôôi93.›–³\ÓòÁTsR=\\¾ªú\ÜT¦jM\Ï\ÏK\Ë\Ç\Ór~Z>‘–O¦\åÂ¸¼PªE©ş’jqTzü¹´|>-_HÿÖ‹1\átZ¾”[š–¯¤ûQË¢\Òı\åiµ¢\\+\Ëp^3²¤Z›^·.-£Şˆ“\Ó\Óı·\Òç½•n¿\ê8O/\İ_ŸnoHµ1*NYH\ËMiÙ––Q›Ëµ%*½§=-\Û\ã@–´Œ\ÚVU\Û+•\ß›6+\ËTQ1Ê‹*\ßÏº+«\r¨Ÿ*\Ø\â½|ß‡w1l/?¾7¦\ïÁJ§£zeUµÜ±S½»²K\ÏWV€[«ª½\\[\Òó[ªV¤•\ë¦\ÊJ·¼\Ş+\ã´\Â|\'VÎ±’•uºÿf¬¼\Ë+ñué±µ±rO\ËXÉ¯N\ËU\å•ÿ\ë\éşk\åpøk90^ğˆ IË—#T\ÒrI9d^(‡Î³\åz&B)-ŸJ¯y*B+-Dˆ\ÅbË¡\ÖZ¹G\"ô\Ò\ã•C0\ÂğòU\Õï°Lõ§Ï´œaš–÷D¸\Æuö\"l\Óò¿\"|\Órj„qZ\Ş\áœ\ê·\Öqõ…\ïr\ß¡QGÈ§\ç¡Ÿ\ê\êø\êgñ£ \İ?\ÊÓ“I¯»,~D¤º8~T¤\Z?2R?:\â¤õø?H\Ò\íÄ“8/~¬¤;\Åøñ’şı“\ã\ÇLª\ã\ÇMú\áô\íø±GuÆŸT\ÇÄ¡ôØ¿Å£ôü¿Æ¥?\Òò\Èø1?¬†ú\éø‘›=\ãGWºÿñ#,ı\à:,~”q\Æÿ#~¤•/@ı!«\r¨\ß\án¦\ì\é\á•ş\0ô—Í£=µ°2©f\0\è7aØ“G:¹€>†»:š³§\Î#z€£E\è\ã\Æ\ìb\ÄÖ“3\ËL\Ğb\0ú\Ã\Èp\Ì5*\èw#\Ã\ê0œ|À]}¢úu¦U _?\È>=!@İ÷&D… \0u32Ü›P‚\0\Ô\å\ÈpO6“=À1\0\ätdXÙ§(\È]\î\êüC\0¨\ë0S‚fŒ W*#À9¸Š\0y–/R*\È\'W\ë@€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A€ „\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0 @€ \0A\0‚\0!\0B\0„\0ğACoU_7µQ§\0¨\× \Ú]‹\Åñ:@=‡\á\Ú\İ\á†¢K\0\ärTX*•®\Ô!\0ò†»\ÚW¸\Ñh€Ü\n\í oaøº\Ñ \0¹•F€Ãª‚pŒ\0\ÇQa\ç¾B£A\0\ê^„]ŒüRµ”O¡h\ßi?\áöTo¤jmjjš\Ô\Ü\Ü|˜®\Ğ\ï\r8ğ\ènsR¸mİƒYeªO¥\ØQ,§\åWu€~9LA6=`¶7\ØEµ\Z!\Ğo\Z4\è¸4’Û¼s \r><›<yr6oŞ¼lÅŠ\Ù\æÍ›³\Ë5k\ÖdO<ñDvë­·f#G\Ü\Õ\Ôkm…B\á$\İ O‹£A¼£:\Ä.¹\ä’ÎÛ¾}{¶§.\\˜=z\ç@\ìp¾!\0}:«7…¦@Ì¦M›¶W¸³\éÓ§g\Í\Í\ÍN¾ o‹Í¡);ª7ƒ¾ø\â‹YOxõ\ÕW³ó\Î;\ï=#C›I\è3\âÀ˜\ê}‚‚±Ï¯\'\Å\çU‡a\ì3t\0\r\0}BZ½9´§F‚»\Zî´™ôq\İ ¦\â<Á\êı‚±OpŠ}†\Õûc“¬¿\05\'\ËWºu\ë\Öl»ô\ÒK«7‘.öW\0 &b\ß`õŒ1qŠDoX´h\Ñ{f Iu¸¿\0½.Nc¨>@æƒœ&±·ªOº¹Iı5\0\èu\å	´;\ÃhÊ”)Yoº\ã;\Ş3›¿\0µÂµ•0Ši\ÓzSl†­\Ú<ú–¿\0½.Ğ»ûW®\\Ù«A\çV_\Â\É_€ZŒ\ß\r£\ÊÚ½%ş½\ê\ß_€ša-B\0Œ!\0µb!\0y:j€\\¡óÈ¯4»²V3Ëœşùf– ¶b®\Ñ\Ø?g®Q\0r+®	X}õ‰\Ş=\Ú\Õ\'\0\è\âz„):\\€<\n[z\ë\nõ§zª+\ÔĞ·477V,Ûªœ‰óüzú¼Ás\Ï=·z“h[ü»º@ŸP(Nª\ŞD\Za\ØS#\Ã	V‡`ü;ñ\ï\é:\0}-GU‡al&}†\ä\0š\Ø\'¸\Ó\æ\Ğ\r\×m\0úEV&]¸p\á^Ÿ\"1v\ì\Ø÷`|® ?„\áI\Õû«7—\Æ4ó\ç\Ïïœ›´2Qw,c`„e\ÌS}²|õ>A›C\è7\â@–\ê£I?`=\îÀ\0ú¥8\Ï0æ¬fO*fŒ‰“å›šš¾£‹\0ô{1[yn\Ò%®­¾„S\ÕTio\Å\Ú1w¨i\Ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0 6ş?ø¡\äõq=È¡\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_hi_actinst` VALUES ('2505','Entrust:1:12','2501','2504','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:34.558','2019-07-07 11:24:34.560',2,NULL,''),('2506','Entrust:1:12','2501','2504','reviewEntrust','2507',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:34.561','2019-07-07 11:25:16.772',42211,NULL,''),('2513','Entrust:1:12','2509','2512','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:38.925','2019-07-07 11:24:38.925',0,NULL,''),('2514','Entrust:1:12','2509','2512','reviewEntrust','2515',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:38.925','2019-07-07 11:25:25.251',46326,NULL,''),('2521','Entrust:1:12','2517','2520','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:42.687','2019-07-07 11:24:42.687',0,NULL,''),('2522','Entrust:1:12','2517','2520','reviewEntrust','2523',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:42.687','2019-07-07 11:25:30.507',47820,NULL,''),('2529','Entrust:1:12','2525','2528','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:46.218','2019-07-07 11:24:46.218',0,NULL,''),('2530','Entrust:1:12','2525','2528','reviewEntrust','2531',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:46.218','2019-07-07 11:25:34.751',48533,NULL,''),('2537','Entrust:1:12','2533','2536','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:49.706','2019-07-07 11:24:49.706',0,NULL,''),('2538','Entrust:1:12','2533','2536','reviewEntrust','2539',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:49.706','2019-07-07 11:25:39.584',49878,NULL,''),('2545','Entrust:1:12','2541','2544','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:53.083','2019-07-07 11:24:53.083',0,NULL,''),('2546','Entrust:1:12','2541','2544','reviewEntrust','2547',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:53.083','2019-07-07 11:25:45.177',52094,NULL,''),('2553','Entrust:1:12','2549','2552','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:24:56.700','2019-07-07 11:24:56.700',0,NULL,''),('2554','Entrust:1:12','2549','2552','reviewEntrust','2555',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:24:56.700','2019-07-07 11:25:49.960',53260,NULL,''),('2561','Entrust:1:12','2557','2560','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:25:01.325','2019-07-07 11:25:01.325',0,NULL,''),('2562','Entrust:1:12','2557','2560','reviewEntrust','2563',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:25:01.325','2019-07-07 11:25:55.098',53773,NULL,''),('2569','Entrust:1:12','2565','2568','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:25:04.677','2019-07-07 11:25:04.677',0,NULL,''),('2570','Entrust:1:12','2565','2568','reviewEntrust','2571',NULL,'SS_Review','userTask',NULL,'2019-07-07 11:25:04.677','2019-07-07 11:26:00.102',55425,NULL,''),('2578','Entrust:1:12','2501','2504','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:16.772','2019-07-07 11:25:16.781',9,NULL,''),('2579','Entrust:1:12','2501','2504','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:16.782','2019-07-07 11:25:16.782',0,NULL,''),('2590','Entrust:1:12','2509','2512','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:25.251','2019-07-07 11:25:25.251',0,NULL,''),('2591','Entrust:1:12','2509','2512','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:25.252','2019-07-07 11:25:25.252',0,NULL,''),('2594','Entrust:1:12','2517','2520','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:30.507','2019-07-07 11:25:30.507',0,NULL,''),('2595','Entrust:1:12','2517','2520','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:30.508','2019-07-07 11:25:30.508',0,NULL,''),('2598','Entrust:1:12','2525','2528','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:34.751','2019-07-07 11:25:34.751',0,NULL,''),('2599','Entrust:1:12','2525','2528','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:34.751','2019-07-07 11:25:34.751',0,NULL,''),('2602','Entrust:1:12','2533','2536','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:39.585','2019-07-07 11:25:39.585',0,NULL,''),('2603','Entrust:1:12','2533','2536','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:39.585','2019-07-07 11:25:39.585',0,NULL,''),('2606','Entrust:1:12','2541','2544','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:45.177','2019-07-07 11:25:45.177',0,NULL,''),('2607','Entrust:1:12','2541','2544','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:45.178','2019-07-07 11:25:45.178',0,NULL,''),('2610','Entrust:1:12','2549','2552','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:49.960','2019-07-07 11:25:49.960',0,NULL,''),('2611','Entrust:1:12','2549','2552','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:49.960','2019-07-07 11:25:49.960',0,NULL,''),('2614','Entrust:1:12','2557','2560','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:25:55.098','2019-07-07 11:25:55.098',0,NULL,''),('2615','Entrust:1:12','2557','2560','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:25:55.099','2019-07-07 11:25:55.099',0,NULL,''),('2618','Entrust:1:12','2565','2568','approveGate',NULL,NULL,'æ˜¯å¦é€šè¿‡','exclusiveGateway',NULL,'2019-07-07 11:26:00.102','2019-07-07 11:26:00.102',0,NULL,''),('2619','Entrust:1:12','2565','2568','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:26:00.102','2019-07-07 11:26:00.102',0,NULL,''),('2624','Contract:1:15','2620','2623','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:07.645','2019-07-07 11:26:07.645',0,NULL,''),('2626','Contract:1:15','2620','2625','subProcess',NULL,NULL,'å®¡æ‰¹å­æµç¨‹','subProcess',NULL,'2019-07-07 11:26:07.647','2019-07-07 11:27:25.457',77810,NULL,''),('2628','Contract:1:15','2620','2627','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:07.647','2019-07-07 11:26:07.647',0,NULL,''),('2629','Contract:1:15','2620','2627','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-07 11:26:07.647','2019-07-07 11:26:07.648',1,NULL,''),('2631','Contract:1:15','2620','2627','smContractReview','2632',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-07 11:26:07.648','2019-07-07 11:27:00.245',52597,NULL,''),('2634','Contract:1:15','2620','2630','qmContractReview','2635',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-07 11:26:07.649','2019-07-07 11:26:34.342',26693,NULL,''),('2641','Contract:1:15','2637','2640','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:10.956','2019-07-07 11:26:10.956',0,NULL,''),('2643','Contract:1:15','2637','2642','subProcess',NULL,NULL,'å®¡æ‰¹å­æµç¨‹','subProcess',NULL,'2019-07-07 11:26:10.959','2019-07-07 11:27:28.321',77362,NULL,''),('2645','Contract:1:15','2637','2644','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:10.959','2019-07-07 11:26:10.959',0,NULL,''),('2646','Contract:1:15','2637','2644','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-07 11:26:10.959','2019-07-07 11:26:10.960',1,NULL,''),('2648','Contract:1:15','2637','2644','smContractReview','2649',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-07 11:26:10.960','2019-07-07 11:27:03.243',52283,NULL,''),('2651','Contract:1:15','2637','2647','qmContractReview','2652',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-07 11:26:10.960','2019-07-07 11:26:38.364',27404,NULL,''),('2658','Contract:1:15','2654','2657','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:14.521','2019-07-07 11:26:14.522',1,NULL,''),('2660','Contract:1:15','2654','2659','subProcess',NULL,NULL,'å®¡æ‰¹å­æµç¨‹','subProcess',NULL,'2019-07-07 11:26:14.527','2019-07-07 11:27:31.031',76504,NULL,''),('2662','Contract:1:15','2654','2661','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:14.527','2019-07-07 11:26:14.527',0,NULL,''),('2663','Contract:1:15','2654','2661','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-07 11:26:14.527','2019-07-07 11:26:14.528',1,NULL,''),('2665','Contract:1:15','2654','2661','smContractReview','2666',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-07 11:26:14.528','2019-07-07 11:27:06.051',51523,NULL,''),('2668','Contract:1:15','2654','2664','qmContractReview','2669',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-07 11:26:14.529','2019-07-07 11:26:41.571',27042,NULL,''),('2675','Contract:1:15','2671','2674','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:18.276','2019-07-07 11:26:18.276',0,NULL,''),('2677','Contract:1:15','2671','2676','subProcess',NULL,NULL,'å®¡æ‰¹å­æµç¨‹','subProcess',NULL,'2019-07-07 11:26:18.278','2019-07-07 11:27:34.171',75893,NULL,''),('2679','Contract:1:15','2671','2678','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:18.278','2019-07-07 11:26:18.278',0,NULL,''),('2680','Contract:1:15','2671','2678','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-07 11:26:18.278','2019-07-07 11:26:18.279',1,NULL,''),('2682','Contract:1:15','2671','2678','smContractReview','2683',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-07 11:26:18.279','2019-07-07 11:27:08.614',50335,NULL,''),('2685','Contract:1:15','2671','2681','qmContractReview','2686',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-07 11:26:18.279','2019-07-07 11:26:44.738',26459,NULL,''),('2692','Contract:1:15','2688','2691','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:21.432','2019-07-07 11:26:21.432',0,NULL,''),('2694','Contract:1:15','2688','2693','subProcess',NULL,NULL,'å®¡æ‰¹å­æµç¨‹','subProcess',NULL,'2019-07-07 11:26:21.434','2019-07-07 11:27:37.195',75761,NULL,''),('2696','Contract:1:15','2688','2695','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:21.434','2019-07-07 11:26:21.434',0,NULL,''),('2697','Contract:1:15','2688','2695','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-07 11:26:21.434','2019-07-07 11:26:21.435',1,NULL,''),('2699','Contract:1:15','2688','2695','smContractReview','2700',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-07 11:26:21.435','2019-07-07 11:27:12.742',51307,NULL,''),('2702','Contract:1:15','2688','2698','qmContractReview','2703',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-07 11:26:21.436','2019-07-07 11:26:47.686',26250,NULL,''),('2709','Contract:1:15','2705','2708','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:24.412','2019-07-07 11:26:24.412',0,NULL,''),('2711','Contract:1:15','2705','2710','subProcess',NULL,NULL,'å®¡æ‰¹å­æµç¨‹','subProcess',NULL,'2019-07-07 11:26:24.414','2019-07-07 11:27:40.508',76094,NULL,''),('2713','Contract:1:15','2705','2712','subStart',NULL,NULL,'å­æµç¨‹å¼€å§‹','startEvent',NULL,'2019-07-07 11:26:24.414','2019-07-07 11:26:24.414',0,NULL,''),('2714','Contract:1:15','2705','2712','mApproveForkGate',NULL,NULL,'Fork','parallelGateway',NULL,'2019-07-07 11:26:24.414','2019-07-07 11:26:24.414',0,NULL,''),('2716','Contract:1:15','2705','2712','smContractReview','2717',NULL,'SM_ReviewContract','userTask',NULL,'2019-07-07 11:26:24.414','2019-07-07 11:27:16.018',51604,NULL,''),('2719','Contract:1:15','2705','2715','qmContractReview','2720',NULL,'QM_ReviewContract','userTask',NULL,'2019-07-07 11:26:24.415','2019-07-07 11:26:50.962',26547,NULL,''),('2728','Contract:1:15','2620','2630','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:26:34.342','2019-07-07 11:26:34.342',0,NULL,''),('2731','Contract:1:15','2637','2647','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:26:38.364','2019-07-07 11:26:38.364',0,NULL,''),('2734','Contract:1:15','2654','2664','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:26:41.571','2019-07-07 11:26:41.572',1,NULL,''),('2737','Contract:1:15','2671','2681','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:26:44.738','2019-07-07 11:26:44.738',0,NULL,''),('2740','Contract:1:15','2688','2698','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:26:47.686','2019-07-07 11:26:47.687',1,NULL,''),('2743','Contract:1:15','2705','2715','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:26:50.962','2019-07-07 11:26:50.963',1,NULL,''),('2744','Contract:1:15','2620','2627','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:27:00.245','2019-07-07 11:27:00.246',1,NULL,''),('2745','Contract:1:15','2620','2627','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:00.250','2019-07-07 11:27:00.250',0,NULL,''),('2746','Contract:1:15','2620','2627','cusContractReview','2747',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-07 11:27:00.251','2019-07-07 11:27:25.450',25199,NULL,''),('2749','Contract:1:15','2637','2644','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:27:03.243','2019-07-07 11:27:03.243',0,NULL,''),('2750','Contract:1:15','2637','2644','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:03.247','2019-07-07 11:27:03.248',1,NULL,''),('2751','Contract:1:15','2637','2644','cusContractReview','2752',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-07 11:27:03.249','2019-07-07 11:27:28.316',25067,NULL,''),('2754','Contract:1:15','2654','2661','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:27:06.051','2019-07-07 11:27:06.052',1,NULL,''),('2755','Contract:1:15','2654','2661','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:06.056','2019-07-07 11:27:06.056',0,NULL,''),('2756','Contract:1:15','2654','2661','cusContractReview','2757',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-07 11:27:06.057','2019-07-07 11:27:31.022',24965,NULL,''),('2759','Contract:1:15','2671','2678','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:27:08.614','2019-07-07 11:27:08.615',1,NULL,''),('2760','Contract:1:15','2671','2678','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:08.618','2019-07-07 11:27:08.618',0,NULL,''),('2761','Contract:1:15','2671','2678','cusContractReview','2762',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-07 11:27:08.619','2019-07-07 11:27:34.166',25547,NULL,''),('2764','Contract:1:15','2688','2695','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:27:12.742','2019-07-07 11:27:12.743',1,NULL,''),('2765','Contract:1:15','2688','2695','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:12.746','2019-07-07 11:27:12.746',0,NULL,''),('2766','Contract:1:15','2688','2695','cusContractReview','2767',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-07 11:27:12.747','2019-07-07 11:27:37.190',24443,NULL,''),('2769','Contract:1:15','2705','2712','mApproveJoinGate',NULL,NULL,'Join','parallelGateway',NULL,'2019-07-07 11:27:16.018','2019-07-07 11:27:16.018',0,NULL,''),('2770','Contract:1:15','2705','2712','mReviewGate',NULL,NULL,'ManagerReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:16.023','2019-07-07 11:27:16.024',1,NULL,''),('2771','Contract:1:15','2705','2712','cusContractReview','2772',NULL,'CUS_ReviewContract','userTask','u20190609235901','2019-07-07 11:27:16.025','2019-07-07 11:27:40.502',24477,NULL,''),('2774','Contract:1:15','2620','2627','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:25.450','2019-07-07 11:27:25.450',0,NULL,''),('2775','Contract:1:15','2620','2627','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-07 11:27:25.451','2019-07-07 11:27:25.451',0,NULL,''),('2777','Contract:1:15','2620','2776','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:25.460','2019-07-07 11:27:25.460',0,NULL,''),('2778','Contract:1:15','2620','2776','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:27:25.461','2019-07-07 11:27:25.461',0,NULL,''),('2779','Contract:1:15','2637','2644','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:28.316','2019-07-07 11:27:28.316',0,NULL,''),('2780','Contract:1:15','2637','2644','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-07 11:27:28.317','2019-07-07 11:27:28.317',0,NULL,''),('2782','Contract:1:15','2637','2781','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:28.323','2019-07-07 11:27:28.323',0,NULL,''),('2783','Contract:1:15','2637','2781','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:27:28.323','2019-07-07 11:27:28.323',0,NULL,''),('2784','Contract:1:15','2654','2661','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:31.022','2019-07-07 11:27:31.022',0,NULL,''),('2785','Contract:1:15','2654','2661','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-07 11:27:31.023','2019-07-07 11:27:31.023',0,NULL,''),('2787','Contract:1:15','2654','2786','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:31.035','2019-07-07 11:27:31.036',1,NULL,''),('2788','Contract:1:15','2654','2786','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:27:31.036','2019-07-07 11:27:31.036',0,NULL,''),('2789','Contract:1:15','2671','2678','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:34.166','2019-07-07 11:27:34.166',0,NULL,''),('2790','Contract:1:15','2671','2678','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-07 11:27:34.167','2019-07-07 11:27:34.167',0,NULL,''),('2792','Contract:1:15','2671','2791','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:34.176','2019-07-07 11:27:34.176',0,NULL,''),('2793','Contract:1:15','2671','2791','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:27:34.176','2019-07-07 11:27:34.176',0,NULL,''),('2794','Contract:1:15','2688','2695','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:37.190','2019-07-07 11:27:37.190',0,NULL,''),('2795','Contract:1:15','2688','2695','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-07 11:27:37.191','2019-07-07 11:27:37.191',0,NULL,''),('2797','Contract:1:15','2688','2796','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:37.197','2019-07-07 11:27:37.197',0,NULL,''),('2798','Contract:1:15','2688','2796','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:27:37.197','2019-07-07 11:27:37.197',0,NULL,''),('2799','Contract:1:15','2705','2712','cusReviewGate',NULL,NULL,'CusReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:40.503','2019-07-07 11:27:40.503',0,NULL,''),('2800','Contract:1:15','2705','2712','subPassEnd',NULL,NULL,'SubPassEnd','endEvent',NULL,'2019-07-07 11:27:40.504','2019-07-07 11:27:40.504',0,NULL,''),('2802','Contract:1:15','2705','2801','reviewGate',NULL,NULL,'ReviewGate','exclusiveGateway',NULL,'2019-07-07 11:27:40.511','2019-07-07 11:27:40.511',0,NULL,''),('2803','Contract:1:15','2705','2801','end',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2019-07-07 11:27:40.511','2019-07-07 11:27:40.511',0,NULL,''),('2811','TestPlan:1:16','2807','2810','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-07 11:28:41.244','2019-07-07 11:28:41.244',0,NULL,''),('2812','TestPlan:1:16','2807','2810','QMTestPlanReview','2813',NULL,'QM_ReviewTestPlan','userTask',NULL,'2019-07-07 11:28:41.244','2019-07-07 11:29:41.618',60374,NULL,''),('2819','TestPlan:1:16','2815','2818','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-07 11:28:45.070','2019-07-07 11:28:45.070',0,NULL,''),('2820','TestPlan:1:16','2815','2818','QMTestPlanReview','2821',NULL,'QM_ReviewTestPlan','userTask',NULL,'2019-07-07 11:28:45.070','2019-07-07 11:29:44.546',59476,NULL,''),('2827','TestPlan:1:16','2823','2826','start',NULL,NULL,'Start','startEvent',NULL,'2019-07-07 11:28:48.595','2019-07-07 11:28:48.595',0,NULL,''),('2828','TestPlan:1:16','2823','2826','QMTestPlanReview','2829',NULL,'QM_ReviewTestPlan','userTask',NULL,'2019-07-07 11:28:48.595','2019-07-07 11:29:51.801',63206,NULL,''),('2833','TestPlan:1:16','2807','2810','QMReviewGate',NULL,NULL,'QMReviewGate','exclusiveGateway',NULL,'2019-07-07 11:29:41.618','2019-07-07 11:29:41.619',1,NULL,''),('2834','TestPlan:1:16','2807','2810','TMTestPlanApprove','2835',NULL,'TM_ApproveTestPlan','userTask',NULL,'2019-07-07 11:29:41.619','2019-07-07 11:30:00.634',19015,NULL,''),('2841','TestPlan:1:16','2815','2818','QMReviewGate',NULL,NULL,'QMReviewGate','exclusiveGateway',NULL,'2019-07-07 11:29:44.546','2019-07-07 11:29:44.546',0,NULL,''),('2842','TestPlan:1:16','2815','2818','TMTestPlanApprove','2843',NULL,'TM_ApproveTestPlan','userTask',NULL,'2019-07-07 11:29:44.546','2019-07-07 11:30:03.168',18622,NULL,''),('2847','TestPlan:1:16','2823','2826','QMReviewGate',NULL,NULL,'QMReviewGate','exclusiveGateway',NULL,'2019-07-07 11:29:51.801','2019-07-07 11:29:51.801',0,NULL,''),('2848','TestPlan:1:16','2823','2826','TMTestPlanApprove','2849',NULL,'TM_ApproveTestPlan','userTask',NULL,'2019-07-07 11:29:51.802','2019-07-07 11:30:05.340',13538,NULL,''),('2851','TestPlan:1:16','2807','2810','TMApproveGate',NULL,NULL,'TMApproveGate','exclusiveGateway',NULL,'2019-07-07 11:30:00.634','2019-07-07 11:30:00.634',0,NULL,''),('2852','TestPlan:1:16','2807','2810','end',NULL,NULL,'End','endEvent',NULL,'2019-07-07 11:30:00.634','2019-07-07 11:30:00.634',0,NULL,''),('2853','TestPlan:1:16','2815','2818','TMApproveGate',NULL,NULL,'TMApproveGate','exclusiveGateway',NULL,'2019-07-07 11:30:03.168','2019-07-07 11:30:03.168',0,NULL,''),('2854','TestPlan:1:16','2815','2818','end',NULL,NULL,'End','endEvent',NULL,'2019-07-07 11:30:03.168','2019-07-07 11:30:03.168',0,NULL,''),('2855','TestPlan:1:16','2823','2826','TMApproveGate',NULL,NULL,'TMApproveGate','exclusiveGateway',NULL,'2019-07-07 11:30:05.340','2019-07-07 11:30:05.340',0,NULL,''),('2856','TestPlan:1:16','2823','2826','end',NULL,NULL,'End','endEvent',NULL,'2019-07-07 11:30:05.340','2019-07-07 11:30:05.340',0,NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('2508','SS','candidate',NULL,'2507',NULL),('2516','SS','candidate',NULL,'2515',NULL),('2524','SS','candidate',NULL,'2523',NULL),('2532','SS','candidate',NULL,'2531',NULL),('2540','SS','candidate',NULL,'2539',NULL),('2548','SS','candidate',NULL,'2547',NULL),('2556','SS','candidate',NULL,'2555',NULL),('2564','SS','candidate',NULL,'2563',NULL),('2572','SS','candidate',NULL,'2571',NULL),('2633','SM','candidate',NULL,'2632',NULL),('2636','QM','candidate',NULL,'2635',NULL),('2650','SM','candidate',NULL,'2649',NULL),('2653','QM','candidate',NULL,'2652',NULL),('2667','SM','candidate',NULL,'2666',NULL),('2670','QM','candidate',NULL,'2669',NULL),('2684','SM','candidate',NULL,'2683',NULL),('2687','QM','candidate',NULL,'2686',NULL),('2701','SM','candidate',NULL,'2700',NULL),('2704','QM','candidate',NULL,'2703',NULL),('2718','SM','candidate',NULL,'2717',NULL),('2721','QM','candidate',NULL,'2720',NULL),('2748',NULL,'participant','u20190609235901',NULL,'2620'),('2753',NULL,'participant','u20190609235901',NULL,'2637'),('2758',NULL,'participant','u20190609235901',NULL,'2654'),('2763',NULL,'participant','u20190609235901',NULL,'2671'),('2768',NULL,'participant','u20190609235901',NULL,'2688'),('2773',NULL,'participant','u20190609235901',NULL,'2705'),('2814','QM','candidate',NULL,'2813',NULL),('2822','QM','candidate',NULL,'2821',NULL),('2830','QM','candidate',NULL,'2829',NULL),('2836','TM','candidate',NULL,'2835',NULL),('2844','TM','candidate',NULL,'2843',NULL),('2850','TM','candidate',NULL,'2849',NULL);
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
INSERT INTO `act_hi_procinst` VALUES ('2501','2501',NULL,'Entrust:1:12','2019-07-07 11:24:34.468','2019-07-07 11:25:16.794',42326,NULL,'start','end',NULL,NULL,'',NULL),('2509','2509',NULL,'Entrust:1:12','2019-07-07 11:24:38.925','2019-07-07 11:25:25.258',46333,NULL,'start','end',NULL,NULL,'',NULL),('2517','2517',NULL,'Entrust:1:12','2019-07-07 11:24:42.686','2019-07-07 11:25:30.514',47828,NULL,'start','end',NULL,NULL,'',NULL),('2525','2525',NULL,'Entrust:1:12','2019-07-07 11:24:46.218','2019-07-07 11:25:34.759',48541,NULL,'start','end',NULL,NULL,'',NULL),('2533','2533',NULL,'Entrust:1:12','2019-07-07 11:24:49.706','2019-07-07 11:25:39.597',49891,NULL,'start','end',NULL,NULL,'',NULL),('2541','2541',NULL,'Entrust:1:12','2019-07-07 11:24:53.083','2019-07-07 11:25:45.188',52105,NULL,'start','end',NULL,NULL,'',NULL),('2549','2549',NULL,'Entrust:1:12','2019-07-07 11:24:56.700','2019-07-07 11:25:49.966',53266,NULL,'start','end',NULL,NULL,'',NULL),('2557','2557',NULL,'Entrust:1:12','2019-07-07 11:25:01.325','2019-07-07 11:25:55.104',53779,NULL,'start','end',NULL,NULL,'',NULL),('2565','2565',NULL,'Entrust:1:12','2019-07-07 11:25:04.677','2019-07-07 11:26:00.108',55431,NULL,'start','end',NULL,NULL,'',NULL),('2620','2620',NULL,'Contract:1:15','2019-07-07 11:26:07.645','2019-07-07 11:27:25.469',77824,NULL,'start','end',NULL,NULL,'',NULL),('2637','2637',NULL,'Contract:1:15','2019-07-07 11:26:10.956','2019-07-07 11:27:28.333',77377,NULL,'start','end',NULL,NULL,'',NULL),('2654','2654',NULL,'Contract:1:15','2019-07-07 11:26:14.521','2019-07-07 11:27:31.046',76525,NULL,'start','end',NULL,NULL,'',NULL),('2671','2671',NULL,'Contract:1:15','2019-07-07 11:26:18.275','2019-07-07 11:27:34.186',75911,NULL,'start','end',NULL,NULL,'',NULL),('2688','2688',NULL,'Contract:1:15','2019-07-07 11:26:21.432','2019-07-07 11:27:37.202',75770,NULL,'start','end',NULL,NULL,'',NULL),('2705','2705',NULL,'Contract:1:15','2019-07-07 11:26:24.412','2019-07-07 11:27:40.521',76109,NULL,'start','end',NULL,NULL,'',NULL),('2807','2807',NULL,'TestPlan:1:16','2019-07-07 11:28:41.243','2019-07-07 11:30:00.643',79400,NULL,'start','end',NULL,NULL,'',NULL),('2815','2815',NULL,'TestPlan:1:16','2019-07-07 11:28:45.070','2019-07-07 11:30:03.176',78106,NULL,'start','end',NULL,NULL,'',NULL),('2823','2823',NULL,'TestPlan:1:16','2019-07-07 11:28:48.595','2019-07-07 11:30:05.349',76754,NULL,'start','end',NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('2507','Entrust:1:12','reviewEntrust','2501','2504','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:34.573',NULL,'2019-07-07 11:25:16.769',42196,NULL,50,NULL,NULL,NULL,''),('2515','Entrust:1:12','reviewEntrust','2509','2512','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:38.925',NULL,'2019-07-07 11:25:25.250',46325,NULL,50,NULL,NULL,NULL,''),('2523','Entrust:1:12','reviewEntrust','2517','2520','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:42.687',NULL,'2019-07-07 11:25:30.506',47819,NULL,50,NULL,NULL,NULL,''),('2531','Entrust:1:12','reviewEntrust','2525','2528','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:46.218',NULL,'2019-07-07 11:25:34.750',48532,NULL,50,NULL,NULL,NULL,''),('2539','Entrust:1:12','reviewEntrust','2533','2536','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:49.706',NULL,'2019-07-07 11:25:39.583',49877,NULL,50,NULL,NULL,NULL,''),('2547','Entrust:1:12','reviewEntrust','2541','2544','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:53.084',NULL,'2019-07-07 11:25:45.175',52091,NULL,50,NULL,NULL,NULL,''),('2555','Entrust:1:12','reviewEntrust','2549','2552','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:24:56.700',NULL,'2019-07-07 11:25:49.958',53258,NULL,50,NULL,NULL,NULL,''),('2563','Entrust:1:12','reviewEntrust','2557','2560','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:25:01.326',NULL,'2019-07-07 11:25:55.097',53771,NULL,50,NULL,NULL,NULL,''),('2571','Entrust:1:12','reviewEntrust','2565','2568','SS_Review',NULL,NULL,NULL,NULL,'2019-07-07 11:25:04.678',NULL,'2019-07-07 11:26:00.101',55423,NULL,50,NULL,NULL,NULL,''),('2632','Contract:1:15','smContractReview','2620','2627','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:07.648',NULL,'2019-07-07 11:27:00.244',52596,NULL,50,NULL,NULL,NULL,''),('2635','Contract:1:15','qmContractReview','2620','2630','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:07.649',NULL,'2019-07-07 11:26:34.341',26692,NULL,50,NULL,NULL,NULL,''),('2649','Contract:1:15','smContractReview','2637','2644','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:10.960',NULL,'2019-07-07 11:27:03.242',52282,NULL,50,NULL,NULL,NULL,''),('2652','Contract:1:15','qmContractReview','2637','2647','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:10.960',NULL,'2019-07-07 11:26:38.363',27403,NULL,50,NULL,NULL,NULL,''),('2666','Contract:1:15','smContractReview','2654','2661','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:14.528',NULL,'2019-07-07 11:27:06.050',51522,NULL,50,NULL,NULL,NULL,''),('2669','Contract:1:15','qmContractReview','2654','2664','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:14.529',NULL,'2019-07-07 11:26:41.570',27041,NULL,50,NULL,NULL,NULL,''),('2683','Contract:1:15','smContractReview','2671','2678','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:18.279',NULL,'2019-07-07 11:27:08.613',50334,NULL,50,NULL,NULL,NULL,''),('2686','Contract:1:15','qmContractReview','2671','2681','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:18.280',NULL,'2019-07-07 11:26:44.737',26457,NULL,50,NULL,NULL,NULL,''),('2700','Contract:1:15','smContractReview','2688','2695','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:21.435',NULL,'2019-07-07 11:27:12.741',51306,NULL,50,NULL,NULL,NULL,''),('2703','Contract:1:15','qmContractReview','2688','2698','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:21.436',NULL,'2019-07-07 11:26:47.685',26249,NULL,50,NULL,NULL,NULL,''),('2717','Contract:1:15','smContractReview','2705','2712','SM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:24.414',NULL,'2019-07-07 11:27:16.017',51603,NULL,50,NULL,NULL,NULL,''),('2720','Contract:1:15','qmContractReview','2705','2715','QM_ReviewContract',NULL,NULL,NULL,NULL,'2019-07-07 11:26:24.415',NULL,'2019-07-07 11:26:50.961',26546,NULL,50,NULL,NULL,NULL,''),('2747','Contract:1:15','cusContractReview','2620','2627','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-07 11:27:00.251','2019-07-07 11:27:25.321','2019-07-07 11:27:25.449',25198,NULL,50,NULL,NULL,NULL,''),('2752','Contract:1:15','cusContractReview','2637','2644','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-07 11:27:03.249','2019-07-07 11:27:28.213','2019-07-07 11:27:28.315',25066,NULL,50,NULL,NULL,NULL,''),('2757','Contract:1:15','cusContractReview','2654','2661','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-07 11:27:06.057','2019-07-07 11:27:30.955','2019-07-07 11:27:31.020',24963,NULL,50,NULL,NULL,NULL,''),('2762','Contract:1:15','cusContractReview','2671','2678','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-07 11:27:08.619','2019-07-07 11:27:34.115','2019-07-07 11:27:34.165',25546,NULL,50,NULL,NULL,NULL,''),('2767','Contract:1:15','cusContractReview','2688','2695','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-07 11:27:12.747','2019-07-07 11:27:37.112','2019-07-07 11:27:37.189',24442,NULL,50,NULL,NULL,NULL,''),('2772','Contract:1:15','cusContractReview','2705','2712','CUS_ReviewContract',NULL,NULL,NULL,'u20190609235901','2019-07-07 11:27:16.025','2019-07-07 11:27:40.444','2019-07-07 11:27:40.501',24476,NULL,50,NULL,NULL,NULL,''),('2813','TestPlan:1:16','QMTestPlanReview','2807','2810','QM_ReviewTestPlan',NULL,NULL,NULL,NULL,'2019-07-07 11:28:41.244',NULL,'2019-07-07 11:29:41.617',60373,NULL,50,NULL,NULL,NULL,''),('2821','TestPlan:1:16','QMTestPlanReview','2815','2818','QM_ReviewTestPlan',NULL,NULL,NULL,NULL,'2019-07-07 11:28:45.070',NULL,'2019-07-07 11:29:44.545',59475,NULL,50,NULL,NULL,NULL,''),('2829','TestPlan:1:16','QMTestPlanReview','2823','2826','QM_ReviewTestPlan',NULL,NULL,NULL,NULL,'2019-07-07 11:28:48.595',NULL,'2019-07-07 11:29:51.801',63206,NULL,50,NULL,NULL,NULL,''),('2835','TestPlan:1:16','TMTestPlanApprove','2807','2810','TM_ApproveTestPlan',NULL,NULL,NULL,NULL,'2019-07-07 11:29:41.619',NULL,'2019-07-07 11:30:00.633',19014,NULL,50,NULL,NULL,NULL,''),('2843','TestPlan:1:16','TMTestPlanApprove','2815','2818','TM_ApproveTestPlan',NULL,NULL,NULL,NULL,'2019-07-07 11:29:44.546',NULL,'2019-07-07 11:30:03.167',18621,NULL,50,NULL,NULL,NULL,''),('2849','TestPlan:1:16','TMTestPlanApprove','2823','2826','TM_ApproveTestPlan',NULL,NULL,NULL,NULL,'2019-07-07 11:29:51.802',NULL,'2019-07-07 11:30:05.339',13537,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('2502','2501','2501',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:34.554','2019-07-07 11:24:34.554'),('2503','2501','2501',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010112',NULL,'2019-07-07 11:24:34.555','2019-07-07 11:24:34.555'),('2510','2509','2509',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:38.925','2019-07-07 11:24:38.925'),('2511','2509','2509',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010111',NULL,'2019-07-07 11:24:38.925','2019-07-07 11:24:38.925'),('2518','2517','2517',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:42.686','2019-07-07 11:24:42.686'),('2519','2517','2517',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010110',NULL,'2019-07-07 11:24:42.686','2019-07-07 11:24:42.686'),('2526','2525','2525',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:46.218','2019-07-07 11:24:46.218'),('2527','2525','2525',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010107',NULL,'2019-07-07 11:24:46.218','2019-07-07 11:24:46.218'),('2534','2533','2533',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:49.706','2019-07-07 11:24:49.706'),('2535','2533','2533',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010108',NULL,'2019-07-07 11:24:49.706','2019-07-07 11:24:49.706'),('2542','2541','2541',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:53.083','2019-07-07 11:24:53.083'),('2543','2541','2541',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010109',NULL,'2019-07-07 11:24:53.083','2019-07-07 11:24:53.083'),('2550','2549','2549',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:24:56.700','2019-07-07 11:24:56.700'),('2551','2549','2549',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010106',NULL,'2019-07-07 11:24:56.700','2019-07-07 11:24:56.700'),('2558','2557','2557',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:25:01.325','2019-07-07 11:25:01.325'),('2559','2557','2557',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010105',NULL,'2019-07-07 11:25:01.325','2019-07-07 11:25:01.325'),('2566','2565','2565',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:25:04.677','2019-07-07 11:25:04.677'),('2567','2565','2565',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190610010103',NULL,'2019-07-07 11:25:04.677','2019-07-07 11:25:04.677'),('2576','2501','2501',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:16.767','2019-07-07 11:25:16.767'),('2577','2501','2501',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:16.767','2019-07-07 11:25:16.767'),('2588','2509','2509',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:25.249','2019-07-07 11:25:25.249'),('2589','2509','2509',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:25.249','2019-07-07 11:25:25.249'),('2592','2517','2517',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:30.505','2019-07-07 11:25:30.505'),('2593','2517','2517',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:30.505','2019-07-07 11:25:30.505'),('2596','2525','2525',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:34.748','2019-07-07 11:25:34.748'),('2597','2525','2525',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:34.748','2019-07-07 11:25:34.748'),('2600','2533','2533',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:39.581','2019-07-07 11:25:39.581'),('2601','2533','2533',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:39.581','2019-07-07 11:25:39.581'),('2604','2541','2541',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:45.172','2019-07-07 11:25:45.172'),('2605','2541','2541',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:45.172','2019-07-07 11:25:45.172'),('2608','2549','2549',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:49.957','2019-07-07 11:25:49.957'),('2609','2549','2549',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:49.957','2019-07-07 11:25:49.957'),('2612','2557','2557',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:25:55.096','2019-07-07 11:25:55.096'),('2613','2557','2557',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:25:55.096','2019-07-07 11:25:55.096'),('2616','2565','2565',NULL,'ReviewComment','string',0,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:26:00.100','2019-07-07 11:26:00.100'),('2617','2565','2565',NULL,'ReviewResult','string',0,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:00.100','2019-07-07 11:26:00.100'),('2621','2620','2620',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:26:07.645','2019-07-07 11:26:07.645'),('2622','2620','2620',NULL,'ContractID','string',0,NULL,NULL,NULL,'p20190610010105',NULL,'2019-07-07 11:26:07.645','2019-07-07 11:26:07.645'),('2638','2637','2637',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:26:10.956','2019-07-07 11:26:10.956'),('2639','2637','2637',NULL,'ContractID','string',0,NULL,NULL,NULL,'p20190610010106',NULL,'2019-07-07 11:26:10.956','2019-07-07 11:26:10.956'),('2655','2654','2654',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:26:14.521','2019-07-07 11:26:14.521'),('2656','2654','2654',NULL,'ContractID','string',0,NULL,NULL,NULL,'p20190610010109',NULL,'2019-07-07 11:26:14.521','2019-07-07 11:26:14.521'),('2672','2671','2671',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:26:18.275','2019-07-07 11:26:18.275'),('2673','2671','2671',NULL,'ContractID','string',0,NULL,NULL,NULL,'p20190610010107',NULL,'2019-07-07 11:26:18.275','2019-07-07 11:26:18.275'),('2689','2688','2688',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:26:21.432','2019-07-07 11:26:21.432'),('2690','2688','2688',NULL,'ContractID','string',0,NULL,NULL,NULL,'p20190610010108',NULL,'2019-07-07 11:26:21.432','2019-07-07 11:26:21.432'),('2706','2705','2705',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:26:24.412','2019-07-07 11:26:24.412'),('2707','2705','2705',NULL,'ContractID','string',0,NULL,NULL,NULL,'p20190610010110',NULL,'2019-07-07 11:26:24.412','2019-07-07 11:26:24.412'),('2726','2620','2620',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-07 11:26:34.340','2019-07-07 11:27:25.447'),('2727','2620','2620',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:34.340','2019-07-07 11:27:25.447'),('2729','2637','2637',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-07 11:26:38.361','2019-07-07 11:27:28.311'),('2730','2637','2637',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:38.361','2019-07-07 11:27:28.313'),('2732','2654','2654',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-07 11:26:41.569','2019-07-07 11:27:31.017'),('2733','2654','2654',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:41.569','2019-07-07 11:27:31.018'),('2735','2671','2671',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-07 11:26:44.735','2019-07-07 11:27:34.163'),('2736','2671','2671',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:44.735','2019-07-07 11:27:34.163'),('2738','2688','2688',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-07 11:26:47.682','2019-07-07 11:27:37.187'),('2739','2688','2688',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:47.682','2019-07-07 11:27:37.187'),('2741','2705','2705',NULL,'ReviewComment','string',2,NULL,NULL,NULL,'',NULL,'2019-07-07 11:26:50.960','2019-07-07 11:27:40.499'),('2742','2705','2705',NULL,'ReviewResult','string',2,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:26:50.960','2019-07-07 11:27:40.500'),('2808','2807','2807',NULL,'TestPlanID','string',0,NULL,NULL,NULL,'p20190610010108',NULL,'2019-07-07 11:28:41.243','2019-07-07 11:28:41.243'),('2809','2807','2807',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:28:41.243','2019-07-07 11:28:41.243'),('2816','2815','2815',NULL,'TestPlanID','string',0,NULL,NULL,NULL,'p20190610010109',NULL,'2019-07-07 11:28:45.070','2019-07-07 11:28:45.070'),('2817','2815','2815',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:28:45.070','2019-07-07 11:28:45.070'),('2824','2823','2823',NULL,'TestPlanID','string',0,NULL,NULL,NULL,'p20190610010107',NULL,'2019-07-07 11:28:48.595','2019-07-07 11:28:48.595'),('2825','2823','2823',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190609235901',NULL,'2019-07-07 11:28:48.595','2019-07-07 11:28:48.595'),('2831','2807','2807',NULL,'ReviewComment','string',1,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:29:41.615','2019-07-07 11:30:00.632'),('2832','2807','2807',NULL,'ReviewResult','string',1,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:29:41.615','2019-07-07 11:30:00.632'),('2839','2815','2815',NULL,'ReviewComment','string',1,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:29:44.544','2019-07-07 11:30:03.165'),('2840','2815','2815',NULL,'ReviewResult','string',1,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:29:44.544','2019-07-07 11:30:03.165'),('2845','2823','2823',NULL,'ReviewComment','string',1,NULL,NULL,NULL,'æ— ',NULL,'2019-07-07 11:29:51.799','2019-07-07 11:30:05.337'),('2846','2823','2823',NULL,'ReviewResult','string',1,NULL,NULL,NULL,'ReviewPass',NULL,'2019-07-07 11:29:51.799','2019-07-07 11:30:05.338');
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-07-07 11:19:27.568',NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_contract`
--

LOCK TABLES `tbl_sys_contract` WRITE;
/*!40000 ALTER TABLE `tbl_sys_contract` DISABLE KEYS */;
INSERT INTO `tbl_sys_contract` VALUES (60,'p20190610010105','2620',2,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','u20190609235901','',NULL),(58,'p20190610010106','2637',2,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','u20190609235901','',NULL),(56,'p20190610010109','2654',2,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','u20190609235901','',NULL),(52,'p20190610010107','2671',2,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','u20190609235901','',NULL),(54,'p20190610010108','2688',2,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','u20190609235901','',NULL),(50,'p20190610010110','2705',2,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','u20190609235901','',NULL),(48,'p20190610010111','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901',NULL,NULL),(46,'p20190610010112','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901',NULL,NULL),(62,'p20190610010103','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901',NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (146,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010114','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','LittleBirdè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902',NULL,NULL),(144,'2501',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010112','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Worldè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(145,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010113','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','Gameè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235902',NULL,NULL),(143,'2509',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010111','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Helloè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(142,'2517',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010110','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','ABCDEè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(139,'2525',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010107','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','ABCDEè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(140,'2533',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010108','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Helloè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(141,'2541',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010109','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Worldè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(138,'2549',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010106','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Worldè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(137,'2557',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010105','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Helloè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(135,'2565',2,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.tsample.code\"]','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,' ','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010103','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','[\"basic-form.checkbox.architecture1\"]','','100','Java','[\"basic-form.checkbox.softarch1\"]','æ— ','19.0','æ— ','Linux','Worldè½¯ä»¶','','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901','æ— ',NULL),(136,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010104','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','ABCDEè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL),(133,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010101','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','ABCDEè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL),(134,'',0,NULL,'basic-form.others.viruses.complete','\"\"','90','2','æ— ','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','100000','ä¸­æ–‡çš„ABC','ABC','NJU','basic-form.others.SecLev.public',NULL,'2019.07.25','18','æœ‰äº›è½¯ä»¶çœ‹èµ·æ¥æ˜¯ä¸€ä¸ªä½œä¸šï¼Œå…¶å®å®ƒä¸ä»…ä¸èƒ½è¢«ä½œä¸ºä¸€ä¸ªä½œä¸šï¼Œå¾ˆç²—ç³™ï¼Œè¿˜è·‘ä¸èµ·æ¥','17','å—äº¬å¤§å­¦ä»™æ—æ ¡åŒº','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io',NULL,'p20190610010102','form.sample.radio.destruction','.TXT,B/TXT','basic-form.mediumg.label','mySQL','5000','\"\"','æ— ','100','Java','\"\"','æ— ','19.0','æ— ','Linux','Helloè½¯ä»¶','basic-form.radio.system1','\"basic-form.radio.basis1\"','[\"basic-form.radio.target2\",\"basic-form.radio.target5\",\"basic-form.radio.target4\",\"basic-form.radio.target1\",\"basic-form.radio.target7\"]','[\"basic-form.radio.confirm\"]','basic-form.radio.domestic','è®¤çœŸæ¬ç –çš„ä¸€ç¾¤å°æœ‹å‹','1.0.2','æ— ','u20190609235901',NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062933 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testplan`
--

LOCK TABLES `tbl_sys_testplan` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testplan` DISABLE KEYS */;
INSERT INTO `tbl_sys_testplan` VALUES (2019062931,'p20190610010108','2807',2,'','','',NULL,'',NULL,'','','æ— ',NULL,'u20190609235901'),(2019062929,'p20190610010109','2815',2,'','','',NULL,'',NULL,'','','æ— ',NULL,'u20190609235901'),(2019062930,'p20190610010107','2823',2,'','','',NULL,'',NULL,'','','æ— ',NULL,'u20190609235901'),(2019062927,'p20190610010105','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901'),(2019062928,'p20190610010106','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901'),(2019062932,'p20190610010110','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901');
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
) ENGINE=MyISAM AUTO_INCREMENT=2019062924 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testreport`
--

LOCK TABLES `tbl_sys_testreport` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testreport` DISABLE KEYS */;
INSERT INTO `tbl_sys_testreport` VALUES (2019062922,'p20190610010109','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901'),(2019062923,'p20190610010107','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901'),(2019062921,'p20190610010108','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'u20190609235901');
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
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (128,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,STAFF,USER','u20190609235951','QMA'),(129,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN','u20190609235900','admin'),(127,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,STAFF,USER','u20190609235941','TMA'),(126,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,STAFF,USER','u20190609235931','SMA'),(125,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,STAFF,USER','u20190609235922','TSB'),(124,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,STAFF,USER','u20190609235921','TSA'),(123,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,STAFF,USER','u20190609235912','SSB'),(122,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,STAFF,USER','u20190609235911','SSA'),(120,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190609235902','CUSB'),(121,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190609235903','CUSC'),(118,'$2a$10$swEZoj6b1JAogCMQhLvus.4pOGCLM8.ykawX1e7v8b12tDQ2idzzK','USER,ADMIN,CUS,STAFF,SS,SM,TS,TM,QM','u20190609235999','BOSS'),(119,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190609235901','CUSA');
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

-- Dump completed on 2019-07-07 11:30:25
