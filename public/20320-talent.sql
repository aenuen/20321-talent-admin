/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : 20320-talent

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-08-23 17:47:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aa_salary
-- ----------------------------
DROP TABLE IF EXISTS `aa_salary`;
CREATE TABLE `aa_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isUse` tinyint(4) DEFAULT '1',
  `company` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `department` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `team` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `basePay` decimal(10,2) DEFAULT '0.00',
  `meritPay` decimal(10,2) DEFAULT '0.00',
  `myPension` decimal(10,2) DEFAULT '0.00',
  `unPension` decimal(10,2) DEFAULT '0.00',
  `myUnemployment` decimal(10,2) DEFAULT '0.00',
  `unUnemployment` decimal(10,2) DEFAULT '0.00',
  `unInjury` decimal(10,2) DEFAULT '0.00',
  `unBirth` decimal(10,2) DEFAULT '0.00',
  `myMedicalCare` decimal(10,2) DEFAULT '0.00',
  `unMedicalCare` decimal(10,2) DEFAULT '0.00',
  `myAccumulationFund` decimal(10,2) DEFAULT '0.00',
  `unAccumulationFund` decimal(10,2) DEFAULT '0.00',
  `assessment` decimal(10,2) DEFAULT '0.00' COMMENT '考核',
  `days` decimal(10,2) DEFAULT '0.00' COMMENT '天数',
  `deduct` decimal(10,2) DEFAULT '0.00' COMMENT '扣款',
  `subsidy` decimal(10,2) DEFAULT '0.00' COMMENT '补贴',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aa_salary
-- ----------------------------
INSERT INTO `aa_salary` VALUES ('5', '1', '兴晨', '张锦', '研发', 'RD03', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('6', '1', '兴晨', '李涵岳', '研发', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('3', '1', '兴晨', '张希文', '研发', 'RD03', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('4', '1', '兴晨', '陈燊', '研发', 'RD01', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('7', '1', '兴晨', '刘明星', '研发', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('8', '1', '兴晨', '刘明燕', '研发', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('9', '1', '兴晨', '黄晓', '研发', 'RD01', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('10', '1', '兴晨', '杨桢', '研发', 'RD04', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('11', '1', '兴晨', '周忠琼', '研发', 'RD04', '3500.00', '3000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('12', '1', '尚德', '吴志杰', '研发', 'RD06', '3500.00', '1500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('13', '1', '尚德', '吴晓岩', '研发', 'RD09', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('14', '1', '尚德', '贾鑫', '研发', 'RD06', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('15', '1', '尚德', '陈惠芳', '管理组', '管理组', '3500.00', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('16', '1', '尚德', '王恒东', '管理组', '管理组', '3500.00', '3000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('17', '1', '尚德', '陈艳珍', '管理组', '管理组', '3500.00', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('18', '1', '尚德', '朱彬', '管理组', '管理组', '3500.00', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('19', '1', '尚德', '纪家墙', '研发', 'RD08', '3500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('20', '1', '尚德', '钱文娟', '研发', 'RD08', '3500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('21', '1', '尚德', '范嫩平', '研发', 'RD05', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('22', '1', '尚德', '杨赛影', '管理组', '管理组', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('23', '1', '尚德', '刘涛', '管理组', '管理组', '3500.00', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('24', '1', '尚德', '鲁容英', '研发', 'RD08', '3500.00', '3000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('25', '1', '尚德', '周琴珍', '研发', 'RD09', '3500.00', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('26', '1', '露申', '吴强', '研发', 'RD05', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('27', '1', '露申', '关艳琳', '研发', 'RD08', '3500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('28', '1', '露申', '郑淑金', '研发', 'RD08', '3500.00', '4000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('29', '1', '露申', '陈爱娟', '研发', 'RD08', '3500.00', '4000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('30', '1', '露申', '刘康诗', '研发', 'RD06', '3500.00', '1500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('31', '1', '逸嘉', '刘燕航', '研发', 'RD01', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('32', '1', '露申', '彭佳盛', '研发', 'RD08', '3500.00', '4000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('33', '1', '露申', '杨巧玲', '研发', 'RD07', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('34', '1', '露申', '胡克勋', '研发', 'RD08', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('35', '1', '露申', '何晓东', '研发', 'RD07', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('36', '1', '逸嘉', '张开亮', '研发', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('37', '1', '露申', '黄玉', '研发', 'RD06', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('38', '1', '露申', '阮丽', '研发', 'RD05', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('39', '1', '兴晨', '苏宇', '研发', 'RD04', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('40', '1', '兴晨', '胡晓芬', '研发', 'RD04', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('41', '1', '兴晨', '黄晶', '研发', 'RD04', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('42', '1', '兴晨', '刘康诗', '研发', 'RD04', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('43', '1', '兴晨', '连国林', '研发', 'RD01', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('44', '1', '兴晨', '韩山国', '研发', '行政人员', '3500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('45', '1', '露申', '刘明芳', '管理组', '', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('48', '1', '露申', '高中显', '研发', 'RD06', '3500.00', '2500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('47', '1', '露申', '龙庆波', '研发', 'RD05', '3500.00', '4000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('46', '1', '露申', '胡宏杰', '研发', 'RD05', '3500.00', '4000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('49', '1', '露申', '罗财火', '研发', 'RD06', '3500.00', '2500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('50', '1', '露申', '陈峰', '研发', 'RD07', '3500.00', '6500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('51', '1', '露申', '陈游芳', '研发', 'RD07', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('52', '1', '露申', '胡明生', '研发', 'RD07', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('53', '1', '露申', '苏宇', '研发', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('54', '1', '露申', '吴晓妍', '研发', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('55', '1', '露申', '刘涛', '研发', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('56', '1', '尚德', '赵剑良', '研发', 'RD04', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('57', '1', '尚德', '刘明芳', '研发', 'RD06', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('58', '1', '律所', '孙东晖', '', '', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('59', '1', '律所', '许永云', '', '', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('60', '1', '律所', '郑晓萍', '', '', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('61', '1', '律所', '郭锦标', '', '', '3500.00', '5500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('62', '1', '律所', '郑运达', '', '', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('63', '1', '律所', '叶文', '', '', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('64', '1', '律所', '黄其善', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('65', '1', '律所', '吴晓妍', '', '', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('66', '1', '律所', '刘明芳', '管理组', '', '3500.00', '1500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('67', '1', '尚德', '傅如寄', '研发', 'RD07', '3500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('72', '1', '尚德', '刘明燕', '管理组', '管理组', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('68', '1', '鑫焱', '池心淼', '研发', 'RD01', '3500.00', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('69', '1', '逸嘉', '张希文', '研发', 'RD01', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('70', '1', '逸嘉', '张锦', '研发', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('71', '1', '逸嘉', '杨桢', '研发', 'RD03', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('73', '1', '尚德', '郑运达', '研发', 'RD09', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('74', '1', '尚德', '李涵岳', '研发', 'RD07', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('75', '1', '居乐', '叶文', '律师组', 'RD01', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('76', '1', '居乐', '郭锦标', '律师组', 'RD01', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('77', '1', '居乐', '许永云', '律师组', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('78', '1', '居乐', '吴晓妍', '律师组', 'RD02', '3500.00', '1500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('79', '1', '兴晨', '何晓东', '研发', 'RD03', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('80', '1', '逸嘉', '石志辉', '研发', 'RD04', '3500.00', '1500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('81', '1', '居乐', '洪德文', '律师组', 'RD01', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('83', '1', '居乐', '关怀', '律师组', 'RD02', '3500.00', '4500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0.00', null);
INSERT INTO `aa_salary` VALUES ('84', '1', '居乐', '梁泓燕', '律师组', 'RD02', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for aa_salary_month
-- ----------------------------
DROP TABLE IF EXISTS `aa_salary_month`;
CREATE TABLE `aa_salary_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `name` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `department` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `team` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `basePay` decimal(10,2) DEFAULT '0.00',
  `meritPay` decimal(10,2) DEFAULT '0.00',
  `myPension` decimal(10,2) DEFAULT '0.00',
  `unPension` decimal(10,2) DEFAULT '0.00',
  `myUnemployment` decimal(10,2) DEFAULT '0.00',
  `unUnemployment` decimal(10,2) DEFAULT '0.00',
  `unInjury` decimal(10,2) DEFAULT '0.00',
  `unBirth` decimal(10,2) DEFAULT '0.00',
  `myMedicalCare` decimal(10,2) DEFAULT '0.00',
  `unMedicalCare` decimal(10,2) DEFAULT '0.00',
  `myAccumulationFund` decimal(10,2) DEFAULT '0.00',
  `unAccumulationFund` decimal(10,2) DEFAULT '0.00',
  `assessment` decimal(10,2) DEFAULT '0.00',
  `days` decimal(10,2) DEFAULT '0.00',
  `deduct` decimal(10,2) DEFAULT '0.00',
  `subsidy` decimal(10,2) DEFAULT '0.00',
  `myIncomeTax` decimal(10,2) DEFAULT '0.00',
  `yearMonth` varchar(7) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1333 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aa_salary_month
-- ----------------------------

-- ----------------------------
-- Table structure for aa_user
-- ----------------------------
DROP TABLE IF EXISTS `aa_user`;
CREATE TABLE `aa_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isUse` tinyint(4) DEFAULT '1',
  `isAdmin` tinyint(4) DEFAULT '0',
  `isFirst` tinyint(4) DEFAULT '1',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `petName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `roles` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `introduction` text COLLATE utf8_unicode_ci,
  `created` int(10) DEFAULT NULL,
  `createYear` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createYearMonth` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDatetime` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aa_user
-- ----------------------------
INSERT INTO `aa_user` VALUES ('1', '1', '1', '0', 'admin', 'e2b183463c56aaafee6825d2acb0a69e', 'aenuen', '石志辉', 'aenuen@qq.com', '13055297726', '/avatar/constant/1.jpg', 'admin', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:14');
INSERT INTO `aa_user` VALUES ('2', '1', '1', '1', 'nickach', '1d819b72308b99e88343f63aef8848ff', 'nick', '吴晓岩', 'nickach@163.com', '15950996098', '/avatar/constant/1.jpg', 'manager', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:19');
INSERT INTO `aa_user` VALUES ('3', '1', '1', '1', 'xuyongyun', '356ef4100dabfa157604e66520605223', 'xiaoxu', '许永云', 'xyy205@126.com', '13328277245', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:22');
INSERT INTO `aa_user` VALUES ('4', '1', '1', '1', 'guojinbiao', '7f26b8bb416f57380363f90d0b52fd94', '123456', '郭锦标', 'gjb@qq.com', '13877777777', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:25');
INSERT INTO `aa_user` VALUES ('5', '1', '1', '1', 'zhengyunda', '7f26b8bb416f57380363f90d0b52fd94', '123456', '郑运达', 'zyd@qq.com', '13766666666', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:28');
INSERT INTO `aa_user` VALUES ('6', '1', '1', '1', 'yewen', '28bd13a24fcd46014591fd76793f11f2', '1234567', '叶文', '13705003343@139.com', '13705003343', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:31');
INSERT INTO `aa_user` VALUES ('7', '1', '1', '1', 'huangqishan', '7f26b8bb416f57380363f90d0b52fd94', 'hqs', '黄其善', 'hqs@qq.com', '15222222222', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:34');
INSERT INTO `aa_user` VALUES ('8', '1', '1', '1', 'wuxiaoyan', '7f26b8bb416f57380363f90d0b52fd94', 'xiaoyan', '吴晓妍', 'wxy@qq.com', '18974561232', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:37');
INSERT INTO `aa_user` VALUES ('9', '1', '1', '1', 'lining', 'e2b183463c56aaafee6825d2acb0a69e', 'lining', '李宁', 'lining@qq.com', '13348271948', '/avatar/constant/1.jpg', 'manager', '这家伙很懒，什么都没有写', '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:40');
INSERT INTO `aa_user` VALUES ('10', '1', '1', '1', 'hongdewen', '7f26b8bb416f57380363f90d0b52fd94', 'hongdewen', '洪德文', 'fzkrseed@126.com', '18006925055', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:43');
INSERT INTO `aa_user` VALUES ('11', '1', '1', '1', 'guanhuai', '7f26b8bb416f57380363f90d0b52fd94', '关怀', '关怀', 'guanhuai@qq.com', '13055555555', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:46');

-- ----------------------------
-- Table structure for aa_user_avatar
-- ----------------------------
DROP TABLE IF EXISTS `aa_user_avatar`;
CREATE TABLE `aa_user_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aa_user_avatar
-- ----------------------------

-- ----------------------------
-- Table structure for aa_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `aa_user_copy`;
CREATE TABLE `aa_user_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isUse` tinyint(4) DEFAULT '1',
  `isAdmin` tinyint(4) DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `petName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `roles` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `introduction` text COLLATE utf8_unicode_ci,
  `created` int(10) DEFAULT NULL,
  `createYear` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createYearMonth` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `createDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aa_user_copy
-- ----------------------------
INSERT INTO `aa_user_copy` VALUES ('1', '1', '1', 'admin', 'e2b183463c56aaafee6825d2acb0a69e', 'aenuen', '石志辉', 'aenuen@qq.com', '13055297726', '/avatar/constant/1.jpg', 'admin', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:14');
INSERT INTO `aa_user_copy` VALUES ('2', '1', '1', 'nickach', '1d819b72308b99e88343f63aef8848ff', 'nick', '吴晓岩', 'nickach@163.com', '15950996098', '/avatar/constant/1.jpg', 'manager', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:19');
INSERT INTO `aa_user_copy` VALUES ('3', '1', '1', 'xuyongyun', '356ef4100dabfa157604e66520605223', 'xiaoxu', '许永云', 'xyy205@126.com', '13328277245', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:22');
INSERT INTO `aa_user_copy` VALUES ('4', '1', '1', 'guojinbiao', '7f26b8bb416f57380363f90d0b52fd94', '123456', '郭锦标', 'gjb@qq.com', '13877777777', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:25');
INSERT INTO `aa_user_copy` VALUES ('5', '1', '1', 'zhengyunda', '7f26b8bb416f57380363f90d0b52fd94', '123456', '郑运达', 'zyd@qq.com', '13766666666', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:28');
INSERT INTO `aa_user_copy` VALUES ('6', '1', '1', 'yewen', '28bd13a24fcd46014591fd76793f11f2', '1234567', '叶文', '13705003343@139.com', '13705003343', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:31');
INSERT INTO `aa_user_copy` VALUES ('7', '1', '1', 'huangqishan', '7f26b8bb416f57380363f90d0b52fd94', 'hqs', '黄其善', 'hqs@qq.com', '15222222222', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:34');
INSERT INTO `aa_user_copy` VALUES ('8', '1', '1', 'wuxiaoyan', '7f26b8bb416f57380363f90d0b52fd94', 'xiaoyan', '吴晓妍', 'wxy@qq.com', '18974561232', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:37');
INSERT INTO `aa_user_copy` VALUES ('9', '1', '1', 'lining', 'e2b183463c56aaafee6825d2acb0a69e', 'lining', '李宁', 'lining@qq.com', '13348271948', '/avatar/constant/1.jpg', 'manager', '这家伙很懒，什么都没有写', '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:40');
INSERT INTO `aa_user_copy` VALUES ('10', '1', '1', 'hongdewen', '7f26b8bb416f57380363f90d0b52fd94', 'hongdewen', '洪德文', 'fzkrseed@126.com', '18006925055', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:43');
INSERT INTO `aa_user_copy` VALUES ('11', '1', '1', 'guanhuai', '7f26b8bb416f57380363f90d0b52fd94', '关怀', '关怀', 'guanhuai@qq.com', '13055555555', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:46');
INSERT INTO `aa_user_copy` VALUES ('12', '1', '1', 'aalhy', '7f26b8bb416f57380363f90d0b52fd94', 'aalhy', '梁泓燕', 'aalhy@qq.com', '15677777777', '/avatar/constant/1.jpg', 'lawyer', null, '1659456000', '2022', '2022-08', '2022-08-03', '2022-08-03 15:18:50');
