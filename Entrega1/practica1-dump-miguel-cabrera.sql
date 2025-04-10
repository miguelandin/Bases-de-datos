/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: MySalud
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Cita`
--

DROP TABLE IF EXISTS `Cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cita` (
  `cita_ID` int(11) NOT NULL,
  `paciente_DNI` char(50) DEFAULT NULL,
  `doctor_ID` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `importe` int(11) DEFAULT NULL,
  PRIMARY KEY (`cita_ID`),
  KEY `paciente_DNI` (`paciente_DNI`),
  KEY `doctor_ID` (`doctor_ID`),
  CONSTRAINT `Cita_ibfk_1` FOREIGN KEY (`paciente_DNI`) REFERENCES `Paciente` (`paciente_DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Cita_ibfk_2` FOREIGN KEY (`doctor_ID`) REFERENCES `Doctor` (`doctor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cita`
--

LOCK TABLES `Cita` WRITE;
/*!40000 ALTER TABLE `Cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `doctor_ID` int(11) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  `especialidad` char(50) DEFAULT NULL,
  `hospital_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctor_ID`),
  KEY `hospital_ID` (`hospital_ID`),
  CONSTRAINT `Doctor_ibfk_1` FOREIGN KEY (`hospital_ID`) REFERENCES `Hospital` (`hospital_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospital`
--

DROP TABLE IF EXISTS `Hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hospital` (
  `hospital_ID` int(11) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  `ciudad` char(50) DEFAULT NULL,
  `direccion` char(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`hospital_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospital`
--

LOCK TABLES `Hospital` WRITE;
/*!40000 ALTER TABLE `Hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paciente` (
  `paciente_DNI` char(50) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  `telefono` char(15) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  PRIMARY KEY (`paciente_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente`
--

LOCK TABLES `Paciente` WRITE;
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tratamiento`
--

DROP TABLE IF EXISTS `Tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tratamiento` (
  `tratamiento_ID` int(11) NOT NULL,
  `descripcion` char(50) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `cita_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tratamiento_ID`),
  KEY `cita_ID` (`cita_ID`),
  CONSTRAINT `Tratamiento_ibfk_1` FOREIGN KEY (`cita_ID`) REFERENCES `Cita` (`cita_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tratamiento`
--

LOCK TABLES `Tratamiento` WRITE;
/*!40000 ALTER TABLE `Tratamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'MySalud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-28 18:50:44
