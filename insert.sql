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
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'20000','Ajaccio','Rue Bonaparte',NULL),(2,'20000','Ajaccio','Rue De la pétanque',NULL),(3,'20200','Bastia','Avenue de la descente',NULL),(4,'20200','Bastia','Avenue Bonaparte',NULL),(5,'20000','Ajaccio','Avenue de la monté ',NULL),(6,'20000','Ajaccio','Appartement Marie Stella',NULL);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('a','pizza classique'),('b','pizza fromage'),('c','pizza aux fruit '),('d ','pizza aux chorizo');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Dubois','louis','lois@mail.com',2),(2,'Saparella','xavier','xavier@gmail.com',4);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,1,2),(2,4,5);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `compositioningredient`
--

LOCK TABLES `compositioningredient` WRITE;
/*!40000 ALTER TABLE `compositioningredient` DISABLE KEYS */;
INSERT INTO `compositioningredient` VALUES ('a','a',1),('a','b',2),('b','b',3),('b','aza',4),('c','e',5),('c','r',6);
/*!40000 ALTER TABLE `compositioningredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Ceccaldi','Doume',1,6,'Pizzaiolo'),(2,'Francis','Benoit',2,4,'livreur');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('a','tomate'),('aza','fromage de chever'),('b','gruyere'),('d','chorizo'),('e','ananas'),('ez','fromage de lait '),('r','peche');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `listeachat`
--

LOCK TABLES `listeachat` WRITE;
/*!40000 ALTER TABLE `listeachat` DISABLE KEYS */;
INSERT INTO `listeachat` VALUES (1,'a',1),(1,'b',2),(2,'a',3),(3,'a',8),(3,'c',9);
/*!40000 ALTER TABLE `listeachat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES (1,2,2);
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `panier`
--

LOCK TABLES `panier` WRITE;
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
INSERT INTO `panier` VALUES (1,1,1),(2,1,1),(3,2,2);
/*!40000 ALTER TABLE `panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,1,'Pizzeria d\'Aiaccu '),(2,3,'Pizzeria du Nord ');
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statut`
--

LOCK TABLES `statut` WRITE;
/*!40000 ALTER TABLE `statut` DISABLE KEYS */;
INSERT INTO `statut` VALUES (1,'Valider'),(2,'En cours de préparation'),(3,'Préparé'),(4,'En cours de livraison '),(5,'Livré'),(6,'Annuler');
/*!40000 ALTER TABLE `statut` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2021-07-19 12:37:47
