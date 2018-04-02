/*
Navicat MySQL Data Transfer

Source Server         : 环拓阿里云
Source Server Version : 50637
Source Host           : 47.88.228.80:3306
Source Database       : ht-memorial

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-07-29 11:07:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tp_site_column`
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='andy - 网站栏目表';

-- ----------------------------
-- Records of tp_site_column
-- ----------------------------
INSERT INTO `tp_site_column` VALUES ('2', '0', '0', '0', 'top_nav', '', '顶部导航', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('3', '2', '0', '0', 'top_nav', '', '首页', '', '', '/', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('4', '2', '0', '0', 'top_nav', '', '家族宗祠', '', '', '/', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('5', '2', '0', '0', 'top_nav', '', '个人纪念馆', '', '', '/home/hall/privateHall', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('6', '2', '0', '0', 'top_nav', '', '名人纪念馆', '', '', '/home/hall/famousHall', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('7', '2', '0', '0', 'top_nav', '', '公墓商城', '', '', '/home/cemetery', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('8', '2', '0', '0', 'top_nav', '', '殡葬服务', '', '', 'http://bz.yjn100.com/', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('9', '2', '0', '0', 'top_nav', '', '行业资讯', '', '', '/home/news', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('10', '2', '0', '1', 'top_nav', 'about', '关于我们', '', '', '/about', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('11', '0', '0', '0', '', '', '底部导航', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('12', '11', '0', '0', '', '', '关于云纪念', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('13', '12', '0', '0', '', '', '云纪念介绍', '', '', '/about', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('14', '12', '0', '0', '', '', '行业资讯', '', '', '/news', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('15', '12', '0', '4', '', '', '服务条款', '', '', '/paper/detail/id/4.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('16', '12', '0', '5', '', '', '联系我们', '', '', '/paper/detail/id/5.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('17', '11', '0', '0', '', '', '民族文化', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('18', '17', '2', '0', '', '', '传统文化', '', '', '/home/news/column/cid/2.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('19', '17', '5', '0', '', '', '国学精粹', '', '', '/home/news/column/cid/5.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('20', '17', '10', '0', '', '', '姓氏文化', '', '', '/home/news/column/cid/10.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('21', '17', '16', '0', '', '', '宗教信仰', '', '', '/home/news/column/cid/16.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('22', '11', '0', '0', '', '', '网上祭奠', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('23', '22', '0', '0', '', '', '网上纪念馆', '', '', '/home/hall/privateHall', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('24', '22', '0', '0', '', '', '家族宗祠', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('25', '22', '0', '0', '', '', '免费建馆', '', '', '/home/member/user_hall_add', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('26', '22', '0', '0', '', '', '祭奠商城', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('27', '11', '0', '0', '', '', '帮助中心', '', '', '#', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('28', '27', '0', '7', '', '', '建馆帮助', '', '', '/paper/detail/id/7.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('29', '27', '0', '8', '', '', '新手上路', '', '', '/paper/detail/id/8.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('30', '27', '0', '9', '', '', '如何网上祭祀', '', '', '/paper/detail/id/9.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('31', '27', '0', '10', '', '', '如何创建纪念馆', '', '', '/paper/detail/id/10.html', '', '_self', '0', '1', '0', '2147483647');
INSERT INTO `tp_site_column` VALUES ('32', '0', '0', '0', 'about_left_nav', '', '关于我们侧边栏菜单', '', '', '', '', '_self', '0', '1', '0', '1501146218');
INSERT INTO `tp_site_column` VALUES ('33', '32', '3', '1', 'about_left_nav', '', '云纪念馆简介', '', '', '/about', '', '_self', '0', '1', '0', '1501146270');
INSERT INTO `tp_site_column` VALUES ('34', '32', '0', '2', 'about_left_nav', '', '合作伙伴', '', '', '/paper/detail/id/2.html', '', '_self', '0', '1', '0', '1501146312');
INSERT INTO `tp_site_column` VALUES ('35', '32', '0', '3', 'about_left_nav', '', '法律声明', '', '', '/paper/detail/id/3.html', '', '_self', '0', '1', '0', '1501146342');
INSERT INTO `tp_site_column` VALUES ('36', '32', '0', '4', 'about_left_nav', '', '服务条款', '', '', '/paper/detail/id/4.html', '', '_self', '0', '1', '0', '1501146359');
INSERT INTO `tp_site_column` VALUES ('37', '32', '0', '5', 'about_left_nav', '', '联系我们', '', '', '/paper/detail/id/5.html', '', '_self', '0', '1', '0', '1501146378');
