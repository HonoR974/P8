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
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'20000','Ajaccio','Rue Bonaparte',NULL),(2,'20000','Ajaccio','Rue De la pétanque',NULL),(3,'20200','Bastia','Avenue de la descente',NULL),(4,'20200','Bastia','Avenue Bonaparte',NULL),(5,'20000','Ajaccio','Avenue de la monté ',NULL),(6,'20000','Ajaccio','Appartement Marie Stella',NULL);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('a','pizza classique'),('b','pizza fromage'),('c','pizza aux fruit '),('d ','pizza aux chorizo');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Dubois','louis','lois@mail.com',2),(2,'Saparella','xavier','xavier@gmail.com',4);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,1,2),(2,4,5);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `compositioningredient`
--

LOCK TABLES `compositioningredient` WRITE;
/*!40000 ALTER TABLE `compositioningredient` DISABLE KEYS */;
INSERT INTO `compositioningredient` VALUES ('a','a',1),('a','b',2),('b','b',3),('b','aza',4),('c','e',5),('c','r',6);
/*!40000 ALTER TABLE `compositioningredient` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Ceccaldi','Doume',1,6,'Pizzaiolo'),(2,'Francis','Benoit',2,4,'livreur');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('a','tomate'),('aza','fromage de chever'),('b','gruyere'),('d','chorizo'),('e','ananas'),('ez','fromage de lait '),('r','peche');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `listeachat`
--

LOCK TABLES `listeachat` WRITE;
/*!40000 ALTER TABLE `listeachat` DISABLE KEYS */;
INSERT INTO `listeachat` VALUES (1,'a',1),(1,'b',2),(2,'a',3),(3,'a',8),(3,'c',9);
/*!40000 ALTER TABLE `listeachat` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES (1,2,2);
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `panier`
--

LOCK TABLES `panier` WRITE;
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
INSERT INTO `panier` VALUES (1,1,1),(2,1,1),(3,2,2);
/*!40000 ALTER TABLE `panier` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,1,'Pizzeria d\'Aiaccu '),(2,3,'Pizzeria du Nord ');
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `statut`
--

LOCK TABLES `statut` WRITE;
/*!40000 ALTER TABLE `statut` DISABLE KEYS */;
INSERT INTO `statut` VALUES (1,'Valider'),(2,'En cours de préparation'),(3,'Préparé'),(4,'En cours de livraison '),(5,'Livré'),(6,'Annuler');
/*!40000 ALTER TABLE `statut` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `stockingredient`
--

LOCK TABLES `stockingredient` WRITE;
/*!40000 ALTER TABLE `stockingredient` DISABLE KEYS */;
INSERT INTO `stockingredient` VALUES (1,'a',100),(1,'b',50),(1,'d',10),(1,'e',26),(2,'a',200),(2,'e',20);
/*!40000 ALTER TABLE `stockingredient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-19 12:38:22
