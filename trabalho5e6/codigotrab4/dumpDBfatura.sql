-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: dbfatura
-- ------------------------------------------------------
-- Server version	5.7.32-log

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
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro` (
  `idBairro` int(11) NOT NULL AUTO_INCREMENT,
  `nomeBairro` varchar(50) NOT NULL,
  PRIMARY KEY (`idBairro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'Barro Preto'),(2,'Renascer'),(3,'Morro Alto');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCidade` varchar(50) NOT NULL,
  `UF_siglaUF` varchar(4) NOT NULL,
  PRIMARY KEY (`idCidade`,`UF_siglaUF`),
  KEY `fk_Cidade_UF1_idx` (`UF_siglaUF`),
  CONSTRAINT `fk_Cidade_UF1` FOREIGN KEY (`UF_siglaUF`) REFERENCES `uf` (`siglaUF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (2,'Belo Horizonte','MG'),(4,'Missal','PR'),(6,'Arraial do Cabo','RJ');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(45) NOT NULL,
  `CPFcliente` varchar(12) NOT NULL,
  `EnderecoResidencial_idEnderecoResidencial` int(11) NOT NULL,
  `numeroResidencialCliente` int(11) NOT NULL,
  `complementoResidencialCliente` varchar(45) NOT NULL,
  `EnderecoComercial_idEnderecoComercial` int(11) NOT NULL,
  `numeroComercial` int(11) NOT NULL,
  `complementoComercial` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`,`EnderecoResidencial_idEnderecoResidencial`,`EnderecoComercial_idEnderecoComercial`),
  KEY `fk_Cliente_EnderecoResidencial1_idx` (`EnderecoResidencial_idEnderecoResidencial`),
  KEY `fk_Cliente_EnderecoComercial1_idx` (`EnderecoComercial_idEnderecoComercial`),
  CONSTRAINT `fk_Cliente_EnderecoComercial1` FOREIGN KEY (`EnderecoComercial_idEnderecoComercial`) REFERENCES `enderecocomercial` (`idEnderecoComercial`),
  CONSTRAINT `fk_Cliente_EnderecoResidencial1` FOREIGN KEY (`EnderecoResidencial_idEnderecoResidencial`) REFERENCES `enderecoresidencial` (`idEnderecoResidencial`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'Joana Pacheco Rolim','08078956245',1,277,'Apartamento',5,123,'Sala 7'),(9,'Ana Paula Merencia','11056948763',2,89,'Casa',6,578,'Bloco 9'),(13,'Milena dos Santos','11012356896',3,785,'Casa',7,49,'2 Andar');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailcliente`
--

DROP TABLE IF EXISTS `emailcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailcliente` (
  `idemailCliente` int(11) NOT NULL AUTO_INCREMENT,
  `emailCliente` varchar(50) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idemailCliente`,`Cliente_idCliente`),
  KEY `fk_emailCliente_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_emailCliente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailcliente`
--

LOCK TABLES `emailcliente` WRITE;
/*!40000 ALTER TABLE `emailcliente` DISABLE KEYS */;
INSERT INTO `emailcliente` VALUES (1,'joanarolim@gmail.com',3),(2,'anapaula@gmail.com',9),(3,'milenasantos@gmail.com',13);
/*!40000 ALTER TABLE `emailcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecocomercial`
--

DROP TABLE IF EXISTS `enderecocomercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecocomercial` (
  `idEnderecoComercial` int(11) NOT NULL AUTO_INCREMENT,
  `CEPcomercial` varchar(20) NOT NULL,
  `Cidade_idCidade` int(11) NOT NULL,
  `Cidade_UF_siglaUF` varchar(4) NOT NULL,
  `Logradouro_idLogradouro` int(11) NOT NULL,
  `Bairro_idBairro` int(11) NOT NULL,
  PRIMARY KEY (`idEnderecoComercial`,`Cidade_idCidade`,`Cidade_UF_siglaUF`,`Logradouro_idLogradouro`,`Bairro_idBairro`),
  KEY `fk_EnderecoComercial_Cidade1_idx` (`Cidade_idCidade`,`Cidade_UF_siglaUF`),
  KEY `fk_EnderecoComercial_Logradouro1_idx` (`Logradouro_idLogradouro`),
  KEY `fk_EnderecoComercial_Bairro1_idx` (`Bairro_idBairro`),
  CONSTRAINT `fk_EnderecoComercial_Bairro1` FOREIGN KEY (`Bairro_idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `fk_EnderecoComercial_Cidade1` FOREIGN KEY (`Cidade_idCidade`, `Cidade_UF_siglaUF`) REFERENCES `cidade` (`idCidade`, `UF_siglaUF`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecocomercial`
--

LOCK TABLES `enderecocomercial` WRITE;
/*!40000 ALTER TABLE `enderecocomercial` DISABLE KEYS */;
INSERT INTO `enderecocomercial` VALUES (5,'89874563',2,'MG',1,1),(6,'82465321',4,'PR',3,2),(7,'87123456',6,'RJ',5,3);
/*!40000 ALTER TABLE `enderecocomercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoresidencial`
--

DROP TABLE IF EXISTS `enderecoresidencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecoresidencial` (
  `idEnderecoResidencial` int(11) NOT NULL AUTO_INCREMENT,
  `CEPresidencial` varchar(20) NOT NULL,
  `Cidade_idCidade` int(11) NOT NULL,
  `Cidade_UF_siglaUF` varchar(4) NOT NULL,
  `Logradouro_idLogradouro` int(11) NOT NULL,
  `Bairro_idBairro` int(11) NOT NULL,
  PRIMARY KEY (`idEnderecoResidencial`,`Cidade_idCidade`,`Cidade_UF_siglaUF`,`Logradouro_idLogradouro`,`Bairro_idBairro`),
  KEY `fk_EnderecoResidencial_Cidade1_idx` (`Cidade_idCidade`,`Cidade_UF_siglaUF`),
  KEY `fk_EnderecoResidencial_Logradouro1_idx` (`Logradouro_idLogradouro`),
  KEY `fk_EnderecoResidencial_Bairro1_idx` (`Bairro_idBairro`),
  CONSTRAINT `fk_EnderecoResidencial_Bairro1` FOREIGN KEY (`Bairro_idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `fk_EnderecoResidencial_Cidade1` FOREIGN KEY (`Cidade_idCidade`, `Cidade_UF_siglaUF`) REFERENCES `cidade` (`idCidade`, `UF_siglaUF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoresidencial`
--

LOCK TABLES `enderecoresidencial` WRITE;
/*!40000 ALTER TABLE `enderecoresidencial` DISABLE KEYS */;
INSERT INTO `enderecoresidencial` VALUES (1,'85874698',2,'MG',1,1),(2,'88567412',4,'PR',3,2),(3,'84891231',6,'RJ',5,3);
/*!40000 ALTER TABLE `enderecoresidencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura` (
  `numeroFatura` int(11) NOT NULL AUTO_INCREMENT,
  `dataEmissaoFatura` date NOT NULL,
  `totalFatura` double NOT NULL,
  `saldoAPagar` double NOT NULL,
  `Parcela_idParcela` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`numeroFatura`,`Parcela_idParcela`,`Cliente_idCliente`),
  KEY `fk_Fatura_Parcela1_idx` (`Parcela_idParcela`),
  KEY `fk_Fatura_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Fatura_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_Fatura_Parcela1` FOREIGN KEY (`Parcela_idParcela`) REFERENCES `parcela` (`idParcela`)
) ENGINE=InnoDB AUTO_INCREMENT=8778 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
INSERT INTO `fatura` VALUES (1111,'2021-03-15',3000,250,191,9),(2222,'2021-01-04',750,750,108,9),(4444,'2021-02-19',44999.91,149997,33,3),(5555,'2021-03-15',1794.7,0,19,3),(6666,'2021-03-12',7698.72,2245.46,77,9),(7777,'2021-03-20',555.92,138.98,34,13);
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logradouro`
--

DROP TABLE IF EXISTS `logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logradouro` (
  `idLogradouro` int(11) NOT NULL AUTO_INCREMENT,
  `nomeLogradouro` varchar(100) NOT NULL,
  `TipoLogradouro_siglaTipoLogradouro` varchar(5) NOT NULL,
  PRIMARY KEY (`idLogradouro`,`TipoLogradouro_siglaTipoLogradouro`),
  KEY `fk_Logradouro_TipoLogradouro1_idx` (`TipoLogradouro_siglaTipoLogradouro`),
  CONSTRAINT `fk_Logradouro_TipoLogradouro1` FOREIGN KEY (`TipoLogradouro_siglaTipoLogradouro`) REFERENCES `tipologradouro` (`siglaTipoLogradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logradouro`
--

LOCK TABLES `logradouro` WRITE;
/*!40000 ALTER TABLE `logradouro` DISABLE KEYS */;
INSERT INTO `logradouro` VALUES (1,'Barbacena','Av'),(3,'Santo Expedito','R'),(5,'Boa Vista','Al');
/*!40000 ALTER TABLE `logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela`
--

DROP TABLE IF EXISTS `parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcela` (
  `idParcela` int(11) NOT NULL AUTO_INCREMENT,
  `numeroParcela` int(11) NOT NULL,
  `vencimentoParcela` date NOT NULL,
  `valorParcela` double NOT NULL,
  `SituacaoParcela_siglaSituacaoParcela` varchar(2) NOT NULL,
  PRIMARY KEY (`idParcela`,`SituacaoParcela_siglaSituacaoParcela`),
  KEY `fk_Parcela_SituacaoParcela_idx` (`SituacaoParcela_siglaSituacaoParcela`),
  CONSTRAINT `fk_Parcela_SituacaoParcela` FOREIGN KEY (`SituacaoParcela_siglaSituacaoParcela`) REFERENCES `situacaoparcela` (`siglaSituacaoParcela`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela`
--

LOCK TABLES `parcela` WRITE;
/*!40000 ALTER TABLE `parcela` DISABLE KEYS */;
INSERT INTO `parcela` VALUES (19,2,'2021-03-15',897.35,'Q'),(33,7,'2021-03-01',499.99,'P'),(34,3,'2021-03-10',138.98,'Q'),(45,10,'2021-03-05',289.05,'P'),(77,17,'2021-03-16',320.78,'Q'),(100,6,'2021-03-24',299.99,'Q'),(108,1,'2021-03-06',150,'P'),(191,11,'2021-03-15',250,'Q');
/*!40000 ALTER TABLE `parcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacaoparcela`
--

DROP TABLE IF EXISTS `situacaoparcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `situacaoparcela` (
  `siglaSituacaoParcela` varchar(2) NOT NULL,
  `situacaoParcela` varchar(45) NOT NULL,
  PRIMARY KEY (`siglaSituacaoParcela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacaoparcela`
--

LOCK TABLES `situacaoparcela` WRITE;
/*!40000 ALTER TABLE `situacaoparcela` DISABLE KEYS */;
INSERT INTO `situacaoparcela` VALUES ('C','Cancelada'),('P','Pendente'),('Q','Quitada');
/*!40000 ALTER TABLE `situacaoparcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonecliente`
--

DROP TABLE IF EXISTS `telefonecliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonecliente` (
  `idTelefoneCliente` int(11) NOT NULL AUTO_INCREMENT,
  `foneCliente` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idTelefoneCliente`,`Cliente_idCliente`),
  KEY `fk_TelefoneCliente_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_TelefoneCliente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonecliente`
--

LOCK TABLES `telefonecliente` WRITE;
/*!40000 ALTER TABLE `telefonecliente` DISABLE KEYS */;
INSERT INTO `telefonecliente` VALUES (22,989546683,13),(31,991875698,3),(45,998238411,9);
/*!40000 ALTER TABLE `telefonecliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologradouro`
--

DROP TABLE IF EXISTS `tipologradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipologradouro` (
  `siglaTipoLogradouro` varchar(5) NOT NULL,
  `nomeTipoLogradouro` varchar(45) NOT NULL,
  PRIMARY KEY (`siglaTipoLogradouro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologradouro`
--

LOCK TABLES `tipologradouro` WRITE;
/*!40000 ALTER TABLE `tipologradouro` DISABLE KEYS */;
INSERT INTO `tipologradouro` VALUES ('Al','Alameda'),('Av','Avenida'),('R','Rua');
/*!40000 ALTER TABLE `tipologradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uf` (
  `siglaUF` varchar(4) NOT NULL,
  `nomeUF` varchar(50) NOT NULL,
  PRIMARY KEY (`siglaUF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` VALUES ('MG','Minas Gerais'),('PR','Paraná'),('RJ','Rio de Janeiro');
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbfatura'
--

--
-- Dumping routines for database 'dbfatura'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-14  9:50:16
