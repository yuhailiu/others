/*
 Navicat MySQL Data Transfer

 Source Server         : yuhai
 Source Server Version : 50615
 Source Host           : localhost
 Source Database       : ttruus

 Target Server Version : 50615
 File Encoding         : utf-8

 Date: 03/04/2014 18:21:37 PM
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
  KEY `org_creater_email` (`org_creater_email`) USING BTREE,
  CONSTRAINT `orgnization_ibfk_1` FOREIGN KEY (`org_creater_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `orgnization`
-- ----------------------------
BEGIN;
INSERT INTO `orgnization` VALUES ('22', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 13:39:20', '2014-02-28 13:39:20', 'nnforeign@test.com'), ('23', 'free bird', '', '', '', 'www.freebird.com', 'logo23', 'tn_logo23', '2014-02-28 17:35:45', '2014-03-02 15:43:26', 'l.yuhai@gmail.com'), ('24', 'free bird', '', '', '', '', 'logo24', 'tn_logo24', '2014-02-28 17:51:23', '2014-02-28 17:53:34', 'l.yuhai@foxmail.com'), ('25', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 23:11:55', '2014-02-28 23:11:55', 'session@gmail.com'), ('26', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 23:14:14', '2014-02-28 23:14:14', 'session1@gmail.com'), ('27', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 23:15:24', '2014-02-28 23:15:24', 'ningsession@gmail.com');
COMMIT;

-- ----------------------------
--  Table structure for `request_join`
-- ----------------------------
DROP TABLE IF EXISTS `request_join`;
CREATE TABLE `request_join` (
  `requester` varchar(40) NOT NULL COMMENT 'requester''s email',
  `request_org_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0: pending, 1: pass, 2: reject',
  `addition_info` text,
  PRIMARY KEY (`requester`,`request_org_id`),
  KEY `requester` (`requester`),
  KEY `request_org_id` (`request_org_id`),
  KEY `request_org_id_2` (`request_org_id`),
  KEY `request_org_id_3` (`request_org_id`),
  KEY `request_org_id_4` (`request_org_id`),
  CONSTRAINT `request_join_ibfk_1` FOREIGN KEY (`request_org_id`) REFERENCES `orgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_join_ibfk_2` FOREIGN KEY (`requester`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `request_join`
-- ----------------------------
BEGIN;
INSERT INTO `request_join` VALUES ('l.yuhai@foxmail.com', '23', '2014-03-03 23:11:49', '2', null), ('ning.meng@gmail.com', '23', '2014-03-04 10:09:45', '1', '除了我们在上面的例子中使用的 INNER JOIN（内连接），我们还可以使用其他几种连接。'), ('nnforeign@test.com', '22', '2014-02-28 14:05:09', '0', null), ('session1@gmail.com', '23', '2014-03-03 22:12:10', '0', null), ('test@mock.com', '23', '2014-03-03 22:32:29', '1', null), ('test@mytest.com', '23', '2014-03-03 22:22:26', '1', null), ('test@test.com', '23', '2014-03-03 22:12:15', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `userInfo`
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `email` varchar(40) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `filename` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '1: male, 0 female',
  `telephone1` varchar(20) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `address` text,
  `title` text,
  PRIMARY KEY (`email`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `userInfo`
-- ----------------------------
BEGIN;
INSERT INTO `userInfo` VALUES ('l.yuhai@foxmail.com', 'fox', 'mail', '2014-02-28 17:51:23', '2014-02-28 17:51:23', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('l.yuhai@gmail.com', 'yuhai', '刘', '2014-02-28 17:35:45', '2014-02-28 17:35:45', 'defaultphoto.jpg', 'defaultphoto.jpg', null, '', '', '北京', ''), ('ning.meng@gmail.com', '梦', 'ning', '2014-03-02 21:58:22', '2014-03-02 21:58:22', 'defaultphoto.jpg', 'defaultphoto.jpg', null, '', '', '', ''), ('ningsession@gmail.com', 'meng', 'ning', '2014-02-28 23:15:24', '2014-02-28 23:15:24', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('nnforeign@test.com', null, null, '2014-02-28 13:39:20', '2014-02-28 13:39:20', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('session1@gmail.com', 'session', 'liu', '2014-02-28 23:14:14', '2014-02-28 23:14:14', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('session@gmail.com', 'session', 'liu', '2014-02-28 23:11:55', '2014-02-28 23:11:55', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@mock.com', null, null, '2014-02-25 23:01:13', '2014-02-25 23:01:13', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@test.com', null, null, '2014-02-24 18:19:22', '2014-02-24 18:19:22', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@mock.com', null, null, '2014-02-25 23:20:29', '2014-02-25 23:20:29', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@mytest.com', null, null, '2014-02-25 22:11:51', '2014-02-25 22:11:51', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@test.com', null, null, '2014-02-24 18:30:07', '2014-02-24 18:30:07', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@mock.com', null, null, '2014-02-25 23:23:05', '2014-02-25 23:23:05', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@mytest.com', null, null, '2014-02-25 22:12:59', '2014-02-25 22:12:59', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@test.com', null, null, '2014-02-24 18:34:59', '2014-02-24 18:34:59', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test4@mytest.com', null, null, '2014-02-25 22:14:15', '2014-02-25 22:14:15', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@mock.com', null, null, '2014-02-25 22:25:10', '2014-02-25 22:25:10', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@mytest.com', null, null, '2014-02-25 22:09:18', '2014-02-25 22:09:18', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@test.com', null, null, '2014-02-24 18:09:53', '2014-02-24 18:09:53', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `user_org`
-- ----------------------------
DROP TABLE IF EXISTS `user_org`;
CREATE TABLE `user_org` (
  `user_email` varchar(40) NOT NULL DEFAULT '',
  `org_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'never change once create it.',
  PRIMARY KEY (`user_email`,`org_id`),
  KEY `user_email` (`user_email`),
  KEY `user_email_2` (`user_email`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `user_org_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `orgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_org_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_org`
-- ----------------------------
BEGIN;
INSERT INTO `user_org` VALUES ('l.yuhai@foxmail.com', '23', '2014-03-03 22:09:06'), ('ning.meng@gmail.com', '23', '2014-03-03 22:04:13'), ('ningsession@gmail.com', '23', '2014-03-04 12:14:01'), ('nnforeign@test.com', '23', '2014-03-04 12:14:27'), ('session1@gmail.com', '23', '2014-03-03 19:52:32'), ('test3@mock.com', '23', '2014-03-04 12:14:42'), ('test3@mytest.com', '23', '2014-03-04 13:57:19'), ('test3@test.com', '23', '2014-03-04 13:57:31'), ('test4@mytest.com', '23', '2014-03-04 13:57:41'), ('test@mock.com', '23', '2014-03-03 22:32:29'), ('test@mytest.com', '23', '2014-03-03 22:22:26'), ('test@test.com', '23', '2014-03-03 22:10:14');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
INSERT INTO `users` VALUES ('l.yuhai@foxmail.com', '138d6999820950df499ba0c356af5b39', null, '0'), ('l.yuhai@gmail.com', '138d6999820950df499ba0c356af5b39', null, '0'), ('ning.meng@gmail.com', '138d6999820950df499ba0c356af5b39', null, '0'), ('ningsession@gmail.com', '138d6999820950df499ba0c356af5b39', null, null), ('nnforeign@test.com', '138d6999820950df499ba0c356af5b39', null, null), ('session1@gmail.com', '138d6999820950df499ba0c356af5b39', null, null), ('session@gmail.com', '138d6999820950df499ba0c356af5b39', null, null), ('test1@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('test1@test.com', '138d6999820950df499ba0c356af5b39', null, '0'), ('test2@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('test2@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('test2@test.com', '138d6999820950df499ba0c356af5b39', null, null), ('test3@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('test3@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('test3@test.com', '138d6999820950df499ba0c356af5b39', null, null), ('test4@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('test@mock.com', '138d6999820950df499ba0c356af5b39', null, null), ('test@mytest.com', '138d6999820950df499ba0c356af5b39', null, null), ('test@test.com', '138d6999820950df499ba0c356af5b39', null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
