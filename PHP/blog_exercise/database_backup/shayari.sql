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
-- Table structure for table `shayari`
--

DROP TABLE IF EXISTS `shayari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shayari` (
  `title` varchar(255) NOT NULL,
  `shayari` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `posted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shayari_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`shayari_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shayari`
--

LOCK TABLES `shayari` WRITE;
/*!40000 ALTER TABLE `shayari` DISABLE KEYS */;
INSERT INTO `shayari` VALUES ('Ek nazar jo mujh tak aati hai','ek nazar mujh tak aati hai...\r\nkuch kehna hai shayad unko...\r\npar sharma ke jhuk si jati hai...\r\n\r\njab palat ke dhundta hun unhe..\r\nto luk chup ke mujhe bada satati hai...\r\n \r\nkhud ko tanha paakar jab kahi baith jata hun...\r\nsang nibhane tab paas chali aati hai...\r\n\r\nbechain ho jata hun jab dikhti nahi...\r\ntab hath tham ke mujhe khud tak lati hai...\r\n\r\nshayad ishq ho gaya mujhe us ek nazar se...\r\njo sirf aur sirf mujh tak aati hai...','love','jyoti','2011-09-20 07:23:16','0000-00-00 00:00:00',1),('Zindagi','sabki khudahi bas khud ke liye hai...\r\napno ke liye bhi yahan... dolte imaan nazar aate hai...\r\n\r\napne to mere bhi kafi hai yahan...\r\npar na jaane kyn... sab anjaan nazar aate hai...\r\n\r\nkhushiyaan sabne lapet rakhi hai daman mein...\r\nbas hasne ke liye waqt dhundte... mujhe insaan nazar aate hai...\r\n\r\nzindagi ko samajhna chaha hai maine bhi....\r\nmagar koso tak bas... kaale sunsaan nazar aate hai...','life','jyoti','2011-09-20 07:23:56','0000-00-00 00:00:00',2),('Dard','Dil to jalkar rakh ho gaya magar in aankhon se roya na gaya...\r\nkuch zakhm judai ke aise mile ki fir un lamhon ko piroya na gaya...\r\n\r\ntere illzamon se shikwah nahi mujhko...\r\nbas tu ye dard samajh paati, to kya baat thi...','loneliness','jyoti','2011-09-20 07:24:57','0000-00-00 00:00:00',3),('Shararat','teri goud pe sir rakh kar tujhe dekhe jana...\r\nin zulfon ke chilman se roshni ka mera concentration hatana...\r\nuff... mere balon mein teri hatheliyon ka jo ehsaas tha...\r\nki uski shararat ki mere aage kya chalti...','joy','jyoti','2011-09-20 07:25:22','0000-00-00 00:00:00',4),('Intezaar','Zakhm itne gehre hai Izhaar kya kare, \r\nHum khud Nishana bann gaye, \r\nwaar kya kare,\r\nMar gaye hum magar khuli rahi Aankhe, \r\nAb isse Zyada unka Intezaar kya karee…','loneliness','manu','2011-09-20 07:28:42','0000-00-00 00:00:00',5),('saza','Mili saza jo mujhe wo kisi khata pe na thi faraz \r\nMujh pe jurm jo sabit howa wo wafa ka tha','hatred','manu','2011-09-20 07:36:41','0000-00-00 00:00:00',6),('zeher','Ishq ne hume Rula Diya...\r\nJis Per Marte The usne hi hame bhula Diya...\r\nhum to unki yadon mein hi jee laitay....\r\nmagar unhone to yaadon mein hi ZEHER mila diya....','hatred','manu','2011-09-20 07:39:26','0000-00-00 00:00:00',7),('duniya hai tumhi se','maza aata hai tumhe satane mein...\r\nruthe na koi to maza kya manane mein...\r\nek tumhi se to duniya hai apni...\r\nwarna rakha kya hai zamane mein...','love','priyank','2011-09-20 07:47:04','0000-00-00 00:00:00',8),('dhoka','aastin mein gamon ko paal kar..\r\nkhush reh rahan hun aajkal...\r\naajkal dard se sath ho gaya humara...\r\nrona bha raha hai aajkal...\r\nlogon se dhokha kha kha kar....\r\ndhokebaaz ho gaya hun aajkal...','hatred','priyank','2011-09-20 07:54:58','0000-00-00 00:00:00',9);
/*!40000 ALTER TABLE `shayari` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-20 13:38:44
