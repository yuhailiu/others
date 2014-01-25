/*
 Navicat MySQL Data Transfer

 Source Server         : phpDB
 Source Server Version : 50610
 Source Host           : localhost
 Source Database       : ttruus

 Target Server Version : 50610
 File Encoding         : utf-8

 Date: 01/21/2014 21:49:53 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `orgnization`
-- ----------------------------
DROP TABLE IF EXISTS `orgnization`;
CREATE TABLE `orgnization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_name` text NOT NULL,
  `org_discribtion` text NOT NULL,
  `c_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email` (`c_email`),
  KEY `c_email` (`c_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_org`
-- ----------------------------
DROP TABLE IF EXISTS `user_org`;
CREATE TABLE `user_org` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `org_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'no change after the user is created',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'change when the user any informations are modified',
  `sex` int(1) DEFAULT NULL COMMENT '1: male, 2: female or null ',
  `telephone1` varchar(20) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `address` text,
  `title` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'Yuhai', 'Liu', 'l.yuhai@gmail.com', '138d6999820950df499ba0c356af5b39', 'headphoto1', 'tn_headphoto1', '2014-01-01 00:00:00', '2014-01-21 16:12:14', '1', '010-65643888', '18611697407', '北京市 朝阳区 双桥镇 金隅可乐大厦1802室', '首席执行官'), ('57', 'yuhai', 'default', 'liu.yuhai@gmail.com', '138d6999820950df499ba0c356af5b39', 'headphoto57', 'tn_headphoto57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null, null, null, null), ('58', 'tommy', 'tang', 't.tang@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null, null, null, null), ('59', 'nickle', 'liu', 'l.nickle@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null, null, null, null), ('60', 'jun', 'wan', 'jun.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:13:48', '2014-01-16 19:13:48', null, null, null, null, null), ('61', 'jun1', 'wan', 'jun1.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:24:18', '2014-01-16 19:24:18', null, null, null, null, null), ('62', 'jun3', 'wan', 'jun3.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:29:18', '2014-01-16 19:29:18', null, null, null, null, null), ('64', 'jun4', 'wan', 'jun4.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:40:21', '2014-01-16 19:40:21', null, null, null, null, null), ('66', 'jun5', 'wan', 'jun5.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:43:35', '2014-01-16 19:43:35', null, null, null, null, null), ('67', 'jun6', 'wan', 'jun6.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:49:14', '2014-01-16 19:49:14', null, null, null, null, null), ('68', 'jun7', 'wan', 'jun7.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'defaultphoto.jpg', 'defaultphoto.jpg', '2014-01-16 19:52:29', '2014-01-16 19:52:29', null, null, null, null, null), ('69', 'jun8', 'wan', 'jun8.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'headphoto69', 'tn_headphoto69', '2014-01-16 19:57:44', '2014-01-16 21:42:13', null, null, null, null, null), ('70', 'jun9', 'wang', 'jun9.wan@gmail.com', '138d6999820950df499ba0c356af5b39', 'headphoto70', 'tn_headphoto70', '2014-01-16 21:22:07', '2014-01-16 20:01:39', null, null, null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
