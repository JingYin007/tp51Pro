/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp5_pro

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-25 18:06:51
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `list_order` tinyint(4) DEFAULT '0' COMMENT '排序 越大越靠前',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序标识 越大越靠前',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_articles
-- ----------------------------
INSERT INTO `tp5_articles` VALUES ('1', '讲个笑话：苹果为了“保护你” 让你手机变卡了', '1', '2018-01-11 03:04:24', '2018-01-11 03:04:25', '2', '7', '曾长时间使用过苹果产品的人都会有一个感性的认识，产品用的久了就容易变卡，应用的使用不太顺畅，这种现象在如付费支付、户外定位等急切情况下会令人非常焦急。');
INSERT INTO `tp5_articles` VALUES ('2', '放不下的是手机', '2', '2018-01-11 03:04:25', '2018-01-11 03:04:25', '3', '6', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/>早晨醒来第一件事情便是解锁手机,瞄一眼朋友圈和工作群组的更新消息,手机电量少于30%就开始焦虑恐慌,偶尔和老友涮火锅,吃到一半抱着手机出去回电话,回桌发现涮好的肥牛早就凉了 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>');
INSERT INTO `tp5_articles` VALUES ('3', '魔术97-111不敌鹈鹕 惨遭七连败', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25', '1', '6', '开场后，第32秒，佩顿在朗多投篮时犯规，送给鹈鹕2次罚球机会。第1分35秒，考辛斯妙传，朱-霍勒迪三分远投命中。第7分28秒，佩顿手滑丢球，被考辛斯抢断。鹈鹕对篮板发起疯狂进攻，本节共抢下16个篮板，包括6个前场篮板，其中戴维斯一人就贡献4个篮板球。');
INSERT INTO `tp5_articles` VALUES ('5', 'EEEEE', '1', '2018-01-11 12:27:39', '0000-00-00 00:00:00', '1', '0', '<p>ssssss</p>');
INSERT INTO `tp5_articles` VALUES ('6', '抢着读书、八百人从军、打伞睡觉 这是真实的西南联大', '1', '2018-01-05 12:34:30', '0000-00-00 00:00:00', '3', '0', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">中新网客户端北京1月25日电(记者 宋宇晟)电影《无问西东》最近正在热映。这让被认为是抗战期间“衣冠南渡”、保存“中国高等教育火种”的西南联大，再次受到关注。“这所只存在了八年的大学经历了什么？”“当年学校中的师生的生活怎样？”这样的问题成了不少人关注的话题。而这一切都要从1937年说起。</p><p><img class=\"normal\" width=\"500px\" src=\"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1635401751,2117512209&fm=173&s=DEA42FC049C33AC805FD5C14030080D0&w=500&h=333&img.JPEG\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">资料图：2017年11月1日，游客在西南联大旧址前留影。当日，正值西南联合大学建校80周年纪念日。中新社记者 任东 摄</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">“世界教育史上的长征”</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">1937年7月卢沟桥事变后，平津沦陷，南开大学遭到日机轰炸，大部校舍被焚毁。8月，国民政府教育部分别授函南开大学校长张伯苓、清华大学校长梅贻琦和北京大学校长蒋梦麟，指定三人分任长沙临时大学筹备委员会委员，三校在长沙合并组成长沙临时大学。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">随着战局急转直下，长沙也不再安全。1938年2月中旬，长沙临大开始迁往昆明。由于战时内地交通困难，学校师生分几路入滇。其中一路200余人步行横穿湘黔滇三省，被誉为“世界教育史上的长征”。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">步行团的师生一路尝尽艰辛。旅途刚开始，很多同学脚上就“都磨了泡”；途中不时遇上阴雨天，更是狼狈。“草鞋带起泥巴不少……曾先生(指化学系教授曾昭抡)之半截泥巴破大褂尤引路人注目。”当时刚从清华大学毕业并留校任教的吴征镒在日记中这样写到。</p><p><img class=\"normal\" width=\"500px\" src=\"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1645529917,2121444840&fm=173&s=98C27223705331C81EB9D88601008091&w=500&h=361&img.JPEG\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　步行团师生在旅途中。图片来源：《照片里讲述的西南联大故事》截图</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">途中，风餐露宿更是难以避免。张曼菱编撰的《照片里讲述的西南联大故事》记载，步行团常借宿农家茅舍，时常与猪、牛同屋，也曾宿营荒村野店和破庙。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">吴征镒的日记也证实了这一说法。步行团行至盘江、夜宿安南县时，便是一例。“晚间因铺盖、炊具多耽搁在盘江东岸，同学一大群如逃荒者，饥寒疲惫(本日行九十五里)，在县政府大堂上挨坐了一夜。”</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">即便是在这样的旅途中，这些年轻人依旧充满活力。抵达安南县的次日晚，步行团的学生们还在县城里举行“庆祝台儿庄胜利游行大会”。两日后，吴征镒又写道：“又二十里经芭蕉阁，风景可观。复十五里上坡到普安县。全日行五十三公里……路上同学大肆竞走。”</p><p><img class=\"normal\" width=\"500px\" src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1655658083,2125377471&fm=173&s=D70A2FE1884A1CCC1C38A49B0300A0D3&w=500&h=439&img.JPEG\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">　　资料图：西南联大蒙自分校纪念馆外的西南联大校徽。中新社发 刘冉阳 摄</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">忍痛吃淡菜、睡觉要打伞</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">一路西行至当年四月末，200多名师生抵达昆明。全程随团步行的闻一多当时在一封家书中写道：“昆明很像北京，令人起无限感慨。”</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">但事实上，昆明和北京大有不同。闻一多后来在《八年来的回忆与感想》中也坦言，“云南的生活当然不如北平舒服”，吃饭就是“一件大苦事”。“我吃菜吃得咸，而云南的菜淡得可怕，叫厨工每餐饭准备一点盐，他每每又忘记，我也懒得多麻烦，于是天天忍痛吃淡菜。”</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">饭菜确实寡淡。有当年在此求学者这样回忆联大的伙食，“早晨是稀饭，用煮蚕豆作菜，午饭晚饭是多土多砂有壳子的红米。米饭也不够的，因此大家围着饭桶，硬把胳膊向里插，菜是清水煮的萝卜白菜，没有盐，更说不上油珠子了”。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">这一年的4月，国立长沙临时大学改称为国立西南联合大学。学校首先遇到的问题是校舍不足。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">当时在西南联大任总务长的历史学家郑天挺曾这样回忆这段经历。“一九三八年联大迁滇，因昆明校舍不敷，文法两院暂设蒙自东门外原法国银行及原法国领事馆旧址。校舍仍嫌不够，于是又租了歌胪士洋行。”</p><p><br/></p>');
INSERT INTO `tp5_articles` VALUES ('7', '京东小白卡交出首份成绩单：牵手11家银行 申请量破千万', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', '<p><img class=\"large\" src=\"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=406197942,4197789040&fm=173&s=13193CC684E70EB0429D32340300D066&w=598&h=323&img.JPEG\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">传统银行与金融科技企业的联姻为金融领域的创新带来了更多想象，去年BATJ分别与国有四大行合作的消息一度成为风靡一时的行业热点。但是这种热点并非只是噱头，近期，京东金融与中国工商银行的商业联姻正在接连取得实质性进展。从双11、双12期间的联合营销，到“工银小白”数字银行的推出，京东金融和中国工商银行默契合作，堪称金融科技企业与传统金融机构牵手的楷模。而这次，双方联手再传佳音，1月18日京东金融与中国工商银行共同推出工银京东白条联名信用卡，双方的合作进一步深入。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">京东携手工银全面放惠 以金融创新服务消费生活</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">移动互联网的快速发展，以及在线消费习惯的养成，促使人们的消费观念逐渐发生改变。在电商购物、O2O消费、手机支付司空见惯的今天，如何通过金融手段改善人们的消费体验是很多金融机构努力的方向。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">工银京东小白卡是中国工商银行与京东金融跨界合作的创新产品，通过打通京东内部消费权益与中国工商银行金融服务特权，为用户提供极具吸引力的权益，极大提升了用户的消费体验，新年伊始即为用户奉献了一场消费升级盛宴。工银小白卡的持卡用户不仅可以享受京东商城购物6%立减权益，春节期间新办卡用户还有机会获得JOY手办玩偶。除此之外，持卡人还可以额外享受由中国工商银行提供的优势权益及金融功能。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">白条联名信用卡加速落地银行合作实现“全垒打”</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">自从去年1月京东金融与银联签署合作协议，时至今日已经整整一年时间。公开资料显示，在这一年的时间里，双方在联名卡领域的合作不断落地。截止目前，京东金融已经完成了与国有四大银行、股份制银行、城商行，以及农商行的合作，相继与中信银行、招商银行、广发银行、民生银行、华夏银行、光大银行、北京农商银行、上海银行、广州银行、工商银行、交通银行等11家大中型银行合作推出17张“小白卡”产品，用户申请量超过1千万。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">结合双方优势，京东金融联合各大银行以提升用户的消费体验为核心，为追求品质生活的年轻群体提供了众多个性化的解决方案。对京东金融与各大银行合作推出的小白卡来说，持卡用户不仅可以享受由京东金融与银联提供的标准化消费权益，每张小白卡还根据不同银行的基础服务及资源优势为用户设置了各具特色的个性化权益方案。比如除了可以获取不同份额的京东白条免息券和满减券外，还可以用积分兑换星巴克饮品、汉堡王套餐，购买火车票立减，以及免费获取主流视频媒体VIP会员资格。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">业内人士分析指出，伴随着移动互联网的产生，以90后为代表的年轻群体正在走进舞台中央，成为消费主力。面对这些热衷科技、喜欢新奇的消费新生代，各大金融机构需要不断反思如何用金融科技的手段直击年轻人的痛点和痒点。此次京东金融联合各大银行大量发行定制化小白卡，可以说掀起了一股金融领域的消费新主张，通过为金融机构提供更多的场景、数据、技术、营销等资源支撑，为年轻用户打造了丰富的个性化消费方案。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">为盟友输出更多能量 京东金融科技实力彰显无遗</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">金融科技变革正在开辟触达客户的新路径，伴随互联网科技的迅速发展，金融科技加持传统金融机构的步伐也越来越快。普华永道发布的《2017全球金融科技报告》指出，采用有效的增长策略以及与金融技术相结合，对于创新合作伙伴来说是至关重要的。今年的受访者中，与金融科技公司的合作率已从2016年的平均32%增长至平均45%，而放眼全球，高达82%的受访者在未来3-5年有增加与金融科技公司合作的打算。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">在波澜壮阔的金融领域科技变革中，京东金融始终秉承协作与分享的开放理念，在以用户体验为核心的基础上，与合作伙伴金融机构共享京东自身的数据资源和技术能力，全力打造覆盖更多消费场景，为用户提供即时划卡即时消费的无界金融。此次与中国工商银行合作推出工银京东小白卡不仅意味着京东金融与银联战略合作协议的加速落地，也是京东金融通过科技能力全面服务金融机构的重要一步。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">京东金融副总裁、消费金融事业部总经理区力表示，“京东金融正在通过各种载体对外输出自身的科技实力，与各大银行合作推出小白卡是京东金融走出去战略的手段之一。通过将京东内部流量、场景、数据、技术、以及营销玩法全方位对接给合作伙伴，极大推动了科技公司与传统银行的快速融合，更带动了京东金融无界金融普惠理念的加快实现。”</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">行业专家分析指出，互联网金融的快速发展以及消费群体的需求变化，急需创新的金融产品出现。京东金融作为国内领先的科技公司，正在与传统金融机构发生剧烈的化学反应。而这种化学反应未来将深刻影响我们的生活，无界金融时代终将到来！</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">艾琳</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">金评媒责任编辑</p><p><br/></p>');

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
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1：正常  -1： 删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_article_points
-- ----------------------------
INSERT INTO `tp5_article_points` VALUES ('1', '1', '2', '', '/index/images/article_1.jpg', '曾长时间使用过苹果产品的人都会有一个感性的认识，产品用的久了就容易变卡，应用的使用不太顺畅，这种现象在如付费支付、户外定位等急切情况下会令人非常焦急。', '1');
INSERT INTO `tp5_article_points` VALUES ('2', '2', '5', '', '/upload/20180125/178e591d269d7b69ae6f9d023abc09e1.jpg', '早晨醒来第一件事情便是解锁手机,瞄一眼朋友圈和工作群组的更新消息,手机电量少于30%就开始焦虑恐慌                                                ', '-1');
INSERT INTO `tp5_article_points` VALUES ('3', '3', '1', '', '/index/images/article_3.jpg', '北京时间12月23日，NBA常规赛继续进行，新奥尔良鹈鹕客场挑战奥兰多魔术，魔术97-111不敌鹈鹕，惨遭七连败。', '1');
INSERT INTO `tp5_article_points` VALUES ('4', null, '0', '', '/upload/20180125/f9212cb412eb00f3473841cfdd36f2fa.jpg', '                发胜多负少的', '1');
INSERT INTO `tp5_article_points` VALUES ('5', '5', '0', '', '/upload/20180125/80da00ea88d4834fcaa88cd1f36e5350.jpg', 'sfsfs                ', '-1');
INSERT INTO `tp5_article_points` VALUES ('6', '6', '0', '', '/upload/20180125/458da5ef9e3ef56dd7d3e7f60f5b8751.jpg', '中新网客户端北京1月25日电(记者 宋宇晟)电影《无问西东》最近正在热映。这让被认为是抗战期间“衣冠南渡”、保存“中国高等教育火种”的西南联大，再次受到关注。“这所只存在了八年的大学经历了什么？”“当年学校中的师生的生活怎样？”这样的问题成了不少人关注的话题。而这一切都要从1937年说起。                          ', '1');
INSERT INTO `tp5_article_points` VALUES ('7', '7', '0', '', '/upload/20180125/f37e3226dd72d906ca13d74570b12741.jpg', '移动互联网的快速发展，以及在线消费习惯的养成，促使人们的消费观念逐渐发生改变。在电商购物、O2O消费、手机支付司空见惯的今天，如何通过金融手段改善人们的消费体验是很多金融机构努力的方向。                                                                                                       ', '1');
INSERT INTO `tp5_article_points` VALUES ('8', '10', '0', '', '', '                对方答复                ', '-1');
INSERT INTO `tp5_article_points` VALUES ('9', '11', '0', '', '', '                对方答复                ', '-1');

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
  `namez` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级菜单ID',
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'action地址（etc:admin/home）',
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义图标样式',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，-1：删除',
  `list_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序标识，越大越靠前',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_nav_menus
-- ----------------------------
INSERT INTO `tp5_nav_menus` VALUES ('0', '根级菜单', '0', '', '/cms/images/icon/menu_icon.png', '1', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('1', '菜单管理', '0', '', '/cms/images/icon/menu_icon.png', '1', '2', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('2', '菜单列表', '1', 'cms/menu/index', '/cms/images/icon/menu_list.png', '1', '0', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('3', '今日赠言', '5', 'cms/todayWord/index', '/cms/images/icon/nav_default.png', '1', '3', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_nav_menus` VALUES ('5', '前台管理', '0', '', '/upload/20180125/960c1de6c03ddfba728a518b4861df3b.jpg', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp5_nav_menus` VALUES ('6', '文章列表', '5', 'cms/article/index', '/cms/images/icon/nav_default.png', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp5_today_words
-- ----------------------------
INSERT INTO `tp5_today_words` VALUES ('1', '谁的青春不迷茫，其实我们都一样！', '谁的青春不迷茫', '/index/images/ps.jpg', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('2', '想和你重新认识一次 从你叫什么名字说起', '你的名字', '/index/images/ps2.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('3', '我是一只雁，你是南方云烟。但愿山河宽，相隔只一瞬间.', '秦时明月', '/index/images/ps3.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('4', '人老了的好处，就是可失去的东西越来越少了.', '哈尔的移动城堡', '/index/images/ps4.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('5', '到底要怎么才能证明自己成长了 那种事情我也不知道啊 但是只要那一抹笑容尚存 我便心无旁骛 ', '声之形', '/index/images/ps5.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('6', '你觉得被圈养的鸟儿为什么无法自由地翱翔天际？是因为鸟笼不是属于它的东西                ', '东京食尸鬼', '/index/images/ps6.png', '1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('7', '我手里拿着刀，没法抱你。我放下刀，没法保护你     !                                           ', '死神', '/upload/20180124/3f4552552d167cae81ed3bf7ba99c18a.jpg', '-1', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_today_words` VALUES ('10', 'REE                                                                                ', 'RE', '/upload/20180124/957fd7e7aff52f4e5ace6a3fef7aa9e9.jpg', '-1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp5_today_words` VALUES ('11', 'dW                                                  ', 'ER', '/upload/20180124/58b85b3daf9041c16e5dbb167e62f6ac.jpg', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp5_users
-- ----------------------------
DROP TABLE IF EXISTS `tp5_users`;
CREATE TABLE `tp5_users` (
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
-- Records of tp5_users
-- ----------------------------
INSERT INTO `tp5_users` VALUES ('1', 'MoTzxx', 'e10adc3949ba59abbe56e057f20f883e', 'home/images/user_img1.jpg', '24', '你若盛开，清风自来', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_users` VALUES ('2', '百里守约', 'c33367701511b4f6020ec61ded352059', 'home/images/user_img2.jpg', '24', '放心，我一直都在！', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
INSERT INTO `tp5_users` VALUES ('3', '牧云骑星', 'e10adc3949ba59abbe56e057f20f883e', 'home/images/user_img3.jpg', '23', '天上的每一颗星星，都是一个值得还念的故人！', '2018-01-11 03:04:25', '2018-01-11 03:04:25');
