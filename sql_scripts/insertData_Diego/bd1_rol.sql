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
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `type` int NOT NULL AUTO_INCREMENT,
  `name` varchar(220) NOT NULL,
  `character_name` varchar(220) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (99,'Director',''),(100,'Productor',''),(101,'Productor Ejecutivo',''),(102,'Cast',''),(103,'Director de Casting',''),(104,'1st AD',''),(105,'2nd AD',''),(106,'Set PA',''),(107,'Diseño de producción',''),(108,'Director de Arte',''),(109,'Vestuarista',''),(110,'Prop Master',''),(111,'Art PA',''),(112,'Director de Fotografía',''),(113,'Operador de Cámara',''),(114,'1st AC',''),(115,'2nd AC',''),(116,'DIT',''),(117,'Gaffer',''),(118,'Best Boy Electric',''),(119,'Electricista',''),(120,'Operador del Generador',''),(121,'Key Grip',''),(122,'Best Boy Grip',''),(123,'Grip',''),(124,'Dolly Grip',''),(125,'Maquillista',''),(126,'Estilista',''),(127,'Asistente de maquillaje',''),(128,'Maquillista de efectos especiales',''),(129,'Diseñador de vestuario',''),(130,'Supervisor de vestuario',''),(131,'Set Costumer',''),(132,'Sastre',''),(133,'Shopper',''),(134,'Production Sound Mixer',''),(135,'Operador de Boom',''),(136,'Asistente de Sonido',''),(137,'Catering Service',''),(138,'Coordinador de Acrobacias',''),(139,'Doble de riesgo',''),(140,'Supervisor de VFX',''),(141,'Coordinador de VFX',''),(142,'Line Producer',''),(143,'Unit Production Manager',''),(144,'Coordinador de Producción',''),(145,'Contador',''),(146,'Office PA',''),(147,'Guionista','');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:14:10
