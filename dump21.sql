-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: RAILWAY
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `EMPLOYEES_CONTACT_NUMBERS`
--

DROP TABLE IF EXISTS `EMPLOYEES_CONTACT_NUMBERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEES_CONTACT_NUMBERS` (
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `ContactNo` char(10) NOT NULL,
  PRIMARY KEY (`ContactNo`),
  KEY `FirstName` (`FirstName`,`LastName`),
  KEY `Designation` (`Designation`),
  CONSTRAINT `EMPLOYEES_CONTACT_NUMBERS_ibfk_1` FOREIGN KEY (`FirstName`, `LastName`) REFERENCES `RAILWAY_EMPLOYEES_A` (`Firstname`, `LastName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EMPLOYEES_CONTACT_NUMBERS_ibfk_2` FOREIGN KEY (`Designation`) REFERENCES `RAILWAY_EMPLOYEES_B` (`Designation`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES_CONTACT_NUMBERS`
--

LOCK TABLES `EMPLOYEES_CONTACT_NUMBERS` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES_CONTACT_NUMBERS` DISABLE KEYS */;
INSERT INTO `EMPLOYEES_CONTACT_NUMBERS` VALUES ('Alicica','Zeleya','Ticket Collector','8096740088'),('Will','Culvert','Station Superintendent','8175798520'),('James','Borg','Station Agent','8956566103'),('Alicica','Zeleya','Ticket Collector','9119110808'),('Ramesh','Narayan','Station Master','9394565700'),('Will','Culvert','Station Superintendent','9786484547'),('Ken','Adams','Clerk','9866256770'),('Ramesh','Narayan','Station Master','9938901015'),('Will','Culvert','Station Superintendent','9949599090');
/*!40000 ALTER TABLE `EMPLOYEES_CONTACT_NUMBERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOURNEY`
--

DROP TABLE IF EXISTS `JOURNEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOURNEY` (
  `TicketNo` char(4) NOT NULL,
  `TrainName` varchar(30) NOT NULL,
  `StationID` varchar(4) NOT NULL,
  PRIMARY KEY (`TicketNo`,`TrainName`,`StationID`),
  KEY `TrainName` (`TrainName`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `JOURNEY_ibfk_1` FOREIGN KEY (`TrainName`) REFERENCES `TRAINS` (`TrainName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JOURNEY_ibfk_2` FOREIGN KEY (`TicketNo`) REFERENCES `TICKETS` (`TicketNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `JOURNEY_ibfk_3` FOREIGN KEY (`StationID`) REFERENCES `STATIONS` (`StationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOURNEY`
--

LOCK TABLES `JOURNEY` WRITE;
/*!40000 ALTER TABLE `JOURNEY` DISABLE KEYS */;
INSERT INTO `JOURNEY` VALUES ('8746','Falaknuma Express','BCT'),('3485','Vikas Express','KGP'),('4587','Vikas Express','NDLS'),('8956','Falaknuma Express','RRK'),('1111','Visakha Express','SEC');
/*!40000 ALTER TABLE `JOURNEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASSENGERS`
--

DROP TABLE IF EXISTS `PASSENGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PASSENGERS` (
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `Final` varchar(4) NOT NULL,
  `Class` char(1) NOT NULL,
  `Tier` int NOT NULL,
  `SeatNo` int NOT NULL,
  `Age` int NOT NULL,
  `DOJ` date NOT NULL,
  `TrainName` varchar(30) NOT NULL,
  KEY `Final` (`Final`),
  KEY `TrainName` (`TrainName`),
  CONSTRAINT `PASSENGERS_ibfk_1` FOREIGN KEY (`Final`) REFERENCES `STATIONS` (`StationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PASSENGERS_ibfk_2` FOREIGN KEY (`TrainName`) REFERENCES `TRAINS` (`TrainName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSENGERS`
--

LOCK TABLES `PASSENGERS` WRITE;
/*!40000 ALTER TABLE `PASSENGERS` DISABLE KEYS */;
INSERT INTO `PASSENGERS` VALUES ('Jennifer','Wallace','1941-06-10','SEC','A',2,15,81,'2022-03-31','Falaknuma Express'),('Franklin','Wong','1955-12-08','VSKP','B',3,15,66,'2022-06-29','Vikas Express'),('John','Smith','1965-01-09','BCT','S',2,54,57,'2022-04-22','Vikas Express'),('Ahmad','Jabbar','1969-03-29','SEC','S',3,10,53,'2022-03-31','Falaknuma Express'),('Joyce','English','1972-07-31','VSKP','A',1,8,50,'2022-06-29','Visakha Express');
/*!40000 ALTER TABLE `PASSENGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RAILWAY_EMPLOYEES_A`
--

DROP TABLE IF EXISTS `RAILWAY_EMPLOYEES_A`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RAILWAY_EMPLOYEES_A` (
  `Firstname` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `StationID` varchar(4) NOT NULL,
  PRIMARY KEY (`Firstname`,`LastName`),
  KEY `Designation` (`Designation`),
  CONSTRAINT `RAILWAY_EMPLOYEES_A_ibfk_1` FOREIGN KEY (`Designation`) REFERENCES `RAILWAY_EMPLOYEES_B` (`Designation`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAILWAY_EMPLOYEES_A`
--

LOCK TABLES `RAILWAY_EMPLOYEES_A` WRITE;
/*!40000 ALTER TABLE `RAILWAY_EMPLOYEES_A` DISABLE KEYS */;
INSERT INTO `RAILWAY_EMPLOYEES_A` VALUES ('Alicica','Zeleya','Ticket Collector','BCT'),('James','Borg','Station Agent','BCT'),('Ken','Adams','Clerk','NDLS'),('Ramesh','Narayan','Station Master','RRK'),('Will','Culvert','Station Superintendent','RNC');
/*!40000 ALTER TABLE `RAILWAY_EMPLOYEES_A` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RAILWAY_EMPLOYEES_B`
--

DROP TABLE IF EXISTS `RAILWAY_EMPLOYEES_B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RAILWAY_EMPLOYEES_B` (
  `Designation` varchar(30) NOT NULL,
  `QuartersNo` int NOT NULL,
  PRIMARY KEY (`QuartersNo`),
  KEY `Designation` (`Designation`),
  CONSTRAINT `RAILWAY_EMPLOYEES_B_ibfk_2` FOREIGN KEY (`QuartersNo`) REFERENCES `RAILWAY_QUARTERS` (`QuartersNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAILWAY_EMPLOYEES_B`
--

LOCK TABLES `RAILWAY_EMPLOYEES_B` WRITE;
/*!40000 ALTER TABLE `RAILWAY_EMPLOYEES_B` DISABLE KEYS */;
INSERT INTO `RAILWAY_EMPLOYEES_B` VALUES ('Clerk',152),('Station Agent',147),('Station Master',146),('Station Superintendent',151),('Ticket Collector',150);
/*!40000 ALTER TABLE `RAILWAY_EMPLOYEES_B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RAILWAY_QUARTERS`
--

DROP TABLE IF EXISTS `RAILWAY_QUARTERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RAILWAY_QUARTERS` (
  `QuartersNo` int NOT NULL,
  `Location` varchar(10) NOT NULL,
  PRIMARY KEY (`QuartersNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAILWAY_QUARTERS`
--

LOCK TABLES `RAILWAY_QUARTERS` WRITE;
/*!40000 ALTER TABLE `RAILWAY_QUARTERS` DISABLE KEYS */;
INSERT INTO `RAILWAY_QUARTERS` VALUES (146,'Vizag'),(147,'Kharagpur'),(150,'Hyderabad'),(151,'New Delhi'),(152,'Roorkee');
/*!40000 ALTER TABLE `RAILWAY_QUARTERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RUNS_THROUGH`
--

DROP TABLE IF EXISTS `RUNS_THROUGH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RUNS_THROUGH` (
  `StationID` varchar(4) NOT NULL,
  `TrainName` varchar(30) NOT NULL,
  PRIMARY KEY (`StationID`,`TrainName`),
  KEY `TrainName` (`TrainName`),
  CONSTRAINT `RUNS_THROUGH_ibfk_1` FOREIGN KEY (`StationID`) REFERENCES `STATIONS` (`StationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RUNS_THROUGH_ibfk_2` FOREIGN KEY (`TrainName`) REFERENCES `TRAINS` (`TrainName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RUNS_THROUGH`
--

LOCK TABLES `RUNS_THROUGH` WRITE;
/*!40000 ALTER TABLE `RUNS_THROUGH` DISABLE KEYS */;
INSERT INTO `RUNS_THROUGH` VALUES ('BCT','Devagiri Express'),('SEC','Devagiri Express'),('BCT','Falaknuma Express'),('KGP','Falaknuma Express'),('RRK','Falaknuma Express'),('SEC','Falaknuma Express'),('SEC','Garibrath Express'),('VSKP','Garibrath Express'),('BCT','Vikas Express'),('KGP','Vikas Express'),('NDLS','Vikas Express'),('VSKP','Vikas Express'),('SEC','Visakha Express'),('VSKP','Visakha Express');
/*!40000 ALTER TABLE `RUNS_THROUGH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATIONS`
--

DROP TABLE IF EXISTS `STATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATIONS` (
  `StationName` varchar(50) NOT NULL,
  `StationID` varchar(4) NOT NULL,
  PRIMARY KEY (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATIONS`
--

LOCK TABLES `STATIONS` WRITE;
/*!40000 ALTER TABLE `STATIONS` DISABLE KEYS */;
INSERT INTO `STATIONS` VALUES ('Mumbai Railway Station','BCT'),('Kharagpur Junction Railway Station','KGP'),('Delhi Railway Station','NDLS'),('Ranchi Railway Station','RNC'),('Roorkee Railway Station','RRK'),('Secunderabad Railway Station','SEC'),('Visakhapatnam Railway Station','VSKP');
/*!40000 ALTER TABLE `STATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKETS`
--

DROP TABLE IF EXISTS `TICKETS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TICKETS` (
  `TicketNo` char(4) NOT NULL,
  `Price` int NOT NULL,
  `Source` varchar(4) DEFAULT NULL,
  `Final` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`TicketNo`),
  KEY `Source` (`Source`),
  KEY `Final` (`Final`),
  CONSTRAINT `TICKETS_ibfk_1` FOREIGN KEY (`Source`) REFERENCES `STATIONS` (`StationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TICKETS_ibfk_2` FOREIGN KEY (`Final`) REFERENCES `STATIONS` (`StationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKETS`
--

LOCK TABLES `TICKETS` WRITE;
/*!40000 ALTER TABLE `TICKETS` DISABLE KEYS */;
INSERT INTO `TICKETS` VALUES ('1111',560,'SEC','VSKP'),('3485',430,'KGP','NDLS'),('4587',770,'NDLS','BCT'),('8746',800,'BCT','KGP'),('8956',590,'RRK','SEC');
/*!40000 ALTER TABLE `TICKETS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAINS`
--

DROP TABLE IF EXISTS `TRAINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRAINS` (
  `TrainName` varchar(30) NOT NULL,
  `TrainNumber` char(5) NOT NULL,
  PRIMARY KEY (`TrainName`,`TrainNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAINS`
--

LOCK TABLES `TRAINS` WRITE;
/*!40000 ALTER TABLE `TRAINS` DISABLE KEYS */;
INSERT INTO `TRAINS` VALUES ('Devagiri Express','17043'),('Falaknuma Express','12704'),('Garibrath Express','17057'),('Vikas Express','15906'),('Visakha Express','17016');
/*!40000 ALTER TABLE `TRAINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 20:38:11
