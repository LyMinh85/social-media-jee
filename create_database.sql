-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: social_media
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

CREATE DATABASE IF NOT EXISTS social_media;
USE social_media;

--
-- Table structure for table `avatar_image`
--

DROP TABLE IF EXISTS `avatar_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avatar_image` (
                                `avatar_image_id` int unsigned NOT NULL AUTO_INCREMENT,
                                PRIMARY KEY (`avatar_image_id`),
                                CONSTRAINT `avatar_image_image_image_id_fk` FOREIGN KEY (`avatar_image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_image`
--

LOCK TABLES `avatar_image` WRITE;
/*!40000 ALTER TABLE `avatar_image` DISABLE KEYS */;
INSERT INTO `avatar_image` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `avatar_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
                           `comment_id` int unsigned NOT NULL AUTO_INCREMENT,
                           `content` text NOT NULL,
                           `create_at` datetime NOT NULL,
                           `user_id` int unsigned DEFAULT NULL,
                           `post_id` int unsigned DEFAULT NULL,
                           `parent_comment_id` int unsigned DEFAULT NULL,
                           PRIMARY KEY (`comment_id`),
                           KEY `comment_post_post_id_fk` (`post_id`),
                           KEY `comment_user_user_id_fk` (`user_id`),
                           KEY `comment_comment_comment_id_fk` (`parent_comment_id`),
                           CONSTRAINT `comment_comment_comment_id_fk` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`comment_id`),
                           CONSTRAINT `comment_post_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
                           CONSTRAINT `comment_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (14,'Yeah','2023-12-10 22:42:42',7,4,NULL),(15,'Oh yeah','2023-12-10 23:05:25',7,4,NULL),(16,'haha','2023-12-10 23:09:17',7,6,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
                              `friendship_id` int unsigned NOT NULL AUTO_INCREMENT,
                              `user1_id` int unsigned DEFAULT NULL,
                              `user2_id` int unsigned DEFAULT NULL,
                              `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                              `create_at` datetime NOT NULL,
                              PRIMARY KEY (`friendship_id`),
                              KEY `friendship_user_user_id_fk` (`user1_id`),
                              KEY `friendship_user_user_id_fk2` (`user2_id`),
                              CONSTRAINT `friendship_user_user_id_fk` FOREIGN KEY (`user1_id`) REFERENCES `user` (`user_id`),
                              CONSTRAINT `friendship_user_user_id_fk2` FOREIGN KEY (`user2_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (6,7,5,'ACCEPTED','2023-12-09 16:11:30'),(7,7,6,'PENDING','2023-12-10 09:48:23'),(8,8,7,'ACCEPTED','2023-12-10 10:17:21');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
                         `image_id` int unsigned NOT NULL AUTO_INCREMENT,
                         `public_id` varchar(200) DEFAULT NULL,
                         `url` varchar(300) NOT NULL,
                         `upload_on` datetime NOT NULL,
                         PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,NULL,'/images00068-3037495260.jpeg','2023-12-06 11:49:34'),(2,NULL,'https://res.cloudinary.com/du163r961/image/upload/v1701841064/social-media/IMG_7911_z3nvws.jpg','2023-12-06 12:38:08'),(3,NULL,'https://res.cloudinary.com/du163r961/image/upload/v1702178126/social-media/IMG_8414_rz6ynq.jpg','2023-12-10 10:15:50');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
                         `like_id` int unsigned NOT NULL AUTO_INCREMENT,
                         `user_id` int unsigned DEFAULT NULL,
                         `post_id` int unsigned DEFAULT NULL,
                         `create_at` datetime NOT NULL,
                         PRIMARY KEY (`like_id`),
                         KEY `likes_post_post_id_fk` (`post_id`),
                         KEY `likes_user_user_id_fk` (`user_id`),
                         CONSTRAINT `likes_post_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
                         CONSTRAINT `likes_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (8,7,4,'2023-12-10 23:08:51'),(11,7,6,'2023-12-10 23:09:06'),(12,7,3,'2023-12-10 23:09:10');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
                        `post_id` int unsigned NOT NULL AUTO_INCREMENT,
                        `content` text NOT NULL,
                        `create_at` datetime NOT NULL,
                        `number_of_likes` int unsigned NOT NULL DEFAULT '0',
                        `number_of_comments` int unsigned NOT NULL DEFAULT '0',
                        `user_id` int unsigned DEFAULT NULL,
                        PRIMARY KEY (`post_id`),
                        KEY `post_user_user_id_fk` (`user_id`),
                        CONSTRAINT `post_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (2,'Something new','2023-12-05 13:22:35',0,0,5),(3,'Something incredible','2023-12-05 13:23:33',1,0,5),(4,'I am Quoc Nam!','2023-12-06 13:14:42',1,2,6),(5,'Hello everyone.','2023-12-08 22:17:27',0,0,7),(6,'ehe','2023-12-10 11:59:19',1,1,7);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_image` (
                              `post_image_id` int unsigned NOT NULL AUTO_INCREMENT,
                              `image_id` int unsigned DEFAULT NULL,
                              `post_id` int unsigned DEFAULT NULL,
                              PRIMARY KEY (`post_image_id`),
                              KEY `post_image_image_image_id_fk` (`image_id`),
                              KEY `post_image_post_post_id_fk` (`post_id`),
                              CONSTRAINT `post_image_image_image_id_fk` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
                              CONSTRAINT `post_image_post_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_image`
--

LOCK TABLES `post_image` WRITE;
/*!40000 ALTER TABLE `post_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `user_id` int unsigned NOT NULL AUTO_INCREMENT,
                        `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                        `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                        `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                        `bio` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
                        `gender` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                        `create_at` datetime NOT NULL,
                        `avatar_image_id` int unsigned DEFAULT NULL,
                        PRIMARY KEY (`user_id`),
                        KEY `user_avatar_image_avatar_image_id_fk` (`avatar_image_id`),
                        CONSTRAINT `user_avatar_image_avatar_image_id_fk` FOREIGN KEY (`avatar_image_id`) REFERENCES `avatar_image` (`avatar_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'Thùy Trang','hehe@gmail.com','e16c0ed9b03f69a9c24a7b888daff1df1c501e21298396cf70be3519e7eaf7a2','I am a rich girl','nu','2023-12-05 13:00:51',1),(6,'Quốc Nam','quocnam@gmail.com','e16c0ed9b03f69a9c24a7b888daff1df1c501e21298396cf70be3519e7eaf7a2','Ask me please!','nam','2023-12-06 12:14:52',2),(7,'Tuấn Minh','mlym8565@gmail.com','e16c0ed9b03f69a9c24a7b888daff1df1c501e21298396cf70be3519e7eaf7a2','Sleepy','nam','2023-12-08 22:16:55',1),(8,'Ngọc Nam','ngocnam20002@gmail.com','e16c0ed9b03f69a9c24a7b888daff1df1c501e21298396cf70be3519e7eaf7a2',NULL,'nam','2023-12-10 10:12:39',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11 22:27:21
