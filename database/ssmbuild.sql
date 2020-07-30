/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : ssmbuild

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 30/07/2020 22:34:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `bookID` int(10) NOT NULL AUTO_INCREMENT COMMENT '书id',
  `bookName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `bookCounts` int(11) NOT NULL COMMENT '数量',
  `detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  INDEX `bookID`(`bookID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '思想品德', 233, '值得拥有');
INSERT INTO `books` VALUES (2, '吸星大法', 123, '从入门到入魔');
INSERT INTO `books` VALUES (3, '格林童话', 456, '真的只是童话');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0:启用  1:停用',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0:正常  1:删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '小明454444', '123456', '郑州二七区颖河路78号院', '2020-07-27 11:43:22', NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (2, 'admin', '123456', '信阳', '2010-08-08 00:00:00', NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (3, '小明11', '123456', NULL, NULL, NULL, NULL, '0', '1');
INSERT INTO `sys_user` VALUES (4, '小明12', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (5, '小明13', '123456', NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (6, '小明14', '123456', NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (7, '小明15', '123456', NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (8, '小明16', '123456', NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (9, '小明17', '123456', NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (10, '小明18', '123456', NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO `sys_user` VALUES (11, '小明19', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (12, 'admin10', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (13, '小明118', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (14, '小明128', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (15, '小明138', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (16, '小明148', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (17, '小明158', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (18, '小明168', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (19, '小明178', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (20, '小明188', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (21, '小明198', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (22, 'admin108', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (23, 'admin11110', '123456', NULL, NULL, NULL, NULL, '0', '0');
INSERT INTO `sys_user` VALUES (28, 'adasdasdasdasdasd', NULL, 'assadssas322123123', '2020-07-30 22:31:18', 'http://qe7pmfvyb.bkt.clouddn.com//FjVY8m_MTp1S2kAnduDqVwAjeMsS', 'asdadaaadadssssss', '0', '0');

SET FOREIGN_KEY_CHECKS = 1;
