-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: drive_and_bikedb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB


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
-- Temporary view structure for view `all part suppliers`
--
DROP SCHEMA IF EXISTS `drive_and_bikedb`;
CREATE SCHEMA `drive_and_bikedb`;
USE `drive_and_bikedb`;


DROP TABLE IF EXISTS `all part suppliers`;
/*!50001 DROP VIEW IF EXISTS `all part suppliers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all part suppliers` AS SELECT 
 1 AS `Name`,
 1 AS `PhoneNo`,
 1 AS `Country`,
 1 AS `ProductType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all vehicle suppliers`
--

DROP TABLE IF EXISTS `all vehicle suppliers`;
/*!50001 DROP VIEW IF EXISTS `all vehicle suppliers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all vehicle suppliers` AS SELECT 
 1 AS `Name`,
 1 AS `PhoneNo`,
 1 AS `Country`,
 1 AS `ProductType`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `CarID` int(4) NOT NULL,
  `Make` varchar(15) NOT NULL,
  `Model` varchar(15) NOT NULL,
  `Year` int(4) NOT NULL,
  `Type` enum('Sport','Family','Sedan','SUV','Van/MiniBus','Race Car','Sport Luxury','Family Luxury','Luxury') DEFAULT NULL,
  `DriveType` enum('FWD','RWD','AWD','4WD') DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `Displacement` int(5) DEFAULT NULL,
  `Power` int(3) DEFAULT NULL,
  `FuelType` enum('Diesel','Natural Gas','Gasoline','Hybrid','Electric') DEFAULT NULL,
  `Supplier` int(9) NOT NULL,
  `Cost` int(6) NOT NULL,
  `Price` int(6) DEFAULT NULL,
  `Owner` int(4) NOT NULL,
  PRIMARY KEY (`CarID`),
  KEY `fk_Car_Client_idx` (`Owner`),
  KEY `fk_Car_VehicleSupplier1_idx` (`Supplier`),
  CONSTRAINT `fk_Car_Client` FOREIGN KEY (`Owner`) REFERENCES `client` (`ClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Car_VehicleSupplier1` FOREIGN KEY (`Supplier`) REFERENCES `vehiclesupplier` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'BMW','X5',2010,'Family','AWD','Black',2500,250,'Diesel',258219000,90000,100000,1),(2,'BMW','X6',2010,'Family','AWD','White',2500,250,'Diesel',258219000,110000,130000,0),(3,'ASTON MARTIN','DBS',2012,'Family Luxury','RWD','Grey',3000,300,'Electric',964125000,230000,250000,2),(4,'FERRARI','458',2013,'Race Car','RWD','Red',3100,400,'Gasoline',854698000,1900000,2000000,3),(5,'BUGATTI','Chirron',2016,'Sport Luxury','4WD','Blue',6500,1000,'Hybrid',854698000,1350000,1500000,4),(6,'MERCEDES','AMG',2012,'Sedan','RWD','White',5000,500,'Diesel',258219000,295000,300000,5),(7,'BMW','X6',2016,'Family','FWD','Black',4000,300,'Hybrid',258219000,147000,150000,2);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `car for sale`
--

DROP TABLE IF EXISTS `car for sale`;
/*!50001 DROP VIEW IF EXISTS `car for sale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `car for sale` AS SELECT 
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `car_has_carpart`
--

DROP TABLE IF EXISTS `car_has_carpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_has_carpart` (
  `CarID` int(4) NOT NULL,
  `PartNo` varchar(25) NOT NULL,
  PRIMARY KEY (`CarID`,`PartNo`),
  KEY `fk_Car_has_CarPart_CarPart1_idx` (`PartNo`),
  KEY `fk_Car_has_CarPart_Car1_idx` (`CarID`),
  CONSTRAINT `fk_Car_has_CarPart_Car1` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Car_has_CarPart_CarPart1` FOREIGN KEY (`PartNo`) REFERENCES `carpart` (`PartNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_has_carpart`
--

LOCK TABLES `car_has_carpart` WRITE;
/*!40000 ALTER TABLE `car_has_carpart` DISABLE KEYS */;
INSERT INTO `car_has_carpart` VALUES (1,'325BH23J5HONM2'),(2,'32L532I3G45H23O'),(3,'325BH23J5HONM2'),(4,'F2323424252F345'),(5,'325BH23J5HONM2'),(6,'VRWEV32452RV32'),(7,'﻿42RB2345H234235');
/*!40000 ALTER TABLE `car_has_carpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carpart`
--

DROP TABLE IF EXISTS `carpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carpart` (
  `PartNo` varchar(25) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Manufacturer` varchar(25) DEFAULT NULL,
  `ForModel` varchar(15) DEFAULT NULL,
  `Quantity` int(2) DEFAULT NULL,
  `Supplier` int(9) NOT NULL,
  `Cost` int(6) NOT NULL,
  PRIMARY KEY (`PartNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpart`
--

LOCK TABLES `carpart` WRITE;
/*!40000 ALTER TABLE `carpart` DISABLE KEYS */;
INSERT INTO `carpart` VALUES ('325BH23J5HONM2','Hydraulic disc brake','China','TISSIN','C3',16,658565111,100),('32L532I3G45H23O','Engine Oil','Greece','MOTUL','TT',1,857412111,50),('F2323424252F345','Car Hub','Switzerland','JackDaniels','Chirron',0,656525111,220),('VRWEV32452RV32','Exhaust','Germany','REMUS','Veyron',5,853698111,250),('﻿42RB2345H234235','Car Wheels','Germany','BBS','X6',30,853698111,200);
/*!40000 ALTER TABLE `carpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carpart_has_partsupplier`
--

DROP TABLE IF EXISTS `carpart_has_partsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carpart_has_partsupplier` (
  `PartNo` varchar(25) NOT NULL,
  `TRN` int(9) NOT NULL,
  PRIMARY KEY (`PartNo`,`TRN`),
  KEY `fk_CarPart_has_PartSupplier_PartSupplier1_idx` (`TRN`),
  KEY `fk_CarPart_has_PartSupplier_CarPart1_idx` (`PartNo`),
  CONSTRAINT `fk_CarPart_has_PartSupplier_CarPart1` FOREIGN KEY (`PartNo`) REFERENCES `carpart` (`PartNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CarPart_has_PartSupplier_PartSupplier1` FOREIGN KEY (`TRN`) REFERENCES `partsupplier` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpart_has_partsupplier`
--

LOCK TABLES `carpart_has_partsupplier` WRITE;
/*!40000 ALTER TABLE `carpart_has_partsupplier` DISABLE KEYS */;
INSERT INTO `carpart_has_partsupplier` VALUES ('325BH23J5HONM2',656525111),('32L532I3G45H23O',658565111),('F2323424252F345',853698111),('VRWEV32452RV32',656525111),('﻿42RB2345H234235',857412111);
/*!40000 ALTER TABLE `carpart_has_partsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cars_sold_last_year`
--

DROP TABLE IF EXISTS `cars_sold_last_year`;
/*!50001 DROP VIEW IF EXISTS `cars_sold_last_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cars_sold_last_year` AS SELECT 
 1 AS `Brand`,
 1 AS `Model`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `carsale`
--

DROP TABLE IF EXISTS `carsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carsale` (
  `SaleID` int(4) NOT NULL,
  `SalesmanID` int(9) NOT NULL,
  `VehicleID` int(4) NOT NULL,
  `Client` int(4) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `fk_Sale_Staff1_idx` (`SalesmanID`),
  KEY `fk_Sale_Client1_idx` (`Client`),
  KEY `fk_carsale_car1_idx` (`VehicleID`),
  CONSTRAINT `fk_Sale_Client3` FOREIGN KEY (`Client`) REFERENCES `client` (`ClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_Staff3` FOREIGN KEY (`SalesmanID`) REFERENCES `staff` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_carsale_car1` FOREIGN KEY (`VehicleID`) REFERENCES `car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carsale`
--

LOCK TABLES `carsale` WRITE;
/*!40000 ALTER TABLE `carsale` DISABLE KEYS */;
INSERT INTO `carsale` VALUES (1,968574222,1,1,'2012-08-05'),(2,748541222,3,2,'2014-05-02'),(3,968574222,4,3,'2014-05-07'),(4,968574222,5,4,'2014-08-08'),(5,748541222,6,5,'2015-03-09'),(6,748541222,7,2,'2017-02-09');
/*!40000 ALTER TABLE `carsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carservice`
--

DROP TABLE IF EXISTS `carservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carservice` (
  `ServiceID` int(5) NOT NULL,
  `EngineerID` int(9) NOT NULL,
  `VehicleID` int(4) NOT NULL,
  `Date` date NOT NULL,
  `Price` int(5) NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `fk_CarService_Staff1_idx` (`EngineerID`),
  KEY `fk_CarService_Car1_idx` (`VehicleID`),
  CONSTRAINT `fk_CarService_Car1` FOREIGN KEY (`VehicleID`) REFERENCES `car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CarService_Staff1` FOREIGN KEY (`EngineerID`) REFERENCES `staff` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carservice`
--

LOCK TABLES `carservice` WRITE;
/*!40000 ALTER TABLE `carservice` DISABLE KEYS */;
INSERT INTO `carservice` VALUES (0,635241222,1,'2014-04-03',900),(2,362147222,2,'2015-03-10',1200),(3,635241222,3,'2015-06-08',2500),(4,635241222,5,'2015-08-08',800),(5,635241222,5,'2016-12-10',500);
/*!40000 ALTER TABLE `carservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `ClientID` int(4) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `PhoneNo` int(10) DEFAULT NULL,
  `TRN` int(9) DEFAULT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Alexis Tsipras','Andreas Papandreou St. Athens Greece',2105568962,784362764),(2,'Elon Musk','Steve Jobs St. Silicon Valey USA',595728562,968583462),(3,'Kimi Raikkonen','John Lennon St. London UK',2147483647,484756421),(4,'Dan Bilzerian','Freddie Mercury St. California USA',0,151687266),(5,'Donald Trump','Adam Smith St. Washington DC USA',2147483647,0),(6,'Liam Nelson','Florida st Malibu FL  USA',0,547895126),(7,'Mhtsaras Dimitropoulos','Freddie Mercury St. California USA',0,654818489),(8,'Themistoklis Diamantopoul','Egnatia st. Thessaloniki Greece',2147483647,123132133),(9,'Marc Marquez','Bailamo st. Barcelona Spain',2147483647,431242432);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `communication with staff`
--

DROP TABLE IF EXISTS `communication with staff`;
/*!50001 DROP VIEW IF EXISTS `communication with staff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `communication with staff` AS SELECT 
 1 AS `Name`,
 1 AS `PhoneNo`,
 1 AS `Position`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `good clients`
--

DROP TABLE IF EXISTS `good clients`;
/*!50001 DROP VIEW IF EXISTS `good clients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `good clients` AS SELECT 
 1 AS `Name`,
 1 AS `PhoneNo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `last_month_sales`
--

DROP TABLE IF EXISTS `last_month_sales`;
/*!50001 DROP VIEW IF EXISTS `last_month_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `last_month_sales` AS SELECT 
 1 AS `Cost`,
 1 AS `Price`,
 1 AS `Date of Purchase`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `low quantity on car parts`
--

DROP TABLE IF EXISTS `low quantity on car parts`;
/*!50001 DROP VIEW IF EXISTS `low quantity on car parts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `low quantity on car parts` AS SELECT 
 1 AS `PartNo`,
 1 AS `Name`,
 1 AS `Supplier`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `low quantity on moto parts`
--

DROP TABLE IF EXISTS `low quantity on moto parts`;
/*!50001 DROP VIEW IF EXISTS `low quantity on moto parts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `low quantity on moto parts` AS SELECT 
 1 AS `PartNo`,
 1 AS `Name`,
 1 AS `Supplier`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `moto`
--

DROP TABLE IF EXISTS `moto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moto` (
  `MotoID` int(4) NOT NULL,
  `Make` varchar(15) NOT NULL,
  `Model` varchar(15) NOT NULL,
  `Year` int(4) NOT NULL,
  `Type` enum('Sport','Adventure','Supersport','Hypersport','Naked','Hypernaked','Heritage','Sport Heritage','Neoretro','UJM','Touring','Sport Touring','Cruiser') DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `Displacement` int(4) DEFAULT NULL,
  `Power` int(3) DEFAULT NULL,
  `Supplier` int(9) NOT NULL,
  `Cost` int(6) NOT NULL,
  `Price` int(6) DEFAULT NULL,
  `Owner` int(4) NOT NULL,
  PRIMARY KEY (`MotoID`),
  KEY `fk_Moto_Client1_idx` (`Owner`),
  KEY `fk_Moto_VehicleSupplier1_idx` (`Supplier`),
  CONSTRAINT `fk_Moto_Client1` FOREIGN KEY (`Owner`) REFERENCES `client` (`ClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Moto_VehicleSupplier1` FOREIGN KEY (`Supplier`) REFERENCES `vehiclesupplier` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moto`
--

LOCK TABLES `moto` WRITE;
/*!40000 ALTER TABLE `moto` DISABLE KEYS */;
INSERT INTO `moto` VALUES (0,'Honda','CBR',2010,'Supersport','Red',599,110,986574000,12000,14000,6),(2,'Kawasaki','ZX-10R',2014,'Hypersport','Green',998,189,748563000,21000,24000,7),(3,'BMW','R 1200 GS',2015,'Adventure','Grey',1250,120,986574000,18000,20000,8),(4,'Honda','CB 650F',2012,'Sport','Black',649,87,986574000,8000,10000,9),(5,'Yamaha','R6',2014,'Supersport','Blue',599,125,748563000,13000,15000,4);
/*!40000 ALTER TABLE `moto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `moto for sale`
--

DROP TABLE IF EXISTS `moto for sale`;
/*!50001 DROP VIEW IF EXISTS `moto for sale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `moto for sale` AS SELECT 
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `moto_has_motopart`
--

DROP TABLE IF EXISTS `moto_has_motopart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moto_has_motopart` (
  `MotoID` int(4) NOT NULL,
  `PartNo` varchar(25) NOT NULL,
  PRIMARY KEY (`MotoID`,`PartNo`),
  KEY `fk_Moto_has_MotoPart_MotoPart1_idx` (`PartNo`),
  KEY `fk_Moto_has_MotoPart_Moto1_idx` (`MotoID`),
  CONSTRAINT `fk_Moto_has_MotoPart_Moto1` FOREIGN KEY (`MotoID`) REFERENCES `moto` (`MotoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Moto_has_MotoPart_MotoPart1` FOREIGN KEY (`PartNo`) REFERENCES `motopart` (`PartNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moto_has_motopart`
--

LOCK TABLES `moto_has_motopart` WRITE;
/*!40000 ALTER TABLE `moto_has_motopart` DISABLE KEYS */;
INSERT INTO `moto_has_motopart` VALUES (1,'FANWF3242N12321'),(2,'DAFA3424FQWAC34'),(3,'FANWF3242N12321'),(4,'GNRE853N12O33N3'),(5,'DSA742ENDAUH219');
/*!40000 ALTER TABLE `moto_has_motopart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motopart`
--

DROP TABLE IF EXISTS `motopart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motopart` (
  `PartNo` varchar(25) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Manufacturer` varchar(25) DEFAULT NULL,
  `ForModel` varchar(15) DEFAULT NULL,
  `Quantity` int(2) DEFAULT NULL,
  `Supplier` int(9) NOT NULL,
  `Cost` int(6) NOT NULL,
  PRIMARY KEY (`PartNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motopart`
--

LOCK TABLES `motopart` WRITE;
/*!40000 ALTER TABLE `motopart` DISABLE KEYS */;
INSERT INTO `motopart` VALUES ('DAFA3424FQWAC34','Moto Hub','USA','Pirelli','Crypton',6,147485111,130),('DSA742ENDAUH219','Exhaust','China','Acrapovic','C50',3,658565111,120),('FANWF3242N12321','Carburettor','Russia','Honda','RS',2,147485111,350),('GNRE853N12O33N3','Brakes','Greece','Brembo','Vstrom',36,968532111,200),('﻿NA02PRN934234AP','Moto Wheels','Germany','Marcehesini','CBR',20,968532111,100);
/*!40000 ALTER TABLE `motopart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motopart_has_partsupplier`
--

DROP TABLE IF EXISTS `motopart_has_partsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motopart_has_partsupplier` (
  `PartNo` varchar(25) NOT NULL,
  `TRN` int(9) NOT NULL,
  PRIMARY KEY (`PartNo`,`TRN`),
  KEY `fk_MotoPart_has_PartSupplier_PartSupplier1_idx` (`TRN`),
  KEY `fk_MotoPart_has_PartSupplier_MotoPart1_idx` (`PartNo`),
  CONSTRAINT `fk_MotoPart_has_PartSupplier_MotoPart1` FOREIGN KEY (`PartNo`) REFERENCES `motopart` (`PartNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MotoPart_has_PartSupplier_PartSupplier1` FOREIGN KEY (`TRN`) REFERENCES `partsupplier` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motopart_has_partsupplier`
--

LOCK TABLES `motopart_has_partsupplier` WRITE;
/*!40000 ALTER TABLE `motopart_has_partsupplier` DISABLE KEYS */;
INSERT INTO `motopart_has_partsupplier` VALUES ('DAFA3424FQWAC34',147485111),('DSA742ENDAUH219',968532111),('FANWF3242N12321',147485111),('GNRE853N12O33N3',853698111),('﻿NA02PRN934234AP',853698111);
/*!40000 ALTER TABLE `motopart_has_partsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `motos_sold_last_year`
--

DROP TABLE IF EXISTS `motos_sold_last_year`;
/*!50001 DROP VIEW IF EXISTS `motos_sold_last_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `motos_sold_last_year` AS SELECT 
 1 AS `Brand`,
 1 AS `Model`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `motosale`
--

DROP TABLE IF EXISTS `motosale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motosale` (
  `SaleID` int(4) NOT NULL,
  `SalesmanID` int(9) NOT NULL,
  `VehicleID` int(4) NOT NULL,
  `Client` int(4) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `fk_Sale_Staff1_idx` (`SalesmanID`),
  KEY `fk_Sale_Client1_idx` (`Client`),
  KEY `fk_motosale_moto1_idx` (`VehicleID`),
  CONSTRAINT `fk_Sale_Client1` FOREIGN KEY (`Client`) REFERENCES `client` (`ClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_Staff1` FOREIGN KEY (`SalesmanID`) REFERENCES `staff` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motosale_moto1` FOREIGN KEY (`VehicleID`) REFERENCES `moto` (`MotoID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motosale`
--

LOCK TABLES `motosale` WRITE;
/*!40000 ALTER TABLE `motosale` DISABLE KEYS */;
INSERT INTO `motosale` VALUES (1,748541222,1,6,'2015-06-06'),(2,968574222,2,7,'2015-09-08'),(3,968574222,3,8,'2015-12-20'),(4,748541222,4,9,'2016-05-06'),(5,968574222,5,4,'2017-03-15');
/*!40000 ALTER TABLE `motosale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoservice`
--

DROP TABLE IF EXISTS `motoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motoservice` (
  `ServiceID` int(5) NOT NULL,
  `EngineerID` int(9) NOT NULL,
  `VehicleID` int(4) NOT NULL,
  `Date` date NOT NULL,
  `Price` int(5) NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `fk_Service_Staff1_idx` (`EngineerID`),
  KEY `fk_Service_Moto1` (`VehicleID`),
  CONSTRAINT `fk_Service_Moto1` FOREIGN KEY (`VehicleID`) REFERENCES `moto` (`MotoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Service_Staff1` FOREIGN KEY (`EngineerID`) REFERENCES `staff` (`TRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoservice`
--

LOCK TABLES `motoservice` WRITE;
/*!40000 ALTER TABLE `motoservice` DISABLE KEYS */;
INSERT INTO `motoservice` VALUES (1,635241222,5,'2015-06-07',400),(2,362147222,1,'2016-08-09',230),(3,362147222,3,'2016-11-07',100),(4,362147222,4,'2017-05-06',160);
/*!40000 ALTER TABLE `motoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partsupplier`
--

DROP TABLE IF EXISTS `partsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partsupplier` (
  `Name` varchar(45) NOT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PhoneNo` int(15) DEFAULT NULL,
  `TRN` int(9) NOT NULL,
  `ProductType` enum('Car','Motorcycle','Both') NOT NULL,
  PRIMARY KEY (`TRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partsupplier`
--

LOCK TABLES `partsupplier` WRITE;
/*!40000 ALTER TABLE `partsupplier` DISABLE KEYS */;
INSERT INTO `partsupplier` VALUES ('Ronaldo Motos','Brazil',0,147485111,'Motorcycle'),('Patrick ','France',2147483647,656525111,'Car'),('Lee','China',0,658565111,'Both'),('Barcheloneta','Spain',2142592591,853698111,'Both'),('Parthenon ','Greece',2147483647,857412111,'Car'),('Anchor','Turkey',2147483647,968532111,'Motorcycle');
/*!40000 ALTER TABLE `partsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Name` varchar(25) NOT NULL,
  `Position` enum('Engineer','Salesman','Accountant','Administrator','Supervisor','CEO','Other') DEFAULT NULL,
  `PhoneNo` int(10) DEFAULT NULL,
  `TRN` int(9) NOT NULL,
  `Salary` int(5) NOT NULL,
  PRIMARY KEY (`TRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('Ntokos Konstantinos','Engineer',2147483647,362147222,2000),('Mytilis Konstantinos','Engineer',2147483647,635241222,2000),('Paraskeuas Koutsikos','Salesman',2147483647,748541222,4000),('﻿George Katsaras','CEO',2147483647,879520222,10000),('Andreas Symeonidis','Salesman',2147483647,968574222,3000);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff salaries`
--

DROP TABLE IF EXISTS `staff salaries`;
/*!50001 DROP VIEW IF EXISTS `staff salaries`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `staff salaries` AS SELECT 
 1 AS `Name`,
 1 AS `Position`,
 1 AS `Salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vehiclesupplier`
--

DROP TABLE IF EXISTS `vehiclesupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiclesupplier` (
  `Name` varchar(45) NOT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PhoneNo` int(15) DEFAULT NULL,
  `TRN` int(9) NOT NULL,
  `ProductType` enum('Car','Motorcycle','Both') NOT NULL,
  PRIMARY KEY (`TRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclesupplier`
--

LOCK TABLES `vehiclesupplier` WRITE;
/*!40000 ALTER TABLE `vehiclesupplier` DISABLE KEYS */;
INSERT INTO `vehiclesupplier` VALUES ('﻿BMW official','Germany',837295694,258219000,'Car'),('Yamamoto','Japan',868778642,748563000,'Motorcycle'),('Fontana di trevi','Italy',213345690,854698000,'Car'),('Carnada','Canada',895423653,958462000,'Car'),('Papadopoulos AE','Greece',907945724,964125000,'Both'),('American Cars','USA',549769248,986574000,'Motorcycle');
/*!40000 ALTER TABLE `vehiclesupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'drive_and_bikedb'
--

--
-- Dumping routines for database 'drive_and_bikedb'
--

--
-- Final view structure for view `all part suppliers`
--

/*!50001 DROP VIEW IF EXISTS `all part suppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all part suppliers` AS select `partsupplier`.`Name` AS `Name`,`partsupplier`.`PhoneNo` AS `PhoneNo`,`partsupplier`.`Country` AS `Country`,`partsupplier`.`ProductType` AS `ProductType` from `partsupplier` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all vehicle suppliers`
--

/*!50001 DROP VIEW IF EXISTS `all vehicle suppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all vehicle suppliers` AS select `vehiclesupplier`.`Name` AS `Name`,`vehiclesupplier`.`PhoneNo` AS `PhoneNo`,`vehiclesupplier`.`Country` AS `Country`,`vehiclesupplier`.`ProductType` AS `ProductType` from `vehiclesupplier` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `car for sale`
--

/*!50001 DROP VIEW IF EXISTS `car for sale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `car for sale` AS select `car`.`Make` AS `Make`,`car`.`Model` AS `Model`,`car`.`Year` AS `Year` from `car` where (`car`.`Owner` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cars_sold_last_year`
--

/*!50001 DROP VIEW IF EXISTS `cars_sold_last_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cars_sold_last_year` AS select `car`.`Make` AS `Brand`,`car`.`Model` AS `Model` from (`car` join `carsale` on((`car`.`CarID` = `carsale`.`VehicleID`))) where (`carsale`.`Date` > (curdate() + interval -(1) year)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `communication with staff`
--

/*!50001 DROP VIEW IF EXISTS `communication with staff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `communication with staff` AS select `staff`.`Name` AS `Name`,`staff`.`PhoneNo` AS `PhoneNo`,`staff`.`Position` AS `Position` from `staff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `good clients`
--

/*!50001 DROP VIEW IF EXISTS `good clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `good clients` AS select `client`.`Name` AS `Name`,`client`.`PhoneNo` AS `PhoneNo` from (`client` join `car` on((`client`.`ClientID` = `car`.`Owner`))) where ((`car`.`Type` = 'Sport Luxury') or (`car`.`Type` = 'Family Luxury') or (`car`.`Type` = 'Luxury')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `last_month_sales`
--

/*!50001 DROP VIEW IF EXISTS `last_month_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_month_sales` AS select `car`.`Cost` AS `Cost`,`car`.`Price` AS `Price`,`carsale`.`Date` AS `Date of Purchase` from (`car` join `carsale` on((`car`.`Owner` = `carsale`.`Client`))) where (`carsale`.`Date` > (curdate() + interval -(1) month)) union select `moto`.`Cost` AS `Cost`,`moto`.`Price` AS `Price`,`motosale`.`Date` AS `Date of Purchase` from (`moto` join `motosale` on((`moto`.`Owner` = `motosale`.`Client`))) where (`motosale`.`Date` > (curdate() + interval -(1) month)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `low quantity on car parts`
--

/*!50001 DROP VIEW IF EXISTS `low quantity on car parts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low quantity on car parts` AS select `carpart`.`PartNo` AS `PartNo`,`carpart`.`Name` AS `Name`,`carpart`.`Supplier` AS `Supplier`,`carpart`.`Quantity` AS `Quantity` from `carpart` where (`carpart`.`Quantity` < 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `low quantity on moto parts`
--

/*!50001 DROP VIEW IF EXISTS `low quantity on moto parts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low quantity on moto parts` AS select `motopart`.`PartNo` AS `PartNo`,`motopart`.`Name` AS `Name`,`motopart`.`Supplier` AS `Supplier`,`motopart`.`Quantity` AS `Quantity` from `motopart` where (`motopart`.`Quantity` < 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `moto for sale`
--

/*!50001 DROP VIEW IF EXISTS `moto for sale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `moto for sale` AS select `moto`.`Make` AS `Make`,`moto`.`Model` AS `Model`,`moto`.`Year` AS `Year` from `moto` where (`moto`.`Owner` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `motos_sold_last_year`
--

/*!50001 DROP VIEW IF EXISTS `motos_sold_last_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `motos_sold_last_year` AS select `moto`.`Make` AS `Brand`,`moto`.`Model` AS `Model` from (`moto` join `motosale` on((`moto`.`Owner` = `motosale`.`Client`))) where (`motosale`.`Date` > (curdate() + interval -(1) year)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff salaries`
--

/*!50001 DROP VIEW IF EXISTS `staff salaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff salaries` AS select `staff`.`Name` AS `Name`,`staff`.`Position` AS `Position`,`staff`.`Salary` AS `Salary` from `staff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-20 18:36:04
