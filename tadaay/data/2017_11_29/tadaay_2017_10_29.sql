-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: tadaay_qat
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

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
-- Table structure for table `app_email_templates`
--

DROP TABLE IF EXISTS `app_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_email_templates` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_email_tempalte` (`partner_id`),
  CONSTRAINT `fk_user_email_tempalte` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_email_templates`
--

LOCK TABLES `app_email_templates` WRITE;
/*!40000 ALTER TABLE `app_email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_address`
--

DROP TABLE IF EXISTS `app_polyglot_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `address_line_3` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_address`
--

LOCK TABLES `app_polyglot_address` WRITE;
/*!40000 ALTER TABLE `app_polyglot_address` DISABLE KEYS */;
INSERT INTO `app_polyglot_address` VALUES (1,'Kondapur','Opposite Harsh toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-20 23:21:02'),(2,'Kondapur','Opposite Harsh toyota','Kondapur','Hyderabad','Andhra Pradesh','500038',-1,'2017-03-21 19:40:49'),(3,'Kondapur','Opposite Harsh toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:40:44'),(4,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500034',-1,'2017-03-21 19:40:59'),(5,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 18:56:03'),(6,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 18:59:45'),(7,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:01:01'),(8,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:02:17'),(9,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:02:34'),(10,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:03:36'),(11,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:04:01'),(12,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:05:19'),(13,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:05:38'),(14,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:05:47'),(15,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:06:15'),(16,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:08:50'),(17,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:09:30'),(18,'Kondapur','Opposite Harsha toyota','Kondapur','Hyderabad','Telangana','500038',-1,'2017-03-21 19:14:40'),(19,'In Kondapy','No Apartment','Kukatpally','Bangalore','Telangana','500034',-1,'2017-05-22 12:04:01'),(20,'some address','HDFCbank','Miyapur','Hyderabad','Telangana','500035',-1,'2017-03-26 16:38:36'),(21,'Flat No 604','Buddha heights','Miyapur','Hyderabad','Telangana','500034',-1,'2017-05-21 13:26:08'),(22,'307','nil','ameerpet','Bangalore','Andhra Pradesh','500038',-1,'2017-06-01 07:27:37'),(23,'333','kon','kondapur','Hyderabad','Telangana','500021',-1,'2017-09-11 11:46:19'),(24,'TEST','test','test','Hyderabad','Telangana','123456',-1,'2017-07-08 04:23:01'),(25,'test','test','test','Chennai','Tamilnadu','768687',-1,'2017-07-08 08:27:28'),(26,'My Flat','Buddha virtue heights','Miyapur','Hyderabad','Telangana','500038',-1,'2017-07-23 11:31:36'),(27,'3333','adadas','assdsa','Hyderabad','Telangana','44444',-1,'2017-07-26 14:26:11'),(28,'adad','d','sdv','Hyderabad','Telangana','44444',-1,'2017-09-07 09:57:27'),(29,'302','nil','Ameerpet,','Hyderabad','Telangana','500016',-1,'2017-09-25 21:23:35'),(30,'302','302','nil','Hyderabad','Telangana','500016',-1,'2017-09-25 21:24:20'),(31,'202, Mahendra Residency,','Satyam Theater Road,','Ameerpet,','Hyderabad','Telangana','500016',-1,'2017-10-13 09:23:14');
/*!40000 ALTER TABLE `app_polyglot_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_batch`
--

DROP TABLE IF EXISTS `app_polyglot_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_batch` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `ply_batch_no` varchar(50) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `schedule` varchar(30) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `branch_name` varchar(100) NOT NULL,
  `fee_discount` double NOT NULL,
  `batch_status` varchar(50) NOT NULL,
  `start_date` varchar(20) NOT NULL,
  `batch_name` varchar(100) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `fk_batch_faculty` (`faculty_id`),
  KEY `indx_partner_id_batch` (`partner_id`),
  CONSTRAINT `fk_batch_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `app_polyglot_faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partner_id_batch` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_batch`
--

LOCK TABLES `app_polyglot_batch` WRITE;
/*!40000 ALTER TABLE `app_polyglot_batch` DISABLE KEYS */;
INSERT INTO `app_polyglot_batch` VALUES (1,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:47'),(2,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:09'),(3,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:01'),(4,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:47'),(5,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:27:42'),(6,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:53'),(7,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:47'),(8,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:27:47'),(9,'PLYB100001',3,'AWS','Weekend','Online',1,'Ameerpet',0,'CANCELLED','04/07/2017',NULL,3,'2017-10-12 12:28:53'),(23,'PLYB1000010',7,'Javascript','Weekend','Class Room',5,'Test Branch',0,'PROPOSED','23/07/2017',NULL,-1,'2017-07-23 11:33:40'),(24,'PLYB100001',3,'AWS - DevOps','10/25/2017 9:45 AM','Online',1,'Ameerpet',10,'COMPLETED','24/10/2017','AWS - DevOps-Ameerpet-24/10/2017',3,'2017-10-27 19:43:04'),(25,'PLYB100001',3,'AWS - DevOps','10/12/2017 12:01 PM','Online',1,'Ameerpet',10,'COMPLETED','25/10/2017','AWS - DevOps-Ameerpet-25/10/2017',3,'2017-10-27 19:43:03');
/*!40000 ALTER TABLE `app_polyglot_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_branch`
--

DROP TABLE IF EXISTS `app_polyglot_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_branch_address_id` (`address_id`),
  KEY `fk_branch_contact_id` (`contact_id`),
  KEY `indx_partner_id` (`partner_id`),
  CONSTRAINT `fk_partner_id_branches` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_branch_address_id` FOREIGN KEY (`address_id`) REFERENCES `app_polyglot_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `app_polyglot_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_branch`
--

LOCK TABLES `app_polyglot_branch` WRITE;
/*!40000 ALTER TABLE `app_polyglot_branch` DISABLE KEYS */;
INSERT INTO `app_polyglot_branch` VALUES (4,7,'Test Branch',26,35,-1,'2017-07-23 11:31:36'),(5,3,'Ameerpet',31,40,-1,'2017-10-13 09:23:14');
/*!40000 ALTER TABLE `app_polyglot_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_contact`
--

DROP TABLE IF EXISTS `app_polyglot_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_contact`
--

LOCK TABLES `app_polyglot_contact` WRITE;
/*!40000 ALTER TABLE `app_polyglot_contact` DISABLE KEYS */;
INSERT INTO `app_polyglot_contact` VALUES (3,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-20 23:21:02'),(4,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:40:49'),(5,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:40:44'),(6,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:40:59'),(7,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 18:56:03'),(8,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 18:59:45'),(9,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:01:01'),(10,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:02:17'),(11,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:02:34'),(12,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:03:36'),(13,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:04:01'),(14,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:05:19'),(15,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:05:38'),(16,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:05:47'),(17,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:06:15'),(18,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:08:50'),(19,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:09:30'),(20,'Satheesh','1234567890','asdsad@adsad.com',-1,'2017-03-21 19:14:40'),(21,'','9876543210','test@test.com',-1,'2017-05-22 12:04:01'),(22,'Satheesh','1234567980','asdad@asddad.com',-1,'2017-03-26 16:38:36'),(23,'Vishy','8464071773','vishwann@gmail.com',-1,'2017-05-21 13:26:08'),(24,'','','',-1,'2017-04-10 08:23:07'),(25,'','','',-1,'2017-04-10 08:24:53'),(26,'','','',-1,'2017-04-10 08:25:43'),(27,'','','',-1,'2017-04-10 08:26:20'),(28,'','','',-1,'2017-04-10 08:35:35'),(29,'','','',-1,'2017-04-10 08:37:48'),(30,'','','',-1,'2017-04-10 08:40:57'),(31,'','','',-1,'2017-06-01 07:27:37'),(32,'sandeep','888888','ssasa@g.com',-1,'2017-09-11 11:46:19'),(33,'TEST','123456','test@gmail.com',-1,'2017-07-08 04:23:01'),(34,'test','93698683','test@gmail.com',-1,'2017-07-08 08:27:28'),(35,'My Name','8464071773','vishwann@gmail.com',-1,'2017-07-23 11:31:36'),(36,'asda','999','sda@g.com',-1,'2017-07-26 14:26:11'),(37,'asd','44','sdfd@f.com',-1,'2017-09-07 09:57:27'),(38,'pav','9000902920','asdada@gmail.com',-1,'2017-09-25 21:23:35'),(39,'ns','9000000000','asda@f.com',-1,'2017-09-25 21:24:20'),(40,'praveen','7285948228','training@polyglotit.com',-1,'2017-10-13 09:23:14');
/*!40000 ALTER TABLE `app_polyglot_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_course`
--

DROP TABLE IF EXISTS `app_polyglot_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `schedule` varchar(30) NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` varchar(30) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `fk_partner_id_courses` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_course`
--

LOCK TABLES `app_polyglot_course` WRITE;
/*!40000 ALTER TABLE `app_polyglot_course` DISABLE KEYS */;
INSERT INTO `app_polyglot_course` VALUES (1,3,'AWS - DevOps','Weekend',3,'weeks',-1,'2017-08-24 11:38:22'),(4,9,'aws','Weekend',1,'days',-1,'2017-08-29 09:57:41'),(7,3,'AWS - Development ( Developer Associate )','Weekdays',1,'months',-1,'2017-09-25 21:26:33'),(8,3,'AWS - DevOps','Weekdays',2,'weeks',-1,'2017-10-13 09:24:01'),(9,3,'RedHat Linux','Weekdays',6,'weeks',-1,'2017-10-25 12:47:33');
/*!40000 ALTER TABLE `app_polyglot_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_demo`
--

DROP TABLE IF EXISTS `app_polyglot_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `mode` varchar(20) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  `fee` double NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `demo_status` varchar(10) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partner_demo` (`partner_id`),
  CONSTRAINT `fk_partner_demo` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_demo`
--

LOCK TABLES `app_polyglot_demo` WRITE;
/*!40000 ALTER TABLE `app_polyglot_demo` DISABLE KEYS */;
INSERT INTO `app_polyglot_demo` VALUES (1,3,'AWS - DevOps','Both','Ameerpet','satheesh','11/01/2017 9:45 AM',100,'N','COMPLETED','2017-10-13 09:47:11',3),(2,3,'AWS - DevOps','Both','Ameerpet','sukanya','10/25/2017 9:31 PM',200,'N','CANCELLED','2017-10-24 09:52:28',3),(3,3,'AWS - DevOps','Both','Ameerpet','Satheesh Challa ','10/31/2017 9:00 AM',111,'N','COMPLETED','2017-10-24 09:53:23',3),(4,3,'AWS - DevOps','Class Room','Ameerpet','Satheesh Challa ','10/30/2017 12:07 PM',0,'Y','SCHEDULED','2017-10-25 12:07:41',3),(5,3,'RedHat Linux','Class Room','Ameerpet','Suresh','10/30/2017 12:48 PM',5000,'Y','SCHEDULED','2017-10-25 12:49:01',3);
/*!40000 ALTER TABLE `app_polyglot_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_faculty`
--

DROP TABLE IF EXISTS `app_polyglot_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_faculty` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `mode` varchar(45) DEFAULT NULL,
  `lastInsrtUpdUsrId` int(11) DEFAULT NULL,
  `lastInsrtUpdTs` date DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_partner_id_faculty` (`partner_id`),
  CONSTRAINT `fk_partner_id_faculty` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_faculty`
--

LOCK TABLES `app_polyglot_faculty` WRITE;
/*!40000 ALTER TABLE `app_polyglot_faculty` DISABLE KEYS */;
INSERT INTO `app_polyglot_faculty` VALUES (1,3,'Satheesh Challa ','9000003473','satheeshbabuchalla@gmail.com','Online',-1,'2017-10-24',1),(5,7,'Test1231','8464071772','asasda@adsad.com','ClassRoom',-1,'2017-10-13',26),(6,9,'sukanya','8121858081','sukanya.danasi@polyglotit.com','ClassRoom',-1,'2017-08-28',36),(7,9,'sukanya','8121858081','sukanya.danasi@polyglotit.com','Online',-1,'2017-08-28',49),(10,9,'sukanya','8121858081','sukanya.danasi@polyglotit.com','ClassRoom',-1,'2017-08-29',6),(11,3,'Suresh','9999999999','test@gmail.com','ClassRoom',-1,'2017-10-25',15);
/*!40000 ALTER TABLE `app_polyglot_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_lead`
--

DROP TABLE IF EXISTS `app_polyglot_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `course` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `schedule` varchar(30) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `preferred_time` varchar(20) DEFAULT NULL,
  `source` varchar(50) NOT NULL,
  `reffered_by` varchar(50) DEFAULT NULL,
  `batch_id` varchar(50) DEFAULT NULL,
  `lead_status` varchar(50) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL DEFAULT '-1',
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lead_branch` (`branch`),
  CONSTRAINT `fk_lead_branch` FOREIGN KEY (`branch`) REFERENCES `app_polyglot_branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_lead`
--

LOCK TABLES `app_polyglot_lead` WRITE;
/*!40000 ALTER TABLE `app_polyglot_lead` DISABLE KEYS */;
INSERT INTO `app_polyglot_lead` VALUES (1,3,'VIshy','Nadimpally','Java','8464071773','vishwann@gmail.com','Class Room','Weekdays',5,'11:34 AM-12:34 PM','Online',NULL,'PLYB100001','PROPOSED','Test',3,'2017-10-25 12:50:36'),(2,3,'sa','challa','DevOps','9000003473','satheeshbabuchalla@gmail.com','Online','Weekend',5,'09:30 PM-09:50 AM','walkin',NULL,'PLYB100001','PROPOSED','asda',-1,'2017-10-24 10:05:25');
/*!40000 ALTER TABLE `app_polyglot_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_lead_demo_status`
--

DROP TABLE IF EXISTS `app_polyglot_lead_demo_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_lead_demo_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `demo_id` int(11) NOT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `invite_status` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_lead_demo_status`
--

LOCK TABLES `app_polyglot_lead_demo_status` WRITE;
/*!40000 ALTER TABLE `app_polyglot_lead_demo_status` DISABLE KEYS */;
INSERT INTO `app_polyglot_lead_demo_status` VALUES (1,3,1,3,'vishwann@gmail.com','INVITED FOR DEMO','VIshy','Nadimpally',3,'2017-10-25 12:09:49'),(2,3,1,2,'vishwann@gmail.com','INVITED FOR DEMO','VIshy','Nadimpally',3,'2017-10-25 12:12:35'),(3,3,1,3,'vishwann@gmail.com','INVITED FOR DEMO','VIshy','Nadimpally',3,'2017-10-25 12:43:10'),(4,3,1,5,'vishwann@gmail.com','INVITED FOR DEMO','VIshy','Nadimpally',3,'2017-10-25 12:49:48');
/*!40000 ALTER TABLE `app_polyglot_lead_demo_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_payment`
--

DROP TABLE IF EXISTS `app_polyglot_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_payment` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `total_fee` double NOT NULL,
  `fee_paid` double NOT NULL,
  `fee_pending` double NOT NULL,
  `mode` varchar(10) NOT NULL,
  `transaction_ref` varchar(50) DEFAULT NULL,
  `opted_discount` double NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_partner_id_payment` (`partner_id`),
  CONSTRAINT `fk_partner_id_payment` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_payment`
--

LOCK TABLES `app_polyglot_payment` WRITE;
/*!40000 ALTER TABLE `app_polyglot_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_polyglot_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_plan`
--

DROP TABLE IF EXISTS `app_polyglot_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(100) NOT NULL,
  `subscription_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `partner_id` int(11) NOT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `duration` varchar(25) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `is_expired` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partner_id_plan` (`partner_id`),
  CONSTRAINT `fk_partner_id_plan` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_plan`
--

LOCK TABLES `app_polyglot_plan` WRITE;
/*!40000 ALTER TABLE `app_polyglot_plan` DISABLE KEYS */;
INSERT INTO `app_polyglot_plan` VALUES (1,'DEFAULT PLAN','2017-08-17 10:51:54','2017-09-16 10:51:54',3,'','','Monthly',3,'2017-08-17 10:51:54','N'),(4,'DEFAULT PLAN','2017-08-22 05:34:36','2017-09-21 05:34:36',8,'','','Monthly',8,'2017-08-22 05:34:36','N'),(5,'DEFAULT PLAN','2017-08-28 11:05:51','2017-09-27 11:05:51',9,'','','Monthly',9,'2017-08-28 11:05:51','N'),(6,'DEFAULT PLAN','2017-10-21 16:27:46','2017-11-20 16:27:46',12,NULL,NULL,'Monthly',12,'2017-10-21 16:27:46','N'),(7,'DEFAULT PLAN','2017-10-21 17:01:44','2017-11-20 17:01:44',10,NULL,NULL,'Monthly',10,'2017-10-21 17:01:44','N'),(8,'DEFAULT PLAN','2017-10-25 17:55:43','2017-11-24 17:55:43',14,NULL,NULL,'Monthly',14,'2017-10-25 17:55:43','N'),(9,'DEFAULT PLAN','2017-10-25 18:13:47','2017-11-24 18:13:47',16,NULL,NULL,'Monthly',16,'2017-10-25 18:13:47','N');
/*!40000 ALTER TABLE `app_polyglot_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_student`
--

DROP TABLE IF EXISTS `app_polyglot_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_student` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `mode` varchar(25) NOT NULL,
  `joined_date` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `next_interest` varchar(100) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_partner_id_student` (`partner_id`),
  CONSTRAINT `fk_partner_id_student` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_student`
--

LOCK TABLES `app_polyglot_student` WRITE;
/*!40000 ALTER TABLE `app_polyglot_student` DISABLE KEYS */;
INSERT INTO `app_polyglot_student` VALUES (1,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:33'),(2,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:31'),(4,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:32'),(5,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:33'),(6,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:34'),(7,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:35'),(8,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:35'),(9,3,'satheesh challa','AWS','Online','04/07/2017','INVITED','',0,3,'2017-07-04 09:58:35'),(28,7,'vishy nadimpally','Javascript','Class Room','23/07/2017','INVITED','',0,7,'2017-07-23 11:33:40'),(31,9,'Sukanya','AWS','Online','09/06/2017','INVITED','Java',0,-1,'2017-09-07 10:38:18');
/*!40000 ALTER TABLE `app_polyglot_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_polyglot_task`
--

DROP TABLE IF EXISTS `app_polyglot_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_polyglot_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_polyglot_task`
--

LOCK TABLES `app_polyglot_task` WRITE;
/*!40000 ALTER TABLE `app_polyglot_task` DISABLE KEYS */;
INSERT INTO `app_polyglot_task` VALUES (1,'Linux user','','/opt/tadaay/uploads','Y',3,'2017-10-24 10:57:46',3),(2,'Linux user','17-Link-Building-Ideas-2017.pdf','/opt/tadaay/uploads','Y',3,'2017-10-24 10:59:41',3);
/*!40000 ALTER TABLE `app_polyglot_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_users` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `userType` char(1) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `flatno` varchar(45) DEFAULT NULL,
  `aprtmentName` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `passoutYr` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `compName` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `yrsofexp` int(11) DEFAULT NULL,
  `skills` varchar(45) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `inst_estbl_date` datetime DEFAULT NULL,
  `inst_name` varchar(45) DEFAULT NULL,
  `inst_founder` varchar(45) DEFAULT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `contact_landline` varchar(45) DEFAULT NULL,
  `contact_mobile` varchar(10) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `dsbl_in` varchar(1) NOT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_idx` (`emailId`,`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES (NULL,NULL,'P','training@polyglotit.com','9000003473','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,'307B','Nil','ameerpet','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-01 07:05:24','2017-06-02 00:00:00','Polyglot','Sa','','',NULL,'','1','N',-1,3),(NULL,NULL,'P','vishwann@gmail.com','8464071773','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,'604','Buddhas','Miyapur','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-09 04:15:33','2017-07-09 00:00:00','Test','Vishy','Vishy','vishwann@gmail.com',NULL,'8464071773','1','N',-1,7),(NULL,NULL,'P','jhansi.d@polyglotit.com','8978749812','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,'307/B','aditya enclave','ammerpet','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-22 05:34:03','2016-05-03 00:00:00','polyglot it solutions','','JHANSY','jhansijanu403@gmail.com',NULL,'8978749812','1','N',-1,8),(NULL,NULL,'P','sukanya.danasi@polyglotit.com','8121858081','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,'307/b','aditya enclave nilagiri block','ameerpet','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-28 11:04:58','2016-03-04 00:00:00','polyglot','sukanya','Danasi Sukanya','sukanya.danasi@polygloit.com',NULL,'8121858081','1','N',-1,9),('jhansi','janu','U','jhansijhanu403@gmail.com','8341512471','9563a5e33a8f215b23b394940cbe48e','1992-03-11 00:00:00','f','56','vndhj','ammerpet','1','1',500038,'','',NULL,NULL,'','',1,'','2017-09-28 18:07:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','N',-1,10),('Mahesh','Maragani','U','mahi2ece@gmail.com','8801441330','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',-1,12),('sukanya','d','U','sukanya.danasi@polyglotit.com','8121858081','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',-1,13),('santhosh','p','U','santhosh.ponnala@polyglotit.com','9999999999','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',-1,14),('sukanya','d','R','sukanya.danasi@polyglotit.com','9999999999','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',-1,15),('satheesh','ch','R','satheesh.challa@polyglotit.com','9999999999','9563a5e33a8f215b23b394940cbe48e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',-1,16);
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmn_cities`
--

DROP TABLE IF EXISTS `dmn_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmn_cities` (
  `city_id` int(11) NOT NULL,
  `city_desc` varchar(45) DEFAULT NULL,
  `city_long_desc` varchar(45) DEFAULT NULL,
  `city_code` varchar(5) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `dsbl_in` varchar(1) NOT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `cntry_state_idx` (`state_id`),
  CONSTRAINT `cntry_state` FOREIGN KEY (`state_id`) REFERENCES `dmn_states` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmn_cities`
--

LOCK TABLES `dmn_cities` WRITE;
/*!40000 ALTER TABLE `dmn_cities` DISABLE KEYS */;
INSERT INTO `dmn_cities` VALUES (1,'Hyderabad','Old City','HYD',1,'N',NULL,NULL);
/*!40000 ALTER TABLE `dmn_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmn_cntry`
--

DROP TABLE IF EXISTS `dmn_cntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmn_cntry` (
  `cntry_id` int(11) NOT NULL,
  `cntry_desc` varchar(45) NOT NULL,
  `cntry_code` varchar(5) NOT NULL,
  `cntry_long_desc` varchar(45) DEFAULT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`cntry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmn_cntry`
--

LOCK TABLES `dmn_cntry` WRITE;
/*!40000 ALTER TABLE `dmn_cntry` DISABLE KEYS */;
INSERT INTO `dmn_cntry` VALUES (1,'INDIA','IND','Republic of India','N',NULL,NULL);
/*!40000 ALTER TABLE `dmn_cntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmn_course_list`
--

DROP TABLE IF EXISTS `dmn_course_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmn_course_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(75) DEFAULT NULL,
  `category` varchar(75) DEFAULT NULL,
  `sub_category` varchar(75) DEFAULT NULL,
  `course_name` varchar(100) NOT NULL,
  `template` varchar(45) DEFAULT NULL,
  `keywords` varchar(256) DEFAULT NULL,
  `imagePath` varchar(128) DEFAULT NULL,
  `featured` varchar(1) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `coursetitle` varchar(45) DEFAULT NULL,
  `courseDesc` varchar(1024) DEFAULT NULL,
  `compImagePath` varchar(45) DEFAULT NULL,
  `addCourseInfo` text,
  `relatedCourses` varchar(45) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmn_course_list`
--

LOCK TABLES `dmn_course_list` WRITE;
/*!40000 ALTER TABLE `dmn_course_list` DISABLE KEYS */;
INSERT INTO `dmn_course_list` VALUES (1,'IT','Cloud Computing','AWS','AWS - Administration ( Solution Architect - Associate )',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,'Hello buddy how r u ','1,2',-1,'2017-03-12 00:00:00'),(2,'IT','Cloud Computing','AWS','AWS - Administration ( Solution Architect - Professional)',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(3,'IT','Cloud Computing','AWS','AWS - Development ( Developer Associate )',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(4,'IT','Cloud Computing','AWS','AWS - DevOps',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(5,'IT','Cloud Computing','Microsoft - Azure','Azure - Administration',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(6,'IT','Cloud Computing','Microsoft - Azure','Azure - Development',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(7,'IT','Cloud Computing','Openstack','Openstack - Administration',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(8,'IT','Cloud Computing','Salesforce','Salesforce-Admin',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(9,'IT','Cloud Computing','Salesforce','Salesforce-Development',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(10,'IT','DevOps','Tools','Jenkins',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(11,'IT','DevOps','Tools','Docker',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(12,'IT','DevOps','Tools','Puppet',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(13,'IT','DevOps','Tools','Chef',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(14,'IT','DevOps','Tools','Ansible',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(15,'IT','Administration','System','RedHat Linux',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(16,'IT','Administration','System','Microsoft Windows (MCSE)',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(17,'IT','Networking','Network','CCNA',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(18,'IT','Networking','Network','CCIE',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(19,'IT','Networking','Network','CCSP',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(20,'IT','Administration','Application Servers','WebLogic Administration',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(21,'IT','Administration','Application Servers','WebSphere Application Server Administration',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(22,'IT','Administration','Application Servers','Websphere MQ Administration',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(23,'IT','Administration','Application Servers','Jboss Application server Administration',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(24,'IT','Database','RDBMS','MySQL',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(25,'IT','Database','RDBMS','Oracle',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(26,'IT','Database','RDBMS','PostgreSQL',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(27,'IT','Database','RDBMS','MSSQL',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(28,'IT','Database','NoSQL','MongoDB',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(29,'IT','Database','NoSQL','Apache cassandra',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(30,'IT','Database','NoSQL','CouchDB',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(31,'IT','Development','Languages','Java',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(32,'IT','Development','Languages','Python',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(33,'IT','Development','Languages','Shell',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(34,'IT','Development','Languages','Ruby',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(35,'IT','Development','Languages','Javascript',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(36,'IT','Development','Languages','PHP',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(37,'IT','Development','Languages','scala',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(38,'IT','Development','Frameworks','NodeJS',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(39,'IT','Development','Frameworks','AngularJS',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(40,'IT','Development','Frameworks','MEAN ( Mongo, express, Angular, NodeJS )',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(41,'IT','Development','Frameworks','Spring',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(42,'IT','Development','Frameworks','Hibernate',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(43,'IT','Development','Frameworks','Ruby on Rails',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(44,'IT','Development','Frameworks','Python Django',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(45,'IT','Development','Frameworks','jQuery',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(46,'IT','Development','Frameworks','struts',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(47,'IT','Development','Mobile','Android',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(48,'IT','Development','Mobile','Phonegap',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(49,'IT','Development','Webdesigning','HTML5, CSS',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(50,'IT','Development','Designing tools','Adobe Photoshop',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(51,'IT','Development','Designing tools','Coraldraw',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(52,'IT','Development','Designing tools','Adobe Illustrator',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(53,'IT','Development','Designing tools','Adobe Aftereffects',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(54,'IT','Develppment','Apps','Oracle Apps',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(55,'IT','ERP','SAP','SAP-BO',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(56,'IT','ERP','SAP','SAP-ABAP',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(57,'IT','ERP','SAP','SAP-BI',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(58,'IT','ERP','SAP','SAP-HANA',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(59,'IT','Reporting','Tools','QlikView',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(60,'IT','Reporting','Tools','Business Objects (BO)',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(61,'IT','Reporting','Tools','Informatica',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(62,'IT','Reporting','Tools','MSBI',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(63,'IT','Security','Tools','Ethical Hacking',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(64,'IT','Testing','Mobile','Appium',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(65,'IT','Testing','Mobile','Jmeter',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(66,'IT','Testing','Automation','Selenium',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(67,'IT','Testing','Automation','QTP/UFT',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(68,'IT','Testing','','SAP testing',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(69,'IT','Testing','','Cloud testing',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(70,'IT','Testing','','storage testing',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(71,'IT','Testing','','security testing',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(72,'IT','Bigdata','Hadoop','Hadoop-spark',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(73,'IT','Bigdata','Hadoop','Hadoop-pig',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00'),(74,'IT','Bigdata','Hadoop','Hadoop-Hive',NULL,NULL,'/resources/images/courses/tn1/adobe-after-effects.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'1,2',-1,'2017-03-12 00:00:00');
/*!40000 ALTER TABLE `dmn_course_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmn_states`
--

DROP TABLE IF EXISTS `dmn_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmn_states` (
  `state_id` int(11) NOT NULL,
  `state_desc` varchar(45) DEFAULT NULL,
  `state_long_desc` varchar(45) DEFAULT NULL,
  `state_code` varchar(5) DEFAULT NULL,
  `cntry_id` int(11) NOT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`state_id`),
  KEY `state_cntry_idx` (`cntry_id`),
  CONSTRAINT `state_cntry` FOREIGN KEY (`cntry_id`) REFERENCES `dmn_cntry` (`cntry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmn_states`
--

LOCK TABLES `dmn_states` WRITE;
/*!40000 ALTER TABLE `dmn_states` DISABLE KEYS */;
INSERT INTO `dmn_states` VALUES (1,'TELANGANA','Prev Andhra','TS',1,'N',NULL,NULL);
/*!40000 ALTER TABLE `dmn_states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-29 11:33:25
