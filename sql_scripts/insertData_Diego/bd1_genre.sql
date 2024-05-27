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
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(230) NOT NULL,
  `characteristics` varchar(290) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (5,'Biografia','Genero audiovisual que trata la vida/obra de un personaje.'),(8,'Documental','Hace referencia a temas de interés científico, social o cultural, entre otros.'),(18,'Cortometraje','Audiovisual de corta duración, usualmente de menos de 30 minutos'),(21,'Accion','Implica una interacción moral entre el «bien» y el «mal».'),(22,'Aventura','Refleja un mundo heroico de combates y aventuras.'),(23,'Animación','Producciones basadas en dibujos animados o images generadas por computadora.'),(25,'Comedia','Una comedia cinematográfica es una película con situaciones de humor .'),(26,'Crimen','Se centra en actos criminales y en la investigación que se hace sobre estos.'),(27,'Drama','Se centran principalmente en el desarrollo de una lid entre los protagonistas.'),(28,'Familiar','Orientadas a ser disfrutadas por todos los miembros de una \"familia tradicional\"\"\"'),(30,'Fantasía',' Narra mundos y personajes mágicos que provienen únicamente de la imaginación de su autor.'),(31,'Film-Noir','Film donde el protagonista es un antihéroe, casi siempre vinculado a una femme fatale.'),(33,'Histórico','Género cinematográfico en que la ambientación en una época histórica determinada.'),(36,'Musical','Películas con temas musicales que son fundamentales en el desarrollo argumental.'),(37,'Romance','Relata un desenvolvimiento romántico, cariñoso o amoroso entre dos personas.'),(40,'Sci-Fi','Historias fantásticas en donde la justificación de lo desconocido se basa en la ciencia.');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:14:09
