/*
 Navicat MySQL Data Transfer

 Source Server         : yuhai
 Source Server Version : 50615
 Source Host           : localhost
 Source Database       : ttruus

 Target Server Version : 50615
 File Encoding         : utf-8

 Date: 03/07/2014 17:57:04 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `MainTaskReceiver`
-- ----------------------------
DROP TABLE IF EXISTS `MainTaskReceiver`;
CREATE TABLE `MainTaskReceiver` (
  `task_id` int(10) unsigned NOT NULL COMMENT 'main task_id , one task can asign to many people',
  `task_receiver` varchar(40) NOT NULL,
  KEY `task_receiver` (`task_receiver`),
  KEY `task_id` (`task_id`),
  KEY `task_id_2` (`task_id`),
  CONSTRAINT `mainTaskId` FOREIGN KEY (`task_id`) REFERENCES `mainTask` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiverEmail` FOREIGN KEY (`task_receiver`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mainTask`
-- ----------------------------
DROP TABLE IF EXISTS `mainTask`;
CREATE TABLE `mainTask` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `task_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_begin_time` timestamp NULL DEFAULT NULL COMMENT 'if user doesn''t set it, set it to current time',
  `task_end_time` timestamp NULL DEFAULT NULL,
  `task_creater` varchar(40) NOT NULL,
  `task_status` int(2) NOT NULL COMMENT '1 create, 2 send, 3 agree, 4 reject, 5 modify',
  `task_content` text,
  `org_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `task_creater` (`task_creater`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `orgnization` FOREIGN KEY (`org_id`) REFERENCES `orgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `creater` FOREIGN KEY (`task_creater`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `subTask`
-- ----------------------------
DROP TABLE IF EXISTS `subTask`;
CREATE TABLE `subTask` (
  `sub_task_id` int(10) unsigned NOT NULL DEFAULT '0',
  `task_id` int(10) unsigned DEFAULT NULL,
  `sub_task_name` varchar(255) DEFAULT NULL,
  `sub_task_creater_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_task_begin_time` timestamp NULL DEFAULT NULL,
  `sub_task_end_time` timestamp NULL DEFAULT NULL,
  `sub_task_status` int(2) DEFAULT NULL COMMENT '1 create, 2 send, 3 agree, 4 reject, 5 modify',
  `sub_task_content` text,
  PRIMARY KEY (`sub_task_id`),
  KEY `task_id` (`task_id`),
  KEY `task_id_2` (`task_id`),
  CONSTRAINT `parent_task_id` FOREIGN KEY (`task_id`) REFERENCES `mainTask` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `subTaskReceiver`
-- ----------------------------
DROP TABLE IF EXISTS `subTaskReceiver`;
CREATE TABLE `subTaskReceiver` (
  `sub_task_id` int(10) unsigned NOT NULL,
  `sub_task_receiver` varchar(40) NOT NULL,
  KEY `sub_task_id` (`sub_task_id`),
  KEY `sub_task_id_2` (`sub_task_id`),
  KEY `sub_task_id_3` (`sub_task_id`),
  KEY `sub_task_receiver` (`sub_task_receiver`),
  CONSTRAINT `subTaskReceiver` FOREIGN KEY (`sub_task_receiver`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subTaskId` FOREIGN KEY (`sub_task_id`) REFERENCES `subTask` (`sub_task_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `task_record`
-- ----------------------------
DROP TABLE IF EXISTS `task_record`;
CREATE TABLE `task_record` (
  `task_id` int(10) unsigned NOT NULL COMMENT 'record the change by main task id',
  `who` varchar(40) NOT NULL,
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'once create, can''t update ',
  `what` text NOT NULL,
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`record_id`),
  KEY `task_id` (`task_id`),
  KEY `who` (`who`),
  CONSTRAINT `who` FOREIGN KEY (`who`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mask_task_id` FOREIGN KEY (`task_id`) REFERENCES `mainTask` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `userInfo` VALUES ('l.yuhai@foxmail.com', 'fox', 'mail', '2014-02-28 17:51:23', '2014-02-28 17:51:23', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('l.yuhai@gmail.com', 'yuhai', '刘', '2014-02-28 17:35:45', '2014-02-28 17:35:45', '1394113630567', 'tn_1394113630567', '1', '13911801812', '65643888', '北京', 'CEO'), ('ning.meng@gmail.com', '梦', 'ning', '2014-03-06 18:31:01', '2014-03-06 18:31:01', 'defaultphoto.jpg', 'defaultphoto.jpg', '2', '13911801812', '65643888', 'beijing', 'cfo'), ('ningsession@gmail.com', 'meng', 'ning', '2014-02-28 23:15:24', '2014-02-28 23:15:24', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('nnforeign@test.com', 'nn', 'mm', '2014-03-06 18:22:00', '2014-03-06 18:22:00', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('session1@gmail.com', 'session', 'liu', '2014-02-28 23:14:14', '2014-02-28 23:14:14', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('session@gmail.com', 'session', 'liu', '2014-02-28 23:11:55', '2014-02-28 23:11:55', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@mock.com', 'test', 'test', '2014-03-06 18:22:09', '2014-03-06 18:22:09', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test1@test.com', '莉莉', '李', '2014-03-06 18:22:28', '2014-03-06 18:22:28', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@mock.com', '克强', '李', '2014-03-06 18:23:01', '2014-03-06 18:23:01', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@mytest.com', 'asdf', 'asd', '2014-03-06 18:23:06', '2014-03-06 18:23:06', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test2@test.com', 'qafsd', 'cvb', '2014-03-06 18:23:11', '2014-03-06 18:23:11', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@mock.com', '43r', '56y', '2014-03-06 18:23:15', '2014-03-06 18:23:15', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@mytest.com', 'sd', 'bgf', '2014-03-06 18:23:19', '2014-03-06 18:23:19', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test3@test.com', 'asd', 'fdsa', '2014-03-06 18:23:22', '2014-03-06 18:23:22', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test4@mytest.com', 'asdf', 'gfdh', '2014-03-06 18:23:26', '2014-03-06 18:23:26', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@mock.com', 'xzcv', 'dsfg', '2014-03-06 18:23:29', '2014-03-06 18:23:29', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@mytest.com', '金平', '洗', '2014-03-06 18:23:57', '2014-03-06 18:23:57', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null), ('test@test.com', 'asd', 'fgh', '2014-03-06 18:24:03', '2014-03-06 18:24:03', 'defaultphoto.jpg', 'defaultphoto.jpg', null, null, null, null, null);
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
INSERT INTO `user_org` VALUES ('test3@mock.com', '23', '2014-03-04 12:14:42'), ('test3@mytest.com', '23', '2014-03-04 13:57:19'), ('test3@test.com', '23', '2014-03-04 13:57:31'), ('test4@mytest.com', '23', '2014-03-04 13:57:41'), ('test@mock.com', '23', '2014-03-03 22:32:29'), ('test@mytest.com', '23', '2014-03-03 22:22:26'), ('test@test.com', '23', '2014-03-03 22:10:14');
COMMIT;

-- ----------------------------
--  Table structure for `user_task`
-- ----------------------------
DROP TABLE IF EXISTS `user_task`;
CREATE TABLE `user_task` (
  `task_id` int(10) unsigned NOT NULL,
  `user_email` varchar(40) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `main_task_id` FOREIGN KEY (`task_id`) REFERENCES `mainTask` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
