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
INSERT INTO `admin` VALUES (3,'Sahan','admin','admin123','Staff Admin',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z(!1!%)+...383-7(-.+\n\n\n\r2% \"//-//++8-/-----/---+5------------------------+----��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0D\0\0\0\0\0!1AQaq\"R����24BSbr���\�#3s��$C�c\�D�\��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\0.\0\0\0\0\0\0\0\0!1Q\"2Aqa���\�#3BR�\�\0\0\0?\0�Q\0DDjv���}D��\�\0\�\�\�q�G������\�-��\�\�P���5�]\�<�q�U��q\�j��Jy\�89���u�q\Zڼb�1�?\�kG\�c:5��+\Z�����\�H�Am\�\\\�|\�7\�7�_���.[�\��e\�%%m|\�\�\�\�\�F\�M�\�dcX9^�\�̭]vQL[\�E$D\�\�ഛq��\�V\�U>x��#Mp�˰s��@g6\�\�L7��r\�E�$n\')!�\�#P\�t��\�vx�u\�\Z�X�}�-\�ȓ\��5tR\���5\�{\�|\�E\�\�\�k��x~\�\�\��9�y9Z\�ǻ�t\'�^K�������ff\"�\�<�H\�\�Ց�\�\�e$l�X�\Z㡾�<���\'��\�[~\�x+�v:}q�͹ug�Z���\�\�I��m���Ǌ�\���\�:L\"\"\�D@\0DDD@\0DDD@�h�x\�\�N\Z5\�V�x-���\'�\'\�7\�{U�U\��g�\�\�68\�h�\r��mU�<��\�\ZJ�pڼ\� �\'��)�^���AW�#��Oo=�\��\0���Z<\�l���\�\n�jc|й�5ݣ�ų�\0N�_]\�bΒ�S�\�B֒?�<|h����\�\�F|-\�\�غ�\�l�\�]T�\"\0ؙȐ�:�t�o�:\�`�\�\�i\�+v{N\�x\�jcK+D�k�\�\�;V\�~�\'\�\�]�\�\r[$��K1�c�z��kO\�\�CҠ��\��\�\�=���\\\�\�\�/�؂9�7h\�_{x�̌�\0J~ۍ\�\����/E6ZX\�\��\�i��Z}-6#��am\�\n�J�\Z�vfxhvQlŏ\0\�_���\���i�0���?Z�)���3r\�8\�Dk\\C�%\�e�\��|���G�g�^W\�\�٧�\�\�]\��ӁW�\��\�h�\�\�\�d��6�p\0M�\�\��y\�(]��\",\�AD@\0DDD@\0DD:�\����/SV\Zj�(m\�re7!\�C\�u*�\��\�g�hI���9ў��\�Ү�q�T�̆��\�o*\�[\�tOu��\�\'��`A�(.�]!1<$\�\�Z}�r\�9\�\Z�\�ĸ2[\�O\0\�&㿇�[\�i�?\�0�ͳg`\�\��7\0��><���\�1�\�2X�\'+`\��%[�GWC\�E\�m�\��^Ɔ�{.;�[\�l����¥!�|/\�\�<�[�:8w��_o�*�vrOf�ckY��\�\��-Ύ������\�\�b�\�\��#vD\�\�,H\��JȨ\�#\�h`2�\�pc\�9\�nF�\0\�T;`�&I$eEK2\�\�\�ȳ�pդ���C\�n�\�\�TJj#c����|\�8\�\�\�`�^\�\�\�\r:yQ\��\0\�\�����\�\�vc�\�\�qVrs\05\��Yۑ\�\�;\��X�v;�V\�	ei�V��\�.{Z\��FV�qkjU�AE;q1�ct\rh\0B\�.�\�������<�!$�D@\0DDD@\0DDD@gx\�U5GM|\�Ĵqs\�\�)2)�\�\�9�e�\�*��h�5��5��`9�\�Kq�\�\�d�\0k;0~T�\�\�\0��\�}\�U�ۊ\�|\"�+&?-�FI��˺��㋳{���&�\�\�\"���\�k;�\r\\}�\�[mtZՓY|`FS�\�O��4x���\�\�^#	�\�\�\����ťð�	L����8٘����f��p\0�O9\Z�\"9-\�ڶ[i��\�]��1�f6.�6\�E�~�\�7\��ܵ^�^y7\�Ҩ21�1�d\�\�8w��e�_Ҿo�����8Hb]�\0������\0u[��\�\�-m\0�^\�K&bׇ0@�8\Z\�\�e��\�\0M#>\r\�\�Nw7�iI=y-Q\�ia5(�8��\0\�S�ma��nF��\����O�\�7�\Z\�\��殕�AE<m�&1�+Z8�\0y�f���>F7\�9�\�TY>�d��}\�|!���\0\"F;\�W\�VHDDD@\0DDD@\0DDD@Cv�v�5�:wv�{�vG\0ml\� \�\�8-p\����&\�4V+f�H���\�GO\"��XƆ�tF�\�o)�ѓ��\�\� mn�\�\�j\�\�xq\�秧�-bt-���wWs��\�=�\�\�JK�H�i$u\�$\�u<\\U�\�缎,�Ae�sn�\Z\�Y\�9�:���\�\�;\�J\�7��^\�\�\��7S�3��Z6�y�����j�#JH�l��J�J\��-dz�Rsn���\�/lq*7Y�2i�\0���_r=V\0_\n�8\���x�B��<B�T��\'�R���\��O�+#\�\�\�Gw3\�\�-��\n�����7�\�6��\�*7ذu���\�z�3\�\�[?\�.\�ii�n�\�H��z�\�gI�����fvf\'�Y��*b|D���\�\��\�6��<VQH_x���\�V[j�x\�\�d��\"�\�\"\"\0��\" ��\"\"\0��\" ��-6\�c?��ql\�m�7�F�M�r�}�T�\�D\�>]���\�Y�D>\n�\�\�Y=�\�nL�<�\�ܛ�ğiV5p7$m\r|ORy�\�\0d�\�\\\��T�y�\\�5����/b	%��\�\�)\�и>���~؉%{\�`\�\�:f\��]J�jI�l�u\�$�x�RV,�է\�l]�\��h\�/�w�P\�����Q\����7���7�\�o躊&�4p\0P�\�\�\�\�B����@\�n��7\�A�.�^^�YiQ\\zc���)`DDD@\0DDD@\0Uf�𩿨�\0ȭ5]o����7����i\n\�}\��UP\�F��\�\�m#�M�\�\�j;\��\��{˚\�+R,o�_:��\�.G�1\�s�=�\\���;���&�b\"��\r7\�%���\�\�j\�n�5|�W�RnIm	SQ�E{cpk\�up��9y���m5E?�|��2��\��V\�\�vZL6)�k�#��K��4X\0H�O%��l�\rḛ�\�\�\�w����b��ͮW\�E�ҫ#��\�\r����\�i�9\\=��;eJ9J���\0\�\�T\�oT�\�?ۢ�7tm\�X\�wD\�\�\�R�:{�\�G\�P\���\�Wh�\�\��s\�\Z(񎢧����0]\��-���0\�\�\�Dn�$ǣ\�\r�-ڽ\�C\"�\�_lk\Z\�1��\0�	�*_�FɨC|�ע�K)`�\�I�\�zB\�k��%M\�*��TI\�1�%\���\�S���ǀ������\" ��\"\"\0��\" ��\"\"\0�\��\Z�>��]��F�\�yZz���\n��)\�\�\�:�\�\�a\�>P|m>k\�\�$�mo\�W��6\�v\\�6\�5\�X�\�͙��\"\�ڮݞ\�\�[O\��C\�4p�\�S\�u\��ysd�\�\��!*�|���S���;�\��>�gTL\�\�\�٭\��\0\\�\�\�\�\\��k��wL�m\�\�\Z�\�>%zWU�o�Q|�[�\��:\'JF�\�H���A�\�V\Z���\�\�S\�8FƲ�H\Z���s\�Y\�d\�\�&\�\�\"\"䐈�\" ��\"\"\0��\" ��\"\"\0��6�vT\�S��6�B�^\�.`\�\�<]�Vp�rHO�\�#8�\'�\�#��\�\�\�\�m0\�%\�\0v��&^/�\�\���Z*JȺ\��\�\�\�|35\�c��E�\��\��T\�\�}^lÞ?�\�ŧ���X�~�h�?�\�#>\�\�\�\�\�\����wF�]\�;^�\�v�\�$=��Av�xU5��?\�Bop\�w�t{�\�o��Cl\�\�retR6�\�\�15\�)\�x\��^>�A�\�\�>V\�s[(~}+mŰ�Ӄ���VxT�\��F\�\\\����\�ӈ\���\�u;Hں6D\�\��\�9�\r�\�=\�_骪\�&N�\'�M\�f:��\"\"\0��\" ��\"\"\0��\" ���Ƥ�.��ƘhX\�\��{�\�5]F.OE񪫎\�\�cz���Y\\��\��$	����m\��\0�}-xu]I͒W����י\����\0�W+b�-=�ތmc��vi-3\��\��\�U ���|�tmp�R��z�bx4\���@,\��=	\�\�\�\�\�\��\�`|M-s\0_\�>^w����*�\�;����d\�h\�\�aę��2��L�rl�|��7R*�\�4\�\r_�uۛC\�ŧU����0枍�\�\�_�s\�8��\�B\�\�F\�IBDR�%9<8�;�g\��>��\�ͮ�_\�[�$o)�H\��\0�[\�\�\�Ven�`m=��\�X\�%�n>�o��,ͦ\�541����J᥯��\�>\�[a�ef/RlK\�\�*I]{0uq\�:\�US\�Y�\�~�r致򾾳��Gy,��%�\�\�ɣ���{UI]�ԂsE#uk۫^;���Uӳ{;K�B\�-|���\�\�@\�\�ɣ���\�h�\��`�p\�ѷ�\�\�8\�}�\�T��R\�7�XX�\�-\r���\�\�\�\�ߔ\�<5S7n0ڋT�\�\�!�\0-2ݍ��K>\�0�\�~�ܵ�{\'R\�[�\�\�Q\\8T�x)����N�k�\�\�p�\\͂m-v\Z�E#\�\�ܰ��\�<E��v\'xT���}��\�\'G\�\\�g�\�⪝2���B�d\�\'AD@\0DDE�\�\\o\�r\��\��\�\�Ѿ\�B����ޖ޺\"\�:WY�%�[�\�|*���*�cv\�\�sw\\����\����\�$�d�\�\�믤��h\�\r�\0X�rZ\�%Z\�\'��ԸzcɅ�\�\����\�Wz\�\�DY�l�\\��[1�\nO�Ϙ<��P\Z*��ڦ\�\�$��\�\�=Z\��\0tV8Z�\�;x��\�\�o6��V\�f6|3^���t�bT\�};h>\r\�E�ˌ\�S��\��{�*�s�U9$�>W\�O�\�绸h5_;�vy�@\��nm����[h��t����\�\�Z�s\�_�h�j�\�#}�[WAm;�˙��\\\�]{X���.綅��\�o�;��\�<�Y\�\'��x\�v����d�\�kf�4X\�-͸�_ֵ�\�c�-?)�\Z�ָ=A\n\\\\��\�\�\�\�\�q��\�6\�gn\�#\Z_�N�C�\�G�\0!㹀�_���p\�U\�K�-;\�\�\�\�\��%Xlh\0\0,\0���TX\�#Ҍ\Z\�FD3пE~W\�g<���v呠�<ǁP,c\n��@C�[\�d�B788h����ж�7F\�cC\�܈V\�k��\r:}D�x�%��\��Lr���\�x��\05\\Ӳ�����:ed�Վ9\\=\�\�J�uC�[|��^Q\�\"*N�\" ��\"\"\0����\�XDt�\�\�>IO�5��\0\�>�j*sΤ��~h\�\�{\�\�\�l$�ﶮ~[�4ԕ&Z\r����\����Qk\�\��ڇ�dzW\�z����;7Ne\�lo|\�o\�f\�e\�I;J�-\�@\0+ �\��\�я>v��K���$\�m���\�rm�6&�\�\�=�c[lк���\�\�ִ[5CU1�@|�	q�8z��7�M�.�\�ǁ%�\��]\��\�Ρ�����=�Z��6�	.�\�N�\�Ňy�Ԭ�E���m�����򀮶�<�R[��\�!t�?iM�\�\��!s�\�|\��\r�.�\�?�\��\0I��+\��D�?�}��\",ƀ��\" ��\"\"\0����\0:�\�M��W\"����\�O�7\�]G�˃Y�5}��\�E�_5}��,��\�\�\��pR�\�%\��\�\�aQ\�\�v��d�C��\'\�e*\�\�,21�\�\�\�_ܠ�&+>R%kFvݮcƎi\�\�\�ۈZ)Y��\�x{[��\�Sv\�,�\0\�\��CܩM��-@s\\=\�{�\�jw�\�`Ұ�\�\�$s\��0t-h\�\�q��\��>f\��\�$�Ћ��Eƶ�lԸ�7�|��)�\�嗨��6\�\�O�o�t6\��Ο�L��s\�\�|\��\r�.�\�?�\��\0I��-{\"}�ؾ\�\�S@DDD@\0T\���I�&�ѫ�U[�\�e{`�h%���}��r\�\�\�$���mֈ�{b�j>��\�oB�(1���7�ۓb֝OHY\Zk>�~~\�\�\�\'&\�\"\�\�7$\�a��>4V}`���\�Eg\��\�\�s\�\�W\�l\�\ry�\�\�g\�\Z+>�~~\�\�\�<��\�b�\��hꛮ�%㏁\�<mEg\��\�\�>4V}`���ƙ\�\�GGl^SF~�2�\0��曗~�L ��hk@\0h\0\�\Z+>�~~\��\�\�g캝vO�Yn�\���\�E^|h�����\'ƊϬ���\�\�ȧ\�\�\�\Z*�\�Eg\��\�\�>4V}`���\�\�y;�\�E^|h�����\'ƊϬ���yy#gt6\�\�O�o�t6\��Ο�L��sc\�5d�[<�!�\0.O \0]9�\�)\��c\Z\�\�\0����Q\�Q��\�DYK�\" ��\"\"\0��\�Ŀ�\'\�w�J-W1�\0x�\��z�A���\" ��\"\"\0��\" ,�\��\�O�Ev\",�\�#�DEI\�DD�\�'),(4,'Gayan','gayan','gayan123','Super Admin',NULL);
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
