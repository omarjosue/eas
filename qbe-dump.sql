CREATE DATABASE  IF NOT EXISTS `qbe` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `qbe`;
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: localhost    Database: qbe
-- ------------------------------------------------------
-- Server version	5.6.17-ndb-7.3.5-cluster-gpl

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
-- Table structure for table `coverage`
--

DROP TABLE IF EXISTS `coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coverage` (
  `idcoverage` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `concept` int(11) unsigned NOT NULL,
  `description` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcoverage`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coverage`
--

LOCK TABLES `coverage` WRITE;
/*!40000 ALTER TABLE `coverage` DISABLE KEYS */;
INSERT INTO `coverage` VALUES (1,5000,'INCENDIO'),(2,5020,'FHM'),(3,5021,'TEV'),(4,3000,'RESPONSABILIDAD CIVIL'),(5,9020,'ROBO DE MERCANCIAS'),(6,8010,'EQUIPO ELECTRONICO'),(7,8020,'CALDERAS'),(8,8030,'ROTURA DE MAQUINARIA');
/*!40000 ALTER TABLE `coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_policy`
--

DROP TABLE IF EXISTS `insurance_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_policy` (
  `idinsurance_policy` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` bigint(20) unsigned NOT NULL,
  `type` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Type must be a foreign key in real life',
  `customer` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Customer must be a foreign key in real life',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `currency` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `agent` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Agent must be a foreign key in real life',
  `idpayment_method` int(11) unsigned NOT NULL,
  `surcharge` int(11) unsigned NOT NULL,
  `tax` int(11) unsigned NOT NULL,
  `exchange_rate` float unsigned NOT NULL,
  `status` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Status must be a foreign key in real life',
  PRIMARY KEY (`idinsurance_policy`),
  KEY `idpayment_method_idx` (`idpayment_method`),
  CONSTRAINT `payment_method_fk` FOREIGN KEY (`idpayment_method`) REFERENCES `payment_method` (`idpayment_method`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_policy`
--

LOCK TABLES `insurance_policy` WRITE;
/*!40000 ALTER TABLE `insurance_policy` DISABLE KEYS */;
INSERT INTO `insurance_policy` VALUES (1,79000067,'Paquete Empresarial','Grupo SAM’S S.A. DE C.V.','2015-04-23','2016-04-23','	 Dólares','9999 : Agente de Seguros y Fianzas SCREEN',1,3,16,14.5678,'VIGENTE');
/*!40000 ALTER TABLE `insurance_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method` (
  `idpayment_method` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `invoices_quantity` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idpayment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'MENSUAL',12),(2,'TRIMESTRAL',4),(3,'SEMESTRAL',2),(4,'ANUAL',1);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_coverage`
--

DROP TABLE IF EXISTS `policy_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_coverage` (
  `idpolicy_coverage` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idinsurance_policy` int(11) unsigned NOT NULL,
  `idcoverage` int(11) unsigned NOT NULL,
  `sum_assured` double unsigned NOT NULL,
  `prime` double unsigned NOT NULL,
  `comission` double unsigned NOT NULL,
  PRIMARY KEY (`idpolicy_coverage`),
  KEY `insurance_policy_idx` (`idinsurance_policy`),
  KEY `coverage_fk_idx` (`idcoverage`),
  CONSTRAINT `coverage_fk` FOREIGN KEY (`idcoverage`) REFERENCES `coverage` (`idcoverage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `insurance_policy_fk` FOREIGN KEY (`idinsurance_policy`) REFERENCES `insurance_policy` (`idinsurance_policy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='We might get the total amount of each concept (sum_assured, prime, and comission) from a view in real life';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_coverage`
--

LOCK TABLES `policy_coverage` WRITE;
/*!40000 ALTER TABLE `policy_coverage` DISABLE KEYS */;
INSERT INTO `policy_coverage` VALUES (1,1,1,100300876,3414743.32,409769.2),(2,1,2,85255744.6,2902531.82,348303.82),(3,1,3,20060175.2,682948.66,81953.84),(4,1,4,5000000,170225,20427),(5,1,5,2000200,68096.81,8171.62),(6,1,6,1007000,34283.32,4114),(7,1,7,35000000,1191575,142989),(8,1,8,95000000,3234275,388113);
/*!40000 ALTER TABLE `policy_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_receipt`
--

DROP TABLE IF EXISTS `policy_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_receipt` (
  `folio` int(11) unsigned NOT NULL,
  `idinsurance_policy` int(11) unsigned NOT NULL,
  `current_receipt` int(11) unsigned NOT NULL,
  `type` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `surcharge_total` double unsigned NOT NULL,
  `tax_total` double unsigned NOT NULL,
  `prime_total` double unsigned NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `receipt_insurance_policy_fk_idx` (`idinsurance_policy`),
  CONSTRAINT `receipt_insurance_policy_fk` FOREIGN KEY (`idinsurance_policy`) REFERENCES `insurance_policy` (`idinsurance_policy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='We get the distribution of the comission and prime through the policy_coverage table.\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_receipt`
--

LOCK TABLES `policy_receipt` WRITE;
/*!40000 ALTER TABLE `policy_receipt` DISABLE KEYS */;
INSERT INTO `policy_receipt` VALUES (1,1,1,'FACTURA',350960.36,1871788.63,15325269.4,'2015-04-29');
/*!40000 ALTER TABLE `policy_receipt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-05 12:03:39
