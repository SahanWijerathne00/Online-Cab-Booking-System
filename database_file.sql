-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mega
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(15) NOT NULL,
  `avatar` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (3,'Sahan','admin','admin123','Staff Admin',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z(!1!%)+...383-7(-.+\n\n\n\r2% \"//-//++8-/-----/---+5------------------------+----ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0D\0\0\0\0\0!1AQaq\"R‘¡±24BSbr’²Á\Ñ#3s‚¢$Cğc\ÒD“\Âÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0.\0\0\0\0\0\0\0\0!1Q\"2Aqa‘¡\Ñ#3BRÿ\Ú\0\0\0?\0¼Q\0DDjv£§}D€\Û\0\Ñ\Å\Îq³G¯š”²ğ€\Ú-¢¥\Ã\ØPü ›5 ]\Î<ò´q·UûÀq\êjøûJy\Ç89§£šuq\ZÚ¼b¯1ò?\ÉkG\Éc:5£‰+\Zº†¯±\âHAm\Ø\\\Ú|\×7\å7¹_ô ½.[œ\åòe\í¦%%m|\î\Ì\ç\Õ\ÑF\İMš\×dcX9^À\éÌ­]vQL[\ÛE$D\ê\Üà´›q²•\ìV\ÇU>x¦–#Mp“Ë°s­«@g6\Ô\ÙL7‰³r\×E„$n\')!¥\Í#P\Òt¾œ\Õvx…u\İ\Z“Xù}‹-\ÅÈ“\îó5tR\Êû–5\Ì{\Ü|\ÂE\Ü\ã\İk’¿x~\Ş\á\Õü9Áy9Z\ëÇ»£t\'§^KŸ§§ª€º¶ff\"ñ\à<H\Ñ\ŞÕ‘‰\ì\åe$lšX‹\Zã¡¾­<ƒÀù\'¢µ\×[~\îx+õv:}qºÍ¹ugûZ‹™š\Ò\æIõm®ö…ÇŠ±\Õƒ‹\Ã:L\"\"\äD@\0DDD@\0DDD@·h°x\ë©\ä‚N\Z5\ÃV¸x-„®°\' \'\Ô7\ã{UˆU\Êğg–\Å\Ä68\Éhö\rº•mU¹<§Œ\Ş\ZJ©pÚ¼\Í ¾\'¹‡)»^³†œAW†#ˆÁOo=š\Ğµ\0›‘£Z<\ílª½\Ù\n©jc|Ğ¹±5İ£‹Å³¨\0N¶_]\ëbÎ’¨Sƒ\äBÖ’?ò<|hõ¬ºº\á©\ÔF|-\Ú\íØº¶\ëƒl÷\Ş]T\"\0Ø™Èò:’t“oñ:\æ`ñ\Ñ\íi\Ë+v{N\Êx\êjcK+Dk…\Ú\Æ;V\è~‘\'\Æ\Ê]Œ\ì•\r[$ƒK1­cšz´kO\Ò\ÓCÒ Šº\æ÷\É\Ù=°ƒò\\\Ğ\É\Ú/”Ø‚9º7h\â_{x»ÌŒ¦\0J~Û\í\èö¨¦/E6ZX\å\Âğ\æ¼i™¼Z}-6#¼…am\æ\nüJš\ZŠvfxhvQlÅ\0\Ø_‰—Š\Èôõiµ0Ÿú¾?Z§)Á¯“3r\Û8\ÆDk\\CŸ%\ãeµ\ÈÀ|«ı¢G¨g®^W\á\æÙ§€\Ü\Ø]\ìóÓW†\êñ¹\ëh³\Î\ì\Ïd6—p\0M¹\ê·\İıy\Ê(]‰Š\",\çAD@\0DDD@\0DD:\ä»Àû—/SV\Zj‘(m\Ìre7!\ÇC\Ñu*‹\ã›…\Ôg’hI»œö9Ñ÷¦\ÇÒ®ªqT–Ì†ˆ\Ìo*\Ù[\átOuòœÁ\ì\'¯`Aô(.ò©]!1<$\È\ßZ}­r\Ó9\â\Zœ\ÔÄ¸2[\ÄO\0\ï&ã¿‡¥[\Ûi³?\ê0µÍ³g`\Ì\Ûğ7\0¹><ú¬\èµ1’\Ú2Xû\'+`\Óø%[‹GWC\ØE\Äm\íó^Æ†¸{.;ˆ[\âl¹–¯Â¥!|/\æ\Ò<—[¨:8w¬¼_o±*¶vrOfckY›¸\å\Ôø-Î§˜µ‚£\İ\äb‘\Õ\â¾#vD\×\È,H\î½ıJÈ¨\Æ#\Âh`2µ\Îpc\Û9\ÙnF¼\0\æT;`¶&I$eEK2\Æ\Â\ØÈ³¤pÕ¤ƒÁ£C\ßn‹\Í\ïTJj#cµ™š|\ç8\Ù\Ç\Ñ`±^\ë\Ô\İ\r:yQ\İÿ\0\Ğ\ê„ûš³\Ú\ã‰vc±\ì\ÛqVrs\05\ĞÁYÛ‘\ì\ß;\íøX“v;†V\Ó	ei–V¸µ\í.{Z\ÓôFV‘qkjU«AE;q1¬ct\rh\0B\Õ.Š\áô ±‚¬¹<³!$„D@\0DDD@\0DDD@gx\ÔU5GM|\æÄ´qs\í\ä)2)‹\Ã\È9‡eñ\é*£–hó5¤‚5§†`9‘\ÑKq½\ç\Êdÿ\0k;0~T¡\Å\Ï\0Œ£\Ö}\ÊU¼ÛŠ\Ç|\"“+&?-‡FIö¾Ëºõñã‹³{¢…¬&µ\Å\ï\"Á‘¹\Ík;ó\r\\}\Å[mtZÕ“Y|`FSŠ\ÄO–¶4x“›ğ\È\í^#	µ\ì\×\İÀ…³Å¥Ã°¶	L´“•¢8Ù˜ƒ‚¨f ­p\0“O9\Zñ\"9-\íÚ¶[iµŸ\ê]¢1†f6.¹6\×E’~ı\è¨7\ĞùÜµ^º^y7\ÛÒ¨21¶1ôd\Ì\ç8w¹¤eô_Ò¾oµôõôñ±‘8Hb]ÿ\0¸†‘£¯ÿ\0u[ı‰\İ\Í-m\0–^\ĞK&b×‡0@³8\Z\ß\Ñe‡î†§\á\0M#>\r\Ë\ØNw7 iI=y-Q\Óia5(¬8şÿ\0\ÉS²maünF‚§\á™·ùO¾\à´7©\Z\ë\Êöæ®•AE<mŠ&1£+Z8ÿ\0y¯f­‰š>F7\ï9£\ŞTY>¹d„°}\Ñ|!¬‰ÿ\0\"F;î¹§\ÜW\İVHDDD@\0DDD@\0DDD@Cvƒvô5³:wvŒ{õvG\0ml\Ö \Ø\è8-p\İõ“ş&\ê¬4V+f¾HÁ‡\ÑGO\"‰¹XÆ†´tF¶\Óo)°Ñ“ù“\Ú\â mn…\ç\èj\Ö\ïxq\Ğç§§òª-bt-ˆ‘¡wWs·…\Õ=„\á’\×JKœH¾i$u\É$\êu<\\U´\Ğç¼,±Ae›sn±\Z\çY\Ó9:¡»\Ë\å;\ÒJ\×7¬“^\É\ç½\Úò7Sü3†˜Z6€y»‹‰ıjô#JHòlñŸJıJ\Éø-dzöRsn¿”¬\Ü/lq*7Y•2iÿ\0·‘¾_r=V\0_\nº8\æ‘xûBöğ<B™T™ñ\'ŸRı­œ\ŞôO³+#\ì\Ï\ÖGw3\Ò\Ş-ö«\nƒ¥¨¢7\ç6ş‘\Ä*7Ø°uöû\Ôz´3\ì\Õ[?\á.\ïiiın²\ÏHŸ…zº\æ¶gI¿¦Œñ‰ fvf\' Y«“*b|DµÀ±\í\åÁ\Í6¸ğ<VQH_x–´Ÿ\ĞV[júx\Ü\Ódû¢\"¤\è\"\"\0ˆˆ\" ˆ€\"\"\0ˆˆ\" ˆ€-6\Øc?£šql\Ím˜7»FûMır«}ùT–\ÒD\Ï>]µ¤®\ëY’D>\n“\Ã\İY=œ\ânL’<ñ\ÔÜ›ùÄŸiV5p7$m\r|ORy•\Ø\0d\æ\\\êıT¢y›\\÷5 ¸€/b	%“À\Ö\Ù)\ÙĞ¸>ˆ¢¸~Ø‰%{\ã`\ë\ê:f\åû]J—jI™l¦u\í$õx½RV,¼Õ§\Úl]´\Ññh\æ/¡w€P\Ş«ƒœºQ\Å©ª7Œ’–7¾\îoèºŠ&´4p\0P²\ç\İ\Ô\áB§Œ»„@\Ïn¥º7\ÚAô.…^^ªYiQ\\zc€ˆ‹)`DDD@\0DDD@\0Ufşğ©¿¨ÿ\0È­5]o¾˜ºŠ7ù’òi\n\Ú}\è‡ÁUP\ãF•\Ñ\Æm#Mü\Ö\Øj;\Öñ™\İ¢{Ëš\ë+R,o¡_:õ\Ç.G¶1\İs©=À\\ú³´;¶§š&Šb\"•\r7\É%¸ö–\Ô\çj\Õnª5|•W¦RnIm	SQ“E{cpk\Ãup¸¸9y•…m5E?’|¶2»ˆ\îˆV\Î\ïvZL6)¯kŸ#ƒK–´4X\0HO%›l…\reÌ°Œ\Ç\é²\ìw¤·¥bş§Í®W\ÃE²Ò«#†Š\â\rµ„ü¸\äiû9\\=¤õ;eJ9Jµ£ÿ\0\Ò\İT\îšoT\Ö?Û¢ø7tm\çX\ëwD\ß\Õ\ËRñ:{ş\ÆG\áP\Ï¹®\ÛWh£\Ë\Şós\ê\Z(ñ¢§´˜‡¼0]\ïú-¼‚·0\İ\Ø\ĞDnó$Ç£\È\rü-Ú½\ŞC\"¦\Ã_lk\Z\ç1­\0”	÷*_‰FÉ¨C|—×¢K)`Œ\îI¿\ïzB\ïkš¯%M\î*šóTI\È1Œ%\ÄşŠ\äS¨÷Ç€ˆŠƒ ˆˆ\" ˆ€\"\"\0ˆˆ\" ˆ€\"\"\0£\Û‡\Zœ>¡€]Á†Fı\æyZzˆô©\nğ…)\á\ä\ç»:˜\ã\Äa\Î>P|m>k\Ü\ß$úmo\îW² 6\Ãv\\ö6\à5\âX\ØÍ™–ğ\"\ßÚ®İ\Å\Ù[O\íúC\Ê4põ\İS\âu\å«ºysd«\Å\êò!*»|ø°Sƒ®³;»\è°ò>…gTL\Ø\Ú\ç¸Ù­\Äô\0\\•\Ï\Ø\Å\\˜¥kœÁwLñm\è\İ\ZÁ\ê>%zWUo„Q|ğ°[”\Ãû:\'JF²\ÈHû¬òAõ\æV\ZÁÀğ\Ö\ÒS\Å8FÆ²ıH\Z¸÷“s\éY\Ëd\å\Õ&\Ì\è\"\"äˆˆ\" ˆ€\"\"\0ˆˆ\" ˆ€\"\"\0ˆˆ6õvT\×Sö±6óB€^\Î.`\ï\æ<]°VpùrHOÁ\ä#8ó\'\ì#§‚\è¥\Î\Û\Ïm0\Ä%\í\0v–ù&^/°\å\Êı÷Z*JÈº\åÁ\Ë\Ù\å|35\ícƒšEÁ\àƒ\ÌôT\Ì\í}^lÃ?¥\ï—Å§‹³¹X˜~ôh?Š\Ù#>\ã\Ö\Õ\å\İ\áöÁúwF¨]\É;^«\ŞvÁ\ä™$=ö¹Av§xU5€²?\àBop\Ów¼t{ù\áo¹«Cl\Ş\ëretR6»\Ë\Û15\é)\İx\Çó^>‘A§\Í\Ï>V\×s[(~}+mÅ°ƒÓƒ¤ı¥VxTğ\Ç²F\æ²\\\Ù…¯–\×Óˆ\ã¥ø«\Ïu;HÚº6D\ç\Úˆ\Ü9–\rñ\è°=\à¯_éªª\é‡&N§\'–M\Ñf:ˆ€\"\"\0ˆˆ\" ˆ€\"\"\0ˆˆ\" Šµ»Æ¤ .¿Æ˜hX\Ó\ä´ô{¸\Ü5]F.OEñª«\æ‘\ícz¸†Y\\û\ïª$	»Ÿ¡m\Şÿ\0”}-xu]IÍ’W“ôŸ›×™\êõ§ÿ\0¦W+b¹-=¸ŞŒmc¡¡vi-3\ä²ü\Ù”î‡€\ïU £™ñº|tmp—Rœî§¯zûbx4\ÔÁ¦@,\î†ö=	\ê­\Í\×\ã\Õ\Òü\Í`|M-s\0_\Ó>^w½Š·*¸\æ;¤§ºd\Åh\ê\ËaÄ™­²2­¾L€rl¤|¦7R*­\Ó4\ë\r_’uÛ›C\ÂÅ§U·»»0æ¥\Ñ\ê_¹s\Æ8¹½\ÜB\Ô\ìF\ÜIBDR“%9<8º;óg\Ùû>¥\ØÍ®ª_\ä[$o)÷H\ëÿ\0¬[\ì°\ß\ÚVen…`m=¼\çX\Û%œn>oû,Í¦\Ş541‚¹³Já¥¯•\ï¿>\å[a˜ef/RlK\Ş\ï*I]{0uq\ä:\èUS\íY¹\á~‡rè‡´ò¾¾³©’Gy,¿%\è\ÑÉ£›¥{UI]ƒÔ‚sE#ukÛ«^; úUÓ³{;K…B\â-|¹¥\Ö\Ì@\Ô\ëÉ£¢¦ö\Ëh‰\Õö`öp\ÇÑ·µ\í\ç8\ê}’\ÛTòúR\Ù7òXX÷\â-\r¬ˆµ\Ü\ß\Ì\Óß”\ê<5S7n0Ú‹T°\É\ç!ÿ\0-2İ»üK>\Ã0µ\Û~ƒÜµõ{\'R\Í[•\ã\ì›Q\\8Tøx)®·¶N—k\à\ëp½\\Í‚m-v\ZûE#\Ø\ÖÜ°ø±\Ü<EŠ¹v\'xTø¢}¢Ÿ\Ì\'G\Ø\\ög™\îâª2ü£B’d\Ñ\'AD@\0DDE¢\Û\\o\àr\Íô€\ÊÁ\Õ\îÑ¾\ÓB”²ğŞ–Şº\"\ê:WYü%”[ø\Ø|î§—*¶À°*cv\Ç\çsw\\£ŸŠù\à”¬Ÿ\Ë$d‘\×\Ôë¯¤’¬h\ã\r­\0X€rZ\å%Z\é\'«Ô¸zcÉ…‡\á\Óü†ù\ÇWz\Ê\ÏDY›lò\\œ[1±\nO£Ï˜<ˆğP\Z*©ğÚ¦\È\İ$Œğ\ä\æ=Z\áÿ\0tV8Z¬\Â;xó°š\Û\Îo6øôV\Õf6|3^’ş‰t¾bT\í};h>\r\ÚEšËŒ\ÆS \Æü{*‡sŸU9$´>W\êO’\Ğç»¸h5_;òvy@\ìùnmœŒ··[h¾•tÁ®\Ñ\ÙZûs\Ô_½h…jÁ\ë¹#}´[WAm;¡Ë™¬³\\\â]{X„©.ç¶…±¹\Ôo°;´Œ\è<»Y\Í\'Àx\Æv–®µŒdò\çkf‹4X\Û-Í¸›_Öµ¬\ÏcÁ-?)\ZµÖ¸=A\n\\\\£‰\Ç\Ş\Î\Õ\æq¢…\Ú6\Ægn\â#\Z_¿N«C±\ØGÿ\0!ã¹€û_ú§Àp\×U\ÊK‰-;\İ\Ì\Ü\Ş\Äõ%Xlh\0\0,\0°€€TX\Ô#ÒŒ\Z\İFD3Ğ¿E~W\ég<£ vå‘ ô<ÇP,c\n’@C[\ædƒB788h¬…‰‰Ğ¶¢7F\îcC\ÑÜˆV\×k‹ü\r:}D«xø%û²\ÛõLrŸ÷›\í·€x÷ÿ\05\\Ó²›°úø¤:edñÕ9\\=\Ç\ĞJƒuC¦[|ô^Q\ê\"*N‚\" ˆ€\"\"\0ˆˆª÷\ïXDt°\ß\å>IOö5­ÿ\0\ì>¥j*sÎ¤û“~h\Õ\Ô{\Ñ\à\Òl$…ï¶®~[÷4Ô•&Z\r‹ù¨û\ï÷…¾Qk\Ì\ÙóÚ‡›dzW\åz‹‚€§;7Ne\ílo|\Ùo\äf\ëe\ÚI;J©-\ç@\0+ ª\ã\áÑ>vú»Kû–š$\Ûm…\Êrm¾6&›\×\Â=£c[lĞºÀ“­\Ç\ä»Ö´[5CU1@|‰	qš8zŠ±7¿MŸ.ñ\ËÇ%‡\Øõ]\ìº\ÊÎ¡®õ½›«=Z¬¨6¾	.‡\ÇNÀ\ÈÅ‡y“Ô¬´E¼m¼°ˆŠ‹ò€®¶ª<•R[\é!t?iMú\Æ\Ãş!s–\Ø|\éş\r÷.†\Ù?™\Óÿ\0IŸ”+\îöDú?±}²\",Æ€ˆˆ\" ˆ€\"\"\0©½üÿ\0:“\îMù£W\"¦÷óü\êO¹7\æ]G½ËƒY±5}şğ·\ËE±_5}şğ·ª,÷³\çµ\å‘\âõpRğ\Ä%\É\è\ÇaQ\Ù\Óv˜”dºCı¬\'\ße*\Å\é,21¶\Ì\æ\Ø_Ü ˜&+>R%kFvİ®cÆi\â\Ş\ëÛˆZ)Y‹Á\êx{[—–\ÜSv\Ô,ÿ\0\Ä\çùCÜ©MŠ—-@s\\=\Ä{”\Ëjwœ\Ù`Ò°‡\È\Ò$s\Åû0t-h\à\çqò¸ó\Â²>f\È˜\Î$óĞ‹«¨EÆ¶¤lÔ¸ı7’|ˆ‹)ó\áå—¨€¯6\Ã\çOğo¹t6\ÉüÎŸúLü¡s\Î\Ø|\éş\r÷.†\Ù?™\Óÿ\0IŸ”-{\"}›Ø¾\Æ\ÙS@DDD@\0T\ŞşI÷&üÑ«‘U[ó\Âe{`¨h%‘öŒ}¾r\Â\×\ï$‹÷…mÖˆ—{b¾j>ûı\áoB­(1ºˆ’7€Û“bÖOHY\Zk>°~~\Ê\é\Ñ\'&\Ï\"\İ\å7$\Ña¢¯>4V}`üı“\ãEg\ÖÀ\Ï\Ùs\å\äW\äl\î‹\ryñ¢³\ë\àg\ìŸ\Z+>°~~\É\å\ä<\Ñb«\Æğhê›®%ã\ê<mEg\ÖÀ\Ï\Ù>4V}`üı”Æ™\Å\åGGl^SF~²2ÿ\0€Áæ›—~ÁL …¬hk@\0h\0\à \Z+>°~~\Éñ¢³\ë\àgìºvO–Yn\ë©¢\ÃE^|h¬úÁøû\'ÆŠÏ¬Ÿ²\ã\ËÈ§\È\Ù\İ\Z*ó\ãEg\ÖÀ\Ï\Ù>4V}`üı“\Ë\Èy;¢\ÃE^|h¬úÁøû\'ÆŠÏ¬Ÿ²yy#gt6\Ã\çOğo¹t6\ÉüÎŸúLü¡sc\ß5dÀ[<¯!€\0.O \0]9‚\Ò)\âˆñc\Z\Ó\â\0º›öŒQ\ëQ¤ş\ÔDYK‚\" ˆ€\"\"\0ˆˆ\ÆÄ¿•\'\İw¹J-W1ÿ\0xû\×Áz…A€ˆˆ\" ˆ€\"\"\0ˆˆ\" ,\Èü\êO¸Ev\",û\Ë#ÀDEI\ĞDDÿ\Ù'),(4,'Gayan','gayan','gayan123','Super Admin',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `pickup` varchar(45) NOT NULL,
  `drop` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'Sahan',111111111,'saman@gmail.com','Kurunegala','Colombo','2025-03-12','09.00',8000);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cab`
--

DROP TABLE IF EXISTS `cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `reg_number` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `plate_number` varchar(45) NOT NULL,
  `fare` varchar(45) NOT NULL,
  `image` varchar(255) NOT NULL,
  `driver_name` varchar(45) NOT NULL,
  `license_number` varchar(45) NOT NULL,
  `contact` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cab`
--

LOCK TABLES `cab` WRITE;
/*!40000 ALTER TABLE `cab` DISABLE KEYS */;
INSERT INTO `cab` VALUES (32,'expo','Reg00124','expo Tata Nano','ABC-4562','500','/Images/cabs/2b6cc9b7-0b0c-496e-a771-3842194d347d_expo cab.png','Kamal Silva','Al423687',745632958,'Colombo','Active'),(34,'budget','Reg00125','Maruti Suzuki Alto','ABP-5893','750','/Images/cabs/b1c8f67c-e0de-4ce0-a257-cd51d6c3cf44_budget 2.jpeg','Ruwan Chamara','AL7896542',702596354,'Colombo 5','Active'),(35,'budget','Reg00126','Suzuki Alto','PQR-1258','900','/Images/cabs/bbcd7027-f5e9-4f39-8b69-fe26ded0ddb0_budget 1.jpeg','Lahiru Perera','AL5210300',765232146,'Gampaha','Active'),(36,'budget','Reg00127','2009 Suzuki Alto','EFG-7589','1000','/Images/cabs/8fdf2ebb-c7ed-4839-a899-5ed164efa089_budget 3.jpeg','Tharaka Madushan','AL75895632',712350210,'Dambulla','Active'),(37,'semi','Reg00128','Suzuki WagonR','MNO-5230','1200','/Images/cabs/ca38660b-c15e-479e-9303-0de646c9bb15_semi 4.jpg','Prabath Mendis','Al4455223',723652300,'Colombo 4','Active'),(38,'semi','Reg00129','Toyota Aqua','CDE-5693','1400','/Images/cabs/7a9bfa8e-7b58-489a-afee-e30971948e4c_semi 1.jpeg','Oshan Perera','AB7852369',712000320,'Kurunegala','Active'),(39,'semi','Reg00129','Toyota Vitz','HMN-4120','1650','/Images/cabs/85ae33d6-1d5c-46b4-bfe9-f9ceb513afc2_semi 2.jpg','Ruwan Fernando','AL5869324',768520321,'Kandy','Active'),(40,'semi','Reg00130','Honda Fit','HL-4521','1800','/Images/cabs/f670bf1c-8980-4ae2-87f7-39add0805fa0_semi 3.jpeg','Chathura silva','AL1203021',701232189,'Matale','Active'),(42,'car','Reg00130','Toyota Prius','WZX-4141','2000','/Images/cabs/729d6a8b-d01f-48e8-9cd4-a3fd8ccb1510_car 1.jpeg','Dilan Jayasooriya','AL7896541',714789533,'Kurunegala','Active'),(43,'car','Reg00131','Toyota Corolla Axio','PQR-1253','2250','/Images/cabs/58fe3773-096e-457b-aab0-9e624a984ae5_car 2.jpeg','Pathum Jayaweera','AL7896532',742321028,'Galle','Active'),(44,'car','Reg00131','Toyota Premio','UVW-1256','2250','/Images/cabs/40201716-56a0-41d3-be01-c4b0cb973c11_car 3.jpeg','Harsha Dilan','AL1236542',769523017,'Kurunegala','Active'),(45,'9 seater','Reg00132','Toyota KDH','PRT-4125','3500','/Images/cabs/9fde4dda-76eb-4741-a316-b1162d282275_9 seater.jpeg','Samal Rukshan','AL4123365',712356489,'Colombo','Active'),(46,'9 seater','Reg00133','9 Seater MiniBus','ABD-4563','4500','/Images/cabs/a125d6ea-a9cd-4cd8-9394-2fd8f7672818_9 seater 2.jpg','Thushan Silva','AL7896533',771230452,'Colombo','Active'),(47,'14 seater','Reg00135','Toyota Hiace ','PKG-4510','5000','/Images/cabs/a3e7c9dc-be30-4d4c-9946-3e0b43a68e92_14 seater.jpeg','Priyamal Perera','AL5263541',712356234,'Kurunegala','Active'),(48,'14 seater','Reg00136','Toyota Highroof KDH','LHG-2039','6000','/Images/cabs/7b7a2b30-7df0-47ae-8c87-bb8425e04452_14 seater 3.jpg','Lahiru Kumara','AL45201789',712589633,'Kandy','Active');
/*!40000 ALTER TABLE `cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `rate` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'expo','50','A small hatchback, air conditioned with capacity of 3 passengers ideal for short distance trips.','Active'),(2,'budget','75','A small hatchback, air conditioned with capacity of 3 passengers ideal for short distance trips.(Limited baggage)','Active'),(3,'semi','80','Compact, air-conditioned hatchback with seating for 4 passengers, ideal for long-distance trips with ample luggage space.(Limited baggage)','Active'),(4,'car','90','A full size , air conditioned sedan with capacity of 4 passengers ideal for long distance trips with plenty of luggage space.(Sufficient baggage)','Active'),(5,'9 Seater','100','A full sized van, air conditioned with capacity of 9 passengers ideal for long distance trips.(Sufficient baggage)','Active'),(6,'14 Seater','120','A full sized commuter van, air conditioned with capacity of 14 passengers ideal for long distance trips.(Sufficient baggage)','Active');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `rate` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Sahan','5','Good Service');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `nic` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Sahan','Wijerathne','matale','male','1234567890',715263963,'s@gmail.com','sahan','123478'),(2,'Nimal','Perera','Kandy','male','4256312574',778536984,'nimal@gmail.com','nimal','111111'),(3,'Saman','kumara','Kurunegala','male','7896541230',768236521,'saman@gmail.com','saman','000000'),(6,'Vikum','Fernando','Colombo','male','9985635321',714252211,'vikum@gmail.com','vikum','789669'),(7,'Hashan','bandara','Colombo','male','9452367893',70253621,'hashan@gmail.com','hashan','456328'),(8,'Lahiru','Kumara','Kaluthara','male','1997532689',123456789,'lahiru@gmail.com','lahiru','123456'),(9,'Sahan','Wijerathna','Matale','male','1111111',111111111,'saman@gmail.com','111','11111111'),(10,'Sahan','Wijerathna','Matale','male','1111111',111111111,'saman@gmail.com','111','11111111'),(11,'Sahan','Wijerathna','Matale','male','1111111',111111111,'saman@gmail.com','111','11111111'),(12,'Sahan','Wijerathna','Matale','male','1111111',111111111,'saman@gmail.com','111','11111111'),(13,'bandu','perera','kandy','male','1234567890',111111111,'s@gmail.com','ad','111111'),(14,'Sahan','Wijerathne','Matale','male','123456789123',712345678,'s@gmail.com','sahan','123*45'),(15,'1','1','1','male','1',1,'s@gmail.com','1','1'),(16,'1','1','1','male','1',1,'s@gmail.com','1','1'),(17,'1','1','1','male','1',1,'s@gmail.com','1','1'),(18,'2','2','2','male','2',2,'saman@gmail.com','2','2'),(19,'2','2','2','male','2',2,'nimal@gmail.com','2','2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 12:54:28
