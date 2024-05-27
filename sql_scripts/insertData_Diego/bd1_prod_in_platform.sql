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
-- Table structure for table `prod_in_platform`
--

DROP TABLE IF EXISTS `prod_in_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_in_platform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_production` int NOT NULL,
  `id_platform` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_production_pip` (`id_production`),
  KEY `fk_id_platform_pip` (`id_platform`),
  CONSTRAINT `fk_id_platform_pip` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id`),
  CONSTRAINT `fk_id_production_pip` FOREIGN KEY (`id_production`) REFERENCES `production` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_in_platform`
--

LOCK TABLES `prod_in_platform` WRITE;
/*!40000 ALTER TABLE `prod_in_platform` DISABLE KEYS */;
INSERT INTO `prod_in_platform` VALUES (2,1,6),(3,2,6),(4,3,5),(5,4,3),(6,5,6),(7,6,5),(8,7,6),(9,8,6),(10,9,3),(11,10,3),(12,11,3),(13,12,3),(14,13,6),(15,14,6),(16,15,3),(17,16,6),(18,17,6),(19,18,6),(20,19,5),(21,20,8),(22,21,5),(23,22,4),(24,23,8),(25,24,7),(26,25,4),(27,26,6),(28,27,6),(29,28,4),(30,29,4),(31,30,5),(32,31,5),(33,32,6),(34,33,6),(35,34,6),(36,35,6),(37,36,2),(39,38,6),(40,39,5),(41,40,6),(42,41,6),(43,42,3),(44,43,6),(45,44,5),(46,45,4),(47,46,9),(48,47,6),(49,48,9),(50,49,7),(51,50,3),(52,51,6),(53,52,2),(54,53,8),(55,54,2),(56,55,2),(57,56,2),(58,57,2),(59,58,2),(60,59,2),(61,60,2);
/*!40000 ALTER TABLE `prod_in_platform` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:14:05
