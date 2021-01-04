/*
Navicat MySQL Data Transfer

Source Server         : yc
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : res

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2020-12-24 09:10:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `resadmin`
-- ----------------------------
DROP TABLE IF EXISTS `resadmin`;
CREATE TABLE `resadmin` (
  `raid` int(11) NOT NULL AUTO_INCREMENT,
  `raname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rapwd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`raid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resadmin
-- ----------------------------
INSERT INTO resadmin VALUES ('1', 'a', '123');

-- ----------------------------
-- Table structure for `resfood`
-- ----------------------------
DROP TABLE IF EXISTS `resfood`;
CREATE TABLE `resfood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `normprice` decimal(8,2) DEFAULT NULL,
  `realprice` decimal(8,2) DEFAULT NULL,
  `detail` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fphoto` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resfood
-- ----------------------------
INSERT INTO resfood VALUES ('1', '素炒莴笋丝', '22.00', '20.00', '营养丰富', '500008.jpg');
INSERT INTO resfood VALUES ('2', '蛋炒饭', '22.00', '20.00', '营养丰富', '500022.jpg');
INSERT INTO resfood VALUES ('3', '酸辣鱼', '42.00', '40.00', '营养丰富', '500023.jpg');
INSERT INTO resfood VALUES ('4', '鲁粉', '12.00', '10.00', '营养丰富', '500024.jpg');
INSERT INTO resfood VALUES ('5', '西红柿蛋汤', '12.00', '10.00', '营养丰富', '500025.jpg');
INSERT INTO resfood VALUES ('6', '炖鸡', '102.00', '100.00', '营养丰富', '500026.jpg');
INSERT INTO resfood VALUES ('7', '炒鸡', '12.00', '10.00', '营养丰富', '500033.jpg');
INSERT INTO resfood VALUES ('8', '炒饭', '12.00', '10.00', '营养丰富', '500034.jpg');
INSERT INTO resfood VALUES ('9', '手撕前女友', '12.00', '10.00', '营养丰富', '500035.jpg');
INSERT INTO resfood VALUES ('10', '面条', '12.00', '10.00', '营养丰富', '500036.jpg');
INSERT INTO resfood VALUES ('11', '端菜', '12.00', '10.00', '营养丰富', '500038.jpg');
INSERT INTO resfood VALUES ('12', '酸豆角', '12.00', '10.00', '营养丰富', '500041.jpg');

-- ----------------------------
-- Table structure for `resorder`
-- ----------------------------
DROP TABLE IF EXISTS `resorder`;
CREATE TABLE `resorder` (
  `roid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordertime` date DEFAULT NULL,
  `deliverytime` date DEFAULT NULL,
  `ps` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`roid`),
  KEY `fk_resorder` (`userid`),
  CONSTRAINT `fk_resorder` FOREIGN KEY (`userid`) REFERENCES `resuser` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resorder
-- ----------------------------
INSERT INTO resorder VALUES ('1', '1', '湖南省衡阳市', '13878789999', '2020-12-24', '2020-12-24', '送餐上门', '0');

-- ----------------------------
-- Table structure for `resorderitem`
-- ----------------------------
DROP TABLE IF EXISTS `resorderitem`;
CREATE TABLE `resorderitem` (
  `roiid` int(11) NOT NULL AUTO_INCREMENT,
  `roid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `dealprice` decimal(8,2) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`roiid`),
  KEY `fk_resorderitem_roid` (`roid`),
  KEY `fk_tbl_res_fid` (`fid`),
  CONSTRAINT `fk_tbl_res_fid` FOREIGN KEY (`fid`) REFERENCES `resfood` (`fid`),
  CONSTRAINT `fk_resorderitem_roid` FOREIGN KEY (`roid`) REFERENCES `resorder` (`roid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resorderitem
-- ----------------------------
INSERT INTO resorderitem VALUES ('1', '1', '1', '20.00', '1');
INSERT INTO resorderitem VALUES ('2', '1', '2', '20.00', '1');

-- ----------------------------
-- Table structure for `resorderitemtemp`
-- ----------------------------
DROP TABLE IF EXISTS `resorderitemtemp`;
CREATE TABLE `resorderitemtemp` (
  `roitid` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `quittime` date DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`roitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resorderitemtemp
-- ----------------------------

-- ----------------------------
-- Table structure for `resuser`
-- ----------------------------
DROP TABLE IF EXISTS `resuser`;
CREATE TABLE `resuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resuser
-- ----------------------------
INSERT INTO resuser VALUES ('1', 'a', '0cc175b9c0f1b6a831c399e269772661', 'a@163.com');
INSERT INTO resuser VALUES ('2', 'b', '0cc175b9c0f1b6a831c399e269772661', 'b@163.com');
