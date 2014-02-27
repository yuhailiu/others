/*
 Navicat MySQL Data Transfer

 Source Server         : yuhai
 Source Server Version : 50615
 Source Host           : localhost
 Source Database       : ttruus

 Target Server Version : 50615
 File Encoding         : utf-8

 Date: 02/27/2014 23:35:11 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `orgnization`
-- ----------------------------
DROP TABLE IF EXISTS `orgnization`;
CREATE TABLE `orgnization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `org_des` text COMMENT 'describ the orgnization',
  `org_tel` varchar(20) DEFAULT NULL,
  `org_address` text,
  `org_website` varchar(255) DEFAULT NULL,
  `org_logo` varchar(255) DEFAULT NULL COMMENT 'logo + org_id',
  `org_logo_thumbnail` varchar(255) DEFAULT NULL,
  `org_CT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'orgnization create time',
  `org_LM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'orgnization is modified last',
  `org_creater_email` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_name` (`org_name`) USING BTREE,
  KEY `org_creater_email` (`org_creater_email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `orgnization`
-- ----------------------------
BEGIN;
INSERT INTO `orgnization` VALUES ('1', 'free bird', 'the best team in the world', '65643888', 'beijing', 'www.baidu.com', 'logo1', 'tn_logo1', '2014-02-25 14:14:10', '2014-02-25 14:41:59', 'l.yuhai@gmail.com'), ('6', 'test', null, null, null, null, null, null, '2014-02-24 13:57:43', '2014-02-24 13:57:43', 'test'), ('7', 'test', '', '', '', '', 'logo', 'tn_logo', '2014-02-24 17:59:52', '2014-02-24 18:01:38', 'l.yuhai@foxmail.com'), ('8', 'free bird', null, null, null, null, 'tn_logo', 'tn_logo', '2014-02-26 18:07:30', '2014-02-26 18:07:30', 'ning.meng@gmail.com'), ('9', 'default_org_1023', null, null, null, null, null, null, '2014-02-24 18:09:53', '2014-02-24 18:09:53', 'test@test.com'), ('10', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 13:50:01', '2014-02-26 13:50:01', 'test1@test.com'), ('11', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:33', '2014-02-26 18:07:33', 'test2@test.com'), ('12', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:34', '2014-02-26 18:07:34', 'test3@test.com'), ('13', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:35', '2014-02-26 18:07:35', 'test@mytest.com'), ('14', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:36', '2014-02-26 18:07:36', 'test1@mytest.com'), ('15', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:38', '2014-02-26 18:07:38', 'test2@mytest.com'), ('16', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:41', '2014-02-26 18:07:41', 'test3@mytest.com'), ('17', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:39', '2014-02-26 18:07:39', 'test4@mytest.com'), ('18', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:42', '2014-02-26 18:07:42', 'test@mock.com'), ('19', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:44', '2014-02-26 18:07:44', 'test1@mock.com'), ('20', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:46', '2014-02-26 18:07:46', 'test2@mock.com'), ('21', 'free bird', null, null, null, null, 'logo', 'tn_logo', '2014-02-26 18:07:47', '2014-02-26 18:07:47', 'test3@mock.com');
COMMIT;

-- ----------------------------
--  Table structure for `request_join`
-- ----------------------------
DROP TABLE IF EXISTS `request_join`;
CREATE TABLE `request_join` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `requester` varchar(40) NOT NULL COMMENT 'requester''s email',
  `request_org_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0: pending, 1: pass, 2: reject',
  `addition_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `request_join`
-- ----------------------------
BEGIN;
INSERT INTO `request_join` VALUES ('1', 'l.yuhai@gmail.com', '3', '2014-02-27 18:50:04', '0', null), ('2', 'l.yuhai@gmail.com', '2', '2014-02-27 17:19:19', '1', null), ('3', 'l.yuhai@gmail.com', '0', '2014-02-27 22:58:52', '0', null), ('11', 'l.yuhai@gmail.com', '1', '2014-02-27 23:29:46', '0', '会飞的石头，哥们');
COMMIT;

-- ----------------------------
--  Table structure for `userInfo`
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `email` varchar(40) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `filename` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '1: male, 0 female',
  `telephone1` varchar(20) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `address` text,
  `title` text,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `userInfo`
-- ----------------------------
BEGIN;
INSERT INTO `userInfo` VALUES ('l.yuhai@foxmail.com', '2014-02-24 17:53:03', '2014-02-24 17:53:03', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('l.yuhai@gmail.com', '2014-02-01 12:33:58', '2014-02-19 17:21:29', '1392711240426', 'tn_1392711240426', '3', '65643888', '13911801812', '金隅可乐大厦，A座1802室', 'chief officer'), ('ning.meng@gmail.com', '2014-02-24 18:07:49', '2014-02-24 18:07:49', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@mock.com', '2014-02-25 23:01:13', '2014-02-25 23:01:13', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@mytest.com', '2014-02-25 22:10:18', '2014-02-25 22:10:18', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@test.com', '2014-02-24 18:19:22', '2014-02-24 18:19:22', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@mock.com', '2014-02-25 23:20:29', '2014-02-25 23:20:29', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@mytest.com', '2014-02-25 22:11:51', '2014-02-25 22:11:51', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@test.com', '2014-02-24 18:30:07', '2014-02-24 18:30:07', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@mock.com', '2014-02-25 23:23:05', '2014-02-25 23:23:05', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@mytest.com', '2014-02-25 22:12:59', '2014-02-25 22:12:59', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@test.com', '2014-02-24 18:34:59', '2014-02-24 18:34:59', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test4@mytest.com', '2014-02-25 22:14:15', '2014-02-25 22:14:15', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@mock.com', '2014-02-25 22:25:10', '2014-02-25 22:25:10', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@mytest.com', '2014-02-25 22:09:18', '2014-02-25 22:09:18', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@test.com', '2014-02-24 18:09:53', '2014-02-24 18:09:53', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null);
COMMIT;

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
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `captcha` int(6) DEFAULT NULL,
  `failedTimes` int(2) DEFAULT NULL COMMENT 'max times is 10',
  PRIMARY KEY (`email`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('yuhai', 'liu', 'l.yuhai@foxmail.com', '138d6999820950df499ba0c356af5b39', null, '0'), ('玉海', 'liu', 'l.yuhai@gmail.com', '138d6999820950df499ba0c356af5b39', '669226', '0'), ('meng', 'ning', 'ning.meng@gmail.com', '138d6999820950df499ba0c356af5b39', null, null), ('hello', 'asdf', 'test1@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('tsaer', 'asdf', 'test1@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('teest', 'test', 'test1@test.com', '138d6999820950df499ba0c356af5b39', null, '0'), ('asdf', 'asdf', 'test2@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('sdfasf', 'asdfas', 'test2@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('test2', 'asdf', 'test2@test.com', '138d6999820950df499ba0c356af5b39', null, null), ('asdfsa', 'asdfas', 'test3@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('fgads', 'asdfas', 'test3@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('tesas', 'asd', 'test3@test.com', '138d6999820950df499ba0c356af5b39', null, null), ('asdf', 'asdf', 'test4@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('afasdf', 'asdfsad', 'test@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('test', 'test', 'test@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('test', 'test', 'test@test.com', '138d6999820950df499ba0c356af5b39', null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
