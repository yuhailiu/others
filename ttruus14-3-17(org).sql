/*
 Navicat MySQL Data Transfer

 Source Server         : yuhai
 Source Server Version : 50615
 Source Host           : localhost
 Source Database       : ttruus

 Target Server Version : 50615
 File Encoding         : utf-8

 Date: 03/18/2014 18:15:45 PM
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
  KEY `task_id_2` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `invite_join`
-- ----------------------------
DROP TABLE IF EXISTS `invite_join`;
CREATE TABLE `invite_join` (
  `invite_org_id` int(10) unsigned NOT NULL,
  `inviter` varchar(40) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL COMMENT '0: reserve, 1: create, 2: email, 3: reject, 4: pass',
  `addition_info` text,
  PRIMARY KEY (`invite_org_id`,`inviter`),
  KEY `invite_org_id` (`invite_org_id`),
  CONSTRAINT `org_id` FOREIGN KEY (`invite_org_id`) REFERENCES `orgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `invite_join`
-- ----------------------------
BEGIN;
INSERT INTO `invite_join` VALUES ('23', 'invite1@gmail.com', '2014-03-17 16:37:15', '0', '鸟人是我'), ('23', 'invite2@gmail.com', '2014-03-17 16:37:15', '0', '鸟人是我2'), ('23', 'invite3@gmail.com', '2014-03-17 16:42:45', '0', 'hello invite3'), ('23', 'invite4@gmail.com', '2014-03-17 16:42:46', '0', 'invite4'), ('23', 'invite@gmail.com', '2014-03-17 16:27:58', '0', 'asdfasdf'), ('23', 'l.yuhai@foxmail.com', '2014-03-17 15:39:15', '0', '2014 is a good year'), ('23', 'l.yuhai@gmail.com', '2014-03-17 16:25:56', '0', ''), ('23', 'ning.meng@gmail.com', '2014-03-17 16:31:52', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `mainTask`
-- ----------------------------
DROP TABLE IF EXISTS `mainTask`;
CREATE TABLE `mainTask` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `task_begin_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'if user doesn''t set it, set it to current time',
  `task_end_time` timestamp NULL DEFAULT NULL,
  `task_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `task_creater` varchar(40) NOT NULL,
  `task_status` int(2) NOT NULL COMMENT '1 create, 2 send, 3 agree, 4 reject, 5 modify',
  `task_content` text,
  `org_id` int(10) unsigned NOT NULL,
  `receiver` varchar(40) NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `task_creater` (`task_creater`),
  KEY `org_id` (`org_id`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `creater` FOREIGN KEY (`task_creater`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orgnization` FOREIGN KEY (`org_id`) REFERENCES `orgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiver` FOREIGN KEY (`receiver`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mainTask`
-- ----------------------------
BEGIN;
INSERT INTO `mainTask` VALUES ('1', 'test task', '2014-03-13 00:00:00', '2014-03-14 00:00:00', '2014-03-13 14:20:49', 'l.yuhai@gmail.com', '1', 'my test task', '23', 'l.yuhai@foxmail.com'), ('2', 'test task', '2014-03-13 00:00:00', '2014-03-14 00:00:00', '2014-03-13 14:21:05', 'l.yuhai@gmail.com', '1', 'my test task', '23', 'l.yuhai@foxmail.com'), ('3', 'task2', '2014-03-14 00:00:00', '2014-03-15 00:00:00', '2014-03-13 14:58:36', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('4', 'task2', '2014-03-14 00:00:00', '2014-03-15 00:00:00', '2014-03-13 14:59:59', 'l.yuhai@gmail.com', '1', '', '23', 'test3@mytest.com'), ('5', 'asdf', '2014-03-20 00:00:00', '2014-03-23 00:00:00', '2014-03-13 15:04:19', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('6', 'task2', '2014-03-14 00:00:00', '2014-03-27 00:00:00', '2014-03-13 16:24:42', 'l.yuhai@gmail.com', '1', '', '23', 'test@mytest.com'), ('7', 'ferty', '2014-03-18 00:00:00', '2014-03-24 00:00:00', '2014-03-13 16:38:29', 'l.yuhai@gmail.com', '1', '', '23', 'test3@mytest.com'), ('8', 'asfd', '2014-03-17 00:00:00', '2014-03-26 00:00:00', '2014-03-13 16:39:00', 'l.yuhai@gmail.com', '1', '', '23', 'test3@test.com'), ('9', 'wedding party', '2014-03-14 00:00:00', '2014-03-31 00:00:00', '2014-03-14 11:25:44', 'l.yuhai@gmail.com', '1', '', '24', 'l.yuhai@gmail.com'), ('10', 'wedding party', '2014-05-09 00:00:00', '2014-06-12 00:00:00', '2014-03-14 11:32:50', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('11', 'wedding party', '2014-03-14 00:00:00', '2014-03-24 00:00:00', '2014-03-14 11:35:17', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('12', 'wedding party', '2014-03-14 00:00:00', '2014-03-17 00:00:00', '2014-03-14 11:36:45', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('13', 'barbecub', '2014-03-24 00:00:00', '2014-03-25 00:00:00', '2014-03-14 11:46:40', 'l.yuhai@gmail.com', '1', 'prepare the food for barbecu', '24', 'l.yuhai@gmail.com'), ('14', 'asdf', '2014-03-23 00:00:00', '2014-03-26 00:00:00', '2014-03-14 13:30:52', 'l.yuhai@gmail.com', '1', 'asdsdfhhdgjg', '23', 'l.yuhai@gmail.com'), ('15', 'sfg', '2014-03-24 00:00:00', '2014-03-26 00:00:00', '2014-03-14 13:34:53', 'l.yuhai@gmail.com', '1', 'dfghsdfdsg', '23', 'l.yuhai@gmail.com'), ('16', 'asdf', '2014-03-26 00:00:00', '2014-03-31 00:00:00', '2014-03-14 13:36:15', 'l.yuhai@gmail.com', '1', 'sdfjhfgjgf', '23', 'l.yuhai@gmail.com'), ('17', 'ghjkfhj', '2014-03-18 00:00:00', '2014-03-27 00:00:00', '2014-03-14 13:36:37', 'l.yuhai@gmail.com', '1', 'dfghfgjhgfh', '23', 'l.yuhai@gmail.com'), ('18', 'dtdfgh', '2014-03-20 00:00:00', '2014-03-24 00:00:00', '2014-03-14 13:43:58', 'l.yuhai@gmail.com', '1', 'sdfgfghdf', '23', 'l.yuhai@gmail.com'), ('19', 'dtdfgh', '2014-03-20 00:00:00', '2014-03-24 00:00:00', '2014-03-14 13:48:07', 'l.yuhai@gmail.com', '1', 'sdfgfghdf', '23', 'l.yuhai@gmail.com'), ('20', 'dtdfgh', '2014-03-20 00:00:00', '2014-03-24 00:00:00', '2014-03-14 13:48:36', 'l.yuhai@gmail.com', '1', 'sdfgfghdf', '23', 'l.yuhai@gmail.com'), ('21', 'asdf', '2014-03-24 00:00:00', '2014-03-26 00:00:00', '2014-03-14 15:06:56', 'l.yuhai@gmail.com', '1', 'sadf', '23', 'l.yuhai@gmail.com'), ('22', 'fghercv', '2014-03-17 00:00:00', '2014-03-26 00:00:00', '2014-03-14 15:09:43', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('23', 'sdfg', '2014-03-18 00:00:00', '2014-03-28 00:00:00', '2014-03-14 15:12:40', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('24', 'sdfgds', '2014-03-24 00:00:00', '2014-03-29 00:00:00', '2014-03-14 15:37:47', 'l.yuhai@gmail.com', '1', 'dsfgdsfg', '23', 'l.yuhai@gmail.com'), ('25', 'sdfg', '2014-03-24 00:00:00', '2014-03-31 00:00:00', '2014-03-14 15:38:08', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('26', 'sdr', '2014-03-20 00:00:00', '2014-03-28 00:00:00', '2014-03-14 16:41:55', 'l.yuhai@gmail.com', '1', 'asddbfs', '23', 'l.yuhai@gmail.com'), ('27', 'asas', '2014-03-19 00:00:00', '2014-03-24 00:00:00', '2014-03-14 22:18:01', 'l.yuhai@gmail.com', '1', 'asdf', '23', 'l.yuhai@gmail.com'), ('28', 'sdfgsd', '2014-03-15 00:00:00', '2014-03-28 00:00:00', '2014-03-14 22:25:13', 'l.yuhai@gmail.com', '1', 'sdfas', '23', 'l.yuhai@gmail.com'), ('29', 'asdfsdfg', '2014-03-14 00:00:00', '2014-03-31 00:00:00', '2014-03-14 22:33:07', 'l.yuhai@gmail.com', '1', 'asdfdfgdf', '23', 'l.yuhai@gmail.com'), ('30', '读三本书', '2014-03-14 00:00:00', '2014-04-30 00:00:00', '2014-03-14 22:36:34', 'l.yuhai@gmail.com', '1', '历史，小说', '23', 'l.yuhai@gmail.com'), ('31', 'sdfgdsg', '2014-03-14 00:00:00', '2014-04-30 00:00:00', '2014-03-14 22:42:29', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('32', 'ertyry', '2014-03-14 00:00:00', '2014-03-24 00:00:00', '2014-03-14 22:45:28', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('33', 'cvzvzxcv', '2014-03-16 00:00:00', '2014-03-29 00:00:00', '2014-03-14 22:48:14', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('34', 'asdfsdfg', '2014-03-14 00:00:00', '2014-03-24 00:00:00', '2014-03-14 22:50:34', 'l.yuhai@gmail.com', '1', 'asdf', '23', 'l.yuhai@gmail.com'), ('35', 'fsadfsad', '2014-03-14 00:00:00', '2014-03-24 00:00:00', '2014-03-14 22:53:15', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('36', 'asdfas', '2014-03-19 00:00:00', '2014-03-31 00:00:00', '2014-03-14 22:56:13', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('37', 'sdfgsd', '2014-03-15 00:00:00', '2014-03-31 00:00:00', '2014-03-14 22:57:27', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('38', 'sdfgdsg', '2014-03-15 00:00:00', '2014-03-24 00:00:00', '2014-03-14 22:59:31', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('39', 'sdfgdsg', '2014-03-15 00:00:00', '2014-03-22 00:00:00', '2014-03-14 23:01:53', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('40', 'kjkg', '2014-03-15 00:00:00', '2014-03-29 00:00:00', '2014-03-14 23:04:32', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('41', 'dfghf', '2014-03-14 00:00:00', '2014-03-31 00:00:00', '2014-03-14 23:06:11', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('42', 'sdfg', '2014-03-14 00:00:00', '2015-03-14 00:00:00', '2014-03-14 23:13:03', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('43', 'tea', '2014-03-14 00:00:00', '2016-03-25 00:00:00', '2014-03-14 23:15:06', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('44', 'zdfdsfs', '2014-03-14 00:00:00', '2016-03-14 00:00:00', '2014-03-14 23:17:31', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('45', 'ZXc', '2014-03-15 00:00:00', '2017-03-08 00:00:00', '2014-03-14 23:22:20', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('46', 'asdf', '2014-03-15 00:00:00', '2019-03-13 00:00:00', '2014-03-14 23:26:42', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('47', 'dfgsd', '2014-03-17 00:00:00', '2014-03-24 00:00:00', '2014-03-15 21:25:47', 'l.yuhai@gmail.com', '1', 'sdfgsd', '23', 'l.yuhai@gmail.com'), ('48', 'gsdfgds', '2014-03-17 00:00:00', '2014-04-16 00:00:00', '2014-03-15 21:27:10', 'l.yuhai@gmail.com', '1', 'sdfgsdfg', '23', 'l.yuhai@gmail.com'), ('49', 'asdfasd', '2014-03-16 00:00:00', '2014-03-23 00:00:00', '2014-03-15 21:28:27', 'l.yuhai@gmail.com', '1', 'asdfas', '23', 'l.yuhai@gmail.com'), ('50', 'asdfasd', '2014-03-16 00:00:00', '2014-03-27 00:00:00', '2014-03-15 21:28:54', 'l.yuhai@gmail.com', '1', 'asdfasdf', '23', 'l.yuhai@gmail.com'), ('51', 'sfgdsg', '2014-03-15 00:00:00', '2014-03-24 00:00:00', '2014-03-15 21:29:36', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('52', 'sgda', '2014-03-15 00:00:00', '2014-03-24 00:00:00', '2014-03-15 21:31:45', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('53', 'sdfgsd', '2014-03-16 00:00:00', '2014-03-27 00:00:00', '2014-03-15 21:33:02', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('54', 'sdfgdsg', '2014-03-16 00:00:00', '2014-03-31 00:00:00', '2014-03-15 21:34:56', 'l.yuhai@gmail.com', '1', '', '23', 'test3@mytest.com'), ('55', 'sddfg', '2014-03-16 00:00:00', '2018-03-15 00:00:00', '2014-03-15 21:38:43', 'l.yuhai@gmail.com', '1', 'asdfas', '23', 'l.yuhai@gmail.com'), ('56', 'dhsfhsdfg', '2014-03-16 00:00:00', '2015-03-18 00:00:00', '2014-03-15 21:39:19', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('57', 'sdgfd', '2014-03-24 00:00:00', '2019-03-13 00:00:00', '2014-03-15 21:42:02', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('58', 'asef', '2014-03-16 00:00:00', '2014-03-31 00:00:00', '2014-03-15 21:47:08', 'l.yuhai@gmail.com', '1', '', '24', 'l.yuhai@gmail.com'), ('59', 'sadf', '2015-03-09 00:00:00', '2023-03-30 00:00:00', '2014-03-15 21:49:00', 'l.yuhai@gmail.com', '1', '', '23', 'l.yuhai@gmail.com'), ('60', 'asdfasd', '2014-03-16 00:00:00', '2014-03-28 00:00:00', '2014-03-15 22:21:49', 'l.yuhai@gmail.com', '1', 'asdfasd', '23', 'l.yuhai@gmail.com'), ('61', 'sdsa', '2014-03-16 00:00:00', '2014-03-30 00:00:00', '2014-03-15 22:24:56', 'l.yuhai@gmail.com', '1', 'sdfdgf', '23', 'l.yuhai@gmail.com');
COMMIT;

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
INSERT INTO `orgnization` VALUES ('22', '蓝石头', '音乐天堂', '65644888', '北京', 'www.bluestone.com', 'logo', 'tn_logo', '2014-03-12 11:42:40', '2014-03-12 11:42:40', 'nnforeign@test.com'), ('23', 'free bird', '', '', '', 'www.freebird.com', 'logo23', 'tn_logo23', '2014-02-28 17:35:45', '2014-03-02 15:43:26', 'l.yuhai@gmail.com'), ('24', '自由鸟', '', '', '', '', 'logo24', 'tn_logo24', '2014-03-12 11:51:56', '2014-03-12 11:51:56', 'l.yuhai@foxmail.com'), ('25', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 23:11:55', '2014-02-28 23:11:55', 'session@gmail.com'), ('26', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 23:14:14', '2014-02-28 23:14:14', 'session1@gmail.com'), ('27', null, null, null, null, null, 'logo', 'tn_logo', '2014-02-28 23:15:24', '2014-02-28 23:15:24', 'ningsession@gmail.com');
COMMIT;

-- ----------------------------
--  Table structure for `request_join`
-- ----------------------------
DROP TABLE IF EXISTS `request_join`;
CREATE TABLE `request_join` (
  `requester` varchar(40) NOT NULL COMMENT 'requester''s email',
  `request_org_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0: reserve, 1: create, 2: email, 3: reject, 4: pass',
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
  `sub_task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `sub_task_name` varchar(255) NOT NULL,
  `sub_task_begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sub_task_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_task_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_task_status` int(2) NOT NULL COMMENT '1 create, 2 send, 3 agree, 4 reject, 5 modify',
  `sub_task_content` text,
  `receiver` varchar(40) NOT NULL,
  `weights` int(2) NOT NULL,
  PRIMARY KEY (`sub_task_id`),
  KEY `task_id` (`task_id`),
  KEY `task_id_2` (`task_id`),
  KEY `receiver` (`receiver`),
  KEY `receiver_2` (`receiver`),
  KEY `receiver_3` (`receiver`),
  KEY `receiver_4` (`receiver`),
  CONSTRAINT `parent_task_id` FOREIGN KEY (`task_id`) REFERENCES `mainTask` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_task_receiver` FOREIGN KEY (`receiver`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `subTask`
-- ----------------------------
BEGIN;
INSERT INTO `subTask` VALUES ('1', '13', 'test task', '2014-03-13 00:00:00', '2014-03-14 16:05:29', '2014-03-14 00:00:00', '1', 'my test task', 'l.yuhai@foxmail.com', '1'), ('2', '13', 'test task', '2014-03-13 00:00:00', '2014-03-14 16:05:52', '2014-03-14 00:00:00', '1', 'my test task', 'l.yuhai@foxmail.com', '1'), ('3', '13', 'test task', '2014-03-13 00:00:00', '2014-03-14 16:11:56', '2014-03-14 00:00:00', '1', 'my test task', 'l.yuhai@foxmail.com', '1'), ('4', '26', 'asd', '2014-03-25 00:00:00', '2014-03-14 16:46:29', '2014-03-28 00:00:00', '1', 'asdfg', 'l.yuhai@gmail.com', '1'), ('5', '28', 'sdgsdfg', '2014-03-16 00:00:00', '2014-03-14 22:25:34', '2014-03-27 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('6', '29', 'dfhgf', '2014-03-19 00:00:00', '2014-03-14 22:33:44', '2014-03-31 00:00:00', '1', 'gdsgdsfg', 'ning.meng@gmail.com', '1'), ('7', '30', '世界史', '2014-03-14 00:00:00', '2014-03-14 22:37:17', '2014-03-21 00:00:00', '1', '', 'ning.meng@gmail.com', '1'), ('8', '30', '鬼吹灯', '2014-03-14 00:00:00', '2014-03-14 22:38:16', '2014-03-24 00:00:00', '1', '', 'ning.meng@gmail.com', '1'), ('9', '30', '老子', '2014-03-14 00:00:00', '2014-03-14 22:39:29', '2014-03-31 00:00:00', '1', '', 'test3@test.com', '1'), ('10', '31', 'asdfas', '2014-03-14 00:00:00', '2014-03-14 22:42:45', '2014-04-30 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('11', '31', 'asdfs', '2014-03-17 00:00:00', '2014-03-14 22:43:07', '2014-04-22 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('12', '31', '2rwr44', '2014-03-17 00:00:00', '2014-03-14 22:43:34', '2014-04-07 00:00:00', '1', 'asdfsd', 'l.yuhai@gmail.com', '1'), ('13', '31', 'knjhjh', '2014-03-16 00:00:00', '2014-03-14 22:44:26', '2014-04-15 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('14', '45', 'sdas', '2015-03-03 00:00:00', '2014-03-14 23:23:31', '2016-03-01 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('15', '45', 'asfasd', '2014-03-21 00:00:00', '2014-03-14 23:24:56', '2014-03-29 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('16', '46', 'dfthsdfg', '2014-03-15 00:00:00', '2014-03-14 23:27:33', '2017-03-17 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('17', '53', 'dga', '2014-03-16 00:00:00', '2014-03-15 21:33:26', '2014-03-27 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('18', '53', 'asdfasd', '2014-03-17 00:00:00', '2014-03-15 21:33:41', '2014-03-27 00:00:00', '1', '', 'l.yuhai@gmail.com', '1'), ('19', '56', 'sdfgdsf', '2014-03-17 00:00:00', '2014-03-15 21:39:38', '2014-04-16 00:00:00', '1', 'sdfgsd', 'l.yuhai@gmail.com', '1'), ('20', '61', 'asdfasd', '2014-03-18 00:00:00', '2014-03-15 22:25:20', '2014-03-29 00:00:00', '1', 'asdfasdf', 'test3@mytest.com', '1');
COMMIT;

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
  KEY `sub_task_receiver` (`sub_task_receiver`)
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
  CONSTRAINT `mask_task_id` FOREIGN KEY (`task_id`) REFERENCES `mainTask` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `who` FOREIGN KEY (`who`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
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
INSERT INTO `user_org` VALUES ('l.yuhai@gmail.com', '22', '2014-03-12 11:37:20'), ('l.yuhai@gmail.com', '24', '2014-03-12 11:37:52'), ('ning.meng@gmail.com', '23', '2014-03-12 10:45:40'), ('test3@mock.com', '23', '2014-03-04 12:14:42'), ('test3@mytest.com', '23', '2014-03-04 13:57:19'), ('test3@test.com', '23', '2014-03-04 13:57:31'), ('test4@mytest.com', '23', '2014-03-04 13:57:41'), ('test@mock.com', '23', '2014-03-03 22:32:29'), ('test@mytest.com', '23', '2014-03-03 22:22:26'), ('test@test.com', '23', '2014-03-03 22:10:14');
COMMIT;

-- ----------------------------
--  Table structure for `user_task`
-- ----------------------------
DROP TABLE IF EXISTS `user_task`;
CREATE TABLE `user_task` (
  `task_id` int(10) unsigned NOT NULL,
  `user_email` varchar(40) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `user_email` (`user_email`)
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
