/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yjsg

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-17 22:44:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` char(72) DEFAULT NULL,
  `name` char(32) DEFAULT NULL,
  `create_content` tinyint(1) DEFAULT '1',
  `model_id` int(11) DEFAULT '0',
  `craete_time` int(11) DEFAULT '0',
  `action` char(32) DEFAULT 'Article/lists',
  `index_template` char(32) DEFAULT NULL,
  `list_template` char(32) DEFAULT NULL,
  `detail_template` char(32) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_config`
-- ----------------------------
DROP TABLE IF EXISTS `cms_config`;
CREATE TABLE `cms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` tinyint(4) DEFAULT '1',
  `name` char(72) DEFAULT NULL,
  `zhname` char(72) DEFAULT NULL,
  `enum` char(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1',
  `value` text,
  `create_time` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_config
-- ----------------------------
INSERT INTO `cms_config` VALUES ('2', '1', 'SITE_KEYWORDS', '站点关键词', '', '3', '', '1538097177', '2');
INSERT INTO `cms_config` VALUES ('3', '1', 'SITE_DESCRIPTION', '站点描述', '', '3', '', '1538097318', '3');
INSERT INTO `cms_config` VALUES ('4', '3', 'MANAGE_NAME', '管理后台名称', '', '1', 'TOP-CMS', '1538097412', '0');
INSERT INTO `cms_config` VALUES ('5', '1', 'SITE_TITLE', '站点标题', '', '1', '', '1538390034', '1');
INSERT INTO `cms_config` VALUES ('6', '1', 'FOOTER_TEXT', '网站底部文字', '', '3', 'Powered by TOP糯米', '1538404086', '4');

-- ----------------------------
-- Table structure for `cms_files`
-- ----------------------------
DROP TABLE IF EXISTS `cms_files`;
CREATE TABLE `cms_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` char(255) NOT NULL,
  `hash` char(32) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_files
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `menu_name` char(72) NOT NULL,
  `url` char(255) DEFAULT NULL,
  `display` tinyint(1) DEFAULT '1',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '0', '用户管理', '/', '1', '2');
INSERT INTO `cms_menu` VALUES ('2', '0', '系统管理', '/', '1', '3');
INSERT INTO `cms_menu` VALUES ('3', '2', '菜单管理', 'Menu', '1', '3');
INSERT INTO `cms_menu` VALUES ('4', '2', '配置管理', 'Config', '1', '6');
INSERT INTO `cms_menu` VALUES ('5', '2', '分类管理', 'Category', '1', '2');
INSERT INTO `cms_menu` VALUES ('6', '2', '导航管理', 'Channel', '1', '1');
INSERT INTO `cms_menu` VALUES ('7', '1', '用户列表', 'Users', '1', '0');
INSERT INTO `cms_menu` VALUES ('8', '0', '内容管理', '/', '1', '1');
INSERT INTO `cms_menu` VALUES ('9', '2', '模型管理', 'Model', '1', '4');
INSERT INTO `cms_menu` VALUES ('10', '8', '内容管理', 'Article', '1', '1');
INSERT INTO `cms_menu` VALUES ('12', '1', '角色管理', 'Group', '1', '1');
INSERT INTO `cms_menu` VALUES ('13', '2', '权限列表', 'Rule', '1', '5');

-- ----------------------------
-- Table structure for `cms_model`
-- ----------------------------
DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_table` char(32) DEFAULT NULL,
  `model_name` char(72) DEFAULT NULL,
  `model_engine` char(128) DEFAULT 'MyISAM',
  `create_time` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `list_display` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_model
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_model_field`
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_field`;
CREATE TABLE `cms_model_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '嗯',
  `field_name` char(32) DEFAULT NULL,
  `field_zhname` char(72) DEFAULT NULL,
  `field_type` char(128) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `notice` char(255) DEFAULT NULL,
  `select_list` text,
  `is_null` tinyint(1) DEFAULT '1',
  `default_value` text,
  `sort` int(11) DEFAULT '0',
  `list_display` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_model_field
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_users`
-- ----------------------------
DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE `cms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `username` char(32) NOT NULL,
  `password` char(255) NOT NULL,
  `salt` char(6) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `create_ip` char(32) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT '0',
  `last_login_ip` char(32) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_users
-- ----------------------------
INSERT INTO `cms_users` VALUES ('10', '4', 'TOP糯米', '9028b333dfc153cee8d61552716c5885', '12e767', '1539306303', '192.168.0.200', '1539776069', '127.0.0.1', '0', '1');
INSERT INTO `cms_users` VALUES ('11', '5', 'demo', '0173b07fc69d94ab3babcc59a0e55967', '62bca3', '1539306314', '192.168.0.200', '1539582598', '118.123.42.169', '100', '1');

-- ----------------------------
-- Table structure for `cms_users_group`
-- ----------------------------
DROP TABLE IF EXISTS `cms_users_group`;
CREATE TABLE `cms_users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `remark` char(255) DEFAULT NULL,
  `rules` varchar(2000) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_users_group
-- ----------------------------
INSERT INTO `cms_users_group` VALUES ('4', '超级管理员', '我是权力最大的分组', '137,138,139,140,141,143,144,145,146,148,149,150,151,153,154,155,156,158,159,160,161,163,164,165,166,194,168,169,170,172,173,174,175,177,178,179,180,182,183,184,185,191,187,188,189,195,198,199', '1');
INSERT INTO `cms_users_group` VALUES ('5', '演示组', '演示', '137,138,143,148,153,158,163,168,169,170,172,177,182,187', '1');

-- ----------------------------
-- Table structure for `cms_users_rule`
-- ----------------------------
DROP TABLE IF EXISTS `cms_users_rule`;
CREATE TABLE `cms_users_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `action` char(255) NOT NULL,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_users_rule
-- ----------------------------
INSERT INTO `cms_users_rule` VALUES ('136', '0', 'Article', '文章管理');
INSERT INTO `cms_users_rule` VALUES ('137', '136', 'Article/index', '文章分类列表');
INSERT INTO `cms_users_rule` VALUES ('138', '136', 'Article/lists', '文章列表');
INSERT INTO `cms_users_rule` VALUES ('139', '136', 'Article/edit', '编辑文章');
INSERT INTO `cms_users_rule` VALUES ('140', '136', 'Article/add', '新增文章');
INSERT INTO `cms_users_rule` VALUES ('141', '136', 'Article/delete', '删除文章');
INSERT INTO `cms_users_rule` VALUES ('142', '0', 'Category', '分类管理');
INSERT INTO `cms_users_rule` VALUES ('143', '142', 'Category/index', '管理分类列表');
INSERT INTO `cms_users_rule` VALUES ('144', '142', 'Category/add', '新增分类');
INSERT INTO `cms_users_rule` VALUES ('145', '142', 'Category/edit', '编辑分类');
INSERT INTO `cms_users_rule` VALUES ('146', '142', 'Category/delete', '删除分类');
INSERT INTO `cms_users_rule` VALUES ('147', '0', 'Channel', '导航管理');
INSERT INTO `cms_users_rule` VALUES ('148', '147', 'Channel/index', '导航列表');
INSERT INTO `cms_users_rule` VALUES ('149', '147', 'Channel/add', '新增导航');
INSERT INTO `cms_users_rule` VALUES ('150', '147', 'Channel/edit', '编辑导航');
INSERT INTO `cms_users_rule` VALUES ('151', '147', 'Channel/delete', '删除导航');
INSERT INTO `cms_users_rule` VALUES ('152', '0', 'Config', '配置管理');
INSERT INTO `cms_users_rule` VALUES ('153', '152', 'Config/index', '配置列表');
INSERT INTO `cms_users_rule` VALUES ('154', '152', 'Config/add', '添加配置');
INSERT INTO `cms_users_rule` VALUES ('155', '152', 'Config/edit', '编辑配置');
INSERT INTO `cms_users_rule` VALUES ('156', '152', 'Config/delete', '删除配置');
INSERT INTO `cms_users_rule` VALUES ('157', '0', 'Field', '字段管理');
INSERT INTO `cms_users_rule` VALUES ('158', '157', 'Field/index', '字段列表');
INSERT INTO `cms_users_rule` VALUES ('159', '157', 'Field/add', '添加字段');
INSERT INTO `cms_users_rule` VALUES ('160', '157', 'Field/edit', '更改字段');
INSERT INTO `cms_users_rule` VALUES ('161', '157', 'Field/delete', '删除字段');
INSERT INTO `cms_users_rule` VALUES ('162', '0', 'Group', '角色管理');
INSERT INTO `cms_users_rule` VALUES ('163', '162', 'Group/index', '角色列表');
INSERT INTO `cms_users_rule` VALUES ('164', '162', 'Group/add', '新增角色');
INSERT INTO `cms_users_rule` VALUES ('165', '162', 'Group/edit', '编辑角色');
INSERT INTO `cms_users_rule` VALUES ('166', '162', 'Group/delete', '删除角色');
INSERT INTO `cms_users_rule` VALUES ('167', '0', 'Index', '系统首页');
INSERT INTO `cms_users_rule` VALUES ('168', '167', 'Index/index', '首页（务必选中）');
INSERT INTO `cms_users_rule` VALUES ('169', '167', 'Index/welcome', '首页（务必选中）');
INSERT INTO `cms_users_rule` VALUES ('170', '167', 'Index/clear', '首页（务必选中）');
INSERT INTO `cms_users_rule` VALUES ('171', '0', 'Menu', '菜单管理');
INSERT INTO `cms_users_rule` VALUES ('172', '171', 'Menu/index', '菜单列表');
INSERT INTO `cms_users_rule` VALUES ('173', '171', 'Menu/add', '新增菜单');
INSERT INTO `cms_users_rule` VALUES ('174', '171', 'Menu/edit', '编辑菜单');
INSERT INTO `cms_users_rule` VALUES ('175', '171', 'Menu/delete', '删除菜单');
INSERT INTO `cms_users_rule` VALUES ('176', '0', 'Model', '模型管理');
INSERT INTO `cms_users_rule` VALUES ('177', '176', 'Model/index', '模型列表');
INSERT INTO `cms_users_rule` VALUES ('178', '176', 'Model/add', '新增模型');
INSERT INTO `cms_users_rule` VALUES ('179', '176', 'Model/delete', '删除模型');
INSERT INTO `cms_users_rule` VALUES ('180', '176', 'Model/edit', '编辑模型');
INSERT INTO `cms_users_rule` VALUES ('181', '0', 'Rule', '权限列表');
INSERT INTO `cms_users_rule` VALUES ('182', '181', 'Rule/index', '首页');
INSERT INTO `cms_users_rule` VALUES ('183', '181', 'Rule/edit', '编辑');
INSERT INTO `cms_users_rule` VALUES ('184', '181', 'Rule/delete', '删除');
INSERT INTO `cms_users_rule` VALUES ('185', '181', 'Rule/updateRule', '更新权限表');
INSERT INTO `cms_users_rule` VALUES ('186', '0', 'Users', '用户管理');
INSERT INTO `cms_users_rule` VALUES ('187', '186', 'Users/index', '用户列表');
INSERT INTO `cms_users_rule` VALUES ('188', '186', 'Users/add', '新增用户');
INSERT INTO `cms_users_rule` VALUES ('189', '186', 'Users/edit', '编辑用户');
INSERT INTO `cms_users_rule` VALUES ('191', '181', 'Rule/add', '新增');
INSERT INTO `cms_users_rule` VALUES ('194', '162', 'Group/distributionRule', '为角色分配权限');
INSERT INTO `cms_users_rule` VALUES ('195', '186', 'Users/delete', '删除用户');
INSERT INTO `cms_users_rule` VALUES ('197', '0', 'Upload', '上传操作');
INSERT INTO `cms_users_rule` VALUES ('198', '197', 'Upload/uploadfive', '上传图片');
INSERT INTO `cms_users_rule` VALUES ('199', '197', 'Upload/uploadfiveFile', '上传附件');
