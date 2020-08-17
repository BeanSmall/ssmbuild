/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : ssmbuild

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-08-17 13:10:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookID` int(10) NOT NULL AUTO_INCREMENT COMMENT '书id',
  `bookName` varchar(100) NOT NULL COMMENT '书名',
  `bookCounts` int(11) NOT NULL COMMENT '数量',
  `detail` varchar(200) NOT NULL COMMENT '描述',
  KEY `bookID` (`bookID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '思想品德', '233', '值得拥有');
INSERT INTO `books` VALUES ('2', '吸星大法', '123', '从入门到入魔');
INSERT INTO `books` VALUES ('3', '格林童话', '456', '真的只是童话');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '学术部');
INSERT INTO `sys_dept` VALUES ('2', '教质部');
INSERT INTO `sys_dept` VALUES ('3', '网络部');
INSERT INTO `sys_dept` VALUES ('4', '财务部');
INSERT INTO `sys_dept` VALUES ('5', '人事部');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `content` text,
  `status` varchar(1) DEFAULT '0' COMMENT '0:启用  1:停用',
  `del_flag` varchar(1) DEFAULT '0' COMMENT '0:正常  1:删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '小明454444', '123456', '郑州二七区颖河路78号院', '2020-07-27 11:43:22', null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('2', 'admin', '123456', '信阳', '2010-08-08 00:00:00', null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('3', '小明11', '123456', null, null, null, null, '0', '1');
INSERT INTO `sys_user` VALUES ('4', '小明12', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('5', '小明13', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('6', '小明14', '123456', null, null, null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('7', '小明15', '123456', null, null, null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('8', '小明16', '123456', null, null, null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('9', '小明17', '123456', null, null, null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('10', '小明18', '123456', null, null, null, null, '1', '0');
INSERT INTO `sys_user` VALUES ('11', '小明19', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('12', 'admin10', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('13', '小明118', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('14', '小明128', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('15', '小明138', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('16', '小明148', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('17', '小明158', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('18', '小明168', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('19', '小明178', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('20', '小明188', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('21', '小明198', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('22', 'admin108', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('23', 'admin11110', '123456', null, null, null, null, '0', '0');
INSERT INTO `sys_user` VALUES ('28', 'adasdasdasdasdasd', null, 'assadssas322123123', '2020-07-30 22:31:18', 'http://qe7pmfvyb.bkt.clouddn.com//FjVY8m_MTp1S2kAnduDqVwAjeMsS', 'asdadaaadadssssss', '0', '0');
