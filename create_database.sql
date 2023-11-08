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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_image`
--

LOCK TABLES `avatar_image` WRITE;
/*!40000 ALTER TABLE `avatar_image` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,1,2,'Accepted','2023-11-08 16:24:07');
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
                         `public_id` varchar(200) NOT NULL,
                         `url` varchar(300) NOT NULL,
                         `upload_on` datetime NOT NULL,
                         PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,2,1,'2023-11-08 16:43:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'First post','2023-11-08 16:39:45',0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Minh','m@gmail.com','123',NULL,'Nam','2023-11-08 15:42:45',NULL),(2,'Nam','m@gmail.com','123',NULL,'Nam','2023-11-08 15:53:40',NULL);
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

-- Dump completed on 2023-11-08 16:48:47
