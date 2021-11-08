-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: reservation
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FLIGHT_NUMBER` varchar(20) NOT NULL,
  `OPERATING_AIRLINES` varchar(20) NOT NULL,
  `DEPARTURE_CITY` varchar(20) NOT NULL,
  `ARRIVAL_CITY` varchar(20) NOT NULL,
  `DATE_OF_DEPARTURE` date NOT NULL,
  `ESTIMATED_DEPARTURE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'AA1','American Airlines','AUS','NYC','2018-02-05','2018-02-04 19:14:07'),(2,'AA2','American Airlines','AUS','NYC','2018-02-05','2018-02-04 21:14:07'),(3,'AA3','American Airlines','AUS','NYC','2018-02-05','2018-02-04 22:14:07'),(4,'SW1','South West','AUS','NYC','2018-02-05','2018-02-04 23:14:07'),(5,'UA1','United Airlines','NYC','DAL','2018-02-05','2018-02-05 02:14:07'),(6,'UA1','United Airlines','NYC','DAL','2018-02-05','2018-02-05 02:14:07'),(7,'SW1','South West','AUS','NYC','2018-02-06','2018-02-05 23:14:07'),(8,'SW2','South West','AUS','NYC','2018-02-06','2018-02-06 00:14:07'),(9,'SW3','South West','NYC','DAL','2018-02-06','2018-02-06 02:14:07'),(10,'UA1','United Airlines','NYC','DAL','2018-02-06','2018-02-06 02:14:07'),(11,'AA1','American Airlines','AUS','NYC','2018-02-06','2018-02-05 19:14:07');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(256) DEFAULT NULL,
  `LAST_NAME` varchar(256) DEFAULT NULL,
  `MIDDLE_NAME` varchar(256) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'TESTRESERVATIOn','TESTRESERVATIOn',NULL,'TESTRESERVATIOn','1231321'),(2,'RESTCLIENT','RESTCLIENT',NULL,'RESTCLIENT','RESTCLIENT'),(3,'Sabaw','Wabas',NULL,'lastwillservices@gmail.com','1234567'),(4,'Sabaw1','Wabas1',NULL,'lastwillservices@gmail.com','1234567'),(5,'AngularTest','AngularTest',NULL,'lastwillservices@gmail.com','1234567'),(6,'TestAngular2','TestAngular2',NULL,'lastwillservices@gmail.com','1234567'),(7,'testDocker','testDocker',NULL,'lastwillservices@gmail.com','1234567');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CHECKED_IN` tinyint(1) DEFAULT NULL,
  `NUMBER_OF_BAGS` int DEFAULT NULL,
  `PASSENGER_ID` int DEFAULT NULL,
  `FLIGHT_ID` int DEFAULT NULL,
  `CREATED` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `PASSENGER_ID` (`PASSENGER_ID`),
  KEY `FLIGHT_ID` (`FLIGHT_ID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`PASSENGER_ID`) REFERENCES `passenger` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`FLIGHT_ID`) REFERENCES `flight` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,6,1,3,'2021-10-29 03:46:13'),(2,1,3,2,4,'2021-10-29 07:12:08'),(3,1,3,3,3,'2021-11-01 15:53:29'),(4,1,8,4,2,'2021-11-02 05:04:09'),(5,1,6,5,10,'2021-11-03 08:26:46'),(6,1,2,6,9,'2021-11-03 08:35:57'),(7,1,5,7,2,'2021-11-05 04:52:55');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Sabaw','Bulalo','SB017','SB017'),(4,'TestSecurity','TestSecurity','TestSecurity','$2a$10$NUR33M0lDyU11pqUUfkHYeGlvNK2bqpIvUqJ3VOFsf1brUT2sJgKG'),(5,'AngularTest','AngularTest','AngularTest','$2a$10$xi/H/vuE9dQO2k2GTP4Vhu4aMrbVzmNF0V.a7uH7PAWyCiiYc9/QO'),(6,'TestAngular2','TestAngular2','TestAngular2','$2a$10$2zipRaDKr0S1iqujUlA8P.YWfXK1Lb4kSTeAumWf7PnNSogpKA/Cm'),(7,'testDocker','testDocker','testDocker','$2a$10$I5r3JWQQNQ7rdD4/d0ok5.dn3g.zuP9UsHri7XCk1BfCxGLrGVFRy');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(4,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-05 18:29:14
