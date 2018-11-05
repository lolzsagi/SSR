-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: LIBRARY
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK` (
  `Book_ID` int(11) NOT NULL,
  `Title` varchar(17) DEFAULT NULL,
  `Publisher_Name` varchar(17) DEFAULT NULL,
  `Pub_Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  UNIQUE KEY `Book_ID` (`Book_ID`),
  KEY `Publisher_Name` (`Publisher_Name`),
  CONSTRAINT `BOOK_ibfk_1` FOREIGN KEY (`Publisher_Name`) REFERENCES `PUBLISHER` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (1,'Spider','RQ',1997),(2,'Indo-Pak','RM',1969),(3,'Train','SQ',1997),(4,'Spain','MN',2017),(5,'Star','LT',2007),(1000,'datastructure','govinda',1998),(1001,'oops','vaibhava',1999),(1002,'computer network','simtha',2000),(1003,'flat','jagadish',2001),(1004,'dbms','rangnath',2002);
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_AUTHORS`
--

DROP TABLE IF EXISTS `BOOK_AUTHORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_AUTHORS` (
  `Book_ID` int(11) NOT NULL,
  `Author_Name` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  UNIQUE KEY `Book_ID` (`Book_ID`),
  CONSTRAINT `BOOK_AUTHORS_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `BOOK` (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_AUTHORS`
--

LOCK TABLES `BOOK_AUTHORS` WRITE;
/*!40000 ALTER TABLE `BOOK_AUTHORS` DISABLE KEYS */;
INSERT INTO `BOOK_AUTHORS` VALUES (1,'ABC'),(2,'PQR'),(3,'XYZ'),(4,'LMN'),(5,'TUV'),(1000,'govinda'),(1001,'vaibhava'),(1002,'simtha'),(1003,'jagadish'),(1004,'rangnath');
/*!40000 ALTER TABLE `BOOK_AUTHORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_COPIES`
--

DROP TABLE IF EXISTS `BOOK_COPIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_COPIES` (
  `Book_ID` int(11) NOT NULL,
  `Branch_ID` int(11) NOT NULL,
  `No_Of_Copies` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`,`Branch_ID`),
  UNIQUE KEY `Book_ID` (`Book_ID`),
  UNIQUE KEY `Branch_ID` (`Branch_ID`),
  CONSTRAINT `BOOK_COPIES_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `BOOK` (`Book_ID`),
  CONSTRAINT `BOOK_COPIES_ibfk_2` FOREIGN KEY (`Branch_ID`) REFERENCES `LIBRARY_BRANCH` (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_COPIES`
--

LOCK TABLES `BOOK_COPIES` WRITE;
/*!40000 ALTER TABLE `BOOK_COPIES` DISABLE KEYS */;
INSERT INTO `BOOK_COPIES` VALUES (1,8,2),(2,2,2),(3,11,3),(4,17,1),(5,9,4),(1000,65,70),(1001,66,60),(1002,67,50),(1003,68,50),(1004,69,40);
/*!40000 ALTER TABLE `BOOK_COPIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_LENDING`
--

DROP TABLE IF EXISTS `BOOK_LENDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_LENDING` (
  `Book_ID` int(11) NOT NULL,
  `Branch_ID` int(11) NOT NULL,
  `Card_No` int(11) NOT NULL,
  `Date_Out` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  PRIMARY KEY (`Book_ID`,`Branch_ID`,`Card_No`),
  UNIQUE KEY `Book_ID` (`Book_ID`),
  UNIQUE KEY `Branch_ID` (`Branch_ID`),
  KEY `Card_No` (`Card_No`),
  CONSTRAINT `BOOK_LENDING_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `BOOK` (`Book_ID`),
  CONSTRAINT `BOOK_LENDING_ibfk_2` FOREIGN KEY (`Branch_ID`) REFERENCES `LIBRARY_BRANCH` (`Branch_ID`),
  CONSTRAINT `BOOK_LENDING_ibfk_3` FOREIGN KEY (`Card_No`) REFERENCES `CARD` (`Card_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_LENDING`
--

LOCK TABLES `BOOK_LENDING` WRITE;
/*!40000 ALTER TABLE `BOOK_LENDING` DISABLE KEYS */;
INSERT INTO `BOOK_LENDING` VALUES (1,8,1,'2022-07-18','2022-01-19'),(2,2,3,'2023-08-18','2023-01-19'),(3,11,2,'2024-05-18','2024-01-19'),(4,17,4,'2014-09-18','2014-01-19'),(5,9,5,'2021-08-18','2021-01-19'),(1000,65,1701,'1998-02-03','1998-02-06'),(1001,66,1702,'1998-02-06','1998-02-09'),(1002,67,1703,'1998-02-09','1998-02-12'),(1003,68,1704,'1998-02-12','1998-02-15'),(1004,69,1704,'1998-02-15','1998-02-18');
/*!40000 ALTER TABLE `BOOK_LENDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARD`
--

DROP TABLE IF EXISTS `CARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARD` (
  `Card_No` int(11) NOT NULL,
  `Name` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`Card_No`),
  UNIQUE KEY `Card_No` (`Card_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARD`
--

LOCK TABLES `CARD` WRITE;
/*!40000 ALTER TABLE `CARD` DISABLE KEYS */;
INSERT INTO `CARD` VALUES (1,'A'),(2,'B'),(3,'D'),(4,'C'),(5,'E'),(1700,'vaibhva'),(1701,'maxx'),(1702,'ashika'),(1703,'liktha'),(1704,'karthick');
/*!40000 ALTER TABLE `CARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRARY_BRANCH`
--

DROP TABLE IF EXISTS `LIBRARY_BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIBRARY_BRANCH` (
  `Branch_ID` int(11) NOT NULL,
  `Branch_Name` varchar(17) DEFAULT NULL,
  `Address` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`),
  UNIQUE KEY `Branch_ID` (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRARY_BRANCH`
--

LOCK TABLES `LIBRARY_BRANCH` WRITE;
/*!40000 ALTER TABLE `LIBRARY_BRANCH` DISABLE KEYS */;
INSERT INTO `LIBRARY_BRANCH` VALUES (2,'Camel','KHB'),(8,'Art','Bsvr'),(9,'Elizibath','Mys Road'),(11,'Bat','RT Nagar'),(17,'Dragon','SJP'),(65,'computer science','NO.6th main'),(66,'information tech','NO.9th cross'),(67,'IS','NO.14th street'),(68,'civil','NO.5th bangalore'),(69,'civil','NO.2 indirastreet');
/*!40000 ALTER TABLE `LIBRARY_BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUBLISHER`
--

DROP TABLE IF EXISTS `PUBLISHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUBLISHER` (
  `Name` varchar(17) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLISHER`
--

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;
INSERT INTO `PUBLISHER` VALUES ('govinda','No.6 mysoreroad',99450048),('jagadish','No.7th subbanpalya',90362420),('LT','Bjp',234),('MN','Mum',579),('rangnath','No.9th banasawadi',910362420),('RM','Ncr',789),('RQ','Bnglr',123),('simtha','No.27 millers road',96637489),('SQ','Mys',214),('vaibhava','No.18 pune',98802235);
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-05 15:54:33
