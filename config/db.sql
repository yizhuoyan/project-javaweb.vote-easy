SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for qst_category
-- ----------------------------
CREATE TABLE `qst_category` (
  `id` char(32) NOT NULL,
  `name` varchar(16) NOT NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qst_option
-- ----------------------------
CREATE TABLE `qst_option` (
  `id` char(32) NOT NULL,
  `seq` tinyint(4) default NULL,
  `content` varchar(64) NOT NULL,
  `question_id` char(32) NOT NULL,
  `vote` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qst_question
-- ----------------------------
CREATE TABLE `qst_question` (
  `id` char(32) NOT NULL default '',
  `title` varchar(32) default NULL,
  `content` text,
  `flag` tinyint(1) default NULL,
  `optionContent` varchar(255) default NULL,
  `optiontype` tinyint(1) default NULL,
  `publishtime` datetime default NULL,
  `closeTime` datetime default NULL,
  `votedays` tinyint(4) default NULL,
  `category_id` char(32) default NULL,
  `creater_id` char(32) NOT NULL,
  `totalvote` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `category_id` (`category_id`),
  KEY `creater_id` (`creater_id`),
  CONSTRAINT `qst_question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `qst_category` (`id`),
  CONSTRAINT `qst_question_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `sys_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qst_vote
-- ----------------------------
CREATE TABLE `qst_vote` (
  `voteIP` varchar(16) NOT NULL,
  `questionoption_id` char(32) NOT NULL,
  `question_id` char(32) NOT NULL,
  PRIMARY KEY  (`voteIP`,`questionoption_id`,`question_id`),
  KEY `questionoption_id` (`questionoption_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `qst_vote_ibfk_1` FOREIGN KEY (`questionoption_id`) REFERENCES `qst_option` (`id`),
  CONSTRAINT `qst_vote_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `qst_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
CREATE TABLE `sys_admin` (
  `id` char(32) NOT NULL,
  `account` varchar(16) NOT NULL,
  `name` varchar(8) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `qst_category` VALUES ('060fca7c5a7e2739a3443f19dc433748', '军事', '');
INSERT INTO `qst_category` VALUES ('4640c7b8d6c5b6883834ecd6a0a537b5', '健康', '');
INSERT INTO `qst_category` VALUES ('48f8cc8c22dc06b82ab400c63eaa864b', '职业规划', '主要针对择业,就业方法进行问卷');
INSERT INTO `qst_category` VALUES ('4bb4461ad3175959c074d434ccc23768', '数码手机', '针对手机相关问题进行问卷');
INSERT INTO `qst_category` VALUES ('51a12ac3bba2d86a27446dd7f0683297', '育儿', '');
INSERT INTO `qst_category` VALUES ('71a60c5707006e58d4749081374b0b0d', '社会民生', '针对社会民生问题进行问卷,如调查市民出行十分方便等');
INSERT INTO `qst_category` VALUES ('8d9570e76adffa1b5b44e5135c91c6c0', '体育', '');
INSERT INTO `qst_category` VALUES ('93f193e97b2ad7b88224dc2e8c666f96', '娱乐', '');
INSERT INTO `qst_category` VALUES ('9de83631bfd6bb780df4a11944295445', '时尚', '');
INSERT INTO `qst_category` VALUES ('a0f757ff65499bf8c404f70bf1ee5bf0', '星座', '');
INSERT INTO `qst_category` VALUES ('db2e342cbdb0be29a4c400b478e6f719', '汽车', '');
INSERT INTO `qst_category` VALUES ('fab85396afcce208dff40c417f023072', '游戏', '');
INSERT INTO `qst_option` VALUES ('3f6a13742fb47f4979a406117ac7fe4c', '1', '还是重庆', '1289685aa8aa252bdee4d3f0b4acbf9b', '1');
INSERT INTO `qst_option` VALUES ('7498f41a657b19e82804fbd3366419e4', '1', '一般', '080fb00bd69bd478cf84c44fb7ad1ea1', '0');
INSERT INTO `qst_option` VALUES ('9e48b7028158ad08f694fb3b77022a97', '0', '很重要', '080fb00bd69bd478cf84c44fb7ad1ea1', '0');
INSERT INTO `qst_option` VALUES ('d9ff38b21a87b728b444a22590cd8f50', '2', '不重要', '080fb00bd69bd478cf84c44fb7ad1ea1', '1');
INSERT INTO `qst_option` VALUES ('db95199c67562138ec54310c5ab0a9ff', '0', '是重庆', '1289685aa8aa252bdee4d3f0b4acbf9b', '1');
INSERT INTO `qst_question` VALUES ('080fb00bd69bd478cf84c44fb7ad1ea1', '爽歪歪', '论爽歪歪好喝的重要性', '1', '很重要\r\n一般\r\n不重要', '1', '2016-04-13 10:33:30', '2016-04-28 10:33:30', '15', '4640c7b8d6c5b6883834ecd6a0a537b5', '1', '1');
INSERT INTO `qst_question` VALUES ('1289685aa8aa252bdee4d3f0b4acbf9b', '那些地方好耍', '想想', '1', '是重庆\r\n还是重庆', '2', '2016-04-13 10:33:10', '2016-04-23 10:33:10', '10', '93f193e97b2ad7b88224dc2e8c666f96', '1', '1');
INSERT INTO `qst_question` VALUES ('1b1268cf909629e9d8145c1672441b98', '你觉得歼-20战斗力怎么样？', '歼-20（英文：J-20，代号威龙）是中国成都飞机工业(集团)有限责任公司为中国人民解放军研制的一款第五代（采用国际五代战机的划分标准，我国国内称为四代机）双发重型隐形战斗机，用于接替歼10、歼11等第四代空中优势战机，首架工程验证机于2011年1月11日在成都实现首飞。该机未来将担负中国对空、对海的主权维护任务。预计该机将于2017~2019年左右进入部队服役，并在2020年后逐步形成战斗力。', '0', '很强\r\n强\r\n一般\r\n弱', '2', null, null, '30', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_question` VALUES ('1c68e01752e73d6a48a4f8ce191a8de2', '你有几个儿子？', '儿子，指赤子、婴儿；孩童；称谓，指父母所生的男孩。见《史记·张释之冯唐列传》：“ 文帝免冠谢曰：‘教儿子不谨。’”1、[son]∶某人直系血统的下一代男性。 ...\r\n其他含义:', '0', '1个\r\n2个\r\n3个\r\n4个\r\n一堆', '1', null, null, '10', '51a12ac3bba2d86a27446dd7f0683297', '1', '0');
INSERT INTO `qst_question` VALUES ('1ea5aaab4303a8ab658400b37ef7b1a7', '你LOL是什么段位', '由低到高是\r\n英勇黄铜，不屈白银，荣耀黄金，华贵铂金，璀璨钻石，大师（这是个全新段位，不久后会登陆服务器，现在还没有），最强王者\r\n\r\n黄铜其实就是青铜，官方是说黄铜，但是我们玩家平时口头习惯了说青铜，其实是一个意思。', '0', '黄铜\r\n白银\r\n黄金\r\n铂金\r\n钻石\r\n超凡大师\r\n王者', '1', null, null, '10', 'fab85396afcce208dff40c417f023072', '1', '0');
INSERT INTO `qst_question` VALUES ('229841b4f4b992a9833437b908936b33', '如果给你一副高配VR设备，你会拿来干嘛', 'VR：虚拟现实', '0', '做坏坏的事情\r\n玩游戏\r\n看电影\r\n自慰', '1', null, null, '1', '93f193e97b2ad7b88224dc2e8c666f96', '1', '0');
INSERT INTO `qst_question` VALUES ('268f01806d05930b29e43a38522d501b', 'vn是lol最强adc？', 'vn的特性：手短，攻速快，真实伤害，大招增加攻击力，q技能隐身。', '0', '最强\r\n第一\r\n第二\r\n第三', '1', null, null, '30', 'fab85396afcce208dff40c417f023072', '1', '0');
INSERT INTO `qst_question` VALUES ('286a3ecd8a057ecb1ca4b3df905c44e3', '晚餐吃什么比较好？', '晚餐有多种意思，有人每天晚上吃的正餐笼统的讲叫做晚餐，健康晚餐很重要对我们的身体健康有一定的影响，健康晚餐有六项注意事项，晚餐早吃少易患结石，所以晚餐很重要。', '0', '吃面\r\n吃饭\r\n吃火锅\r\n不吃了', '2', null, null, '12', '71a60c5707006e58d4749081374b0b0d', '1', '0');
INSERT INTO `qst_question` VALUES ('2cb21ad0600e9e3b72546e093f1160ad', '炉石传说哪个职业厉害', '《炉石传说:魔兽英雄传》是一款在Windows、Mac系统以及iPad上推出的免费策略类卡牌游戏。这款游戏能让具有任何游戏背景的玩家轻松上手，但又能令人欲罢不能。在《炉石传说》中可以体验节奏明快、轻松生动的卡牌对战，宛如冒险者们齐聚在旅店温暖的炉火边，惬意地进行一局友好的对弈，放松自己的身心。美国暴雪娱乐公司和网易公司2013年7月8日共同宣布，《炉石传说:魔兽英雄传》中国大陆地区独家运营权已被授予网易旗下关联公司，为期三年。', '0', '法师\r\n战士\r\n术士\r\n圣骑士\r\n牧师\r\n德鲁伊\r\n盗贼', '1', null, null, '10', 'fab85396afcce208dff40c417f023072', '1', '0');
INSERT INTO `qst_question` VALUES ('3419e374b05676686664afd60ba8e39f', '你觉得小米4s性价比如何?', '小米手机4是小米公司2014年发布的一款智能手机。小米手机4于2014年7月22日下午2点，在北京发布。小米手机4移动4G版在2014年9月9日中午12点在小米官网正式开卖.\r\n你觉得小米4s性价比如何?', '0', '很高\r\n高\r\n一般\r\n低\r\n非常低', '1', null, null, '10', '4bb4461ad3175959c074d434ccc23768', '1', '0');
INSERT INTO `qst_question` VALUES ('36d10384439a38fbb4245be15fed6c43', '你觉得保时捷和玛莎拉蒂哪个更舒适？', '    玛莎拉蒂（Maserati）是一家意大利豪华汽车制造商，1914年12月1日成立于博洛尼亚（Bologna），公司总部现设于摩德纳（Modena），品牌的标志为一支三叉戟。1993年菲亚特（Fiat S.p.A.）收购玛莎拉蒂，但品牌得以保留。玛莎拉蒂曾经是法拉利（一家菲亚特拥有大部分股权的公司）的一部分，现为菲亚特克莱斯勒汽车直接拥有。而今的玛莎拉蒂全新轿跑系列是意大利顶尖轿跑车制作技术的体现，也是意大利设计美学以及优质工匠设计思维的完美结合。\r\n', '0', '1.保时捷\r\n2.玛莎拉蒂', '1', null, null, '10', 'db2e342cbdb0be29a4c400b478e6f719', '1', '0');
INSERT INTO `qst_question` VALUES ('406bda1512b22e1be8349dab4590946b', '范冰冰的资产有多少？', '范冰冰，1981年9月16日生于山东青岛，电影演员、歌手，毕业于上海师范大学谢晋影视艺术学院。', '0', '一亿\r\n十亿\r\n富可敌国', '1', null, null, '10', '93f193e97b2ad7b88224dc2e8c666f96', '1', '0');
INSERT INTO `qst_question` VALUES ('539ee52e2172a839fea45a089e743ebb', '谁将是第三次世界大战的主宰', '世界大战是指对立的国家集团之间进行的全球性战争，为帝国主义的产物，因此它是进入帝国主义时代以来出现的一种特殊的社会现象。在帝国主义时代初期，已经发生过两次世界大战，分别为第一次世界大战和第二次世界大战。它们都是由帝国主义列强为重新瓜分殖民地、争夺世界霸权导致的。交战双方为了达成各自的战争目的，倾注国力，以武装斗争为主，在军事、政治、经济、文化、科技、外交等战线上展开了激烈的大搏斗，战争规模、消耗与危害，都是史无前例的，给世界人民造成了极大的灾难。[', '0', '中国\r\n美国\r\n德国\r\n英国\r\n俄罗斯\r\n朝鲜\r\n韩国\r\n日本\r\n法国\r\n越南', '1', null, null, '30', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_question` VALUES ('58bf337e94d44489e8248cdcf546a9ca', '你觉得你帅还是吴彦祖帅？', '吴彦祖，1974年9月30日出生于美国旧金山，祖籍上海，在加州成长，中国香港男演员、模特。', '0', '我帅\r\n我帅', '1', null, null, '100', '93f193e97b2ad7b88224dc2e8c666f96', '1', '0');
INSERT INTO `qst_question` VALUES ('639e61be148b6c7a91246d036aea26f5', '魅族手机操作方式是否人性化调查', '魅族(MEIZU)是知名智能手机厂商。秉承因梦想而立，因热爱而极致理念，致力创造更好的产品。十二年魅族工匠精神，谱写坚持，终可传承。魅族拥有高端品牌「PRO」，中端机型「MX」，子品牌「魅蓝」系列，当前热销旗舰机有：魅族 PRO 5、魅族MX5、魅蓝metal，魅蓝note2等。', '0', '比较人性化\r\n一般\r\n很不习惯', '1', null, null, '30', '4bb4461ad3175959c074d434ccc23768', '1', '0');
INSERT INTO `qst_question` VALUES ('650b8044bedba75bc054300b63e5c47a', '每天吃三顿饭好还是吃两顿好？', '古时候的人们每天都是吃两顿饭，即使是现在也有很多地方每天依然是只吃两顿。', '0', '一天三顿\r\n一天两顿', '1', null, null, '11', '4640c7b8d6c5b6883834ecd6a0a537b5', '1', '0');
INSERT INTO `qst_question` VALUES ('747d1bc327107648f5e47d2984d3db23', '谁将是2016年最卖座的电影', '《魔兽世界》是由邓肯·琼斯执导的战争片，本·福斯特、宝拉·巴顿、吴彦祖等参与演出。\r\n影片的剧情设定以90年代的《魔兽争霸》为蓝本，主要讲述卡德加、麦迪文、洛萨等人的故事，影片被描述为“血统非常纯正的奇幻电影”。[1] \r\n该片于2014年1月13日正式开拍，[2]  负责制作《魔兽世界》改编电影的传奇影业于2013年11月28日对外放宣布，这部电影的上映日期将由原本的2015年12月18日改为2016年3月11日。\r\n传奇影业在2013年七月结束与华纳的合作，转而与环球影业配合。而因为这个缘故，导致了《魔兽世界》改编电影与环球原订在2015年上映的星际大战题材电影《Star Wars》强碰档期，而这也是这部电影的上映日期之所以延迟至2016年的主要原因。[3] \r\n2015年4月24日，官方宣布影片由原来的2016年3月11日推迟至6月10日。', '0', '魔兽世界\r\n蝙蝠侠大战超人:正义黎明\r\n神奇动物在哪里\r\n凯撒万岁\r\n吹梦巨人', '1', null, null, '30', '93f193e97b2ad7b88224dc2e8c666f96', '1', '0');
INSERT INTO `qst_question` VALUES ('77b23fa1027d0fa843e4edf0b5107fb5', '你期待的月薪是多少？', '2012年10月份一场关于“月薪多少会让你在相应的城市生活不惶恐”的调查引发网友关注。上海、北京等一线城市需9000元左右，成都、大连等二线城市则在5000元上下浮动。而低薪族的“惶恐”不难理解，他们的收入大多用在生活上，承受不了太多的变数。但是，人们对生活惶恐的原因，不能仅仅只用月薪来衡量。只要安排好就能合理利用，社会就不会有那么多的惶恐。你期待的月薪是多少？', '0', '7000\r\n8000\r\n9000\r\n10000\r\n10000+', '1', null, null, '10', '71a60c5707006e58d4749081374b0b0d', '1', '0');
INSERT INTO `qst_question` VALUES ('7c97ba51961f60a89a446259c0effe8d', '你认为英雄联盟怎么样', '《英雄联盟》（简称lol）是由美国Riot Games开发，中国大陆地区由腾讯游戏运营的网络游戏。\r\n《英雄联盟》除了即时战略、团队作战外，还拥有一百多位特色各异的英雄、丰富的地图及玩法、自动匹配的战网平台，包括天赋树、召唤师系统、符文等元素。[1] \r\n2014年1月，根据官方数据显示，LOL全球最高同时在线已突破750万，全球日活跃高达2700万，全球月活跃已达6700万，注册用户亿计，LOL已经成为当今世界最具人气和影响力的网络游戏之一。', '0', '优\r\n良\r\n中\r\n差', '1', null, null, '20', 'fab85396afcce208dff40c417f023072', '1', '0');
INSERT INTO `qst_question` VALUES ('872ddee0b2c9d94a2314b30a0aaefaeb', '那些地方好耍', '想想', '0', '是重庆\r\n还是重庆\r\n还是重庆\r\n真的是重庆\r\n绝对是重庆', '2', null, null, '10', '93f193e97b2ad7b88224dc2e8c666f96', '1', '0');
INSERT INTO `qst_question` VALUES ('8ade190ac772666ba4a4ec4c5394f71c', '星座排行榜', '我认为最好的星座的是', '0', '蝎子座\r\n螃蟹座\r\n处女座\r\n天蝎座', '1', null, null, '10', 'a0f757ff65499bf8c404f70bf1ee5bf0', '1', '0');
INSERT INTO `qst_question` VALUES ('8bef68a8f91c336963a4cad023b21f8d', '目前中国最有前景的行业讨论', '你认为目前中国最有前景的行业是？', '0', 'IT\r\n建筑\r\n入殓师\r\n医生\r\n律师\r\n教师\r\n服务业', '2', null, null, '10', '48f8cc8c22dc06b82ab400c63eaa864b', '1', '0');
INSERT INTO `qst_question` VALUES ('8fbaf8c1e746d9b889c42fa68b042cb1', '每天吃三顿饭好还是吃两顿好？', '古时候的人们每天都是吃两顿饭，即使是现在也有很多地方每天依然是只吃两顿。', '0', '一天三顿\r\n一天两顿', '1', null, null, '111', '4640c7b8d6c5b6883834ecd6a0a537b5', '1', '0');
INSERT INTO `qst_question` VALUES ('a1f8e0b9c5f536ebf1741696e0de7db4', '谁将是第三次世界大战的主宰', '世界大战是指对立的国家集团之间进行的全球性战争，为帝国主义的产物，因此它是进入帝国主义时代以来出现的一种特殊的社会现象。在帝国主义时代初期，已经发生过两次世界大战，分别为第一次世界大战和第二次世界大战。它们都是由帝国主义列强为重新瓜分殖民地、争夺世界霸权导致的。交战双方为了达成各自的战争目的，倾注国力，以武装斗争为主，在军事、政治、经济、文化、科技、外交等战线上展开了激烈的大搏斗，战争规模、消耗与危害，都是史无前例的，给世界人民造成了极大的灾难。[', '0', '中国\r\n美国\r\n德国\r\n英国\r\n俄罗斯\r\n朝鲜\r\n韩国\r\n日本\r\n法国\r\n越南', '1', null, null, '30', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_question` VALUES ('a74cce25afb27b2a73a4f1f781ea1e4a', 'LOL', '谁将是S6冠军', '0', '选择你支持的队伍', '2', null, null, '20', null, '1', '0');
INSERT INTO `qst_question` VALUES ('c4e4496e624961c956d4bcacfc352c02', '魅族PRO5怎么样', '', '0', '', '1', null, null, '0', '4bb4461ad3175959c074d434ccc23768', '1', '0');
INSERT INTO `qst_question` VALUES ('c6a9d8008c91a979ea846734cbbd4dca', '最强拳击手是谁？', '拳击（英文：boxing;pugilism，法文：Boxe）是戴拳击手套进行格斗的运动项目。它既有业余的（也称奥运拳击），也有职业的商业比赛。比赛的目标是要比对方获得更多的分以战胜对方或者将对方打倒而结束比赛。与此同时比赛者要力图避开对方的打击。 拳击被称为“勇敢者的运动”。早在古希腊和罗马时代就有许多有关拳击的记载。在古代奥运中，拳击运动就已经是比赛项目之一。到第三届在圣路易斯举行的现代夏季奥运会，男子拳击正式被列入比赛项目。', '0', '迈克 泰森\r\n阿里\r\n邹市明\r\n曼尼·帕奎奥\r\n弗洛伊德·梅威瑟\r\n乔·路易斯', '1', null, null, '11', '8d9570e76adffa1b5b44e5135c91c6c0', '1', '0');
INSERT INTO `qst_question` VALUES ('c89006660bd0994af864ebc10eebbd47', '你觉得诺基亚手机怎么样？', '诺基亚（Nokia Corporation）是一家总部位于芬兰埃斯波 ，主要从事移动通信产品生产的跨国公司。诺基亚成立于1865年，当时以造纸为主业，后来逐步向胶鞋、轮胎、电缆等领域扩展，最后发展成为一家手机制造商。自1996年以来，诺基亚连续14年占据市场份额第一。面对新操作系统的智能手机的崛起，诺基亚全球手机销量第一的地位在2011年第二季被苹果及三星双双超越。', '0', '优\r\n良\r\n中\r\n差', '1', null, null, '10', '4bb4461ad3175959c074d434ccc23768', '1', '0');
INSERT INTO `qst_question` VALUES ('c8d7145abc18f8eae8a4720433248b87', '你如何看待性工作者', '进行性交易的人们', '0', '低俗\r\n垃圾\r\n无所谓\r\n伟大\r\n无关紧要\r\n关我什么事', '1', null, null, '10', '71a60c5707006e58d4749081374b0b0d', '1', '0');
INSERT INTO `qst_question` VALUES ('cf0802a8cf940b3b20d437b992a2d178', '你觉得周星驰导演的美人鱼成功在哪？', '《美人鱼》为周星驰执导，由邓超、林允、罗志祥、张雨绮主演的一部融合浪漫与惊险的爱情大片。\r\n\r\n故事讲述的富豪轩少(邓超 饰)的地产计划涉及填海工程，威胁靠海以为生的居民。背负家族秘密的美人鱼珊珊(林允 饰)被派遣前往阻止，二人在交手过程中互生情愫，虽然轩最终因为爱上珊而停止填海工作，但她因意外受伤而消失于大海。 \r\n\r\n该片于2016年2月8日在中国上映。2016年02月19日，影片票房超过《捉妖记》，成为中国票房最高的影片。', '0', '周星驰本人影响力\r\n影片画面\r\n影片情节', '1', null, null, '10', '93f193e97b2ad7b88224dc2e8c666f96', '1', '0');
INSERT INTO `qst_question` VALUES ('d0169922c1af950867b42793f9cbaeea', '魅族PRO5怎么样', '一种手机pinp', '0', '很好\r\n差\r\n很差', '1', null, null, '10', '4bb4461ad3175959c074d434ccc23768', '1', '0');
INSERT INTO `qst_question` VALUES ('d516d5033ee4d59b36841009d63a9dcf', '你怎么看待双鱼座？', '双鱼座（Pisces），出生日期为2月19日—3月20日，黄道星座之第十二宫，位于水瓶座之东，白羊座之西。\r\n双鱼座有没有强迫症？', '0', '有\r\n没有', '1', null, null, '10', 'a0f757ff65499bf8c404f70bf1ee5bf0', '1', '0');
INSERT INTO `qst_question` VALUES ('d5224dae9df727daf44465bb3412fbf9', '2016奥运会你最想看那个项目', '2016年里约热内卢奥运会，又称第31届夏季奥林匹克运动会，将于2016年8月5日-21日在巴西的里约热内卢举行。里约热内卢将成为奥运史上首个主办奥运会的南美洲城市，同时也是首个主办奥运会的葡萄牙语城市;此外，这次夏季奥运会也是继2014年世界杯后又一巴西体育盛事。', '0', '射箭\r\n马术\r\n现代五项\r\n铁人三项\r\n跆拳道\r\n田径\r\n击剑\r\n七人制橄榄球\r\n网球\r\n羽毛球\r\n乒乓球\r\n足球\r\n篮球\r\n帆船\r\n排球\r\n拳击\r\n高尔夫\r\n射击\r\n水球\r\n皮划艇\r\n体操\r\n游泳\r\n举重\r\n自行车\r\n手球\r\n花样游泳\r\n跳水\r\n摔跤\r\n柔道\r\n曲棍球\r\n赛艇', '1', null, null, '20', '8d9570e76adffa1b5b44e5135c91c6c0', '1', '0');
INSERT INTO `qst_question` VALUES ('e28fd7fb2ed710cabfa4d353d7d3b8f7', '魅族PRO5怎么样', '', '0', '', '1', null, null, '0', '4bb4461ad3175959c074d434ccc23768', '1', '0');
INSERT INTO `qst_question` VALUES ('e2b52b30f85905dbb7e4cf608cb0bb5c', '中华人民共和国最铁的盟友', '中国，位于东亚，是以华夏文明为源泉、中华文化为基础并以汉族为主体民族的多民族国家，通用汉语。中国人常以龙的传人、炎黄子孙自居，汉族又与其他少数民族被统称为“中华民族”。\r\n中国是世界四大文明古国之一，有着悠久的历史，距今约5000年前，以中原地区为中心开始出现聚落组织进而形成国家，后历经多次民族交融和朝代更迭，直至形成多民族国家的大一统局面。20世纪初辛亥革命后，君主政体退出历史舞台，共和政体建立。1949年中华人民共和国成立后，在中国大陆建立了人民代表大会制度的政体。\r\n中国疆域辽阔、民族众多，先秦时期的华夏族在中原地区繁衍生息，到了汉代通过文化交融使汉族正式成型，奠定了中国主体民族的基础。 后又通过与周边民族的交融，逐步形成统一多民族国家的局面，而人口也不断攀升，宋代中国人口突破一亿  ，清朝时期人口突破四亿  ，到目前中国人口已突破十三亿  。', '0', '巴基斯坦\r\n印度\r\n朝鲜\r\n美国\r\n俄罗斯\r\n越南', '1', null, null, '20', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_question` VALUES ('ea7563ca5964d599d6944cdd3f0870f4', '朝鲜会是第四世界大战的导火索么', '目前有新闻称朝鲜核弹对准美国', '0', '根本打不到美国\r\n会成为导火索\r\n不会\r\n金三胖就是开开玩笑', '1', null, null, '10', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_question` VALUES ('ed5250ed0466d438a114ebac626ee9b5', '英雄联盟', '论抗韩的傻逼们', '0', '英雄联盟官方网站,海量风格各异的英雄,丰富、便捷的物品合成系统,游戏内置的匹配、排行和竞技系统,独创的“召唤师”系统及技能、符文、天赋等系统组合,必将带你进入...', '2', null, null, '20', 'fab85396afcce208dff40c417f023072', '1', '0');
INSERT INTO `qst_question` VALUES ('f3d693ce153beac99154d5bd28618c95', '未来战争是否需要城管打先锋', '在中国，城管很可能成为很厉害的一个兵种', '0', '必须去\r\n可能去\r\n不必去', '1', null, null, '11', '71a60c5707006e58d4749081374b0b0d', '1', '0');
INSERT INTO `qst_question` VALUES ('f3fb1fa0d7421fcbfbe4e6c569c008d5', '你对自己的印象如何', '高否,帅否,富否', '0', '全否\r\n不高\r\n不帅\r\n不富', '2', null, null, '12', '71a60c5707006e58d4749081374b0b0d', '1', '0');
INSERT INTO `qst_question` VALUES ('fa1b85e85da54adbe634df54d4b4615e', '星座排行榜', '我认为最好的星座的是', '0', '蝎子座\r\n螃蟹座\r\n处女座\r\n天蝎座\r\n射手座', '1', null, null, '10', 'a0f757ff65499bf8c404f70bf1ee5bf0', '1', '0');
INSERT INTO `qst_question` VALUES ('fc26f388161f6b8a7bb4fe72a51b4235', '想当终极程序员的举手？', '1：码砖程序员。2.资深程序员。3.项目经理。4.技术总监。5.架构师。6.软件咨询专家。6.终极程序员。', '0', '1\r\n2\r\n3\r\n4\r\n5\r\n6', '1', null, null, '30', '48f8cc8c22dc06b82ab400c63eaa864b', '1', '0');
INSERT INTO `qst_question` VALUES ('fd1db69ba7d8fd483db49fc1a7601100', '你认为IS将会被谁终结', '“伊斯兰国”（阿拉伯语：الدولة الإسلامية‎，英语：Islamic State，缩写：IS），前称“伊拉克和大叙利亚伊斯兰国”（英语：Islamic State of Iraq and al Shams，缩写：ISIS），阿拉伯国家和部分西方国家称为“达伊沙”（DAESH），[1]  是一个自称建国的活跃在伊拉克和叙利亚的极端恐怖组织。[1]  2003年以前以“基地”组织伊拉克分支的名义开展活动。\r\n2006年，IS前身在伊拉克成立的“伊拉克伊斯兰国”。“al Shams”的意思是“大叙利亚”，即叙利亚、黎巴嫩、约旦、以色列和巴勒斯坦。该组织的目标是消除二战结束后现代中东的国家边界，并在这一地区创立一个由基地组织运作的酋长国[2]  。\r\n2014年6月29日，该组织的领袖阿布·贝克尔·巴格达迪自称为哈里发，将政权更名为“伊斯兰国”，并宣称自身对于整个穆斯林世界（包括历史上阿拉伯帝国曾统治的地区）拥有权威地位。2014年9月，美国组建了一个包括英国、法国等54个国家和欧盟、北约以及阿盟等地区组织在内的国际联盟以打击IS[2]  。', '0', '美利坚合众国\r\n中华人民共和国\r\n俄罗斯联邦\r\n大不列颠及北爱尔兰联合王国\r\n德意志联邦共和国', '1', null, null, '30', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_question` VALUES ('fe12b9c06c9032c8e43452189d6105b2', '你觉得姚明在NBA表现怎么样?', '姚明，1980年生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，中职联公司董事长兼经理[1]  。\r\n1998年4月，他入选王非执教的国家队，开始篮球生涯。2002年，他以状元秀身份被NBA的休斯敦火箭队选中。2003年至2008年连续六个赛季入选NBA西部全明星阵容。2009年，姚明收购上海男篮，成为上海大鲨鱼篮球俱乐部老板。2011年7月20日，姚明正式宣布退役。2013年，姚明当选为第十二届全国政协委员。2014年6月，参加湖南卫视《爸爸去哪儿》客串嘉宾。\r\n2015年2月10日，正式成为北京申办冬奥会形象大使之一。[2] \r\n2016年4月4日，正式入选2016年奈·史密斯篮球名人纪念堂，成为首位获此殊荣的中国人。[3] ', '0', '非常好\r\n很好\r\n一般\r\n差', '1', null, null, '10', '8d9570e76adffa1b5b44e5135c91c6c0', '1', '0');
INSERT INTO `qst_question` VALUES ('ff750271004a8d1a12149074c5845e65', '朝核问题', '朝核问题是当今世界必须解决的问题', '0', '必须\r\n一般\r\n没必要', '1', null, null, '11', '060fca7c5a7e2739a3443f19dc433748', '1', '0');
INSERT INTO `qst_vote` VALUES ('172.18.20.100', '3f6a13742fb47f4979a406117ac7fe4c', '1289685aa8aa252bdee4d3f0b4acbf9b');
INSERT INTO `qst_vote` VALUES ('172.18.20.100', 'd9ff38b21a87b728b444a22590cd8f50', '080fb00bd69bd478cf84c44fb7ad1ea1');
INSERT INTO `qst_vote` VALUES ('172.18.20.100', 'db95199c67562138ec54310c5ab0a9ff', '1289685aa8aa252bdee4d3f0b4acbf9b');
INSERT INTO `sys_admin` VALUES ('1', 'system', '张三', 'admin');
