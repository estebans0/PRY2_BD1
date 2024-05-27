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
-- Table structure for table `prod_by_company`
--

DROP TABLE IF EXISTS `prod_by_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_by_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_production` int NOT NULL,
  `id_company` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_production_pxc` (`id_production`),
  KEY `fk_id_company_pxc` (`id_company`),
  CONSTRAINT `fk_id_company_pxc` FOREIGN KEY (`id_company`) REFERENCES `prod_company` (`id`),
  CONSTRAINT `fk_id_production_pxc` FOREIGN KEY (`id_production`) REFERENCES `production` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_by_company`
--

LOCK TABLES `prod_by_company` WRITE;
/*!40000 ALTER TABLE `prod_by_company` DISABLE KEYS */;
INSERT INTO `prod_by_company` VALUES (2,1,3),(3,2,3),(4,3,4),(5,4,7),(6,5,3),(7,6,16),(8,7,3),(9,8,8),(10,9,7),(11,10,7),(12,11,7),(13,12,7),(14,13,3),(15,14,3),(16,15,7),(17,16,3),(18,17,8),(19,18,3),(20,19,16),(21,20,9),(22,21,16),(23,22,5),(24,23,9),(25,24,11),(26,25,5),(27,26,6),(28,27,8),(29,28,5),(30,29,5),(31,30,4),(32,31,16),(33,32,8),(34,33,3),(35,34,8),(36,35,10),(37,36,12),(39,38,3),(40,39,16),(41,40,3),(42,41,10),(43,42,7),(44,43,10),(45,44,4),(46,45,5),(47,46,14),(48,47,6),(49,48,14),(50,49,11),(51,50,7),(52,51,3),(53,52,15),(54,53,17),(55,54,17),(56,55,17),(57,56,17),(58,57,17),(59,58,17),(60,59,17),(61,60,17);
/*!40000 ALTER TABLE `prod_by_company` ENABLE KEYS */;
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
