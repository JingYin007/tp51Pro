/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp5_pro

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-11 18:41:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lar5_users
-- ----------------------------
DROP TABLE IF EXISTS `lar5_users`;
CREATE TABLE `lar5_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User 主键',
  `user_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `head_portrait` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `age` tinyint(4) NOT NULL DEFAULT '0' COMMENT '年龄',
  `signature` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个性签名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lar5_users
-- ----------------------------
INSERT INTO `lar5_users` VALUES ('1', 'MoTzxx', 'e10adc3949ba59abbe56e057f20f883e', 'home/images/user_img1.jpg', '24', '你若盛开，清风自来', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `lar5_users` VALUES ('2', '百里守约', 'c33367701511b4f6020ec61ded352059', 'home/images/user_img2.jpg', '24', '放心，我一直都在！', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `lar5_users` VALUES ('3', '牧云骑星', 'e10adc3949ba59abbe56e057f20f883e', 'home/images/user_img3.jpg', '23', '天上的每一颗星星，都是一个值得还念的故人！', '2018-01-11 03:04:25', '2018-01-11 03:04:25');

-- ----------------------------
-- Table structure for tp5_articles
-- ----------------------------
DROP TABLE IF EXISTS `tp5_articles`;
CREATE TABLE `tp5_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Article 主键',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '作者ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序标识 越大越靠前',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_articles
-- ----------------------------
INSERT INTO `tp5_articles` VALUES ('1', '讲个笑话：苹果为了“保护你” 让你手机变卡了', '1', '2018-01-11 03:04:24', '2018-01-11 03:04:25', '7', '曾长时间使用过苹果产品的人都会有一个感性的认识，产品用的久了就容易变卡，应用的使用不太顺畅，这种现象在如付费支付、户外定位等急切情况下会令人非常焦急。');
INSERT INTO `tp5_articles` VALUES ('2', '放不下的是手机，感受不到的是生活', '2', '2018-01-11 03:04:25', '2018-01-11 03:04:25', '6', '早晨醒来第一件事情便是解锁手机,瞄一眼朋友圈和工作群组的更新消息,手机电量少于30%就开始焦虑恐慌,偶尔和老友涮火锅,吃到一半抱着手机出去回电话,回桌发现涮好的肥牛早就凉了');
INSERT INTO `tp5_articles` VALUES ('3', '魔术97-111不敌鹈鹕 惨遭七连败', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25', '6', '开场后，第32秒，佩顿在朗多投篮时犯规，送给鹈鹕2次罚球机会。第1分35秒，考辛斯妙传，朱-霍勒迪三分远投命中。第7分28秒，佩顿手滑丢球，被考辛斯抢断。鹈鹕对篮板发起疯狂进攻，本节共抢下16个篮板，包括6个前场篮板，其中戴维斯一人就贡献4个篮板球。');

-- ----------------------------
-- Table structure for tp5_article_points
-- ----------------------------
DROP TABLE IF EXISTS `tp5_article_points`;
CREATE TABLE `tp5_article_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID 标识',
  `article_id` int(11) DEFAULT NULL COMMENT '文章标识',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '文章浏览量',
  `keywords` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章配图',
  `abstract` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章摘要',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_article_points
-- ----------------------------
INSERT INTO `tp5_article_points` VALUES ('1', '1', '2', '', '/index/images/article_1.jpg', '曾长时间使用过苹果产品的人都会有一个感性的认识，产品用的久了就容易变卡，应用的使用不太顺畅，这种现象在如付费支付、户外定位等急切情况下会令人非常焦急。', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_article_points` VALUES ('2', '2', '5', '', '/index/images/article_2.jpg', '早晨醒来第一件事情便是解锁手机,瞄一眼朋友圈和工作群组的更新消息,手机电量少于30%就开始焦虑恐慌', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_article_points` VALUES ('3', '3', '1', '', '/index/images/article_3.jpg', '北京时间12月23日，NBA常规赛继续进行，新奥尔良鹈鹕客场挑战奥兰多魔术，魔术97-111不敌鹈鹕，惨遭七连败。', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');

-- ----------------------------
-- Table structure for tp5_comments
-- ----------------------------
DROP TABLE IF EXISTS `tp5_comments`;
CREATE TABLE `tp5_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '所回复的评论ID,0表示原始评论',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_comments
-- ----------------------------
INSERT INTO `tp5_comments` VALUES ('1', '1', '2', '0', '这是一个神奇的世界，你是个神奇的人！', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_comments` VALUES ('2', '1', '1', '1', '嗯，你说的对！', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_comments` VALUES ('3', '2', '2', '0', '我们啊，其实都一样', '2018-01-11 03:04:25', '2018-01-11 03:04:25');

-- ----------------------------
-- Table structure for tp5_migrations
-- ----------------------------
DROP TABLE IF EXISTS `tp5_migrations`;
CREATE TABLE `tp5_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tp5_migrations
-- ----------------------------
INSERT INTO `tp5_migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `tp5_migrations` VALUES ('2', '2017_12_25_111038_create_articles_table', '1');
INSERT INTO `tp5_migrations` VALUES ('3', '2017_12_26_063736_create_comments_table', '1');
INSERT INTO `tp5_migrations` VALUES ('4', '2018_01_01_115202_create_nav_menus_table', '1');
INSERT INTO `tp5_migrations` VALUES ('5', '2018_01_09_074013_create_article_points_table', '1');
INSERT INTO `tp5_migrations` VALUES ('6', '2018_01_09_075218_create_today_words_table', '1');

-- ----------------------------
-- Table structure for tp5_nav_menus
-- ----------------------------
DROP TABLE IF EXISTS `tp5_nav_menus`;
CREATE TABLE `tp5_nav_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'navMenu 主键',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级菜单ID',
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'action地址（etc:admin/home）',
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义图标样式',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `list_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序标识，越大越靠前',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_nav_menus
-- ----------------------------
INSERT INTO `tp5_nav_menus` VALUES ('4', '根级菜单', '0', '', '/cms/images/icon/menu_icon.png', '1', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('1', '菜单管理', '0', '', '/cms/images/icon/menu_icon.png', '1', '2', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('2', '菜单列表', '1', 'cms/menu/index', '/cms/images/icon/menu_list.png', '1', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('3', '今日赠言', '0', 'cms/todayWords/index', '/cms/images/icon/nav_default.png', '1', '3', '2018-01-11 03:04:25', '2018-01-11 03:04:25');

-- ----------------------------
-- Table structure for tp5_today_words
-- ----------------------------
DROP TABLE IF EXISTS `tp5_today_words`;
CREATE TABLE `tp5_today_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '摘句内容，不要太长',
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '出处',
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '插图',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_today_words
-- ----------------------------
INSERT INTO `tp5_today_words` VALUES ('1', '谁的青春不迷茫，其实我们都一样！', '谁的青春不迷茫', '/index/images/ps.jpg', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('2', '想和你重新认识一次 从你叫什么名字说起', '你的名字', '/index/images/ps2.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('3', '我是一只雁，你是南方云烟。但愿山河宽，相隔只一瞬间.', '秦时明月', '/index/images/ps3.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('4', '人老了的好处，就是可失去的东西越来越少了.', '哈尔的移动城堡', '/index/images/ps4.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('5', '到底要怎么才能证明自己成长了 那种事情我也不知道啊 但是只要那一抹笑容尚存 我便心无旁骛 ', '声之形', '/index/images/ps5.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('6', '你觉得被圈养的鸟儿为什么无法自由地翱翔天际？是因为鸟笼不是属于它的东西', '东京食尸鬼', '/index/images/ps6.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('7', '我手里拿着刀，没法抱你。我放下刀，没法保护你', '死神', '/index/images/ps7.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
