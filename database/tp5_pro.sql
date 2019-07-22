/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp5_pro

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-07-22 16:48:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp5_xactivitys
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xactivitys`;
CREATE TABLE `tp5_xactivitys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '活动推荐标题 ，可用于产品详情页广告位',
  `act_img` varchar(500) NOT NULL DEFAULT '0' COMMENT '活动图片',
  `act_url` varchar(100) NOT NULL DEFAULT '0' COMMENT '链接',
  `act_tag` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一标识字符串 建议大写',
  `act_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '活动类型,1：为首页活动  2:其他活动',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序，数字越大越靠前',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在 app 首页显示  0：不显示  1：显示',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'app前端显示状态 0：正常，-1已删除',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '文章更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `act_tag` (`act_tag`) USING BTREE COMMENT '唯一标识索引'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='活动表\r\n\r\n一般用于显示app首页上的活动专栏，注意status的规定';

-- ----------------------------
-- Records of tp5_xactivitys
-- ----------------------------
INSERT INTO `tp5_xactivitys` VALUES ('1', '特价商品推荐', '/cms/images/imgOne.png', 'page/index/spring.xml', 'TJSPTJ', '2', '1', '1', '0', '2019-07-10 15:59:21');
INSERT INTO `tp5_xactivitys` VALUES ('2', '春季特惠商品', '/cms/images/imgTwo.png', 'http://www.hello.com/imissyou.html', 'CJTHSPA', '1', '2', '0', '0', '2019-07-10 16:03:16');
INSERT INTO `tp5_xactivitys` VALUES ('3', '生活专区推荐', '/cms/images/imgThree.png', 'page/index/live', 'SHZQTJA', '1', '3', '1', '0', '2019-07-22 16:12:33');

-- ----------------------------
-- Table structure for tp5_xact_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xact_goods`;
CREATE TABLE `tp5_xact_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) DEFAULT '0' COMMENT '活动id，对应 表 tp5_xactivitys',
  `goods_id` int(11) DEFAULT '0' COMMENT '参加该活动的商品ID',
  `status` tinyint(2) DEFAULT '0' COMMENT '0 ：正常 -1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='活动商品关联表\r\n\r\n';

-- ----------------------------
-- Records of tp5_xact_goods
-- ----------------------------
INSERT INTO `tp5_xact_goods` VALUES ('1', '1', '1', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('2', '1', '2', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('3', '1', '3', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('4', '2', '1', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('5', '2', '2', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('6', '2', '3', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('7', '3', '1', '0');
INSERT INTO `tp5_xact_goods` VALUES ('8', '3', '2', '0');
INSERT INTO `tp5_xact_goods` VALUES ('9', '3', '3', '0');
INSERT INTO `tp5_xact_goods` VALUES ('10', '1', '7', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('11', '1', '12', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('12', '1', '30', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('13', '1', '5', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('14', '1', '31', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('15', '6', '5', '0');
INSERT INTO `tp5_xact_goods` VALUES ('16', '1', '13', '-1');
INSERT INTO `tp5_xact_goods` VALUES ('17', '9', '18', '0');
INSERT INTO `tp5_xact_goods` VALUES ('18', '9', '13', '0');
INSERT INTO `tp5_xact_goods` VALUES ('19', '9', '19', '0');
INSERT INTO `tp5_xact_goods` VALUES ('20', '5', '18', '0');
INSERT INTO `tp5_xact_goods` VALUES ('21', '10', '19', '0');
INSERT INTO `tp5_xact_goods` VALUES ('22', '10', '9', '0');
INSERT INTO `tp5_xact_goods` VALUES ('23', '10', '31', '0');
INSERT INTO `tp5_xact_goods` VALUES ('24', '2', '8', '0');

-- ----------------------------
-- Table structure for tp5_xadmins
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xadmins`;
CREATE TABLE `tp5_xadmins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员昵称',
  `picture` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员头像',
  `password` varchar(120) NOT NULL DEFAULT '87d9bb400c0634691f0e3baaf1e2fd0d' COMMENT '管理员登录密码',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态标识',
  `content` varchar(500) NOT NULL DEFAULT '世界上没有两片完全相同的叶子！' COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of tp5_xadmins
-- ----------------------------
INSERT INTO `tp5_xadmins` VALUES ('1', 'niuNeng@admin', '/cms/images/headshot/niuNeng.png', '87d9bb400c0634691f0e3baaf1e2fd0d', '1', '2018-02-11 21:02:43', '1', '世界上没有两片完全相同的叶子1');
INSERT INTO `tp5_xadmins` VALUES ('2', 'baZhaHei@admin', '/cms/images/headshot/baZhaHei.png', 'db69fc039dcbd2962cb4d28f5891aae1', '2', '2018-02-11 21:02:43', '1', '世界上没有两片完全相同的叶子！');
INSERT INTO `tp5_xadmins` VALUES ('3', 'moTzxx@admin', '/cms/images/headshot/wuHuang.png', 'db69fc039dcbd2962cb4d28f5891aae1', '1', '2018-02-11 21:02:43', '1', '世界上没有两片完全相同的叶子！');

-- ----------------------------
-- Table structure for tp5_xadmin_roles
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xadmin_roles`;
CREATE TABLE `tp5_xadmin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色称呼',
  `nav_menu_ids` text NOT NULL COMMENT '权限下的菜单ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='管理员角色表';

-- ----------------------------
-- Records of tp5_xadmin_roles
-- ----------------------------
INSERT INTO `tp5_xadmin_roles` VALUES ('1', '终级管理员', '1|7|6|2|3|73|4|5|49|48|50|67|61|76|', '2019-07-19 18:16:00', '1');
INSERT INTO `tp5_xadmin_roles` VALUES ('2', '初级管理员', '1|6|2|3|4|5|', '2018-02-11 21:02:43', '1');

-- ----------------------------
-- Table structure for tp5_xad_lists
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xad_lists`;
CREATE TABLE `tp5_xad_lists` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增id',
  `ad_name` varchar(20) NOT NULL DEFAULT '' COMMENT '广告名称',
  `start_time` varchar(20) NOT NULL COMMENT '广告开始投放时间',
  `end_time` varchar(20) NOT NULL COMMENT '广告结束时间',
  `ad_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型, 0：首页幻灯片广告 1：首屏加载倒计时广告；2:其他广告',
  `ad_url` varchar(50) NOT NULL DEFAULT '' COMMENT '广告链接',
  `original_img` varchar(500) NOT NULL DEFAULT '' COMMENT '广告图片',
  `list_order` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序 数字越大越靠前',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'app前端显示状态 0：正常，-1已删除',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在 app 首页显示  0：不显示  1：显示',
  `ad_tag` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一标识字符串 建议大写',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of tp5_xad_lists
-- ----------------------------
INSERT INTO `tp5_xad_lists` VALUES ('1', '首屏加载倒计时广告', '2019-07-02 00:00:00', '2019-07-06 00:00:00', '1', '/pages/goods/adlike', '/home/images/article2.png', '0', '0', '1', 'DJS');
INSERT INTO `tp5_xad_lists` VALUES ('2', '首屏广告', '2019-07-01 00:00:00', '2019-07-06 00:00:00', '2', '/goodsearch/index', '/home/images/article1.png', '2', '0', '0', 'SP');
INSERT INTO `tp5_xad_lists` VALUES ('3', '首屏广告', '2019-07-01 00:00:00', '2019-07-06 00:00:00', '0', '../goodsearch/index', '/home/images/article2.png', '0', '0', '1', 'SP');
INSERT INTO `tp5_xad_lists` VALUES ('4', '首屏广告', '2019-07-02 00:00:00', '2019-07-11 00:00:00', '2', '../goodsearch/index', '/home/images/article3.png', '0', '0', '1', 'SP');

-- ----------------------------
-- Table structure for tp5_xarticles
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xarticles`;
CREATE TABLE `tp5_xarticles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Article 主键',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '作者ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序标识 越大越靠前',
  `content` text NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of tp5_xarticles
-- ----------------------------
INSERT INTO `tp5_xarticles` VALUES ('1', '这是今年最好的演讲：生命来来往往，来日并不方长', '1', '2018-02-11 21:02:42', '2019-02-22 09:02:28', '0', '<p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"letter-spacing: 0.544px; margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">视频中的演讲者算了一笔时间帐，如果一个人活到</span><span style=\"letter-spacing: 0.544px; margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(153, 0, 0); box-sizing: border-box !important; overflow-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">78岁</strong></span><span style=\"letter-spacing: 0.544px; margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; overflow-wrap: break-word !important;\">，那么：</span><br/></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">要花大概</span><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">28.3年</span></strong><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">在睡觉上，足足占据人生的三分之一；</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">要花大概</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">10.5年</span></strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">在工作上；并且很可能这份工作不尽人意；</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">同时花在电视和社交媒体上的时间，也将占据</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">9.5年</strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">；</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">另外，还有吃饭、化妆、照顾孩子等等，也都是不小的时间开销。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">算到最后，真正留给自己的岁月不过</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0); font-size: 18px;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">9年</strong></span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">而已。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">而如何利用这空白的9年，对每个人都有重大意义。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><img class=\" __bg_gif\" src=\"https://mmbiz.qpic.cn/mmbiz_gif/8DoQ2HTrG9wsKos14ib0E4YOyZEEtnoPwHXtHib4nT6qD8agbyicVRQgoH7d8WxAMYjHykZFrDcLB1YMgnTiaVuqZw/640?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">我们每天都有</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">86400</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">秒存入自己的生命账户，一天结束后，第二天你将拥有新的86400秒。</span><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">如果这是一笔钱，没有人会任它白白溜走，但现实中我们却一天天浪费永不再来的时间。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">佛祖说，</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">人生最大的错误就是认为自己有时间</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">总以为岁月漫漫，有的是时间挥霍等待。</span><br/></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">总以为明天很多，很多事不必急于一时，很多人无需立刻相见。</span></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">但其实，人生来来往往，真的没有那么多来日方长。</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">余生很贵，经不起浪费。</span></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></strong></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><img class=\" __bg_gif\" src=\"https://mmbiz.qpic.cn/mmbiz_gif/8DoQ2HTrG9wsKos14ib0E4YOyZEEtnoPwCab90RLp84I8T3bNXE0FGlfWChHjwiaNfianCysBUhVvYKaaCL3YY6SA/640?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">就像三毛所说，</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(153, 0, 0);\">我来不及认真地年轻，待明白过来时，只能选择认真地老去。</span></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">趁阳光正好，趁微风不燥，见想见的人，做想做的事，就是对人生最大的不辜负。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">所以，</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">去爱吧，就像从来没有受过伤害一样</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">跳舞吧，如同没有任何人注视你一样</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;\">活着吧，如同今天就是末日一样</span></strong></p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(153, 0, 0); font-size: 15px;\">生命来来往往，来日并不方长，别等，别遗憾。</span></p>');
INSERT INTO `tp5_xarticles` VALUES ('2', '真正放下一个人，不是拉黑，也不是删除', '2', '2018-02-11 21:02:43', '2018-11-21 09:11:31', '0', '<p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">有人说，越在乎，越假装不在乎；越放不下，越假装放得下。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px; color: rgb(153, 0, 0);\">没错。成年人的我们的确有着数不清的佯装，就连感情也难逃此劫。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">那个曾被置顶、秒回消息、熬夜畅聊的人，连同那些曾经炽热的喜欢，深夜不眠畅谈的欢快和被宠着重视着的小雀跃，现如今都安安静静地躺在黑名单中。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">不论是因为无所谓的小事而生气地冲动而为，还是因为有矛盾闹别扭时矫情地想博得关注，还是因为心碎而绝望地断绝关系，那看似干脆利落的拉黑、删除，都透露着在乎和放不下。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">大张旗鼓的离开都是试探，试探对方是否像自己一样还在乎；假装洒脱的放下不过是自欺欺人，欺骗自己反正我也不怕离开他。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px; color: rgb(153, 0, 0);\">其实，你很在乎他，也害怕离开他。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">拉黑或删除，不过是你害怕自己再次联系，不愿让自己卑微到尘埃里，想保留自己最后的尊严，而采取的无可奈何的强制手段；又或者是你期待着对方的主动联系，想证明他还在乎你，他离不开你，而实施的小手段。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">而真正放下一个人，从来就不是拉黑和删除，不是明明在乎着却假装不在乎，明明放不下却假装已放下。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">真正的放下，是不闻不问，是沉默不语，是无动于衷。</span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"></span></strong></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px; color: rgb(153, 0, 0);\">但感情结束的那个瞬间，过去你深爱着的，深爱着你的那个人，便不再存在了。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">他的美好，你们感情的默契，不过都是你记忆里的样子而已。而你的记忆常常会被你加上滤镜，就像相亲对象开了美颜的“照骗”一样，美好但不真实。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\"><br/></span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">而这份值得回忆和珍藏的美好，只属于曾经，从不曾属于现在。</span></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; letter-spacing: 0.5px;\">要知道，执拗地坚持着不该坚持的，本就不是深情，是愚钝；而故作洒脱的拉黑、删除，又何尝不是因为放不下。</span></p>');
INSERT INTO `tp5_xarticles` VALUES ('4', '真正在乎你的人，绝不会说这句话', '1', '2019-07-18 09:54:31', '2019-07-18 09:07:31', '0', '<section><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); text-align: center;\"><video class=\"edui-upload-video  vjs-default-skin video-js video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/20190704/video/1562232422NzkwNzc5MTQyNTIz.mp4\"><source src=\"/upload/20190704/video/1562232422NzkwNzc5MTQyNTIz.mp4\" type=\"video/mp4\"/></video></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">在乎你的男人，绝不会说“我很忙，没时间”</strong></span><span style=\"font-size: 15px;\"></span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"font-size: 15px;\"><br/></span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"font-size: 15px;\">去年一封61岁老伯的辞职信火遍网络</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><img class=\" \" src=\"https://mmbiz.qpic.cn/mmbiz_jpg/GTJa0VtlmibJ9sbn9TYvApMBiaT6wzjmejyNQ92NocoaVfEc1CTicLic46G5DgWq06iaCzcpy6aiab9IAf0aK4iaAzjjA/640?wx_fmt=jpeg&wxfrom=5&wx_lazy=1&wx_co=1\"/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">你看，爱你的男人生怕陪你不够，爱你不够，给你不够，又怎会在你主动关心他，联系他的时候用“没时间”“我很忙”敷衍你呢？</strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">网上有一段话，想陪你吃饭的人酸甜苦辣都想吃，想送你回家的人东南西北都顺路，<span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">想见你的人 24小时都有空&nbsp;</span></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(153, 0, 0); font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">生活中没有谁是真的忙，只看他愿不愿你为你花时间</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(153, 0, 0); font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">如果一个男人总是不回你信息，你想见他的时候，想联系他的时候经常用“没时间”“我很忙”来搪塞你。<br/></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">那么，他或许并没有你想象的那般在乎你。</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><br/></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">在乎你的男人，绝不会说“你很烦”。</strong><br/></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">电影《十二夜》中张柏芝和陈奕迅分手时的争吵让很多妹子看哭。</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">对男人而言，哪有什么高冷，只不过他暖的不是你。</strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">我见过所谓的钢铁直男，为买一个女友喜欢的手办，跑遍全市的商店。也见过看起来高冷无比的青年才俊，女友生病，满心焦急为其洗手作羹汤。还有日理万机的公司高层，妻子外地遇到麻烦，打个飞的过去帮忙处理。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(153, 0, 0); font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">真的在乎你的男人，绝对不会将“你真烦”三个字挂在嘴边。</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><br/></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">我们终其一生寻寻觅觅，无非是想找一个懂自己在乎自己的人，相偎依着取暖，共同走过生活中那些孤独冰冷的日子。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">余生岁月漫长，遇见一个真心在乎你的人，少了忽冷忽热的不确定，少了患得患失的不安感。</strong></span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">他懂得你的喜乐，将你的感受放到心上，生活中有再多坎坷，感情中有再多波折，有了他，你就不怕了</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">据说，人一生会遇到8263563人。其中，会打招呼的是39778人，会熟悉的是3619人，会亲近的只剩下275人，留在身边的少之又少，真正在乎你的人更是难得。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">所以如果遇到了，请好好珍惜</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p></section><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">如果没有，也别将热情一次次消耗在不珍惜你的人身上，你要留着最好的自己，等待那个对的人</span></p>');
INSERT INTO `tp5_xarticles` VALUES ('3', '年轻人，我劝你没事多存点钱', '1', '2019-07-22 16:22:56', '2019-07-22 16:07:56', '2', '<section><section><section><section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(153, 0, 0); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;\">你的存款，就是你选择权<br/></span></p></section></section></section></section><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">我曾经和闺蜜去过一次“非同凡响”的毕业旅游。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">当时的我们还是大学生，每个月的生活费只会有超支，不会有结余，整天理所当然地做着月光族。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">直到我们站在旅行社的门外盯着别人的海报，才猛然发现自己简直就是拿着买大宝的钱，跑去买人家的SK2。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">最后，不得不厚着脸皮问家里人拿了一笔小小的旅游基金，报了一个超级特惠团。</span></p><section><section><section><section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; overflow-wrap: break-word !important;\"><br/></p></section></section></section></section><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(153, 0, 0); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;\">你的存款，能够让你更加懂得消费</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">最近几年，越来越多的文章都在鼓吹消费，更有言辞偏激者，直接认为存钱只是傻x的操作。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">存钱傻不傻x我不知道，但是乱给别人贴标签的，绝对就是傻x无疑了。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">存钱，并不是一味把收入节省下来，不分青红皂白地存进各种银行卡，而是有计划、有目标地去消费，同时把不必要的支出节省出来，留作一笔存款。</span></p><section><section><section><section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p></section></section></section></section><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); text-align: center;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(153, 0, 0); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;\">你的存款，是你离不开的勇气</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">经常会听到一些身边人的抱怨：</span></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">每次他们抱怨的时候，情绪都非常激动，感觉下一秒就能原地爆炸一样。</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">可是当你提出一些建议，比如说让他们搬离自己家里、跟男朋友分手，又或者赶紧辞职的时候，他们就会开始冷静下来：</span></p><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><blockquote style=\"white-space: normal; margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;\">“咦，可是自己租房子好贵啊！”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;\">“但是，平时他也会送我一些喜欢的礼物，也不算对我太差~”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p><p style=\"margin: 0px 16px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;\">“工作哪有那么容易找，我现在还负债好几万呢！”</span></p></blockquote><p style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, \"><br/></p><p style=\"white-space: normal; margin: 0px 16px; padding: 0px; max-width: 100%; min-height: 1em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51);\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;\">归根究底，就是没钱。</span></p>');

-- ----------------------------
-- Table structure for tp5_xarticle_points
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xarticle_points`;
CREATE TABLE `tp5_xarticle_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID 标识',
  `article_id` int(11) NOT NULL COMMENT '文章标识',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '文章浏览量',
  `keywords` varchar(30) NOT NULL DEFAULT '' COMMENT '关键词',
  `picture` varchar(100) NOT NULL COMMENT '文章配图',
  `abstract` varchar(255) NOT NULL COMMENT '文章摘要',
  `recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '推荐标志  0：未推荐   1：推荐',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态标记    ：-1 删除；0：隐藏；1：显示 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='文章 要点表';

-- ----------------------------
-- Records of tp5_xarticle_points
-- ----------------------------
INSERT INTO `tp5_xarticle_points` VALUES ('1', '1', '2', '', '/home/images/article1.png', '如今科技进步，时代向前，人的平均寿命越来越长了。但长长的一生中，究竟有多少时间真正属于我们自己呢？', '1', '1');
INSERT INTO `tp5_xarticle_points` VALUES ('2', '2', '12', '', '/home/images/article2.png', '我的小天地，我闯荡的大江湖，我的浩瀚星辰和璀璨日月，再与你无关；而你的天地，你行走的江湖，你的日月和星辰，我也再不惦念。从此，一别两宽，各生欢喜。', '0', '1');
INSERT INTO `tp5_xarticle_points` VALUES ('4', '4', '0', '', '/home/images/article4.png', '人都是对喜欢的东西最上心。他若真的在乎你，一分一秒都不想失去你的消息，更不会不时玩消失，不会对你忽冷忽热，因为他比你还害怕失去。所有的不主动都是由于不喜欢，喜欢你的人永远不忙。', '0', '0');
INSERT INTO `tp5_xarticle_points` VALUES ('3', '3', '0', '', '/home/images/article3.png', '因为穷，所以要努力赚钱；努力赚钱，就会没时间找对象；找不到对象就算了，钱也没赚多少，难免开始焦虑；一旦焦虑，每天洗头的时候，掉出来的头发会告诉你什么才是真正的“绝望”。', '1', '1');

-- ----------------------------
-- Table structure for tp5_xcategorys
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xcategorys`;
CREATE TABLE `tp5_xcategorys` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(10) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '该分类的父id，取决于cat_id ',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在 app 首页导航栏显示  0：不显示  1：显示',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序数字越大越靠前',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0：正常  -1：已删除',
  `icon` varchar(255) NOT NULL COMMENT '分类图标',
  `after_sale` text NOT NULL COMMENT '售后保障',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- ----------------------------
-- Records of tp5_xcategorys
-- ----------------------------
INSERT INTO `tp5_xcategorys` VALUES ('1', '美妆', '0', '1', '0', '0', '/cms/images/category/beauty.png', '<p>ZZZZ</p>');
INSERT INTO `tp5_xcategorys` VALUES ('2', '洗护', '0', '0', '0', '0', '/cms/images/category/fresh_baby.png', '<p>TYTY</p>');
INSERT INTO `tp5_xcategorys` VALUES ('3', '尿不湿', '5', '0', '2', '-1', '/cms/images/category/baby_diapers.png', '<p>SDSXZDS</p>');
INSERT INTO `tp5_xcategorys` VALUES ('4', '美食', '0', '1', '0', '0', '/cms/images/category/food.png', '<p>XCXX</p>');
INSERT INTO `tp5_xcategorys` VALUES ('5', '服饰', '0', '1', '0', '0', '/cms/images/category/clothing.png', '<p>TO</p>');
INSERT INTO `tp5_xcategorys` VALUES ('6', '面膜', '1', '1', '0', '-1', '/cms/images/category/facial_mask.png', '<p>QQQQA</p>');
INSERT INTO `tp5_xcategorys` VALUES ('7', '清洁', '2', '1', '0', '0', '/cms/images/category/clean.png', '<p>11211</p>');
INSERT INTO `tp5_xcategorys` VALUES ('9', '连衣裙', '5', '1', '0', '0', '/cms/images/category/dress.png', '<p>AAAA</p>');
INSERT INTO `tp5_xcategorys` VALUES ('8', '饮料', '4', '1', '0', '0', '/cms/images/category/drink.png', '<p>OKII</p>');
INSERT INTO `tp5_xcategorys` VALUES ('10', '红酒', '4', '1', '1', '-1', '/cms/images/category/red_wine.png', '<p>XXXX</p>');
INSERT INTO `tp5_xcategorys` VALUES ('0', '根级分类', '0', '0', '0', '0', '', '');

-- ----------------------------
-- Table structure for tp5_xgoods
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xgoods`;
CREATE TABLE `tp5_xgoods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `thumbnail` varchar(200) NOT NULL COMMENT '缩略图，一般用于订单页的商品展示',
  `tip_word` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '提示语，字数不要太多，一般一句话',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `details` text NOT NULL COMMENT '商品描述详情',
  `reference_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品参考价',
  `selling_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `attr_info` varchar(500) NOT NULL COMMENT 'json形式保存的属性数据',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存，注意退货未支付订单时的数目变化',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商品创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '商品更新时间',
  `act_type` varchar(2) NOT NULL DEFAULT '0' COMMENT '商品参加活动类型 0：默认',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 -1：删除 0：待上架 1：已上架 2：预售 ',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='商品表\r\n\r\n注意：status 的规定，app 上只显示上架的产品哦';

-- ----------------------------
-- Records of tp5_xgoods
-- ----------------------------
INSERT INTO `tp5_xgoods` VALUES ('1', '一杯香茗', '9', '/cms/images/goods/teaImg.png', 'shijiezhenda', '1', '<p style=\"text-align: center;\">我也不想打酱油啊啊&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"http://img.baidu.com/hi/jx2/j_0022.gif\"/></p><p style=\"text-align: center;\"><br/></p>', '11.55', '8.90', '[{\"spec_id\":\"28\",\"spec_info\":[{\"spec_name\":\"小小小\",\"spec_id\":\"30\",\"specFstID\":\"28\"},{\"spec_name\":\"大大大\",\"spec_id\":\"29\",\"specFstID\":\"28\"}],\"spec_name\":\"大小\"},{\"spec_id\":\"11\",\"spec_info\":[{\"spec_name\":\"M(建议90-100斤)\",\"spec_id\":\"12\",\"specFstID\":\"11\"},{\"spec_name\":\"XL(建议110-120斤)\",\"spec_id\":\"14\",\"specFstID\":\"11\"},{\"spec_name\":\"S(建议80-90斤左右)\",\"spec_id\":\"16\",\"specFstID\":\"11\"}],\"spec_name\":\"尺码【连衣裙专用】\"}]', '391', '0000-00-00 00:00:00', '2019-07-12 16:07:18', '0', '1');
INSERT INTO `tp5_xgoods` VALUES ('2', '风中仙子连衣裙', '9', '/cms/images/goods/dress.png', '只是一件裙子嘛', '2', '<p>dsss&nbsp;<img src=\"http://img.baidu.com/hi/jx2/j_0012.gif\"/></p>', '56.99', '55.99', '', '12', '2019-03-11 18:03:26', '2019-07-12 17:04:19', '0', '0');
INSERT INTO `tp5_xgoods` VALUES ('3', '夏栀子连衣裙', '9', '/cms/images/goods/dress2.png', '别激动 ，你穿不下的', '0', '<p>似懂非懂</p>', '89.00', '68.98', '', '23', '2019-03-12 17:03:39', '2019-07-12 17:04:34', '0', '1');
INSERT INTO `tp5_xgoods` VALUES ('4', '热浪Caffee', '8', '/cms/images/goods/hotCoff.png', '好咖啡，有精神头', '2', '<p>不苦，有点甜...</p>', '5.60', '4.22', '[{\"spec_id\":\"59\",\"spec_info\":[{\"spec_name\":\"小杯\",\"spec_id\":\"60\",\"specFstID\":\"59\"},{\"spec_name\":\"中杯\",\"spec_id\":\"61\",\"specFstID\":\"59\"},{\"spec_name\":\"大杯\",\"spec_id\":\"62\",\"specFstID\":\"59\"}],\"spec_name\":\"容量【咖啡专用】\"}]', '72', '2019-03-14 11:03:58', '2019-07-12 17:04:45', '0', '1');
INSERT INTO `tp5_xgoods` VALUES ('5', '萨缪尔红酒', '8', '/cms/images/goods/redWine.png', '不给你喝，哈哈哈哈', '1', '<p>ddd</p>', '4.33', '3.22', '[{\"spec_id\":\"59\",\"spec_info\":[{\"spec_name\":\"中杯\",\"spec_id\":\"61\",\"specFstID\":\"59\"}],\"spec_name\":\"容量【咖啡专用】\"}]', '15', '2019-03-18 17:03:17', '2019-07-12 17:04:51', '0', '0');
INSERT INTO `tp5_xgoods` VALUES ('7', '卡通鲨 连衣裙SR', '9', '/cms/images/goods/dress3.png', '一条裙子', '0', '<p>有点意思！</p>', '55.33', '55.22', '[{\"spec_id\":\"17\",\"spec_info\":[{\"spec_name\":\"蓝色\",\"spec_id\":\"20\",\"specFstID\":\"17\"},{\"spec_name\":\"银色\",\"spec_id\":\"19\",\"specFstID\":\"17\"}],\"spec_name\":\"颜色\"},{\"spec_id\":\"11\",\"spec_info\":[{\"spec_name\":\"S(建议80-90斤左右)\",\"spec_id\":\"16\",\"specFstID\":\"11\"},{\"spec_name\":\"M(建议90-100斤)\",\"spec_id\":\"12\",\"specFstID\":\"11\"},{\"spec_name\":\"L(建议100-110斤)\",\"spec_id\":\"13\",\"specFstID\":\"11\"},{\"spec_name\":\"XL(建议110-120斤)\",\"spec_id\":\"14\",\"specFstID\":\"11\"}],\"spec_name\":\"尺码【连衣裙专用】\"}]', '30', '2019-03-19 10:03:48', '2019-07-12 17:04:57', '0', '1');
INSERT INTO `tp5_xgoods` VALUES ('8', '风中仙子连衣裙', '9', '/cms/images/goods/dress.png', 'HHEEE', '2', '<p>dsss&nbsp;<img src=\"http://img.baidu.com/hi/jx2/j_0012.gif\"/>&nbsp;&nbsp;</p>', '56.99', '55.99', '[{\"spec_id\":\"11\",\"spec_info\":[{\"spec_name\":\"S(建议80-90斤左右)\",\"spec_id\":\"16\",\"specFstID\":\"11\"},{\"spec_name\":\"M(建议90-100斤)\",\"spec_id\":\"12\",\"specFstID\":\"11\"},{\"spec_name\":\"L(建议100-110斤)\",\"spec_id\":\"13\",\"specFstID\":\"11\"},{\"spec_name\":\"XL(建议110-120斤)\",\"spec_id\":\"14\",\"specFstID\":\"11\"}],\"spec_name\":\"尺码【连衣裙专用】\"}]', '70', '2019-03-11 18:03:26', '2019-07-12 17:05:02', '0', '1');

-- ----------------------------
-- Table structure for tp5_xnav_menus
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xnav_menus`;
CREATE TABLE `tp5_xnav_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'navMenu 主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级菜单ID',
  `action` varchar(100) NOT NULL DEFAULT '' COMMENT 'action地址（etc:admin/home）',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '自定义图标样式',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `list_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序标识，越大越靠前',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '导航类型 0：菜单类  1：权限链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COMMENT='菜单导航表';

-- ----------------------------
-- Records of tp5_xnav_menus
-- ----------------------------
INSERT INTO `tp5_xnav_menus` VALUES ('0', '根级菜单', '0', '', '/cms/images/icon/menu_icon.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('2', '菜单管理', '1', 'cms/menu/index', '/cms/images/icon/menu_list.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('3', '列表管理', '0', '', '/cms/images/icon/desktop.png', '1', '1', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('4', '今日赠言', '3', 'cms/todayWord/index', '/cms/images/icon/diplom.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('5', '文章列表', '3', 'cms/article/index', '/cms/images/icon/adaptive.png', '1', '0', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('1', '管理分配', '0', '', '/cms/images/icon/manage.png', '1', '3', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('6', '管理人员', '1', 'cms/admin/index', '/cms/images/icon/admin.png', '1', '2', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('7', '角色管理', '1', 'cms/admin/role', '/cms/images/icon/role.png', '1', '3', '2018-02-11 21:02:43', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('29', '添加导航菜单', '2', 'cms/menu/add', '/', '1', '0', '2018-11-23 20:32:29', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('30', '导航菜单修改', '2', 'cms/menu/edit', '/', '1', '0', '2018-11-23 20:34:54', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('31', '菜单权限设置', '2', 'cms/menu/auth', '/', '1', '0', '2018-11-23 20:35:33', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('32', '分页获取菜单数据', '2', 'cms/menu/ajaxOpForPage', '/', '1', '0', '2018-11-23 20:35:57', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('33', '添加今日赠言', '4', 'cms/todayWord/add', '/', '1', '0', '2018-11-23 20:37:59', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('34', '修改今日赠言', '4', 'cms/todayWord/edit', '/', '1', '0', '2018-11-23 20:38:17', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('35', '分页获取今日赠言数据', '4', 'cms/todayWord/ajaxOpForPage', '/', '1', '0', '2018-11-23 20:38:43', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('36', '添加文章数据', '5', 'cms/article/add', '/', '1', '0', '2018-11-23 20:39:02', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('37', '修改文章数据', '5', 'cms/article/edit', '/', '1', '0', '2018-11-23 20:39:22', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('38', '添加管理员', '6', 'cms/admin/add', '/', '1', '0', '2018-11-23 20:46:18', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('39', '修改管理员数据', '6', 'cms/admin/edit', '/', '1', '0', '2018-11-23 20:46:35', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('40', '分页获取管理员数据', '6', 'cms/admin/ajaxOpForPage', '/', '1', '0', '2018-11-23 20:48:08', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('41', '增加角色', '7', 'cms/admin/addRole', '/', '1', '0', '2018-11-23 20:48:52', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('42', '修改角色数据', '7', 'cms/admin/editRole', '/', '1', '0', '2018-11-23 20:49:08', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('43', '分页获取文章数据', '5', 'cms/article/ajaxOpForPage', '/', '1', '0', '2018-11-24 16:28:33', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('48', '产品分类', '49', 'cms/category/index', '/cms/images/icon/goods_category.png', '1', '0', '2019-03-11 11:41:24', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('49', '商品管理', '0', '', '/cms/images/icon/goods_manager.png', '1', '0', '2019-03-11 15:03:47', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('50', '商品列表', '49', 'cms/goods/index', '/cms/images/icon/goods.png', '1', '0', '2019-03-11 15:04:20', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('51', '添加产品分类', '48', 'cms/category/add', '/', '1', '0', '2019-03-11 15:16:11', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('52', '修改产品分类', '48', 'cms/category/edit', '/', '1', '0', '2019-03-11 15:16:11', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('53', '删除产品分类', '48', 'cms/category/del', '/', '1', '0', '2019-03-11 15:16:11', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('54', '商品添加', '50', 'cms/goods/add', '/', '1', '0', '2019-03-11 16:53:21', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('55', '商品修改', '50', 'cms/goods/edit', '/', '1', '0', '2019-03-11 16:53:43', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('56', '分页获取商品列表', '50', 'cms/goods/ajaxOpForPage', '/', '1', '0', '2019-03-11 16:54:05', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('57', '分页获取产品分类数据', '48', 'cms/category/ajaxOpForPage', '/', '1', '0', '2019-03-12 17:08:58', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('58', 'ajax 更改上下架状态', '50', 'cms/goods/ajaxPutaway', '/', '1', '0', '2019-03-19 16:40:41', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('59', 'ajax 首页显示状态修改', '48', 'cms/category/ajaxForShow', '/', '1', '0', '2019-03-21 11:52:13', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('60', 'ajax 删除上传的图片', '50', 'cms/goods/ajaxDelUploadImg', '/', '1', '0', '2019-03-21 18:07:22', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('66', 'ajax 根据分类获取参加活动的商品', '50', 'cms/goods/ajaxGetCatGoodsForActivity', '/', '1', '0', '2019-03-30 12:00:17', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('67', '属性列表', '49', 'cms/specInfo/index', '/cms/images/icon/spec.png', '1', '0', '2019-03-31 17:07:25', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('68', '属性添加', '67', 'cms/specInfo/add', '/', '1', '0', '2019-03-31 17:07:51', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('69', '属性修改', '67', 'cms/specInfo/edit', '/', '1', '0', '2019-03-31 17:08:14', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('70', 'ajax 根据商品分类ID查询 父级属性', '67', 'cms/specInfo/ajaxGetSpecInfoFstByCat', '/', '1', '0', '2019-03-31 18:07:57', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('71', '分页获取属性数据', '67', 'cms/specInfo/ajaxOpForPage', '/', '1', '0', '2019-04-01 19:05:16', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('72', 'ajax 根据父级属性ID查询次级属性', '67', 'cms/specInfo/ajaxGetSpecInfoBySpecFst', '/', '1', '0', '2019-04-04 10:50:43', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('61', '活动列表', '49', 'cms/activity/index', '/cms/images/icon/activity.png', '1', '0', '2019-03-29 10:35:39', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('62', '活动添加', '61', 'cms/activity/add', '/', '1', '0', '2019-03-29 11:35:17', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('63', '活动修改', '61', 'cms/activity/edit', '/', '1', '0', '2019-03-29 11:35:38', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('64', '分页获取活动数据', '61', 'cms/activity/ajaxOpForPage', '/', '1', '0', '2019-03-29 11:35:55', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('65', 'ajax 首页显示状态修改', '61', 'cms/activity/ajaxForShow', '/', '1', '0', '2019-03-29 11:36:35', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('73', '用户列表', '3', 'cms/users/index', '/cms/images/icon/users.png', '1', '5', '2019-07-09 17:22:35', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('74', '分页获取用户数据', '73', 'cms/users/ajaxOpForPage', '/', '1', '0', '2019-07-09 17:22:54', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('75', 'ajax 修改用户状态', '73', 'cms/users/ajaxUpdateUserStatus', '/', '1', '0', '2019-07-09 17:22:57', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('76', '广告列表', '49', 'cms/adList/index', '/cms/images/icon/cms_ad.png', '1', '0', '2019-07-18 16:29:42', '0');
INSERT INTO `tp5_xnav_menus` VALUES ('77', '广告添加', '76', 'cms/adList/add', '/', '1', '0', '2019-07-19 18:10:55', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('80', 'ajax 首页显示广告状态修改', '76', 'cms/adList/ajaxForShow', '/', '1', '0', '2019-07-19 18:11:23', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('79', '分页获取广告数据', '76', 'cms/adList/ajaxOpForPage', '/', '1', '0', '2019-07-19 18:11:06', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('78', '广告修改', '76', 'cms/adList/edit', '/', '1', '0', '2019-07-19 18:11:00', '1');
INSERT INTO `tp5_xnav_menus` VALUES ('92', 'ajax 文章推荐操作', '5', 'cms/article/ajaxForRecommend', '/', '1', '0', '2019-07-22 16:22:01', '1');

-- ----------------------------
-- Table structure for tp5_xphotos
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xphotos`;
CREATE TABLE `tp5_xphotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) NOT NULL COMMENT '图片存放位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='图片资源表';

-- ----------------------------
-- Records of tp5_xphotos
-- ----------------------------
INSERT INTO `tp5_xphotos` VALUES ('8', '/cms/images/headshot/user8.png');
INSERT INTO `tp5_xphotos` VALUES ('2', '/cms/images/headshot/user2.png');
INSERT INTO `tp5_xphotos` VALUES ('4', '/cms/images/headshot/user4.png');
INSERT INTO `tp5_xphotos` VALUES ('7', '/cms/images/headshot/user7.png');
INSERT INTO `tp5_xphotos` VALUES ('6', '/cms/images/headshot/user6.png');
INSERT INTO `tp5_xphotos` VALUES ('3', '/cms/images/headshot/user3.png');
INSERT INTO `tp5_xphotos` VALUES ('1', '/cms/images/headshot/user1.png');
INSERT INTO `tp5_xphotos` VALUES ('9', '/cms/images/headshot/user9.png');
INSERT INTO `tp5_xphotos` VALUES ('5', '/cms/images/headshot/user5.png');

-- ----------------------------
-- Table structure for tp5_xskus
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xskus`;
CREATE TABLE `tp5_xskus` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `sku_img` varchar(150) CHARACTER SET utf8 NOT NULL COMMENT '对应的SKU商品缩略图',
  `spec_info` varchar(300) CHARACTER SET utf8 NOT NULL COMMENT '对应的商品 sku属性信息，以逗号隔开。举例：12,15,23',
  `spec_name` varchar(300) CHARACTER SET utf8 NOT NULL COMMENT 'sku 规格描述，仅供展示',
  `selling_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `sold_num` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态  0:显示（正常） -1：删除（失效）',
  PRIMARY KEY (`sku_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COMMENT='商品 SKU 库存表\r\n\r\n用于存储商品不同属性搭配的数目、价格等';

-- ----------------------------
-- Records of tp5_xskus
-- ----------------------------
INSERT INTO `tp5_xskus` VALUES ('19', '2', '', '14,18', 'L(建议100-110斤),蓝色', '10.20', '5', '2', '2019-04-20 16:33:02', '0');
INSERT INTO `tp5_xskus` VALUES ('20', '2', '', '15,16', 'L(建议100-110斤),银色', '20.00', '1', '42', '2019-04-20 16:33:08', '0');
INSERT INTO `tp5_xskus` VALUES ('21', '2', '', '14,16', '2XL(建议120-130斤),蓝色', '30.00', '6', '12', '2019-04-20 16:33:04', '0');
INSERT INTO `tp5_xskus` VALUES ('22', '2', '', '15,18', '2XL(建议120-130斤),银色', '12.00', '7', '42', '2019-04-20 16:33:06', '0');
INSERT INTO `tp5_xskus` VALUES ('23', '48', '', '14,20', 'XL(建议110-120斤),蓝色', '2.00', '122', '21', '2019-04-08 20:31:28', '-1');
INSERT INTO `tp5_xskus` VALUES ('24', '48', '', '14,19', 'XL(建议110-120斤),银色', '10.00', '41', '11', '2019-04-08 20:31:28', '-1');
INSERT INTO `tp5_xskus` VALUES ('25', '48', '', '4,9', '小号,NB78片', '10.00', '30', '1', '2019-04-08 21:31:00', '-1');
INSERT INTO `tp5_xskus` VALUES ('26', '48', '', '4,10', '小号,XL42片', '20.00', '41', '2', '2019-04-08 21:31:00', '-1');
INSERT INTO `tp5_xskus` VALUES ('27', '48', '', '3,9', '中号,NB78片', '40.00', '2', '2', '2019-04-08 21:31:00', '-1');
INSERT INTO `tp5_xskus` VALUES ('28', '48', '', '3,10', '中号,XL42片', '50.00', '110', '2', '2019-04-08 21:31:00', '-1');
INSERT INTO `tp5_xskus` VALUES ('29', '48', '', '5', '特大号', '110.00', '110', '11', '2019-04-11 17:04:48', '0');
INSERT INTO `tp5_xskus` VALUES ('30', '48', '', '4', '小号', '120.00', '12', '1112', '2019-04-11 17:04:48', '0');
INSERT INTO `tp5_xskus` VALUES ('31', '49', '', '5', '特大号', '10.00', '11', '1', '2019-05-05 15:05:11', '0');
INSERT INTO `tp5_xskus` VALUES ('32', '49', '', '4', '小号', '20.00', '11', '22', '2019-05-05 15:05:11', '0');
INSERT INTO `tp5_xskus` VALUES ('33', '13', '', '4,9', '小号,NB78片', '120.00', '11', '11', '2019-04-12 08:04:24', '0');
INSERT INTO `tp5_xskus` VALUES ('34', '13', '', '4,8', '小号,体验装L4片', '10.00', '10', '22', '2019-04-26 12:05:56', '0');
INSERT INTO `tp5_xskus` VALUES ('35', '13', '', '4,7', '小号,体验装S4片', '20.00', '10', '2', '2019-04-26 12:05:54', '0');
INSERT INTO `tp5_xskus` VALUES ('36', '13', '', '3,9', '中号,NB78片', '30.00', '41', '2', '2019-04-12 08:04:25', '0');
INSERT INTO `tp5_xskus` VALUES ('37', '13', '', '3,8', '中号,体验装L4片', '40.00', '32', '1', '2019-04-12 08:04:25', '0');
INSERT INTO `tp5_xskus` VALUES ('38', '13', '', '3,7', '中号,体验装S4片', '101.02', '21', '1', '2019-04-09 12:57:29', '0');
INSERT INTO `tp5_xskus` VALUES ('39', '5', '', '12', 'M(建议90-100斤)', '0.00', '3', '0', '2019-05-05 18:20:04', '-1');
INSERT INTO `tp5_xskus` VALUES ('40', '5', '', '15', '2XL(建议120-130斤)', '0.00', '34', '0', '2019-05-05 18:20:04', '-1');
INSERT INTO `tp5_xskus` VALUES ('41', '7', '', '20,16', '蓝色,S(建议80-90斤左右)', '55.00', '3', '3', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('42', '7', '', '20,12', '蓝色,M(建议90-100斤)', '34.00', '2', '1', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('43', '7', '', '20,13', '蓝色,L(建议100-110斤)', '12.00', '3', '1', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('44', '7', '', '20,14', '蓝色,XL(建议110-120斤)', '11.00', '5', '1', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('45', '7', '', '19,16', '银色,S(建议80-90斤左右)', '11.00', '6', '1', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('46', '7', '', '19,12', '银色,M(建议90-100斤)', '12.00', '3', '2', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('47', '7', '', '19,13', '银色,L(建议100-110斤)', '14.00', '6', '3', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('48', '7', '', '19,14', '银色,XL(建议110-120斤)', '22.00', '2', '2', '2019-05-05 18:05:28', '0');
INSERT INTO `tp5_xskus` VALUES ('49', '4', '', '60', '小杯', '12.00', '22', '1', '2019-05-05 18:05:04', '0');
INSERT INTO `tp5_xskus` VALUES ('50', '4', '', '61', '中杯', '15.00', '20', '4', '2019-05-05 18:05:04', '0');
INSERT INTO `tp5_xskus` VALUES ('51', '4', '', '62', '大杯', '18.00', '30', '6', '2019-05-05 18:05:04', '0');
INSERT INTO `tp5_xskus` VALUES ('52', '5', '', '61', '中杯', '15.00', '15', '11', '2019-05-05 18:05:04', '0');
INSERT INTO `tp5_xskus` VALUES ('53', '1', '', '60', '小杯', '22.00', '133', '11', '2019-07-12 16:56:18', '-1');
INSERT INTO `tp5_xskus` VALUES ('54', '1', '/upload/20190712/6dc805ca6e5628fd9f88e95d980e37db.jpg', '61', '中杯', '25.00', '125', '22', '2019-07-12 16:56:18', '-1');
INSERT INTO `tp5_xskus` VALUES ('55', '1', '/upload/20190712/6aa9c36bcf13b12d1705fb0cbf9efe09.jpg', '62', '大杯', '28.00', '133', '12', '2019-07-12 16:56:18', '-1');
INSERT INTO `tp5_xskus` VALUES ('56', '8', '', '16', 'S(建议80-90斤左右)', '124.00', '13', '1', '2019-05-05 18:05:08', '0');
INSERT INTO `tp5_xskus` VALUES ('57', '8', '', '12', 'M(建议90-100斤)', '124.00', '22', '2', '2019-05-05 18:05:08', '0');
INSERT INTO `tp5_xskus` VALUES ('58', '8', '', '13', 'L(建议100-110斤)', '124.00', '23', '1', '2019-05-05 18:05:08', '0');
INSERT INTO `tp5_xskus` VALUES ('59', '8', '', '14', 'XL(建议110-120斤)', '124.00', '12', '1', '2019-05-05 18:05:08', '0');
INSERT INTO `tp5_xskus` VALUES ('60', '1', '', '30,12', '小小小,M(建议90-100斤)', '0.00', '0', '0', '2019-07-12 16:07:18', '0');
INSERT INTO `tp5_xskus` VALUES ('61', '1', '', '30,14', '小小小,XL(建议110-120斤)', '0.00', '0', '0', '2019-07-12 16:07:18', '0');
INSERT INTO `tp5_xskus` VALUES ('62', '1', '/upload/20190712/26b2b9da92187011ec79e1c31390f770.jpg', '30,16', '小小小,S(建议80-90斤左右)', '0.00', '0', '0', '2019-07-12 16:07:18', '0');
INSERT INTO `tp5_xskus` VALUES ('63', '1', '/upload/20190712/cf4db060577cf108e27d9744d861bae6.jpg', '29,12', '大大大,M(建议90-100斤)', '0.00', '0', '0', '2019-07-12 16:07:18', '0');
INSERT INTO `tp5_xskus` VALUES ('64', '1', '', '29,14', '大大大,XL(建议110-120斤)', '0.00', '0', '0', '2019-07-12 16:07:18', '0');
INSERT INTO `tp5_xskus` VALUES ('65', '1', '', '29,16', '大大大,S(建议80-90斤左右)', '0.00', '0', '0', '2019-07-12 16:07:18', '0');

-- ----------------------------
-- Table structure for tp5_xspec_infos
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xspec_infos`;
CREATE TABLE `tp5_xspec_infos` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '属性名称，例如：颜色、红色',
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID ,主要用于父级ID=0的记录',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID  0：初级分类',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除，发布后不要随意删除',
  `list_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序标识，越大越靠前',
  `mark_msg` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '备注信息 主要为了区分识别，可不填',
  PRIMARY KEY (`spec_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性细则表\r\n\r\n一般只存储两级属性，注意 parent_id = 0 表示初级数据\r\n同时，注意添加后不要修改和删除';

-- ----------------------------
-- Records of tp5_xspec_infos
-- ----------------------------
INSERT INTO `tp5_xspec_infos` VALUES ('0', '根级属性', '0', '0', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('1', '号码', '3', '0', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('2', '大号', '3', '1', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('3', '中号', '3', '1', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('4', '小号', '3', '1', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('5', '特大号', '3', '1', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('6', '规格', '3', '0', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('7', '体验装S4片', '3', '6', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('8', '体验装L4片', '3', '6', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('9', 'NB78片', '3', '6', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('10', 'XL42片', '3', '6', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('11', '尺码', '9', '0', '1', '0', '连衣裙专用');
INSERT INTO `tp5_xspec_infos` VALUES ('12', 'M(建议90-100斤)', '9', '11', '1', '9', '');
INSERT INTO `tp5_xspec_infos` VALUES ('13', 'L(建议100-110斤)', '9', '11', '1', '8', '');
INSERT INTO `tp5_xspec_infos` VALUES ('14', 'XL(建议110-120斤)', '9', '11', '1', '7', '');
INSERT INTO `tp5_xspec_infos` VALUES ('15', '2XL(建议120-130斤)', '9', '11', '1', '6', '');
INSERT INTO `tp5_xspec_infos` VALUES ('16', 'S(建议80-90斤左右)', '9', '11', '1', '10', '');
INSERT INTO `tp5_xspec_infos` VALUES ('17', '颜色', '9', '0', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('18', '金色', '9', '17', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('19', '银色', '9', '17', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('20', '蓝色', '9', '17', '1', '0', 'xxxxxx');
INSERT INTO `tp5_xspec_infos` VALUES ('21', '卡其色', '9', '17', '1', '12', '');
INSERT INTO `tp5_xspec_infos` VALUES ('28', '大小', '9', '0', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('29', '大大大', '9', '28', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('30', '小小小', '9', '28', '1', '0', '');
INSERT INTO `tp5_xspec_infos` VALUES ('32', 'ddzzz', '113', '17', '-1', '0', 'sdasasaaaa');
INSERT INTO `tp5_xspec_infos` VALUES ('59', '容量', '8', '0', '1', '0', '咖啡专用');
INSERT INTO `tp5_xspec_infos` VALUES ('60', '小杯', '8', '59', '1', '3', '');
INSERT INTO `tp5_xspec_infos` VALUES ('61', '中杯', '8', '59', '1', '2', '');
INSERT INTO `tp5_xspec_infos` VALUES ('62', '大杯', '8', '59', '1', '1', '');

-- ----------------------------
-- Table structure for tp5_xtoday_words
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xtoday_words`;
CREATE TABLE `tp5_xtoday_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '摘句内容，不要太长',
  `from` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '出处',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '插图',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='今日赠言表';

-- ----------------------------
-- Records of tp5_xtoday_words
-- ----------------------------
INSERT INTO `tp5_xtoday_words` VALUES ('1', '谁的青春不迷茫，其实我们都一样！', '谁的青春不迷茫', '/home/images/ps.png', '1', '2018-11-20 19:58:05');
INSERT INTO `tp5_xtoday_words` VALUES ('2', '想和你重新认识一次 从你叫什么名字说起', '你的名字', '/home/images/ps2.png', '1', '2018-02-11 21:02:43');
INSERT INTO `tp5_xtoday_words` VALUES ('3', '我是一只雁，你是南方云烟。但愿山河宽，相隔只一瞬间.                ', '秦时明月', '/home/images/ps3.png', '1', '2018-11-20 23:23:46');
INSERT INTO `tp5_xtoday_words` VALUES ('4', '人老了的好处，就是可失去的东西越来越少了.', '哈尔的移动城堡', '/home/images/ps4.png', '1', '2018-11-20 23:23:42');
INSERT INTO `tp5_xtoday_words` VALUES ('5', '到底要怎么才能证明自己成长了 那种事情我也不知道啊 但是只要那一抹笑容尚存 我便心无旁骛 ', '声之形', '/home/images/ps5.png', '1', '2018-11-20 23:23:51');
INSERT INTO `tp5_xtoday_words` VALUES ('6', '你觉得被圈养的鸟儿为什么无法自由地翱翔天际？是因为鸟笼不是属于它的东西', '东京食尸鬼A', '/home/images/ps6.png', '1', '2018-11-28 19:13:44');
INSERT INTO `tp5_xtoday_words` VALUES ('7', '我手里拿着刀，没法抱你。我放下刀，没法保护你', '死神', '/home/images/ps7.png', '1', '2018-11-28 19:12:04');
INSERT INTO `tp5_xtoday_words` VALUES ('8', '不管前方的路有多苦，只要走的方向正确，不管多么崎岖不平，都比站在原地更接近幸福                ', '千与千寻', '/home/images/ps8.png', '1', '2019-02-22 18:15:17');
INSERT INTO `tp5_xtoday_words` VALUES ('12', '发个非官方个', 'dfdffdfdf大概', '/cms/images/headshot/wuHuang.png', '-1', '2018-11-20 23:28:36');

-- ----------------------------
-- Table structure for tp5_xupload_imgs
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xupload_imgs`;
CREATE TABLE `tp5_xupload_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '当type=0 时，对应商品ID；当type=1时，对应评论订单ID',
  `picture` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '存储的图片路径',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型 0：商品轮播图（app界面） 1: 评论订单中的图片',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态  1：正常  -1：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='上传图片表\r\n\r\n用于保存商品轮播图或者订单评论中需要的图片，注意其 type的区分使用';

-- ----------------------------
-- Records of tp5_xupload_imgs
-- ----------------------------
INSERT INTO `tp5_xupload_imgs` VALUES ('1', '20', '/cms/images/goods/teaImg.png', '2019-03-17 20:29:48', '0', '1');
INSERT INTO `tp5_xupload_imgs` VALUES ('2', '18', '/cms/images/goods/dress.png', '2019-03-17 20:29:24', '0', '1');
INSERT INTO `tp5_xupload_imgs` VALUES ('3', '20', '/cms/images/goods/dress.png', '2019-03-17 20:34:39', '0', '-1');
INSERT INTO `tp5_xupload_imgs` VALUES ('4', '18', '/cms/images/goods/teaImg.png', '2019-03-17 20:29:55', '0', '1');
INSERT INTO `tp5_xupload_imgs` VALUES ('5', '20', '/cms/images/goods/dress2.png', '2019-03-17 20:34:39', '0', '1');
INSERT INTO `tp5_xupload_imgs` VALUES ('6', '18', '/cms/images/goods/teaImg.png', '2019-03-17 20:29:55', '1', '1');
INSERT INTO `tp5_xupload_imgs` VALUES ('27', '8', '/upload/20190505/8401863d46ece8fc86d8a89ac3117d9b.jpg', '2019-05-05 18:05:08', '0', '1');
INSERT INTO `tp5_xupload_imgs` VALUES ('28', '8', '/upload/20190505/57a30e908393441e8affc9d6de60d289.jpg', '2019-05-05 18:05:08', '0', '1');

-- ----------------------------
-- Table structure for tp5_xusers
-- ----------------------------
DROP TABLE IF EXISTS `tp5_xusers`;
CREATE TABLE `tp5_xusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '昵称  默认来自微信、QQ的昵称，可后期编辑',
  `user_avatar` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户头像',
  `auth_tel` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '15118988888' COMMENT '手机认证',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别  0：未设定   1：男   2：女',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '  0:普通用户  1：内部员工',
  `reg_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '注册类型，0：安卓用户(QQ)，1：安卓用户(微信)',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `user_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态  0：正常  1：异常（可申诉） 2：黑名单',
  `union_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '第三方授权认证',
  `open_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '微信openid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='注册用户表';

-- ----------------------------
-- Records of tp5_xusers
-- ----------------------------
INSERT INTO `tp5_xusers` VALUES ('1', '海子', 'http://b-ssl.duitang.com/uploads/item/201802/25/20180225184943_ZRAdx.thumb.700_0.jpeg', '15118988888', '0', '1555735686', '0', '0', '700', '0', '', '');
INSERT INTO `tp5_xusers` VALUES ('2', '大熊', 'http://b-ssl.duitang.com/uploads/item/201505/14/20150514041841_Ja8nU.jpeg', '15118988888', '2', '1555738810', '0', '0', '0', '0', '', '');
INSERT INTO `tp5_xusers` VALUES ('3', '福斯特', 'http://img4q.duitang.com/uploads/item/201505/05/20150505084249_rFTdv.jpeg', '15118988888', '2', '1555738881', '0', '0', '0', '1', '', '');
INSERT INTO `tp5_xusers` VALUES ('4', '卡卡西', 'http://cdn.duitang.com/uploads/item/201611/03/20161103201556_FsyRa.thumb.700_0.jpeg', '15118988888', '1', '1555739036', '1', '0', '0', '2', '', '');
INSERT INTO `tp5_xusers` VALUES ('5', '斯蒂芬孙', 'http://img5q.duitang.com/uploads/item/201507/08/20150708123847_cXsx3.jpeg', '15118988888', '1', '1555748309', '1', '0', '0', '0', '', '');
INSERT INTO `tp5_xusers` VALUES ('6', '佐伊卡', 'http://b-ssl.duitang.com/uploads/item/201504/08/20150408H2943_ySvhM.thumb.700_0.jpeg', '15118988888', '0', '1555748365', '0', '0', '0', '1', '', '');
INSERT INTO `tp5_xusers` VALUES ('7', '安琪拉', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562675437205&di=61a405db0fc2ce92555380da6b909186&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201702%2F17%2F20170217131057_SExjm.jpeg', '15118988888', '1', '1555748448', '0', '0', '0', '0', '', '');
