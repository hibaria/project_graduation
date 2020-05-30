-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: db_barrageProject
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `barrage_normal`
--

DROP TABLE IF EXISTS `barrage_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrage_normal` (
  `barrageId` int(11) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `currentDate` varchar(100) DEFAULT NULL,
  `videoTime` varchar(100) DEFAULT NULL,
  `videoTimeText` varchar(100) DEFAULT NULL,
  `avatars` varchar(255) DEFAULT NULL,
  `barrageType` varchar(100) DEFAULT NULL,
  `barrageTypeText` varchar(100) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  PRIMARY KEY (`barrageId`),
  KEY `fk_barrage_videolist` (`videoId`),
  CONSTRAINT `fk_barrage_videolist` FOREIGN KEY (`videoId`) REFERENCES `videolist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrage_normal`
--

LOCK TABLES `barrage_normal` WRITE;
/*!40000 ALTER TABLE `barrage_normal` DISABLE KEYS */;
INSERT INTO `barrage_normal` VALUES (1,4,'郑明虾','弹幕施工','2020/03/09 11:25:54','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(3,4,'郑明虾','哈哈哈哈或或或或或或或或或或或或','2020/03/09 11:26:06','9','00:00:09','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(4,4,'郑明虾','笑死过去','2020/03/09 11:26:11','14','00:00:14','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(5,4,'郑明虾','够可爱的','2020/03/09 11:26:18','20','00:00:20','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(6,4,'郑明虾','儿砸啊妈妈爱你','2020/03/09 11:26:24','27','00:00:27','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(7,4,'郑明虾','姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙','2020/03/09 11:26:43','26','00:00:26','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(8,4,'郑明虾','金路云金路云金路云金路云金路云金路云','2020/03/09 11:26:57','40','00:00:40','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(9,4,'郑明虾','呜呜呜呜','2020/03/09 11:27:07','49','00:00:49','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(10,4,'郑明虾','金仁诚！','2020/03/09 11:27:19','62','00:01:02','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(11,4,'郑明虾','test','2020/03/09 12:22:30','69','00:01:09','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(12,4,'郑明虾','黄色','2020/03/09 12:22:35','69','00:01:09','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(13,4,'郑明虾','test','2020/03/09 12:23:39','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(14,4,'郑明虾','朱豪朱豪朱豪','2020/03/09 13:46:25','7','00:00:07','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(15,4,'郑明虾','呜呜呜呜呜SF9的rap line真是神仙','2020/03/09 13:46:40','22','00:00:22','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(16,2,'郑明虾','朱豪朱豪朱豪','2020/03/09 13:48:45','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(17,2,'郑明虾','呜呜呜呜神仙','2020/03/09 13:48:58','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(18,2,'郑明虾','太厉害了吧','2020/03/09 13:49:09','8','00:00:08','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(20,4,'郑明虾','aaaaaaaaaaa','2020/03/09 14:17:06','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(21,4,'神秘用户','aaaaaaaaaaaaaaaaaaaa','2020/03/09 14:17:16','2','00:00:02','http://localhost:8080/BarrageProject/img/avater_default.png','normal','普通弹幕',1),(22,4,'郑明虾','test','2020/03/09 17:00:37','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(23,4,'郑明虾','test','2020/03/09 17:00:41','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(24,4,'undefined','test','2020/03/10 14:50:03','0','00:00:00','undefined','normal','普通弹幕',1),(25,4,'郑明虾','test','2020/03/10 14:50:59','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(26,4,'神秘用户','test','2020/03/10 14:51:04','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Ip3ertgisU9lcebae21545533238d304a80686e37676.jpg','normal','普通弹幕',1),(27,4,'神秘用户','啊啊啊啊啊啊我没了','2020/03/10 14:52:09','7','00:00:07','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Ip3ertgisU9lcebae21545533238d304a80686e37676.jpg','normal','普通弹幕',1),(28,4,'神秘用户','怎么可以这样','2020/03/10 14:52:15','14','00:00:14','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Ip3ertgisU9lcebae21545533238d304a80686e37676.jpg','normal','普通弹幕',1),(29,4,'郑明虾','我的天哪','2020/03/10 14:52:22','20','00:00:20','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(30,4,'神秘用户','啊啊啊啊啊啊啊啊','2020/03/10 14:57:18','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(31,4,'神秘用户','天哪','2020/03/10 14:57:26','5','00:00:05','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(32,4,'神秘用户','太可爱了吧','2020/03/10 14:57:31','9','00:00:09','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(33,4,'undefined','test','2020/03/10 15:04:49','0','00:00:00','undefined','normal','普通弹幕',1),(34,4,'神秘用户','test','2020/03/10 15:04:58','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(35,4,'郑明虾','tst','2020/03/10 15:05:13','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(36,4,'undefined','test','2020/03/10 15:07:12','0','00:00:00','undefined','normal','普通弹幕',1),(37,4,'undefined','test','2020/03/10 15:09:28','0','00:00:00','undefined','normal','普通弹幕',1),(38,4,'神秘用户','泰斯特','2020/03/10 15:10:29','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(39,4,'神秘用户','他','2020/03/10 15:10:39','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(40,4,'郑明虾','test','2020/03/10 15:11:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(42,4,'神秘用户','test','2020/03/10 15:13:33','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(43,4,'神秘用户','tset','2020/03/10 15:13:45','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(44,4,'神秘用户','test','2020/03/10 15:14:04','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(45,4,'神秘用户','test','2020/03/10 15:14:10','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(46,4,'神秘用户','test','2020/03/10 15:14:16','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(47,4,'郑明虾','test','2020/03/10 15:14:43','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(48,4,'郑明虾','test','2020/03/10 15:14:48','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(49,4,'郑明虾','test','2020/03/10 15:16:15','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(50,4,'郑明虾','test','2020/03/10 15:16:21','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(51,4,'神秘用户','tests','2020/03/10 15:16:27','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(52,4,'郑明虾','tset','2020/03/10 15:16:35','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(53,4,'郑明虾','test','2020/03/10 15:17:11','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(54,4,'神秘用户','test','2020/03/10 15:17:17','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(55,4,'郑明虾','test','2020/03/10 15:17:22','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(56,4,'神秘用户','tst','2020/03/10 15:17:59','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(57,4,'郑明虾','test','2020/03/10 15:18:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(58,4,'神秘用户','tetttt','2020/03/10 15:18:25','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(59,4,'郑明虾','test','2020/03/10 17:18:31','4','00:00:04','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(60,4,'郑明虾','666666666666','2020/03/10 17:19:46','16','00:00:16','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(61,4,'郑明虾','承包空屏','2020/03/10 17:19:50','16','00:00:16','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(62,4,'郑明虾','test','2020/03/13 13:53:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bubble','气泡弹幕',1),(63,4,'郑明虾','test','2020/03/13 14:17:10','3','00:00:03','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bubble','气泡弹幕',4),(64,4,'郑明虾','test','2020/03/13 15:11:42','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bigBubble','大号气泡',5),(65,4,'郑明虾','我就试试大号气泡弹幕长啥样','2020/03/13 15:15:07','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bigBubble','大号气泡',5),(67,4,'郑明虾','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.JyZEMbWvtMtn68237582b403584026fd42ef2096b294.jpg','2020/03/14 16:11:26','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','pic','图片',4),(68,4,'郑在学习','smiling-face-with-open-mouth-and-tightly-closed-eyes_1f606','2020/03/22 11:26:54','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','emoji','表情',1),(69,4,'郑在学习','rolling-on-the-floor-laughing_1f923','2020/03/22 11:56:31','7','00:00:07','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','emoji','表情',1),(70,4,'郑在学习','a','2020/04/05 15:06:41','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(71,4,'郑在学习','这是一条黄色的弹幕','2020/04/05 15:06:51','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(72,4,'郑在学习','黄色','2020/04/05 15:06:59','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(73,4,'郑在学习','黄色','2020/04/05 15:09:23','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(74,4,'郑在学习','这是一条黄色弹幕','2020/04/05 15:09:47','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(75,4,'郑在学习','test','2020/04/05 15:09:53','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(76,4,'郑在学习','测试','2020/04/05 15:10:01','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(77,4,'郑在学习','test','2020/04/05 15:10:07','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(78,4,'郑在学习','a','2020/04/05 15:10:31','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(79,4,'郑在学习','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.jawpUi0GAQiZ8cabdae25a64d7bc066be7099f77cba5.png','2020/04/10 16:19:11','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','pic','图片',1),(80,4,'郑在学习','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.bWIpjOH4FCjL8cabdae25a64d7bc066be7099f77cba5.png','2020/04/10 16:20:07','43','00:00:43','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','pic','图片',1),(81,4,'郑在学习','666666666666','2020/05/01 15:38:38','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(82,4,'郑在学习','test','2020/05/01 15:38:52','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','bubble','气泡弹幕',3),(83,4,'郑在学习','ttttttttttttt','2020/05/01 15:39:02','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','bigBubble','大号气泡',4),(84,4,'郑在学习','sneezing-face_1f927','2020/05/01 15:39:12','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','emoji','表情',1),(85,4,'郑在学习','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.OZBDgMscYlmU7c72d617cb191b5e136612f15c5a5ee5.jpg','2020/05/01 15:39:26','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','pic','图片',1),(86,4,'神秘用户','test','2020/05/01 15:39:41','5','00:00:05','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(87,4,'郑在学习','透视图','2020/05/14 21:17:50','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(88,4,'郑在学习','test','2020/05/14 21:25:36','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(89,4,'郑在学习','tetst','2020/05/14 21:28:19','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(90,4,'郑在学习','t','2020/05/14 21:32:01','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(91,4,'郑在学习','11111','2020/05/14 21:36:19','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(92,4,'郑在学习','111111111','2020/05/14 21:38:58','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(93,4,'郑在学习','1111111111','2020/05/14 21:54:05','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(94,4,'郑在学习','11111111','2020/05/14 22:18:31','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(95,4,'郑在学习','11111111','2020/05/14 22:24:45','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(96,4,'郑在学习','111111111','2020/05/15 09:16:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(97,4,'郑在学习','1111111111','2020/05/15 09:23:24','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(98,4,'郑在学习','11111111111','2020/05/15 10:46:50','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(99,4,'郑在学习','1111111111','2020/05/15 11:00:02','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(100,4,'郑在学习','11111111111','2020/05/15 11:03:36','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(101,4,'郑在学习','11111111','2020/05/15 11:11:21','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(102,4,'郑在学习','1111111','2020/05/15 11:15:07','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(103,4,'郑在学习','11111111111','2020/05/15 11:29:42','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(104,4,'郑在学习','111111111','2020/05/15 11:34:28','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(105,4,'郑在学习','11111111111','2020/05/15 13:38:09','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(106,4,'郑在学习','1111111111','2020/05/15 15:59:24','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(107,4,'郑在学习','111111111111','2020/05/15 16:03:23','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(108,4,'郑在学习','111111111','2020/05/15 16:04:57','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1);
/*!40000 ALTER TABLE `barrage_normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passed_barrage`
--

DROP TABLE IF EXISTS `passed_barrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passed_barrage` (
  `barrageId` int(11) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `currentDate` varchar(100) DEFAULT NULL,
  `videoTime` varchar(100) DEFAULT NULL,
  `videoTimeText` varchar(100) DEFAULT NULL,
  `avatars` varchar(255) DEFAULT NULL,
  `barrageType` varchar(100) DEFAULT NULL,
  `barrageTypeText` varchar(100) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  PRIMARY KEY (`barrageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passed_barrage`
--

LOCK TABLES `passed_barrage` WRITE;
/*!40000 ALTER TABLE `passed_barrage` DISABLE KEYS */;
INSERT INTO `passed_barrage` VALUES (1,4,'郑明虾','弹幕施工','2020/03/09 11:25:54','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(3,4,'郑明虾','哈哈哈哈或或或或或或或或或或或或','2020/03/09 11:26:06','9','00:00:09','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(5,4,'郑明虾','够可爱的','2020/03/09 11:26:18','20','00:00:20','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(6,4,'郑明虾','儿砸啊妈妈爱你','2020/03/09 11:26:24','27','00:00:27','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(7,4,'郑明虾','姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙姜澯熙','2020/03/09 11:26:43','26','00:00:26','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(9,4,'郑明虾','呜呜呜呜','2020/03/09 11:27:07','49','00:00:49','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(10,4,'郑明虾','金仁诚！','2020/03/09 11:27:19','62','00:01:02','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(14,4,'郑明虾','朱豪朱豪朱豪','2020/03/09 13:46:25','7','00:00:07','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(16,2,'郑明虾','朱豪朱豪朱豪','2020/03/09 13:48:45','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(17,2,'郑明虾','呜呜呜呜神仙','2020/03/09 13:48:58','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(30,4,'神秘用户','啊啊啊啊啊啊啊啊','2020/03/10 14:57:18','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(31,4,'神秘用户','天哪','2020/03/10 14:57:26','5','00:00:05','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(32,4,'神秘用户','太可爱了吧','2020/03/10 14:57:31','9','00:00:09','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(60,4,'郑明虾','666666666666','2020/03/10 17:19:46','16','00:00:16','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(61,4,'郑明虾','承包空屏','2020/03/10 17:19:50','16','00:00:16','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(68,4,'郑在学习','smiling-face-with-open-mouth-and-tightly-closed-eyes_1f606','2020/03/22 11:26:54','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','emoji','表情',1),(80,4,'郑在学习','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.bWIpjOH4FCjL8cabdae25a64d7bc066be7099f77cba5.png','2020/04/10 16:20:07','43','00:00:43','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','pic','图片',1),(82,4,'郑在学习','test','2020/05/01 15:38:52','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','bubble','气泡弹幕',3),(83,4,'郑在学习','ttttttttttttt','2020/05/01 15:39:02','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','bigBubble','大号气泡',4),(86,4,'神秘用户','test','2020/05/01 15:39:41','5','00:00:05','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(106,4,'郑在学习','1111111111','2020/05/15 15:59:24','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(107,4,'郑在学习','111111111111','2020/05/15 16:03:23','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(108,4,'郑在学习','111111111','2020/05/15 16:04:57','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1);
/*!40000 ALTER TABLE `passed_barrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shielding`
--

DROP TABLE IF EXISTS `shielding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shielding` (
  `id` int(11) DEFAULT NULL,
  `vocabulary` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shielding`
--

LOCK TABLES `shielding` WRITE;
/*!40000 ALTER TABLE `shielding` DISABLE KEYS */;
INSERT INTO `shielding` VALUES (11,'黄色'),(12,'暴力'),(13,'屏蔽词');
/*!40000 ALTER TABLE `shielding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_style`
--

DROP TABLE IF EXISTS `tb_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_style` (
  `type` varchar(10) NOT NULL,
  `size` float DEFAULT NULL,
  `area` float DEFAULT NULL,
  `background` varchar(10) DEFAULT NULL,
  `opacity` float DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `unitPrice` float DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_style`
--

LOCK TABLES `tb_style` WRITE;
/*!40000 ALTER TABLE `tb_style` DISABLE KEYS */;
INSERT INTO `tb_style` VALUES ('bubble',1.05,0.5,'#f18867',1,0,2.2,''),('emoji',1.2,1,'',1,0,3,'random'),('img',1.3,1,'',1,5,6,'all'),('text',1.25,0.5,'',1,0,0,'');
/*!40000 ALTER TABLE `tb_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tocheck_barrage`
--

DROP TABLE IF EXISTS `tocheck_barrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tocheck_barrage` (
  `barrageId` int(11) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `currentDate` varchar(100) DEFAULT NULL,
  `videoTime` varchar(100) DEFAULT NULL,
  `videoTimeText` varchar(100) DEFAULT NULL,
  `avatars` varchar(255) DEFAULT NULL,
  `barrageType` varchar(100) DEFAULT NULL,
  `barrageTypeText` varchar(100) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  PRIMARY KEY (`barrageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tocheck_barrage`
--

LOCK TABLES `tocheck_barrage` WRITE;
/*!40000 ALTER TABLE `tocheck_barrage` DISABLE KEYS */;
INSERT INTO `tocheck_barrage` VALUES (4,4,'郑明虾','笑死过去','2020/03/09 11:26:11','14','00:00:14','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(8,4,'郑明虾','金路云金路云金路云金路云金路云金路云','2020/03/09 11:26:57','40','00:00:40','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(15,4,'郑明虾','呜呜呜呜呜SF9的rap line真是神仙','2020/03/09 13:46:40','22','00:00:22','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(18,2,'郑明虾','太厉害了吧','2020/03/09 13:49:09','8','00:00:08','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(29,4,'郑明虾','我的天哪','2020/03/10 14:52:22','20','00:00:20','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(64,4,'郑明虾','test','2020/03/13 15:11:42','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bigBubble','大号气泡',5),(65,4,'郑明虾','我就试试大号气泡弹幕长啥样','2020/03/13 15:15:07','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bigBubble','大号气泡',5),(67,4,'郑明虾','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.JyZEMbWvtMtn68237582b403584026fd42ef2096b294.jpg','2020/03/14 16:11:26','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','pic','图片',4),(69,4,'郑在学习','rolling-on-the-floor-laughing_1f923','2020/03/22 11:56:31','7','00:00:07','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','emoji','表情',1),(81,4,'郑在学习','666666666666','2020/05/01 15:38:38','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(84,4,'郑在学习','sneezing-face_1f927','2020/05/01 15:39:12','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','emoji','表情',1),(85,4,'郑在学习','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.OZBDgMscYlmU7c72d617cb191b5e136612f15c5a5ee5.jpg','2020/05/01 15:39:26','5','00:00:05','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','pic','图片',1),(96,4,'郑在学习','111111111','2020/05/15 09:16:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(97,4,'郑在学习','1111111111','2020/05/15 09:23:24','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(98,4,'郑在学习','11111111111','2020/05/15 10:46:50','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(106,4,'郑在学习','1111111111','2020/05/15 15:59:24','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1);
/*!40000 ALTER TABLE `tocheck_barrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unpassed_barrage`
--

DROP TABLE IF EXISTS `unpassed_barrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unpassed_barrage` (
  `barrageId` int(11) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `currentDate` varchar(100) DEFAULT NULL,
  `videoTime` varchar(100) DEFAULT NULL,
  `videoTimeText` varchar(100) DEFAULT NULL,
  `avatars` varchar(255) DEFAULT NULL,
  `barrageType` varchar(100) DEFAULT NULL,
  `barrageTypeText` varchar(100) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  PRIMARY KEY (`barrageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unpassed_barrage`
--

LOCK TABLES `unpassed_barrage` WRITE;
/*!40000 ALTER TABLE `unpassed_barrage` DISABLE KEYS */;
INSERT INTO `unpassed_barrage` VALUES (11,4,'郑明虾','test','2020/03/09 12:22:30','69','00:01:09','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(12,4,'郑明虾','黄色','2020/03/09 12:22:35','69','00:01:09','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(13,4,'郑明虾','test','2020/03/09 12:23:39','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(20,4,'郑明虾','aaaaaaaaaaa','2020/03/09 14:17:06','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(21,4,'神秘用户','aaaaaaaaaaaaaaaaaaaa','2020/03/09 14:17:16','2','00:00:02','http://localhost:8080/BarrageProject/img/avater_default.png','normal','普通弹幕',1),(22,4,'郑明虾','test','2020/03/09 17:00:37','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(23,4,'郑明虾','test','2020/03/09 17:00:41','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(24,4,'undefined','test','2020/03/10 14:50:03','0','00:00:00','undefined','normal','普通弹幕',1),(25,4,'郑明虾','test','2020/03/10 14:50:59','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(26,4,'神秘用户','test','2020/03/10 14:51:04','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Ip3ertgisU9lcebae21545533238d304a80686e37676.jpg','normal','普通弹幕',1),(27,4,'神秘用户','啊啊啊啊啊啊我没了','2020/03/10 14:52:09','7','00:00:07','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Ip3ertgisU9lcebae21545533238d304a80686e37676.jpg','normal','普通弹幕',1),(28,4,'神秘用户','怎么可以这样','2020/03/10 14:52:15','14','00:00:14','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Ip3ertgisU9lcebae21545533238d304a80686e37676.jpg','normal','普通弹幕',1),(33,4,'undefined','test','2020/03/10 15:04:49','0','00:00:00','undefined','normal','普通弹幕',1),(34,4,'神秘用户','test','2020/03/10 15:04:58','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(35,4,'郑明虾','tst','2020/03/10 15:05:13','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(36,4,'undefined','test','2020/03/10 15:07:12','0','00:00:00','undefined','normal','普通弹幕',1),(37,4,'undefined','test','2020/03/10 15:09:28','0','00:00:00','undefined','normal','普通弹幕',1),(38,4,'神秘用户','泰斯特','2020/03/10 15:10:29','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(39,4,'神秘用户','他','2020/03/10 15:10:39','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(40,4,'郑明虾','test','2020/03/10 15:11:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(42,4,'神秘用户','test','2020/03/10 15:13:33','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(43,4,'神秘用户','tset','2020/03/10 15:13:45','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(44,4,'神秘用户','test','2020/03/10 15:14:04','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(45,4,'神秘用户','test','2020/03/10 15:14:10','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(46,4,'神秘用户','test','2020/03/10 15:14:16','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(47,4,'郑明虾','test','2020/03/10 15:14:43','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(48,4,'郑明虾','test','2020/03/10 15:14:48','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(49,4,'郑明虾','test','2020/03/10 15:16:15','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(50,4,'郑明虾','test','2020/03/10 15:16:21','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(51,4,'神秘用户','tests','2020/03/10 15:16:27','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(52,4,'郑明虾','tset','2020/03/10 15:16:35','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(53,4,'郑明虾','test','2020/03/10 15:17:11','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(54,4,'神秘用户','test','2020/03/10 15:17:17','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(55,4,'郑明虾','test','2020/03/10 15:17:22','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(56,4,'神秘用户','tst','2020/03/10 15:17:59','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(57,4,'郑明虾','test','2020/03/10 15:18:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(58,4,'神秘用户','tetttt','2020/03/10 15:18:25','0','00:00:00','https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png','normal','普通弹幕',1),(59,4,'郑明虾','test','2020/03/10 17:18:31','4','00:00:04','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','normal','普通弹幕',1),(62,4,'郑明虾','test','2020/03/13 13:53:16','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bubble','气泡弹幕',1),(63,4,'郑明虾','test','2020/03/13 14:17:10','3','00:00:03','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3W5HxXtEYAz4SOEscSZtia3Mw/132','bubble','气泡弹幕',4),(70,4,'郑在学习','a','2020/04/05 15:06:41','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(71,4,'郑在学习','这是一条黄色的弹幕','2020/04/05 15:06:51','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(72,4,'郑在学习','黄色','2020/04/05 15:06:59','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(73,4,'郑在学习','黄色','2020/04/05 15:09:23','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(74,4,'郑在学习','这是一条黄色弹幕','2020/04/05 15:09:47','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(75,4,'郑在学习','test','2020/04/05 15:09:53','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(76,4,'郑在学习','测试','2020/04/05 15:10:01','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(77,4,'郑在学习','test','2020/04/05 15:10:07','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(78,4,'郑在学习','a','2020/04/05 15:10:31','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','normal','普通弹幕',1),(79,4,'郑在学习','http://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.jawpUi0GAQiZ8cabdae25a64d7bc066be7099f77cba5.png','2020/04/10 16:19:11','0','00:00:00','https://wx.qlogo.cn/mmopen/vi_32/uK3ozoglIMOpjbNtppwsgGuiaXKxyeWeMCplic20LW8lQSbhuUpmQD68x2Y7Bfmx3WU7jM9f1Z479JfEBAG35Urw/132','pic','图片',1);
/*!40000 ALTER TABLE `unpassed_barrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videolist`
--

DROP TABLE IF EXISTS `videolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videolist` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `videourl` varchar(255) DEFAULT NULL,
  `coverurl` varchar(255) DEFAULT NULL,
  `maskvideo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videolist`
--

LOCK TABLES `videolist` WRITE;
/*!40000 ALTER TABLE `videolist` DISABLE KEYS */;
INSERT INTO `videolist` VALUES (1,'The Day','辉映&澯熙ins自作曲片段','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/99e8c41f5285890799525935429/M11gR67HeAYA.mp4','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/99e8c41f5285890799525935429/5285890799525935430.png','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/13383cc75285890801641915730/BXp2BYCDGfEA.mp4'),(2,'Be Alone-朱豪','朱豪自作曲，表现了一个人时候的情感以及朱豪希望摆脱这种情感的感受','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/50815f285285890799589655159/Ilc4fQsgGX4A.mp4','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/50815f285285890799589655159/5285890799589655160.jpg',NULL),(4,'SF9-MAMMA MIA','SF9第5张迷你专主打曲，曾以此掀起此曲对应健身操热潮，活泼轻松的运动风格收到许多运动人士的喜爱','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/0c8e3e5e5285890799608245477/E8DFac8WEmEA.mp4','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/0c8e3e5e5285890799608245477/5285890799608245479.png','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/13383cc75285890801641915730/BXp2BYCDGfEA.mp4'),(5,'SF9-Now Or Nerver','姜澯熙知名百万直拍来源MV~小九一起加油吧~~~','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/1d6484305285890802173186756/I1fxkhuQH2UA.mp4?t=5eabd6b7&rlimit=2&us=3677808904849814451&sign=2db67b6fba856d9a313cbfd9875ac341','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/1d6484305285890802173186756/5285890802173186757.jpg',NULL);
/*!40000 ALTER TABLE `videolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoplaying`
--

DROP TABLE IF EXISTS `videoplaying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videoplaying` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `videourl` varchar(255) DEFAULT NULL,
  `coverurl` varchar(255) DEFAULT NULL,
  `maskvideo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoplaying`
--

LOCK TABLES `videoplaying` WRITE;
/*!40000 ALTER TABLE `videoplaying` DISABLE KEYS */;
INSERT INTO `videoplaying` VALUES (4,'SF9-MAMMA MIA','SF9第5张迷你专主打曲，曾以此掀起此曲对应健身操热潮，活泼轻松的运动风格收到许多运动人士的喜爱','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/0c8e3e5e5285890799608245477/E8DFac8WEmEA.mp4','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/0c8e3e5e5285890799608245477/5285890799608245479.png','http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/13383cc75285890801641915730/BXp2BYCDGfEA.mp4');
/*!40000 ALTER TABLE `videoplaying` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-30 10:49:32
