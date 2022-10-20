CREATE DATABASE  IF NOT EXISTS `dbfichamedica` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbfichamedica`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbfichamedica
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
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro` (
  `idBairro` int(11) NOT NULL,
  `nomeBairro` varchar(50) NOT NULL,
  PRIMARY KEY (`idBairro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'Panorama'),(2,'Centro'),(3,'Santa Felicidade'),(4,'Boa Esperança'),(5,'Cidade Jardim'),(6,'Libra');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL,
  `nomeCidade` varchar(45) NOT NULL,
  `uf_siglaUF` varchar(3) NOT NULL,
  PRIMARY KEY (`idCidade`,`uf_siglaUF`),
  KEY `fk_cidade_uf1_idx` (`uf_siglaUF`),
  CONSTRAINT `fk_cidade_uf1` FOREIGN KEY (`uf_siglaUF`) REFERENCES `uf` (`siglaUF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Foz do Iguaçu','PR'),(2,'Florianópolis','SC'),(3,'Belo Horizonte','MG'),(4,'Niterói','RJ'),(5,'Campinas','SP');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `nrconsulta` int(5) NOT NULL,
  `dataconsulta` date NOT NULL,
  `medico_crmMedico` int(20) NOT NULL,
  `diagnostico_iddiagnostico` int(20) NOT NULL,
  `paciente_nroPaciente` int(11) NOT NULL,
  PRIMARY KEY (`nrconsulta`,`medico_crmMedico`,`diagnostico_iddiagnostico`,`paciente_nroPaciente`),
  KEY `fk_consulta_medico1_idx` (`medico_crmMedico`),
  KEY `fk_consulta_diagnostico1_idx` (`diagnostico_iddiagnostico`),
  KEY `fk_consulta_paciente1_idx` (`paciente_nroPaciente`),
  CONSTRAINT `fk_consulta_diagnostico1` FOREIGN KEY (`diagnostico_iddiagnostico`) REFERENCES `diagnostico` (`iddiagnostico`),
  CONSTRAINT `fk_consulta_medico1` FOREIGN KEY (`medico_crmMedico`) REFERENCES `medico` (`crmMedico`),
  CONSTRAINT `fk_consulta_paciente1` FOREIGN KEY (`paciente_nroPaciente`) REFERENCES `paciente` (`nroPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (11,'2021-01-15',44563,1,3),(12,'2021-02-23',12896,6,1),(13,'2021-01-18',33312,2,4),(14,'2021-03-03',44563,3,6),(15,'2021-03-26',56785,4,2),(16,'2021-02-02',77783,5,5);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddd`
--

DROP TABLE IF EXISTS `ddd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ddd` (
  `codigoDDD` int(3) NOT NULL,
  `ddi_codigoDDI` int(11) NOT NULL,
  PRIMARY KEY (`codigoDDD`,`ddi_codigoDDI`),
  KEY `fk_ddd_ddi1_idx` (`ddi_codigoDDI`),
  CONSTRAINT `fk_ddd_ddi1` FOREIGN KEY (`ddi_codigoDDI`) REFERENCES `ddi` (`codigoDDI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddd`
--

LOCK TABLES `ddd` WRITE;
/*!40000 ALTER TABLE `ddd` DISABLE KEYS */;
INSERT INTO `ddd` VALUES (22,55),(29,55),(37,55),(45,55),(47,55);
/*!40000 ALTER TABLE `ddd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddi`
--

DROP TABLE IF EXISTS `ddi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ddi` (
  `codigoDDI` int(11) NOT NULL,
  PRIMARY KEY (`codigoDDI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddi`
--

LOCK TABLES `ddi` WRITE;
/*!40000 ALTER TABLE `ddi` DISABLE KEYS */;
INSERT INTO `ddi` VALUES (54),(55);
/*!40000 ALTER TABLE `ddi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `iddiagnostico` int(20) NOT NULL,
  `diagnostico` varchar(100) NOT NULL,
  PRIMARY KEY (`iddiagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1,'SARS Cov Detectado '),(2,'SARS Cov Detectado '),(3,'SARS Cov Não Detectado '),(4,'Dengue Detectado'),(5,'Diabetes Tipo 2'),(6,'Rosácea Dermatológica');
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `idemail` int(11) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `paciente_nroPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idemail`,`paciente_nroPaciente`),
  KEY `fk_email_paciente1_idx` (`paciente_nroPaciente`),
  CONSTRAINT `fk_email_paciente1` FOREIGN KEY (`paciente_nroPaciente`) REFERENCES `paciente` (`nroPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'joanarolim@gmail.com',1),(2,'anamerencia@gmail.com',2),(3,'milenasantos@hotmail.com',3),(4,'alissonlindo@gmail.com',4),(5,'guilerme@gmail.com',5);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL,
  `CEPresidencial` varchar(11) NOT NULL,
  `cidade_idCidade` int(11) NOT NULL,
  `bairro_idBairro` int(11) NOT NULL,
  `logradouro_idlogradouro` int(11) NOT NULL,
  PRIMARY KEY (`idendereco`,`cidade_idCidade`,`bairro_idBairro`,`logradouro_idlogradouro`),
  KEY `fk_enderecoresidencial_cidade1_idx` (`cidade_idCidade`),
  KEY `fk_enderecoresidencial_bairro1_idx` (`bairro_idBairro`),
  KEY `fk_enderecoresidencial_logradouro1_idx` (`logradouro_idlogradouro`),
  CONSTRAINT `fk_enderecoresidencial_bairro1` FOREIGN KEY (`bairro_idBairro`) REFERENCES `bairro` (`idBairro`),
  CONSTRAINT `fk_enderecoresidencial_cidade1` FOREIGN KEY (`cidade_idCidade`) REFERENCES `cidade` (`idCidade`),
  CONSTRAINT `fk_enderecoresidencial_logradouro1` FOREIGN KEY (`logradouro_idlogradouro`) REFERENCES `logradouro` (`idlogradouro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'85879412',3,5,3),(2,'86874123',4,2,2),(3,'88963258',1,4,1),(4,'84845412',2,3,4),(5,'87321654',5,1,5),(6,'89896520',1,6,6);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadocivil` (
  `idestadocivil` int(11) NOT NULL,
  `estadocivil` varchar(45) NOT NULL,
  PRIMARY KEY (`idestadocivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'Solteiro(a)'),(2,'Casado(a)'),(3,'Viúvo(a)'),(4,'Divorciado(a)'),(5,'Separado(a)');
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames`
--

DROP TABLE IF EXISTS `exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exames` (
  `nrexame` int(11) NOT NULL,
  `nomeExame` varchar(100) NOT NULL,
  `dataExame` date NOT NULL,
  `nrpedido` int(11) NOT NULL,
  `consulta_nrconsulta` int(5) NOT NULL,
  PRIMARY KEY (`nrexame`,`consulta_nrconsulta`),
  KEY `fk_exames_consulta1_idx` (`consulta_nrconsulta`),
  CONSTRAINT `fk_exames_consulta1` FOREIGN KEY (`consulta_nrconsulta`) REFERENCES `consulta` (`nrconsulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames`
--

LOCK TABLES `exames` WRITE;
/*!40000 ALTER TABLE `exames` DISABLE KEYS */;
INSERT INTO `exames` VALUES (111,'Biópsia Cutânea','2021-02-25',1111,11),(112,'Exame de Sangue','2021-03-27',1112,12),(113,'Exame de Sangue','2021-01-19',1113,13),(114,'Exame de Sangue','2021-03-04',1114,14),(115,'Glicemia de Jejum','2021-02-05',1115,15),(116,'Exame de Sangue','2021-03-04',1116,16);
/*!40000 ALTER TABLE `exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fone`
--

DROP TABLE IF EXISTS `fone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fone` (
  `idfone` int(4) NOT NULL,
  `ddd_codigoDDD` int(11) NOT NULL,
  `fonePaciente` int(11) NOT NULL,
  `paciente_nroPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idfone`,`ddd_codigoDDD`,`paciente_nroPaciente`),
  KEY `fk_fone_paciente1_idx` (`paciente_nroPaciente`),
  KEY `fk_fone_ddd1_idx` (`ddd_codigoDDD`),
  CONSTRAINT `fk_fone_ddd1` FOREIGN KEY (`ddd_codigoDDD`) REFERENCES `ddd` (`codigoDDD`),
  CONSTRAINT `fk_fone_paciente1` FOREIGN KEY (`paciente_nroPaciente`) REFERENCES `paciente` (`nroPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fone`
--

LOCK TABLES `fone` WRITE;
/*!40000 ALTER TABLE `fone` DISABLE KEYS */;
INSERT INTO `fone` VALUES (1,22,991145623,1),(2,45,998746630,2),(3,47,983123317,4),(4,29,998741214,5),(5,37,991241313,3);
/*!40000 ALTER TABLE `fone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logradouro`
--

DROP TABLE IF EXISTS `logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logradouro` (
  `idlogradouro` int(11) NOT NULL,
  `nomeLogradouro` varchar(100) NOT NULL,
  `tipologradouro_siglaTipologradouro` varchar(5) NOT NULL,
  PRIMARY KEY (`idlogradouro`,`tipologradouro_siglaTipologradouro`),
  KEY `fk_logradouro_tipologradouro_idx` (`tipologradouro_siglaTipologradouro`),
  CONSTRAINT `fk_logradouro_tipologradouro` FOREIGN KEY (`tipologradouro_siglaTipologradouro`) REFERENCES `tipologradouro` (`siglaTipologradouro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logradouro`
--

LOCK TABLES `logradouro` WRITE;
/*!40000 ALTER TABLE `logradouro` DISABLE KEYS */;
INSERT INTO `logradouro` VALUES (1,'Scharlesci','Al'),(2,'Ivaté','Tv'),(3,'Lírios Roxos','Con'),(4,'Duque de Caxias','Av'),(5,'Palmeiras','R'),(6,'Bom Jardim','R');
/*!40000 ALTER TABLE `logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `crmMedico` int(20) NOT NULL,
  `nomeMedico` varchar(45) NOT NULL,
  `UF_siglauf` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`crmMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (12896,'Abir Ellakkis','BH'),(33312,'Wu Xang','SC'),(33313,'Layna Nunes','PR'),(44563,'Amon Sousa','PR'),(56785,'Antônio Drauzio Varella','RJ'),(77783,'Angelita Habr Gama','SP');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `nroPaciente` int(11) NOT NULL,
  `nomePaciente` varchar(50) NOT NULL,
  `dataNascimento` date NOT NULL,
  `rgPaciente` int(11) NOT NULL,
  `sexo_siglasexo` varchar(5) NOT NULL,
  `estadocivil_idestadocivil` int(11) NOT NULL,
  `endereco_idendereco` int(11) NOT NULL,
  `numeroResidencial` int(11) NOT NULL,
  `complementoResidencial` varchar(45) NOT NULL,
  PRIMARY KEY (`nroPaciente`,`sexo_siglasexo`,`estadocivil_idestadocivil`,`endereco_idendereco`),
  KEY `fk_paciente_sexo1_idx` (`sexo_siglasexo`),
  KEY `fk_paciente_estadocivil1_idx` (`estadocivil_idestadocivil`),
  KEY `fk_paciente_enderecoresidencial1_idx` (`endereco_idendereco`),
  CONSTRAINT `fk_paciente_enderecoresidencial1` FOREIGN KEY (`endereco_idendereco`) REFERENCES `endereco` (`idendereco`),
  CONSTRAINT `fk_paciente_estadocivil1` FOREIGN KEY (`estadocivil_idestadocivil`) REFERENCES `estadocivil` (`idestadocivil`),
  CONSTRAINT `fk_paciente_sexo1` FOREIGN KEY (`sexo_siglasexo`) REFERENCES `sexo` (`siglasexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Joana Pacheco Rolim','2001-01-15',125648794,'F',1,1,885,'Complexo 3'),(2,'Ana Paula Merencia','2000-01-04',116545239,'F',2,2,145,'2 Andar'),(3,'Milena Lucas dos Santos','1999-12-29',91236547,'F',2,3,56,'Casa'),(4,'Alisson Felipe Colombelli Flecha','1999-05-15',98521473,'M',1,4,789,'Bloco 7'),(5,'Guilherme Sotoa de Oliveira','1998-10-31',114723413,'M',4,5,32,'Casa'),(6,'Maria Ferreira','1978-03-19',122214545,'F',3,6,13,'Casa');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `siglasexo` varchar(5) NOT NULL,
  `sexoCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`siglasexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES ('F','Feminino'),('M','Masculino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologradouro`
--

DROP TABLE IF EXISTS `tipologradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipologradouro` (
  `siglaTipologradouro` varchar(5) NOT NULL,
  `nomeTipologradouro` varchar(45) NOT NULL,
  PRIMARY KEY (`siglaTipologradouro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologradouro`
--

LOCK TABLES `tipologradouro` WRITE;
/*!40000 ALTER TABLE `tipologradouro` DISABLE KEYS */;
INSERT INTO `tipologradouro` VALUES ('Al','Alameda'),('Av','Avenida'),('Con','Condomínio'),('R','Rua'),('Tv','Travessa');
/*!40000 ALTER TABLE `tipologradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uf` (
  `siglaUF` varchar(3) NOT NULL,
  `nomeUF` varchar(50) NOT NULL,
  PRIMARY KEY (`siglaUF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` VALUES ('MG','Minas Gerais'),('PR','Paraná'),('RJ','Rio de Janeiro'),('SC','Santa Catarina'),('SP','São Paulo');
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbfichamedica'
--

--
-- Dumping routines for database 'dbfichamedica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-26 17:27:44
