-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: lab_app
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `academic_qualifications`
--

DROP TABLE IF EXISTS `academic_qualifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_qualifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personal_details_id` int NOT NULL,
  `class` varchar(255) NOT NULL,
  `board_university` varchar(255) NOT NULL,
  `percentage_aggr` varchar(255) NOT NULL,
  `percentage_pcm` varchar(255) NOT NULL,
  `division` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_details_id` (`personal_details_id`),
  CONSTRAINT `academic_qualifications_ibfk_1` FOREIGN KEY (`personal_details_id`) REFERENCES `personal_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_qualifications`
--

LOCK TABLES `academic_qualifications` WRITE;
/*!40000 ALTER TABLE `academic_qualifications` DISABLE KEYS */;
INSERT INTO `academic_qualifications` VALUES (1,1,'10th','CBSE','100','100','1st'),(2,1,'12th','CBSE','100','100','1st'),(3,1,'Diploma/Graduation','N/A','N/A','N/A','N/A'),(7,3,'10th','CBSE','20','10','1st'),(8,3,'12th','CBSE','10','10','1st'),(9,3,'Diploma/Graduation','N/A','N/A','N/A','N/A'),(10,4,'10th','CBSE','89','100','1st'),(11,4,'12th','CBSE','100','70','1st'),(12,4,'Diploma/Graduation','no','0','0','0'),(13,5,'10th','CBSE','89','85','1st'),(14,5,'12th','CBSE','70','70','1st'),(15,5,'Diploma/Graduation','N/A','N/A','N/A','N/A'),(16,6,'10th','CBSE','100','100','1st'),(17,6,'12th','CBSE','100','100','1st'),(18,6,'Diploma/Graduation','N/A','N/A','N/A','N/A');
/*!40000 ALTER TABLE `academic_qualifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment1`
--

DROP TABLE IF EXISTS `assessment1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accommodation` varchar(20) DEFAULT NULL,
  `mentorName` varchar(50) DEFAULT NULL,
  `studentID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `studentID_idx` (`studentID`),
  CONSTRAINT `student_id` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment1`
--

LOCK TABLES `assessment1` WRITE;
/*!40000 ALTER TABLE `assessment1` DISABLE KEYS */;
INSERT INTO `assessment1` VALUES (10,'day-scholar','Dr. Ritesh Rastogi','0201mcsd008'),(11,'hosteller','Dr. Ritesh Rastogi','0201mcsd003'),(12,'hosteller','Dr. Ritesh Rastogi','0201mcsd017'),(13,'hosteller','Dr. Ritesh Rastogi','0201mcsd020');
/*!40000 ALTER TABLE `assessment1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_record1`
--

DROP TABLE IF EXISTS `attendance_record1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_record1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment1_id` int NOT NULL,
  `attendance1` varchar(10) NOT NULL,
  `detained1` varchar(255) DEFAULT NULL,
  `attendance2` varchar(10) NOT NULL,
  `detained2` varchar(255) DEFAULT NULL,
  `attendance3` varchar(10) NOT NULL,
  `detained3` varchar(255) DEFAULT NULL,
  `attendance4` varchar(10) DEFAULT NULL,
  `overall_detained` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_record1_ibfk_1` (`assessment1_id`),
  CONSTRAINT `attendance_record1_ibfk_1` FOREIGN KEY (`assessment1_id`) REFERENCES `assessment1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_record1`
--

LOCK TABLES `attendance_record1` WRITE;
/*!40000 ALTER TABLE `attendance_record1` DISABLE KEYS */;
INSERT INTO `attendance_record1` VALUES (1,10,'80','no','70','no','60','no','No','no'),(2,11,'90','no','90','no','90','no','90','no'),(3,12,'90','no','90','no','90','no','0','no'),(4,13,'90','no','70','no','90','no','0','no');
/*!40000 ALTER TABLE `attendance_record1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carry_over_details1`
--

DROP TABLE IF EXISTS `carry_over_details1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carry_over_details1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment1_id` int NOT NULL,
  `sub_code1` varchar(100) DEFAULT NULL,
  `marks1` varchar(100) DEFAULT NULL,
  `sub_code2` varchar(100) DEFAULT NULL,
  `marks2` varchar(100) DEFAULT NULL,
  `achievements` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carry_over_details1_ibfk_1` (`assessment1_id`),
  CONSTRAINT `carry_over_details1_ibfk_1` FOREIGN KEY (`assessment1_id`) REFERENCES `assessment1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carry_over_details1`
--

LOCK TABLES `carry_over_details1` WRITE;
/*!40000 ALTER TABLE `carry_over_details1` DISABLE KEYS */;
INSERT INTO `carry_over_details1` VALUES (1,12,'no','0','no','0','Nahh'),(2,10,'No','0','No','0','Mini Project Completed'),(3,13,'','','','','');
/*!40000 ALTER TABLE `carry_over_details1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internalassessment1`
--

DROP TABLE IF EXISTS `internalassessment1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internalassessment1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment1_id` int NOT NULL,
  `subjectCode1` varchar(200) DEFAULT NULL,
  `marks11` varchar(10) DEFAULT NULL,
  `marks21` varchar(10) DEFAULT NULL,
  `marks31` varchar(10) DEFAULT NULL,
  `subjectCode2` varchar(200) DEFAULT NULL,
  `marks12` varchar(10) DEFAULT NULL,
  `marks22` varchar(10) DEFAULT NULL,
  `marks32` varchar(10) DEFAULT NULL,
  `subjectCode3` varchar(200) DEFAULT NULL,
  `marks13` varchar(10) DEFAULT NULL,
  `marks23` varchar(10) DEFAULT NULL,
  `marks33` varchar(10) DEFAULT NULL,
  `subjectCode4` varchar(200) DEFAULT NULL,
  `marks14` varchar(10) DEFAULT NULL,
  `marks24` varchar(10) DEFAULT NULL,
  `marks34` varchar(10) DEFAULT NULL,
  `subjectCode5` varchar(200) DEFAULT NULL,
  `marks15` varchar(10) DEFAULT NULL,
  `marks25` varchar(10) DEFAULT NULL,
  `marks35` varchar(10) DEFAULT NULL,
  `subjectCode6` varchar(200) DEFAULT NULL,
  `marks16` varchar(10) DEFAULT NULL,
  `marks26` varchar(10) DEFAULT NULL,
  `marks36` varchar(10) DEFAULT NULL,
  `subjectCode7` varchar(200) DEFAULT NULL,
  `marks17` varchar(10) DEFAULT NULL,
  `marks27` varchar(10) DEFAULT NULL,
  `marks37` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `internalassessment1_ibfk_1` (`assessment1_id`),
  CONSTRAINT `internalassessment1_ibfk_1` FOREIGN KEY (`assessment1_id`) REFERENCES `assessment1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internalassessment1`
--

LOCK TABLES `internalassessment1` WRITE;
/*!40000 ALTER TABLE `internalassessment1` DISABLE KEYS */;
INSERT INTO `internalassessment1` VALUES (7,10,'(AMCSAI0201) Computer Networks','25','25','A','(AMCSAI0299) AI','25','25','A','(AMCSAI0234) Big Data','23','25','A','(AMCSAI0212) Adv, JAVA','25','22','A','(AMCSAI0254) ITC','30','25','A','(AMCSAI0281) CSM','25','21','A','(AMCSAI0209) DM','25','25','A'),(8,11,'(AMCSAI0201) Computer Networks','25','25','A','(AMCSAI0299) AI','25','25','A','(AMCSAI0234) Big Data','25','25','A','(AMCSAI0212) Adv, JAVA','25','25','A','(AMCSAI0254) ITC','25','25','A','(AMCSAI0281) CSM','25','25','A','(AMCSAI0209) DM','25','25','A'),(9,12,'(AMCSAI0201) Computer Networks','25','25','A','(AMCSAI0299) AI','25','25','A','(AMCSAI0234) Big Data','25','25','A','(AMCSAI0212) Adv, JAVA','25','25','A','(AMCSAI0254) ITC','25','25','A','(AMCSAI0281) CSM','25','25','A','(AMCSAI0209) DM','25','25','A'),(10,13,'(AMCSAI0201) Computer Networks','26','25','A','(AMCSAI0299) AI','25','25','A','(AMCSAI0234) Big Data','25','25','A','(AMCSAI0212) Adv, JAVA','25','25','A','(AMCSAI0254) ITC','25','25','A','(AMCSAI0281) CSM','25','21','A','(AMCSAI0209) DM','25','25','A');
/*!40000 ALTER TABLE `internalassessment1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentors`
--

DROP TABLE IF EXISTS `mentors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentors` (
  `mentorID` varchar(50) NOT NULL,
  `mentorname` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneno` varchar(45) DEFAULT NULL,
  `about` longtext,
  `key` varchar(45) DEFAULT NULL,
  `studentID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mentorID`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `studentID` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentors`
--

LOCK TABLES `mentors` WRITE;
/*!40000 ALTER TABLE `mentors` DISABLE KEYS */;
INSERT INTO `mentors` VALUES ('123412','dsf','fdasfdas','dsaf','adsfs','4213','324','VVFDLP',NULL),('12345','Dr. Ritesh Rastogi','IT','rastogi','riteshrastogi@niet.co.in','07468137468','Dr. Ritesh Rastogi is an eminent personality in the field of computer science education. He has served NIET Greater Noida as an Associate Professor, Dean Admin and Head of Department of MCA. Currently working as an Associate Professor in Department of IT & M. TECH Integrated CSE He is having an academic experience of more than 22+ years. He did his school and Graduation from Dehra Dun. He did his Masters in Computer Science and Engineering from GBTU Lucknow. He has published more than 40 papers in the national/international journals and conferences. He has also authored books in the field of computer science and has also been engaged in writing book chapters. He has also been engaged in delivering expert lectures at renowned universities and institutes. Dr. Ritesh Rastogi has also been actively involved as Convener in organizing various conferences at National and International level. He has also been an Advisory Board/Committee member in various International Conferences He has received BEST RESEARCHER AWARD in 2020 by InSC. He is currently the member of BOS for MCA at NIET, Greater Noida. Apart from the academic activities he has also been involved in social responsibilities. He has also been awarded as “Corona Warrior” and also been awarded by companies for his efforts and work in field of education. He is also member of professional societies like ISTE, IFERP, C# Corner, IAENG, Oracle Incorp. and many more. ','RXDPSQ','0201mcsd008'),('123456','Dr. Amba Mishra','IT','amba','ambamishra@niet.co.in','02418342813','Mrs. Amba Mishra is an Assistant Professor of AI and Data Structures','QWERTY','0201mcsd003'),('32144w4e','sad','sad','fas','asd','asd','asd','DYADDS',NULL),('67890','Mr. Rajeev Kumar','IT','rajeev','rajeevkumar@niet.co.in','131221','Mr. Rajeev is an Assistant Professor of Cloud Computing','LWHXSS',NULL),('709179','Ms. Zeba Mehdi','IT','zeba','zebamehdi@niet.co.in','271687563895','Zeba is a Professor at Professional Communication','VWDNNA',NULL);
/*!40000 ALTER TABLE `mentors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moocscourses1`
--

DROP TABLE IF EXISTS `moocscourses1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moocscourses1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment1_id` int NOT NULL,
  `certificationName1` varchar(255) NOT NULL,
  `certificationHours1` int NOT NULL,
  `certificationProgress1` varchar(255) NOT NULL,
  `certificationStatus1` varchar(255) NOT NULL,
  `certificationName2` varchar(255) NOT NULL,
  `certificationHours2` int NOT NULL,
  `certificationProgress2` varchar(255) NOT NULL,
  `certificationStatus2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moocscourses1_ibfk_1` (`assessment1_id`),
  CONSTRAINT `moocscourses1_ibfk_1` FOREIGN KEY (`assessment1_id`) REFERENCES `assessment1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moocscourses1`
--

LOCK TABLES `moocscourses1` WRITE;
/*!40000 ALTER TABLE `moocscourses1` DISABLE KEYS */;
INSERT INTO `moocscourses1` VALUES (1,10,'MySQL IBM',20,'100','Completed','NoSQL',20,'100','Completed'),(2,11,'MySQL IBM',20,'100','Completed','MySQL IBM',20,'100','Completed'),(3,12,'MySQL IBM',79,'100','Completed','MySQL IBM',90,'90','Completed'),(4,13,'MySQL',20,'100','Completed','MySQL IBM',20,'100','Completed');
/*!40000 ALTER TABLE `moocscourses1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notificationID` int NOT NULL AUTO_INCREMENT,
  `notificationMessage` varchar(255) NOT NULL,
  `notificationTime` timestamp NOT NULL,
  `studentID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`notificationID`),
  KEY `studentID_idx` (`studentID`),
  CONSTRAINT `key_studentID` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (3,'hiiiiiiiiiiiiiiii','2023-05-03 09:07:56','0201mcsd017'),(4,'Upload your file on Microsoft Teams.','2023-05-03 09:31:41','0201mcsd008'),(6,'HIii suno','2023-05-05 05:44:24','0201mcsd017'),(7,'Bring your Lab File tomorrow!','2023-05-05 18:37:32','0201mcsd008'),(8,'Bring your Lab File tomorrow!','2023-05-05 18:37:32','0201mcsd017'),(9,'Reach your class on time!','2023-05-06 11:23:55','0201csai001'),(10,'Reach your class on time!','2023-05-06 11:23:55','0201mcsd008'),(11,'Reach your class on time!','2023-05-06 11:23:55','0201mcsd017'),(12,'Bring your file tomorrow!','2023-05-06 17:25:16','0201csai001'),(13,'Bring your file tomorrow!','2023-05-06 17:25:16','0201mcsd008'),(14,'Bring your file tomorrow!','2023-05-06 17:25:16','0201mcsd017'),(15,'Bring your file tomorrow!','2023-05-06 17:25:16','0201mcsd020'),(16,'Give review!','2023-05-29 18:57:19','0201mcsd008'),(17,'Give review!','2023-05-29 18:57:19','0201mcsd017');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_details`
--

DROP TABLE IF EXISTS `personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `university_roll_no` varchar(255) NOT NULL,
  `correspondence_address` varchar(255) NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `mobile_no_student` varchar(255) NOT NULL,
  `mobile_no_parent` varchar(255) NOT NULL,
  `email_student` varchar(255) NOT NULL,
  `email_parent` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `extra_curricular_activities` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `local_guardian` varchar(255) NOT NULL,
  `local_guardian_address` varchar(255) NOT NULL,
  `local_guardian_contact_no` varchar(255) NOT NULL,
  `previous_achievement` varchar(255) NOT NULL,
  `studentID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `studentID_idx` (`studentID`),
  CONSTRAINT `studentID12` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_details`
--

LOCK TABLES `personal_details` WRITE;
/*!40000 ALTER TABLE `personal_details` DISABLE KEYS */;
INSERT INTO `personal_details` VALUES (1,'Tatwadarshi','Mr. Manish Niraj','2001330100267','F-1, Alpha 2, Greated Noida','Shivlok, P.P road, Buxar','6203421651','99845952','0201mcsd008@niet.co.in','0201mcsd008@niet.co.in','Business Man','Pronetix Club Coordinator','OBC','','','','','0201mcsd008'),(3,'Ayush Bhatt','Pta Nahi','2001330100085','Pahad','Pahad','232841273','234125253','0201mcsd017@niet.co.in','0201mcsd017@niet.co.in','Ni pta','ProNetix Club Coordinator','SC','N/A','N/A','N/A','N/A','0201mcsd017'),(4,'Akash Prajapati','Mr. Something','2001330100035','Rasoolpur','Rasoolpur','239847239','231231123','0201mcsd003@niet.co.in','0201mcsd003@niet.co.in','Business Man','','MINORITY','','','','','0201mcsd003'),(5,'Akash Yadav','Pta Nahi','2001330100001','pata nahi','pata nahi','09999999999','09999999999','0201csai001@niet.co.in','0201csai001@niet.co.in','Ni pta','','GEN','','','','','0201csai001'),(6,'Abhishek Singh','Pta Nahi','2001330100218','F-1','Agra','7091792923','7091792923','0201mcsd010@niet.co.in','0201mcsd010@niet.co.in','Teacher','','GEN','','','','','0201mcsd020');
/*!40000 ALTER TABLE `personal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_performance1`
--

DROP TABLE IF EXISTS `semester_performance1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester_performance1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment1_id` int NOT NULL,
  `external_marks` int NOT NULL,
  `internal_marks` int NOT NULL,
  `total_marks` int NOT NULL,
  `external_percentage` decimal(5,2) NOT NULL,
  `internal_percentage` decimal(5,2) NOT NULL,
  `total_percentage` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `semester_performance1_ibfk_1` (`assessment1_id`),
  CONSTRAINT `semester_performance1_ibfk_1` FOREIGN KEY (`assessment1_id`) REFERENCES `assessment1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_performance1`
--

LOCK TABLES `semester_performance1` WRITE;
/*!40000 ALTER TABLE `semester_performance1` DISABLE KEYS */;
INSERT INTO `semester_performance1` VALUES (1,10,800,300,1100,90.00,95.00,93.00),(2,11,900,300,1200,60.00,80.00,70.00),(3,12,900,300,1200,60.00,80.00,70.00),(4,13,900,300,1200,90.00,95.00,93.00);
/*!40000 ALTER TABLE `semester_performance1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentprogress`
--

DROP TABLE IF EXISTS `studentprogress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentprogress` (
  `performance_number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `performance_current_semester` varchar(45) DEFAULT NULL,
  `remarks` longtext,
  `studentID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`performance_number`),
  KEY `studentID_idx` (`studentID`),
  CONSTRAINT `studentID1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentprogress`
--

LOCK TABLES `studentprogress` WRITE;
/*!40000 ALTER TABLE `studentprogress` DISABLE KEYS */;
INSERT INTO `studentprogress` VALUES (1,'Semester 6th','Good','As a CSE student, your academic performance and career prospects are heavily influenced by your skills, dedication, and work ethic. Here are some remarks that may be relevant to you:\r\n\r\nFirstly, CSE is a field that requires constant learning and adaptation to new technologies and trends. It is important to stay updated with the latest developments in the industry and to continuously improve your skills through practice and experimentation.\r\n\r\nSecondly, programming skills are a cornerstone of CSE, and it is essential to have a strong foundation in coding languages such as Python, Java, and C++. Additionally, it is important to develop skills in data structures, algorithms, and software development methodologies.\r\n\r\nThirdly, communication and collaboration skills are crucial for success in CSE. As you progress in your academic and professional career, you will likely be working in teams to develop complex software projects, and the ability to communicate effectively and work collaboratively will be essential.\r\n\r\nLastly, it is important to have a passion for problem-solving and a willingness to persevere through difficult challenges. CSE can be a demanding field, but with the right mindset and dedication, you can achieve great success and make meaningful contributions to the industry.','0201mcsd008'),(2,'Semester 6th Performance','Fair','You need to study and you must pay! #feewavier','0201mcsd003'),(10,'Semester 6th','Good','Please don\'t play Ludo during the class hours. Else everythis is fine but atleast try to listen to the  Teachers.','0201mcsd017'),(11,'Semester 6th','Good','Kaha gaya use dhundho!','0201csai001');
/*!40000 ALTER TABLE `studentprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentID` varchar(50) NOT NULL,
  `rollno` varchar(100) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneno` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `mentorID` varchar(45) DEFAULT NULL,
  `otp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  KEY `mentorID_idx` (`mentorID`),
  CONSTRAINT `mentorID` FOREIGN KEY (`mentorID`) REFERENCES `mentors` (`mentorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('0201csai001','2001330100111','Akash Yadav','yadav','0201csai001@niet.co.in','9999999999','OPDVBN','12345',NULL),('0201mcsd003','2001330100035','Akash Prajapati','akash@123','0201mcsd003@niet.co.in','239847239','JPEGIT','123456',NULL),('0201mcsd008','2001330100267','Tatwadarshi','Dev@7091','0201mcsd008@niet.co.in','6203421651','VMJEDV','12345',NULL),('0201mcsd010','2001330100029','Aditya Singh','adi','0201mcsd010@niet.co.in','2312312313',NULL,'12345',NULL),('0201mcsd017','2001330100085','Ayush Bhatt','abcd','0201mcsd017@niet.co.in','32874687','FHUPTO','12345',NULL),('0201mcsd020','2001330100010','Abhishek Singh','a','0201mcsd020@niet.co.in','451353','FCCBCL','12345',NULL),('12','5','jhjasdfkj','hgajsgd','assdkjh2','fasdf','HZPDFI',NULL,NULL),('312','1231','sdf','w','asd','123','WZIJSV',NULL,NULL),('sad','5','sad','sad','asd','sda','QQFMPM',NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-30 23:40:07
