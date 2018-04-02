/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50505
Source Host           : 192.168.1.185:3306
Source Database       : ht-memorial

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-24 16:32:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_ad
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad`;
CREATE TABLE `tp_ad` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '广告索引id',
  `position_id` int(10) NOT NULL COMMENT '广告位id',
  `name` varchar(255) NOT NULL COMMENT '广告名称',
  `url` varchar(255) NOT NULL DEFAULT 'javascript:;' COMMENT 'url地址',
  `path` varchar(255) NOT NULL COMMENT '图片路径',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='andy - 广告表';

-- ----------------------------
-- Records of tp_ad
-- ----------------------------
INSERT INTO `tp_ad` VALUES ('3', '2', '广告1', '', '/static/upload/picture/20170619/477c779ca6a7727926194915cadd8b0c.jpg', '2012-05-18', '2017-05-26', '1', '0', '2147483647');
INSERT INTO `tp_ad` VALUES ('4', '9', '反反复复', '', '/static/upload/daa9da6eb0a5d184/91942d378bdcd7ba.jpg', '2017-05-18', '2017-06-18', '1', '0', '2147483647');
INSERT INTO `tp_ad` VALUES ('5', '2', '阿达大asda', 'javascript:;', '', '0000-00-00', '0000-00-00', '0', '0', '1495510757');
INSERT INTO `tp_ad` VALUES ('6', '1', 'aaaaaaaaaaaaaaaa', 'javascript:;', '/static/upload/picture/20170607/2d4fea82dcb51bc7d0f08f428b105f66.jpg', '0000-00-00', '0000-00-00', '0', '0', '1496719157');
INSERT INTO `tp_ad` VALUES ('7', '3', '广告1', 'javascript:;', '/static/upload/picture/20170628/3726310d4ea852388a55b509595cfef8.jpg', '2017-06-20', '2018-06-23', '1', '0', '1497940397');
INSERT INTO `tp_ad` VALUES ('8', '4', '广告1', 'javascript:;', '/static/upload/picture/20170628/4bf0ce094c1323462f06672981db00cd.jpg', '2017-06-20', '2018-06-20', '1', '0', '1497940802');
INSERT INTO `tp_ad` VALUES ('9', '5', '广告1', 'javascript:;', '/static/upload/picture/20170628/20bb6c7766e9c95f5611d52db78a42c8.jpg', '2017-06-20', '2018-06-20', '1', '0', '1497941121');
INSERT INTO `tp_ad` VALUES ('10', '6', '广告1', 'javascript:;', '/static/upload/picture/20170628/d8dac09b7599a856996570347305f86f.jpg', '2017-06-20', '2018-05-20', '1', '0', '1497941175');
INSERT INTO `tp_ad` VALUES ('11', '7', '广告1', 'javascript:;', '/static/upload/picture/20170628/0238c7ba8065509f816faf49a5abd801.jpg', '2017-06-20', '2018-06-20', '1', '0', '1497941428');
INSERT INTO `tp_ad` VALUES ('12', '8', '广告1', 'javascript:;', '/static/upload/picture/20170628/38c293fc35b0bd99a4d3a703cbe6b5d3.jpg', '2017-06-20', '2018-06-20', '1', '0', '1497941446');
INSERT INTO `tp_ad` VALUES ('13', '9', '广告1', 'javascript:;', '/static/upload/picture/20170719/15a3fb5ca271ee3d680febeb82c8fcc5.jpg', '2017-07-19', '2023-07-21', '1', '0', '1500447019');
INSERT INTO `tp_ad` VALUES ('14', '10', '广告1', 'javascript:;', '/static/upload/picture/20170719/732f2284a7a580e8cedfcf6fb36cb1a1.jpg', '2017-07-03', '2023-07-21', '1', '0', '1500447453');

-- ----------------------------
-- Table structure for tp_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad_position`;
CREATE TABLE `tp_ad_position` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT COMMENT '广告位索引id',
  `position` varchar(255) NOT NULL COMMENT '广告位置',
  `width` int(10) DEFAULT NULL COMMENT '图片宽度',
  `height` int(10) DEFAULT NULL COMMENT '图片高度',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '广告位状态 1 启用 0 禁用',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '广告位排序',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='andy - 广告位表';

-- ----------------------------
-- Records of tp_ad_position
-- ----------------------------
INSERT INTO `tp_ad_position` VALUES ('1', '顶部广告', '1024', '680', '1', '0', '2147483647');
INSERT INTO `tp_ad_position` VALUES ('2', '底部广告', '600', '200', '1', '0', '2147483647');
INSERT INTO `tp_ad_position` VALUES ('3', '资讯首页右侧', '308', '258', '1', '0', '1497939984');
INSERT INTO `tp_ad_position` VALUES ('4', '资讯首页底部横幅', '1411', '208', '1', '0', '1497940054');
INSERT INTO `tp_ad_position` VALUES ('5', '资讯列表页顶部横幅', '1411', '208', '1', '0', '1497940109');
INSERT INTO `tp_ad_position` VALUES ('6', '资讯列表页左侧', '266', '119', '1', '0', '1497940151');
INSERT INTO `tp_ad_position` VALUES ('7', '资讯详情页顶部横幅', '1411', '208', '1', '0', '1497940236');
INSERT INTO `tp_ad_position` VALUES ('8', '资讯详情页左侧', '266', '119', '1', '0', '1497940254');
INSERT INTO `tp_ad_position` VALUES ('9', '私人纪念馆频道页右下角', '351', '351', '1', '0', '1500446972');
INSERT INTO `tp_ad_position` VALUES ('10', '私人纪念馆频道页顶部', '1170', '350', '1', '0', '1500447435');

-- ----------------------------
-- Table structure for tp_area
-- ----------------------------
DROP TABLE IF EXISTS `tp_area`;
CREATE TABLE `tp_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  `area_region` varchar(3) DEFAULT NULL COMMENT '大区名称',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45073 DEFAULT CHARSET=utf8 COMMENT='andy - 地区表';

-- ----------------------------
-- Records of tp_area
-- ----------------------------
INSERT INTO `tp_area` VALUES ('1', '北京', '0', '0', '1', '华北');
INSERT INTO `tp_area` VALUES ('2', '天津', '0', '0', '1', '华北');
INSERT INTO `tp_area` VALUES ('3', '河北', '0', '0', '1', '华北');
INSERT INTO `tp_area` VALUES ('4', '山西', '0', '0', '1', '华北');
INSERT INTO `tp_area` VALUES ('5', '内蒙古', '0', '0', '1', '华北');
INSERT INTO `tp_area` VALUES ('6', '辽宁', '0', '0', '1', '东北');
INSERT INTO `tp_area` VALUES ('7', '吉林', '0', '0', '1', '东北');
INSERT INTO `tp_area` VALUES ('8', '黑龙江', '0', '0', '1', '东北');
INSERT INTO `tp_area` VALUES ('9', '上海', '0', '0', '1', '华东');
INSERT INTO `tp_area` VALUES ('10', '江苏', '0', '0', '1', '华东');
INSERT INTO `tp_area` VALUES ('11', '浙江', '0', '0', '1', '华东');
INSERT INTO `tp_area` VALUES ('12', '安徽', '0', '0', '1', '华东');
INSERT INTO `tp_area` VALUES ('13', '福建', '0', '0', '1', '华南');
INSERT INTO `tp_area` VALUES ('14', '江西', '0', '0', '1', '华东');
INSERT INTO `tp_area` VALUES ('15', '山东', '0', '0', '1', '华东');
INSERT INTO `tp_area` VALUES ('16', '河南', '0', '0', '1', '华中');
INSERT INTO `tp_area` VALUES ('17', '湖北', '0', '0', '1', '华中');
INSERT INTO `tp_area` VALUES ('18', '湖南', '0', '0', '1', '华中');
INSERT INTO `tp_area` VALUES ('19', '广东', '0', '0', '1', '华南');
INSERT INTO `tp_area` VALUES ('20', '广西', '0', '0', '1', '华南');
INSERT INTO `tp_area` VALUES ('21', '海南', '0', '0', '1', '华南');
INSERT INTO `tp_area` VALUES ('22', '重庆', '0', '0', '1', '西南');
INSERT INTO `tp_area` VALUES ('23', '四川', '0', '0', '1', '西南');
INSERT INTO `tp_area` VALUES ('24', '贵州', '0', '0', '1', '西南');
INSERT INTO `tp_area` VALUES ('25', '云南', '0', '0', '1', '西南');
INSERT INTO `tp_area` VALUES ('26', '西藏', '0', '0', '1', '西南');
INSERT INTO `tp_area` VALUES ('27', '陕西', '0', '0', '1', '西北');
INSERT INTO `tp_area` VALUES ('28', '甘肃', '0', '0', '1', '西北');
INSERT INTO `tp_area` VALUES ('29', '青海', '0', '0', '1', '西北');
INSERT INTO `tp_area` VALUES ('30', '宁夏', '0', '0', '1', '西北');
INSERT INTO `tp_area` VALUES ('31', '新疆', '0', '0', '1', '西北');
INSERT INTO `tp_area` VALUES ('32', '台湾', '0', '0', '1', '港澳台');
INSERT INTO `tp_area` VALUES ('33', '香港', '0', '0', '1', '港澳台');
INSERT INTO `tp_area` VALUES ('34', '澳门', '0', '0', '1', '港澳台');
INSERT INTO `tp_area` VALUES ('35', '海外', '0', '0', '1', '海外');
INSERT INTO `tp_area` VALUES ('36', '北京市', '1', '0', '2', null);
INSERT INTO `tp_area` VALUES ('37', '东城区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('38', '西城区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('39', '上海市', '9', '0', '2', null);
INSERT INTO `tp_area` VALUES ('40', '天津市', '2', '0', '2', null);
INSERT INTO `tp_area` VALUES ('41', '朝阳区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('42', '丰台区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('43', '石景山区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('44', '海淀区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('45', '门头沟区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('46', '房山区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('47', '通州区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('48', '顺义区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('49', '昌平区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('50', '大兴区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('51', '怀柔区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('52', '平谷区', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('53', '密云县', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('54', '延庆县', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('55', '和平区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('56', '河东区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('57', '河西区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('58', '南开区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('59', '河北区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('60', '红桥区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('61', '塘沽区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('62', '重庆市', '22', '0', '2', null);
INSERT INTO `tp_area` VALUES ('64', '东丽区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('65', '西青区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('66', '津南区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('67', '北辰区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('68', '武清区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('69', '宝坻区', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('70', '宁河县', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('71', '静海县', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('72', '蓟县', '40', '0', '3', null);
INSERT INTO `tp_area` VALUES ('73', '石家庄市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('74', '唐山市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('75', '秦皇岛市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('76', '邯郸市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('77', '邢台市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('78', '保定市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('79', '张家口市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('80', '承德市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('81', '衡水市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('82', '廊坊市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('83', '沧州市', '3', '0', '2', null);
INSERT INTO `tp_area` VALUES ('84', '太原市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('85', '大同市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('86', '阳泉市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('87', '长治市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('88', '晋城市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('89', '朔州市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('90', '晋中市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('91', '运城市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('92', '忻州市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('93', '临汾市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('94', '吕梁市', '4', '0', '2', null);
INSERT INTO `tp_area` VALUES ('95', '呼和浩特市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('96', '包头市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('97', '乌海市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('98', '赤峰市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('99', '通辽市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('100', '鄂尔多斯市', '5', '55', '2', null);
INSERT INTO `tp_area` VALUES ('101', '呼伦贝尔市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('102', '巴彦淖尔市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('103', '乌兰察布市', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('104', '兴安盟', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('105', '锡林郭勒盟', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('106', '阿拉善盟', '5', '0', '2', null);
INSERT INTO `tp_area` VALUES ('107', '沈阳市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('108', '大连市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('109', '鞍山市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('110', '抚顺市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('111', '本溪市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('112', '丹东市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('113', '锦州市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('114', '营口市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('115', '阜新市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('116', '辽阳市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('117', '盘锦市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('118', '铁岭市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('119', '朝阳市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('120', '葫芦岛市', '6', '0', '2', null);
INSERT INTO `tp_area` VALUES ('121', '长春市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('122', '吉林市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('123', '四平市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('124', '辽源市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('125', '通化市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('126', '白山市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('127', '松原市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('128', '白城市', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('129', '延边朝鲜族自治州', '7', '0', '2', null);
INSERT INTO `tp_area` VALUES ('130', '哈尔滨市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('131', '齐齐哈尔市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('132', '鸡西市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('133', '鹤岗市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('134', '双鸭山市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('135', '大庆市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('136', '伊春市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('137', '佳木斯市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('138', '七台河市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('139', '牡丹江市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('140', '黑河市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('141', '绥化市', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('142', '大兴安岭地区', '8', '0', '2', null);
INSERT INTO `tp_area` VALUES ('143', '黄浦区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('144', '卢湾区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('145', '徐汇区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('146', '长宁区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('147', '静安区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('148', '普陀区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('149', '闸北区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('150', '虹口区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('151', '杨浦区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('152', '闵行区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('153', '宝山区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('154', '嘉定区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('155', '浦东新区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('156', '金山区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('157', '松江区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('158', '青浦区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('159', '南汇区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('160', '奉贤区', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('161', '崇明县', '39', '0', '3', null);
INSERT INTO `tp_area` VALUES ('162', '南京市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('163', '无锡市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('164', '徐州市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('165', '常州市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('166', '苏州市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('167', '南通市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('168', '连云港市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('169', '淮安市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('170', '盐城市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('171', '扬州市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('172', '镇江市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('173', '泰州市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('174', '宿迁市', '10', '0', '2', null);
INSERT INTO `tp_area` VALUES ('175', '杭州市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('176', '宁波市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('177', '温州市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('178', '嘉兴市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('179', '湖州市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('180', '绍兴市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('181', '舟山市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('182', '衢州市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('183', '金华市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('184', '台州市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('185', '丽水市', '11', '0', '2', null);
INSERT INTO `tp_area` VALUES ('186', '合肥市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('187', '芜湖市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('188', '蚌埠市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('189', '淮南市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('190', '马鞍山市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('191', '淮北市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('192', '铜陵市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('193', '安庆市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('194', '黄山市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('195', '滁州市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('196', '阜阳市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('197', '宿州市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('198', '巢湖市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('199', '六安市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('200', '亳州市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('201', '池州市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('202', '宣城市', '12', '0', '2', null);
INSERT INTO `tp_area` VALUES ('203', '福州市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('204', '厦门市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('205', '莆田市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('206', '三明市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('207', '泉州市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('208', '漳州市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('209', '南平市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('210', '龙岩市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('211', '宁德市', '13', '0', '2', null);
INSERT INTO `tp_area` VALUES ('212', '南昌市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('213', '景德镇市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('214', '萍乡市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('215', '九江市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('216', '新余市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('217', '鹰潭市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('218', '赣州市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('219', '吉安市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('220', '宜春市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('221', '抚州市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('222', '上饶市', '14', '0', '2', null);
INSERT INTO `tp_area` VALUES ('223', '济南市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('224', '青岛市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('225', '淄博市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('226', '枣庄市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('227', '东营市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('228', '烟台市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('229', '潍坊市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('230', '济宁市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('231', '泰安市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('232', '威海市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('233', '日照市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('234', '莱芜市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('235', '临沂市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('236', '德州市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('237', '聊城市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('238', '滨州市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('239', '菏泽市', '15', '0', '2', null);
INSERT INTO `tp_area` VALUES ('240', '郑州市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('241', '开封市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('242', '洛阳市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('243', '平顶山市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('244', '安阳市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('245', '鹤壁市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('246', '新乡市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('247', '焦作市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('248', '濮阳市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('249', '许昌市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('250', '漯河市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('251', '三门峡市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('252', '南阳市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('253', '商丘市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('254', '信阳市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('255', '周口市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('256', '驻马店市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('257', '济源市', '16', '0', '2', null);
INSERT INTO `tp_area` VALUES ('258', '武汉市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('259', '黄石市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('260', '十堰市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('261', '宜昌市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('262', '襄樊市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('263', '鄂州市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('264', '荆门市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('265', '孝感市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('266', '荆州市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('267', '黄冈市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('268', '咸宁市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('269', '随州市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('270', '恩施土家族苗族自治州', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('271', '仙桃市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('272', '潜江市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('273', '天门市', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('274', '神农架林区', '17', '0', '2', null);
INSERT INTO `tp_area` VALUES ('275', '长沙市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('276', '株洲市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('277', '湘潭市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('278', '衡阳市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('279', '邵阳市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('280', '岳阳市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('281', '常德市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('282', '张家界市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('283', '益阳市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('284', '郴州市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('285', '永州市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('286', '怀化市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('287', '娄底市', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('288', '湘西土家族苗族自治州', '18', '0', '2', null);
INSERT INTO `tp_area` VALUES ('289', '广州市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('290', '韶关市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('291', '深圳市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('292', '珠海市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('293', '汕头市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('294', '佛山市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('295', '江门市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('296', '湛江市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('297', '茂名市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('298', '肇庆市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('299', '惠州市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('300', '梅州市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('301', '汕尾市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('302', '河源市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('303', '阳江市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('304', '清远市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('305', '东莞市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('306', '中山市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('307', '潮州市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('308', '揭阳市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('309', '云浮市', '19', '0', '2', null);
INSERT INTO `tp_area` VALUES ('310', '南宁市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('311', '柳州市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('312', '桂林市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('313', '梧州市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('314', '北海市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('315', '防城港市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('316', '钦州市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('317', '贵港市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('318', '玉林市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('319', '百色市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('320', '贺州市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('321', '河池市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('322', '来宾市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('323', '崇左市', '20', '0', '2', null);
INSERT INTO `tp_area` VALUES ('324', '海口市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('325', '三亚市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('326', '五指山市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('327', '琼海市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('328', '儋州市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('329', '文昌市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('330', '万宁市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('331', '东方市', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('332', '定安县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('333', '屯昌县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('334', '澄迈县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('335', '临高县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('336', '白沙黎族自治县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('337', '昌江黎族自治县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('338', '乐东黎族自治县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('339', '陵水黎族自治县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('340', '保亭黎族苗族自治县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('341', '琼中黎族苗族自治县', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('342', '西沙群岛', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('343', '南沙群岛', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('344', '中沙群岛的岛礁及其海域', '21', '0', '2', null);
INSERT INTO `tp_area` VALUES ('345', '万州区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('346', '涪陵区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('347', '渝中区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('348', '大渡口区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('349', '江北区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('350', '沙坪坝区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('351', '九龙坡区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('352', '南岸区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('353', '北碚区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('354', '双桥区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('355', '万盛区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('356', '渝北区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('357', '巴南区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('358', '黔江区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('359', '长寿区', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('360', '綦江县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('361', '潼南县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('362', '铜梁县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('363', '大足县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('364', '荣昌县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('365', '璧山县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('366', '梁平县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('367', '城口县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('368', '丰都县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('369', '垫江县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('370', '武隆县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('371', '忠县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('372', '开县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('373', '云阳县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('374', '奉节县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('375', '巫山县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('376', '巫溪县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('377', '石柱土家族自治县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('378', '秀山土家族苗族自治县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('379', '酉阳土家族苗族自治县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('380', '彭水苗族土家族自治县', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('381', '江津市', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('382', '合川市', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('383', '永川市', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('384', '南川市', '62', '0', '3', null);
INSERT INTO `tp_area` VALUES ('385', '成都市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('386', '自贡市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('387', '攀枝花市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('388', '泸州市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('389', '德阳市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('390', '绵阳市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('391', '广元市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('392', '遂宁市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('393', '内江市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('394', '乐山市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('395', '南充市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('396', '眉山市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('397', '宜宾市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('398', '广安市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('399', '达州市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('400', '雅安市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('401', '巴中市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('402', '资阳市', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('403', '阿坝藏族羌族自治州', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('404', '甘孜藏族自治州', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('405', '凉山彝族自治州', '23', '0', '2', null);
INSERT INTO `tp_area` VALUES ('406', '贵阳市', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('407', '六盘水市', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('408', '遵义市', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('409', '安顺市', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('410', '铜仁地区', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('411', '黔西南布依族苗族自治州', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('412', '毕节地区', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('413', '黔东南苗族侗族自治州', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('414', '黔南布依族苗族自治州', '24', '0', '2', null);
INSERT INTO `tp_area` VALUES ('415', '昆明市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('416', '曲靖市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('417', '玉溪市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('418', '保山市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('419', '昭通市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('420', '丽江市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('421', '思茅市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('422', '临沧市', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('423', '楚雄彝族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('424', '红河哈尼族彝族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('425', '文山壮族苗族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('426', '西双版纳傣族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('427', '大理白族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('428', '德宏傣族景颇族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('429', '怒江傈僳族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('430', '迪庆藏族自治州', '25', '0', '2', null);
INSERT INTO `tp_area` VALUES ('431', '拉萨市', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('432', '昌都地区', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('433', '山南地区', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('434', '日喀则地区', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('435', '那曲地区', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('436', '阿里地区', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('437', '林芝地区', '26', '0', '2', null);
INSERT INTO `tp_area` VALUES ('438', '西安市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('439', '铜川市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('440', '宝鸡市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('441', '咸阳市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('442', '渭南市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('443', '延安市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('444', '汉中市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('445', '榆林市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('446', '安康市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('447', '商洛市', '27', '0', '2', null);
INSERT INTO `tp_area` VALUES ('448', '兰州市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('449', '嘉峪关市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('450', '金昌市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('451', '白银市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('452', '天水市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('453', '武威市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('454', '张掖市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('455', '平凉市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('456', '酒泉市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('457', '庆阳市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('458', '定西市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('459', '陇南市', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('460', '临夏回族自治州', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('461', '甘南藏族自治州', '28', '0', '2', null);
INSERT INTO `tp_area` VALUES ('462', '西宁市', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('463', '海东地区', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('464', '海北藏族自治州', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('465', '黄南藏族自治州', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('466', '海南藏族自治州', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('467', '果洛藏族自治州', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('468', '玉树藏族自治州', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('469', '海西蒙古族藏族自治州', '29', '0', '2', null);
INSERT INTO `tp_area` VALUES ('470', '银川市', '30', '0', '2', null);
INSERT INTO `tp_area` VALUES ('471', '石嘴山市', '30', '0', '2', null);
INSERT INTO `tp_area` VALUES ('472', '吴忠市', '30', '0', '2', null);
INSERT INTO `tp_area` VALUES ('473', '固原市', '30', '0', '2', null);
INSERT INTO `tp_area` VALUES ('474', '中卫市', '30', '0', '2', null);
INSERT INTO `tp_area` VALUES ('475', '乌鲁木齐市', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('476', '克拉玛依市', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('477', '吐鲁番地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('478', '哈密地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('479', '昌吉回族自治州', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('480', '博尔塔拉蒙古自治州', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('481', '巴音郭楞蒙古自治州', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('482', '阿克苏地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('484', '喀什地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('485', '和田地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('486', '伊犁哈萨克自治州', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('487', '塔城地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('488', '阿勒泰地区', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('489', '石河子市', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('490', '阿拉尔市', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('491', '图木舒克市', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('492', '五家渠市', '31', '0', '2', null);
INSERT INTO `tp_area` VALUES ('493', '台北市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('494', '高雄市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('495', '基隆市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('496', '台中市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('497', '台南市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('498', '新竹市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('499', '嘉义市', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('500', '台北县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('501', '宜兰县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('502', '桃园县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('503', '新竹县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('504', '苗栗县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('505', '台中县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('506', '彰化县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('507', '南投县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('508', '云林县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('509', '嘉义县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('510', '台南县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('511', '高雄县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('512', '屏东县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('513', '澎湖县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('514', '台东县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('515', '花莲县', '32', '0', '2', null);
INSERT INTO `tp_area` VALUES ('516', '中西区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('517', '东区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('518', '九龙城区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('519', '观塘区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('520', '南区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('521', '深水埗区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('522', '黄大仙区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('523', '湾仔区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('524', '油尖旺区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('525', '离岛区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('526', '葵青区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('527', '北区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('528', '西贡区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('529', '沙田区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('530', '屯门区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('531', '大埔区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('532', '荃湾区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('533', '元朗区', '33', '0', '2', null);
INSERT INTO `tp_area` VALUES ('534', '澳门特别行政区', '34', '0', '2', null);
INSERT INTO `tp_area` VALUES ('535', '美国', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('536', '加拿大', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('537', '澳大利亚', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('538', '新西兰', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('539', '英国', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('540', '法国', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('541', '德国', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('542', '捷克', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('543', '荷兰', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('544', '瑞士', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('545', '希腊', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('546', '挪威', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('547', '瑞典', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('548', '丹麦', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('549', '芬兰', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('550', '爱尔兰', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('551', '奥地利', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('552', '意大利', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('553', '乌克兰', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('554', '俄罗斯', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('555', '西班牙', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('556', '韩国', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('557', '新加坡', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('558', '马来西亚', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('559', '印度', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('560', '泰国', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('561', '日本', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('562', '巴西', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('563', '阿根廷', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('564', '南非', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('565', '埃及', '45055', '0', '3', null);
INSERT INTO `tp_area` VALUES ('566', '其他', '36', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1126', '井陉县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1127', '井陉矿区', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1128', '元氏县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1129', '平山县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1130', '新乐市', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1131', '新华区', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1132', '无极县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1133', '晋州市', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1134', '栾城县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1135', '桥东区', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1136', '桥西区', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1137', '正定县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1138', '深泽县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1139', '灵寿县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1140', '藁城市', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1141', '行唐县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1142', '裕华区', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1143', '赞皇县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1144', '赵县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1145', '辛集市', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1146', '长安区', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1147', '高邑县', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1148', '鹿泉市', '73', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1149', '丰南区', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1150', '丰润区', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1151', '乐亭县', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1152', '古冶区', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1153', '唐海县', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1154', '开平区', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1155', '滦南县', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1156', '滦县', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1157', '玉田县', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1158', '路北区', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1159', '路南区', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1160', '迁安市', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1161', '迁西县', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1162', '遵化市', '74', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1163', '北戴河区', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1164', '卢龙县', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1165', '山海关区', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1166', '抚宁县', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1167', '昌黎县', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1168', '海港区', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1169', '青龙满族自治县', '75', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1170', '丛台区', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1171', '临漳县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1172', '复兴区', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1173', '大名县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1174', '峰峰矿区', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1175', '广平县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1176', '成安县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1177', '曲周县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1178', '武安市', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1179', '永年县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1180', '涉县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1181', '磁县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1182', '肥乡县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1183', '邯山区', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1184', '邯郸县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1185', '邱县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1186', '馆陶县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1187', '魏县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1188', '鸡泽县', '76', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1189', '临城县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1190', '临西县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1191', '任县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1192', '内丘县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1193', '南和县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1194', '南宫市', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1195', '威县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1196', '宁晋县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1197', '巨鹿县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1198', '平乡县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1199', '广宗县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1200', '新河县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1201', '柏乡县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1202', '桥东区', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1203', '桥西区', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1204', '沙河市', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1205', '清河县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1206', '邢台县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1207', '隆尧县', '77', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1208', '北市区', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1209', '南市区', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1210', '博野县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1211', '唐县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1212', '安国市', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1213', '安新县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1214', '定兴县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1215', '定州市', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1216', '容城县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1217', '徐水县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1218', '新市区', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1219', '易县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1220', '曲阳县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1221', '望都县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1222', '涞水县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1223', '涞源县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1224', '涿州市', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1225', '清苑县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1226', '满城县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1227', '蠡县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1228', '阜平县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1229', '雄县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1230', '顺平县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1231', '高碑店市', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1232', '高阳县', '78', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1233', '万全县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1234', '下花园区', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1235', '宣化区', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1236', '宣化县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1237', '尚义县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1238', '崇礼县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1239', '康保县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1240', '张北县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1241', '怀安县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1242', '怀来县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1243', '桥东区', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1244', '桥西区', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1245', '沽源县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1246', '涿鹿县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1247', '蔚县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1248', '赤城县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1249', '阳原县', '79', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1250', '丰宁满族自治县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1251', '兴隆县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1252', '双桥区', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1253', '双滦区', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1254', '围场满族蒙古族自治县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1255', '宽城满族自治县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1256', '平泉县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1257', '承德县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1258', '滦平县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1259', '隆化县', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1260', '鹰手营子矿区', '80', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1261', '冀州市', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1262', '安平县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1263', '故城县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1264', '景县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1265', '枣强县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1266', '桃城区', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1267', '武强县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1268', '武邑县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1269', '深州市', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1270', '阜城县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1271', '饶阳县', '81', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1272', '三河市', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1273', '固安县', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1274', '大厂回族自治县', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1275', '大城县', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1276', '安次区', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1277', '广阳区', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1278', '文安县', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1279', '永清县', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1280', '霸州市', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1281', '香河县', '82', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1282', '东光县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1283', '任丘市', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1284', '南皮县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1285', '吴桥县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1286', '孟村回族自治县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1287', '新华区', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1288', '沧县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1289', '河间市', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1290', '泊头市', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1291', '海兴县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1292', '献县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1293', '盐山县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1294', '肃宁县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1295', '运河区', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1296', '青县', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1297', '黄骅市', '83', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1298', '万柏林区', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1299', '古交市', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1300', '娄烦县', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1301', '小店区', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1302', '尖草坪区', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1303', '晋源区', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1304', '杏花岭区', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1305', '清徐县', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1306', '迎泽区', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1307', '阳曲县', '84', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1308', '南郊区', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1309', '城区', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1310', '大同县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1311', '天镇县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1312', '左云县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1313', '广灵县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1314', '新荣区', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1315', '浑源县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1316', '灵丘县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1317', '矿区', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1318', '阳高县', '85', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1319', '城区', '86', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1320', '平定县', '86', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1321', '盂县', '86', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1322', '矿区', '86', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1323', '郊区', '86', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1324', '城区', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1325', '壶关县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1326', '屯留县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1327', '平顺县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1328', '武乡县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1329', '沁县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1330', '沁源县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1331', '潞城市', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1332', '襄垣县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1333', '郊区', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1334', '长子县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1335', '长治县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1336', '黎城县', '87', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1337', '城区', '88', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1338', '沁水县', '88', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1339', '泽州县', '88', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1340', '阳城县', '88', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1341', '陵川县', '88', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1342', '高平市', '88', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1343', '右玉县', '89', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1344', '山阴县', '89', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1345', '平鲁区', '89', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1346', '应县', '89', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1347', '怀仁县', '89', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1348', '朔城区', '89', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1349', '介休市', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1350', '和顺县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1351', '太谷县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1352', '寿阳县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1353', '左权县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1354', '平遥县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1355', '昔阳县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1356', '榆次区', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1357', '榆社县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1358', '灵石县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1359', '祁县', '90', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1360', '万荣县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1361', '临猗县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1362', '垣曲县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1363', '夏县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1364', '平陆县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1365', '新绛县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1366', '永济市', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1367', '河津市', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1368', '盐湖区', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1369', '稷山县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1370', '绛县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1371', '芮城县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1372', '闻喜县', '91', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1373', '五台县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1374', '五寨县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1375', '代县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1376', '保德县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1377', '偏关县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1378', '原平市', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1379', '宁武县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1380', '定襄县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1381', '岢岚县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1382', '忻府区', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1383', '河曲县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1384', '神池县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1385', '繁峙县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1386', '静乐县', '92', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1387', '乡宁县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1388', '侯马市', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1389', '古县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1390', '吉县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1391', '大宁县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1392', '安泽县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1393', '尧都区', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1394', '曲沃县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1395', '永和县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1396', '汾西县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1397', '洪洞县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1398', '浮山县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1399', '翼城县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1400', '蒲县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1401', '襄汾县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1402', '隰县', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1403', '霍州市', '93', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1404', '中阳县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1405', '临县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1406', '交口县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1407', '交城县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1408', '兴县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1409', '孝义市', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1410', '岚县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1411', '文水县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1412', '方山县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1413', '柳林县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1414', '汾阳市', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1415', '石楼县', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1416', '离石区', '94', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1417', '和林格尔县', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1418', '回民区', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1419', '土默特左旗', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1420', '托克托县', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1421', '新城区', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1422', '武川县', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1423', '清水河县', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1424', '玉泉区', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1425', '赛罕区', '95', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1426', '东河区', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1427', '九原区', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1428', '固阳县', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1429', '土默特右旗', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1430', '昆都仑区', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1431', '白云矿区', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1432', '石拐区', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1433', '达尔罕茂明安联合旗', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1434', '青山区', '96', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1435', '乌达区', '97', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1436', '海勃湾区', '97', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1437', '海南区', '97', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1438', '元宝山区', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1439', '克什克腾旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1440', '喀喇沁旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1441', '宁城县', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1442', '巴林右旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1443', '巴林左旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1444', '敖汉旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1445', '松山区', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1446', '林西县', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1447', '红山区', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1448', '翁牛特旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1449', '阿鲁科尔沁旗', '98', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1450', '奈曼旗', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1451', '库伦旗', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1452', '开鲁县', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1453', '扎鲁特旗', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1454', '科尔沁区', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1455', '科尔沁左翼中旗', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1456', '科尔沁左翼后旗', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1457', '霍林郭勒市', '99', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1458', '东胜区', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1459', '乌审旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1460', '伊金霍洛旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1461', '准格尔旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1462', '杭锦旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1463', '达拉特旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1464', '鄂东胜区', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1465', '鄂托克前旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1466', '鄂托克旗', '100', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1467', '扎兰屯市', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1468', '新巴尔虎右旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1469', '新巴尔虎左旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1470', '根河市', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1471', '海拉尔区', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1472', '满洲里市', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1473', '牙克石市', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1475', '鄂伦春自治旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1476', '鄂温克族自治旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1477', '阿荣旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1478', '陈巴尔虎旗', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1479', '额尔古纳市', '101', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1480', '临河区', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1481', '乌拉特中旗', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1482', '乌拉特前旗', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1483', '乌拉特后旗', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1484', '五原县', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1485', '杭锦后旗', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1486', '磴口县', '102', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1487', '丰镇市', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1488', '兴和县', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1489', '凉城县', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1490', '化德县', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1491', '卓资县', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1492', '商都县', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1493', '四子王旗', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1494', '察哈尔右翼中旗', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1495', '察哈尔右翼前旗', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1496', '察哈尔右翼后旗', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1497', '集宁区', '103', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1498', '乌兰浩特市', '104', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1499', '扎赉特旗', '104', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1500', '科尔沁右翼中旗', '104', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1501', '科尔沁右翼前旗', '104', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1502', '突泉县', '104', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1503', '阿尔山市', '104', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1504', '东乌珠穆沁旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1505', '二连浩特市', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1506', '多伦县', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1507', '太仆寺旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1508', '正蓝旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1509', '正镶白旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1510', '苏尼特右旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1511', '苏尼特左旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1512', '西乌珠穆沁旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1513', '锡林浩特市', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1514', '镶黄旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1515', '阿巴嘎旗', '105', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1516', '阿拉善右旗', '106', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1517', '阿拉善左旗', '106', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1518', '额济纳旗', '106', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1519', '东陵区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1520', '于洪区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1521', '和平区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1522', '大东区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1523', '康平县', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1524', '新民市', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1525', '沈北新区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1526', '沈河区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1527', '法库县', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1528', '皇姑区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1529', '苏家屯区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1530', '辽中县', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1531', '铁西区', '107', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1532', '中山区', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1533', '庄河市', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1534', '旅顺口区', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1535', '普兰店市', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1536', '沙河口区', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1537', '瓦房店市', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1538', '甘井子区', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1539', '西岗区', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1540', '金州区', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1541', '长海县', '108', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1542', '千山区', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1543', '台安县', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1544', '岫岩满族自治县', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1545', '海城市', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1546', '立山区', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1547', '铁东区', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1548', '铁西区', '109', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1549', '东洲区', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1550', '抚顺县', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1551', '新宾满族自治县', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1552', '新抚区', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1553', '望花区', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1554', '清原满族自治县', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1555', '顺城区', '110', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1556', '南芬区', '111', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1557', '平山区', '111', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1558', '明山区', '111', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1559', '本溪满族自治县', '111', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1560', '桓仁满族自治县', '111', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1561', '溪湖区', '111', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1562', '东港市', '112', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1563', '元宝区', '112', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1564', '凤城市', '112', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1565', '宽甸满族自治县', '112', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1566', '振兴区', '112', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1567', '振安区', '112', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1568', '义县', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1569', '凌河区', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1570', '凌海市', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1571', '北镇市', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1572', '古塔区', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1573', '太和区', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1574', '黑山县', '113', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1575', '大石桥市', '114', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1576', '盖州市', '114', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1577', '站前区', '114', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1578', '老边区', '114', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1579', '西市区', '114', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1580', '鲅鱼圈区', '114', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1581', '太平区', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1582', '彰武县', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1583', '新邱区', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1584', '海州区', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1585', '清河门区', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1586', '细河区', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1587', '蒙古族自治县', '115', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1588', '太子河区', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1589', '宏伟区', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1590', '弓长岭区', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1591', '文圣区', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1592', '灯塔市', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1593', '白塔区', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1594', '辽阳县', '116', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1595', '兴隆台区', '117', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1596', '双台子区', '117', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1597', '大洼县', '117', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1598', '盘山县', '117', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1599', '开原市', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1600', '昌图县', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1601', '清河区', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1602', '西丰县', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1603', '调兵山市', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1604', '铁岭县', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1605', '银州区', '118', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1606', '凌源市', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1607', '北票市', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1608', '双塔区', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1610', '建平县', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1611', '朝阳县', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1612', '龙城区', '119', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1613', '兴城市', '120', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1614', '南票区', '120', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1615', '建昌县', '120', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1616', '绥中县', '120', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1617', '连山区', '120', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1618', '龙港区', '120', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1619', '九台市', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1620', '二道区', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1621', '农安县', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1622', '南关区', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1623', '双阳区', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1624', '宽城区', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1625', '德惠市', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1626', '朝阳区', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1627', '榆树市', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1628', '绿园区', '121', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1629', '丰满区', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1630', '昌邑区', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1631', '桦甸市', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1632', '永吉县', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1633', '磐石市', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1634', '舒兰市', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1635', '船营区', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1636', '蛟河市', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1637', '龙潭区', '122', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1638', '伊通满族自治县', '123', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1639', '公主岭市', '123', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1640', '双辽市', '123', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1641', '梨树县', '123', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1642', '铁东区', '123', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1643', '铁西区', '123', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1644', '东丰县', '124', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1645', '东辽县', '124', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1646', '西安区', '124', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1647', '龙山区', '124', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1648', '东昌区', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1649', '二道江区', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1650', '柳河县', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1651', '梅河口市', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1652', '辉南县', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1653', '通化县', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1654', '集安市', '125', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1655', '临江市', '126', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1656', '八道江区', '126', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1657', '抚松县', '126', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1658', '江源区', '126', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1659', '长白朝鲜族自治县', '126', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1660', '靖宇县', '126', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1661', '干安县', '127', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1663', '宁江区', '127', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1664', '扶余县', '127', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1665', '长岭县', '127', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1666', '大安市', '128', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1667', '洮北区', '128', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1668', '洮南市', '128', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1669', '通榆县', '128', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1670', '镇赉县', '128', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1671', '和龙市', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1672', '图们市', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1673', '安图县', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1674', '延吉市', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1675', '敦化市', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1676', '汪清县', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1677', '珲春市', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1678', '龙井市', '129', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1679', '五常市', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1680', '依兰县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1681', '南岗区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1682', '双城市', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1683', '呼兰区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1684', '哈尔滨市道里区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1685', '宾县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1686', '尚志市', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1687', '巴彦县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1688', '平房区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1689', '延寿县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1690', '方正县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1691', '木兰县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1692', '松北区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1693', '通河县', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1694', '道外区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1695', '阿城区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1696', '香坊区', '130', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1697', '依安县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1698', '克东县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1699', '克山县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1700', '富拉尔基区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1701', '富裕县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1702', '建华区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1703', '拜泉县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1704', '昂昂溪区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1705', '梅里斯达斡尔族区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1706', '泰来县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1707', '甘南县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1708', '碾子山区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1709', '讷河市', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1710', '铁锋区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1711', '龙江县', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1712', '龙沙区', '131', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1713', '城子河区', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1714', '密山市', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1715', '恒山区', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1716', '梨树区', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1717', '滴道区', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1718', '虎林市', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1719', '鸡东县', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1720', '鸡冠区', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1721', '麻山区', '132', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1722', '东山区', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1723', '兴安区', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1724', '兴山区', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1725', '南山区', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1726', '向阳区', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1727', '工农区', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1728', '绥滨县', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1729', '萝北县', '133', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1730', '友谊县', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1731', '四方台区', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1732', '宝山区', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1733', '宝清县', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1734', '尖山区', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1735', '岭东区', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1736', '集贤县', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1737', '饶河县', '134', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1738', '大同区', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1740', '林甸县', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1741', '红岗区', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1742', '肇州县', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1743', '肇源县', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1744', '胡路区', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1745', '萨尔图区', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1746', '龙凤区', '135', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1747', '上甘岭区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1748', '乌伊岭区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1749', '乌马河区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1750', '五营区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1751', '伊春区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1752', '南岔区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1753', '友好区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1754', '嘉荫县', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1755', '带岭区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1756', '新青区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1757', '汤旺河区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1758', '红星区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1759', '美溪区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1760', '翠峦区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1761', '西林区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1762', '金山屯区', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1763', '铁力市', '136', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1764', '东风区', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1765', '前进区', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1766', '同江市', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1767', '向阳区', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1768', '富锦市', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1769', '抚远县', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1770', '桦南县', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1771', '桦川县', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1772', '汤原县', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1773', '郊区', '137', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1774', '勃利县', '138', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1775', '新兴区', '138', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1776', '桃山区', '138', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1777', '茄子河区', '138', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1778', '东宁县', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1779', '东安区', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1780', '宁安市', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1781', '林口县', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1782', '海林市', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1783', '爱民区', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1784', '穆棱市', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1785', '绥芬河市', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1786', '西安区', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1787', '阳明区', '139', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1788', '五大连池市', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1789', '北安市', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1790', '嫩江县', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1791', '孙吴县', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1792', '爱辉区', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1793', '车逊克县', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1794', '逊克县', '140', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1795', '兰西县', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1796', '安达市', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1797', '庆安县', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1798', '明水县', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1799', '望奎县', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1800', '海伦市', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1801', '绥化市北林区', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1802', '绥棱县', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1803', '肇东市', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1804', '青冈县', '141', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1805', '呼玛县', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1806', '塔河县', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1807', '大兴安岭地区加格达奇区', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1808', '大兴安岭地区呼中区', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1809', '大兴安岭地区新林区', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1810', '大兴安岭地区松岭区', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('1811', '漠河县', '142', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2027', '下关区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2028', '六合区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2029', '建邺区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2030', '栖霞区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2031', '江宁区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2032', '浦口区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2033', '溧水县', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2034', '玄武区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2035', '白下区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2036', '秦淮区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2037', '雨花台区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2038', '高淳县', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2039', '鼓楼区', '162', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2040', '北塘区', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2041', '南长区', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2042', '宜兴市', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2043', '崇安区', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2044', '惠山区', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2045', '江阴市', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2046', '滨湖区', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2047', '锡山区', '163', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2048', '丰县', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2049', '九里区', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2050', '云龙区', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2051', '新沂市', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2052', '沛县', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2053', '泉山区', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2054', '睢宁县', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2055', '贾汪区', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2056', '邳州市', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2057', '铜山县', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2058', '鼓楼区', '164', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2059', '天宁区', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2060', '戚墅堰区', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2061', '新北区', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2062', '武进区', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2063', '溧阳市', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2064', '金坛市', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2065', '钟楼区', '165', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2066', '吴中区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2067', '吴江市', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2068', '太仓市', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2069', '常熟市', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2070', '平江区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2071', '张家港市', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2072', '昆山市', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2073', '沧浪区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2074', '相城区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2075', '苏州工业园区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2076', '虎丘区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2077', '金阊区', '166', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2078', '启东市', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2079', '如东县', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2080', '如皋市', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2081', '崇川区', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2082', '海安县', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2083', '海门市', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2084', '港闸区', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2085', '通州市', '167', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2086', '东海县', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2087', '新浦区', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2088', '海州区', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2089', '灌云县', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2090', '灌南县', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2091', '赣榆县', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2092', '连云区', '168', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2093', '楚州区', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2094', '洪泽县', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2095', '涟水县', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2096', '淮阴区', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2097', '清河区', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2098', '清浦区', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2099', '盱眙县', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2100', '金湖县', '169', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2101', '东台市', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2102', '亭湖区', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2103', '响水县', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2104', '大丰市', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2105', '射阳县', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2106', '建湖县', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2107', '滨海县', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2108', '盐都区', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2109', '阜宁县', '170', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2110', '仪征市', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2111', '宝应县', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2112', '广陵区', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2113', '江都市', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2114', '维扬区', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2115', '邗江区', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2116', '高邮市', '171', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2117', '丹徒区', '172', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2118', '丹阳市', '172', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2119', '京口区', '172', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2120', '句容市', '172', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2121', '扬中市', '172', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2122', '润州区', '172', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2123', '兴化市', '173', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2124', '姜堰市', '173', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2125', '泰兴市', '173', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2126', '海陵区', '173', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2127', '靖江市', '173', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2128', '高港区', '173', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2129', '宿城区', '174', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2130', '宿豫区', '174', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2131', '沭阳县', '174', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2132', '泗洪县', '174', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2133', '泗阳县', '174', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2134', '上城区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2135', '下城区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2136', '临安市', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2137', '余杭区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2138', '富阳市', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2139', '建德市', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2140', '拱墅区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2141', '桐庐县', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2142', '江干区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2143', '淳安县', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2144', '滨江区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2145', '萧山区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2146', '西湖区', '175', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2147', '余姚市', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2148', '北仑区', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2149', '奉化市', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2150', '宁海县', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2151', '慈溪市', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2152', '江东区', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2153', '江北区', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2154', '海曙区', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2155', '象山县', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2156', '鄞州区', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2157', '镇海区', '176', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2158', '乐清市', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2159', '平阳县', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2160', '文成县', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2161', '永嘉县', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2162', '泰顺县', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2163', '洞头县', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2164', '瑞安市', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2165', '瓯海区', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2166', '苍南县', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2167', '鹿城区', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2168', '龙湾区', '177', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2169', '南湖区', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2170', '嘉善县', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2171', '平湖市', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2172', '桐乡市', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2173', '海宁市', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2174', '海盐县', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2175', '秀洲区', '178', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2176', '南浔区', '179', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2177', '吴兴区', '179', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2178', '安吉县', '179', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2179', '德清县', '179', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2180', '长兴县', '179', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2181', '上虞市', '180', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2182', '嵊州市', '180', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2183', '新昌县', '180', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2184', '绍兴县', '180', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2185', '诸暨市', '180', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2186', '越城区', '180', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2187', '定海区', '181', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2188', '岱山县', '181', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2189', '嵊泗县', '181', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2190', '普陀区', '181', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2191', '常山县', '182', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2192', '开化县', '182', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2193', '柯城区', '182', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2194', '江山市', '182', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2195', '衢江区', '182', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2196', '龙游县', '182', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2197', '东阳市', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2198', '义乌市', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2199', '兰溪市', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2200', '婺城区', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2201', '武义县', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2202', '永康市', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2203', '浦江县', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2204', '磐安县', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2205', '金东区', '183', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2206', '三门县', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2207', '临海市', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2208', '仙居县', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2209', '天台县', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2210', '椒江区', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2211', '温岭市', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2212', '玉环县', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2213', '路桥区', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2214', '黄岩区', '184', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2215', '云和县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2216', '庆元县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2217', '景宁畲族自治县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2218', '松阳县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2219', '缙云县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2220', '莲都区', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2221', '遂昌县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2222', '青田县', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2223', '龙泉市', '185', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2224', '包河区', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2225', '庐阳区', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2226', '瑶海区', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2227', '肥东县', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2228', '肥西县', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2229', '蜀山区', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2230', '长丰县', '186', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2231', '三山区', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2232', '南陵县', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2233', '弋江区', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2234', '繁昌县', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2235', '芜湖县', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2236', '镜湖区', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2237', '鸠江区', '187', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2238', '五河县', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2239', '固镇县', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2240', '怀远县', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2241', '淮上区', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2242', '禹会区', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2243', '蚌山区', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2244', '龙子湖区', '188', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2245', '八公山区', '189', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2246', '凤台县', '189', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2247', '大通区', '189', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2248', '潘集区', '189', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2249', '田家庵区', '189', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2250', '谢家集区', '189', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2251', '当涂县', '190', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2252', '花山区', '190', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2253', '金家庄区', '190', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2254', '雨山区', '190', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2255', '杜集区', '191', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2256', '濉溪县', '191', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2257', '烈山区', '191', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2258', '相山区', '191', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2259', '狮子山区', '192', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2260', '郊区', '192', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2261', '铜官山区', '192', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2262', '铜陵县', '192', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2263', '大观区', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2264', '太湖县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2265', '宜秀区', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2266', '宿松县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2267', '岳西县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2268', '怀宁县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2269', '望江县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2270', '枞阳县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2271', '桐城市', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2272', '潜山县', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2273', '迎江区', '193', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2274', '休宁县', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2275', '屯溪区', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2276', '徽州区', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2277', '歙县', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2278', '祁门县', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2279', '黄山区', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2280', '黟县', '194', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2281', '全椒县', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2282', '凤阳县', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2283', '南谯区', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2284', '天长市', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2285', '定远县', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2286', '明光市', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2287', '来安县', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2288', '琅玡区', '195', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2289', '临泉县', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2290', '太和县', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2291', '界首市', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2292', '阜南县', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2293', '颍东区', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2294', '颍州区', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2295', '颍泉区', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2296', '颖上县', '196', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2297', '埇桥区', '197', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2298', '泗县辖', '197', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2299', '灵璧县', '197', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2300', '砀山县', '197', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2301', '萧县', '197', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2302', '含山县', '198', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2303', '和县', '198', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2304', '居巢区', '198', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2305', '庐江县', '198', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2306', '无为县', '198', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2307', '寿县', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2308', '舒城县', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2309', '裕安区', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2310', '金安区', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2311', '金寨县', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2312', '霍山县', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2313', '霍邱县', '199', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2314', '利辛县', '200', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2315', '涡阳县', '200', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2316', '蒙城县', '200', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2317', '谯城区', '200', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2318', '东至县', '201', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2319', '石台县', '201', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2320', '贵池区', '201', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2321', '青阳县', '201', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2322', '宁国市', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2323', '宣州区', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2324', '广德县', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2325', '旌德县', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2326', '泾县', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2327', '绩溪县', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2328', '郎溪县', '202', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2329', '仓山区', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2330', '台江区', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2331', '平潭县', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2332', '晋安区', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2333', '永泰县', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2334', '福清市', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2335', '罗源县', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2336', '连江县', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2337', '长乐市', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2338', '闽侯县', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2339', '闽清县', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2340', '马尾区', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2341', '鼓楼区', '203', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2342', '同安区', '204', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2343', '思明区', '204', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2344', '海沧区', '204', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2345', '湖里区', '204', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2346', '翔安区', '204', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2347', '集美区', '204', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2348', '仙游县', '205', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2349', '城厢区', '205', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2350', '涵江区', '205', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2351', '秀屿区', '205', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2352', '荔城区', '205', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2353', '三元区', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2354', '大田县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2355', '宁化县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2356', '将乐县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2357', '尤溪县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2358', '建宁县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2359', '明溪县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2360', '梅列区', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2361', '永安市', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2362', '沙县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2363', '泰宁县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2364', '清流县', '206', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2365', '丰泽区', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2366', '南安市', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2367', '安溪县', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2368', '德化县', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2369', '惠安县', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2370', '晋江市', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2371', '永春县', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2372', '泉港区', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2373', '洛江区', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2374', '石狮市', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2375', '金门县', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2376', '鲤城区', '207', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2377', '东山县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2378', '云霄县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2379', '华安县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2380', '南靖县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2381', '平和县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2382', '漳浦县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2383', '芗城区', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2384', '诏安县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2385', '长泰县', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2386', '龙文区', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2387', '龙海市', '208', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2388', '光泽县', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2389', '延平区', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2390', '建瓯市', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2391', '建阳市', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2392', '政和县', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2393', '松溪县', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2394', '武夷山市', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2395', '浦城县', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2396', '邵武市', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2397', '顺昌县', '209', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2398', '上杭县', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2399', '新罗区', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2400', '武平县', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2401', '永定县', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2402', '漳平市', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2403', '连城县', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2404', '长汀县', '210', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2405', '古田县', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2406', '周宁县', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2407', '寿宁县', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2408', '屏南县', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2409', '柘荣县', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2410', '福安市', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2411', '福鼎市', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2412', '蕉城区', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2413', '霞浦县', '211', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2414', '东湖区', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2415', '南昌县', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2416', '安义县', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2417', '新建县', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2418', '湾里区', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2419', '西湖区', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2420', '进贤县', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2421', '青云谱区', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2422', '青山湖区', '212', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2423', '乐平市', '213', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2424', '昌江区', '213', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2425', '浮梁县', '213', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2426', '珠山区', '213', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2427', '上栗县', '214', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2428', '安源区', '214', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2429', '湘东区', '214', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2430', '芦溪县', '214', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2431', '莲花县', '214', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2432', '九江县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2433', '修水县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2434', '庐山区', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2435', '彭泽县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2436', '德安县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2437', '星子县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2438', '武宁县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2439', '永修县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2440', '浔阳区', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2441', '湖口县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2442', '瑞昌市', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2443', '都昌县', '215', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2444', '分宜县', '216', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2445', '渝水区', '216', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2446', '余江县', '217', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2447', '月湖区', '217', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2448', '贵溪市', '217', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2449', '上犹县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2450', '于都县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2451', '会昌县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2452', '信丰县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2453', '全南县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2454', '兴国县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2455', '南康市', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2456', '大余县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2457', '宁都县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2458', '安远县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2459', '定南县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2460', '寻乌县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2461', '崇义县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2462', '瑞金市', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2463', '石城县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2464', '章贡区', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2465', '赣县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2466', '龙南县', '218', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2467', '万安县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2468', '井冈山市', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2469', '吉安县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2470', '吉州区', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2471', '吉水县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2472', '安福县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2473', '峡江县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2474', '新干县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2475', '永丰县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2476', '永新县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2477', '泰和县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2478', '遂川县', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2479', '青原区', '219', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2480', '万载县', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2481', '上高县', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2482', '丰城市', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2483', '奉新县', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2484', '宜丰县', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2485', '樟树市', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2486', '袁州区', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2487', '铜鼓县', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2488', '靖安县', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2489', '高安市', '220', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2490', '东乡县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2491', '临川区', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2492', '乐安县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2493', '南丰县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2494', '南城县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2495', '宜黄县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2496', '崇仁县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2497', '广昌县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2498', '资溪县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2499', '金溪县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2500', '黎川县', '221', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2501', '万年县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2502', '上饶县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2503', '余干县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2504', '信州区', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2505', '婺源县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2506', '广丰县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2507', '弋阳县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2508', '德兴市', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2509', '横峰县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2510', '玉山县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2511', '鄱阳县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2512', '铅山县', '222', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2513', '历下区', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2514', '历城区', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2515', '商河县', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2516', '天桥区', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2517', '市中区', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2518', '平阴县', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2519', '槐荫区', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2520', '济阳县', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2521', '章丘市', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2522', '长清区', '223', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2523', '即墨市', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2524', '四方区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2525', '城阳区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2526', '崂山区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2527', '市北区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2528', '市南区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2529', '平度市', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2530', '李沧区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2531', '胶南市', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2532', '胶州市', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2533', '莱西市', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2534', '黄岛区', '224', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2535', '临淄区', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2536', '博山区', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2537', '周村区', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2538', '张店区', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2539', '桓台县', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2540', '沂源县', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2541', '淄川区', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2542', '高青县', '225', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2543', '台儿庄区', '226', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2544', '山亭区', '226', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2545', '峄城区', '226', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2546', '市中区', '226', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2547', '滕州市', '226', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2548', '薛城区', '226', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2549', '东营区', '227', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2550', '利津县', '227', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2551', '垦利县', '227', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2552', '广饶县', '227', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2553', '河口区', '227', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2554', '招远市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2555', '栖霞市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2556', '海阳市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2557', '牟平区', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2558', '福山区', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2559', '芝罘区', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2560', '莱山区', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2561', '莱州市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2562', '莱阳市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2563', '蓬莱市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2564', '长岛县', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2565', '龙口市', '228', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2566', '临朐县', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2567', '坊子区', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2568', '奎文区', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2569', '安丘市', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2570', '寒亭区', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2571', '寿光市', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2572', '昌乐县', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2573', '昌邑市', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2574', '潍城区', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2575', '诸城市', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2576', '青州市', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2577', '高密市', '229', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2578', '任城区', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2579', '兖州市', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2580', '嘉祥县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2581', '市中区', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2582', '微山县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2583', '曲阜市', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2584', '梁山县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2585', '汶上县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2586', '泗水县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2587', '邹城市', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2588', '金乡县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2589', '鱼台县', '230', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2590', '东平县', '231', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2591', '宁阳县', '231', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2592', '岱岳区', '231', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2593', '新泰市', '231', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2594', '泰山区', '231', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2595', '肥城市', '231', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2596', '乳山市', '232', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2597', '文登市', '232', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2598', '环翠区', '232', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2599', '荣成市', '232', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2600', '东港区', '233', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2601', '五莲县', '233', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2602', '岚山区', '233', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2603', '莒县', '233', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2604', '莱城区', '234', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2605', '钢城区', '234', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2606', '临沭县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2607', '兰山区', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2608', '平邑县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2609', '沂南县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2610', '沂水县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2611', '河东区', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2612', '罗庄区', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2613', '苍山县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2614', '莒南县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2615', '蒙阴县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2616', '费县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2617', '郯城县', '235', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2618', '临邑县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2619', '乐陵市', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2620', '夏津县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2621', '宁津县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2622', '平原县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2623', '庆云县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2624', '德城区', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2625', '武城县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2626', '禹城市', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2627', '陵县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2628', '齐河县', '236', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2629', '东昌府区', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2630', '东阿县', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2631', '临清市', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2632', '冠县', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2633', '茌平县', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2634', '莘县', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2635', '阳谷县', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2636', '高唐县', '237', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2637', '博兴县', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2638', '惠民县', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2639', '无棣县', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2640', '沾化县', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2641', '滨城区', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2642', '邹平县', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2643', '阳信县', '238', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2644', '东明县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2645', '单县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2646', '定陶县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2647', '巨野县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2648', '成武县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2649', '曹县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2650', '牡丹区', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2651', '郓城县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2652', '鄄城县', '239', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2653', '上街区', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2654', '中原区', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2655', '中牟县', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2656', '二七区', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2657', '巩义市', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2658', '惠济区', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2659', '新密市', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2660', '新郑市', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2661', '登封市', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2662', '管城回族区', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2663', '荥阳市', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2664', '金水区', '240', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2665', '兰考县', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2666', '尉氏县', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2667', '开封县', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2668', '杞县', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2669', '禹王台区', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2670', '通许县', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2671', '金明区', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2672', '顺河回族区', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2673', '鼓楼区', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2674', '龙亭区', '241', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2675', '伊川县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2676', '偃师市', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2677', '吉利区', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2678', '孟津县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2679', '宜阳县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2680', '嵩县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2681', '新安县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2682', '栾川县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2683', '汝阳县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2684', '洛宁县', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2685', '洛龙区', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2686', '涧西区', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2687', '瀍河回族区', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2688', '老城区', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2689', '西工区', '242', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2690', '卫东区', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2691', '叶县', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2692', '宝丰县', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2693', '新华区', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2694', '汝州市', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2695', '湛河区', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2696', '石龙区', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2697', '舞钢市', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2698', '郏县', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2699', '鲁山县', '243', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2700', '内黄县', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2701', '北关区', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2702', '安阳县', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2703', '文峰区', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2704', '林州市', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2705', '殷都区', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2706', '汤阴县', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2707', '滑县', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2708', '龙安区', '244', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2709', '山城区', '245', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2710', '浚县', '245', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2711', '淇县', '245', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2712', '淇滨区', '245', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2713', '鹤山区', '245', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2714', '凤泉区', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2715', '卫滨区', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2716', '卫辉市', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2717', '原阳县', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2718', '封丘县', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2719', '延津县', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2720', '新乡县', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2721', '牧野区', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2722', '红旗区', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2723', '获嘉县', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2724', '辉县市', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2725', '长垣县', '246', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2726', '中站区', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2727', '修武县', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2728', '博爱县', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2729', '孟州市', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2730', '山阳区', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2731', '武陟县', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2732', '沁阳市', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2733', '温县', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2734', '解放区', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2735', '马村区', '247', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2736', '华龙区', '248', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2737', '南乐县', '248', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2738', '台前县', '248', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2739', '清丰县', '248', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2740', '濮阳县', '248', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2741', '范县', '248', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2742', '禹州市', '249', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2743', '襄城县', '249', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2744', '许昌县', '249', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2745', '鄢陵县', '249', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2746', '长葛市', '249', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2747', '魏都区', '249', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2748', '临颍县', '250', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2749', '召陵区', '250', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2750', '源汇区', '250', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2751', '舞阳县', '250', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2752', '郾城区', '250', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2753', '义马市', '251', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2754', '卢氏县', '251', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2755', '渑池县', '251', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2756', '湖滨区', '251', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2757', '灵宝市', '251', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2758', '陕县', '251', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2759', '内乡县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2760', '南召县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2761', '卧龙区', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2762', '唐河县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2763', '宛城区', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2764', '新野县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2765', '方城县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2766', '桐柏县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2767', '淅川县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2768', '社旗县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2769', '西峡县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2770', '邓州市', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2771', '镇平县', '252', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2772', '夏邑县', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2773', '宁陵县', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2774', '柘城县', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2775', '民权县', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2776', '永城市', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2777', '睢县', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2778', '睢阳区', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2779', '粱园区', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2780', '虞城县', '253', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2781', '光山县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2782', '商城县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2783', '固始县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2784', '平桥区', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2785', '息县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2786', '新县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2787', '浉河区', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2788', '淮滨县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2789', '潢川县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2790', '罗山县', '254', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2791', '商水县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2792', '太康县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2793', '川汇区', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2794', '扶沟县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2795', '沈丘县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2796', '淮阳县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2797', '西华县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2798', '郸城县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2799', '项城市', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2800', '鹿邑县', '255', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2801', '上蔡县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2802', '平舆县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2803', '新蔡县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2804', '正阳县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2805', '汝南县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2806', '泌阳县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2807', '确山县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2808', '西平县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2809', '遂平县', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2810', '驿城区', '256', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2811', '济源市', '257', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2812', '东西湖区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2813', '新洲区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2814', '武昌区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2815', '汉南区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2816', '汉阳区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2817', '江夏区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2818', '江岸区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2819', '江汉区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2820', '洪山区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2821', '硚口区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2822', '蔡甸区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2823', '青山区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2824', '黄陂区', '258', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2825', '下陆区', '259', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2826', '大冶市', '259', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2827', '西塞山区', '259', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2828', '铁山区', '259', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2829', '阳新县', '259', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2830', '黄石港区', '259', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2831', '丹江口市', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2832', '张湾区', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2833', '房县', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2834', '竹山县', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2835', '竹溪县', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2836', '茅箭区', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2837', '郧县', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2838', '郧西县', '260', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2839', '五峰土家族自治县', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2840', '伍家岗区', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2841', '兴山县', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2842', '夷陵区', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2843', '宜都市', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2844', '当阳市', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2845', '枝江市', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2846', '点军区', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2847', '秭归县', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2848', '虢亭区', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2849', '西陵区', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2850', '远安县', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2851', '长阳土家族自治县', '261', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2852', '保康县', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2853', '南漳县', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2854', '宜城市', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2855', '枣阳市', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2856', '樊城区', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2857', '老河口市', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2858', '襄城区', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2859', '襄阳区', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2860', '谷城县', '262', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2861', '华容区', '263', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2862', '粱子湖', '263', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2863', '鄂城区', '263', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2864', '东宝区', '264', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2865', '京山县', '264', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2866', '掇刀区', '264', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2867', '沙洋县', '264', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2868', '钟祥市', '264', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2869', '云梦县', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2870', '大悟县', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2871', '孝南区', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2872', '孝昌县', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2873', '安陆市', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2874', '应城市', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2875', '汉川市', '265', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2876', '公安县', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2877', '松滋市', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2878', '江陵县', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2879', '沙市区', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2880', '洪湖市', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2881', '监利县', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2882', '石首市', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2883', '荆州区', '266', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2884', '团风县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2885', '武穴市', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2886', '浠水县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2887', '红安县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2888', '罗田县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2889', '英山县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2890', '蕲春县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2891', '麻城市', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2892', '黄州区', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2893', '黄梅县', '267', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2894', '咸安区', '268', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2895', '嘉鱼县', '268', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2896', '崇阳县', '268', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2897', '赤壁市', '268', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2898', '通城县', '268', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2899', '通山县', '268', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2900', '广水市', '269', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2901', '曾都区', '269', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2902', '利川市', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2903', '咸丰县', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2904', '宣恩县', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2905', '巴东县', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2906', '建始县', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2907', '恩施市', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2908', '来凤县', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2909', '鹤峰县', '270', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2910', '仙桃市', '271', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2911', '潜江市', '272', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2912', '天门市', '273', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2913', '神农架林区', '274', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2914', '天心区', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2915', '宁乡县', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2916', '岳麓区', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2917', '开福区', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2918', '望城县', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2919', '浏阳市', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2920', '芙蓉区', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2921', '长沙县', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2922', '雨花区', '275', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2923', '天元区', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2924', '攸县', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2925', '株洲县', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2926', '炎陵县', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2927', '石峰区', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2928', '芦淞区', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2929', '茶陵县', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2930', '荷塘区', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2931', '醴陵市', '276', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2932', '岳塘区', '277', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2933', '湘乡市', '277', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2934', '湘潭县', '277', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2935', '雨湖区', '277', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2936', '韶山市', '277', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2937', '南岳区', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2938', '常宁市', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2939', '珠晖区', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2940', '石鼓区', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2941', '祁东县', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2942', '耒阳市', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2943', '蒸湘区', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2944', '衡东县', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2945', '衡南县', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2946', '衡山县', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2947', '衡阳县', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2948', '雁峰区', '278', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2949', '北塔区', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2950', '双清区', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2951', '城步苗族自治县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2952', '大祥区', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2953', '新宁县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2954', '新邵县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2955', '武冈市', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2956', '洞口县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2957', '绥宁县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2958', '邵东县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2959', '邵阳县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2960', '隆回县', '279', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2961', '临湘市', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2962', '云溪区', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2963', '华容县', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2964', '君山区', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2965', '岳阳县', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2966', '岳阳楼区', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2967', '平江县', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2968', '汨罗市', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2969', '湘阴县', '280', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2970', '临澧县', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2971', '安乡县', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2972', '桃源县', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2973', '武陵区', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2974', '汉寿县', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2975', '津市市', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2976', '澧县', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2977', '石门县', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2978', '鼎城区', '281', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2979', '慈利县', '282', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2980', '桑植县', '282', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2981', '武陵源区', '282', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2982', '永定区', '282', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2983', '南县', '283', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2984', '安化县', '283', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2985', '桃江县', '283', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2986', '沅江市', '283', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2987', '资阳区', '283', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2988', '赫山区', '283', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2989', '临武县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2990', '北湖区', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2991', '嘉禾县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2992', '安仁县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2993', '宜章县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2994', '桂东县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2995', '桂阳县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2996', '永兴县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2997', '汝城县', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2998', '苏仙区', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('2999', '资兴市', '284', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3000', '东安县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3001', '冷水滩区', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3002', '双牌县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3003', '宁远县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3004', '新田县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3005', '江华瑶族自治县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3006', '江永县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3007', '祁阳县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3008', '蓝山县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3009', '道县', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3010', '零陵区', '285', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3011', '中方县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3012', '会同县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3013', '新晃侗族自治县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3014', '沅陵县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3015', '洪江市/洪江区', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3016', '溆浦县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3017', '芷江侗族自治县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3018', '辰溪县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3019', '通道侗族自治县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3020', '靖州苗族侗族自治县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3021', '鹤城区', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3022', '麻阳苗族自治县', '286', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3023', '冷水江市', '287', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3024', '双峰县', '287', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3025', '娄星区', '287', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3026', '新化县', '287', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3027', '涟源市', '287', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3028', '保靖县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3029', '凤凰县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3030', '古丈县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3031', '吉首市', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3032', '永顺县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3033', '泸溪县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3034', '花垣县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3035', '龙山县', '288', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3036', '萝岗区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3037', '南沙区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3038', '从化市', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3039', '增城市', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3040', '天河区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3041', '海珠区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3042', '番禺区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3043', '白云区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3044', '花都区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3045', '荔湾区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3046', '越秀区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3047', '黄埔区', '289', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3048', '乐昌市', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3049', '乳源瑶族自治县', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3050', '仁化县', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3051', '南雄市', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3052', '始兴县', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3053', '新丰县', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3054', '曲江区', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3055', '武江区', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3056', '浈江区', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3057', '翁源县', '290', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3058', '南山区', '291', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3059', '宝安区', '291', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3060', '盐田区', '291', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3061', '福田区', '291', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3062', '罗湖区', '291', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3063', '龙岗区', '291', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3064', '斗门区', '292', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3065', '金湾区', '292', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3066', '香洲区', '292', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3067', '南澳县', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3068', '潮南区', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3069', '潮阳区', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3070', '澄海区', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3071', '濠江区', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3072', '金平区', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3073', '龙湖区', '293', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3074', '三水区', '294', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3075', '南海区', '294', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3076', '禅城区', '294', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3077', '顺德区', '294', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3078', '高明区', '294', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3079', '台山市', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3080', '开平市', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3081', '恩平市', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3082', '新会区', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3083', '江海区', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3084', '蓬江区', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3085', '鹤山市', '295', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3086', '吴川市', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3087', '坡头区', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3088', '廉江市', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3089', '徐闻县', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3090', '赤坎区', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3091', '遂溪县', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3092', '雷州市', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3093', '霞山区', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3094', '麻章区', '296', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3095', '信宜市', '297', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3096', '化州市', '297', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3097', '电白县', '297', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3098', '茂南区', '297', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3099', '茂港区', '297', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3100', '高州市', '297', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3101', '四会市', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3102', '封开县', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3103', '广宁县', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3104', '德庆县', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3105', '怀集县', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3106', '端州区', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3107', '高要市', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3108', '鼎湖区', '298', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3109', '博罗县', '299', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3110', '惠东县', '299', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3111', '惠城区', '299', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3112', '惠阳区', '299', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3113', '龙门县', '299', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3114', '丰顺县', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3115', '五华县', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3116', '兴宁市', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3117', '大埔县', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3118', '平远县', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3119', '梅县', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3120', '梅江区', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3121', '蕉岭县', '300', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3122', '城区', '301', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3123', '海丰县', '301', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3124', '陆丰市', '301', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3125', '陆河县', '301', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3126', '东源县', '302', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3127', '和平县', '302', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3128', '源城区', '302', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3129', '紫金县', '302', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3130', '连平县', '302', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3131', '龙川县', '302', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3132', '江城区', '303', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3133', '阳东县', '303', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3134', '阳春市', '303', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3135', '阳西县', '303', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3136', '佛冈县', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3137', '清城区', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3138', '清新县', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3139', '英德市', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3140', '连南瑶族自治县', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3141', '连山壮族瑶族自治县', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3142', '连州市', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3143', '阳山县', '304', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3144', '东莞市', '305', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3145', '中山市', '306', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3146', '湘桥区', '307', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3147', '潮安县', '307', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3148', '饶平县', '307', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3149', '惠来县', '308', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3150', '揭东县', '308', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3151', '揭西县', '308', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3152', '普宁市', '308', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3153', '榕城区', '308', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3154', '云城区', '309', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3155', '云安县', '309', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3156', '新兴县', '309', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3157', '罗定市', '309', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3158', '郁南县', '309', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3159', '上林县', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3160', '兴宁区', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3161', '宾阳县', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3162', '横县', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3163', '武鸣县', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3164', '江南区', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3165', '良庆区', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3166', '西乡塘区', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3167', '邕宁区', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3168', '隆安县', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3169', '青秀区', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3170', '马山县', '310', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3171', '三江侗族自治县', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3172', '城中区', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3173', '柳北区', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3174', '柳南区', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3175', '柳城县', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3176', '柳江县', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3177', '融安县', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3178', '融水苗族自治县', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3179', '鱼峰区', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3180', '鹿寨县', '311', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3181', '七星区', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3182', '临桂县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3183', '全州县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3184', '兴安县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3185', '叠彩区', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3186', '平乐县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3187', '恭城瑶族自治县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3188', '永福县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3189', '灌阳县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3190', '灵川县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3191', '秀峰区', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3192', '荔浦县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3193', '象山区', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3194', '资源县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3195', '阳朔县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3196', '雁山区', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3197', '龙胜各族自治县', '312', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3198', '万秀区', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3199', '岑溪市', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3200', '苍梧县', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3201', '蒙山县', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3202', '藤县', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3203', '蝶山区', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3204', '长洲区', '313', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3205', '合浦县', '314', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3206', '海城区', '314', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3207', '铁山港区', '314', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3208', '银海区', '314', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3209', '上思县', '315', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3210', '东兴市', '315', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3211', '港口区', '315', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3212', '防城区', '315', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3213', '浦北县', '316', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3214', '灵山县', '316', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3215', '钦北区', '316', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3216', '钦南区', '316', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3217', '平南县', '317', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3218', '桂平市', '317', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3219', '港北区', '317', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3220', '港南区', '317', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3221', '覃塘区', '317', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3222', '兴业县', '318', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3223', '北流市', '318', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3224', '博白县', '318', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3225', '容县', '318', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3226', '玉州区', '318', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3227', '陆川县', '318', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3228', '乐业县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3229', '凌云县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3230', '右江区', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3231', '平果县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3232', '德保县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3233', '田东县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3234', '田林县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3235', '田阳县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3236', '西林县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3237', '那坡县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3238', '隆林各族自治县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3239', '靖西县', '319', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3240', '八步区', '320', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3241', '富川瑶族自治县', '320', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3242', '昭平县', '320', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3243', '钟山县', '320', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3244', '东兰县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3245', '凤山县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3246', '南丹县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3247', '大化瑶族自治县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3248', '天峨县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3249', '宜州市', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3250', '巴马瑶族自治县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3251', '环江毛南族自治县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3252', '罗城仫佬族自治县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3253', '都安瑶族自治县', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3254', '金城江区', '321', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3255', '兴宾区', '322', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3256', '合山市', '322', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3257', '忻城县', '322', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3258', '武宣县', '322', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3259', '象州县', '322', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3260', '金秀瑶族自治县', '322', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3261', '凭祥市', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3262', '大新县', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3263', '天等县', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3264', '宁明县', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3265', '扶绥县', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3266', '江州区', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3267', '龙州县', '323', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3268', '琼山区', '324', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3269', '秀英区', '324', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3270', '美兰区', '324', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3271', '龙华区', '324', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3272', '三亚市', '325', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3273', '五指山市', '326', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3274', '琼海市', '327', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3275', '儋州市', '328', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3276', '文昌市', '329', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3277', '万宁市', '330', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3278', '东方市', '331', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3279', '定安县', '332', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3280', '屯昌县', '333', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3281', '澄迈县', '334', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3282', '临高县', '335', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3283', '白沙黎族自治县', '336', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3284', '昌江黎族自治县', '337', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3285', '乐东黎族自治县', '338', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3286', '陵水黎族自治县', '339', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3287', '保亭黎族苗族自治县', '340', '0', '3', null);
INSERT INTO `tp_area` VALUES ('3288', '琼中黎族苗族自治县', '341', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4209', '双流县', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4210', '大邑县', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4211', '崇州市', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4212', '彭州市', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4213', '成华区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4214', '新津县', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4215', '新都区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4216', '武侯区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4217', '温江区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4218', '蒲江县', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4219', '邛崃市', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4220', '郫县', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4221', '都江堰市', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4222', '金堂县', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4223', '金牛区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4224', '锦江区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4225', '青白江区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4226', '青羊区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4227', '龙泉驿区', '385', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4228', '大安区', '386', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4229', '富顺县', '386', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4230', '沿滩区', '386', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4231', '自流井区', '386', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4232', '荣县', '386', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4233', '贡井区', '386', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4234', '东区', '387', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4235', '仁和区', '387', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4236', '盐边县', '387', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4237', '米易县', '387', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4238', '西区', '387', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4239', '叙永县', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4240', '古蔺县', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4241', '合江县', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4242', '江阳区', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4243', '泸县', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4244', '纳溪区', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4245', '龙马潭区', '388', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4246', '中江县', '389', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4247', '什邡市', '389', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4248', '广汉市', '389', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4249', '旌阳区', '389', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4250', '绵竹市', '389', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4251', '罗江县', '389', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4252', '三台县', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4253', '北川羌族自治县', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4254', '安县', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4255', '平武县', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4256', '梓潼县', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4257', '江油市', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4258', '涪城区', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4259', '游仙区', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4260', '盐亭县', '390', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4261', '元坝区', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4262', '利州区', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4263', '剑阁县', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4264', '旺苍县', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4265', '朝天区', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4266', '苍溪县', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4267', '青川县', '391', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4268', '大英县', '392', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4269', '安居区', '392', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4270', '射洪县', '392', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4271', '船山区', '392', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4272', '蓬溪县', '392', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4273', '东兴区', '393', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4274', '威远县', '393', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4275', '市中区', '393', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4276', '资中县', '393', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4277', '隆昌县', '393', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4278', '五通桥区', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4279', '井研县', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4280', '夹江县', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4281', '峨眉山市', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4282', '峨边彝族自治县', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4283', '市中区', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4284', '沐川县', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4285', '沙湾区', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4286', '犍为县', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4287', '金口河区', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4288', '马边彝族自治县', '394', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4289', '仪陇县', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4290', '南充市嘉陵区', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4291', '南部县', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4292', '嘉陵区', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4293', '营山县', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4294', '蓬安县', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4295', '西充县', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4296', '阆中市', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4297', '顺庆区', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4298', '高坪区', '395', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4299', '东坡区', '396', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4300', '丹棱县', '396', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4301', '仁寿县', '396', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4302', '彭山县', '396', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4303', '洪雅县', '396', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4304', '青神县', '396', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4305', '兴文县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4306', '南溪县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4307', '宜宾县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4308', '屏山县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4309', '江安县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4310', '珙县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4311', '筠连县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4312', '翠屏区', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4313', '长宁县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4314', '高县', '397', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4315', '华蓥市', '398', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4316', '岳池县', '398', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4317', '广安区', '398', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4318', '武胜县', '398', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4319', '邻水县', '398', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4320', '万源市', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4321', '大竹县', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4322', '宣汉县', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4323', '开江县', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4324', '渠县', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4325', '达县', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4326', '通川区', '399', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4327', '名山县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4328', '天全县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4329', '宝兴县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4330', '汉源县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4331', '石棉县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4332', '芦山县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4333', '荥经县', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4334', '雨城区', '400', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4335', '南江县', '401', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4336', '巴州区', '401', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4337', '平昌县', '401', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4338', '通江县', '401', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4339', '乐至县', '402', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4340', '安岳县', '402', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4341', '简阳市', '402', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4342', '雁江区', '402', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4343', '九寨沟县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4344', '壤塘县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4345', '小金县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4346', '松潘县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4347', '汶川县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4348', '理县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4349', '红原县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4350', '若尔盖县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4351', '茂县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4352', '金川县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4353', '阿坝县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4354', '马尔康县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4355', '黑水县', '403', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4356', '丹巴县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4357', '乡城县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4358', '巴塘县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4359', '康定县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4360', '得荣县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4361', '德格县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4362', '新龙县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4363', '泸定县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4364', '炉霍县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4365', '理塘县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4366', '甘孜县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4367', '白玉县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4368', '石渠县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4369', '稻城县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4370', '色达县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4371', '道孚县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4372', '雅江县', '404', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4373', '会东县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4374', '会理县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4375', '冕宁县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4376', '喜德县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4377', '宁南县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4378', '布拖县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4379', '德昌县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4380', '昭觉县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4381', '普格县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4382', '木里藏族自治县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4383', '甘洛县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4384', '盐源县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4385', '美姑县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4386', '西昌', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4387', '越西县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4388', '金阳县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4389', '雷波县', '405', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4390', '乌当区', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4391', '云岩区', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4392', '修文县', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4393', '南明区', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4394', '小河区', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4395', '开阳县', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4396', '息烽县', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4397', '清镇市', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4398', '白云区', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4399', '花溪区', '406', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4400', '六枝特区', '407', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4401', '水城县', '407', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4402', '盘县', '407', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4403', '钟山区', '407', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4404', '习水县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4405', '仁怀市', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4406', '余庆县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4407', '凤冈县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4408', '务川仡佬族苗族自治县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4409', '桐梓县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4410', '正安县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4411', '汇川区', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4412', '湄潭县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4413', '红花岗区', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4414', '绥阳县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4415', '赤水市', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4416', '道真仡佬族苗族自治县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4417', '遵义县', '408', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4418', '关岭布依族苗族自治县', '409', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4419', '平坝县', '409', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4420', '普定县', '409', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4421', '紫云苗族布依族自治县', '409', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4422', '西秀区', '409', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4423', '镇宁布依族苗族自治县', '409', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4424', '万山特区', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4425', '印江土家族苗族自治县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4426', '德江县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4427', '思南县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4428', '松桃苗族自治县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4429', '江口县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4430', '沿河土家族自治县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4431', '玉屏侗族自治县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4432', '石阡县', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4433', '铜仁市', '410', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4434', '兴义市', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4435', '兴仁县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4436', '册亨县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4437', '安龙县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4438', '普安县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4439', '晴隆县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4440', '望谟县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4441', '贞丰县', '411', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4442', '大方县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4443', '威宁彝族回族苗族自治县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4444', '毕节市', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4445', '纳雍县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4446', '织金县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4447', '赫章县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4448', '金沙县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4449', '黔西县', '412', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4450', '三穗县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4451', '丹寨县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4452', '从江县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4453', '凯里市', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4454', '剑河县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4455', '台江县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4456', '天柱县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4457', '岑巩县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4458', '施秉县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4459', '榕江县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4460', '锦屏县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4461', '镇远县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4462', '雷山县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4463', '麻江县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4464', '黄平县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4465', '黎平县', '413', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4466', '三都水族自治县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4467', '平塘县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4468', '惠水县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4469', '独山县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4470', '瓮安县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4471', '福泉市', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4472', '罗甸县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4473', '荔波县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4474', '贵定县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4475', '都匀市', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4476', '长顺县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4477', '龙里县', '414', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4478', '东川区', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4479', '五华区', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4480', '呈贡县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4481', '安宁市', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4482', '官渡区', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4483', '宜良县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4484', '富民县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4485', '寻甸回族彝族自治县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4486', '嵩明县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4487', '晋宁县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4488', '盘龙区', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4489', '石林彝族自治县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4490', '禄劝彝族苗族自治县', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4491', '西山区', '415', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4492', '会泽县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4493', '宣威市', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4494', '富源县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4495', '师宗县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4496', '沾益县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4497', '罗平县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4498', '陆良县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4499', '马龙县', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4500', '麒麟区', '416', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4502', '华宁县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4503', '峨山彝族自治县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4504', '新平彝族傣族自治县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4505', '易门县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4506', '江川县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4507', '澄江县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4508', '红塔区', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4509', '通海县', '417', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4510', '施甸县', '418', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4511', '昌宁县', '418', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4512', '腾冲县', '418', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4513', '隆阳区', '418', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4514', '龙陵县', '418', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4515', '大关县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4516', '威信县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4517', '巧家县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4518', '彝良县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4519', '昭阳区', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4520', '水富县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4521', '永善县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4522', '盐津县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4523', '绥江县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4524', '镇雄县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4525', '鲁甸县', '419', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4526', '华坪县', '420', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4527', '古城区', '420', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4528', '宁蒗彝族自治县', '420', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4529', '永胜县', '420', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4530', '玉龙纳西族自治县', '420', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4531', '临翔区', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4532', '云县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4533', '凤庆县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4535', '永德县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4536', '沧源佤族自治县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4537', '耿马傣族佤族自治县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4538', '镇康县', '422', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4539', '元谋县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4540', '南华县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4541', '双柏县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4542', '大姚县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4543', '姚安县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4544', '楚雄市', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4545', '武定县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4546', '永仁县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4547', '牟定县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4548', '禄丰县', '423', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4549', '个旧市', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4550', '元阳县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4551', '屏边苗族自治县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4552', '建水县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4553', '开远市', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4554', '弥勒县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4555', '河口瑶族自治县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4556', '泸西县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4557', '石屏县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4558', '红河县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4559', '绿春县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4560', '蒙自县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4562', '丘北县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4563', '富宁县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4564', '广南县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4565', '文山县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4566', '砚山县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4567', '西畴县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4568', '马关县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4569', '麻栗坡县', '425', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4570', '勐海县', '426', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4571', '勐腊县', '426', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4572', '景洪市', '426', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4573', '云龙县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4574', '剑川县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4575', '南涧彝族自治县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4576', '大理市', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4577', '宾川县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4578', '巍山彝族回族自治县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4579', '弥渡县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4580', '永平县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4581', '洱源县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4582', '漾濞彝族自治县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4583', '祥云县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4584', '鹤庆县', '427', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4585', '梁河县', '428', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4586', '潞西市', '428', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4587', '瑞丽市', '428', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4588', '盈江县', '428', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4589', '陇川县', '428', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4590', '德钦县', '430', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4591', '维西傈僳族自治县', '430', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4592', '香格里拉县', '430', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4593', '城关区', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4594', '堆龙德庆县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4595', '墨竹工卡县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4596', '尼木县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4597', '当雄县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4598', '曲水县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4599', '林周县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4600', '达孜县', '431', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4601', '丁青县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4602', '八宿县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4603', '察雅县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4604', '左贡县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4605', '昌都县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4606', '江达县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4607', '洛隆县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4608', '类乌齐县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4609', '芒康县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4610', '贡觉县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4611', '边坝县', '432', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4612', '乃东县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4613', '加查县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4614', '扎囊县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4615', '措美县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4616', '曲松县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4617', '桑日县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4618', '洛扎县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4619', '浪卡子县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4620', '琼结县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4621', '贡嘎县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4622', '错那县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4623', '隆子县', '433', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4624', '亚东县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4625', '仁布县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4626', '仲巴县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4627', '南木林县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4628', '吉隆县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4629', '定日县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4630', '定结县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4631', '岗巴县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4632', '康马县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4633', '拉孜县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4634', '日喀则市', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4635', '昂仁县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4636', '江孜县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4637', '白朗县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4638', '聂拉木县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4639', '萨嘎县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4640', '萨迦县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4641', '谢通门县', '434', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4642', '嘉黎县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4643', '安多县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4644', '尼玛县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4645', '巴青县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4646', '比如县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4647', '班戈县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4648', '申扎县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4649', '索县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4650', '聂荣县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4651', '那曲县', '435', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4652', '噶尔县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4653', '措勤县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4654', '改则县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4655', '日土县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4656', '普兰县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4657', '札达县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4658', '革吉县', '436', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4659', '墨脱县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4660', '察隅县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4661', '工布江达县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4662', '朗县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4663', '林芝县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4664', '波密县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4665', '米林县', '437', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4666', '临潼区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4667', '周至县', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4668', '户县', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4669', '新城区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4670', '未央区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4671', '灞桥区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4672', '碑林区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4673', '莲湖区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4674', '蓝田县', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4675', '长安区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4676', '阎良区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4677', '雁塔区', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4678', '高陵县', '438', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4679', '印台区', '439', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4680', '宜君县', '439', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4681', '王益区', '439', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4682', '耀州区', '439', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4683', '凤县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4684', '凤翔县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4685', '千阳县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4686', '太白县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4687', '岐山县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4688', '扶风县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4689', '渭滨区', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4690', '眉县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4691', '金台区', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4692', '陇县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4693', '陈仓区', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4694', '麟游县', '440', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4695', '三原县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4696', '干县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4697', '兴平市', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4698', '彬县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4699', '旬邑县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4700', '杨陵区', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4701', '武功县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4702', '永寿县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4703', '泾阳县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4704', '淳化县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4705', '渭城区', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4706', '礼泉县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4707', '秦都区', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4708', '长武县', '441', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4709', '临渭区', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4710', '华县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4711', '华阴市', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4712', '合阳县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4713', '大荔县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4714', '富平县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4715', '潼关县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4716', '澄城县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4717', '白水县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4718', '蒲城县', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4719', '韩城市', '442', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4720', '吴起县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4721', '子长县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4722', '安塞县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4723', '宜川县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4724', '宝塔区', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4725', '富县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4726', '延川县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4727', '延长县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4728', '志丹县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4729', '洛川县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4730', '甘泉县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4731', '黄陵县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4732', '黄龙县', '443', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4733', '佛坪县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4734', '勉县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4735', '南郑县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4736', '城固县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4737', '宁强县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4738', '汉台区', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4739', '洋县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4740', '留坝县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4741', '略阳县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4742', '西乡县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4743', '镇巴县', '444', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4744', '佳县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4745', '吴堡县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4746', '子洲县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4747', '定边县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4748', '府谷县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4749', '榆林市榆阳区', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4750', '横山县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4751', '清涧县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4752', '神木县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4753', '米脂县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4754', '绥德县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4755', '靖边县', '445', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4756', '宁陕县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4757', '岚皋县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4758', '平利县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4759', '旬阳县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4760', '汉滨区', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4761', '汉阴县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4762', '白河县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4763', '石泉县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4764', '紫阳县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4765', '镇坪县', '446', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4766', '丹凤县', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4767', '商南县', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4768', '商州区', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4769', '山阳县', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4770', '柞水县', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4771', '洛南县', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4772', '镇安县', '447', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4773', '七里河区', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4774', '城关区', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4775', '安宁区', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4776', '榆中县', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4777', '永登县', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4778', '皋兰县', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4779', '红古区', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4780', '西固区', '448', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4781', '嘉峪关市', '449', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4782', '永昌县', '450', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4783', '金川区', '450', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4784', '会宁县', '451', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4785', '平川区', '451', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4786', '景泰县', '451', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4787', '白银区', '451', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4788', '靖远县', '451', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4789', '张家川回族自治县', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4790', '武山县', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4791', '清水县', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4792', '甘谷县', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4793', '秦安县', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4794', '秦州区', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4795', '麦积区', '452', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4796', '凉州区', '453', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4797', '古浪县', '453', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4798', '天祝藏族自治县', '453', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4799', '民勤县', '453', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4800', '临泽县', '454', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4801', '山丹县', '454', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4802', '民乐县', '454', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4803', '甘州区', '454', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4804', '肃南裕固族自治县', '454', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4805', '高台县', '454', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4806', '华亭县', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4807', '崆峒区', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4808', '崇信县', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4809', '庄浪县', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4810', '泾川县', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4811', '灵台县', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4812', '静宁县', '455', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4813', '敦煌市', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4814', '玉门市', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4815', '瓜州县（原安西县）', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4816', '肃北蒙古族自治县', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4817', '肃州区', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4818', '金塔县', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4819', '阿克塞哈萨克族自治县', '456', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4820', '华池县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4821', '合水县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4822', '宁县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4823', '庆城县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4824', '正宁县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4825', '环县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4826', '西峰区', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4827', '镇原县', '457', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4828', '临洮县', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4829', '安定区', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4830', '岷县', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4831', '渭源县', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4832', '漳县', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4833', '通渭县', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4834', '陇西县', '458', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4835', '两当县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4836', '宕昌县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4837', '康县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4838', '徽县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4839', '成县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4840', '文县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4841', '武都区', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4842', '礼县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4843', '西和县', '459', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4844', '东乡族自治县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4845', '临夏县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4846', '临夏市', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4847', '和政县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4848', '广河县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4849', '康乐县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4850', '永靖县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4852', '临潭县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4853', '卓尼县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4854', '合作市', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4855', '夏河县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4856', '玛曲县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4857', '碌曲县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4858', '舟曲县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4859', '迭部县', '461', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4860', '城东区', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4861', '城中区', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4862', '城北区', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4863', '城西区', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4864', '大通回族土族自治县', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4865', '湟中县', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4866', '湟源县', '462', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4867', '乐都县', '463', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4868', '互助土族自治县', '463', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4869', '化隆回族自治县', '463', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4870', '平安县', '463', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4871', '循化撒拉族自治县', '463', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4872', '民和回族土族自治县', '463', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4873', '刚察县', '464', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4874', '海晏县', '464', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4875', '祁连县', '464', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4876', '门源回族自治县', '464', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4877', '同仁县', '465', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4878', '尖扎县', '465', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4879', '河南蒙古族自治县', '465', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4880', '泽库县', '465', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4881', '共和县', '466', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4882', '兴海县', '466', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4883', '同德县', '466', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4884', '贵南县', '466', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4885', '贵德县', '466', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4886', '久治县', '467', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4887', '玛多县', '467', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4888', '玛沁县', '467', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4889', '班玛县', '467', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4890', '甘德县', '467', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4891', '达日县', '467', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4892', '囊谦县', '468', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4893', '曲麻莱县', '468', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4894', '杂多县', '468', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4895', '治多县', '468', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4896', '玉树县', '468', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4897', '称多县', '468', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4898', '乌兰县', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4899', '冷湖行委', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4900', '大柴旦行委', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4901', '天峻县', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4902', '德令哈市', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4903', '格尔木市', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4904', '茫崖行委', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4905', '都兰县', '469', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4906', '兴庆区', '470', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4907', '永宁县', '470', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4908', '灵武市', '470', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4909', '西夏区', '470', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4910', '贺兰县', '470', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4911', '金凤区', '470', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4912', '大武口区', '471', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4913', '平罗县', '471', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4914', '惠农区', '471', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4915', '利通区', '472', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4916', '同心县', '472', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4917', '盐池县', '472', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4918', '青铜峡市', '472', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4919', '原州区', '473', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4920', '彭阳县', '473', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4921', '泾源县', '473', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4922', '西吉县', '473', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4923', '隆德县', '473', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4924', '中宁县', '474', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4925', '沙坡头区', '474', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4926', '海原县', '474', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4927', '东山区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4928', '乌鲁木齐县', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4929', '天山区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4930', '头屯河区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4931', '新市区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4932', '水磨沟区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4933', '沙依巴克区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4934', '达坂城区', '475', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4935', '乌尔禾区', '476', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4936', '克拉玛依区', '476', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4937', '独山子区', '476', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4938', '白碱滩区', '476', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4939', '吐鲁番市', '477', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4940', '托克逊县', '477', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4941', '鄯善县', '477', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4942', '伊吾县', '478', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4943', '哈密市', '478', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4944', '巴里坤哈萨克自治县', '478', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4945', '吉木萨尔县', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4946', '呼图壁县', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4947', '奇台县', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4948', '昌吉市', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4949', '木垒哈萨克自治县', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4950', '玛纳斯县', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4951', '米泉市', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4952', '阜康市', '479', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4953', '博乐市', '480', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4954', '温泉县', '480', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4955', '精河县', '480', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4956', '博湖县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4957', '和硕县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4958', '和静县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4959', '尉犁县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4960', '库尔勒市', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4961', '焉耆回族自治县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4962', '若羌县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4963', '轮台县', '481', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4964', '乌什县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4965', '库车县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4966', '拜城县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4967', '新和县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4968', '柯坪县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4969', '沙雅县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4970', '温宿县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4971', '阿克苏市', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4972', '阿瓦提县', '482', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4973', '乌恰县', '483', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4974', '阿克陶县', '483', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4975', '阿合奇县', '483', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4976', '阿图什市', '483', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4977', '伽师县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4978', '叶城县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4979', '喀什市', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4981', '岳普湖县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4982', '巴楚县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4983', '泽普县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4984', '疏勒县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4985', '疏附县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4986', '英吉沙县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4987', '莎车县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4988', '麦盖提县', '484', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4989', '于田县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4990', '和田县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4991', '和田市', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4992', '墨玉县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4993', '民丰县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4994', '洛浦县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4995', '皮山县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4996', '策勒县', '485', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4997', '伊宁县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4998', '伊宁市', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('4999', '奎屯市', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5000', '察布查尔锡伯自治县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5001', '尼勒克县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5002', '巩留县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5003', '新源县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5004', '昭苏县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5005', '特克斯县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5006', '霍城县', '486', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5007', '乌苏市', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5008', '和布克赛尔蒙古自治县', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5009', '塔城市', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5010', '托里县', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5011', '沙湾县', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5012', '裕民县', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5013', '额敏县', '487', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5014', '吉木乃县', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5015', '哈巴河县', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5016', '富蕴县', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5017', '布尔津县', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5018', '福海县', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5019', '阿勒泰市', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5020', '青河县', '488', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5021', '石河子市', '489', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5022', '阿拉尔市', '490', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5023', '图木舒克市', '491', '0', '3', null);
INSERT INTO `tp_area` VALUES ('5024', '五家渠市', '492', '0', '3', null);
INSERT INTO `tp_area` VALUES ('45055', '海外', '35', '0', '2', null);
INSERT INTO `tp_area` VALUES ('45065', '623', '45064', '100', '2', 'asd');
INSERT INTO `tp_area` VALUES ('45067', '333', '45065', '100', '3', '333');
INSERT INTO `tp_area` VALUES ('45071', '222', '45070', '100', '2', '');
INSERT INTO `tp_area` VALUES ('45072', '', '0', '0', '1', null);

-- ----------------------------
-- Table structure for tp_banner
-- ----------------------------
DROP TABLE IF EXISTS `tp_banner`;
CREATE TABLE `tp_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `update_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='andy - Banner主表';

-- ----------------------------
-- Records of tp_banner
-- ----------------------------
INSERT INTO `tp_banner` VALUES ('1', '首页顶部轮播', '啊啊啊', '100', '1', '1497930164', '1497930257');
INSERT INTO `tp_banner` VALUES ('2', '新闻页首页', '', '100', '1', '1497930884', '1497937245');
INSERT INTO `tp_banner` VALUES ('3', '名人纪念馆频道页顶部', '名人纪念馆频道页顶部', '100', '1', '1500447617', '0');

-- ----------------------------
-- Table structure for tp_banner_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_banner_item`;
CREATE TABLE `tp_banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `image` varchar(255) NOT NULL COMMENT '轮播图片',
  `title` varchar(100) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `update_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='andy - Banner副表';

-- ----------------------------
-- Records of tp_banner_item
-- ----------------------------
INSERT INTO `tp_banner_item` VALUES ('3', '1', 'javascript:;', '/static/upload/picture/20170719/2a727a87de70999b3220f04897b6692b.png', '第一个', '1', '1', '1497930866', '1500445462');
INSERT INTO `tp_banner_item` VALUES ('7', '3', 'javascript:;', '/static/upload/picture/20170719/abfb5956df0da71027eb8b656ef1ebd8.jpg', 'banner1', '1', '1', '1500447861', '0');
INSERT INTO `tp_banner_item` VALUES ('8', '3', 'javascript:;', '/static/upload/picture/20170719/c7116b350d35e037481b57e5a99165b1.jpg', 'banner2', '1', '1', '1500447879', '0');

-- ----------------------------
-- Table structure for tp_business_company
-- ----------------------------
DROP TABLE IF EXISTS `tp_business_company`;
CREATE TABLE `tp_business_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `unit_name` varchar(30) DEFAULT NULL COMMENT '单位名称',
  `address` varchar(50) DEFAULT NULL COMMENT '单位所在地',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` int(11) NOT NULL COMMENT '登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_business_company
-- ----------------------------
INSERT INTO `tp_business_company` VALUES ('10000', 'admin', '2e5be9b54da74a6a910806e5d49f968e', null, null, '22222222', '290648237@qq.com', '13330543405', '系统管理员', '9361', '2147483647', '1', '3', '0', null, '1474836470', '1496567683');
INSERT INTO `tp_business_company` VALUES ('10001', 'asdasda', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', '', '', '0', '0', '1', '2', '1', null, '1474836470', '1495700369');
INSERT INTO `tp_business_company` VALUES ('10002', 'test', '0bf4380c896c2075fb579e53eabcafd3', null, null, null, '290648237@qq.com', '', '', '20', '2147483647', '1', '4', '1', null, '1495962002', '1496304249');
INSERT INTO `tp_business_company` VALUES ('10003', 'test1', '0bf4380c896c2075fb579e53eabcafd3', 'test1', 'test1', null, '123@126.com', '13522663366', 'ssssssssss', '2', '2147483647', '1', null, '0', null, '1498115486', '1498115982');
INSERT INTO `tp_business_company` VALUES ('10004', 'test2', '', 'test2', '昆明市西山区', null, '123@126.com', '13522663366', '', '0', '0', '1', null, '0', null, '0', '0');
INSERT INTO `tp_business_company` VALUES ('10005', 'test3', '', 'test3', '昆明市西山区', null, '123@126.com', '13522663366', '', '0', '0', '1', null, '0', null, '0', '0');
INSERT INTO `tp_business_company` VALUES ('10006', 'test4', '0bf4380c896c2075fb579e53eabcafd3', 'test3', 'test3', null, '123@126.com', '13522663366', '', '0', '0', '1', null, '0', null, '0', '0');
INSERT INTO `tp_business_company` VALUES ('10007', 'aaaaa', '0bf4380c896c2075fb579e53eabcafd3', 'test1', '昆明市西山区', null, '123@126.com', '13522663366', '', '0', '0', '1', null, '0', null, '0', '0');
INSERT INTO `tp_business_company` VALUES ('10008', 'asdf', '0bf4380c896c2075fb579e53eabcafd3', 'test1', '昆明市西山区', null, '123@126.com', '13522663366', '', '0', '0', '1', null, '0', null, '0', '0');
INSERT INTO `tp_business_company` VALUES ('10009', 'asdf1', '0bf4380c896c2075fb579e53eabcafd3', 'test1', '昆明市西山区', null, '123@126.com', '13522663366', '', '0', '0', '1', null, '0', null, '0', '0');

-- ----------------------------
-- Table structure for tp_business_department
-- ----------------------------
DROP TABLE IF EXISTS `tp_business_department`;
CREATE TABLE `tp_business_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类父id 0 上级部门',
  `name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `describe` varchar(30) DEFAULT NULL COMMENT '部门描述',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_business_department
-- ----------------------------
INSERT INTO `tp_business_department` VALUES ('1', '0', '销售部', '这是个销售部门', '10003', '0', '0');
INSERT INTO `tp_business_department` VALUES ('2', '1', '销售1部', '销售1部销售1部销售1部销售1部', '10003', '0', '1');

-- ----------------------------
-- Table structure for tp_business_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_business_menu`;
CREATE TABLE `tp_business_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of tp_business_menu
-- ----------------------------
INSERT INTO `tp_business_menu` VALUES ('169', '0', '墓位管理', '', '', '#', '', '_self', '3', '1', '0', '1496474245');
INSERT INTO `tp_business_menu` VALUES ('170', '182', '首页', '', '', 'business/index/main', '', '_self', '0', '1', '0', '1496474494');
INSERT INTO `tp_business_menu` VALUES ('171', '182', '墓型分类', '', '', 'business/cemetery/category', '', '_self', '0', '1', '0', '1496474451');
INSERT INTO `tp_business_menu` VALUES ('172', '169', '公墓列表', '', '', 'business/cemetery/index', '', '_self', '0', '1', '0', '1496474280');
INSERT INTO `tp_business_menu` VALUES ('173', '182', '墓穴资料', '', '', 'business/cemetery/add', '', '_self', '10', '1', '0', '1496627553');
INSERT INTO `tp_business_menu` VALUES ('174', '0', '客户管理', '', '', '#', '', '_self', '4', '1', '0', '1496886212');
INSERT INTO `tp_business_menu` VALUES ('175', '174', '客户列表', '', '', 'business/customer/index', '', '_self', '0', '1', '0', '1496886237');
INSERT INTO `tp_business_menu` VALUES ('177', '0', '订单管理', '', '', '#', '', '_self', '5', '1', '0', '1496907376');
INSERT INTO `tp_business_menu` VALUES ('178', '177', '订单列表', '', '', 'business/order/index', '', '_self', '0', '1', '0', '1496907395');
INSERT INTO `tp_business_menu` VALUES ('179', '177', '添加订单', '', '', 'business/order/add', '', '_self', '0', '1', '0', '1496907408');
INSERT INTO `tp_business_menu` VALUES ('180', '174', '客户回访', '', '', 'business/customer/cvisit', '', '_self', '0', '0', '0', '1496974986');
INSERT INTO `tp_business_menu` VALUES ('181', '177', '销售人员', '', '', 'business/seller/index', '', '_self', '0', '1', '0', '1497345748');
INSERT INTO `tp_business_menu` VALUES ('182', '0', '基本设置', '', '', '#', '', '_self', '1', '1', '0', '1498099647');
INSERT INTO `tp_business_menu` VALUES ('183', '182', '部门设置', '', '', 'business/department/index', '', '_self', '0', '1', '0', '1498100259');
INSERT INTO `tp_business_menu` VALUES ('184', '182', '员工管理', '', '', 'business/staff/index', '', '_self', '0', '1', '0', '1498101049');
INSERT INTO `tp_business_menu` VALUES ('185', '182', '陵园设置', '', '', 'business/grave/index', '', '_self', '0', '1', '0', '1498101100');
INSERT INTO `tp_business_menu` VALUES ('186', '182', '墓区设置', '', '', 'business/tomb/index', '', '_self', '0', '1', '0', '1498101118');
INSERT INTO `tp_business_menu` VALUES ('190', '0', '寄存管理', '', '', '#', '', '_self', '7', '1', '0', '1498101735');
INSERT INTO `tp_business_menu` VALUES ('191', '0', '碑文管理', '', '', '#', '', '_self', '8', '1', '0', '1498101875');
INSERT INTO `tp_business_menu` VALUES ('192', '0', '财务报表', '', '', '#', '', '_self', '9', '1', '0', '1498102135');
INSERT INTO `tp_business_menu` VALUES ('194', '190', '骨灰盒型列表', '', 'fa fa-shopping-bag', 'business/storage/urntype', '', '_self', '0', '0', '0', '1498642566');
INSERT INTO `tp_business_menu` VALUES ('195', '190', '寄存分类列表', '', 'fa fa-percent', 'business/storage/category', '', '_self', '1', '1', '0', '1498643781');
INSERT INTO `tp_business_menu` VALUES ('196', '190', '寄存位平面图', '', 'fa fa-adjust', 'business/storage/urntree', '', '_self', '3', '1', '0', '1498698040');
INSERT INTO `tp_business_menu` VALUES ('197', '169', '墓位平面图', '', '', 'business/cemetery/cetree', '', '_self', '0', '1', '0', '1498705859');
INSERT INTO `tp_business_menu` VALUES ('198', '182', '寄存设置', '', '', 'business/storage/generateurn', '', '_self', '100', '1', '0', '1498726447');
INSERT INTO `tp_business_menu` VALUES ('199', '190', '寄存费用订单列表', '', 'fa fa-scribd', 'business/storage/order', '', '_self', '4', '1', '0', '1498872811');
INSERT INTO `tp_business_menu` VALUES ('200', '191', '碑文列表', '', 'fa fa-bank', 'business/inscription/inscription', '', '_self', '0', '1', '0', '1499049020');
INSERT INTO `tp_business_menu` VALUES ('201', '190', '寄存位列表', '', 'fa fa-anchor', 'business/storage/urn', '', '_self', '2', '1', '0', '1499151094');

-- ----------------------------
-- Table structure for tp_business_seller
-- ----------------------------
DROP TABLE IF EXISTS `tp_business_seller`;
CREATE TABLE `tp_business_seller` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '客户地址',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` int(11) NOT NULL COMMENT '登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_business_seller
-- ----------------------------
INSERT INTO `tp_business_seller` VALUES ('10003', 'ding', 'bb37a87740300eda441b910f6c6681b1', null, '123@126.com', '13522663366', '昆明市西山区', '没有描述', '0', '0', '1', null, '0', '10002', '1496902995', '1496906566');
INSERT INTO `tp_business_seller` VALUES ('10004', 'aaaaa', '0bf4380c896c2075fb579e53eabcafd3', null, '', '', '', '', '0', '0', '1', null, '0', '10002', '1496904445', '0');
INSERT INTO `tp_business_seller` VALUES ('10005', 'demo', '0bf4380c896c2075fb579e53eabcafd3', null, '123@126.com', '13522663366', '昆明市西山区', '', '0', '0', '1', null, '0', '10002', '1496996616', '0');

-- ----------------------------
-- Table structure for tp_business_staff
-- ----------------------------
DROP TABLE IF EXISTS `tp_business_staff`;
CREATE TABLE `tp_business_staff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `sector` varchar(30) DEFAULT NULL COMMENT '所属部门',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '客户地址',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `job` varchar(30) DEFAULT NULL COMMENT '职务',
  `start_time` date DEFAULT NULL COMMENT '入职时间',
  `end_time` date DEFAULT NULL COMMENT '离职时间',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` int(11) NOT NULL COMMENT '登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_business_staff
-- ----------------------------
INSERT INTO `tp_business_staff` VALUES ('10003', null, null, 'ding', 'bb37a87740300eda441b910f6c6681b1', null, '123@126.com', '13522663366', '昆明市西山区', '没有描述', null, null, null, '0', '0', '1', null, '0', '0', '10002', '1496902995', '1496906566');
INSERT INTO `tp_business_staff` VALUES ('10004', null, null, 'aaaaa', '0bf4380c896c2075fb579e53eabcafd3', null, '', '', '', '', null, null, null, '0', '0', '1', null, '0', '0', '10002', '1496904445', '0');
INSERT INTO `tp_business_staff` VALUES ('10005', null, null, 'demo', '0bf4380c896c2075fb579e53eabcafd3', null, '123@126.com', '13522663366', '昆明市西山区', '', null, null, null, '7', '2147483647', '1', null, '0', '0', '10002', '1496996616', '0');
INSERT INTO `tp_business_staff` VALUES ('10009', 'test4', '人事部', 'test4', '0bf4380c896c2075fb579e53eabcafd3', null, '123@126.com', '13522663366', null, '', null, null, null, '20', '2147483647', '1', null, '0', '0', '10003', '0', '0');
INSERT INTO `tp_business_staff` VALUES ('10010', null, null, 'asdf1', '0bf4380c896c2075fb579e53eabcafd3', null, '123@126.com', '13522663366', null, '', null, null, null, '0', '0', '1', null, '0', '0', '10009', '0', '0');
INSERT INTO `tp_business_staff` VALUES ('10011', 'kobe', '销售部', 'kobe123', '123456', null, '123@126.com', '13522663366', '昆明市西山区', '', '销售', '2017-06-27', '0000-00-00', '0', '0', '1', null, '0', '0', '10003', '1498548360', '1498551708');
INSERT INTO `tp_business_staff` VALUES ('10012', 'erty', '销售部', 'qwer', '0bf4380c896c2075fb579e53eabcafd3', null, '123@126.com', '13522663366', '昆明市西山区', '', '销售', '2017-06-27', '0000-00-00', '1', '2147483647', '1', null, '0', '0', '10003', '0', '0');

-- ----------------------------
-- Table structure for tp_business_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_business_user`;
CREATE TABLE `tp_business_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` int(11) NOT NULL COMMENT '登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_business_user
-- ----------------------------
INSERT INTO `tp_business_user` VALUES ('10000', 'admin', '2e5be9b54da74a6a910806e5d49f968e', '22222222', '290648237@qq.com', '13330543405', '系统管理员', '9360', '2147483647', '1', '3', '0', null, '1474836470', '1496567683');
INSERT INTO `tp_business_user` VALUES ('10001', 'asdasda', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', '', '0', '0', '1', '2', '1', null, '1474836470', '1495700369');
INSERT INTO `tp_business_user` VALUES ('10002', 'test', '0bf4380c896c2075fb579e53eabcafd3', null, '290648237@qq.com', '', '', '16', '2147483647', '1', '4', '0', null, '1495962002', '1496304249');

-- ----------------------------
-- Table structure for tp_cemetery
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery`;
CREATE TABLE `tp_cemetery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品自增ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公墓名称',
  `grave_id` int(11) NOT NULL COMMENT '所属陵园id',
  `row_id` int(11) NOT NULL COMMENT '所属区排id',
  `area_id` int(11) NOT NULL COMMENT '所属区域id',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '公墓价格',
  `type` enum('2','1') DEFAULT '1' COMMENT '墓穴类型 1单人墓 2双人墓',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0为开启 1为关闭',
  `image_id` varchar(200) DEFAULT NULL COMMENT '图片id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '产品描述',
  `stock` int(20) DEFAULT NULL COMMENT '库存',
  `create_by` varchar(255) DEFAULT NULL COMMENT '入库时间',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否删除 0正常1删除',
  `area` varchar(30) DEFAULT NULL COMMENT '墓穴面积',
  `stuff` varchar(20) DEFAULT NULL COMMENT '墓穴材料',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3098 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_cemetery
-- ----------------------------
INSERT INTO `tp_cemetery` VALUES ('3093', '公主墓', '1', '4', '2', '100.00', '1', '0', '/static/upload/picture/20170630/2dc5e54d729ae33153a328db8658b3a0.png', '<p>千万人群若群若群无若无</p>', '20', '10003', '0', null, null);
INSERT INTO `tp_cemetery` VALUES ('3094', '公主墓', '1', '4', '2', '100.00', '1', '0', '/static/upload/picture/20170630/2dc5e54d729ae33153a328db8658b3a0.png', '<p>千万人群若群若群无若无</p>', '20', '10003', '0', null, null);
INSERT INTO `tp_cemetery` VALUES ('3095', '古墓1', '1', '4', '2', '232323.00', '1', '0', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '20', '10003', '0', null, null);
INSERT INTO `tp_cemetery` VALUES ('3096', '烈士墓', '7', '3', '6', '232323.00', '2', '0', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '10', '10003', '0', null, null);
INSERT INTO `tp_cemetery` VALUES ('3097', '测试1', '7', '3', '6', '6666.00', '2', '0', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '10', '10003', '0', '16.8', '花岗岩');

-- ----------------------------
-- Table structure for tp_cemetery_area
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery_area`;
CREATE TABLE `tp_cemetery_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) DEFAULT '0' COMMENT '父id',
  `province` varchar(30) NOT NULL COMMENT '墓区省份',
  `city` varchar(30) NOT NULL COMMENT '墓区城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_cemetery_area
-- ----------------------------
INSERT INTO `tp_cemetery_area` VALUES ('1', '0', '广东省', '');
INSERT INTO `tp_cemetery_area` VALUES ('2', '1', '', '珠海市');
INSERT INTO `tp_cemetery_area` VALUES ('3', '1', '', '广州市');
INSERT INTO `tp_cemetery_area` VALUES ('5', '0', '四川省', '');
INSERT INTO `tp_cemetery_area` VALUES ('6', '5', '', '成都市');
INSERT INTO `tp_cemetery_area` VALUES ('7', '5', '', '南充市');

-- ----------------------------
-- Table structure for tp_cemetery_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery_category`;
CREATE TABLE `tp_cemetery_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类索引id',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `summary` text COMMENT '分类简介',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否删除 0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of tp_cemetery_category
-- ----------------------------
INSERT INTO `tp_cemetery_category` VALUES ('6', '花坛葬', '在花坛下放骨灰盒，上面种花', '0', '10003', '1500345845', '0');
INSERT INTO `tp_cemetery_category` VALUES ('7', '土葬', '下土埋葬', '0', '10003', '1500358412', '0');

-- ----------------------------
-- Table structure for tp_cemetery_consume
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery_consume`;
CREATE TABLE `tp_cemetery_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `id_card` varchar(30) NOT NULL COMMENT '身份证号',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `amount` varchar(30) DEFAULT NULL COMMENT '消费金额',
  `start_time` date DEFAULT NULL COMMENT '消费开始日期',
  `end_time` date DEFAULT NULL COMMENT '消费结束日期',
  `create_time` date DEFAULT NULL COMMENT '消费日期',
  `type` varchar(30) DEFAULT NULL COMMENT '消费类型',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `vaild` int(20) DEFAULT NULL COMMENT '有效期',
  `agent` varchar(30) DEFAULT NULL COMMENT '经办人',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_cemetery_consume
-- ----------------------------
INSERT INTO `tp_cemetery_consume` VALUES ('2', '大飒飒大师', '21212121212', '112121', '123131', '2017-07-11', '2018-07-17', '2017-07-11', '年费续费', '2017070756509955', '1', '10009', '10003');

-- ----------------------------
-- Table structure for tp_cemetery_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery_order`;
CREATE TABLE `tp_cemetery_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) NOT NULL COMMENT '订单编号',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `cemetery_sn` varchar(50) DEFAULT NULL COMMENT '公墓产品编号',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `deader_id_1` int(11) DEFAULT NULL COMMENT '逝者1 id',
  `deader_name_1` varchar(255) DEFAULT NULL COMMENT '逝者1姓名',
  `deader_id_2` int(11) DEFAULT NULL COMMENT '逝者2 id',
  `deader_name_2` varchar(255) DEFAULT NULL COMMENT '逝者2姓名',
  `hall_sn` bigint(20) DEFAULT NULL COMMENT '云纪念馆SN',
  `deal_time` date DEFAULT NULL COMMENT '成交时间',
  `payment_time` int(11) NOT NULL COMMENT '支付时间',
  `order_amount` int(10) NOT NULL DEFAULT '0' COMMENT '订单总价格',
  `goods_amount` int(10) DEFAULT NULL COMMENT '商品价格',
  `order_state` enum('0','10','20') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):预定;20:已付款;',
  `deposit` varchar(50) DEFAULT NULL COMMENT '定金金额',
  `reserve_time` date DEFAULT NULL COMMENT '预定时间',
  `reserve_end_time` date DEFAULT NULL COMMENT '预定结束时间',
  `refund_time` date DEFAULT NULL COMMENT '订单取消时间',
  `end_time` date DEFAULT NULL COMMENT '墓穴年费到期时间',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  `ship` varchar(20) DEFAULT NULL COMMENT '客户与逝者关系',
  `seller` varchar(50) DEFAULT NULL COMMENT '销售人员',
  `create_by` int(20) DEFAULT NULL COMMENT '创建人',
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '是否删除 0正常1删除',
  `refund` varchar(255) DEFAULT NULL COMMENT '订单退款',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='andy - 祭祀商品订单表';

-- ----------------------------
-- Records of tp_cemetery_order
-- ----------------------------
INSERT INTO `tp_cemetery_order` VALUES ('3', '10002149', null, '10002050020', '0', 'ding', null, null, null, null, '149', '0000-00-00', '0', '12222', null, '0', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('4', '10002148', null, '10002050019', '0', 'aaaaa', null, null, null, null, '148', '0000-00-00', '0', '12222', null, '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('5', '10002135', 'asdasdasd', '10002050006', '0', 'demo', null, null, null, null, '135', '0000-00-00', '0', '453', '100', '20', null, null, null, null, null, '0', '0', null, '34344', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('6', '10002145', 'asdasdasd', '10002050016', '0', 'aaaaa', null, null, null, null, '145', '0000-00-00', '0', '221100', '100', '0', null, null, null, null, null, '0', '0', null, '234234', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('7', '10002148', 'asdasdasd', '10002050019', '0', 'demo', null, null, null, null, '148', '0000-00-00', '0', '221100', '100', '20', null, null, null, null, null, '0', '0', null, '234234', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('8', '10002132', '1111111111111111', '10002050003', '0', 'ding', null, null, null, null, '132', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('9', '10002132', '1111111111111111', '10002050003', '0', 'ding', null, null, null, null, '132', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('10', '10002132', '1111111111111111', '10002050003', '0', 'ding', null, null, null, null, '132', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('11', '10002134', '45689', '10002050005', '0', 'demo', null, null, null, null, '134', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('12', '10002132', '1111111111111111', '10002050003', '0', 'demo', null, null, null, null, '132', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('13', '10002130', 'bbbb1111', '10002050001', '0', 'demo', null, null, null, null, '130', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'ding', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('14', '10002133', '2222111', '10002050004', '0', 'aaaaa', null, null, null, null, '133', '0000-00-00', '0', '12222', '100', '20', null, null, null, null, null, '0', '0', null, 'demo', '10002', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('22', '2017070599534899', '烈士墓', 'BBS_3_3_01_2', '10025', '乔布斯', '1012', 'dfg1', '1013', 'dasd', null, '2017-07-07', '0', '232123', null, '0', '200', '2017-07-05', null, '2017-07-06', null, '0', '0', '312312', '10009', '10003', '0', '180');
INSERT INTO `tp_cemetery_order` VALUES ('23', '2017070699539753', '烈士墓', 'BBS_3_3_03_2', '10026', 'ssss', null, null, null, null, null, '2017-07-06', '0', '232323', null, '20', null, null, null, null, null, '0', '0', '121', '10011', '10003', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('24', '2017070699525353', '烈士墓', 'BBS_3_3_04_2', '10027', 'dsds', null, null, null, null, null, '2017-07-06', '0', '232323', null, '20', null, null, null, null, null, '0', '0', '312', '10011', '10003', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('25', '2017070650100100', '烈士墓', 'BBS_3_3_05_2', '10028', 'wer', null, null, null, null, null, '2017-07-06', '0', '232323', null, '20', null, null, null, null, null, '0', '0', '亲戚', '10012', '10003', '0', null);
INSERT INTO `tp_cemetery_order` VALUES ('27', '2017070756509955', '烈士墓', 'BBS_3_3_01_2', '10030', '大飒飒大师', null, null, null, null, null, null, '0', '0', null, '10', '2333', '2017-07-03', null, null, null, '0', '0', '1212', '10009', null, '0', null);

-- ----------------------------
-- Table structure for tp_cemetery_sn
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery_sn`;
CREATE TABLE `tp_cemetery_sn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品自增ID',
  `cemetery_id` int(11) NOT NULL COMMENT '关联id',
  `cemetery_sn` varchar(200) NOT NULL COMMENT '产品编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公墓名称',
  `row_id` int(11) NOT NULL COMMENT '所属区排id',
  `area_id` int(11) NOT NULL COMMENT '所属区域id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '公墓价格',
  `area` varchar(30) DEFAULT NULL COMMENT '墓穴面积',
  `stuff` varchar(20) DEFAULT NULL COMMENT '墓穴材料',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1为开启 0为关闭',
  `image_id` varchar(200) DEFAULT NULL COMMENT '图片id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '产品描述',
  `is_sell` tinyint(2) DEFAULT '0' COMMENT '状态 0未出售 1已出售 2已预定',
  `stock` int(20) DEFAULT NULL COMMENT '库存',
  `create_by` varchar(255) DEFAULT NULL COMMENT '操作人',
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '是否删除 0未删除 1删除',
  `type` enum('2','0','1') DEFAULT '0' COMMENT '墓穴类型 1单人墓 2双人墓 0空',
  `grave_id` int(11) NOT NULL COMMENT '所属陵园id',
  `is_move` tinyint(2) DEFAULT '0' COMMENT '是否空闲 0空闲 1占用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3303 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_cemetery_sn
-- ----------------------------
INSERT INTO `tp_cemetery_sn` VALUES ('3247', '3095', 'JDS_2_4_01_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '1', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3248', '3095', 'JDS_2_4_02_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '2', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3249', '3095', 'JDS_2_4_03_1', '古墓1', '4', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3250', '3095', 'JDS_2_4_04_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3251', '3095', 'JDS_2_4_05_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3252', '3095', 'JDS_2_4_06_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3253', '3095', 'JDS_2_4_07_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3254', '3095', 'JDS_2_4_08_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3255', '3095', 'JDS_2_4_09_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3256', '3095', 'JDS_2_4_10_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3257', '3095', 'JDS_2_4_11_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3258', '3095', 'JDS_2_4_12_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3259', '3095', 'JDS_2_4_13_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3260', '3095', 'JDS_2_4_14_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3261', '3095', 'JDS_2_4_15_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3262', '3095', 'JDS_2_4_16_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3263', '3095', 'JDS_2_4_17_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3264', '3095', 'JDS_2_4_18_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3265', '3095', 'JDS_2_4_19_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3266', '3095', 'JDS_2_4_20_1', '古墓1', '4', '2', '232323.00', null, null, '1', '/static/upload/picture/20170701/93527ce5a95a91e80cd36a47cb043737.png', '<p>阿萨奥所大所多</p>', '0', '20', '10003', '0', '1', '1', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3278', '3096', 'BBS_3_3_01_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '2', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3279', '3096', 'BBS_3_3_02_2', '烈士墓', '3', '6', '232323.00', null, null, '0', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '0', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3280', '3096', 'BBS_3_3_03_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '1', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3281', '3096', 'BBS_3_3_04_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '1', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3282', '3096', 'BBS_3_3_05_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '1', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3283', '3096', 'BBS_3_3_06_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '0', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3284', '3096', 'BBS_3_3_07_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '0', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3285', '3096', 'BBS_3_3_08_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '0', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3286', '3096', 'BBS_3_3_09_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '0', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3287', '3096', 'BBS_3_3_10_2', '烈士墓', '3', '6', '232323.00', null, null, '1', '/static/upload/picture/20170701/24d6485be40c7908e5287491e67f9b06.png', '<p>大叔大婶大所大所</p>', '0', '10', '10003', '0', '2', '7', null);
INSERT INTO `tp_cemetery_sn` VALUES ('3288', '3097', 'BBS_3_3_01_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3289', '3097', 'BBS_3_3_02_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3290', '3097', 'BBS_3_3_03_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3291', '3097', 'BBS_3_3_04_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3292', '3097', 'BBS_3_3_05_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3293', '3097', 'BBS_3_3_06_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3294', '3097', 'BBS_3_3_07_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3295', '3097', 'BBS_3_3_08_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3296', '3097', 'BBS_3_3_09_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');
INSERT INTO `tp_cemetery_sn` VALUES ('3297', '3097', 'BBS_3_3_10_2', '测试1', '3', '6', '6666.00', '16.8', '花岗岩', '1', '/static/upload/picture/20170724/b5835757a8e48c494180963b0b17727a.jpg', '<p>测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1</p>', '0', '10', '10003', '0', '2', '7', '0');

-- ----------------------------
-- Table structure for tp_cemetery_tomb
-- ----------------------------
DROP TABLE IF EXISTS `tp_cemetery_tomb`;
CREATE TABLE `tp_cemetery_tomb` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int(11) DEFAULT '0' COMMENT '上级分类id',
  `cate_id` int(11) DEFAULT '0' COMMENT '墓型id',
  `code` char(20) DEFAULT '0' COMMENT '墓区或排区编号，陵园字母缩写',
  `name` varchar(30) DEFAULT NULL COMMENT '区名',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `grave_province` varchar(20) DEFAULT NULL COMMENT '陵园所在省份',
  `grave_city` varchar(20) DEFAULT NULL COMMENT '陵园所在城市',
  `price_min` varchar(50) DEFAULT NULL COMMENT '陵园价格区间(最低价)',
  `price_max` varchar(50) DEFAULT NULL COMMENT '陵园价格区间(最高价)',
  `range` varchar(150) DEFAULT NULL COMMENT '陵园经营范围',
  `phone` varchar(50) DEFAULT NULL COMMENT '陵园联系电话',
  `direction` varchar(30) DEFAULT NULL COMMENT '墓区朝向',
  `distance` varchar(30) DEFAULT NULL COMMENT '陵园距离市区的距离',
  `image_id` varchar(150) DEFAULT NULL COMMENT '陵园封面照片',
  `address` varchar(150) DEFAULT NULL COMMENT '陵园所在地',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_cemetery_tomb
-- ----------------------------
INSERT INTO `tp_cemetery_tomb` VALUES ('1', '0', '0', 'JDS', '金顶山', '0', '10003', '广东省', '广州市', '3600', '18000', null, null, null, null, '/static/upload/picture/20170719/25d4a81342fbd10f6bfc36a99a7ad9bb.jpg', '北京市西城区', '', '0');
INSERT INTO `tp_cemetery_tomb` VALUES ('2', '1', '6', '2', '2号区', '0', '10003', null, null, '4800', '12000', null, null, null, null, '/static/upload/picture/20170720/589d2fc7926a65d1094eef53b79b4549.jpg', null, '花坛葬', '0');
INSERT INTO `tp_cemetery_tomb` VALUES ('6', '7', '7', '3', '百草生态苑', '0', '10003', null, null, '2800', '7800', null, null, null, null, '/static/upload/picture/20170720/715ec424c848499b81890b30e4b3b552.jpg', null, '土葬', '0');
INSERT INTO `tp_cemetery_tomb` VALUES ('7', '0', '0', 'BBS', '八宝山', '0', '10003', '四川省', '南充市', '4800', '16000', '丧葬行业,殡仪服务', null, null, null, '/static/upload/picture/20170719/29e4ec16e8c6c8a9a4eeba4dd653413f.jpg', '北京市东城区', '大型陵园', '0');
INSERT INTO `tp_cemetery_tomb` VALUES ('9', '0', '0', 'SYY', '圣佑园', '0', '10003', '广东省', '广州市', null, null, null, null, null, null, null, '广东省广州市XXXXXXX', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('10', '0', '0', 'TYY', '天有园', '0', '10003', '广东省', '珠海市', null, null, null, null, null, null, null, '广东省珠海市XXXXXXX', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('11', '0', '0', 'BBS', '将军墓', '0', '10003', '山西省', '大同市', null, null, null, null, null, null, null, '昆明市西山区', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('12', '0', '0', 'LHY', '将军墓1', '0', '10003', '四川省', '成都市', null, null, null, null, null, null, null, '四川省成都市XXXXX', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('13', '0', '0', 'LHY', '将军墓1', '0', '10003', '四川省', '南充市', null, null, null, null, null, null, null, '四川省南充市XXXXX', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('14', '0', '0', 'BBS', 'bbbb1111', '0', '10003', '四川省', '南充市', null, null, null, null, null, null, null, '四川省南充市XXXXX', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('15', '0', '0', 'BBS', 'bbbb1111', '0', '10003', '四川省', '南充市', null, null, null, null, null, null, null, '四川省南充市XXXXX', '', '1');
INSERT INTO `tp_cemetery_tomb` VALUES ('16', '1', '6', '2', '2号区', '0', '10003', null, null, '4800', null, null, null, null, null, null, null, '主要树葬', '0');

-- ----------------------------
-- Table structure for tp_consume
-- ----------------------------
DROP TABLE IF EXISTS `tp_consume`;
CREATE TABLE `tp_consume` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `cs_sn` bigint(20) NOT NULL COMMENT '记录唯一标识',
  `cs_member_id` int(11) NOT NULL COMMENT '会员编号',
  `cs_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `cs_account` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '消费金额',
  `cs_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `cs_payment_name` varchar(15) DEFAULT '' COMMENT '付款方式',
  `cs_trade_sn` varchar(50) NOT NULL COMMENT '第三方支付接口交易号',
  `cs_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pd_payment_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `pd_payment_state` enum('0','1') DEFAULT '0' COMMENT '支付状态0未支付1支付',
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_consume
-- ----------------------------

-- ----------------------------
-- Table structure for tp_customer
-- ----------------------------
DROP TABLE IF EXISTS `tp_customer`;
CREATE TABLE `tp_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `id_card` varchar(50) DEFAULT NULL COMMENT '客户身份证号',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `plane` varchar(50) DEFAULT NULL COMMENT '客户座机号码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '客户地址',
  `work_address` varchar(100) DEFAULT NULL COMMENT '客户工作地址',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` int(11) NOT NULL COMMENT '登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_customer
-- ----------------------------
INSERT INTO `tp_customer` VALUES ('10003', 'ding', 'bb37a87740300eda441b910f6c6681b1', null, null, '123@126.com', null, '13522663366', '昆明市西山区', null, '没有描述', '0', '0', '1', null, '0', '10002', '1496902995', '1496906566');
INSERT INTO `tp_customer` VALUES ('10004', 'aaaaa', '0bf4380c896c2075fb579e53eabcafd3', null, null, '', null, '13522663366', '昆明市西山区', null, '', '0', '0', '1', null, '0', '10002', '1496904445', '0');
INSERT INTO `tp_customer` VALUES ('10005', 'demo', '0bf4380c896c2075fb579e53eabcafd3', null, null, '123@126.com', null, '13522663366', '昆明市西山区', null, '', '0', '0', '1', null, '0', '10002', '1496996616', '0');
INSERT INTO `tp_customer` VALUES ('10008', 'QWER', 'd8306338dff3a63804b2ccec160b6abb', null, null, '123@126.com', null, '13522663366', '昆明市西山区', null, '', '0', '0', '1', null, '0', '10003', '1498635871', '0');
INSERT INTO `tp_customer` VALUES ('10025', '乔布斯', '', '88423423423423', null, '123@qq.com', '41241', '3434123412412', '美国', '美国', '', '0', '0', '1', null, '0', '10003', '1499238748', '0');
INSERT INTO `tp_customer` VALUES ('10026', 'ssss', '', '4124124124124', null, '123@qq.com', '312312313', '12414124', 'kunm', 'kunm', '', '0', '0', '1', null, '0', '10003', '1499306764', '0');
INSERT INTO `tp_customer` VALUES ('10027', 'dsds', '', '42342342342', null, '123@qq.com', '3123', '23123123', 'kunm', 'kunm', '', '0', '0', '1', null, '0', '10003', '1499306860', '0');
INSERT INTO `tp_customer` VALUES ('10028', 'wer', '', '34234242', null, '123@qq.com', '231231', '4123131', 'kunm', 'kunm', '', '0', '0', '1', null, '0', '10003', '1499307138', '0');
INSERT INTO `tp_customer` VALUES ('10029', 'dfi', '', 'r2423423423', null, '123@qq.com', '312312312', '2312312312', '昆明', 'kunm', '', '0', '0', '1', null, '0', '10003', '1499331195', '0');
INSERT INTO `tp_customer` VALUES ('10030', '大飒飒大师', '', '21212121212', null, '', '', '112121', '大大是', '', '', '0', '0', '1', null, '0', '10003', '1499412248', '0');

-- ----------------------------
-- Table structure for tp_customer_visit
-- ----------------------------
DROP TABLE IF EXISTS `tp_customer_visit`;
CREATE TABLE `tp_customer_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL COMMENT '关联id',
  `visit` varchar(20) DEFAULT NULL COMMENT '回访人',
  `username` varchar(20) NOT NULL COMMENT '回访客户',
  `title` varchar(50) NOT NULL COMMENT '回访标题',
  `content` varchar(255) DEFAULT NULL COMMENT '回访内容',
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回访时间',
  `create_by` int(20) DEFAULT NULL COMMENT '创建人',
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '删除状态 0正常 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_customer_visit
-- ----------------------------
INSERT INTO `tp_customer_visit` VALUES ('1', '10003', 'das', 'ding', '流水管理', '', '2017-06-13 15:52:26', '10002', '0');
INSERT INTO `tp_customer_visit` VALUES ('2', '10003', 'das', 'ding', '流水管理', '', '2017-06-13 00:00:00', '10002', '0');

-- ----------------------------
-- Table structure for tp_document
-- ----------------------------
DROP TABLE IF EXISTS `tp_document`;
CREATE TABLE `tp_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档id',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `category_id` int(11) NOT NULL COMMENT '所属分类',
  `description` char(200) NOT NULL DEFAULT '' COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `position` smallint(5) NOT NULL DEFAULT '0' COMMENT '推荐位',
  `image` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '访问量',
  `display` tinyint(2) NOT NULL DEFAULT '1' COMMENT '可见性 1可见 0隐藏',
  `is_top` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `author` char(50) NOT NULL DEFAULT '云纪念' COMMENT '作者',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1正常 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='andy - 文档模型基础表';

-- ----------------------------
-- Records of tp_document
-- ----------------------------
INSERT INTO `tp_document` VALUES ('1', '', '中国传统礼仪――拜贺庆吊之礼', '3', '中国自古以来就是个人情社会，靠的无非是相互之间的体恤和关怀，用传统的礼仪来诠释就是拜贺庆吊之礼。其传统的拜贺庆吊也有很多要注意的细节和规矩。在节庆期间，一般是身份低级的人向尊长等行礼庆贺，也不是绝对的', null, '0', '/static/upload/picture/20170626/43586f8b6ee134eeb262b44e696c6cce.jpg', '5', '1', '1', '云纪念', '0', '0', '1455379200', '1');
INSERT INTO `tp_document` VALUES ('2', '', '传统文化是社会主义核心价值观的基础 普及要“学”“践”结合', '3', '钱逊：传统文化是社会主义核心价值观的基础普及要“学”“践”结合人民网北京9月21日电今年是孔子诞辰的2565周年，为传承弘扬优秀传统文化，更好地诠释孔子及儒家文化的内涵与意义，在孔子诞辰来临之际，国家', null, '0', '/static/upload/picture/20170626/7c2fbb517ca28e3903d102f1345296f0.jpg', '2', '1', '1', '云纪念', '0', '0', '1411401600', '1');
INSERT INTO `tp_document` VALUES ('3', '', '芒种养生', '4', '芒种时节，我国长江中、下游地区开始进人梅雨季节，持续阴雨，雨量增多，气温升高，空气非常潮湿，天气十分闷热，各种物品容易发霉，蚊虫开始孳生，极易传染疾病。根据这一气候特点，这一时期的健身养生应注意以下几', null, '0', '/static/upload/picture/20170626/04a12400638841c0a45af43158014515.jpg', '2', '1', '0', '云纪念', '0', '0', '1496592000', '1');
INSERT INTO `tp_document` VALUES ('4', '', '芒种', '4', '简介芒种，是农历二十四节气中的第9个节气，此时太阳到达黄经75度。芒种的“芒”字，是指麦类等有芒植物的收获，芒种的“种”字，是指谷黍类作物播种的节令。“芒种”二字谐音，表明一切作物都在“忙种”了。所以', null, '0', '/static/upload/picture/20170626/b8b5c94bc28e2b8965fbc2d5520edf19.jpg', '3', '1', '0', '云纪念', '0', '0', '1496592000', '1');
INSERT INTO `tp_document` VALUES ('5', '', '网络祭祀渐成新民俗 在网上为逝去亲人写封信', '4', '原标题：在网上，为逝去的亲人写封信来源：人民网【家书寄思念・清明祭祀新民俗】“再也吹不响奶奶为我做的柳哨，再也吃不到妈妈炒的椿芽鸡蛋……”清明前夕，网友“灵犀”一家通过互联网祭扫平台，为逝去的亲人写了', null, '0', '/static/upload/picture/20170626/61a766df13f5a21cbee7d7428bedbd73.jpg', '2', '1', '1', '云纪念', '0', '0', '1491321600', '1');
INSERT INTO `tp_document` VALUES ('6', '', '《三字经》经久不衰的文化魅力', '5', '　“人之初，性本善。性相近，习相远。苟不教，性乃迁。……”三字经传唱了几千年的国学经典，一直引导人们为人处世中不断取得进步，历久倡导的性善论与这个时代共存。所谓的生存之道没有固定的路线，需要兼并着我们', null, '0', '/static/upload/picture/20170626/7b78fff488ccb2c72d30a8730cd27263.jpg', '0', '1', '0', '云纪念', '0', '0', '1455465600', '1');
INSERT INTO `tp_document` VALUES ('7', '', '悉数影响中国历史的十大人物', '5', '1、孔子这位被尊奉为“天尊之圣”的儒家学派创始人孔子，是我国历史上著名的思想家、教育家、政治家，被列为“世界十大文化名人”之首，是当时社会上不可多得的博学者，至今受众人敬仰。儒家思想传承至今，对中国乃', null, '0', '/static/upload/picture/20170626/b53a64c2f9b8e5136002f0e5b54f7f2f.jpg', '1', '1', '0', '云纪念', '0', '0', '1447948800', '1');
INSERT INTO `tp_document` VALUES ('8', '', '中国传统文化都有哪些？', '5', '中国传统文化是中华文明演化而汇集成的反映民族特质风貌，是各种思想文化、观念形态的总体表现，为中华民族世世代代所继承发展的、具有鲜明民族特色的、历史悠久、内涵博大精深。中华民族几千年文明的结晶，除了儒家', null, '0', '/static/upload/picture/20170626/5969f72e1c6c7460dd0254857f0fa688.jpg', '2', '1', '1', '云纪念', '0', '0', '1447689600', '1');
INSERT INTO `tp_document` VALUES ('9', '', '父爱如山，为天下所有父亲点赞!', '6', '父爱太重、文字太轻，再华丽的词藻也无法诠释父爱的伟大。父母在人生尚有来处，父母去人生只剩归途；父若在，请珍惜、请给他爱的表达；父若去，成追忆、他是前方的灯塔！父爱如山，深沉而又博大；父爱如海，深沉而又', null, '0', '/static/upload/picture/20170626/8b49f66af6e8d367831efa315aa5dff0.jpg', '9', '1', '0', '云纪念', '0', '0', '1497456000', '1');
INSERT INTO `tp_document` VALUES ('10', '', '父亲不知父亲节', '6', '“孩子啊！啥节不节的，你说了半天我也没弄明白。爸不需要啥节日，你们好好上学，放假都回家了，就是最好的节啊！罗从政《中国青年报》（2015年06月19日08版）这么多年，我一直觉得我与父亲在电话线中隔得', null, '0', '/static/upload/picture/20170626/42823f338559982dcff82a6ccb7d3c7f.jpg', '2', '1', '0', '云纪念', '0', '0', '1465660800', '1');
INSERT INTO `tp_document` VALUES ('11', '', '微电影《谎言》伟大的母爱，可怜天下父母心', '6', '一位平凡的农村母亲为女儿准备嫁妆，来到曹妃甸做了一名洗车工人，几年如一日，忍着疾病，瞒着女儿，善意的谎言，伟大的母爱，催人泪下。', null, '0', '/static/upload/picture/20170626/2c1a730bf2b6749fc7c33093b118018e.jpg', '1', '1', '0', '云纪念', '0', '0', '1455465600', '1');
INSERT INTO `tp_document` VALUES ('12', '', '妈妈，让我再爱你一次', '6', '妈妈，让我再爱你一次四季在轮回，生命在延续，母爱已埋于心间，成为了永久的回忆。我的爱还没来得及却随风逝去。我多想，将我的爱还于妈妈，也让妈妈感受到世间所有的温存。我多想再爱你一次妈妈!燕子飞时，春满枝', null, '0', '/static/upload/picture/20170626/b6b6ab0bbd94c1548bd7d1b790cb9457.jpg', '3', '1', '0', '云纪念', '0', '0', '1448812800', '1');
INSERT INTO `tp_document` VALUES ('13', '', '《跪羊图》感恩母亲,感人歌曲MV', '6', '《跪羊图》一首感母恩的感人歌曲MV，快乐男声、出彩中国人都有选手唱过，非常感人！跪羊图古圣先贤孝为宗万善之门孝为基礼敬尊亲如活佛成就生命大意义父母恩德重如山知恩报恩不忘本做人饮水要思源才不愧对父母恩小', null, '0', '/static/upload/picture/20170626/aaeb87ef85b14eebe499660abf37756c.jpg', '2', '1', '0', '云纪念', '0', '0', '1393776000', '1');
INSERT INTO `tp_document` VALUES ('14', '', '青少年教育与传统美德', '6', '第一，培养当代青少年的国家忧患意识，增强社会责任感。中华民族的忧患意识十分强烈，历史上有过无数忧国忧民的志士仁人。这种忧患意识又总与社会责任感联系在一起，成为中华民族传统美德的重要组成部分。当代青少年', null, '0', '/static/upload/picture/20170626/828fdb1756481436b6511157df231c59.jpg', '1', '1', '0', '云纪念', '0', '0', '1370188800', '1');
INSERT INTO `tp_document` VALUES ('15', '', '浙江在线：网上祭祀应推广', '7', '清明节将到，笔者老家一位朋友的母亲去世一年余，而他在外地工作，常常思念母亲，又不方便去墓园。于是近日他在网上建立了一个纪念馆，每当想念母亲时，便将自己的感受和想对母亲说的话，发在纪念馆里。网上祭祀是一', null, '0', '/static/upload/picture/20170626/3351d1023b20e4f9c9f4d680bf9b9afb.jpg', '3', '1', '0', '云纪念', '0', '0', '1491321600', '1');
INSERT INTO `tp_document` VALUES ('16', '', '清明祭祀贵有三“心”', '7', '　　“南北山头多墓田，清明祭扫各纷然。”又是一年清明将至，国人如何寄托对故人的哀思？记者发现，从“苹果手机”等新潮祭品的热销，到网上祭祀、微信直播“代客扫墓”的兴起，随着物质条件的改善和互联网日益深入', null, '0', '/static/upload/picture/20170626/4aa26d615f2f50d452d88d6e1f629d4d.jpg', '2', '1', '1', '云纪念', '0', '0', '1490976000', '1');
INSERT INTO `tp_document` VALUES ('17', '', '心理专家：避免扫墓伤心过度，网上祭扫有益健康', '7', '（原标题：扫墓伤心过度心理问题高发）场景1思念逝者精神恍惚　　这两个星期，50岁的苏伯总是闷闷不乐，不出外锻炼，也不去参加老年大学的一些活动，这可急坏了儿子小苏。小苏的妻子不经意间看到公公边看相册边抹', null, '0', '/static/upload/picture/20170626/6c78aa84493a92c4244020a369ccfce7.jpg', '1', '1', '0', '云纪念', '0', '0', '1490803200', '1');
INSERT INTO `tp_document` VALUES ('18', '', '过小年吃什么?', '23', '吃饺子祭灶节，民间讲究吃饺子，取意“送行饺子迎风面”。山区多吃糕和荞面。晋东南地区，流行吃炒玉米的习俗，民谚有“二十三，不吃炒，大年初一一锅倒”的说法。人们喜欢将炒玉米用麦芽糖粘结起来，冰冻成大块，吃', null, '0', '/static/upload/picture/20170626/abcdb3300d2525e4e45b4755fe583371.jpg', '1', '1', '0', '云纪念', '0', '0', '1482768000', '1');
INSERT INTO `tp_document` VALUES ('19', '', '小年的习俗都有哪些？', '23', '小年习俗祭灶王祭灶小年这天，也是民间祭灶的日子。民间传说，每年腊月二十三，灶王爷都要上天向玉皇大帝禀报这家人的善恶，让玉皇大帝赏罚。因此送灶时，人们在灶王像前的桌案上供放糖果、清水、料豆、秣草；其中，', null, '0', '/static/upload/picture/20170626/6f9dcad7fdb6042cafac6aaed3501444.jpg', '1', '1', '0', '云纪念', '0', '0', '1482768000', '1');
INSERT INTO `tp_document` VALUES ('20', '', '小年的由来', '23', '农历十二月二十三和二十四，是中国民间传统的祭灶日，又称“小年”。小年的传说：灶王爷原为平民张生，娶妻之后终日花天酒地，败尽家业沦落到上街行乞。一天，他乞讨到了前妻郭丁香家，羞愧难当，一头钻到灶锅底下烧', null, '0', '/static/upload/picture/20170626/4ed613870396d7726e86a468e25727ec.jpg', '1', '1', '0', '云纪念', '0', '0', '1482768000', '1');
INSERT INTO `tp_document` VALUES ('21', '', '腊月二十三，又称\"小年\"，是民间祭灶的日子', '23', '腊月二十三，又称\"小年\"，是民间祭灶的日子。据说，每年腊月二十三，灶王爷都要上天向玉皇大帝禀报这家人的善恶，让玉皇大帝赏罚。因此送灶时，人们在灶王像前的桌案上供放糖果、清水、料豆、秣草;其中,后三样是', null, '0', '/static/upload/picture/20170626/66100458ec12677165aaa0dd179a7407.jpg', '1', '1', '0', '云纪念', '0', '0', '1258300800', '1');
INSERT INTO `tp_document` VALUES ('22', '', '除夕和“年”', '24', '　年三十，也就是\"除夕\"。这天，是人们吃、喝、玩、乐的日子。北方人包饺子，南方人做年糕。水饺形似\"元宝\"，年糕音似\"年高\"，都是吉祥如意的好兆头。除夕之夜，全家人在一起吃\"团年饭\"，有一家人团聚过年的', null, '0', '/static/upload/picture/20170626/10c191a74b369bae4d4aa9d16ecb79f9.jpg', '1', '1', '0', '云纪念', '0', '0', '1258300800', '1');
INSERT INTO `tp_document` VALUES ('23', '', '春节回家，请你尽\'五孝\',做\'十事\'', '25', '　　道教说：“天上无不孝的神仙”。把孝道列为修仙之首德，你没把父母照顾好，修行都是修不了多大成就的，人道都没做好还想上求仙道，道派之“净明忠孝道”就提倡“以孝修仙”。所以，古代出了一些修孝道成仙的人物', null, '0', '/static/upload/picture/20170626/c3268b0f2017193324005cd1e7b76dbd.jpg', '1', '1', '0', '云纪念', '0', '0', '1484409600', '1');
INSERT INTO `tp_document` VALUES ('24', '', '天堂也有年夜饭', '25', '几千年来，除夕是中华大地上最为特别的日子。华夏儿女那怕远居他乡、跨越千山万水也要回家团聚、与家人一起吃年夜饭。这年夜饭吃的不仅是一顿饭，更是一种味道，一份眷恋……然而随着亲人的远去，年夜饭却难寻其味。', null, '0', '/static/upload/picture/20170626/6075ff7de1e80c85248ef97447cdfd8f.jpg', '1', '1', '0', '云纪念', '0', '0', '1484236800', '1');
INSERT INTO `tp_document` VALUES ('25', '', '进了腊月就是年――腊月、年关为啥忙？', '25', '农历十二月为什么叫“腊月”在古代，腊本是一种祭礼。尤其是到了商代，每年人们用猎获的禽兽举行春、夏、秋、冬4次大祀，祭祀祖先和天地神灵，其中冬祀的规模最大，也最隆重，后来称为“腊祭”。因此，人们就将农历', null, '0', '/static/upload/picture/20170626/e54005eb580300c1102e5fb9377787b5.jpg', '0', '1', '0', '云纪念', '0', '0', '1484150400', '1');
INSERT INTO `tp_document` VALUES ('26', '', '来看看我们汉族人的春节是咋过的', '25', '年糕汤圆汉族的春节习俗，一般以吃年糕、饺子、糍粑、汤圆、荷包蛋、大肉丸、全鱼、美酒、福橘、苹果、花生、瓜子、糖果、香茗及肴馔为主；并伴有掸扬尘、洗被褥、备年货、贴春联、贴年画、贴剪纸、贴窗花、贴福字、', null, '0', '/static/upload/picture/20170626/fd774d6dc29149e7663ae1edbc72baa4.jpg', '1', '1', '0', '云纪念', '0', '0', '1482422400', '1');
INSERT INTO `tp_document` VALUES ('27', '', '春节祭奠，天堂网上扫墓传递孝爱', '25', '春节是中国人合家团圆欢聚、探亲访友的日子，也是祭祀祖神、祭奠先人的传统节日。如今生活节奏加快，传统的祭祀方式已无法完全表达现代人的缅怀之愿，天堂网高仿真网上墓地既继承传统祭祀又结合现代科技和生活节奏，', null, '0', '/static/upload/picture/20170626/4dce5ff325795076e5a12cf3644c7720.jpg', '0', '1', '0', '云纪念', '0', '0', '1454601600', '1');
INSERT INTO `tp_document` VALUES ('28', '', '元宵节祝福语大全(一)', '26', '元宵节祝福语大全一　　1、喜庆元宵佳节，我祝你：日圆，月圆，圆圆如意。官源、财源，源源不断。人缘、福缘，缘缘于手。情愿、心愿，愿愿成真！元宵节快乐！　　2、元宵节来临，送你一盏美丽的彩灯，祝愿你的生活', null, '0', '/static/upload/picture/20170626/80cf3241c5e6ea9f92abba5a1da0276f.jpg', '0', '1', '0', '云纪念', '0', '0', '1486569600', '1');
INSERT INTO `tp_document` VALUES ('29', '', '怎样煮出来的元宵，汤圆才好吃呢？', '26', '轻轻捏：在下锅前，用手轻捏元宵，使其外表上略有裂纹，这样下锅煮透后的元宵里外皆熟，不会夹生，且软滑可口。开水下：待水煮开后，把元宵慢慢放入锅内，同时立即用勺将其轻轻推开，朝同一方向略作搅动，使其旋转几', null, '0', '/static/upload/picture/20170626/6dc48f6b167785e9fcf3411ce7bdd75c.jpg', '0', '1', '0', '云纪念', '0', '0', '1486310400', '1');
INSERT INTO `tp_document` VALUES ('30', '', '你知道元宵跟汤圆的区别吗？', '26', '说到元宵，不少人以为汤圆就是元宵。其实元宵和汤圆尽管在原料、外形上差别不大，实际是两种东西。由于元宵和汤圆都是用糯米粉做皮，并且常采用芝麻、白糖等做馅料，因此容易让人混淆，但它们在制作工艺上还是有很大', null, '0', '/static/upload/picture/20170626/51f02ab73dc294a65f789ad05118b229.jpg', '1', '1', '0', '云纪念', '0', '0', '1486310400', '1');
INSERT INTO `tp_document` VALUES ('31', '', '元宵节节日习俗', '26', '吃元宵：吃元宵正月十五吃元宵，“元宵”作为食品，在中国也由来已久。宋代，汉族民间即流行一种元宵节吃的新奇食品。这种食品，最早叫“浮元子”后称“元宵”，生意人还美其名曰“元宝”。元宵即\"汤圆\"以白糖、玫', null, '0', '/static/upload/picture/20170626/2fc83b3c78b34f169d275016e47ca73f.jpg', '0', '1', '0', '云纪念', '0', '0', '1486310400', '1');
INSERT INTO `tp_document` VALUES ('32', '', '元宵节的由来和三大由来传说', '26', '元宵节流传历史源远流长，传统习俗颇为丰富热闹程度一点也不压于除夕，虽然元宵节不是我国的法定节假日，但是丝毫没有削减浓厚的节日氛围，元宵节习俗有看花灯、吃元宵舞龙、舞狮、跑旱船、踩高跷、扭秧歌等等十分丰', null, '0', '/static/upload/picture/20170626/dac2684681b4ad0cc879091565c57456.jpg', '0', '1', '0', '云纪念', '0', '0', '1455552000', '1');
INSERT INTO `tp_document` VALUES ('33', '', '为什么元宵节又叫“灯节”', '26', '　　一般认为，元宵节赏灯的习俗开始于汉朝。据说东汉明帝十分提倡佛法，为弘扬佛法，便下令正月十五夜在宫中和寺院“燃灯表佛”，此后流传到民间。　　此风俗历代相沿，到唐宋时期，达到极盛。当然这也得益于东汉末', null, '0', '/static/upload/picture/20170626/09881df1940797b78712c2ea5af8651d.jpg', '1', '1', '0', '云纪念', '0', '0', '1305907200', '1');
INSERT INTO `tp_document` VALUES ('34', '', '元宵节', '26', '农历正月十五日，是中国的传统节日元宵节。正月为元月，古人称夜为\"宵\"，而十五日又是一年中第一个月圆之夜，所以称正月十五为元宵节。又称为\"上元节\"。按中国民间的传统，在一元复始，大地回春的节日夜晚，天上', null, '0', '/static/upload/picture/20170626/db8e4f8f91f2c6bbf5fe16a4a851c6c9.jpg', '1', '1', '0', '云纪念', '0', '0', '1266940800', '1');
INSERT INTO `tp_document` VALUES ('35', '', '李姓的姓氏起源及演变', '40', '有关李姓的源流和得姓始祖，可以归结为以下几种：1、源出嬴姓说。即认为李氏源出嬴姓，血缘先祖为东夷族首领皋陶（一作咎繇，偃姓或赢姓），皋陶曾被任命为舜的大理（掌管刑法的官），遂以官命族为理氏（“理”“李', null, '0', '/static/upload/picture/20170626/b1e41c3499a032decb9fc70a0d6f4c1c.jpg', '3', '1', '0', '云纪念', '0', '0', '1478707200', '1');
INSERT INTO `tp_document` VALUES ('36', '', '王姓宗祠对联锦集', '41', '〖王姓宗祠门楣题辞〗太原垂徽三槐世第清节流芳四杰传芳〖王姓宗祠四言通用联〗三槐世泽；两晋家声。――佚名撰王姓宗祠通用联上联典出宋・王旦之父王佑，于庭院植槐树三株，曰：“吾之后世，必有为三公者。”时称“', null, '0', '/static/upload/picture/20170626/ec87a98b73509edc5af15ee7310b4aaa.jpg', '3', '1', '0', '云纪念', '0', '0', '1478707200', '1');
INSERT INTO `tp_document` VALUES ('37', '', '王姓的历史名人', '41', '王姓作为我国十大姓氏之一，在各个历史朝代，都有上乘表现。秦代有为辅佐始皇平安赵、燕、蓟、荆等地区的大将王翦。西汉末年有摄政王王莽，后建立新朝，称帝十五年。东汉思想家、哲学家、无神论者王充，捍卫和发展了', null, '0', '/static/upload/picture/20170626/c6c32ac5c6e759c5f9872730cb7a651b.jpg', '0', '1', '0', '云纪念', '0', '0', '1478707200', '1');
INSERT INTO `tp_document` VALUES ('38', '', '张氏宗祠对联', '42', '四言通用联九居世泽；百忍家声。全联典指唐代张公艺，九世同居，高宗封禅泰山，过其宅，问本末，公艺书“忍”字百余以进。西都十策；金鉴千秋。上联典指北宋初曹州冤句人张齐贤，字师亮，少年时孤贫而勤学，官至兵部', null, '0', '/static/upload/picture/20170626/44a3706a8e1a3ed45971592705a70354.jpg', '3', '1', '0', '云纪念', '0', '0', '1480262400', '1');
INSERT INTO `tp_document` VALUES ('39', '', '刘氏―古代名人', '43', '刘姓古代名人汉高祖刘邦（前256―前195）：西汉(前206―203)王朝的建立者。故人亦称沛公。刘邦汉文帝刘恒：汉朝的第3个皇帝（不包括两位汉少帝的情况下），躬行节俭励精图治，开创治世“文景之治”，', null, '0', '/static/upload/picture/20170626/34b4735d5eb826b643e1a2b91e4d47dd.jpg', '3', '1', '0', '云纪念', '0', '0', '1480608000', '1');
INSERT INTO `tp_document` VALUES ('40', '', '刘氏―姓氏名望', '43', '在中国历史上，刘姓称帝称王者多达66人，先后建立有西汉、东汉、蜀汉、汉、前赵、南朝宋、南汉、后汉、北汉、大齐等王朝或政权。共历时650多年，是中国建立封建王朝最多最久的姓氏。其中，刘邦建立的西汉历21', null, '0', '/static/upload/picture/20170626/93c2ac612174e6d733d6ac1401c7a209.jpg', '3', '1', '0', '云纪念', '0', '0', '1480608000', '1');
INSERT INTO `tp_document` VALUES ('41', '', '大凉山彝族的原始葬礼', '12', '大山深处的原始葬礼:百人送殡队伍现场\"火化\"在大凉山彝族的村里里，一位老人过世。村民拉着牛来，宰杀牛来做菜，送老人最后一程。村民杀牛后，再分解牛肉。还有杀猪的来做菜的。这样的肉块确实豪放了，正在拌盐的', null, '0', '/static/upload/picture/20170626/003269c4fb5bc86bdef4b98c6206e4c3.jpg', '22', '1', '0', '云纪念', '0', '0', '1482768000', '1');
INSERT INTO `tp_document` VALUES ('42', '', '秦始皇复活的军团(1)王者之师', '12', '(点击播放铵钮播放视频)这是一部关于一支强大军队史诗般的纪录片，这是一个伟大帝国和帝王诞生的再现。2000多年前，秦始皇的军队第一次统一了中国大地，也创建了当时世界上最庞大的帝国。大型纪录片《复活的军', null, '0', '/static/upload/picture/20170626/34036d24fba9bbcd94c6a531843a4513.jpg', '0', '1', '0', '云纪念', '0', '0', '1258041600', '1');
INSERT INTO `tp_document` VALUES ('43', '', '网上祭祀顺应时代趋势，应大力推广', '13', '只要登录网站，鼠标点一点，就可为故人上香、献花、敬酒。近几年，网上祭祀得到不少年轻人的认同。它借助互联网跨越时空的特性，将现实的纪念馆与公墓“搬”到电脑上，方便人们随时随地祭奠已逝亲人。它不悖于传统祭', null, '0', '/static/upload/picture/20170626/c84e6b928c7b648bbb97e106dbb0704d.jpg', '2', '1', '0', '云纪念', '0', '0', '1491321600', '1');
INSERT INTO `tp_document` VALUES ('44', '', '网上祭扫的观念争议', '13', '清明节成为法定节假日也是近几年的事，部分地区的的市民都选择在网上进行清明祭扫。并建立了已故先辈们的纪念馆，在清明放假后进行寄托哀思，他们已经接受了文明祭扫新的发展趋势，讲究快捷方便，每年祭扫燃烧的纸钱', null, '0', '/static/upload/picture/20170626/7a4ef5c4ceba467c27920c38ce8b1dcb.jpg', '3', '1', '0', '云纪念', '0', '0', '1459440000', '1');
INSERT INTO `tp_document` VALUES ('45', '', '旧时天津的丧葬习俗', '13', '早在新中国成立前，天津的丧葬习俗的规模之大，全国少有，之所以有这样排场的丧葬习俗，据了解是因为天津与北京相离比较近，所以天津的丧葬也正是借鉴了北京城帝王家的丧葬习俗，而京城皇帝、皇后妃子等归天后，那排', null, '0', '/static/upload/picture/20170626/4d8290dd8a8ce8adfac231b1569d2fa4.jpg', '2', '1', '0', '云纪念', '0', '0', '1458057600', '1');
INSERT INTO `tp_document` VALUES ('46', '', '“超度亡灵”终极真相--圣严法师', '13', '说到超度亡灵，先要说明亡灵的性质。人死之后的生命主体，称为亡灵。民间一般的观念，认为人死之后即是鬼，而且永远做鬼；但佛教从来不认同这个说法，否则，就谈不上超度两字了。佛教看凡界的众生，共分为天、人、神', null, '0', '/static/upload/picture/20170626/cdd333ef45d6d614ec9b78468d4d24a3.jpg', '3', '1', '0', '云纪念', '0', '0', '1456848000', '1');
INSERT INTO `tp_document` VALUES ('47', '', '人死后为什么要做：“七”?', '13', '如果这个人真的念佛往生了，就不必要做七了。往生的人，生天的人（人在这一生中有大善，死了以后生天），生天跟往生都没有中阴，不必做七！但是一般人业障习气深重，他要是堕恶道，堕三恶道，或者来生还能投胎到人道', null, '0', '/static/upload/picture/20170626/1b3971570fb043a4a049957f0c567aa7.jpg', '4', '1', '0', '云纪念', '0', '0', '1456329600', '1');
INSERT INTO `tp_document` VALUES ('48', '', '骨灰盒迁入墓地流程？', '13', '　　一，工作人员根据顾客所提供的情况，用图片向顾客介绍墓穴和型号、价格，顾客认选后，由工作人员带领顾客到实地观看墓穴，并听取顾客意见。　　二，顾客选好墓地后，工作人员带领顾客到刻碑室，由亲属向刻碑人员', null, '0', '/static/upload/picture/20170626/9a59bca612f18192bee30cdc6b34501a.jpg', '2', '1', '0', '云纪念', '0', '0', '1456329600', '1');
INSERT INTO `tp_document` VALUES ('49', '', '民政部：鼓励家庭成员合葬提高墓地使用率', '15', '　　京华时报讯昨天，民政部网站发布了由民政部等9部门联合印发的《关于推行节地生态安葬的指导意见》。《意见》明确提出，鼓励家庭成员采用合葬方式提高单个墓位使用率。依法纠正和查处党员干部尤其是领导干部去世', null, '0', '/static/upload/picture/20170626/14dc1b18d4646e2458fdb4d15a779098.jpg', '1', '1', '0', '云纪念', '0', '0', '1456329600', '1');
INSERT INTO `tp_document` VALUES ('50', '', '基督教简介', '17', '基督教根源于犹太教，公元1世纪中叶耶稣创立。135年从犹太教中分裂出来成为独立的宗教。早期基督教曾受到罗马皇帝的残酷迫害和镇压。公元313年，罗马帝国皇帝君士坦丁一世发布“米兰敕令”，宣布基督教可与所', null, '0', '', '3', '1', '0', '云纪念', '0', '0', '1318348800', '1');

-- ----------------------------
-- Table structure for tp_document_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_article`;
CREATE TABLE `tp_document_article` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档id',
  `content` text COMMENT '内容',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='andy - 文档内容表';

-- ----------------------------
-- Records of tp_document_article
-- ----------------------------
INSERT INTO `tp_document_article` VALUES ('1', '中国自古以来就是个人情社会，靠的无非是相互之间的体恤和关怀，用传统的礼仪来诠释就是拜贺庆吊之礼。其传统的拜贺庆吊也有很多要注意的细节和规矩。在节庆期间，一般是身份低级的人向尊长等行礼庆贺，也不是绝对的说同辈之间的就不能进行相互的拜贺。每逢元旦官员庆贺之际，行拜贺礼之人需要有恭维的态度和提前准备好贺词，进行俯首叩拜，并送上贺礼。而庆吊之礼，一般是指婚假、寿庆、逝世的家庭，一般都要进行上门进行庆吊，在传承中也逐渐形成了生活中必须要有的一些礼仪细节，如子孙繁衍等都是喜事，街坊邻居们都会上门庆贺道喜，这就是简简单单的一种礼仪和风俗。婴儿满月的时候，邻居亲戚都会上门恭贺，这种礼仪在现代社会中也是司空见惯的，并且还会馈赠一些衣服、鞋帽等，当今社会的人虽然这么做，但懂得其内涵的人应该不多，古代馈赠义乌、鞋帽表示，让出月的婴儿长大成人时，也要懂得性成年礼，这是一种在中国传统社会的冠笄之礼。古代男子在20岁时就要行加冠礼，并重新取名，代表着男子从此有了结婚、承担家庭事务的资格。女子在15岁时就要行绾发加笄礼，表示到了出嫁的年龄。也类似于现代社会18岁成年之说。在与人交往时礼仪是拉近人与人之间关系的有力武器，不管是古代还是现代社会都是一样的道理，只有尊重他人，才能受到他人对你的尊重，当然对于传统礼仪的继承我们可以则其善者，毕竟随着社会的发展，人们的思想也随之发生着变化，传统礼仪的继承也是比较复杂的问题，却又是当今社会的我们应高度重视的问题。');
INSERT INTO `tp_document_article` VALUES ('2', '钱逊：传统文化是社会主义核心价值观的基础普及要“学”“践”结合人民网北京9月21日电今年是孔子诞辰的2565周年，为传承弘扬优秀传统文化，更好地诠释孔子及儒家文化的内涵与意义，在孔子诞辰来临之际，国家互联网信息办公室委托搜狐网举办了“中华优秀传统文化网上行：孔子诞辰网络文化活动”，并对国学大师钱穆之子,清华大学教授，现任中华孔子学会副会长,国际儒学联合会、中华炎黄文化研究会、中国孔子基金会理事钱逊等多位儒家学者进行了专访。多年来，钱逊一直致力于弘扬推广《论语》和传统文化，长期的第一线教学工作让他对于儒学思想和弘扬儒学有着深刻的感想、体会。他认为儒家思想的核心是教育，重中之重则是教导世人如何做人，如何修身，以及如何形成良好的人格。党的十七大报告强调要弘扬中华文化，建设民族共有精神家园。习近平总书记也曾在参观孔府和孔子研究院后讲到“国无德不兴，人无德不立”。这就是强调民族要有自己的基本主导观念。基本主导观念负责塑造人们的理念、信仰与价值观等。同时，钱逊也在如何弘扬、学习传统文化方面进行了系统的论述。他认为孔子的教育思想主要有两个方面：一是学，二是实践。并且，在普及传统文化方面，他认为现代人不能只拘泥于学，还要付诸于实践。谈起现代教育，他不乏担忧：现今教育偏重专业技术而轻精神引导，改革开放30多年来中国经济发展迅速，人民物质生活水平大幅提高，普通老百姓最担心的问题的已由吃饱穿暖变为社会道德的好与坏。在这个背景下，心智教育就显得尤为重要，提倡传统文化国学就应老百姓之需。不论是提倡社会主义核心价值观也好，建设有中国特色社会主义道路也罢，弘扬优秀传统文化、复兴儒学等都与其和谐统一，也都必须以传统文化为基础。中国千百年来一直是世界强国，近代落后的原因不能只从文化上找，并且问题也不全是出在文化上。世界上没有一个民族、国家会像20世纪的中国的部分知识分子这样，提出抛弃自己的文化的倡导。目前，传统文化的普及与教育虽未形成统一的模式，但仍需按照传统儒家思想或孔子的教育思想来进行。并且，对少年儿童与成年的教育应区别进行，并不只拘泥于传统的“背字诀”。最后，钱逊表示，我们不应对儒家的“礼”先入为主的全盘否定。“礼”应该随着社会的发展而变化，中国是礼仪之邦，古礼中所提倡的规范言行、孝敬父母、严己修身等方面证是现今社会所缺失和需要的。而如何将传统的“礼”与现代法治相结合，则是一个具有重要实践意义的课题。嘉宾简介钱逊，国学大师钱穆之子,清华大学教授，现任中华孔子学会副会长,国际儒学联合会、中华炎黄文化研究会、中国孔子基金会理事。早年研究马列主义，1982年之后专攻中国思想史，主要研究方向：先秦儒学、中国古代人生哲学。');
INSERT INTO `tp_document_article` VALUES ('3', '芒种时节，我国长江中、下游地区开始进人梅雨季节，持续阴雨，雨量增多，气温升高，空气非常潮湿，天气十分闷热，各种物品容易发霉，蚊虫开始孳生，极易传染疾病。根据这一气候特点，这一时期的健身养生应注意以下几个方面：精神调养方面，应使自己保持轻松愉快的心情，忌恼怒忧郁，这样可使气机得以宣畅、通泄得以自如。起居方面，要顺应昼长夜短的季节特点，晚睡早起，适当地接受阳光照射但要避开太阳直射、注意防暑，以顺应旺盛的阳气，利于气血运行、振奋精神；中午最好能小睡一会，时间以30分钟至1个小时为宜，以解除疲劳，利于健康。天热易出汗，衣服要勤洗勤换，要“汗出不见湿”，因为若“汗出见湿，乃生痤疮”。要经常洗澡，但出汗时不能立刻用冷水冲澡。不要因贪图凉快而迎风或露天睡卧，也不要大汗而光膀吹风。进入芒种以后，尽管天气已经炎热起来，但由于我国经常受来自北方的冷空气影响，有些地区的气温有时仍很不稳定。比如东北地区在此期间有时还会出现4℃以下的低温，华北地区有时也可出现10℃左右的低温，即使是长江下游地区也曾出现过12℃以下的低温，因此在芒种时节春天御寒的衣服不要过早地收藏起来，必要时还要穿着，以免受凉。芒种期间的饮食宜以清补为主。从营养学角度看，饮食清淡在养生中起着重要作用，如蔬菜、豆类可为人体提供所必需的糖类、蛋白质、脂肪和矿物质等营养素及大量的维生素，因此，芒种期间要多食疏菜、豆类、水果，如菠萝、苦瓜、西瓜、荔枝、芒果、绿豆、赤豆等。这些食物含有丰富的维生素、蛋白质、脂肪、糖等，可提高机体的抗病能力；还要多吃瓜果疏菜。以摄取足够的维生素c，这对血管有一定的修补保养作用，可把血管壁内沉积的胆固醇转移到肝脏变成胆汁酸，能在一定程度预防和治疗动脉硬化。“芒种夏至天，走路要人牵；牵的要人拉，拉的要人推”。懒散、头脑不清爽是多数人在芒种时节的状态。此外，芒种时节天气炎热，雨水增多，湿热之气到处弥漫，使人身之所及、呼吸之所受均不离湿热之气。而湿邪重浊易伤。肾气、困肠胃，使人易感到食欲不佳、精神困倦，故学生、司机及高空作业的人，要防止“夏打盹”，以免影响学习或发生危险。总的预防措施是：当人体大量出汗后，不要马上喝过量的白开水或糖水，可喝些果汁或糖盐水，以防止血钾过分降低，适当补充钾元素则有利于改善体内钾、钠平衡。钾元素可以从日常饮食中摄取，含钾较多的食物有：粮食中的荞麦、玉米、红薯、大豆等，水果中的香蕉，蔬菜中的菠菜、苋菜、香菜、油菜、甘蓝、芹菜、大葱、青蒜、莴苣、土豆、山药、鲜豌豆、毛豆等。');
INSERT INTO `tp_document_article` VALUES ('4', '简介芒种，是农历二十四节气中的第9个节气，此时太阳到达黄经75度。芒种的“芒”字，是指麦类等有芒植物的收获，芒种的“种”字，是指谷黍类作物播种的节令。“芒种”二字谐音，表明一切作物都在“忙种”了。所以，“芒种”也称为“忙种”，农民间也称其为“忙着种”。“芒种”到来预示着农民开始了忙碌的田间生活。[1]左河水的《芒种》诗称其气象和农忙的情况为“艳阳辣辣卸衣装，梅雨潇潇涨柳塘。南岭四邻禾壮日，大江两岸麦收忙。”典籍芒种芒种【上声】，五月节。谓有芒之种谷可稼种【去声】矣。螳螂生。螳螂，草虫也，饮风食露，感一阴之气而生，能捕蝉而食，故又名杀虫；曰天马，言其飞捷如马也；曰斧虫，以前二足如斧也，尚名不一，各随其地而称之。深秋生子于林木闲，一壳百子，至此时则破壳而出，药中桑螵蛸是也。');
INSERT INTO `tp_document_article` VALUES ('5', '原标题：在网上，为逝去的亲人写封信来源：人民网【家书寄思念・清明祭祀新民俗】“再也吹不响奶奶为我做的柳哨，再也吃不到妈妈炒的椿芽鸡蛋……”清明前夕，网友“灵犀”一家通过互联网祭扫平台，为逝去的亲人写了若干封家信。“这些新兴的祭扫方式不仅文明、清洁，还不受时间、空间的限制，即便是身在远方的游子，也可以随时寄托哀思。”因为常年定居国外，每年清明节“灵犀”一家很难回乡为亲人扫墓。两年前，她在提供网上祭扫服务的网站上为家里去世的亲人创建了一个网上纪念馆。每到清明节，她和家人都会打开网页，为亲人上香、点烛、献花、留言。近年来，通过互联网祭扫平台表达对逝去亲人的哀思，已成为一种受欢迎的纪念方式。绿色环保的文明祭祀方式轻点鼠标，就能轻松完成祭祀全过程。很多人的做法与网友“灵犀”一家类似，身在外地，不能回乡祭扫墓地，便通过网络寄托哀思。从20世纪90年代开始，网络祭扫在国内逐渐流行。目前，国内已有天堂网、怀恩网、中国陵网等多家提供网络祭扫服务的网站。记者查询发现，这些网站均可以提供建立网上纪念馆、高仿真网上祭奠、召开网上追悼会、发表追思纪念文章等服务，甚至有的网站还可以提供vr、3d等新技术，让网友身临其境地感受实地扫墓的场景。“现在城里居民几乎没有家族祠堂，乡村祠堂不少也成了只供参观的旅游景点。在祭祀场所匮乏的情况下，网上祭祀为人们寄托思念提供了新空间。”华东师范大学社会发展学院教授、上海民俗文化学会会长仲富兰对此颇有感触。纸灰飞扬，黑烟弥漫，传统的民间祭祀方式不仅会造成环境污染，也极易造成火灾等安全隐患。“每年清明节，千军万马齐扫墓的现象造成了交通拥堵、人流聚集等问题，甚至给城市治理带来诸多不安定因素。”仲富兰认为，以网上祭扫为代表的新形式具备文明、绿色、节俭、安全等特点，已逐渐成为秉承传统、弘扬传统民俗文化的新趋势，更有利于纠正奢侈、攀比等殡葬祭祀的传统陋习。为倡导绿色环保的文明祭祀方式，各级政府部门也相继推出网上祭扫平台，引导群众通过互联网追思故人。比如，今年湖南怀化市民政局、市文明办就联合打造了“中国清明网怀化馆”；内蒙古赤峰市民政局也通过政府购买服务的方式，委托科技公司建立了“赤峰祭祀网”。网上诵读家书渐成新祭祀方式在日益多样的互联网祭祀方式中，诵读家书显得颇为抢眼。今年清明期间，天津市就提出以“寄思”代替“祭奠”的理念，并开通了“津云”服务平台，开展以“一封家书・清明我想对你说”为主要内容的网上祭扫活动，让网民通过一封封家书，向逝者寄去浓浓的哀思。“与其把网上诵读家书这种祭祀方式称之为新民俗，不如认为是传统民俗在互联网时代的传承与创新。”中国殡葬协会专家委员会常务副主任兼秘书长伊华认为，这种祭祀新形式是对历史文化的体察和体悟，并由此产生共识和认同，把传统家书文化传承家风的要义以互联网的形态来呈现和保护，“从国家层面上来说，这是民族文化根脉的延续；从家庭层面上看，则是家庭情感的承载”。“从本质上看，近年来清明节祭扫方式的转变正是祭扫内核的回归――对亲人追思和生命价值的审视。”在伊华看来，祭祀作为一项具有深厚传统的文化传承，其习俗的转变也会与社会发展、文明进步密切关联，在环保、科技、人文等观念不断深入人心的情况下，移风易俗将成为一种文化的内省力量。殡葬产业应成为精神服务的“记忆工场”与其他传统节日相比，清明节具备节气与节日的双重身份，兼有扫墓祭奠的肃穆悲伤与踏青游玩的欢乐两种情感氛围。“千万不能把清明节看窄了，好像清明节就是扫墓、烧纸钱。”仲富兰认为，清明节的意义在于对已逝的亲人、祖先、先贤、英烈送上自己的思念和敬意，这种神圣的生命交流仪式构成了人们顽强生存和追求幸福的重要动力，“清明节不可忽视的价值在于，通过节日、聚会以及风俗习惯的传承、凝聚民族精神”。“未来的殡葬产业不应是资源的消耗产业，而要成为一个提供文化精神服务的‘记忆工场’。比如，墓志铭、纪念仪式、人生电影、百姓家史、网络纪念等。”伊华认为，伴随着城市化进程，对于很多远离家乡、进城出国的家庭而言，清明祭扫愈发成为维系其与家乡、家族的精神纽带，“‘互联网祭祀’作为一种创新服务，只有适应各地不同的祭奠习俗、城乡现实条件和市场需求，才能不断得到发展和完善。”“祭祀不在于形式，而在于内涵。古人所说的‘慎终追远，民德归厚’，这才是清明祭祀的核心要义。”仲富兰提出，应该大力倡导“生前厚养、逝后薄祭”的文明新风。一束菊花、三个鞠躬、几许默哀、良久静思，只要感情至笃至真，无论以何种方式缅怀，无论身在何处进行祭奠，都能表达生者对逝者的追忆和思念。（光明网记者李政葳）');
INSERT INTO `tp_document_article` VALUES ('6', '　“人之初，性本善。性相近，习相远。苟不教，性乃迁。……”三字经传唱了几千年的国学经典，一直引导人们为人处世中不断取得进步，历久倡导的性善论与这个时代共存。所谓的生存之道没有固定的路线，需要兼并着我们的思想去努力实现自己存在的价值，也是一种原则性的思维方式的不断更新，确切来说是一种社会的进步。任何一个人在这个世界的初始状态都怀有一颗善心，这就是人最初的本性，而随着对周围人和事物的不断接触，最终也会发生着循序渐进的改变，或许是行善意识方面的优化升级，但也可能会是行善意识的逆向改变。功名利禄自古以来无人不想得到，那些把功名利禄抛至九霄云外的正人君子只能在电视剧上偶尔会出现，现实社会中人与人之间的竞争无非是为了权利、地位和金钱吗？所以为了让自己变得更加的强大，就必须去不断学习，不断追求进步。正如《三字经》里面的提及的“玉不琢，不成器；人不学，不知义。”玉石经过了数次的打磨、雕琢之后才有了存在的价值，若不进行打磨、雕琢和石头一样没什么价值。人要想成才那就得经过千锤百炼，不断学习，不断追求进步，这样才能知礼仪，才能求得生存。每四句一组，言简意赅的字里行间蕴藏着更多的原则性的东西，在不经意间会让人受益匪浅，甚至是终生受益。因为里面不仅有理想人生、生存学习之道，而且还包含了天文、地理、历史方面的内容，这种古老的传统教育学说，至今家喻户晓，对现代教育事业方面也起着积极的作用。');
INSERT INTO `tp_document_article` VALUES ('7', '1、孔子这位被尊奉为“天尊之圣”的儒家学派创始人孔子，是我国历史上著名的思想家、教育家、政治家，被列为“世界十大文化名人”之首，是当时社会上不可多得的博学者，至今受众人敬仰。儒家思想传承至今，对中国乃至世界都有着深远的影响，孔子的弟子和再传弟子将孔子的言行语录和思想都记录下来，最后整理成儒学经典之作――《论语》，对后世的道德教育和思想升华有着重要的意义。2、老子老子是我国古代伟大的哲学家和思想家，也是道家学派创始人，老子的以“无为”为核心的哲学思想已经渗透世界各个角落，是世界历史文化遗产的一笔宝贵财富，其主要著作为《道德经》，其与《易经》和《论语》被认为是对中国人影响最深远的三部思想巨著，译成外文版本的《道德经》发行量也很大，仅次于《圣经》。3、孙武孙武是中国春秋时期著名的军事家、政治家，尊称兵圣。是人类历史上最伟大的军事思想家，他的军事思想享誉古今中外，在世界军事史上有着极高的地位。著有《孙子兵法》一书，是中国现存最早的兵书，也是世界上最早的军事著作，被誉为“兵学圣典”。4、赢政之所以叫秦始皇，是因为嬴政是我国首位皇帝，也即是从他开始，我们才有了皇帝样一个概念，这位被广泛推崇演绎的中国首位皇帝，将我们的国家推向了大一统时代，让我们有了统一的概念。5、屈原战国时期出现了以为中国最早的浪漫主义诗人，就是屈原，中国文学史上第一位留下姓名的伟大的爱国诗人，他的诗歌对后世子孙发扬爱国主义精神，弘扬中华名族品质有着重要影响。屈原是“楚辞”的创立者和代表作者，也开创了“香草美人”的传统。6、武则天武则天是中国历史上空前绝后的一位女皇帝，上承“贞观之治”，下启“开元盛世”，也是封建时代杰出的女政治家，在男权至上的中国传统文化思想里，她的经历本身就是一种震憾。从整体大政看,为君的武则天无愧于中国历史上的一代明君,她以非凡的政绩,把中国封建社会推向了历史的峰顶,她也是大汉民族历史上控疆最大的君王,是所有中国女子引以为豪的精神支柱。7、林则徐林则徐是清朝时期的政治家、思想家和诗人，在鸦片战争中以虎门销烟和奋力抗英成为一代名臣，被永世传颂。没有任何的一位中国人有他的那样的眼光和勇气，他的事迹，成了这个民族最动听的英雄传说，林大人，是这个所有炎黄子孙的共同记忆。8、曹雪芹被誉为“四大名著”之一的《红楼梦》就是曹雪芹的代表作，这样的文学创作，被堪称是中国古代长篇小说的高峰，在世界文学史上占有重要地位，为后世留下了宝贵的文学遗产。9、孙中山孙中山是中国近代伟大的资产阶级革命先行者，是中国近代化的开创人，为了改造中国耗尽毕生的精力，在历史上留下了不可磨灭的功勋。正是他为我们推翻了背负在我们民族身上漫无边际的封建历程，从此我们有了共和和民主。10、毛泽东我们尊敬的毛主席，是伟大的马克思主义者，无产阶级革命家、战略家和理论家，中国共产党、中国人民解放军和中华人民共和国的主要缔造者和领导人，也是现代世界历史中的重要人物之一。是他带领中国同胞不畏艰险、一路奋战，最终赢来了新中国的美好局面，毛泽东思想作为马克思主义在中国的发展，仍然是中国共产党的指导思想。');
INSERT INTO `tp_document_article` VALUES ('8', '中国传统文化是中华文明演化而汇集成的反映民族特质风貌，是各种思想文化、观念形态的总体表现，为中华民族世世代代所继承发展的、具有鲜明民族特色的、历史悠久、内涵博大精深。中华民族几千年文明的结晶，除了儒家文化外，还包含有其他文化形态，如道家文化、佛教文化等等。中华传统文化应包括：古文、诗、词、曲、赋、民族音乐、民族戏剧、曲艺、国画、书法、对联、灯谜、射覆、酒令、歇后语、成语等；传统节日（均按农历）有：正月初一春节（农历新年）、正月十五元宵节、四月五日清明节、五月五日端午节、七月七七夕节、八月十五中秋节、腊月三十除夕以及各种民俗等；包括传统历法在内的中国古代自然科学以及生活在中华民族大家庭中的各地区、各少数民族的传统文化也是中华传统文化的组成部分。中国文化主要可以归纳为三种:1.宗法文化2.农业文化3.血缘文化。这三种文化构成了中国传统文化的主流.并且随着历史的演变它们之间相互渗透作用越来越紧密.例如：在封建社会的大家庭里面,血缘关系十分重要,特别强调辈分和地位的等级差距,因此十分重视家族家规,它们在一定程度上甚至比国家的一些制度更具有凝聚力和威信,在鲁迅先生的小说里我们常常可以看见宗法文化对封建统治和人们思想产生的影响;我国自古以来直至今日还是一个农业大国,正所谓经济基础决定上层建筑,以农业为主的经济形态必然会产生与之相适应的文化制度。中国传统文化还包括：中国书法、篆刻印章、中国结、京戏脸谱、皮影、武术-秦砖汉瓦、兵马俑、桃花扇、景泰蓝、玉雕、中国漆器、红灯笼（宫灯、纱灯）-木版水印、甲骨文、钟鼎文、汉代竹简-茶、中药、文房四宝（砚台、毛笔、宣纸、墨）、四大发明-竖排线装书、剪纸、风筝-佛、道、儒、法宝、阴阳、禅宗、观音手、孝服、纸钱-乐器（笛子、二胡、鼓、古琴、琵琶等）-龙凤纹样（饕餮纹、如意纹、雷纹、回纹、巴纹）、祥云图案、中国织绣（刺绣等）、凤眼-彩陶、紫砂壶、蜡染、中国瓷器-古代兵器（盔甲、剑等）、青铜器、鼎-国画、敦煌壁画、山清水秀、写意画、太极图-石狮、飞天、太极-对联、门神、年画、鞭炮、谜语、饺子、舞狮、中秋月饼-鸟笼、盆景、五针松、毛竹、牡丹、梅花、莲花-大熊猫、鲤鱼、芭蕉扇、风箱-黑头发黄皮肤、丹凤眼-红旗、天安门、五角星、红领巾、红太阳、长江、黄河-唐装、绣花鞋、老虎头鞋、旗袍、肚兜、斗笠、帝王的皇冠、皇后的凤冠-泥人面塑、锄头、清朝大辫子、铜镜、大花轿、水烟袋、鼻烟壶、筷子-华表、牌坊、长城、园林、寺院、古钟、古塔、庙宇、亭、井、黄土、民宅-汉字、数字8、6、4-唐诗、宋词、《三十六计》、《孙子兵法》、《西游记》、《红楼梦》、《三国演义》、《水浒传》、《诗经》-金元宝、如意、烛台、罗盘、八卦、司南、棋子与棋盘、象棋、围棋-黄包车、鼻烟壶、鸟笼、长命锁、糖葫芦-玉佩、鹫、千层底、刺绣、丝绸、檐等。');
INSERT INTO `tp_document_article` VALUES ('9', '父爱太重、文字太轻，再华丽的词藻也无法诠释父爱的伟大。父母在人生尚有来处，父母去人生只剩归途；父若在，请珍惜、请给他爱的表达；父若去，成追忆、他是前方的灯塔！父爱如山，深沉而又博大；父爱如海，深沉而又宽厚；父爱如火，炽热燃烧；父爱如酒，令人回味无穷；父爱如伞，为你遮风挡雨。父爱如山因为大山永远青翠长青，父爱如山父亲是我们眼里压不弯的脊梁，父爱如山父亲是迷茫时的指路明灯。父爱如山父亲正直的身影铸就我们的性格，父爱如山父亲的坚强给了我们拼搏的勇气，父爱如山父亲的豁达给了我们以豪爽气魄，父爱如山父爱是我一生的字典。父爱如山，稳定、厚实而威严；父爱如水，舒缓、平静而绵长；父爱如天，宽广、蔚蓝而博大！父爱如山，父亲的爱如雨，滋润着我；父亲的爱如水，灌溉着我；父亲的爱如风，吹拂着我。父爱如山，高大而巍峨，让我望而生怯不敢攀登；父爱如天，粗旷而深远，让我仰而心怜不敢长啸；父爱如河，细长而源源，让我淌不敢涉足。父爱，伟岸如青山;圣洁如冰雪;温暖如娇阳;宽广如江海!父爱是高山，即使在最困难的时候，也鼓励我挺直脊梁。父爱是太阳，即使在乌云密布的日子里，我也能感受到他的光芒。父爱是北斗，即使在伸手不见五指的夜里，也能让我辨明方向。父爱，像山一样宏伟壮丽；父爱，像山一样威武壮观；父爱，像山一样坚韧挺拔......父爱，是一缕温暖而又耀眼的阳光；父爱，是一颗带着体温的糖果；父爱，是一盏灯照亮人心地里的黑暗，父爱如山。父爱如山，静默深远。为天下所有父亲点赞!');
INSERT INTO `tp_document_article` VALUES ('10', '“孩子啊！啥节不节的，你说了半天我也没弄明白。爸不需要啥节日，你们好好上学，放假都回家了，就是最好的节啊！罗从政《中国青年报》（2015年06月19日08版）这么多年，我一直觉得我与父亲在电话线中隔得好远，甚至，我也是想通过“父亲节的祝福”，来拉近父子间的距离。殊不知，亲情永远都是没有距离的，无论空间的距离多么遥远，那一份真切的期待，是无法用语言表达的。刚上大学时，我每周给家里打一次电话，每次都是打给父亲――家里只有父亲有一部手机。后来，从大三开始，给父亲打电话的频率就降低了。一方面在校的事情多起来，经常有课业之外的事务。另一方面，也是主要的，我跟父亲实在没有多少内容可交流。多数都是跟父亲匆匆几句，说些各自的近况，应些“都好”，没什么聊的。当父亲节来临时，看到网络上铺天盖地“父亲节快乐”的字眼，我也忍不住给远方的父亲打了电话。和往常一样，问问身体，问问最近各自的生活。父亲的语速总是急促，似乎家里很忙，这是他给任何人打电话的习惯。我一直找不到，引出“父亲节”这个字眼的话题；好几次，这三个字都到嘴边了，可又咽了回去。最后，我满怀遗憾地挂了电话。收起电话，心情却没轻松下来，不禁在心中责备自己，这时那些朋友劝我给父亲道声祝福的画面，一幕幕在头脑中闪过。我在心里排练几次后，终于又下定决心，拨通了父亲的电话。“怎么还有事啊？”父亲那熟悉的话语总是那么直接。我没说话，做了个深呼吸，只听到父亲那边又传来，“咋啦，是不是有啥事么。”我终于出口了，用别扭的乡音说：“爸，今天是你的节日。”家乡方言词典里，从来就没有“父亲节”这个词。“啥，我12月过生（日）么，哪是今啊！”父亲哪里懂得什么父亲节，他以为我把今天当他的生日呢。我再也忍不住了，我给他说了父亲节的来源，再次申明：今天可是你的节日啊！我告诉父亲，在城里，儿子、女儿都以各种方式给父亲过节呢。我还告诉他，我一同学，在今天就买了一个按摩器，送给他父亲做礼物呢。最后，我没忘说一句：我离家这么远，不能给您过节，就是想跟您说说，要珍惜今天啊！片刻沉默后，传来父亲的声音：“孩子啊！啥节不节的，你说了半天我也没弄明白。爸不需要啥节日，你们好好上学，放假都回家了，就是最好的节啊！咱乡村人，不讲就那些，你在外好好读书，没有忘记你爸对你的期望就行，你有出息了，我就天天过节……”那天，放下电话，心中一阵阵暖流涌过。');
INSERT INTO `tp_document_article` VALUES ('11', '一位平凡的农村母亲为女儿准备嫁妆，来到曹妃甸做了一名洗车工人，几年如一日，忍着疾病，瞒着女儿，善意的谎言，伟大的母爱，催人泪下。');
INSERT INTO `tp_document_article` VALUES ('12', '妈妈，让我再爱你一次四季在轮回，生命在延续，母爱已埋于心间，成为了永久的回忆。我的爱还没来得及却随风逝去。我多想，将我的爱还于妈妈，也让妈妈感受到世间所有的温存。我多想再爱你一次妈妈!燕子飞时，春满枝头。独倚栏杆，情满心头。昨日的记忆忽现，没有头绪，却又分明。儿时，您教我学走路，蹒跚的脚步画着五彩的音符，也画出了您的爱；您教我学说话，呀呀的声音唱着多情的歌，也唱出了您的情；背着您亲手缝的书包，便也背上了您的希望。从那一刻起，我便有了坚定的步伐，我走出来了，走出了大山，走出了贫穷，也走出了您的希望。但我又深深的知道，我永远走不出您的心，您的牵挂，您的爱！叶正浓，花正红，风已细，雨已稠。楼中空寂寂，独自暗神伤。往昔一幕幕。怎能忘记，您为我做的香炒面，熬的西米粥，怎能忘记您送我上学，怎能忘记，远行时您殷殷的嘱托，在外时您绵绵的牵挂，归家时您长长的等待。怎能忘记？不能忘记！雁归去，菊未黄，风已尽，爱未亡。您的爱怎会亡，她似长河永远长，她如高山永远高，她若日月星晨永不老去。让我用一生来回忆，来珍藏，来享受，来品味。曾记得，那个长夜，您未合眼，就因我的一点点感冒发烧。曾记得，那个秋日，您瘦了，就为给我们凑学费，曾记无数，曾爱无数，妈妈，如果可能，让我再爱您一次。雪正飘，寒正侵，风又猛，思又浓。想念也如雪一样，白了整个世界。我的天空也变白了，我知道是您所不希望的。我无法也不助，只好任我的思念蔓延……蔓延……如果可能，妈妈让我再爱您一次！生命还在继续，时钟还在运转，我还在追寻，还在守望，还在爱里飘荡，妈妈呀妈妈，如果可能，我多想再爱您一次。就让这绵绵无期的爱化作永恒的力量吧，随着沧桑的岁月编织着人间最美的神话！');
INSERT INTO `tp_document_article` VALUES ('13', '《跪羊图》一首感母恩的感人歌曲MV，快乐男声、出彩中国人都有选手唱过，非常感人！跪羊图古圣先贤孝为宗万善之门孝为基礼敬尊亲如活佛成就生命大意义父母恩德重如山知恩报恩不忘本做人饮水要思源才不愧对父母恩小羊跪哺闭目吮母液感念母恩受乳恭身体膝落地姿态如敬礼小羊儿天性有道理人间孝道及时莫迟疑一朝羽丰反哺莫遗弃父身病是为子劳成疾母心忧是忧儿未成器多少浮云游子梦奔波前程远乡里父母倚窗扉苦盼子女的消息多少风霜的累积双亲容颜已渐老莫到忏悔时未能报答父母恩多少浮云游子梦奔波前程远乡里父母倚窗扉苦盼子女的消息多少风霜的累积双亲容颜已渐老莫到忏悔时未能报答父母恩为人子女饮水要思源圆满生命尽孝无愧意儿女心无论在何地给双亲一声感恩您给双亲一声感恩您');
INSERT INTO `tp_document_article` VALUES ('14', '第一，培养当代青少年的国家忧患意识，增强社会责任感。中华民族的忧患意识十分强烈，历史上有过无数忧国忧民的志士仁人。这种忧患意识又总与社会责任感联系在一起，成为中华民族传统美德的重要组成部分。当代青少年物质生活丰厚，生活条件优越，还有什么好忧患的呢？首先，我国还是一个有着13多亿人口的发展中国家，改革开虽然使相当一部分地区和人民解决了生活问题，走向了小康富裕的道路，但是还有部分地区和人民在温饱线上徘徊。还有，我们国家与世界先进国家相比，生产力水平还有待提升，其次，21世纪的竞争是以经济为基础的综合国力的竞争，归根到底还是人才、文化的竞争。有竞争就有压力，当代青少年应当清楚地认识到今天的学习是为了未来，在国际竞争中永远立于不败之地。第三，充分利用当前国际总体和平、国内稳定的有利时机。大力弘扬中国民族传统美德教育，培养青少年的忧患意误解，并把它与中华民族伟大复兴的社会责任感结合起来。把个人融入社会和人民的事业中去。第二，引导青少年增强社会尽责，努力学习，刻苦锻炼。对社会尽责，勤奋学习，古往今来，一直是中华民族的传统美德。在迈向新时代的今天，特别是肩负着中华民族伟大复兴的当代青少年，更有必要努力学习、发扬中华民族美德。振兴中华不是一句空话，关键要行动。有负责任还不够，还要有本领；想要有本领就要努力学习，刻苦锻炼。当代青少年正如喷薄而出的朝阳，正好处在可以勤学苦练的最佳时期。中华民族的历史上，有着流传着许多刻苦自励、发奋读书的故事，如“怀书而耕”、“悬梁刺股”、“凿壁取光”、“羲之墨池”、“韦编三绝”等，这些都是值得当代青少年学习的。艺校学生想要在一流剧院立足，没有一技之长是不行的。谚语常说：“拳不离手：曲不离口”、“久久为功，方能成功”、“台上一分钟，台下十年功”。可以看出只有拥有过硬的技术，才有可能去为人民、为社会尽责。只有这样才能把强烈的责任感转化为刻苦勤奋、吃苦耐劳、忠于职守的具体行动，因为人的一生对社会、对人民的奉献主要是通过职业实践实现的。第三，提高青少年美德修养的自觉性，持之以恒。学习掌握一定的知识、技能，需要下一定的苦功；提高自己的道德修养，更需要天长日久地积累和坚持不懈的努力。通过学习和实践，逐渐将传统美德转化为学生的行为习惯，进而内化为学生的伦理道德观念和人格力量，这是一个潜移默化的艰巨的战略任务。古人很重视道德修养，提出“吾日三省吾身”，把自我修养当作每天必须的课程，成为一种经常的习惯。“君子慎其独也”，则是更高的修身要求。只有在不断的自省自律的实践中，道德修养方能得以提高。的确，一个人在公众场合，往往较注意自己的道德形象，但当一人独处，无人管束时，仍能严守高尚的道德标准，这就很不容易了。比如，上海要成为现代化国际大都市，社会风气、市民素质也应是一流水平。严格执行“七不”规范，条条都需时时“慎独”。一日三省，独处谨慎，没有“下不为例”、“我比他好”的任何松懈，在日常生活中自觉做到“七不”，进而以更高的道德要求来规范自己的行为，这也是青少年对民族、对社会、对家乡应尽的责任。自觉、长期地进行修身养德，是完善高尚人格的需要，也是国家、社会对个人的素质要求，更是时代对青少年的要求。在生活中修炼、磨硕自己，是一个人能力社会进步作出贡献的基本保证。');
INSERT INTO `tp_document_article` VALUES ('15', '清明节将到，笔者老家一位朋友的母亲去世一年余，而他在外地工作，常常思念母亲，又不方便去墓园。于是近日他在网上建立了一个纪念馆，每当想念母亲时，便将自己的感受和想对母亲说的话，发在纪念馆里。网上祭祀是一种新兴的祭祀方式，逝者家属借助互联网，将现实的公墓与纪念馆“搬”到电脑上，方便人们随时随地祭奠已逝亲人，它是传统祭祀方式的改革与创新。众所周知，传统的祭祀方式用纸烛、鞭炮等物品祭奠亲人陵墓，往往燃烟四起、纸屑纷飞，污染环境且存在很大安全隐患，极易引发山林等火灾。所以，网上祭祀是一种文明祭祀方式，更能体现“人性化”。如果逝者家属在网上建立了一个纪念馆，既有馆名，又有独立空间，很方便，也感觉很亲切。具体做法是，逝者家属在相关网站上为逝者注册一块虚拟“墓碑”，将其照片、生平简历与事迹发在网上，还可以写一些亲情留言、怀念文章等，随时发布上去。在网上扫墓时还能点烛、献花等，甚至逢年过节还可给已故亲人送“酒、肉、饺子”，送“衣服”等。还有像现实中不易操作的给逝者点歌也能在网上轻松完成。而所有这一切都不用出门，且全部免费，又轻而易举就可以办到。希望这种既节约又环保的网上祭祀，在各地城市、农村都能大力推广。（原标题：网上祭祀应推广）来源：浙江在线-绍兴县报齐振松');
INSERT INTO `tp_document_article` VALUES ('16', '　　“南北山头多墓田，清明祭扫各纷然。”又是一年清明将至，国人如何寄托对故人的哀思？记者发现，从“苹果手机”等新潮祭品的热销，到网上祭祀、微信直播“代客扫墓”的兴起，随着物质条件的改善和互联网日益深入生活，国人选择的祭扫用品和扫墓方式也与时俱进，悄然发生着变化。（4月1日中国新闻网）　　清明时节，慎终追远。缅怀逝者、祭祀先祖，既是沿袭数千年的民间习俗，更是具有独特内涵的中华传统文化。随着社会的发展、时代的进步，祭祀用品、祭扫方式等的变化，在得到一部分人推崇的同时，也引发不少争议的声音。如何过清明、怎样去纪念，作为一种祭祀文化的传承，无论是遵循传统还是吐故纳新，仪式感当然可以有也应该有，但显然不必拘泥于某种形式，而贵在以三“心”守住“慎终追远、敦亲睦族、行孝尽哀”这一清明文化内核。　　追思之心。清明祭祖，是一种习俗，一种文化，说到底更是一种情怀，是表达对去世亲人和先祖的追念之情。无论我们在祭品的花样上费多少心思、花多大代价，也无论是近距离扫墓致哀，还是远距离“遥祭”，抑或虚拟时空“网祭”，关键在于心要诚恳，表达内心的真情实感。倘若刻意追求形式隆重、花样翻新，甚至只是讲排场、摆阔气、做给别人看，而缺失内在的追思和敬仰，沦为形式主义的走过场，就没有多少实际价值可言。　　传承之心。很大程度上说，追忆先人，是行孝尽哀，也是为了继往开来。缅怀先人对家族、对社会、对国家的功德激励自己，追忆先人的优良品格、持家风范藉以鞭策自己，铭记先人立下的好家训、建树的好家风严格要求自己，进而努力做好自己、开创未来。因而，大可不必去追逐“苹果手机”“平板电脑”“豪车别墅”之类祭品花样上费心思、花代价，反倒有悖先人的节俭传统。多在传承家庭文化做文章，以更好地建设家园、贡献社会，就是对先人的最好告慰。　　感恩之心。知恩图报是中华民族的传统美德，清明时节，春暖花开，万物旺长，古人选择在这样一个美好时节祭祀先人，并且约定俗成，就是出于感恩的心，缅怀他们的养育之恩，颂扬他们为子孙后代创造美好生活的辛苦付出。家是最小国，国是最大家。我们感恩先人，同样更感恩为民族解放、富国富强、人民幸福而做出巨大付出和杰出贡献的先烈和功臣，因为胸怀一颗感恩的心，我们格外重视从中华传统文化、文明中汲取营养、激发动力，倍加珍惜来之不易的美好生活和和谐环境，倍加努力为建设美丽家园、美丽中国和现代文明砥砺前行。（南方网秦仲）');
INSERT INTO `tp_document_article` VALUES ('17', '（原标题：扫墓伤心过度心理问题高发）场景1思念逝者精神恍惚　　这两个星期，50岁的苏伯总是闷闷不乐，不出外锻炼，也不去参加老年大学的一些活动，这可急坏了儿子小苏。小苏的妻子不经意间看到公公边看相册边抹眼泪，相册里除了有全家福，还有不少公公婆婆曾经去游玩的合影。原来，这几天家里人念叨着去扫墓的事让苏伯更加思念去世不到一年的老伴了。建议：亲人应多进行开导　　心理咨询师吴一帆说,清明前后，市民应该关注家人或朋友的精神状态，如有类似苏伯这样举止反常、郁郁寡欢等情况，应给予积极关注和精神支持。除了直接或间接的开导外，还要尽量避免让他受到强烈刺激，多制造机会让他参与人际沟通与交流互动。如果一段时间内还不能缓解或者情况进一步恶化，家人应该让专业心理工作人员介入咨询或干预。场景2常幻想自己意外死去　　程小姐的父亲一年前因癌症过世了，此后她的心理包袱特别重，经常想得自己头疼：例如为什么父亲在世时，自己不赶快结婚，；为什么不放下工作，回家好好照顾病危的父亲最后一个月。除了内疚自责，她不时会出现莫名其妙的想象画面，想着自己因为各种意外死去。清明前夕，这些念头在脑海里闪动得更加频繁了。建议：重新寻找爱和力量　　吴一帆分析说，我们总是在一段段关系中确认自己，获得力量。最亲的人走了，意味着最紧密的一段关系消逝，对有些人来说，也就带来了自我的迷失。这时，拒绝亲人过世这一事实，拒绝与人交往，拒绝饮食等情况都可能出现。从某种程度上来说，这些都是内心缺乏力量的外在表现。　　如何重新寻找新的力量？吴一帆说，一方面，亲人虽然过世，但亲人的精神已经通过我们留存下来，这也是先人带给我们的心灵力量；另一方面，我们需要从仍然在世的亲人身上获得爱和力量。　　其实，正确面对清明和相关祭祀活动很重要。吴一帆说：“这不仅是一个缅怀先人、发古幽思的节日，同样也是感恩、励志的节日。”场景3一到墓地便哭得呼天抢地　　每年清明回老家扫墓，离墓地越近，陈女士的话就越少。走到墓地，她的眼睛就开始红了，女儿、儿子和儿媳妇担心地跟在她两边，低声地劝她“控制情绪”，生怕再发生曾经昏倒的一幕。谁知陈女士见到丈夫的墓碑，依然“泪如倾盆大雨”，哭得不能自已。女儿也被她的情绪感染，抱着母亲痛哭起来。这种“呼天抢地”的场面在各个扫墓点并不少见。建议：提前宣泄部分哀伤情绪　　吴一帆说，从一方面看，清明是一次宣泄哀伤的机会，有利于处理往日积蓄的不良情绪；但从另一方面看，集中时间、集中地点的哀悼也容易造成一个“情绪场”。　　都说逝者已逝，人们应该坦然面对。但一般情况下，这个集中的时段容易让人情绪出现大起伏。过分控制情绪也不利于身心健康，一些人在祭扫时可能会情绪过于激动，出现头晕颤抖、喘气急促、呼吸困难、浑身发软等症状。遇到这种情况，亲友应进行搀扶支持，轻拍其背部，自上而下抚摸脊柱，必要时把当事人带离祭扫现场，以平缓情绪。　　另外，为防止亲友在祭扫现场过于激动，还可以事先在家里花点时间集体缅怀过世亲人，这样有利于提前宣泄一部分哀伤情绪。场景4身心疲惫情绪低落　　现在清明成了法定假日，人们纷纷回老家祭祀，从清明前夕一两周就开始了“迁徙运动”，有的还要经历大拥堵。清明之后，许多人感觉身体疲惫，情绪低落。等重新回到工作岗位，整个人已经垮了，还会出现厌世、没工作激情的状态。建议：用音乐治疗心理哀伤　　除传统祭扫方式外，现在有很多新式的文明祭扫方法。吴一帆介绍，从心理学的角度看，网上灵堂、网上祭扫等方式比较有益健康。除了节省体力，网祭也是一种相对柔缓的情绪表达方式，回避了祭扫现场可能出现情绪过度激动的“情绪场”，虽然并非专业治疗手段，但也有利于情绪转化。同时，用音乐、文字、图画等方式进行哀伤处理是心理学上的一种艺术治疗方式。来源:当代健康报(济南)');
INSERT INTO `tp_document_article` VALUES ('18', '吃饺子祭灶节，民间讲究吃饺子，取意“送行饺子迎风面”。山区多吃糕和荞面。晋东南地区，流行吃炒玉米的习俗，民谚有“二十三，不吃炒，大年初一一锅倒”的说法。人们喜欢将炒玉米用麦芽糖粘结起来，冰冻成大块，吃起来酥脆香甜。旧时，不论贫富，只要是顶门成家过日子，就要在锅台上边的墙上，供奉灶王爷的尊像，在像的两边贴幅对联：“上天言好事，下界保平按。”每家都把灶王爷奉为神明，由它来主宰一家兴衰祸福，由于四季常住灶间，察看一家人的活动，自然成为“一家之主”。吃灶糖灶糖是一种又粘嘴又粘牙的麦芽糖，把它抽为长条型的糖棍称为\"关东糖\"，拉制成扁圆型就叫做\"糖瓜\"。冬天把它放在屋外，因为天气严寒，糖瓜凝固得坚实而里边又有些微小的气泡，吃起来脆甜香酥，别有风味。真关东糖坚硬无比，摔不碎，吃时必须用菜刀劈开，质料很重很细。口味微酸，中间绝没有蜂窝，每块重一两、二两、四两，价格也较贵一些。关东糖关东糖又称灶王糖、大块糖。一年之中，只有在小年前后才有出售。关东糖是用麦芽、小米熬制而成的糖制品，它是祭灶神用的。清人写的《燕京岁时记》中记载：清代祭灶，供品中就有“关东糖”、“糖饼”。关东糖在东北的农村、城市里，大街小巷、街市上，都有小贩叫卖：“大块糖，大块糖，又酥又香的大块糖。”乳白色的大块糖，放在方盘上，一般有三寸长，一寸宽，扁平，呈丝条状。新做的大块糖，放在嘴里一咬，又酥又香，有粘性，有一种特殊风味，是关东男女老少都十分喜爱的一种糖。它已从灶王爷的祭桌上走下来，广为百姓享用。吃糖瓜糖瓜分有芝麻的和没芝麻的两种，用糖做成甜瓜形或北瓜形，中心是空的，皮厚不及五分，虽大小不同，但成交仍以分量计算，大的糖瓜有重一二斤的，不过用作幌子，买的人很少。祭灶供灶糖的原因，是为了粘住灶爷的嘴巴。传说灶爷是玉帝派往人间监督善恶之神，它有上通下达，联络天上人间感情，传递仙境与凡间信息的职责。在它上天之时，人们供它灶糖，希望它吃过甜食，在玉帝面前多进好言。也有人说，祭灶用灶糖，并非粘灶爷的嘴，而是粘嘴馋好事、爱说闲话的灶君奶奶的嘴。炒玉米晋东南地区，有吃炒玉米的习俗，民谚有“二十三，不吃炒，大年初一一锅倒”的说法。人们喜欢将炒玉米用麦芽糖黏结起来，冰冻成大块，吃起来酥脆香甜。');
INSERT INTO `tp_document_article` VALUES ('19', '小年习俗祭灶王祭灶小年这天，也是民间祭灶的日子。民间传说，每年腊月二十三，灶王爷都要上天向玉皇大帝禀报这家人的善恶，让玉皇大帝赏罚。因此送灶时，人们在灶王像前的桌案上供放糖果、清水、料豆、秣草；其中，后三样是为灶王升天的坐骑备料。祭灶时，还要把关东糖用火融化，涂在灶王爷的嘴上。这样，他就不能在玉帝那里讲坏话了。民间有“男不拜月，女不祭灶”的习俗，因此祭灶王爷，只限于男子。另外，大年三十的晚上，灶王还要与诸神来人间过年，那天还得有“接灶”、“接神”的仪式。等到家家户户烧轿马，洒酒三杯，送走灶神以后，便轮到祭拜祖宗。扫尘土扫尘土过了二十三，离春节只剩下六、七天了，过年的准备工作显得更加热烈了。要彻底打扫室内，俗称扫尘，扫尘为的是除旧迎新，拔除不祥。各家各户都要认真彻底地进行清扫，做到窗明几净。粉刷墙壁，擦洗玻璃，糊花窗，贴年画等等。剪窗花剪窗花贴窗花所有准备工作中，剪贴窗花是最盛行的民俗活动。内容有各种动、植物等掌故，如喜鹊登梅，燕穿桃柳，孔雀戏牡丹，狮子滚绣球，三羊（阳）开泰，二龙戏珠，鹿鹤桐椿（六合同春），五蝠（福）捧寿，犀牛望月，莲（连）年有鱼（馀），鸳鸯戏水，刘海戏金蝉，和合二仙等等。贴春联贴春联家家户户都要写春联。民间讲究有神必贴，每门必贴，每物必贴，所以春联数量最多，内容最全。神灵前的对联特别讲究，多为敬仰和祈福之言。常见的有天地神联：“天恩深似海，地德重如山”；土地神联：“土中生白玉，地内出黄金”；财神联：“天上财源主，人间福禄神”；井神联：“井能通四海，家可达三江”。面粮仓、畜圈等处的春联，则都是表示热烈的庆贺与希望。如“五谷丰登，六畜兴旺”、“米面如山厚，油盐似海深”、\"牛似南山虎、马如北海龙”、“大羊年年盛，小羔月月增”等等。另外还有一些单联，如每个室内都贴“抬头见喜”，门子对面贴“出门见喜”，旺火上贴“旺气冲天”，院内贴“满院生金”，树上贴“根深叶茂”，石磨上贴“白虎大吉”等等。大门上的对联，是一家的门面，特别重视，或抒情，或写景，内容丰富，妙语联珠。洗浴大人、小孩都要洗浴、理发。民间有“有钱没钱，剃头过年”的说法。吕梁地区讲究腊月二十七日洗脚。这天傍晚，婆姨汝子都用开水洗脚。不懂事的女孩子，大人们也要帮她把脚擦洗干净，不留一点污秽。民间传有“腊月二十七，婆姨汝子都洗脚。一个不洗脚，流脓害水七个月”的俗语。婚嫁过了二十三，民间认为诸神上了天，百无禁忌。娶媳妇、聘闺女不用择日子，称为赶乱婚。直至年底，举行结婚典礼的特别多。民谣有“岁晏乡村嫁娶忙，宜春帖子逗春光。灯前姊妹私相语，守岁今年是洞房”的说法。');
INSERT INTO `tp_document_article` VALUES ('20', '农历十二月二十三和二十四，是中国民间传统的祭灶日，又称“小年”。小年的传说：灶王爷原为平民张生，娶妻之后终日花天酒地，败尽家业沦落到上街行乞。一天，他乞讨到了前妻郭丁香家，羞愧难当，一头钻到灶锅底下烧死了。玉帝知道后，认为张生能回心转意，还没坏到底，既然死在了锅底，就把他封为灶王，每年腊月二十三、二十四上天汇报，大年三十再回到灶底。老百姓觉得灶王一定要敬重，因为他要上天汇报。于是，民间就有了腊月二十三、二十四的祭灶“小年”，祈求来年平安和财运。小年并非专指一个节日，由于各地风俗，被称为小年的节日也不尽相同。小年期间主要的民俗活动有贴春联，扫尘，祭灶等。小年在各地有不同的概念和日期，北方地区是腊月二十三，南方地区是腊月二十四，江浙沪地区把“腊月廿四”和“除夕前一夜”都称为小年，南京地区称正月十五的元宵节为小年，云南部分地区是正月十六，西南和北方部分少数民族地区是除夕。小年也意味着人们开始准备年货，准备干干净净过个好年，表示新年要有新气象，表达了中国劳动人民一种辞旧迎新、迎祥纳福的美好愿望。');
INSERT INTO `tp_document_article` VALUES ('21', '腊月二十三，又称\"小年\"，是民间祭灶的日子。据说，每年腊月二十三，灶王爷都要上天向玉皇大帝禀报这家人的善恶，让玉皇大帝赏罚。因此送灶时，人们在灶王像前的桌案上供放糖果、清水、料豆、秣草;其中,后三样是为灶王升天的坐骑备料。祭灶时，还要把关东糖用火融化，涂在在灶王爷的嘴上。这样，他就不能在玉帝那里讲坏话了。民间有\"男不拜月，女不祭灶\"的习俗，因此祭灶王爷，只限于男子。另外，大年三十的晚上，灶王还要与诸神来人间过年，那天还得有“接灶”、“接神”的仪式。等到家家户户烧轿马，洒酒三杯，送走灶神以后，便轮到祭拜祖宗。　附：扫尘到了腊月，家家户户都准备过年了。扫尘为的是除旧迎新，拔除不祥。各家各户都要认真彻底地进行清扫，做到窗明几净。在北京，通常把腊月二十四日定为\"扫房日\"扫尘主要是将家里进行彻底清洁，主妇通常先将房里的床铺家具遮罩起来，用头巾将头包好，然后用扫帚将墙壁上下扫干净。扫屋之后，擦洗桌椅，冲洗地面。扫房之后，各店铺、居民家焕然一新。新贴的春联，鲜艳夺目，显示着红红火火的鸿福盛景。活灵活现的门神，抬头见喜的横幅，精美的窗花，五彩的年画，花团锦簇的灯笼，和神龛上丰饶的祭品，无不显示着喜气洋洋、欣欣向荣的节日景象。');
INSERT INTO `tp_document_article` VALUES ('22', '　年三十，也就是\"除夕\"。这天，是人们吃、喝、玩、乐的日子。北方人包饺子，南方人做年糕。水饺形似\"元宝\"，年糕音似\"年高\"，都是吉祥如意的好兆头。除夕之夜，全家人在一起吃\"团年饭\"，有一家人团聚过年的味道。吃团年饭时，桌上的\"鱼\"是不能动的，因为这鱼代表\"富裕\"和\"年年有余\"，象征来年的\"财富与幸运\"，它属于一种装饰，是碰不得的。关于年的由来，还有一个传说。相传在远古时候，我们的祖先曾遭受一种最凶猛的野兽的威胁。这种猛兽叫\"年\"，它捕百兽为食，到了冬天，山中食物缺乏时，还会闯入村庄，猎食人和牲畜，百姓惶惶不可终日。人和\"年\"斗争了很多年，人们发现，年怕三种东西，红颜色、火光、响声。于是在冬天人们在自家门上挂上红颜色的桃木板，门口烧火堆，夜里通宵不睡，敲敲打打。这天夜里，\"年\"闯进村庄，见到家家有红色和火光，听见震天的响声，吓得跑回深山，再也不敢出来。夜过去了，人们互相祝贺道喜，大家张灯结彩，饮酒摆宴，庆祝胜利。为了纪念这次胜利，以后每到冬天的这个时间，家家户户都贴红纸对联在门上，电灯笼，敲锣打鼓，燃放鞭炮烟花；夜里，通宵守夜；第二天，大清早互相祝贺道喜。这样一代一代流传下来，就成了\"过年\"。除夕的高潮是年饭后长辈发\"压岁钱\"。接着就是张贴春联和门神，并关上大门。到初一的早上才开门\"接财神\"。接下来就是全家人守岁到凌晨。除夕夜的灯火，通宵不熄，俗称\"光年\"。各地的除夕风俗大致相同，但有些地方的风俗很有特点，如苏州、北京、台湾等。苏州的除夕守岁时，都要等待从枫桥寒山寺传来的洪亮钟声。当钟声穿过沉沉夜色，传到千家万户时，就标志着新春的来临。无论春夏秋冬，每日半夜正交子时，寒山寺中就会传出这口巨钟的洪响，民间称为\"分夜钟\"。这口钟，已成为苏州城乡方圆数十里人民生活的时间信息。寒山寺钟声还出现在诗中，流传最广的就是唐代诗人张继的《枫桥夜泊》：月落乌啼霜满天，江枫渔火对愁眠。姑苏城外寒山寺，夜半钟声到客船。现在，每年除夕，苏州寒山寺仍遵循万古不变的古老习俗，击钟以分岁。姑苏城乡，到了守岁的最后一刻，会从广播中传出宏亮的寒山寺钟声，报导一年的开始。千家万户，听到钟声，爆竹齐鸣，使古老的寒山寺钟声成为了一种时代的象征。北京的除夕这一天更是忙碌，祭祖、接神、接灶。祭神拜祖的仪式一开始，整个北京城便淹没在一片震耳欲聋的爆竹声中。人们还在自己家院子里，铺上芝麻秸，全家人都去踩，叫\"踩岁\"，取长命百岁的意义。除夕通宵灯火齐明，人们辞岁守岁。当新年的钟声敲响时，各家的饺子也下锅了，人们尽情的娱乐。除夕在台湾不叫除夕，而叫\"过年日\"。午后，在厅堂神龛前上供牲体。到了晚上，合家焚香叩拜，然后对长者辞岁。接着是\"围炉\"，也就是丰盛的年夜饭，一家人围坐一桌，桌上摆满菜肴，桌下放置火盆。\"围炉\"为除夕带来高潮，远在他乡的游子，除非万不得已，再远再忙也要赶回家团圆。年夜饭后，便高燃蜡炬来守岁，儿媳妇为长辈们添富寿，不能早睡，坐得越久，长辈得富寿越长，这是表示孝心。');
INSERT INTO `tp_document_article` VALUES ('23', '　　道教说：“天上无不孝的神仙”。把孝道列为修仙之首德，你没把父母照顾好，修行都是修不了多大成就的，人道都没做好还想上求仙道，道派之“净明忠孝道”就提倡“以孝修仙”。所以，古代出了一些修孝道成仙的人物，如吴猛、许真君都是忠孝道的杰出人物。　　一年又过去了，我们与父母的年龄都在增长。人到晚年易有孤独感，这时我们一声亲切的问候就能为长辈带来一阵温暖。春节之际，阖家欢乐，团团圆圆时，让我们一起做到以下“五孝”。　　一、聆听孝别打断父母说家里长短的锁事。难得团团圆圆，爸爸妈妈有很多的话想对子女说。请认真聆听。和爸妈聊天唠嗑，倾听父母的烦恼，聆听父母的趣事。　　二、情商孝别轻易生气，情绪牵着父母的心。我们的心情会影响父母的心情。小时候，父母是我们的太阳。如今，就让我们成为父母的太阳。太阳是温暖的，可依赖的。在爸妈面前是成熟温和的。　　三、勤快孝别忙着见同学朋友，多陪父母上街、拎东西、下厨。帮父母打扫打扫卫生、收拾收拾家里。为父母做上一顿丰盛的大餐。相比朋友，我们的父母更需要我们的陪伴。　　四、接受孝别抗拒父母说些迂腐和伤你的话，要付出有质量的时间给他们。父母毕竟是年迈，不能很快地吸收新文化。　　五、分享孝别只顾看手机、电视、电脑，与父母多分享外面的世界。春节回家，带着父母多去外面走走，哪怕是晚上去散散步。和老伴散步的感觉与全家人有说有笑热热闹闹散步的感觉是完全不一样的。　　　　春节回家陪父母要做的十件事　　1、带一件小礼物不用特别贵重，用心就好：补品、血糖血压仪、爸妈爱吃的东西、新鞋、新衣服、新围巾。　　2、耐心地听爸妈说说家长里短、鸡毛蒜皮。可能是亲戚琐事、也可能是邻里变迁。父母攒了一年的唠叨都想慢慢讲给你听，别打断他们。　　3、陪父母走次亲戚，串串门串门拜年这样的传统习俗，已经越来越不受年轻人青睐了，甚至还会被他们看作是一种累赘。其实，陪父母串门走亲戚的意义，并不局限于拜年本身，而是在做这件事的时候，你能跟他们一起。这不仅让他们感到骄傲，也是最贴心的支持。　　4、帮父母打扫卫生天气冷、过年事情多，父母忙不过来，帮他们分担点。　　5、给父母拍照除了自拍，还有一次次相聚需要记录我们的记忆。除了工作，还有一位位亲人值得我们珍惜。过年了记着为爸妈照张相，照一张全家福照片能够定格一个瞬间，锁住回忆。跟父母一起翻看照片的过程，就是唤起回忆的过程。久远的照片可以让父母回想起他们当年的幸福，临近的照片能让他们更享受当前的幸福。　　6、陪爸妈逛街别忙着见同学朋友，记得陪爸妈上街买年货，还要搭把手，多拎几件东西。　　7、为爸妈下趟厨房若自己能为父母做一顿可口的饭菜，父母肯定会吃在嘴里，喜在心里。再陪父亲小酌几杯，给母亲碗添菜，一家人，其乐融融。　　8、爸妈夹菜别拒绝“我吃什么，我自己夹，你别给我夹菜。”是不是已经说成习惯了?爸妈夹菜是出于爱，请别用不耐烦来回答。　　9、别总是玩手机，多问父母几句“废话”。爸妈讲话、上桌吃饭，别总是玩手机。多跟父母聊聊天，问问他们身体，讲讲你不在他们身边的这一年。　　10、别吐槽父母“过时了”，离家时给父母一个拥抱。电脑、智能手机、微信，爸妈总是跟不上我们的脚步。告诉他们最简单的解决办法就好。如果可以给他们写个傻瓜教程。短暂的春节很快会结束，在你即将离家，听完父母的叮嘱后，请记住给他们一个拥抱，这是对父母的最好安慰。　　我们，都在与时间赛跑。世界再大，也要回家。');
INSERT INTO `tp_document_article` VALUES ('24', '几千年来，除夕是中华大地上最为特别的日子。华夏儿女那怕远居他乡、跨越千山万水也要回家团聚、与家人一起吃年夜饭。这年夜饭吃的不仅是一顿饭，更是一种味道，一份眷恋……然而随着亲人的远去，年夜饭却难寻其味。也许你还会为其留一个位子、一副碗筷，这更多的却是一份怀念、一丝遗憾，心中挂牵，天堂的亲人是否安好……正所谓每逢佳节倍思亲，新春将至，天堂网不忘为远居天堂的人们准备了丰盛的菜肴，你只要拨动鼠标就可以为之敬献，送上那似曾熟悉的味道。时代在变，社会节奏在变、表达方式亦与时俱进，而不变的是感恩之心、思念之情。一份年糕、一碗长寿面……也许极其简单，却是一份浓浓的情意！是的，天堂也有年夜饭！怎样敬献？在天堂网电脑版3D墓地，进入“祭品-&gt;年夜饭”分类，即可选择相应祭品敬献。相关阅读：怎样设置使用高仿真网上墓地？设置方法：1、新建纪念馆默认使用高仿真网上墓地，建馆人可以到“管理纪念馆-&gt;墓地设置”里进行墓碑风格切换、背景切换等操作。2、原使用旧版墓碑的纪念馆，可以到“管理纪念馆-&gt;墓碑设置-&gt;使用新版墓地”、或到“管理纪念馆-&gt;体验新版.”里设置使用高仿真墓地。天堂网3D版网上墓地使用说明：http://www.tiantang6.com/help/help240.html');
INSERT INTO `tp_document_article` VALUES ('25', '农历十二月为什么叫“腊月”在古代，腊本是一种祭礼。尤其是到了商代，每年人们用猎获的禽兽举行春、夏、秋、冬4次大祀，祭祀祖先和天地神灵，其中冬祀的规模最大，也最隆重，后来称为“腊祭”。因此，人们就将农历十二月称为“腊月”。农历十二月称“腊”有三重含义：一曰“腊者，接也”，寓有新旧交替的意思（《隋书・礼仪志》记载）；二曰“腊者同猎”，指田猎获取禽兽好祭祖祭神，“腊”从“肉”旁，就是用肉“冬祭”；三曰“腊者，逐疫迎春”。春天快要到了，人们可能以歌舞祭祀等方式驱逐灾病，迎接新春的到来。腊月都忙啥？腊月初八，吃腊八粥腊月初八,古代称为“腊日”,俗称“腊八节”。从先秦起,腊八节都是用来祭祀祖先和神灵,祈求丰收和吉祥。腊八节除祭祖敬神的活动外,人们还要逐疫。腊八这天，我国汉族民间流传着吃“腊八粥”的习俗。据说腊八粥传自印度。“腊八”是“佛祖成道纪念日”。“腊八”是佛教的盛大节日。各地佛寺作浴佛会，举行诵经，并效仿释迦牟尼成道前，牧女献乳糜的传说故事，用香谷、果实等煮粥供佛，称“腊八粥”。腊月十五，入年关许多地方人们认为，腊月十五后便进入了年关，这天开始大家开始忙着备年货，商业也进入了“年价”，许多集市都将商品价格调高了。改革开放以来，为了解决春节期间返乡潮，从这一天起正式进入了春运周期，年味也随着一波波的春运高潮越来越浓。腊月二十三，糖瓜粘腊月二十三又称小年夜，是中国传统文化中祭灶、扫尘、吃灶糖的日子。民谣中“二十三，糖瓜粘”指的即是每年腊月二十三或二十四日的祭灶神，因为灶君老爷要上天。所谓“官三民四船家五”或“官三民四僧道五”的说法，也就是官府在腊月二十三日，一般民家在二十四日，水上人家或寺庙、道观则在二十五日举行祭灶。后逐渐演化为“二十三，过小年”的说法。腊月二十四，扫房子每年从农历腊月二十三日起到除夕止，我国民间把这段时间叫做“迎春日”，也叫“扫尘日”。扫尘就是年终大扫除，北方称“扫房”，南方叫“掸尘”。在春节前扫尘，是我国民间素有的传统习惯。腊月二十五，磨豆腐民谚称:“腊月二十五,推磨做豆腐。”据考证,豆腐是西汉淮南王刘安发明的。南宋朱熹在其《豆腐》诗中写到:“种豆豆苗稀,力竭心已腐,早知淮南术,安坐获泉布。”有趣的是,一些地方还有在除夕以前吃豆腐渣的风俗。究其因,是当地传说灶王上天汇报后,玉帝会下界查访,看各家各户是否如灶王所奏的那样,于是各家各户就吃豆腐渣以表示清苦,瞒过玉皇的惩罚。传说归传说,吃豆腐渣实则是古代生产力低下,没有那么多好吃的,同时也是先民勤俭节约美德的写照。腊月二十六，杀猪割年肉“腊月二十六，杀猪割年肉”，说的是这一天主要筹备过年的肉食。所谓杀猪，当然是杀自己家养的猪；所谓割肉，是指没养猪的贫困人家到集市上去买过年吃的肉。将“割年肉”放入年谣，是因为农耕社会经济不发达，人们只有在一年一度的年节中才能吃到肉，故此称为“年肉”。腊月二十六的汉族传统民俗是“炖大肉”。腊月二十七，宰鸡赶大集腊月二十七赶集主要是买卖年节物品,例如:鞭炮、春联、神马、香烛、烧纸、牛羊肉、赠送小孩子的各种玩具礼品、女孩子的各种头花饰物等等。这一天,各地的集市都十分红火热闹。腊月二十八，把面发腊月二十六、腊月二十七准备了过年要吃的肉类，到了二十八这天，就该准备面食了。在过去社会发展低下，还没有现代比较方便的发酵粉，普通的面提前几天多做好了容易坏，只有发面不爱坏，于是二十八这天就发面，准备正月初一到初五的主食，同时，这也是因为旧俗认为初一到初五期间不能动火蒸馒头的缘故。腊月二十九，上坟请祖上大供中国农历有大小月之分，所谓大月是三十日，小月只有二十九日。所以遇到腊月为小月，二十九这一天就是这一年最后一天。那么腊月二十九就是除夕了，即使不是小月，次日就是除夕，所以过年的各种准备活动都要在这天进行完。在整个年节中，二十九这天可以说是最忙碌的一天，除了筹备年节中的各种衣食祭品，还有一项极其重要的活动“上坟请祖”。所以年谣称“腊月二十九，上坟请祖上大供”。对于祖先的崇拜，在中国由来已久。事死如生不仅是孝道的重要标志，也是尊老敬老的美德。因此每逢节庆，都要对祖先告祭一番，这不仅仅是一种向祖先的告慰，也寄托了后人对祖先的感恩与思念。春节是大节，上坟请祖仪式也就格外庄重和重要。上坟请祖的时间，大多数地区在二十九日清晨请祖，少数地区在除夕日下午到黄昏时请祖。还有民谣称“二十九，蒸馒头”，二十八做好了发面，二十九就要开始蒸馒头了，人们尽情发挥想象，把馒头做成寿桃、小动物等各种造型。在天津大家还会在这一天到乔香阁请中国结，取“乔香纳福”之意。腊月三十，辞旧迎新、家团圆腊月三十即除夕，除夕自古就有通宵不眠、守岁、祭祖，贴门神，贴春联年画、挂灯笼、放爆竹，给压岁钱，吃年夜饭，送财神等习俗，流传至今，经久不息。人们称这一天叫做“过年”。过大年,是中华民族一年一度最为隆重的节日。这天夜间的鞭炮声不绝于耳。午夜一到，腊月就结束了，新的一年也随之开始了。');
INSERT INTO `tp_document_article` VALUES ('26', '年糕汤圆汉族的春节习俗，一般以吃年糕、饺子、糍粑、汤圆、荷包蛋、大肉丸、全鱼、美酒、福橘、苹果、花生、瓜子、糖果、香茗及肴馔为主；并伴有掸扬尘、洗被褥、备年货、贴春联、贴年画、贴剪纸、贴窗花、贴福字、点蜡烛、点旺火、放鞭炮、守岁、给压岁钱、拜年、走亲戚、上祖坟、逛花市、闹社火等众多活动，极尽天伦之乐。中国人过春节有挂中国结的习惯，大年三十之前天津人有到古文化街乔香阁请中国结的习俗，取乔香纳福之意。饺子北方地区春节喜吃饺子，其寓意团圆，表示吉利和辞旧迎新。为了增加节日的气氛和乐趣，历代人们在饺子馅上下了许多功夫，人们在饺子里包上钱，谁吃到来年会发大财；在饺子里包上蜜糖，谁吃到意味着来年生活甜蜜等等。包饺子孩子们在玩耍放爆竹的时候，也正是主妇们在厨房里最忙碌的时刻，年菜都在前几天做好了，而年夜饭总要在年三十当天掌厨做出来。在北方，大年初一的饺子也要在三十晚上包出来。这时家家的砧板都在噔噔噔地忙着剁肉、切菜。此时，家家户户传出的砧板声，大街小巷传出的爆竹声，小店铺子传出算盘声和报帐声，再夹杂着处处的说笑声，此起彼伏，洋洋盈耳，交织成除夕欢快的乐章。除夕年夜饭年夜饭吃年夜饭，是春节家家户户最热闹愉快的时候。大年夜．丰盛的年菜摆满一桌，阖家团聚，围坐桌旁，共吃团圆饭，心头的充实感真是难以言喻。人们既是享受满桌的佳肴盛馔，也是享受那份快乐的气氛，桌上有大菜、冷盆、热炒、点心，一般少不了两样东西，一是火锅．一是鱼。火锅沸煮，热气腾腾，温馨撩人，说明红红火火；“鱼”和“余”谐音，是象征“吉庆有余”，也喻示“年年有余”。还有萝卜俗称菜头，祝愿有好彩头；龙虾、爆鱼等煎炸食物，预祝家运兴旺如“烈火烹油”。最后多为一道甜食，祝福往后的日子甜甜蜜蜜，这天，即使不会喝酒的，也多少喝一点。年夜饭的名堂很多，南北各地不同，有饺子、馄饨、长面、元宵等，而且各有讲究。北方人过年习惯吃饺子，是取新旧交替“更岁交子”的意思。又因为白面饺子形状像银元宝，一盆盆端上桌象征着“新年大发财，元宝滚进来”之意。有的包饺子时，还把几枚沸水消毒后的硬币包进去，说是谁先吃着了，就能多挣钱。吃饺子的习俗，是从汉朝传下来的。相传，医圣张仲景在寒冬腊月，看到穷人的耳朵被冻烂了，便制作了一种“祛寒娇耳汤”给穷人治冻伤。他用羊肉、辣椒和一些祛寒温热的药材，用面皮包成耳朵样子的“娇耳”，下锅煮熟，分给穷人吃，人们吃后，觉得浑身变暖，两耳发热。以后，人们仿效着做，一直流传到今天。新年吃馄饨，是取其开初之意。传说世界生成以前是混沌状态，盘古开天辟地，才有了宇宙四方，长面，也叫长寿面。新年吃面，是预祝寿长百年。馄饨长寿面在北方，有的人家还要供一盆饭，年前烧好，要供过年，叫作“隔年饭”，是年年有剩饭，一年到头吃不完，今年还吃昔年粮的意思。这盆隔年饭一般用大米和小米混合起来煮，北京俗话叫“二米子饭”，是为了有黄有白，这叫作“有金有银，金银满盆”的“金银饭”。不少地方在守岁时所备的糕点瓜果，都是想讨个吉利的口彩：吃枣（春来早），吃柿饼（事事如意)吃杏仁（幸福人），吃长生果（长生不老），吃年糕（一年比一年高）。除夕之夜，一家老小，边吃边乐，谈笑畅叙。');
INSERT INTO `tp_document_article` VALUES ('27', '春节是中国人合家团圆欢聚、探亲访友的日子，也是祭祀祖神、祭奠先人的传统节日。如今生活节奏加快，传统的祭祀方式已无法完全表达现代人的缅怀之愿，天堂网高仿真网上墓地既继承传统祭祀又结合现代科技和生活节奏，满足普罗大众的情感抒发之愿。春节祭奠，采用网上扫墓，变得没有时间和空间限制，随时随地，给你记挂的天堂亲人一声问候、一个祝愿！在天堂网高仿真网上墓地给天堂的亲人送什么？此外，有更多的各式祭品，可以根据当地不同的风俗习惯选择敬献。让天堂的亲人共渡新春佳节！相关阅读：怎样设置使用高仿真网上墓地？设置方法：1、新建纪念馆默认使用高仿真网上墓地，建馆人可以到“管理纪念馆-&gt;墓地设置”里进行墓碑风格切换、背景切换等操作。2、原使用旧版墓碑的纪念馆，可以到“管理纪念馆-&gt;墓碑设置-&gt;使用新版墓地”、或到“管理纪念馆-&gt;体验新版.”里设置使用高仿真墓地。天堂网3D版网上墓地使用说明：http://www.tiantang6.com/help/help240.html');
INSERT INTO `tp_document_article` VALUES ('28', '元宵节祝福语大全一　　1、喜庆元宵佳节，我祝你：日圆，月圆，圆圆如意。官源、财源，源源不断。人缘、福缘，缘缘于手。情愿、心愿，愿愿成真！元宵节快乐！　　2、元宵节来临，送你一盏美丽的彩灯，祝愿你的生活五彩缤纷；送你一碗甜甜的汤圆，祝愿你的爱情甜蜜美满；送你一声真挚的祝福，祝愿你的日子开心快乐。　　3、带上诚挚的祝福，愿你开心大本营，开心总动员，开心大风车，开心每一年，开心每一月，开心每一天，开心每一刻，开心，开心，元宵节开心。　　4、海天一色庆元宵，想念时刻静悄悄，祝福缓缓起浪涛，给你问候荡最高，且把关怀挂树梢，但求幸福为你俏，元宵到，衷心祝愿你节日快乐，前途看好。　　5、把一颗颗幸福圆满都送到你嘴里，要好好吃啊！　　6、你不是饺子却有陷儿。你不是馄沌却也有汤。你不是糖果却也很甜。我已经迫不及待了！来吧我的汤圆！来吧我亲爱的元宵节！　　7、春天已经悄悄来到我们身边，元宵佳节，春风熏陶着沉醉的夜晚，我用心叠一只纸鹤，装上我满满的祝愿，飞翔在天边，飘落你身前，祝你元宵节愉快。　　8、我在这里，你在那头。我望着窗外，伴随着无尽的思念仿佛看见你忙碌的身影，月儿圆盼团圆，好想对你说：亲爱的，我下班了，麻溜煮汤圆！　　9、平平淡淡如一杯清水，普普通通是一介白丁。但善良是我的品格，热情是我的天性，真诚是我的原则，祝福是我的习惯。正月十五将临，祝你及家人开心健康！鸿福无疆！　　10、明月当空高高照，元宵祝福在微笑，十五汤圆别样甜，快乐常伴你身边，温馨短信给你发，此后你将大发达，正逢佳节，祝愿你心想事成，顺心如意。　　11、过年好，元宵到，幸幸福福一年绕；过年好，元宵到，开开心心四季妙；过年好，元宵到，顺顺利利全家好；过年好，元宵到，团团圆圆过元宵。　　12、元宵到，祝福短信到，愿你一年都不会删掉；祝福电话到，愿你四季都不会挂掉；祝福的欢语到，愿你一生都不会忘掉；祝福心意到，愿你一世都不会抹掉。　　13、元宵节到了，祝你今后的日子像黑芝麻元宵般健康，像桂花元宵般香甜，像五仁元宵般丰富，像豆沙元宵般细腻延绵。吃下这碗元宵你将永远幸福！　　14、元宵到，送你一个彩灯，红色代表开心，绿色代表幸福，黄色代表梦想，蓝色代表思念，橙色代表寄托，紫色代表希望，青色代表吉祥，愿绘出你四季的安康！　　15、带着诚挚的祝福，祝福你元宵佳节好事如正月十五的月儿一样圆，好运如汤圆一样圆又圆，好日子如彩灯一样五彩缤纷，祝你元宵节快乐。　　16、看着你吃完元宵的眼，透着心里的甜；看着你吃完元宵的脸，笑容明艳艳；看着你吃完元宵的肚子，哇！好圆！元宵虽好，可不要贪食哦――元宵节快乐！　　17、年过完了，钱花光了，手机也哑了；都上班了，心要静了，反倒没人理了；又是元宵节了，发条短信，就算骚扰一下，证明我还想着你，元宵节快乐。　　18、收到短信的都是幸运儿，而且这祝福可以通过短信转发让认识自己和自己认识的人也获得同样的快乐！转发吧！让身边的人快乐!　　19、元宵好，元宵妙，欢欢喜喜放彩炮啦；元宵好，元宵妙，幸幸福福挂灯笼啦；元宵好，元宵妙，开开心心吃汤圆啦；元宵好，元宵妙，快快乐乐过元宵啦……　　20、月亮，元宵，映衬着你的欢笑，正月十五回荡着你的歌调，新春充盈着你的热闹，此时我心久恋着你的美妙。　　21、正月十五良宵到，花灯吐艳把春报，一年初望明月照，汤圆滚烫闹良宵，虎年好，虎年妙，元宵佳节快乐抱，虎年好，虎年妙，元宵佳节开心邀。　　22、正月十五是元宵，佳节送来喜气多多，愿你合家欢乐团圆多多，爱情甜蜜美满多多，事业腾飞发财多多，生活幸福快乐多多，吉祥如意好事多多！元宵节快乐！　　23、元宵节到了！朋友，我对你的思念，就像这元宵一样，塞得鼓鼓的，捏得圆圆的，煮在锅里沸了，盛在碗里满了，含在嘴里，呀，太甜了。　　24、元宵到，送你一个灯笼，丝丝的牵挂是灯线，绵绵的思念是灯罩，深深的祝福是灯炮，愿它带给你圆圆的梦想，圆圆的期望，元宵快乐！　　25、再多的按键，也打不出我对你的祝福，再圆的月亮，也代表不了我对你的思念…元宵节了，祝你快乐！！！　　26、元宵到，愿你看着汤圆圆圆，吃得肚皮满圆，喜得脸蛋滚圆，家庭幸福团圆，事业红得溜圆，爱情花好月圆，一生春色满圆，一世幸福美圆！　　27、送走冬季的严寒，迎来春天的灿烂，世界随着季节变，思念却是更胜前，元宵佳节心情暖，给你祝福不会变，愿你生活比春花艳，愿你事业比月亮圆。　　28、春来了！鸟到了！虎年中国更好了！元宵佳节齐团圆！元宵圆！滚又滚！好运滚到你家去！新的一年更美好！全世界今年不差钱！不差钱！老牛了！　　29、带上诚挚的祝福，愿你在元宵节里，找到幸福，找到欢乐，找到甜蜜，找到吉祥，找到美满，找到金虎，找到福虎，找到财虎。元宵快乐！　　30、满满的月儿圆圆的脸，闪闪的烟花美美的灯，甜甜的汤圆密密的你，短短的信息深深的情，满满的祝福默默的我，愿你有棒棒的身体乐乐的笑！元宵快乐！　　31、汤圆，汤圆，幸福的汤圆，吃一个汤圆，日子幸福甜甜；吃两个汤圆，事业美满如愿；吃三个汤圆，家庭和睦团圆……吃一碗汤圆，元宵节快乐！　　32、我用十分诚心，九分真心，八分爱心，七分舒心，六分适心，五分开心，四分小心，三分用心，二分童心，一分尽心煮碗汤圆送给你，祝元宵节快乐，永远开心！　　33、正月十五月儿圆，真诚祝福送身边；正月十五元宵甜，祝你虎年更有钱；正月十五展笑脸，快乐长久幸福绵；正月十五享团圆，祝你吉祥在虎年！　　34、今天是元宵节，你当馅我当面，我们一起做一个大元宵；你做纸我做烛，我们一起做一个大灯笼。元宵佳节祝福你，愿健康快乐长伴你，好运和你不分离，财神永远跟随你！　　35、自从有了他，中国通讯发了又发；自从有了他，哪个节日也少不了他；自从有了他，咱们的祝福样如花。他是哪个啊？就是你在看的短信啊，呵呵，元宵快乐。　　36、带上诚挚的祝福，愿元宵的彩灯带给你五彩缤纷的世界，愿元宵的汤圆带给你滚烫的明天，愿元宵的短信带给你吉祥的虎年，元宵节快乐！　　37、千万个祝愿，在寒风中凝固，但元宵节的灯笼，元宵节的汤圆，元宵节的短信祝福却在温暖中传送，愿温馨、温情、温柔在祝福中停留，祝你元宵节快乐！　　38、月到十五分外圆，把你疼爱把你怜，常常把你挂心间，今夜的汤圆甚是粘，我们何时能团圆。　　39、带上诚挚的祝福，祝你在元宵佳节到来之际，天天开心，天天幸福，天天安康，天天吉祥，天天甜蜜，天天美丽，天天长胖……错，天天长瘦！元宵快乐！　　40、元宵节：逛庙会、猜灯谜、观花灯、放鞭炮、扭秧歌、跑旱船、锣鼓喧天真热闹。沸腾的快乐，温暖的情怀，美好的生活一年更比一年好，祝元宵节快乐。　　41、月儿圆，寄托着我的无数思念；汤圆圆，包裹着我无限的祝愿；梦儿圆，蕴藏着我无穷的挂恋；短信的词圆，愿幸福伴你走过一年又一年。元宵节快乐。　　42、美丽的夜空，把梦想呈现；圆圆的明月，把幸福实现；漂亮的花灯，把节日妆扮；温馨的短信，把祝福传递；我的心愿：愿你元宵节快乐幸福每一天。　　43、冬去春来百花香，一条短信到身旁，祝你一年四季财源旺，一年四季身体康，一年四季好运忙，一年四季家兴旺，一年四季事业旺，元宵佳节好吉祥！　　44、圆圆的月亮，相聚的情；圆圆的花灯，欢乐的情；圆圆的汤圆，温暖的情；团圆的心愿，岁岁的情。祝元宵节合家欢乐，吉祥如意。　　45、圆圆的月亮照着圆圆的餐桌，圆圆的餐桌放着圆圆的碗，圆圆的碗里盛着圆圆的元宵，圆圆的元宵圆着圆圆的梦想，圆圆的梦想马上就会实现。元宵节快乐！　　46、好一个冷时硬中甜，好一个热时软中粘，好一个有心不外露，好一个清白自在圆。愿可口的汤圆带给你元宵的幸福无边，元宵的快乐无限！　　47、短信轻吟舞蹁跹，无限问候暖心田，缕缕莲香沁心脾，温馨祝愿满心间，正月十五月正圆，廊桥美梦一线牵。在这个月圆之夜，送去我美好的心愿！　　48、今宵月圆白如昼，千年轮回人依旧，月增年华人增寿，岁月过后看春秋，满腹真情话别后，月圆之夜话语稠，此时莲灯观不够，来世对月消新愁。元宵节快乐！　　49、元宵佳节赏花灯，吉祥之星为你升，元宵佳节赏花灯，快乐之树为你生，正月十五吃汤圆，好运之粥为你甜，正月十五吃汤圆，梦想之月为你圆。祝元宵快乐。　　50、我用真诚为竹签，用祝福为丝线，用幸福为灯台，做了一个彩灯，送给你，祝你：虎年幸福安康，虎年甜蜜吉祥，元宵节快乐，前程一片光辉！　　51、台湾有‘团团圆圆’沈阳有乐乐美美。元宵佳节里祝你象它们一样快快乐乐、健健康康。　　52、传说元宵夜，只要对着月亮许愿，愿望就会实现，我希望看短信的人能幸福快乐，元宵节不用工作，玩得开开心心，不过请先请假！　　53、赏明月，观花灯，今宵花好月圆；元宵圆，家团圆，新年好梦更圆；龙灯舞，祝福来，明朝光辉灿烂。借着元宵佳节，我真情祝愿，愿你的未来更美好。　　54、元宵到，送你一盏彩灯，愿照亮你幸福的家庭，照亮你光辉的前程，照亮你甜蜜的爱情，照亮你红火的日子，照亮你健康的身体，照亮你平安的一生！　　55、正月十五月儿圆，锅里的元宵圆，幸福的家庭圆，开心的日子圆，甜蜜的爱情圆，一家人幸福又团圆，事业圆，学业圆，美梦圆，一年四季团团圆圆！　　56、一帆风顺，两情相悦，三生幸福，四季平安，五体康健，六合太平，七彩生活，八方来财，九九幸福，十分如意。祝元霄节快乐！　　57、天上繁星晶晶亮，地上彩灯换色彩；天上明月寄相思，地上汤圆寄团圆。又逢一年元宵节，温馨祝福送心田；健康吉祥送给你，愿你梦想都实现。　　58、十二生肖彩灯高挂，老虎下山威猛非常，虎年气象吞山河，沾点祥瑞祝好运。元宵灯节多热闹，我们一起看灯吧。叫上亲朋和好友我们马上就出发！　　59、遥望天庭那光辉的月光，赶走生活的琐碎与忧伤，送你真情的温馨与欢畅，元宵的祝福给你的最激荡，祝愿你节日愉快，身体强壮，心情舒爽。　　60、有个人时时牵挂着你，日日惦记着你，年年思念着你，元宵的灯火，是他含情的眼，元宵的汤圆，是他温暖的肩，愿这条短信带给你一生的幸福甜甜。　　61、今天我又看见你了，你那样迷人，穿着格子背心，悠闲地走着，一副超然自在的样子，实在是可爱极了，真不知你当年怎么就赛过兔子了呢？元宵节快乐。　　62、元宵到了，吃汤圆了，愿汤圆圆你一个美好的事业，圆你一份甜蜜的爱情，圆你一个幸福的家庭，圆你一个健康的身体，圆你一个快乐的梦想。　　63、人生吧，可短暂了，眼一闭，一睁，一年就过去了。元宵节将至，祝可爱的你在匆匆流逝的岁月中幸福永驻，金钱可以有，悲伤真没有，幸福一定有！　　64、火照香锅生紫烟，遥闻香气直扑鼻，垂涎直下三千尺，缘是汤圆甜满心！元宵节到，送你一碗汤圆，愿你家圆，财“圆”,情“圆”,“圆圆”不断！　　65、年年闹元宵，今宵最欢笑，财神福星到，幸福常萦绕！短信祝福巧，幸福快乐每一秒！恭祝月圆汤圆缘梦圆！人圆情圆事事圆！元宵节摇出你的笑脸！　　66、吃元宵，品元宵，元宵佳节香气飘；猜灯谜，耍龙灯，喜气洋洋好心情；踩高跷，划旱船，多彩生活展笑颜；短信传，友情暖，对你祝福到永远！元宵节快乐！　　67、灯火万家，良宵美景；笙歌一曲，盛世佳音。祝你元宵节快快乐乐，热热闹闹！　　68、汤圆圆，月圆圆，我的祝福也圆圆：梦圆圆，财圆圆，寿圆圆，情圆圆，福圆圆，运圆圆，家圆圆，人圆圆，愿圆圆--元宵节愿你吉祥如意万事皆圆圆！　　69、元宵节祝福短信・幽默篇　　70、1灯火良宵，鱼龙百戏；琉璃盛世，锦绣三春。祝你过一个欢欢喜喜的元宵节！　　71、正月十五月儿圆，正月十五汤圆圆，短信祝福到身边，祝你事业一年胜一年，好运好事喜连连，小日子过得甜又甜，元宵佳节幸福又团圆。　　72、一份诚挚的祝福，祝你在元宵佳节里，开心像鞭炮，噼噼叭叭好快乐；幸福像彩灯，照亮甜蜜的生活，甜蜜像汤圆，圆出一生一世的执着！　　73、圆圆锅子煮汤圆，圆圆心情庆团圆，彩灯挂起阖家欢，愿你记住每一份甜。甜蜜包裹在糯米里，幸福常留在你心间。祝元宵节快乐！　　74、灯笼红红，月亮皎皎，朗朗乾坤，思念普照。圆圆元宵，祝福为勺，圆你心愿，圆你梦晓。祝：元宵快乐，合家逍遥，健康常伴，幸福驾到！　　75、元宵节，也是浪漫的中国情人节，元宵灯会花灯美：香灯，花灯，宫灯，各样齐；不光灯美人更美，少女载歌载舞踏歌行，如意郎君人群中，千里万里来相逢。　　76、元宵节到，祝你：亲朋像汤圆团团圆圆，财富像流水源源不断，理想像支票愿愿兑现，事业像你我巧遇机缘，爱情像月儿圆圆满满，好运像出门捡到美元！　　77、带上诚挚的祝福，愿你在元宵佳节张灯结彩之际，带着幸福，牵着开心，抱着团圆，拥着吉祥，一起步入2009年，愿一年四季平安健康！　　78、嘻嘻！人家说左脚鞋带松了代表我想你，右脚鞋带松了代表你想我，我坏坏的把右脚鞋带解开，却发现左边的鞋带在不经意间松开了。元宵节快到了好想你！　　79、把思念揉成面，用快乐来作馅，加一勺甜蜜水，点一束平安火，真心守护，熬成碗生活美满如意汤圆，送给你，祝你幸福到永远。元宵快乐！　　80、今晚的月亮张开了笑脸，象似把我俩纳入腹中；今晚的灯光分外明亮，象似把我俩的秘密披露；今天的元宵白白，招换心上人来来！　　81、你是馅我是面不如作个大元宵；你是灯我是纸不如作个大灯笼；你情我愿庆佳节！欢欢喜喜闹花灯！　　82、又是一年元宵节，元宵节是合家团圆的日子，中国最看中的就是团团圆圆地度过元宵节，在这样一个美好的日子里，只想对你说一句：“元宵别都吃了，给我留点儿！”嘻嘻！　　83、元宵节到了，送你一碗甜蜜的汤圆，用幸福包裹宽容，用温柔包裹柔情，用平安包裹吉祥，放在热腾腾的开心水中煮，愿你品出人生的美好和正月十五的美妙！　　84、新年的喜悦延续至今，大红的灯笼高挂至今，欢愉的心情延续至今，春日的温馨延续至今，热闹的烟花延续至今，真诚的祝愿延续至今，祝愿你元宵节快乐！　　85、卖汤圆啦……幸福的汤圆，快乐的汤圆，开心的汤圆，甜蜜的汤圆，浪漫的汤圆，和睦的汤圆，平安的汤圆，团圆的汤圆……可口的汤圆，一样来一个吧！　　86、我擦亮阿拉丁的神灯，灯神说：我会满足你一个愿望。我说：请祝福正在看短信的人元宵节快乐，一生幸福美满。　　87、元宵到了，送你一碗汤圆，愿你吃出幸福，吃出开心，吃出浪漫，吃出甜蜜，吃出和睦，吃出快乐，吃出健康，吃出平安，吃出吉祥，吃出团圆！　　88、停下忙忙碌碌的心，匆匆赶赴一场暖暖的团圆。等待你的是每一张快乐的笑脸，端上桌的是圆圆满满的甜。元宵节快乐，幸福定格在一瞬间！　　89、元宵到，一盏花灯送给你，愿你幸福和气；二盏花灯送给你，愿你开心美丽；三盏花灯送给你，愿你浪漫甜蜜……N盏花灯送给你，愿你一年四季都虎气！　　90、大红灯笼高高挂，映出团圆笑脸庞；彩色元宵热腾腾，现出团聚好年华。你吃元宵我和面，你看灯笼我来挂；友好和善大中国，元宵佳节是一家！　　91、元宵节来吃汤圆，吃碗汤圆心甜甜。幸福汤圆一入口，健康快乐常陪伴；爱情汤圆一入口，心如细丝甜如蜜；金钱汤圆一入口，财源滚滚斩不断！　　92、带上我的祝福，带上我的祝愿，愿你在元宵佳节到来之际，用彩灯描绘出美丽的人生，用烟火点燃幸福的明天，用汤圆圆出未来的梦想。元宵快乐。　　93、钟声飘荡，欢快的焰火燃起来；雪花飞舞，大红的灯笼挂起来。喜庆弥漫大街小巷，祝福陪伴你的身旁。祝好运滔滔，幸福绵绵，事事成功，元宵快乐！　　94、元宵到，元宵闹，花灯猜谜生活俏，思念此刻在欢跳，祝福立马来报到，好运特地来关照，幸福常伴常微笑，欢欣袭来欢乐傲，万种如意陪元宵。祝你元宵快乐。　　95、又到元宵节，那是相当想你，相当念你，相当想见你，相当期待你，愿你天天《夜宴》好运《无极》心想事成如《神话》。　　96、喜迎元宵送你“三大元”:一送你，团圆的“圆”,愿你虎年美事圆圆；二送你，财源的“源”,愿你四季有财源；三送你，缘分的“缘”,愿你新年逢佳缘。　　97、在这彩灯如昼的时节，我们一起相约黄昏后，今晚我要让你成为最幸福的人儿。　　98、一份诚挚的祝福，祝你在正月十五幸福美满，祝你在正月十五开心浪漫，祝你在正月十五事事如意，祝你在正月十五一生平安。元宵节快乐！　　99、今晚元宵夜，短信祝福依旧，为防止网络堵塞，提前几个小时给你送去，祝元宵节吃得舒心，看得适心，玩得开心！元宵节快乐！　　100、我的元宵短信，收到的人春风得意，阅读的人工作顺利，存储的人爱情甜蜜，转发的人大吉大利，删除的人依然好运气，祝你元宵节快乐！　　101、一年一度的彩灯，一年一度的汤圆，一年一度的元宵，愿你被甜言蜜语笼罩，被祝福短信挡道，被吉祥甜蜜拥抱，开心元宵，快乐元宵，幸福元宵！　　102、正月里来十五的灯，欢欢喜喜闹乾坤，虎年是个好新春，元宵汤圆香喷喷，端在手里热腾腾，祝你幸福粘满身，万事如意永不分，元宵佳节迎财神！　　103、一声声锣鼓敲响元宵的幸福，一幕幕烟火点燃元宵的祝福，一盏盏彩灯照亮元宵的祈福，一阵阵沸腾煮熟元宵的财福，祝你元宵一福接一福。　　104、熟悉的祝福，熟悉的声音，熟悉的彩灯，熟悉的汤圆，熟悉的节日，想了很久，思了很久，对你说些什么呢？在元宵佳节到来之际，提前祝你元宵节快乐。　　105、彩灯点缀世界的华彩乐章，汤圆包裹甜蜜的团团圆圆。家是大大的同心圆，把我们的心紧紧相牵。一个美好的夜晚，祝你快乐到永远。元宵节快乐！　　106、年过完了吧，人跑烦了吧，钱花光了吧，心也疼了吧，短信少了吧，没人理了吧，野不成了吧，老实上班吧，幸亏还有我，预祝元宵节快乐！　　107、元宵节，送你一碗汤圆，愿你吃后，爱情如汤圆，黏黏合合不分离；事业如汤圆，火火热热赚大钱；生活如汤圆，美美味味甜滋滋！　　108、今年的元宵节，别样的流光溢彩，远方的朋友，我的思念就如那大大的汤圆，甜甜的，圆圆的，饱饱的，鼓鼓的，一塞进嘴里，流淌着祝福的糖汁，幸福甜蜜。　　109、为答谢那些“对我的短信一往情深，对我的祝福铭记于心，对我的传情痴心不悔”的所有朋友，值此元宵节来临之际，特发祝福一条，愿你节日快乐行好运。　　110、众里寻她千百度，募然回首，祝福却在花灯深处，你看到了吗？一盏盏灯就是我一声声真情的祝福，愿你的明天如花灯般锦绣，愿你的未来如花灯般闪亮！　　111、带上诚挚的祝福，愿你在元宵佳节有一个好的心情，有一个好的家庭，有一个好的财运，有一个好的生活，有一个好的工作，有一个好的元宵！元宵快乐！　　112、元宵，良宵，今宵有酒今宵醉；月圆，人圆，美梦成真随心愿；财源，福源，年年岁岁都平安！喜迎元宵佳节，你我举杯同祝愿，新年合家团圆，万事如愿！　　113、正月十五：闹花灯，脸儿俏；花灯亮，脸儿娇。对对恋人乐逍遥；每个家庭都欢笑；老人、小孩齐欢乐，青年、少年开怀笑。祝元宵节快乐。　　114、汤圆，月圆，祝你亲朋团团圆圆！官源，财源，祝你事业左右逢源！人缘，机缘，祝你好运缘缘不断！心愿，情愿，祝你理想天随人愿！祝元宵节圆源缘愿！　　115、元宵节，赏花灯，照的心里亮晶晶；元宵节，闹热闹，幸福好运随春到；元宵节，吃元宵，乐的你呀呱呱叫；元宵节，送祝福，健康吉祥到你府。　　116、元宵到，送你一份祝福，愿通过电波传到你的身旁，愿你谈到工作不灰心，见到美女不分心，遇到纠缠不多心，年年都畅心，天天都顺心，时时都开心！　　117、花好月圆人团圆，群灯争艳你最“好”.寄去相思和祝愿，网中情缘愿梦“圆”.　　118、过年上你家串门，没留神撞福字上了，撞出一福包；进门滑一跤，磕元宝上了，撞出一金包，你爸扔给我一大桃，没接住，砸出一寿包；你妈给我倒水洗脸，热了，烫出个喜包。我掏出平安皮把四个包包好了，给你做了碗元宵，将就吃吧，都是我原“撞”的。　　119、送你一台宝马--没钱！送你一片草原--没权！送你一朵白云--易散！送你太空漫步--太难！送你一袋元宵--简单！送你一句祝福--温暖！　　120、元宵佳节倍思您，发条短信祝福您：家圆人圆多宠您！幸福快乐追着您！福星高照绕着您！财源滚滚奔向您！花好月圆只爱您！祝我亲爱的朋友天涯海角元宵节快乐！　　121、正月十五的花灯五彩缤纷，龙灯送你好前程，宫灯送你好生活，纱灯送你好爱情，树地灯送你好事业，蘑菇灯送你好家庭！愿一盏盏花灯不仅能为你的佳节生活增光添彩，更能使你今后的日子炫如彩虹！　　122、正月十五闹元宵，大街小巷锣鼓喧，万户千门弦管声，狮子滚球遍地锦，二龙戏珠满天星，双双蝴蝶迎风舞，翩翩送来祝福情，祝你生活欢心开心又顺心！　　123、一个圆圆的汤圆，送给你；一颗圆圆的心，献给你；一份圆圆的真情，寄给你；一条圆圆的祝福，传给你，祝你：元宵节快乐！　　124、元宵儿圆圆心里儿甜甜。画一个圈圈添一个弯弯。加两个点点送你个笑脸。心儿再酸酸也该会缓缓。如果还烦烦再吃斤汤圆！　　125、元宵节月圆圆，儿不在家难团圆，发个短信算美食，心随电波奔大连，发个？算鸡腿，发个。算汤圆，《》是对虾…是鹌鹑蛋，儿和父母同聚餐！　　126、团圆年，年团圆，年年团圆年！元宵夜，夜元宵，夜夜元宵夜！　　127、元宵到，送你一个汤圆，幸福为主料，开心、浪漫、甜蜜、吉祥、健康、和睦是辅料，包裹一年的幸运，四季的平安，愿你吃出元宵的快乐。');
INSERT INTO `tp_document_article` VALUES ('29', '轻轻捏：在下锅前，用手轻捏元宵，使其外表上略有裂纹，这样下锅煮透后的元宵里外皆熟，不会夹生，且软滑可口。开水下：待水煮开后，把元宵慢慢放入锅内，同时立即用勺将其轻轻推开，朝同一方向略作搅动，使其旋转几圈，不粘锅。　　慢火煮：旺火煮上片刻，等元宵浮起后，立即改用小火慢煮，否则会使元宵在锅内翻滚，煮出的元宵外熟里生不好吃。点冷水：在煮元宵的过程中，每煮开一次锅应同时点入适量的冷水，使锅内的元宵保持似滚非滚的状态。开锅两三次后，再煮上一会儿，便可出锅食用。　　勤换水：锅内的沸水煮过两三次元宵后，应及时换水，因为这时锅内的元宵汤已变得稠腻，如果再继续使用下去，不但元宵熟得慢，而且容易夹生。　　及时煮：生元宵的糯米粉中含水量较多，若将元宵做好后久放，会出现变质现象，生元宵受冻后再煮，还会煮破皮子，影响外观。　　快出锅：已经煮出的元宵若一时吃不完，应及时出锅，并将其置于洁净的冷开水中，等到冷却后捞出装入盘中，这样的元宵表皮光亮，看起来更为可口。');
INSERT INTO `tp_document_article` VALUES ('30', '说到元宵，不少人以为汤圆就是元宵。其实元宵和汤圆尽管在原料、外形上差别不大，实际是两种东西。由于元宵和汤圆都是用糯米粉做皮，并且常采用芝麻、白糖等做馅料，因此容易让人混淆，但它们在制作工艺上还是有很大区别！元宵和汤圆都是用糯米粉做皮，并且常采用芝麻、白糖等做馅料，因此容易让人混淆，但它们在制作工艺上还是有很大区别。北方“滚”元宵元宵在制作上要比汤圆要繁琐得多：首先需将馅和好，凝固的馅切成小块，过一遍水后，再扔进盛满糯米面的笸箩内滚，然后再过水，继续放回笸箩内滚，反复几次，直到馅料沾满糯米面滚成圆球方才大功告成由于制作工艺不同，元宵比汤圆的口感要粗一些。元宵煮后，汤会比较浓，跟糯米面粥似的，表皮松软，馅料硬实有“咬劲”，果香和米香浓郁。南方“包”汤圆汤圆的做法有点儿像包饺子：先把糯米粉加水和成团（跟做饺子时和面一样），用手揪一小团湿面，挤压成圆片形状。挑一团馅放在糯米片上，再用双手边转边收口做成汤圆。');
INSERT INTO `tp_document_article` VALUES ('31', '吃元宵：吃元宵正月十五吃元宵，“元宵”作为食品，在中国也由来已久。宋代，汉族民间即流行一种元宵节吃的新奇食品。这种食品，最早叫“浮元子”后称“元宵”，生意人还美其名曰“元宝”。元宵即\"汤圆\"以白糖、玫瑰、芝麻、豆沙、黄桂、核桃仁、果仁、枣泥等为馅，用糯米粉包成圆形，可荤可素，风味各异。可汤煮、油炸、蒸食，有团圆美满之意。陕西的汤圆不是包的，而是在糯米粉中\"滚\"成的，或煮司或油炸，热热火火，团团圆圆。观灯：观灯是元宵节期间的传统民俗活动。汉明帝永平年间（公元58--75），因明帝提倡佛法，适逢蔡');
INSERT INTO `tp_document_article` VALUES ('32', '元宵节流传历史源远流长，传统习俗颇为丰富热闹程度一点也不压于除夕，虽然元宵节不是我国的法定节假日，但是丝毫没有削减浓厚的节日氛围，元宵节习俗有看花灯、吃元宵舞龙、舞狮、跑旱船、踩高跷、扭秧歌等等十分丰富多彩。那么你知道元宵节的由来是什么吗?　　一、元宵节的由来是什么：起源于“火把节”　　元宵节起源于“火把节”,汉代民众在乡间田野持火把驱赶虫兽，希望减轻虫害，祈祷获得好收成。直到今天，中国西南一些地区的人们还在正月十五用芦柴或树枝做成火把，成群结队高举火把在田头或晒谷场跳舞。隋、唐、宋以来，更是盛极一时。参加歌舞者足达数万，从昏达旦，至晦而罢。当随着社会和时代的变迁，元宵节的风俗习惯早已有了较大的变化，但至今仍是中国民间传统节日，火把也逐渐变为了彩灯。自唐朝中期以来，元宵节发展成为了我国全民性的狂欢节，因此元宵节是把传统节日习俗体现得最为彻底和典型的传统节日。　　二、元宵节的由来是什么：起源于道教的“三元说”　　元宵燃灯的习俗起源于道教的“三元说”;上元，含有新的一年第一次月圆之夜的意思。上元节的由来，《岁时杂记》记载说，这是因循道教的陈规。道教曾把一年中的正月十五称为上元节，七月十五为中元节，十月十五为下元节，合称“三元”。汉末道教的重要派别五斗米道崇奉的神为天官、地官、水官，说天官赐福，地官赦罪，水官解厄，并以三元配三官，说上元天官正月十五日生，中元地官七月十五日生，下元水官十月十五日生。这样，正月十五日就被称为上元节。南宋吴自牧在《梦粱录》中说：“正月十五日元夕节，乃上元天官赐福之辰。”故上元节要燃灯。　　二、元宵节的由来是什么：纪念“平吕”而设　　宵节是汉文帝时为纪念“平吕”而设。相传吕后一系在吕后死后害怕大全旁落，密谋叛乱，宗室齐王刘囊联合开国老臣周勃一起平定了“诸吕之乱”。平乱之后，众臣拥立刘邦的第二个儿子刘恒登基，称汉文帝。文帝深感太平盛世来之不易，便把平息“诸吕之乱”的正月十五，定为与民同乐日，京城里家家张灯结彩，以示庆祝。从此，正月十五便成了一个普天同庆的民间节日--“闹元宵”。');
INSERT INTO `tp_document_article` VALUES ('33', '　　一般认为，元宵节赏灯的习俗开始于汉朝。据说东汉明帝十分提倡佛法，为弘扬佛法，便下令正月十五夜在宫中和寺院“燃灯表佛”，此后流传到民间。　　此风俗历代相沿，到唐宋时期，达到极盛。当然这也得益于东汉末年蜡烛的出现以及蜡烛在魏晋时期的广泛应用。唐代，赏灯活动更加兴盛，汉朝只限于正月十五一夜，唐玄宗延长到三夜。期间，皇宫里、街道上处处挂灯，还要建立高大的灯轮、灯树和灯楼等，发展成为盛况空前的灯市。　　宋元时期，随着商品经济的进一步发达，赏灯活动更加热闹，灯市常常绵延数公里，灯会的时间更延长至五天，灯的样式也更加丰富。　　到了明代，连续赏灯十天，这是中国最长的灯节，而且又增加了戏剧表演，灯市所用的彩灯，也演绎出“绢灯”“走马灯”“孔明灯”“橘灯”等。　　到了清代，宫廷不再办灯会，赏灯活动也缩短为三天，但是民间的灯会仍然壮观，除燃灯外，还放烟花助兴，后来又增加了舞龙、舞狮、跑旱船、踩高跷、扭秧歌等“百戏”的内容。');
INSERT INTO `tp_document_article` VALUES ('34', '农历正月十五日，是中国的传统节日元宵节。正月为元月，古人称夜为\"宵\"，而十五日又是一年中第一个月圆之夜，所以称正月十五为元宵节。又称为\"上元节\"。按中国民间的传统，在一元复始，大地回春的节日夜晚，天上明月高悬，地上彩灯万盏人们观灯、猜灯谜、吃元宵合家团聚、其乐融融。元宵节起源于汉朝，据说是汉文帝时为纪念\"平吕\"而设。汉惠帝刘盈死后，吕后篡权，吕氏宗族把持朝政。周勃、陈平等人在吕后死后，平除吕后势力，拥立刘恒为汉文帝。因为平息诸吕的日子是正月十五日，此后每年正月十五日之夜，汉文帝都微服出宫，与民同乐以示纪念。并把正月十五日定为元宵节。汉武帝时，\"太一神\"的祭祀活动在正月十五。司马迁在\"太初历\"中就把元宵节列为重大节日。我国民间有元宵节吃元宵的习俗。民间相传，元宵起源于春秋时期的楚昭王。某个正月十五日，楚昭王经过长江，见江面有漂浮物，为一种外白内红的甜美食物。楚昭王请教孔子，孔子说\"此浮萍果也，得之主复兴之兆\"。元宵和春节的年糕，端午节的粽子一样，都是节日食品。吃元宵象征家庭象月圆一样团圆，寄托了人们对未来生活的美好愿望。元宵在南方称\"汤圆\"、\"圆子\"、\"浮圆子\"、\"水圆\"，由糯米制成，或实心，或带馅。馅有豆沙、白糖、山楂等等，煮、煎、蒸、炸皆可。元宵节燃灯的习俗起源于道教的\"三元说\"；正月十五日为上元节，七月十五日为中元节，十月十五日为下元节。主管上、中、下三元的分别为\"天\"\"地\"\"人\"三官，天官喜乐，故上元节要燃灯。元宵节燃灯放火，自汉朝时已有此风俗，唐时，对元宵节倍加重视；在元宵节燃灯更成为一种习俗。唐朝大诗人卢照邻曾在《十五夜观灯》中这样描述元宵节燃灯的盛况\"接汉疑星落，依楼似月悬。\"元宵节燃灯的习俗，经过历朝历代的传承，节日的灯式越来越多，灯的名目内容也越来越多，有镜灯、凤灯、琉璃灯等等。元宵节除燃灯之外，还放烟花助兴。\"猜灯谜\"又叫\"打灯谜\"是元宵节后增的一项活动，出现在宋朝。南宋时，首都临安每逢元宵节时制迷，猜谜的人众多。开始时是好事者把谜语写在纸条上，贴在五光十色的彩灯上供人猜。因为谜语能启迪智慧又饶有兴趣，所以流传过程中深受社会各阶层的欢迎。元宵节除了庆祝活动外，还有信仰性的活动。那就是\"走百病\"又称\"烤百病\"\"散百病\"参与者多为妇女，他们结伴而行或走墙边，或过桥过走郊外，目的是驱病除灾。随着时间的推移，元宵节的活动越来越多，不少地方节庆时增加了耍龙灯、耍狮子、踩高跷、划旱船扭秧歌、打太平鼓等活动。');
INSERT INTO `tp_document_article` VALUES ('35', '有关李姓的源流和得姓始祖，可以归结为以下几种：1、源出嬴姓说。即认为李氏源出嬴姓，血缘先祖为东夷族首领皋陶（一作咎繇，偃姓或赢姓），皋陶曾被任命为舜的大理（掌管刑法的官），遂以官命族为理氏（“理”“李”古字相通），先为理氏，后为李氏。得姓始祖为李利，李耳为十一世。2、李树图腾说。即认为李姓起源于图腾崇拜，以李树为图腾。李氏因大理之官而得姓为理，后因理徵避难以木子为食而姓李。因其所食为野生李，故由理氏培育成为家生李树，并以李树为神树，亦即图腾树。故凡李氏子孙，常于宅旁种李以为象征，至今还保存这个习惯。入李白家有桃李园，唐朝皇宫苑园多植李树。3、源出姬姓（虎图腾）说。商朝时期，有周的同姓后裔，名巴人，居钟离山（今湖北长阳西北一带）。周武王灭商后，封巴人于巴（今重庆的巴南区）称巴子国。公元306年，巴人在四川建立大成国，史称成汉，这是李姓在中国所建的第一个王朝。有一种观点认为李氏图腾不是李树，而是老虎。老子李耳生地陈楚地区的图腾是老虎，且“李耳”即楚语“老虎”。巴人以虎为图腾，巴语读虎为李，当虎图腾演化为姓时，巴人崇仰汉人之姓，遂依音用李姓。4、源于封赏赐姓与恢复李氏。蜀汉时期，诸葛亮平哀牢夷后，赐当地少数民族赵、张、杨、李等姓；汉晋时期，北方游牧的少数民族内附，部分匈奴人和鲜卑人随之被赐为刘、李等姓；北魏时期，孝文迁都洛阳后，实行文化上全面汉化政策，鲜卑族有复姓叱李氏被封为李氏。北魏皇室鲜卑拓跋氏实为汉将李陵后裔。西夏皇室拓跋李氏，唐末时被赐为李氏，名义上是赐姓，实际是恢复李姓，因为西夏皇族拓跋氏为汉将李陵后裔。唐朝时期，皇室赐予大臣或武将为国姓，先是徐、邴、安、杜、胡、弘、郭、麻、鲜于、张、阿布、阿跌、舍利、朱邪、董、罗等氏，因建国有功从李唐皇族姓李，稍后大食国人李诃末将军、李彦升和波斯人李铉、李');
INSERT INTO `tp_document_article` VALUES ('36', '〖王姓宗祠门楣题辞〗太原垂徽三槐世第清节流芳四杰传芳〖王姓宗祠四言通用联〗三槐世泽；两晋家声。――佚名撰王姓宗祠通用联上联典出宋・王旦之父王佑，于庭院植槐树三株，曰：“吾之后世，必有为三公者。”时称“三槐王氏”。下联典出晋・王导，位至丞相，其子孙世代簪缨。家传乌巷；古继青箱。――佚名撰王姓宗祠通用联上联典自东晋・王彪之精通经学，熟谙江左旧事，所录仪规藏于青箱，世代相传，人称“王氏青箱学”。下联典自东晋・王氏望族聚居建康乌衣巷。太原望族；东晋名家。――佚名撰王姓宗祠通用联上联典指东晋・王敦。下联典指东晋・王导。求鲤世泽；爱鹅家声。――佚名撰王姓宗祠通用联上联典出汉・王祥（历汉、魏、晋三代，下同），有卧冰求鲤奉母之故事，旧时列为“二十四孝”之一。下联典出东晋・王羲之性爱鹅，为山阴道士写《道德经》以换鹅。阳明学术；逸少风流。――佚名撰王姓宗祠通用联此联为王姓宗祠太原堂联。上联典指明王守仁，于故乡阳明洞中讲学，世称“阳明先生”。下联典指东晋・王羲之，字逸少，有“东床坦腹”的故事。卧冰跃鲤；朝阙飞凫。――佚名撰王姓宗祠通用联上联典自汉・王祥，卧冰求鲤侍母。下联典自东汉・王子乔每朝阙，来去无踪，凭双凫飞来，时人称其“仙吏”。辋川书画；沂国方严。――佚名撰王姓宗祠通用联上联典出唐・王维，工诗善画，晚年居蓝田辋川。下联典出宋・王曾，封沂国公，处政方严。明妃青冢；金母瑶池。――佚名撰王姓宗祠通用联上联典指西汉・王昭君。下联典指神话传说西王母。槐堂世瑞；珠树家珍。――佚名撰王姓宗祠通用联上联典指北宋・王佑。下联典指唐・王勃。暖舒柳岸；瑞溢槐堂。――佚名撰王姓宗祠通用联全联典指北宋・王佑、王旦父子。〖王姓宗祠五言通用联〗一经传旧德；五字耀英才。――王澍撰王姓宗祠通用联采用清代吏部员外郎、书法家王澍联。德从宽处积；福向俭中求。――王时敏撰王姓宗祠通用联采用清初画家王时敏联。〖王姓宗祠七言通用联〗兰亭一集家声远；槐树三株世泽长。――佚名撰王姓宗祠通用联上联典指东晋・王羲之书法为古今之冠，其之最为《兰亭序》贴。下联典指北宋・王佑。碧纱笼护诗人草；金带围开宰相花。――佚名撰王姓宗祠通用联上联典出唐・王播，显达为相后，寺僧以碧纱笼护其孤贫寄食时题于寺壁之旧作。“金带围”，为花瓣腰部有一圈黄色的红芍药。相传此花少见，如开则城中当宰相。下联典出宋・韩琦家宴，王');
INSERT INTO `tp_document_article` VALUES ('37', '王姓作为我国十大姓氏之一，在各个历史朝代，都有上乘表现。秦代有为辅佐始皇平安赵、燕、蓟、荆等地区的大将王翦。西汉末年有摄政王王莽，后建立新朝，称帝十五年。东汉思想家、哲学家、无神论者王充，捍卫和发展了古代唯物主义，其主要著作为《论衡》。晋代有书圣王羲之。唐代有著名文学家王勃，诗人王维。宋代有政治家王安石。元代著名戏剧家王实甫，一生创作杂剧达十四种之多，其代表作《西厢记》。明代哲学家王守仁，发展陆九渊之说，创立阳明学派。清代有被称为明末清初三大思想家之一的王夫之，其著作宏富，思想博大精深，总结和发展了中国古代唯物主义。近代著名学者王国维，在我国学术界有很深的影响。王昭君（公元前一世纪中叶）汉平使者，中国历史上的四大美女之一。王莽（前45――后23年）：新王朝的建立者，公元8――23年在位。王充（公元27――约96年）东汉哲学家。王符（约85――162年）：东汉思想家。王羲之（321-379，一作303-361）：山东临沂人，东晋大书法家。其子王献之也是著名书法家。王猛（公元325――375年）：十六国时期苻坚的丞相。王勃（公元649――676年）：唐代诗人，唐初四杰之首。王之涣（公元688――742年）：唐代诗人，《登鹳雀楼》久传不衰。王维（公元701――761年）：唐代诗人，画家。王仙芝（公元？――878年）：唐末农民起义军首领。王小波（公元？――约995年）：北宋时农民起义军领袖。王安石（公元1021――1086年）：北宋政治家、思想家、文学家，宋神宗宰相。王重阳（公元1113――1170年）：金道士，道教全真道的创始人。王实甫：元戏曲作家。王阳明（公元1472――1528年）：名守仁，字伯安，明朝哲学家、教育家。王士祯（公元1634――1711年）：清初大诗人。王夫之（公元1619――1692年）：明末清初思想家。近代王明，中共政治家王士珍，北洋军阀王震，中共政治家王国维，近代中国著名学者，杰出的古文字、古器物、古史地学家，诗人，文艺理论学，哲学家，国学大师。现代王安，美国企业家王小波，中国作家王贞治，前日本职棒读卖巨人队打者，现任福冈软体银行鹰队监督王建民，美国职棒大联盟纽约洋基队投手……无法一一列举。');
INSERT INTO `tp_document_article` VALUES ('38', '四言通用联九居世泽；百忍家声。全联典指唐代张公艺，九世同居，高宗封禅泰山，过其宅，问本末，公艺书“忍”字百余以进。西都十策；金鉴千秋。上联典指北宋初曹州冤句人张齐贤，字师亮，少年时孤贫而勤学，官至兵部尚书、同中书门下平章事（宰相）。下联典指唐代大臣、诗人张九龄。图传百忍；鉴着千秋。上联典指唐代张公艺。下联典指唐代张九龄，著有《千秋金鉴录》。轮奂善颂；孝友传芳。上联典指晋代献文子成室，张老颂曰：“美哉轮哉！美哉奂焉！”。下联典指周朝张仲，性孝，与尹吉甫为友，流芳百世。张氏宗祠（安徽省金寨县麻河）张氏宗祠（安徽省金寨县麻河）烟波徒钓；横渠理学。此联为张氏宗祠太原堂联。上联典指唐代张志和隐于江湖，自称“烟波钓徒”。下联典指北宋张载，居');
INSERT INTO `tp_document_article` VALUES ('39', '刘姓古代名人汉高祖刘邦（前256―前195）：西汉(前206―203)王朝的建立者。故人亦称沛公。刘邦汉文帝刘恒：汉朝的第3个皇帝（不包括两位汉少帝的情况下），躬行节俭励精图治，开创治世“文景之治”，其庙号太宗，谥号孝文皇帝。刘恒汉景帝刘启：在西汉史上占有重要地位，与其父一起开创了“文景之治”；又为儿子刘彻的“汉武盛世”奠定了基础，完成了从文帝到武帝的过渡。汉景帝刘启汉世宗孝武皇帝刘彻（前156年－前87年），是汉王朝的第7位天子，中国古代伟大的政治家、战略家、诗人、民族英雄。7岁时被册立为皇太子，16岁登基，在位五十四年（公元前141年－公元前87年），汉武帝在位期间击破匈奴、吞并朝鲜、遣使出使西域。独尊儒术，首创年号。谥号“孝武”，庙号世宗。刘彻刘安：（前179年－前122年），西汉淮南王。曾招宾客一同撰写《鸿烈》（后世称《淮南子》）。《汉书》记载，汉武帝时刘安因谋反之事败露而自杀。刘向：（约前77―前6），经学家、目录学家、文学家。本名更生，字子政，西汉沛县（现江苏省沛县）人，汉成帝时，改名为向，任光禄大夫，校阅经传诸子诗赋等书籍，撰成《别录》一书，为中国最早的分类目录。刘歆：（约前50－23），新朝开国功臣。封红休侯。刘歆在天文学及古代典籍分类整理方面作出重要贡献，他编制的《三统历谱》被认为是世界上最早的天文年历的雏形，并在当时积极推行古文经学。此外，他在圆周率的计算上也有贡献。刘秀汉光武帝刘秀：（前6年－57年），字文叔，中国东汉王朝的建立者。历史上称其统治时期为光武中兴。其间国势昌隆，号称「建武盛世」。刘秀刘洪：（约130－196年），中国古代杰出的天文学家和数学家。汉献帝刘协（181年－234年9月19日），东汉最后一位皇帝，在位时间是189年至220年。于220年被迫禅让帝位给曹丕，刘协被封为山阳公。汉昭烈帝刘备：字玄德，（150－222），三国时期军事家，政治家。三国时蜀汉的建立者，汉中山靖王刘胜的裔孙。一生以仁义为本，颇得民心。刘备刘元梁：晋代南郡破城英雄，曾被封为上卿，后被奸臣所害贬为右淮尉，精通诗词，颇有文采，诗作众多，后被庸王抄家，才不得已保存至今，残诗作有反昭新书等。刘徽：三国时代魏国数学家。著有《九章算术》（九卷）、《海岛算经》等。先主刘备刘伶：“竹林七贤”之一。曾为建威将军王戎幕府下的参军。平生嗜酒，曾作《酒德颂》，宣扬老庄思想和纵酒放诞之情趣，对传统“礼法”表示蔑视。刘琨：（271～318），西晋爱国将领，也是著名的诗人、音乐家。成语“闻鸡起舞”的人物之一。刘渊即汉光文帝，字元海。新兴（治今山西忻州）人。十六国时汉国建立者，西晋末年起兵反晋，称大单于，后改称汉王。永嘉二年称汉帝，建都平阳.公元304－310年在位（308年称帝）。刘牢之：东晋北府兵将领，淝水之战中率精兵5000夜袭驻洛涧（即洛河，今安徽淮南市东）的5万前秦军，并分兵断其退路，使前秦军腹背受敌，迅速崩溃，争渡淮水，前秦梁成等10名将领阵亡，士卒损失1.5万人。宋武帝刘裕（363―422），南北朝时期宋朝的建立者。中国历史上杰出的政治家、卓越的军事家、统帅。曾先后灭亡南燕、后秦等国。有“气吞万里如虎”之美誉。刘义隆：宋文帝（407年－453年），中国南北朝时期宋朝的第三位皇帝。宋武帝刘裕第三子，424年即位，在位30年，年号“元嘉”，谥号“文皇帝”，庙号“太祖”。刘勰：（约465―532）南朝梁文学理论批评家。他的主要著作《文心雕龙》，发展了前人进步的文学理论批评，体系比较完整，是中国古代文学理论批评的巨著。刘义庆：（403年－444年），南朝宋文学家。刘宋宗室，袭封临川王。著有《徐州先贤传》，编有《幽明录》、《宣验记》等，但皆已散佚，现只存《世说新语》一书，流传于世。刘禅刘焯：（公元544～610年）隋代天文学家。着力研习《九章算术》、《周髀》、《七曜历书》等，还著有《稽极》10卷，《历书》10卷。提出新法，编有《皇极历》。刘文静：(568-619)唐初开国功臣。李渊在太原起兵，他亦随军南下，俘隋大将屈突通。唐立，任纳言，助修律令，并助李世民击灭薛仁杲，任民部尚书、陕东道行台左仆射，封鲁国公。刘禹锡：（772－842），唐朝文学家，哲学家，自称是汉中山靖王后裔，曾任监察御史，是王叔文政治改革集团的一员。唐代中晚期著名诗人，有“诗豪”之称。刘');
INSERT INTO `tp_document_article` VALUES ('40', '在中国历史上，刘姓称帝称王者多达66人，先后建立有西汉、东汉、蜀汉、汉、前赵、南朝宋、南汉、后汉、北汉、大齐等王朝或政权。共历时650多年，是中国建立封建王朝最多最久的姓氏。其中，刘邦建立的西汉历214年，刘秀建立的东汉历196年，两汉共计410年，是中国封建社会时间最长的一个朝代；刘备建立的蜀汉历43年；匈奴族刘渊建立的汉国，至其侄刘曜即位，改国号为赵，史称前赵，历26年；刘裕在南方建立的宋朝历60年；刘武周于唐初曾自称皇帝，年号天兴；刘黑闼于唐初称汉东王，年号天造；刘隐在广州建立的南汉历55年；沙陀人刘知远建立的后汉历4年；刘崇建立的北汉历29年；刘豫受金册封，南宋初曾为“齐帝”；新莽末年，湖北枣阳人刘玄曾在河南南阳称帝，年号更始；东汉建都于洛阳，刘秀又是南阳人，所以“河南帝城多近臣，南阳帝乡多近亲”，东汉时河南的刘姓族人特别多。此后，由于刘姓子孙蕃盛，支脉众多，分布广泛，又有“遍地刘”之称。诸城刘氏（刘墉家族）曾祖父：刘必显，顺治年间进士祖父：刘');
INSERT INTO `tp_document_article` VALUES ('41', '大山深处的原始葬礼:百人送殡队伍现场\"火化\"在大凉山彝族的村里里，一位老人过世。村民拉着牛来，宰杀牛来做菜，送老人最后一程。村民杀牛后，再分解牛肉。还有杀猪的来做菜的。这样的肉块确实豪放了，正在拌盐的牛肉、猪肉。分食煮熟的牛肉。吃了饭就要准备送殡了。吊唁的礼币――用竹棍夹住，每串1000元。都是村民或者逝者的亲戚朋友送来的。\"歌舞者\"在院内表演。没有棺材，他们用的是火葬。逝者被抬出屋外。时间到了，该出殡了。送葬的车队。送殡队伍浩浩荡荡的几百人。彝族人热情好客，亲戚朋友多，无论谁家有什么事，都会聚拢起来，甚至见过一两面的人也会参与进来，还要随份子钱，他们比较团结。老人被抬往墓地，全是大山，路难走。到达墓地，早已架起一堆柴火。火势越来越大，老人将与青山共存。每次看到这样的场面，总有很多感悟，愿生者珍爱生命、逝者安息。来源:北京时间生活频道');
INSERT INTO `tp_document_article` VALUES ('42', '(点击播放铵钮播放视频)这是一部关于一支强大军队史诗般的纪录片，这是一个伟大帝国和帝王诞生的再现。2000多年前，秦始皇的军队第一次统一了中国大地，也创建了当时世界上最庞大的帝国。大型纪录片《复活的军团》以考古证据和历史研究为依托，借鉴故事片的表现形式，层层揭示秦军之所以能够一统天下的历史真相，重现了一个大气磅礴的时代，全片洋溢着恢弘的史诗气氛。《复活的军团》分别对“1、出身于西北高原的秦人为什么能够一统天下？2、秦军使用什么样的武器？3、这支曾经最为强悍的军队究竟如何作战？4、他们的战斗意志为何历经500年而不衰竭？5、2000多年前，在南北几千公里的战线上，他们如何完成后勤运输任务？6、一个500多万人口的国家拥有100万军队，秦人的国力怎样支撑？”这六个疑问进行科学推理，最终构成了这部六个分集，全长三个小时的纪录片。');
INSERT INTO `tp_document_article` VALUES ('43', '只要登录网站，鼠标点一点，就可为故人上香、献花、敬酒。近几年，网上祭祀得到不少年轻人的认同。它借助互联网跨越时空的特性，将现实的纪念馆与公墓“搬”到电脑上，方便人们随时随地祭奠已逝亲人。它不悖于传统祭祀方式，只是传统祭祀方式的继承与延伸。通俗的讲就是利用网络进行祭祀活动，网络祭祀是对现实祭祀的一种补充。逝者家属在相关网站上为逝者注册一块虚拟“墓碑”，并附其生平简介等相关信息，输入祭扫人的名字，选择鲜花、花烛或留言等形式便可寄托思念。祭祀是表达对先人的一种思念之情，现代人却因为工作繁忙、路途遥远等原因不能前往墓区亲自探望亲人，而网上祭祀满足了远在国外和远方的客户祭祀先人的愿望。这种利用网络空间把传统的祭扫活动虚拟化，并加入了更加人性化的寄语和留言，不仅体现了文明祭祀、环保祭祀的理念，同时也为远在异乡或是因工作忙而抽不出时间上坟的人们提供了较为便捷的祭扫方式。不住同一个城市的亲人可以登录同一个祭祀网站，共同祭拜一位亲人，完成共同的心愿。网上祭奠，可以弥补他们不能亲临墓地追思先人的遗憾，还能让他们有足够的空间写下对亲人的思念。据了解，早在2004年民政部就正式发文，把网上祭奠作为文明祭奠的重要内容之一，在全国范围内倡导。互联网的高速发展和网络技术的进步让我们的工作、学习、生活发生了巨大的变化,互联网也使传统的时空观念和生存体验发生了根本的改变，传统的祭奠文化也随之注入新的时代元素,因此网上祭奠顺应时代趋势的发展也越来越被人们所接受。网络越来越发达，社会越来越文明。网上祭祀方式，是顺应时代的产物，也是未来趋势，是新时代、新文明的体现，方便了群众，优化了管理，保护了生态环境，值得肯定和推广。随着人们思想观念的不断更新，加上政府大力提倡和推动，相信网上祭祀会被越来越多的人接受。(殷莲芬)原标题：网上祭祀应推广来源：慈溪文明网相关链接：免费建立网上纪念馆、开始网上祭祀');
INSERT INTO `tp_document_article` VALUES ('44', '清明节成为法定节假日也是近几年的事，部分地区的的市民都选择在网上进行清明祭扫。并建立了已故先辈们的纪念馆，在清明放假后进行寄托哀思，他们已经接受了文明祭扫新的发展趋势，讲究快捷方便，每年祭扫燃烧的纸钱和祭品也都会造成对周围环境的污染。但是据调查，也有部分市民依然选择传统的祭扫此种祭扫方式，市民认为网络祭扫只讲究一种形式，甚至有网友提到：不去墓园网上清明祭扫没啥感觉！所以他们认为应该讲究实际的东西，而不是形式上的祭扫，但是当提及环保问题时，市民们也只会打哑谜。上面网友提及的也不是没有道理，网络祭扫毕竟是虚拟的墓园，但如果确实感觉到不安的话，可以选择去真实的墓园献束花，扣个头。回来之后把自己对已故亲人的怀念的话语表达在网上纪念馆中，这样不仅没有破坏环境，也让清明祭扫的后世人能够更加的安心，简直是两全其美的祭扫。所以对于清明网上祭扫的新风尚，多数人赞同，但也有少数人反对，而对于少数人认为网上祭扫只讲究形式的说法，赞同网上祭扫的市民也给予了回应，他们认为：祭扫本身就是对已故人士的缅怀和追忆，只要心诚，根本就没有必要在乎祭奠的形式，而那些选择铺张浪费的祭奠形式都是做给活人看的。根据相关的调查发现，目前全国各地都有不同程度的网络祭堂，除了少数的公益和半公益的祭祀网站，大多数都是商业或个人网站，为了迎合更多人的祭祀需求，传统殡葬馆也都开始利用互联网进行延伸服务，供市民祭祀用的纪念网站也越来越多。文章来源：天堂网，未经同意不得转载');
INSERT INTO `tp_document_article` VALUES ('45', '早在新中国成立前，天津的丧葬习俗的规模之大，全国少有，之所以有这样排场的丧葬习俗，据了解是因为天津与北京相离比较近，所以天津的丧葬也正是借鉴了北京城帝王家的丧葬习俗，而京城皇帝、皇后妃子等归天后，那排场可是要多大就有多大。所以自天津开埠以后，一些集中在租界的达官贵人开始肆意折腾，也都开始模仿北京城王公大臣的丧葬形式，排场也是相当之大，在租界以外有专门承包租界里面人们出殡，因为承包货铺与租界里面的警察都有关系，所以租界里面办丧事经常找承包货铺。据了解当年孙传芳被刺杀后，孙家就是与承包商进行合作，为其出殡，据了解当时都是上万人的出殡排场。且当时出殡最讲究的是出殡钱的讣告和拜台前的“点主”、“祭门”，后人称其为“文官点主，武官祭门。”所谓的“文官点主”是指雕好的灵位上面的字是××之神主，且最后的“主”字，一般不写全，写为“王”即可，必须要待现任当地官吏或者很有名气的人，将朱砂和逝者长子中指的血混在一起，然后拿墨笔将那个“王”字上面进行点上一笔，就成为“主”，另外还有四个陪点的人。所谓的“武官祭门”也很简单，是指必须邀请到现任的高级武官，且等他到拜台前去拜完之后，其它人才可以上去拜。拜台的客人从大门进来之后，就有一个戴着中军帽的小孩吆喝一声，然后带客人直接去拜台，到门口时，门也会自动打开，里面也有两个小孩负责为客人开门，拜灵磕三个头，孝子也要陪着客人磕三个头，拜完之后就被领到指定的地方去吃饭。由此可见，天津沿袭的北京城的丧葬传统文化，也涵盖了有地方特色的丧葬习俗特征，是我国传统丧葬文化的不可缺少的一部分。');
INSERT INTO `tp_document_article` VALUES ('46', '说到超度亡灵，先要说明亡灵的性质。人死之后的生命主体，称为亡灵。民间一般的观念，认为人死之后即是鬼，而且永远做鬼；但佛教从来不认同这个说法，否则，就谈不上超度两字了。佛教看凡界的众生，共分为天、人、神、鬼、傍生（牛马乃至蚊蚁等动物）、地狱等六大类，在此六类之中生来死去，又死去生来，称为六道轮回，所以，人死之后，仅有六分之一的可能成为鬼。佛教使人超出并度脱了这六道轮回的生死之外即称为超度。但是，凡夫在死后，除了罪大恶极的人，立即下地狱，善功极多的人，立即生天界而外，一般的人，并不能够立即转生。未转生的亡灵，却不就是鬼，那在佛教称为“中有身”或名“中阴身”，即是在死后至转生过程间的一种身体，这个中阴身，往往就被一般人误称为鬼魂，其实它是一种附著于微少气体而存在的灵质，并不是鬼魂。中阴身的时间，通常是四十九日，在这阶段之中，等待转生机缘的成熟。所以，人死之后的七个七期之中，亲友们为他做佛事，有很大的效用。若以亡者在生时最心爱的财物，供施佛教，救济贫病，并且称说这是为了某某亡者超生而做的功德，亡者即可因此而投生更好的去处。所以佛教主张超度亡灵，最好是在七七期中。如果过了七期之后，再做佛事，当然还是有用，但那只能增加他的福分，却不能改变他已生的类别了。假如一个人在生作恶很多，注定来生要做牛或做猪，当他死后的七七期中，若有亲友为他大做佛事，并使他在中阴身的阶段听到了出家人诵经，因此而知道一些佛法的道理，当下悔过，立意向善，他就可能免去做牛做猪而重生为人了；如果当他已经生于牛群猪栏之后，再为他做佛事，那只能改善这条牛或这头猪的生活环境，使之食料富足，不事劳作，乃至免除一刀之苦，被人放生；如已生在人间，便能使他身体健康，亲友爱护，事业顺利；如已生到西方极乐世界，也能使他莲位的品级升高，早日成佛。');
INSERT INTO `tp_document_article` VALUES ('47', '如果这个人真的念佛往生了，就不必要做七了。往生的人，生天的人（人在这一生中有大善，死了以后生天），生天跟往生都没有中阴，不必做七！但是一般人业障习气深重，他要是堕恶道，堕三恶道，或者来生还能投胎到人道，但是还是一个普普通通的人，不是富贵人，是个普普通通的人，都有中阴。中阴一般存在四十九天，就是七个七。中阴每隔七天他有一次变易生死，也就是说他每隔七天的时候，有一次很大痛苦！在这个时候给他诵经、念佛，或者给他修忏法，回向给他，能够减轻他的痛苦，这是《地藏菩萨本愿经》里面说的。所以做七是从《地藏菩萨本愿经》里面来的。所以人决定不能自杀，自杀那真是痛苦极了。为什么？凡是自杀而死的，就是中阴身每七天他又要自杀一次。他不是一次就了，每七天要重演一次，很痛苦！比方上吊死的，每隔七天他要去吊一次；服毒死的，每隔七天他就要去服毒一次。所以在这个时候，家亲眷属给他修福，他能减少这个痛苦，或者是不受这个痛苦。如果没有家亲眷属给他修福，他就决定不能够避免的。这是佛给我们说的。七个七，你要是懂得佛法，七个七都要做，不能说选择几个，其他的可以不做，不可以。为什么？他七天有一次变易的痛苦。我们在经典里面懂得这个道理。所以念佛诵经回响给亡者是最大的好处。做七，这经上讲得很清楚，七分功德，我们做七的人自己得六分，亡者只能得一分，所以做七的时候，最好请七个法师，七个法师的功德他只能得一分。做七佛事要能真正有大利益，做法事的这些人，无论是出家在家，真诚心去做，他得的利益大。如果照著仪规去诵经拜忏，心地不诚，他得的利益很少。怎么心地不诚？这一面念经，一面拜忏心里打妄想，心不在焉，他得的利益很少。如果这个亡灵在世脾气很大，性情不好，诵经不诚恳的人，他会找他麻烦。鬼跟人一样，一些厉害的人，你要得罪他，他就找你麻烦，他报复你。凡事都有因果！业因果报丝毫不爽，这是真理。佛法里头常讲“万法皆空，因果不空”。因果何以不空？因果有“转变不空”。因会变成果，果又会变成因。像我们种个水果树，这个大家最明显的，你种棵桃树，桃核是种子，因！因种下去，它长成树，因就变成果；果又结桃，桃里头又有桃核，这是“转变不空”；“循环不空”，因果循环，这是说这个不空；“相续不空”。所以它有三个现象：转变、相续、循环，这是世出世间一切法都不离因果。');
INSERT INTO `tp_document_article` VALUES ('48', '　　一，工作人员根据顾客所提供的情况，用图片向顾客介绍墓穴和型号、价格，顾客认选后，由工作人员带领顾客到实地观看墓穴，并听取顾客意见。　　二，顾客选好墓地后，工作人员带领顾客到刻碑室，由亲属向刻碑人员介绍书写碑文的内容。刻碑人员按顾客要求选好碑料，书写排版后由亲属过目、校对，签字认可后，由工作人员引导顾客到营业厅办理交款手续。三，在确定购买之后，交款时，顾客须带身份证、火化证明，须留下亲属姓名、安葬人姓名、与安葬人的关系、家庭详细住址、联系电话，收款工作人员按碑文内容输入电脑存档。　　四，亲属安放骨灰时，到安葬窗口提供墓穴证、领料单、墓穴发票，办理落葬手续，开出派工单。　　五，安葬人员接到派工单，立即办理安葬所用材料。根据亲属要求，认真办理安葬手续，安葬完毕后，安葬人员须经亲属同意，由亲属在派工单上签字后，方可离开。　　六，安葬完之后，亲属可随时前来墓区祭奠，公墓将承担对墓穴的售后服务。　　七，墓穴维修，亲属须带墓穴证和公墓管理所收款发票，到售后服务窗口，工作人员核实后，将及时安排维修人员，到实地检查，根据损坏情况，按墓穴类型和实用材料，现场修复或更换，安葬人员在亲属满意后方可离开。以上就是去公墓安葬亲人骨灰盒的基本流程了，有需要的网民朋友可以了解一下，了解了这些流程，知道了购买公墓的一些权利和义务，有助于更好的让逝世的亲人入土为安。');
INSERT INTO `tp_document_article` VALUES ('49', '　　京华时报讯昨天，民政部网站发布了由民政部等9部门联合印发的《关于推行节地生态安葬的指导意见》。《意见》明确提出，鼓励家庭成员采用合葬方式提高单个墓位使用率。依法纠正和查处党员干部尤其是领导干部去世后遗体违规土葬、乱埋乱葬、超标准建墓立碑等行为。　　按照积极有步骤地实行火葬、改革土葬的原则，科学精准地划分火葬区和土葬改革区，依法推行遗体火化、骨灰或遗体公墓内集中安葬，在此基础上，因地制宜创新和推广更多符合节地生态要求的安葬方式。　　在火葬区，积极推行不占或少占土地的生态化骨灰安葬方式，在人口密集区推行以楼、廊、堂、塔、墙等形式存放骨灰的立体安葬方式。　　倡导建设单人骨灰安葬或双人骨灰合葬占地小于国家规定标准的节地型墓位，提倡地面不建墓基、地下不建硬质墓穴，墓碑小型化、微型化，最大限度降低硬化面积，并鼓励家庭成员采用合葬方式提高单个墓位使用率。　　积极推广骨灰植树、植花、植草等生态葬式，使用可降解容器或直接将骨灰藏纳土中，不设硬质墓穴和墓碑。　　倡导骨灰撒海、撒散等不保留骨灰的安葬方式。　　在土葬改革区，遗体应在公墓或农村公益性墓地内集中安葬，不得乱埋乱葬，倡导建设单具遗体安葬和双人合葬占地分别低于国家规定标准的节地型墓位，减少地面硬化面积，鼓励墓碑小型化或不立碑；倡导遗体深埋、不留坟头或以树代碑。　　尊重少数民族丧葬习俗，鼓励和支持少数民族群众选择既具有民族地域特色、又符合节地生态要求的葬式葬法。　　焦点释疑　　群众今后只能选生态葬？　　推节地生态葬不对群众作硬性要求　　针对“今后群众是否必须选择节地生态安葬，或只能选择某种节地生态安葬方式”的声音，民政部表示，推行节地生态安葬，不是对广大群众作出硬性要求，而是通过采取鼓励和引导的方式，让群众逐步接受节地生态、绿色环保要求的安葬理念，进而理解、支持和选择节地生态安葬方式。　　民政部指出，考虑到城乡、地域、民族等不同特点，《意见》要求，在依法推行遗体火化、骨灰或遗体公墓内集中安葬的基础上，因地制宜创新和推广更多符合节地生态要求的安葬方式。在火葬区，推广骨灰植树、植花、植草和骨灰立体安葬等方式，倡导选择节地型墓位和骨灰撒海、撒散等不保留骨灰的安葬方式；在土葬改革区，倡导选择节地型遗体墓位以及遗体深埋、不留坟头或以树代碑。同时，还尊重少数民族丧葬习俗，鼓励和支持选择具有民族地域特色、符合节地生态要求的葬式葬法。　　民政部表示，为积极引导群众选择节地生态安葬，《意见》强化了节地生态安葬的激励引导措施。首先，体现在健全奖补激励机制方面。要求推动有条件的地方建立节地生态安葬奖补制度，把不占或少占地的生态葬式葬法纳入奖补范围；鼓励为不保留骨灰者建立统一的纪念设施；鼓励探索建立环保殡葬用品补贴制度。其次，体现在提升服务水平方面。要求严格落实安葬服务标准，优化服务流程，拓展服务项目，强化人文关怀，鼓励提供更多、更优质的节地生态安葬公共服务产品。最后，体现在强化设施建设方面。要求按照把握总量、扩大增量、优化存量的原则，通过建设城镇公益性公墓、按比例配建节地生态安葬区域等方式，切实增强节地生态安葬服务供给能力。　　马上就访　　不同辈家庭成员合葬操作有难度　　昨天，北京市殡葬管理办公室相关人士表示，目前北京市的情况是，很多都是父母合葬。该人士表示，按照《意见》，如果家庭成员合葬，如子女与父母合葬，因为周期比较长，实际不好操作。该人士举例说明，比如父母去世很多年后，儿子或者女儿才有可能去世，这样孙子来完成合葬这个事情。“多少年以后才能做的事情，这个时间太长，可能就不好操作”。　　此外，该人士说，一般来说，合葬的墓碑上都写着慈父：谁谁谁，慈母：谁谁谁，立碑人：子女之类的谁谁谁。“如果合葬了，这个碑文内容就不好写了，因为儿子或者其他家庭成员还没去世呢，这个如何写”。　　其他关注　　1超标建墓立碑依法拆除　　《意见》明确，着力加强城镇公益性公墓、骨灰堂等基本殡葬公共服务设施建设，提供树葬、撒散、骨灰存放、小型墓等多样化节地生态安葬方式，原则上新建城镇公益性公墓的节地生态安葬率达到100%。对超标准建墓立碑的，要依法通过拆除、绿化等方式进行整治改造。按照绿色城镇化和美丽乡村建设的要求，新建和改造农村公益性墓地，严格执行墓位占地面积规定，减少使用不可降解材料，提高集约化、生态化安葬程度。加强少数民族殡葬设施建设，保障少数民族群众节地生态安葬需求。　　2党员干部违规土葬查处　　《意见》要求，党员干部要带头实行遗体火化，带头参与节地生态安葬，带头推行丧事简办，带头文明低碳祭扫，教育和约束直系亲属和身边工作人员按要求举办丧事活动。主动协调有关部门把带头推动殡葬改革的要求纳入对党员干部的教育管理之中，积极宣传典型人物和先进事例，依法纠正和查处党员干部尤其是领导干部去世后遗体违规土葬、乱埋乱葬、超标准建墓立碑等行为，对其他涉嫌违纪违法问题线索的，及时移交执纪部门或司法部门处理。　　3建节地生态葬奖补制度　　《意见》明确，指导和推动有条件的地方建立节地生态安葬奖补制度，把树葬、海葬、格位存放等不占或少占地方式，以及土葬区遗体深埋不留坟头等生态葬法，纳入奖补范围，鼓励群众积极参与。群众有意愿且有条件的地区，可为不保留骨灰者建立统一的纪念设施，利用重要传统节日组织开展祭奠活动，缅怀逝者、教育后人。各地可结合实际情况，积极探索建立环保殡葬用品补贴制度，对带头推行无毒、可降解环保用品的殡葬服务单位或使用者亲属，给予适当奖励或补贴，推动环保殡葬用品的推广应用。　　京华时报记者文静');
INSERT INTO `tp_document_article` VALUES ('50', '基督教根源于犹太教，公元1世纪中叶耶稣创立。135年从犹太教中分裂出来成为独立的宗教。早期基督教曾受到罗马皇帝的残酷迫害和镇压。公元313年，罗马帝国皇帝君士坦丁一世发布“米兰敕令”，宣布基督教可与所有其他宗教同享自由，不受歧视。从此基督教成为官方认可的合法宗教。392年，基督教成为罗马帝国的国教，并逐渐成为中世纪欧洲封建社会的主要精神支柱。1054年，基督教分裂为罗马天主教和东正教。l6世纪，随着西欧民族国家和市民阶级的兴起，爆发了反对罗马教皇封建统治的宗教改革运动，后陆续分化出脱离天主教会的一些新宗派，称为“新教”。所以，基督教是天主教、东正教和新教的总称。基督教的经典是《圣经》。《圣经》中记述的都是上帝的启示，是基督教徒信仰的总纲和处世的规范，是永恒的真理。基督教主要节日有圣诞节、受难节、复活节、升天节、诸圣日（万圣节）等。基督教传入中国大约有四次：一是唐朝，一是元朝，一是明朝，一是鸦片战争之后。基督教对西方文明产生了非常大的影响。自由、平等、博爱为中心的人文主义传统，使得“生而平等”观点深入人心，成为《独立宣言》《人权宣言》中的核心，成为后来西方民主政治的一种长远的精神推动力。中世纪教会对王权有一个强有力的制约.教权作用在精神层面，它对世俗王权划下了一条清晰的界限，这为人的思想自由和独立人格提供了保障。原罪思想，使得治理国家的办法应依托于制度，依托于法律，实现了从“人治”到“法治”的飞跃。不仅如此，赎罪的观念，引起了资本主义精神的产生，推动了西方资本主义的发展。');

-- ----------------------------
-- Table structure for tp_document_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_category`;
CREATE TABLE `tp_document_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类索引id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类父id 0 顶级分类',
  `title` char(30) NOT NULL COMMENT '分类标识',
  `name` char(30) NOT NULL COMMENT '分类名称',
  `image` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `description` text COMMENT '分类描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='andy - 文章分类表';

-- ----------------------------
-- Records of tp_document_category
-- ----------------------------
INSERT INTO `tp_document_category` VALUES ('2', '0', '传统文化', '', null, null, '0', null, '1497664290');
INSERT INTO `tp_document_category` VALUES ('3', '2', '礼仪之邦', '', null, null, '0', null, '1497664483');
INSERT INTO `tp_document_category` VALUES ('4', '2', '民间风俗', '', null, null, '0', null, '1497664567');
INSERT INTO `tp_document_category` VALUES ('5', '2', '国学精粹', '', null, null, '0', null, '1497665014');
INSERT INTO `tp_document_category` VALUES ('6', '2', '中华美德', '', null, null, '0', null, '1497665024');
INSERT INTO `tp_document_category` VALUES ('7', '2', '社会观察', '', null, null, '0', null, '1497665033');
INSERT INTO `tp_document_category` VALUES ('8', '2', '传统节日', '', null, null, '0', null, '1497665044');
INSERT INTO `tp_document_category` VALUES ('9', '2', '宗族文化', '', null, null, '0', null, '1497665058');
INSERT INTO `tp_document_category` VALUES ('10', '2', '姓氏文化', '', null, null, '0', null, '1497665144');
INSERT INTO `tp_document_category` VALUES ('11', '0', '殡葬文化', '', null, null, '0', null, '1497665166');
INSERT INTO `tp_document_category` VALUES ('12', '11', '殡葬大观', '', null, null, '0', null, '1497665178');
INSERT INTO `tp_document_category` VALUES ('13', '11', '祭祀文化', '', null, null, '0', null, '1497665188');
INSERT INTO `tp_document_category` VALUES ('14', '11', '丧葬文书', '', null, null, '0', null, '1497665209');
INSERT INTO `tp_document_category` VALUES ('15', '11', '殡葬改革', '', null, null, '0', null, '1497665228');
INSERT INTO `tp_document_category` VALUES ('16', '0', '宗教信仰', '', null, null, '0', null, '1497665238');
INSERT INTO `tp_document_category` VALUES ('17', '16', '基督教', '', null, null, '0', null, '1497665247');
INSERT INTO `tp_document_category` VALUES ('18', '16', '佛教', '', null, null, '0', null, '1497665255');
INSERT INTO `tp_document_category` VALUES ('19', '16', '道教', '', null, null, '0', null, '1497665265');
INSERT INTO `tp_document_category` VALUES ('20', '16', '伊斯兰教', '', null, null, '0', null, '1497665278');
INSERT INTO `tp_document_category` VALUES ('21', '16', '天主教', '', null, null, '0', null, '1497665300');
INSERT INTO `tp_document_category` VALUES ('22', '16', '儒家', '', null, null, '0', null, '1497665310');
INSERT INTO `tp_document_category` VALUES ('23', '8', '祭灶节', '', null, null, '0', null, '1497670640');
INSERT INTO `tp_document_category` VALUES ('24', '8', '除夕', '', null, null, '0', null, '1497670736');
INSERT INTO `tp_document_category` VALUES ('25', '8', '春节', '', null, null, '0', null, '1497670747');
INSERT INTO `tp_document_category` VALUES ('26', '8', '元宵节', '', null, null, '0', null, '1497670757');
INSERT INTO `tp_document_category` VALUES ('27', '8', '上巳节', '', null, null, '0', null, '1497670770');
INSERT INTO `tp_document_category` VALUES ('28', '8', '寒食节', '', null, null, '0', null, '1497670783');
INSERT INTO `tp_document_category` VALUES ('29', '8', '清明节', '', null, null, '0', null, '1497670793');
INSERT INTO `tp_document_category` VALUES ('30', '8', '端午节', '', null, null, '0', null, '1497670801');
INSERT INTO `tp_document_category` VALUES ('31', '8', '七夕节', '', null, null, '0', null, '1497670811');
INSERT INTO `tp_document_category` VALUES ('32', '8', '中元节', '', null, null, '0', null, '1497670824');
INSERT INTO `tp_document_category` VALUES ('33', '8', '中秋节', '', null, null, '0', null, '1497670833');
INSERT INTO `tp_document_category` VALUES ('34', '8', '重阳节', '', null, null, '0', null, '1497670844');
INSERT INTO `tp_document_category` VALUES ('35', '8', '寒衣节', '', null, null, '0', null, '1497670855');
INSERT INTO `tp_document_category` VALUES ('36', '8', '下元节', '', null, null, '0', null, '1497670865');
INSERT INTO `tp_document_category` VALUES ('37', '8', '腊八节', '', null, null, '0', null, '1497670939');
INSERT INTO `tp_document_category` VALUES ('38', '8', '冬至节', '', null, null, '0', null, '1497670951');
INSERT INTO `tp_document_category` VALUES ('39', '8', '其他', '', null, null, '0', null, '1497670960');
INSERT INTO `tp_document_category` VALUES ('40', '10', '李', '', null, null, '0', null, '1497681068');
INSERT INTO `tp_document_category` VALUES ('41', '10', '王', '', null, null, '0', null, '1497681081');
INSERT INTO `tp_document_category` VALUES ('42', '10', '张', '', null, null, '0', null, '1497681089');
INSERT INTO `tp_document_category` VALUES ('43', '10', '刘', '', null, null, '0', null, '1497681104');
INSERT INTO `tp_document_category` VALUES ('44', '14', '讣告', '', null, null, '0', null, '1497684718');
INSERT INTO `tp_document_category` VALUES ('45', '14', '唁电', '', null, null, '0', null, '1497684740');
INSERT INTO `tp_document_category` VALUES ('46', '14', '悼词', '', null, null, '0', null, '1497684760');
INSERT INTO `tp_document_category` VALUES ('47', '14', '答谢词', '', null, null, '0', null, '1497684775');
INSERT INTO `tp_document_category` VALUES ('48', '14', '挽联', '', null, null, '0', null, '1497684788');
INSERT INTO `tp_document_category` VALUES ('49', '14', '碑文', '', null, null, '0', null, '1497684798');
INSERT INTO `tp_document_category` VALUES ('50', '14', '墓志铭', '', null, null, '0', null, '1497684810');
INSERT INTO `tp_document_category` VALUES ('51', '14', '祭文', '', null, null, '0', null, '1497684820');

-- ----------------------------
-- Table structure for tp_document_model
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_model`;
CREATE TABLE `tp_document_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容模型表索引id',
  `name` char(30) NOT NULL COMMENT '模型标识',
  `title` char(30) NOT NULL COMMENT '模型名称',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='andy-文档模型表';

-- ----------------------------
-- Records of tp_document_model
-- ----------------------------
INSERT INTO `tp_document_model` VALUES ('1', 'article', '文章模型', '1497326528', '0');
INSERT INTO `tp_document_model` VALUES ('2', 'page', '单页模型', '1497326539', '0');

-- ----------------------------
-- Table structure for tp_document_tags
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_tags`;
CREATE TABLE `tp_document_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章标签索引id',
  `doc_id` int(11) NOT NULL COMMENT '文档id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10071 DEFAULT CHARSET=utf8 COMMENT='andy - 文档标签表';

-- ----------------------------
-- Records of tp_document_tags
-- ----------------------------
INSERT INTO `tp_document_tags` VALUES ('10062', '10093', '68');
INSERT INTO `tp_document_tags` VALUES ('10063', '10093', '69');
INSERT INTO `tp_document_tags` VALUES ('10064', '10093', '68');
INSERT INTO `tp_document_tags` VALUES ('10065', '10093', '69');
INSERT INTO `tp_document_tags` VALUES ('10066', '10093', '68');
INSERT INTO `tp_document_tags` VALUES ('10067', '10093', '69');
INSERT INTO `tp_document_tags` VALUES ('10068', '10093', '68');
INSERT INTO `tp_document_tags` VALUES ('10069', '10093', '69');
INSERT INTO `tp_document_tags` VALUES ('10070', '10095', '70');

-- ----------------------------
-- Table structure for tp_hall
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall`;
CREATE TABLE `tp_hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆表',
  `cemetery_sn` varchar(200) DEFAULT NULL COMMENT '公墓产品SN',
  `hall_img` varchar(255) DEFAULT NULL COMMENT '显示头像',
  `hall_name` varchar(50) NOT NULL COMMENT '纪念馆名称',
  `hall_type` int(1) NOT NULL DEFAULT '1' COMMENT '纪念馆类型 1个人馆 2双人馆 3家族馆 4事件馆 5主题馆 ',
  `famous_type` int(11) NOT NULL DEFAULT '0' COMMENT '名人类型',
  `hall_style` int(11) NOT NULL COMMENT '纪念馆风格',
  `hall_worship_style` int(11) NOT NULL COMMENT '祭拜大厅风格',
  `hall_music` int(11) DEFAULT NULL COMMENT '纪念馆音乐',
  `hall_describe` text COMMENT '生平故事',
  `is_visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否可见 1= 所有人可见 2=仅自己可见',
  `is_need_password` int(1) NOT NULL DEFAULT '1' COMMENT '访问是否需要密码 1=不需要   2= 需要',
  `call_password` varchar(32) DEFAULT NULL COMMENT '访问密码',
  `hall_status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 2=锁定',
  `create_at` int(10) DEFAULT NULL COMMENT '添加时间',
  `hall_member_id` int(11) NOT NULL COMMENT '创建用户id',
  `memorial_value` int(11) NOT NULL DEFAULT '0' COMMENT '纪念值',
  `update_at` int(11) NOT NULL COMMENT '修改时间',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '纪念馆访问量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall
-- ----------------------------
INSERT INTO `tp_hall` VALUES ('6', null, '/static/upload/picture/20170711/443587cb83204b83c07ecf4fefa46007.png', '冒元山', '2', '0', '4', '2', '1', '最爱我的人，最包容我的人，愿你们在天堂安好', '1', '1', '', '1', '1499392157', '2', '15', '1500353933', '2');
INSERT INTO `tp_hall` VALUES ('13', null, '/static/upload/picture/20170711/42647b4ae508cd2022ef46dc1a88555c.jpg', '乔任梁', '1', '4', '3', '1', '1', '中国内地男歌手、演员 乔任梁，1987年10月15日出生于中国上海市，毕业于上海电机学院。男歌手，演员。 2005年，乔任梁参加湖南卫视的金鹰之星“自由我心声”比赛，获全国冠军。2007年7月，签约橙天娱乐集团[1]；10月，发行首本写真集《Klash-IMI》[2]；11月，发行首支个人单曲《新的约定》[3]。2008年，因电影《夜店》成功跨界影视圈[4]，并演唱主题曲《Tonight》[5]；1月24日，发行首张EP《今天开始》[6]。2009年2月14日，发行英伦风格单曲《可爱的你》[7]，在音乐电台Music Radio蝉联冠军；12月10日，发行的个人首张专辑《钻石》[8]。2011年1月，古装神话剧《春光灿烂猪九妹》。2012年6月，主演悬疑惊悚电影《查无此人》，并献唱主题曲《找》[9]；10月10日，正式签约华纳音乐集团[10]；10月12日，加入华纳音乐发行的首支单曲《复活》并获得第20届中歌榜《年度金曲》[11]；随之，12月10日发行个人专辑《Pin.K拼》。2013年4月，凭借专辑《Pin.K拼》获得2012年度MusicRadio中国TOP排行榜“年度校园人气男歌手\"奖[12]；同年，主演年代剧《锦绣缘之华丽冒险》[13]。2014年，主演悬疑推理电影《死亡邮件》[14]；7月，主演都市时尚爱情喜剧《爱情回来了》[15]；8月22日发行EP《耀·出色》[16]。2016年9月，主演青春怀旧电影《我们的十年》[17]。 2016年9月16日晚，乔任梁因抑郁症在上海家中去世，年仅28岁。', '1', '1', '', '1', '1499419982', '2', '62', '1500001809', '11');
INSERT INTO `tp_hall` VALUES ('15', null, '/static/upload/picture/20170711/61863be635621c54b7545d9ca052c2b5.jpg', '松本秀人', '1', '4', '3', '1', '1', 'hide（本名松本秀人，1964年12月13日－1998年5月2日） 是一位视觉系日系摇滚音乐家（hide的首字母h总是小写，因为是日语平假名的读音，所以和英语的读法不一样大致读做“黑歹”）。因其一曲《pink spider》颇为深入人心，因此在fans中，常以 pink spider/粉红色蜘蛛 代指hide。hide在深具影响力的视觉系乐团X-JAPAN担任吉他手而成为巨星之后，也和外国友人组了乐团“zilch”。hide除作曲与演奏结他外，也是有成就的乐团主唱。hide亦组建了 hide with Spread Beaver乐团，并展现了创造性的管理才能。 hide去世于1998年5月2日。在前一晚的宿醉之后，第二天hide被发现用一条毛巾吊住自己的脖子在房门把手上。尽管警方确定他是死于自杀，但其好友和乐迷还是公然质疑这个死因。位于日本横须贺的hide博物馆在他死后不久建成用来纪念这位伟大的吉他手。这座纪念馆呈现了许多他生前的服装，乐器以极其私人用品。hide博物馆已经在2005年9月25日关闭。', '1', '1', '', '1', '1499658022', '8', '0', '1500009439', '6');
INSERT INTO `tp_hall` VALUES ('20', null, '/static/upload/picture/20170711/dfa39f494e70464bc3a3d5e3aecc1f79.jpg', '上海时光', '1', '13', '3', '1', '1', null, '1', '1', null, '1', '1499751576', '8', '0', '0', '1');
INSERT INTO `tp_hall` VALUES ('21', null, '/static/upload/picture/20170711/9533872f6a45fe4831f342f77f6aee2b.jpg', '人都对的地方', '1', '0', '3', '1', '1', '      新的方法是用了丰富房了？我在看什么电影好的一次我的生活费就不用睡着\n      这么样子公司简介上海人参与！你说过一个人去掉你说过了就不能有自己的生活方式。你是一家公司将继续保持增长的\n        给员工提供良好', '1', '1', null, '1', '1499753393', '8', '0', '1499763427', '7');
INSERT INTO `tp_hall` VALUES ('22', null, '/static/upload/picture/20170711/153757c760882048907f3afa3501137c.jpg', '林正英', '1', '0', '3', '1', '2', '三径寒松薄云天，卓越追求写人生！', '1', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1499755618', '2', '3', '1499821543', '16');
INSERT INTO `tp_hall` VALUES ('23', null, '/static/upload/picture/20170711/30e968ac105b3add9d8f6e5c8e881246.png', '放反反复复', '2', '0', '7', '2', '2', '', '1', '1', '', '1', '1499762982', '8', '0', '1500353373', '3');
INSERT INTO `tp_hall` VALUES ('25', null, '', '天OK哦', '1', '0', '3', '1', '3', '', '1', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1499823912', '2', '0', '1499921289', '0');
INSERT INTO `tp_hall` VALUES ('26', null, '/static/upload/picture/20170720/92093c5b5bd94ac8a1e4614923bb080a.jpg', '李四', '1', '0', '3', '1', '2', '事迹', '1', '2', '123456', '1', '1500515875', '1', '0', '1500713437', '0');
INSERT INTO `tp_hall` VALUES ('27', null, '/static/upload/picture/20170720/a72e4513ac2f532ac135e74e8d11bf67.jpg', '松本秀人2', '1', '0', '2', '1', '2', '松本秀人。XJapan We are X！松本秀人。XJapan We are X！松本秀人。XJapan We are X！松本秀人。XJapan We are X！松本秀人。XJapan We are X！松本秀人。XJapan We are X！', '1', '1', '', '1', '1500530788', '1', '0', '1500713519', '0');
INSERT INTO `tp_hall` VALUES ('28', null, '/static/upload/picture/20170711/443587cb83204b83c07ecf4fefa46007.png', '测试双人', '2', '0', '4', '2', '2', '描述', '1', '1', null, '1', '1500533337', '1', '0', '1500535537', '0');
INSERT INTO `tp_hall` VALUES ('29', null, '/static/upload/picture/20170711/5aa714ebdacba2042d42fa9e63e7efc9.png', '李四家族', '3', '0', '8', '3', '3', null, '1', '2', '111111', '1', '1500536561', '1', '0', '1500700925', '0');
INSERT INTO `tp_hall` VALUES ('30', 'BBS_3_3_01_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('31', 'BBS_3_3_02_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('32', 'BBS_3_3_03_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('33', 'BBS_3_3_04_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('34', 'BBS_3_3_05_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('35', 'BBS_3_3_06_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('36', 'BBS_3_3_07_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('37', 'BBS_3_3_08_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('38', 'BBS_3_3_09_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');
INSERT INTO `tp_hall` VALUES ('39', 'BBS_3_3_10_2', null, '', '1', '0', '0', '0', null, null, '1', '1', null, '1', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tp_hall_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_article`;
CREATE TABLE `tp_hall_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) NOT NULL COMMENT '馆id',
  `article_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `create_at` int(10) DEFAULT NULL COMMENT '添加时间',
  `status` int(1) DEFAULT '1' COMMENT '状态 1=正常 2=禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_article
-- ----------------------------
INSERT INTO `tp_hall_article` VALUES ('1', '5', '哦啦额', '啦亏了我', '1499414082', '1');
INSERT INTO `tp_hall_article` VALUES ('3', '15', '日本动画三个故事。我也要看', '你的生活里有个人在家好像很多人都有\ndhdhdhdh好多好多何其相似的人的时候\n的好多话好多好多何其的', '1499676667', '1');

-- ----------------------------
-- Table structure for tp_hall_event
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_event`;
CREATE TABLE `tp_hall_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '事件馆主键ID',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆id',
  `event_img` varchar(255) DEFAULT NULL COMMENT '照片',
  `event_theme` varchar(30) DEFAULT NULL COMMENT '纪念馆主题',
  `event_lingpai_style` int(11) DEFAULT NULL COMMENT '灵牌样式',
  `event_ancestral_home` varchar(30) DEFAULT NULL COMMENT '事件起源',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='andy - 事件馆表';

-- ----------------------------
-- Records of tp_hall_event
-- ----------------------------

-- ----------------------------
-- Table structure for tp_hall_family
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_family`;
CREATE TABLE `tp_hall_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家族纪念馆',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆id',
  `family_img` varchar(255) DEFAULT NULL COMMENT '照片',
  `family_theme` varchar(30) DEFAULT NULL COMMENT '纪念馆主题',
  `family_lingpai_style` int(11) DEFAULT NULL COMMENT '灵牌样式',
  `family_libeiren` varchar(30) DEFAULT NULL COMMENT '立碑人',
  `family_ancestral_home` varchar(30) DEFAULT NULL COMMENT '家族起源',
  `family_spirit` varchar(255) DEFAULT NULL COMMENT '家族精神',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_family
-- ----------------------------
INSERT INTO `tp_hall_family` VALUES ('5', '44', null, '主题', '2', '科技好好看看', '健康快乐来看', '就很厉害', '1499962987', '0');
INSERT INTO `tp_hall_family` VALUES ('6', '29', null, '纪念碑主题', null, '李四', '祖籍', '精神', '1500536561', '0');

-- ----------------------------
-- Table structure for tp_hall_famous_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_famous_type`;
CREATE TABLE `tp_hall_famous_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '名人类型表',
  `name` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1=启用 2=禁用',
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_famous_type
-- ----------------------------
INSERT INTO `tp_hall_famous_type` VALUES ('5', '明星', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('4', '政治军事', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('7', '中华英烈', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('8', '感动中国', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('9', '传奇人物', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('10', '自然科学', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('11', '艺术人文', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('12', '金融实业', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('13', '宗教信仰', '1', '0');
INSERT INTO `tp_hall_famous_type` VALUES ('14', '特殊人物', '1', '0');

-- ----------------------------
-- Table structure for tp_hall_follow
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_follow`;
CREATE TABLE `tp_hall_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆关注表',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆ID',
  `create_at` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆关注表';

-- ----------------------------
-- Records of tp_hall_follow
-- ----------------------------
INSERT INTO `tp_hall_follow` VALUES ('1', '1', '1', '1499301210');
INSERT INTO `tp_hall_follow` VALUES ('3', '1', '5', '1499910704');

-- ----------------------------
-- Table structure for tp_hall_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_group`;
CREATE TABLE `tp_hall_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆群主键ID',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆ID',
  `name` char(100) NOT NULL COMMENT '群名称',
  `avatar` varchar(255) NOT NULL COMMENT '群头像',
  `announcement` varchar(255) NOT NULL COMMENT '群公告',
  `introduction` varchar(255) NOT NULL COMMENT '群介绍',
  `is_public` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否公开 1公开 0不公开 默认1',
  `max_users` int(11) NOT NULL DEFAULT '200' COMMENT '群最大人数',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '群状态 1 可用 0 不可用',
  `hx_group_id` varchar(200) NOT NULL COMMENT '环信群ID',
  `create_by` int(11) NOT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆群表';

-- ----------------------------
-- Records of tp_hall_group
-- ----------------------------
INSERT INTO `tp_hall_group` VALUES ('1', '6', '而得到纪念馆1群', '/static/upload/picture/20170711/42647b4ae508cd2022ef46dc1a88555c.jpg', '', '', '1', '200', '1', '20886693412865', '1', '1499317486', '0');
INSERT INTO `tp_hall_group` VALUES ('2', '5', '单人1群', '', '', '', '1', '200', '1', '', '2', '1499390305', '0');
INSERT INTO `tp_hall_group` VALUES ('3', '6', '双1群', '', '', '', '1', '200', '1', '', '2', '1499392157', '0');
INSERT INTO `tp_hall_group` VALUES ('4', '7', '东方的太阳1群', '', '', '', '1', '200', '1', '', '8', '1499392428', '0');
INSERT INTO `tp_hall_group` VALUES ('5', '8', '家1群', '', '', '', '1', '200', '1', '', '2', '1499393533', '0');
INSERT INTO `tp_hall_group` VALUES ('6', '9', '心上人1群', '', '', '', '1', '200', '1', '', '8', '1499402953', '0');
INSERT INTO `tp_hall_group` VALUES ('7', '10', '许许多多的1群', '', '', '', '1', '200', '1', '', '8', '1499411347', '0');
INSERT INTO `tp_hall_group` VALUES ('8', '11', '吃吃吃付出1群', '', '', '', '1', '200', '1', '', '8', '1499412261', '0');
INSERT INTO `tp_hall_group` VALUES ('9', '12', '的点点滴滴1群', '', '', '', '1', '200', '1', '', '8', '1499412294', '0');
INSERT INTO `tp_hall_group` VALUES ('10', '13', '透明1群', '', '', '', '1', '200', '1', '', '2', '1499419982', '0');
INSERT INTO `tp_hall_group` VALUES ('11', '14', '哦可1群', '', '', '', '1', '200', '1', '', '2', '1499420914', '0');
INSERT INTO `tp_hall_group` VALUES ('12', '15', '的大大方方1群', '', '', '', '1', '200', '1', '', '8', '1499658023', '0');
INSERT INTO `tp_hall_group` VALUES ('13', '16', '让否定的黑体辐射的作用1群', '', '', '', '1', '200', '1', '', '8', '1499658224', '0');
INSERT INTO `tp_hall_group` VALUES ('14', '17', '的东方方法1群', '', '', '', '1', '200', '1', '', '8', '1499658535', '0');
INSERT INTO `tp_hall_group` VALUES ('15', '18', '李哦破1群', '', '', '', '1', '200', '1', '', '2', '1499679879', '0');
INSERT INTO `tp_hall_group` VALUES ('16', '19', 'VC想1群', '', '', '', '1', '200', '1', '21277262807042', '1', '1499689979', '0');
INSERT INTO `tp_hall_group` VALUES ('17', '20', '上海时光1群', '', '', '', '1', '200', '1', '21341851942917', '8', '1499751576', '0');
INSERT INTO `tp_hall_group` VALUES ('18', '21', '人都对的地方1群', '', '', '', '1', '200', '1', '21343758254081', '8', '1499753394', '0');
INSERT INTO `tp_hall_group` VALUES ('19', '22', '林正英1群', '', '', '', '1', '200', '1', '21346091335681', '2', '1499755618', '0');
INSERT INTO `tp_hall_group` VALUES ('20', '23', '放反反复复1群', '', '', '', '1', '200', '1', '21353813049345', '8', '1499762983', '0');
INSERT INTO `tp_hall_group` VALUES ('21', '24', '反反复复1群', '', '', '', '1', '200', '1', '21353851846657', '8', '1499763020', '0');
INSERT INTO `tp_hall_group` VALUES ('22', '25', '天OK哦1群', '', '', '', '1', '200', '1', '21417702785025', '2', '1499823912', '0');
INSERT INTO `tp_hall_group` VALUES ('23', '26', '李四1群', '', '', '', '1', '200', '1', '22143289065473', '1', '1500515876', '0');
INSERT INTO `tp_hall_group` VALUES ('24', '27', '松本秀人21群', '', '', '', '1', '200', '1', '22158926479361', '1', '1500530789', '0');
INSERT INTO `tp_hall_group` VALUES ('25', '28', '测试双人1群', '', '', '', '1', '200', '1', '22161599299585', '1', '1500533338', '0');
INSERT INTO `tp_hall_group` VALUES ('26', '29', '李四家族111群', '231', '222', '333', '1', '200', '1', '22164979908610', '1', '1500536562', '1500605605');

-- ----------------------------
-- Table structure for tp_hall_group_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_group_member`;
CREATE TABLE `tp_hall_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆群主键ID',
  `group_id` int(11) NOT NULL COMMENT '群ID',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `role_type` tinyint(5) NOT NULL DEFAULT '3' COMMENT '群成员角色 1创建者 2管理员 3普通成员',
  `join_at` int(11) NOT NULL COMMENT '入群时间',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆群成员表';

-- ----------------------------
-- Records of tp_hall_group_member
-- ----------------------------
INSERT INTO `tp_hall_group_member` VALUES ('1', '1', '1', '1', '0', '0', '0');
INSERT INTO `tp_hall_group_member` VALUES ('2', '1', '2', '2', '0', '0', '0');
INSERT INTO `tp_hall_group_member` VALUES ('3', '1', '3', '3', '0', '0', '0');
INSERT INTO `tp_hall_group_member` VALUES ('4', '1', '6', '3', '0', '0', '0');
INSERT INTO `tp_hall_group_member` VALUES ('5', '1', '8', '3', '0', '0', '0');
INSERT INTO `tp_hall_group_member` VALUES ('6', '1', '9', '3', '0', '0', '0');
INSERT INTO `tp_hall_group_member` VALUES ('7', '23', '1', '1', '1500515876', '1500515876', '0');
INSERT INTO `tp_hall_group_member` VALUES ('8', '24', '1', '1', '1500530789', '1500530789', '0');
INSERT INTO `tp_hall_group_member` VALUES ('9', '25', '1', '1', '1500533338', '1500533338', '0');
INSERT INTO `tp_hall_group_member` VALUES ('10', '26', '1', '1', '1500536562', '1500536562', '0');

-- ----------------------------
-- Table structure for tp_hall_leave_message
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_leave_message`;
CREATE TABLE `tp_hall_leave_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) NOT NULL COMMENT '纪念馆id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `content` text NOT NULL COMMENT '留言内容',
  `create_at` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_leave_message
-- ----------------------------
INSERT INTO `tp_hall_leave_message` VALUES ('1', '5', '2', '%E5%95%8A%E5%93%88%E5%93%88%E5%93%88%F0%9F%98%81%F0%9F%98%81', '1499407785');

-- ----------------------------
-- Table structure for tp_hall_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_level`;
CREATE TABLE `tp_hall_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆等级主键ID',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '等级',
  `exp` int(10) NOT NULL DEFAULT '0' COMMENT '所需积分',
  `max_exp` int(10) NOT NULL COMMENT '最大积分',
  `range` char(100) NOT NULL COMMENT '积分范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆等级表';

-- ----------------------------
-- Records of tp_hall_level
-- ----------------------------
INSERT INTO `tp_hall_level` VALUES ('1', '0', '0', '26', '0,26');
INSERT INTO `tp_hall_level` VALUES ('2', '1', '27', '39', '27,39');
INSERT INTO `tp_hall_level` VALUES ('3', '2', '40', '61', '40,61');
INSERT INTO `tp_hall_level` VALUES ('4', '3', '62', '95', '62,95');
INSERT INTO `tp_hall_level` VALUES ('5', '4', '96', '144', '96,144');
INSERT INTO `tp_hall_level` VALUES ('6', '5', '145', '211', '145,211');
INSERT INTO `tp_hall_level` VALUES ('7', '6', '212', '299', '212,299');
INSERT INTO `tp_hall_level` VALUES ('8', '7', '300', '411', '300,411');
INSERT INTO `tp_hall_level` VALUES ('9', '8', '412', '550', '412,550');
INSERT INTO `tp_hall_level` VALUES ('10', '9', '551', '719', '551,719');
INSERT INTO `tp_hall_level` VALUES ('11', '10', '720', '921', '720,921');
INSERT INTO `tp_hall_level` VALUES ('12', '11', '922', '1159', '922,1159');
INSERT INTO `tp_hall_level` VALUES ('13', '12', '1160', '1436', '1160,1436');
INSERT INTO `tp_hall_level` VALUES ('14', '13', '1437', '1755', '1437,1755');
INSERT INTO `tp_hall_level` VALUES ('15', '14', '1756', '2119', '1756,2119');
INSERT INTO `tp_hall_level` VALUES ('16', '15', '2120', '2531', '2120,2531');
INSERT INTO `tp_hall_level` VALUES ('17', '16', '2532', '2994', '2532,2994');
INSERT INTO `tp_hall_level` VALUES ('18', '17', '2995', '3511', '2995,3511');
INSERT INTO `tp_hall_level` VALUES ('19', '18', '3512', '4085', '3512,4085');
INSERT INTO `tp_hall_level` VALUES ('20', '19', '4086', '4719', '4086,4719');
INSERT INTO `tp_hall_level` VALUES ('21', '20', '4720', '5416', '4720,5416');
INSERT INTO `tp_hall_level` VALUES ('22', '21', '5417', '6179', '5417,6179');
INSERT INTO `tp_hall_level` VALUES ('23', '22', '6180', '7011', '6180,7011');
INSERT INTO `tp_hall_level` VALUES ('24', '23', '7012', '7915', '7012,7915');
INSERT INTO `tp_hall_level` VALUES ('25', '24', '7916', '8894', '7916,8894');
INSERT INTO `tp_hall_level` VALUES ('26', '25', '8895', '9951', '8895,9951');
INSERT INTO `tp_hall_level` VALUES ('27', '26', '9952', '11089', '9952,11089');
INSERT INTO `tp_hall_level` VALUES ('28', '27', '11090', '12311', '11090,12311');
INSERT INTO `tp_hall_level` VALUES ('29', '28', '12312', '13620', '12312,13620');
INSERT INTO `tp_hall_level` VALUES ('30', '29', '13621', '15019', '13621,15019');
INSERT INTO `tp_hall_level` VALUES ('31', '30', '15020', '16511', '15020,16511');
INSERT INTO `tp_hall_level` VALUES ('32', '31', '16512', '18099', '16512,18099');
INSERT INTO `tp_hall_level` VALUES ('33', '32', '18100', '19786', '18100,19786');
INSERT INTO `tp_hall_level` VALUES ('34', '33', '19787', '21575', '19787,21575');
INSERT INTO `tp_hall_level` VALUES ('35', '34', '21576', '23469', '21576,23469');
INSERT INTO `tp_hall_level` VALUES ('36', '35', '23470', '25471', '23470,25471');
INSERT INTO `tp_hall_level` VALUES ('37', '36', '25472', '27584', '25472,27584');
INSERT INTO `tp_hall_level` VALUES ('38', '37', '27585', '29811', '27585,29811');
INSERT INTO `tp_hall_level` VALUES ('39', '38', '29812', '32155', '29812,32155');
INSERT INTO `tp_hall_level` VALUES ('40', '39', '32156', '34619', '32156,34619');
INSERT INTO `tp_hall_level` VALUES ('41', '40', '34620', '37206', '34620,37206');
INSERT INTO `tp_hall_level` VALUES ('42', '41', '37207', '39919', '37207,39919');
INSERT INTO `tp_hall_level` VALUES ('43', '42', '39920', '42761', '39920,42761');
INSERT INTO `tp_hall_level` VALUES ('44', '43', '42762', '45735', '42762,45735');
INSERT INTO `tp_hall_level` VALUES ('45', '44', '45736', '48844', '45736,48844');
INSERT INTO `tp_hall_level` VALUES ('46', '45', '48845', '52091', '48845,52091');
INSERT INTO `tp_hall_level` VALUES ('47', '46', '52092', '55479', '52092,55479');
INSERT INTO `tp_hall_level` VALUES ('48', '47', '55480', '59011', '55480,59011');
INSERT INTO `tp_hall_level` VALUES ('49', '48', '59012', '62690', '59012,62690');
INSERT INTO `tp_hall_level` VALUES ('50', '49', '62691', '66519', '62691,66519');
INSERT INTO `tp_hall_level` VALUES ('51', '50', '66520', '70501', '66520,70501');
INSERT INTO `tp_hall_level` VALUES ('52', '51', '70502', '74639', '70502,74639');
INSERT INTO `tp_hall_level` VALUES ('53', '52', '74640', '78936', '74640,78936');
INSERT INTO `tp_hall_level` VALUES ('54', '53', '78937', '83395', '78937,83395');
INSERT INTO `tp_hall_level` VALUES ('55', '54', '83396', '88019', '83396,88019');
INSERT INTO `tp_hall_level` VALUES ('56', '55', '88020', '92811', '88020,92811');
INSERT INTO `tp_hall_level` VALUES ('57', '56', '92812', '97774', '92812,97774');
INSERT INTO `tp_hall_level` VALUES ('58', '57', '97775', '102911', '97775,102911');
INSERT INTO `tp_hall_level` VALUES ('59', '58', '102912', '108225', '102912,108225');
INSERT INTO `tp_hall_level` VALUES ('60', '59', '108226', '113719', '108226,113719');
INSERT INTO `tp_hall_level` VALUES ('61', '60', '113720', '119396', '113720,119396');
INSERT INTO `tp_hall_level` VALUES ('62', '61', '119397', '125259', '119397,125259');
INSERT INTO `tp_hall_level` VALUES ('63', '62', '125260', '131311', '125260,131311');
INSERT INTO `tp_hall_level` VALUES ('64', '63', '131312', '137555', '131312,137555');
INSERT INTO `tp_hall_level` VALUES ('65', '64', '137556', '143994', '137556,143994');
INSERT INTO `tp_hall_level` VALUES ('66', '65', '143995', '150631', '143995,150631');
INSERT INTO `tp_hall_level` VALUES ('67', '66', '150632', '157469', '150632,157469');
INSERT INTO `tp_hall_level` VALUES ('68', '67', '157470', '164511', '157470,164511');
INSERT INTO `tp_hall_level` VALUES ('69', '68', '164512', '171760', '164512,171760');
INSERT INTO `tp_hall_level` VALUES ('70', '69', '171761', '179219', '171761,179219');
INSERT INTO `tp_hall_level` VALUES ('71', '70', '179220', '186891', '179220,186891');
INSERT INTO `tp_hall_level` VALUES ('72', '71', '186892', '194779', '186892,194779');
INSERT INTO `tp_hall_level` VALUES ('73', '72', '194780', '202886', '194780,202886');
INSERT INTO `tp_hall_level` VALUES ('74', '73', '202887', '211215', '202887,211215');
INSERT INTO `tp_hall_level` VALUES ('75', '74', '211216', '219769', '211216,219769');
INSERT INTO `tp_hall_level` VALUES ('76', '75', '219770', '228551', '219770,228551');
INSERT INTO `tp_hall_level` VALUES ('77', '76', '228552', '237564', '228552,237564');
INSERT INTO `tp_hall_level` VALUES ('78', '77', '237565', '246811', '237565,246811');
INSERT INTO `tp_hall_level` VALUES ('79', '78', '246812', '256295', '246812,256295');
INSERT INTO `tp_hall_level` VALUES ('80', '79', '256296', '266019', '256296,266019');
INSERT INTO `tp_hall_level` VALUES ('81', '80', '266020', '275986', '266020,275986');
INSERT INTO `tp_hall_level` VALUES ('82', '81', '275987', '286199', '275987,286199');
INSERT INTO `tp_hall_level` VALUES ('83', '82', '286200', '296661', '286200,296661');
INSERT INTO `tp_hall_level` VALUES ('84', '83', '296662', '307375', '296662,307375');
INSERT INTO `tp_hall_level` VALUES ('85', '84', '307376', '318344', '307376,318344');
INSERT INTO `tp_hall_level` VALUES ('86', '85', '318345', '329571', '318345,329571');
INSERT INTO `tp_hall_level` VALUES ('87', '86', '329572', '341059', '329572,341059');
INSERT INTO `tp_hall_level` VALUES ('88', '87', '341060', '352811', '341060,352811');
INSERT INTO `tp_hall_level` VALUES ('89', '88', '352812', '364830', '352812,364830');
INSERT INTO `tp_hall_level` VALUES ('90', '89', '364831', '377119', '364831,377119');
INSERT INTO `tp_hall_level` VALUES ('91', '90', '377120', '389681', '377120,389681');
INSERT INTO `tp_hall_level` VALUES ('92', '91', '389682', '402519', '389682,402519');
INSERT INTO `tp_hall_level` VALUES ('93', '92', '402520', '415636', '402520,415636');
INSERT INTO `tp_hall_level` VALUES ('94', '93', '415637', '429035', '415637,429035');
INSERT INTO `tp_hall_level` VALUES ('95', '94', '429036', '442719', '429036,442719');
INSERT INTO `tp_hall_level` VALUES ('96', '95', '442720', '456691', '442720,456691');
INSERT INTO `tp_hall_level` VALUES ('97', '96', '456692', '470954', '456692,470954');
INSERT INTO `tp_hall_level` VALUES ('98', '97', '470955', '485511', '470955,485511');
INSERT INTO `tp_hall_level` VALUES ('99', '98', '485512', '500365', '485512,500365');
INSERT INTO `tp_hall_level` VALUES ('100', '99', '500366', '515519', '500366,515519');
INSERT INTO `tp_hall_level` VALUES ('101', '100', '515520', '530976', '515520,530976');
INSERT INTO `tp_hall_level` VALUES ('102', '101', '530977', '546739', '530977,546739');
INSERT INTO `tp_hall_level` VALUES ('103', '102', '546740', '562811', '546740,562811');
INSERT INTO `tp_hall_level` VALUES ('104', '103', '562812', '579195', '562812,579195');
INSERT INTO `tp_hall_level` VALUES ('105', '104', '579196', '595894', '579196,595894');
INSERT INTO `tp_hall_level` VALUES ('106', '105', '595895', '612911', '595895,612911');
INSERT INTO `tp_hall_level` VALUES ('107', '106', '612912', '630249', '612912,630249');
INSERT INTO `tp_hall_level` VALUES ('108', '107', '630250', '647911', '630250,647911');
INSERT INTO `tp_hall_level` VALUES ('109', '108', '647912', '665900', '647912,665900');
INSERT INTO `tp_hall_level` VALUES ('110', '109', '665901', '684219', '665901,684219');
INSERT INTO `tp_hall_level` VALUES ('111', '110', '684220', '702871', '684220,702871');
INSERT INTO `tp_hall_level` VALUES ('112', '111', '702872', '721859', '702872,721859');
INSERT INTO `tp_hall_level` VALUES ('113', '112', '721860', '741186', '721860,741186');
INSERT INTO `tp_hall_level` VALUES ('114', '113', '741187', '760855', '741187,760855');
INSERT INTO `tp_hall_level` VALUES ('115', '114', '760856', '780869', '760856,780869');
INSERT INTO `tp_hall_level` VALUES ('116', '115', '780870', '801231', '780870,801231');
INSERT INTO `tp_hall_level` VALUES ('117', '116', '801232', '821944', '801232,821944');
INSERT INTO `tp_hall_level` VALUES ('118', '117', '821945', '843011', '821945,843011');
INSERT INTO `tp_hall_level` VALUES ('119', '118', '843012', '864435', '843012,864435');
INSERT INTO `tp_hall_level` VALUES ('120', '119', '864436', '886219', '864436,886219');
INSERT INTO `tp_hall_level` VALUES ('121', '120', '886220', '908366', '886220,908366');
INSERT INTO `tp_hall_level` VALUES ('122', '121', '908367', '930879', '908367,930879');
INSERT INTO `tp_hall_level` VALUES ('123', '122', '930880', '953761', '930880,953761');
INSERT INTO `tp_hall_level` VALUES ('124', '123', '953762', '977015', '953762,977015');
INSERT INTO `tp_hall_level` VALUES ('125', '124', '977016', '1000644', '977016,1000644');
INSERT INTO `tp_hall_level` VALUES ('126', '125', '1000645', '1024651', '1000645,1024651');
INSERT INTO `tp_hall_level` VALUES ('127', '126', '1024652', '1049039', '1024652,1049039');
INSERT INTO `tp_hall_level` VALUES ('128', '127', '1049040', '1073811', '1049040,1073811');
INSERT INTO `tp_hall_level` VALUES ('129', '128', '1073812', '1098970', '1073812,1098970');
INSERT INTO `tp_hall_level` VALUES ('130', '129', '1098971', '1124519', '1098971,1124519');
INSERT INTO `tp_hall_level` VALUES ('131', '130', '1124520', '1150461', '1124520,1150461');
INSERT INTO `tp_hall_level` VALUES ('132', '131', '1150462', '1176799', '1150462,1176799');
INSERT INTO `tp_hall_level` VALUES ('133', '132', '1176800', '1203536', '1176800,1203536');
INSERT INTO `tp_hall_level` VALUES ('134', '133', '1203537', '1230675', '1203537,1230675');
INSERT INTO `tp_hall_level` VALUES ('135', '134', '1230676', '1258219', '1230676,1258219');
INSERT INTO `tp_hall_level` VALUES ('136', '135', '1258220', '1286171', '1258220,1286171');
INSERT INTO `tp_hall_level` VALUES ('137', '136', '1286172', '1314534', '1286172,1314534');
INSERT INTO `tp_hall_level` VALUES ('138', '137', '1314535', '1343311', '1314535,1343311');
INSERT INTO `tp_hall_level` VALUES ('139', '138', '1343312', '1372505', '1343312,1372505');
INSERT INTO `tp_hall_level` VALUES ('140', '139', '1372506', '1402119', '1372506,1402119');
INSERT INTO `tp_hall_level` VALUES ('141', '140', '1402120', '1432156', '1402120,1432156');
INSERT INTO `tp_hall_level` VALUES ('142', '141', '1432157', '1462619', '1432157,1462619');
INSERT INTO `tp_hall_level` VALUES ('143', '142', '1462620', '1493511', '1462620,1493511');
INSERT INTO `tp_hall_level` VALUES ('144', '143', '1493512', '1524835', '1493512,1524835');
INSERT INTO `tp_hall_level` VALUES ('145', '144', '1524836', '1556594', '1524836,1556594');
INSERT INTO `tp_hall_level` VALUES ('146', '145', '1556595', '1588791', '1556595,1588791');
INSERT INTO `tp_hall_level` VALUES ('147', '146', '1588792', '1621429', '1588792,1621429');
INSERT INTO `tp_hall_level` VALUES ('148', '147', '1621430', '1654511', '1621430,1654511');
INSERT INTO `tp_hall_level` VALUES ('149', '148', '1654512', '1688040', '1654512,1688040');
INSERT INTO `tp_hall_level` VALUES ('150', '149', '1688041', '1722019', '1688041,1722019');
INSERT INTO `tp_hall_level` VALUES ('151', '150', '1722020', '1756451', '1722020,1756451');
INSERT INTO `tp_hall_level` VALUES ('152', '151', '1756452', '1791339', '1756452,1791339');
INSERT INTO `tp_hall_level` VALUES ('153', '152', '1791340', '1826686', '1791340,1826686');
INSERT INTO `tp_hall_level` VALUES ('154', '153', '1826687', '1862495', '1826687,1862495');
INSERT INTO `tp_hall_level` VALUES ('155', '154', '1862496', '1898769', '1862496,1898769');
INSERT INTO `tp_hall_level` VALUES ('156', '155', '1898770', '1935511', '1898770,1935511');
INSERT INTO `tp_hall_level` VALUES ('157', '156', '1935512', '1972724', '1935512,1972724');
INSERT INTO `tp_hall_level` VALUES ('158', '157', '1972725', '2010411', '1972725,2010411');
INSERT INTO `tp_hall_level` VALUES ('159', '158', '2010412', '2048575', '2010412,2048575');
INSERT INTO `tp_hall_level` VALUES ('160', '159', '2048576', '2087219', '2048576,2087219');
INSERT INTO `tp_hall_level` VALUES ('161', '160', '2087220', '2126346', '2087220,2126346');
INSERT INTO `tp_hall_level` VALUES ('162', '161', '2126347', '2165959', '2126347,2165959');
INSERT INTO `tp_hall_level` VALUES ('163', '162', '2165960', '2206061', '2165960,2206061');
INSERT INTO `tp_hall_level` VALUES ('164', '163', '2206062', '2246655', '2206062,2246655');
INSERT INTO `tp_hall_level` VALUES ('165', '164', '2246656', '2287744', '2246656,2287744');
INSERT INTO `tp_hall_level` VALUES ('166', '165', '2287745', '2329331', '2287745,2329331');
INSERT INTO `tp_hall_level` VALUES ('167', '166', '2329332', '2371419', '2329332,2371419');
INSERT INTO `tp_hall_level` VALUES ('168', '167', '2371420', '2414011', '2371420,2414011');
INSERT INTO `tp_hall_level` VALUES ('169', '168', '2414012', '2457110', '2414012,2457110');
INSERT INTO `tp_hall_level` VALUES ('170', '169', '2457111', '2500719', '2457111,2500719');
INSERT INTO `tp_hall_level` VALUES ('171', '170', '2500720', '2544841', '2500720,2544841');
INSERT INTO `tp_hall_level` VALUES ('172', '171', '2544842', '2589479', '2544842,2589479');
INSERT INTO `tp_hall_level` VALUES ('173', '172', '2589480', '2634636', '2589480,2634636');
INSERT INTO `tp_hall_level` VALUES ('174', '173', '2634637', '2680315', '2634637,2680315');
INSERT INTO `tp_hall_level` VALUES ('175', '174', '2680316', '2726519', '2680316,2726519');
INSERT INTO `tp_hall_level` VALUES ('176', '175', '2726520', '2773251', '2726520,2773251');
INSERT INTO `tp_hall_level` VALUES ('177', '176', '2773252', '2820514', '2773252,2820514');
INSERT INTO `tp_hall_level` VALUES ('178', '177', '2820515', '2868311', '2820515,2868311');
INSERT INTO `tp_hall_level` VALUES ('179', '178', '2868312', '2916645', '2868312,2916645');
INSERT INTO `tp_hall_level` VALUES ('180', '179', '2916646', '2965519', '2916646,2965519');
INSERT INTO `tp_hall_level` VALUES ('181', '180', '2965520', '3014936', '2965520,3014936');
INSERT INTO `tp_hall_level` VALUES ('182', '181', '3014937', '3064899', '3014937,3064899');
INSERT INTO `tp_hall_level` VALUES ('183', '182', '3064900', '3115411', '3064900,3115411');
INSERT INTO `tp_hall_level` VALUES ('184', '183', '3115412', '3166475', '3115412,3166475');
INSERT INTO `tp_hall_level` VALUES ('185', '184', '3166476', '3218094', '3166476,3218094');
INSERT INTO `tp_hall_level` VALUES ('186', '185', '3218095', '3270271', '3218095,3270271');
INSERT INTO `tp_hall_level` VALUES ('187', '186', '3270272', '3323009', '3270272,3323009');
INSERT INTO `tp_hall_level` VALUES ('188', '187', '3323010', '3376311', '3323010,3376311');
INSERT INTO `tp_hall_level` VALUES ('189', '188', '3376312', '3430180', '3376312,3430180');
INSERT INTO `tp_hall_level` VALUES ('190', '189', '3430181', '3484619', '3430181,3484619');
INSERT INTO `tp_hall_level` VALUES ('191', '190', '3484620', '3539631', '3484620,3539631');
INSERT INTO `tp_hall_level` VALUES ('192', '191', '3539632', '3595219', '3539632,3595219');
INSERT INTO `tp_hall_level` VALUES ('193', '192', '3595220', '3651386', '3595220,3651386');
INSERT INTO `tp_hall_level` VALUES ('194', '193', '3651387', '3708135', '3651387,3708135');
INSERT INTO `tp_hall_level` VALUES ('195', '194', '3708136', '3765469', '3708136,3765469');
INSERT INTO `tp_hall_level` VALUES ('196', '195', '3765470', '3823391', '3765470,3823391');
INSERT INTO `tp_hall_level` VALUES ('197', '196', '3823392', '3881904', '3823392,3881904');
INSERT INTO `tp_hall_level` VALUES ('198', '197', '3881905', '3941011', '3881905,3941011');
INSERT INTO `tp_hall_level` VALUES ('199', '198', '3941012', '4000715', '3941012,4000715');
INSERT INTO `tp_hall_level` VALUES ('200', '199', '4000716', '4061019', '4000716,4061019');
INSERT INTO `tp_hall_level` VALUES ('201', '200', '4061020', '4121926', '4061020,4121926');

-- ----------------------------
-- Table structure for tp_hall_lingpai_style
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_lingpai_style`;
CREATE TABLE `tp_hall_lingpai_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆大厅风格表主键ID',
  `style_name` varchar(30) NOT NULL COMMENT '风格名称',
  `style_img` varchar(255) NOT NULL COMMENT '灵牌风格小图',
  `style_big_img` varchar(255) NOT NULL COMMENT '灵牌风格大图',
  `style_num` int(11) NOT NULL DEFAULT '0' COMMENT '使用人数',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=启用 2=禁用',
  `create_at` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆灵牌风格表';

-- ----------------------------
-- Records of tp_hall_lingpai_style
-- ----------------------------
INSERT INTO `tp_hall_lingpai_style` VALUES ('2', '灵牌', '/static/upload/picture/20170718/2f35a0db8a94885a0e8b19b21cae4ad4.jpg', '/static/upload/picture/20170718/1f5fd4aaa1c89be7b5a21986b46fb2f7.jpg', '0', '50', '1', '1499656321');

-- ----------------------------
-- Table structure for tp_hall_music
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_music`;
CREATE TABLE `tp_hall_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆音乐',
  `music_name` varchar(50) NOT NULL COMMENT '纪念馆音乐',
  `music_url` varchar(255) NOT NULL,
  `music_type` int(1) NOT NULL DEFAULT '1' COMMENT '1=推荐乐曲2=佛教音乐3=西方宗教',
  `music_status` int(1) NOT NULL DEFAULT '1' COMMENT '1=显示2=隐藏',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_music
-- ----------------------------
INSERT INTO `tp_hall_music` VALUES ('1', '赵雷 - 成都', '/static/upload/music/20170705/5d4046b92782cb907d742d8eb83017d6.mp3', '3', '1', '1499240915');
INSERT INTO `tp_hall_music` VALUES ('2', '安雯 - 月满西楼', '/static/upload/music/20170711/55a10313e10d91d79aaa5f58a24f5ab0.mp3', '1', '1', '1499755390');
INSERT INTO `tp_hall_music` VALUES ('3', 'Fly Project - Toca Toca', '/static/upload/music/20170711/cc194aa3d8c380d6569479136e99cb36.mp3', '3', '1', '1499755430');
INSERT INTO `tp_hall_music` VALUES ('4', 'Shahrukh Khan - 女友嫁人了.新郎不是我', '/static/upload/music/20170711/a77e7b80c155118e2a15c88115ddbc5f.mp3', '2', '1', '1499755467');

-- ----------------------------
-- Table structure for tp_hall_one
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_one`;
CREATE TABLE `tp_hall_one` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '个人纪念馆',
  `hall_id` int(11) NOT NULL COMMENT '馆ID',
  `one_img` varchar(255) DEFAULT NULL COMMENT '逝者照片',
  `one_name` varchar(50) NOT NULL COMMENT '逝者名称',
  `one_sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别 1=保密 2=男 3=女',
  `one_ethnic` int(3) DEFAULT NULL COMMENT '名族',
  `one_birthday` int(11) NOT NULL DEFAULT '0' COMMENT '出生日期',
  `one_death` int(11) NOT NULL DEFAULT '0' COMMENT '逝世日期',
  `one_relation` varchar(30) DEFAULT NULL COMMENT '纪念关系',
  `one_rest_address` varchar(100) DEFAULT NULL COMMENT '安息地址',
  `one_epitaph` varchar(255) NOT NULL COMMENT '墓志铭',
  `one_lingpai_style` int(11) DEFAULT NULL COMMENT '灵牌样式',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_one
-- ----------------------------
INSERT INTO `tp_hall_one` VALUES ('8', '13', '/static/upload/picture/20170711/42647b4ae508cd2022ef46dc1a88555c.jpg', '乔任梁', '2', '1', '1499011200', '1499097600', '纪念伯母', '上海', '粉色kimi', '2', '1499419982', '1500001809');
INSERT INTO `tp_hall_one` VALUES ('10', '15', '/static/upload/picture/20170711/61863be635621c54b7545d9ca052c2b5.jpg', '松本秀人', '3', '1', '-28800', '-28800', '纪念姐妹', '北京', '摇滚不死，松本秀人。XJapan We are X！', '2', '1499658022', '1500009439');
INSERT INTO `tp_hall_one` VALUES ('13', '20', '/static/upload/picture/20170711/dfa39f494e70464bc3a3d5e3aecc1f79.jpg', '上海时光', '1', '17', '0', '0', '纪念姐妹', '不得不对不对吧', '不得不对不对吧对', '2', '1499751576', '0');
INSERT INTO `tp_hall_one` VALUES ('14', '21', '/static/upload/picture/20170711/9533872f6a45fe4831f342f77f6aee2b.jpg', '人都对的地方', '1', '7', '0', '0', '纪念兄弟', '你是个什么都没有关系', '反反复复', '2', '1499753393', '1499763427');
INSERT INTO `tp_hall_one` VALUES ('15', '22', '/static/upload/picture/20170711/153757c760882048907f3afa3501137c.jpg', '林正英', '2', '1', '0', '0', '纪念老师', '未知', '三径寒松薄云天，卓越追求写人生', '2', '1499755618', '1499821544');
INSERT INTO `tp_hall_one` VALUES ('16', '25', '', '天OK哦', '1', '29', '0', '0', '纪念同事', '诺', '头发', '2', '1499823912', '1499921289');
INSERT INTO `tp_hall_one` VALUES ('17', '26', '/static/upload/picture/20170720/92093c5b5bd94ac8a1e4614923bb080a.jpg', '李四', '1', '1', '1500480000', '1564156800', '纪念妻子', '上海', '摇滚不死，松本秀人。XJapan We are X！', '2', '1500515875', '1500713437');
INSERT INTO `tp_hall_one` VALUES ('18', '27', '/static/upload/picture/20170720/a72e4513ac2f532ac135e74e8d11bf67.jpg', '松本秀人2', '2', '1', '-28800', '-28800', '纪念外公', '香港', '摇滚不死，松本秀人。XJapan We are X！', '2', '1500530788', '1500713288');

-- ----------------------------
-- Table structure for tp_hall_photo
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_photo`;
CREATE TABLE `tp_hall_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册表',
  `hall_id` int(11) NOT NULL COMMENT '馆ID',
  `photo_name` varchar(50) NOT NULL COMMENT '相册名称',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1=启用2=禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_photo
-- ----------------------------
INSERT INTO `tp_hall_photo` VALUES ('1', '6', '哈哈', '1499414008', '1');
INSERT INTO `tp_hall_photo` VALUES ('2', '15', '地方出差 vv and my', '1499674845', '1');
INSERT INTO `tp_hall_photo` VALUES ('3', '16', '福福福福岛第一名处女座', '1499676894', '1');

-- ----------------------------
-- Table structure for tp_hall_photo_picture
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_photo_picture`;
CREATE TABLE `tp_hall_photo_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_picture_url` varchar(255) NOT NULL COMMENT '照片路径',
  `photo_id` int(11) NOT NULL COMMENT '相册id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_photo_picture
-- ----------------------------
INSERT INTO `tp_hall_photo_picture` VALUES ('7', 'http://j.sumali.cn/static/upload/picture/20170710/529d2681e7e8f0b8c2a79992959ea0c9.jpg', '2');
INSERT INTO `tp_hall_photo_picture` VALUES ('2', '/static/upload/picture/20170707/5cbc63f53a48c033d565fb4f8f499ce1.jpg', '1');
INSERT INTO `tp_hall_photo_picture` VALUES ('3', '/static/upload/picture/20170707/b95a59b244e0b3405848609a3803c56b.jpg', '1');
INSERT INTO `tp_hall_photo_picture` VALUES ('4', '/static/upload/picture/20170707/a767818e04b3247d030524740ee6b60e.jpg', '1');
INSERT INTO `tp_hall_photo_picture` VALUES ('6', '/static/upload/picture/20170710/d60740879755cd098e218c9a9130f70e.jpg', '1');
INSERT INTO `tp_hall_photo_picture` VALUES ('8', 'http://j.sumali.cn/static/upload/picture/20170710/dfcf71762527bd48b7da87f15997260d.jpg', '2');
INSERT INTO `tp_hall_photo_picture` VALUES ('9', 'http://j.sumali.cn/static/upload/picture/20170710/92ec44192fe6c7198f63ec87d2e9bd3f.jpg', '2');
INSERT INTO `tp_hall_photo_picture` VALUES ('11', 'http://j.sumali.cn/static/upload/picture/20170710/dde69d59acc743f483c7968e2424824a.jpg', '3');
INSERT INTO `tp_hall_photo_picture` VALUES ('12', 'http://j.sumali.cn/static/upload/picture/20170710/9547d3044d46c932e161306791641c8b.jpg', '3');
INSERT INTO `tp_hall_photo_picture` VALUES ('14', '/static/upload/picture/20170711/3517656aa51b90c6d5dae0edf6d5b366.jpg', '3');

-- ----------------------------
-- Table structure for tp_hall_style
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_style`;
CREATE TABLE `tp_hall_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆风格表主键ID',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '风格分类ID',
  `style_name` varchar(30) NOT NULL COMMENT '风格名称',
  `style_img` varchar(255) NOT NULL COMMENT 'App端 风格图片',
  `style_num` int(11) NOT NULL DEFAULT '0' COMMENT '使用人数',
  `style_position` tinyint(2) NOT NULL DEFAULT '1' COMMENT '风格图片位置 1中间 2右下角',
  `skin_dir` varchar(100) NOT NULL COMMENT '皮肤目录 通常为数字',
  `skin_type` char(30) NOT NULL DEFAULT 'putong' COMMENT '皮肤类型 默认“putong” "putong"普通馆 “gexing”高级馆',
  `skin_hall_type` char(30) NOT NULL DEFAULT 'guan' COMMENT '纪念馆皮肤类型 默认“guan” "guan"单人馆、"yuan"多人馆',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=启用 2=禁用',
  `create_at` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆风格表';

-- ----------------------------
-- Records of tp_hall_style
-- ----------------------------
INSERT INTO `tp_hall_style` VALUES ('1', '55', '蝶恋花', '', '7', '1', '1', 'putong', 'guan', '50', '1', '1499658374');
INSERT INTO `tp_hall_style` VALUES ('2', '99', '天堂的乐园', '', '11', '1', '2', 'putong', 'guan', '50', '1', '1499658430');
INSERT INTO `tp_hall_style` VALUES ('3', '44', '生如夏花', '/static/upload/picture/20170711/93fc38bd79839f16050492a1bc098213.png', '11', '1', '3', 'putong', 'guan', '50', '1', '1499658466');
INSERT INTO `tp_hall_style` VALUES ('4', '10', '永恒园', '/static/upload/picture/20170711/443587cb83204b83c07ecf4fefa46007.png', '0', '1', '11', 'putong', 'yuan', '50', '1', '1499658522');
INSERT INTO `tp_hall_style` VALUES ('5', '10', '思念园', '/static/upload/picture/20170711/f57a7d7ce25d83abb8b59123382689a1.png', '3', '1', '2', 'putong', 'yuan', '50', '1', '1499658555');
INSERT INTO `tp_hall_style` VALUES ('6', '11', '孝德园', '/static/upload/picture/20170711/30e968ac105b3add9d8f6e5c8e881246.png', '0', '1', '3', 'putong', 'yuan', '50', '1', '1499658595');
INSERT INTO `tp_hall_style` VALUES ('7', '10', '岁月如歌', '/static/upload/picture/20170711/30e968ac105b3add9d8f6e5c8e881246.png', '1', '1', '4', 'putong', 'yuan', '50', '1', '1499658632');
INSERT INTO `tp_hall_style` VALUES ('8', '11', '世代园', '/static/upload/picture/20170711/5aa714ebdacba2042d42fa9e63e7efc9.png', '0', '1', '5', 'putong', 'yuan', '50', '1', '1499658663');
INSERT INTO `tp_hall_style` VALUES ('9', '11', '佛心园', '/static/upload/picture/20170711/a676b029bad17645b4b9e524574a9101.png', '0', '1', '6', 'putong', 'yuan', '50', '1', '1499660996');

-- ----------------------------
-- Table structure for tp_hall_style_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_style_category`;
CREATE TABLE `tp_hall_style_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类索引id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类父id 0 顶级分类',
  `title` char(30) NOT NULL COMMENT '分类标识',
  `name` char(30) NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态 0 禁用 1普通 2高级',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='andy - 文章分类表';

-- ----------------------------
-- Records of tp_hall_style_category
-- ----------------------------
INSERT INTO `tp_hall_style_category` VALUES ('1', '0', 'guan', '个人馆', '0', '1', '1499568240');
INSERT INTO `tp_hall_style_category` VALUES ('2', '0', 'yuan', '双人馆', '0', '1', '1499568257');
INSERT INTO `tp_hall_style_category` VALUES ('3', '0', 'yuan', '家族馆', '0', '1', '1499568268');
INSERT INTO `tp_hall_style_category` VALUES ('4', '0', 'yuan', '事件馆', '0', '2', '1499652380');
INSERT INTO `tp_hall_style_category` VALUES ('5', '0', 'yuan', '主题馆', '0', '2', '1499652391');
INSERT INTO `tp_hall_style_category` VALUES ('6', '0', 'guan', '名人馆', '0', '2', '1499652400');
INSERT INTO `tp_hall_style_category` VALUES ('10', '2', '', '默认', '0', '1', '1499648839');
INSERT INTO `tp_hall_style_category` VALUES ('11', '3', '', '默认', '0', '1', '1499648848');
INSERT INTO `tp_hall_style_category` VALUES ('13', '4', '', '默认', '0', '2', '1499652475');
INSERT INTO `tp_hall_style_category` VALUES ('14', '5', '', '默认', '0', '2', '1499652483');
INSERT INTO `tp_hall_style_category` VALUES ('15', '6', '', '默认', '0', '2', '1499652493');
INSERT INTO `tp_hall_style_category` VALUES ('44', '1', '', '怀旧风', '0', '1', '1499568290');
INSERT INTO `tp_hall_style_category` VALUES ('55', '1', '', '文艺风', '0', '1', '1499568301');
INSERT INTO `tp_hall_style_category` VALUES ('66', '1', '', '浪漫风', '0', '1', '1499568342');
INSERT INTO `tp_hall_style_category` VALUES ('77', '1', '', '现代风', '0', '1', '1499568351');
INSERT INTO `tp_hall_style_category` VALUES ('88', '1', '', '宗教风', '0', '1', '1499568360');
INSERT INTO `tp_hall_style_category` VALUES ('99', '1', '', '动漫风', '0', '1', '1499568370');

-- ----------------------------
-- Table structure for tp_hall_style_copy
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_style_copy`;
CREATE TABLE `tp_hall_style_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '风格表主键ID',
  `style_name` varchar(30) NOT NULL COMMENT '风格名称',
  `style_img` varchar(255) NOT NULL COMMENT '风格缩略图',
  `style_big_img` varchar(255) DEFAULT NULL COMMENT '纪念馆大图风格',
  `style_identifying` varchar(30) NOT NULL COMMENT '风格标识',
  `style_type` int(1) NOT NULL COMMENT '类型 1纪念馆风格 2祭拜大厅风格 3灵牌样式',
  `style_label` int(1) NOT NULL COMMENT '所属标签 1=怀旧2=文艺3=浪漫4=现代',
  `style_hall` int(1) NOT NULL DEFAULT '1' COMMENT '应用场馆  1=单人馆 2=双人馆 3=家族馆 4=灵牌',
  `skin_dir` varchar(100) NOT NULL COMMENT '皮肤目录 通常为数字',
  `skin_type` char(30) NOT NULL DEFAULT 'putong' COMMENT '皮肤类型 默认“putong” "putong"普通馆 “gexing”高级馆',
  `skin_hall_type` char(30) NOT NULL DEFAULT 'single' COMMENT '纪念馆皮肤类型 默认“single” "single"单人馆、"yuan"多人馆',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=启用 2=禁用',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `style_num` int(11) NOT NULL COMMENT '使用人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_style_copy
-- ----------------------------

-- ----------------------------
-- Table structure for tp_hall_surnames
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_surnames`;
CREATE TABLE `tp_hall_surnames` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '百家姓表主键ID',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '姓氏类型 1单姓（常用） 2复姓',
  `name` varchar(50) NOT NULL COMMENT '姓氏名称',
  `sort` int(10) NOT NULL DEFAULT '50' COMMENT '排序',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_surnames
-- ----------------------------
INSERT INTO `tp_hall_surnames` VALUES ('1', '1', '赵', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('2', '1', '钱', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('3', '1', '孙', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('4', '1', '李', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('5', '1', '周', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('6', '1', '吴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('7', '1', '郑', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('8', '1', '王', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('9', '1', '冯', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('10', '1', '陈', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('11', '1', '楮', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('12', '1', '卫', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('13', '1', '蒋', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('14', '1', '沈', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('15', '1', '韩', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('16', '1', '杨', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('17', '1', '朱', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('18', '1', '秦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('19', '1', '尤', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('20', '1', '许', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('21', '1', '何', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('22', '1', '吕', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('23', '1', '施', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('24', '1', '张', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('25', '1', '孔', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('26', '1', '曹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('27', '1', '严', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('28', '1', '华', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('29', '1', '金', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('30', '1', '魏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('31', '1', '陶', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('32', '1', '姜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('33', '1', '戚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('34', '1', '谢', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('35', '1', '邹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('36', '1', '喻', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('37', '1', '柏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('38', '1', '水', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('39', '1', '窦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('40', '1', '章', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('41', '1', '云', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('42', '1', '苏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('43', '1', '潘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('44', '1', '葛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('45', '1', '奚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('46', '1', '范', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('47', '1', '彭', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('48', '1', '郎', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('49', '1', '鲁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('50', '1', '韦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('51', '1', '昌', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('52', '1', '马', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('53', '1', '苗', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('54', '1', '凤', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('55', '1', '花', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('56', '1', '方', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('57', '1', '俞', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('58', '1', '任', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('59', '1', '袁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('60', '1', '柳', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('61', '1', '酆', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('62', '1', '鲍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('63', '1', '史', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('64', '1', '唐', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('65', '1', '费', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('66', '1', '廉', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('67', '1', '岑', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('68', '1', '薛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('69', '1', '雷', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('70', '1', '贺', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('71', '1', '倪', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('72', '1', '汤', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('73', '1', '滕', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('74', '1', '殷', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('75', '1', '罗', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('76', '1', '毕', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('77', '1', '郝', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('78', '1', '邬', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('79', '1', '安', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('80', '1', '常', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('81', '1', '乐', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('82', '1', '于', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('83', '1', '时', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('84', '1', '傅', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('85', '1', '皮', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('86', '1', '卞', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('87', '1', '齐', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('88', '1', '康', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('89', '1', '伍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('90', '1', '余', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('91', '1', '元', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('92', '1', '卜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('93', '1', '顾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('94', '1', '孟', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('95', '1', '平', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('96', '1', '黄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('97', '1', '和', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('98', '1', '穆', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('99', '1', '萧', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('100', '1', '尹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('101', '1', '姚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('102', '1', '邵', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('103', '1', '湛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('104', '1', '汪', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('105', '1', '祁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('106', '1', '毛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('107', '1', '禹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('108', '1', '狄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('109', '1', '米', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('110', '1', '贝', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('111', '1', '明', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('112', '1', '臧', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('113', '1', '计', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('114', '1', '伏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('115', '1', '成', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('116', '1', '戴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('117', '1', '谈', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('118', '1', '宋', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('119', '1', '茅', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('120', '1', '庞', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('121', '1', '熊', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('122', '1', '纪', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('123', '1', '舒', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('124', '1', '屈', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('125', '1', '项', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('126', '1', '祝', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('127', '1', '董', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('128', '1', '梁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('129', '1', '杜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('130', '1', '阮', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('131', '1', '蓝', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('132', '1', '闽', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('133', '1', '席', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('134', '1', '季', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('135', '1', '麻', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('136', '1', '强', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('137', '1', '贾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('138', '1', '路', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('139', '1', '娄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('140', '1', '危', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('141', '1', '江', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('142', '1', '童', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('143', '1', '颜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('144', '1', '郭', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('145', '1', '梅', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('146', '1', '盛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('147', '1', '林', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('148', '1', '刁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('149', '1', '锺', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('150', '1', '徐', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('151', '1', '丘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('152', '1', '骆', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('153', '1', '高', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('154', '1', '夏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('155', '1', '蔡', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('156', '1', '田', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('157', '1', '樊', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('158', '1', '胡', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('159', '1', '凌', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('160', '1', '霍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('161', '1', '虞', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('162', '1', '万', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('163', '1', '支', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('164', '1', '柯', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('165', '1', '昝', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('166', '1', '管', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('167', '1', '卢', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('168', '1', '莫', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('169', '1', '经', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('170', '1', '房', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('171', '1', '裘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('172', '1', '缪', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('173', '1', '干', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('174', '1', '解', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('175', '1', '应', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('176', '1', '宗', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('177', '1', '丁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('178', '1', '宣', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('179', '1', '贲', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('180', '1', '邓', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('181', '1', '郁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('182', '1', '单', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('183', '1', '杭', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('184', '1', '洪', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('185', '1', '包', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('186', '1', '诸', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('187', '1', '左', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('188', '1', '石', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('189', '1', '崔', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('190', '1', '吉', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('191', '1', '钮', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('192', '1', '龚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('193', '1', '程', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('194', '1', '嵇', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('195', '1', '邢', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('196', '1', '滑', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('197', '1', '裴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('198', '1', '陆', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('199', '1', '荣', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('200', '1', '翁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('201', '1', '荀', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('202', '1', '羊', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('203', '1', '於', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('204', '1', '惠', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('205', '1', '甄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('206', '1', '麹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('207', '1', '家', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('208', '1', '封', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('209', '1', '芮', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('210', '1', '羿', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('211', '1', '储', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('212', '1', '靳', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('213', '1', '汲', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('214', '1', '邴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('215', '1', '糜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('216', '1', '松', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('217', '1', '井', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('218', '1', '段', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('219', '1', '富', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('220', '1', '巫', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('221', '1', '乌', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('222', '1', '焦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('223', '1', '巴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('224', '1', '弓', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('225', '1', '牧', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('226', '1', '隗', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('227', '1', '山', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('228', '1', '谷', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('229', '1', '车', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('230', '1', '侯', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('231', '1', '宓', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('232', '1', '蓬', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('233', '1', '全', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('234', '1', '郗', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('235', '1', '班', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('236', '1', '仰', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('237', '1', '秋', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('238', '1', '仲', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('239', '1', '伊', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('240', '1', '宫', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('241', '1', '宁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('242', '1', '仇', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('243', '1', '栾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('244', '1', '暴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('245', '1', '甘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('246', '1', '斜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('247', '1', '厉', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('248', '1', '戎', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('249', '1', '祖', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('250', '1', '武', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('251', '1', '符', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('252', '1', '刘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('253', '1', '景', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('254', '1', '詹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('255', '1', '束', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('256', '1', '龙', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('257', '1', '叶', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('258', '1', '幸', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('259', '1', '司', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('260', '1', '韶', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('261', '1', '郜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('262', '1', '黎', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('263', '1', '蓟', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('264', '1', '薄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('265', '1', '印', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('266', '1', '宿', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('267', '1', '白', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('268', '1', '怀', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('269', '1', '蒲', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('270', '1', '邰', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('271', '1', '从', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('272', '1', '鄂', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('273', '1', '索', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('274', '1', '咸', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('275', '1', '籍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('276', '1', '赖', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('277', '1', '卓', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('278', '1', '蔺', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('279', '1', '屠', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('280', '1', '蒙', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('281', '1', '池', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('282', '1', '乔', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('283', '1', '阴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('284', '1', '郁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('285', '1', '胥', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('286', '1', '能', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('287', '1', '苍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('288', '1', '双', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('289', '1', '闻', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('290', '1', '莘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('291', '1', '党', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('292', '1', '翟', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('293', '1', '谭', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('294', '1', '贡', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('295', '1', '劳', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('296', '1', '逄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('297', '1', '姬', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('298', '1', '申', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('299', '1', '扶', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('300', '1', '堵', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('301', '1', '冉', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('302', '1', '宰', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('303', '1', '郦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('304', '1', '雍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('305', '1', '郤', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('306', '1', '璩', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('307', '1', '桑', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('308', '1', '桂', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('309', '1', '濮', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('310', '1', '牛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('311', '1', '寿', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('312', '1', '通', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('313', '1', '边', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('314', '1', '扈', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('315', '1', '燕', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('316', '1', '冀', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('317', '1', '郏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('318', '1', '浦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('319', '1', '尚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('320', '1', '农', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('321', '1', '温', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('322', '1', '别', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('323', '1', '庄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('324', '1', '晏', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('325', '1', '柴', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('326', '1', '瞿', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('327', '1', '阎', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('328', '1', '充', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('329', '1', '慕', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('330', '1', '连', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('331', '1', '茹', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('332', '1', '习', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('333', '1', '宦', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('334', '1', '艾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('335', '1', '鱼', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('336', '1', '容', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('337', '1', '向', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('338', '1', '古', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('339', '1', '易', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('340', '1', '慎', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('341', '1', '戈', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('342', '1', '廖', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('343', '1', '庾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('344', '1', '终', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('345', '1', '暨', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('346', '1', '居', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('347', '1', '衡', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('348', '1', '步', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('349', '1', '都', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('350', '1', '耿', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('351', '1', '满', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('352', '1', '弘', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('353', '1', '匡', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('354', '1', '国', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('355', '1', '文', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('356', '1', '寇', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('357', '1', '广', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('358', '1', '禄', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('359', '1', '阙', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('360', '1', '东', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('361', '1', '欧', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('362', '1', '殳', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('363', '1', '沃', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('364', '1', '利', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('365', '1', '蔚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('366', '1', '越', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('367', '1', '夔', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('368', '1', '隆', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('369', '1', '师', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('370', '1', '巩', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('371', '1', '厍', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('372', '1', '聂', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('373', '1', '晁', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('374', '1', '勾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('375', '1', '敖', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('376', '1', '融', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('377', '1', '冷', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('378', '1', '訾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('379', '1', '辛', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('380', '1', '阚', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('381', '1', '那', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('382', '1', '简', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('383', '1', '饶', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('384', '1', '空', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('385', '1', '曾', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('386', '1', '毋', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('387', '1', '沙', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('388', '1', '乜', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('389', '1', '养', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('390', '1', '鞠', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('391', '1', '须', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('392', '1', '丰', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('393', '1', '巢', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('394', '1', '关', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('395', '1', '蒯', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('396', '1', '相', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('397', '1', '查', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('398', '1', '后', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('399', '1', '荆', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('400', '1', '红', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('401', '1', '游', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('402', '1', '竺', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('403', '1', '权', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('404', '1', '逑', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('405', '1', '盖', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('406', '1', '益', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('407', '1', '桓', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('408', '1', '公', '50', '1500443173', '0');
INSERT INTO `tp_hall_surnames` VALUES ('512', '2', '万俟', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('513', '2', '司马', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('514', '2', '上官', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('515', '2', '欧阳', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('516', '2', '夏侯', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('517', '2', '诸葛', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('518', '2', '闻人', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('519', '2', '东方', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('520', '2', '赫连', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('521', '2', '皇甫', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('522', '2', '尉迟', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('523', '2', '公羊', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('524', '2', '澹台', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('525', '2', '公冶', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('526', '2', '宗政', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('527', '2', '濮阳', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('528', '2', '淳于', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('529', '2', '单于', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('530', '2', '太叔', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('531', '2', '申屠', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('532', '2', '公孙', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('533', '2', '仲孙', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('534', '2', '轩辕', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('535', '2', '令狐', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('536', '2', '锺离', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('537', '2', '宇文', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('538', '2', '长孙', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('539', '2', '慕容', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('540', '2', '鲜于', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('541', '2', '闾丘', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('542', '2', '司徒', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('543', '2', '司空', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('544', '2', '丌官', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('545', '2', '司寇', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('546', '2', '仉', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('547', '2', '督', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('548', '2', '子车', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('549', '2', '颛孙', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('550', '2', '端木', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('551', '2', '巫马', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('552', '2', '公西', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('553', '2', '漆雕', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('554', '2', '乐正', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('555', '2', '壤驷', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('556', '2', '公良', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('557', '2', '拓拔', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('558', '2', '夹谷', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('559', '2', '宰父', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('560', '2', '谷梁', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('561', '2', '晋', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('562', '2', '楚', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('563', '2', '阎', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('564', '2', '法', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('565', '2', '汝', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('566', '2', '鄢', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('567', '2', '涂', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('568', '2', '钦', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('569', '2', '段干', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('570', '2', '百里', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('571', '2', '东郭', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('572', '2', '南门', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('573', '2', '呼延', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('574', '2', '归', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('575', '2', '海', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('576', '2', '羊舌', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('577', '2', '微生', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('578', '2', '岳', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('579', '2', '帅', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('580', '2', '缑', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('581', '2', '亢', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('582', '2', '况', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('583', '2', '后', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('584', '2', '有', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('585', '2', '琴', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('586', '2', '梁丘', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('587', '2', '左丘', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('588', '2', '东门', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('589', '2', '西门', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('590', '2', '商', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('591', '2', '牟', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('592', '2', '佘', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('593', '2', '佴', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('594', '2', '伯', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('595', '2', '赏', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('596', '2', '南宫', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('597', '2', '墨', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('598', '2', '哈', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('599', '2', '谯', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('600', '2', '笪', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('601', '2', '年', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('602', '2', '爱', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('603', '2', '阳', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('604', '2', '佟', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('605', '2', '第五', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('606', '2', '言', '50', '1500443174', '0');
INSERT INTO `tp_hall_surnames` VALUES ('607', '2', '福', '50', '1500443174', '0');

-- ----------------------------
-- Table structure for tp_hall_theme
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_theme`;
CREATE TABLE `tp_hall_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题馆主键ID',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆id',
  `theme_img` varchar(255) DEFAULT NULL COMMENT '照片',
  `theme_theme` varchar(30) DEFAULT NULL COMMENT '纪念馆主题',
  `theme_lingpai_style` int(11) DEFAULT NULL COMMENT '灵牌样式',
  `theme_ancestral_home` varchar(30) DEFAULT NULL COMMENT '主题起源',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='andy - 主题馆表';

-- ----------------------------
-- Records of tp_hall_theme
-- ----------------------------

-- ----------------------------
-- Table structure for tp_hall_two
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_two`;
CREATE TABLE `tp_hall_two` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '双人人纪念馆',
  `hall_id` int(11) NOT NULL COMMENT '馆ID',
  `tow_name` varchar(30) DEFAULT NULL COMMENT '纪念馆名称',
  `two_img1` varchar(255) DEFAULT NULL COMMENT '逝者照片',
  `two_name1` varchar(50) NOT NULL COMMENT '逝者名称',
  `two_sex1` int(1) NOT NULL DEFAULT '1' COMMENT '性别 1=保密 2=男 3=女',
  `two_ethnic1` int(3) DEFAULT NULL COMMENT '名族',
  `two_birthday1` int(11) NOT NULL DEFAULT '0' COMMENT '出生日期',
  `two_death1` int(11) NOT NULL DEFAULT '0' COMMENT '逝世日期',
  `two_lingpai_style1` int(11) DEFAULT NULL COMMENT '灵牌样式',
  `two_img2` varchar(255) DEFAULT NULL COMMENT '逝者照片',
  `two_name2` varchar(50) NOT NULL COMMENT '逝者名称',
  `two_sex2` int(1) NOT NULL DEFAULT '1' COMMENT '性别 1=保密 2=男 3=女',
  `two_ethnic2` int(3) DEFAULT NULL COMMENT '名族',
  `two_birthday2` int(11) NOT NULL DEFAULT '0' COMMENT '出生日期',
  `two_death2` int(11) NOT NULL DEFAULT '0' COMMENT '逝世日期',
  `two_lingpai_style2` int(11) DEFAULT NULL COMMENT '灵牌样式',
  `two_relation` varchar(10) DEFAULT NULL COMMENT '成员关系',
  `two_describe` text COMMENT '生前描述',
  `create_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hall_two
-- ----------------------------
INSERT INTO `tp_hall_two` VALUES ('1', '6', '张三李四', '/static/upload/picture/20170711/3ab32ace6407d022dbd364e751e17732.jpg', '黄宏芳', '3', '1', '379008000', '1895500800', '2', '/static/upload/picture/20170711/1c1cb764ec8546c64bdeeeb6041c75ce.jpg', '冒元山', '2', '1', '96652800', '1390320000', '2', '家属', '呵呵', '1499392157', '1500353933');
INSERT INTO `tp_hall_two` VALUES ('5', '23', '放反反复复', '/static/upload/picture/20170711/fa4e033cf65d824e07688a374a31de48.jpg', '超过放放风', '1', '0', '-28800', '-28800', '2', '/static/upload/picture/20170711/a13a16d3815d7332c57a927ffe9d271c.jpg', '放反反复复', '2', '0', '-28800', '-28800', '2', '你是个什么都没有关系', '这样的呢、一直以来都是在你', '1499762982', '1500353373');
INSERT INTO `tp_hall_two` VALUES ('6', '41', null, '/static/upload/picture/20170713/0a20c92f01e9f5591b8d9cfc08ab9d9b.jpg', '逝者111', '1', '1', '20170714', '20170713', '2', '/static/upload/picture/20170713/3fd3eb881ed36879d38f32a737aed007.jpg', '逝者222', '2', '3', '20170710', '20170721', '2', '爱的发声', '撒的发生', '1499961193', '1499961998');
INSERT INTO `tp_hall_two` VALUES ('7', '28', null, '/static/upload/picture/20170720/dedd01877976691a695594bbd61b2fa8.jpg', '逝者111', '1', null, '0', '0', '2', '/static/upload/picture/20170720/e48ea5ab60bf57f9d8984bb7ff683f4a.jpg', '逝者2', '2', null, '0', '0', '2', '测试关系', '描述', '1500533337', '1500535537');

-- ----------------------------
-- Table structure for tp_hall_worship_style
-- ----------------------------
DROP TABLE IF EXISTS `tp_hall_worship_style`;
CREATE TABLE `tp_hall_worship_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '纪念馆大厅风格表主键ID',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '风格分类ID',
  `style_name` varchar(30) NOT NULL COMMENT '风格名称',
  `style_big_img` varchar(255) NOT NULL COMMENT '大厅风格大图',
  `style_img` varchar(255) NOT NULL COMMENT '大厅风格小图',
  `style_num` int(11) NOT NULL DEFAULT '0' COMMENT '使用人数',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=启用 2=禁用',
  `create_at` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='andy - 纪念馆大厅风格表';

-- ----------------------------
-- Records of tp_hall_worship_style
-- ----------------------------
INSERT INTO `tp_hall_worship_style` VALUES ('1', '88', '耶稣厅', '/static/upload/picture/20170710/38633c852eef33c2bffc30209f683e97.jpg', '/static/upload/picture/20170710/adfa454513d2be2a20bfad829d46f195.jpg', '0', '50', '1', '1499609394');
INSERT INTO `tp_hall_worship_style` VALUES ('2', '10', '双人馆大厅', '/static/upload/picture/20170710/167a9855f23717c0dae423a5d8b8f9e6.jpg', '/static/upload/picture/20170710/5e4603582ab58f19ebcc3400305363c5.jpg', '0', '50', '1', '1499649025');
INSERT INTO `tp_hall_worship_style` VALUES ('3', '11', '家族馆大厅', '/static/upload/picture/20170724/e687245f30ee6a3f4b6cf21131406b91.jpg', '/static/upload/picture/20170724/da5bf5bfb90d0dfdec96ff1ef3172736.jpg', '0', '50', '1', '1499649036');

-- ----------------------------
-- Table structure for tp_inscription
-- ----------------------------
DROP TABLE IF EXISTS `tp_inscription`;
CREATE TABLE `tp_inscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `inscription_sn` char(100) NOT NULL COMMENT '碑文编号',
  `cemetery_sn` char(100) NOT NULL COMMENT '墓位编号',
  `name` varchar(50) DEFAULT NULL COMMENT '碑文名称',
  `content` text COMMENT '碑文内容',
  `remark` text COMMENT '碑文说明',
  `cost` int(11) NOT NULL COMMENT '价格',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 ',
  `create_by` int(11) NOT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='andy - 碑文表';

-- ----------------------------
-- Records of tp_inscription
-- ----------------------------
INSERT INTO `tp_inscription` VALUES ('6', 'JDS_2_4_03_1-595B33BBC4BB1', 'JDS_2_4_03_1', '测试碑文', '<p>发</p>', '胜多负少', '322', '1', '10002', '1499149243', '0');

-- ----------------------------
-- Table structure for tp_links
-- ----------------------------
DROP TABLE IF EXISTS `tp_links`;
CREATE TABLE `tp_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接索引id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:友情链接 2:合作单位',
  `url` varchar(255) NOT NULL DEFAULT 'javascript:;' COMMENT '友情链接地址',
  `name` varchar(100) DEFAULT NULL COMMENT '友情链接名称',
  `image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `target` char(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `description` text COMMENT '友情链接描述',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='andy - 友情链接表';

-- ----------------------------
-- Records of tp_links
-- ----------------------------
INSERT INTO `tp_links` VALUES ('1', '2', 'http://yunjn.cc', '环拓科技', '/static/upload/picture/20170616/9b4df6f4295b35c3187a13dc70bede4c.jpg', '_blank', null, '0', null, '0', '1', '2012-06-15', '2017-06-05', '1497580662', '1497581310');
INSERT INTO `tp_links` VALUES ('2', '1', 'http://yunjn.cc', '官网', '/static/upload/picture/20170616/35c878d5e79636793a13a009682a6373.jpg', '_blank', null, '0', null, '0', '1', '2017-06-04', '2017-06-23', '1497602696', '1497602709');

-- ----------------------------
-- Table structure for tp_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_mall_goods`;
CREATE TABLE `tp_mall_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品索引id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '分类id 0 顶级分类',
  `btn_id` varchar(100) NOT NULL COMMENT '动画id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `summary` text COMMENT '商品简介',
  `price` int(10) NOT NULL DEFAULT '0' COMMENT '商品价格（积分）',
  `user_integral` int(11) NOT NULL DEFAULT '0' COMMENT '祭拜值',
  `memorial_integral` int(11) NOT NULL DEFAULT '0' COMMENT '纪念馆值',
  `duration` int(11) NOT NULL DEFAULT '6' COMMENT '持续时间 单位：小时',
  `is_sale` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否上架 1 上架 0 下架 ',
  `is_new` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否新品 1 是 0 否',
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `menu_url` varchar(255) DEFAULT NULL COMMENT 'PC端祭祀图片url',
  `gif` varchar(255) DEFAULT NULL COMMENT '动画图片',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=821 DEFAULT CHARSET=utf8 COMMENT='andy - 祭祀商品表';

-- ----------------------------
-- Records of tp_mall_goods
-- ----------------------------
INSERT INTO `tp_mall_goods` VALUES ('122', '3001', 'x_3001', '回忆香', '永久回忆', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j01_t_01.png', '/static/upload/goods/j01_m_01.png', '/static/upload/picture/20170628/1c9af71c9288cdac8de0bc80564e556c.png', '10000', '1498117548', '1498637424');
INSERT INTO `tp_mall_goods` VALUES ('123', '3001', 'x_3001', '平安香', '平安永伴', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j01_t_02.png', '/static/upload/goods/j01_m_02.png', null, '10000', '1498117548', '0');
INSERT INTO `tp_mall_goods` VALUES ('124', '3001', 'x_3001', '思念香', '传递思念', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j01_t_03.png', '/static/upload/goods/j01_m_03.png', null, '10000', '1498117549', '0');
INSERT INTO `tp_mall_goods` VALUES ('125', '3001', 'x_3001', '报乐香', '永享安乐', '20', '1', '2', '6', '1', '0', '0', '/static/upload/goods/j01_t_04.png', '/static/upload/goods/j01_m_04.png', null, '10000', '1498117549', '0');
INSERT INTO `tp_mall_goods` VALUES ('126', '3001', 'x_3001', '功德香', '功德圆满', '20', '1', '2', '6', '1', '0', '0', '/static/upload/goods/j01_t_05.png', '/static/upload/goods/j01_m_05.png', null, '10000', '1498117549', '0');
INSERT INTO `tp_mall_goods` VALUES ('127', '3001', 'x_3001', '增福香', '福泽绵长', '20', '1', '2', '6', '1', '0', '0', '/static/upload/goods/j01_t_06.png', '/static/upload/goods/j01_m_06.png', null, '10000', '1498117550', '0');
INSERT INTO `tp_mall_goods` VALUES ('128', '3002', 'lz_3002', '大红烛', '流朱富贵', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j02_t_01.png', '/static/upload/goods/j02_m_01.png', null, '10000', '1498117550', '0');
INSERT INTO `tp_mall_goods` VALUES ('129', '3002', 'lz_3002', '粉红莲花灯', '莲心慧质', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j02_t_02.png', '/static/upload/goods/j02_m_02.png', null, '10000', '1498117551', '0');
INSERT INTO `tp_mall_goods` VALUES ('130', '3002', 'lz_3002', '古典庄园烛台', '永久思念', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j02_t_03.png', '/static/upload/goods/j02_m_03.png', null, '10000', '1498117551', '0');
INSERT INTO `tp_mall_goods` VALUES ('131', '3002', 'lz_3002', '黑色古典烛台', '照亮后世', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j02_t_04.png', '/static/upload/goods/j02_m_04.png', null, '10000', '1498117551', '0');
INSERT INTO `tp_mall_goods` VALUES ('132', '3002', 'lz_3002', '莲花酥油灯', '圣洁美丽', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j02_t_05.png', '/static/upload/goods/j02_m_05.png', null, '10000', '1498117552', '0');
INSERT INTO `tp_mall_goods` VALUES ('133', '3002', 'lz_3002', '铜莲花蜡烛', '至爱一生', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j02_t_06.png', '/static/upload/goods/j02_m_06.png', null, '10000', '1498117552', '0');
INSERT INTO `tp_mall_goods` VALUES ('134', '3002', 'lz_3002', '心经莲花灯', '心有所属', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j02_t_07.png', '/static/upload/goods/j02_m_07.png', null, '10000', '1498117553', '0');
INSERT INTO `tp_mall_goods` VALUES ('135', '3002', 'lz_3002', '招财进宝烛', '日进斗金', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j02_t_08.png', '/static/upload/goods/j02_m_08.png', null, '10000', '1498117553', '0');
INSERT INTO `tp_mall_goods` VALUES ('136', '3004', 'gpClass', '白百合', '纯洁如百合', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j03_t_01.png', '/static/upload/goods/j03_m_01.png', null, '10000', '1498117561', '0');
INSERT INTO `tp_mall_goods` VALUES ('137', '3004', 'gpClass', '白玫瑰', '高贵典雅', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j03_t_02.png', '/static/upload/goods/j03_m_02.png', null, '10000', '1498117562', '0');
INSERT INTO `tp_mall_goods` VALUES ('138', '3004', 'gpClass', '百合玫瑰花', '挚爱一生', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j03_t_03.png', '/static/upload/goods/j03_m_03.png', null, '10000', '1498117563', '0');
INSERT INTO `tp_mall_goods` VALUES ('140', '3004', 'gpClass', '粉玫瑰', '浪漫爱情', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j03_t_05.png', '/static/upload/goods/j03_m_05.png', null, '10000', '1498117563', '0');
INSERT INTO `tp_mall_goods` VALUES ('141', '3004', 'gpClass', '红玫瑰', '热情思恋', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j03_t_06.png', '/static/upload/goods/j03_m_06.png', null, '10000', '1498117564', '0');
INSERT INTO `tp_mall_goods` VALUES ('142', '3004', 'gpClass', '康乃馨', '伟大恩情', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j03_t_07.png', '/static/upload/goods/j03_m_07.png', null, '10000', '1498117565', '0');
INSERT INTO `tp_mall_goods` VALUES ('143', '3004', 'gpClass', '莲花座', '大爱无疆', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j03_t_08.png', '/static/upload/goods/j03_m_08.png', null, '10000', '1498117566', '0');
INSERT INTO `tp_mall_goods` VALUES ('144', '3004', 'gpClass', '马蹄莲', '虔诚祭拜', '30', '2', '3', '6', '1', '0', '0', '/static/upload/goods/j03_t_09.png', '/static/upload/goods/j03_m_09.png', null, '10000', '1498117566', '0');
INSERT INTO `tp_mall_goods` VALUES ('145', '3004', 'gpClass', '郁金香', '爱心无边', '30', '2', '3', '6', '1', '0', '0', '/static/upload/goods/j03_t_10.png', '/static/upload/goods/j03_m_10.png', null, '10000', '1498117568', '0');
INSERT INTO `tp_mall_goods` VALUES ('147', '5005', 'gpClass', '草莓', '回忆思念', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_01.png', '/static/upload/goods/j04_m_01.png', null, '10000', '1498117620', '0');
INSERT INTO `tp_mall_goods` VALUES ('148', '5005', 'gpClass', '橘子', '片片真情', '20', '0', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_02.png', '/static/upload/goods/j04_m_02.png', null, '10000', '1498117620', '0');
INSERT INTO `tp_mall_goods` VALUES ('149', '5005', 'gpClass', '苹果', '平安永伴', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_03.png', '/static/upload/goods/j04_m_03.png', null, '10000', '1498117621', '0');
INSERT INTO `tp_mall_goods` VALUES ('150', '5005', 'gpClass', '桃子', '蟠桃盛宴', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_04.png', '/static/upload/goods/j04_m_04.png', null, '10000', '1498117621', '0');
INSERT INTO `tp_mall_goods` VALUES ('151', '5005', 'gpClass', '香蕉', '爱心包容', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_05.png', '/static/upload/goods/j04_m_05.png', null, '10000', '1498117622', '0');
INSERT INTO `tp_mall_goods` VALUES ('152', '5005', 'gpClass', '雪梨', '远离厄运', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_06.png', '/static/upload/goods/j04_m_06.png', null, '10000', '1498117622', '0');
INSERT INTO `tp_mall_goods` VALUES ('153', '5005', 'gpClass', '甘蔗', '节节高升', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_07.png', '/static/upload/goods/j04_m_07.png', null, '10000', '1498117618', '0');
INSERT INTO `tp_mall_goods` VALUES ('154', '5004', 'gpClass', '全鸡', '计慰辛劳', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_08.png', '/static/upload/goods/j04_m_08.png', null, '10000', '1498117613', '0');
INSERT INTO `tp_mall_goods` VALUES ('155', '5004', 'gpClass', '全鱼', '年年有余', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_09.png', '/static/upload/goods/j04_m_09.png', null, '10000', '1498117613', '0');
INSERT INTO `tp_mall_goods` VALUES ('156', '5004', 'gpClass', '全鸭', '气压群雄', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_10.png', '/static/upload/goods/j04_m_10.png', null, '10000', '1498117615', '0');
INSERT INTO `tp_mall_goods` VALUES ('157', '5004', 'gpClass', '羊肉', '三羊开泰', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_11.png', '/static/upload/goods/j04_m_11.png', null, '10000', '1498117616', '0');
INSERT INTO `tp_mall_goods` VALUES ('158', '5004', 'gpClass', '全猪', '面面俱到', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j04_t_12.png', '/static/upload/goods/j04_m_12.png', null, '10000', '1498117618', '0');
INSERT INTO `tp_mall_goods` VALUES ('159', '5003', 'gpClass', '素包子', '博大精深', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_13.png', '/static/upload/goods/j04_m_13.png', null, '10000', '1498117607', '0');
INSERT INTO `tp_mall_goods` VALUES ('161', '5003', 'gpClass', '米饭', '粒粒真情', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_15.png', '/static/upload/goods/j04_m_15.png', null, '10000', '1498117607', '0');
INSERT INTO `tp_mall_goods` VALUES ('162', '5006', 'gpClass', '水饺', '包容待人', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_16.png', '/static/upload/goods/j04_m_16.png', null, '10000', '1498117634', '0');
INSERT INTO `tp_mall_goods` VALUES ('163', '5006', 'gpClass', '月饼', '中秋思亲', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_17.png', '/static/upload/goods/j04_m_17.png', null, '10000', '1498117634', '0');
INSERT INTO `tp_mall_goods` VALUES ('164', '5003', 'gpClass', '馒头', '圆圆满满', '10', '0', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_18.png', '/static/upload/goods/j04_m_18.png', null, '10000', '1498117608', '0');
INSERT INTO `tp_mall_goods` VALUES ('165', '5018', 'gpClass', '糖果', '甜甜蜜蜜', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_19.png', '/static/upload/goods/j04_m_19.png', null, '10000', '1498117728', '0');
INSERT INTO `tp_mall_goods` VALUES ('166', '5007', 'gpClass', '牛奶', '深深思念', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_20.png', '/static/upload/goods/j04_m_20.png', null, '10000', '1498117641', '0');
INSERT INTO `tp_mall_goods` VALUES ('167', '6001', 'h_6001', '吉祥彩金座', '吉祥相伴', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_01.png', '/static/upload/goods/j05_m_01.png', null, '10000', '1498117745', '0');
INSERT INTO `tp_mall_goods` VALUES ('168', '6004', 'h_6004', '别墅', '装尽思念', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_02.png', '/static/upload/goods/j05_m_02.png', null, '10000', '1498117783', '0');
INSERT INTO `tp_mall_goods` VALUES ('170', '6002', 'h_6002', '男装', '温暖身心', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_04.png', '/static/upload/goods/j05_m_04.png', null, '10000', '1498117760', '0');
INSERT INTO `tp_mall_goods` VALUES ('171', '6003', 'h_6003', '女装', '温暖身心', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_05.png', '/static/upload/goods/j05_m_05.png', null, '10000', '1498117775', '0');
INSERT INTO `tp_mall_goods` VALUES ('172', '6005', 'h_6005', '汽车', '漫游天际', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_06.png', '/static/upload/goods/j05_m_06.png', null, '10000', '1498117788', '0');
INSERT INTO `tp_mall_goods` VALUES ('173', '6011', 'h_6011', '金银库', '享之不尽', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_07.png', '/static/upload/goods/j05_m_07.png', null, '10000', '1498117845', '0');
INSERT INTO `tp_mall_goods` VALUES ('174', '6011', 'h_6011', '七宝石', '用之不尽', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_08.png', '/static/upload/goods/j05_m_08.png', null, '10000', '1498117845', '0');
INSERT INTO `tp_mall_goods` VALUES ('175', '6011', 'h_6011', '舍利塔', '佛光永照', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_09.png', '/static/upload/goods/j05_m_09.png', null, '10000', '1498117844', '0');
INSERT INTO `tp_mall_goods` VALUES ('176', '6006', 'h_6006', '电脑', '天际视野', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_10.png', '/static/upload/goods/j05_m_10.png', null, '10000', '1498117801', '0');
INSERT INTO `tp_mall_goods` VALUES ('177', '6005', 'h_6005', '飞机', '遨游天际', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_11.png', '/static/upload/goods/j05_m_11.png', null, '10000', '1498117791', '0');
INSERT INTO `tp_mall_goods` VALUES ('178', '6006', 'h_6006', '洗衣机', '转来好运', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_12.png', '/static/upload/goods/j05_m_12.png', null, '10000', '1498117799', '0');
INSERT INTO `tp_mall_goods` VALUES ('179', '3005', 'h', '行礼', '诚心至上', '0', '0', '0', '6', '1', '0', '0', '/static/upload/goods/j06_t_01.png', '/static/upload/goods/j06_m_01.png', null, '10000', '1498117570', '0');
INSERT INTO `tp_mall_goods` VALUES ('180', '3005', 'h', '行礼', '诚心至上', '0', '0', '0', '6', '1', '0', '0', '/static/upload/goods/j06_t_02.png', '/static/upload/goods/j06_m_02.png', null, '10000', '1498117570', '0');
INSERT INTO `tp_mall_goods` VALUES ('181', '3005', 'h', '行礼', '诚心至上', '0', '0', '0', '6', '1', '0', '0', '/static/upload/goods/j06_t_03.png', '/static/upload/goods/j06_m_03.png', null, '10000', '1498117571', '0');
INSERT INTO `tp_mall_goods` VALUES ('182', '3005', 'h', '行礼', '诚心至上', '0', '0', '0', '6', '1', '0', '0', '/static/upload/goods/j06_t_04.png', '/static/upload/goods/j06_m_04.png', null, '10000', '1498117571', '0');
INSERT INTO `tp_mall_goods` VALUES ('183', '5002', 'gpClass', '碧螺春', '春风得意', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_01.png', '/static/upload/goods/j05_m_01.png', null, '10000', '1498117604', '0');
INSERT INTO `tp_mall_goods` VALUES ('184', '5002', 'gpClass', '普洱茶', '普渡众生', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_02.png', '/static/upload/goods/j05_m_02.png', null, '10000', '1498117605', '0');
INSERT INTO `tp_mall_goods` VALUES ('185', '5002', 'gpClass', '铁观音', '佛光照耀', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_03.png', '/static/upload/goods/j05_m_03.png', null, '10000', '1498117605', '0');
INSERT INTO `tp_mall_goods` VALUES ('188', '5001', 'gpClass', '50年茅台经典品味', '虔心敬上', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_06.png', '/static/upload/goods/j05_m_06.png', null, '10000', '1498117602', '0');
INSERT INTO `tp_mall_goods` VALUES ('189', '5001', 'gpClass', '50度五粮液十年', '香气悠久', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_07.png', '/static/upload/goods/j05_m_07.png', null, '10000', '1498117599', '0');
INSERT INTO `tp_mall_goods` VALUES ('192', '3003', 'hqClass', '花圈', '千古流芳', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j07_t_01.png', '/static/upload/goods/j07_m_01.png', null, '10000', '1498117554', '0');
INSERT INTO `tp_mall_goods` VALUES ('193', '3003', 'hqClass', '花圈', '清明时节', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j07_t_02.png', '/static/upload/goods/j07_m_02.png', null, '10000', '1498117554', '0');
INSERT INTO `tp_mall_goods` VALUES ('194', '3003', 'hqClass', '花圈', '无限哀思', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j07_t_03.png', '/static/upload/goods/j07_m_03.png', null, '10000', '1498117555', '0');
INSERT INTO `tp_mall_goods` VALUES ('195', '3003', 'hqClass', '花圈', '长相思', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j07_t_04.png', '/static/upload/goods/j07_m_04.png', null, '10000', '1498117557', '0');
INSERT INTO `tp_mall_goods` VALUES ('196', '7001', 'h_7001', '超荐法事-阿弥陀经', '助其往生西方极乐世界', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_01.png', '/static/upload/goods/j09_m_01.png', null, '10000', '1498117873', '0');
INSERT INTO `tp_mall_goods` VALUES ('197', '7001', 'h_7001', '祈福法事-大悲咒', '契合菩萨的大悲心，获得无上的利益', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_04.png', '/static/upload/goods/j09_m_02.png', null, '10000', '1498117873', '0');
INSERT INTO `tp_mall_goods` VALUES ('198', '7001', 'h_7001', '洒净法事-往生咒', '持诵此咒，清净处所，安定身心', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_05.png', '/static/upload/goods/j09_m_03.png', null, '10000', '1498117874', '0');
INSERT INTO `tp_mall_goods` VALUES ('199', '7001', 'h_7001', '开光法事-心经', '救拔往生亲人出苦难', '1000', '0', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_07.png', '/static/upload/goods/j09_m_04.png', null, '10000', '1498117874', '0');
INSERT INTO `tp_mall_goods` VALUES ('200', '7002', 'h_7002', '赞美诗歌-全能真神', '赞美耶和华是全能真神', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_08.png', '/static/upload/goods/j09_m_05.png', null, '10000', '1498117875', '0');
INSERT INTO `tp_mall_goods` VALUES ('201', '7002', 'h_7002', '赞美诗歌-万国都要来赞美主', '敬拜耶和华，唱诗来向他欢呼', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_09.png', '/static/upload/goods/j09_m_06.png', null, '10000', '1498117876', '0');
INSERT INTO `tp_mall_goods` VALUES ('202', '7002', 'h_7002', '赞美诗歌-当我恩主降临时候', '赞美主耶稣', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_10.png', '/static/upload/goods/j09_m_07.png', null, '10000', '1498117876', '0');
INSERT INTO `tp_mall_goods` VALUES ('203', '7002', 'h_7002', '赞美诗歌-回家吧回家吧', '表达不愿再流荡，想永住主身旁', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_11.png', '/static/upload/goods/j09_m_08.png', null, '10000', '1498117877', '0');
INSERT INTO `tp_mall_goods` VALUES ('205', '3004', 'gpClass', '牡丹', '富贵吉祥', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j03_t_13.png', '/static/upload/goods/j03_m_13.png', null, '10000', '1498117562', '0');
INSERT INTO `tp_mall_goods` VALUES ('206', '3004', 'gpClass', '长寿花', '健康长寿', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j03_t_14.png', '/static/upload/goods/j03_m_14.png', null, '10000', '1498117568', '0');
INSERT INTO `tp_mall_goods` VALUES ('207', '3004', 'gpClass', '莲花', '容貌端庄', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j03_t_15.png', '/static/upload/goods/j03_m_15.png', null, '10000', '1498117562', '0');
INSERT INTO `tp_mall_goods` VALUES ('208', '5006', 'gpClass', '年糕', '年年高升', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_21.png', '/static/upload/goods/j04_m_21.png', null, '10000', '1498117635', '0');
INSERT INTO `tp_mall_goods` VALUES ('209', '5006', 'gpClass', '发粿', '红运发财', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_22.png', '/static/upload/goods/j04_m_22.png', null, '10000', '1498117637', '0');
INSERT INTO `tp_mall_goods` VALUES ('210', '5006', 'gpClass', '红龟粿', '吉祥长寿', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_23.png', '/static/upload/goods/j04_m_23.png', null, '10000', '1498117639', '0');
INSERT INTO `tp_mall_goods` VALUES ('211', '5006', 'gpClass', '汤圆', '事事圆', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_24.png', '/static/upload/goods/j04_m_24.png', null, '10000', '1498117636', '0');
INSERT INTO `tp_mall_goods` VALUES ('212', '5006', 'gpClass', '豆干', '升官发财', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_25.png', '/static/upload/goods/j04_m_25.png', null, '10000', '1498117636', '0');
INSERT INTO `tp_mall_goods` VALUES ('213', '5003', 'gpClass', '面线', '健康长寿', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_26.png', '/static/upload/goods/j04_m_26.png', null, '10000', '1498117608', '0');
INSERT INTO `tp_mall_goods` VALUES ('214', '5006', 'gpClass', '素粽', '金榜题名', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_27.png', '/static/upload/goods/j04_m_27.png', null, '10000', '1498117637', '0');
INSERT INTO `tp_mall_goods` VALUES ('216', '5003', 'gpClass', '萝卜', '好彩头', '10', '0', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_29.png', '/static/upload/goods/j04_m_29.png', null, '10000', '1498117609', '0');
INSERT INTO `tp_mall_goods` VALUES ('220', '5005', 'gpClass', '柿子', '事事顺利', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_33.png', '/static/upload/goods/j04_m_33.png', null, '10000', '1498117619', '0');
INSERT INTO `tp_mall_goods` VALUES ('221', '5005', 'gpClass', '菠萝', '财旺人旺', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_34.png', '/static/upload/goods/j04_m_34.png', null, '10000', '1498117623', '0');
INSERT INTO `tp_mall_goods` VALUES ('222', '5005', 'gpClass', '李子', '子孙满堂', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_35.png', '/static/upload/goods/j04_m_35.png', null, '10000', '1498117623', '0');
INSERT INTO `tp_mall_goods` VALUES ('223', '5005', 'gpClass', '佛手柑', '多福多寿', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_36.png', '/static/upload/goods/j04_m_36.png', null, '10000', '1498117624', '0');
INSERT INTO `tp_mall_goods` VALUES ('224', '5005', 'gpClass', '瓜果', '福寿绵延', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_37.png', '/static/upload/goods/j04_m_37.png', null, '10000', '1498117624', '0');
INSERT INTO `tp_mall_goods` VALUES ('225', '5005', 'gpClass', '寿桃', '健康长寿', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_38.png', '/static/upload/goods/j04_m_38.png', null, '10000', '1498117619', '0');
INSERT INTO `tp_mall_goods` VALUES ('226', '3003', 'hqClass', '花圈', '长相思', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j07_t_05.png', '/static/upload/goods/j07_m_05.png', null, '10000', '1498117561', '0');
INSERT INTO `tp_mall_goods` VALUES ('227', '3003', 'hqClass', '花圈', '无限思念', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j07_t_06.png', '/static/upload/goods/j07_m_06.png', null, '10000', '1498117557', '0');
INSERT INTO `tp_mall_goods` VALUES ('228', '3003', 'hqClass', '花圈', '平凡英雄', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j07_t_10.png', '/static/upload/goods/j07_m_10.png', null, '10000', '1498117556', '0');
INSERT INTO `tp_mall_goods` VALUES ('229', '3003', 'hqClass', '花篮', '永久回忆', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j07_t_07.png', '/static/upload/goods/j07_m_07.png', null, '10000', '1498117559', '0');
INSERT INTO `tp_mall_goods` VALUES ('230', '3003', 'hqClass', '花篮', '舍不得你', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j07_t_08.png', '/static/upload/goods/j07_m_08.png', null, '10000', '1498117559', '0');
INSERT INTO `tp_mall_goods` VALUES ('231', '3003', 'hqClass', '花篮', '虔诚追思', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j07_t_09.png', '/static/upload/goods/j07_m_09.png', null, '10000', '1498117560', '0');
INSERT INTO `tp_mall_goods` VALUES ('232', '6010', 'h_6010', '哈士奇', '忠心陪伴', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_13.png', '/static/upload/goods/j05_m_13.png', null, '10000', '1498117842', '0');
INSERT INTO `tp_mall_goods` VALUES ('233', '6010', 'h_6010', '小猎犬', '忠心猎犬', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_15.png', '/static/upload/goods/j05_m_15.png', null, '10000', '1498117839', '0');
INSERT INTO `tp_mall_goods` VALUES ('234', '6010', 'h_6010', '吉娃娃', '天堂相随', '600', '0', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_16.png', '/static/upload/goods/j05_m_16.png', null, '10000', '1498117842', '0');
INSERT INTO `tp_mall_goods` VALUES ('235', '6010', 'h_6010', '博美犬', '一生爱犬', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_17.png', '/static/upload/goods/j05_m_17.png', null, '10000', '1498117843', '0');
INSERT INTO `tp_mall_goods` VALUES ('237', '6005', 'h_6005', '跑车', '风驰思念', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_19.png', '/static/upload/goods/j05_m_19.png', null, '10000', '1498117791', '0');
INSERT INTO `tp_mall_goods` VALUES ('238', '6005', 'h_6005', '迷你宝马', '一路走好', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_20.png', '/static/upload/goods/j05_m_20.png', null, '10000', '1498117788', '0');
INSERT INTO `tp_mall_goods` VALUES ('239', '6006', 'h_6006', '收音机', '收讯天际', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_22.png', '/static/upload/goods/j05_m_22.png', null, '10000', '1498117793', '0');
INSERT INTO `tp_mall_goods` VALUES ('240', '6006', 'h_6006', '相机', '让爱永存', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_23.png', '/static/upload/goods/j05_m_23.png', null, '10000', '1498117802', '0');
INSERT INTO `tp_mall_goods` VALUES ('241', '6006', 'h_6006', '液晶电视', '思念满目', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_26.png', '/static/upload/goods/j05_m_26.png', null, '10000', '1498117805', '0');
INSERT INTO `tp_mall_goods` VALUES ('242', '6006', 'h_6006', '彩票机', '好彩头', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_27.png', '/static/upload/goods/j05_m_27.png', null, '10000', '1498117802', '0');
INSERT INTO `tp_mall_goods` VALUES ('243', '6006', 'h_6006', '苹果电脑', '天际视野', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_28.png', '/static/upload/goods/j05_m_28.png', null, '10000', '1498117805', '0');
INSERT INTO `tp_mall_goods` VALUES ('244', '6006', 'h_6006', 'IPAD4', '传递思念', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_29.png', '/static/upload/goods/j05_m_29.png', null, '10000', '1498117806', '0');
INSERT INTO `tp_mall_goods` VALUES ('245', '6006', 'h_6006', 'IPHONE6', '通讯天际', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_30.png', '/static/upload/goods/j05_m_30.png', null, '10000', '1498117806', '0');
INSERT INTO `tp_mall_goods` VALUES ('246', '6001', 'h_6001', '金元宝', '金币辉煌', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_31.png', '/static/upload/goods/j05_m_31.png', null, '10000', '1498117746', '0');
INSERT INTO `tp_mall_goods` VALUES ('247', '6001', 'h_6001', '金条', '金币辉煌', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_32.png', '/static/upload/goods/j05_m_32.png', null, '10000', '1498117747', '0');
INSERT INTO `tp_mall_goods` VALUES ('248', '6001', 'h_6001', '钱纸', '家财万贯', '30', '30', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_33.png', '/static/upload/goods/j05_m_33.png', null, '10000', '1498117744', '0');
INSERT INTO `tp_mall_goods` VALUES ('249', '6001', 'h_6001', '百万冥币', '家财万贯', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_34.png', '/static/upload/goods/j05_m_34.png', null, '10000', '1498117747', '0');
INSERT INTO `tp_mall_goods` VALUES ('250', '6001', 'h_6001', '六百万存款', '家财万贯', '600', '0', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_35.png', '/static/upload/goods/j05_m_35.png', null, '10000', '1498117748', '0');
INSERT INTO `tp_mall_goods` VALUES ('251', '5018', 'gpClass', '八宝饭', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_39.png', '/static/upload/goods/j04_m_39.png', null, '10000', '1498117725', '0');
INSERT INTO `tp_mall_goods` VALUES ('252', '5018', 'gpClass', '北京烤鸭', '津津有味', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_40.png', '/static/upload/goods/j04_m_40.png', null, '10000', '1498117734', '0');
INSERT INTO `tp_mall_goods` VALUES ('253', '5018', 'gpClass', '春卷', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_41.png', '/static/upload/goods/j04_m_41.png', null, '10000', '1498117725', '0');
INSERT INTO `tp_mall_goods` VALUES ('254', '5018', 'gpClass', '糍粑', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_42.png', '/static/upload/goods/j04_m_42.png', null, '10000', '1498117726', '0');
INSERT INTO `tp_mall_goods` VALUES ('255', '5018', 'gpClass', '大闸蟹', '津津有味', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_43.png', '/static/upload/goods/j04_m_43.png', null, '10000', '1498117735', '0');
INSERT INTO `tp_mall_goods` VALUES ('256', '5018', 'gpClass', '方便面', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_44.png', '/static/upload/goods/j04_m_44.png', null, '10000', '1498117726', '0');
INSERT INTO `tp_mall_goods` VALUES ('257', '5018', 'gpClass', '灌汤包', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_45.png', '/static/upload/goods/j04_m_45.png', null, '10000', '1498117727', '0');
INSERT INTO `tp_mall_goods` VALUES ('258', '5009', 'gpClass', '火锅', '麻辣鲜香', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_46.png', '/static/upload/goods/j04_m_46.png', null, '10000', '1498117654', '0');
INSERT INTO `tp_mall_goods` VALUES ('259', '5018', 'gpClass', '烤鸡翅膀', '津津有味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_47.png', '/static/upload/goods/j04_m_47.png', null, '10000', '1498117729', '0');
INSERT INTO `tp_mall_goods` VALUES ('261', '5018', 'gpClass', '龙虾', '津津有味', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_49.png', '/static/upload/goods/j04_m_49.png', null, '10000', '1498117736', '0');
INSERT INTO `tp_mall_goods` VALUES ('262', '5018', 'gpClass', '面包', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_50.png', '/static/upload/goods/j04_m_50.png', null, '10000', '1498117727', '0');
INSERT INTO `tp_mall_goods` VALUES ('263', '5018', 'gpClass', '披萨', '津津有味', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_51.png', '/static/upload/goods/j04_m_51.png', null, '10000', '1498117732', '0');
INSERT INTO `tp_mall_goods` VALUES ('264', '5018', 'gpClass', '青团子', '津津有味', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_52.png', '/static/upload/goods/j04_m_52.png', null, '10000', '1498117728', '0');
INSERT INTO `tp_mall_goods` VALUES ('265', '5018', 'gpClass', '生煎包', '津津有味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_53.png', '/static/upload/goods/j04_m_53.png', null, '10000', '1498117729', '0');
INSERT INTO `tp_mall_goods` VALUES ('266', '5018', 'gpClass', '水晶猪手', '津津有味', '30', '0', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_54.png', '/static/upload/goods/j04_m_54.png', null, '10000', '1498117732', '0');
INSERT INTO `tp_mall_goods` VALUES ('267', '5018', 'gpClass', '提拉米苏', '津津有味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_55.png', '/static/upload/goods/j04_m_55.png', null, '10000', '1498117730', '0');
INSERT INTO `tp_mall_goods` VALUES ('268', '5018', 'gpClass', '甜甜圈', '津津有味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_56.png', '/static/upload/goods/j04_m_56.png', null, '10000', '1498117731', '0');
INSERT INTO `tp_mall_goods` VALUES ('269', '5018', 'gpClass', '虾饺', '津津有味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_57.png', '/static/upload/goods/j04_m_57.png', null, '10000', '1498117731', '0');
INSERT INTO `tp_mall_goods` VALUES ('270', '5018', 'gpClass', '炸鸡啤酒套餐', '津津有味', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_58.png', '/static/upload/goods/j04_m_58.png', null, '10000', '1498117733', '0');
INSERT INTO `tp_mall_goods` VALUES ('271', '5005', 'gpClass', '车厘子', '果香怡人', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_59.png', '/static/upload/goods/j04_m_59.png', null, '10000', '1498117630', '0');
INSERT INTO `tp_mall_goods` VALUES ('272', '5005', 'gpClass', '番石榴', '果香怡人', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_60.png', '/static/upload/goods/j04_m_60.png', null, '10000', '1498117631', '0');
INSERT INTO `tp_mall_goods` VALUES ('273', '5005', 'gpClass', '哈密瓜', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_61.png', '/static/upload/goods/j04_m_61.png', null, '10000', '1498117624', '0');
INSERT INTO `tp_mall_goods` VALUES ('274', '5005', 'gpClass', '红毛丹', '果香怡人', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_62.png', '/static/upload/goods/j04_m_62.png', null, '10000', '1498117632', '0');
INSERT INTO `tp_mall_goods` VALUES ('275', '5005', 'gpClass', '火龙果', '果香怡人', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_63.png', '/static/upload/goods/j04_m_63.png', null, '10000', '1498117632', '0');
INSERT INTO `tp_mall_goods` VALUES ('276', '5005', 'gpClass', '荔枝', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_64.png', '/static/upload/goods/j04_m_64.png', null, '10000', '1498117625', '0');
INSERT INTO `tp_mall_goods` VALUES ('277', '5005', 'gpClass', '莲雾', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_65.png', '/static/upload/goods/j04_m_65.png', null, '10000', '1498117625', '0');
INSERT INTO `tp_mall_goods` VALUES ('278', '5005', 'gpClass', '榴莲', '果香怡人', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_66.png', '/static/upload/goods/j04_m_66.png', null, '10000', '1498117633', '0');
INSERT INTO `tp_mall_goods` VALUES ('279', '5005', 'gpClass', '龙眼', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_67.png', '/static/upload/goods/j04_m_67.png', null, '10000', '1498117626', '0');
INSERT INTO `tp_mall_goods` VALUES ('280', '5005', 'gpClass', '芒果', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_68.png', '/static/upload/goods/j04_m_68.png', null, '10000', '1498117626', '0');
INSERT INTO `tp_mall_goods` VALUES ('281', '5005', 'gpClass', '柠檬', '果香怡人', '20', '0', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_69.png', '/static/upload/goods/j04_m_69.png', null, '10000', '1498117627', '0');
INSERT INTO `tp_mall_goods` VALUES ('282', '5005', 'gpClass', '琵琶', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_70.png', '/static/upload/goods/j04_m_70.png', null, '10000', '1498117627', '0');
INSERT INTO `tp_mall_goods` VALUES ('283', '5005', 'gpClass', '奇异果', '果香怡人', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_71.png', '/static/upload/goods/j04_m_71.png', null, '10000', '1498117633', '0');
INSERT INTO `tp_mall_goods` VALUES ('284', '5005', 'gpClass', '人参果', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_72.png', '/static/upload/goods/j04_m_72.png', null, '10000', '1498117628', '0');
INSERT INTO `tp_mall_goods` VALUES ('285', '5005', 'gpClass', '桑葚', '果香怡人', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_73.png', '/static/upload/goods/j04_m_73.png', null, '10000', '1498117619', '0');
INSERT INTO `tp_mall_goods` VALUES ('286', '5005', 'gpClass', '石榴', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_74.png', '/static/upload/goods/j04_m_74.png', null, '10000', '1498117629', '0');
INSERT INTO `tp_mall_goods` VALUES ('287', '5005', 'gpClass', '释迦', '果香怡人', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_75.png', '/static/upload/goods/j04_m_75.png', null, '10000', '1498117634', '0');
INSERT INTO `tp_mall_goods` VALUES ('288', '5005', 'gpClass', '无花果', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_76.png', '/static/upload/goods/j04_m_76.png', null, '10000', '1498117629', '0');
INSERT INTO `tp_mall_goods` VALUES ('289', '5005', 'gpClass', '杨桃', '果香怡人', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_77.png', '/static/upload/goods/j04_m_77.png', null, '10000', '1498117630', '0');
INSERT INTO `tp_mall_goods` VALUES ('290', '5007', 'gpClass', '冰淇淋', '沁人心脾', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_78.png', '/static/upload/goods/j04_m_78.png', null, '10000', '1498117642', '0');
INSERT INTO `tp_mall_goods` VALUES ('291', '5007', 'gpClass', '豆浆', '温暖可口', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_79.png', '/static/upload/goods/j04_m_79.png', null, '10000', '1498117640', '0');
INSERT INTO `tp_mall_goods` VALUES ('292', '5007', 'gpClass', '蜂蜜柚子茶', '沁人心脾', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_80.png', '/static/upload/goods/j04_m_80.png', null, '10000', '1498117642', '0');
INSERT INTO `tp_mall_goods` VALUES ('293', '5007', 'gpClass', '鸡尾酒', '沁人心脾', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_81.png', '/static/upload/goods/j04_m_81.png', null, '10000', '1498117645', '0');
INSERT INTO `tp_mall_goods` VALUES ('294', '5007', 'gpClass', '菊花茶', '沁人心脾', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_82.png', '/static/upload/goods/j04_m_82.png', null, '10000', '1498117640', '0');
INSERT INTO `tp_mall_goods` VALUES ('295', '5007', 'gpClass', '咖啡', '回味无穷', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_83.png', '/static/upload/goods/j04_m_83.png', null, '10000', '1498117642', '0');
INSERT INTO `tp_mall_goods` VALUES ('296', '5007', 'gpClass', '咖啡', '回味无穷', '20', '0', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_84.png', '/static/upload/goods/j04_m_84.png', null, '10000', '1498117643', '0');
INSERT INTO `tp_mall_goods` VALUES ('297', '5007', 'gpClass', '可乐', '沁人心脾', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_85.png', '/static/upload/goods/j04_m_85.png', null, '10000', '1498117643', '0');
INSERT INTO `tp_mall_goods` VALUES ('298', '5007', 'gpClass', '奇异果汁', '沁人心脾', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_86.png', '/static/upload/goods/j04_m_86.png', null, '10000', '1498117644', '0');
INSERT INTO `tp_mall_goods` VALUES ('299', '5007', 'gpClass', '双皮奶', '沁人心脾', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_87.png', '/static/upload/goods/j04_m_87.png', null, '10000', '1498117641', '0');
INSERT INTO `tp_mall_goods` VALUES ('300', '5007', 'gpClass', '水果沙拉', '沁人心脾', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_88.png', '/static/upload/goods/j04_m_88.png', null, '10000', '1498117644', '0');
INSERT INTO `tp_mall_goods` VALUES ('301', '5007', 'gpClass', '酸梅汁', '沁人心脾', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_89.png', '/static/upload/goods/j04_m_89.png', null, '10000', '1498117644', '0');
INSERT INTO `tp_mall_goods` VALUES ('302', '5007', 'gpClass', '珍珠奶茶', '沁人心脾', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_90.png', '/static/upload/goods/j04_m_90.png', null, '10000', '1498117641', '0');
INSERT INTO `tp_mall_goods` VALUES ('303', '5009', 'gpClass', '东坡肘子', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_91.png', '/static/upload/goods/j04_m_91.png', null, '10000', '1498117649', '0');
INSERT INTO `tp_mall_goods` VALUES ('304', '5009', 'gpClass', '宫保鸡丁', '麻辣鲜香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_92.png', '/static/upload/goods/j04_m_92.png', null, '10000', '1498117647', '0');
INSERT INTO `tp_mall_goods` VALUES ('305', '5009', 'gpClass', '贵妃鸡翅', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_93.png', '/static/upload/goods/j04_m_93.png', null, '10000', '1498117650', '0');
INSERT INTO `tp_mall_goods` VALUES ('306', '5009', 'gpClass', '糊涂鸡', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_94.png', '/static/upload/goods/j04_m_94.png', null, '10000', '1498117651', '0');
INSERT INTO `tp_mall_goods` VALUES ('307', '5009', 'gpClass', '麻辣猪肝', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_95.png', '/static/upload/goods/j04_m_95.png', null, '10000', '1498117651', '0');
INSERT INTO `tp_mall_goods` VALUES ('308', '5009', 'gpClass', '蚂蚁上树', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_96.png', '/static/upload/goods/j04_m_96.png', null, '10000', '1498117652', '0');
INSERT INTO `tp_mall_goods` VALUES ('309', '5009', 'gpClass', '毛血旺', '麻辣鲜香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_97.png', '/static/upload/goods/j04_m_97.png', null, '10000', '1498117647', '0');
INSERT INTO `tp_mall_goods` VALUES ('310', '5009', 'gpClass', '水煮肉片', '麻辣鲜香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_98.png', '/static/upload/goods/j04_m_98.png', null, '10000', '1498117648', '0');
INSERT INTO `tp_mall_goods` VALUES ('311', '5009', 'gpClass', '酸辣臊子蹄筋', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_99.png', '/static/upload/goods/j04_m_99.png', null, '10000', '1498117653', '0');
INSERT INTO `tp_mall_goods` VALUES ('312', '5009', 'gpClass', '坛子肉', '麻辣鲜香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_100.png', '/static/upload/goods/j04_m_100.png', null, '10000', '1498117649', '0');
INSERT INTO `tp_mall_goods` VALUES ('313', '5009', 'gpClass', '香辣小龙虾', '麻辣鲜香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_101.png', '/static/upload/goods/j04_m_101.png', null, '10000', '1498117653', '0');
INSERT INTO `tp_mall_goods` VALUES ('314', '5017', 'gpClass', '避风塘炒蟹', '鲜美多汁', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_102.png', '/static/upload/goods/j04_m_102.png', null, '10000', '1498117724', '0');
INSERT INTO `tp_mall_goods` VALUES ('315', '5017', 'gpClass', '炒苍蝇头', '鲜美多汁', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_103.png', '/static/upload/goods/j04_m_103.png', null, '10000', '1498117715', '0');
INSERT INTO `tp_mall_goods` VALUES ('316', '5017', 'gpClass', '红烧牛腩', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_104.png', '/static/upload/goods/j04_m_104.png', null, '10000', '1498117718', '0');
INSERT INTO `tp_mall_goods` VALUES ('317', '5017', 'gpClass', '姜母鸭', '鲜美多汁', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_105.png', '/static/upload/goods/j04_m_105.png', null, '10000', '1498117723', '0');
INSERT INTO `tp_mall_goods` VALUES ('318', '5017', 'gpClass', '焦糖蔓越莓面包', '鲜美多汁', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_106.png', '/static/upload/goods/j04_m_106.png', null, '10000', '1498117717', '0');
INSERT INTO `tp_mall_goods` VALUES ('319', '5017', 'gpClass', '卤肉饭', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_107.png', '/static/upload/goods/j04_m_107.png', null, '10000', '1498117719', '0');
INSERT INTO `tp_mall_goods` VALUES ('320', '5017', 'gpClass', '马蹄肉饼煲仔饭', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_108.png', '/static/upload/goods/j04_m_108.png', null, '10000', '1498117719', '0');
INSERT INTO `tp_mall_goods` VALUES ('321', '5017', 'gpClass', '肉圆便当', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_109.png', '/static/upload/goods/j04_m_109.png', null, '10000', '1498117720', '0');
INSERT INTO `tp_mall_goods` VALUES ('322', '5017', 'gpClass', '三杯鸡', '鲜美多汁', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_110.png', '/static/upload/goods/j04_m_110.png', null, '10000', '1498117723', '0');
INSERT INTO `tp_mall_goods` VALUES ('323', '5017', 'gpClass', '三杯虾', '鲜美多汁', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_111.png', '/static/upload/goods/j04_m_111.png', null, '10000', '1498117724', '0');
INSERT INTO `tp_mall_goods` VALUES ('324', '5017', 'gpClass', '台式糖醋排骨', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_112.png', '/static/upload/goods/j04_m_112.png', null, '10000', '1498117720', '0');
INSERT INTO `tp_mall_goods` VALUES ('325', '5017', 'gpClass', '台湾酱烧排骨', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_113.png', '/static/upload/goods/j04_m_113.png', null, '10000', '1498117721', '0');
INSERT INTO `tp_mall_goods` VALUES ('326', '5017', 'gpClass', '台湾客家小炒', '鲜美多汁', '20', '0', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_114.png', '/static/upload/goods/j04_m_114.png', null, '10000', '1498117718', '0');
INSERT INTO `tp_mall_goods` VALUES ('327', '5017', 'gpClass', '台湾麻油鸡', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_115.png', '/static/upload/goods/j04_m_115.png', null, '10000', '1498117721', '0');
INSERT INTO `tp_mall_goods` VALUES ('328', '5017', 'gpClass', '太阳饼', '鲜美多汁', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_116.png', '/static/upload/goods/j04_m_116.png', null, '10000', '1498117715', '0');
INSERT INTO `tp_mall_goods` VALUES ('329', '5017', 'gpClass', '香菇炖鸡', '鲜美多汁', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_117.png', '/static/upload/goods/j04_m_117.png', null, '10000', '1498117722', '0');
INSERT INTO `tp_mall_goods` VALUES ('330', '5017', 'gpClass', '小鱼花生', '鲜美多汁', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_118.png', '/static/upload/goods/j04_m_118.png', null, '10000', '1498117715', '0');
INSERT INTO `tp_mall_goods` VALUES ('331', '5017', 'gpClass', '云吞面', '鲜美多汁', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_119.png', '/static/upload/goods/j04_m_119.png', null, '10000', '1498117716', '0');
INSERT INTO `tp_mall_goods` VALUES ('332', '5011', 'gpClass', '凤尾虾排', '珍馐美味', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_120.png', '/static/upload/goods/j04_m_120.png', null, '10000', '1498117664', '0');
INSERT INTO `tp_mall_goods` VALUES ('333', '5011', 'gpClass', '海棠酥', '珍馐美味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_121.png', '/static/upload/goods/j04_m_121.png', null, '10000', '1498117663', '0');
INSERT INTO `tp_mall_goods` VALUES ('334', '5011', 'gpClass', '火腿炖甲鱼', '珍馐美味', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_122.png', '/static/upload/goods/j04_m_122.png', null, '10000', '1498117666', '0');
INSERT INTO `tp_mall_goods` VALUES ('335', '5011', 'gpClass', '姜母鸭', '珍馐美味', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_123.png', '/static/upload/goods/j04_m_123.png', null, '10000', '1498117665', '0');
INSERT INTO `tp_mall_goods` VALUES ('336', '5011', 'gpClass', '蜜汁红芋', '珍馐美味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_124.png', '/static/upload/goods/j04_m_124.png', null, '10000', '1498117663', '0');
INSERT INTO `tp_mall_goods` VALUES ('337', '5011', 'gpClass', '明珠酥鲍', '珍馐美味', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j04_t_125.png', '/static/upload/goods/j04_m_125.png', null, '10000', '1498117667', '0');
INSERT INTO `tp_mall_goods` VALUES ('338', '5011', 'gpClass', '腌鲜鳜鱼', '珍馐美味', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_126.png', '/static/upload/goods/j04_m_126.png', null, '10000', '1498117666', '0');
INSERT INTO `tp_mall_goods` VALUES ('339', '5011', 'gpClass', '鱼头豆腐汤', '珍馐美味', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_127.png', '/static/upload/goods/j04_m_127.png', null, '10000', '1498117664', '0');
INSERT INTO `tp_mall_goods` VALUES ('340', '5012', 'gpClass', '把子肉', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_128.png', '/static/upload/goods/j04_m_128.png', null, '10000', '1498117672', '0');
INSERT INTO `tp_mall_goods` VALUES ('341', '5012', 'gpClass', '鲅鱼饺子', '饕餮大餐', '30', '0', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_129.png', '/static/upload/goods/j04_m_129.png', null, '10000', '1498117673', '0');
INSERT INTO `tp_mall_goods` VALUES ('342', '5012', 'gpClass', '博山酥锅', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_130.png', '/static/upload/goods/j04_m_130.png', null, '10000', '1498117673', '0');
INSERT INTO `tp_mall_goods` VALUES ('343', '5012', 'gpClass', '葱烧蹄筋', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_131.png', '/static/upload/goods/j04_m_131.png', null, '10000', '1498117674', '0');
INSERT INTO `tp_mall_goods` VALUES ('344', '5012', 'gpClass', '锅塌豆腐', '饕餮大餐', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_132.png', '/static/upload/goods/j04_m_132.png', null, '10000', '1498117668', '0');
INSERT INTO `tp_mall_goods` VALUES ('345', '5012', 'gpClass', '黄金丸子', '饕餮大餐', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_133.png', '/static/upload/goods/j04_m_133.png', null, '10000', '1498117668', '0');
INSERT INTO `tp_mall_goods` VALUES ('346', '5012', 'gpClass', '黄焖鸡块', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_134.png', '/static/upload/goods/j04_m_134.png', null, '10000', '1498117674', '0');
INSERT INTO `tp_mall_goods` VALUES ('347', '5012', 'gpClass', '酱焖黄花鱼', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_135.png', '/static/upload/goods/j04_m_135.png', null, '10000', '1498117675', '0');
INSERT INTO `tp_mall_goods` VALUES ('348', '5012', 'gpClass', '酱烧黄花鱼', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_136.png', '/static/upload/goods/j04_m_136.png', null, '10000', '1498117681', '0');
INSERT INTO `tp_mall_goods` VALUES ('349', '5012', 'gpClass', '酱肘子', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_137.png', '/static/upload/goods/j04_m_137.png', null, '10000', '1498117675', '0');
INSERT INTO `tp_mall_goods` VALUES ('350', '5012', 'gpClass', '九转大肠', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_138.png', '/static/upload/goods/j04_m_138.png', null, '10000', '1498117676', '0');
INSERT INTO `tp_mall_goods` VALUES ('351', '5012', 'gpClass', '腊八蒜', '饕餮大餐', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_139.png', '/static/upload/goods/j04_m_139.png', null, '10000', '1498117670', '0');
INSERT INTO `tp_mall_goods` VALUES ('352', '5012', 'gpClass', '宫保鸡丁', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_140.png', '/static/upload/goods/j04_m_140.png', null, '10000', '1498117676', '0');
INSERT INTO `tp_mall_goods` VALUES ('353', '5012', 'gpClass', '蜜汁山药', '饕餮大餐', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_141.png', '/static/upload/goods/j04_m_141.png', null, '10000', '1498117671', '0');
INSERT INTO `tp_mall_goods` VALUES ('354', '5012', 'gpClass', '茄汁大黄鱼', '饕餮大餐', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_142.png', '/static/upload/goods/j04_m_142.png', null, '10000', '1498117680', '0');
INSERT INTO `tp_mall_goods` VALUES ('355', '5012', 'gpClass', '赛螃蟹', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_143.png', '/static/upload/goods/j04_m_143.png', null, '10000', '1498117677', '0');
INSERT INTO `tp_mall_goods` VALUES ('356', '5012', 'gpClass', '水晶肘子', '饕餮大餐', '30', '0', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_144.png', '/static/upload/goods/j04_m_144.png', null, '10000', '1498117678', '0');
INSERT INTO `tp_mall_goods` VALUES ('357', '5012', 'gpClass', '四喜鸭', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_145.png', '/static/upload/goods/j04_m_145.png', null, '10000', '1498117678', '0');
INSERT INTO `tp_mall_goods` VALUES ('358', '5012', 'gpClass', '糖醋鲤鱼', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_146.png', '/static/upload/goods/j04_m_146.png', null, '10000', '1498117679', '0');
INSERT INTO `tp_mall_goods` VALUES ('359', '5012', 'gpClass', '羊肉汤', '饕餮大餐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_147.png', '/static/upload/goods/j04_m_147.png', null, '10000', '1498117680', '0');
INSERT INTO `tp_mall_goods` VALUES ('360', '5012', 'gpClass', '油焖大虾', '饕餮大餐', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_148.png', '/static/upload/goods/j04_m_148.png', null, '10000', '1498117681', '0');
INSERT INTO `tp_mall_goods` VALUES ('361', '5012', 'gpClass', '油焖萝卜干', '饕餮大餐', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_149.png', '/static/upload/goods/j04_m_149.png', null, '10000', '1498117669', '0');
INSERT INTO `tp_mall_goods` VALUES ('362', '5012', 'gpClass', '蒸虾酱', '饕餮大餐', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_150.png', '/static/upload/goods/j04_m_150.png', null, '10000', '1498117671', '0');
INSERT INTO `tp_mall_goods` VALUES ('363', '5012', 'gpClass', '淄博豆腐箱', '饕餮大餐', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_151.png', '/static/upload/goods/j04_m_151.png', null, '10000', '1498117671', '0');
INSERT INTO `tp_mall_goods` VALUES ('364', '5012', 'gpClass', '邹城老虎菜', '饕餮大餐', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_152.png', '/static/upload/goods/j04_m_152.png', null, '10000', '1498117672', '0');
INSERT INTO `tp_mall_goods` VALUES ('365', '5013', 'gpClass', '鲍鱼扒菜心', '八珍玉食', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_153.png', '/static/upload/goods/j04_m_153.png', null, '10000', '1498117686', '0');
INSERT INTO `tp_mall_goods` VALUES ('366', '5013', 'gpClass', '红焖鲍翅', '八珍玉食', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_154.png', '/static/upload/goods/j04_m_154.png', null, '10000', '1498117687', '0');
INSERT INTO `tp_mall_goods` VALUES ('367', '5013', 'gpClass', '红糟焖笋', '八珍玉食', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_155.png', '/static/upload/goods/j04_m_155.png', null, '10000', '1498117682', '0');
INSERT INTO `tp_mall_goods` VALUES ('368', '5013', 'gpClass', '红糟鱼', '八珍玉食', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_156.png', '/static/upload/goods/j04_m_156.png', null, '10000', '1498117683', '0');
INSERT INTO `tp_mall_goods` VALUES ('369', '5013', 'gpClass', '佛跳墙', '八珍玉食', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_157.png', '/static/upload/goods/j04_m_157.png', null, '10000', '1498117687', '0');
INSERT INTO `tp_mall_goods` VALUES ('370', '5013', 'gpClass', '闽南芋头饭', '八珍玉食', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_158.png', '/static/upload/goods/j04_m_158.png', null, '10000', '1498117682', '0');
INSERT INTO `tp_mall_goods` VALUES ('371', '5013', 'gpClass', '闽生果', '八珍玉食', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_159.png', '/static/upload/goods/j04_m_159.png', null, '10000', '1498117683', '0');
INSERT INTO `tp_mall_goods` VALUES ('372', '5013', 'gpClass', '酸菜八爪鱼', '八珍玉食', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_160.png', '/static/upload/goods/j04_m_160.png', null, '10000', '1498117685', '0');
INSERT INTO `tp_mall_goods` VALUES ('373', '5013', 'gpClass', '坛烧肥鸡', '八珍玉食', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_161.png', '/static/upload/goods/j04_m_161.png', null, '10000', '1498117684', '0');
INSERT INTO `tp_mall_goods` VALUES ('374', '5013', 'gpClass', '五香肉卷', '八珍玉食', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_162.png', '/static/upload/goods/j04_m_162.png', null, '10000', '1498117684', '0');
INSERT INTO `tp_mall_goods` VALUES ('375', '5013', 'gpClass', '鱼虾争艳', '八珍玉食', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_163.png', '/static/upload/goods/j04_m_163.png', null, '10000', '1498117685', '0');
INSERT INTO `tp_mall_goods` VALUES ('376', '5014', 'gpClass', '红烧狮子头', '清爽可口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_164.png', '/static/upload/goods/j04_m_164.png', null, '10000', '1498117691', '0');
INSERT INTO `tp_mall_goods` VALUES ('377', '5014', 'gpClass', '鸡头米虾仁', '清爽可口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_165.png', '/static/upload/goods/j04_m_165.png', null, '10000', '1498117691', '0');
INSERT INTO `tp_mall_goods` VALUES ('378', '5014', 'gpClass', '凉拌皮肚', '清爽可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_166.png', '/static/upload/goods/j04_m_166.png', null, '10000', '1498117688', '0');
INSERT INTO `tp_mall_goods` VALUES ('379', '5014', 'gpClass', '龙凤点心', '清爽可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_167.png', '/static/upload/goods/j04_m_167.png', null, '10000', '1498117688', '0');
INSERT INTO `tp_mall_goods` VALUES ('380', '5014', 'gpClass', '焖鱼翅', '清爽可口', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_168.png', '/static/upload/goods/j04_m_168.png', null, '10000', '1498117692', '0');
INSERT INTO `tp_mall_goods` VALUES ('381', '5014', 'gpClass', '阳澄湖大闸蟹', '清爽可口', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_169.png', '/static/upload/goods/j04_m_169.png', null, '10000', '1498117692', '0');
INSERT INTO `tp_mall_goods` VALUES ('382', '5014', 'gpClass', '香菇面筋', '清爽可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_170.png', '/static/upload/goods/j04_m_170.png', null, '10000', '1498117689', '0');
INSERT INTO `tp_mall_goods` VALUES ('383', '5014', 'gpClass', '鸭血粉丝汤', '清爽可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_171.png', '/static/upload/goods/j04_m_171.png', null, '10000', '1498117689', '0');
INSERT INTO `tp_mall_goods` VALUES ('384', '5014', 'gpClass', '腌笃鲜', '清爽可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_172.png', '/static/upload/goods/j04_m_172.png', null, '10000', '1498117690', '0');
INSERT INTO `tp_mall_goods` VALUES ('385', '5014', 'gpClass', '扬州炒饭', '清爽可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_173.png', '/static/upload/goods/j04_m_173.png', null, '10000', '1498117690', '0');
INSERT INTO `tp_mall_goods` VALUES ('386', '5015', 'gpClass', '冰糖湘莲', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_174.png', '/static/upload/goods/j04_m_174.png', null, '10000', '1498117698', '0');
INSERT INTO `tp_mall_goods` VALUES ('387', '5015', 'gpClass', '炒鳝丝', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_175.png', '/static/upload/goods/j04_m_175.png', null, '10000', '1498117703', '0');
INSERT INTO `tp_mall_goods` VALUES ('388', '5015', 'gpClass', '炒芋头丝', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_176.png', '/static/upload/goods/j04_m_176.png', null, '10000', '1498117698', '0');
INSERT INTO `tp_mall_goods` VALUES ('389', '5015', 'gpClass', '闯王山珍煲', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_177.png', '/static/upload/goods/j04_m_177.png', null, '10000', '1498117699', '0');
INSERT INTO `tp_mall_goods` VALUES ('390', '5015', 'gpClass', '剁椒芋头', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_178.png', '/static/upload/goods/j04_m_178.png', null, '10000', '1498117693', '0');
INSERT INTO `tp_mall_goods` VALUES ('391', '5015', 'gpClass', '干煸豆角', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_179.png', '/static/upload/goods/j04_m_179.png', null, '10000', '1498117693', '0');
INSERT INTO `tp_mall_goods` VALUES ('392', '5015', 'gpClass', '干锅茶树菇', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_180.png', '/static/upload/goods/j04_m_180.png', null, '10000', '1498117701', '0');
INSERT INTO `tp_mall_goods` VALUES ('393', '5015', 'gpClass', '干锅花菜', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_181.png', '/static/upload/goods/j04_m_181.png', null, '10000', '1498117701', '0');
INSERT INTO `tp_mall_goods` VALUES ('394', '5015', 'gpClass', '干煵肉丝', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_182.png', '/static/upload/goods/j04_m_182.png', null, '10000', '1498117702', '0');
INSERT INTO `tp_mall_goods` VALUES ('395', '5015', 'gpClass', '红枣甜酒糍粑', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_183.png', '/static/upload/goods/j04_m_183.png', null, '10000', '1498117694', '0');
INSERT INTO `tp_mall_goods` VALUES ('396', '5015', 'gpClass', '湖南圆子粑', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_184.png', '/static/upload/goods/j04_m_184.png', null, '10000', '1498117694', '0');
INSERT INTO `tp_mall_goods` VALUES ('397', '5015', 'gpClass', '椒香鱼头', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_185.png', '/static/upload/goods/j04_m_185.png', null, '10000', '1498117704', '0');
INSERT INTO `tp_mall_goods` VALUES ('398', '5015', 'gpClass', '菊花蛋饺', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_186.png', '/static/upload/goods/j04_m_186.png', null, '10000', '1498117702', '0');
INSERT INTO `tp_mall_goods` VALUES ('399', '5015', 'gpClass', '开胃鱼头', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_187.png', '/static/upload/goods/j04_m_187.png', null, '10000', '1498117704', '0');
INSERT INTO `tp_mall_goods` VALUES ('400', '5015', 'gpClass', '口味茄子煲', '口舌生香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_188.png', '/static/upload/goods/j04_m_188.png', null, '10000', '1498117703', '0');
INSERT INTO `tp_mall_goods` VALUES ('401', '5015', 'gpClass', '腊味合蒸', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_189.png', '/static/upload/goods/j04_m_189.png', null, '10000', '1498117705', '0');
INSERT INTO `tp_mall_goods` VALUES ('402', '5015', 'gpClass', '农家小炒肉', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_190.png', '/static/upload/goods/j04_m_190.png', null, '10000', '1498117705', '0');
INSERT INTO `tp_mall_goods` VALUES ('403', '5015', 'gpClass', '酸辣鸡杂', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_191.png', '/static/upload/goods/j04_m_191.png', null, '10000', '1498117705', '0');
INSERT INTO `tp_mall_goods` VALUES ('404', '5015', 'gpClass', '酸香麻辣东安鸡', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_192.png', '/static/upload/goods/j04_m_192.png', null, '10000', '1498117706', '0');
INSERT INTO `tp_mall_goods` VALUES ('405', '5015', 'gpClass', '香辣米豆腐', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_193.png', '/static/upload/goods/j04_m_193.png', null, '10000', '1498117695', '0');
INSERT INTO `tp_mall_goods` VALUES ('406', '5015', 'gpClass', '香辣唆螺', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_194.png', '/static/upload/goods/j04_m_194.png', null, '10000', '1498117695', '0');
INSERT INTO `tp_mall_goods` VALUES ('407', '5015', 'gpClass', '香芹海米熏干', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_195.png', '/static/upload/goods/j04_m_195.png', null, '10000', '1498117696', '0');
INSERT INTO `tp_mall_goods` VALUES ('408', '5015', 'gpClass', '剁椒鱼头', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_196.png', '/static/upload/goods/j04_m_196.png', null, '10000', '1498117707', '0');
INSERT INTO `tp_mall_goods` VALUES ('409', '5015', 'gpClass', '湘江鲫鱼', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_197.png', '/static/upload/goods/j04_m_197.png', null, '10000', '1498117707', '0');
INSERT INTO `tp_mall_goods` VALUES ('410', '5015', 'gpClass', '湘辣蕨根粉', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_198.png', '/static/upload/goods/j04_m_198.png', null, '10000', '1498117696', '0');
INSERT INTO `tp_mall_goods` VALUES ('411', '5015', 'gpClass', '湘味火焙鱼', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_199.png', '/static/upload/goods/j04_m_199.png', null, '10000', '1498117708', '0');
INSERT INTO `tp_mall_goods` VALUES ('412', '5015', 'gpClass', '油炸臭干子', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_200.png', '/static/upload/goods/j04_m_200.png', null, '10000', '1498117697', '0');
INSERT INTO `tp_mall_goods` VALUES ('413', '5015', 'gpClass', '杂酱莴笋丝', '口舌生香', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_201.png', '/static/upload/goods/j04_m_201.png', null, '10000', '1498117697', '0');
INSERT INTO `tp_mall_goods` VALUES ('414', '5015', 'gpClass', '竹香肉', '口舌生香', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_202.png', '/static/upload/goods/j04_m_202.png', null, '10000', '1498117709', '0');
INSERT INTO `tp_mall_goods` VALUES ('415', '5010', 'gpClass', '菠萝咕咾肉', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_203.png', '/static/upload/goods/j04_m_203.png', null, '10000', '1498117657', '0');
INSERT INTO `tp_mall_goods` VALUES ('416', '5010', 'gpClass', '菜干猪骨汤', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_204.png', '/static/upload/goods/j04_m_204.png', null, '10000', '1498117657', '0');
INSERT INTO `tp_mall_goods` VALUES ('417', '5010', 'gpClass', '陈皮牛肉丸', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_205.png', '/static/upload/goods/j04_m_205.png', null, '10000', '1498117658', '0');
INSERT INTO `tp_mall_goods` VALUES ('418', '5010', 'gpClass', '当归红枣煲鸡脚', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_206.png', '/static/upload/goods/j04_m_206.png', null, '10000', '1498117659', '0');
INSERT INTO `tp_mall_goods` VALUES ('419', '5010', 'gpClass', '番茄蛋牛肉', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_207.png', '/static/upload/goods/j04_m_207.png', null, '10000', '1498117659', '0');
INSERT INTO `tp_mall_goods` VALUES ('420', '5010', 'gpClass', '蚝油西兰花', '玉盘珍馐', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_208.png', '/static/upload/goods/j04_m_208.png', null, '10000', '1498117654', '0');
INSERT INTO `tp_mall_goods` VALUES ('421', '5010', 'gpClass', '虎皮凤爪', '玉盘珍馐', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_209.png', '/static/upload/goods/j04_m_209.png', null, '10000', '1498117656', '0');
INSERT INTO `tp_mall_goods` VALUES ('422', '5010', 'gpClass', '萝卜牛腩煲', '玉盘珍馐', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_210.png', '/static/upload/goods/j04_m_210.png', null, '10000', '1498117662', '0');
INSERT INTO `tp_mall_goods` VALUES ('423', '5010', 'gpClass', '蜜汁叉烧肉', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_211.png', '/static/upload/goods/j04_m_211.png', null, '10000', '1498117660', '0');
INSERT INTO `tp_mall_goods` VALUES ('424', '5010', 'gpClass', '牛肉皮蛋粥', '玉盘珍馐', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_212.png', '/static/upload/goods/j04_m_212.png', null, '10000', '1498117655', '0');
INSERT INTO `tp_mall_goods` VALUES ('425', '5010', 'gpClass', '石榴鸡', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_213.png', '/static/upload/goods/j04_m_213.png', null, '10000', '1498117661', '0');
INSERT INTO `tp_mall_goods` VALUES ('426', '5010', 'gpClass', '太极芋泥', '玉盘珍馐', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_214.png', '/static/upload/goods/j04_m_214.png', null, '10000', '1498117656', '0');
INSERT INTO `tp_mall_goods` VALUES ('427', '5010', 'gpClass', '腰果鸡丁', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_215.png', '/static/upload/goods/j04_m_215.png', null, '10000', '1498117661', '0');
INSERT INTO `tp_mall_goods` VALUES ('428', '5010', 'gpClass', '东江盐焗鸡', '玉盘珍馐', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_216.png', '/static/upload/goods/j04_m_216.png', null, '10000', '1498117661', '0');
INSERT INTO `tp_mall_goods` VALUES ('429', '5016', 'gpClass', '春笋三杯鸡', '质嫩爽口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_217.png', '/static/upload/goods/j04_m_217.png', null, '10000', '1498117710', '0');
INSERT INTO `tp_mall_goods` VALUES ('430', '5016', 'gpClass', '东坡肉', '质嫩爽口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_218.png', '/static/upload/goods/j04_m_218.png', null, '10000', '1498117710', '0');
INSERT INTO `tp_mall_goods` VALUES ('431', '5016', 'gpClass', '荷叶粉蒸肉', '质嫩爽口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_219.png', '/static/upload/goods/j04_m_219.png', null, '10000', '1498117711', '0');
INSERT INTO `tp_mall_goods` VALUES ('432', '5016', 'gpClass', '叫化童鸡', '质嫩爽口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_220.png', '/static/upload/goods/j04_m_220.png', null, '10000', '1498117711', '0');
INSERT INTO `tp_mall_goods` VALUES ('433', '5016', 'gpClass', '清蒸桂鱼', '质嫩爽口', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_221.png', '/static/upload/goods/j04_m_221.png', null, '10000', '1498117713', '0');
INSERT INTO `tp_mall_goods` VALUES ('434', '5016', 'gpClass', '三鲜海参', '质嫩爽口', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_222.png', '/static/upload/goods/j04_m_222.png', null, '10000', '1498117713', '0');
INSERT INTO `tp_mall_goods` VALUES ('435', '5016', 'gpClass', '油焖春笋', '质嫩爽口', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_223.png', '/static/upload/goods/j04_m_223.png', null, '10000', '1498117709', '0');
INSERT INTO `tp_mall_goods` VALUES ('436', '5016', 'gpClass', '油焖虾', '质嫩爽口', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j04_t_224.png', '/static/upload/goods/j04_m_224.png', null, '10000', '1498117714', '0');
INSERT INTO `tp_mall_goods` VALUES ('437', '5016', 'gpClass', '鱼头浓汤', '质嫩爽口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_225.png', '/static/upload/goods/j04_m_225.png', null, '10000', '1498117712', '0');
INSERT INTO `tp_mall_goods` VALUES ('438', '5016', 'gpClass', '龙井虾仁', '质嫩爽口', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j04_t_226.png', '/static/upload/goods/j04_m_226.png', null, '10000', '1498117712', '0');
INSERT INTO `tp_mall_goods` VALUES ('439', '6005', 'h_6005', 'POLO', '出入平安', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_36.png', '/static/upload/goods/j05_m_36.png', null, '10000', '1498117786', '0');
INSERT INTO `tp_mall_goods` VALUES ('440', '6005', 'h_6005', '奥迪', '出入平安', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_37.png', '/static/upload/goods/j05_m_37.png', null, '10000', '1498117789', '0');
INSERT INTO `tp_mall_goods` VALUES ('441', '6005', 'h_6005', '飞机', '出入平安', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_38.png', '/static/upload/goods/j05_m_38.png', null, '10000', '1498117792', '0');
INSERT INTO `tp_mall_goods` VALUES ('442', '6005', 'h_6005', '公交车', '出入平安', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_39.png', '/static/upload/goods/j05_m_39.png', null, '10000', '1498117790', '0');
INSERT INTO `tp_mall_goods` VALUES ('446', '6005', 'h_6005', '黄包车', '出入平安', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_43.png', '/static/upload/goods/j05_m_43.png', null, '10000', '1498117785', '0');
INSERT INTO `tp_mall_goods` VALUES ('447', '6005', 'h_6005', '火车', '出入平安', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_44.png', '/static/upload/goods/j05_m_44.png', null, '10000', '1498117792', '0');
INSERT INTO `tp_mall_goods` VALUES ('448', '6005', 'h_6005', '雷克萨斯跑车', '出入平安', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_45.png', '/static/upload/goods/j05_m_45.png', null, '10000', '1498117793', '0');
INSERT INTO `tp_mall_goods` VALUES ('449', '6005', 'h_6005', '摩托', '出入平安', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_46.png', '/static/upload/goods/j05_m_46.png', null, '10000', '1498117787', '0');
INSERT INTO `tp_mall_goods` VALUES ('453', '6005', 'h_6005', '校车', '出入平安', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_50.png', '/static/upload/goods/j05_m_50.png', null, '10000', '1498117790', '0');
INSERT INTO `tp_mall_goods` VALUES ('454', '6005', 'h_6005', '雅阁', '出入平安', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_51.png', '/static/upload/goods/j05_m_51.png', null, '10000', '1498117791', '0');
INSERT INTO `tp_mall_goods` VALUES ('455', '6005', 'h_6005', '自行车', '出入平安', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_52.png', '/static/upload/goods/j05_m_52.png', null, '10000', '1498117786', '0');
INSERT INTO `tp_mall_goods` VALUES ('458', '6002', 'h_6002', '冬靴', '风度翩翩', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_55.png', '/static/upload/goods/j05_m_55.png', null, '10000', '1498117761', '0');
INSERT INTO `tp_mall_goods` VALUES ('459', '6002', 'h_6002', '短裤', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_56.png', '/static/upload/goods/j05_m_56.png', null, '10000', '1498117749', '0');
INSERT INTO `tp_mall_goods` VALUES ('460', '6002', 'h_6002', '帆布鞋', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_57.png', '/static/upload/goods/j05_m_57.png', null, '10000', '1498117750', '0');
INSERT INTO `tp_mall_goods` VALUES ('461', '6002', 'h_6002', '家居服', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_58.png', '/static/upload/goods/j05_m_58.png', null, '10000', '1498117756', '0');
INSERT INTO `tp_mall_goods` VALUES ('462', '6002', 'h_6002', '凉拖', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_59.png', '/static/upload/goods/j05_m_59.png', null, '10000', '1498117751', '0');
INSERT INTO `tp_mall_goods` VALUES ('463', '6002', 'h_6002', '凉鞋', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_60.png', '/static/upload/goods/j05_m_60.png', null, '10000', '1498117751', '0');
INSERT INTO `tp_mall_goods` VALUES ('464', '6002', 'h_6002', '马甲', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_61.png', '/static/upload/goods/j05_m_61.png', null, '10000', '1498117756', '0');
INSERT INTO `tp_mall_goods` VALUES ('465', '6002', 'h_6002', '棉服', '风度翩翩', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_62.png', '/static/upload/goods/j05_m_62.png', null, '10000', '1498117761', '0');
INSERT INTO `tp_mall_goods` VALUES ('466', '6002', 'h_6002', '棉拖', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_63.png', '/static/upload/goods/j05_m_63.png', null, '10000', '1498117752', '0');
INSERT INTO `tp_mall_goods` VALUES ('467', '6002', 'h_6002', '短t恤', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_64.png', '/static/upload/goods/j05_m_64.png', null, '10000', '1498117752', '0');
INSERT INTO `tp_mall_goods` VALUES ('468', '6002', 'h_6002', '帽子', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_65.png', '/static/upload/goods/j05_m_65.png', null, '10000', '1498117753', '0');
INSERT INTO `tp_mall_goods` VALUES ('469', '6002', 'h_6002', '内裤', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_66.png', '/static/upload/goods/j05_m_66.png', null, '10000', '1498117753', '0');
INSERT INTO `tp_mall_goods` VALUES ('470', '6002', 'h_6002', '内衣', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_67.png', '/static/upload/goods/j05_m_67.png', null, '10000', '1498117754', '0');
INSERT INTO `tp_mall_goods` VALUES ('471', '6002', 'h_6002', '手套', '风度翩翩', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_68.png', '/static/upload/goods/j05_m_68.png', null, '10000', '1498117755', '0');
INSERT INTO `tp_mall_goods` VALUES ('472', '6002', 'h_6002', '运动服', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_69.png', '/static/upload/goods/j05_m_69.png', null, '10000', '1498117757', '0');
INSERT INTO `tp_mall_goods` VALUES ('473', '6002', 'h_6002', '运动鞋', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_70.png', '/static/upload/goods/j05_m_70.png', null, '10000', '1498117758', '0');
INSERT INTO `tp_mall_goods` VALUES ('474', '6002', 'h_6002', '长t恤', '风度翩翩', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_71.png', '/static/upload/goods/j05_m_71.png', null, '10000', '1498117755', '0');
INSERT INTO `tp_mall_goods` VALUES ('475', '6002', 'h_6002', '皮鞋', '风度翩翩', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_72.png', '/static/upload/goods/j05_m_72.png', null, '10000', '1498117762', '0');
INSERT INTO `tp_mall_goods` VALUES ('476', '6002', 'h_6002', '睡衣', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_73.png', '/static/upload/goods/j05_m_73.png', null, '10000', '1498117759', '0');
INSERT INTO `tp_mall_goods` VALUES ('477', '6002', 'h_6002', '外套', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_74.png', '/static/upload/goods/j05_m_74.png', null, '10000', '1498117759', '0');
INSERT INTO `tp_mall_goods` VALUES ('478', '6002', 'h_6002', '西装套装', '风度翩翩', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_75.png', '/static/upload/goods/j05_m_75.png', null, '10000', '1498117762', '0');
INSERT INTO `tp_mall_goods` VALUES ('479', '6002', 'h_6002', '羽绒服', '风度翩翩', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_76.png', '/static/upload/goods/j05_m_76.png', null, '10000', '1498117763', '0');
INSERT INTO `tp_mall_goods` VALUES ('480', '6002', 'h_6002', '长裤', '风度翩翩', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_77.png', '/static/upload/goods/j05_m_77.png', null, '10000', '1498117760', '0');
INSERT INTO `tp_mall_goods` VALUES ('481', '6007', 'h_6007', '茶几', '小巧精致', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_78.png', '/static/upload/goods/j05_m_78.png', null, '10000', '1498117816', '0');
INSERT INTO `tp_mall_goods` VALUES ('482', '6007', 'h_6007', '近视眼镜', '小巧精致', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_79.png', '/static/upload/goods/j05_m_79.png', null, '10000', '1498117817', '0');
INSERT INTO `tp_mall_goods` VALUES ('483', '6007', 'h_6007', '卡通熊', '小巧精致', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_80.png', '/static/upload/goods/j05_m_80.png', null, '10000', '1498117813', '0');
INSERT INTO `tp_mall_goods` VALUES ('484', '6007', 'h_6007', '老花眼镜', '小巧精致', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_81.png', '/static/upload/goods/j05_m_81.png', null, '10000', '1498117817', '0');
INSERT INTO `tp_mall_goods` VALUES ('485', '6007', 'h_6007', '凉席', '精美绝伦', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_82.png', '/static/upload/goods/j05_m_82.png', null, '10000', '1498117813', '0');
INSERT INTO `tp_mall_goods` VALUES ('486', '6007', 'h_6007', '棉被', '精美绝伦', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_83.png', '/static/upload/goods/j05_m_83.png', null, '10000', '1498117818', '0');
INSERT INTO `tp_mall_goods` VALUES ('487', '6007', 'h_6007', '墨镜', '小巧精致', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_84.png', '/static/upload/goods/j05_m_84.png', null, '10000', '1498117818', '0');
INSERT INTO `tp_mall_goods` VALUES ('488', '6007', 'h_6007', '男手表', '小巧精致', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_85.png', '/static/upload/goods/j05_m_85.png', null, '10000', '1498117820', '0');
INSERT INTO `tp_mall_goods` VALUES ('489', '6007', 'h_6007', '暖手袋', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_86.png', '/static/upload/goods/j05_m_86.png', null, '10000', '1498117808', '0');
INSERT INTO `tp_mall_goods` VALUES ('490', '6007', 'h_6007', '女手表', '小巧精致', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_87.png', '/static/upload/goods/j05_m_87.png', null, '10000', '1498117821', '0');
INSERT INTO `tp_mall_goods` VALUES ('491', '6007', 'h_6007', '普通枕头', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_88.png', '/static/upload/goods/j05_m_88.png', null, '10000', '1498117809', '0');
INSERT INTO `tp_mall_goods` VALUES ('492', '6007', 'h_6007', '扇子', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_89.png', '/static/upload/goods/j05_m_89.png', null, '10000', '1498117810', '0');
INSERT INTO `tp_mall_goods` VALUES ('493', '6007', 'h_6007', '手镯', '小巧精致', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_90.png', '/static/upload/goods/j05_m_90.png', null, '10000', '1498117814', '0');
INSERT INTO `tp_mall_goods` VALUES ('494', '6007', 'h_6007', '水晶手链', '小巧精致', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_91.png', '/static/upload/goods/j05_m_91.png', null, '10000', '1498117819', '0');
INSERT INTO `tp_mall_goods` VALUES ('495', '6007', 'h_6007', '四件套', '精美绝伦', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_92.png', '/static/upload/goods/j05_m_92.png', null, '10000', '1498117820', '0');
INSERT INTO `tp_mall_goods` VALUES ('496', '6007', 'h_6007', '太阳伞', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_93.png', '/static/upload/goods/j05_m_93.png', null, '10000', '1498117811', '0');
INSERT INTO `tp_mall_goods` VALUES ('501', '6007', 'h_6007', '羊绒被', '精美绝伦', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_98.png', '/static/upload/goods/j05_m_98.png', null, '10000', '1498117821', '0');
INSERT INTO `tp_mall_goods` VALUES ('503', '6007', 'h_6007', '摇摇椅', '小巧精致', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_100.png', '/static/upload/goods/j05_m_100.png', null, '10000', '1498117822', '0');
INSERT INTO `tp_mall_goods` VALUES ('504', '6007', 'h_6007', '椅子', '小巧精致', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_101.png', '/static/upload/goods/j05_m_101.png', null, '10000', '1498117816', '0');
INSERT INTO `tp_mall_goods` VALUES ('505', '6007', 'h_6007', '雨伞', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_102.png', '/static/upload/goods/j05_m_102.png', null, '10000', '1498117811', '0');
INSERT INTO `tp_mall_goods` VALUES ('507', '6007', 'h_6007', '玉坠', '小巧精致', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_104.png', '/static/upload/goods/j05_m_104.png', null, '10000', '1498117822', '0');
INSERT INTO `tp_mall_goods` VALUES ('508', '6007', 'h_6007', '折扇', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_105.png', '/static/upload/goods/j05_m_105.png', null, '10000', '1498117812', '0');
INSERT INTO `tp_mall_goods` VALUES ('509', '6007', 'h_6007', '钻戒', '小巧精致', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_106.png', '/static/upload/goods/j05_m_106.png', null, '10000', '1498117823', '0');
INSERT INTO `tp_mall_goods` VALUES ('510', '6007', 'h_6007', '组合茶几', '小巧精致', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_107.png', '/static/upload/goods/j05_m_107.png', null, '10000', '1498117822', '0');
INSERT INTO `tp_mall_goods` VALUES ('511', '6008', 'h_6008', '按摩椅', '悠闲自在', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_108.png', '/static/upload/goods/j05_m_108.png', null, '10000', '1498117827', '0');
INSERT INTO `tp_mall_goods` VALUES ('512', '6008', 'h_6008', '报纸', '悠闲自在', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_109.png', '/static/upload/goods/j05_m_109.png', null, '10000', '1498117824', '0');
INSERT INTO `tp_mall_goods` VALUES ('513', '6008', 'h_6008', '钓鱼竿', '悠闲自在', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_110.png', '/static/upload/goods/j05_m_110.png', null, '10000', '1498117826', '0');
INSERT INTO `tp_mall_goods` VALUES ('515', '6008', 'h_6008', '健身器材', '悠闲自在', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_112.png', '/static/upload/goods/j05_m_112.png', null, '10000', '1498117828', '0');
INSERT INTO `tp_mall_goods` VALUES ('518', '6008', 'h_6008', '抗战影碟', '悠闲自在', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_115.png', '/static/upload/goods/j05_m_115.png', null, '10000', '1498117825', '0');
INSERT INTO `tp_mall_goods` VALUES ('521', '6008', 'h_6008', '跑步机', '悠闲自在', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_118.png', '/static/upload/goods/j05_m_118.png', null, '10000', '1498117828', '0');
INSERT INTO `tp_mall_goods` VALUES ('522', '6008', 'h_6008', '象棋', '悠闲自在', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_119.png', '/static/upload/goods/j05_m_119.png', null, '10000', '1498117824', '0');
INSERT INTO `tp_mall_goods` VALUES ('523', '6008', 'h_6008', '小提琴', '悠闲自在', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_120.png', '/static/upload/goods/j05_m_120.png', null, '10000', '1498117829', '0');
INSERT INTO `tp_mall_goods` VALUES ('524', '6008', 'h_6008', '羽毛球', '悠闲自在', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_121.png', '/static/upload/goods/j05_m_121.png', null, '10000', '1498117826', '0');
INSERT INTO `tp_mall_goods` VALUES ('525', '6008', 'h_6008', '桌球', '悠闲自在', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_122.png', '/static/upload/goods/j05_m_122.png', null, '10000', '1498117829', '0');
INSERT INTO `tp_mall_goods` VALUES ('526', '6010', 'h_6010', '狗', '活泼可爱', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_123.png', '/static/upload/goods/j05_m_123.png', null, '10000', '1498117840', '0');
INSERT INTO `tp_mall_goods` VALUES ('527', '6010', 'h_6010', '狗', '活泼可爱', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_124.png', '/static/upload/goods/j05_m_124.png', null, '10000', '1498117840', '0');
INSERT INTO `tp_mall_goods` VALUES ('528', '6010', 'h_6010', '狗', '活泼可爱', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_125.png', '/static/upload/goods/j05_m_125.png', null, '10000', '1498117841', '0');
INSERT INTO `tp_mall_goods` VALUES ('529', '6010', 'h_6010', '猫', '活泼可爱', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_126.png', '/static/upload/goods/j05_m_126.png', null, '10000', '1498117837', '0');
INSERT INTO `tp_mall_goods` VALUES ('531', '6010', 'h_6010', '鹦鹉', '活泼可爱', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_128.png', '/static/upload/goods/j05_m_128.png', null, '10000', '1498117838', '0');
INSERT INTO `tp_mall_goods` VALUES ('532', '6010', 'h_6010', '长耳兔', '活泼可爱', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_129.png', '/static/upload/goods/j05_m_129.png', null, '10000', '1498117839', '0');
INSERT INTO `tp_mall_goods` VALUES ('533', '6006', 'h_6006', 'DV', '科技生活', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_130.png', '/static/upload/goods/j05_m_130.png', null, '10000', '1498117803', '0');
INSERT INTO `tp_mall_goods` VALUES ('536', '6006', 'h_6006', 'DVD', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_133.png', '/static/upload/goods/j05_m_133.png', null, '10000', '1498117794', '0');
INSERT INTO `tp_mall_goods` VALUES ('539', '6006', 'h_6006', '冰箱', '科技生活', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_136.png', '/static/upload/goods/j05_m_136.png', null, '10000', '1498117803', '0');
INSERT INTO `tp_mall_goods` VALUES ('541', '6006', 'h_6006', '打印机', '科技生活', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_138.png', '/static/upload/goods/j05_m_138.png', null, '10000', '1498117799', '0');
INSERT INTO `tp_mall_goods` VALUES ('542', '6006', 'h_6006', '电吹风', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_139.png', '/static/upload/goods/j05_m_139.png', null, '10000', '1498117794', '0');
INSERT INTO `tp_mall_goods` VALUES ('544', '6006', 'h_6006', '电磁炉', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_141.png', '/static/upload/goods/j05_m_141.png', null, '10000', '1498117795', '0');
INSERT INTO `tp_mall_goods` VALUES ('546', '6006', 'h_6006', '电动轮椅', '科技生活', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_143.png', '/static/upload/goods/j05_m_143.png', null, '10000', '1498117804', '0');
INSERT INTO `tp_mall_goods` VALUES ('547', '6006', 'h_6006', '电饭煲', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_144.png', '/static/upload/goods/j05_m_144.png', null, '10000', '1498117795', '0');
INSERT INTO `tp_mall_goods` VALUES ('548', '6006', 'h_6006', '电风扇', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_145.png', '/static/upload/goods/j05_m_145.png', null, '10000', '1498117796', '0');
INSERT INTO `tp_mall_goods` VALUES ('550', '6006', 'h_6006', '电话', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_147.png', '/static/upload/goods/j05_m_147.png', null, '10000', '1498117796', '0');
INSERT INTO `tp_mall_goods` VALUES ('555', '6006', 'h_6006', '豆浆机', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_152.png', '/static/upload/goods/j05_m_152.png', null, '10000', '1498117797', '0');
INSERT INTO `tp_mall_goods` VALUES ('556', '6006', 'h_6006', '空调', '科技生活', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_153.png', '/static/upload/goods/j05_m_153.png', null, '10000', '1498117807', '0');
INSERT INTO `tp_mall_goods` VALUES ('557', '6006', 'h_6006', '空调', '科技生活', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_154.png', '/static/upload/goods/j05_m_154.png', null, '10000', '1498117804', '0');
INSERT INTO `tp_mall_goods` VALUES ('558', '6006', 'h_6006', '收音机', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_155.png', '/static/upload/goods/j05_m_155.png', null, '10000', '1498117798', '0');
INSERT INTO `tp_mall_goods` VALUES ('561', '6006', 'h_6006', '剃须刀', '科技生活', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_158.png', '/static/upload/goods/j05_m_158.png', null, '10000', '1498117798', '0');
INSERT INTO `tp_mall_goods` VALUES ('565', '6006', 'h_6006', '音响', '科技生活', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_162.png', '/static/upload/goods/j05_m_162.png', null, '10000', '1498117800', '0');
INSERT INTO `tp_mall_goods` VALUES ('566', '6009', 'h_6009', '女童连衣裙', '亭亭玉立', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_163.png', '/static/upload/goods/j05_m_163.png', null, '10000', '1498117833', '0');
INSERT INTO `tp_mall_goods` VALUES ('567', '6009', 'h_6009', '女童凉鞋', '亭亭玉立', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_164.png', '/static/upload/goods/j05_m_164.png', null, '10000', '1498117830', '0');
INSERT INTO `tp_mall_goods` VALUES ('568', '6009', 'h_6009', '女童棉背心', '亭亭玉立', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_165.png', '/static/upload/goods/j05_m_165.png', null, '10000', '1498117834', '0');
INSERT INTO `tp_mall_goods` VALUES ('569', '6009', 'h_6009', '女童棉衣', '亭亭玉立', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_166.png', '/static/upload/goods/j05_m_166.png', null, '10000', '1498117836', '0');
INSERT INTO `tp_mall_goods` VALUES ('570', '6009', 'h_6009', '书包', '亭亭玉立', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_167.png', '/static/upload/goods/j05_m_167.png', null, '10000', '1498117831', '0');
INSERT INTO `tp_mall_goods` VALUES ('571', '6009', 'h_6009', '外套', '亭亭玉立', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_168.png', '/static/upload/goods/j05_m_168.png', null, '10000', '1498117834', '0');
INSERT INTO `tp_mall_goods` VALUES ('572', '6009', 'h_6009', '长裤', '亭亭玉立', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_169.png', '/static/upload/goods/j05_m_169.png', null, '10000', '1498117835', '0');
INSERT INTO `tp_mall_goods` VALUES ('573', '6011', 'h_6011', '莲花', '大爱无疆', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_170.png', '/static/upload/goods/j05_m_170.png', null, '10000', '1498117843', '0');
INSERT INTO `tp_mall_goods` VALUES ('574', '7001', 'h_7001', '药师经', '解救苦难', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_12.png', '/static/upload/goods/j09_m_12.png', null, '10000', '1498117875', '0');
INSERT INTO `tp_mall_goods` VALUES ('575', '7001', 'h_7001', '观音普门品', '普渡众生', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j09_t_13.png', '/static/upload/goods/j09_m_13.png', null, '10000', '1498117875', '0');
INSERT INTO `tp_mall_goods` VALUES ('576', '6004', 'h_6004', '城堡', '安居乐业', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_171.png', '/static/upload/goods/j05_m_171.png', null, '10000', '1498117783', '0');
INSERT INTO `tp_mall_goods` VALUES ('577', '6004', 'h_6004', '农庄', '安居乐业', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_172.png', '/static/upload/goods/j05_m_172.png', null, '10000', '1498117784', '0');
INSERT INTO `tp_mall_goods` VALUES ('578', '6004', 'h_6004', '双层洋楼', '安居乐业', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_173.png', '/static/upload/goods/j05_m_173.png', null, '10000', '1498117781', '0');
INSERT INTO `tp_mall_goods` VALUES ('579', '6004', 'h_6004', '三层洋楼', '安居乐业', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_174.png', '/static/upload/goods/j05_m_174.png', null, '10000', '1498117782', '0');
INSERT INTO `tp_mall_goods` VALUES ('580', '6004', 'h_6004', '庭院别墅', '安居乐业', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_175.png', '/static/upload/goods/j05_m_175.png', null, '10000', '1498117784', '0');
INSERT INTO `tp_mall_goods` VALUES ('581', '6003', 'h_6003', '短T恤', '锦衣华服', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_176.png', '/static/upload/goods/j05_m_176.png', null, '10000', '1498117764', '0');
INSERT INTO `tp_mall_goods` VALUES ('582', '6003', 'h_6003', '短裤', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_177.png', '/static/upload/goods/j05_m_177.png', null, '10000', '1498117769', '0');
INSERT INTO `tp_mall_goods` VALUES ('583', '6003', 'h_6003', '短裙', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_178.png', '/static/upload/goods/j05_m_178.png', null, '10000', '1498117770', '0');
INSERT INTO `tp_mall_goods` VALUES ('584', '6003', 'h_6003', '短靴', '锦衣华服', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_179.png', '/static/upload/goods/j05_m_179.png', null, '10000', '1498117773', '0');
INSERT INTO `tp_mall_goods` VALUES ('585', '6003', 'h_6003', '高跟凉鞋', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_180.png', '/static/upload/goods/j05_m_180.png', null, '10000', '1498117770', '0');
INSERT INTO `tp_mall_goods` VALUES ('586', '6003', 'h_6003', '过膝靴', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_181.png', '/static/upload/goods/j05_m_181.png', null, '10000', '1498117775', '0');
INSERT INTO `tp_mall_goods` VALUES ('587', '6003', 'h_6003', '连衣裙', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_182.png', '/static/upload/goods/j05_m_182.png', null, '10000', '1498117775', '0');
INSERT INTO `tp_mall_goods` VALUES ('588', '6003', 'h_6003', '帽子', '锦衣华服', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_183.png', '/static/upload/goods/j05_m_183.png', null, '10000', '1498117765', '0');
INSERT INTO `tp_mall_goods` VALUES ('589', '6003', 'h_6003', '呢子大衣', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_184.png', '/static/upload/goods/j05_m_184.png', null, '10000', '1498117776', '0');
INSERT INTO `tp_mall_goods` VALUES ('590', '6003', 'h_6003', '内裤', '锦衣华服', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_185.png', '/static/upload/goods/j05_m_185.png', null, '10000', '1498117766', '0');
INSERT INTO `tp_mall_goods` VALUES ('591', '6003', 'h_6003', '内衣', '锦衣华服', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_186.png', '/static/upload/goods/j05_m_186.png', null, '10000', '1498117766', '0');
INSERT INTO `tp_mall_goods` VALUES ('592', '6003', 'h_6003', '披肩', '锦衣华服', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_187.png', '/static/upload/goods/j05_m_187.png', null, '10000', '1498117767', '0');
INSERT INTO `tp_mall_goods` VALUES ('593', '6003', 'h_6003', '皮草', '锦衣华服', '600', '60', '60', '6', '1', '0', '0', '/static/upload/goods/j05_t_188.png', '/static/upload/goods/j05_m_188.png', null, '10000', '1498117781', '0');
INSERT INTO `tp_mall_goods` VALUES ('594', '6003', 'h_6003', '水晶鞋', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_189.png', '/static/upload/goods/j05_m_189.png', null, '10000', '1498117776', '0');
INSERT INTO `tp_mall_goods` VALUES ('595', '6003', 'h_6003', '运动套装', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_194.png', '/static/upload/goods/j05_m_194.png', null, '10000', '1498117777', '0');
INSERT INTO `tp_mall_goods` VALUES ('596', '6003', 'h_6003', '围巾', '锦衣华服', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_190.png', '/static/upload/goods/j05_m_190.png', null, '10000', '1498117768', '0');
INSERT INTO `tp_mall_goods` VALUES ('597', '6003', 'h_6003', '雪地靴', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_191.png', '/static/upload/goods/j05_m_191.png', null, '10000', '1498117778', '0');
INSERT INTO `tp_mall_goods` VALUES ('598', '6003', 'h_6003', '鱼嘴凉鞋', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_192.png', '/static/upload/goods/j05_m_192.png', null, '10000', '1498117771', '0');
INSERT INTO `tp_mall_goods` VALUES ('599', '6003', 'h_6003', '鱼嘴鞋', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_193.png', '/static/upload/goods/j05_m_193.png', null, '10000', '1498117772', '0');
INSERT INTO `tp_mall_goods` VALUES ('600', '6003', 'h_6003', '运动套装秋', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_195.png', '/static/upload/goods/j05_m_195.png', null, '10000', '1498117778', '0');
INSERT INTO `tp_mall_goods` VALUES ('601', '6003', 'h_6003', '运动套装夏', '锦衣华服', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_196.png', '/static/upload/goods/j05_m_196.png', null, '10000', '1498117774', '0');
INSERT INTO `tp_mall_goods` VALUES ('602', '6003', 'h_6003', '窄脚裤', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_197.png', '/static/upload/goods/j05_m_197.png', null, '10000', '1498117772', '0');
INSERT INTO `tp_mall_goods` VALUES ('603', '6003', 'h_6003', '长牛仔裤', '锦衣华服', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_198.png', '/static/upload/goods/j05_m_198.png', null, '10000', '1498117773', '0');
INSERT INTO `tp_mall_goods` VALUES ('604', '6003', 'h_6003', '长袖T恤', '锦衣华服', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_199.png', '/static/upload/goods/j05_m_199.png', null, '10000', '1498117768', '0');
INSERT INTO `tp_mall_goods` VALUES ('605', '6003', 'h_6003', '长靴', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_200.png', '/static/upload/goods/j05_m_200.png', null, '10000', '1498117779', '0');
INSERT INTO `tp_mall_goods` VALUES ('606', '6003', 'h_6003', '中筒靴', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_201.png', '/static/upload/goods/j05_m_201.png', null, '10000', '1498117779', '0');
INSERT INTO `tp_mall_goods` VALUES ('607', '6003', 'h_6003', '中筒雪地靴', '锦衣华服', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_202.png', '/static/upload/goods/j05_m_202.png', null, '10000', '1498117780', '0');
INSERT INTO `tp_mall_goods` VALUES ('608', '5008', 'gpClass', '白开水', '清澈可口', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_30.png', '/static/upload/goods/j05_m_30.png', null, '10000', '1498117645', '0');
INSERT INTO `tp_mall_goods` VALUES ('609', '5008', 'gpClass', '冰水', '清澈可口', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_31.png', '/static/upload/goods/j05_m_31.png', null, '10000', '1498117645', '0');
INSERT INTO `tp_mall_goods` VALUES ('610', '5008', 'gpClass', '热水', '清澈可口', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_33.png', '/static/upload/goods/j05_m_33.png', null, '10000', '1498117646', '0');
INSERT INTO `tp_mall_goods` VALUES ('611', '5008', 'gpClass', '矿泉水', '清澈可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_32.png', '/static/upload/goods/j05_m_32.png', null, '10000', '1498117646', '0');
INSERT INTO `tp_mall_goods` VALUES ('612', '5008', 'gpClass', '苏打水', '清澈可口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_34.png', '/static/upload/goods/j05_m_34.png', null, '10000', '1498117646', '0');
INSERT INTO `tp_mall_goods` VALUES ('613', '6001', 'h_6001', '千万冥币', '家财万贯', '1000', '100', '100', '6', '1', '0', '0', '/static/upload/goods/j05_t_203.png', '/static/upload/goods/j05_m_203.png', null, '10000', '1498117749', '0');
INSERT INTO `tp_mall_goods` VALUES ('741', '5002', 'gpClass', '白牡丹茶', '醇厚清甜', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_50.png', '/static/upload/goods/j05_m_50.png', null, '10000', '1498117606', '0');
INSERT INTO `tp_mall_goods` VALUES ('742', '5001', 'gpClass', '泸州老窖陶然天成', '真心真意', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_35.png', '/static/upload/goods/j05_m_35.png', null, '10000', '1498117602', '0');
INSERT INTO `tp_mall_goods` VALUES ('743', '5001', 'gpClass', '剑南春15年(蓝)', '回味悠长', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_36.png', '/static/upload/goods/j05_m_36.png', null, '10000', '1498117603', '0');
INSERT INTO `tp_mall_goods` VALUES ('744', '5001', 'gpClass', '伊力特伊力王酒', '琼浆玉液', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_37.png', '/static/upload/goods/j05_m_37.png', null, '10000', '1498117599', '0');
INSERT INTO `tp_mall_goods` VALUES ('745', '5001', 'gpClass', '水井坊井台装', '嘉肴旨酒', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_38.png', '/static/upload/goods/j05_m_38.png', null, '10000', '1498117600', '0');
INSERT INTO `tp_mall_goods` VALUES ('746', '5001', 'gpClass', '郎酒10年红花郎', '金波玉液', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_39.png', '/static/upload/goods/j05_m_39.png', null, '10000', '1498117595', '0');
INSERT INTO `tp_mall_goods` VALUES ('747', '5001', 'gpClass', '二十青花瓷汾酒', '金浆玉醴', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_40.png', '/static/upload/goods/j05_m_40.png', null, '10000', '1498117596', '0');
INSERT INTO `tp_mall_goods` VALUES ('748', '5001', 'gpClass', '汾酒竹叶青', '酒香沁脾', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_41.png', '/static/upload/goods/j05_m_41.png', null, '10000', '1498117594', '0');
INSERT INTO `tp_mall_goods` VALUES ('749', '5001', 'gpClass', '洋河海之蓝', '芬香淑郁', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_42.png', '/static/upload/goods/j05_m_42.png', null, '10000', '1498117594', '0');
INSERT INTO `tp_mall_goods` VALUES ('750', '5001', 'gpClass', 'MACALLAN麦卡伦1700', '瑶池玉液', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_43.png', '/static/upload/goods/j05_m_43.png', null, '10000', '1498117603', '0');
INSERT INTO `tp_mall_goods` VALUES ('751', '5001', 'gpClass', 'MARTELL白兰地', '金波碧液', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_44.png', '/static/upload/goods/j05_m_44.png', null, '10000', '1498117600', '0');
INSERT INTO `tp_mall_goods` VALUES ('752', '5001', 'gpClass', '拉图嘉利传承干红-2009', '桂酒椒浆', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_45.png', '/static/upload/goods/j05_m_45.png', null, '10000', '1498117601', '0');
INSERT INTO `tp_mall_goods` VALUES ('753', '5001', 'gpClass', '葛理仕干红', '葡萄美酒', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_46.png', '/static/upload/goods/j05_m_46.png', null, '10000', '1498117596', '0');
INSERT INTO `tp_mall_goods` VALUES ('754', '5001', 'gpClass', '纯生啤酒', '玉液金浆', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_47.png', '/static/upload/goods/j05_m_47.png', null, '10000', '1498117593', '0');
INSERT INTO `tp_mall_goods` VALUES ('755', '5002', 'gpClass', '祁红', '纯朴浓厚', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_48.png', '/static/upload/goods/j05_t_48.png', null, '10000', '1498117606', '0');
INSERT INTO `tp_mall_goods` VALUES ('756', '5002', 'gpClass', '君山银针茶', '香气清鲜', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_49.png', '/static/upload/goods/j05_m_49.png', null, '10000', '1498117606', '0');
INSERT INTO `tp_mall_goods` VALUES ('757', '5001', 'gpClass', '雪茄', '悠然自得', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_51.png', '/static/upload/goods/j05_m_51.png', null, '10000', '1498117604', '0');
INSERT INTO `tp_mall_goods` VALUES ('758', '5001', 'gpClass', '黄鹤楼', '悠然自得', '300', '30', '30', '6', '1', '0', '0', '/static/upload/goods/j05_t_52.png', '/static/upload/goods/j05_m_52.png', null, '10000', '1498117604', '0');
INSERT INTO `tp_mall_goods` VALUES ('759', '5001', 'gpClass', '中华烟', '悠然自得', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_53.png', '/static/upload/goods/j05_m_53.png', null, '10000', '1498117601', '0');
INSERT INTO `tp_mall_goods` VALUES ('760', '5001', 'gpClass', '蓝芙蓉王', '悠然自得', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_54.png', '/static/upload/goods/j05_m_54.png', null, '10000', '1498117602', '0');
INSERT INTO `tp_mall_goods` VALUES ('761', '5001', 'gpClass', '芙蓉王', '悠然自得', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_55.png', '/static/upload/goods/j05_m_55.png', null, '10000', '1498117597', '0');
INSERT INTO `tp_mall_goods` VALUES ('762', '5001', 'gpClass', '玉溪', '悠然自得', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_56.png', '/static/upload/goods/j05_m_56.png', null, '10000', '1498117598', '0');
INSERT INTO `tp_mall_goods` VALUES ('763', '5001', 'gpClass', '小熊猫', '悠然自得', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_57.png', '/static/upload/goods/j05_m_57.png', null, '10000', '1498117598', '0');
INSERT INTO `tp_mall_goods` VALUES ('764', '5001', 'gpClass', '精白沙', '悠然自得', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_58.png', '/static/upload/goods/j05_m_58.png', null, '10000', '1498117594', '0');
INSERT INTO `tp_mall_goods` VALUES ('765', '5001', 'gpClass', '双喜好日子', '悠然自得', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_59.png', '/static/upload/goods/j05_m_59.png', null, '10000', '1498117595', '0');
INSERT INTO `tp_mall_goods` VALUES ('766', '5003', 'gpClass', '冬瓜', '入口即化', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_227.png', '/static/upload/goods/j04_m_227.png', null, '10000', '1498117609', '0');
INSERT INTO `tp_mall_goods` VALUES ('767', '5003', 'gpClass', '花菜', '清脆爽口', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_228.png', '/static/upload/goods/j04_m_228.png', null, '10000', '1498117611', '0');
INSERT INTO `tp_mall_goods` VALUES ('768', '5003', 'gpClass', '苦瓜', '清热祛暑', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_229.png', '/static/upload/goods/j04_m_229.png', null, '10000', '1498117609', '0');
INSERT INTO `tp_mall_goods` VALUES ('769', '5003', 'gpClass', '茄子豆角', '香鲜至极', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_230.png', '/static/upload/goods/j04_m_230.png', null, '10000', '1498117610', '0');
INSERT INTO `tp_mall_goods` VALUES ('770', '5003', 'gpClass', '西葫芦', '香嫩爽滑', '10', '6', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_231.png', '/static/upload/goods/j04_m_231.png', null, '10000', '1498117610', '0');
INSERT INTO `tp_mall_goods` VALUES ('771', '5003', 'gpClass', '山药', '香甜细腻', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_232.png', '/static/upload/goods/j04_m_232.png', null, '10000', '1498117612', '0');
INSERT INTO `tp_mall_goods` VALUES ('772', '5003', 'gpClass', '素炒藕尖', '齿颊留香', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_233.png', '/static/upload/goods/j04_m_233.png', null, '10000', '1498117612', '0');
INSERT INTO `tp_mall_goods` VALUES ('773', '5003', 'gpClass', '素炒三丁', '食指大动', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_234.png', '/static/upload/goods/j04_m_234.png', null, '10000', '1498117611', '0');
INSERT INTO `tp_mall_goods` VALUES ('774', '5003', 'gpClass', '小白菜', '脆嫩可口', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j04_t_235.png', '/static/upload/goods/j04_m_235.png', null, '10000', '1498117611', '0');
INSERT INTO `tp_mall_goods` VALUES ('775', '6009', 'h_6009', '男童套装', '锦衣华服', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_210.png', '/static/upload/goods/j05_m_210.png', null, '10000', '1498117836', '0');
INSERT INTO `tp_mall_goods` VALUES ('776', '6009', 'h_6009', '男童棉衣', '锦衣华服', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_211.png', '/static/upload/goods/j05_m_211.png', null, '10000', '1498117837', '0');
INSERT INTO `tp_mall_goods` VALUES ('777', '6009', 'h_6009', '女童布鞋', '锦衣华服', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_212.png', '/static/upload/goods/j05_m_212.png', null, '10000', '1498117831', '0');
INSERT INTO `tp_mall_goods` VALUES ('778', '6009', 'h_6009', '男童布鞋', '锦衣华服', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_213.png', '/static/upload/goods/j05_m_213.png', null, '10000', '1498117832', '0');
INSERT INTO `tp_mall_goods` VALUES ('779', '6009', 'h_6009', '男童凉鞋', '锦衣华服', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j05_t_214.png', '/static/upload/goods/j05_m_214.png', null, '10000', '1498117833', '0');
INSERT INTO `tp_mall_goods` VALUES ('780', '6003', 'h_6003', '拖鞋', '清凉舒适', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_215.png', '/static/upload/goods/j05_m_215.png', null, '10000', '1498117764', '0');
INSERT INTO `tp_mall_goods` VALUES ('782', '6008', 'h_6008', '麻将套装', '悠闲自在', '150', '15', '15', '6', '1', '0', '0', '/static/upload/goods/j05_t_216.png', '/static/upload/goods/j05_m_216.png', null, '10000', '1498117827', '0');
INSERT INTO `tp_mall_goods` VALUES ('783', '6007', 'h_6007', '毛巾', '小巧精致', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_231.png', '/static/upload/goods/j05_m_231.png', null, '10000', '1498117815', '0');
INSERT INTO `tp_mall_goods` VALUES ('784', '6007', 'h_6007', '洗簌套装', '小巧精致', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j05_t_232.png', '/static/upload/goods/j05_t_232.png', null, '10000', '1498117814', '0');
INSERT INTO `tp_mall_goods` VALUES ('785', '6007', 'h_6007', '纸巾', '小巧精致', '10', '1', '1', '6', '1', '0', '0', '/static/upload/goods/j05_t_233.png', '/static/upload/goods/j05_m_233.png', null, '10000', '1498117807', '0');
INSERT INTO `tp_mall_goods` VALUES ('786', '6007', 'h_6007', '碗筷', '小巧精致', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j05_t_234.png', '/static/upload/goods/j05_m_234.png', null, '10000', '1498117809', '0');
INSERT INTO `tp_mall_goods` VALUES ('787', '3004', 'gpClass', '紫罗兰', '怀念', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j03_t_16.png', '/static/upload/goods/j03_m_16.png', null, '10000', '1498117569', '0');
INSERT INTO `tp_mall_goods` VALUES ('788', '3004', 'gpClass', '思念款款', '缕缕不舍', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j03_t_19.png', '/static/upload/goods/j03_m_19.png', null, '10000', '1498117569', '0');
INSERT INTO `tp_mall_goods` VALUES ('789', '3004', 'gpClass', '菊', '哀思', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j03_t_17.png', '/static/upload/goods/j03_m_17.png', null, '10000', '1498117567', '0');
INSERT INTO `tp_mall_goods` VALUES ('790', '3004', 'gpClass', '扶郎', '思念如潮', '30', '3', '3', '6', '1', '0', '0', '/static/upload/goods/j03_t_18.png', '/static/upload/goods/j03_m_18.png', null, '10000', '1498117567', '0');
INSERT INTO `tp_mall_goods` VALUES ('802', '5009', 'gpClass', '水煮牛蛙', '麻辣鲜香', '60', '6', '6', '6', '1', '0', '0', '/static/upload/goods/j04_t_236.png', '/static/upload/goods/j04_m_236.png', null, '10000', '1498117649', '0');
INSERT INTO `tp_mall_goods` VALUES ('820', '5012', 'gpClass', '腊八粥', '合聚万物', '20', '2', '2', '6', '1', '0', '0', '/static/upload/goods/j04_t_237.png', '/static/upload/goods/j04_m_237.png', null, '10000', '1498117670', '0');

-- ----------------------------
-- Table structure for tp_mall_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_mall_goods_category`;
CREATE TABLE `tp_mall_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类索引id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类父id 0 顶级分类',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `summary` text COMMENT '分类简介',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7003 DEFAULT CHARSET=utf8 COMMENT='andy - 祭祀商品分类表';

-- ----------------------------
-- Records of tp_mall_goods_category
-- ----------------------------
INSERT INTO `tp_mall_goods_category` VALUES ('11', '0', '行礼', '', '4', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('12', '0', '供品', '', '3', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('13', '0', '火供', '', '2', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('14', '0', '法事', '', '1', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('3001', '11', '上香', null, '0', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('3002', '11', '点烛', null, '0', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('3003', '11', '花圈', null, '0', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('3004', '11', '鲜花', null, '0', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('3005', '11', '行礼', null, '0', null, '1495862898');
INSERT INTO `tp_mall_goods_category` VALUES ('5001', '12', '烟酒', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5002', '12', '茶', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5003', '12', '全素食', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5004', '12', '全荤食', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5005', '12', '水果', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5006', '12', '面点', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5007', '12', '饮料', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5008', '12', '水', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5009', '12', '川菜', null, '0', null, '1495864495');
INSERT INTO `tp_mall_goods_category` VALUES ('5010', '12', '粤菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5011', '12', '徽菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5012', '12', '鲁菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5013', '12', '闽菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5014', '12', '苏菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5015', '12', '湘菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5016', '12', '浙菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5017', '12', '港台菜', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('5018', '12', '小吃', null, '0', null, '1495864496');
INSERT INTO `tp_mall_goods_category` VALUES ('6001', '13', '金钱', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6002', '13', '男装', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6003', '13', '女装', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6004', '13', '房子', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6005', '13', '交通工具', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6006', '13', '电器', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6007', '13', '日用品', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6008', '13', '休闲娱乐', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6009', '13', '儿童服饰', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6010', '13', '宠物', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('6011', '13', '其他', null, '0', null, '1495864571');
INSERT INTO `tp_mall_goods_category` VALUES ('7001', '14', '佛教', null, '0', null, '1495864615');
INSERT INTO `tp_mall_goods_category` VALUES ('7002', '14', '西方宗教', null, '0', null, '1495864615');

-- ----------------------------
-- Table structure for tp_mall_goods_package
-- ----------------------------
DROP TABLE IF EXISTS `tp_mall_goods_package`;
CREATE TABLE `tp_mall_goods_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品套餐索引id',
  `goods_ids` text NOT NULL COMMENT '产品ids',
  `name` varchar(255) NOT NULL COMMENT '商品套餐名称',
  `summary` text COMMENT '商品套餐简介',
  `price` int(10) NOT NULL DEFAULT '0' COMMENT '商品价格',
  `is_sale` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否上架 1 上架 0 下架 ',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='andy - 祭祀商品套餐表';

-- ----------------------------
-- Records of tp_mall_goods_package
-- ----------------------------
INSERT INTO `tp_mall_goods_package` VALUES ('15', '182,181,180,179,127,126,125,124,123,122,28,27,26,5,4,25,19,16,15,21,23', '套餐222', null, '0', '0', null, '2147483647', '1496560015');
INSERT INTO `tp_mall_goods_package` VALUES ('19', '', 'aaaa', null, '0', '0', null, '2147483647', '0');
INSERT INTO `tp_mall_goods_package` VALUES ('21', '16', '啊啊啊啊是', null, '0', '0', null, '2147483647', '0');
INSERT INTO `tp_mall_goods_package` VALUES ('22', '25,19,16,15', '啊啊啊', null, '0', '0', null, '2147483647', '0');
INSERT INTO `tp_mall_goods_package` VALUES ('23', '182,181,180,179', '测试套餐', null, '0', '1', null, '1497938142', '0');

-- ----------------------------
-- Table structure for tp_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_mall_order`;
CREATE TABLE `tp_mall_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) NOT NULL COMMENT '订单编号',
  `pay_sn` bigint(20) NOT NULL COMMENT '支付单号',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `payment_time` int(11) NOT NULL COMMENT '支付时间',
  `goods_amount` int(10) NOT NULL DEFAULT '0' COMMENT '商品总价格',
  `order_amount` int(10) NOT NULL DEFAULT '0' COMMENT '订单总价格',
  `order_state` enum('0','10','20') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='andy - 祭祀商品订单表';

-- ----------------------------
-- Records of tp_mall_order
-- ----------------------------
INSERT INTO `tp_mall_order` VALUES ('1', '9000000000000101', '0', '1', '管理员', '2147483647', '160', '150', '0', '2147483647', '0');
INSERT INTO `tp_mall_order` VALUES ('2', '9000000000000102', '0', '2', '测试用户', '2147483647', '20', '19', '0', '2147483647', '0');

-- ----------------------------
-- Table structure for tp_mall_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_mall_order_goods`;
CREATE TABLE `tp_mall_order_goods` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='andy - 祭祀订单商品表';

-- ----------------------------
-- Records of tp_mall_order_goods
-- ----------------------------
INSERT INTO `tp_mall_order_goods` VALUES ('1', '1', '2', '回忆香', '55.00', '3', 'http://yunjn.cc/static/upload/daa9da6eb0a5d184/91942d378bdcd7ba.jpg', '30.00', '1');
INSERT INTO `tp_mall_order_goods` VALUES ('2', '2', '3', '平安香', '23.00', '1', 'http://yunjn.cc/static/upload/daa9da6eb0a5d184/91942d378bdcd7ba.jpg', '25.00', '2');

-- ----------------------------
-- Table structure for tp_mall_worship
-- ----------------------------
DROP TABLE IF EXISTS `tp_mall_worship`;
CREATE TABLE `tp_mall_worship` (
  `worship_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '祭拜订单索引id',
  `worship_sn` varchar(255) NOT NULL COMMENT '祭拜订单编号',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆id',
  `user_id` int(11) NOT NULL COMMENT '祭拜者id',
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '单价',
  `goods_name` char(50) DEFAULT NULL COMMENT '商品名称',
  `goods_price` int(11) NOT NULL DEFAULT '0' COMMENT '商品价格',
  `goods_user_integral` int(11) NOT NULL DEFAULT '0' COMMENT '商品用户积分',
  `goods_memorial_integral` int(11) NOT NULL DEFAULT '0' COMMENT '商品纪念馆积分',
  `goods_image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `goods_num` int(10) NOT NULL DEFAULT '0' COMMENT '祭祀商品数量',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '持续时间=祭祀时间+商品持续时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '订单状态：0 禁用 1 正常',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`worship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8 COMMENT='andy - 祭拜订单表';

-- ----------------------------
-- Records of tp_mall_worship
-- ----------------------------
INSERT INTO `tp_mall_worship` VALUES ('229', '594b87dc79c9d', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1428143804', '1', '1498122204', '0');
INSERT INTO `tp_mall_worship` VALUES ('230', '594b8ada4a5e4', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498144570', '1', '1498122970', '0');
INSERT INTO `tp_mall_worship` VALUES ('231', '594b8e8a8c8be', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145514', '1', '1498123914', '0');
INSERT INTO `tp_mall_worship` VALUES ('232', '594b8e8ae3ebb', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145514', '1', '1498123914', '0');
INSERT INTO `tp_mall_worship` VALUES ('233', '594b8e8ae8269', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145514', '1', '1498123914', '0');
INSERT INTO `tp_mall_worship` VALUES ('234', '594b8e8b58c83', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145515', '1', '1498123915', '0');
INSERT INTO `tp_mall_worship` VALUES ('235', '594b8e8b90a90', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145515', '1', '1498123915', '0');
INSERT INTO `tp_mall_worship` VALUES ('236', '594b8e8bd5a8b', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145515', '1', '1498123915', '0');
INSERT INTO `tp_mall_worship` VALUES ('237', '594b8e8c1a735', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145516', '1', '1498123916', '0');
INSERT INTO `tp_mall_worship` VALUES ('238', '594b8e8daed0e', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145517', '1', '1498123917', '0');
INSERT INTO `tp_mall_worship` VALUES ('239', '594b8e8ea28b7', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145518', '1', '1498123918', '0');
INSERT INTO `tp_mall_worship` VALUES ('240', '594b8e938cabd', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145523', '1', '1498123923', '0');
INSERT INTO `tp_mall_worship` VALUES ('241', '594b8e94384cf', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145524', '1', '1498123924', '0');
INSERT INTO `tp_mall_worship` VALUES ('242', '594b8e9531801', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145525', '1', '1498123925', '0');
INSERT INTO `tp_mall_worship` VALUES ('243', '594b8e996ce63', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145529', '1', '1498123929', '0');
INSERT INTO `tp_mall_worship` VALUES ('244', '594b8e9a35f64', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145530', '1', '1498123930', '0');
INSERT INTO `tp_mall_worship` VALUES ('245', '594b8e9b324eb', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145531', '1', '1498123931', '0');
INSERT INTO `tp_mall_worship` VALUES ('246', '594b8ea285006', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145538', '1', '1498123938', '0');
INSERT INTO `tp_mall_worship` VALUES ('247', '594b8ea383f9a', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145539', '1', '1498123939', '0');
INSERT INTO `tp_mall_worship` VALUES ('248', '594b8ea4dcb79', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145540', '1', '1498123940', '0');
INSERT INTO `tp_mall_worship` VALUES ('249', '594b8ea625170', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145542', '1', '1498123942', '0');
INSERT INTO `tp_mall_worship` VALUES ('250', '594b8eab540a7', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498145547', '1', '1498123947', '0');
INSERT INTO `tp_mall_worship` VALUES ('251', '594c6947a57be', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '0', '1498201511', '1', '1498179911', '0');
INSERT INTO `tp_mall_worship` VALUES ('252', '594c6952167cb', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201522', '1', '1498179922', '0');
INSERT INTO `tp_mall_worship` VALUES ('253', '594c6990a6458', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201584', '1', '1498179984', '0');
INSERT INTO `tp_mall_worship` VALUES ('254', '594c699d1518f', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201597', '1', '1498179997', '0');
INSERT INTO `tp_mall_worship` VALUES ('255', '594c69af7e2ab', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201615', '1', '1498180015', '0');
INSERT INTO `tp_mall_worship` VALUES ('256', '594c69c0dcba1', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201632', '1', '1498180032', '0');
INSERT INTO `tp_mall_worship` VALUES ('257', '594c69ddbd449', '1', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201661', '1', '1498180061', '0');
INSERT INTO `tp_mall_worship` VALUES ('258', '594c69fa0d0d3', '1', '1', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201690', '1', '1498180090', '0');
INSERT INTO `tp_mall_worship` VALUES ('259', '594c6a8b89f3b', '1', '1', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201835', '1', '1498180235', '0');
INSERT INTO `tp_mall_worship` VALUES ('260', '594c6a92e6212', '1', '1', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201842', '1', '1498180242', '0');
INSERT INTO `tp_mall_worship` VALUES ('261', '594c6a9a17451', '2', '1', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201850', '1', '1498180250', '0');
INSERT INTO `tp_mall_worship` VALUES ('262', '594c6a9ec3cf7', '5', '1', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201854', '1', '1498180254', '0');
INSERT INTO `tp_mall_worship` VALUES ('263', '594c6adc847e0', '5', '3', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201916', '1', '1498180316', '0');
INSERT INTO `tp_mall_worship` VALUES ('264', '594c6b19b6b4c', '6', '3', '155', '全鱼', '30', '3', '3', '/static/upload/goods/j04_t_09.png', '1', '1498201977', '1', '1498180377', '0');
INSERT INTO `tp_mall_worship` VALUES ('265', '594c6b24c80c6', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498201988', '1', '1498180388', '0');
INSERT INTO `tp_mall_worship` VALUES ('266', '594c6b314e759', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202001', '1', '1498180401', '0');
INSERT INTO `tp_mall_worship` VALUES ('267', '594c6b4857929', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202024', '1', '1498180424', '0');
INSERT INTO `tp_mall_worship` VALUES ('268', '594c6b846edd0', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202084', '1', '1498180484', '0');
INSERT INTO `tp_mall_worship` VALUES ('269', '594c6b92c65c3', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202098', '1', '1498180498', '0');
INSERT INTO `tp_mall_worship` VALUES ('270', '594c6bb0301a7', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202128', '1', '1498180528', '0');
INSERT INTO `tp_mall_worship` VALUES ('271', '594c6becd3966', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202188', '1', '1498180588', '0');
INSERT INTO `tp_mall_worship` VALUES ('272', '594c6bfcb75ae', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202204', '1', '1498180604', '0');
INSERT INTO `tp_mall_worship` VALUES ('273', '594c6c09b95e5', '6', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202217', '1', '1498180617', '0');
INSERT INTO `tp_mall_worship` VALUES ('274', '594c6c171d7fb', '1', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202231', '1', '1498180631', '0');
INSERT INTO `tp_mall_worship` VALUES ('275', '594c6c225cdd0', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202242', '1', '1498180642', '0');
INSERT INTO `tp_mall_worship` VALUES ('276', '594c6c9ec4c27', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '0', '1498202366', '1', '1498180766', '0');
INSERT INTO `tp_mall_worship` VALUES ('277', '594c6ca29ef85', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '0', '1498202370', '1', '1498180770', '0');
INSERT INTO `tp_mall_worship` VALUES ('278', '594c6cdcb7f45', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '0', '1498202428', '1', '1498180828', '0');
INSERT INTO `tp_mall_worship` VALUES ('279', '594c6d0e77a6e', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498202478', '1', '1498180878', '0');
INSERT INTO `tp_mall_worship` VALUES ('280', '594c74a507b82', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204421', '1', '1498182821', '0');
INSERT INTO `tp_mall_worship` VALUES ('281', '594c74be408db', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204446', '1', '1498182846', '0');
INSERT INTO `tp_mall_worship` VALUES ('282', '594c74f9b8b65', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204505', '1', '1498182905', '0');
INSERT INTO `tp_mall_worship` VALUES ('283', '594c750a12dc5', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204522', '1', '1498182922', '0');
INSERT INTO `tp_mall_worship` VALUES ('284', '594c7561a789b', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204609', '1', '1498183009', '0');
INSERT INTO `tp_mall_worship` VALUES ('285', '594c7585b553b', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204645', '1', '1498183045', '0');
INSERT INTO `tp_mall_worship` VALUES ('286', '594c75958668c', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204661', '1', '1498183061', '0');
INSERT INTO `tp_mall_worship` VALUES ('287', '594c75ba882c1', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204698', '1', '1498183098', '0');
INSERT INTO `tp_mall_worship` VALUES ('288', '594c75c3ba1b0', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204707', '1', '1498183107', '0');
INSERT INTO `tp_mall_worship` VALUES ('289', '594c75c94e5e5', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204713', '1', '1498183113', '0');
INSERT INTO `tp_mall_worship` VALUES ('290', '594c763d60b59', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204829', '1', '1498183229', '0');
INSERT INTO `tp_mall_worship` VALUES ('291', '594c7641ea814', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498204833', '1', '1498183233', '0');
INSERT INTO `tp_mall_worship` VALUES ('292', '594c77183c21e', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205048', '1', '1498183448', '0');
INSERT INTO `tp_mall_worship` VALUES ('293', '594c78ac1137d', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205452', '1', '1498183852', '0');
INSERT INTO `tp_mall_worship` VALUES ('294', '594c78b0a2734', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205456', '1', '1498183856', '0');
INSERT INTO `tp_mall_worship` VALUES ('295', '594c78c79aa9f', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205479', '1', '1498183879', '0');
INSERT INTO `tp_mall_worship` VALUES ('296', '594c79478a7c8', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205607', '1', '1498184007', '0');
INSERT INTO `tp_mall_worship` VALUES ('297', '594c7957dc4cc', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205623', '1', '1498184023', '0');
INSERT INTO `tp_mall_worship` VALUES ('298', '594c79651205f', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205637', '1', '1498184037', '0');
INSERT INTO `tp_mall_worship` VALUES ('299', '594c796988dd7', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205641', '1', '1498184041', '0');
INSERT INTO `tp_mall_worship` VALUES ('300', '594c798e41758', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205678', '1', '1498184078', '0');
INSERT INTO `tp_mall_worship` VALUES ('301', '594c799e0e91a', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205694', '1', '1498184094', '0');
INSERT INTO `tp_mall_worship` VALUES ('302', '594c7a7417f35', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205908', '1', '1498184308', '0');
INSERT INTO `tp_mall_worship` VALUES ('303', '594c7a7731f3a', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205911', '1', '1498184311', '0');
INSERT INTO `tp_mall_worship` VALUES ('304', '594c7a79d1bcb', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205913', '1', '1498184313', '0');
INSERT INTO `tp_mall_worship` VALUES ('305', '594c7a9a9fd57', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205946', '1', '1498184346', '0');
INSERT INTO `tp_mall_worship` VALUES ('306', '594c7aa2b6d2b', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205954', '1', '1498184354', '0');
INSERT INTO `tp_mall_worship` VALUES ('307', '594c7aa3dbefb', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498205955', '1', '1498184355', '0');
INSERT INTO `tp_mall_worship` VALUES ('308', '594c7c32bff73', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206354', '1', '1498184754', '0');
INSERT INTO `tp_mall_worship` VALUES ('309', '594c7ceb7ff29', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206539', '1', '1498184939', '0');
INSERT INTO `tp_mall_worship` VALUES ('310', '594c7cee7f862', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206542', '1', '1498184942', '0');
INSERT INTO `tp_mall_worship` VALUES ('311', '594c7d5261c3e', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206642', '1', '1498185042', '0');
INSERT INTO `tp_mall_worship` VALUES ('312', '594c7d5575783', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206645', '1', '1498185045', '0');
INSERT INTO `tp_mall_worship` VALUES ('313', '594c7d765b4fc', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206678', '1', '1498185078', '0');
INSERT INTO `tp_mall_worship` VALUES ('314', '594c7e6492d56', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206916', '1', '1498185316', '0');
INSERT INTO `tp_mall_worship` VALUES ('315', '594c7e67151a2', '2', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206919', '1', '1498185319', '0');
INSERT INTO `tp_mall_worship` VALUES ('316', '594c7e6ca24ca', '3', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206924', '1', '1498185324', '0');
INSERT INTO `tp_mall_worship` VALUES ('317', '594c7e712106e', '4', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206929', '1', '1498185329', '0');
INSERT INTO `tp_mall_worship` VALUES ('318', '594c7e8c60b54', '4', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206956', '1', '1498185356', '0');
INSERT INTO `tp_mall_worship` VALUES ('319', '594c7e91e63f5', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498206961', '1', '1498185361', '0');
INSERT INTO `tp_mall_worship` VALUES ('320', '594c7eb97fcb7', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207001', '1', '1498185401', '0');
INSERT INTO `tp_mall_worship` VALUES ('321', '594c7ebbb6b51', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207003', '1', '1498185403', '0');
INSERT INTO `tp_mall_worship` VALUES ('322', '594c7f1883bd2', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207096', '1', '1498185496', '0');
INSERT INTO `tp_mall_worship` VALUES ('323', '594c7f1a15b32', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207098', '1', '1498185498', '0');
INSERT INTO `tp_mall_worship` VALUES ('324', '594c7f3154855', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207121', '1', '1498185521', '0');
INSERT INTO `tp_mall_worship` VALUES ('325', '594c7f33b382f', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207123', '1', '1498185523', '0');
INSERT INTO `tp_mall_worship` VALUES ('326', '594c7f504a0e3', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207152', '1', '1498185552', '0');
INSERT INTO `tp_mall_worship` VALUES ('327', '594c7f512eba1', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207153', '1', '1498185553', '0');
INSERT INTO `tp_mall_worship` VALUES ('328', '594c7f66c4490', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207174', '1', '1498185574', '0');
INSERT INTO `tp_mall_worship` VALUES ('329', '594c7f8d4402f', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207213', '1', '1498185613', '0');
INSERT INTO `tp_mall_worship` VALUES ('330', '594c7f922174d', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207218', '1', '1498185618', '0');
INSERT INTO `tp_mall_worship` VALUES ('331', '594c7f9593ccd', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207221', '1', '1498185621', '0');
INSERT INTO `tp_mall_worship` VALUES ('332', '594c7fa84a604', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207240', '1', '1498185640', '0');
INSERT INTO `tp_mall_worship` VALUES ('333', '594c7fd11fc62', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207281', '1', '1498185681', '0');
INSERT INTO `tp_mall_worship` VALUES ('334', '594c8088d4cb8', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207464', '1', '1498185864', '0');
INSERT INTO `tp_mall_worship` VALUES ('335', '594c808c0245b', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207468', '1', '1498185868', '0');
INSERT INTO `tp_mall_worship` VALUES ('336', '594c811e838ca', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207614', '1', '1498186014', '0');
INSERT INTO `tp_mall_worship` VALUES ('337', '594c813051237', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207632', '1', '1498186032', '0');
INSERT INTO `tp_mall_worship` VALUES ('338', '594c8143802b8', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207651', '1', '1498186051', '0');
INSERT INTO `tp_mall_worship` VALUES ('339', '594c814d62148', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207661', '1', '1498186061', '0');
INSERT INTO `tp_mall_worship` VALUES ('340', '594c81dd8e56a', '5', '3', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207805', '1', '1498186205', '0');
INSERT INTO `tp_mall_worship` VALUES ('341', '594c822373816', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207875', '1', '1498186275', '0');
INSERT INTO `tp_mall_worship` VALUES ('342', '594c8224e8a46', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498207876', '1', '1498186276', '0');
INSERT INTO `tp_mall_worship` VALUES ('343', '594c82b0bcd48', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208016', '1', '1498186416', '0');
INSERT INTO `tp_mall_worship` VALUES ('344', '594c82bf77bf0', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208031', '1', '1498186431', '0');
INSERT INTO `tp_mall_worship` VALUES ('345', '594c82e303291', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208067', '1', '1498186467', '0');
INSERT INTO `tp_mall_worship` VALUES ('346', '594c82f88d54c', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208088', '1', '1498186488', '0');
INSERT INTO `tp_mall_worship` VALUES ('347', '594c830c9b08e', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208108', '1', '1498186508', '0');
INSERT INTO `tp_mall_worship` VALUES ('348', '594c832acabb4', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208138', '1', '1498186538', '0');
INSERT INTO `tp_mall_worship` VALUES ('349', '594c83d7359c7', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208311', '1', '1498186711', '0');
INSERT INTO `tp_mall_worship` VALUES ('350', '594c8412c16ad', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208370', '1', '1498186770', '0');
INSERT INTO `tp_mall_worship` VALUES ('351', '594c8443e0740', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208419', '1', '1498186819', '0');
INSERT INTO `tp_mall_worship` VALUES ('352', '594c848a54489', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208490', '1', '1498186890', '0');
INSERT INTO `tp_mall_worship` VALUES ('353', '594c848fd9bdd', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208495', '1', '1498186895', '0');
INSERT INTO `tp_mall_worship` VALUES ('354', '594c8492995cf', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208498', '1', '1498186898', '0');
INSERT INTO `tp_mall_worship` VALUES ('355', '594c849deff31', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208509', '1', '1498186909', '0');
INSERT INTO `tp_mall_worship` VALUES ('356', '594c84a62b169', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208518', '1', '1498186918', '0');
INSERT INTO `tp_mall_worship` VALUES ('357', '594c84b0ea66d', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208528', '1', '1498186928', '0');
INSERT INTO `tp_mall_worship` VALUES ('358', '594c84b57f4bd', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208533', '1', '1498186933', '0');
INSERT INTO `tp_mall_worship` VALUES ('359', '594c84bf2d093', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208543', '1', '1498186943', '0');
INSERT INTO `tp_mall_worship` VALUES ('360', '594c84c4bcb09', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208548', '1', '1498186948', '0');
INSERT INTO `tp_mall_worship` VALUES ('361', '594c84db9633b', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208571', '1', '1498186971', '0');
INSERT INTO `tp_mall_worship` VALUES ('362', '594c84e7f1039', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208583', '1', '1498186983', '0');
INSERT INTO `tp_mall_worship` VALUES ('363', '594c84f789b6c', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208599', '1', '1498186999', '0');
INSERT INTO `tp_mall_worship` VALUES ('364', '594c84fa4a0f7', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208602', '1', '1498187002', '0');
INSERT INTO `tp_mall_worship` VALUES ('365', '594c84fc94c4b', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208604', '1', '1498187004', '0');
INSERT INTO `tp_mall_worship` VALUES ('366', '594c84ffb1544', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208607', '1', '1498187007', '0');
INSERT INTO `tp_mall_worship` VALUES ('367', '594c850917786', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208617', '1', '1498187017', '0');
INSERT INTO `tp_mall_worship` VALUES ('368', '594c8516b1c7c', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208630', '1', '1498187030', '0');
INSERT INTO `tp_mall_worship` VALUES ('369', '594c85255f765', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208645', '1', '1498187045', '0');
INSERT INTO `tp_mall_worship` VALUES ('370', '594c8538643c2', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208664', '1', '1498187064', '0');
INSERT INTO `tp_mall_worship` VALUES ('371', '594c85552f546', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208693', '1', '1498187093', '0');
INSERT INTO `tp_mall_worship` VALUES ('372', '594c855f3a71f', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208703', '1', '1498187103', '0');
INSERT INTO `tp_mall_worship` VALUES ('373', '594c8562435d7', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208706', '1', '1498187106', '0');
INSERT INTO `tp_mall_worship` VALUES ('374', '594c85a440978', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208772', '1', '1498187172', '0');
INSERT INTO `tp_mall_worship` VALUES ('375', '594c85b18fb3c', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208785', '1', '1498187185', '0');
INSERT INTO `tp_mall_worship` VALUES ('376', '594c85c561b1d', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208805', '1', '1498187205', '0');
INSERT INTO `tp_mall_worship` VALUES ('377', '594c85d2b7c91', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208818', '1', '1498187218', '0');
INSERT INTO `tp_mall_worship` VALUES ('378', '594c85d800568', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208824', '1', '1498187224', '0');
INSERT INTO `tp_mall_worship` VALUES ('379', '594c85f7808f0', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208855', '1', '1498187255', '0');
INSERT INTO `tp_mall_worship` VALUES ('380', '594c85f81e562', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208856', '1', '1498187256', '0');
INSERT INTO `tp_mall_worship` VALUES ('381', '594c85f81fc17', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208856', '1', '1498187256', '0');
INSERT INTO `tp_mall_worship` VALUES ('382', '594c85f8216b8', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208856', '1', '1498187256', '0');
INSERT INTO `tp_mall_worship` VALUES ('383', '594c85f97c41c', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208857', '1', '1498187257', '0');
INSERT INTO `tp_mall_worship` VALUES ('384', '594c86170bc4a', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208887', '1', '1498187287', '0');
INSERT INTO `tp_mall_worship` VALUES ('385', '594c863ccae9e', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208924', '1', '1498187324', '0');
INSERT INTO `tp_mall_worship` VALUES ('386', '594c8641bfad6', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208929', '1', '1498187329', '0');
INSERT INTO `tp_mall_worship` VALUES ('387', '594c866a1c797', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208970', '1', '1498187370', '0');
INSERT INTO `tp_mall_worship` VALUES ('388', '594c8673394c8', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208979', '1', '1498187379', '0');
INSERT INTO `tp_mall_worship` VALUES ('389', '594c86811ecb3', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498208993', '1', '1498187393', '0');
INSERT INTO `tp_mall_worship` VALUES ('390', '594c87be2ad5c', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209310', '1', '1498187710', '0');
INSERT INTO `tp_mall_worship` VALUES ('391', '594c87d191f47', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209329', '1', '1498187729', '0');
INSERT INTO `tp_mall_worship` VALUES ('392', '594c880ba3b77', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209387', '1', '1498187787', '0');
INSERT INTO `tp_mall_worship` VALUES ('393', '594c8827d788b', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209415', '1', '1498187815', '0');
INSERT INTO `tp_mall_worship` VALUES ('394', '594c884015c82', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209440', '1', '1498187840', '0');
INSERT INTO `tp_mall_worship` VALUES ('395', '594c8856ac4ff', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209462', '1', '1498187862', '0');
INSERT INTO `tp_mall_worship` VALUES ('396', '594c88667dbbb', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209478', '1', '1498187878', '0');
INSERT INTO `tp_mall_worship` VALUES ('397', '594c8872df8a6', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209490', '1', '1498187890', '0');
INSERT INTO `tp_mall_worship` VALUES ('398', '594c888263f70', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209506', '1', '1498187906', '0');
INSERT INTO `tp_mall_worship` VALUES ('399', '594c88922f4d7', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209522', '1', '1498187922', '0');
INSERT INTO `tp_mall_worship` VALUES ('400', '594c889c7d9f0', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209532', '1', '1498187932', '0');
INSERT INTO `tp_mall_worship` VALUES ('401', '594c88cb94a43', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209579', '1', '1498187979', '0');
INSERT INTO `tp_mall_worship` VALUES ('402', '594c88ee5c0ec', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209614', '1', '1498188014', '0');
INSERT INTO `tp_mall_worship` VALUES ('403', '594c8925d1b39', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209669', '1', '1498188069', '0');
INSERT INTO `tp_mall_worship` VALUES ('404', '594c894e845a1', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209710', '1', '1498188110', '0');
INSERT INTO `tp_mall_worship` VALUES ('405', '594c895473013', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209716', '1', '1498188116', '0');
INSERT INTO `tp_mall_worship` VALUES ('406', '594c895f984b4', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209727', '1', '1498188127', '0');
INSERT INTO `tp_mall_worship` VALUES ('407', '594c8966b1743', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209734', '1', '1498188134', '0');
INSERT INTO `tp_mall_worship` VALUES ('408', '594c896d4f3d1', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209741', '1', '1498188141', '0');
INSERT INTO `tp_mall_worship` VALUES ('409', '594c897578a36', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209749', '1', '1498188149', '0');
INSERT INTO `tp_mall_worship` VALUES ('410', '594c898068845', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498209760', '1', '1498188160', '0');
INSERT INTO `tp_mall_worship` VALUES ('411', '594c8b57255b6', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210231', '1', '1498188631', '0');
INSERT INTO `tp_mall_worship` VALUES ('412', '594c8ba875c6b', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210312', '1', '1498188712', '0');
INSERT INTO `tp_mall_worship` VALUES ('413', '594c8bbd9e682', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210333', '1', '1498188733', '0');
INSERT INTO `tp_mall_worship` VALUES ('414', '594c8bf44f97a', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210388', '1', '1498188788', '0');
INSERT INTO `tp_mall_worship` VALUES ('415', '594c8c0c9ce35', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210412', '1', '1498188812', '0');
INSERT INTO `tp_mall_worship` VALUES ('416', '594c8c2436518', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210436', '1', '1498188836', '0');
INSERT INTO `tp_mall_worship` VALUES ('417', '594c8c8404d69', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210532', '1', '1498188932', '0');
INSERT INTO `tp_mall_worship` VALUES ('418', '594c8ca31924a', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210563', '1', '1498188963', '0');
INSERT INTO `tp_mall_worship` VALUES ('419', '594c8cb7d6e56', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210583', '1', '1498188983', '0');
INSERT INTO `tp_mall_worship` VALUES ('420', '594c8cc9f1d25', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210601', '1', '1498189001', '0');
INSERT INTO `tp_mall_worship` VALUES ('421', '594c8cf7cb8db', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210647', '1', '1498189047', '0');
INSERT INTO `tp_mall_worship` VALUES ('422', '594c8d2183483', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210689', '1', '1498189089', '0');
INSERT INTO `tp_mall_worship` VALUES ('423', '594c8d8f88593', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210799', '1', '1498189199', '0');
INSERT INTO `tp_mall_worship` VALUES ('424', '594c8d963e0c7', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210806', '1', '1498189206', '0');
INSERT INTO `tp_mall_worship` VALUES ('425', '594c8dad6f43a', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210829', '1', '1498189229', '0');
INSERT INTO `tp_mall_worship` VALUES ('426', '594c8dbd36542', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210845', '1', '1498189245', '0');
INSERT INTO `tp_mall_worship` VALUES ('427', '594c8e34c263a', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210964', '1', '1498189364', '0');
INSERT INTO `tp_mall_worship` VALUES ('428', '594c8e4102b9b', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498210977', '1', '1498189377', '0');
INSERT INTO `tp_mall_worship` VALUES ('429', '594c8ecc28020', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498211116', '1', '1498189516', '0');
INSERT INTO `tp_mall_worship` VALUES ('430', '594c8eee5ce2f', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498211150', '1', '1498189550', '0');
INSERT INTO `tp_mall_worship` VALUES ('431', '594c8f4677af1', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498211238', '1', '1498189638', '0');
INSERT INTO `tp_mall_worship` VALUES ('432', '594c8f5491a57', '5', '1', '122', '回忆香', '10', '1', '1', '/static/upload/goods/j01_t_01.png', '1', '1498211252', '1', '1498189652', '0');
INSERT INTO `tp_mall_worship` VALUES ('433', '59574d2979d4f', '42', '2', '125', '报乐香', '20', '1', '2', '/static/upload/goods/j01_t_04.png', '1', '1498915209', '1', '1498893609', '0');
INSERT INTO `tp_mall_worship` VALUES ('434', '59574d4a660b0', '1', '2', '788', '思念款款', '60', '6', '6', '/static/upload/goods/j03_t_19.png', '1', '1498915242', '1', '1498893642', '0');
INSERT INTO `tp_mall_worship` VALUES ('435', '59574d4eb4b8a', '1', '2', '787', '紫罗兰', '60', '6', '6', '/static/upload/goods/j03_t_16.png', '1', '1498915246', '1', '1498893646', '0');
INSERT INTO `tp_mall_worship` VALUES ('436', '59574d58dc0f7', '1', '2', '180', '行礼', '0', '0', '0', '/static/upload/goods/j06_t_02.png', '1', '1498915256', '1', '1498893656', '0');
INSERT INTO `tp_mall_worship` VALUES ('437', '59574d652c959', '1', '2', '125', '报乐香', '20', '1', '2', '/static/upload/goods/j01_t_04.png', '1', '1498915269', '1', '1498893669', '0');
INSERT INTO `tp_mall_worship` VALUES ('438', '59574d6996eb4', '1', '2', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1498915273', '1', '1498893673', '0');
INSERT INTO `tp_mall_worship` VALUES ('439', '59574d7b8ed00', '1', '2', '125', '报乐香', '20', '1', '2', '/static/upload/goods/j01_t_04.png', '1', '1498915291', '1', '1498893691', '0');
INSERT INTO `tp_mall_worship` VALUES ('440', '59574d8030e03', '1', '2', '132', '莲花酥油灯', '30', '3', '3', '/static/upload/goods/j02_t_05.png', '1', '1498915296', '1', '1498893696', '0');
INSERT INTO `tp_mall_worship` VALUES ('441', '59574d919baff', '1', '2', '124', '思念香', '10', '1', '1', '/static/upload/goods/j01_t_03.png', '1', '1498915313', '1', '1498893713', '0');
INSERT INTO `tp_mall_worship` VALUES ('442', '595756840bebc', '223', '8', '131', '黑色古典烛台', '20', '2', '2', '/static/upload/goods/j02_t_04.png', '1', '1498917604', '1', '1498896004', '0');
INSERT INTO `tp_mall_worship` VALUES ('443', '5957691e3ae3a', '1', '10', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1498922366', '1', '1498900766', '0');
INSERT INTO `tp_mall_worship` VALUES ('444', '595783f07f8dc', '228', '8', '331', '云吞面', '10', '1', '1', '/static/upload/goods/j04_t_119.png', '1', '1498929232', '1', '1498907632', '0');
INSERT INTO `tp_mall_worship` VALUES ('445', '595aecff96712', '1', '10', '788', '思念款款', '60', '6', '6', '/static/upload/goods/j03_t_19.png', '1', '1499152735', '1', '1499131135', '0');
INSERT INTO `tp_mall_worship` VALUES ('446', '595aed08deebd', '1', '10', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499152744', '1', '1499131144', '0');
INSERT INTO `tp_mall_worship` VALUES ('447', '595aed0dc8087', '1', '10', '126', '功德香', '20', '1', '2', '/static/upload/goods/j01_t_05.png', '1', '1499152749', '1', '1499131149', '0');
INSERT INTO `tp_mall_worship` VALUES ('448', '595aed14704b8', '1', '10', '134', '心经莲花灯', '30', '3', '3', '/static/upload/goods/j02_t_07.png', '1', '1499152756', '1', '1499131156', '0');
INSERT INTO `tp_mall_worship` VALUES ('449', '595aededb1251', '1', '3', '128', '大红烛', '10', '1', '1', '/static/upload/goods/j02_t_01.png', '1', '1499152973', '1', '1499131373', '0');
INSERT INTO `tp_mall_worship` VALUES ('450', '595c7037872ee', '228', '8', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1499251863', '1', '1499230263', '0');
INSERT INTO `tp_mall_worship` VALUES ('451', '595c704a27d0d', '228', '8', '790', '扶郎', '30', '3', '3', '/static/upload/goods/j03_t_18.png', '1', '1499251882', '1', '1499230282', '0');
INSERT INTO `tp_mall_worship` VALUES ('452', '595c73917bbd3', '228', '8', '787', '紫罗兰', '60', '6', '6', '/static/upload/goods/j03_t_16.png', '1', '1499252721', '1', '1499231121', '0');
INSERT INTO `tp_mall_worship` VALUES ('453', '595c739755979', '228', '8', '787', '紫罗兰', '60', '6', '6', '/static/upload/goods/j03_t_16.png', '1', '1499252727', '1', '1499231127', '0');
INSERT INTO `tp_mall_worship` VALUES ('454', '595c73de33428', '228', '8', '229', '花篮', '150', '15', '15', '/static/upload/goods/j07_t_07.png', '1', '1499252798', '1', '1499231198', '0');
INSERT INTO `tp_mall_worship` VALUES ('455', '595c73e44284c', '228', '8', '228', '花圈', '60', '6', '6', '/static/upload/goods/j07_t_10.png', '1', '1499252804', '1', '1499231204', '0');
INSERT INTO `tp_mall_worship` VALUES ('456', '595c73efd37a2', '228', '8', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499252815', '1', '1499231215', '0');
INSERT INTO `tp_mall_worship` VALUES ('457', '595c73f99a41b', '228', '8', '132', '莲花酥油灯', '30', '3', '3', '/static/upload/goods/j02_t_05.png', '1', '1499252825', '1', '1499231225', '0');
INSERT INTO `tp_mall_worship` VALUES ('458', '595c7401b1251', '228', '8', '135', '招财进宝烛', '30', '3', '3', '/static/upload/goods/j02_t_08.png', '1', '1499252833', '1', '1499231233', '0');
INSERT INTO `tp_mall_worship` VALUES ('459', '595c741577eca', '228', '8', '125', '报乐香', '20', '1', '2', '/static/upload/goods/j01_t_04.png', '1', '1499252853', '1', '1499231253', '0');
INSERT INTO `tp_mall_worship` VALUES ('460', '595c743c704b8', '228', '8', '414', '竹香肉', '30', '3', '3', '/static/upload/goods/j04_t_202.png', '1', '1499252892', '1', '1499231292', '0');
INSERT INTO `tp_mall_worship` VALUES ('461', '595c74a20d1ce', '228', '8', '413', '杂酱莴笋丝', '10', '1', '1', '/static/upload/goods/j04_t_201.png', '1', '1499252994', '1', '1499231394', '0');
INSERT INTO `tp_mall_worship` VALUES ('462', '595c74ac0d1ce', '228', '8', '383', '鸭血粉丝汤', '20', '2', '2', '/static/upload/goods/j04_t_171.png', '1', '1499253004', '1', '1499231404', '0');
INSERT INTO `tp_mall_worship` VALUES ('463', '595c74b1c0675', '228', '8', '782', '麻将套装', '150', '15', '15', '/static/upload/goods/j05_t_216.png', '1', '1499253009', '1', '1499231409', '0');
INSERT INTO `tp_mall_worship` VALUES ('464', '595c74ba057bc', '228', '8', '523', '小提琴', '300', '30', '30', '/static/upload/goods/j05_t_120.png', '1', '1499253018', '1', '1499231418', '0');
INSERT INTO `tp_mall_worship` VALUES ('465', '595c74dc188e9', '228', '8', '412', '油炸臭干子', '10', '1', '1', '/static/upload/goods/j04_t_200.png', '1', '1499253052', '1', '1499231452', '0');
INSERT INTO `tp_mall_worship` VALUES ('466', '595c74eabc96c', '228', '8', '413', '杂酱莴笋丝', '10', '1', '1', '/static/upload/goods/j04_t_201.png', '1', '1499253066', '1', '1499231466', '0');
INSERT INTO `tp_mall_worship` VALUES ('467', '595c74f8835e5', '228', '8', '382', '香菇面筋', '20', '2', '2', '/static/upload/goods/j04_t_170.png', '1', '1499253080', '1', '1499231480', '0');
INSERT INTO `tp_mall_worship` VALUES ('468', '595c7510057bc', '228', '8', '612', '苏打水', '20', '2', '2', '/static/upload/goods/j05_t_34.png', '1', '1499253104', '1', '1499231504', '0');
INSERT INTO `tp_mall_worship` VALUES ('469', '595c752e01ab3', '228', '8', '286', '石榴', '20', '2', '2', '/static/upload/goods/j04_t_74.png', '1', '1499253134', '1', '1499231534', '0');
INSERT INTO `tp_mall_worship` VALUES ('470', '595c754401ab3', '228', '8', '185', '铁观音', '30', '3', '3', '/static/upload/goods/j05_t_03.png', '1', '1499253156', '1', '1499231556', '0');
INSERT INTO `tp_mall_worship` VALUES ('471', '595dfa92cbd90', '2', '3', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1499352818', '1', '1499331218', '0');
INSERT INTO `tp_mall_worship` VALUES ('472', '595dfa9a58ee1', '2', '3', '788', '思念款款', '60', '6', '6', '/static/upload/goods/j03_t_19.png', '1', '1499352826', '1', '1499331226', '0');
INSERT INTO `tp_mall_worship` VALUES ('473', '595dfb4461fd7', '2', '3', '788', '思念款款', '60', '6', '6', '/static/upload/goods/j03_t_19.png', '1', '1499352996', '1', '1499331396', '0');
INSERT INTO `tp_mall_worship` VALUES ('474', '595dfcdb931ab', '2', '3', '790', '扶郎', '30', '3', '3', '/static/upload/goods/j03_t_18.png', '1', '1499353403', '1', '1499331803', '0');
INSERT INTO `tp_mall_worship` VALUES ('475', '595e03894247c', '2', '3', '126', '功德香', '20', '1', '2', '/static/upload/goods/j01_t_05.png', '1', '1499355113', '1', '1499333513', '0');
INSERT INTO `tp_mall_worship` VALUES ('476', '595e039a3473b', '2', '3', '125', '报乐香', '20', '1', '2', '/static/upload/goods/j01_t_04.png', '1', '1499355130', '1', '1499333530', '0');
INSERT INTO `tp_mall_worship` VALUES ('477', '595e0435b0ab0', '2', '3', '124', '思念香', '10', '1', '1', '/static/upload/goods/j01_t_03.png', '1', '1499355285', '1', '1499333685', '0');
INSERT INTO `tp_mall_worship` VALUES ('478', '595e04b9848f8', '2', '3', '330', '小鱼花生', '10', '1', '1', '/static/upload/goods/j04_t_118.png', '1', '1499355417', '1', '1499333817', '0');
INSERT INTO `tp_mall_worship` VALUES ('479', '595e04bc22cf2', '2', '3', '329', '香菇炖鸡', '30', '3', '3', '/static/upload/goods/j04_t_117.png', '1', '1499355420', '1', '1499333820', '0');
INSERT INTO `tp_mall_worship` VALUES ('480', '595e04c102255', '2', '3', '436', '油焖虾', '150', '15', '15', '/static/upload/goods/j04_t_224.png', '1', '1499355425', '1', '1499333825', '0');
INSERT INTO `tp_mall_worship` VALUES ('481', '595e04d4713fb', '2', '3', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499355444', '1', '1499333844', '0');
INSERT INTO `tp_mall_worship` VALUES ('482', '595e04d77cee6', '2', '3', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499355447', '1', '1499333847', '0');
INSERT INTO `tp_mall_worship` VALUES ('483', '595e06dc44300', '2', '3', '126', '功德香', '20', '1', '2', '/static/upload/goods/j01_t_05.png', '1', '1499355964', '1', '1499334364', '0');
INSERT INTO `tp_mall_worship` VALUES ('484', '595edd6849e8e', '2', '3', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1499410888', '1', '1499389288', '0');
INSERT INTO `tp_mall_worship` VALUES ('485', '595edd6c518a0', '2', '3', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499410892', '1', '1499389292', '0');
INSERT INTO `tp_mall_worship` VALUES ('486', '595edd6f83215', '2', '3', '126', '功德香', '20', '1', '2', '/static/upload/goods/j01_t_05.png', '1', '1499410895', '1', '1499389295', '0');
INSERT INTO `tp_mall_worship` VALUES ('487', '595edd779a04b', '2', '3', '127', '增福香', '20', '1', '2', '/static/upload/goods/j01_t_06.png', '1', '1499410903', '1', '1499389303', '0');
INSERT INTO `tp_mall_worship` VALUES ('488', '595edd7e090f5', '2', '3', '124', '思念香', '10', '1', '1', '/static/upload/goods/j01_t_03.png', '1', '1499410910', '1', '1499389310', '0');
INSERT INTO `tp_mall_worship` VALUES ('489', '595edd929dd54', '2', '3', '230', '花篮', '150', '15', '15', '/static/upload/goods/j07_t_08.png', '1', '1499410930', '1', '1499389330', '0');
INSERT INTO `tp_mall_worship` VALUES ('490', '595edd974db97', '2', '3', '132', '莲花酥油灯', '30', '3', '3', '/static/upload/goods/j02_t_05.png', '1', '1499410935', '1', '1499389335', '0');
INSERT INTO `tp_mall_worship` VALUES ('491', '595f24e027d0d', '2', '3', '231', '花篮', '150', '15', '15', '/static/upload/goods/j07_t_09.png', '1', '1499429184', '1', '1499407584', '0');
INSERT INTO `tp_mall_worship` VALUES ('492', '595f24e707641', '2', '3', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1499429191', '1', '1499407591', '0');
INSERT INTO `tp_mall_worship` VALUES ('493', '595f4d9b293f1', '5', '2', '130', '古典庄园烛台', '10', '1', '1', '/static/upload/goods/j02_t_03.png', '1', '1499439611', '1', '1499418011', '0');
INSERT INTO `tp_mall_worship` VALUES ('494', '595f4deb87e60', '5', '2', '230', '花篮', '150', '15', '15', '/static/upload/goods/j07_t_08.png', '1', '1499439691', '1', '1499418091', '0');
INSERT INTO `tp_mall_worship` VALUES ('495', '5962cbe043f30', '1', '3', '181', '行礼', '0', '0', '0', '/static/upload/goods/j06_t_03.png', '1', '1499668544', '1', '1499646944', '0');
INSERT INTO `tp_mall_worship` VALUES ('496', '5962cd85ef9c5', '5', '2', '790', '扶郎', '30', '3', '3', '/static/upload/goods/j03_t_18.png', '1', '1499668965', '1', '1499647365', '0');
INSERT INTO `tp_mall_worship` VALUES ('497', '5962d4882d0fa', '15', '3', '181', '行礼', '0', '0', '0', '/static/upload/goods/j06_t_03.png', '1', '1499670760', '1', '1499649160', '0');
INSERT INTO `tp_mall_worship` VALUES ('498', '5962d5bdb663e', '15', '3', '181', '行礼', '0', '0', '0', '/static/upload/goods/j06_t_03.png', '1', '1499671069', '1', '1499649469', '0');
INSERT INTO `tp_mall_worship` VALUES ('499', '5962d5c3256e8', '15', '3', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1499671075', '1', '1499649475', '0');
INSERT INTO `tp_mall_worship` VALUES ('500', '5962d60eaaf23', '15', '3', '126', '功德香', '20', '1', '2', '/static/upload/goods/j01_t_05.png', '1', '1499671150', '1', '1499649550', '0');
INSERT INTO `tp_mall_worship` VALUES ('501', '5962d9c79baff', '15', '3', '789', '菊', '30', '3', '3', '/static/upload/goods/j03_t_17.png', '1', '1499672103', '1', '1499650503', '0');
INSERT INTO `tp_mall_worship` VALUES ('502', '5962d9cbe42aa', '15', '3', '788', '思念款款', '60', '6', '6', '/static/upload/goods/j03_t_19.png', '1', '1499672107', '1', '1499650507', '0');
INSERT INTO `tp_mall_worship` VALUES ('503', '5962d9d238815', '15', '3', '437', '鱼头浓汤', '30', '3', '3', '/static/upload/goods/j04_t_225.png', '1', '1499672114', '1', '1499650514', '0');
INSERT INTO `tp_mall_worship` VALUES ('504', '5962d9d5e05a1', '15', '3', '436', '油焖虾', '150', '15', '15', '/static/upload/goods/j04_t_224.png', '1', '1499672117', '1', '1499650517', '0');
INSERT INTO `tp_mall_worship` VALUES ('505', '5962d9dab2935', '15', '3', '435', '油焖春笋', '10', '1', '1', '/static/upload/goods/j04_t_223.png', '1', '1499672122', '1', '1499650522', '0');
INSERT INTO `tp_mall_worship` VALUES ('506', '5962da659f808', '15', '3', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499672261', '1', '1499650661', '0');
INSERT INTO `tp_mall_worship` VALUES ('507', '5962da695705d', '15', '3', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499672265', '1', '1499650665', '0');
INSERT INTO `tp_mall_worship` VALUES ('508', '5962dba9d4e86', '15', '3', '373', '坛烧肥鸡', '30', '3', '3', '/static/upload/goods/j04_t_161.png', '1', '1499672585', '1', '1499650985', '0');
INSERT INTO `tp_mall_worship` VALUES ('509', '5962dbafc976b', '15', '3', '374', '五香肉卷', '30', '3', '3', '/static/upload/goods/j04_t_162.png', '1', '1499672591', '1', '1499650991', '0');
INSERT INTO `tp_mall_worship` VALUES ('510', '5963644db56fc', '5', '1', '207', '莲花', '10', '1', '1', '/static/upload/goods/j03_t_15.png', '1', '1499707565', '1', '1499685965', '0');
INSERT INTO `tp_mall_worship` VALUES ('511', '5963748fc8829', '19', '1', '790', '扶郎', '30', '3', '3', '/static/upload/goods/j03_t_18.png', '1', '1499711727', '1', '1499690127', '0');
INSERT INTO `tp_mall_worship` VALUES ('512', '5963749bcc532', '19', '1', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499711739', '1', '1499690139', '0');
INSERT INTO `tp_mall_worship` VALUES ('513', '59637f2596eb4', '5', '2', '134', '心经莲花灯', '30', '3', '3', '/static/upload/goods/j02_t_07.png', '1', '1499714437', '1', '1499692837', '0');
INSERT INTO `tp_mall_worship` VALUES ('514', '596445de33bca', '5', '2', '132', '莲花酥油灯', '30', '3', '3', '/static/upload/goods/j02_t_05.png', '1', '1499765310', '1', '1499743710', '0');
INSERT INTO `tp_mall_worship` VALUES ('515', '596448351908b', '5', '2', '125', '报乐香', '20', '1', '2', '/static/upload/goods/j01_t_04.png', '1', '1499765909', '1', '1499744309', '0');
INSERT INTO `tp_mall_worship` VALUES ('516', '5964486c0d970', '5', '2', '579', '三层洋楼', '600', '60', '60', '/static/upload/goods/j05_t_174.png', '1', '1499765964', '1', '1499744364', '0');
INSERT INTO `tp_mall_worship` VALUES ('517', '59649227ecbfe', '5', '2', '788', '思念款款', '60', '6', '6', '/static/upload/goods/j03_t_19.png', '1', '1499784839', '1', '1499763239', '0');
INSERT INTO `tp_mall_worship` VALUES ('518', '596492b690b85', '22', '2', '181', '行礼', '0', '0', '0', '/static/upload/goods/j06_t_03.png', '1', '1499784982', '1', '1499763382', '0');
INSERT INTO `tp_mall_worship` VALUES ('519', '596492cd82a74', '22', '2', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1499785005', '1', '1499763405', '0');
INSERT INTO `tp_mall_worship` VALUES ('520', '59649ec87b803', '13', '2', '134', '心经莲花灯', '30', '3', '3', '/static/upload/goods/j02_t_07.png', '1', '1499788072', '1', '1499766472', '0');
INSERT INTO `tp_mall_worship` VALUES ('521', '59657e955f9b1', '5', '2', '383', '鸭血粉丝汤', '20', '2', '2', '/static/upload/goods/j04_t_171.png', '1', '1499845365', '1', '1499823765', '0');
INSERT INTO `tp_mall_worship` VALUES ('522', '59688335855e8', '22', '1', '262', '面包', '10', '1', '1', '/static/upload/goods/j04_t_50.png', '1', '1500043157', '1', '1500021557', '0');
INSERT INTO `tp_mall_worship` VALUES ('523', '596c19e26e1b5', '13', '1', '266', '水晶猪手', '30', '0', '3', '/static/upload/goods/j04_t_54.png', '1', '1500278338', '1', '1500256738', '0');
INSERT INTO `tp_mall_worship` VALUES ('524', '596c19f3b56dd', '13', '1', '532', '长耳兔', '150', '15', '15', '/static/upload/goods/j05_t_129.png', '1', '1500278355', '1', '1500256755', '0');
INSERT INTO `tp_mall_worship` VALUES ('525', '596c1a0819928', '13', '1', '528', '狗', '300', '30', '30', '/static/upload/goods/j05_t_125.png', '1', '1500278376', '1', '1500256776', '0');
INSERT INTO `tp_mall_worship` VALUES ('526', '596c1a12a3c0c', '13', '1', '263', '披萨', '30', '3', '3', '/static/upload/goods/j04_t_51.png', '1', '1500278386', '1', '1500256786', '0');
INSERT INTO `tp_mall_worship` VALUES ('527', '596c1a38e9189', '6', '1', '329', '香菇炖鸡', '30', '3', '3', '/static/upload/goods/j04_t_117.png', '1', '1500278424', '1', '1500256824', '0');
INSERT INTO `tp_mall_worship` VALUES ('528', '596c1a43d98d3', '6', '1', '270', '炸鸡啤酒套餐', '60', '6', '6', '/static/upload/goods/j04_t_58.png', '1', '1500278435', '1', '1500256835', '0');
INSERT INTO `tp_mall_worship` VALUES ('529', '596c1a66069e2', '6', '1', '259', '烤鸡翅膀', '20', '2', '2', '/static/upload/goods/j04_t_47.png', '1', '1500278470', '1', '1500256870', '0');
INSERT INTO `tp_mall_worship` VALUES ('530', '596c1a6c1ea05', '6', '1', '262', '面包', '10', '1', '1', '/static/upload/goods/j04_t_50.png', '1', '1500278476', '1', '1500256876', '0');
INSERT INTO `tp_mall_worship` VALUES ('531', '596c1a9750f07', '6', '1', '256', '方便面', '10', '1', '1', '/static/upload/goods/j04_t_44.png', '1', '1500278519', '1', '1500256919', '0');
INSERT INTO `tp_mall_worship` VALUES ('532', '596c1aab99777', '6', '1', '165', '糖果', '20', '2', '2', '/static/upload/goods/j04_t_19.png', '1', '1500278539', '1', '1500256939', '0');
INSERT INTO `tp_mall_worship` VALUES ('533', '596c1acee91c6', '13', '1', '264', '青团子', '10', '1', '1', '/static/upload/goods/j04_t_52.png', '1', '1500278574', '1', '1500256974', '0');
INSERT INTO `tp_mall_worship` VALUES ('534', '596c1ad89e959', '13', '1', '790', '扶郎', '30', '3', '3', '/static/upload/goods/j03_t_18.png', '1', '1500278584', '1', '1500256984', '0');
INSERT INTO `tp_mall_worship` VALUES ('535', '596c1ae6540b5', '13', '1', '133', '铜莲花蜡烛', '20', '2', '2', '/static/upload/goods/j02_t_06.png', '1', '1500278598', '1', '1500256998', '0');
INSERT INTO `tp_mall_worship` VALUES ('536', '596c1aefec889', '13', '1', '127', '增福香', '20', '1', '2', '/static/upload/goods/j01_t_06.png', '1', '1500278607', '1', '1500257007', '0');

-- ----------------------------
-- Table structure for tp_member_follow
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_follow`;
CREATE TABLE `tp_member_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员关注索引id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='andy - 会员关注表';

-- ----------------------------
-- Records of tp_member_follow
-- ----------------------------
INSERT INTO `tp_member_follow` VALUES ('1', '2', '1', '0');

-- ----------------------------
-- Table structure for tp_member_worship
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_worship`;
CREATE TABLE `tp_member_worship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户祭拜表主键ID',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `hall_id` int(11) NOT NULL COMMENT '纪念馆ID',
  `hall_integral` int(11) NOT NULL DEFAULT '0' COMMENT '纪念馆祭拜值',
  `member_integral` int(11) NOT NULL DEFAULT '0' COMMENT '用户祭拜值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='andy - 用户祭拜表';

-- ----------------------------
-- Records of tp_member_worship
-- ----------------------------
INSERT INTO `tp_member_worship` VALUES ('2', '1', '1', '7', '7');
INSERT INTO `tp_member_worship` VALUES ('3', '1', '2', '3', '3');
INSERT INTO `tp_member_worship` VALUES ('4', '1', '5', '96', '96');
INSERT INTO `tp_member_worship` VALUES ('5', '3', '5', '42', '42');
INSERT INTO `tp_member_worship` VALUES ('6', '3', '6', '6', '6');
INSERT INTO `tp_member_worship` VALUES ('7', '3', '1', '2', '2');
INSERT INTO `tp_member_worship` VALUES ('8', '3', '2', '115', '115');
INSERT INTO `tp_member_worship` VALUES ('9', '3', '3', '1', '1');
INSERT INTO `tp_member_worship` VALUES ('10', '3', '4', '2', '2');
INSERT INTO `tp_member_worship` VALUES ('11', '2', '42', '2', '2');
INSERT INTO `tp_member_worship` VALUES ('12', '2', '1', '22', '22');
INSERT INTO `tp_member_worship` VALUES ('13', '8', '223', '2', '2');
INSERT INTO `tp_member_worship` VALUES ('14', '10', '1', '16', '16');
INSERT INTO `tp_member_worship` VALUES ('15', '8', '228', '112', '112');
INSERT INTO `tp_member_worship` VALUES ('16', '2', '5', '95', '95');
INSERT INTO `tp_member_worship` VALUES ('17', '3', '15', '43', '43');
INSERT INTO `tp_member_worship` VALUES ('18', '1', '19', '5', '5');
INSERT INTO `tp_member_worship` VALUES ('19', '2', '22', '2', '2');
INSERT INTO `tp_member_worship` VALUES ('20', '2', '13', '3', '3');
INSERT INTO `tp_member_worship` VALUES ('21', '1', '22', '1', '1');
INSERT INTO `tp_member_worship` VALUES ('22', '1', '13', '59', '59');
INSERT INTO `tp_member_worship` VALUES ('23', '1', '6', '15', '15');

-- ----------------------------
-- Table structure for tp_page
-- ----------------------------
DROP TABLE IF EXISTS `tp_page`;
CREATE TABLE `tp_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档id',
  `page_type` char(50) DEFAULT NULL COMMENT '单页特殊类型',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `description` char(200) NOT NULL DEFAULT '' COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `image` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1正常 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='andy - 单页表';

-- ----------------------------
-- Records of tp_page
-- ----------------------------
INSERT INTO `tp_page` VALUES ('1', 'about', '', '关于我们', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; cursor: pointer; font-family: 微软雅黑; color: rgb(51, 51, 51); font-size: 1.03em; line-height: 22px; text-indent: 20px; letter-spacing: 2px; white-space: normal;\">云南环拓科技有限公司是一家专业从事系统开发、网站建设、电商平台建设、移动互联网应用开发等互联网业务的高新技术企业。公司成立于2010年1月，注册资金360万元。6年来我们一直秉承着“为客户创造价值，用作品说明一切”的经营理念，已为众多企业及政府搭建好有效的互联网平台。在业界中取得骄人成绩。环拓，环四周而拓展之意。公司坚持自主研发，坚持创新。在电商、移动互联网等领域大胆尝试，取得了很多同行和客户的认可。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; cursor: pointer; font-family: 微软雅黑; color: rgb(51, 51, 51); font-size: 1.03em; line-height: 22px; text-indent: 20px; letter-spacing: 2px; white-space: normal;\">我们更加注重高端个性化定制。我们更加关注项目的后期运营和推广，项目的业务流程及盈利模式。和客户一起成长。 我们专注电子商务，“技术研发+实战培训+分润共赢+自营电商外贸”，真正参与到电商的各环节运营中。一切为了订单。为了让电子商务更加简单和高效。我们不断地向沿海发达地区引进先进的电商思维及技术，并同本地几十家电商企业，共同摸索云南电商发展之道。</p><p><br/></p>', '关于我们', null, '', '10000', '0', '1500453097', '0');
INSERT INTO `tp_page` VALUES ('2', 'cooperation', '', '合作伙伴', '<p>合作伙伴</p>', '合作伙伴', null, '', '10000', '1500453402', '1500453357', '0');
INSERT INTO `tp_page` VALUES ('3', '', '', '法律声明', '<p>法律声明</p>', '法律声明', null, '', '10000', '0', '1500453626', '0');
INSERT INTO `tp_page` VALUES ('4', '', '', '服务条款', '<p>服务条款</p>', '服务条款', null, '', '10000', '0', '1500453640', '0');
INSERT INTO `tp_page` VALUES ('5', '', '', '联系我们', '<p>联系我们</p>', '联系我们', null, '', '10000', '0', '1500453650', '0');

-- ----------------------------
-- Table structure for tp_picture
-- ----------------------------
DROP TABLE IF EXISTS `tp_picture`;
CREATE TABLE `tp_picture` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '图片高度',
  `size` varchar(32) NOT NULL DEFAULT '' COMMENT '图片大小',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `uid` varchar(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  `mid` varchar(32) NOT NULL DEFAULT '' COMMENT '模型ID',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '模型名称',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COMMENT='andy - 图片表';

-- ----------------------------
-- Records of tp_picture
-- ----------------------------
INSERT INTO `tp_picture` VALUES ('-4', 'local', '/static/upload/picture/default/default.png', '0', '0', '', '0', '', '', '', '0');
INSERT INTO `tp_picture` VALUES ('34', 'local', '/static/upload/20170603/c2c29b1b9c8ab806.jpg', '0', '0', '9', '0', '', '', '', '1496450645');
INSERT INTO `tp_picture` VALUES ('35', 'local', '/static/upload/20170603/02a4b77d4efa277e.jpg', '0', '0', '9', '0', '', '', '', '1496451114');
INSERT INTO `tp_picture` VALUES ('36', 'local', '/static/upload/20170603/166bfb11dfefe7d9.jpg', '0', '0', '9', '0', '', '', '', '1496451132');
INSERT INTO `tp_picture` VALUES ('37', 'local', '/static/upload/20170603/fde71e5fb8780fce.jpg', '0', '0', '9', '0', '', '', '', '1496451149');
INSERT INTO `tp_picture` VALUES ('38', 'local', '/static/upload/20170603/b41d3e677e2757ab.jpg', '0', '0', '21', '0', '', '', '', '1496451252');
INSERT INTO `tp_picture` VALUES ('39', 'local', '/static/upload/20170603/ec604a7e207110bd.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453507');
INSERT INTO `tp_picture` VALUES ('40', 'local', '/static/upload/20170603/2f383f2f4c620f73.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453578');
INSERT INTO `tp_picture` VALUES ('41', 'local', '/static/upload/20170603/9a73521fce7a657c.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453804');
INSERT INTO `tp_picture` VALUES ('42', 'local', '/static/upload/20170603/75429982a0f6bd58.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453825');
INSERT INTO `tp_picture` VALUES ('43', 'local', '/static/upload/20170603/c7b88807c28e3b4a.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453847');
INSERT INTO `tp_picture` VALUES ('44', 'local', '/static/upload/20170603/16953a590315ff98.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453887');
INSERT INTO `tp_picture` VALUES ('45', 'local', '/static/upload/20170603/71fec0d115034dfd.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453893');
INSERT INTO `tp_picture` VALUES ('46', 'local', '/static/upload/20170603/826bc2c47cfa09cd.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496453906');
INSERT INTO `tp_picture` VALUES ('47', 'local', '/static/upload/20170603/17b8b07060477ef9.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496456707');
INSERT INTO `tp_picture` VALUES ('48', 'local', '/static/upload/20170603/98bc8b54cf106623.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496456916');
INSERT INTO `tp_picture` VALUES ('49', 'local', '/static/upload/20170603/bab51e80688b3c20.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496457027');
INSERT INTO `tp_picture` VALUES ('50', 'local', '/static/upload/20170603/724369b315537318.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496457460');
INSERT INTO `tp_picture` VALUES ('51', 'local', '/static/upload/20170603/fab2553e896b80e1.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496457503');
INSERT INTO `tp_picture` VALUES ('52', 'local', '/static/upload/20170603/0ae934ef29247bb4.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496457577');
INSERT INTO `tp_picture` VALUES ('53', 'local', '/static/upload/20170603/e0d79d3a1ec8381c4fa93623fc7ad687.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496457721');
INSERT INTO `tp_picture` VALUES ('54', 'local', '/static/upload/20170603/23e338d238e3cf36.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496457981');
INSERT INTO `tp_picture` VALUES ('55', 'local', '/static/upload/20170603/aca5bfadf3db.jpg.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496458078');
INSERT INTO `tp_picture` VALUES ('56', 'local', '/static/upload/20170603/0d24e41dbead5ef66fec4949aed2976d.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496458121');
INSERT INTO `tp_picture` VALUES ('57', 'local', '/static/upload/20170603/ec9050d53f35fe8c.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496458316');
INSERT INTO `tp_picture` VALUES ('58', 'local', '/static/default/default.png', '0', '0', '', '0', '', '', '', '0');
INSERT INTO `tp_picture` VALUES ('60', 'local', '/static/upload/20170603/4d6a0553ad8ae2d9e7cfe52b39e07336.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496460406');
INSERT INTO `tp_picture` VALUES ('61', 'local', '/static/upload/20170603/d5991ea6d58ba1028b94a5fba789b8f5.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496460686');
INSERT INTO `tp_picture` VALUES ('62', 'local', '/static/upload/20170603/62633ca2e6922ce95f20621f6d4b8b79.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496460708');
INSERT INTO `tp_picture` VALUES ('63', 'local', '/static/upload/20170603/d4d53c1389acf1c938ce56cd0c9c2c16.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496460763');
INSERT INTO `tp_picture` VALUES ('64', 'local', '/static/upload/20170603/cfeda028b0bdca739bcec5dbe1de31a5.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496461966');
INSERT INTO `tp_picture` VALUES ('65', 'local', '/static/upload/20170603/cdf0f14b259ed313e7a2e437b2bc3a60.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496466387');
INSERT INTO `tp_picture` VALUES ('66', 'local', '/static/upload/20170603/66cb2c2ca404cca9d2cd1607f1611fb7.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496466482');
INSERT INTO `tp_picture` VALUES ('67', 'local', '/static/upload/20170603/f8bb887e200bcc201bb5cba4209a907c.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496466483');
INSERT INTO `tp_picture` VALUES ('68', 'local', '/static/upload/20170603/d1903296f694e4c079f03cbf4b5250b4.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496467665');
INSERT INTO `tp_picture` VALUES ('69', 'local', '/static/upload/20170603/4963b548d217384269e7da0df3f3aab4.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496467727');
INSERT INTO `tp_picture` VALUES ('70', 'local', '/static/upload/20170603/4e7b0f3f69f3f8e9a4b5e23ba43e47cc.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496467995');
INSERT INTO `tp_picture` VALUES ('71', 'local', '/static/upload/20170603/6cc74991d07840f3bb8a2d6b16cf707f.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468058');
INSERT INTO `tp_picture` VALUES ('72', 'local', '/static/upload/20170603/d9d79716fc2012f3eb4366988e751375.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468150');
INSERT INTO `tp_picture` VALUES ('73', 'local', '/static/upload/20170603/98bd18a5a6553e8aeab23ea71ff88f6e.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468468');
INSERT INTO `tp_picture` VALUES ('74', 'local', '/static/upload/20170603/9ae68542b0ddf703c91a3c952ebcf026.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468497');
INSERT INTO `tp_picture` VALUES ('75', 'local', '/static/upload/20170603/8a85c856421a3c2d06560f8f7a56c7bc.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468611');
INSERT INTO `tp_picture` VALUES ('76', 'local', '/static/upload/20170603/7bd6f18c69a6d9b4c4e95e4a095fc6bb.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468715');
INSERT INTO `tp_picture` VALUES ('77', 'local', '/static/upload/20170603/972484e25253775a7753f9a4cb12d5ae.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496468715');
INSERT INTO `tp_picture` VALUES ('78', 'local', '/static/upload/20170603/055dbf932a3affc11f9c2bdcb2f4a3a8.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496468727');
INSERT INTO `tp_picture` VALUES ('79', 'local', '/static/upload/20170603/cc174e75c855bc51e8a66d4cae96b086.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496468727');
INSERT INTO `tp_picture` VALUES ('80', 'local', '/static/upload/20170603/79e53788c2ad4252d7fcb1210c2cb76c.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496470201');
INSERT INTO `tp_picture` VALUES ('81', 'local', '/static/upload/20170603/d992b5134645c5e7555b72320123a0ca.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496470201');
INSERT INTO `tp_picture` VALUES ('82', 'local', '/static/upload/20170603/6045d2b9feb980f8a024040978027cac.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496470217');
INSERT INTO `tp_picture` VALUES ('83', 'local', '/static/upload/20170603/e8ea0c04e541fbe5b03333f019aa6a78.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496470217');
INSERT INTO `tp_picture` VALUES ('84', 'local', '/static/upload/20170603/1066a8a836517f65bd6c2efe3dc3cad8.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496470286');
INSERT INTO `tp_picture` VALUES ('85', 'local', '/static/upload/20170603/b6562c116f5da12542be30aa9253da68.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496470286');
INSERT INTO `tp_picture` VALUES ('86', 'local', '/static/upload/20170603/d7cb6d0d326f487a80a7f8277491d8d7.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496470291');
INSERT INTO `tp_picture` VALUES ('87', 'local', '/static/upload/20170603/a5ee3d4472df02f772b524a4e34171fe.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496470291');
INSERT INTO `tp_picture` VALUES ('88', 'local', '/static/upload/20170603/64a7bd953c7a2614e7d500c76c042ed4.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496471723');
INSERT INTO `tp_picture` VALUES ('89', 'local', '/static/upload/20170603/c12ca50732c1967b780c0213dfebcde1.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496471723');
INSERT INTO `tp_picture` VALUES ('90', 'local', '/static/upload/20170603/c35a40349c825b239d055df2b043c2ab.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496472581');
INSERT INTO `tp_picture` VALUES ('91', 'local', '/static/upload/20170603/4b9493cde22d36f71240574efc826554.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496472581');
INSERT INTO `tp_picture` VALUES ('92', 'local', '/static/upload/test/20170603/6639ceaee694c55594e78c208527b8d5.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496472833');
INSERT INTO `tp_picture` VALUES ('93', 'local', '/static/upload/test/20170603/beecd5ccfd4e556c3cedf0c86514dadd.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496472833');
INSERT INTO `tp_picture` VALUES ('94', 'local', '/static/upload/picture/20170603/c69361b9ff4190062cb3471bbf1510b2.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496473233');
INSERT INTO `tp_picture` VALUES ('95', 'local', '/static/upload/picture/20170603/79241f292b104c50ec554b72d19498ea.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496473233');
INSERT INTO `tp_picture` VALUES ('96', 'local', 'static/upload/picture/20170603/33d67bda472cb441013ca563462061d2.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496473626');
INSERT INTO `tp_picture` VALUES ('97', 'local', 'static/upload/picture/20170603/2c54d7ed5f592a74b2ad909ba20b6994.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496473627');
INSERT INTO `tp_picture` VALUES ('98', 'local', 'static/upload/picture/20170603/06eb866b917f1eeeed4659d4b5c2024b.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496473637');
INSERT INTO `tp_picture` VALUES ('99', 'local', 'static/upload/picture/20170603/2f4b12bc7204e79cc261a504a4a4f9d4.jpeg', '0', '0', '20.99KB', '0', '', '', '', '1496473637');
INSERT INTO `tp_picture` VALUES ('100', 'local', '/static/upload/picture/20170603/85af2fd4e744fdf870a7122b463ab717.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496473811');
INSERT INTO `tp_picture` VALUES ('101', 'local', '/static/upload/picture/20170603/8c65511635d41a9fb0afcb1644ca2fb6.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496473811');
INSERT INTO `tp_picture` VALUES ('102', 'local', '/static/upload/avatar/20170603/fe43eb67a955bd30ac8b6fc296d1c1e1.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496474389');
INSERT INTO `tp_picture` VALUES ('103', 'local', '/static/upload/avatar/20170603/07469cbf9618064e501db731bfa78ce9.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496474390');
INSERT INTO `tp_picture` VALUES ('104', 'local', 'static/upload/avatar/20170603/b0772bef30f5c9efdb3a096409deacec.jpeg', '0', '0', '9.03KB', '0', '', '', '', '1496474634');
INSERT INTO `tp_picture` VALUES ('105', 'local', '/static/upload/avatar/20170603/19b5256ffab0aa9d4009bac217ab20dd.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496474717');
INSERT INTO `tp_picture` VALUES ('106', 'local', '/static/upload/avatar/20170603/4ed1846c4f4fe0e860556f5674dc7dd7.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496474730');
INSERT INTO `tp_picture` VALUES ('107', 'local', '/static/upload/avatar/20170603/5d97aab2bb093617f2e7e0d6692ebaac.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496474730');
INSERT INTO `tp_picture` VALUES ('108', 'local', '/static/upload/picture/20170603/8806123d2cf49d7eb6fea6f3a06ee0f4.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496480090');
INSERT INTO `tp_picture` VALUES ('109', 'local', '/static/upload/picture/20170603/1d024b643dfc0a1c8aa57e0148039a29.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496480090');
INSERT INTO `tp_picture` VALUES ('110', 'local', '/static/upload/picture/20170605/02e815e108b09cae4f26920fa6b27769.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496638806');
INSERT INTO `tp_picture` VALUES ('111', 'local', '/static/upload/picture/20170605/a6575b688693f965db7a838d1c54c3b6.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496639445');
INSERT INTO `tp_picture` VALUES ('112', 'local', '/static/upload/picture/20170605/08e95057c0de63781049177c772ef3fa.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496639520');
INSERT INTO `tp_picture` VALUES ('113', 'local', '/static/upload/picture/20170605/df63125c73484f2535bfd38a055a20bc.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496639644');
INSERT INTO `tp_picture` VALUES ('114', 'local', '/static/upload/picture/20170605/efc0d4571bbb91008de0b2e5af5b6a4b.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496640645');
INSERT INTO `tp_picture` VALUES ('115', 'local', '/static/upload/picture/20170605/6929f9a8fd0ccc8986f0511ddb6b6706.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496640716');
INSERT INTO `tp_picture` VALUES ('116', 'local', '/static/upload/picture/20170605/61dbc1934c2d192e3b96cf9233b8340d.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496640980');
INSERT INTO `tp_picture` VALUES ('117', 'local', '/static/upload/picture/20170605/16188e23c0805a6e19a57cf9db880d12.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496641053');
INSERT INTO `tp_picture` VALUES ('118', 'local', '/static/upload/picture/20170605/0156507e81b3b47c6ee9f9d542474e1b.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496641252');
INSERT INTO `tp_picture` VALUES ('119', 'local', '/static/upload/picture/20170605/5bcf6fcfc402f570e43fb0dd5ae4536c.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496641312');
INSERT INTO `tp_picture` VALUES ('120', 'local', '/static/upload/picture/20170605/916bf510f93f7a321d0a0a0c30c468f1.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496641498');
INSERT INTO `tp_picture` VALUES ('121', 'local', '/static/upload/picture/20170605/d9e126c04bcdc303365bb7c96b1f53f9.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496641532');
INSERT INTO `tp_picture` VALUES ('122', 'local', '/static/upload/picture/20170605/4dcc26e62f6f61df63a65c2b3b83506b.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496641632');
INSERT INTO `tp_picture` VALUES ('123', 'local', '/static/upload/picture/20170605/b646b7d203ba60c3544e430f16d0215b.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496641688');
INSERT INTO `tp_picture` VALUES ('124', 'local', '/static/upload/picture/20170605/4bdbdc9f2879908d462288f4dcc6950c.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496641726');
INSERT INTO `tp_picture` VALUES ('125', 'local', '/static/upload/picture/20170605/4a124370da8b372f501cbc82bd8ff76a.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496641760');
INSERT INTO `tp_picture` VALUES ('126', 'local', '/static/upload/picture/20170605/9a642960c19ba64eb2dad10179d4a0cc.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496641919');
INSERT INTO `tp_picture` VALUES ('127', 'local', '/static/upload/picture/20170605/e72e3f8aee88c38d21e9bcc47b436226.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496641964');
INSERT INTO `tp_picture` VALUES ('128', 'local', '/static/upload/picture/20170605/f90425062a6f8139bec4c3ab2b2154cc.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496642015');
INSERT INTO `tp_picture` VALUES ('129', 'local', '/static/upload/picture/20170605/080bb71391e336dea1d4fdbe4bf1845f.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496642066');
INSERT INTO `tp_picture` VALUES ('130', 'local', '/static/upload/picture/20170605/288aba9dfa46d8e30909670d09af0afe.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496642126');
INSERT INTO `tp_picture` VALUES ('131', 'local', '/static/upload/picture/20170605/f4f028af779f795781b9405c6e56e3a2.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496642169');
INSERT INTO `tp_picture` VALUES ('132', 'local', '/static/upload/picture/20170605/4bed99fdab1e620ecd5955643045eba7.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496642187');
INSERT INTO `tp_picture` VALUES ('133', 'local', '/static/upload/picture/20170605/22bce7ce76a199867a7439f76ecb9d22.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496642223');
INSERT INTO `tp_picture` VALUES ('134', 'local', '/static/upload/picture/20170605/7828badce158af24cf43f5b38e590c6c.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496642260');
INSERT INTO `tp_picture` VALUES ('135', 'local', '/static/upload/picture/20170605/5f0069e68ae765af72b29c571fcc231f.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496642310');
INSERT INTO `tp_picture` VALUES ('136', 'local', '/static/upload/picture/20170605/26a50e4bd26e9af3971ddc2fef84476b.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496642439');
INSERT INTO `tp_picture` VALUES ('137', 'local', '/static/upload/picture/20170605/8c9aa495cec0ce52aa5dc5d7d5852298.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496642484');
INSERT INTO `tp_picture` VALUES ('138', 'local', '/static/upload/picture/20170605/14d932883ebd5f89e31b2614858a7513.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496642593');
INSERT INTO `tp_picture` VALUES ('139', 'local', '/static/upload/picture/20170605/c2decbd5e1fd8aeb9b3e709355bf2048.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496642618');
INSERT INTO `tp_picture` VALUES ('140', 'local', '/static/upload/picture/20170605/7efc0e1abe1c2caf5443d198f54908a0.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496642657');
INSERT INTO `tp_picture` VALUES ('141', 'local', '/static/upload/picture/20170605/16a4b2827541ca585e57d71a18a05592.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496642701');
INSERT INTO `tp_picture` VALUES ('142', 'local', '/static/upload/picture/20170605/d8ff2a3ba325408127d27730545a4eb0.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496642773');
INSERT INTO `tp_picture` VALUES ('143', 'local', '/static/upload/picture/20170605/3d24e52290e8a13c0049f90668f840ec.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496642936');
INSERT INTO `tp_picture` VALUES ('144', 'local', '/static/upload/picture/20170605/0b1712676cd70e508006d8fcd0d5ab67.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496642965');
INSERT INTO `tp_picture` VALUES ('145', 'local', '/static/upload/picture/20170605/bd71a3c37890da2dca85d79af21f2521.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496642989');
INSERT INTO `tp_picture` VALUES ('146', 'local', '/static/upload/picture/20170605/393156560950f662a8e114b3e6298256.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643009');
INSERT INTO `tp_picture` VALUES ('147', 'local', '/static/upload/picture/20170605/edafa3793060aebe3213dc7c8dbc8cc8.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643056');
INSERT INTO `tp_picture` VALUES ('148', 'local', '/static/upload/picture/20170605/fcbf31bcbcd2dfe5a6d568947e306bb3.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643536');
INSERT INTO `tp_picture` VALUES ('149', 'local', '/static/upload/picture/20170605/619b00d9a8dec01d33a2faaf6078117e.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496643596');
INSERT INTO `tp_picture` VALUES ('150', 'local', '/static/upload/picture/20170605/b2b37b2634d032df355dc21f21b83d6c.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643654');
INSERT INTO `tp_picture` VALUES ('151', 'local', '/static/upload/picture/20170605/5054b389cea87f9d69063a7f9c40e6b1.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643685');
INSERT INTO `tp_picture` VALUES ('152', 'local', '/static/upload/picture/20170605/753a806d06e181fcf2e31f94e92925a1.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643837');
INSERT INTO `tp_picture` VALUES ('153', 'local', '/static/upload/picture/20170605/46623d7194a27e87e94334ed12d6a46d.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643870');
INSERT INTO `tp_picture` VALUES ('154', 'local', '/static/upload/picture/20170605/f218b34863d501184d1dd9a881d321a1.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643920');
INSERT INTO `tp_picture` VALUES ('155', 'local', '/static/upload/picture/20170605/fdce987e0252bb57bd14aa731c87fc2f.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496643981');
INSERT INTO `tp_picture` VALUES ('156', 'local', '/static/upload/picture/20170605/fd40b505224eb007900b7e6a98e3de6e.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496644001');
INSERT INTO `tp_picture` VALUES ('157', 'local', '/static/upload/picture/20170605/495afeaa629e052626490b74952deeb2.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496644072');
INSERT INTO `tp_picture` VALUES ('158', 'local', '/static/upload/picture/20170605/cdff93dfd3af3c203878e00cb16859ff.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496644118');
INSERT INTO `tp_picture` VALUES ('159', 'local', '/static/upload/picture/20170605/34102dd505f25808261ba9e251688103.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496645676');
INSERT INTO `tp_picture` VALUES ('160', 'local', '/static/upload/picture/20170605/ab2d89502b986f8ff30ac5b77ed7d47c.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496645717');
INSERT INTO `tp_picture` VALUES ('161', 'local', '/static/upload/picture/20170605/8e3681a44f0790d98f054e5bfcbb7511.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496645738');
INSERT INTO `tp_picture` VALUES ('162', 'local', '/static/upload/picture/20170605/80a912597cf9bf25e70fd4ab4842a1ff.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496646474');
INSERT INTO `tp_picture` VALUES ('163', 'local', '/static/upload/picture/20170605/6c07cf7d4fc3fba36b2fa051aeeac531.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496646747');
INSERT INTO `tp_picture` VALUES ('164', 'local', '/static/upload/picture/20170605/8587af562b6a79a9dc6da3c621598a90.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496646822');
INSERT INTO `tp_picture` VALUES ('165', 'local', '/static/upload/picture/20170605/1c823163850a3433c87f66b468dbc15e.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496646845');
INSERT INTO `tp_picture` VALUES ('166', 'local', '/static/upload/picture/20170605/86a4fb3641bfe4cd49e7587a800fe9a5.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496647514');
INSERT INTO `tp_picture` VALUES ('167', 'local', '/static/upload/picture/20170605/1454e5555a7b4534d141192ae3259ea7.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496647765');
INSERT INTO `tp_picture` VALUES ('168', 'local', '/static/upload/picture/20170605/d9ae490fdd950cf403bf5b305eb24cac.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496647923');
INSERT INTO `tp_picture` VALUES ('169', 'local', '/static/upload/picture/20170605/32b951a4afa353c93d0749d8e4bb5ec4.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496648447');
INSERT INTO `tp_picture` VALUES ('170', 'local', '/static/upload/picture/20170605/a28dace4093d5cd77f0d793d22ec86bd.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496648493');
INSERT INTO `tp_picture` VALUES ('171', 'local', '/static/upload/picture/20170605/a4c2272d3166089c3ac41ae742ebc58f.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496648589');
INSERT INTO `tp_picture` VALUES ('172', 'local', '/static/upload/picture/20170605/dcb99d325b982275221638fd4eba5d65.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496648617');
INSERT INTO `tp_picture` VALUES ('173', 'local', '/static/upload/picture/20170605/b9c1f03c25b6105150adee0e6bd5477f.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496649107');
INSERT INTO `tp_picture` VALUES ('174', 'local', '/static/upload/picture/20170605/e088039f45e5dae8bd8517f1c788ca4b.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496649154');
INSERT INTO `tp_picture` VALUES ('175', 'local', '/static/upload/picture/20170605/7650266b85c61e7d9ee1d10f0dc7a491.png', '0', '0', '7.65KB', '0', '', '', '', '1496649380');
INSERT INTO `tp_picture` VALUES ('176', 'local', '/static/upload/picture/20170605/13abc05697154390dc53f67ada4bac6b.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496649400');
INSERT INTO `tp_picture` VALUES ('177', 'local', '/static/upload/picture/20170605/1d11c08533a8216ab1a219c5a54eff1e.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496649878');
INSERT INTO `tp_picture` VALUES ('178', 'local', '/static/upload/picture/20170605/e9827e63d9150553c04d2b642b289872.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496650417');
INSERT INTO `tp_picture` VALUES ('179', 'local', '/static/upload/picture/20170605/b00bf0ccb146b08dd1bac3cdec3bfe16.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496650417');
INSERT INTO `tp_picture` VALUES ('180', 'local', '/static/upload/picture/20170605/b0e273adf890daef0e59000256bc31c9.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496650430');
INSERT INTO `tp_picture` VALUES ('181', 'local', '/static/upload/picture/20170605/f2321f9d0bec509310daa552f22df72c.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496650431');
INSERT INTO `tp_picture` VALUES ('182', 'local', '/static/upload/picture/20170605/74807c883f4d307912081eb7dfba3729.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496650431');
INSERT INTO `tp_picture` VALUES ('183', 'local', '/static/upload/picture/20170605/2522136d5b7666b837bb02f0b730516b.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496650431');
INSERT INTO `tp_picture` VALUES ('184', 'local', '/static/upload/picture/20170605/15ac4561a68eda96687bef5aa9502c4c.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496653984');
INSERT INTO `tp_picture` VALUES ('185', 'local', '/static/upload/picture/20170606/3d9d442fe1e3b0d94c02c9e8810b068e.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496710041');
INSERT INTO `tp_picture` VALUES ('186', 'local', '/static/upload/music/20170606/549209371d274952a2642236e27dc66d.mp3', '0', '0', '5.14MB', '0', '', '', '', '1496711130');
INSERT INTO `tp_picture` VALUES ('187', 'local', '/static/upload/picture/20170606/9943f238908a13636390901f8cc82af2.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496714618');
INSERT INTO `tp_picture` VALUES ('188', 'local', '/static/upload/picture/20170606/bea46164ebe064c83ab8fd32653d7a1e.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496714714');
INSERT INTO `tp_picture` VALUES ('189', 'local', '/static/upload/picture/20170606/e92e8dc9cc014272f5917d3acf17429b.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496714937');
INSERT INTO `tp_picture` VALUES ('190', 'local', '/static/upload/picture/20170606/8b1c518501a3ee7310a220d304371d95.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496715038');
INSERT INTO `tp_picture` VALUES ('191', 'local', '/static/upload/picture/20170606/b5097cb9d8edd57ddffada604cce94e8.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496715111');
INSERT INTO `tp_picture` VALUES ('192', 'local', '/static/upload/picture/20170606/b92f2b56ea3f515d560772b97173e6da.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496715142');
INSERT INTO `tp_picture` VALUES ('193', 'local', '/static/upload/music/20170606/8c7340401e3ba30d2d1aef327f97c170.mp3', '0', '0', '5.14MB', '0', '', '', '', '1496715971');
INSERT INTO `tp_picture` VALUES ('194', 'local', '/static/upload/picture/20170606/3299f1dcf70745f189ff0f6f385d8b45.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496716177');
INSERT INTO `tp_picture` VALUES ('195', 'local', '/static/upload/music/20170606/27836000717c6759be294c35b10bb992.mp3', '0', '0', '5.14MB', '0', '', '', '', '1496717236');
INSERT INTO `tp_picture` VALUES ('196', 'local', '/static/upload/music/20170606/a956d45bfce9fe395dab9a31f8a338f4.mp3', '0', '0', '5.14MB', '0', '', '', '', '1496717444');
INSERT INTO `tp_picture` VALUES ('197', 'local', '/static/upload/picture/20170606/eeb90cf1cc0bd85a5e8dcb4acb605cfd.jpg', '0', '0', '172.78KB', '0', '', '', '', '1496717526');
INSERT INTO `tp_picture` VALUES ('198', 'local', '/static/upload/picture/20170606/b881974f9f8b89dc1755c3c1f399f1b3.jpg', '0', '0', '34.08KB', '0', '', '', '', '1496717527');
INSERT INTO `tp_picture` VALUES ('199', 'local', '/static/upload/picture/20170606/3987ebd427debdbd9c21599c80385b34.jpg', '0', '0', '826.11KB', '0', '', '', '', '1496717527');
INSERT INTO `tp_picture` VALUES ('200', 'local', '/static/upload/picture/20170606/f9bed1cb0102eb500f833ef7ca8ef880.jpg', '0', '0', '858.78KB', '0', '', '', '', '1496717527');
INSERT INTO `tp_picture` VALUES ('201', 'local', '/static/upload/music/20170606/c0875e0199becdc30328641070533810.mp3', '0', '0', '2.9MB', '0', '', '', '', '1496717705');
INSERT INTO `tp_picture` VALUES ('202', 'local', '/static/upload/music/20170606/1b5ac0afa797433866d6d5182d9cb2da.mp3', '0', '0', '5.14MB', '0', '', '', '', '1496717739');
INSERT INTO `tp_picture` VALUES ('203', 'local', '/static/upload/music/20170606/ad7b42dd36e71cc5ca4ee73205e6dffa.mp3', '0', '0', '2.9MB', '0', '', '', '', '1496717832');
INSERT INTO `tp_picture` VALUES ('204', 'local', '/static/upload/music/20170606/3e5a393623689a46085258389f23e11e.mp3', '0', '0', '2.9MB', '0', '', '', '', '1496717865');
INSERT INTO `tp_picture` VALUES ('205', 'local', '/static/upload/picture/20170606/349e30e41b1deb89afa84c75c54086f9.jpg', '0', '0', '172.78KB', '0', '', '', '', '1496717989');
INSERT INTO `tp_picture` VALUES ('206', 'local', '/static/upload/picture/20170606/905ebc8ecc0589a42789527a85fd6451.jpg', '0', '0', '826.11KB', '0', '', '', '', '1496718011');
INSERT INTO `tp_picture` VALUES ('207', 'local', '/static/upload/picture/20170606/c34f0bfc47e0435c6189bf691f1fa69c.jpg', '0', '0', '858.78KB', '0', '', '', '', '1496718012');
INSERT INTO `tp_picture` VALUES ('208', 'local', '/static/upload/picture/20170606/1c2a74af52c1e750d860fdb895d35433.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496719152');
INSERT INTO `tp_picture` VALUES ('209', 'local', '/static/upload/picture/20170606/95b32ab9e74b1021eb63a9cfaecee4e0.jpg', '0', '0', '72.39KB', '0', '', '', '', '1496719193');
INSERT INTO `tp_picture` VALUES ('210', 'local', '/static/upload/picture/20170606/29ae8982cf4565aa2e02b2f4bed78068.jpg', '0', '0', '9.03KB', '0', '', '', '', '1496719577');
INSERT INTO `tp_picture` VALUES ('211', 'local', '/static/upload/picture/20170606/80e2495acefacfae29757160edc92b78.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496719582');
INSERT INTO `tp_picture` VALUES ('212', 'local', '/static/upload/picture/20170606/0645af14a3bfb6eb5695922756c657e9.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496719924');
INSERT INTO `tp_picture` VALUES ('213', 'local', '/static/upload/picture/20170607/9801096b56025e58d6a6b219bd802454.jpg', '0', '0', '23.79KB', '0', '', '', '', '1496801132');
INSERT INTO `tp_picture` VALUES ('214', 'local', '/static/upload/picture/20170607/02ece898c9a5b63c666420af521b2792.jpg', '0', '0', '20.99KB', '0', '', '', '', '1496801584');

-- ----------------------------
-- Table structure for tp_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tp_recharge`;
CREATE TABLE `tp_recharge` (
  `pd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pd_sn` bigint(20) NOT NULL COMMENT '记录唯一标识',
  `pd_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pd_member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '会员名称',
  `pd_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pd_payment_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '充值方式',
  `pd_payment_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '充值方式',
  `pd_trade_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方支付接口交易号',
  `pd_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pd_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '支付状态0未支付1支付',
  `pd_payment_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  PRIMARY KEY (`pd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for tp_site_column
-- ----------------------------
DROP TABLE IF EXISTS `tp_site_column`;
CREATE TABLE `tp_site_column` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '网站栏目索引id',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `page_id` int(11) NOT NULL COMMENT '单页ID',
  `name` varchar(100) NOT NULL COMMENT '栏目标识 通常为英文字母加下划线',
  `short_name` varchar(100) NOT NULL COMMENT '栏目短名称 如：about contact',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='andy - 网站栏目表';

-- ----------------------------
-- Records of tp_site_column
-- ----------------------------
INSERT INTO `tp_site_column` VALUES ('2', '0', '0', '0', 'top_nav', '', '顶部导航', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('3', '2', '0', '0', 'top_nav', '', '首页', '', '', '/', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('4', '2', '0', '0', 'top_nav', '', '家族宗祠', '', '', '/home/hall/familyHall', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('5', '2', '0', '0', 'top_nav', '', '个人纪念馆', '', '', '/home/hall/privateHall', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('6', '2', '0', '0', 'top_nav', '', '名人纪念馆', '', '', '/home/hall/famousHall', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('7', '2', '0', '0', 'top_nav', '', '公墓商城', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('8', '2', '0', '0', 'top_nav', '', '殡葬服务', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('9', '2', '0', '0', 'top_nav', '', '行业资讯', '', '', '/home/news', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('10', '2', '0', '1', 'top_nav', 'about', '关于我们', '', '', '/about', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('11', '0', '0', '0', '', '', '底部导航', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('12', '11', '0', '0', '', '', '关于云纪念', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('13', '12', '0', '0', '', '', '云纪念介绍', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('14', '12', '0', '0', '', '', '行业资讯', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('15', '12', '0', '0', '', '', '服务条款', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('16', '12', '0', '0', '', '', '联系我们', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('17', '11', '0', '0', '', '', '民族文化', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('18', '17', '0', '0', '', '', '传统文化', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('19', '17', '0', '0', '', '', '国学精粹', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('20', '17', '0', '0', '', '', '姓氏文化', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('21', '17', '0', '0', '', '', '宗教信仰', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('22', '11', '0', '0', '', '', '网上祭奠', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('23', '22', '0', '0', '', '', '网上纪念馆', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('24', '22', '0', '0', '', '', '家族宗祠', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('25', '22', '0', '0', '', '', '免费建馆', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('26', '22', '0', '0', '', '', '祭奠商城', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('27', '11', '0', '0', '', '', '帮助中心', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('28', '27', '0', '0', '', '', '建馆帮助', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('29', '27', '0', '0', '', '', '新手上路', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('30', '27', '0', '0', '', '', '如何网上祭祀', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('31', '27', '0', '0', '', '', '如何创建纪念馆', '', '', '#', '', '_self', '0', '1', '0', '2147483647');

-- ----------------------------
-- Table structure for tp_storage_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage_category`;
CREATE TABLE `tp_storage_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '寄存位置分类索引id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类父id 0 顶级分类',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `row` int(11) NOT NULL COMMENT '行数',
  `column` int(11) NOT NULL COMMENT '列数',
  `description` text COMMENT '分类简介',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='andy - 寄存位置分类表';

-- ----------------------------
-- Records of tp_storage_category
-- ----------------------------
INSERT INTO `tp_storage_category` VALUES ('1', '0', '兰花厅', '0', '0', '兰花厅', '0', null, '1498700097');
INSERT INTO `tp_storage_category` VALUES ('2', '1', '一室', '10', '10', '一室', '0', null, '1498700114');
INSERT INTO `tp_storage_category` VALUES ('3', '1', '二室', '30', '10', '二室', '0', null, '1498700128');
INSERT INTO `tp_storage_category` VALUES ('4', '0', '菊花厅', '0', '0', '菊花厅', '0', null, '1498700142');
INSERT INTO `tp_storage_category` VALUES ('5', '4', '一室', '30', '10', '一室', '0', null, '1498700153');
INSERT INTO `tp_storage_category` VALUES ('6', '4', '二室', '3', '10', '二室', '0', null, '1498700163');
INSERT INTO `tp_storage_category` VALUES ('7', '0', '梅花厅', '0', '0', '梅花厅', '0', null, '1498700176');
INSERT INTO `tp_storage_category` VALUES ('8', '7', '一室', '10', '10', '一室', '0', null, '1498700183');
INSERT INTO `tp_storage_category` VALUES ('9', '7', '二室', '10', '10', '二室', '0', null, '1498700191');

-- ----------------------------
-- Table structure for tp_storage_dead
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage_dead`;
CREATE TABLE `tp_storage_dead` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '逝者表主键ID',
  `dead_name` varchar(255) NOT NULL COMMENT '逝者姓名',
  `dead_id_card` varchar(200) NOT NULL COMMENT '身份证号',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别 1 男 2 女 0 未设置',
  `dead_birthday` date NOT NULL COMMENT '逝者生日',
  `dead_domicile` varchar(200) NOT NULL COMMENT '户籍所在地',
  `dead_deadday` date NOT NULL COMMENT '死亡日期',
  `address` varchar(255) DEFAULT NULL COMMENT '生前住址',
  `dead_workplace` varchar(200) DEFAULT NULL COMMENT '工作单位',
  `dead_nation` char(50) NOT NULL COMMENT '民族',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_by` int(11) NOT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `update_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='andy - 逝者表';

-- ----------------------------
-- Records of tp_storage_dead
-- ----------------------------
INSERT INTO `tp_storage_dead` VALUES ('997', '张国荣', '522000000000000', '1', '1970-07-02', '香港', '2010-07-14', '香港某区', '香港某区香港某区香港某区', '汉', '1', '10002', '1499064935', '1499074767');
INSERT INTO `tp_storage_dead` VALUES ('998', '邓丽君', '5220000000000033', '2', '2017-07-03', '香港', '2017-07-03', '香港某区', '香港某区香港某区香港某区', '汉', '1', '10003', '1499074909', '1499155719');
INSERT INTO `tp_storage_dead` VALUES ('999', '黄家驹', '52200000000000044', '1', '2017-07-04', '香港', '2017-07-04', '香港某区', '香港某区香港某区香港某区', '汉', '1', '10002', '1499149002', '0');
INSERT INTO `tp_storage_dead` VALUES ('1000', '阿达大', '52200000000000011', '1', '2017-07-04', '香港', '2017-07-04', '香港某区', '香港某区香港某区香港某区', '汉', '1', '10002', '1499149086', '0');

-- ----------------------------
-- Table structure for tp_storage_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage_order`;
CREATE TABLE `tp_storage_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '寄存订单索引id',
  `order_sn` varchar(255) NOT NULL COMMENT '订单编号',
  `register_id` int(11) NOT NULL COMMENT '寄存登记 ID',
  `register_sn` varchar(255) NOT NULL COMMENT '寄存登记编号',
  `customer_id` int(11) NOT NULL COMMENT '寄存人ID',
  `customer_name` char(50) DEFAULT NULL COMMENT '寄存人姓名',
  `urn_id` int(11) NOT NULL COMMENT '寄存位ID',
  `urn_name` char(100) NOT NULL COMMENT '寄存位名称',
  `start_time` date DEFAULT NULL COMMENT '开始日期',
  `end_time` date DEFAULT NULL COMMENT '结束日期',
  `remark` text COMMENT '备注信息',
  `cost` int(11) NOT NULL COMMENT '订单总额',
  `price` int(11) NOT NULL COMMENT '寄存位价格',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` int(11) NOT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='andy - 寄存订单表';

-- ----------------------------
-- Records of tp_storage_order
-- ----------------------------
INSERT INTO `tp_storage_order` VALUES ('16', '1000200020003-595B331E5CB46', '11', '1000200020003-595B331E2F5FA', '10003', 'ding', '2426', '兰花厅一', '2017-07-04', '2017-07-04', '阿达', '1234', '2000', '1', '0', '10002', '1499149086');

-- ----------------------------
-- Table structure for tp_storage_register
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage_register`;
CREATE TABLE `tp_storage_register` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '寄存客户登记索引id',
  `urn_id` int(11) NOT NULL COMMENT '骨灰盒类型ID',
  `urn_sn` varchar(255) NOT NULL COMMENT '寄存位编号',
  `register_sn` varchar(255) NOT NULL COMMENT '寄存登记编号',
  `dead_id` int(11) NOT NULL COMMENT '逝者ID',
  `customer_id` int(11) NOT NULL COMMENT '寄存人ID',
  `customer_name` char(50) NOT NULL COMMENT '寄存人姓名',
  `cost` int(11) NOT NULL COMMENT '寄存费用',
  `remark` text COMMENT '寄存备注',
  `relation` varchar(100) DEFAULT NULL COMMENT '与逝者关系',
  `start_time` date DEFAULT NULL COMMENT '开始日期',
  `end_time` date DEFAULT NULL COMMENT '结束日期',
  `leave_time` date DEFAULT NULL COMMENT '取走日期',
  `leave_remark` text COMMENT '取走备注',
  `leaver` char(50) NOT NULL COMMENT '取走人',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` int(11) NOT NULL COMMENT '创建者',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='andy - 寄存登记表';

-- ----------------------------
-- Records of tp_storage_register
-- ----------------------------
INSERT INTO `tp_storage_register` VALUES ('8', '2446', '', '5959ea67a6b26', '997', '10003', 'ding', '2000', '购买', '夫妻', '2017-07-03', '2017-08-09', null, null, '', '1', '0', '10002', '1499074767', '1499064935');
INSERT INTO `tp_storage_register` VALUES ('9', '2424', '', '595a115d46b92', '998', '10004', 'aaaaa', '34223', '是的范德萨发', '啊啊啊', '2017-07-03', '2018-07-03', null, null, '', '1', '0', '10003', '1499155719', '1499074909');
INSERT INTO `tp_storage_register` VALUES ('10', '2425', '1000200020002', '1000200020002-595B32CABF704', '999', '10003', 'ding', '50000', '146看见看见', '亲爱东风', '2017-07-04', '2017-07-04', null, null, '', '1', '0', '10002', '0', '1499149002');
INSERT INTO `tp_storage_register` VALUES ('11', '2426', '1000200020003', '1000200020003-595B331E2F5FA', '1000', '10003', 'ding', '1234', '阿达', '亲爱东风', '2017-07-04', '2017-07-04', null, null, '', '1', '0', '10002', '0', '1499149086');

-- ----------------------------
-- Table structure for tp_storage_urn
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage_urn`;
CREATE TABLE `tp_storage_urn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urn_sn` varchar(255) NOT NULL COMMENT '位置编号',
  `register_id` int(11) NOT NULL COMMENT '寄存ID',
  `category_id` int(11) NOT NULL COMMENT '寄存分类ID',
  `type_id` int(11) NOT NULL DEFAULT '1' COMMENT '骨灰盒型ID',
  `name` varchar(100) NOT NULL COMMENT '寄存位置名称',
  `dead_name` varchar(100) NOT NULL COMMENT '逝者姓名',
  `price` int(11) NOT NULL COMMENT '寄存价格（单价：天）',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_sold` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否售出 1 是 0 否',
  `create_by` int(11) NOT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `update_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3151 DEFAULT CHARSET=utf8 COMMENT='andy - 寄存位置（骨灰盒）主表';

-- ----------------------------
-- Records of tp_storage_urn
-- ----------------------------
INSERT INTO `tp_storage_urn` VALUES ('2414', '1000200060021', '0', '6', '1', '菊花厅二', '', '23', '0', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2415', '1000200060022', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2416', '1000200060023', '0', '6', '1', '菊花厅二', '', '23', '0', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2417', '1000200060024', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2418', '1000200060025', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2419', '1000200060026', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2420', '1000200060027', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2421', '1000200060028', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2422', '1000200060029', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2423', '1000200060030', '0', '6', '1', '菊花厅二', '', '23', '1', '0', '10002', '1498804874', '0');
INSERT INTO `tp_storage_urn` VALUES ('2424', '1000200020001', '9', '2', '1', '兰花厅一', '邓丽君', '2000', '1', '1', '10002', '1499064705', '1499155719');
INSERT INTO `tp_storage_urn` VALUES ('2425', '1000200020002', '10', '2', '1', '兰花厅一', '黄家驹', '2000', '1', '1', '10002', '1499064705', '1499149002');
INSERT INTO `tp_storage_urn` VALUES ('2426', '1000200020003', '11', '2', '1', '兰花厅一', '阿达大', '2000', '1', '1', '10002', '1499064705', '1499149086');
INSERT INTO `tp_storage_urn` VALUES ('2427', '1000200020004', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2428', '1000200020005', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2429', '1000200020006', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2430', '1000200020007', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2431', '1000200020008', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2432', '1000200020009', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2433', '1000200020010', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2434', '1000200020011', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2435', '1000200020012', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2436', '1000200020013', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2437', '1000200020014', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2438', '1000200020015', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2439', '1000200020016', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2440', '1000200020017', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2441', '1000200020018', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2442', '1000200020019', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2443', '1000200020020', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2444', '1000200020021', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2445', '1000200020022', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2446', '1000200020023', '8', '2', '1', '兰花厅一', '张国荣', '2000', '1', '1', '10002', '1499064705', '1499074767');
INSERT INTO `tp_storage_urn` VALUES ('2447', '1000200020024', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2448', '1000200020025', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2449', '1000200020026', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2450', '1000200020027', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2451', '1000200020028', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2452', '1000200020029', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2453', '1000200020030', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2454', '1000200020031', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2455', '1000200020032', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2456', '1000200020033', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2457', '1000200020034', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2458', '1000200020035', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2459', '1000200020036', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2460', '1000200020037', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2461', '1000200020038', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2462', '1000200020039', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2463', '1000200020040', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2464', '1000200020041', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2465', '1000200020042', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2466', '1000200020043', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2467', '1000200020044', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2468', '1000200020045', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2469', '1000200020046', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2470', '1000200020047', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2471', '1000200020048', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2472', '1000200020049', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2473', '1000200020050', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2474', '1000200020051', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2475', '1000200020052', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2476', '1000200020053', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2477', '1000200020054', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2478', '1000200020055', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2479', '1000200020056', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2480', '1000200020057', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2481', '1000200020058', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2482', '1000200020059', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2483', '1000200020060', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2484', '1000200020061', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2485', '1000200020062', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2486', '1000200020063', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2487', '1000200020064', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2488', '1000200020065', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2489', '1000200020066', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2490', '1000200020067', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2491', '1000200020068', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2492', '1000200020069', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2493', '1000200020070', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2494', '1000200020071', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2495', '1000200020072', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2496', '1000200020073', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2497', '1000200020074', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2498', '1000200020075', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2499', '1000200020076', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2500', '1000200020077', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2501', '1000200020078', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2502', '1000200020079', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2503', '1000200020080', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2504', '1000200020081', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2505', '1000200020082', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2506', '1000200020083', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2507', '1000200020084', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2508', '1000200020085', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2509', '1000200020086', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2510', '1000200020087', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2511', '1000200020088', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2512', '1000200020089', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2513', '1000200020090', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2514', '1000200020091', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2515', '1000200020092', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2516', '1000200020093', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2517', '1000200020094', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2518', '1000200020095', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2519', '1000200020096', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2520', '1000200020097', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2521', '1000200020098', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2522', '1000200020099', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2523', '1000200020100', '0', '2', '1', '兰花厅一', '', '2000', '1', '0', '10002', '1499064705', '0');
INSERT INTO `tp_storage_urn` VALUES ('2551', '1000200030001', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2552', '1000200030002', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2553', '1000200030003', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2554', '1000200030004', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2555', '1000200030005', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2556', '1000200030006', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2557', '1000200030007', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2558', '1000200030008', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2559', '1000200030009', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2560', '1000200030010', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2561', '1000200030011', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2562', '1000200030012', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2563', '1000200030013', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2564', '1000200030014', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2565', '1000200030015', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2566', '1000200030016', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2567', '1000200030017', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2568', '1000200030018', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2569', '1000200030019', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2570', '1000200030020', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2571', '1000200030021', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2572', '1000200030022', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2573', '1000200030023', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2574', '1000200030024', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2575', '1000200030025', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2576', '1000200030026', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2577', '1000200030027', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2578', '1000200030028', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2579', '1000200030029', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2580', '1000200030030', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2581', '1000200030031', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2582', '1000200030032', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2583', '1000200030033', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2584', '1000200030034', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2585', '1000200030035', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2586', '1000200030036', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2587', '1000200030037', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2588', '1000200030038', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2589', '1000200030039', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2590', '1000200030040', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2591', '1000200030041', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2592', '1000200030042', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2593', '1000200030043', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2594', '1000200030044', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2595', '1000200030045', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2596', '1000200030046', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2597', '1000200030047', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2598', '1000200030048', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2599', '1000200030049', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2600', '1000200030050', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2601', '1000200030051', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2602', '1000200030052', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2603', '1000200030053', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2604', '1000200030054', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2605', '1000200030055', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2606', '1000200030056', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2607', '1000200030057', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2608', '1000200030058', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2609', '1000200030059', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2610', '1000200030060', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2611', '1000200030061', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2612', '1000200030062', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2613', '1000200030063', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2614', '1000200030064', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2615', '1000200030065', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2616', '1000200030066', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2617', '1000200030067', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2618', '1000200030068', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2619', '1000200030069', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2620', '1000200030070', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2621', '1000200030071', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2622', '1000200030072', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2623', '1000200030073', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2624', '1000200030074', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2625', '1000200030075', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2626', '1000200030076', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2627', '1000200030077', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2628', '1000200030078', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2629', '1000200030079', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2630', '1000200030080', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2631', '1000200030081', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2632', '1000200030082', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2633', '1000200030083', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2634', '1000200030084', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2635', '1000200030085', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2636', '1000200030086', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2637', '1000200030087', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2638', '1000200030088', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2639', '1000200030089', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2640', '1000200030090', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2641', '1000200030091', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2642', '1000200030092', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2643', '1000200030093', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2644', '1000200030094', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2645', '1000200030095', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2646', '1000200030096', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2647', '1000200030097', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2648', '1000200030098', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2649', '1000200030099', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2650', '1000200030100', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2651', '1000200030101', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2652', '1000200030102', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2653', '1000200030103', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2654', '1000200030104', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2655', '1000200030105', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2656', '1000200030106', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2657', '1000200030107', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2658', '1000200030108', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2659', '1000200030109', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2660', '1000200030110', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2661', '1000200030111', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2662', '1000200030112', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2663', '1000200030113', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2664', '1000200030114', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2665', '1000200030115', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2666', '1000200030116', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2667', '1000200030117', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2668', '1000200030118', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2669', '1000200030119', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2670', '1000200030120', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2671', '1000200030121', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2672', '1000200030122', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2673', '1000200030123', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2674', '1000200030124', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2675', '1000200030125', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2676', '1000200030126', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2677', '1000200030127', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2678', '1000200030128', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2679', '1000200030129', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2680', '1000200030130', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2681', '1000200030131', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2682', '1000200030132', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2683', '1000200030133', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2684', '1000200030134', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2685', '1000200030135', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2686', '1000200030136', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2687', '1000200030137', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2688', '1000200030138', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2689', '1000200030139', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2690', '1000200030140', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2691', '1000200030141', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2692', '1000200030142', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2693', '1000200030143', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2694', '1000200030144', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2695', '1000200030145', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2696', '1000200030146', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2697', '1000200030147', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2698', '1000200030148', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2699', '1000200030149', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2700', '1000200030150', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2701', '1000200030151', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2702', '1000200030152', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2703', '1000200030153', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2704', '1000200030154', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2705', '1000200030155', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2706', '1000200030156', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2707', '1000200030157', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2708', '1000200030158', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2709', '1000200030159', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2710', '1000200030160', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2711', '1000200030161', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2712', '1000200030162', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2713', '1000200030163', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2714', '1000200030164', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2715', '1000200030165', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2716', '1000200030166', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2717', '1000200030167', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2718', '1000200030168', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2719', '1000200030169', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2720', '1000200030170', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2721', '1000200030171', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2722', '1000200030172', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2723', '1000200030173', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2724', '1000200030174', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2725', '1000200030175', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2726', '1000200030176', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2727', '1000200030177', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2728', '1000200030178', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2729', '1000200030179', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2730', '1000200030180', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2731', '1000200030181', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2732', '1000200030182', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2733', '1000200030183', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2734', '1000200030184', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2735', '1000200030185', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2736', '1000200030186', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2737', '1000200030187', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2738', '1000200030188', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2739', '1000200030189', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2740', '1000200030190', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2741', '1000200030191', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2742', '1000200030192', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2743', '1000200030193', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2744', '1000200030194', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2745', '1000200030195', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2746', '1000200030196', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2747', '1000200030197', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2748', '1000200030198', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2749', '1000200030199', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2750', '1000200030200', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2751', '1000200030201', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2752', '1000200030202', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2753', '1000200030203', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2754', '1000200030204', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2755', '1000200030205', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2756', '1000200030206', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2757', '1000200030207', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2758', '1000200030208', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2759', '1000200030209', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2760', '1000200030210', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2761', '1000200030211', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2762', '1000200030212', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2763', '1000200030213', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2764', '1000200030214', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2765', '1000200030215', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2766', '1000200030216', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2767', '1000200030217', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2768', '1000200030218', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2769', '1000200030219', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2770', '1000200030220', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2771', '1000200030221', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2772', '1000200030222', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2773', '1000200030223', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2774', '1000200030224', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2775', '1000200030225', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2776', '1000200030226', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2777', '1000200030227', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2778', '1000200030228', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2779', '1000200030229', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2780', '1000200030230', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2781', '1000200030231', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2782', '1000200030232', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2783', '1000200030233', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2784', '1000200030234', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2785', '1000200030235', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2786', '1000200030236', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2787', '1000200030237', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2788', '1000200030238', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2789', '1000200030239', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2790', '1000200030240', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2791', '1000200030241', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2792', '1000200030242', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2793', '1000200030243', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2794', '1000200030244', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2795', '1000200030245', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2796', '1000200030246', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2797', '1000200030247', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2798', '1000200030248', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2799', '1000200030249', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2800', '1000200030250', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2801', '1000200030251', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2802', '1000200030252', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2803', '1000200030253', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2804', '1000200030254', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2805', '1000200030255', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2806', '1000200030256', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2807', '1000200030257', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2808', '1000200030258', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2809', '1000200030259', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2810', '1000200030260', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2811', '1000200030261', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2812', '1000200030262', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2813', '1000200030263', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2814', '1000200030264', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2815', '1000200030265', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2816', '1000200030266', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2817', '1000200030267', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2818', '1000200030268', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2819', '1000200030269', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2820', '1000200030270', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2821', '1000200030271', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2822', '1000200030272', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2823', '1000200030273', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2824', '1000200030274', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2825', '1000200030275', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2826', '1000200030276', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2827', '1000200030277', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2828', '1000200030278', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2829', '1000200030279', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2830', '1000200030280', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2831', '1000200030281', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2832', '1000200030282', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2833', '1000200030283', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2834', '1000200030284', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2835', '1000200030285', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2836', '1000200030286', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2837', '1000200030287', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2838', '1000200030288', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2839', '1000200030289', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2840', '1000200030290', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2841', '1000200030291', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2842', '1000200030292', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2843', '1000200030293', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2844', '1000200030294', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2845', '1000200030295', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2846', '1000200030296', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2847', '1000200030297', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2848', '1000200030298', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2849', '1000200030299', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2850', '1000200030300', '0', '3', '1', '梅花厅二', '', '1000', '1', '0', '10002', '1499075519', '0');
INSERT INTO `tp_storage_urn` VALUES ('2851', '1000200050001', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2852', '1000200050002', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2853', '1000200050003', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2854', '1000200050004', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2855', '1000200050005', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2856', '1000200050006', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2857', '1000200050007', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2858', '1000200050008', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2859', '1000200050009', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2860', '1000200050010', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2861', '1000200050011', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2862', '1000200050012', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2863', '1000200050013', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2864', '1000200050014', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2865', '1000200050015', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2866', '1000200050016', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2867', '1000200050017', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2868', '1000200050018', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2869', '1000200050019', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2870', '1000200050020', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2871', '1000200050021', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2872', '1000200050022', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2873', '1000200050023', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2874', '1000200050024', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2875', '1000200050025', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2876', '1000200050026', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2877', '1000200050027', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2878', '1000200050028', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2879', '1000200050029', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2880', '1000200050030', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2881', '1000200050031', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2882', '1000200050032', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2883', '1000200050033', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2884', '1000200050034', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2885', '1000200050035', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2886', '1000200050036', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2887', '1000200050037', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2888', '1000200050038', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2889', '1000200050039', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2890', '1000200050040', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2891', '1000200050041', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2892', '1000200050042', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2893', '1000200050043', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2894', '1000200050044', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2895', '1000200050045', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2896', '1000200050046', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2897', '1000200050047', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2898', '1000200050048', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2899', '1000200050049', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2900', '1000200050050', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2901', '1000200050051', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2902', '1000200050052', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2903', '1000200050053', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2904', '1000200050054', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2905', '1000200050055', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2906', '1000200050056', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2907', '1000200050057', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2908', '1000200050058', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2909', '1000200050059', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2910', '1000200050060', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2911', '1000200050061', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2912', '1000200050062', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2913', '1000200050063', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2914', '1000200050064', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2915', '1000200050065', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2916', '1000200050066', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2917', '1000200050067', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2918', '1000200050068', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2919', '1000200050069', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2920', '1000200050070', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2921', '1000200050071', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2922', '1000200050072', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2923', '1000200050073', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2924', '1000200050074', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2925', '1000200050075', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2926', '1000200050076', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2927', '1000200050077', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2928', '1000200050078', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2929', '1000200050079', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2930', '1000200050080', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2931', '1000200050081', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2932', '1000200050082', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2933', '1000200050083', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2934', '1000200050084', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2935', '1000200050085', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2936', '1000200050086', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2937', '1000200050087', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2938', '1000200050088', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2939', '1000200050089', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2940', '1000200050090', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2941', '1000200050091', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2942', '1000200050092', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2943', '1000200050093', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2944', '1000200050094', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2945', '1000200050095', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2946', '1000200050096', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2947', '1000200050097', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2948', '1000200050098', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2949', '1000200050099', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2950', '1000200050100', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2951', '1000200050101', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2952', '1000200050102', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2953', '1000200050103', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2954', '1000200050104', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2955', '1000200050105', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2956', '1000200050106', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2957', '1000200050107', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2958', '1000200050108', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2959', '1000200050109', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2960', '1000200050110', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2961', '1000200050111', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2962', '1000200050112', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2963', '1000200050113', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2964', '1000200050114', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2965', '1000200050115', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2966', '1000200050116', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2967', '1000200050117', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2968', '1000200050118', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2969', '1000200050119', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2970', '1000200050120', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2971', '1000200050121', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2972', '1000200050122', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2973', '1000200050123', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2974', '1000200050124', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2975', '1000200050125', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2976', '1000200050126', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2977', '1000200050127', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2978', '1000200050128', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2979', '1000200050129', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2980', '1000200050130', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2981', '1000200050131', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2982', '1000200050132', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2983', '1000200050133', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2984', '1000200050134', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2985', '1000200050135', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2986', '1000200050136', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2987', '1000200050137', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2988', '1000200050138', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2989', '1000200050139', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2990', '1000200050140', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2991', '1000200050141', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2992', '1000200050142', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2993', '1000200050143', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2994', '1000200050144', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2995', '1000200050145', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2996', '1000200050146', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2997', '1000200050147', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2998', '1000200050148', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('2999', '1000200050149', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3000', '1000200050150', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3001', '1000200050151', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3002', '1000200050152', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3003', '1000200050153', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3004', '1000200050154', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3005', '1000200050155', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3006', '1000200050156', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3007', '1000200050157', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3008', '1000200050158', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3009', '1000200050159', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3010', '1000200050160', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3011', '1000200050161', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3012', '1000200050162', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3013', '1000200050163', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3014', '1000200050164', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3015', '1000200050165', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3016', '1000200050166', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3017', '1000200050167', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3018', '1000200050168', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3019', '1000200050169', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3020', '1000200050170', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3021', '1000200050171', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3022', '1000200050172', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3023', '1000200050173', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3024', '1000200050174', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3025', '1000200050175', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3026', '1000200050176', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3027', '1000200050177', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3028', '1000200050178', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3029', '1000200050179', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3030', '1000200050180', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3031', '1000200050181', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3032', '1000200050182', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3033', '1000200050183', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3034', '1000200050184', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3035', '1000200050185', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3036', '1000200050186', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3037', '1000200050187', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3038', '1000200050188', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3039', '1000200050189', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3040', '1000200050190', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3041', '1000200050191', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3042', '1000200050192', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3043', '1000200050193', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3044', '1000200050194', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3045', '1000200050195', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3046', '1000200050196', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3047', '1000200050197', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3048', '1000200050198', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3049', '1000200050199', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3050', '1000200050200', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3051', '1000200050201', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3052', '1000200050202', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3053', '1000200050203', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3054', '1000200050204', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3055', '1000200050205', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3056', '1000200050206', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3057', '1000200050207', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3058', '1000200050208', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3059', '1000200050209', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3060', '1000200050210', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3061', '1000200050211', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3062', '1000200050212', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3063', '1000200050213', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3064', '1000200050214', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3065', '1000200050215', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3066', '1000200050216', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3067', '1000200050217', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3068', '1000200050218', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3069', '1000200050219', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3070', '1000200050220', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3071', '1000200050221', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3072', '1000200050222', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3073', '1000200050223', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3074', '1000200050224', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3075', '1000200050225', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3076', '1000200050226', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3077', '1000200050227', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3078', '1000200050228', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3079', '1000200050229', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3080', '1000200050230', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3081', '1000200050231', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3082', '1000200050232', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3083', '1000200050233', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3084', '1000200050234', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3085', '1000200050235', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3086', '1000200050236', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3087', '1000200050237', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3088', '1000200050238', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3089', '1000200050239', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3090', '1000200050240', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3091', '1000200050241', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3092', '1000200050242', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3093', '1000200050243', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3094', '1000200050244', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3095', '1000200050245', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3096', '1000200050246', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3097', '1000200050247', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3098', '1000200050248', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3099', '1000200050249', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3100', '1000200050250', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3101', '1000200050251', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3102', '1000200050252', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3103', '1000200050253', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3104', '1000200050254', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3105', '1000200050255', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3106', '1000200050256', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3107', '1000200050257', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3108', '1000200050258', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3109', '1000200050259', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3110', '1000200050260', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3111', '1000200050261', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3112', '1000200050262', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3113', '1000200050263', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3114', '1000200050264', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3115', '1000200050265', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3116', '1000200050266', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3117', '1000200050267', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3118', '1000200050268', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3119', '1000200050269', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3120', '1000200050270', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3121', '1000200050271', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3122', '1000200050272', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3123', '1000200050273', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3124', '1000200050274', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3125', '1000200050275', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3126', '1000200050276', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3127', '1000200050277', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3128', '1000200050278', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3129', '1000200050279', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3130', '1000200050280', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3131', '1000200050281', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3132', '1000200050282', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3133', '1000200050283', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3134', '1000200050284', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3135', '1000200050285', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3136', '1000200050286', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3137', '1000200050287', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3138', '1000200050288', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3139', '1000200050289', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3140', '1000200050290', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3141', '1000200050291', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3142', '1000200050292', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3143', '1000200050293', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3144', '1000200050294', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3145', '1000200050295', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3146', '1000200050296', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3147', '1000200050297', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3148', '1000200050298', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3149', '1000200050299', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');
INSERT INTO `tp_storage_urn` VALUES ('3150', '1000200050300', '0', '5', '1', '菊花厅一', '', '10', '1', '0', '10002', '1499148424', '0');

-- ----------------------------
-- Table structure for tp_storage_urn_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_storage_urn_type`;
CREATE TABLE `tp_storage_urn_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '骨灰盒名称',
  `description` varchar(255) DEFAULT NULL COMMENT '骨灰盒说明',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `update_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='andy - 骨灰盒型表';

-- ----------------------------
-- Records of tp_storage_urn_type
-- ----------------------------

-- ----------------------------
-- Table structure for tp_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_auth`;
CREATE TABLE `tp_system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统权限表';

-- ----------------------------
-- Records of tp_system_auth
-- ----------------------------
INSERT INTO `tp_system_auth` VALUES ('3', '系统管理员', '1', '0', '拥有一切后台权限', '0', '1495962072');
INSERT INTO `tp_system_auth` VALUES ('4', '测试组', '1', '0', '只拥有部分权限用于测试', '0', '1495962144');

-- ----------------------------
-- Table structure for tp_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_auth_node`;
CREATE TABLE `tp_system_auth_node` (
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of tp_system_auth_node
-- ----------------------------
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/account');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/account/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/account/consume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/position');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/addposition');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/editposition');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/delposition');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/forbidposition');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/ad/resumeposition');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/api');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/api/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/api/detail');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/api/debug');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/area');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/area/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/area/ajaxeditarea');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/area/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/area/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/area/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/category');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/addcategory');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/editcategory');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/article/delcategory');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/apply');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/auth/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/column/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/config/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/records');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/export');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/import');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/optimize');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/repair');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/database/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/category');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/addcategory');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/editcategory');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/delcategory');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/package');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/addpackage');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/editpackage');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/selectgoods');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/delpackage');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/forbidpackage');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/goods/resumepackage');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/group');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/group/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/hallone');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/halltwo');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/editone');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/edittwo');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/hallfamily');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/editfamily');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/hallcelebrity');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addcelebrity');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/hallcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/editcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/delcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/hall_data');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/musiclist');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addmusic');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/editmusic');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/delmusic');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/hallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/worshipstyle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/lingpaistyle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addhallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/edithallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/delhallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/photo');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addphoto');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/editphoto');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/delphoto');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/picture');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addpicture');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/delpicture');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/article');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/addarticle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/editarticle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/hall/delarticle');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/log');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/log/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/log/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/pass');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/member/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/menu/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/node');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/node/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/node/save');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/order');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/order/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/order/ordergoods');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/order/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/order/cancelorder');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/page/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/system');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/system/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/system/file');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/system/wipecache');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/auth');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/pass');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'admin/user/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/config');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/config/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/config/pay');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/fans');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/fans/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/fans/sync');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/index/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/add');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/del');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/resume');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/subscribe');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/keys/defaults');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/menu');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/menu/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/menu/edit');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/menu/cancel');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/news');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/news/index');
INSERT INTO `tp_system_auth_node` VALUES ('3', 'wechat/news/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/account');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/account/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/add');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/resume');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/position');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/addposition');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/editposition');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/delposition');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/forbidposition');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/ad/resumeposition');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/api');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/api/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/api/detail');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/api/debug');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/area');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/area/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/add');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/resume');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/category');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/addcategory');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/editcategory');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/article/delcategory');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column/add');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/column/resume');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/config');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/config/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/database');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/database/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/database/records');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/add');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/resume');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/category');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/addcategory');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/editcategory');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/delcategory');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/package');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/addpackage');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/editpackage');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/selectgoods');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/delpackage');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/forbidpackage');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/goods/resumepackage');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/group');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/group/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/hallone');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/halltwo');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/editone');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/edittwo');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/hallfamily');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/editfamily');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/hallcelebrity');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addcelebrity');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/hallcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/editcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/delcelebritytype');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/hall_data');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/musiclist');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addmusic');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/editmusic');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/delmusic');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/hallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/worshipstyle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/lingpaistyle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addhallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/edithallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/delhallstyle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/photo');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addphoto');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/editphoto');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/delphoto');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/picture');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addpicture');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/delpicture');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/article');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/addarticle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/editarticle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/hall/delarticle');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/log');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/log/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/add');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/pass');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/member/resume');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/menu');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/menu/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/order');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/order/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/order/ordergoods');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/order/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/order/cancelorder');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page/add');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page/edit');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page/del');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page/forbid');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/page/resume');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/system');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/system/wipecache');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/user');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'admin/user/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/fans');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/fans/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/index/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/keys');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/keys/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/menu/index');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/news');
INSERT INTO `tp_system_auth_node` VALUES ('4', 'wechat/news/index');

-- ----------------------------
-- Table structure for tp_system_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_config`;
CREATE TABLE `tp_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '配置编码',
  `title` varchar(32) NOT NULL COMMENT '配置标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL COMMENT '类型',
  `required` tinyint(2) NOT NULL DEFAULT '0' COMMENT '字段是否必须 0非必须 1必须',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(255) NOT NULL COMMENT '配置提示',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='andy - 系统配置表';

-- ----------------------------
-- Records of tp_system_config
-- ----------------------------
INSERT INTO `tp_system_config` VALUES ('148', 'site_name', '网站名称', 'base', 'text', '1', 'Ht.Memorial 后台管理系统', '', '调用方式：<code>sysconfig(\'site_name\')</code>', '1', '1', '0', '1497690050');
INSERT INTO `tp_system_config` VALUES ('149', 'site_copy', '版权信息', 'base', 'text', '0', 'www.yn123.com', '', '调用方式：<code>sysconfig(\'site_copy\')</code>', '2', '1', '0', '1497690050');
INSERT INTO `tp_system_config` VALUES ('164', 'storage_type', '存储引擎', 'storage', 'radio', '0', 'local', 'local:本地服务器\r\nqiniu:七牛云存储', '若还没有七牛云帐号，请点击<a target=\"_blank\" href=\"https://portal.qiniu.com/signup?code=3lhz6nmnwbple\">免费申请10G存储空间</a>，申请成功后添加公开bucket空间', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('165', 'storage_qiniu_is_https', '访问协议', 'storage', 'radio', '0', '1', '1:HTTPS\r\n0:HTTP', '七牛云资源访问协议（HTTP 或 HTTPS），HTTPS 需要配置证书才能使用', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('166', 'storage_qiniu_bucket', '空间名称', 'storage', 'text', '0', 'static', '', '填写七牛云存储空间名称，如：static', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('167', 'storage_qiniu_domain', '访问域名', 'storage', 'text', '0', 'static.ctolog.com', '', '填写七牛云存储访问域名，如：static.yn123.com', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('168', 'storage_qiniu_access_key', '访问秘钥', 'storage', 'text', '0', 'OAFHGzCgZjod2-s4xr-g5ptkXsNbxDO_t2fozIEC', '', '可以在 七牛云 个人中心 设置并获取到访问密钥', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('169', 'storage_qiniu_secret_key', '安全秘钥', 'storage', 'password', '0', 'gy0aYdSFMSayQ4kMkgUeEeJRLThVjLpUJoPFxd-Z', '', '可以在 七牛云 个人中心 设置并获取到安全密钥', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('170', 'storage_qiniu_region', '存储区域', 'storage', 'radio', '0', '华东', '华东:华东\r\n华北:华北\r\n华南:华南\r\n北美:北美', '七牛云存储空间所在区域，需要严格对应储存所在区域才能上传文件', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('173', 'app_name', '程序名称', 'base', 'text', '0', 'Ht.Memorial', '', '调用方式：<code>sysconfig(\'app_name\')</code>', '3', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('174', 'app_version', '程序版本', 'base', 'text', '0', '1.0.0 dev', '', '', '4', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('176', 'browser_icon', '浏览器图标', 'base', 'image', '0', '/static/upload/picture/20170607/0581e50b776789a16064bc80957567f8.jpg', '', '', '5', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('184', 'wechat_appid', '应用ID', 'wechat', 'text', '0', 'wx96530f34672e53ba', '', '公众号应用ID是所有接口必要参数，可以在公众号平台 [ 开发 >> 基本配置 ] 页面获取。', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('185', 'wechat_appsecret', '应用秘钥', 'wechat', 'password', '0', 'e2235d187ddf57af2062232fa546e5fc', '', '公众号应用密钥是所有接口必要参数，可以在公众号平台 [ 开发 >> 基本配置 ] 页面授权后获取。', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('186', 'wechat_token', '令牌', 'wechat', 'text', '0', 'lanrennet', '', '公众号平台与系统对接认证Token，请优先填写此参数并保存，然后再在微信公众号平台操作对接。', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('187', 'wechat_encodingaeskey', 'Encoding AESKey', 'wechat', 'text', '0', 'wNocrsSX1D462VcvASeb2EqVXelMGLUkyvCEGoQcoDV', '', '公众号平台接口设置为加密模式，消息加密密钥必需填写并保持与公众号平台一致。', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('188', 'wechat_mch_id', '商户ID', 'wechat', 'text', '0', '1332187001', '', '注意：商户ID必需与微信接口配置公众号APPID对应，否则无法使用支付功能！', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('189', 'wechat_partnerkey', '商户秘钥', 'wechat', 'password', '0', 'A82DC5BD1F3359081049C568D8502BC5', '', '微信支付商户密钥需要在商户平台配置，必需填写密钥之后才能正常使用微信支付功能。', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('194', 'wechat_cert_key', 'Apiclient key', 'wechat', 'image', '0', '', '', '企业打款、企业红包、订单退款等操作需要使用双向证书，可在微信商户平台下载证书！', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('196', 'wechat_cert_cert', 'Apiclient cert', 'wechat', 'image', '0', '', '', '企业打款、企业红包、订单退款等操作需要使用双向证书，可在微信商户平台下载证书！', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('197', 'content', '', 'default', '', '0', '', '', '', '100', '1', '0', '0');
INSERT INTO `tp_system_config` VALUES ('198', 'site_logo', '站点LOGO', 'base', 'image', '0', '/static/upload/picture/20170609/29c3a8302442ac88a3741a83cf8cbd4d.png', '', '', '6', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('199', 'site_status', '站点开关', 'base', 'radio', '0', '1', '1:开\r\n0:关', '站点关闭后将不能访问，后台可正常登录', '0', '1', '0', '1497690050');
INSERT INTO `tp_system_config` VALUES ('200', 'config_group', '配置分组', 'system', 'textarea', '0', 'base:基本\r\nsystem:系统\r\nupload:上传\r\nstorage:文件存储\r\ndevelop:开发\r\ndatabase:数据库\r\nwechat:微信\r\nsms:短信\r\nemail:邮件', '', '调用方式：<code>sysconf(config_group\')</code>', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('201', 'form_item_type', '配置类型', 'system', 'textarea', '0', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor\r\nwangeditor:wangEditor\r\neditormd:markdown\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '配置表单元素类型，调用方法：<code>sysconf(\'form_item_type\')</code>', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('202', 'data_backup_path', '数据库备份根路径', 'database', 'text', '0', '../data/databack/', '', '路径必须以 / 结尾', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('203', 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '0', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('204', 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '0', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('205', 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '0', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '100', '1', '0', '1497690053');
INSERT INTO `tp_system_config` VALUES ('206', 'develop_mode', '开发模式', 'develop', 'radio', '0', '1', '0:关闭\r\n1:开启', '', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('207', 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '1', '0:否\r\n1:是', '', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('208', 'site_icp', '备案号', 'base', 'text', '0', '', '', '', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('210', 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '0', '', '0为不限制大小，单位：kb', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('211', 'upload_file_ext', '允许上传的文件后缀', 'upload', 'text', '0', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('212', 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '0', '', '0为不限制大小，单位：kb', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('213', 'upload_image_ext', '允许上传的图片后缀', 'upload', 'text', '0', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('214', 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '0', '300,300', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('215', 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '0', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('216', 'upload_thumb_water', '添加水印', 'upload', 'radio', '0', '0', '0:否\r\n1:是', '', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('217', 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '0', '', '', '只有开启水印功能才生效', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('218', 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '0', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('219', 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '0', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '100', '1', '0', '1497690052');
INSERT INTO `tp_system_config` VALUES ('220', 'site_description', '站点描述', 'base', 'textarea', '0', '', '', '网站描述，有利于搜索引擎抓取相关信息', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('221', 'site_keywords', '站点关键词', 'base', 'text', '0', '', '', '网站搜索引擎关键字', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('222', 'site_statistics', '站点统计', 'base', 'textarea', '0', 'adad', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'site_statistics\')</code>', '100', '1', '0', '1497690051');
INSERT INTO `tp_system_config` VALUES ('223', 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', '0', 'TEMP_PATH,LOG_PATH,CACHE_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '100', '1', '1495529995', '1497690051');
INSERT INTO `tp_system_config` VALUES ('224', 'sms_uid', '短信账号', 'sms', 'text', '0', 'gs089597', '', '短信平台用户账号', '100', '1', '1495618620', '1497690053');
INSERT INTO `tp_system_config` VALUES ('225', 'sms_pwd', '用户密码', 'sms', 'text', '0', '147258qaz', '', '短信平台用户密码', '100', '1', '1495618661', '1497690053');
INSERT INTO `tp_system_config` VALUES ('226', 'sms_qm', '短信内容附加内容', 'sms', 'text', '0', '【快递来吧】', '', '', '100', '1', '1495618706', '1497690054');
INSERT INTO `tp_system_config` VALUES ('227', 'smtp_host', 'SMTP 服务器', 'email', 'text', '0', 'smtp.qq.com', '', 'SMTP 服务器地址', '100', '1', '1495783207', '1497690054');
INSERT INTO `tp_system_config` VALUES ('228', 'smtp_port', 'SMTP 服务器端口', 'email', 'text', '0', '465', '', 'SMTP服务器的端口号', '100', '1', '1495783276', '1497690054');
INSERT INTO `tp_system_config` VALUES ('229', 'smtp_username', 'SMTP 用户名', 'email', 'text', '0', '290648237@qq.com', '', 'SMTP服务器用户名', '100', '1', '1495783317', '1497690054');
INSERT INTO `tp_system_config` VALUES ('230', 'smtp_password', 'SMTP 密码', 'email', 'password', '0', 'ltcwhdtmgyhibgeh', '', 'SMTP服务器密码', '100', '1', '1495783356', '1497690054');
INSERT INTO `tp_system_config` VALUES ('231', 'smtp_sender_name', '发送邮件者名称', 'email', 'text', '0', '环拓科技', '', '发送邮件者名称', '100', '1', '1495783526', '1497690054');

-- ----------------------------
-- Table structure for tp_system_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_log`;
CREATE TABLE `tp_system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of tp_system_log
-- ----------------------------
INSERT INTO `tp_system_log` VALUES ('1', '0.0.0.0', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('2', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('3', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('4', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('5', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('6', '192.168.1.130', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('7', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('8', '192.168.1.185', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('9', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('10', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('11', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('12', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('13', '127.0.0.1', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('14', '127.0.0.1', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('15', '127.0.0.1', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('16', '127.0.0.1', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('17', '127.0.0.1', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('18', '127.0.0.1', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('19', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('20', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('21', '127.0.0.1', 'admin/config/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('22', '127.0.0.1', 'admin/config/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('23', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('24', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('25', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('26', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('27', '192.168.1.185', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('28', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('29', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('30', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('31', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('32', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('33', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('34', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('35', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('36', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('37', '192.168.1.108', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('38', '192.168.1.185', 'admin/config/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('39', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('40', '192.168.1.131', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('41', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('42', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('43', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('44', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('45', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('46', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('47', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('48', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('49', '192.168.1.185', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('50', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('51', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('52', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('53', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('54', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('55', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('56', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('57', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('58', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('59', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('60', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('61', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('62', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('63', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('64', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('65', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('66', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('67', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('68', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('69', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('70', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('71', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('72', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('73', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('74', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('75', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('76', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('77', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('78', '192.168.1.134', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('79', '127.0.0.1', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('80', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('81', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('82', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('83', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('84', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('85', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('86', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '2147483647');
INSERT INTO `tp_system_log` VALUES ('131', '192.168.1.185', 'admin/database/export', 'admin', '数据库备份', '数据库备份成功', '1495691747');
INSERT INTO `tp_system_log` VALUES ('133', '192.168.1.185', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`,`tp_ad_position`', '1495695020');
INSERT INTO `tp_system_log` VALUES ('134', '192.168.1.185', 'admin/database/optimize', 'admin', '数据表优化', '{$tables}优化完成！', '1495695105');
INSERT INTO `tp_system_log` VALUES ('135', '192.168.1.185', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`,`tp_ad_position`优化完成！', '1495697816');
INSERT INTO `tp_system_log` VALUES ('136', '192.168.1.185', 'admin/database/repair', 'admin', '数据表修复', '`tp_ad`,`tp_ad_position`', '1495697834');
INSERT INTO `tp_system_log` VALUES ('137', '192.168.1.185', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`,`tp_ad_position`,`tp_article`,`tp_article_category`,`tp_article_tags`,`tp_consume`,`tp_hall`优化完成！', '1495697866');
INSERT INTO `tp_system_log` VALUES ('138', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495699024');
INSERT INTO `tp_system_log` VALUES ('139', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495699021');
INSERT INTO `tp_system_log` VALUES ('140', '192.168.1.185', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`优化完成！', '1495700633');
INSERT INTO `tp_system_log` VALUES ('141', '192.168.1.185', 'admin/database/repair', 'admin', '数据表修复', '`tp_ad`', '1495700657');
INSERT INTO `tp_system_log` VALUES ('142', '192.168.1.185', 'admin/database/export', 'admin', '数据库备份', '数据库备份成功', '1495700775');
INSERT INTO `tp_system_log` VALUES ('143', '192.168.1.185', 'admin/database/repair', 'admin', '数据表修复', '`1495700775`', '1495700788');
INSERT INTO `tp_system_log` VALUES ('144', '192.168.1.185', 'admin/database/del', 'admin', '数据库备份删除', '20170525-162615 删除成功', '1495700810');
INSERT INTO `tp_system_log` VALUES ('145', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495705194');
INSERT INTO `tp_system_log` VALUES ('146', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495760928');
INSERT INTO `tp_system_log` VALUES ('147', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495775884');
INSERT INTO `tp_system_log` VALUES ('148', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495782385');
INSERT INTO `tp_system_log` VALUES ('149', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1495784024');
INSERT INTO `tp_system_log` VALUES ('150', '192.168.1.185', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1495784126');
INSERT INTO `tp_system_log` VALUES ('151', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495784705');
INSERT INTO `tp_system_log` VALUES ('152', '192.168.1.185', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`,`tp_ad_position`,`tp_article`,`tp_article_category`,`tp_article_tags`,`tp_mall_goods`,`tp_mall_goods_category`,`tp_mall_goods_package`,`tp_mall_order`,`tp_mall_order_goods`,`tp_mall_worship`,`tp_member_follow`,`tp_site_column`,`tp_system_config`优化完成！', '1495848331');
INSERT INTO `tp_system_log` VALUES ('153', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495849999');
INSERT INTO `tp_system_log` VALUES ('154', '192.168.1.111', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495850182');
INSERT INTO `tp_system_log` VALUES ('155', '192.168.1.193', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495855848');
INSERT INTO `tp_system_log` VALUES ('156', '192.168.1.185', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1495875338');
INSERT INTO `tp_system_log` VALUES ('157', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495875694');
INSERT INTO `tp_system_log` VALUES ('158', '192.168.1.111', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1495875708');
INSERT INTO `tp_system_log` VALUES ('159', '192.168.1.185', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1495875758');
INSERT INTO `tp_system_log` VALUES ('160', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495875844');
INSERT INTO `tp_system_log` VALUES ('161', '112.112.72.135', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495951571');
INSERT INTO `tp_system_log` VALUES ('162', '112.112.72.135', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495958633');
INSERT INTO `tp_system_log` VALUES ('163', '112.112.72.135', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1495961929');
INSERT INTO `tp_system_log` VALUES ('164', '180.163.2.88', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1495961939');
INSERT INTO `tp_system_log` VALUES ('165', '112.112.72.135', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495961940');
INSERT INTO `tp_system_log` VALUES ('166', '112.112.72.135', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1495962704');
INSERT INTO `tp_system_log` VALUES ('167', '112.112.72.135', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1495962713');
INSERT INTO `tp_system_log` VALUES ('168', '180.153.201.28', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1495962714');
INSERT INTO `tp_system_log` VALUES ('169', '112.112.72.135', 'admin/login/out', 'test', '系统管理', '用户退出系统成功', '1495963221');
INSERT INTO `tp_system_log` VALUES ('170', '112.112.72.135', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1495963231');
INSERT INTO `tp_system_log` VALUES ('171', '101.226.85.67', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1495963231');
INSERT INTO `tp_system_log` VALUES ('172', '106.57.87.151', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496028383');
INSERT INTO `tp_system_log` VALUES ('173', '106.57.87.151', 'admin/database/del', 'admin', '数据库备份删除', '20170525-135019 删除成功', '1496028596');
INSERT INTO `tp_system_log` VALUES ('174', '222.172.161.49', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496036930');
INSERT INTO `tp_system_log` VALUES ('175', '222.172.161.49', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496038589');
INSERT INTO `tp_system_log` VALUES ('176', '222.172.161.49', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496039692');
INSERT INTO `tp_system_log` VALUES ('177', '101.226.33.240', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1496039702');
INSERT INTO `tp_system_log` VALUES ('178', '222.172.161.49', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496039751');
INSERT INTO `tp_system_log` VALUES ('179', '116.55.206.32', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496054651');
INSERT INTO `tp_system_log` VALUES ('180', '116.52.236.126', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496107150');
INSERT INTO `tp_system_log` VALUES ('181', '106.61.2.53', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496125394');
INSERT INTO `tp_system_log` VALUES ('182', '220.165.160.93', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496247849');
INSERT INTO `tp_system_log` VALUES ('183', '220.165.160.93', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1496250485');
INSERT INTO `tp_system_log` VALUES ('184', '220.165.160.93', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496250822');
INSERT INTO `tp_system_log` VALUES ('185', '220.165.160.93', 'admin/database/export', 'admin', '数据库备份', '数据库备份成功', '1496251239');
INSERT INTO `tp_system_log` VALUES ('186', '220.165.160.93', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496251685');
INSERT INTO `tp_system_log` VALUES ('187', '220.165.160.93', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496252350');
INSERT INTO `tp_system_log` VALUES ('188', '182.245.51.244', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496277147');
INSERT INTO `tp_system_log` VALUES ('189', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496278819');
INSERT INTO `tp_system_log` VALUES ('190', '61.166.213.15', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496285627');
INSERT INTO `tp_system_log` VALUES ('191', '101.226.33.219', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1496285637');
INSERT INTO `tp_system_log` VALUES ('192', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496285710');
INSERT INTO `tp_system_log` VALUES ('193', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496287492');
INSERT INTO `tp_system_log` VALUES ('194', '61.166.213.15', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496287640');
INSERT INTO `tp_system_log` VALUES ('195', '101.226.66.181', 'admin/login/out', '', '系统管理', '用户退出系统成功', '1496287650');
INSERT INTO `tp_system_log` VALUES ('196', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496287976');
INSERT INTO `tp_system_log` VALUES ('197', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496288369');
INSERT INTO `tp_system_log` VALUES ('198', '61.166.213.15', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496288480');
INSERT INTO `tp_system_log` VALUES ('199', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496288659');
INSERT INTO `tp_system_log` VALUES ('200', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496294197');
INSERT INTO `tp_system_log` VALUES ('201', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496294311');
INSERT INTO `tp_system_log` VALUES ('202', '61.166.213.15', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496294356');
INSERT INTO `tp_system_log` VALUES ('203', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496294372');
INSERT INTO `tp_system_log` VALUES ('204', '61.166.213.15', 'admin/database/export', 'admin', '数据库备份', '数据库备份成功', '1496294421');
INSERT INTO `tp_system_log` VALUES ('205', '61.166.213.15', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496296161');
INSERT INTO `tp_system_log` VALUES ('206', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496296176');
INSERT INTO `tp_system_log` VALUES ('207', '61.166.213.15', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496296268');
INSERT INTO `tp_system_log` VALUES ('208', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496365288');
INSERT INTO `tp_system_log` VALUES ('209', '127.0.0.1', 'admin/login/out', 'test', '系统管理', '用户退出系统成功', '1496371584');
INSERT INTO `tp_system_log` VALUES ('210', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496371616');
INSERT INTO `tp_system_log` VALUES ('211', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496468848');
INSERT INTO `tp_system_log` VALUES ('212', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496473282');
INSERT INTO `tp_system_log` VALUES ('213', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496474014');
INSERT INTO `tp_system_log` VALUES ('215', '127.0.0.1', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`优化完成！', '1496559059');
INSERT INTO `tp_system_log` VALUES ('216', '127.0.0.1', 'admin/database/del', 'admin', '数据库备份删除', '20170531-135358 删除成功', '1496559068');
INSERT INTO `tp_system_log` VALUES ('217', '127.0.0.1', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`优化完成！', '1496560895');
INSERT INTO `tp_system_log` VALUES ('218', '127.0.0.1', 'admin/database/export', 'admin', '数据库备份', '数据库备份成功', '1496562392');
INSERT INTO `tp_system_log` VALUES ('219', '127.0.0.1', 'admin/database/optimize', 'admin', '数据表优化', '`tp_ad`优化完成！', '1496562401');
INSERT INTO `tp_system_log` VALUES ('220', '127.0.0.1', 'admin/system/file', 'admin', '系统管理', '修改系统配置参数成功', '1496563827');
INSERT INTO `tp_system_log` VALUES ('221', '127.0.0.1', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1496563833');
INSERT INTO `tp_system_log` VALUES ('222', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496623892');
INSERT INTO `tp_system_log` VALUES ('223', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496623911');
INSERT INTO `tp_system_log` VALUES ('224', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496625699');
INSERT INTO `tp_system_log` VALUES ('225', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496626471');
INSERT INTO `tp_system_log` VALUES ('226', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496626603');
INSERT INTO `tp_system_log` VALUES ('227', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496626826');
INSERT INTO `tp_system_log` VALUES ('228', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496627497');
INSERT INTO `tp_system_log` VALUES ('229', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496627755');
INSERT INTO `tp_system_log` VALUES ('230', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496628137');
INSERT INTO `tp_system_log` VALUES ('231', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496628166');
INSERT INTO `tp_system_log` VALUES ('232', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496628184');
INSERT INTO `tp_system_log` VALUES ('233', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496629817');
INSERT INTO `tp_system_log` VALUES ('234', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496644251');
INSERT INTO `tp_system_log` VALUES ('235', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496711080');
INSERT INTO `tp_system_log` VALUES ('236', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496711805');
INSERT INTO `tp_system_log` VALUES ('237', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496712661');
INSERT INTO `tp_system_log` VALUES ('238', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496717474');
INSERT INTO `tp_system_log` VALUES ('239', '127.0.0.1', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1496719586');
INSERT INTO `tp_system_log` VALUES ('240', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496738369');
INSERT INTO `tp_system_log` VALUES ('241', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496738458');
INSERT INTO `tp_system_log` VALUES ('242', '192.168.1.131', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496738824');
INSERT INTO `tp_system_log` VALUES ('243', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496797645');
INSERT INTO `tp_system_log` VALUES ('244', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496798333');
INSERT INTO `tp_system_log` VALUES ('245', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496801209');
INSERT INTO `tp_system_log` VALUES ('246', '192.168.1.131', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496802620');
INSERT INTO `tp_system_log` VALUES ('247', '127.0.0.1', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1496803107');
INSERT INTO `tp_system_log` VALUES ('248', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496819589');
INSERT INTO `tp_system_log` VALUES ('249', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496884549');
INSERT INTO `tp_system_log` VALUES ('250', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496884874');
INSERT INTO `tp_system_log` VALUES ('251', '127.0.0.1', 'business/login/index', 'admin', '系统管理', '用户登录系统成功', '1496886198');
INSERT INTO `tp_system_log` VALUES ('252', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496887278');
INSERT INTO `tp_system_log` VALUES ('253', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496898342');
INSERT INTO `tp_system_log` VALUES ('254', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496907087');
INSERT INTO `tp_system_log` VALUES ('255', '192.168.1.134', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496915625');
INSERT INTO `tp_system_log` VALUES ('256', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496970727');
INSERT INTO `tp_system_log` VALUES ('257', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496971173');
INSERT INTO `tp_system_log` VALUES ('258', '127.0.0.1', 'business/login/index', 'admin', '系统管理', '用户登录系统成功', '1496971218');
INSERT INTO `tp_system_log` VALUES ('259', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496971399');
INSERT INTO `tp_system_log` VALUES ('260', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496972626');
INSERT INTO `tp_system_log` VALUES ('261', '127.0.0.1', 'admin/login/out', 'test', '系统管理', '用户退出系统成功', '1496973388');
INSERT INTO `tp_system_log` VALUES ('262', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496973447');
INSERT INTO `tp_system_log` VALUES ('263', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496987024');
INSERT INTO `tp_system_log` VALUES ('264', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496988553');
INSERT INTO `tp_system_log` VALUES ('265', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1496990364');
INSERT INTO `tp_system_log` VALUES ('266', '127.0.0.1', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496990373');
INSERT INTO `tp_system_log` VALUES ('267', '192.168.1.134', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1496991844');
INSERT INTO `tp_system_log` VALUES ('268', '192.168.1.134', 'admin/login/out', 'test', '系统管理', '用户退出系统成功', '1496991875');
INSERT INTO `tp_system_log` VALUES ('269', '192.168.1.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496991920');
INSERT INTO `tp_system_log` VALUES ('270', '127.0.0.1', 'business/login/out', 'admin', '系统管理', '用户退出系统成功', '1496997875');
INSERT INTO `tp_system_log` VALUES ('271', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1496997895');
INSERT INTO `tp_system_log` VALUES ('272', '127.0.0.1', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1496999377');
INSERT INTO `tp_system_log` VALUES ('273', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1496999973');
INSERT INTO `tp_system_log` VALUES ('274', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1497230375');
INSERT INTO `tp_system_log` VALUES ('275', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497231002');
INSERT INTO `tp_system_log` VALUES ('276', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497232136');
INSERT INTO `tp_system_log` VALUES ('277', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497236864');
INSERT INTO `tp_system_log` VALUES ('278', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497244501');
INSERT INTO `tp_system_log` VALUES ('279', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497247309');
INSERT INTO `tp_system_log` VALUES ('280', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497248427');
INSERT INTO `tp_system_log` VALUES ('281', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497315804');
INSERT INTO `tp_system_log` VALUES ('282', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1497319358');
INSERT INTO `tp_system_log` VALUES ('283', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497320364');
INSERT INTO `tp_system_log` VALUES ('284', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497321776');
INSERT INTO `tp_system_log` VALUES ('285', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1497322458');
INSERT INTO `tp_system_log` VALUES ('286', '202.98.170.88', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497363431');
INSERT INTO `tp_system_log` VALUES ('287', '112.117.51.101', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497401849');
INSERT INTO `tp_system_log` VALUES ('288', '112.117.51.101', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497403809');
INSERT INTO `tp_system_log` VALUES ('289', '112.117.51.101', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497404517');
INSERT INTO `tp_system_log` VALUES ('290', '112.117.51.101', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497487465');
INSERT INTO `tp_system_log` VALUES ('291', '112.117.51.132', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497511240');
INSERT INTO `tp_system_log` VALUES ('292', '112.117.51.132', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497514873');
INSERT INTO `tp_system_log` VALUES ('293', '182.242.247.137', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497536001');
INSERT INTO `tp_system_log` VALUES ('294', '112.117.51.132', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497582758');
INSERT INTO `tp_system_log` VALUES ('295', '112.117.51.132', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497582976');
INSERT INTO `tp_system_log` VALUES ('296', '112.117.51.132', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497583165');
INSERT INTO `tp_system_log` VALUES ('297', '112.117.51.132', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497594050');
INSERT INTO `tp_system_log` VALUES ('298', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497662593');
INSERT INTO `tp_system_log` VALUES ('299', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497663933');
INSERT INTO `tp_system_log` VALUES ('300', '127.0.0.1', 'business/login/index', 'admin', '系统管理', '用户登录系统成功', '1497668518');
INSERT INTO `tp_system_log` VALUES ('301', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497674987');
INSERT INTO `tp_system_log` VALUES ('302', '127.0.0.1', 'admin/system/index', 'admin', '系统管理', '修改系统配置参数成功', '1497690054');
INSERT INTO `tp_system_log` VALUES ('303', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497833345');
INSERT INTO `tp_system_log` VALUES ('304', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497834584');
INSERT INTO `tp_system_log` VALUES ('305', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497837203');
INSERT INTO `tp_system_log` VALUES ('306', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497841710');
INSERT INTO `tp_system_log` VALUES ('307', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497858281');
INSERT INTO `tp_system_log` VALUES ('308', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497861756');
INSERT INTO `tp_system_log` VALUES ('309', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497920409');
INSERT INTO `tp_system_log` VALUES ('310', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1497920520');
INSERT INTO `tp_system_log` VALUES ('311', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497924955');
INSERT INTO `tp_system_log` VALUES ('312', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1497940420');
INSERT INTO `tp_system_log` VALUES ('313', '127.0.0.1', 'admin/database/export', 'admin', '数据库备份', '数据库备份成功', '1497949209');
INSERT INTO `tp_system_log` VALUES ('314', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498006062');
INSERT INTO `tp_system_log` VALUES ('315', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1498007749');
INSERT INTO `tp_system_log` VALUES ('316', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498008247');
INSERT INTO `tp_system_log` VALUES ('317', '192.168.1.185', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498010180');
INSERT INTO `tp_system_log` VALUES ('318', '192.168.1.193', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498091813');
INSERT INTO `tp_system_log` VALUES ('319', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498091852');
INSERT INTO `tp_system_log` VALUES ('320', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1498092581');
INSERT INTO `tp_system_log` VALUES ('321', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1498093080');
INSERT INTO `tp_system_log` VALUES ('322', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498093118');
INSERT INTO `tp_system_log` VALUES ('323', '127.0.0.1', 'business/login/out', 'admin', '系统管理', '用户退出系统成功', '1498115995');
INSERT INTO `tp_system_log` VALUES ('324', '112.117.51.40', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498179470');
INSERT INTO `tp_system_log` VALUES ('325', '112.117.38.125', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498205177');
INSERT INTO `tp_system_log` VALUES ('326', '42.243.1.150', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498447518');
INSERT INTO `tp_system_log` VALUES ('327', '42.243.1.150', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498465479');
INSERT INTO `tp_system_log` VALUES ('328', '42.243.1.150', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498469071');
INSERT INTO `tp_system_log` VALUES ('329', '42.243.1.150', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498527317');
INSERT INTO `tp_system_log` VALUES ('330', '42.243.1.150', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498532408');
INSERT INTO `tp_system_log` VALUES ('331', '42.243.1.150', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498532497');
INSERT INTO `tp_system_log` VALUES ('332', '112.115.186.61', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498567905');
INSERT INTO `tp_system_log` VALUES ('333', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498612393');
INSERT INTO `tp_system_log` VALUES ('334', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498621137');
INSERT INTO `tp_system_log` VALUES ('335', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498635960');
INSERT INTO `tp_system_log` VALUES ('336', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498696949');
INSERT INTO `tp_system_log` VALUES ('337', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498698426');
INSERT INTO `tp_system_log` VALUES ('338', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498706014');
INSERT INTO `tp_system_log` VALUES ('339', '112.117.51.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498715853');
INSERT INTO `tp_system_log` VALUES ('340', '112.117.51.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498727147');
INSERT INTO `tp_system_log` VALUES ('341', '112.117.51.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498792669');
INSERT INTO `tp_system_log` VALUES ('342', '112.117.51.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498815143');
INSERT INTO `tp_system_log` VALUES ('343', '112.117.51.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1498870673');
INSERT INTO `tp_system_log` VALUES ('344', '112.117.51.181', 'business/login/index', '', '系统管理', '用户登录系统成功', '1498892834');
INSERT INTO `tp_system_log` VALUES ('345', '112.117.51.181', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1498899796');
INSERT INTO `tp_system_log` VALUES ('346', '112.117.51.181', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499052672');
INSERT INTO `tp_system_log` VALUES ('347', '112.117.51.181', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499053027');
INSERT INTO `tp_system_log` VALUES ('348', '61.166.213.71', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499075400');
INSERT INTO `tp_system_log` VALUES ('349', '61.166.213.71', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499216995');
INSERT INTO `tp_system_log` VALUES ('350', '61.166.213.71', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499226044');
INSERT INTO `tp_system_log` VALUES ('351', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499240621');
INSERT INTO `tp_system_log` VALUES ('352', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499240882');
INSERT INTO `tp_system_log` VALUES ('353', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499244801');
INSERT INTO `tp_system_log` VALUES ('354', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499246789');
INSERT INTO `tp_system_log` VALUES ('355', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499301538');
INSERT INTO `tp_system_log` VALUES ('356', '42.243.1.242', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1499301547');
INSERT INTO `tp_system_log` VALUES ('357', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499301575');
INSERT INTO `tp_system_log` VALUES ('358', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499331130');
INSERT INTO `tp_system_log` VALUES ('359', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499332726');
INSERT INTO `tp_system_log` VALUES ('360', '106.61.4.174', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499337791');
INSERT INTO `tp_system_log` VALUES ('361', '106.61.4.174', 'business/login/index', 'admin', '系统管理', '用户登录系统成功', '1499337909');
INSERT INTO `tp_system_log` VALUES ('362', '42.243.1.242', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499387982');
INSERT INTO `tp_system_log` VALUES ('363', '42.243.1.242', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499388088');
INSERT INTO `tp_system_log` VALUES ('364', '112.117.51.251', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499407312');
INSERT INTO `tp_system_log` VALUES ('365', '112.117.51.251', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499416792');
INSERT INTO `tp_system_log` VALUES ('366', '106.61.35.175', 'business/login/index', '', '系统管理', '用户登录系统成功', '1499426775');
INSERT INTO `tp_system_log` VALUES ('367', '182.131.11.234', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499427251');
INSERT INTO `tp_system_log` VALUES ('368', '182.242.10.64', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499568614');
INSERT INTO `tp_system_log` VALUES ('369', '116.249.246.153', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499614445');
INSERT INTO `tp_system_log` VALUES ('370', '112.117.51.249', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499647074');
INSERT INTO `tp_system_log` VALUES ('371', '112.117.51.249', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499647441');
INSERT INTO `tp_system_log` VALUES ('372', '112.117.51.249', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499647508');
INSERT INTO `tp_system_log` VALUES ('373', '112.117.51.249', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499651804');
INSERT INTO `tp_system_log` VALUES ('374', '112.117.51.249', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499653100');
INSERT INTO `tp_system_log` VALUES ('375', '112.117.51.249', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499669651');
INSERT INTO `tp_system_log` VALUES ('376', '112.117.51.249', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499670997');
INSERT INTO `tp_system_log` VALUES ('377', '112.117.51.249', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499674182');
INSERT INTO `tp_system_log` VALUES ('378', '112.117.51.249', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499675211');
INSERT INTO `tp_system_log` VALUES ('379', '112.117.51.249', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499736530');
INSERT INTO `tp_system_log` VALUES ('380', '112.117.51.249', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499741506');
INSERT INTO `tp_system_log` VALUES ('381', '112.117.51.40', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499751866');
INSERT INTO `tp_system_log` VALUES ('382', '112.117.51.40', 'admin/login/index', 'test', '系统管理', '用户登录系统成功', '1499820020');
INSERT INTO `tp_system_log` VALUES ('383', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499906592');
INSERT INTO `tp_system_log` VALUES ('384', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1499990231');
INSERT INTO `tp_system_log` VALUES ('385', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500255589');
INSERT INTO `tp_system_log` VALUES ('386', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500262241');
INSERT INTO `tp_system_log` VALUES ('387', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1500281849');
INSERT INTO `tp_system_log` VALUES ('388', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500283172');
INSERT INTO `tp_system_log` VALUES ('389', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500338524');
INSERT INTO `tp_system_log` VALUES ('390', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1500343649');
INSERT INTO `tp_system_log` VALUES ('391', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500343926');
INSERT INTO `tp_system_log` VALUES ('392', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500369068');
INSERT INTO `tp_system_log` VALUES ('393', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1500427687');
INSERT INTO `tp_system_log` VALUES ('394', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500433060');
INSERT INTO `tp_system_log` VALUES ('395', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '1500446095');
INSERT INTO `tp_system_log` VALUES ('396', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500446123');
INSERT INTO `tp_system_log` VALUES ('397', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500512463');
INSERT INTO `tp_system_log` VALUES ('398', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1500530191');
INSERT INTO `tp_system_log` VALUES ('399', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500539677');
INSERT INTO `tp_system_log` VALUES ('400', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500597970');
INSERT INTO `tp_system_log` VALUES ('401', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1500687653');
INSERT INTO `tp_system_log` VALUES ('402', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500709113');
INSERT INTO `tp_system_log` VALUES ('403', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500709896');
INSERT INTO `tp_system_log` VALUES ('404', '127.0.0.1', 'business/login/index', '', '系统管理', '用户登录系统成功', '1500856584');
INSERT INTO `tp_system_log` VALUES ('405', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '1500858234');

-- ----------------------------
-- Table structure for tp_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_menu`;
CREATE TABLE `tp_system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of tp_system_menu
-- ----------------------------
INSERT INTO `tp_system_menu` VALUES ('2', '0', '系统管理', '', 'fa fa-edge', '#', '', '_self', '2', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('3', '4', '后台首页', '', 'fa fa-fw fa-tachometer', 'admin/index/main', '', '_self', '1', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('4', '2', '系统配置', '', '', '#', '', '_self', '22', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('5', '4', '系统设置', '', 'fa fa-apple', 'admin/system/index', '', '_self', '10', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('6', '4', '文件存储', '', 'fa fa-hdd-o', 'admin/system/file', '', '_self', '2', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('9', '20', '操作日志', '', '', 'admin/log/index', '', '_self', '624', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('19', '20', '权限管理', '', 'fa fa-user-secret', 'admin/auth/index', '', '_self', '61', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('20', '2', '系统权限', '', '', '#', '', '_self', '51', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('21', '20', '系统菜单', '', 'glyphicon glyphicon-menu-hamburger', 'admin/menu/index', '', '_self', '222', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('22', '20', '节点管理', '', 'fa fa-ellipsis-v', 'admin/node/index', '', '_self', '50', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('29', '20', '系统用户', '', 'fa fa-users', 'admin/user/index', '', '_self', '623', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('50', '0', '扩展管理', '', 'fa fa-dashboard', '#', '', '_self', '2000', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('61', '0', '微信管理', '', 'fa fa-comments-o', '#', '', '_self', '50', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('62', '61', '微信配置', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('63', '62', '微信接口配置', '', 'fa fa-usb', 'wechat/config/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('64', '62', '微信支付配置', '', 'fa fa-paypal', 'wechat/config/pay', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('65', '61', '粉丝管理', '', '', '#', '', '_self', '100', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('66', '65', '粉丝标签管理', '', 'fa fa-tags', 'wechat/fans/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('67', '65', '已关注微信粉丝', '', 'fa fa-wechat', 'wechat/fans/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('68', '61', '微信订制', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('69', '68', '微信菜单定制', '', 'glyphicon glyphicon-phone', 'wechat/menu/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('70', '68', '关键字管理', '', 'fa fa-paw', 'wechat/keys/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('71', '68', '关注自动回复', '', 'fa fa-commenting-o', 'wechat/keys/subscribe', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('81', '68', '无配置默认回复', '', 'fa fa-commenting-o', 'wechat/keys/defaults', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('82', '61', '资源管理', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('83', '82', '添加图文', '', '', 'wechat/news/add', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('85', '82', '图文列表', '', '', 'wechat/news/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('86', '0', '商城管理', '', 'fa fa-shopping-bag', '#', '', '_self', '20', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('87', '86', '商品管理', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('88', '87', '商品列表', '', 'fa fa-shopping-bag', '/admin/goods/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('89', '87', '商品分类', '', 'fa fa-server', '/admin/goods/category', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('90', '86', '订单管理', '', 'fa fa-pause-circle-o', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('91', '90', '订单列表', '', 'fa fa-area-chart', '/admin/order/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('92', '87', '套餐列表', '', 'fa fa-reddit-alien', '/admin/goods/package', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('94', '50', '接口', '', 'fa fa-reddit-alien', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('95', '94', '接口列表', '', 'fa fa-product-hunt', '/admin/api/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('96', '0', '内容系统', '', 'fa fa-database', '#', '', '_self', '40', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('97', '96', '内容配置', '', 'fa fa-percent', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('98', '97', '分类管理', '', 'fa fa-modx', 'admin/document/category', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('100', '4', '网站栏目管理', '', 'fa fa-product-hunt', 'admin/column/index', '', '_self', '30', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('101', '96', '内容管理', '', 'fa fa-stop-circle-o', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('102', '101', '文章管理', '', 'fa fa-modx', 'admin/document/article', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('106', '50', '广告位管理', '', 'fa fa-product-hunt', 'admin/ad/position', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('107', '2', '数据库管理', '', 'fa fa-percent', '#', '', '_self', '60', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('108', '107', '数据库备份', '', 'fa fa-mixcloud', 'admin/database/index', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('109', '107', '备份记录', '', 'fa fa-modx', 'admin/database/records', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('110', '4', '配置管理', '', 'fa fa-pause-circle-o', 'admin/config/index', '', '_self', '20', '1', '0', '2147483647');
INSERT INTO `tp_system_menu` VALUES ('111', '4', '清空缓存', '', 'fa fa-shopping-basket', 'admin/system/wipeCache', '', '_self', '40', '1', '0', '1495532182');
INSERT INTO `tp_system_menu` VALUES ('112', '86', '会员管理', '', 'fa fa-shopping-basket', '#', '', '_self', '0', '1', '0', '1495589960');
INSERT INTO `tp_system_menu` VALUES ('113', '112', '会员列表', '', 'fa fa-shopping-basket', 'admin/member/index', '', '_self', '0', '1', '0', '1495589982');
INSERT INTO `tp_system_menu` VALUES ('115', '86', '流水管理', '', 'fa fa-credit-card-alt', '#', '', '_self', '0', '1', '0', '1495606580');
INSERT INTO `tp_system_menu` VALUES ('116', '115', '充值列表', '', 'fa fa-credit-card-alt', 'admin/account/index', '', '_self', '0', '1', '0', '1495606634');
INSERT INTO `tp_system_menu` VALUES ('117', '115', '消费流水', '', 'fa fa-percent', 'admin/account/consume', '', '_self', '0', '1', '0', '1495616637');
INSERT INTO `tp_system_menu` VALUES ('118', '112', '用户组', '', 'glyphicon glyphicon-user', 'admin/group/index', '', '_self', '0', '1', '0', '1495692313');
INSERT INTO `tp_system_menu` VALUES ('150', '0', '纪念馆', '', 'fa fa-bank', '#', '', '_self', '10', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('151', '150', '纪念馆管理', '', 'fa fa-product-hunt', '#', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('152', '151', '乐曲列表', '', 'fa fa-bluetooth-b', '/admin/Hall/MusicList', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('156', '150', '个人、双人馆', '', 'fa fa-bluetooth', '#', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('157', '150', '家族馆', '', 'fa fa-bluetooth', '#', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('158', '156', '个人馆', '', 'fa fa-bluetooth-b', '/admin/Hall/HallOne', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('159', '156', '双人馆', '', 'fa fa-bluetooth-b', '/admin/Hall/HallTwo', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('160', '157', '家族馆列表', '', 'fa fa-bluetooth-b', '/admin/Hall/HallFamily', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('161', '162', '名人馆', '', 'fa fa-credit-card-alt', '/admin/Hall/HallFamous', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('162', '150', '名人馆', '', '', '#', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('163', '162', '名人类型', '', 'fa fa-bluetooth-b', '/admin/Hall/HallFamousType', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('164', '151', '相册', '', 'fa fa-bluetooth', '/admin/Hall/Photo', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('165', '151', '文章', '', 'fa fa-bars', '/admin/hall/article', '', '_self', '0', '1', '0', '2017');
INSERT INTO `tp_system_menu` VALUES ('166', '0', '公墓系统', '', 'fa fa-fort-awesome', '#', '', '_self', '3', '1', '0', '1496295875');
INSERT INTO `tp_system_menu` VALUES ('167', '166', '节点管理', '', '', 'business/node', '', '_self', '0', '1', '0', '1496295996');
INSERT INTO `tp_system_menu` VALUES ('168', '166', '商家后台菜单管理', '', '', 'admin/business/menu', '', '_self', '0', '1', '0', '1496303946');
INSERT INTO `tp_system_menu` VALUES ('169', '4', '地区管理', '', 'fa fa-product-hunt', 'admin/area/index', '', '_self', '30', '1', '0', '1496805536');
INSERT INTO `tp_system_menu` VALUES ('171', '101', '单页管理', '', 'fa fa-mixcloud', 'admin/page/index', '', '_self', '0', '1', '0', '1497323816');
INSERT INTO `tp_system_menu` VALUES ('174', '166', '商家入驻管理', '', '', 'businessuser/index', '', '_self', '0', '1', '0', '1497662676');
INSERT INTO `tp_system_menu` VALUES ('175', '50', '友链管理', '', 'fa fa-stop-circle', '#', '', '_self', '0', '1', '0', '1497664048');
INSERT INTO `tp_system_menu` VALUES ('176', '175', '友链列表', '', 'fa fa-hashtag', 'admin/links/index', '', '_self', '0', '1', '0', '1497664081');
INSERT INTO `tp_system_menu` VALUES ('177', '106', '广告位列表', '', 'fa fa-stop-circle', 'admin/ad/position', '', '_self', '0', '1', '0', '1497664215');
INSERT INTO `tp_system_menu` VALUES ('178', '50', '轮播管理', '', 'fa fa-mixcloud', '#', '', '_self', '0', '1', '0', '1497929161');
INSERT INTO `tp_system_menu` VALUES ('179', '178', '轮播位置列表', '', 'fa fa-product-hunt', 'admin/banner/banner', '', '_self', '0', '1', '0', '1497929204');
INSERT INTO `tp_system_menu` VALUES ('180', '150', '纪念馆风格管理', '', 'fa fa-mixcloud', '#', '', '_self', '0', '1', '0', '1499646855');
INSERT INTO `tp_system_menu` VALUES ('181', '180', '纪念馆风格', '', 'fa fa-stop-circle-o', 'admin/hall/hallStyle', '', '_self', '0', '1', '0', '1499646917');
INSERT INTO `tp_system_menu` VALUES ('182', '180', '风格分类', '', 'fa fa-pause-circle-o', 'admin/hall/hallStyleCategory', '', '_self', '0', '1', '0', '1499646950');
INSERT INTO `tp_system_menu` VALUES ('183', '180', '纪念馆大厅风格', '', 'fa fa-stop-circle', 'admin/hall/hallWorshipStyle', '', '_self', '0', '1', '0', '1499646984');
INSERT INTO `tp_system_menu` VALUES ('184', '180', '灵牌样式', '', 'fa fa-shopping-basket', 'admin/hall/hallLingpaiStyle', '', '_self', '0', '1', '0', '1499647011');

-- ----------------------------
-- Table structure for tp_system_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_node`;
CREATE TABLE `tp_system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是启启动RBAC权限控制',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_node_node` (`node`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统节点表';

-- ----------------------------
-- Records of tp_system_node
-- ----------------------------
INSERT INTO `tp_system_node` VALUES ('3', 'admin', '系统管理1', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('4', 'admin/menu/add', '添加菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('5', 'admin/config', '系统配置', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('6', 'admin/config/index', '网站配置', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('7', 'admin/config/file', '文件配置', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('8', 'admin/config/mail', '邮件配置', '0', '0', '2147483647');
INSERT INTO `tp_system_node` VALUES ('9', 'admin/config/sms', '短信配置', '0', '0', '2147483647');
INSERT INTO `tp_system_node` VALUES ('10', 'admin/menu/index', '菜单列表', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('11', 'admin/node/index', '节点列表', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('12', 'admin/node/save', '节点更新', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('13', 'store/menu/index', '菜单列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('14', 'store/menu/add', '添加菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('15', 'store/menu/edit', '编辑菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('16', 'store/menu/del', '删除菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('17', 'admin/index/index', '', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('18', 'admin/index/main', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('19', 'admin/index/pass', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('20', 'admin/index/info', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('21', 'store/menu/tagmove', '移动标签', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('22', 'store/menu/tagedit', '编辑标签', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('23', 'store/menu/tagdel', '删除标签', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('24', 'store/menu/resume', '启用菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('25', 'store/menu/forbid', '禁用菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('26', 'store/menu/tagadd', '添加标签', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('27', 'store/menu/hot', '设置热卖', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('28', 'admin/index', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('29', 'store/order/index', '订单列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('30', 'store/index/qrcimg', '店铺二维码', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('31', 'store/index/edit', '编辑店铺', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('32', 'store/index/qrc', '二维码列表', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('33', 'store/index/add', '添加店铺', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('34', 'store/index/index', '我的店铺', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('35', 'store/api/delcache', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('36', 'store/api/getcache', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('37', 'store/api/setcache', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('38', 'store/api/response', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('39', 'store/api/auth', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('40', 'admin/user/resume', '启用用户', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('41', 'admin/user/forbid', '禁用用户', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('42', 'admin/user/del', '删除用户', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('43', 'admin/user/pass', '密码修改', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('44', 'admin/user/edit', '编辑用户', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('45', 'admin/user/index', '用户列表', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('46', 'admin/user/auth', '用户授权', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('47', 'admin/user/add', '新增用户', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('48', 'admin/plugs/icon', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('49', 'admin/plugs/upload', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('50', 'admin/plugs/upfile', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('51', 'admin/plugs/upstate', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('52', 'admin/menu/resume', '菜单启用11', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('53', 'admin/menu/forbid', '菜单禁用', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('54', 'admin/login/index', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('55', 'admin/login/out', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('56', 'admin/menu/edit', '编辑菜单', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('57', 'admin/menu/del', '菜单删除', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('58', 'store/menu', '菜谱管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('59', 'store/index', '店铺管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('60', 'store', '店铺管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('61', 'store/order', '订单管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('62', 'admin/user', '用户管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('63', 'admin/node', '节点管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('64', 'admin/menu', '菜单管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('65', 'admin/auth', '权限管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('66', 'admin/auth/index', '权限列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('67', 'admin/auth/apply', '权限节点', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('68', 'admin/auth/add', '添加权限', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('69', 'admin/auth/edit', '编辑权限', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('70', 'admin/auth/forbid', '禁用权限', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('71', 'admin/auth/resume', '启用权限', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('72', 'admin/auth/del', '删除权限', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('73', 'admin/log/index', '日志列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('74', 'admin/log/del', '删除日志', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('75', 'admin/log', '系统日志', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('76', 'wechat', '微信管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('77', 'wechat/article', '微信文章', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('78', 'wechat/article/index', '文章列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('79', 'wechat/config', '微信配置', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('80', 'wechat/config/index', '的', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('81', 'wechat/config/pay', '单店', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('82', 'wechat/fans', '微信粉丝0', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('83', 'wechat/fans/index', '粉丝列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('84', 'wechat/index', '微信主页', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('85', 'wechat/index/index', '微信主页', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('86', 'wechat/keys', '微信关键字', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('87', 'wechat/keys/index', '微信关键字列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('88', 'wechat/keys/subscribe', '关键自动回复', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('89', 'wechat/keys/defaults', '默认自动回复', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('90', 'wechat/menu', '微信菜单管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('91', 'wechat/menu/index', '啊啊啊00', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('92', 'wechat/news', '微信图文管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('93', 'wechat/news/index', '图文列表', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('94', 'wechat/notify/index', '', '0', '0', '2147483647');
INSERT INTO `tp_system_node` VALUES ('95', 'wechat/api/index', '', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('96', 'wechat/api', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('97', 'wechat/notify', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('98', 'wechat/fans/sync', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('99', 'wechat/menu/edit', '', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('100', 'wechat/menu/cancel', '', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('101', 'wechat/keys/edit', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('102', 'wechat/keys/add', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('103', 'wechat/review/index', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('104', 'wechat/review', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('105', 'wechat/keys/del', null, '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('106', 'wechat/news/add', '', '0', '0', '2147483647');
INSERT INTO `tp_system_node` VALUES ('107', 'wechat/news/select', '', '0', '0', '2147483647');
INSERT INTO `tp_system_node` VALUES ('108', 'wechat/keys/resume', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('109', 'wechat/news/edit', '', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('110', 'admin/goods/index', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('111', 'admin/goods', '商品管理', '0', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('112', 'admin/goods/add', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('113', 'admin/goods/edit', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('114', 'admin/goods/del', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('115', 'admin/goods/forbid', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('116', 'admin/goods/resume', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('117', 'admin/goods/category', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('118', 'admin/goods/addcategory', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('119', 'admin/goods/editcategory', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('120', 'admin/goods/delcategory', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('121', 'admin/goods/package', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('122', 'admin/goods/addpackage', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('123', 'admin/api/index', '', '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('124', 'admin/article/category', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('125', 'admin/article/addcategory', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('126', 'admin/article/editcategory', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('127', 'admin/article/delcategory', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('128', 'admin/article/index', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('129', 'admin/article/add', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('130', 'admin/article/edit', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('131', 'admin/article/del', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('132', 'admin/article/forbid', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('133', 'admin/article/resume', null, '1', '1', '2147483647');
INSERT INTO `tp_system_node` VALUES ('134', 'admin/account/index', null, '0', '1', '1495759439');
INSERT INTO `tp_system_node` VALUES ('135', 'api/forgot', '', '0', '1', '1495759626');
INSERT INTO `tp_system_node` VALUES ('136', 'api/send', '', '0', '1', '1495851979');
INSERT INTO `tp_system_node` VALUES ('137', 'admin/ad/resume', '', '0', '1', '1495854287');
INSERT INTO `tp_system_node` VALUES ('138', 'admin/ad', '', '0', '1', '1495854909');
INSERT INTO `tp_system_node` VALUES ('139', 'admin/ad/index', '', '0', '1', '1495854911');
INSERT INTO `tp_system_node` VALUES ('140', 'admin/ad/del', '', '0', '1', '1495862031');
INSERT INTO `tp_system_node` VALUES ('141', 'admin/ad/forbid', '', '0', '1', '1495862031');
INSERT INTO `tp_system_node` VALUES ('142', 'admin/ad/edit', '', '0', '1', '1495862132');
INSERT INTO `tp_system_node` VALUES ('143', 'admin/ad/add', '', '0', '1', '1495862133');
INSERT INTO `tp_system_node` VALUES ('144', 'admin/member/index', null, '0', '1', '1495863736');
INSERT INTO `tp_system_node` VALUES ('145', 'admin/account/consume', null, '0', '1', '1495962213');
INSERT INTO `tp_system_node` VALUES ('146', 'admin/ad/position', null, '0', '1', '1495962219');
INSERT INTO `tp_system_node` VALUES ('147', 'admin/ad/addposition', null, '0', '1', '1495962220');
INSERT INTO `tp_system_node` VALUES ('148', 'admin/ad/editposition', null, '0', '1', '1495962221');
INSERT INTO `tp_system_node` VALUES ('149', 'admin/ad/delposition', null, '0', '1', '1495962221');
INSERT INTO `tp_system_node` VALUES ('150', 'admin/ad/forbidposition', null, '0', '1', '1495962222');
INSERT INTO `tp_system_node` VALUES ('151', 'admin/ad/resumeposition', null, '0', '1', '1495962223');
INSERT INTO `tp_system_node` VALUES ('152', 'admin/api/debug', null, '0', '1', '1495962226');
INSERT INTO `tp_system_node` VALUES ('153', 'admin/api/detail', null, '0', '1', '1495962227');
INSERT INTO `tp_system_node` VALUES ('154', 'admin/article/tagsuggest', null, '0', '0', '1495962230');
INSERT INTO `tp_system_node` VALUES ('155', 'admin/column/index', null, '0', '1', '1495962246');
INSERT INTO `tp_system_node` VALUES ('156', 'admin/column/add', null, '0', '1', '1495962247');
INSERT INTO `tp_system_node` VALUES ('157', 'admin/column/edit', null, '0', '1', '1495962248');
INSERT INTO `tp_system_node` VALUES ('158', 'admin/column/del', null, '0', '1', '1495962307');
INSERT INTO `tp_system_node` VALUES ('159', 'admin/column/forbid', null, '0', '1', '1495962309');
INSERT INTO `tp_system_node` VALUES ('160', 'admin/column/resume', null, '0', '1', '1495962310');
INSERT INTO `tp_system_node` VALUES ('161', 'admin/config/add', null, '0', '1', '1495962314');
INSERT INTO `tp_system_node` VALUES ('162', 'admin/config/edit', null, '0', '1', '1495962316');
INSERT INTO `tp_system_node` VALUES ('163', 'admin/config/del', null, '0', '1', '1495962317');
INSERT INTO `tp_system_node` VALUES ('164', 'admin/config/forbid', null, '0', '1', '1495962318');
INSERT INTO `tp_system_node` VALUES ('165', 'admin/config/resume', null, '0', '1', '1495962320');
INSERT INTO `tp_system_node` VALUES ('166', 'admin/database/index', null, '0', '1', '1495962322');
INSERT INTO `tp_system_node` VALUES ('167', 'admin/database/records', null, '0', '1', '1495962323');
INSERT INTO `tp_system_node` VALUES ('168', 'admin/database/export', null, '0', '1', '1495962324');
INSERT INTO `tp_system_node` VALUES ('169', 'admin/database/import', null, '0', '1', '1495962325');
INSERT INTO `tp_system_node` VALUES ('170', 'admin/database/optimize', null, '0', '1', '1495962326');
INSERT INTO `tp_system_node` VALUES ('171', 'admin/database/repair', null, '0', '1', '1495962328');
INSERT INTO `tp_system_node` VALUES ('172', 'admin/database/del', null, '0', '1', '1495962329');
INSERT INTO `tp_system_node` VALUES ('173', 'admin/goods/editpackage', null, '0', '1', '1495962334');
INSERT INTO `tp_system_node` VALUES ('174', 'admin/goods/selectgoods', null, '0', '1', '1495962335');
INSERT INTO `tp_system_node` VALUES ('175', 'admin/goods/delpackage', null, '0', '1', '1495962336');
INSERT INTO `tp_system_node` VALUES ('176', 'admin/goods/forbidpackage', null, '0', '1', '1495962337');
INSERT INTO `tp_system_node` VALUES ('177', 'admin/goods/resumepackage', null, '0', '1', '1495962338');
INSERT INTO `tp_system_node` VALUES ('178', 'admin/group/index', null, '0', '1', '1495962340');
INSERT INTO `tp_system_node` VALUES ('179', 'admin/hall/hallone', null, '0', '1', '1495962344');
INSERT INTO `tp_system_node` VALUES ('180', 'admin/hall/halltwo', null, '0', '1', '1495962345');
INSERT INTO `tp_system_node` VALUES ('181', 'admin/hall/editone', null, '0', '1', '1495962346');
INSERT INTO `tp_system_node` VALUES ('182', 'admin/hall/edittwo', null, '0', '1', '1495962348');
INSERT INTO `tp_system_node` VALUES ('183', 'admin/hall/hallfamily', null, '0', '1', '1495962349');
INSERT INTO `tp_system_node` VALUES ('184', 'admin/hall/editfamily', null, '0', '1', '1495962350');
INSERT INTO `tp_system_node` VALUES ('185', 'admin/hall/hallcelebrity', null, '0', '1', '1495962351');
INSERT INTO `tp_system_node` VALUES ('186', 'admin/hall/addcelebrity', null, '0', '1', '1495962352');
INSERT INTO `tp_system_node` VALUES ('187', 'admin/hall/hallcelebritytype', null, '0', '1', '1495962354');
INSERT INTO `tp_system_node` VALUES ('188', 'admin/hall/addcelebritytype', null, '0', '1', '1495962355');
INSERT INTO `tp_system_node` VALUES ('189', 'admin/hall/editcelebritytype', null, '0', '1', '1495962357');
INSERT INTO `tp_system_node` VALUES ('190', 'admin/hall/delcelebritytype', null, '0', '1', '1495962358');
INSERT INTO `tp_system_node` VALUES ('191', 'admin/hall/hall_data', null, '0', '1', '1495962359');
INSERT INTO `tp_system_node` VALUES ('192', 'admin/hall/musiclist', null, '0', '1', '1495962360');
INSERT INTO `tp_system_node` VALUES ('193', 'admin/hall/addmusic', null, '0', '1', '1495962361');
INSERT INTO `tp_system_node` VALUES ('194', 'admin/hall/editmusic', null, '0', '1', '1495962363');
INSERT INTO `tp_system_node` VALUES ('195', 'admin/hall/delmusic', null, '0', '1', '1495962365');
INSERT INTO `tp_system_node` VALUES ('196', 'admin/hall/hallstyle', null, '0', '1', '1495962366');
INSERT INTO `tp_system_node` VALUES ('197', 'admin/hall/worshipstyle', null, '0', '1', '1495962367');
INSERT INTO `tp_system_node` VALUES ('198', 'admin/hall/lingpaistyle', null, '0', '1', '1495962369');
INSERT INTO `tp_system_node` VALUES ('199', 'admin/hall/addhallstyle', null, '0', '1', '1495962370');
INSERT INTO `tp_system_node` VALUES ('200', 'admin/hall/edithallstyle', null, '0', '1', '1495962371');
INSERT INTO `tp_system_node` VALUES ('201', 'admin/hall/delhallstyle', null, '0', '1', '1495962375');
INSERT INTO `tp_system_node` VALUES ('202', 'admin/hall/photo', null, '0', '1', '1495962376');
INSERT INTO `tp_system_node` VALUES ('203', 'admin/hall/addphoto', null, '0', '1', '1495962377');
INSERT INTO `tp_system_node` VALUES ('204', 'admin/hall/editphoto', null, '0', '1', '1495962378');
INSERT INTO `tp_system_node` VALUES ('205', 'admin/hall/delphoto', null, '0', '1', '1495962379');
INSERT INTO `tp_system_node` VALUES ('206', 'admin/hall/picture', null, '0', '1', '1495962381');
INSERT INTO `tp_system_node` VALUES ('207', 'admin/hall/addpicture', null, '0', '1', '1495962381');
INSERT INTO `tp_system_node` VALUES ('208', 'admin/hall/delpicture', null, '0', '1', '1495962382');
INSERT INTO `tp_system_node` VALUES ('209', 'admin/hall/article', null, '0', '1', '1495962383');
INSERT INTO `tp_system_node` VALUES ('210', 'admin/hall/editarticle', null, '0', '1', '1495962385');
INSERT INTO `tp_system_node` VALUES ('211', 'admin/hall/addarticle', null, '0', '1', '1495962386');
INSERT INTO `tp_system_node` VALUES ('212', 'admin/hall/delarticle', null, '0', '1', '1495962387');
INSERT INTO `tp_system_node` VALUES ('213', 'admin/member/add', null, '0', '1', '1495962391');
INSERT INTO `tp_system_node` VALUES ('214', 'admin/member/edit', null, '0', '1', '1495962392');
INSERT INTO `tp_system_node` VALUES ('215', 'admin/member/pass', null, '0', '1', '1495962393');
INSERT INTO `tp_system_node` VALUES ('216', 'admin/member/del', null, '0', '1', '1495962394');
INSERT INTO `tp_system_node` VALUES ('217', 'admin/member/forbid', null, '0', '1', '1495962396');
INSERT INTO `tp_system_node` VALUES ('218', 'admin/member/resume', null, '0', '1', '1495962397');
INSERT INTO `tp_system_node` VALUES ('219', 'admin/order/index', null, '0', '1', '1495962401');
INSERT INTO `tp_system_node` VALUES ('220', 'admin/order/ordergoods', null, '0', '1', '1495962402');
INSERT INTO `tp_system_node` VALUES ('221', 'admin/order/del', null, '0', '1', '1495962403');
INSERT INTO `tp_system_node` VALUES ('222', 'admin/order/cancelorder', null, '0', '1', '1495962404');
INSERT INTO `tp_system_node` VALUES ('223', 'admin/page/index', null, '0', '1', '1495962405');
INSERT INTO `tp_system_node` VALUES ('224', 'admin/page/add', null, '0', '1', '1495962408');
INSERT INTO `tp_system_node` VALUES ('225', 'admin/page/edit', null, '0', '1', '1495962409');
INSERT INTO `tp_system_node` VALUES ('226', 'admin/page/del', null, '0', '1', '1495962410');
INSERT INTO `tp_system_node` VALUES ('227', 'admin/page/forbid', null, '0', '1', '1495962410');
INSERT INTO `tp_system_node` VALUES ('228', 'admin/page/resume', null, '0', '1', '1495962411');
INSERT INTO `tp_system_node` VALUES ('229', 'admin/system/index', null, '0', '1', '1495962413');
INSERT INTO `tp_system_node` VALUES ('230', 'admin/system/file', null, '0', '1', '1495962415');
INSERT INTO `tp_system_node` VALUES ('231', 'admin/system/wipecache', null, '0', '1', '1495962415');
INSERT INTO `tp_system_node` VALUES ('232', 'api/article/index', null, '0', '0', '1495962420');
INSERT INTO `tp_system_node` VALUES ('233', 'api/forgot/index', null, '0', '0', '1495962421');
INSERT INTO `tp_system_node` VALUES ('234', 'user/index/index', null, '0', '1', '1495962440');
INSERT INTO `tp_system_node` VALUES ('235', 'user/index/add', null, '0', '1', '1495962442');
INSERT INTO `tp_system_node` VALUES ('236', 'business/index/index', null, '0', '1', '1496301638');
INSERT INTO `tp_system_node` VALUES ('237', 'business/index/main', null, '0', '1', '1496301642');
INSERT INTO `tp_system_node` VALUES ('238', 'business/index/pass', null, '0', '1', '1496301645');
INSERT INTO `tp_system_node` VALUES ('239', 'business/index/info', null, '0', '1', '1496301657');
INSERT INTO `tp_system_node` VALUES ('240', 'admin/account', '', '0', '1', '1496558964');
INSERT INTO `tp_system_node` VALUES ('241', 'admin/area/index', null, '0', '1', '1496971420');
INSERT INTO `tp_system_node` VALUES ('242', 'admin/area/ajaxeditarea', null, '0', '1', '1496971421');
INSERT INTO `tp_system_node` VALUES ('243', 'admin/area/add', null, '0', '1', '1496971422');
INSERT INTO `tp_system_node` VALUES ('244', 'admin/area/edit', null, '0', '1', '1496971423');
INSERT INTO `tp_system_node` VALUES ('245', 'admin/area/del', null, '0', '1', '1496971424');
INSERT INTO `tp_system_node` VALUES ('246', 'admin/area/ajaxgetarea', null, '0', '0', '1496971425');
INSERT INTO `tp_system_node` VALUES ('247', 'admin/area/save', null, '0', '1', '1496990399');

-- ----------------------------
-- Table structure for tp_system_sequence
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_sequence`;
CREATE TABLE `tp_system_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '序号类型',
  `sequence` char(50) NOT NULL COMMENT '序号值',
  `create_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_sequence_unique` (`type`,`sequence`) USING BTREE,
  KEY `index_system_sequence_type` (`type`),
  KEY `index_system_sequence_number` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统序号表';

-- ----------------------------
-- Records of tp_system_sequence
-- ----------------------------
INSERT INTO `tp_system_sequence` VALUES ('1', 'WECHAT-PAY-TEST', '9454817392', '2147483647');
INSERT INTO `tp_system_sequence` VALUES ('2', 'WXPAY-OUTER-NO', '745238403410734322', '2147483647');

-- ----------------------------
-- Table structure for tp_system_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_user`;
CREATE TABLE `tp_system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` int(11) NOT NULL COMMENT '登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_system_user
-- ----------------------------
INSERT INTO `tp_system_user` VALUES ('10000', 'admin', 'e284c4587ed1ba682e5c748488581cfa', '22222222', '290648237@qq.com', '13330543405', '系统管理员', '9446', '2147483647', '1', '3', '0', null, '1474836470', '1500446089');
INSERT INTO `tp_system_user` VALUES ('10001', 'asdasda', 'e10adc3949ba59abbe56e057f20f883e', null, '', '', '', '0', '0', '1', '2', '1', null, '1474836470', '1495700369');
INSERT INTO `tp_system_user` VALUES ('10002', 'test', '0bf4380c896c2075fb579e53eabcafd3', null, '290648237@qq.com', '', '', '52', '2147483647', '1', '4', '0', null, '1495962002', '1496304249');

-- ----------------------------
-- Table structure for tp_tags
-- ----------------------------
DROP TABLE IF EXISTS `tp_tags`;
CREATE TABLE `tp_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签索引id',
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='andy - 标签表';

-- ----------------------------
-- Records of tp_tags
-- ----------------------------
INSERT INTO `tp_tags` VALUES ('66', 'aa', '0', null, '1497340929');
INSERT INTO `tp_tags` VALUES ('67', 'gg', '0', null, '1497340929');
INSERT INTO `tp_tags` VALUES ('68', '啊啊', '0', null, '1497341695');
INSERT INTO `tp_tags` VALUES ('69', '订单', '0', null, '1497341769');
INSERT INTO `tp_tags` VALUES ('70', '试试', '0', null, '1497343146');
INSERT INTO `tp_tags` VALUES ('71', 'ddd', '0', null, '1497597351');
INSERT INTO `tp_tags` VALUES ('72', 'aaa', '0', null, '1497597818');
INSERT INTO `tp_tags` VALUES ('73', 'sss', '0', null, '1497597828');

-- ----------------------------
-- Table structure for tp_wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_fans`;
CREATE TABLE `tp_wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '粉丝表ID',
  `appid` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '公众号Appid',
  `groupid` bigint(20) unsigned DEFAULT NULL COMMENT '分组ID',
  `tagid_list` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '标签id',
  `is_back` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单用户',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否订阅该公众号，0：未关注，1：已关注',
  `openid` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一',
  `spread_openid` char(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐人OPENID',
  `spread_at` datetime DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户的昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `country` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在省份',
  `city` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在城市',
  `language` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT NULL COMMENT '用户关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `unionid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'unionid',
  `remark` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `expires_in` bigint(20) unsigned DEFAULT '0' COMMENT '有效时间',
  `refresh_token` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '刷新token',
  `access_token` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '访问token',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_fans_spread_openid` (`spread_openid`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=sjis COMMENT='微信粉丝';

-- ----------------------------
-- Records of tp_wechat_fans
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_fans_tags
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_fans_tags`;
CREATE TABLE `tp_wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL COMMENT '标签ID',
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` int(11) unsigned DEFAULT NULL COMMENT '总数',
  `create_at` int(11) NOT NULL COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信会员标签';

-- ----------------------------
-- Records of tp_wechat_fans_tags
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_keys
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_keys`;
CREATE TABLE `tp_wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT NULL COMMENT '类型，text 文件消息，image 图片消息，news 图文消息',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT NULL COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT NULL COMMENT '音乐缩略图链接',
  `music_desc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0 禁用，1 启用',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT=' 微信关键字';

-- ----------------------------
-- Records of tp_wechat_keys
-- ----------------------------
INSERT INTO `tp_wechat_keys` VALUES ('1', null, 'text', '阿达', '说点什么吧', 'http://192.168.1.185/ht-memorial/public/static/theme/default/img/image.png', '', '音乐标题', '', 'http://192.168.1.185/ht-memorial/public/static/theme/default/img/image.png', '音乐描述', '视频标题', '', '视频描述', '0', '0', '0', null, '1495519809');

-- ----------------------------
-- Table structure for tp_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_menu`;
CREATE TABLE `tp_wechat_menu` (
  `id` bigint(16) unsigned NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `pindex` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文字内容',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用1启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `wechat_menu_pid` (`pindex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1145 DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
-- Records of tp_wechat_menu
-- ----------------------------
INSERT INTO `tp_wechat_menu` VALUES ('1137', '1', '0', 'text', '一级菜', '2234123413', '0', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1138', '11', '1', 'text', '菜单', '', '0', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1139', '12', '1', 'text', '二级菜单', '', '1', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1140', '13', '1', 'text', '多图文', '多图文开发中', '2', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1141', '14', '1', 'keys', '图片', '图片', '3', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1142', '15', '1', 'view', '音乐1', '音乐', '4', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1143', '2', '0', 'text', '事件类', '', '1', '1', '0', '2147483647');
INSERT INTO `tp_wechat_menu` VALUES ('1144', '3', '0', 'text', '微信支付', 'index/wap/payjs', '2', '1', '0', '2147483647');

-- ----------------------------
-- Table structure for tp_wechat_news
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_news`;
CREATE TABLE `tp_wechat_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT NULL COMMENT '关联图文ID，用，号做分割',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_new_artcle_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文表';

-- ----------------------------
-- Records of tp_wechat_news
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_news_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_news_article`;
CREATE TABLE `tp_wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `title` varchar(50) DEFAULT NULL COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '是否显示封面 0不显示，1 显示',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `digest` varchar(300) DEFAULT NULL COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT NULL COMMENT '图文消息原文地址',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除(0:不删除  1:删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';

-- ----------------------------
-- Records of tp_wechat_news_article
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_news_image
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_news_image`;
CREATE TABLE `tp_wechat_news_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(200) DEFAULT NULL COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信服务器图片';

-- ----------------------------
-- Records of tp_wechat_news_image
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_news_media
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_news_media`;
CREATE TABLE `tp_wechat_news_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(200) DEFAULT NULL COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';

-- ----------------------------
-- Records of tp_wechat_news_media
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_pay_notify
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_pay_notify`;
CREATE TABLE `tp_wechat_pay_notify` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `bank_type` varchar(50) DEFAULT NULL COMMENT '银行类型',
  `cash_fee` bigint(20) DEFAULT NULL COMMENT '现金价',
  `fee_type` char(20) DEFAULT NULL COMMENT '币种，1人民币',
  `is_subscribe` char(1) DEFAULT 'N' COMMENT '是否关注，Y为关注，N为未关注',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '商户MCH_ID',
  `nonce_str` varchar(32) DEFAULT NULL COMMENT '随机串',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信用户openid',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '支付平台退款交易号',
  `sign` varchar(100) DEFAULT NULL COMMENT '签名',
  `time_end` datetime DEFAULT NULL COMMENT '结束时间',
  `result_code` varchar(10) DEFAULT NULL,
  `return_code` varchar(10) DEFAULT NULL,
  `total_fee` varchar(11) DEFAULT NULL COMMENT '支付总金额，单位为分',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '订单号',
  `create_at` int(11) NOT NULL COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_notify_openid` (`openid`) USING BTREE,
  KEY `index_wechat_pay_notify_out_trade_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_notify_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='支付日志表';

-- ----------------------------
-- Records of tp_wechat_pay_notify
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wechat_pay_prepayid
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechat_pay_prepayid`;
CREATE TABLE `tp_wechat_pay_prepayid` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `from` char(32) DEFAULT 'shop' COMMENT '支付来源',
  `fee` bigint(20) unsigned DEFAULT NULL COMMENT '支付费用(分)',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '订单类型',
  `order_no` varchar(50) DEFAULT NULL COMMENT '内部订单号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '外部订单号',
  `prepayid` varchar(500) DEFAULT NULL COMMENT '预支付码',
  `expires_in` bigint(20) unsigned DEFAULT NULL COMMENT '有效时间',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '微信平台订单号',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '1已支付，0未支退款',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `is_refund` tinyint(1) unsigned DEFAULT '0' COMMENT '是否退款，退款单号(T+原来订单)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `create_at` int(11) NOT NULL COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_prepayid_outer_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_prepayid_order_no` (`order_no`) USING BTREE,
  KEY `index_wechat_pay_is_pay` (`is_pay`) USING BTREE,
  KEY `index_wechat_pay_is_refund` (`is_refund`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单号对应表';

-- ----------------------------
-- Records of tp_wechat_pay_prepayid
-- ----------------------------

-- ----------------------------
-- Table structure for yun_member
-- ----------------------------
DROP TABLE IF EXISTS `yun_member`;
CREATE TABLE `yun_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `member_truename` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `member_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '会员头像',
  `member_sex` tinyint(1) NOT NULL DEFAULT '3' COMMENT '会员性别 1男 2女 3保密',
  `member_birthday` date DEFAULT NULL COMMENT '生日',
  `member_passwd` varchar(32) NOT NULL COMMENT '会员密码',
  `member_paypwd` char(32) NOT NULL DEFAULT '' COMMENT '支付密码',
  `member_email` varchar(100) NOT NULL DEFAULT '' COMMENT '会员邮箱',
  `member_email_bind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未绑定1已绑定',
  `member_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `member_mobile_bind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未绑定1已绑定',
  `member_qq` varchar(100) NOT NULL DEFAULT '' COMMENT 'qq',
  `member_ww` varchar(100) NOT NULL DEFAULT '' COMMENT '阿里旺旺',
  `member_login_num` int(11) NOT NULL DEFAULT '1' COMMENT '登录次数',
  `member_time` varchar(10) NOT NULL COMMENT '会员注册时间',
  `member_login_time` varchar(10) NOT NULL COMMENT '当前登录时间',
  `member_old_login_time` varchar(10) NOT NULL COMMENT '上次登录时间',
  `member_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '当前登录ip',
  `member_old_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '上次登录ip',
  `member_qqopenid` varchar(100) NOT NULL DEFAULT '' COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) NOT NULL DEFAULT '' COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `weixin_unionid` varchar(50) NOT NULL COMMENT '微信用户统一标识',
  `weixin_info` varchar(255) NOT NULL COMMENT '微信用户相关信息',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `available_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额',
  `freeze_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buy` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_snsvisitnum` int(11) NOT NULL DEFAULT '0' COMMENT 'sns空间访问次数',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_area` varchar(255) DEFAULT NULL COMMENT '地区',
  `member_city` varchar(255) DEFAULT NULL COMMENT '城市',
  `member_province` varchar(255) DEFAULT NULL COMMENT '省份',
  `member_areainfo` varchar(255) NOT NULL DEFAULT '' COMMENT '地区内容',
  `member_privacy` text COMMENT '隐私设定',
  `member_quicklink` varchar(255) NOT NULL DEFAULT '' COMMENT '会员常用操作',
  `member_exppoints` int(11) NOT NULL DEFAULT '0' COMMENT '会员经验值',
  `inviter_id` int(11) DEFAULT NULL COMMENT '邀请人ID',
  `member_wxopenid` varchar(100) NOT NULL DEFAULT '' COMMENT '微信互联openid',
  `member_nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '会员昵称',
  `member_uniq` varchar(255) NOT NULL DEFAULT '' COMMENT '会员uniq',
  `member_token` varchar(255) NOT NULL DEFAULT '' COMMENT '会员token',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1 删除 0 未删除',
  `coins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '纪念币余额',
  `memorial_value` int(11) NOT NULL DEFAULT '0' COMMENT '纪念值',
  `hx_username` varchar(200) DEFAULT NULL,
  `hx_password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='andy - 会员表';

-- ----------------------------
-- Records of yun_member
-- ----------------------------
INSERT INTO `yun_member` VALUES ('1', '13330543405', '张升', '/static/upload/picture/20170711/b84e4d8fd6af8dd6126e7112f1d925ac.jpg', '1', '2017-05-27', '3ab7873060b6de9ca93b664e752bca6f', '', '', '0', '13330543405', '0', '', '', '17', '1495790691', '2017-07-22', '1500684946', '127.0.0.1', '127.0.0.1', '', null, '', null, '', '', '30', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', '0', '0', '0', null, null, null, '', 'a:7:{s:5:\"email\";s:1:\"0\";s:8:\"truename\";s:1:\"0\";s:3:\"sex\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:4:\"area\";s:1:\"0\";s:2:\"qq\";s:1:\"0\";s:2:\"ww\";s:1:\"0\";}', '', '5', null, '', 'ghgg', '1333054340559646fc67de29', 'da6d32089b5453fc82f54af447753fde', '0', '9300', '100082', '159644bb8378d3', '2968e93815ebd3387f7dee64ffccd21d');
INSERT INTO `yun_member` VALUES ('2', '18313889251', '', '/static/upload/picture/20170711/b99228186ca93f6709f6838e58048f6a.jpg', '1', null, '343b1c4a3ea721b2d640fc8700db0f36', '', '', '0', '', '0', '', '', '1', '1495792108', '1495792108', '1499843645', '', '127.0.0.1', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', null, '', '0', null, '', 'SilentWolf', '1831388925159263483a1c0a', '114785f46ffdc70d5d6ad9fdb15c4377', '0', '9100', '100158', '259644bb90d970', '9ea7585496e3f0c11070251db72494b0');
INSERT INTO `yun_member` VALUES ('3', 'test', '', '', '0', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '', '0', '', '', '2', '1495680029', '1495684158', '1499824553', '127.0.0.1', '112.117.51.40', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', null, '', '0', null, '', '测试用户', 'test5936300884010', 'f3dfc388e82e21250c8f6de9de05574f', '0', '8630', '101137', '359644bb9d7c4d', '31f4eb31ea271d845b8807328eb4df02');
INSERT INTO `yun_member` VALUES ('6', '18788540912', '', 'http://j.sumali.cn/static/upload/picture/20170619/85332bda02d5db297a53561e19f086c1.', '3', null, '343b1c4a3ea721b2d640fc8700db0f36', '', '', '0', '', '0', '', '', '1', '1495692969', '', '1497860584', '', '61.166.213.226', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', null, '', '0', null, '', 'haha', '18788540912592676a9e51b8', '097edc4083238749baca6cfd4cccaa9c', '0', '10060', '100000', '659644bba3b5dc', 'ce1af37845f06da330fba3530cb9497c');
INSERT INTO `yun_member` VALUES ('8', '18347944063', '', 'http://j.sumali.cn/static/upload/picture/20170711/b84e4d8fd6af8dd6126e7112f1d925ac.jpg', '1', null, '2e009a543983533745957b41eb5bab45', '', '', '0', '', '0', '', '', '1', '1495693427', '', '1499821390', '', '117.136.84.90', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', null, '', '0', null, '', '多多少少是', '18347944063592fab92ce3c1', '86a4bad38ae67af7966ae9c4f2289460', '0', '5040', '100526', '859644bba9abbd', '5e187e254f074fce6c1f274015190503');
INSERT INTO `yun_member` VALUES ('9', '15911439962', '', '', '3', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '', '0', '', '', '1', '1497597711', '', '1499131335', '', '61.166.213.71', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', null, '', '0', null, '', '15911439962', '159114399625943870f89544', 'cbac0d478d934261719b79ec4be88644', '0', '0', '100006', '959644bbaf278c', '68d2976110735f48f0a2f53d57d8359f');
INSERT INTO `yun_member` VALUES ('10', 'test1', '', '', '0', '0000-00-00', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '', '0', '', '', '2', '1495680029', '1495684158', '1499131082', '127.0.0.1', '61.166.213.71', '', '', '', '', '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', '', '', '0', null, '', '测试用户', 'test5936300884010', '6153b903e8170f916f80b739e4d5435a', '0', '3930', '100147', '1059644bbb61836', 'd6b5012c18f7efe30d3ef0a8cbe33452');
INSERT INTO `yun_member` VALUES ('11', 'kobe', '112', '/static/upload/picture/20170717/ba5767041d1912069d27bb0c5d032180.png', '1', null, '0bf4380c896c2075fb579e53eabcafd3', '', '111@qq.com', '0', '13522663366', '0', '', '', '7', '1495680029', '2017-07-17', '', '', '', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, '长安区', '石家庄市', '河北省', '', null, '', '0', null, '', '', '', '', '0', '0', '0', null, null);
INSERT INTO `yun_member` VALUES ('13', '', '', '', '3', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '13211604052', '0', '', '', '4', '1500343241', '2017-07-18', '1500357245', '', '127.0.0.1', '', null, '', null, '', '', '0', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null, null, '', null, '', '0', null, '', '', '', '8560aa9d48e127461614cefb0808f528', '0', '0', '0', null, null);
