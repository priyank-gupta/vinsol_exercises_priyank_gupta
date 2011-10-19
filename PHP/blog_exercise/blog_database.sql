-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: blog
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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment` text NOT NULL,
  `shayari_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `shayari_id` (`shayari_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('hehe',23,18,6),('ddss&#10;gfhgfh',17,17,8),('&#60;script&#62;alert(&#34;hi&#34;)&#60;/script&#62;',17,16,6),('nice...',14,15,6),('hi',14,14,7),('kya baat hai...',14,13,7),('what is that...',17,19,11),('we are waiting for ur post..',24,20,6);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_type` varchar(25) NOT NULL DEFAULT '',
  `image_size` varchar(25) NOT NULL DEFAULT '',
  `image_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('image/jpeg','24.6728515625 Kb','11.jpg',11),('image/jpeg','88.3125 Kb','7.jpg',7),('image/jpeg','66.96484375 Kb','6.jpg',6);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shayari`
--

DROP TABLE IF EXISTS `shayari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shayari` (
  `title` varchar(255) NOT NULL,
  `shayari` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `posted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shayari_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`shayari_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shayari`
--

LOCK TABLES `shayari` WRITE;
/*!40000 ALTER TABLE `shayari` DISABLE KEYS */;
INSERT INTO `shayari` VALUES ('first post','Its fun to be here and read shayaris....&#13;&#10;&#13;&#10;looking forward to post some of mine...','joy','2011-10-17 06:51:32',24,11,'2011-10-17 06:51:32'),('first','this is my first post...&#13;&#10;read...&#13;&#10;or die....','life','2011-10-17 06:26:32',23,8,'2011-10-17 06:26:43'),('heya','heya... \r\ni wanna getta closer to u...\r\n','loneliness','2011-10-16 09:19:50',17,6,'0000-00-00 00:00:00'),('hum','hum tum pe marte hai... \r\ntum humpe marte ho..','love','2011-10-16 06:26:24',14,7,'0000-00-00 00:00:00'),('tags','&#60;html&#62;&#13;&#10;&#60;b&#62;hi&#60;/b&#62;&#13;&#10;&#60;/html&#62;','life','2011-10-17 10:04:09',25,11,'2011-10-17 10:04:09'),('javas','&#60;script&#62;alert(&#34;hello&#34;)','joy','2011-10-17 10:04:32',26,11,'2011-10-17 10:04:54');
/*!40000 ALTER TABLE `shayari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('&#60;script&#62;','&#60;script&#62;','&#60;script&#62;','&#60;script&#62;','m',9),('jaya','jaya','Jaya gupta','jaya','f',8),('jyoti','jyoti','Jyoti','jyoti','f',7),('priyank','priyank','Priyank','priyank','m',6),('priy','priy','priyank&#39; gupta','priy','m',10),('manik','manik','manik','manik','m',11);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-17 15:43:40
