-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: vtapp
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `cinema_movies`
--

DROP TABLE IF EXISTS `cinema_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_id` (`cinema_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_movies`
--

LOCK TABLES `cinema_movies` WRITE;
/*!40000 ALTER TABLE `cinema_movies` DISABLE KEYS */;
INSERT INTO `cinema_movies` VALUES (1,1,1,'2011-09-05','2011-09-20'),(2,1,2,'2011-09-06','2011-09-23'),(3,1,5,'2011-08-31','2011-09-30'),(4,2,1,'2011-09-02','2011-09-20'),(5,2,3,'2011-09-06','2011-09-10'),(6,2,5,'2011-08-31','2011-09-30'),(7,3,4,'2011-10-02','2011-10-20'),(8,3,7,'2011-09-06','2011-10-22'),(9,3,6,'2011-09-08','2011-09-18'),(10,4,8,'2011-10-02','2011-10-10'),(11,4,4,'2011-10-02','2011-10-20'),(12,4,7,'2011-09-06','2011-10-22'),(13,5,8,'2011-10-05','2011-10-20'),(14,5,6,'2011-10-05','2011-10-20'),(15,5,5,'2011-10-05','2011-10-20');
/*!40000 ALTER TABLE `cinema_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `website` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'PVR Saket','saket@pvr.com','www.pvr.com','2011-09-20 14:15:26','0000-00-00 00:00:00'),(2,'PVR Rivoli','rivoli@pvr.com','www.pvr.com','2011-09-20 14:16:03','0000-00-00 00:00:00'),(3,'Chanakya','chanakyacinema@mailinator.com',NULL,'2011-09-20 14:17:07','0000-00-00 00:00:00'),(4,'Om Cine Plex','omcineplex@mailinator.com','omcineplex.com','2011-09-20 14:18:56','0000-00-00 00:00:00'),(5,'IMAX','imax@imax.com','imax.com','2011-09-20 14:19:31','0000-00-00 00:00:00'),(6,'Shakuntalam','shakuntalam@pragatimaidan.com',NULL,'2011-09-20 14:20:26','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_shows`
--

DROP TABLE IF EXISTS `movie_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_movie_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_movie_id` (`cinema_movie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_shows`
--

LOCK TABLES `movie_shows` WRITE;
/*!40000 ALTER TABLE `movie_shows` DISABLE KEYS */;
INSERT INTO `movie_shows` VALUES (1,1,'09:00:00','10:00:00'),(2,1,'11:00:00','12:00:00'),(3,1,'13:00:00','14:00:00'),(4,1,'16:00:00','17:00:00'),(5,1,'19:00:00','20:00:00'),(6,2,'09:00:00','10:00:00'),(7,2,'11:00:00','12:00:00'),(8,2,'13:00:00','14:00:00'),(9,2,'16:00:00','17:00:00'),(10,2,'19:00:00','20:00:00'),(11,3,'09:00:00','10:00:00'),(12,3,'11:00:00','12:00:00'),(13,3,'13:00:00','14:00:00'),(14,3,'16:00:00','17:00:00'),(15,3,'19:00:00','20:00:00'),(16,4,'09:00:00','10:00:00'),(17,4,'11:00:00','12:00:00'),(18,4,'13:00:00','14:00:00'),(19,4,'16:00:00','17:00:00'),(20,4,'19:00:00','20:00:00'),(21,5,'09:00:00','10:00:00'),(22,5,'11:00:00','12:00:00'),(23,5,'13:00:00','14:00:00'),(24,5,'16:00:00','17:00:00'),(25,5,'19:00:00','20:00:00'),(26,6,'09:00:00','10:00:00'),(27,6,'11:00:00','12:00:00'),(28,6,'13:00:00','14:00:00'),(29,6,'16:00:00','17:00:00'),(30,6,'19:00:00','20:00:00'),(31,7,'09:00:00','10:00:00'),(32,7,'11:00:00','12:00:00'),(33,7,'13:00:00','14:00:00'),(34,7,'16:00:00','17:00:00'),(35,7,'19:00:00','20:00:00'),(36,8,'09:00:00','10:00:00'),(37,8,'11:00:00','12:00:00'),(38,8,'13:00:00','14:00:00'),(39,8,'16:00:00','17:00:00'),(40,8,'19:00:00','20:00:00'),(41,9,'09:00:00','10:00:00'),(42,9,'11:00:00','12:00:00'),(43,9,'13:00:00','14:00:00'),(44,9,'16:00:00','17:00:00'),(45,9,'19:00:00','20:00:00'),(46,10,'09:00:00','10:00:00'),(47,10,'11:00:00','12:00:00'),(48,10,'13:00:00','14:00:00'),(49,10,'16:00:00','17:00:00'),(50,10,'19:00:00','20:00:00'),(51,11,'09:00:00','10:00:00'),(52,11,'11:00:00','12:00:00'),(53,11,'13:00:00','14:00:00'),(54,11,'16:00:00','17:00:00'),(55,11,'19:00:00','20:00:00'),(56,12,'09:00:00','10:00:00'),(57,12,'11:00:00','12:00:00'),(58,12,'13:00:00','14:00:00'),(59,12,'16:00:00','17:00:00'),(60,12,'19:00:00','20:00:00'),(61,13,'09:00:00','10:00:00'),(62,13,'11:00:00','12:00:00'),(63,13,'13:00:00','14:00:00'),(64,13,'16:00:00','17:00:00'),(65,13,'19:00:00','20:00:00'),(66,14,'09:00:00','10:00:00'),(67,14,'11:00:00','12:00:00'),(68,14,'13:00:00','14:00:00'),(69,14,'16:00:00','17:00:00'),(70,14,'19:00:00','20:00:00'),(71,15,'09:00:00','10:00:00'),(72,15,'11:00:00','12:00:00'),(73,15,'13:00:00','14:00:00'),(74,15,'16:00:00','17:00:00'),(75,15,'19:00:00','20:00:00');
/*!40000 ALTER TABLE `movie_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `language` varchar(32) NOT NULL,
  `starcast` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Kung Fu Panda 2','English','\"Jack Black, Jackie Chan, Lucy Liu\"','2011-09-21 05:46:33','0000-00-00 00:00:00'),(2,'Kung Fu Panda 2','Hindi','\"Jack Black, Jackie Chan, Lucy Liu\"','2011-09-21 05:46:48','0000-00-00 00:00:00'),(3,'Kung Fu Panda','Hindi','\"Jack Black, Jackie Chan, Lucy Liu\"','2011-09-21 05:47:01','0000-00-00 00:00:00'),(4,'I Am Kalam','Hindi',NULL,'2011-09-21 05:47:27','0000-00-00 00:00:00'),(5,'Rango','Hindi','\"Johnny Depp\"','2011-09-21 05:47:58','0000-00-00 00:00:00'),(6,'Megamind','Hindi','\"Brad Pitt\"','2011-09-21 05:48:25','0000-00-00 00:00:00'),(7,'Aarakshan','Hindi','\"Saif Ali Khan, Amitabh Bachan\"','2011-09-21 05:49:04','0000-00-00 00:00:00'),(8,'The Matrix','English','\"Keanu Reeves, Laurence Fishburne\"','2011-09-21 05:49:54','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-21 13:43:20
