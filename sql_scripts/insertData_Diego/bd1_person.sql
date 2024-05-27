-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd1
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `birthdate` date NOT NULL,
  `first_name` varchar(220) NOT NULL,
  `middle_name` varchar(220) DEFAULT NULL,
  `last_name` varchar(220) NOT NULL,
  `nickname` varchar(220) DEFAULT NULL,
  `image` blob,
  `gender` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID_GENDER` (`gender`),
  CONSTRAINT `FK_ID_GENDER` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'1972-03-31','Alejandro','','Almenabar','',_binary '(BLOB)',4),(2,'2000-12-10','Jose','Julian','Castro','Jota',_binary '(BLOB)',2),(3,'2000-12-10','María','Amalia','Chacón','',_binary '(BLOB)',3),(4,'2000-12-10','María','Amalia','Chacón','',_binary '(BLOB)',3),(5,'2000-12-10','Emma','Andrea','Pérez','M',_binary '(BLOB)',3),(6,'2000-12-10','Jairo','Anibal','Solís','Jay',_binary '(BLOB)',10),(7,'2000-12-10','Andrés','Patricio','Álvarez','Andy',_binary '(BLOB)',4),(8,'2000-12-10','Gabriela','','Chaves','Gab',_binary '(BLOB)',5),(9,'2000-12-10','Gina','Elena','Sánchez','G',_binary '(BLOB)',3),(10,'2000-12-10','Ania','','Segura','',_binary '(BLOB)',7),(11,'2000-12-10','Jose','Juan','Sevilla','',_binary '(BLOB)',2),(12,'2000-12-10','Esteban','Alonso','Aguilar','Agui',_binary '(BLOB)',2),(13,'1970-01-03','Anthony','','Russo','',_binary '(BLOB)',2),(14,'1953-04-01','Barry','','Sonnenfeld','',_binary '(BLOB)',2),(15,'1962-09-17','Baz','','Luhrmann','',_binary '(BLOB)',2),(16,'1969-03-28','Brett','','Ratner','',_binary '(BLOB)',2),(17,'1965-09-17','Bryan','','Singer','',_binary '(BLOB)',2),(18,'1969-11-30','Chris','','Weitz','',_binary '(BLOB)',2),(19,'1970-06-30','Christopher','','Nolan','',_binary '(BLOB)',2),(20,'1976-09-13','Colin','','Trevorrow','',_binary '(BLOB)',2),(21,'1976-06-21','Dan','','Scanlon','',_binary '(BLOB)',2),(22,'1963-10-08','David','','Yates','',_binary '(BLOB)',2),(23,'1964-03-16','Gore','','Verbinski','',_binary '(BLOB)',2),(24,'1966-06-27','Jeffrey Jacob','','Abrams','',_binary '(BLOB)',2),(25,'1954-08-16','James','','Cameron','',_binary '(BLOB)',2),(26,'1977-02-26','James','','Wan','',_binary '(BLOB)',2),(27,'1957-01-12','John','','Lasseter','',_binary '(BLOB)',2),(28,'1974-08-31','Marc','','Webb','',_binary '(BLOB)',2),(29,'1964-03-11','Peter','','Berg','',_binary '(BLOB)',2),(30,'1966-03-01','Zack','','Snyder','',_binary '(BLOB)',2),(31,'1976-08-25','Alexander','','Skarsgard','',_binary '(BLOB)',2),(32,'1983-08-20','Andrew','','Garfield','',_binary '(BLOB)',2),(33,'1972-08-15','Ben','','Affleck','',_binary '(BLOB)',2),(34,'1981-08-20','Ben','','Barnes','',_binary '(BLOB)',2),(35,'1948-03-14','Billy','','Crystal','',_binary '(BLOB)',2),(36,'1966-12-01','Andrew','','Adamson','',_binary '(BLOB)',2),(37,'1972-03-31','Alejandro','','Almenabar','',_binary '(BLOB)',4),(38,'1949-01-12','Wayne','','Wang','',_binary '(BLOB)',2),(39,'1954-03-09','Kevin','','Wade','',_binary '(BLOB)',2),(40,'1969-06-24','Jennifer','','Lopez','',_binary '(BLOB)',3),(41,'1949-01-12','Ralph','','Fiennes','',_binary '(BLOB)',2),(42,'1963-05-11','Natasha','','Richardson','',_binary '(BLOB)',2),(43,'1960-12-11','Stanley','','Tucci','',_binary '(BLOB)',2),(44,'1950-02-18','John','','Hughes','',_binary '(BLOB)',2),(45,'2002-02-22','Emme','','Muñiz','',_binary '(BLOB)',2),(46,'2012-02-27','Samuel','','Garner Affleck','',_binary '(BLOB)',2),(47,'2009-01-06','Seraphina','','Affleck','',_binary '(BLOB)',2),(48,'2005-12-01','Violet','','Affleck','',_binary '(BLOB)',2),(49,'2008-02-22','Max','','Muñiz','',_binary '(BLOB)',2);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:14:06
