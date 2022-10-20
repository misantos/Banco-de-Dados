CREATE DATABASE  IF NOT EXISTS `dbproduto` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbproduto`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproduto
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codCliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `profissao_idprofissão` int(11) NOT NULL,
  PRIMARY KEY (`codCliente`),
  KEY `fk_cliente_profissao_idx` (`profissao_idprofissão`),
  CONSTRAINT `fk_cliente_profissao` FOREIGN KEY (`profissao_idprofissão`) REFERENCES `profissao` (`idprofissão`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Joana Pacheco Rolim',1),(2,'Ana Paula Merencia',2),(3,'Milena Lucas dos Santos',3),(4,'Alisson Felipe Collombeli Flecha',6),(5,'Guilherme Sotoa de Oliveira',4),(6,'Maria Ferreira',5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcompra`
--

DROP TABLE IF EXISTS `itemcompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemcompra` (
  `nroCompra` int(11) NOT NULL,
  `produto_codPro` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`nroCompra`,`produto_codPro`),
  KEY `fk_itemcompra_produto1` (`produto_codPro`),
  CONSTRAINT `fk_itemcompra_produto1` FOREIGN KEY (`produto_codPro`) REFERENCES `produto` (`codPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcompra`
--

LOCK TABLES `itemcompra` WRITE;
/*!40000 ALTER TABLE `itemcompra` DISABLE KEYS */;
INSERT INTO `itemcompra` VALUES (111,1,1,3800),(222,2,1,700),(333,3,2,1699),(444,4,2,570),(555,5,3,800),(666,6,3,4200),(777,7,4,1899),(888,8,4,600),(999,9,1,2450),(1010,10,1,3000),(1111,11,2,1999),(1212,1,2,3800),(1313,2,3,700),(1414,3,3,1699),(1515,4,4,570),(1616,5,4,800),(1717,13,10,12),(1818,14,4,200);
/*!40000 ALTER TABLE `itemcompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemvenda` (
  `nroVenda` int(11) NOT NULL,
  `produto_codPro` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`nroVenda`,`produto_codPro`),
  KEY `fk_itemvenda_produto1` (`produto_codPro`),
  CONSTRAINT `fk_itemvenda_produto1` FOREIGN KEY (`produto_codPro`) REFERENCES `produto` (`codPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvenda`
--

LOCK TABLES `itemvenda` WRITE;
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` VALUES (111,1,1,10000),(222,2,1,1500),(333,3,2,4500),(444,4,2,989),(555,5,3,1200),(666,6,3,6700),(777,7,4,2250),(888,8,4,2299),(999,9,1,3000),(1010,10,1,3999),(1111,11,2,2200),(1212,1,2,10000),(1313,2,3,1500),(1414,3,3,4500),(1515,4,4,989),(1616,14,2,200);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notacompra`
--

DROP TABLE IF EXISTS `notacompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notacompra` (
  `data` date NOT NULL,
  `totalNota` double NOT NULL,
  `itemcompra_nroCompra` int(11) NOT NULL,
  PRIMARY KEY (`itemcompra_nroCompra`),
  CONSTRAINT `fk_notacompra_itemcompra1` FOREIGN KEY (`itemcompra_nroCompra`) REFERENCES `itemcompra` (`nroCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notacompra`
--

LOCK TABLES `notacompra` WRITE;
/*!40000 ALTER TABLE `notacompra` DISABLE KEYS */;
INSERT INTO `notacompra` VALUES ('2021-01-05',3800,111),('2021-01-05',700,222),('2020-12-24',3398,333),('2021-01-05',1140,444),('2021-01-05',2400,555),('2021-01-05',12600,666),('2020-12-24',7596,777),('2021-03-05',2400,888),('2021-03-05',2450,999),('2021-11-29',3000,1010),('2021-12-20',3998,1111),('2021-11-10',7600,1212),('2021-01-05',2100,1313),('2021-02-25',5097,1414),('2020-11-15',2280,1515),('2021-01-15',120,1717),('2021-02-28',800,1818);
/*!40000 ALTER TABLE `notacompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notavenda`
--

DROP TABLE IF EXISTS `notavenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notavenda` (
  `itemvenda_nroVenda` int(11) NOT NULL,
  `cliente_codCliente` int(11) NOT NULL,
  `dataVenda` date NOT NULL,
  `totalVenda` double NOT NULL,
  PRIMARY KEY (`itemvenda_nroVenda`,`cliente_codCliente`),
  KEY `fk_notavenda_cliente1_idx` (`cliente_codCliente`),
  CONSTRAINT `fk_notavenda_cliente1` FOREIGN KEY (`cliente_codCliente`) REFERENCES `cliente` (`codCliente`),
  CONSTRAINT `fk_notavenda_itemvenda1` FOREIGN KEY (`itemvenda_nroVenda`) REFERENCES `itemvenda` (`nroVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notavenda`
--

LOCK TABLES `notavenda` WRITE;
/*!40000 ALTER TABLE `notavenda` DISABLE KEYS */;
INSERT INTO `notavenda` VALUES (111,1,'2021-03-06',10000),(222,1,'2021-01-15',1500),(333,2,'2021-01-03',9000),(444,2,'2021-02-15',1978),(555,3,'2021-03-06',3600),(666,3,'2021-01-15',20100),(777,4,'2021-01-01',9000),(888,4,'2021-04-04',9196),(999,5,'2021-04-04',3000),(1010,5,'2020-12-19',3999),(1111,6,'2020-12-23',4400),(1212,6,'2020-11-11',20000),(1313,2,'2021-02-05',4500),(1414,1,'2021-03-03',13500),(1515,3,'2020-11-20',3956),(1616,1,'2021-03-03',600);
/*!40000 ALTER TABLE `notavenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codPro` int(11) NOT NULL,
  `nomePro` varchar(50) NOT NULL,
  `precoVenda` double NOT NULL,
  `precoCusto` double NOT NULL,
  PRIMARY KEY (`codPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Iphone 12 Pro Max',10000,3800),(2,'Cadeira Gamer',1500,700),(3,'Poltrona Decorativa',4500,1699),(4,'Vaso Murano Rosê',989,570),(5,'Secador de Cabelo Taiffl',1200,800),(6,'Geladeira Frost Free Duplex',6700,4200),(7,'Jogo de Panelas Antiaderente',2250,1899),(8,'AirPods',2299,600),(9,'SmartTv 4K LED 50 Samsung',3000,2450),(10,'Notebook Dell Inspiron',3999,3000),(11,'Batedeira Rosa',2200,1999),(12,'Almofada Elegance Colorida',99,59),(13,'Oreo Chromatica by Lady Gaga ',45,12),(14,'Berloque Vivara Joaninha',300,200);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissao`
--

DROP TABLE IF EXISTS `profissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissao` (
  `idprofissão` int(11) NOT NULL,
  `nomeProfissao` varchar(50) NOT NULL,
  PRIMARY KEY (`idprofissão`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissao`
--

LOCK TABLES `profissao` WRITE;
/*!40000 ALTER TABLE `profissao` DISABLE KEYS */;
INSERT INTO `profissao` VALUES (1,'Estudante'),(2,'Funcionário Público'),(3,'Engenheiro Elétrico'),(4,'Bacharel em Computação'),(5,'Aposentado'),(6,'Desempregado');
/*!40000 ALTER TABLE `profissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbproduto'
--

--
-- Dumping routines for database 'dbproduto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-05 17:35:58
