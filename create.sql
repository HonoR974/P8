-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codePostal` varchar(5) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `adresseRue` varchar(45) NOT NULL,
  `ComplementAdresse` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `reference` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `adresse_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adresse_id_idx` (`adresse_id`),
  CONSTRAINT `adresse_id` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statut_id` int NOT NULL,
  `adresse_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `statut_id_idx` (`statut_id`),
  KEY `adresse_id_idx` (`adresse_id`),
  CONSTRAINT `ad_id` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  CONSTRAINT `statut_id` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compositioningredient`
--

DROP TABLE IF EXISTS `compositioningredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositioningredient` (
  `article_reference` varchar(100) NOT NULL,
  `ingredient_reference` varchar(100) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `article_reference_idx` (`article_reference`),
  KEY `ingredient_reference_idx` (`ingredient_reference`),
  CONSTRAINT `article_reference` FOREIGN KEY (`article_reference`) REFERENCES `article` (`reference`),
  CONSTRAINT `ingredient_reference` FOREIGN KEY (`ingredient_reference`) REFERENCES `ingredient` (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `pizzeria_id` int NOT NULL,
  `adresse_id` int NOT NULL,
  `profession` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pizzeria_id_idx` (`pizzeria_id`),
  KEY `adress_id_idx` (`adresse_id`),
  CONSTRAINT `adress_id` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  CONSTRAINT `pizzeria_id` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `reference` varchar(100) NOT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listeachat`
--

DROP TABLE IF EXISTS `listeachat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listeachat` (
  `panier_id` int NOT NULL,
  `article_ref` varchar(45) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `panier_id_idx` (`panier_id`),
  KEY `article_ref_idx` (`article_ref`),
  CONSTRAINT `article_ref` FOREIGN KEY (`article_ref`) REFERENCES `article` (`reference`),
  CONSTRAINT `panier_id` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livraison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emloye_id` int NOT NULL,
  `commande_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emplo_id_idx` (`emloye_id`),
  KEY `com_id_idx` (`commande_id`),
  CONSTRAINT `com_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  CONSTRAINT `emplo_id` FOREIGN KEY (`emloye_id`) REFERENCES `employe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panier`
--

DROP TABLE IF EXISTS `panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commande_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commande_id_idx` (`commande_id`),
  KEY `client_id_idx` (`client_id`),
  CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzeria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse_id` int NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adress_id_idx` (`adresse_id`),
  CONSTRAINT `id_adresse` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statut`
--

DROP TABLE IF EXISTS `statut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockingredient`
--

DROP TABLE IF EXISTS `stockingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockingredient` (
  `pizzeria_id` int NOT NULL,
  `ingredient_reference` varchar(45) NOT NULL,
  `QuantiteIngredient` int NOT NULL,
  PRIMARY KEY (`pizzeria_id`,`ingredient_reference`),
  KEY `reference_ingre_idx` (`ingredient_reference`),
  CONSTRAINT `piz_id` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`),
  CONSTRAINT `reference_ingre` FOREIGN KEY (`ingredient_reference`) REFERENCES `ingredient` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-19 12:37:00
