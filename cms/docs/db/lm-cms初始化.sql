/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50623
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-12-28 11:56:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_acquisition
-- ----------------------------
DROP TABLE IF EXISTS `cms_acquisition`;
CREATE TABLE `cms_acquisition` (
  `id` varchar(32) NOT NULL,
  `site_id` varchar(32) DEFAULT '0',
  `channel_id` varchar(32) DEFAULT '0',
  `type_id` varchar(32) DEFAULT '0',
  `user_id` varchar(32) DEFAULT '0',
  `acq_name` varchar(50) DEFAULT '' COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) DEFAULT '0' COMMENT '队列',
  `repeat_check_type` varchar(20) DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) DEFAULT '0' COMMENT '是否采集图片',
  `content_prefix` varchar(255) DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) DEFAULT NULL COMMENT '发布时间格式',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS采集表';

-- ----------------------------
-- Records of cms_acquisition
-- ----------------------------

-- ----------------------------
-- Table structure for cms_acquisition_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_acquisition_content`;
CREATE TABLE `cms_acquisition_content` (
  `id` varchar(32) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) DEFAULT '1' COMMENT '需要重新生成静态页',
  `txt` longtext COMMENT '文章内容',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';

-- ----------------------------
-- Records of cms_acquisition_content
-- ----------------------------

-- ----------------------------
-- Table structure for cms_acquisition_history
-- ----------------------------
DROP TABLE IF EXISTS `cms_acquisition_history`;
CREATE TABLE `cms_acquisition_history` (
  `id` varchar(32) NOT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` varchar(32) DEFAULT NULL COMMENT '采集源',
  `content_id` varchar(32) DEFAULT NULL COMMENT '内容',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';

-- ----------------------------
-- Records of cms_acquisition_history
-- ----------------------------

-- ----------------------------
-- Table structure for cms_acquisition_replace
-- ----------------------------
DROP TABLE IF EXISTS `cms_acquisition_replace`;
CREATE TABLE `cms_acquisition_replace` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `replace_new` varchar(1000) DEFAULT NULL COMMENT '内容替换为',
  `replace_old` varchar(1000) DEFAULT NULL COMMENT '将什么内容替换',
  `createtime` datetime DEFAULT NULL COMMENT '创建日期',
  `acquisition_id` varchar(32) DEFAULT NULL COMMENT '采集id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据采集关联表  内容替换';

-- ----------------------------
-- Records of cms_acquisition_replace
-- ----------------------------

-- ----------------------------
-- Table structure for cms_acquisition_temp
-- ----------------------------
DROP TABLE IF EXISTS `cms_acquisition_temp`;
CREATE TABLE `cms_acquisition_temp` (
  `id` varchar(32) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `percents` int(3) NOT NULL DEFAULT '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';

-- ----------------------------
-- Records of cms_acquisition_temp
-- ----------------------------

-- ----------------------------
-- Table structure for cms_activity
-- ----------------------------
DROP TABLE IF EXISTS `cms_activity`;
CREATE TABLE `cms_activity` (
  `id` varchar(32) NOT NULL COMMENT '活动id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `activityStartTime` datetime DEFAULT NULL COMMENT '活动开始时间',
  `activityEndTime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `activityApplyStartTime` datetime DEFAULT NULL COMMENT '活动报名开始时间',
  `activityApplyEndTime` datetime DEFAULT NULL COMMENT '活动报名截止时间',
  `activityPleNum` varchar(255) DEFAULT NULL COMMENT '人数限制',
  `activityIpLimit` varchar(11) DEFAULT NULL COMMENT 'IP限制',
  `activitySex` varchar(11) DEFAULT NULL COMMENT '性别',
  `activityBackground` varchar(255) DEFAULT NULL COMMENT '页面背景图',
  `activityDataType` varchar(255) DEFAULT NULL COMMENT '活动类型',
  `activityAddress` varchar(255) DEFAULT NULL COMMENT '活动地址',
  `activityContent` varchar(1000) DEFAULT NULL COMMENT '活动内容',
  `activityRemark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdtime` datetime DEFAULT NULL,
  `activityPeople` varchar(255) DEFAULT NULL COMMENT '发起人',
  `activityaddressPoint` varchar(255) DEFAULT NULL COMMENT '坐标点',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of cms_activity
-- ----------------------------

-- ----------------------------
-- Table structure for cms_activity_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_activity_option`;
CREATE TABLE `cms_activity_option` (
  `id` varchar(32) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL COMMENT '选项名称',
  `option_mark` varchar(255) DEFAULT NULL COMMENT '字段标识',
  `date_type` varchar(255) DEFAULT NULL COMMENT '数据类型',
  `textsize_limit` varchar(255) DEFAULT NULL COMMENT '文本大小限制',
  `optional_value` varchar(255) DEFAULT NULL COMMENT '可选值',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `validation` varchar(255) DEFAULT NULL COMMENT '验证规则',
  `is_showdelete` int(4) DEFAULT NULL COMMENT '是否显示删除(1:否,0：是)',
  `is_enabled` int(4) DEFAULT NULL COMMENT '是否启用(1:是，0：否)',
  `sort` varchar(11) DEFAULT NULL COMMENT '排序',
  `is_show` int(4) DEFAULT NULL COMMENT '是否默认显示',
  `selectsize_limit` varchar(255) DEFAULT NULL COMMENT '选项大小限制',
  `filesize_limit` varchar(255) DEFAULT NULL COMMENT '文件大小限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_activity_option
-- ----------------------------

-- ----------------------------
-- Table structure for cms_activity_optioncontent
-- ----------------------------
DROP TABLE IF EXISTS `cms_activity_optioncontent`;
CREATE TABLE `cms_activity_optioncontent` (
  `id` varchar(32) NOT NULL,
  `is_enableds` int(4) DEFAULT NULL COMMENT '是否启用',
  `is_required` int(4) DEFAULT NULL COMMENT '是否必填',
  `is_receptionShow` int(4) DEFAULT NULL COMMENT '是否前台显示',
  `optionids` varchar(32) DEFAULT NULL COMMENT '选项id',
  `activityids` varchar(32) DEFAULT NULL COMMENT '活动id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_activity_optioncontent
-- ----------------------------

-- ----------------------------
-- Table structure for cms_activity_option_ext
-- ----------------------------
DROP TABLE IF EXISTS `cms_activity_option_ext`;
CREATE TABLE `cms_activity_option_ext` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `optiondids` varchar(32) DEFAULT NULL COMMENT '选项id',
  `ext_text` varchar(255) DEFAULT NULL COMMENT '文本内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `IP` varchar(255) DEFAULT NULL COMMENT 'IP',
  `logids` varchar(255) DEFAULT NULL COMMENT '报名人id',
  `ext_checkbox` varchar(255) DEFAULT NULL COMMENT '多选内容',
  `ext_select` varchar(255) DEFAULT NULL COMMENT '下拉内容',
  `ext_picture` varchar(255) DEFAULT NULL COMMENT '图片上传',
  `ext_file` varchar(255) DEFAULT NULL COMMENT '文件上传',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_activity_option_ext
-- ----------------------------

-- ----------------------------
-- Table structure for cms_activity_people
-- ----------------------------
DROP TABLE IF EXISTS `cms_activity_people`;
CREATE TABLE `cms_activity_people` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `activityids` varchar(32) DEFAULT NULL COMMENT '活动id',
  `IP` varchar(255) DEFAULT NULL COMMENT 'IP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createby` varchar(255) DEFAULT NULL COMMENT '创建人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_activity_people
-- ----------------------------

-- ----------------------------
-- Table structure for cms_advertising
-- ----------------------------
DROP TABLE IF EXISTS `cms_advertising`;
CREATE TABLE `cms_advertising` (
  `id` varchar(32) NOT NULL,
  `gid` varchar(32) DEFAULT NULL COMMENT '广告栏位id',
  `site_id` varchar(32) DEFAULT NULL COMMENT '所属网站id',
  `ad_name` varchar(100) DEFAULT NULL COMMENT '广告名称',
  `category` varchar(50) DEFAULT NULL COMMENT '广告类型',
  `ad_code` varchar(1000) DEFAULT NULL COMMENT '广告代码',
  `ad_weight` int(11) DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) DEFAULT '0' COMMENT '点击次数',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) DEFAULT '1' COMMENT '是否启用',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片上传地址',
  `iheight` varchar(30) DEFAULT NULL COMMENT '度高',
  `iweight` varchar(30) DEFAULT NULL COMMENT '度宽',
  `urladress` varchar(50) DEFAULT NULL COMMENT '链接地址',
  `urlpoint` varchar(50) DEFAULT NULL COMMENT '接链提示',
  `urltarget` int(11) DEFAULT NULL COMMENT '接链目标',
  `wordcontent` varchar(50) DEFAULT NULL COMMENT '文字内容',
  `wordsize` varchar(30) DEFAULT NULL COMMENT '字文大小',
  `wordcolor` varchar(50) DEFAULT NULL COMMENT '文字颜色',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告表';

-- ----------------------------
-- Records of cms_advertising
-- ----------------------------
INSERT INTO `cms_advertising` VALUES ('1', '1', '1', '中国移动', 'img', '', '0', '12', '1', '2015-03-10 17:11:22', null, '1', '/pcstyle/ad/main_ad1.jpg', '', '', '', '', '0', '', '', '', null);
INSERT INTO `cms_advertising` VALUES ('2', '2', '1', '雷铭CMSv3.0', 'img', '', '0', '3', '0', '2015-03-10 18:44:22', null, '1', '/upload/image/2015/07/17/1437102626123035692.jpg', '', '', '', '', '0', '', '', '', null);
INSERT INTO `cms_advertising` VALUES ('297ebc2d4f7375f4014f737abfe50002', '402881834e046e48014e046f81b20001', '1', '启动图雷铭新闻', 'img', null, '0', '0', '0', '2015-08-28 16:41:48', null, '1', '/upload/image/2015/08/28/1440751446159031932.png', '', '', '', '', '0', null, null, null, '2015-08-28 16:44:28');
INSERT INTO `cms_advertising` VALUES ('40288193518ea69f01518eed767b002e', '40288193518ea69f01518eecb1d6002b', '297ebc2d4fa20242014fa566987b0002', '头部广告1', 'img', null, '0', '0', '0', '2015-12-11 10:44:20', null, '1', '/upload/image/2015/12/11/1449801903433017694.jpg', '', '', '', '', '0', null, null, null, '2015-12-11 10:45:05');
INSERT INTO `cms_advertising` VALUES ('40288193518ea69f01518eedaf450031', '40288193518ea69f01518eecb1d6002b', '297ebc2d4fa20242014fa566987b0002', '头部广告2', 'img', null, '0', '0', '0', '2015-12-11 10:45:07', null, '1', '/upload/image/2015/12/11/1449801919007014807.jpg', '', '', '', '', '0', null, null, null, '2015-12-11 10:45:20');
INSERT INTO `cms_advertising` VALUES ('40288193518ea69f01518ef214c60036', '40288193518ea69f01518ef1d2b20033', '297ebc2d4fa20242014fa566987b0002', '首页广告', 'img', null, '0', '0', '0', '2015-12-11 10:49:56', null, '1', '/upload/image/2015/12/11/1449802206070058444.jpg', '', '', '', '', '0', null, null, null, '2015-12-11 10:50:08');

-- ----------------------------
-- Table structure for cms_advertising_space
-- ----------------------------
DROP TABLE IF EXISTS `cms_advertising_space`;
CREATE TABLE `cms_advertising_space` (
  `id` varchar(32) NOT NULL,
  `site_id` varchar(32) DEFAULT NULL COMMENT '属所网站id',
  `ad_name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) DEFAULT NULL COMMENT '是否启用',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';

-- ----------------------------
-- Records of cms_advertising_space
-- ----------------------------
INSERT INTO `cms_advertising_space` VALUES ('1', '1', '首页-全屏下压', '首页-全屏下压', '0', null);
INSERT INTO `cms_advertising_space` VALUES ('2', '1', '首页-顶部通栏', '首页-顶部通栏', '1', null);
INSERT INTO `cms_advertising_space` VALUES ('402881834e046e48014e046f81b20001', '1', 'APP启动图', 'APP启动图', '1', '2015-06-18 10:11:33');
INSERT INTO `cms_advertising_space` VALUES ('40288193518ea69f01518eecb1d6002b', '297ebc2d4fa20242014fa566987b0002', '小小站头部广告', '小小站头部广告', '1', '2015-12-11 10:44:15');
INSERT INTO `cms_advertising_space` VALUES ('40288193518ea69f01518ef1d2b20033', '297ebc2d4fa20242014fa566987b0002', '首页广告', '首页广告', '1', '2015-12-11 10:49:51');

-- ----------------------------
-- Table structure for cms_attachment
-- ----------------------------
DROP TABLE IF EXISTS `cms_attachment`;
CREATE TABLE `cms_attachment` (
  `ID` varchar(32) NOT NULL,
  `attachmentcontent` longblob,
  `attachmenttitle` varchar(100) DEFAULT NULL,
  `businesskey` varchar(32) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `extend` varchar(32) DEFAULT NULL,
  `note` longtext,
  `realpath` varchar(100) DEFAULT NULL,
  `subclassname` longtext,
  `swfpath` longtext,
  `BUSENTITYNAME` varchar(100) DEFAULT NULL,
  `INFOTYPEID` varchar(32) DEFAULT NULL,
  `USERID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_mnq23hlc835n4ufgjl7nkn3bd` (`USERID`) USING BTREE,
  CONSTRAINT `cms_attachment_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`USERID`) REFER `lm_maven_cms/cms_user`(`id`)';

-- ----------------------------
-- Records of cms_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_attach_picture
-- ----------------------------
DROP TABLE IF EXISTS `cms_attach_picture`;
CREATE TABLE `cms_attach_picture` (
  `id` varbinary(32) NOT NULL COMMENT 'id',
  `realName` varchar(225) DEFAULT NULL COMMENT '图片原名',
  `localName` varchar(225) DEFAULT NULL COMMENT '上传后的名字',
  `thumbnailPath` varchar(225) DEFAULT NULL COMMENT '缩略图路径',
  `localPath` varchar(255) DEFAULT NULL COMMENT '原图路径',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `site_id` varchar(32) DEFAULT NULL COMMENT '网站id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片库';

-- ----------------------------
-- Records of cms_attach_picture
-- ----------------------------
INSERT INTO `cms_attach_picture` VALUES (0x3430323838316139353164326636653630313531643333623463343630303063, '1450947857459047889.png', 'secondarytile.png', '/upload/image/2015/12/24/1450947857459047889.png.thumb.jpg', '/upload/image/2015/12/24/1450947857459047889.png', '2015-12-24 17:04:17', '1');

-- ----------------------------
-- Table structure for cms_base_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_base_user`;
CREATE TABLE `cms_base_user` (
  `ID` varchar(32) NOT NULL,
  `activitiSync` smallint(6) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `signature` blob,
  `status` smallint(6) DEFAULT NULL,
  `userkey` varchar(200) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `departid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_15jh1g4iem1857546ggor42et` (`departid`) USING BTREE,
  CONSTRAINT `cms_base_user_ibfk_1` FOREIGN KEY (`departid`) REFERENCES `cms_depart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`departid`) REFER `lm_maven_cms/cms_depart`(`ID`)';

-- ----------------------------
-- Records of cms_base_user
-- ----------------------------
INSERT INTO `cms_base_user` VALUES ('402881ea452582c101452583a5140044', null, null, 'c44b01947c9e6e3f', '管理员  ', null, '1', '管理员', 'admin', '402881ea452582c101452583a44b0015');

-- ----------------------------
-- Table structure for cms_branch
-- ----------------------------
DROP TABLE IF EXISTS `cms_branch`;
CREATE TABLE `cms_branch` (
  `id` varchar(32) NOT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL COMMENT '标记',
  `company_name` varchar(250) DEFAULT NULL COMMENT '公司名称',
  `company_shortname` varchar(250) DEFAULT NULL COMMENT '公司简称',
  `company_cell` varchar(250) DEFAULT NULL COMMENT '电话',
  `company_phone` varchar(250) DEFAULT NULL COMMENT '手机',
  `company_url` varchar(250) DEFAULT NULL COMMENT '地址',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `intro` varchar(4000) DEFAULT NULL COMMENT '简介',
  `taxis` varchar(250) DEFAULT '0' COMMENT '排列',
  `isbranch` varchar(250) DEFAULT '0' COMMENT '分支',
  `logourl` varchar(250) DEFAULT NULL COMMENT 'Logo地址',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司分支机构';

-- ----------------------------
-- Records of cms_branch
-- ----------------------------

-- ----------------------------
-- Table structure for cms_classify
-- ----------------------------
DROP TABLE IF EXISTS `cms_classify`;
CREATE TABLE `cms_classify` (
  `id` varchar(32) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '分类名称',
  `info` varchar(90) NOT NULL COMMENT '分类描述',
  `sorts` varchar(6) NOT NULL COMMENT '显示顺序',
  `img` char(255) NOT NULL DEFAULT '' COMMENT '分类图片外链地址（宽720高400）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '外链网站或活动',
  `status` varchar(1) NOT NULL DEFAULT '' COMMENT '首页显示',
  `token` varchar(30) NOT NULL,
  `level` int(11) DEFAULT NULL COMMENT '分类级别',
  `parentid` varchar(32) DEFAULT NULL COMMENT '上级分类',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_classify
-- ----------------------------

-- ----------------------------
-- Table structure for cms_cmskeyword
-- ----------------------------
DROP TABLE IF EXISTS `cms_cmskeyword`;
CREATE TABLE `cms_cmskeyword` (
  `id` varchar(32) NOT NULL,
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `is_disabled` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jc_keyword_site` (`site_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';

-- ----------------------------
-- Records of cms_cmskeyword
-- ----------------------------

-- ----------------------------
-- Table structure for cms_collect
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `memberLevel` varchar(255) DEFAULT NULL COMMENT '会员级别',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `collectPerson` varchar(255) DEFAULT NULL COMMENT '收藏人',
  `collectPersonId` varchar(32) DEFAULT NULL COMMENT '收藏人ID',
  `collectTime` date DEFAULT NULL COMMENT '评论时间',
  `contentId` varchar(32) DEFAULT NULL COMMENT '文章id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
-- Records of cms_collect
-- ----------------------------

-- ----------------------------
-- Table structure for cms_commentary
-- ----------------------------
DROP TABLE IF EXISTS `cms_commentary`;
CREATE TABLE `cms_commentary` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `memberLevel` varchar(255) DEFAULT NULL COMMENT '会员级别',
  `contentId` varchar(32) DEFAULT NULL COMMENT '内容id',
  `comment_type` varchar(50) DEFAULT NULL COMMENT '评价类型',
  `title` varchar(255) DEFAULT NULL COMMENT '文章主题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `commentaryPerson` varchar(255) DEFAULT NULL COMMENT '评论人',
  `personId` varchar(32) DEFAULT NULL COMMENT '评论人ID',
  `commentaryTime` datetime DEFAULT NULL COMMENT '评论时间',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `cellphone` varchar(255) DEFAULT NULL COMMENT '手机',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `ischeck` varchar(10) DEFAULT NULL COMMENT '审核状态',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of cms_commentary
-- ----------------------------

-- ----------------------------
-- Table structure for cms_company
-- ----------------------------
DROP TABLE IF EXISTS `cms_company`;
CREATE TABLE `cms_company` (
  `id` varchar(32) NOT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL COMMENT '标记',
  `company_name` varchar(250) DEFAULT NULL COMMENT '公司名称',
  `company_shortname` varchar(250) DEFAULT NULL COMMENT '公司简称',
  `company_cell` varchar(250) DEFAULT NULL COMMENT '电话',
  `company_phone` varchar(250) DEFAULT NULL COMMENT '手机',
  `company_url` varchar(250) DEFAULT NULL COMMENT '地址',
  `latitude` double DEFAULT NULL COMMENT '纬度',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `intro` varchar(4000) DEFAULT NULL COMMENT '简介',
  `taxis` varchar(250) DEFAULT '0' COMMENT '排列',
  `isbranch` varchar(250) DEFAULT '0' COMMENT '分支',
  `logourl` varchar(250) DEFAULT NULL COMMENT 'Logo地址',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
-- Records of cms_company
-- ----------------------------

-- ----------------------------
-- Table structure for cms_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_config`;
CREATE TABLE `cms_config` (
  `ID` varchar(32) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `content` longtext,
  `name` varchar(100) NOT NULL,
  `note` longtext,
  `userid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `FK_m3q8r50ror4fl7fjkvd82tqgn` (`userid`) USING BTREE,
  CONSTRAINT `cms_config_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`userid`) REFER `lm_maven_cms/cms_user`(`id`)';

-- ----------------------------
-- Records of cms_config
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content` (
  `id` varchar(32) NOT NULL COMMENT '内容ID',
  `catid` varchar(32) NOT NULL COMMENT '栏目ID',
  `pathids` varchar(100) DEFAULT NULL COMMENT 'pathids',
  `modelid` varchar(32) NOT NULL COMMENT '模型ID',
  `classify` varchar(255) DEFAULT NULL COMMENT '分类(1文章2组图3链接4视频5活动6投票7访谈8调查9专题)',
  `title` char(80) NOT NULL COMMENT '标题',
  `subtitle` varchar(120) DEFAULT NULL COMMENT '短标题',
  `citetitle` varchar(255) DEFAULT NULL COMMENT '引题',
  `color` text COMMENT '颜色',
  `thumb` char(255) DEFAULT NULL COMMENT '缩略图',
  `tags` char(60) DEFAULT NULL COMMENT '标签',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `editor` varchar(15) DEFAULT NULL COMMENT '编辑人',
  `sourceid` varchar(255) DEFAULT NULL COMMENT '来源ID',
  `url` char(255) DEFAULT NULL COMMENT 'URL路径',
  `wapurl` varchar(255) DEFAULT NULL COMMENT 'wap页面访问路径',
  `weight` tinyint(3) DEFAULT '60' COMMENT '宽度',
  `status` varchar(255) DEFAULT '10' COMMENT '工作流状态',
  `constants` varchar(255) DEFAULT NULL COMMENT '文章状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '创建人',
  `published` datetime DEFAULT NULL COMMENT '发布时间',
  `publishedby` varchar(255) DEFAULT NULL COMMENT '发布人',
  `unpublished` bigint(20) DEFAULT NULL COMMENT 'unpublished',
  `unpublishedby` mediumint(8) DEFAULT NULL COMMENT 'unpublishedby',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modifiedby` varchar(255) DEFAULT NULL COMMENT '修改人',
  `checked` datetime DEFAULT NULL COMMENT '检查时间',
  `checkedby` varchar(255) DEFAULT NULL COMMENT '检查人',
  `locked` datetime DEFAULT NULL COMMENT '锁定时间',
  `lockedby` varchar(255) DEFAULT NULL COMMENT '锁定人',
  `noted` datetime DEFAULT NULL COMMENT '下线时间',
  `notedby` varchar(255) DEFAULT NULL COMMENT '下线人',
  `note` tinyint(1) DEFAULT '0' COMMENT '注解',
  `workflow_step` tinyint(1) DEFAULT NULL COMMENT '工作流步骤',
  `workflow_roleid` varchar(255) DEFAULT NULL COMMENT '工作流角色ID',
  `iscontribute` varchar(255) DEFAULT '0' COMMENT '是否投稿',
  `spaceid` varchar(32) DEFAULT NULL COMMENT '专栏ID',
  `related` tinyint(3) DEFAULT '0' COMMENT 'related',
  `pv` mediumint(8) DEFAULT '0' COMMENT '浏览量',
  `allowcomment` varchar(255) DEFAULT '0' COMMENT '是否允许评论',
  `docExtendJson` varchar(4000) DEFAULT NULL COMMENT '扩展字段json',
  `digest` varchar(4000) DEFAULT NULL COMMENT '摘要',
  `attribute` varchar(255) DEFAULT NULL COMMENT '属性',
  `extendCount` int(11) DEFAULT NULL COMMENT '扩张字段数',
  `correlation` varchar(255) DEFAULT NULL COMMENT '相关',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `catName` varchar(50) DEFAULT NULL COMMENT '栏目名',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点Id',
  `grade` int(11) DEFAULT '0' COMMENT '评分',
  `publishedbyid` varchar(255) DEFAULT NULL COMMENT '发布人id',
  `syn_catid` varchar(255) DEFAULT NULL COMMENT '同时发布栏目id',
  `memberid` varchar(32) DEFAULT NULL COMMENT '会员id',
  `two_code` varchar(255) DEFAULT NULL COMMENT '二维码',
  `content_mark` varchar(255) DEFAULT NULL COMMENT '内容标记',
  `isposter` int(2) DEFAULT '0' COMMENT '是否广告(0否1是)',
  `is_headline` int(11) DEFAULT '0' COMMENT '是否为头条',
  `is_top` int(11) DEFAULT '0' COMMENT '置顶',
  `lock_content` varchar(32) DEFAULT NULL COMMENT '稿件是否锁定（true：锁定，false:不锁定）',
  `static_url` varchar(255) DEFAULT NULL COMMENT '静态地址',
  `dynamic_url` varchar(255) DEFAULT NULL COMMENT '动态地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of cms_content
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_accessory
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_accessory`;
CREATE TABLE `cms_content_accessory` (
  `id` varchar(32) NOT NULL COMMENT '附件id',
  `content_id` varchar(32) DEFAULT NULL COMMENT '内容id',
  `accessory_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `accessory_url` varchar(255) DEFAULT NULL COMMENT '附件地址',
  `accessory_type` varchar(255) DEFAULT NULL COMMENT '附件分类',
  `accessory_remark` varchar(255) DEFAULT NULL COMMENT '附件备注',
  `accessory_download` int(11) DEFAULT NULL COMMENT '附件下载量',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章附件表';

-- ----------------------------
-- Records of cms_content_accessory
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_article`;
CREATE TABLE `cms_content_article` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `content` text COMMENT '内容',
  `pagecount` tinyint(2) NOT NULL DEFAULT '0' COMMENT '页数',
  `saveremoteimage` tinyint(1) NOT NULL DEFAULT '1' COMMENT '保存远程图片',
  `words_count` smallint(5) NOT NULL DEFAULT '0' COMMENT '字数',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `memberid` varchar(32) DEFAULT NULL COMMENT '会员id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of cms_content_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_content_cat
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_cat`;
CREATE TABLE `cms_content_cat` (
  `id` varchar(32) NOT NULL COMMENT '栏目ID',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父栏目ID',
  `parentids` varchar(255) DEFAULT '0,' COMMENT '所有父栏目id',
  `pathids` varchar(255) DEFAULT '0,' COMMENT '当前栏目的路径id  包含所有父级栏目id以及当前栏目id',
  `name` varchar(20) DEFAULT NULL COMMENT '栏目名称',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `workflowid` varchar(32) DEFAULT NULL COMMENT '工作流ID',
  `model` varchar(255) DEFAULT NULL COMMENT '模型',
  `template_index` varchar(2000) DEFAULT NULL COMMENT '模板索引',
  `template_list` varchar(2000) DEFAULT NULL COMMENT '模板列表',
  `template_date` varchar(255) DEFAULT NULL COMMENT '模板日期',
  `path` varchar(100) DEFAULT NULL COMMENT '栏目生成路径',
  `thumb` char(60) DEFAULT NULL COMMENT '缩略图',
  `wap_url` varchar(100) DEFAULT NULL COMMENT 'wap访问的URL',
  `url` varchar(100) DEFAULT NULL COMMENT 'url',
  `iscreateindex` tinyint(1) unsigned DEFAULT '1' COMMENT '是否创建索引',
  `urlrule_index` varchar(255) DEFAULT NULL COMMENT 'URL索引规则',
  `urlrule_list` varchar(255) DEFAULT NULL COMMENT 'URL列表规则',
  `urlrule_show` varchar(255) DEFAULT NULL COMMENT 'URL显示规则',
  `enablecontribute` tinyint(1) unsigned DEFAULT '0' COMMENT 'enablecontribute',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `posts` mediumint(8) unsigned DEFAULT '0' COMMENT 'posts',
  `comments` mediumint(8) unsigned DEFAULT '0' COMMENT '评论数',
  `pv` int(10) unsigned DEFAULT '0' COMMENT '浏览量',
  `sort` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  `disabled` tinyint(1) unsigned DEFAULT '0' COMMENT '不可用',
  `htmlcreated` tinyint(1) unsigned DEFAULT '1' COMMENT '是否已创建HTML',
  `extendJSON` varchar(4000) DEFAULT NULL COMMENT '扩展字段JSON',
  `jsonId` varchar(32) DEFAULT NULL COMMENT 'JSONID',
  `isArticleSelected` varchar(200) DEFAULT NULL COMMENT '文章选中',
  `pagesize` int(100) DEFAULT '10' COMMENT '页数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modifiedby` varchar(50) DEFAULT NULL COMMENT '修改人',
  `levels` int(11) DEFAULT NULL COMMENT '等级',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点Id',
  `list_model` text COMMENT '列表页模板',
  `urlrule_content` text COMMENT '内容页URL规则',
  `iscontribute` int(11) DEFAULT '0' COMMENT '是否允许用户投稿',
  `iscomment` int(11) DEFAULT '0' COMMENT '是否允许评论',
  `contentcat_title` text COMMENT '标题',
  `watermark` text COMMENT '水印方案',
  `isshow` int(11) DEFAULT '0' COMMENT '是否显示',
  `viplevel` text COMMENT '会员查看等级',
  `contentcat_spell` text COMMENT '栏目拼音',
  `contentcat_abbreviation` text COMMENT '栏目缩写',
  `is_leaf` int(11) DEFAULT '0' COMMENT '是否是单页栏目',
  `index_template` varchar(50) DEFAULT NULL COMMENT '栏目首页模板',
  `iscatend` int(1) DEFAULT '1' COMMENT '根栏目',
  `list_message` int(13) DEFAULT '10' COMMENT '列表页每页信息数',
  `rss_template` varchar(255) DEFAULT NULL COMMENT 'rss 模板',
  `isSendMobile` int(11) DEFAULT '1' COMMENT '是否默认推送',
  `mobileChannel` varchar(255) DEFAULT NULL COMMENT '移动频道',
  `static_url` varchar(255) DEFAULT NULL COMMENT '静态地址',
  `dynamic_url` varchar(255) DEFAULT NULL COMMENT '动态地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of cms_content_cat
-- ----------------------------
INSERT INTO `cms_content_cat` VALUES ('27', '', '0,', '0,27', '视频', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'sp/', null, null, '/sp/index.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '1', '0', '1', null, '-1', null, '10', null, null, null, null, '0', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'shipin', 'sp', '0', 'pc/spcolumn_index.html', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('28', '', '0,', '0,28', '图片', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'tp/', null, null, '/tp/index.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '2', '0', '1', null, '-1', null, '10', null, null, null, null, '0', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'tupian', 'tp', '0', 'pc/column_index.html', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('30', '', '0,', '0,30', '新闻', 'news', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'news/', null, null, '/news/list.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '3', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'xinwen', 'xw', '0', '', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('31', '30', '0,30,', '0,30,31', '国内', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"true\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'news/sz/', null, 'news/sz/wap_list.shtml', '/news/sz/list.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '5', '0', '1', null, '-1', 'true', '10', null, null, null, null, '1', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'guonei', 'gn', '0', '', '1', '10', '', '1', '54', null, null);
INSERT INTO `cms_content_cat` VALUES ('32', '30', '0,30,', '0,30,32', '奇闻', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'news/jj/', null, 'news/jj/wap_list.shtml', '/news/jj/list.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '1', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'qiwen', 'qw', '0', '', '1', '10', '', '1', '45', null, null);
INSERT INTO `cms_content_cat` VALUES ('33', '27', '0,27,', '0,27,33', '环球趣闻', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'sp/dj/', null, 'sp/dj/wap_list.shtml', '/sp/dj/list.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '0', '0', '1', null, '-1', null, '10', null, null, null, null, '1', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'huanqiuquwen', 'hqqw', '0', '', '1', '10', '', '1', '27', null, null);
INSERT INTO `cms_content_cat` VALUES ('34', '27', '0,27,', '0,27,34', '娱乐八卦', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'sp/dp/', null, 'sp/dp/wap_list.shtml', '/sp/dp/list.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '0', '0', '1', null, '-1', null, '10', null, null, null, null, '1', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'yulebagua', 'ylbg', '0', '', '1', '10', '', '1', '297ebc2d4e2d69bd014e2ebf20680018', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881864e42154b014e42181bee0001', '', '0,', '0,402881864e42154b014e42181bee0001', '雷铭新闻', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'lmxw/', null, null, '/lmxw/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-06-30 09:32:33', null, null, null, '0', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'leimingxinwen', 'lmxw', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881864e42154b014e421acfbd0003', '54', '0,54,', '0,54,402881864e42154b014e421acfbd0003', '影视', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'yl/ys/', null, null, '/yl/ys/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-06-30 09:35:30', null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'yingshi', 'ys', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881864e42154b014e422144cc0005', '54', '0,54,', '0,54,402881864e42154b014e422144cc0005', '演出', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'yl/yc/', null, null, '/yl/yc/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-06-30 09:42:33', null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'yanchu', 'yc', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('4028818d518b5f0e01518b743c690007', '', '0,', '0,4028818d518b5f0e01518b743c690007', '公司概况', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'gsgk/', null, null, '/gsgk/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-10 18:33:49', null, null, null, '0', '297ebc2d4fa20242014fa566987b0002', 'companyinfo.html', null, '1', '1', null, null, '1', null, 'gongsigaikuang', 'gsgk', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('4028818d518b5f0e01518b74d4980009', '', '0,', '0,4028818d518b5f0e01518b74d4980009', '新闻中心', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'xwzx/', null, null, '/xwzx/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 09:58:17', null, null, null, '0', '297ebc2d4fa20242014fa566987b0002', 'newscenter.html', null, '1', '1', null, null, '1', null, 'xinwenzhongxin', 'xwzx', '0', '', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('4028818d518b5f0e01518b75758d000b', '', '0,', '0,4028818d518b5f0e01518b75758d000b', '产品展示', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/', null, null, '/cpzs/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 14:46:53', null, null, null, '0', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'chanpinzhanshi', 'cpzs', '0', '', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('4028818d518b5f0e01518b775e9b000d', '', '0,', '0,4028818d518b5f0e01518b775e9b000d', '服务支持', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'fwzc/', null, null, '/fwzc/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-10 18:37:14', null, null, null, '0', '297ebc2d4fa20242014fa566987b0002', 'support.html', null, '1', '1', null, null, '1', null, 'fuwuzhichi', 'fwzc', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('4028818d518b5f0e01518b78de1a000f', '', '0,', '0,4028818d518b5f0e01518b78de1a000f', '联系我们', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'lxwm/', null, null, '/lxwm/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-10 18:38:52', null, null, null, '0', '297ebc2d4fa20242014fa566987b0002', 'contact.html', null, '1', '1', null, null, '1', null, 'lianxiwomen', 'lxwm', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('4028818d518b5f0e01518b797cf60011', '', '0,', '0,4028818d518b5f0e01518b797cf60011', '招聘我们', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'zpwm/', null, null, '/zpwm/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-10 18:39:33', null, null, null, '0', '297ebc2d4fa20242014fa566987b0002', 'recruit.html', null, '1', '1', null, null, '1', null, 'zhaopinwomen', 'zpwm', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881914e097b8c014e0a114bf5000c', '28', '0,28,', '0,28,402881914e097b8c014e0a114bf5000c', '图览北京', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'tp/tlbj/', null, 'tp/tlbj/wap_list.shtml', '/tp/tlbj/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, null, '10', '2015-06-19 12:26:22', null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'tulanbeijing', 'tlbj', '0', '', '1', '10', '', '1', '24', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881914e0a8fed014e0ab02e9e012e', '54', '0,54,', '0,54,402881914e0a8fed014e0ab02e9e012e', '八卦', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"true\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'yl/bg/', null, 'yl/bg/wap_list.shtml', '/yl/bg/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-06-19 15:19:55', null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'bagua', 'bg', '0', '', '1', '10', '', '1', '39', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881914e0a8fed014e0ad3812b0130', '', '0,', '0,402881914e0a8fed014e0ad3812b0130', '分类信息', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'flxx/', null, null, '/flxx/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-06-19 15:58:30', null, null, null, '0', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'fenleixinxi', 'flxx', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('402881914f6d2c89014f6d6032d2003e', '', '0,', '0,402881914f6d2c89014f6d6032d2003e', '活动', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"true\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'hd/', null, null, '/hd/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-08-27 12:17:45', null, null, null, '0', '1', 'pc/activity_list.html', null, '1', '1', null, null, '1', null, 'huodong', 'hd', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ec29b4b000a', '4028818d518b5f0e01518b74d4980009', '0,4028818d518b5f0e01518b74d4980009,', '0,4028818d518b5f0e01518b74d4980009,40288193518ea69f01518ec29b4b000a,', '企业', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"detail_pictureGroup.html\",\"文章\":\"news_detail.html\",\"调查\":\"survey_detail.html\",\"视频\":\"detail_video.html\",\"链接\":\"detail.html\",\"活动\":\"detail.html\",\"投票\":\"detail_vote.html\"}', null, 'xwzx/qy/', null, null, '/xwzx/qy/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', '2015-12-11 09:58:17', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'newscenter.html', null, '0', '0', null, null, '1', null, 'qiye', 'qy', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ec29bae000b', '4028818d518b5f0e01518b74d4980009', '0,4028818d518b5f0e01518b74d4980009,', '0,4028818d518b5f0e01518b74d4980009,40288193518ea69f01518ec29bae000b,', '行业', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"detail_pictureGroup.html\",\"文章\":\"news_detail.html\",\"调查\":\"survey_detail.html\",\"视频\":\"detail_video.html\",\"链接\":\"detail.html\",\"活动\":\"detail.html\",\"投票\":\"detail_vote.html\"}', null, 'xwzx/xy/', null, null, '/xwzx/xy/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', '2015-12-11 09:58:17', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'newscenter.html', null, '0', '0', null, null, '1', null, 'xingye', 'xy', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ec29bf6000c', '4028818d518b5f0e01518b74d4980009', '0,4028818d518b5f0e01518b74d4980009,', '0,4028818d518b5f0e01518b74d4980009,40288193518ea69f01518ec29bf6000c,', '技术', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"detail_pictureGroup.html\",\"文章\":\"news_detail.html\",\"调查\":\"survey_detail.html\",\"视频\":\"detail_video.html\",\"链接\":\"detail.html\",\"活动\":\"detail.html\",\"投票\":\"detail_vote.html\"}', null, 'xwzx/js/', null, null, '/xwzx/js/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', '2015-12-11 09:58:17', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'newscenter.html', null, '0', '0', null, null, '1', null, 'jishu', 'js', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518fcad4040057', '4028818d518b5f0e01518b75758d000b', '0,4028818d518b5f0e01518b75758d000b,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057', '手机', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/sj/', null, null, '/cpzs/sj/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:32:14', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'shouji', 'sj', '0', '', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518fd3ba590064', '4028818d518b5f0e01518b75758d000b', '0,4028818d518b5f0e01518b75758d000b,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,', '电脑', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"detail_pictureGroup.html\",\"文章\":\"search_detail.html\",\"调查\":\"survey_detail.html\",\"视频\":\"detail_video.html\",\"链接\":\"detail.html\",\"活动\":\"detail.html\",\"投票\":\"detail_vote.html\"}', null, 'cpzs/dn/', null, null, '/cpzs/dn/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', '2015-12-11 15:36:42', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '0', '0', null, null, '1', null, 'diannao', 'dn', '0', '', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518fd3ba910065', '4028818d518b5f0e01518b75758d000b', '0,4028818d518b5f0e01518b75758d000b,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba910065,', '网络产品', null, '0', null, '{\"文章\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"活动\":\"false\",\"投票\":\"false\",\"访谈\":\"false\",\"调查\":\"false\",\"专题\":\"false\"}', '{\"文章\":\"detail.html\",\"组图\":\"detail_pictureGroup.html\",\"链接\":\"detail.html\",\"视频\":\"detail_video.html\",\"活动\":\"detail.html\",\"投票\":\"detail_vote.html\",\"访谈\":\"detail.html\",\"调查\":\"survey_detail.html\",\"专题\":\"detail.html\"}', null, 'cpzs/wlcp/', null, null, '/cpzs/wlcp/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', null, '10', '2015-12-11 15:35:10', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '0', '0', null, null, '1', null, 'wangluochanpin', 'wlcp', '0', null, '0', '10', null, '1', null, null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff4587a00c3', '40288193518ea69f01518fcad4040057', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057,40288193518ea69f01518ff4587a00c3', '苹果', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/sj/pg/', null, null, '/cpzs/sj/pg/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:32:14', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'pingguo', 'pg', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff5001e00c5', '40288193518ea69f01518fcad4040057', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057,40288193518ea69f01518ff5001e00c5', '三星', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/sj/sx/', null, null, '/cpzs/sj/sx/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:32:56', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'sanxing', 'sx', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff594da00c7', '40288193518ea69f01518fcad4040057', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fcad4040057,40288193518ea69f01518ff594da00c7', '小米', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/sj/xm/', null, null, '/cpzs/sj/xm/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:33:35', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'xiaomi', 'xm', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff70b1b00ca', '40288193518ea69f01518fd3ba910065', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba910065,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba910065,40288193518ea69f01518ff70b1b00ca', '路由器', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/wlcp/lyq/', null, null, '/cpzs/wlcp/lyq/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:35:10', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'luyouqi', 'lyq', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff7b12100cc', '40288193518ea69f01518fd3ba910065', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba910065,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba910065,40288193518ea69f01518ff7b12100cc', '网卡', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/wlcp/wk/', null, null, '/cpzs/wlcp/wk/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:35:53', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'wangka', 'wk', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff86f5d00ce', '40288193518ea69f01518fd3ba590064', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,40288193518ea69f01518ff86f5d00ce', '笔记本', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/dn/bjb/', null, null, '/cpzs/dn/bjb/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:36:42', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'bijiben', 'bjb', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff9117d00d0', '40288193518ea69f01518fd3ba590064', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,40288193518ea69f01518ff9117d00d0', '超极本', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/dn/cjb/', null, null, '/cpzs/dn/cjb/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:37:23', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'chaojiben', 'cjb', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('40288193518ea69f01518ff986e000d2', '40288193518ea69f01518fd3ba590064', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,', '0,4028818d518b5f0e01518b75758d000b,40288193518ea69f01518fd3ba590064,40288193518ea69f01518ff986e000d2', '平板电脑', '', '0', null, '{\"组图\":\"false\",\"文章\":\"true\",\"调查\":\"false\",\"视频\":\"false\",\"链接\":\"false\",\"活动\":\"false\",\"投票\":\"false\"}', '{\"组图\":\"pc/picture_detail.html\",\"文章\":\"search_detail.html\",\"调查\":\"pc/survey_detail.html\",\"视频\":\"pc/video_detail.html\",\"链接\":\"pc/link_detail.html\",\"活动\":\"pc/activity_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'cpzs/dn/pbdn/', null, null, '/cpzs/dn/pbdn/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-12-11 15:37:53', null, null, null, '1', '297ebc2d4fa20242014fa566987b0002', 'search.html', null, '1', '1', null, null, '1', null, 'pingbandiannao', 'pbdn', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('41', '28', '0,28,', '0,28,41', '精彩图集', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'tp/jx/', null, 'tp/jx/wap_list.shtml', '/tp/jx/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '4', '0', '1', null, null, null, '10', null, null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'jingcaituji', 'jctj', '0', '', '1', '10', '', '1', '297ebc2d4e2d69bd014e2ebcdd420013', null, null);
INSERT INTO `cms_content_cat` VALUES ('42', '28', '0,28,', '0,28,42', '图说天下', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'tp/ts/', null, 'tp/ts/wap_list.shtml', '/tp/ts/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, null, '10', null, null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'tushuotianxia', 'tstx', '0', '', '1', '10', '', '1', '56', null, null);
INSERT INTO `cms_content_cat` VALUES ('49', '', '0,', '0,49', '社会', '', '0', null, '{\"文章\":\"true\",\"调查\":\"true\",\"组图\":\"true\",\"链接\":\"true\",\"视频\":\"true\",\"投票\":\"true\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'sh/', null, 'sh/wap_list.shtml', '/sh/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', '2015-06-19 15:08:18', null, null, null, '0', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'shehui', 'sh', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('50', '', '0,', '0,50,', '房产', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"detail_vote.html\"}', null, 'fc/', null, 'fc/wap_list.shtml', '/fc/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '1', '0', null, null, '1', null, 'fangchan', 'fc', '0', '', '1', '10', '', '1', '38', null, null);
INSERT INTO `cms_content_cat` VALUES ('51', '', '0,', '0,51,', '汽车', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"detail_vote.html\"}', null, 'qc/', null, 'qc/wap_list.shtml', '/qc/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'qiche', 'qc', '0', '', '1', '10', '', '1', '37', null, null);
INSERT INTO `cms_content_cat` VALUES ('54', '', '0,', '0,54,', '娱乐', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'yl/', null, null, '/yl/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'yule', 'yl', '0', '', '0', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('55', '', '0,', '0,55,', '文化', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"detail_vote.html\"}', null, 'wh/', null, 'wh/wap_list.shtml', '/wh/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'wenhua', 'wh', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('59', '', '0,', '0,59,', '旅游', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"detail_vote.html\"}', null, 'ly/', null, 'ly/wap_list.shtml', '/ly/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'lu:you', 'ly', '0', '', '1', '10', '', '1', '297ebc2d4e2d69bd014e2ebfbdc5001a', null, null);
INSERT INTO `cms_content_cat` VALUES ('61', '', '0,', '0,61,', '美食', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"detail_vote.html\"}', null, 'ms/', null, 'ms/wap_list.shtml', '/ms/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'meishi', 'ms', '0', '', '1', '10', '', '1', '40', null, null);
INSERT INTO `cms_content_cat` VALUES ('64', '54', '0,54,', '0,54,64,', '明星', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'yl/mx/', null, 'yl/mx/wap_list.shtml', '/yl/mx/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '1', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'mingxing', 'mx', '0', '', '1', '10', '', '1', '36', null, null);
INSERT INTO `cms_content_cat` VALUES ('65', '54', '0,54,', '0,54,65,', '综艺', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'yl/zy/', null, 'yl/zy/wap_list.shtml', '/yl/zy/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '1', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'zongyi', 'zy', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('76', '', '0,', '0,76,', '投票', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"true\"}', '{\"文章\":\"\",\"调查\":\"\",\"组图\":\"\",\"链接\":\"\",\"视频\":\"\",\"投票\":\"pc/vote_detail.html\"}', null, 'cl/', null, 'cl/wap_list.shtml', '/cl/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '1', '0', '1', null, '-1', null, '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'toupiao', 'tp', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('78', '', '0,', '0,78,', '生活', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"true\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"detail_vote.html\"}', null, 'sh/', null, 'sh/wap_list.shtml', '/sh/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'shenghuo', 'sh', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('79', '', '0,', '0,79,', '调查', '', '0', null, '{\"文章\":\"false\",\"调查\":\"true\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"\",\"链接\":\"\",\"视频\":\"\",\"投票\":\"\"}', null, 'jy/', null, 'jy/wap_list.shtml', '/jy/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '2', '0', '1', null, '-1', null, '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'diaocha', 'dc', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('81', '', '0,', '0,81,', '新闻爆料', '', '0', null, '{\"文章\":\"true\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"false\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"\",\"视频\":\"\",\"投票\":\"\"}', null, 'xwbl/', null, 'xwbl/wap_list.shtml', '/xwbl/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, '-1', 'true', '10', null, null, null, null, '0', '1', 'pc/list.html', null, '0', '0', null, null, '1', null, 'xinwenbaoliao', 'xwbl', '0', '', '1', '10', '', '1', '', null, null);
INSERT INTO `cms_content_cat` VALUES ('86', '30', '0,30,', '0,30,86', '国际', '', '1', null, '{\"文章\":\"true\",\"调查\":\"true\",\"组图\":\"true\",\"链接\":\"true\",\"视频\":\"true\",\"投票\":\"true\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'news/gj/', null, 'news/gj/wap_list.shtml', '/news/gj/list.shtml', '1', null, null, null, '0', null, null, '0', '0', '0', '0', '0', '1', null, null, 'true', '10', null, null, null, null, '1', '1', 'pc/list.html', null, '1', '1', null, null, '1', null, 'guoji', 'gj', '0', '', '1', '10', '', '1', '52', null, null);
INSERT INTO `cms_content_cat` VALUES ('87', '27', '0,27,', '0,27,35', '精选视频', '', '0', null, '{\"文章\":\"false\",\"调查\":\"false\",\"组图\":\"false\",\"链接\":\"false\",\"视频\":\"true\",\"投票\":\"false\"}', '{\"文章\":\"pc/news_detail.html\",\"调查\":\"pc/survey_detail.html\",\"组图\":\"pc/picture_detail.html\",\"链接\":\"pc/link_detail.html\",\"视频\":\"pc/video_detail.html\",\"投票\":\"pc/vote_detail.html\"}', null, 'sp/dp/', null, 'sp/dp/wap_list.shtml', '/sp/dp/list.shtml', '1', null, '', null, '0', '', '', '0', '0', '0', '0', '0', '1', null, '-1', null, '10', null, null, null, null, '1', '1', 'pc/list.html', '', '1', '1', '', '', '1', null, 'pindaojingxuan', 'pdjx', '0', '', '1', '10', '', '1', '25', null, null);

-- ----------------------------
-- Table structure for cms_content_cat_priv
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_cat_priv`;
CREATE TABLE `cms_content_cat_priv` (
  `id` varchar(32) NOT NULL COMMENT '栏目权限ID',
  `catid` varchar(32) DEFAULT NULL COMMENT 'PC栏目ID',
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PC栏目权限表';

-- ----------------------------
-- Records of cms_content_cat_priv
-- ----------------------------
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41acc0001', '30', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41ad20002', '31', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41ad70003', '32', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41ade0004', '86', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41ae50005', '28', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41aeb0006', '402881914e097b8c014e0a114bf5000c', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41af00007', '41', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41af60008', '42', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41afc0009', '79', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b03000a', '27', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b0d000b', '33', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b13000c', '34', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b19000d', '87', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b20000e', '76', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b27000f', '402881914f6d2c89014f6d6032d2003e', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b330010', '402881864e42154b014e42181bee0001', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b3b0011', '402881914e0a8fed014e0ad3812b0130', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b450012', '49', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b4c0013', '50', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b530014', '51', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b5a0015', '54', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b610016', '402881864e42154b014e421acfbd0003', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b690017', '402881864e42154b014e422144cc0005', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b720018', '402881914e0a8fed014e0ab02e9e012e', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b790019', '64', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b80001a', '65', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b86001b', '55', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b8d001c', '59', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b95001d', '61', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41b9b001e', '78', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');
INSERT INTO `cms_content_cat_priv` VALUES ('402881a451d2be510151d2c41ba4001f', '81', '402881ea452582c101452583a5040042', '2015-12-24 14:54:06');

-- ----------------------------
-- Table structure for cms_content_extractor_rule
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_extractor_rule`;
CREATE TABLE `cms_content_extractor_rule` (
  `id` varchar(255) NOT NULL COMMENT '规则Id',
  `websiteName` varchar(255) DEFAULT NULL COMMENT '网址名称',
  `uriKeywordsFragment` varchar(255) DEFAULT NULL COMMENT '网页网址关键字片段',
  `nesBodyTag` varchar(255) DEFAULT NULL COMMENT '网页主题内容标签',
  `newsBodyClass` varchar(255) DEFAULT NULL COMMENT '网页主题内容标签Class属性',
  `newsBodyId` varchar(255) DEFAULT NULL COMMENT '网页主题内容标签Id属性',
  `beginTag` varchar(255) DEFAULT NULL COMMENT '开始标签',
  `endTag` varchar(255) DEFAULT NULL COMMENT '结束标签',
  `scheme` varchar(255) DEFAULT NULL COMMENT '抓取方案',
  `attrName` varchar(255) DEFAULT NULL COMMENT '自定义属性名',
  `attrValue` varchar(255) DEFAULT NULL COMMENT '自定义属性值',
  `version` int(11) DEFAULT '0' COMMENT '版本'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cms内容抓取规则';

-- ----------------------------
-- Records of cms_content_extractor_rule
-- ----------------------------
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44ef7ec08014ef8097cbb0003', '人民日报', 'http://paper.people.com.cn/rmrb,/html/,nw.', 'p', '', 'ozoom', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881f84ef8e005014ef8fd9f900009', '新浪-新闻类', 'sina.com.cn', 'div', '', 'artibody', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44efb8ba1014efb9893b70001', '新浪-博客类', 'sina.com.cn,blog', 'div', 'articalContent', '', '', '', '主体标签Class', null, null, '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44efbac19014efbc131bb0002', '新浪-新闻博客类', 'sina.com.cn,news,blog', 'div', '', 'artibody', '', '', '主体标签Id', null, null, '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44efbf993014efc0c6e420008', '搜狐-新闻类', 'sohu.com/', 'div', '', '', '', '', '自定义主体标签属性', 'itemprop', 'articleBody', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('297ebc2d4efc3162014efc3eba230005', '搜狐-长图新闻类', 'sohu.com,oyf', 'img', 'pic_new', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('297ebc2d4efcff0d014efd083bb10004', '腾讯-时政新闻类', 'news.qq.com/', 'div', '', '', '', '', '自定义主体标签属性', 'bosszone', 'content', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44efd0d5b014efd4541550002', '网易-新闻类', '.163.com/', 'div', '', 'endText', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efdeb12a40001', 'CCTV新闻网', 'cntv.cn', 'p', '', '', '<!--repaste.body.begin-->', '<!--repaste.body.end-->', '网页注释抓取', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efdf0fb100003', '新华新闻网', 'xinhuanet.com', 'div', 'article', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe2606f0000c', '新华新闻网-首页正文', 'xinhuanet.com,ztjn', 'div', 'content', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe2a68e9000e', '新华新闻网-文化山东正文', 'xinhuanet.com,whsd', 'div', 'content', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe3178b80010', '凤凰资讯', 'http://news.ifeng.com/', 'div', '', 'artical_real', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe3673cf0012', '凤凰资讯-历史', 'http://news.ifeng.com/,history,', 'div', 'box_l', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe3a4e8c0014', '凤凰资讯-历史-中国近代史-正文', 'http://news.ifeng.com/,history,zhongguojindaishi,detail', 'div', '', 'main_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe4485200016', '中国新闻网', 'http://www.chinanews.com/', 'div', 'content', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe4cab2d001b', 'MSN中文网', 'http://msn.people.com.cn/', 'div', '', 'p_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe5265ac001d', 'MSN文娱', 'http://ent.msn.com.cn/', 'div', 'endText', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe57510f0021', 'MSN时尚', 'http://fashion.msn.com.cn/', 'div', 'articleContert', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe5b35b10023', 'MSN理财', 'http://money.msn.com.cn/', 'div', 'endText', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe79632c0026', 'MSN健康', 'http://health.msn.com.cn/', 'div', 'endText', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe8a00770028', '新浪博客', 'http://blog.sina.com.cn/,s,blog', 'div', '', 'articlebody', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe935804002a', '博客园', 'http://www.cnblogs.com/', 'div', '', 'post_detail', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe95baa4002c', '博客园分类', 'http://www.cnblogs.com,category/', 'div', 'entrylist', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efe9c066c002e', '网易博客', 'blog.163.com,blog', 'div', '', '', '<div class=\"nbw-blog-start\"></div>', '<div class=\"nbw-blog-end\"></div>', '网页注释抓取', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efea14dcc0030', '凤凰博报', 'http://blog.ifeng.com/,article', 'div', '', 'blog_article_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efea420350032', 'CSDN博客', 'http://blog.csdn.net/,article/details/', 'div', '', 'article_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efead5e330038', '天涯博客', 'http://blog.tianya.cn/', 'div', 'articletext', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881ec4efdcdab014efeb025ea003a', '天涯论坛', 'http://bbs.tianya.cn/', 'div', 'bbs-content', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00db3ffe0006', '人民网', 'people.com.cn', 'div', 'text_show', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00de4ac60008', '人民网-财经新闻类', 'http://finance.people.com.cn/,finance.', 'div', '', 'p_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00e4dc21000b', '人大新闻网', 'http://npc.people.com.cn/,npc.', 'div', '', 'p_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00ea731d0010', '中国政协新闻网', 'http://cppcc.people.com.cn/,cppcc', 'font', 'show_c', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00ec70920012', '中国工会新闻网', 'http://acftu.people.com.cn/,acftu', 'font', 'show_c', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00f022950015', '中国妇联新闻网', 'http://acwf.people.com.cn/,acwf', 'font', 'show_c', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00f57cf20017', '中国科协新闻网', 'http://scitech.people.com.cn/,scitech', 'div', '', 'p_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f00f78b590019', '人民网-知识产权', 'http://ip.people.com.cn/,ip.', 'div', '', 'p_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01027eb5001b', '中国人才网', 'http://rencai.people.com.cn/,rencai', 'div', 'show_text', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01057f22001d', '中央文献网', 'http://www.wxyjs.org.cn/', 'div', 'TRS_PreAppend', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f0117d1d8001f', '联合早报', 'http://www.zaobao.com/', 'div', '', 'article_content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f011d00f00021', '中国政府网', 'http://www,gov.cn/', 'td', '', 'Zoom', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01235b690024', '中国军网', 'http://www.81.cn/', 'div', '', 'article-content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f016ed0800028', '大众网', 'http://news.takungpao.com/', 'div', 'tpk_text', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f017262cb002a', '环球新闻网', '.huanqiu.com/', 'div', '', 'text', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f0178f613002c', '参考消息', 'cankaoxiaoxi.com/', 'div', '', 'ctrlfscont', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f017d53b5002e', '南方网', 'southcn.com', 'div', '', 'content', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01859cc40031', '新华网', 'china.com/', 'div', '', 'chan_newsDetail', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f018924c20033', '星岛环球网', '.stnn.cc/', 'div', 'article-content', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f018c80600035', '央广网', 'cnr.cn/', 'div', 'TRS_Editor', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f0190a7040038', '中国青年网-评论', 'http://pinglun.youth.cn/,pinglu.', 'div', 'TRS_Editor', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f019270d8003a', '中国青年网-娱乐新闻', 'http://fun.youth.cn/,fun.', 'div', 'article-content', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01972c56003f', '中国青年网-新闻频道', 'http://news.youth.cn/', 'div', '', 'articleText', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01999f900041', '国际在线', 'http://gb.cri.cn/', 'div', '', 'ccontent', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f019c6e130043', '宣讲家', 'http://www.71.cn/', 'div', '', '', '<!-- @end文章相关信息 -->', '<!-- @end 文章内容 -->', '网页注释抓取', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01aa1a290048', '南方周末', 'http://www.infzm.com/content/', 'div', '', 'articleContent', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01ad7355004a', '法制日报', 'http://www.legaldaily.com.cn/', 'div', '', 'ShowContent', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01b1ff6c004c', '中国青年报-新闻类', 'http://news.cyol.com/content/', 'div', 'zhengwen', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01b4171a004e', '青年报-在线阅读类', 'http://zqb.cyol.com/html/', 'div', '', 'ozoom', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01b630f80050', '半月谈', 'http://www.banyuetan.org/chcontent/', 'div', '', 'showneirong', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01bb0c630052', '香港文汇报', '.wenweipo.com/', 'p', 'ct_p', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01beca260054', '中国共产党网', '.12371.cn/,.shtml', 'p', '', '', '<!--repaste.body.begin-->', '<!--repaste.body.end-->', '网页注释抓取', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01c208840058', '光明网', '.gmw.cn/', 'div', '', 'contentMain', '', '', '主体标签Id', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('402881a44f00b451014f01c850a3005a', '华商网', 'http://hsb.hsw.cn/system/', 'div', 'contentBox', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('297ebc2d4f03790e014f038510860002', '中共青年网-国内新闻正文', 'http://news.youth.cn/,gn', 'div', 'article', '', '', '', '主体标签Class', '', '', '0');
INSERT INTO `cms_content_extractor_rule` VALUES ('297ebc2d4f0735e7014f07fefdc8000b', 'IT之家', '.ithome.com', 'div', 'post_content', '', '', '', '主体标签Class', '', '', '0');

-- ----------------------------
-- Table structure for cms_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_tag`;
CREATE TABLE `cms_content_tag` (
  `id` varchar(32) NOT NULL,
  `tag_name` varchar(50) DEFAULT NULL COMMENT 'tag名称',
  `ref_counter` int(11) DEFAULT '1' COMMENT '被引用的次数',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `enname` varchar(32) DEFAULT NULL COMMENT '英文名称',
  `cnname` varchar(32) DEFAULT NULL COMMENT '中文全拼',
  `simplename` varchar(32) DEFAULT NULL COMMENT '中文简拼',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';

-- ----------------------------
-- Records of cms_content_tag
-- ----------------------------

-- ----------------------------
-- Table structure for cms_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_custom`;
CREATE TABLE `cms_custom` (
  `ID` varchar(32) NOT NULL,
  `sustomlevel` bigint(20) NOT NULL,
  `customname` varchar(50) NOT NULL,
  `sustomsort` varchar(3) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `sustomparentid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_custom
-- ----------------------------

-- ----------------------------
-- Table structure for cms_demo
-- ----------------------------
DROP TABLE IF EXISTS `cms_demo`;
CREATE TABLE `cms_demo` (
  `ID` varchar(32) NOT NULL,
  `democode` longtext,
  `demoorder` smallint(6) DEFAULT NULL,
  `demotitle` varchar(200) DEFAULT NULL,
  `demourl` varchar(200) DEFAULT NULL,
  `demopid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fni8e3v88wcf2sahhlv57u4nm` (`demopid`) USING BTREE,
  CONSTRAINT `cms_demo_ibfk_1` FOREIGN KEY (`demopid`) REFERENCES `cms_demo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`demopid`) REFER `lm_maven_cms/cms_demo`(`ID`)';

-- ----------------------------
-- Records of cms_demo
-- ----------------------------

-- ----------------------------
-- Table structure for cms_depart
-- ----------------------------
DROP TABLE IF EXISTS `cms_depart`;
CREATE TABLE `cms_depart` (
  `ID` varchar(32) NOT NULL,
  `departname` varchar(100) NOT NULL,
  `description` longtext,
  `parentdepartid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `FK_knnm3wb0bembwvm0il7tf6686` (`parentdepartid`) USING BTREE,
  CONSTRAINT `cms_depart_ibfk_1` FOREIGN KEY (`parentdepartid`) REFERENCES `cms_depart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`parentdepartid`) REFER `lm_maven_cms/cms_depart`(`ID`)';

-- ----------------------------
-- Records of cms_depart
-- ----------------------------
INSERT INTO `cms_depart` VALUES ('402881ea452582c101452583a44b0015', '信息部', '12', null, null);

-- ----------------------------
-- Table structure for cms_diymen_class
-- ----------------------------
DROP TABLE IF EXISTS `cms_diymen_class`;
CREATE TABLE `cms_diymen_class` (
  `id` varchar(32) NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `pid` varchar(32) NOT NULL COMMENT '父ID',
  `title` varchar(30) NOT NULL COMMENT '主菜单名称',
  `keyword` varchar(30) DEFAULT NULL COMMENT '关联关键字',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示（0,1）1:显示 0:不显示',
  `sort` tinyint(3) NOT NULL COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '外链URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DIY菜单';

-- ----------------------------
-- Records of cms_diymen_class
-- ----------------------------

-- ----------------------------
-- Table structure for cms_doc
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc`;
CREATE TABLE `cms_doc` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `tag_demo` varchar(1000) DEFAULT NULL COMMENT '标签试一试demo',
  `typeid` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `api_address` varchar(255) DEFAULT NULL COMMENT 'api地址',
  `return_example_value` text COMMENT '返回示例',
  `pid` varchar(32) DEFAULT NULL COMMENT '父文档id',
  `sort` int(13) DEFAULT NULL COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  `platform` varchar(255) DEFAULT NULL COMMENT '文档所属平台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档';

-- ----------------------------
-- Records of cms_doc
-- ----------------------------
INSERT INTO `cms_doc` VALUES ('10', '获取内容评论总数', 'getCommentSize', '', '2', '/front/commentaryTagAct.do?getCommentSize&contentId=1', '1', '12', '0', '内容详细页中异步查询当前内容评论总数', '1', '2014-06-19 10:02:25', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('11', '广告', 'advTag', '<#assign name =\"advTag\">\r\n<#assign advTag =newTag(\"${name}\")>\r\n<#assign advList= advTag (\"{\'name\':\'1\',\'count\':\'10\'}\")>\r\n<#list advList as adv>\r\n       ${adv.adName}<br/>\r\n</#list>\r\n', '3', '', null, '0', '0', '根据广告位获取广告列表', '1', '2014-06-20 10:38:03', 'liuzhen', '0', '2014-06-20 16:18:03', 'liuzhen', 'cms');
INSERT INTO `cms_doc` VALUES ('12', '开放', '', '', '2', '', '', '0', '0', '移动CMS客户端接口', '1', '2014-07-09 09:59:14', 'zhangxq', '0', '2015-08-05 15:22:30', 'admin', 'mobile');
INSERT INTO `cms_doc` VALUES ('13', '频道列表', 'loadMobileChannel', '', '2', '/front/mobileChannelApi/loadMobileChannelList.do?mobileChannelId=18&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"id\": \"18\",\r\n    \"title\": \"新闻 频道栏名称\",\r\n    \"type\": \"news\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"18-1\",\r\n            \"title\": \"头条\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"topUrl\": \"/front/slideMobileApi.do?loadSlideList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"18-2\",\r\n            \"title\": \"热点\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"topUrl\": \"/front/slideMobileApi.do?loadSlideList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"18-3\",\r\n            \"title\": \"时事\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"topUrl\": \"可以为空\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"频道id\",\r\n            \"title\": \"频道名\",\r\n            \"listUrl\": \"频道列表地址\",\r\n            \"topUrl\": \"频道头图列表地址\",\r\n            \"type\": \"频道类型，可以为空\"\r\n        }\r\n    ]\r\n    \r\n}', '12', '0', '移动客户端移动内容中的频道', '1', '2014-07-09 10:08:33', 'zhangxq', '0', '2014-08-15 16:29:20', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('14', '新闻列表', 'loadContent', '', '2', '/front/contentMobileApi/loadContentList.do?mobileChannelId=21&pageSize=20&pageNo=1&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"id\": \"18-1 频道id\",\r\n    \"title\": \"头条 频道名称\",\r\n    \"type\": \"news 频道类型\",\r\n    \"pageSize\": \"每页条数\",\r\n    \"pageCount\": \"页数\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"title\": \"北京今日持续高温。\",\r\n            \"content\": \"北京今日持续高温,预计最近几天持续升温，气象部门提醒广大市民出行注意防暑。。。。\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\",\r\n            \"contentMark\": \"独家\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"title\": \"习近平出访\",\r\n            \"content\": \"习近平与23日下午出访美国，美国国务卿接待一行。。。\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"topUrl\": \"/front/slideMobileApi.do?loadSlideList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP\",\r\n            \"type\": \"news\",\r\n            \"contentMark\": \"热点\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP|/front/PIC2.JSP|/front/PIC3.JSP\",\r\n            \"type\": \"news\",\r\n            \"contentMark\": \"热点\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"title\": \"图片频道北京房价宏观调控\",\r\n            \"content\": \"图片频道北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP|/front/PIC2.JSP|/front/PIC3.JSP\",\r\n            \"type\": \"pic\",\r\n            \"contentMark\": \"独家\"\r\n        },\r\n        {\r\n            \"id\": \"新闻id\",\r\n            \"title\": \"新闻短标题\",\r\n            \"content\": \"新闻摘要\",\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"topUrl\": \"幻灯片缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式\",\r\n            \"listImage\": \"列表缩略图地址：地址\",\r\n            \"type\": \"新闻类型：news|pic|video\",\r\n            \"invitationCount\": \"评论数\",\r\n            \"pubDate\": \"发布时间\",\r\n            \"source\": \"来源\",\r\n            \"contentMark\": \"内容标记： |独家|热点\",\r\n            \"contentType\": \"内容分类/类型(1文章2组图3链接4视频6投票8调查)\"\r\n        }\r\n    ]\r\n}', '12', '0', '移动客户端新闻列表', '1', '2014-07-09 11:32:01', 'zhangxq', '0', '2015-01-21 16:37:57', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('20', '幻灯片列表', 'loadSlideList', '', '2', '/front/slideMobileApi/loadSlideList.do?mobileChannelId=21&pageSize=20&pageNo=1&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"id\": \"18-1 频道id\",\r\n    \"title\": \"头条 频道名称\",\r\n    \"type\": \"news 频道类型\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"title\": \"北京今日持续高温。\",\r\n            \"content\": \"北京今日持续高温,预计最近几天持续升温，气象部门提醒广大市民出行注意防暑。。。。\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"title\": \"习近平出访\",\r\n            \"content\": \"习近平与23日下午出访美国，美国国务卿接待一行。。。\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"topUrl\": \"/front/slideMobileApi.do?loadSlideList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP|/front/PIC2.JSP|/front/PIC3.JSP\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"title\": \"图片频道北京房价宏观调控\",\r\n            \"content\": \"图片频道北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP|/front/PIC2.JSP|/front/PIC3.JSP\",\r\n            \"type\": \"pic\"\r\n        },\r\n        {\r\n            \"id\": \"新闻id\",\r\n            \"title\": \"新闻短标题\",\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"topUrl\": \"缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式\",\r\n            \"type\": \"新闻类型：news|pic|video\"\r\n        }\r\n    ]\r\n}', '12', '0', '移动客户端新闻列表头部幻灯片列表', '1', '2014-07-17 10:59:08', 'zhangxq', '0', '2014-08-04 10:13:24', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('21', '评论列表', 'loadCommentList', '', '2', '/front/commentMobileApi/loadCommentList.do?contentsMobileId=9&userId=&pageSize=20&pageNo=1&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"id\": \"18-1 内容id\",\r\n    \"type\": \"news 内容类型\",\r\n    \"pageSize\": \"每页条数\",\r\n    \"pageCount\": \"页数\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"title\": \"北京今日持续高温。\",\r\n            \"content\": \"北京持续高温中，详情。。。\",\r\n            \"listUrl\": \"/front/PIC1.JSP\",\r\n            \"pubDate\": \"2014-07-1710: 30: 00\",\r\n            \"type\": \"1\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"title\": \"习近平出访\",\r\n            \"content\": \"习近平与23日下午出访美国，美国国务卿接待一行。。。\",\r\n            \"listUrl\": \"/front/PIC2.JSP\",\r\n            \"pubDate\": \"2014-07-1710: 30: 00\",\r\n            \"type\": \"0\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控\",\r\n            \"pubDate\": \"2014-07-1710: 30: 00\",\r\n            \"listUrl\": \"/front/PIC3.JSP\",\r\n            \"type\": \"0\"\r\n        }，\r\n        {\r\n            \"id\": \"评论id\",\r\n            \"title\": \"评论标题\",\r\n            \"content\": \"内容摘要\"，\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"pubDate\": \"评论时间\",\r\n            \"type\": \"评论类型：0-所有|1-我的|2-精彩\"\r\n        }\r\n    ]\r\n}', '12', '0', '移动客户端评论列表', '0', '2014-07-17 11:41:16', 'zhangxq', '0', '2014-12-26 16:14:26', 'admin', 'mobile');
INSERT INTO `cms_doc` VALUES ('22', '登陆', 'login', '', '2', '/front/loginMobileApi/login.do?username=&password=&loginType=', '{\r\n    \"resultMsg\": \"登陆成功\",\r\n    \"resultCode\": \"1\",\r\n    \"userId\": \"用户id\",\r\n    \"faceImg\": \"头像image\",\r\n    \"userName\": \"12332112\"\r\n}', '12', '0', '移动用户登录', '1', '2014-07-17 12:02:08', 'zhangxq', '0', '2014-08-04 09:56:51', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('23', '评论提交', 'saveComment', '', '2', '/front/myCommentMobileApi/saveComment.do?contentsMobileId=9&content=&userId=&title=&all=', '{\r\n    \"resultMsg\": \"评论成功\",\r\n    \"resultCode\": \"1\",\r\n    \"listUrl\": \"/front/commentMobileApi/loadCommentList.do?mobileChannelId=&userId=&pageSize=&pageNo=&all=y | 评论列表\"\r\n}', '12', '0', '移动客户端跟帖提交', '0', '2014-07-17 13:17:55', 'zhangxq', '0', '2014-12-26 16:14:10', 'admin', 'mobile');
INSERT INTO `cms_doc` VALUES ('24', '编辑', 'updateEdit', '', '2', '/front/editMobileApi/updateEdit.do?portrait=&password=&userId=&userName=&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"userId\": \"1\",\r\n    \"userName\": \"mac\",\r\n    \"faceImg\": \"/upload/xxx.png\"\r\n}', '12', '0', '移动客户端编辑用户头像', '1', '2014-07-17 14:39:48', 'zhangxq', '0', '2014-08-04 20:25:20', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('25', '反馈', 'loadFeedBack', '', '2', '/front/feedBackMobileApi/loadFeedBack.do?content=&userId=&email=&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\"\r\n}', '12', '0', '移动客户端反馈意见', '1', '2014-07-17 15:01:49', 'zhangxq', '0', '2014-08-04 20:26:12', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('26', '注册', 'register', '', '2', '/front/registerMobileApi/register.do?username=&password=&email=', '{\r\n    \"resultMsg\": \"注册成功\",\r\n    \"resultCode\": \"1\",\r\n    \"userId\": \"用户id\",\r\n    \"userName\": \"12332112\",\r\n    \"faceImg\": \"头像image\",\r\n}', '12', '0', '手机客户端用户注册', '1', '2014-07-17 15:21:09', 'zhangxq', '0', '2014-08-04 10:15:48', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('27', '新闻详细页', 'newsDetail.html', '', '2', 'newsDetail.html?size=14', '', '12', '0', '移动客户端新闻详细页', '1', '2014-07-17 15:45:17', 'zhangxq', '0', '2014-08-04 16:47:56', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('28', '跟帖提交', 'saveInvitation', '', '2', '/front/myInvitationMobileApi/saveInvitation.do?contentsMobileId=&content=&userId=&all=', '{\r\n    \"resultMsg\": \"发帖成功\",\r\n    \"resultCode\": \"1\",\r\n    \"listUrl\": \"/front/commentMobileApi.do?loadCommentList&mobileChannelId=&pageSize=&pageNo=&all=y | 跟帖列表\"\r\n}', '12', '0', '移动客户端跟帖提交', '1', '2014-07-17 18:39:47', 'zhangxq', '0', '2014-08-04 20:28:16', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('29', '跟帖列表(单条内容和用户)', 'loadInvitationList', '', '2', '/front/invitationMobileApi/loadInvitationList.do?contentsMobileId=9&pageSize=20&pageNo=1&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"id\": \"18-1 内容id\",\r\n    \"type\": \"news 内容类型\",\r\n    \"pageSize\": \"每页条数\",\r\n    \"pageCount\": \"页数\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"content\": \"北京持续高温中，详情。。。\",\r\n            \"listUrl\": \"/front/PIC1.JSP\",\r\n            \"pubDate\": \"2014-07-1710: 30: 00\",\r\n            \"pictureAll\": \"/upload/faceImg\",\r\n            \"type\": \"1\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"content\": \"习近平与23日下午出访美国，美国国务卿接待一行。。。\",\r\n            \"listUrl\": \"/front/PIC2.JSP\",\r\n            \"pubDate\": \"2014-07-1710: 30: 00\",\r\n            \"pictureAll\": \"/upload/faceImg\",\r\n            \"type\": \"0\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控\",\r\n            \"pubDate\": \"2014-07-1710: 30: 00\",\r\n            \"listUrl\": \"/front/PIC3.JSP\",\r\n            \"pictureAll\": \"/upload/faceImg\",\r\n            \"type\": \"0\"\r\n        },\r\n        {\r\n            \"id\": \"跟帖id\",\r\n            \"content\": \"跟帖内容\",\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"pubDate\": \"跟帖时间\",\r\n            \"pictureAll\": \"跟帖人头像\",\r\n            \"type\": \"跟帖类型：0-所有|1-我的|2-精彩\"\r\n        }\r\n    ]\r\n}', '12', '0', '移动客户端跟帖列表', '1', '2014-07-17 18:41:07', 'zhangxq', '0', '2014-12-26 16:31:38', 'admin', 'mobile');
INSERT INTO `cms_doc` VALUES ('30', '搜索', 'loadSearchContentList', '', '2', '/front/searchMobileApi/loadSearchContentList.do?key=&pageSize=20&pageNo=1&all=', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"id\": \"18-1 频道id\",\r\n    \"title\": \"头条 频道名称\",\r\n    \"type\": \"news 频道类型\",\r\n    \"pageSize\": \"每页条数\",\r\n    \"pageCount\": \"页数\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"title\": \"北京今日持续高温。\",\r\n            \"content\": \"北京今日持续高温,预计最近几天持续升温，气象部门提醒广大市民出行注意防暑。。。。\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"2\",\r\n            \"title\": \"习近平出访\",\r\n            \"content\": \"习近平与23日下午出访美国，美国国务卿接待一行。。。\",\r\n            \"listUrl\": \"/front/contentMobileApi.do?loadContentList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"topUrl\": \"/front/slideMobileApi.do?loadSlideList&mobileChannelId=&pageSize=&pageNo=&all=y\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"3\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"title\": \"北京房价宏观调控\",\r\n            \"content\": \"北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP|/front/PIC2.JSP|/front/PIC3.JSP\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"4\",\r\n            \"title\": \"图片频道北京房价宏观调控\",\r\n            \"content\": \"图片频道北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，北京房价宏观调控，\",\r\n            \"listUrl\": \"/front/PIC1.JSP|/front/PIC2.JSP|/front/PIC3.JSP\",\r\n            \"type\": \"pic\"\r\n        },\r\n        {\r\n            \"id\": \"新闻id\",\r\n            \"title\": \"新闻短标题\",\r\n            \"content\": \"新闻摘要\",\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"topUrl\": \"缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式\",\r\n            \"type\": \"新闻类型：news|pic|video\",\r\n            \"comentNum\": \"评论数\",\r\n            \"pubDate\": \"发布时间\",\r\n            \"source\": \"来源\"\r\n        }\r\n    ]\r\n}', '12', '0', '移动客户端搜索内容（列表）', '1', '2014-07-17 18:45:31', 'zhangxq', '0', '2014-08-04 10:13:42', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('31', '消息通知', 'sendMessage', '', '2', '/front/mobileMessageApi/sendMessage.do?contentsMobileId=10', '{\r\n    \"content\": \"通知内容    \",\r\n    \"listUrl\": \"详细页\",\r\n    \"pubDate\": \"推送时间\"\r\n}', '12', '0', '移动消息推送通知', '1', '2014-08-04 16:51:30', 'zhangxq', '0', '2014-08-15 14:24:06', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('32', '消息通知列表', 'messageList', '', '2', '/front/mobileMessageApi/messageList.do', '{\r\n    \"resultMsg\": \"成功\",\r\n    \"resultCode\": \"1\",\r\n    \"pageSize\": \"每页条数\",\r\n    \"pageCount\": \"页数\",\r\n    \"items\": [\r\n        {\r\n            \"content\": \"通知内容1    \",\r\n            \"listUrl\": \"详细页1\",\r\n            \"pubDate\": \"推送时间1\"\r\n        },\r\n        {\r\n            \"content\": \"通知内容2    \",\r\n            \"listUrl\": \"详细页2\",\r\n            \"pubDate\": \"推送时间2\"\r\n        },\r\n        {\r\n            \"content\": \"通知内容3    \",\r\n            \"listUrl\": \"详细页3\",\r\n            \"pubDate\": \"推送时间3\"\r\n        }\r\n    ]\r\n}', '12', '0', '移动推送通知消息列表', '1', '2014-08-15 14:19:51', 'zhangxq', '0', '2014-08-15 16:14:43', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('33', '跟帖列表(所有)', 'getInvitationList', '', '2', '/front/invitationMobileApi/getInvitationList.do?pageSize=20&pageNo=1', '{\r\n    \"pageCount\": \"1\",\r\n    \"pageSize\": \"20\",\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"成功\",\r\n    \"items\": [\r\n        {\r\n            \"commentCount\": \"1\",\r\n            \"content\": \"asdadasdasdsa\",\r\n            \"id\": \"12\",\r\n            \"listUrl\": \"wwwroot/www/newsDeatil.htm?size=14\",\r\n            \"pubDate\": \"2014-08-03 17:41:33\",\r\n            \"source\": \"\",\r\n            \"title\": \"三张图片\",\r\n            \"topUrl\": \"http://localhost/upload/image/20140803/1407058152457051327.jpg,http://localhost/upload/image/20140803/1407058152457051327.jpg,http://localhost/upload/image/20140803/1407058152457051327.jpg\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"commentCount\": \"0\",\r\n            \"content\": \"<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->\",\r\n            \"id\": \"10\",\r\n            \"listUrl\": \"wwwroot/www/newsDeatil.htm?size=14\",\r\n            \"pubDate\": \"2014-07-21 15:19:22\",\r\n            \"source\": \"收\",\r\n            \"title\": \"一张图片新闻\",\r\n            \"topUrl\": \"http://localhost/upload/image/20140803/1407058152457051327.jpg\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"commentCount\": \"0\",\r\n            \"content\": \"测试啦    \",\r\n            \"id\": \"9\",\r\n            \"listUrl\": \"wwwroot/www/newsDeatil.htm?size=14\",\r\n            \"pubDate\": \"2014-07-16 13:56:22\",\r\n            \"source\": \"收到\",\r\n            \"title\": \"新发布文章2\",\r\n            \"topUrl\": \"http://localhost/upload/image/20140803/1407058152457051327.jpg,http://localhost/upload/image/20140803/1407058152457051327.jpg\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"commentCount\": \"0\",\r\n            \"content\": \"我饿得问问\",\r\n            \"id\": \"11\",\r\n            \"listUrl\": \"wwwroot/www/newsDeatil.htm?size=14\",\r\n            \"source\": \"\",\r\n            \"title\": \"527测试组图\",\r\n            \"topUrl\": \"\",\r\n            \"type\": \"pic\"\r\n        },\r\n        {\r\n            \"commentCount\": \"0\",\r\n            \"content\": \"\",\r\n            \"id\": \"13\",\r\n            \"listUrl\": \"wwwroot/www/newsDeatil.htm?size=14\",\r\n            \"source\": \"本\",\r\n            \"title\": \"bug236\",\r\n            \"topUrl\": \"\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"新闻id\",\r\n            \"title\": \"新闻短标题\",\r\n            \"content\": \"新闻摘要\",\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"topUrl\": \"缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式\",\r\n            \"type\": \"新闻类型：news|pic|video\",\r\n            \"commentCount\": \"评论数\",\r\n            \"pubDate\": \"发布时间\",\r\n            \"source\": \"来源\"\r\n        }\r\n    ]\r\n}', '12', '0', '所有内容跟帖列表', '1', '2014-08-15 16:17:21', 'zhangxq', '0', '2014-08-15 16:28:49', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('34', '内容标签', 'articleTag', '<#assign name =\"articleTag\">\r\n<#assign articleTag =newTag(\"${name}\")>\r\n<#assign articleList=articleTag(\"{\'name\':\'国内新闻\',\'page\':true,\'pagesize\':\'15\',\'pageindex\':\'2\',\'level\':\'all\'}\")>\r\n', '3', '', null, '0', '0', '内容标签', '1', '2014-08-21 09:48:01', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('35', '栏目标签', 'catalogTag', '<#assign name =\"catalogTag\">\r\n<#assign catalogTag=newTag(\"${name}\")>\r\n<#assign catalogList=catalogTag(\"{\'level\':\'root\', \'count\':\'10\'}\")>\r\n', '3', '', null, '0', '0', '栏目标签', '1', '2014-08-21 12:10:33', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('36', '友情链接标签', 'friendLinkTag', '<#assign name =\"friendLinkTag\">\r\n<#assign friendLinkTag =newTag(\"${name}\")>\r\n<#assign friendLinkList= friendLinkTag (\"{\'name\':\'大冬瓜\',\'count\':\'10\'}\")>\r\n', '3', '', null, '0', '0', '友情链接标签', '1', '2014-08-21 14:22:44', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('37', '区块数据标签', 'sectionDataTag', '<#assign name =\"sectionDataTag\">\r\n<#assign sectionDataTag=newTag(\"${name}\")>\r\n<#assign sectionDataList= sectionDataTag(\"{\'name\':\'大冬瓜\',\'count\':\'10\'}\")>\r\n', '3', '', null, '0', '0', '区块数据标签', '1', '2014-08-21 14:33:36', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('38', '组图数据标签', 'pictureDataTag', '<#assign name =\"pictureDataTag\">\r\n<#assign pictureDataTag =newTag(\"${name}\")>\r\n<#assign pictureDataList= pictureDataTag (\"{\'pgid\':\'1\'}\")>\r\n', '3', '', null, '0', '0', '组图数据标签', '1', '2014-08-21 14:38:37', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('39', '组图标签', 'pictureGroupTag', '<#assign name =\"pictureGroupTag\">\r\n<#assign pictureGroupTag =newTag(\"${name}\")>\r\n<#assign map= pictureGroupTag (\"{\'contentid\':\'1\'}\")>\r\n', '3', '', null, '0', '0', '组图标签', '1', '2014-08-21 14:53:55', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('40', '投票选项标签', 'voteOptionTag', '<#assign name =\"voteOptionTag\">\r\n<#assign voteOptionTag =newTag(\"${name}\")>\r\n<#assign voteOptionList= voteOptionTag (\"{\'voteid\':\'1\'}\")>\r\n', '3', '', null, '0', '0', '投票选项标签', '1', '2014-08-22 17:32:35', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('41', '投票标签', 'voteTag', '<#assign name =\"voteTag\">\r\n<#assign voteTag =newTag(\"${name}\")>\r\n<#assign map= voteTag (\"{\'contentid\':\'1\'}\")>\r\n', '3', '', null, '0', '0', '投票标签', '1', '2014-08-22 17:45:57', 'liuzhen', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('44', '获取启动广告列表', 'getListStartingByPage.do', '', '2', '/front/mobileAdvertisemenApi/getListStartingByPage.do?pageNo=1&pageSize=2', '{\r\n    \"pageCount\": 4,\r\n    \"pageSize\": 2,\r\n    \"list\": [\r\n        {\r\n            \"id\": 10,\r\n            \"imgUrl\": \"http://localhost:9090/upload/image/20140821/1408592672429004687.jpg\",\r\n        },\r\n        {\r\n            \"id\": 9,\r\n            \"imgUrl\": \"http://upload.cmstop.cn/2014/0730/1406727580158.png\",\r\n        }\r\n    ]\r\n}', '12', '0', '获取启动广告列表', '1', '2014-09-03 15:01:10', 'zhangyl', '0', '2014-09-03 18:19:27', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('45', '获取启动广告根据ID', 'getStarting.do', '', '2', '/front/mobileAdvertisemenApi/getStarting.do?id=1', '{\r\n    \"id\": 2,\r\n    \"imgUrl\": \"http://localhost/upload/image/20140821/1408592436887019716.jpg\",\r\n    \"imgHeight\": 0,\r\n    \"imgWidth\": 0\r\n}', '12', '0', '获取启动广告一张', '1', '2014-09-03 15:19:16', 'zhangyl', '0', '2014-09-03 18:19:38', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('46', '获取内容广告列表', 'getListContentByPage.do', '', '2', '/front/mobileAdvertisemenApi/getListContentByPage.do?pageNo=1&pageSize=10', '{\r\n    \"pageCount\": 1,\r\n    \"pageSize\": 10,\r\n    \"list\": [\r\n        {\r\n            \"id\": 3,\r\n            \"isInside\": 0,\r\n            \"imgUrl\": \"\",\r\n            \"connectUrl\": \"\",\r\n            \"advertisementCode\": \"1212\"\r\n        },\r\n        {\r\n            \"id\": 2,\r\n            \"isInside\": 1,\r\n            \"imgUrl\": \"11\",\r\n            \"connectUrl\": \"11\",\r\n            \"advertisementCode\": \"\"\r\n        },\r\n        {\r\n            \"id\": 1,\r\n            \"isInside\": 0,\r\n            \"imgUrl\": \"\",\r\n            \"connectUrl\": \"\",\r\n            \"advertisementCode\": \"3333\"\r\n        }\r\n    ]\r\n}', '12', '1', '获内容广告集合', '1', '2014-09-03 15:26:16', 'zhangyl', '0', '2014-09-03 18:19:10', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('47', '意见反馈录入', 'feedbackApi/save.do', '', '2', '/front/feedbackApi/save.do?content=content&email=email&system=system&version=version', '成功', '12', '0', '意见反馈录入', '1', '2014-09-03 15:39:17', 'zhangyl', '0', '2014-09-03 19:28:22', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('48', '获取版本更新信息', 'updateVersionApi/get.do', '', '2', '/front/updateVersionApi/get.do?sysType=iPad', '{\r\n    \"id\": 3,\r\n    \"version\": \"6.2.10\",\r\n    \"account\": \"系统升级\",\r\n    \"sysType\": \"iPad\",\r\n    \"downUrl\": \"www.hao.com\"\r\n}', '12', '0', '获取版本更新信息', '1', '2014-09-03 15:49:33', 'zhangyl', '0', '2014-09-03 19:28:31', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('49', '获取广告内容根据ID', 'getContent', '', '2', '/front/mobileAdvertisemenApi/getContent.do?id=1', '{\r\n    \"id\": 1,\r\n    \"isInside\": 0,\r\n    \"imgUrl\": \"\",\r\n    \"connectUrl\": \"\",\r\n    \"advertisementCode\": \"3333\"\r\n}', '12', '1', '获取广告内容单条', '1', '2014-09-03 16:01:59', 'zhangyl', '0', '2014-09-03 18:19:18', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('50', '录入ios设备的token值', 'SysToKenApi', '', '2', '/front/SysToKenApi/save.do?token=c39522e9959df3af4288a4a182ed73cc814afd0328463c98d58bab2a9ee53c26', '\"成功\"', '12', '0', '获取ios设备的token值', '1', '2014-09-04 18:03:59', 'zhangyl', '0', '2014-09-04 18:13:23', 'zhangyl', 'mobile');
INSERT INTO `cms_doc` VALUES ('51', '文章收藏', 'collect', '', '2', '/front/contentMobileApi/collect.do?contentId=9&isCollect=1', '{\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"收藏成功\",\r\n    \"resultCode\": \"0\",\r\n    \"resultMsg\": \"取消收藏\"\r\n}', '12', '0', '文章收藏/取消收藏', '1', '2014-10-08 16:28:39', 'zhangxq', '0', '2014-10-08 16:34:36', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('52', '投票列表', 'loadVoteList', '', '2', '/front/voteMobileApi/loadVoteList.do?pageSize=20&pageNo=1', '{\r\n    \"items\": [\r\n        {\r\n            \"commentCount\": \"0\",\r\n            \"content\": \"你觉得地铁多少钱合适   你觉得地铁多少钱合适\",\r\n            \"id\": \"269\",\r\n            \"invitationCount\": \"0\",\r\n            \"listUrl\": \"/mobile_269.shtml\",\r\n            \"pubDate\": \"2014-12-29 14:24:04\",\r\n            \"title\": \"你觉得地铁多少钱合适\",\r\n            \"topUrl\": \"\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"commentCount\": \"评论条数\",\r\n            \"content\": \"内容\",\r\n            \"id\": \"投票id\",\r\n            \"invitationCount\": \"跟帖条数\",\r\n            \"listUrl\": \"详细页\",\r\n            \"pubDate\": \"发布时间\",\r\n            \"title\": \"标题\",\r\n            \"topUrl\": \"\",\r\n            \"type\": \"类型\"\r\n        }\r\n    ],\r\n    \"pageCount\": \"1\",\r\n    \"pageSize\": \"20\",\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"成功\"\r\n}', '12', '0', '投票列表', '1', '2015-01-12 17:53:16', 'zhangxq', '0', null, null, 'cms');
INSERT INTO `cms_doc` VALUES ('53', '忘记密码', 'getPassword', '', '2', '/front/forgetPasswordApi/getPassword.do?username=&useremail=', '{\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"邮件已发送，请登录test01@163.com查看\"\r\n}', '12', '0', '忘记密码', '1', '2015-01-12 18:14:07', 'zhangxq', '0', null, null, 'mobile');
INSERT INTO `cms_doc` VALUES ('54', '爆料', 'sveContribute', '', '2', '/front/contributeApi/sveContribute.do?userId=&contentCatId=&title=&content=&portrait=', '{\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"投稿成功\",\r\n    \"resultCode\": \"0\",\r\n    \"resultMsg\": \"请登录之后投稿\",\r\n}', '12', '0', '保存爆料接口', '1', '2015-01-15 17:39:27', 'zhangxq', '0', null, null, 'mobile');
INSERT INTO `cms_doc` VALUES ('55', '专题列表', 'loadSimpleSpecialList', '', '2', '/front/simpleSpecialApi/loadSimpleSpecialList.do?pageSize=&pageNo=', '{\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"成功\",\r\n    \"pageCount\":\"\",\r\n    \"pageSize\":\"\",\r\n    \"items\": [\r\n        {\r\n            \"id\": \"1\",\r\n            \"listImage\": \"/upload/image/20150112/1421031512809048869.jpg\",\r\n            \"listUrl\": \"/front/simpleSpecialApi/loadSimpleSpecialContent.do?simpleSpecialId=1&pageSize=10&pageNo=1\",\r\n            \"title\": \"NBA\"\r\n        },\r\n        {\r\n            \"id\": \"专题id\",\r\n            \"listImage\": \"专题缩略图\",\r\n            \"listUrl\": \"专题详情\",\r\n            \"title\": \"NBA\"\r\n        }\r\n    ]\r\n}', '12', '0', '返回专题列表', '1', '2015-01-22 16:38:10', 'zhangxq', '0', '2015-01-23 12:24:10', 'zhangxq', 'mobile');
INSERT INTO `cms_doc` VALUES ('56', '专题下新闻内容列表', 'loadSimpleSpecialContent', '', '2', '/front/simpleSpecialApi/loadSimpleSpecialContent.do?simpleSpecialId=1&pageSize=10&pageNo=1', '{\r\n    \"id\": \"1,专题id\",\r\n    \"pageCount\": \"1\",\r\n    \"pageSize\": \"10\",\r\n    \"resultCode\": \"1\",\r\n    \"resultMsg\": \"成功\",\r\n    \"title\": \"NBA,专题名称\",\r\n    \"content\": \"专题摘要内容\",\r\n    \"type\": \"news\",\r\n    \"items\": [\r\n        {\r\n            \"content\": \"亚航失联客机为何坠海：或为恐怖雷暴云团所致\",\r\n            \"contentMark\": \"rd\",\r\n            \"contentType\": \"1\",\r\n            \"id\": \"289\",\r\n            \"invitationCount\": \"0\",\r\n            \"listImage\": \"/upload/image/20150105/1420427241371044194.jpg\",\r\n            \"listUrl\": \"/mobile/mobile_289.shtml\",\r\n            \"pubDate\": \"2015-01-21 11:24:43\",\r\n            \"source\": \"原创\",\r\n            \"title\": \"亚航失联客机为何坠海：或为恐怖雷暴云团所致\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"content\": \"女子飞机上打电话拒关机 指责乘务员小题大做\",\r\n            \"contentType\": \"1\",\r\n            \"id\": \"288\",\r\n            \"invitationCount\": \"0\",\r\n            \"listImage\": \"/upload/image/20150112/1421031512809048869.jpg\",\r\n            \"listUrl\": \"/mobile/mobile_288.shtml\",\r\n            \"pubDate\": \"2015-01-05 11:33:24\",\r\n            \"source\": \"本站原创\",\r\n            \"title\": \"女子飞机上打电话拒关机 指责乘务员小题大做\",\r\n            \"type\": \"news\"\r\n        },\r\n        {\r\n            \"id\": \"新闻id\",\r\n            \"title\": \"新闻短标题\",\r\n            \"content\": \"新闻摘要\",\r\n            \"listUrl\": \"详细页跳转地址\",\r\n            \"listImage\": \"缩略图地址\",\r\n            \"type\": \"内容分类/类型(1文章2组图3链接4视频6投票8调查)\",\r\n            \"invitationCount\": \"评论数\",\r\n            \"pubDate\": \"发布时间\",\r\n            \"contentMark\": \"内容标记： |独家|热点\"\r\n        }\r\n    ]\r\n}', '12', '0', '返回一个专题下所有的新闻内容列表', '1', '2015-01-22 16:58:16', 'zhangxq', '0', '2015-01-22 17:06:15', 'zhangxq', 'mobile');

-- ----------------------------
-- Table structure for cms_document
-- ----------------------------
DROP TABLE IF EXISTS `cms_document`;
CREATE TABLE `cms_document` (
  `documentstate` smallint(6) DEFAULT NULL,
  `documenttitle` varchar(100) DEFAULT NULL,
  `pictureindex` blob,
  `showhome` smallint(6) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `typeid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qr3qlmgkflj35m5ci1xv0vvg3` (`typeid`) USING BTREE,
  KEY `FK_f2mc12eu0umghp2i70apmtxjl` (`id`) USING BTREE,
  CONSTRAINT `cms_document_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cms_attachment` (`ID`),
  CONSTRAINT `cms_document_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `cms_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`id`) REFER `lm_maven_cms/cms_attachment`(`ID`); (`typeid';

-- ----------------------------
-- Records of cms_document
-- ----------------------------

-- ----------------------------
-- Table structure for cms_doc_entity
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc_entity`;
CREATE TABLE `cms_doc_entity` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '实体名',
  `code` varchar(255) DEFAULT NULL COMMENT '实体代码',
  `sort` int(13) DEFAULT NULL COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体';

-- ----------------------------
-- Records of cms_doc_entity
-- ----------------------------
INSERT INTO `cms_doc_entity` VALUES ('1', '栏目', 'ContentCatEntity', '0', '栏目', null, null, '', null, null, '');
INSERT INTO `cms_doc_entity` VALUES ('2', '内容', 'ContentsEntity', '0', '内容', '1', '2014-08-21 11:19:18', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('3', '广告', 'AdvertisingEntity', '0', '广告', '1', '2014-08-21 14:19:02', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('4', '友情链接', 'FriendLinkEntity', '0', '友情链接', '1', '2014-08-21 14:25:06', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944efcde19014efd0488620015', '新闻内容', 'Contents', '0', '专题下的新闻内容', '1', '2015-08-05 16:40:10', 'admin', '11', '2015-08-05 18:53:52', 'admin');
INSERT INTO `cms_doc_entity` VALUES ('402881944efd67b3014efd90c72d0012', '专题列表', 'SimplespecialEntity', '0', '专题列表', '1', '2015-08-05 19:13:21', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944efd67b3014efda56d8a0032', '投票列表', 'votes', '0', '投票列表', '1', '2015-08-05 19:35:54', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f00c9e1f3000e', '启动广告列表', 'AdvertisemenStartingEntity', '0', '启动广告列表', '1', '2015-08-06 10:14:35', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f00d0b815001d', '跟帖列表', 'Invitations', '0', '跟帖列表(所有)', '1', '2015-08-06 10:22:03', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f00d92e91003d', '消息通知列表', 'mobileMessages', '0', '消息通知列表', '1', '2015-08-06 10:31:17', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f00de33d2004a', '移动搜索列表', 'SearchContents', '0', '移动搜索列表', '1', '2015-08-06 10:36:46', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f00fe3aea0067', '跟帖列表(单条内容和用户)', 'loadInvitations', '0', '跟帖列表(单条内容和用户)', '1', '2015-08-06 11:11:45', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f010c9a72007c', '幻灯片列表', 'Slides', '0', '幻灯片列表', '1', '2015-08-06 11:27:27', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f0113c186008e', ' 新闻列表', 'news', '0', ' 新闻列表', '1', '2015-08-06 11:35:16', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f011caba400b1', '频道列表', 'MobileChannels', '0', '频道列表', '1', '2015-08-06 11:45:00', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('402881944f00a0fc014f0122ca6a00c3', '内容广告列表', 'ContentByPages', '0', '内容广告列表', '1', '2015-08-06 11:51:41', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('5', '区块数据', 'SectionDataEntity', '0', '区块数据', '1', '2014-08-21 14:35:27', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('6', '组图数据', 'PictureAloneEntity', '0', '组图数据', '1', '2014-08-21 14:51:58', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('7', '组图', 'pictureGroup', '0', '组图', '1', '2014-08-21 14:57:32', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity` VALUES ('8', '投票', 'VoteEntity', '0', '投票', '1', '2014-08-22 18:00:56', 'liuzhen', '0', null, null);

-- ----------------------------
-- Table structure for cms_doc_entity_property
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc_entity_property`;
CREATE TABLE `cms_doc_entity_property` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `type` varchar(255) DEFAULT NULL COMMENT '数据类型',
  `entityid` varchar(32) DEFAULT NULL COMMENT '实体id',
  `sort` int(13) DEFAULT NULL COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体属性';

-- ----------------------------
-- Records of cms_doc_entity_property
-- ----------------------------
INSERT INTO `cms_doc_entity_property` VALUES ('1', 'name', 'String', '1', null, '栏目名称', null, null, null, null, null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('10', 'url', 'String', '2', '0', 'URL路径', '1', '2014-08-21 11:21:44', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('11', 'weight', 'Integer', '2', '0', '宽度', '1', '2014-08-21 11:21:56', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('12', 'published', 'DateTime', '2', '0', '发布时间', '1', '2014-08-21 11:22:21', 'liuzhen', '1', '2014-08-21 11:24:30', 'liuzhen');
INSERT INTO `cms_doc_entity_property` VALUES ('13', 'pv', 'Integer', '2', '0', '浏览量', '1', '2014-08-21 11:24:51', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('14', 'digest', 'String', '2', '0', '摘要', '1', '2014-08-21 11:51:28', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('15', 'id', 'Integer', '1', '0', '栏目id', '1', '2014-08-21 12:13:23', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('16', 'alias', 'String', '1', '0', '别名', '1', '2014-08-21 12:13:34', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('17', 'comments', 'Integer', '1', '0', '评论数', '1', '2014-08-21 12:13:47', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('18', 'pv', 'Integer', '1', '0', '浏览量', '1', '2014-08-21 12:13:58', 'liuzhen', '1', '2014-08-21 14:16:10', 'liuzhen');
INSERT INTO `cms_doc_entity_property` VALUES ('19', 'id', 'Integer', '3', '0', '广告id', '1', '2014-08-21 14:19:16', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('2', 'id', 'Integer', '2', '0', '内容 id', '1', '2014-08-21 11:20:02', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('20', 'adName', 'String', '3', '0', '广告名称', '1', '2014-08-21 14:19:31', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('21', 'imgUrl', 'String', '3', '0', '图片上传地址', '1', '2014-08-21 14:19:44', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('22', 'iheight', 'Integer', '3', '0', '高度', '1', '2014-08-21 14:19:58', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('23', 'iweight', 'Integer', '3', '0', '宽度', '1', '2014-08-21 14:20:11', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('24', 'urladress', 'String', '3', '0', '链接地址', '1', '2014-08-21 14:20:23', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('25', 'urlpoint', 'String', '3', '0', '链链提示', '1', '2014-08-21 14:20:39', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('26', 'urltarget', 'String', '3', '0', '链链目标', '1', '2014-08-21 14:20:54', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('27', 'wordcontent', 'String', '3', '0', '文字内容', '1', '2014-08-21 14:21:05', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('28', 'wordsize', 'Integer', '3', '0', '文字大小', '1', '2014-08-21 14:21:18', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('29', 'wordcolor', 'String', '3', '0', '文字颜色', '1', '2014-08-21 14:21:28', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('3', 'title', 'String', '2', '0', '标题', '1', '2014-08-21 11:20:16', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('30', 'advertisingSpace.adName', 'String', '3', '0', '广告位名', '1', '2014-08-21 14:21:40', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('31', 'id', 'Integer', '4', '0', '友情链接id', '1', '2014-08-21 14:25:50', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('32', 'siteName', 'String', '4', '0', '网站名称', '1', '2014-08-21 14:26:00', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('33', 'domain', 'String', '4', '0', '网站地址', '1', '2014-08-21 14:26:12', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('34', 'logo', 'String', '4', '0', '图标', '1', '2014-08-21 14:26:24', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('35', 'email', 'String', '4', '0', '站长邮箱', '1', '2014-08-21 14:26:35', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('36', 'description', 'String', '4', '0', '描述', '1', '2014-08-21 14:26:46', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('37', 'friendLinkCtg.friendlinkctgName', 'String', '4', '0', '链接类型', '1', '2014-08-21 14:27:06', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('38', 'title', 'String', '5', '0', '标题', '1', '2014-08-21 14:35:46', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('39', 'color', 'String', '5', '0', '标题颜色', '1', '2014-08-21 14:35:59', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('4', 'subtitle', 'String', '2', '0', '短标题', '1', '2014-08-21 11:20:29', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('40', 'url', 'String', '5', '0', '内容地址', '1', '2014-08-21 14:36:12', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd0530c30017', 'id', 'String', '402881944efcde19014efd0488620015', '0', '新闻id', '1', '2015-08-05 16:40:53', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd0571520019', 'title', 'String', '402881944efcde19014efd0488620015', '0', '新闻短标题', '1', '2015-08-05 16:41:09', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd05b41a001b', 'content', 'String', '402881944efcde19014efd0488620015', '0', '新闻摘要', '1', '2015-08-05 16:41:26', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd05fe7c001d', 'listUrl', 'String', '402881944efcde19014efd0488620015', '0', '详细页跳转地址', '1', '2015-08-05 16:41:45', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd065857001f', 'listImage', 'String', '402881944efcde19014efd0488620015', '0', '缩略图地址', '1', '2015-08-05 16:42:08', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd06eab60021', 'type', 'Integer', '402881944efcde19014efd0488620015', '0', '内容分类/类型(1文章2组图3链接4视频6投票8调查)', '1', '2015-08-05 16:42:46', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd07407a0023', 'invitationCount', 'Integer', '402881944efcde19014efd0488620015', '0', '评论数', '1', '2015-08-05 16:43:08', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd0792e70025', 'pubDate', 'String', '402881944efcde19014efd0488620015', '0', '发布时间', '1', '2015-08-05 16:43:29', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efcde19014efd0877c90027', 'contentMark', 'String', '402881944efcde19014efd0488620015', '0', '内容标记： |独家|热点', '1', '2015-08-05 16:44:27', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efd94a0440014', 'id', 'String', '402881944efd67b3014efd90c72d0012', '0', '专题id', '1', '2015-08-05 19:17:33', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efd94e9140016', 'listImage', 'String', '402881944efd67b3014efd90c72d0012', '0', '专题缩略图', '1', '2015-08-05 19:17:52', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efd951cd10018', 'listUrl', 'String', '402881944efd67b3014efd90c72d0012', '0', '专题详情', '1', '2015-08-05 19:18:05', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efd957df1001a', 'title', 'String', '402881944efd67b3014efd90c72d0012', '0', '专题标题', '1', '2015-08-05 19:18:30', 'admin', '1', '2015-08-05 19:18:35', 'admin');
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda5cb260034', 'commentCount', 'String', '402881944efd67b3014efda56d8a0032', '0', '评论条数', '1', '2015-08-05 19:36:18', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda5f6770036', 'content', 'String', '402881944efd67b3014efda56d8a0032', '0', '内容', '1', '2015-08-05 19:36:29', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda62da40038', 'id', 'String', '402881944efd67b3014efda56d8a0032', '0', '投票id', '1', '2015-08-05 19:36:43', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda6995d003a', 'invitationCount', 'String', '402881944efd67b3014efda56d8a0032', '0', '跟帖条数', '1', '2015-08-05 19:37:11', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda73945003c', 'listUrl', 'String', '402881944efd67b3014efda56d8a0032', '0', '详细页', '1', '2015-08-05 19:37:52', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda76d66003e', 'pubDate', 'String', '402881944efd67b3014efda56d8a0032', '0', '发布时间', '1', '2015-08-05 19:38:05', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944efd67b3014efda7a08d0040', 'title', 'String', '402881944efd67b3014efda56d8a0032', '0', '标题', '1', '2015-08-05 19:38:18', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00ca59a70010', 'id', 'String', '402881944f00a0fc014f00c9e1f3000e', '0', '启动广告图片ID', '1', '2015-08-06 10:15:05', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00ca9ca50012', 'imgUrl', 'String', '402881944f00a0fc014f00c9e1f3000e', '0', '启动广告图片url', '1', '2015-08-06 10:15:23', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00cb2b5d0014', 'imgHeight', 'String', '402881944f00a0fc014f00c9e1f3000e', '0', '备用(图片高度)', '1', '2015-08-06 10:15:59', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00cb61e90016', 'imgWidth', 'String', '402881944f00a0fc014f00c9e1f3000e', '0', '备用(图片宽度)', '1', '2015-08-06 10:16:13', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d10fe9001f', 'id', 'String', '402881944f00a0fc014f00d0b815001d', '0', '新闻id', '1', '2015-08-06 10:22:25', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d15b310021', 'title', 'String', '402881944f00a0fc014f00d0b815001d', '0', '新闻短标题', '1', '2015-08-06 10:22:45', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d214320023', 'content', 'String', '402881944f00a0fc014f00d0b815001d', '0', '新闻摘要', '1', '2015-08-06 10:23:32', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d27d960025', 'listUrl', 'String', '402881944f00a0fc014f00d0b815001d', '0', '详细页跳转地址', '1', '2015-08-06 10:23:59', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d2c6690027', 'topUrl', 'String', '402881944f00a0fc014f00d0b815001d', '0', '缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式', '1', '2015-08-06 10:24:18', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d3107c0029', 'type', 'String', '402881944f00a0fc014f00d0b815001d', '0', '新闻类型：news|pic|video', '1', '2015-08-06 10:24:36', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d34a92002b', 'commentCount', 'String', '402881944f00a0fc014f00d0b815001d', '0', '评论数', '1', '2015-08-06 10:24:51', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d38304002d', 'pubDate', 'String', '402881944f00a0fc014f00d0b815001d', '0', '发布时间', '1', '2015-08-06 10:25:06', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d3b1b2002f', 'source', 'String', '402881944f00a0fc014f00d0b815001d', '0', '来源', '1', '2015-08-06 10:25:18', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d96ba4003f', 'content', 'String', '402881944f00a0fc014f00d92e91003d', '0', '通知内容', '1', '2015-08-06 10:31:33', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d9977e0041', 'listUrl', 'String', '402881944f00a0fc014f00d92e91003d', '0', '详细页', '1', '2015-08-06 10:31:44', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00d9c1bc0043', 'pubDate', 'String', '402881944f00a0fc014f00d92e91003d', '0', '推送时间', '1', '2015-08-06 10:31:55', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00de8257004c', 'id', 'String', '402881944f00a0fc014f00de33d2004a', '0', '新闻id', '1', '2015-08-06 10:37:07', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00deb8f6004e', 'title', 'String', '402881944f00a0fc014f00de33d2004a', '0', '新闻短标题', '1', '2015-08-06 10:37:21', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00deef2c0050', 'content', 'String', '402881944f00a0fc014f00de33d2004a', '0', '新闻摘要', '1', '2015-08-06 10:37:34', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00df73080052', 'listUrl', 'String', '402881944f00a0fc014f00de33d2004a', '0', '详细页跳转地址', '1', '2015-08-06 10:38:08', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00eb718f0054', 'topUrl', 'String', '402881944f00a0fc014f00de33d2004a', '0', '缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式', '1', '2015-08-06 10:51:14', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00eba55c0056', 'type', 'String', '402881944f00a0fc014f00de33d2004a', '0', '新闻类型：news|pic|video', '1', '2015-08-06 10:51:27', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00ebda5c0058', 'comentNum', 'String', '402881944f00a0fc014f00de33d2004a', '0', '评论数', '1', '2015-08-06 10:51:41', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00ec05ad005a', 'pubDate', 'String', '402881944f00a0fc014f00de33d2004a', '0', '发布时间', '1', '2015-08-06 10:51:52', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00ec2d93005c', 'source', 'String', '402881944f00a0fc014f00de33d2004a', '0', '来源', '1', '2015-08-06 10:52:02', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f00ff2d9a0069', 'id', 'String', '402881944f00a0fc014f00fe3aea0067', '0', '跟帖id', '1', '2015-08-06 11:12:48', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0100d981006b', 'content', 'String', '402881944f00a0fc014f00fe3aea0067', '0', '跟帖内容', '1', '2015-08-06 11:14:37', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01010e95006d', 'listUrl', 'String', '402881944f00a0fc014f00fe3aea0067', '0', '详细页跳转地址', '1', '2015-08-06 11:14:51', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f010141dc006f', 'pubDate', 'String', '402881944f00a0fc014f00fe3aea0067', '0', '跟帖时间', '1', '2015-08-06 11:15:04', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01017c710071', 'pictureAll', 'String', '402881944f00a0fc014f00fe3aea0067', '0', '跟帖人头像', '1', '2015-08-06 11:15:19', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0102474e0073', 'type', 'String', '402881944f00a0fc014f00fe3aea0067', '0', '跟帖类型：0-所有|1-我的|2-精彩', '1', '2015-08-06 11:16:11', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f010dd166007e', 'id', 'String', '402881944f00a0fc014f010c9a72007c', '0', '新闻id', '1', '2015-08-06 11:28:47', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f010e08190080', 'title', 'String', '402881944f00a0fc014f010c9a72007c', '0', '新闻短标题', '1', '2015-08-06 11:29:01', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f010e4d980082', 'listUrl', 'String', '402881944f00a0fc014f010c9a72007c', '0', '详细页跳转地址', '1', '2015-08-06 11:29:19', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f010f37360084', 'topUrl', 'String', '402881944f00a0fc014f010c9a72007c', '0', '缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式', '1', '2015-08-06 11:30:19', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f010f6cb30086', 'type', 'String', '402881944f00a0fc014f010c9a72007c', '0', '新闻类型：news|pic|video', '1', '2015-08-06 11:30:32', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0115107b0090', 'id', 'String', '402881944f00a0fc014f0113c186008e', '0', '新闻id', '1', '2015-08-06 11:36:42', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011545d90092', 'title', 'String', '402881944f00a0fc014f0113c186008e', '0', '新闻短标题', '1', '2015-08-06 11:36:56', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0116177a0094', 'content', 'String', '402881944f00a0fc014f0113c186008e', '0', '新闻摘要', '1', '2015-08-06 11:37:49', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01164edc0096', 'listUrl', 'String', '402881944f00a0fc014f0113c186008e', '0', '详细页跳转地址', '1', '2015-08-06 11:38:03', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011692d50098', 'topUrl', 'String', '402881944f00a0fc014f0113c186008e', '0', '幻灯片缩略图地址：地址1|地址2|地址3, 最多可以有三个地址，根据新闻类型展示不同的样式', '1', '2015-08-06 11:38:21', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0116cf2a009a', 'listImage', 'String', '402881944f00a0fc014f0113c186008e', '0', '列表缩略图地址：地址', '1', '2015-08-06 11:38:36', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011711ba009c', 'type', 'String', '402881944f00a0fc014f0113c186008e', '0', '新闻类型：news|pic|video', '1', '2015-08-06 11:38:53', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01184349009e', 'invitationCount', 'String', '402881944f00a0fc014f0113c186008e', '0', '评论数', '1', '2015-08-06 11:40:11', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01186d0a00a0', 'pubDate', 'String', '402881944f00a0fc014f0113c186008e', '0', '发布时间', '1', '2015-08-06 11:40:22', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0118ef6b00a2', 'source', 'String', '402881944f00a0fc014f0113c186008e', '0', '来源', '1', '2015-08-06 11:40:56', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01193f2200a4', 'contentMark', 'String', '402881944f00a0fc014f0113c186008e', '0', '内容标记： |独家|热点', '1', '2015-08-06 11:41:16', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011978ec00a6', 'contentType', 'String', '402881944f00a0fc014f0113c186008e', '0', '内容分类/类型(1文章2组图3链接4视频6投票8调查)', '1', '2015-08-06 11:41:31', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011cfb6400b3', 'id', 'String', '402881944f00a0fc014f011caba400b1', '0', '频道id', '1', '2015-08-06 11:45:21', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011d2c4600b5', 'title', 'String', '402881944f00a0fc014f011caba400b1', '0', '频道名', '1', '2015-08-06 11:45:33', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011d6b1400b7', 'listUrl', 'String', '402881944f00a0fc014f011caba400b1', '0', '频道列表地址', '1', '2015-08-06 11:45:49', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011da5ef00b9', 'topUrl', 'String', '402881944f00a0fc014f011caba400b1', '0', '频道头图列表地址', '1', '2015-08-06 11:46:04', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f011de24a00bb', 'type', 'String', '402881944f00a0fc014f011caba400b1', '0', '频道类型，可以为空', '1', '2015-08-06 11:46:20', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0122f89900c5', 'id', 'String', '402881944f00a0fc014f0122ca6a00c3', '0', 'id', '1', '2015-08-06 11:51:53', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f012339cc00c9', 'isInside', 'String', '402881944f00a0fc014f0122ca6a00c3', '0', '是否是内置广告', '1', '2015-08-06 11:52:10', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f01238cce00cc', 'imgUrl', 'String', '402881944f00a0fc014f0122ca6a00c3', '0', '广告图片地址', '1', '2015-08-06 11:52:31', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f0123cab800ce', 'connectUrl', 'String', '402881944f00a0fc014f0122ca6a00c3', '0', '广告链接地址', '1', '2015-08-06 11:52:47', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('402881944f00a0fc014f012415ef00d0', 'advertisementCode', 'String', '402881944f00a0fc014f0122ca6a00c3', '0', '广告代码', '1', '2015-08-06 11:53:06', 'admin', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('41', 'thumb', 'String', '5', '0', '缩略图', '1', '2014-08-21 14:36:23', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('42', 'description', 'String', '5', '0', '描述', '1', '2014-08-21 14:36:32', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('43', 'pictureUrl', 'String', '6', '0', '图片地址', '1', '2014-08-21 14:52:26', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('44', 'pictureMessage', 'String', '6', '0', '图片信息', '1', '2014-08-21 14:52:36', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('45', 'pictureWidth', 'String', '6', '0', '宽度', '1', '2014-08-21 14:52:46', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('46', 'pictureHeight', 'String', '6', '0', '长度', '1', '2014-08-21 14:52:54', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('47', 'id', 'Integer', '7', '0', '组图id', '1', '2014-08-21 14:57:47', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('48', 'image', 'String', '7', '0', '图片名', '1', '2014-08-21 14:58:12', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('49', 'remark', 'String', '7', '0', '备注', '1', '2014-08-21 14:58:23', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('5', 'color', 'String', '2', '0', '标题字体颜色', '1', '2014-08-21 11:20:42', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('50', 'url', 'String', '7', '0', 'url', '1', '2014-08-21 14:58:52', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('51', 'allowcomment', 'String', '2', '0', '是否允许评论', '1', '2014-08-22 17:44:07', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('52', 'contentCat.name', 'String', '2', '0', '栏目名', '1', '2014-08-22 17:44:23', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('53', 'id', 'Integer', '8', '0', '投票id', '1', '2014-08-22 18:01:19', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('54', 'votetype', 'String', '8', '0', '投票类型', '1', '2014-08-22 18:01:29', 'liuzhen', '1', '2014-08-22 18:01:48', 'liuzhen');
INSERT INTO `cms_doc_entity_property` VALUES ('55', 'votepattern', 'String', '8', '0', '投票模式', '1', '2014-08-22 18:01:43', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('56', 'voteintroduce', 'String', '8', '0', '介绍', '1', '2014-08-22 18:02:10', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('57', 'description', 'String', '8', '0', '描述', '1', '2014-08-22 18:02:21', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('6', 'thumb', 'String', '2', '0', '缩略图', '1', '2014-08-21 11:20:56', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('7', 'tags', 'String', '2', '0', '标签', '1', '2014-08-21 11:21:11', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('8', 'author', 'String', '2', '0', '作者', '1', '2014-08-21 11:21:21', 'liuzhen', '0', null, null);
INSERT INTO `cms_doc_entity_property` VALUES ('9', 'sourceid', 'Integer', '2', '0', '来源id', '1', '2014-08-21 11:21:32', 'liuzhen', '0', null, null);

-- ----------------------------
-- Table structure for cms_doc_entity_ref
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc_entity_ref`;
CREATE TABLE `cms_doc_entity_ref` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `docid` varchar(32) DEFAULT NULL COMMENT '文档id',
  `entityid` varchar(32) DEFAULT NULL COMMENT '实体id',
  `sort` int(13) DEFAULT NULL COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实体与文档关联表';

-- ----------------------------
-- Records of cms_doc_entity_ref
-- ----------------------------
INSERT INTO `cms_doc_entity_ref` VALUES ('8', '9', '1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_doc_param
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc_param`;
CREATE TABLE `cms_doc_param` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `docid` varchar(32) DEFAULT NULL COMMENT '文档id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` int(13) DEFAULT NULL COMMENT '类型',
  `isrequired` varchar(255) DEFAULT NULL COMMENT '是否必须',
  `example_value` varchar(255) DEFAULT NULL COMMENT '示例值',
  `defalut_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='输入参数';

-- ----------------------------
-- Records of cms_doc_param
-- ----------------------------
INSERT INTO `cms_doc_param` VALUES ('10', '14', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('100', '50', 'sysType', '1', '0', '', '', '系统类型', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('101', '50', 'phoneName', '1', '1', '', '', '手机品牌', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('102', '50', 'phoneType', '1', '1', '', '', '手机型号', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('103', '51', 'contentId', '1', '1', '9', '', '需要收藏的文章id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('104', '51', 'isCollect', '1', '1', '1', '0', '1-收藏成功|0-取消收藏', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('105', '53', 'username', '1', '1', '', '', '用户名', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('106', '53', 'useremail', '1', '1', '', '', '用户邮箱', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('107', '54', 'portrait', '1', '0', '', '', '图片数据', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('108', '54', 'content', '1', '1', '', '', '爆料内容', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('109', '54', 'title', '1', '1', '', '', '爆料标题', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('11', '15', 'all', '1', '1', 'y/n', 'y', '是否实体全部属性', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('110', '54', 'contentCatId', '2', '1', '', '', '爆料类型ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('111', '54', 'userId', '2', '1', '', '', '当前登录用户ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('112', '56', 'simpleSpecialId', '2', '1', '', '1', '专题id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('113', '56', 'pageSize', '2', '0', '', '10', '每页显示条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('114', '56', 'pageNo', '2', '0', '', '1', '页数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('115', '55', 'pageSize', '2', '0', '', '1', '每页条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('116', '55', 'pageNo', '2', '0', '', '10', '第几页', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('12', '16', 'all', '1', '1', 'y/n', 'y', '是否实体全部属性', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('13', '17', 'contentId', '1', '1', '3', '', '移动内容Id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('14', '17', 'all', '1', '1', 'y/n', 'y', '是否实体全部属性', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('15', '18', 'contentId', '1', '1', '4', '', '移动内容Id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('16', '18', 'all', '1', '1', 'y/n', 'y', '是否全部实体属性', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('19', '22', '用户名', '1', '1', 'username', '', '用户名', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('2', '10', 'contentId', '2', '1', '14', '', '内容id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('20', '22', '密码', '1', '1', 'password', '', '用户密码', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('21', '26', '用户名', '1', '1', 'username', '', '注册用户名', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('22', '26', '密码', '1', '1', 'password', '', '注册密码', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('23', '26', '邮箱', '1', '1', 'email', '', '注册邮箱', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('24', '14', 'pageSize', '1', '0', '20', '20', '每页条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('25', '14', 'pageNo', '1', '1', '1', '1', '页数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('26', '20', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('27', '20', 'mobileChannelId', '1', '1', '21', '', '频道id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('28', '20', 'pageSize', '1', '0', '20', '20', '每页条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('29', '20', 'pageNo', '1', '1', '1', '1', '页数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('3', '11', 'name', '1', '1', '大冬瓜', '', '当name为String时，作为广告位名称查询', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('30', '21', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('31', '21', 'contentsMobileId', '1', '1', '9', '', '内容id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('32', '21', 'pageSize', '1', '0', '20', '20', '每页条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('33', '21', 'pageNo', '1', '1', '1', '1', '页数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('34', '23', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('35', '23', 'contentsMobileId', '1', '1', '9', '', '内容Id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('402881904ed3d9e3014ed43ec1e10111', '33', 'pageSize', '1', '1', '20', '20', '每页条数', null, '2015-07-28 18:39:20', null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('402881904ed3d9e3014ed43f466b0113', '33', 'pageNo', '1', '1', '1', '1', '页数', null, '2015-07-28 18:39:53', null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('402881944efd67b3014efda144ec0026', '52', 'pageSize', '2', '1', '', '20', '每页显示条数', null, '2015-08-05 19:31:21', null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('402881944efd67b3014efda1d29d0028', '52', 'pageNo', '2', '1', '', '1', '页数', null, '2015-08-05 19:31:58', null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('402881944f00a0fc014f010a9f1d007a', '27', 'size', '2', '1', '', '14', '文章字体大小', null, '2015-08-06 11:25:17', null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('42', '28', 'contentsMobileId', '1', '1', '', '', '内容Id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('43', '28', 'content', '1', '1', '', '', '跟帖内容', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('44', '29', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('45', '29', 'contentsMobileId', '1', '1', '9', '', '内容Id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('46', '29', 'pageSize', '1', '0', '20', '20', '每页条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('47', '29', 'pageNo', '1', '1', '1', '1', '页数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('48', '30', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('49', '30', 'key', '1', '1', '', '', '关键词', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('5', '11', 'count', '2', '0', '10', '', '默认查询广告位下所有广告', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('50', '30', 'pageSize', '1', '0', '20', '20', '每页条数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('51', '30', 'pageNo', '1', '1', '1', '1', '页数', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('52', '13', 'mobileChannelId', '1', '1', '18', '', '频道id(新闻=18，图片=19，视频=23)', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('53', '23', 'content', '1', '1', '', '', '评论内容', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('54', '23', 'title', '1', '1', '', '', '评论标题', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('55', '25', 'content', '1', '1', '', '', '意见反馈内容', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('56', '25', 'email', '1', '1', '', '', '意见反馈人联系邮箱', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('57', '25', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据） ', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('58', '24', 'portrait', '1', '1', '', '', '用户头像url', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('59', '24', 'all', '1', '0', '', '', '测试分类（如果为“y”为模拟数据） ', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('6', '14', 'mobileChannelId', '1', '1', '21', '', '频道id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('60', '28', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('62', '24', 'userName', '1', '1', '', '', '用户名称', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('63', '24', 'password', '1', '1', '', '', '用户密码', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('64', '22', 'loginType', '1', '1', '', '', '第三方登录', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('66', '21', 'userId', '1', '1', '', '', '用户Id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('67', '23', 'userId', '1', '1', '49', '', '用户id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('68', '24', 'userId', '1', '1', '49', '', '用户id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('69', '25', 'userId', '1', '1', '49', '', '用户id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('7', '15', 'contentId', '1', '1', '1', '', '移动内容id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('70', '28', 'userId', '1', '1', '49', '', '用户id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('71', '31', 'contentsMobileId', '1', '1', '10', '', '移动内容id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('72', '34', 'name', '1', '1', '\'name\':\'10\'   或   \'name\':\'新闻栏目\'', '', '栏目名称，显示指定名称的栏目的列表，可以为ID<br/>\r\n当level属性值为self，name值是内容名称/ID，返回单条内容\r\n', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('73', '34', 'level', '1', '0', 'root | current | child | self | all', 'child', 'root      站点一级栏目下内容，如果指定了name则此属性无效<br/>\r\ncurrent 当前栏目的同级栏目中内容<br/>\r\nchild     当前栏目下的子栏目中内容，默认属性<br/>\r\nself      获取内容本身', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('74', '34', 'count', '2', '0', '1~n', '', '整数，列表显示数目  不分页时默认10条', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('75', '34', 'order', '1', '0', 'top | recent | pv', 'recent', 'top      置顶文章<br/>\r\nrecent 配合新闻使用，最新新闻，按发布时间排序,默认<br/>\r\npv       配合新闻使用，按点击率排序<br/>', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('76', '34', 'page', '1', '0', '\'pageindex\':\'${pageindex}\'', '', 'page=true有效  索引固定写法 \'pageindex\':\'${pageindex}\'', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('77', '35', 'name', '1', '1', '', '', '栏目名称，显示指定名称的栏目的列表，可以为ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('78', '35', 'level', '1', '0', 'root | current | child | self', 'child', 'root 站点一级栏目下文章，如果指定了name则此属性无效<br/>\r\ncurrent 当前栏目的同级栏目<br/>\r\nchild 当前栏目下的子栏目，默认属性<br/>\r\nself 获取栏目本身', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('79', '35', 'count', '2', '0', '1~n', '', '整数，列表显示数目', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('8', '16', 'contentId', '1', '1', '1', '', '移动内容id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('80', '36', 'name', '1', '1', '', '', '指定友情链接类别，可以为ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('81', '36', 'count', '1', '0', '1~n', '', '整数，列表显示数目', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('82', '37', 'name', '1', '1', '', '', '指定区块，可以为ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('83', '37', 'count', '1', '1', '1~n', '', '整数，列表显示数目', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('84', '38', 'pgid', '2', '1', '', '', '组图id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('85', '39', 'contentid', '2', '1', '', '', '内容id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('86', '40', 'voteid', '2', '1', '', '', '投票id', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('88', '44', 'pageNo', '2', '1', '当前页码', '1', '当前页码', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('89', '44', 'pageSize', '2', '1', '页码尺寸', '20', '页码尺寸', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('9', '13', 'all', '1', '0', 'y', 'y', '测试分类（如果为“y”为模拟数据）', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('90', '45', 'id', '2', '1', '1', '1', '启动广告图片ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('91', '46', 'pageNo', '2', '1', '1', '1', '当前页码', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('92', '46', 'pageSize', '2', '1', '20', '20', '页码尺寸', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('93', '47', 'content', '1', '1', '', '', '内容', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('94', '47', 'email', '1', '1', '', '', '邮箱', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('95', '47', 'system', '1', '1', '', '', '系统', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('96', '47', 'version', '1', '1', '', '', '版本', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('97', '48', 'sysType', '1', '1', '', 'iPhone,iPad,Android,AndroidPad', '系统类型', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('98', '49', '广告内容ID', '2', '1', '', '', '广告内容ID', null, null, null, null, null, null);
INSERT INTO `cms_doc_param` VALUES ('99', '50', 'token', '1', '1', '', '', 'token值,必须是64位', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_doc_returnvalue
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc_returnvalue`;
CREATE TABLE `cms_doc_returnvalue` (
  `id` varchar(32) NOT NULL COMMENT '链接id',
  `docid` varchar(32) DEFAULT NULL COMMENT '文档id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `isrequired` int(13) DEFAULT NULL COMMENT '是否必须',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  `code` varchar(255) DEFAULT NULL COMMENT '实体代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档分类';

-- ----------------------------
-- Records of cms_doc_returnvalue
-- ----------------------------
INSERT INTO `cms_doc_returnvalue` VALUES ('1', '10', '直接返回总评论数', 'Integer', '1', '0', '直接返回总评论数，无对象', null, null, null, null, null, null, null);
INSERT INTO `cms_doc_returnvalue` VALUES ('13', '21', '评论列表', 'String', '1', 'json', 'resultCode-1：成功，0：失败 | resultMsg-返回信息 | id-内容id | | pageSize-每页条数 | pageContent-页数 | type-内容类型 | items-所有评价 ：id-评价id  listUrl-详细页跳转地址  title-评论标题  pubDate-评论时间  content-评论摘要  type-评论类型', '1', '2014-07-17 16:48:50', 'zhangxq', '6', '2014-07-31 18:08:08', 'zhangxq', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('14', '23', '返回评论列表', 'String', '1', 'json', 'resultCode－1：成功，0：失败｜ resultMsg－返回信息｜ listurl－评论列表', '1', '2014-07-17 16:50:04', 'zhangxq', '2', '2014-07-31 16:36:37', 'zhangxq', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('17', '27', '返回详细页', 'String', '1', 'html页面', '返回详细页面的html页面', '1', '2014-07-17 16:53:45', 'zhangxq', '1', '2014-07-17 18:48:35', 'zhangxq', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('2', '11', '广告列表', 'List', null, null, '匹配广告位后返回的广告列表', null, null, null, null, '2014-06-26 16:26:25', null, 'ContentCatEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('23', '34', '内容信息', 'List', null, null, '内容信息', '1', '2014-08-21 12:04:43', 'liuzhen', '0', null, null, 'ContentsEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('24', '35', '栏目', 'List', null, null, '栏目', '1', '2014-08-21 14:17:05', 'liuzhen', '0', null, null, 'ContentCatEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('25', '36', '友情链接', 'List', null, null, '友情链接', '1', '2014-08-21 14:25:28', 'liuzhen', '0', null, null, 'FriendLinkEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('26', '37', '区块数据', 'List', null, null, '区块数据', '1', '2014-08-21 14:37:00', 'liuzhen', '0', null, null, 'SectionDataEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('27', '38', '组图数据', 'List', null, null, '组图数据', '1', '2014-08-21 14:53:13', 'liuzhen', '0', null, null, 'PictureAloneEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('28', '39', 'pictureGroup', 'Bean', null, null, '标签返回的是Map 键:pictureGroup', '1', '2014-08-22 17:30:51', 'liuzhen', '0', null, null, 'pictureGroup');
INSERT INTO `cms_doc_returnvalue` VALUES ('29', '39', 'article', 'Bean', null, null, '标签返回的是Map 键:article', '1', '2014-08-22 17:31:48', 'liuzhen', '0', null, null, 'ContentsEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('30', '40', 'optionname', 'String', null, null, '选项名称', '1', '2014-08-22 17:41:57', 'liuzhen', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('31', '40', 'optionlink', 'String', null, null, '选项链接', '1', '2014-08-22 17:42:08', 'liuzhen', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('32', '40', 'optionimg', 'String', null, null, '选项图片', '1', '2014-08-22 17:42:18', 'liuzhen', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('33', '40', 'optiontotal', 'Integer', null, null, '初始票数', '1', '2014-08-22 17:42:31', 'liuzhen', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('34', '41', 'vote', 'Bean', null, null, '标签返回的是Map 键:vote', '1', '2014-08-22 18:02:48', 'liuzhen', '0', null, null, 'VoteEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('35', '41', 'article', 'Bean', null, null, '标签返回的是Map 键:article', '1', '2014-08-22 18:03:08', 'liuzhen', '0', null, null, 'ContentsEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('4', '15', '返回单篇文章', 'String', '1', '', 'json格式字符串', '1', '2014-07-09 18:25:46', 'zhangxq', '1', '2014-07-11 11:08:16', 'zhangxq', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed393ca7a0050', '46', 'pageCount', 'Integer', '1', '', '最大页码', '1', '2015-07-28 15:32:35', 'admin', '2', '2015-07-28 15:44:00', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed394b9820055', '46', 'pageSize', 'Integer', '1', '', '页码尺寸', '1', '2015-07-28 15:33:36', 'admin', '2', '2015-07-28 15:43:52', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed395090c0057', '46', 'list', 'List', '1', '', '内容广告列表', '1', '2015-07-28 15:33:57', 'admin', '2', '2015-08-06 11:54:15', 'admin', 'ContentByPages');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed39fbf04006b', '49', 'id', 'String', '1', '', 'id', '1', '2015-07-28 15:45:39', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed3a0142d006d', '49', 'isInside', 'Integer', '1', '', '是否是内置广告', '1', '2015-07-28 15:46:00', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed3a0c0bf006f', '49', 'imgUrl', 'String', '1', '', '广告图片地址', '1', '2015-07-28 15:46:45', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed36acb014ed3a12ce30071', '49', 'connectUrl', 'String', '1', '', '广告链接地址', '1', '2015-07-28 15:47:12', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3dc80c00001', '49', 'dvertisementCode', 'String', '1', '', '广告代码', '1', '2015-07-28 16:52:00', 'admin', '1', '2015-07-28 16:52:07', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3dfc3620005', '44', 'pageCount', 'Integer', '1', '', '最大页码', '1', '2015-07-28 16:55:34', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3e000fc0007', '44', 'pageSize', 'Integer', '1', '', '页码尺寸', '1', '2015-07-28 16:55:50', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3e0ca8c0009', '44', 'list', 'List', '1', '', '启动广告集合', '1', '2015-07-28 16:56:41', 'admin', '1', '2015-08-06 10:17:34', 'admin', 'AdvertisemenStartingEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3e4daa70017', '45', 'id', 'String', '1', '', '启动广告图片ID', '1', '2015-07-28 17:01:08', 'admin', '1', '2015-07-28 17:02:33', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3e6a0fb001b', '45', 'imgUrl', 'String', '1', '', '启动广告图片url', '1', '2015-07-28 17:03:04', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3e77a890020', '45', 'imgHeight', 'String', '1', '', '备用(图片高度)', '1', '2015-07-28 17:04:00', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3e7ee350022', '45', 'imgWidth', 'String', '1', '', '备用(图片宽度)', '1', '2015-07-28 17:04:29', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3ec11f70027', '48', 'ID', 'String', '1', '', 'ID', '1', '2015-07-28 17:09:01', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3ec71cd002a', '48', 'sysType', 'String', '1', '', '系统类型', '1', '2015-07-28 17:09:25', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3ec9e55002c', '48', 'version', 'String', '1', '', '版本号', '1', '2015-07-28 17:09:36', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3eccf1d002e', '48', 'account', 'String', '1', '', '更新说明', '1', '2015-07-28 17:09:49', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3ed1f0a0033', '48', 'downUrl', 'String', '1', '', '下载地址', '1', '2015-07-28 17:10:09', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3ef5d5c0036', '13', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 17:12:36', 'admin', '2', '2015-07-28 17:20:08', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3efc8150039', '13', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:13:04', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3f003f9003b', '13', 'id', 'String', '1', '', '频道id', '1', '2015-07-28 17:13:19', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3f06e9a003d', '13', 'title', 'String', '1', '', '频道栏名称', '1', '2015-07-28 17:13:46', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3f0d1c4003f', '13', 'type', 'String', '1', '', '频道分类', '1', '2015-07-28 17:14:12', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed3f1fcb60041', '13', 'items', 'List', '1', '', '频道列表', '1', '2015-07-28 17:15:28', 'admin', '2', '2015-08-06 11:49:17', 'admin', 'MobileChannels');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4004ffe0053', '14', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 17:31:07', 'admin', '1', '2015-07-28 17:31:25', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed400d8090056', '14', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:31:42', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4013c2b0058', '14', 'id', 'String', '1', '', '频道id', '1', '2015-07-28 17:32:08', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4017f7c005a', '14', 'title', 'String', '1', '', '频道名称', '1', '2015-07-28 17:32:25', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed401ca0e005c', '14', 'type', 'String', '1', '', '频道分类', '1', '2015-07-28 17:32:44', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4023103005e', '14', 'pageSize', 'String', '1', '', '每页条数', '1', '2015-07-28 17:33:10', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40262fd0060', '14', 'pageCount', 'String', '1', '', '页数', '1', '2015-07-28 17:33:23', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed402b7ce0062', '14', 'items', 'List', '1', '', '新闻列表', '1', '2015-07-28 17:33:45', 'admin', '1', '2015-08-06 11:42:52', 'admin', 'news');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40be3eb0075', '20', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 17:43:46', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40c228c0077', '20', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:44:02', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40c67f6007c', '20', 'id', 'String', '1', '', '频道id', '1', '2015-07-28 17:44:20', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40ca98f007e', '20', 'title', 'String', '1', '', '频道名称', '1', '2015-07-28 17:44:36', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40d0b340080', '20', 'type', 'String', '1', '', '频道分类', '1', '2015-07-28 17:45:01', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed40d51110082', '20', 'items', 'List', '1', '', ' 幻灯片列表', '1', '2015-07-28 17:45:19', 'admin', '1', '2015-08-06 11:33:46', 'admin', 'Slides');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4102061008f', '22', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 17:48:24', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41056a40091', '22', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:48:37', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41088c70093', '22', 'userId', 'String', '1', '', '用户id', '1', '2015-07-28 17:48:50', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed410c1b30095', '22', 'userName', 'String', '1', '', '用户名', '1', '2015-07-28 17:49:05', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed410f5b70097', '22', 'faceImg', 'String', '1', '', '用户头像', '1', '2015-07-28 17:49:18', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4122f8a009a', '24', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 17:50:38', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed413a7f1009c', '24', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:52:15', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed413efe8009e', '24', 'userId', 'String', '1', '', '用户id', '1', '2015-07-28 17:52:33', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed414312100a0', '24', 'userName', 'String', '1', '', '用户名', '1', '2015-07-28 17:52:50', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed414a7e600a2', '24', 'faceImg', 'String', '1', '', '用户头像', '1', '2015-07-28 17:53:20', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4170c4600a5', '25', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 17:55:57', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41786da00aa', '25', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:56:29', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed419228000ad', '26', 'resultCode', 'String', '1', '', '1:注册失败,0:注册成功', '1', '2015-07-28 17:58:14', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed419595100af', '26', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 17:58:28', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed419987100b1', '26', 'userId', 'String', '1', '', '用户id', '1', '2015-07-28 17:58:44', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed419ced700b3', '26', 'userName', 'String', '1', '', '用户名', '1', '2015-07-28 17:58:58', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed419fa2a00b5', '26', 'faceImg', 'String', '1', '', '头像 ', '1', '2015-07-28 17:59:09', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41c470e00bb', '28', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 18:01:40', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41c88f200bd', '28', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 18:01:57', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41cddfa00bf', '28', 'listurl ', 'String', '1', '', '跟帖列表', '1', '2015-07-28 18:02:18', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41f068100c2', '29', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 18:04:40', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41f438400c4', '29', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 18:04:56', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41f744e00c6', '29', 'id', 'String', '1', '', '内容id', '1', '2015-07-28 18:05:08', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed41fae9700c8', '29', 'type', 'String', '1', '', '跟帖类型', '1', '2015-07-28 18:05:23', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4203a2900ca', '29', 'pageSize', 'String', '1', '', '每页条数', '1', '2015-07-28 18:05:59', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4207d3200cc', '29', 'pageCount', 'String', '1', '', '页数', '1', '2015-07-28 18:06:16', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed420ccf700ce', '29', 'items', 'List', '1', '', '跟帖列表(单条内容和用户)', '1', '2015-07-28 18:06:36', 'admin', '1', '2015-08-06 11:20:40', 'admin', 'loadInvitations');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed425b10300d9', '30', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 18:11:57', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed425ecca00dd', '30', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 18:12:12', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4266e8b00e0', '30', 'id', 'String', '1', '', '频道id', '1', '2015-07-28 18:12:45', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed426b8f100e2', '30', 'title', 'String', '1', '', '频道名称', '1', '2015-07-28 18:13:04', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed4270a0c00e4', '30', 'type', 'String', '1', '', '频道分类', '1', '2015-07-28 18:13:25', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed42774c200e6', '30', 'pageSize', 'String', '1', '', '每页条数', '1', '2015-07-28 18:13:52', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed427b38000e8', '30', 'pageCount', 'String', '1', '', '页数', '1', '2015-07-28 18:14:09', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed427f7c200ea', '30', 'items', 'List', '1', '', '移动客户端搜索内容（列表）', '1', '2015-07-28 18:14:26', 'admin', '1', '2015-08-06 11:01:24', 'admin', 'SearchContents');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed42e39c40103', '31', 'content', 'String', '1', '', '通知内容', '1', '2015-07-28 18:21:16', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed42e7a240105', '31', 'listUrl', 'String', '1', '', '详细页', '1', '2015-07-28 18:21:33', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed42eadd90107', '31', 'pubDate', 'String', '1', '', '推送时间', '1', '2015-07-28 18:21:46', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed442a8ab0115', '33', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-07-28 18:43:35', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed44407160117', '33', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-07-28 18:45:05', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed448cbe70119', '33', 'pageCount', 'String', '1', '', '页数', '1', '2015-07-28 18:50:17', 'admin', '1', '2015-07-28 18:51:36', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed44997a9011b', '33', 'pageSize', 'String', '1', '', '每页条数', '1', '2015-07-28 18:51:10', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881904ed3d9e3014ed44a7b22011e', '33', 'items', 'List', '1', '', '跟帖列表(所有)', '1', '2015-07-28 18:52:08', 'admin', '1', '2015-08-06 10:26:22', 'admin', 'Invitations');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944ef2f452014ef307b7340001', '51', 'resultCode', 'String', '1', '', '1:收藏成功/取消收藏,0:服务器繁忙', '1', '2015-08-03 18:07:26', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944ef2f452014ef307f1f60003', '51', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-03 18:07:41', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efce2c8320001', '56', 'id', 'String', '1', '', '专题id', '1', '2015-08-05 16:03:18', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efcfb272e0006', '56', 'pageCount', 'String', '1', '1', '页数', '1', '2015-08-05 16:29:55', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efcfb99b10008', '56', 'pageSize', 'String', '1', '10', '每页显示条数', '1', '2015-08-05 16:30:24', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efcffb099000a', '56', 'resultCode', 'String', '1', '', '1:成功,0:失败\r\n', '1', '2015-08-05 16:34:52', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efd001af0000c', '56', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-05 16:35:19', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efd0078bc000e', '56', 'title', 'String', '1', '', '专题名称', '1', '2015-08-05 16:35:43', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efd00ec9d0010', '56', 'content', 'String', '1', '', '专题摘要内容', '1', '2015-08-05 16:36:13', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efd0167940012', '56', 'type', 'String', '1', '', '新闻类型', '1', '2015-08-05 16:36:45', 'admin', '1', '2015-08-05 16:37:35', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efcde19014efd094c450029', '56', 'items', 'List', '1', '', '专题下的新闻内容列表', '1', '2015-08-05 16:45:22', 'admin', '6', '2015-08-05 18:52:40', 'admin', 'Contents');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd8d4ce50008', '55', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-08-05 19:09:33', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd8daa37000a', '55', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-05 19:09:57', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd8e1f4d000c', '55', 'pageCount', 'String', '1', '1', '页数', '1', '2015-08-05 19:10:27', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd8e73da000e', '55', 'pageSize', 'String', '1', '10', '每页显示条数', '1', '2015-08-05 19:10:48', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd8f40330010', '55', 'items', 'List', '1', '', '专题列表', '1', '2015-08-05 19:11:41', 'admin', '1', '2015-08-05 19:19:03', 'admin', 'SimplespecialEntity');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd96bcaf001e', '54', 'resultCode', 'String', '1', '', '1:投稿成功,0:请登录之后投稿', '1', '2015-08-05 19:19:51', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd96f0230020', '54', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-05 19:20:04', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd9865ca0022', '53', 'resultCode', 'String', '1', '', '1:邮件已发送，请登录test01@163.com查看,0:失败', '1', '2015-08-05 19:21:40', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efd98987c0024', '53', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-05 19:21:53', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efda42528002a', '52', 'pageCount', 'String', '1', '1', '页数', '1', '2015-08-05 19:34:30', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efda4720b002c', '52', 'pageSize', 'String', '1', '20', '每页显示条数', '1', '2015-08-05 19:34:50', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efda4b8dd002e', '52', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-08-05 19:35:08', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944efd67b3014efda504490030', '52', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-05 19:35:27', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00a961b50001', '52', '投票列表', 'List', '1', '', '投票列表', '1', '2015-08-06 09:39:05', 'admin', '0', null, null, 'votes');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00c4b7610003', '50', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-08-06 10:08:56', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00c518630005', '50', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-06 10:09:21', 'admin', '1', '2015-08-06 10:09:35', 'admin', '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00c767360009', '47', 'resultCode', 'Integer', '1', '', '1:成功,0:保存失败,3:访问异常', '1', '2015-08-06 10:11:52', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00c7adf1000b', '47', 'resultMessage', 'String', '1', '', '返回信息', '1', '2015-08-06 10:12:10', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00d79e4a0035', '32', 'resultCode', 'String', '1', '', '1:成功,0:失败', '1', '2015-08-06 10:29:35', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00d7e1f90037', '32', 'resultMsg', 'String', '1', '', '返回信息', '1', '2015-08-06 10:29:52', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00d841660039', '32', 'pageSize', 'String', '1', '', '每页条数', '1', '2015-08-06 10:30:17', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00d8745c003b', '32', 'pageCount', 'String', '1', '', '页数', '1', '2015-08-06 10:30:30', 'admin', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('402881944f00a0fc014f00dd10e60047', '32', 'items', 'List', '1', '', '消息通知列表', '1', '2015-08-06 10:35:32', 'admin', '0', null, null, 'mobileMessages');
INSERT INTO `cms_doc_returnvalue` VALUES ('6', '16', '返回组图详细', 'String', '1', '', 'json格式字符串', '1', '2014-07-11 11:08:04', 'zhangxq', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('7', '17', '返回链接详细', 'String', '1', '', 'json格式字符串', '1', '2014-07-11 11:09:36', 'zhangxq', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('8', '18', '返回视频详细', 'String', '1', '', 'json格式字符串', '1', '2014-07-11 11:10:11', 'zhangxq', '0', null, null, '');
INSERT INTO `cms_doc_returnvalue` VALUES ('9', '19', '返回投票详细', 'String', '1', '', 'json格式字符串', '1', '2014-07-11 11:13:39', 'zhangxq', '0', null, null, '');

-- ----------------------------
-- Table structure for cms_doc_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_doc_type`;
CREATE TABLE `cms_doc_type` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '文档分类名称',
  `sort` int(13) DEFAULT NULL COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(13) DEFAULT NULL COMMENT '状态',
  `createdtime` datetime DEFAULT NULL COMMENT '添加时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '添加人',
  `updatecount` int(13) DEFAULT NULL COMMENT '修改次数',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateby` varchar(255) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档分类';

-- ----------------------------
-- Records of cms_doc_type
-- ----------------------------
INSERT INTO `cms_doc_type` VALUES ('2', 'API', '1', '', '1', '2014-06-11 15:00:54', 'liuzhen', '1', '2014-06-11 15:16:44', 'liuzhen');
INSERT INTO `cms_doc_type` VALUES ('3', '标签', '0', '', '1', '2014-06-11 15:16:28', 'liuzhen', '1', '2014-06-11 15:41:33', 'liuzhen');

-- ----------------------------
-- Table structure for cms_email_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_email_log`;
CREATE TABLE `cms_email_log` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `fromMail` varchar(255) DEFAULT NULL COMMENT '发邮件箱',
  `toMail` varchar(255) DEFAULT NULL COMMENT '收邮箱',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `sendTime` datetime DEFAULT NULL COMMENT '时间',
  `op` varchar(100) DEFAULT NULL COMMENT '操作人',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `isResend` int(2) DEFAULT NULL COMMENT '是否重发',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件日志';

-- ----------------------------
-- Records of cms_email_log
-- ----------------------------

-- ----------------------------
-- Table structure for cms_fileno
-- ----------------------------
DROP TABLE IF EXISTS `cms_fileno`;
CREATE TABLE `cms_fileno` (
  `ID` varchar(32) NOT NULL,
  `filenobefore` varchar(32) DEFAULT NULL,
  `filenonum` int(11) DEFAULT NULL,
  `filenotype` varchar(32) DEFAULT NULL,
  `filenoYear` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_fileno
-- ----------------------------

-- ----------------------------
-- Table structure for cms_finance
-- ----------------------------
DROP TABLE IF EXISTS `cms_finance`;
CREATE TABLE `cms_finance` (
  `ID` varchar(32) NOT NULL,
  `APPROFILETYPE` varchar(255) DEFAULT NULL,
  `BUYMONEY` float DEFAULT NULL,
  `BUYPROJECTNO` varchar(255) DEFAULT NULL,
  `BUYPROJECTORG` varchar(255) DEFAULT NULL,
  `BUYUSE` varchar(255) DEFAULT NULL,
  `BUYYEAR` varchar(255) DEFAULT NULL,
  `CATEGORY` varchar(255) DEFAULT NULL,
  `COLLECTORG` varchar(255) DEFAULT NULL,
  `EXPENSEACCOUNT` varchar(255) DEFAULT NULL,
  `HAPPENYEAR` int(11) DEFAULT NULL,
  `MONEYAREA` varchar(255) DEFAULT NULL,
  `MONEYSOURCE` varchar(255) DEFAULT NULL,
  `MONEYTOTAL` float DEFAULT NULL,
  `MONEYUSE` varchar(255) DEFAULT NULL,
  `PAYTIME` datetime DEFAULT NULL,
  `ZBWNO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_finance
-- ----------------------------

-- ----------------------------
-- Table structure for cms_finance_files
-- ----------------------------
DROP TABLE IF EXISTS `cms_finance_files`;
CREATE TABLE `cms_finance_files` (
  `id` varchar(32) NOT NULL,
  `financeId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ij2p74feypwcda4n0n96pyd10` (`financeId`) USING BTREE,
  KEY `FK_28m7vvi0cy5r5keke68b6f7rt` (`id`) USING BTREE,
  CONSTRAINT `cms_finance_files_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cms_attachment` (`ID`),
  CONSTRAINT `cms_finance_files_ibfk_2` FOREIGN KEY (`financeId`) REFERENCES `cms_finance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`id`) REFER `lm_maven_cms/cms_attachment`(`ID`); (`financ';

-- ----------------------------
-- Records of cms_finance_files
-- ----------------------------

-- ----------------------------
-- Table structure for cms_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink`;
CREATE TABLE `cms_friendlink` (
  `id` varchar(32) NOT NULL,
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `gid` varchar(32) DEFAULT NULL COMMENT '类别id',
  `site_name` varchar(150) DEFAULT NULL COMMENT '网站名称',
  `domain` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `site_email` varchar(100) DEFAULT NULL COMMENT '站点邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) DEFAULT '10' COMMENT '排列顺序',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of cms_friendlink
-- ----------------------------
INSERT INTO `cms_friendlink` VALUES ('1', '1', '1', '雷铭科技', 'http://www.leimingtech.com', '', null, '', '0', '1', '0', null);
INSERT INTO `cms_friendlink` VALUES ('2', '1', '1', '百度', 'http://www.baidu.com', '', '', '', '0', '1', '0', null);
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43f5b7aa0005', '1', '1', '新浪', 'http://www.sina.com.cn/', '', '', '', '0', '1', '0', '2015-06-30 18:14:13');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43f812ee0007', '1', '1', '搜狐', 'http://www.sohu.com/', '', '', '', '0', '1', '0', '2015-06-30 18:16:48');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43f934270009', '1', '1', '网易', 'http://www.163.com/', '', '', '', '0', '1', '0', '2015-06-30 18:18:02');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43f98c96000b', '1', '1', '凤凰网', 'http://www.ifeng.com/', '', '', '', '0', '1', '0', '2015-06-30 18:18:24');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43fa4eaa000d', '1', '1', '携程旅行', 'http://www.ctrip.com/', '', '', '', '0', '1', '0', '2015-06-30 18:19:14');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43faf629000f', '1', '1', '12306官网', 'http://www.12306.cn/mormhweb/', '', '', '', '0', '1', '0', '2015-06-30 18:19:57');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43fb8eb00011', '1', '1', '人民网', 'http://www.people.com.cn/', '', '', '', '0', '1', '0', '2015-06-30 18:20:36');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e43fbe1e50013', '1', '1', '新华网', 'http://www.xinhuanet.com/', '', '', '', '0', '1', '0', '2015-06-30 18:20:57');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e44035581001b', '1', '1', '腾讯', 'http://www.qq.com/', '', '', '', '0', '1', '0', '2015-06-30 18:29:06');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440456ba001d', '1', '1', '太平洋电脑', 'http://www.pconline.com.cn/', '', '', '', '0', '1', '0', '2015-06-30 18:30:11');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440537f6001f', '1', '1', '世纪佳缘', 'http://reg.jiayuan.com/landing_page_new.php', '', '', '', '0', '1', '0', '2015-06-30 18:31:09');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440610280021', '1', '1', '同程旅游', 'http://www.ly.com/', '', '', '', '0', '1', '0', '2015-06-30 18:32:04');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440690a40023', '1', '1', '中关村在线', 'http://www.zol.com.cn/', '', '', '', '0', '1', '0', '2015-06-30 18:32:37');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440848bb0025', '1', '1', '汽车之家', 'http://www.autohome.com.cn/', '', '', '', '0', '1', '0', '2015-06-30 18:34:30');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4408c0010027', '1', '402881864e43edda014e43f4c12d0003', '易车网', 'http://beijing.bitauto.com/', '', '', '', '0', '1', '0', '2015-06-30 18:35:00');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440953fc0029', '1', '1', '太平洋汽车', 'http://beijing.bitauto.com/', '', '', '', '0', '1', '0', '2015-06-30 18:35:38');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440b7e03002b', '1', '1', '安居客', 'http://beijing.anjuke.com/', '', '', '', '0', '1', '0', '2015-06-30 18:38:00');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440cb760002d', '1', '402881864e43edda014e43f4c12d0003', '折800', 'http://www.zhe800.com/', '', '', '', '0', '1', '0', '2015-06-30 18:39:20');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e440dcda2002f', '1', '1', '美拍', 'http://www.meipai.com/', '', '', '', '0', '1', '0', '2015-06-30 18:40:32');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e442a8c150031', '1', '1', '央视网', 'http://www.cntv.cn/index.shtml', '', '', '', '0', '1', '0', '2015-06-30 19:11:55');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e442afde30033', '1', '1', '赶集网', 'http://www.ganji.com/', '', '', '', '0', '1', '0', '2015-06-30 19:12:25');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e442d79cc0035', '1', '1', '当当网', 'http://www.dangdang.com/', '', '', '', '0', '1', '0', '2015-06-30 19:15:07');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e442df37e0037', '1', '1', '途牛旅游网', 'http://www.tuniu.com/', '', '', '', '0', '1', '0', '2015-06-30 19:15:39');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e442e7c410039', '1', '1', '1号店', 'http://www.yhd.com/', '', '', '', '0', '1', '0', '2015-06-30 19:16:14');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e442f700f003d', '1', '1', '真爱婚恋网', ' http://www.zhenai.com/901438.html', '', '', '', '0', '1', '0', '2015-06-30 19:17:16');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e44300089003f', '1', '1', '梦芭莎', 'http://www.moonbasa.com/', '', '', '', '0', '1', '0', '2015-06-30 19:17:53');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e443139e80041', '1', '1', '艺龙网', 'http://www.elong.com/', '', '', '', '0', '1', '0', '2015-06-30 19:19:13');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4431909d0043', '1', '1', '去哪儿网', 'http://www.qunar.com/', '', '', '', '0', '1', '0', '2015-06-30 19:19:35');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4434d5ed0045', '1', '1', '特价机票', 'http://flights.ctrip.com/', '', '', '', '0', '1', '0', '2015-06-30 19:23:10');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e44355d0f0047', '1', '1', '美团网', 'http://www.meituan.com/', '', '', '', '0', '1', '0', '2015-06-30 19:23:44');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4435f6c90049', '1', '1', '猎聘网', 'http://www.liepin.com/', '', '', '', '0', '1', '0', '2015-06-30 19:24:24');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4437b4ac004b', '1', '1', '壹药网', 'http://www.liepin.com/', '', '', '', '0', '1', '0', '2015-06-30 19:26:18');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e44382365004d', '1', '1', '陆金所理财', 'https://promo.lufax.com/', '', '', '', '0', '1', '0', '2015-06-30 19:26:46');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e443898bd004f', '1', '1', '六间房', 'http://www.6.cn/', '', '', '', '0', '1', '0', '2015-06-30 19:27:16');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4439f5270051', '1', '1', '人人贷理财', 'http://www.renrendai.com/', '', '', '', '0', '1', '0', '2015-06-30 19:28:45');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e4442e6670053', '1', '402881864e43edda014e43f46ac30001', '聚划算', 'http://ju.taobao.com/', '', '', '', '0', '1', '0', '2015-06-30 19:38:31');
INSERT INTO `cms_friendlink` VALUES ('402881864e43edda014e444585d50057', '1', '402881864e43edda014e43f46ac30001', '优酷', 'http://www.youku.com/', '', '', '', '0', '1', '0', '2015-06-30 19:41:23');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e477f23980001', '1', '402881864e43edda014e43f46ac30001', '土豆', 'http://www.tudou.com/', '', '', '', '0', '1', '0', '2015-07-01 10:43:11');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e478007120003', '1', '402881864e43edda014e43f46ac30001', '360影视', 'http://www.360kan.com/', '', '', '', '0', '1', '0', '2015-07-01 10:44:09');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e4780bbf40005', '1', '402881864e43edda014e43f46ac30001', '酷狗音乐', 'http://www.kugou.com/', '', '', '', '0', '1', '0', '2015-07-01 10:44:55');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e478149c00007', '1', '402881864e43edda014e43f46ac30001', '乐视网', 'http://www.letv.com/', '', '', '', '0', '1', '0', '2015-07-01 10:45:32');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e478344220009', '1', '402881864e43edda014e43f46ac30001', '中国网', 'http://www.china.com.cn/', '', '', '', '0', '1', '0', '2015-07-01 10:47:41');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e47840668000b', '1', '402881864e43edda014e43f46ac30001', '环球', 'http://www.huanqiu.com/', '', '', '', '0', '1', '0', '2015-07-01 10:48:31');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e4784b636000d', '1', '402881864e43edda014e43f46ac30001', '东方财富网', 'http://www.eastmoney.com/', '', '', '', '0', '1', '0', '2015-07-01 10:49:16');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e47850149000f', '1', '402881864e43edda014e43f46ac30001', '爱投资', 'http://www.itouzi.com/', '', '', '', '0', '1', '0', '2015-07-01 10:49:35');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e4785583e0011', '1', '402881864e43edda014e43f46ac30001', '证券之星', 'http://www.stockstar.com/', '', '', '', '0', '1', '0', '2015-07-01 10:49:58');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e4785dbc70013', '1', '402881864e43edda014e43f46ac30001', '百合网', 'http://www.baihe.com/', '', '', '', '0', '1', '0', '2015-07-01 10:50:31');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e478631f60015', '1', '402881864e43edda014e43f46ac30001', '非诚勿扰', 'http://fcwr.jstv.com/', '', '', '', '0', '1', '0', '2015-07-01 10:50:53');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e478693c60017', '1', '402881864e43edda014e43f4c12d0003', '京东', 'http://www.jd.com/', '', '', '', '0', '1', '0', '2015-07-01 10:51:18');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e47871adc0019', '1', '402881864e43edda014e43f4c12d0003', '顺丰优选', 'http://www.sfbest.com/', '', '', '', '0', '1', '0', '2015-07-01 10:51:53');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e47876340001b', '1', '402881864e43edda014e43f4c12d0003', '国美在线', 'http://www.gome.com.cn/', '', '', '', '0', '1', '0', '2015-07-01 10:52:11');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e4787e180001d', '1', '402881864e43edda014e43f4c12d0003', '唯品会', 'http://www.vip.com/', '', '', '', '0', '1', '0', '2015-07-01 10:52:44');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e47883a4d001f', '1', '402881864e43edda014e43f4c12d0003', '苏宁易购', 'http://www.suning.com/', '', '', '', '0', '1', '0', '2015-07-01 10:53:07');
INSERT INTO `cms_friendlink` VALUES ('402881864e4742c3014e478a6f490021', '1', '402881864e43edda014e43f4c12d0003', '360购物', 'http://gouwu.360.cn/', '', '', '', '0', '1', '0', '2015-07-01 10:55:31');

-- ----------------------------
-- Table structure for cms_friendlink_ctg
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink_ctg`;
CREATE TABLE `cms_friendlink_ctg` (
  `id` varchar(32) NOT NULL,
  `site_id` varchar(32) DEFAULT NULL COMMENT '点站id',
  `friendlinkctg_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `priority` int(11) DEFAULT '10' COMMENT '排列顺序',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of cms_friendlink_ctg
-- ----------------------------
INSERT INTO `cms_friendlink_ctg` VALUES ('1', '1', '媒体合作', '0', null);
INSERT INTO `cms_friendlink_ctg` VALUES ('402881864e43edda014e43f46ac30001', '1', '网址导航', '0', '2015-06-30 18:12:48');
INSERT INTO `cms_friendlink_ctg` VALUES ('402881864e43edda014e43f4c12d0003', '1', '友情链接', '0', '2015-06-30 18:13:10');

-- ----------------------------
-- Table structure for cms_function
-- ----------------------------
DROP TABLE IF EXISTS `cms_function`;
CREATE TABLE `cms_function` (
  `ID` varchar(32) NOT NULL,
  `functioniframe` smallint(6) DEFAULT NULL,
  `functionlevel` smallint(6) DEFAULT NULL,
  `functionname` varchar(50) NOT NULL,
  `functionorder` varchar(255) DEFAULT '0',
  `functionurl` varchar(100) DEFAULT NULL,
  `parentfunctionid` varchar(32) DEFAULT NULL,
  `iconclass` varchar(32) DEFAULT NULL,
  `privurl` varchar(1000) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  `pathids` varchar(255) DEFAULT NULL COMMENT '所有父节点id,包含当前id',
  `parentids` varchar(255) DEFAULT NULL COMMENT '所有父节点id',
  PRIMARY KEY (`ID`),
  KEY `FK_brd7b3keorj8pmxcv8bpahnxp` (`parentfunctionid`) USING BTREE,
  KEY `FK_q5tqo3v4ltsp1pehdxd59rccx` (`iconclass`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_function
-- ----------------------------
INSERT INTO `cms_function` VALUES ('297ebc2d4fc9ea43014fd44b26dc0007', null, '1', '活动表单字段管理', '110', 'activityOptionController.do?activityOptionForm', '402881ea452582c101452583a4900018', 'icon-folder-close', null, '2015-09-16 11:55:39', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a6fd98670003', null, '1', '文档管理', '110', '#', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', null, '2015-10-27 09:50:48', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a6fddc530005', null, '1', '文档引用实体列表', '110', 'docEnController.do?docEn', '297ebc2d50a21ef70150a6fd98670003', 'icon-folder-close', null, '2015-10-27 09:51:06', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a6fe1d880007', null, '1', '文档', '110', 'docController.do?doc', '297ebc2d50a21ef70150a6fd98670003', 'icon-folder-close', null, '2015-10-27 09:51:23', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a6ff40860015', null, '1', '会员管理', '110', '#', '402881ea452582c101452583a4900018', 'icon-folder-close', null, '2015-10-27 09:52:37', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a6ffbf150017', null, '1', '会员等级', '110', 'memberGroupController.do?memberGroup', '297ebc2d50a21ef70150a6ff40860015', 'icon-folder-close', null, '2015-10-27 09:53:09', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a6fffe9a0019', null, '1', '会员', '110', 'memberController.do?member', '297ebc2d50a21ef70150a6ff40860015', 'icon-folder-close', null, '2015-10-27 09:53:26', null, null);
INSERT INTO `cms_function` VALUES ('297ebc2d50a21ef70150a82162020081', null, '1', '一键抓取规则管理', '110', 'contentExtractoruleController.do?contentExtractorule', '402882494abd18ea014abd2ffaa00007', 'icon-folder-close', null, '2015-10-27 15:09:31', null, null);
INSERT INTO `cms_function` VALUES ('40286aea4d8dd595014d8df556f90002', null, '1', '文件管理', '110', 'fileController.do?file', '402882494abd18ea014abd2ffaa00007', 'icon-folder-close', null, null, '0,402882494abd18ea014abd2ffaa00007,40286aea4d8dd595014d8df556f90002,', '0,402882494abd18ea014abd2ffaa00007,');
INSERT INTO `cms_function` VALUES ('402881834e1f2952014e1f7c4a4e0003', null, '1', '日志管理', '110', '#', '402881ea452582c101452583a4950019', 'icon-folder-close', null, '2015-06-23 16:15:16', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881834e1f2952014e1f7cb22b0005', null, '1', '系统日志', '110', 'logsController.do?log', '402881834e1f2952014e1f7c4a4e0003', 'icon-folder-close', null, '2015-06-23 16:15:42', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,402881834e1f2952014e1f7cb22b0005,', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,');
INSERT INTO `cms_function` VALUES ('402881834e1fd70e014e1ffdcba60007', null, '1', '邮件日志', '110', 'emailLogController.do?table', '402881834e1f2952014e1f7c4a4e0003', 'icon-folder-close', null, '2015-06-23 18:36:43', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,402881834e1fd70e014e1ffdcba60007,', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,');
INSERT INTO `cms_function` VALUES ('402881834e1fd70e014e200111cf000a', null, '1', '短信日志', '110', 'smsLogController.do?table', '402881834e1f2952014e1f7c4a4e0003', 'icon-folder-close', null, '2015-06-23 18:40:17', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,402881834e1fd70e014e200111cf000a,', '0,402881ea452582c101452583a4950019,402881834e1f2952014e1f7c4a4e0003,');
INSERT INTO `cms_function` VALUES ('402881834e2016fd014e201c64870011', null, '1', '统计管理', '110', '#', '402881ea452582c101452583a4900018', 'icon-folder-close', null, '2015-06-23 19:10:08', '0,402881ea452582c101452583a4900018,402881834e2016fd014e201c64870011,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881834e2016fd014e201cc33b0013', null, '1', '内容统计', '110', 'contentStatisticController.do?toQuery', '402881834e2016fd014e201c64870011', 'icon-folder-close', null, '2015-06-23 19:10:32', '0,402881ea452582c101452583a4900018,402881834e2016fd014e201c64870011,402881834e2016fd014e201cc33b0013,', '0,402881ea452582c101452583a4900018,402881834e2016fd014e201c64870011,');
INSERT INTO `cms_function` VALUES ('402881834e2016fd014e202d339d0017', null, '1', '留言统计', '110', 'statisticsController.do?messagesStatistics', '402881834e2016fd014e201c64870011', 'icon-folder-close', null, '2015-06-23 19:28:30', null, null);
INSERT INTO `cms_function` VALUES ('402881834e2016fd014e203215af001a', null, '1', '栏目统计', '110', 'contentStatisticsController.do?contentCatTree', '402881834e2016fd014e201c64870011', 'icon-folder-close', null, '2015-06-23 19:33:50', null, null);
INSERT INTO `cms_function` VALUES ('402881834e2016fd014e2033453b001d', null, '1', '人员统计', '110', 'personnelStatisticsController.do?deptTree', '402881834e2016fd014e201c64870011', 'icon-folder-close', null, '2015-06-23 19:35:07', null, null);
INSERT INTO `cms_function` VALUES ('402881834e2016fd014e20345b870020', null, '1', '会员统计', '110', 'statisticsController.do?memberStatistics', '402881834e2016fd014e201c64870011', 'icon-folder-close', null, '2015-06-23 19:36:19', null, null);
INSERT INTO `cms_function` VALUES ('402881844be78aa0014be8bd1b6e0017', null, '1', '广告栏位管理', '110', 'advertisingSpaceController.do?advertisingSpace', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', '', null, '0,402881e74582ea28014582eb4cd30001,402881844be78aa0014be8bd1b6e0017,', '0,402881e74582ea28014582eb4cd30001,');
INSERT INTO `cms_function` VALUES ('402881844be78aa0014be8cb6ad20021', null, '1', '友情链接分类', '110', 'friendLinkCtgController.do?friendLinkCtg', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', null, null, '0,402881e74582ea28014582eb4cd30001,402881844be78aa0014be8cb6ad20021,', '0,402881e74582ea28014582eb4cd30001,');
INSERT INTO `cms_function` VALUES ('402881844be78aa0014be8cbcd180023', null, '1', '友情链接', '110', 'friendLinkController.do?friendLink', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', null, null, '0,402881e74582ea28014582eb4cd30001,402881844be78aa0014be8cbcd180023,', '0,402881e74582ea28014582eb4cd30001,');
INSERT INTO `cms_function` VALUES ('402881844bfc6acc014bfc6f5a0a0001', null, '1', '大转盘', '110', 'wxLotteryController.do?table', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', null, null, '0,402881e74582ea28014582eb4cd30001,402881844bfc6acc014bfc6f5a0a0001,', '0,402881e74582ea28014582eb4cd30001,');
INSERT INTO `cms_function` VALUES ('402881844c013ebe014c015d7cce0001', null, '1', '砸金蛋', '110', 'wxLotteryController.do?jindan', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', null, null, '0,402881e74582ea28014582eb4cd30001,402881844c013ebe014c015d7cce0001,', '0,402881e74582ea28014582eb4cd30001,');
INSERT INTO `cms_function` VALUES ('402881844c2a7615014c2aa2a76d0002', null, '1', '审核流程', '110', 'workFlowController.do?workFlow', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881844c2a7615014c2aa2a76d0002,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('4028818d518af2d101518af95ed50007', null, '1', '微信设置', '110', 'wechatConfigureController.do?add', '402881e74582ea28014582eb4cd30001', 'icon-comments', null, '2015-12-10 16:19:37', null, null);
INSERT INTO `cms_function` VALUES ('4028818d518af2d101518af9f4ea0009', null, '1', '微信发布管理', '110', 'weChatPushController.do?weChatPush', '402881e74582ea28014582eb4cd30001', 'icon-comments', null, '2015-12-10 16:20:15', null, null);
INSERT INTO `cms_function` VALUES ('4028818d518b0bef01518b0e323c0003', null, '1', '微博设置', '110', 'sinaWeiboController.do?sinaWeibo', '402881e74582ea28014582eb4cd30001', 'icon-weibo', null, '2015-12-10 16:42:22', null, null);
INSERT INTO `cms_function` VALUES ('4028818d518b0bef01518b0eca300005', null, '1', '微博发布管理', '110', 'sinaContentController.do?sinaContent', '402881e74582ea28014582eb4cd30001', 'icon-weibo', null, '2015-12-10 16:43:01', null, null);
INSERT INTO `cms_function` VALUES ('402881954c502041014c5033eef30004', null, '1', '数据采集管理', '110', '#', '402882494abd18ea014abd2ffaa00007', 'icon-folder-close', null, null, '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,', '0,402882494abd18ea014abd2ffaa00007,');
INSERT INTO `cms_function` VALUES ('402881954c502041014c503445a00006', null, '1', '采集信息', '110', 'acquisitionContentController.do?table', '402881954c502041014c5033eef30004', 'icon-folder-close', null, null, '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,402881954c502041014c503445a00006,', '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,');
INSERT INTO `cms_function` VALUES ('402881954c502041014c50347e3d0008', null, '1', '采集管理', '110', 'acquisitionController.do?table', '402881954c502041014c5033eef30004', 'icon-folder-close', null, null, '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,402881954c502041014c50347e3d0008,', '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,');
INSERT INTO `cms_function` VALUES ('402881954c502041014c5034c513000a', null, '1', '采集历史记录', '110', 'acquisitionHistoryController.do?table', '402881954c502041014c5033eef30004', 'icon-folder-close', null, null, '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,402881954c502041014c5034c513000a,', '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,');
INSERT INTO `cms_function` VALUES ('402881954c502041014c50350198000c', null, '1', '查看采集进度', '110', 'acquisitionTempController.do?table', '402881954c502041014c5033eef30004', 'icon-folder-close', null, null, '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,402881954c502041014c50350198000c,', '0,402882494abd18ea014abd2ffaa00007,402881954c502041014c5033eef30004,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9da742200001', null, '1', '定时任务', '110', 'lmTimeTaskController.do?timeTask', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881984d9d87f8014d9da742200001,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9da8f7610005', null, '1', '来源管理', '110', 'sourceController.do?table', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9da8f7610005,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9daa1cb60007', null, '1', '自定义属性', '110', 'custormController.do?custorm', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9daa1cb60007,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dac1e730009', null, '1', '意见反馈', '110', 'feedbackController.do?feedback', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dac1e730009,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dad8cbe000b', null, '1', '版本更新', '110', 'updateVersionController.do?updateVersion', '402881e447f219ca0147f2a04e3100e4', 'icon-folder-close', null, null, '0,402881e447f219ca0147f2a04e3100e4,402881984d9d87f8014d9dad8cbe000b,', '0,402881e447f219ca0147f2a04e3100e4,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dba4460000d', null, '1', 'Tag管理', '110', 'contentTagController.do?table', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dba4460000d,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc482f4000f', null, '1', '关键词管理', '110', 'cmsKeywordController.do?table', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881984d9d87f8014d9dc482f4000f,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc502c90011', null, '1', '敏感词管理', '110', 'sensitivityController.do?table', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881984d9d87f8014d9dc502c90011,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc5a4c70013', null, '1', '方案设置', '110', 'moodController.do?table', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dc5a4c70013,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc6ad490015', null, '1', '地域管理', '110', 'territoryController.do?territory', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881984d9d87f8014d9dc6ad490015,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc8ed6f0019', null, '1', '收藏管理', '110', 'favoritesController.do?favorites', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dc8ed6f0019,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc934e0001b', null, '1', '留言管理', '110', 'messagesController.do?messageslist', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dc934e0001b,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dc9e0b2001d', null, '1', '短信设置', '110', 'noteController.do?table', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881984d9d87f8014d9dc9e0b2001d,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dca4728001f', null, '1', '邮箱设置', '110', 'mailController.do?table', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881984d9d87f8014d9dca4728001f,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dcb33110021', null, '1', '水印方案', '110', 'waterMarkController.do?table', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dcb33110021,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881984d9d87f8014d9dcbaaf80023', null, '1', 'wap设置', '110', 'wapconfigController.do?update', '402881ea452582c101452583a4900018', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4900018,402881984d9d87f8014d9dcbaaf80023,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881e447f219ca0147f2a04e3100e4', null, '0', 'APP管理', '600', '', null, 'icon-compass', '', null, '0,402881e447f219ca0147f2a04e3100e4,', '0,');
INSERT INTO `cms_function` VALUES ('402881e546d12b630146d12e4c5d0006', null, '0', '移动内容', '200', 'contentsMobileController.do?contentsTree', null, 'icon-folder-close', '', null, '0,402881e546d12b630146d12e4c5d0006,', '0,');
INSERT INTO `cms_function` VALUES ('402881e74582ea28014582eb4cd30001', null, '0', '扩展功能', '700', '', null, 'icon-folder-close', '', null, '0,402881e74582ea28014582eb4cd30001,', '0,');
INSERT INTO `cms_function` VALUES ('402881e74588db55014588e0ce320001', null, '0', '内容管理', '100', 'contentsController.do?contentsTree', null, 'icon-folder-close', '', null, '0,402881e74588db55014588e0ce320001,', '0,');
INSERT INTO `cms_function` VALUES ('402881e74588fc66014588fd533c0001', null, '0', '页面', '210', 'sectionClassController.do?sectionClassTree', null, 'icon-folder-close', '', null, '0,402881e74588fc66014588fd533c0001,', '0,');
INSERT INTO `cms_function` VALUES ('402881e845feaa710145feae8b8e0001', null, '1', '全局设置', '100', '#', '402881e74582ea28014582eb4cd30001', 'icon-folder-close', '', null, '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,', '0,402881e74582ea28014582eb4cd30001,');
INSERT INTO `cms_function` VALUES ('402881e845feaa710145feaf1c320003', null, '1', '配置列表', '100', 'pfConfigController.do?table', '402881e845feaa710145feae8b8e0001', 'icon-folder-close', '', null, '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,402881e845feaa710145feaf1c320003,', '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,');
INSERT INTO `cms_function` VALUES ('402881e845feb6800145fec62b0d0004', null, '1', '邮件设置', '100', 'configSettingController.do?mailSetting', '402881e845feaa710145feae8b8e0001', 'icon-folder-close', '', null, '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,402881e845feb6800145fec62b0d0004,', '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,');
INSERT INTO `cms_function` VALUES ('402881e847ce04630147ce5781990003', null, '1', '移动栏目管理', '103', 'mobileChannelController.do?mobileChannel', '402881ea452582c101452583a4900018', 'icon-compass', '', null, '0,402881ea452582c101452583a4900018,402881e847ce04630147ce5781990003,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881e947f353c80147f358289f0003', null, '1', '启动画面广告', '140', 'advertisemenStartingController.do?advertisemenStarting', '402881e447f219ca0147f2a04e3100e4', 'icon-folder-close', '', null, '0,402881e447f219ca0147f2a04e3100e4,402881e947f353c80147f358289f0003,', '0,402881e447f219ca0147f2a04e3100e4,');
INSERT INTO `cms_function` VALUES ('402881e947f353c80147f359a16b0007', null, '1', '内容页广告', '150', 'advertisemenContentController.do?advertisemenContent', '402881e447f219ca0147f2a04e3100e4', 'icon-folder-close', '', null, '0,402881e447f219ca0147f2a04e3100e4,402881e947f353c80147f359a16b0007,', '0,402881e447f219ca0147f2a04e3100e4,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4900018', null, '0', '网站管理', '800', '', null, 'icon-folder-close', '', null, '0,402881ea452582c101452583a4900018,', '0,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4950019', null, '0', '系统管理', '950', '', null, 'icon-won', '', null, '0,402881ea452582c101452583a4950019,', '0,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4a1001d', null, '1', '用户管理', '160', 'metroUserController.do?table', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881ea452582c101452583a4a1001d,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4a5001e', null, '1', '角色管理', '157', 'roleController.do?role', '402881ea452582c101452583a4950019', 'icon-folder-close', '', null, '0,402881ea452582c101452583a4950019,402881ea452582c101452583a4a5001e,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4a7001f', null, '1', '菜单管理', '180', 'menuController.do?menu', '402881ea452582c101452583a4950019', 'icon-sitemap', '', null, '0,402881ea452582c101452583a4950019,402881ea452582c101452583a4a7001f,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4ab0020', null, '1', '数据字典', '190', 'systemAction.do?typeGroupList', '402881ea452582c101452583a4950019', 'icon-folder-close', null, null, '0,402881ea452582c101452583a4950019,402881ea452582c101452583a4ab0020,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881ea452582c101452583a4b00022', null, '1', '部门管理', '155', 'departAction.do?list', '402881ea452582c101452583a4950019', 'icon-folder-close', '', null, '0,402881ea452582c101452583a4950019,402881ea452582c101452583a4b00022,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402881ec46030652014603157d490002', null, '1', '短信配置', '100', 'configSettingController.do?smsSetting', '402881e845feaa710145feae8b8e0001', 'icon-folder-close', '', null, '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,402881ec46030652014603157d490002,', '0,402881e74582ea28014582eb4cd30001,402881e845feaa710145feae8b8e0001,');
INSERT INTO `cms_function` VALUES ('402881ee4582238c01458225cddd0001', null, '1', 'PC栏目管理', '102', 'contentCatController.do?contentCat', '402881ea452582c101452583a4900018', 'icon-folder-close', '', null, '0,402881ea452582c101452583a4900018,402881ee4582238c01458225cddd0001,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402881f345729652014572973b500001', null, '1', '站点管理', '260', 'siteController.do?table', '402881ea452582c101452583a4950019', 'icon-folder-close', 'siteController.do?table', null, '0,402881ea452582c101452583a4950019,402881f345729652014572973b500001,', '0,402881ea452582c101452583a4950019,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd2ffaa00007', null, '0', '全媒体库', '300', '', null, 'icon-folder-close', '', null, '0,402882494abd18ea014abd2ffaa00007,', '0,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd30473a0009', null, '1', '图片库', '110', 'attachPictureController.do?table', '402882494abd18ea014abd2ffaa00007', 'icon-folder-close', '', null, '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd30473a0009,', '0,402882494abd18ea014abd2ffaa00007,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd3077cb000b', null, '1', '视频管理', '120', '#', '402882494abd18ea014abd2ffaa00007', 'icon-folder-close', '', null, '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,', '0,402882494abd18ea014abd2ffaa00007,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd3fd7270019', null, '1', '视频库', '110', 'videoSourcesController.do?table', '402882494abd18ea014abd3077cb000b', 'icon-folder-close', '', null, '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,402882494abd18ea014abd3fd7270019,', '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd4008e0001b', null, '1', '视频专辑', '120', 'videoalburmController.do?videoalburm', '402882494abd18ea014abd3077cb000b', 'icon-folder-close', '', null, '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,402882494abd18ea014abd4008e0001b,', '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd403750001d', null, '1', '视频广告', '130', 'videoadvController.do?add', '402882494abd18ea014abd3077cb000b', 'icon-folder-close', '', null, '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,402882494abd18ea014abd403750001d,', '0,402882494abd18ea014abd2ffaa00007,402882494abd18ea014abd3077cb000b,');
INSERT INTO `cms_function` VALUES ('402882494abd18ea014abd4c6adf003d', null, '1', '评论管理', '110', 'commentaryController.do?commentaryList', '402881e447f219ca0147f2a04e3100e4', 'icon-folder-close', '', null, '0,402881e447f219ca0147f2a04e3100e4,402882494abd18ea014abd4c6adf003d,', '0,402881e447f219ca0147f2a04e3100e4,');
INSERT INTO `cms_function` VALUES ('402882494b149795014b15cdf20f000f', null, '1', '专题管理', '111', 'simplespecialController.do?simplespecial', '402881ea452582c101452583a4900018', 'icon-folder-close', '', null, '0,402881ea452582c101452583a4900018,402882494b149795014b15cdf20f000f,', '0,402881ea452582c101452583a4900018,');
INSERT INTO `cms_function` VALUES ('402882494b33c31b014b33ec213b0002', null, '1', '评论管理', '104', ' 	invitationMobileController.do?invitationMobile', '402881ea452582c101452583a4900018', 'icon-folder-close', '', null, '0,402881ea452582c101452583a4900018,402882494b33c31b014b33ec213b0002,', '0,402881ea452582c101452583a4900018,');

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `messagePerson` varchar(255) DEFAULT NULL COMMENT '留言人',
  `personId` int(11) DEFAULT NULL COMMENT '留言人id',
  `messageTime` datetime DEFAULT NULL COMMENT '留言时间',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `cellphone` varchar(255) DEFAULT NULL COMMENT '手机',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for cms_icon
-- ----------------------------
DROP TABLE IF EXISTS `cms_icon`;
CREATE TABLE `cms_icon` (
  `ID` varchar(32) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `iconclas` varchar(200) DEFAULT NULL,
  `content` blob,
  `name` varchar(100) NOT NULL,
  `path` longtext,
  `type` smallint(6) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_icon
-- ----------------------------

-- ----------------------------
-- Table structure for cms_interview
-- ----------------------------
DROP TABLE IF EXISTS `cms_interview`;
CREATE TABLE `cms_interview` (
  `id` varchar(32) NOT NULL COMMENT '访谈id',
  `contentid` mediumint(8) DEFAULT NULL COMMENT '内容ID',
  `interview_issue` varchar(255) DEFAULT NULL COMMENT '期号',
  `interview_state` varchar(255) DEFAULT NULL COMMENT '访谈状态',
  `interview_introduce` varchar(255) DEFAULT NULL COMMENT '访谈介绍',
  `interview_way` varchar(255) DEFAULT NULL COMMENT '访谈方式',
  `interview_picture` varchar(255) DEFAULT NULL COMMENT '访谈图片',
  `interview_startTime` datetime DEFAULT NULL COMMENT '访谈开始时间',
  `interview_endTime` datetime DEFAULT NULL COMMENT '访谈结束时间',
  `interview_place` varchar(255) DEFAULT NULL COMMENT '访谈地点',
  `interview_compere` varchar(255) DEFAULT NULL COMMENT '主持人',
  `custom_model` varchar(255) DEFAULT NULL COMMENT '自定义模板',
  `netfriend_speak` varchar(255) DEFAULT NULL COMMENT '网友发言',
  `visitor_speak` varchar(255) DEFAULT NULL COMMENT '游客发言',
  `speak_check` varchar(255) DEFAULT NULL COMMENT '发言审核',
  `speak_startTime` datetime DEFAULT NULL COMMENT '发言开始时间',
  `speak_endTime` datetime DEFAULT NULL COMMENT '发言结束时间',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访谈表';

-- ----------------------------
-- Records of cms_interview
-- ----------------------------

-- ----------------------------
-- Table structure for cms_interview_guest
-- ----------------------------
DROP TABLE IF EXISTS `cms_interview_guest`;
CREATE TABLE `cms_interview_guest` (
  `guestid` varchar(32) NOT NULL COMMENT '嘉宾id',
  `interviewid` varchar(255) DEFAULT NULL COMMENT '访谈ID',
  `guest_name` varchar(255) DEFAULT NULL COMMENT '嘉宾姓名',
  `guest_url` varchar(255) DEFAULT NULL COMMENT '嘉宾介绍网址',
  `guest_introduce` varchar(255) DEFAULT NULL COMMENT '嘉宾介绍',
  `guest_picture` varchar(255) DEFAULT NULL COMMENT '嘉宾图片',
  `guest_token` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`guestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访谈嘉宾表';

-- ----------------------------
-- Records of cms_interview_guest
-- ----------------------------

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` varchar(32) NOT NULL COMMENT '链接id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `linkname` varchar(255) DEFAULT NULL COMMENT '链接名称',
  `linkurl` varchar(4000) DEFAULT NULL COMMENT '链接url',
  `linkremark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `site_id` int(32) DEFAULT NULL COMMENT '点站id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of cms_link
-- ----------------------------

-- ----------------------------
-- Table structure for cms_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_log`;
CREATE TABLE `cms_log` (
  `ID` varchar(32) NOT NULL,
  `broswer` varchar(100) DEFAULT NULL,
  `logcontent` longtext NOT NULL,
  `loglevel` smallint(6) DEFAULT NULL,
  `note` longtext,
  `operatetime` datetime NOT NULL,
  `operatetype` smallint(6) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `FK_oe64k4852uylhyc5a00rfwtay` (`userid`) USING BTREE,
  CONSTRAINT `cms_log_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`userid`) REFER `lm_maven_cms/cms_user`(`id`)';

-- ----------------------------
-- Records of cms_log
-- ----------------------------

-- ----------------------------
-- Table structure for cms_lottery
-- ----------------------------
DROP TABLE IF EXISTS `cms_lottery`;
CREATE TABLE `cms_lottery` (
  `id` varchar(32) NOT NULL,
  `joinnum` int(11) DEFAULT NULL COMMENT '参与人数',
  `click` int(11) DEFAULT NULL,
  `token` varchar(30) DEFAULT NULL,
  `keyword` varchar(10) DEFAULT NULL COMMENT '键关词',
  `starpicurl` varchar(255) DEFAULT NULL COMMENT '填写活动开始图片网址',
  `title` varchar(60) DEFAULT NULL COMMENT '活动名称',
  `txt` varchar(60) DEFAULT NULL COMMENT '用户输入兑奖时候的显示信息',
  `sttxt` varchar(200) DEFAULT NULL COMMENT '简介',
  `statdate` datetime DEFAULT NULL COMMENT '活动开始时间',
  `enddate` datetime DEFAULT NULL COMMENT '活动结束时间',
  `info` varchar(200) DEFAULT NULL COMMENT '活动说明',
  `aginfo` varchar(200) DEFAULT NULL COMMENT '重复抽奖回复',
  `endtite` varchar(60) DEFAULT NULL COMMENT '活动结束公告主题',
  `endpicurl` varchar(255) DEFAULT NULL,
  `endinfo` varchar(60) DEFAULT NULL,
  `fist` varchar(50) DEFAULT NULL COMMENT '一等奖奖品设置',
  `fistnums` int(4) DEFAULT NULL COMMENT '一等奖奖品数量',
  `fistlucknums` int(1) DEFAULT NULL COMMENT '一等奖中奖号码',
  `second` varchar(50) DEFAULT NULL COMMENT '二等奖奖品设置',
  `type` tinyint(1) DEFAULT NULL,
  `secondnums` int(4) DEFAULT NULL,
  `secondlucknums` int(1) DEFAULT NULL,
  `third` varchar(50) DEFAULT NULL,
  `thirdnums` int(4) DEFAULT NULL,
  `thirdlucknums` int(1) DEFAULT NULL,
  `allpeople` int(11) DEFAULT NULL,
  `canrqnums` int(2) DEFAULT NULL COMMENT '个人限制抽奖次数',
  `parssword` int(15) DEFAULT NULL,
  `renamesn` varchar(50) DEFAULT '',
  `renametel` varchar(60) DEFAULT NULL,
  `displayjpnums` int(1) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL COMMENT '活动创建日期',
  `status` int(1) DEFAULT NULL,
  `four` varchar(50) DEFAULT NULL,
  `fournums` int(11) DEFAULT NULL,
  `fourlucknums` int(11) DEFAULT NULL,
  `five` varchar(50) DEFAULT NULL,
  `fivenums` int(11) DEFAULT NULL,
  `fivelucknums` int(11) DEFAULT NULL,
  `six` varchar(50) DEFAULT NULL COMMENT '六等奖',
  `sixnums` int(11) DEFAULT NULL,
  `sixlucknums` int(11) DEFAULT NULL,
  `zjpic` varchar(150) DEFAULT '',
  `url` varchar(255) DEFAULT NULL COMMENT '活动展示页面地址',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  PRIMARY KEY (`id`),
  KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_lottery
-- ----------------------------

-- ----------------------------
-- Table structure for cms_lottery_record
-- ----------------------------
DROP TABLE IF EXISTS `cms_lottery_record`;
CREATE TABLE `cms_lottery_record` (
  `id` varchar(32) NOT NULL,
  `lid` varchar(32) DEFAULT NULL COMMENT '动活id',
  `usenums` tinyint(1) DEFAULT '0' COMMENT '用户使用次数',
  `wecha_id` varchar(32) DEFAULT NULL COMMENT '微信唯一识别码',
  `token` varchar(30) DEFAULT NULL,
  `islottery` int(1) DEFAULT NULL COMMENT '是否中奖',
  `wecha_name` varchar(60) DEFAULT NULL COMMENT '微信号',
  `phone` varchar(15) DEFAULT NULL COMMENT '机手号',
  `sn` varchar(13) DEFAULT NULL COMMENT '中奖后序列号',
  `time` datetime DEFAULT NULL COMMENT '中奖日期',
  `prize` varchar(50) DEFAULT '' COMMENT '已中奖项',
  `sendstutas` int(11) DEFAULT NULL,
  `sendtime` datetime DEFAULT NULL COMMENT '发奖日期',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_lottery_record
-- ----------------------------

-- ----------------------------
-- Table structure for cms_mail
-- ----------------------------
DROP TABLE IF EXISTS `cms_mail`;
CREATE TABLE `cms_mail` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `uid` int(32) DEFAULT NULL COMMENT 'uid',
  `pid` varchar(250) DEFAULT NULL COMMENT 'pid',
  `token` varchar(250) DEFAULT NULL COMMENT '标记',
  `mail_phone` varchar(250) DEFAULT NULL COMMENT '邮件地址',
  `smtp_account` varchar(250) DEFAULT NULL COMMENT 'SMTP账号',
  `smtp_password` varchar(250) DEFAULT '0' COMMENT 'SMTP密码',
  `mail_stauts` varchar(250) DEFAULT NULL COMMENT '邮件平台状态',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件设置';

-- ----------------------------
-- Records of cms_mail
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member
-- ----------------------------
DROP TABLE IF EXISTS `cms_member`;
CREATE TABLE `cms_member` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `memberLevel` varchar(255) DEFAULT NULL COMMENT '会员级别',
  `realName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `repassword` varchar(255) DEFAULT NULL COMMENT '确认密码',
  `faceImg` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `sex` int(13) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `cellphone` varchar(255) DEFAULT NULL COMMENT '手机',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `thirdLogin_uid` varchar(255) DEFAULT NULL COMMENT ' 第三登录返回的UID',
  `thirdType` varchar(255) DEFAULT NULL COMMENT '用户类型：新浪-sina,腾训-qq,本站会员为空 ',
  `thirdToken` varchar(255) DEFAULT NULL COMMENT '获取用户token',
  `memberGroupsId` varchar(32) DEFAULT NULL COMMENT '会员级别id',
  `cityid` varchar(32) DEFAULT NULL COMMENT '地域id',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `point` int(13) DEFAULT NULL COMMENT '积分',
  `msn` varchar(255) DEFAULT NULL COMMENT 'msn',
  `remark` varchar(255) DEFAULT NULL COMMENT '个人说明',
  `lastlogin` datetime DEFAULT NULL COMMENT '最后登录时间',
  `logincount` int(13) DEFAULT NULL COMMENT '登录次数',
  `mp` int(13) DEFAULT NULL COMMENT '消费积分',
  `is_cheked` int(13) DEFAULT NULL COMMENT '是否通过验证',
  `registerip` varchar(255) DEFAULT NULL COMMENT '注册ip',
  `createtime` datetime DEFAULT NULL COMMENT '注册时间',
  `login_type` varchar(11) DEFAULT NULL COMMENT '登录类型',
  `card_id` varchar(50) DEFAULT NULL COMMENT '会员卡号',
  `card_path` varchar(255) DEFAULT NULL COMMENT '会员卡访问路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员中心';

-- ----------------------------
-- Records of cms_member
-- ----------------------------

-- ----------------------------
-- Table structure for cms_membergroups
-- ----------------------------
DROP TABLE IF EXISTS `cms_membergroups`;
CREATE TABLE `cms_membergroups` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `userGroupsName` varchar(255) DEFAULT NULL COMMENT '用户主名称',
  `number` int(11) DEFAULT '0' COMMENT '个数',
  `state` int(13) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `defalut_lv` int(13) DEFAULT NULL COMMENT '默认等级 0不是默认 1为默认',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组';

-- ----------------------------
-- Records of cms_membergroups
-- ----------------------------

-- ----------------------------
-- Table structure for cms_memo
-- ----------------------------
DROP TABLE IF EXISTS `cms_memo`;
CREATE TABLE `cms_memo` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户id',
  `content` varchar(1024) DEFAULT NULL COMMENT '便签内容',
  `createTime` datetime DEFAULT NULL COMMENT '便签创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='便签';

-- ----------------------------
-- Records of cms_memo
-- ----------------------------

-- ----------------------------
-- Table structure for cms_message
-- ----------------------------
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(100) DEFAULT NULL COMMENT '主题',
  `name` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `content` text COMMENT '留言内容',
  `reply` text COMMENT '回复',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ischeck` varchar(10) DEFAULT NULL COMMENT '审核状态',
  `memberid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of cms_message
-- ----------------------------

-- ----------------------------
-- Table structure for cms_model
-- ----------------------------
DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model` (
  `id` varchar(32) NOT NULL COMMENT 'lid',
  `name` varchar(20) DEFAULT NULL COMMENT '模型名称',
  `alias` varchar(15) DEFAULT NULL COMMENT '别名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `template_list` varchar(100) DEFAULT NULL COMMENT '模板列表',
  `template_show` varchar(100) DEFAULT NULL COMMENT '模板显示',
  `posts` mediumint(8) unsigned DEFAULT '0' COMMENT 'posts',
  `comments` mediumint(8) unsigned DEFAULT '0' COMMENT '评论数',
  `pv` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `sort` tinyint(2) unsigned DEFAULT '0' COMMENT '排序',
  `disabled` tinyint(1) unsigned DEFAULT '0' COMMENT '不可用',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点Id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of cms_model
-- ----------------------------
INSERT INTO `cms_model` VALUES ('1', '文章', 'article', '', 'article/list.html', 'pc/news_detail.html', '0', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('10', '调查', 'survey', '', 'survey/list.html', 'pc/survey_detail.html', '0', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('11', '专题', 'special', '', 'special/list.html', 'pc/special_detail.html', '0', '0', '0', '0', '1', '1', null);
INSERT INTO `cms_model` VALUES ('2', '组图', 'picture', '', 'picture/list.html', 'pc/picture_detail.html', '0', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('3', '链接', 'link', '', 'link/list.html', 'pc/link_detail.html', '0', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('4', '视频', 'video', '', 'video/list.html', 'pc/video_detail.html', '0', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('7', '活动', 'activity', '', 'activity/list.html', 'pc/activity_detail.html', '1', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('8', '投票', 'vote', '', 'vote/list.html', 'pc/vote_detail.html', '0', '0', '0', '0', '0', '1', null);
INSERT INTO `cms_model` VALUES ('9', '访谈', 'interview', '', 'interview/list.html', 'pc/interview_detail.html', '0', '0', '0', '0', '1', '1', null);

-- ----------------------------
-- Table structure for cms_modelmanage
-- ----------------------------
DROP TABLE IF EXISTS `cms_modelmanage`;
CREATE TABLE `cms_modelmanage` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `model_name` varchar(255) DEFAULT NULL COMMENT '模型名称',
  `model_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(255) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(255) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` varchar(255) DEFAULT '10' COMMENT '排列顺序',
  `has_content` varchar(255) DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` varchar(255) DEFAULT '0' COMMENT '是否禁用',
  `is_def` varchar(255) DEFAULT '0' COMMENT '是否默认类型',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型管理';

-- ----------------------------
-- Records of cms_modelmanage
-- ----------------------------

-- ----------------------------
-- Table structure for cms_model_ext
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_ext`;
CREATE TABLE `cms_model_ext` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `model_id` varchar(32) DEFAULT NULL COMMENT '模型id',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '栏目id',
  `content_id` varchar(32) DEFAULT NULL COMMENT '内容id',
  `modelitem_id` varchar(32) DEFAULT NULL COMMENT '选项项目id',
  `attr_name` varchar(250) DEFAULT NULL COMMENT '类型名称',
  `attr_value` varchar(250) DEFAULT NULL,
  `attr_token` varchar(250) DEFAULT NULL,
  `data_type` varchar(250) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选项内容';

-- ----------------------------
-- Records of cms_model_ext
-- ----------------------------

-- ----------------------------
-- Table structure for cms_model_item
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_item`;
CREATE TABLE `cms_model_item` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `model_id` varchar(32) DEFAULT NULL COMMENT '模型id',
  `field` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `data_type` int(11) DEFAULT '1' COMMENT '数据类型',
  `item_label` varchar(255) DEFAULT NULL COMMENT '名称',
  `priority` varchar(255) DEFAULT '70' COMMENT '排列顺序',
  `is_single` varchar(255) DEFAULT '1' COMMENT '是否独占一行',
  `is_display` varchar(255) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(255) DEFAULT NULL COMMENT '长度',
  `area_cols` varchar(255) DEFAULT NULL COMMENT '文本行数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(255) DEFAULT NULL COMMENT '帮助位置',
  `is_channel` varchar(255) DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` varchar(255) DEFAULT '1' COMMENT '是否自定义',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型项目';

-- ----------------------------
-- Records of cms_model_item
-- ----------------------------

-- ----------------------------
-- Table structure for cms_mood
-- ----------------------------
DROP TABLE IF EXISTS `cms_mood`;
CREATE TABLE `cms_mood` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '情表名',
  `image` varchar(100) DEFAULT NULL COMMENT '标图',
  `sort` tinyint(2) unsigned DEFAULT NULL COMMENT '排序值',
  `site_id` int(32) DEFAULT NULL COMMENT '点站id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_mood
-- ----------------------------

-- ----------------------------
-- Table structure for cms_note
-- ----------------------------
DROP TABLE IF EXISTS `cms_note`;
CREATE TABLE `cms_note` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `uid` varchar(32) DEFAULT NULL COMMENT 'uid',
  `pid` varchar(255) DEFAULT NULL COMMENT 'pid',
  `token` varchar(250) DEFAULT NULL COMMENT '标记',
  `note_phone` varchar(250) DEFAULT NULL COMMENT '短信平台手机号',
  `onte_account` varchar(250) DEFAULT NULL COMMENT '短信平台账号',
  `note_password` varchar(250) DEFAULT '0' COMMENT '短信平台密码',
  `note_stauts` varchar(250) DEFAULT NULL COMMENT '短信平台状态',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信设置';

-- ----------------------------
-- Records of cms_note
-- ----------------------------

-- ----------------------------
-- Table structure for cms_online
-- ----------------------------
DROP TABLE IF EXISTS `cms_online`;
CREATE TABLE `cms_online` (
  `ID` varchar(32) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `LOGINDATETIME` datetime NOT NULL,
  `LOGINNAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_online
-- ----------------------------

-- ----------------------------
-- Table structure for cms_operation
-- ----------------------------
DROP TABLE IF EXISTS `cms_operation`;
CREATE TABLE `cms_operation` (
  `ID` varchar(32) NOT NULL,
  `operationcode` varchar(50) DEFAULT NULL,
  `operationicon` varchar(100) DEFAULT NULL,
  `operationname` varchar(50) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `functionid` varchar(32) DEFAULT NULL,
  `iconid` varchar(32) DEFAULT NULL,
  `operationurl` varchar(300) DEFAULT NULL COMMENT '址地',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `FK_pceuy41wr2fjbcilyc7mk3m1f` (`functionid`) USING BTREE,
  KEY `FK_ny5de7922l39ta2pkhyspd5f` (`iconid`) USING BTREE,
  CONSTRAINT `cms_operation_ibfk_1` FOREIGN KEY (`iconid`) REFERENCES `cms_icon` (`ID`),
  CONSTRAINT `cms_operation_ibfk_2` FOREIGN KEY (`functionid`) REFERENCES `cms_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`iconid`) REFER `lm_maven_cms/cms_icon`(`ID`); (`function';

-- ----------------------------
-- Records of cms_operation
-- ----------------------------

-- ----------------------------
-- Table structure for cms_opintemplate
-- ----------------------------
DROP TABLE IF EXISTS `cms_opintemplate`;
CREATE TABLE `cms_opintemplate` (
  `ID` varchar(32) NOT NULL,
  `descript` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_opintemplate
-- ----------------------------

-- ----------------------------
-- Table structure for cms_pf_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_pf_config`;
CREATE TABLE `cms_pf_config` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `configKey` varchar(100) DEFAULT NULL COMMENT '配置键',
  `configValue` varchar(100) DEFAULT NULL COMMENT '配置值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置项';

-- ----------------------------
-- Records of cms_pf_config
-- ----------------------------

-- ----------------------------
-- Table structure for cms_picturealone
-- ----------------------------
DROP TABLE IF EXISTS `cms_picturealone`;
CREATE TABLE `cms_picturealone` (
  `id` varchar(32) NOT NULL COMMENT '单图片ID',
  `picturegroupid` varchar(32) DEFAULT NULL COMMENT '组图ID',
  `picture_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `picture_message` varchar(255) DEFAULT NULL COMMENT '图片信息',
  `picture_width` varchar(255) DEFAULT NULL COMMENT '宽度',
  `picture_height` varchar(255) DEFAULT NULL COMMENT '长度',
  `picture_sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of cms_picturealone
-- ----------------------------

-- ----------------------------
-- Table structure for cms_picture_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_picture_group`;
CREATE TABLE `cms_picture_group` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容id',
  `image` varchar(255) DEFAULT NULL COMMENT '图片名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `url` text COMMENT 'url',
  `url_thumb` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `sort` tinyint(11) unsigned DEFAULT '0' COMMENT '排序',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片组表';

-- ----------------------------
-- Records of cms_picture_group
-- ----------------------------

-- ----------------------------
-- Table structure for cms_relate_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_relate_content`;
CREATE TABLE `cms_relate_content` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `content_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '内容ID',
  `relate_title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `relate_url` char(100) DEFAULT NULL COMMENT 'URL路径',
  `images` char(100) NOT NULL DEFAULT '60' COMMENT '缩略图',
  `relate_type` varchar(255) NOT NULL DEFAULT '6' COMMENT '类型',
  `relate_order` int(10) DEFAULT NULL COMMENT '顺序',
  `newdate` datetime DEFAULT NULL COMMENT '表单新增时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `part` varchar(255) DEFAULT NULL COMMENT '区别内容id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相关内容表';

-- ----------------------------
-- Records of cms_relate_content
-- ----------------------------

-- ----------------------------
-- Table structure for cms_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role` (
  `ID` varchar(32) NOT NULL,
  `rolecode` varchar(32) DEFAULT NULL,
  `rolename` varchar(100) NOT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_role
-- ----------------------------
INSERT INTO `cms_role` VALUES ('402881ea452582c101452583a5040042', 'admin', '管理员', null);
INSERT INTO `cms_role` VALUES ('402881ea452582c101452583a5060043', 'manager', '普通用户', null);
INSERT INTO `cms_role` VALUES ('402881f54a858830014a858adf1c0002', 'development', '开发者', null);
INSERT INTO `cms_role` VALUES ('402882494aeb5bc9014aebce3fb40019', 'edit', '编辑', null);

-- ----------------------------
-- Table structure for cms_role_function
-- ----------------------------
DROP TABLE IF EXISTS `cms_role_function`;
CREATE TABLE `cms_role_function` (
  `ID` varchar(32) NOT NULL,
  `operation` varchar(4000) DEFAULT NULL,
  `functionid` varchar(32) DEFAULT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_role_function
-- ----------------------------
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702be7a0027', null, '402881e74588db55014588e0ce320001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702be840028', null, '402881e546d12b630146d12e4c5d0006', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bea10029', null, '402881e74588fc66014588fd533c0001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702beaa002a', null, '402882494abd18ea014abd2ffaa00007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702beb1002b', null, '40286aea4d8dd595014d8df556f90002', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702beb7002c', null, '402881954c502041014c5033eef30004', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bec1002d', null, '402881954c502041014c503445a00006', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bece002e', null, '402881954c502041014c50347e3d0008', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bed9002f', null, '402881954c502041014c5034c513000a', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bee10030', null, '402881954c502041014c50350198000c', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bef00031', null, '402882494abd18ea014abd30473a0009', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702befc0032', null, '402882494abd18ea014abd3077cb000b', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf050033', null, '402882494abd18ea014abd3fd7270019', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf0e0034', null, '402882494abd18ea014abd4008e0001b', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf160035', null, '402882494abd18ea014abd403750001d', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf1d0036', null, '402881e447f219ca0147f2a04e3100e4', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf230037', null, '402881984d9d87f8014d9dad8cbe000b', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf570038', null, '402882494abd18ea014abd4c6adf003d', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf5e0039', null, '402881e947f353c80147f358289f0003', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf68003a', null, '402881e947f353c80147f359a16b0007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf72003b', null, '402881e74582ea28014582eb4cd30001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf79003c', null, '402881e845feaa710145feae8b8e0001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf80003d', null, '402881e845feaa710145feaf1c320003', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf86003e', null, '402881e845feb6800145fec62b0d0004', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf8d003f', null, '402881ec46030652014603157d490002', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf930040', null, '297ebc2d50a21ef70150a6fd98670003', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bf9b0041', null, '297ebc2d50a21ef70150a6fddc530005', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfa50042', null, '297ebc2d50a21ef70150a6fe1d880007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfad0043', null, '402881844be78aa0014be8bd1b6e0017', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfb70044', null, '402881844be78aa0014be8cb6ad20021', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfc30045', null, '402881844be78aa0014be8cbcd180023', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfcc0046', null, '402881844bfc6acc014bfc6f5a0a0001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfd60047', null, '402881844c013ebe014c015d7cce0001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfde0048', null, '402881ea452582c101452583a4900018', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfe60049', null, '402881ee4582238c01458225cddd0001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfee004a', null, '402881e847ce04630147ce5781990003', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bff6004b', null, '402882494b33c31b014b33ec213b0002', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702bfff004c', null, '297ebc2d4fc9ea43014fd44b26dc0007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c006004d', null, '297ebc2d50a21ef70150a6ff40860015', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c00d004e', null, '297ebc2d50a21ef70150a6ffbf150017', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c016004f', null, '297ebc2d50a21ef70150a6fffe9a0019', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c01d0050', null, '402881834e2016fd014e201c64870011', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0270051', null, '402881834e2016fd014e201cc33b0013', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0340052', null, '402881834e2016fd014e202d339d0017', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c03c0053', null, '402881834e2016fd014e203215af001a', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0450054', null, '402881834e2016fd014e2033453b001d', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c04c0055', null, '402881834e2016fd014e20345b870020', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0520056', null, '402881844c2a7615014c2aa2a76d0002', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0590057', null, '402881984d9d87f8014d9da8f7610005', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0600058', null, '402881984d9d87f8014d9daa1cb60007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0670059', null, '402881984d9d87f8014d9dac1e730009', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c06e005a', null, '402881984d9d87f8014d9dba4460000d', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c076005b', null, '402881984d9d87f8014d9dc5a4c70013', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c082005c', null, '402881984d9d87f8014d9dc8ed6f0019', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c08b005d', null, '402881984d9d87f8014d9dc934e0001b', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c093005e', null, '402881984d9d87f8014d9dcb33110021', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c09b005f', null, '402881984d9d87f8014d9dcbaaf80023', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0a30060', null, '402882494b149795014b15cdf20f000f', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0ad0061', null, '402881ea452582c101452583a4950019', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0b40062', null, '402881834e1f2952014e1f7c4a4e0003', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0bb0063', null, '402881834e1f2952014e1f7cb22b0005', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0cb0064', null, '402881834e1fd70e014e1ffdcba60007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0d30065', null, '402881834e1fd70e014e200111cf000a', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0db0066', null, '402881984d9d87f8014d9da742200001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0e30067', null, '402881984d9d87f8014d9dc482f4000f', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0ea0068', null, '402881984d9d87f8014d9dc502c90011', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0f10069', null, '402881984d9d87f8014d9dc6ad490015', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c0fd006a', null, '402881984d9d87f8014d9dc9e0b2001d', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c105006b', null, '402881984d9d87f8014d9dca4728001f', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c10e006c', null, '402881ea452582c101452583a4b00022', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c114006d', null, '402881ea452582c101452583a4a5001e', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c11a006e', null, '402881ea452582c101452583a4a1001d', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c122006f', null, '402881ea452582c101452583a4a7001f', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c1290070', null, '402881ea452582c101452583a4ab0020', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a702c1330071', null, '402881f345729652014572973b500001', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('297ebc2d50a21ef70150a821a14a0083', null, '297ebc2d50a21ef70150a82162020081', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('4028818d518af2d101518afafc03000f', null, '4028818d518af2d101518af95ed50007', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('4028818d518af2d101518afafc0f0010', null, '4028818d518af2d101518af9f4ea0009', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('4028818d518b0bef01518b0f271c0008', null, '4028818d518b0bef01518b0e323c0003', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('4028818d518b0bef01518b0f272b0009', null, '4028818d518b0bef01518b0eca300005', '402881ea452582c101452583a5040042', null);
INSERT INTO `cms_role_function` VALUES ('402881ef47a0480e0147a07a4fd0000d', null, '402881e74588db55014588e0ce320001', '402881ea452582c101452583a5060043', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858b9ce50004', null, '402881ea452582c101452583a4950019', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858b9f36000b', null, '402881ea452582c101452583a4b00022', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858b9f84000c', null, '402881ea452582c101452583a4a5001e', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858b9fd2000d', null, '402881ea452582c101452583a4a1001d', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba06e000e', null, '402881ea452582c101452583a4a7001f', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba0ad000f', null, '402881ea452582c101452583a4ab0020', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba2bf0017', null, '402881f345729652014572973b500001', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba2ff0018', null, '402881ea452582c101452583a4900018', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba39b001a', null, '402881ee4582238c01458225cddd0001', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba512001f', null, '402881e847ce04630147ce5781990003', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba5500020', null, '402881e74588db55014588e0ce320001', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba6b70025', null, '402881e546d12b630146d12e4c5d0006', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba7340026', null, '402881e447f219ca0147f2a04e3100e4', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba83d002a', null, '402881e947f353c80147f358289f0003', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba8aa002b', null, '402881e947f353c80147f359a16b0007', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858ba965002d', null, '402881e74582ea28014582eb4cd30001', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858baee1003f', null, '402881e845feaa710145feae8b8e0001', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858baf200040', null, '402881e845feaa710145feaf1c320003', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858baf5e0041', null, '402881e845feb6800145fec62b0d0004', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402881f54a858830014a858bafd00042', null, '402881ec46030652014603157d490002', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea97e001b', null, '402881e74588db55014588e0ce320001', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea99e001c', null, '402881e546d12b630146d12e4c5d0006', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea9bd001d', null, '402882494abd18ea014abd2ffaa00007', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea9cc001e', null, '402882494abd18ea014abd30473a0009', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea9dc001f', null, '402882494abd18ea014abd3077cb000b', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea9ec0020', null, '402882494abd18ea014abd3fd7270019', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebcea9fb0021', null, '402882494abd18ea014abd4008e0001b', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494aeb5bc9014aebceaa1a0022', null, '402882494abd18ea014abd403750001d', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cms_role_function` VALUES ('402882494b149795014b15cfbed10011', null, '402882494b149795014b15cdf20f000f', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b2e74b3014b2f736264002c', null, '402881e74588db55014588e0ce320001', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cms_role_function` VALUES ('402882494b2e74b3014b2f736293002d', null, '402881e546d12b630146d12e4c5d0006', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cms_role_function` VALUES ('402882494b2e74b3014b30889975003d', null, '402882494abd18ea014abd4c6adf003d', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b33c31b014b33ec60bb0004', null, '402882494b33c31b014b33ec213b0002', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b34387b014b3494cba4001c', null, '402882494abd18ea014abd2ffaa00007', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b34387b014b3494cbc3001d', null, '402882494abd18ea014abd30473a0009', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b34387b014b3494cbe3001e', null, '402882494abd18ea014abd3077cb000b', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b34387b014b3494cbf2001f', null, '402882494abd18ea014abd3fd7270019', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b34387b014b3494cc110020', null, '402882494abd18ea014abd4008e0001b', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cms_role_function` VALUES ('402882494b34387b014b3494cc310021', null, '402882494abd18ea014abd403750001d', '402881f54a858830014a858adf1c0002', null);

-- ----------------------------
-- Table structure for cms_role_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_role_site`;
CREATE TABLE `cms_role_site` (
  `id` varchar(32) NOT NULL COMMENT '站点权限ID',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点权限表';

-- ----------------------------
-- Records of cms_role_site
-- ----------------------------
INSERT INTO `cms_role_site` VALUES ('297ebc2d50a21ef70150a6fe51230009', '297ebc2d4fa20242014fa566987b0002', '402881ea452582c101452583a5040042', '2015-10-27 09:51:36');
INSERT INTO `cms_role_site` VALUES ('297ebc2d50a21ef70150a6fe5127000a', '1', '402881ea452582c101452583a5040042', '2015-10-27 09:51:36');

-- ----------------------------
-- Table structure for cms_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_role_user`;
CREATE TABLE `cms_role_user` (
  `ID` varchar(32) NOT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_role_user
-- ----------------------------
INSERT INTO `cms_role_user` VALUES ('402881ce4d89fa9b014d8a0d9a180008', '402881ea452582c101452583a5040042', '402881ea452582c101452583a5140044', null);
INSERT INTO `cms_role_user` VALUES ('402881e947dc82cb0147dccbaeef000c', '402881ea452582c101452583a5040042', '402881e947dc82cb0147dccbadfb000b', null);
INSERT INTO `cms_role_user` VALUES ('402881f147ed67ca0147ed8a64f80003', '402881ea452582c101452583a5060043', '402881e847c910c30147c9cc34280019', null);
INSERT INTO `cms_role_user` VALUES ('402881f547ed7ef40147ed88c5f30003', '402881ea452582c101452583a5040042', '402881e947dc82cb0147dccbadfb000b', null);
INSERT INTO `cms_role_user` VALUES ('402881f547ed7ef40147ed8a9a260005', '402881e447d7ce020147d7d888c90002', '402881e847c910c30147c9cc34280019', null);
INSERT INTO `cms_role_user` VALUES ('402881f547ed7ef40147ed8a9ac20006', '402881ea452582c101452583a5060043', '402881e847c910c30147c9cc34280019', null);

-- ----------------------------
-- Table structure for cms_section
-- ----------------------------
DROP TABLE IF EXISTS `cms_section`;
CREATE TABLE `cms_section` (
  `id` varchar(32) NOT NULL COMMENT '区块id',
  `name` varchar(50) NOT NULL COMMENT '区块名称',
  `pathids` varchar(255) DEFAULT NULL,
  `type` enum('commend','auto','html') NOT NULL DEFAULT 'auto' COMMENT '类型',
  `templepath` varchar(50) DEFAULT NULL COMMENT '模版路径',
  `url` varchar(50) DEFAULT NULL COMMENT '所发布的html',
  `data` text COMMENT '区块内容',
  `frequency` smallint(5) DEFAULT '0' COMMENT '更新频率',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `createdtime` datetime NOT NULL COMMENT '创建时间',
  `createdby` mediumint(8) NOT NULL COMMENT '创建人',
  `modifiedtime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifiedby` varchar(32) DEFAULT NULL COMMENT '修改人',
  `published` datetime DEFAULT NULL COMMENT '发布时间',
  `publishedby` mediumint(8) DEFAULT NULL COMMENT '发布人',
  `memo` text COMMENT '描述',
  `num` smallint(5) DEFAULT '0' COMMENT '每页显示数据条数',
  `classid` varchar(32) DEFAULT NULL COMMENT '栏目id',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_section
-- ----------------------------
INSERT INTO `cms_section` VALUES ('1', '二级导航', '-1,', 'html', 'pc/section/menu.html', null, null, '0', null, '0', '2015-03-04 12:04:39', '1', '2015-07-02 15:19:00', '1', null, null, '导航', '15', '-1', '1');
INSERT INTO `cms_section` VALUES ('2', '首页导航', '-1,', 'html', 'pc/section/index_nav.html', null, null, '0', null, '0', '2015-03-05 14:53:29', '1', '2015-06-30 17:57:25', '1', null, null, '首页导航', '15', '-1', '1');
INSERT INTO `cms_section` VALUES ('3', '页脚', '-1,', 'html', 'pc/section/footer.html', null, null, '0', null, '0', '2015-03-10 15:58:19', '1', '2015-06-30 20:11:19', '1', null, null, '', '15', '-1', '1');
INSERT INTO `cms_section` VALUES ('4', '友情链接', '-1,', 'html', 'pc/section/friendLink.html', null, null, '0', null, '0', '2015-03-25 16:59:51', '1', '2015-06-24 11:13:51', '1', null, null, '首页页脚 友情链接', '15', '-1', '1');
INSERT INTO `cms_section` VALUES ('4028818d518b5f0e01518b72f2c80005', '小小站导航', '-1,', 'html', 'common/index_nav.html', null, null, '0', null, '0', '2015-12-10 18:32:25', '1', null, null, null, null, '', '15', '-1', '297ebc2d4fa20242014fa566987b0002');
INSERT INTO `cms_section` VALUES ('4028818d518b5f0e01518b7cbcf5001f', '联系方式', '-1,', 'html', 'common/information.html', null, null, '0', null, '0', '2015-12-10 18:43:06', '1', null, null, null, null, '', '15', '-1', '297ebc2d4fa20242014fa566987b0002');
INSERT INTO `cms_section` VALUES ('4028818d518b5f0e01518b7d44a60021', '热门新闻', '-1,', 'html', 'common/hotnews.html', null, null, '0', null, '0', '2015-12-10 18:43:41', '1', null, null, null, null, '', '15', '-1', '297ebc2d4fa20242014fa566987b0002');
INSERT INTO `cms_section` VALUES ('4028818d518b5f0e01518b7d813f0023', '小小站尾部', '-1,', 'html', 'common/footer.html', null, null, '0', null, '0', '2015-12-10 18:43:56', '1', null, null, null, null, '', '15', '-1', '297ebc2d4fa20242014fa566987b0002');
INSERT INTO `cms_section` VALUES ('402888e64e2ba798014e2bb51c9c0005', '视频导航', '-1,', 'html', 'pc/section/secondMenu.html', null, null, '0', null, '0', '2015-06-26 01:12:46', '1', '2015-07-03 11:41:47', '1', null, null, '视频以及详细页导航', '15', '-1', '1');

-- ----------------------------
-- Table structure for cms_section_class
-- ----------------------------
DROP TABLE IF EXISTS `cms_section_class`;
CREATE TABLE `cms_section_class` (
  `id` varchar(32) NOT NULL COMMENT '区块分类id',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `memo` text COMMENT '备注',
  `levels` int(11) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `siteid` varchar(32) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_section_class
-- ----------------------------

-- ----------------------------
-- Table structure for cms_section_class_priv
-- ----------------------------
DROP TABLE IF EXISTS `cms_section_class_priv`;
CREATE TABLE `cms_section_class_priv` (
  `id` varchar(32) NOT NULL COMMENT '区块权限id',
  `sectionclassid` varchar(32) DEFAULT NULL COMMENT '区块id',
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区块权限表';

-- ----------------------------
-- Records of cms_section_class_priv
-- ----------------------------

-- ----------------------------
-- Table structure for cms_section_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_section_data`;
CREATE TABLE `cms_section_data` (
  `id` varchar(32) NOT NULL COMMENT '区块数据id',
  `sectionid` varchar(32) NOT NULL COMMENT '区块id',
  `contentid` mediumint(8) DEFAULT '0' COMMENT '关联内容id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `color` varchar(7) DEFAULT NULL COMMENT '颜色',
  `url` varchar(100) DEFAULT NULL COMMENT '内容地址',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `description` text COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `created` datetime NOT NULL COMMENT '创建时间',
  `createdby` varchar(32) NOT NULL COMMENT '创建人',
  `commended` datetime DEFAULT NULL COMMENT '修改时间',
  `commendedby` mediumint(8) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_section_data
-- ----------------------------

-- ----------------------------
-- Table structure for cms_sensitivity
-- ----------------------------
DROP TABLE IF EXISTS `cms_sensitivity`;
CREATE TABLE `cms_sensitivity` (
  `id` varchar(32) NOT NULL,
  `search` varchar(255) DEFAULT NULL COMMENT '敏感词',
  `replacement` varchar(255) DEFAULT NULL COMMENT '替换词',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of cms_sensitivity
-- ----------------------------

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `config_id` varchar(32) DEFAULT '0' COMMENT '配置ID',
  `ftp_upload_id` varchar(32) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(3) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(3) DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT '' COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `is_master` tinyint(1) DEFAULT '0' COMMENT '是否主站',
  `index_template` varchar(255) DEFAULT NULL COMMENT '首页模板',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  `ucenterisOpen` int(1) DEFAULT '0' COMMENT '会员连接ucenter是否开启 （0：不开启 1：开启）',
  `is_switch` varchar(10) DEFAULT NULL COMMENT '是否切换(0代表静态1代表动态)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ak_domain` (`domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES ('1', '1', null, 'lmcms.leimingtech.com', 'www', '雷铭新闻网', '雷铭新闻网', 'http://', '.htm', '.shtml', '/zhuzhan', '0', '0', 'zh_CN', 'zh_CN', 'red', '2', '1', '1', '1', '', '', '1', 'pc/index.html', '2015-09-06 09:23:27', '0', null);
INSERT INTO `cms_site` VALUES ('297ebc2d4fa20242014fa566987b0002', '0', null, 'lmcms-sub.leimingtech.com', 'xxzdsb', '小小站电商版', '小小站电商版', 'http://', '.jhtml', '.shtml', null, '0', '0', 'zh_CN', 'zh_CN', 'default', '2', '2', '1', '1', '', null, '0', 'index.html', '2015-09-07 09:23:28', '0', null);

-- ----------------------------
-- Table structure for cms_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_sms_log`;
CREATE TABLE `cms_sms_log` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `sendTime` datetime DEFAULT NULL COMMENT '时间',
  `op` varchar(100) DEFAULT NULL COMMENT '发送人',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `isResend` int(2) DEFAULT NULL COMMENT '是否重发',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信日志';

-- ----------------------------
-- Records of cms_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for cms_source
-- ----------------------------
DROP TABLE IF EXISTS `cms_source`;
CREATE TABLE `cms_source` (
  `id` varchar(32) NOT NULL,
  `name` char(40) DEFAULT NULL COMMENT '来源名称',
  `logo` char(100) DEFAULT NULL COMMENT 'logo',
  `url` char(100) DEFAULT NULL COMMENT '地址',
  `initials` char(10) DEFAULT NULL COMMENT '初始值',
  `count` mediumint(8) unsigned DEFAULT '0' COMMENT '装载量',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序值',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `enname` varchar(32) DEFAULT NULL COMMENT '英文名称',
  `cnname` varchar(32) DEFAULT NULL COMMENT '中文全拼',
  `simplename` varchar(32) DEFAULT NULL COMMENT '中文简拼',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `initial` (`initials`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_source
-- ----------------------------

-- ----------------------------
-- Table structure for cms_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_special`;
CREATE TABLE `cms_special` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '专题id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容id',
  `catalogName` varchar(255) DEFAULT NULL COMMENT '目录名称',
  `special_listModel` varchar(255) DEFAULT NULL,
  `special_listNews` varchar(255) DEFAULT NULL,
  `special_listPages` varchar(255) DEFAULT NULL,
  `special_endTime` datetime DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题表';

-- ----------------------------
-- Records of cms_special
-- ----------------------------

-- ----------------------------
-- Table structure for cms_survey
-- ----------------------------
DROP TABLE IF EXISTS `cms_survey`;
CREATE TABLE `cms_survey` (
  `id` varchar(32) NOT NULL,
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `custom` varchar(255) DEFAULT NULL COMMENT '自定义模板',
  `pageBackground` varchar(1000) DEFAULT NULL COMMENT '页面背景图',
  `recipient` varchar(255) DEFAULT NULL COMMENT '接收人',
  `surveyStartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `surveyEndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `surveyPeoLimit` varchar(255) DEFAULT NULL COMMENT '人数限制',
  `surveyIpLimit` varchar(255) DEFAULT NULL COMMENT 'IP限制',
  `isVip` varchar(255) DEFAULT NULL COMMENT '是否会员',
  `site_id` varchar(32) DEFAULT NULL COMMENT '点站id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查表';

-- ----------------------------
-- Records of cms_survey
-- ----------------------------

-- ----------------------------
-- Table structure for cms_survey_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_survey_log`;
CREATE TABLE `cms_survey_log` (
  `id` varchar(32) NOT NULL,
  `surveyid` varchar(32) DEFAULT NULL COMMENT '调查id',
  `created` datetime DEFAULT NULL COMMENT '投票时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '投票人',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区县',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查日志表';

-- ----------------------------
-- Records of cms_survey_log
-- ----------------------------

-- ----------------------------
-- Table structure for cms_survey_log_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_survey_log_data`;
CREATE TABLE `cms_survey_log_data` (
  `id` varchar(32) NOT NULL,
  `logid` varchar(32) DEFAULT NULL COMMENT '调查日志id',
  `optionid` varchar(32) DEFAULT NULL COMMENT '选项id',
  `optionextid` varchar(32) DEFAULT NULL COMMENT '选项内容id',
  `reply` text COMMENT '回复',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区县',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查日志选项';

-- ----------------------------
-- Records of cms_survey_log_data
-- ----------------------------

-- ----------------------------
-- Table structure for cms_survey_log_ext
-- ----------------------------
DROP TABLE IF EXISTS `cms_survey_log_ext`;
CREATE TABLE `cms_survey_log_ext` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `logid` varchar(32) DEFAULT NULL COMMENT '调查日志id',
  `optionid` varchar(32) DEFAULT NULL COMMENT '选项',
  `ext` text COMMENT '文本内容',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区县',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查日志选项文本';

-- ----------------------------
-- Records of cms_survey_log_ext
-- ----------------------------

-- ----------------------------
-- Table structure for cms_survey_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_survey_option`;
CREATE TABLE `cms_survey_option` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `surveyid` varchar(32) DEFAULT NULL COMMENT '调查ID',
  `optionName` varchar(255) DEFAULT NULL COMMENT '选项名称',
  `data_type` varchar(255) DEFAULT NULL COMMENT '数据类型',
  `picture` varchar(255) DEFAULT NULL COMMENT '图片',
  `interpretation` varchar(255) DEFAULT NULL COMMENT '说明',
  `optionSort` varchar(255) DEFAULT NULL COMMENT '排序',
  `optionContent` varchar(4000) DEFAULT NULL COMMENT '选项内容',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  `isCheck` int(1) DEFAULT '0' COMMENT '是否必选（0：不是 1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查选项';

-- ----------------------------
-- Records of cms_survey_option
-- ----------------------------

-- ----------------------------
-- Table structure for cms_survey_option_ext
-- ----------------------------
DROP TABLE IF EXISTS `cms_survey_option_ext`;
CREATE TABLE `cms_survey_option_ext` (
  `id` varchar(32) NOT NULL COMMENT 'extid',
  `optionsid` varchar(255) DEFAULT NULL COMMENT '选项ID',
  `ext_optionName` varchar(255) DEFAULT NULL COMMENT '选项名称',
  `ext_optionPicture` varchar(255) DEFAULT NULL COMMENT '选项图片',
  `ext_dataType` varchar(255) DEFAULT NULL COMMENT '数据类型',
  `ext_sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查选项内容';

-- ----------------------------
-- Records of cms_survey_option_ext
-- ----------------------------

-- ----------------------------
-- Table structure for cms_territory
-- ----------------------------
DROP TABLE IF EXISTS `cms_territory`;
CREATE TABLE `cms_territory` (
  `ID` varchar(32) NOT NULL,
  `territorycode` varchar(10) NOT NULL,
  `territorylevel` smallint(6) NOT NULL,
  `territoryname` varchar(50) NOT NULL,
  `territory_pinyin` varchar(40) DEFAULT NULL,
  `territorysort` varchar(3) NOT NULL,
  `x_wgs84` double NOT NULL,
  `y_wgs84` double NOT NULL,
  `territoryparentid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_territory
-- ----------------------------

-- ----------------------------
-- Table structure for cms_third_login
-- ----------------------------
DROP TABLE IF EXISTS `cms_third_login`;
CREATE TABLE `cms_third_login` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '第三方名称',
  `isopen` varchar(100) DEFAULT NULL COMMENT '是否开启',
  `appid` varchar(255) DEFAULT NULL COMMENT 'appid',
  `appkey` varchar(255) DEFAULT NULL COMMENT 'appkey',
  `returnurl` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `authorizeurl` varchar(255) DEFAULT NULL COMMENT '授权请求地址',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_third_login
-- ----------------------------

-- ----------------------------
-- Table structure for cms_timetask
-- ----------------------------
DROP TABLE IF EXISTS `cms_timetask`;
CREATE TABLE `cms_timetask` (
  `ID` varchar(32) NOT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_NAME` varchar(32) DEFAULT NULL,
  `CRON_EXPRESSION` varchar(100) NOT NULL,
  `IS_EFFECT` varchar(1) NOT NULL,
  `IS_START` varchar(1) NOT NULL,
  `TASK_DESCRIBE` varchar(50) NOT NULL,
  `TASK_ID` varchar(100) NOT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_timetask
-- ----------------------------

-- ----------------------------
-- Table structure for cms_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_type`;
CREATE TABLE `cms_type` (
  `ID` varchar(32) NOT NULL,
  `typecode` varchar(50) DEFAULT NULL,
  `typename` varchar(50) DEFAULT NULL,
  `typepid` varchar(32) DEFAULT NULL,
  `typegroupid` varchar(32) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `FK_nw2b22gy7plh7pqows186odmq` (`typepid`) USING BTREE,
  KEY `FK_3q40mr4ebtd0cvx79matl39x1` (`typegroupid`) USING BTREE,
  CONSTRAINT `cms_type_ibfk_1` FOREIGN KEY (`typegroupid`) REFERENCES `cms_typegroup` (`ID`),
  CONSTRAINT `cms_type_ibfk_2` FOREIGN KEY (`typepid`) REFERENCES `cms_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`typegroupid`) REFER `lm_maven_cms/cms_typegroup`(`ID`); ';

-- ----------------------------
-- Records of cms_type
-- ----------------------------
INSERT INTO `cms_type` VALUES ('402881064ab445b1014ab449739a0005', 'text', '单行文本', null, '402881064ab445b1014ab44901cb0003', null);
INSERT INTO `cms_type` VALUES ('402881064ab445b1014ab44a147a0007', 'textarea', '多行文本', null, '402881064ab445b1014ab44901cb0003', null);
INSERT INTO `cms_type` VALUES ('402881064ab445b1014ab44e7bbd0009', 'radio', '单选', null, '402881064ab445b1014ab44901cb0003', null);
INSERT INTO `cms_type` VALUES ('402881064ab445b1014ab44eb947000b', 'checkbox', '多选', null, '402881064ab445b1014ab44901cb0003', null);
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac71a25d001d', 'number', '数字', null, '402881904fabda06014fac712447001b', '2015-09-08 18:12:52');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac721d5d001f', 'english', '英文字符', null, '402881904fabda06014fac712447001b', '2015-09-08 18:13:24');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac7268f70021', 'chinese', '中文字符', null, '402881904fabda06014fac712447001b', '2015-09-08 18:13:43');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac730cb00023', 'email', 'Email', null, '402881904fabda06014fac712447001b', '2015-09-08 18:14:25');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac737d790025', 'cellphone', '电话号码', null, '402881904fabda06014fac712447001b', '2015-09-08 18:14:54');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac73aa8d0027', 'telephone', '手机号码', null, '402881904fabda06014fac712447001b', '2015-09-08 18:15:06');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac741daf0029', 'http', '网址', null, '402881904fabda06014fac712447001b', '2015-09-08 18:15:35');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac7468e0002b', 'cardnumber', '身份证号码', null, '402881904fabda06014fac712447001b', '2015-09-08 18:15:54');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac749d37002d', 'qq', 'QQ号码', null, '402881904fabda06014fac712447001b', '2015-09-08 18:16:08');
INSERT INTO `cms_type` VALUES ('402881904fabda06014fac7582c8002f', 'postalcode', '邮政编码', null, '402881904fabda06014fac712447001b', '2015-09-08 18:17:07');
INSERT INTO `cms_type` VALUES ('402881914f6e07df014f6e120bb00001', 'select', '下拉列表', null, '402881064ab445b1014ab44901cb0003', '2015-08-27 15:32:01');
INSERT INTO `cms_type` VALUES ('402881914f6e07df014f6e1250530003', 'img', '图片上传', null, '402881064ab445b1014ab44901cb0003', '2015-08-27 15:32:18');
INSERT INTO `cms_type` VALUES ('402881914f6e07df014f6e127cab0005', 'file', '文件上传', null, '402881064ab445b1014ab44901cb0003', '2015-08-27 15:32:29');
INSERT INTO `cms_type` VALUES ('402881e4466671bb014666b8bf4d0041', 'sdfadsf', 'asdfa', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e4466671bb014666b8d9880043', 'fsadfsad', 'sadfasdfas', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e4466671bb014666bfbed40049', 'sdf', 'dsf', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e545843fd40145844acd87001f', '0', '投诉', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e545843fd40145844af46b0021', '1', '普通', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e546612ef9014661332c470003', '', 'IT人员', null, '402881e546612ef901466132d7b10001', null);
INSERT INTO `cms_type` VALUES ('402881e546612ef9014661338b130005', '阿萨德发', '美工', null, '402881e546612ef901466132d7b10001', null);
INSERT INTO `cms_type` VALUES ('402881e6453f1fb801453f602c150011', 'test', '测试', null, '402881e6453f1fb801453f5a3959000f', null);
INSERT INTO `cms_type` VALUES ('402881e646f5fe270146f603be180001', 'ss', 'sdf', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e646f5fe270146f603f46b0003', 'sdfsdf', 'sfsd', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e646f5fe270146f604178b0005', 'wer', 'sdfs', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e646f5fe270146f60431820007', 'werwe', 'sdfsd', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e646f5fe270146f60448d70009', 'wer', 'werwe', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881e745842b530145842d15000001', '四大', '实打实的', null, '402881e6453f1fb801453f5a3959000f', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a56c0052', '2', '菜单图标', null, '402881ea452582c101452583a5250048', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5710053', '1', '系统图标', null, '402881ea452582c101452583a5250048', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5730054', 'files', '附件', null, '402881ea452582c101452583a54c0050', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5750055', '1', '优质订单', null, '402881ea452582c101452583a52b0049', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5760056', '2', '普通订单', null, '402881ea452582c101452583a52b0049', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a57a0057', '1', '签约客户', null, '402881ea452582c101452583a53a004a', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a57b0058', '2', '普通客户', null, '402881ea452582c101452583a53a004a', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a57d0059', '1', '特殊服务', null, '402881ea452582c101452583a53c004b', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a57f005a', '2', '普通服务', null, '402881ea452582c101452583a53c004b', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a581005b', 'single', '单条件查询', null, '402881ea452582c101452583a53e004c', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a584005c', 'group', '范围查询', null, '402881ea452582c101452583a53e004c', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a587005d', 'Y', '是', null, '402881ea452582c101452583a540004d', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a589005e', 'N', '否', null, '402881ea452582c101452583a540004d', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a58a005f', 'Integer', 'Integer', null, '402881ea452582c101452583a544004e', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a58c0060', 'Date', 'Date', null, '402881ea452582c101452583a544004e', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a58e0061', 'String', 'String', null, '402881ea452582c101452583a544004e', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a58f0062', 'Long', 'Long', null, '402881ea452582c101452583a544004e', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5920063', 'act', '工作流引擎表', null, '402881ea452582c101452583a547004f', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5940064', 't_s', '系统基础表', null, '402881ea452582c101452583a547004f', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5950065', 't_b', '业务表', null, '402881ea452582c101452583a547004f', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5970066', 't_p', '自定义引擎表', null, '402881ea452582c101452583a547004f', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5990067', 'news', '新闻', null, '402881ea452582c101452583a54c0050', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a59e0068', '0', '男性', null, '402881ea452582c101452583a5530051', null);
INSERT INTO `cms_type` VALUES ('402881ea452582c101452583a5a00069', '1', '女性', null, '402881ea452582c101452583a5530051', null);
INSERT INTO `cms_type` VALUES ('402881f045b156f80145b1631ad10005', 'asd', 'as', null, '402881e545843fd40145844a4f8f001d', null);
INSERT INTO `cms_type` VALUES ('402881f145263b280145264141d80001', 'fda', 'sadfa', null, '402881ea452582c101452583a53c004b', null);
INSERT INTO `cms_type` VALUES ('402881f145263b28014526415f890003', 'asfda', 'adfasfd', null, '402881ea452582c101452583a53c004b', null);
INSERT INTO `cms_type` VALUES ('402881fe4ab2a838014ab2b7958b0003', 'dj', '独家', null, '402881fe4ab2a838014ab2b671910001', null);
INSERT INTO `cms_type` VALUES ('402881fe4ab2a838014ab2b804870007', 'rd', '热点', null, '402881fe4ab2a838014ab2b671910001', null);

-- ----------------------------
-- Table structure for cms_typegroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_typegroup`;
CREATE TABLE `cms_typegroup` (
  `ID` varchar(32) NOT NULL,
  `typegroupcode` varchar(50) DEFAULT NULL,
  `typegroupname` varchar(50) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_typegroup
-- ----------------------------
INSERT INTO `cms_typegroup` VALUES ('402881064ab445b1014ab44901cb0003', 'survey_fieldtype', '调查数据类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881904fabda06014fac712447001b', 'validation', '验证规则', '2015-09-08 18:12:20');
INSERT INTO `cms_typegroup` VALUES ('402881e545843fd40145844a4f8f001d', 'guestbook_ctg', '留言类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881e546612ef901466132d7b10001', 'renyuanleixing', '人员类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881e6453f1fb801453f5a3959000f', 'phone', '电话', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a5250048', 'icontype', '图标类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a52b0049', 'order', '订单类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a53a004a', 'custom', '客户类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a53c004b', 'service', '服务项目类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a53e004c', 'searchmode', '查询模式', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a540004d', 'yesorno', '逻辑条件', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a544004e', 'fieldtype', '字段类型', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a547004f', 'database', '数据表', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a54c0050', 'fieltype', '文档分类', null);
INSERT INTO `cms_typegroup` VALUES ('402881ea452582c101452583a5530051', 'sex', '性别类', null);
INSERT INTO `cms_typegroup` VALUES ('402881fe4ab2a838014ab2b671910001', 'content_mark', '内容标记', null);

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `head_portrait` varchar(225) DEFAULT NULL COMMENT '系统用户的头像',
  `email` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(30) DEFAULT NULL,
  `officePhone` varchar(20) DEFAULT NULL,
  `signatureFile` varchar(100) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_2cuji5h6yorrxgsr8ojndlmal` (`id`) USING BTREE,
  CONSTRAINT `cms_user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cms_base_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; (`id`) REFER `lm_maven_cms/cms_base_user`(`ID`)';

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('/upload/image/20150525/1432540221900041294.png', '123@qq.com', '13423421234', '01012345678', 'images/renfang/qm/licf.gif', '402881ea452582c101452583a5140044', null);

-- ----------------------------
-- Table structure for cms_version
-- ----------------------------
DROP TABLE IF EXISTS `cms_version`;
CREATE TABLE `cms_version` (
  `ID` varchar(32) NOT NULL,
  `loginpage` varchar(100) DEFAULT NULL,
  `versioncode` varchar(50) DEFAULT NULL,
  `versionname` varchar(30) DEFAULT NULL,
  `versionnum` varchar(20) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_version
-- ----------------------------

-- ----------------------------
-- Table structure for cms_video
-- ----------------------------
DROP TABLE IF EXISTS `cms_video`;
CREATE TABLE `cms_video` (
  `id` varchar(32) NOT NULL COMMENT '视频ID',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `videoname` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `videourl` varchar(4000) DEFAULT NULL COMMENT '视频url',
  `videoclassify` varchar(255) DEFAULT NULL COMMENT '分类',
  `time` varchar(255) DEFAULT NULL COMMENT '视频时长',
  `special` varchar(255) DEFAULT NULL COMMENT '视频专辑',
  `videoremark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of cms_video
-- ----------------------------

-- ----------------------------
-- Table structure for cms_video_adv
-- ----------------------------
DROP TABLE IF EXISTS `cms_video_adv`;
CREATE TABLE `cms_video_adv` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `headadvstatus` int(10) DEFAULT NULL COMMENT '片头广告状态',
  `headadvresource` varchar(255) DEFAULT NULL COMMENT '片头广告资源地址',
  `headadvlink` varchar(255) DEFAULT NULL COMMENT '片头广告链接',
  `headadvtime` int(10) DEFAULT NULL COMMENT '片头广告时长',
  `stopadvstatus` int(10) DEFAULT NULL COMMENT '暂停广告状态',
  `stopadvreource` varchar(255) DEFAULT NULL COMMENT '暂停广告资源地址',
  `stopadvlink` varchar(255) DEFAULT NULL COMMENT '暂停广告链接',
  `footadvstatus` int(10) DEFAULT NULL COMMENT '片尾广告状态',
  `footadvresource` varchar(255) DEFAULT NULL COMMENT '片尾广告资源地址',
  `footadvlink` varchar(255) DEFAULT NULL COMMENT '片尾广告链接',
  `footadvtime` int(10) DEFAULT NULL COMMENT '片尾广告时长',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频广告管理';

-- ----------------------------
-- Records of cms_video_adv
-- ----------------------------

-- ----------------------------
-- Table structure for cms_video_alburm
-- ----------------------------
DROP TABLE IF EXISTS `cms_video_alburm`;
CREATE TABLE `cms_video_alburm` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(225) DEFAULT NULL COMMENT '专辑名称',
  `sorttype` varchar(225) DEFAULT NULL COMMENT '排序方式:1-正序，2-倒序',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `relatearticle` varchar(500) DEFAULT NULL COMMENT '关联文章',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频专辑';

-- ----------------------------
-- Records of cms_video_alburm
-- ----------------------------

-- ----------------------------
-- Table structure for cms_video_alburm_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_video_alburm_article`;
CREATE TABLE `cms_video_alburm_article` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `alburmid` varchar(32) DEFAULT NULL COMMENT '视频专辑id',
  `articleid` int(32) DEFAULT NULL COMMENT '视频文章id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频专辑关联表';

-- ----------------------------
-- Records of cms_video_alburm_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_video_sources
-- ----------------------------
DROP TABLE IF EXISTS `cms_video_sources`;
CREATE TABLE `cms_video_sources` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `videoName` varchar(225) DEFAULT NULL COMMENT '视频原名',
  `realName` varchar(225) DEFAULT NULL COMMENT '上传后的名字',
  `transPath` varchar(300) DEFAULT NULL COMMENT '转化后本地路径',
  `localPath` varchar(300) DEFAULT NULL COMMENT '访问路径',
  `defaultimage` varchar(300) DEFAULT NULL COMMENT '默认图片',
  `type` varchar(10) DEFAULT NULL COMMENT '分类',
  `timesize` int(11) DEFAULT '0' COMMENT '时长',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `mark` varchar(500) DEFAULT NULL COMMENT '备注',
  `videosize` bigint(20) DEFAULT NULL,
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频库';

-- ----------------------------
-- Records of cms_video_sources
-- ----------------------------

-- ----------------------------
-- Table structure for cms_vote
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote`;
CREATE TABLE `cms_vote` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `voteType` varchar(255) DEFAULT NULL COMMENT '投票类型',
  `votePattern` varchar(255) DEFAULT NULL COMMENT '投票模式',
  `voteIntroduce` varchar(255) DEFAULT NULL COMMENT '介绍',
  `voteIpLimit` varchar(255) DEFAULT NULL COMMENT 'IP限制',
  `voteProvinceLimit` varchar(255) DEFAULT NULL COMMENT '是否省份限制',
  `voteStartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `voteEndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `voteTotal` int(255) DEFAULT NULL COMMENT '总票数',
  `voteMinInterval` varchar(255) DEFAULT NULL COMMENT '时间间隔',
  `maxVotes` int(255) DEFAULT NULL COMMENT '最多票数',
  `site_id` int(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票表';

-- ----------------------------
-- Records of cms_vote
-- ----------------------------

-- ----------------------------
-- Table structure for cms_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_log`;
CREATE TABLE `cms_vote_log` (
  `id` varchar(32) NOT NULL,
  `voteid` varchar(32) DEFAULT NULL COMMENT '投票id',
  `created` datetime DEFAULT NULL COMMENT '投票时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '投票人',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票日志表';

-- ----------------------------
-- Records of cms_vote_log
-- ----------------------------

-- ----------------------------
-- Table structure for cms_vote_log_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_log_data`;
CREATE TABLE `cms_vote_log_data` (
  `id` varchar(32) NOT NULL,
  `logid` varchar(32) DEFAULT NULL COMMENT '投票日志id',
  `optionid` varchar(32) DEFAULT NULL COMMENT '选项',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区县',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票日志选项';

-- ----------------------------
-- Records of cms_vote_log_data
-- ----------------------------

-- ----------------------------
-- Table structure for cms_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_option`;
CREATE TABLE `cms_vote_option` (
  `id` varchar(32) NOT NULL,
  `voteid` varchar(255) DEFAULT NULL COMMENT '投票ID',
  `optionName` varchar(255) DEFAULT NULL COMMENT '选项名称',
  `optionLink` varchar(255) DEFAULT NULL COMMENT '选项链接',
  `optionImg` varchar(255) DEFAULT NULL COMMENT '选项图片',
  `optionTotal` int(255) DEFAULT NULL COMMENT '初始票数',
  `optionSort` varchar(255) DEFAULT NULL COMMENT '排序',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票选项表';

-- ----------------------------
-- Records of cms_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for cms_wap_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_wap_config`;
CREATE TABLE `cms_wap_config` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `siteid` varchar(32) NOT NULL COMMENT '站点id',
  `wapstatus` varchar(100) DEFAULT NULL COMMENT '开启状态',
  `wapname` varchar(100) DEFAULT NULL COMMENT '网站名称',
  `waplogo` varchar(255) DEFAULT NULL COMMENT '网站LOGO',
  `indexcolumncount` varchar(50) DEFAULT NULL COMMENT '首页栏目内容条数',
  `indexminweights` varchar(50) DEFAULT NULL COMMENT '首页显示最低权重',
  `columncount` varchar(50) DEFAULT NULL COMMENT '栏目首页子栏目显示条数',
  `listcount` varchar(50) DEFAULT NULL COMMENT '列表页条数',
  `columnminweights` varchar(50) DEFAULT NULL COMMENT '栏目显示最低权重',
  `evaluatelistcount` varchar(50) DEFAULT NULL COMMENT '评论列表页条数',
  `indextemplate` varchar(50) DEFAULT NULL COMMENT '首页模板',
  `listtemplate` varchar(50) DEFAULT NULL COMMENT '列表页模板',
  `contenttemplate` varchar(255) DEFAULT NULL COMMENT '文章内容模板',
  `picturestemplate` varchar(50) DEFAULT NULL COMMENT '组图内容模板',
  `evaluatetemplate` varchar(50) DEFAULT NULL COMMENT '评论模板',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  `video_template` varchar(50) DEFAULT NULL COMMENT '视频模板',
  `surver_template` varchar(50) DEFAULT NULL COMMENT '调查模板',
  `vote_template` varchar(50) DEFAULT NULL COMMENT '投票模板',
  PRIMARY KEY (`id`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WAP配置';

-- ----------------------------
-- Records of cms_wap_config
-- ----------------------------
INSERT INTO `cms_wap_config` VALUES ('1', '1', '1', '雷铭wap', 'http://localhost:8088', '10', '10', '5', '10', '10', '10', 'wap/index.html', 'wap/list.html', 'wap/article.html', 'wap/picture.html', '', null, 'wap/video.html', 'wap/survey.html', 'wap/vote.html');

-- ----------------------------
-- Table structure for cms_wap_expand
-- ----------------------------
DROP TABLE IF EXISTS `cms_wap_expand`;
CREATE TABLE `cms_wap_expand` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `configid` varchar(32) DEFAULT NULL COMMENT '主配置id',
  `modelids` varchar(255) DEFAULT NULL COMMENT '模型',
  `catalogids` varchar(255) DEFAULT NULL COMMENT '栏目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WAP配置项扩展表';

-- ----------------------------
-- Records of cms_wap_expand
-- ----------------------------
INSERT INTO `cms_wap_expand` VALUES ('1', '1', '1,10,2,4,8', '30,31,86,28,41,79,27,87,76,54,64,');

-- ----------------------------
-- Table structure for cms_watermark
-- ----------------------------
DROP TABLE IF EXISTS `cms_watermark`;
CREATE TABLE `cms_watermark` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `imagepath` varchar(90) DEFAULT NULL COMMENT '片图路径',
  `position` varchar(32) DEFAULT NULL COMMENT '水印位置',
  `width` varchar(32) DEFAULT NULL COMMENT '宽',
  `height` varchar(32) DEFAULT NULL COMMENT '高',
  `undiaphaneity` varchar(32) DEFAULT NULL COMMENT '水印不透明度',
  `quality` varchar(32) DEFAULT NULL COMMENT '水印质量',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `defaultset` int(11) DEFAULT NULL COMMENT '默认方案',
  `departid` varchar(32) DEFAULT NULL COMMENT '所属id',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_watermark
-- ----------------------------

-- ----------------------------
-- Table structure for cms_weibo
-- ----------------------------
DROP TABLE IF EXISTS `cms_weibo`;
CREATE TABLE `cms_weibo` (
  `id` varchar(32) DEFAULT NULL COMMENT 'id',
  `site_id` varchar(255) DEFAULT NULL COMMENT '站点id',
  `client_ID` varchar(255) DEFAULT NULL COMMENT 'App Key',
  `client_SERCRET` varchar(255) DEFAULT NULL COMMENT 'App Secret',
  `redirect_URI` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `baseURL` varchar(255) DEFAULT NULL,
  `accessTokenURL` varchar(255) DEFAULT NULL,
  `authorizeURL` varchar(255) DEFAULT NULL,
  `rmURL` varchar(255) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_weibo
-- ----------------------------

-- ----------------------------
-- Table structure for cms_workflow
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow`;
CREATE TABLE `cms_workflow` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `steps` int(11) unsigned DEFAULT '0' COMMENT '步骤',
  `site_id` varchar(32) DEFAULT NULL COMMENT '点站id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for cms_workflow_auditing
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_auditing`;
CREATE TABLE `cms_workflow_auditing` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `relationID` varchar(32) NOT NULL COMMENT '关联ID',
  `type` int(11) DEFAULT NULL COMMENT '类别',
  `step` int(11) DEFAULT NULL COMMENT '步骤',
  `auditingrole` varchar(256) DEFAULT NULL COMMENT '审核角色',
  `opinion` varchar(1024) DEFAULT NULL COMMENT '审核意见',
  `Auditor` varchar(50) DEFAULT NULL COMMENT '审核人',
  `AuditingDate` datetime DEFAULT NULL COMMENT '审核时间',
  `AuditingResult` int(11) DEFAULT NULL COMMENT '审核结果',
  `OperatorOID` varchar(100) DEFAULT NULL COMMENT '审核人ID',
  `DelFlag` int(11) DEFAULT NULL COMMENT '删除标记',
  `site_id` varchar(32) DEFAULT NULL COMMENT '点站id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流审核表';

-- ----------------------------
-- Records of cms_workflow_auditing
-- ----------------------------

-- ----------------------------
-- Table structure for cms_workflow_step
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_step`;
CREATE TABLE `cms_workflow_step` (
  `id` varchar(32) NOT NULL,
  `step` int(11) DEFAULT '1' COMMENT '步骤',
  `roleid` varchar(32) DEFAULT NULL COMMENT '权限',
  `gid` varchar(32) DEFAULT NULL COMMENT '外键',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_workflow_step
-- ----------------------------

-- ----------------------------
-- Table structure for cm_advertisemen_content
-- ----------------------------
DROP TABLE IF EXISTS `cm_advertisemen_content`;
CREATE TABLE `cm_advertisemen_content` (
  `ID` varchar(32) NOT NULL,
  `is_inside` tinyint(1) DEFAULT NULL COMMENT '是否是内置广告',
  `img_url` varchar(160) DEFAULT NULL COMMENT '广告图片地址',
  `connect_url` varchar(160) DEFAULT NULL COMMENT '广告连接地址',
  `advertisement_code` varchar(3000) DEFAULT NULL COMMENT '广告广告代码',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容页广告';

-- ----------------------------
-- Records of cm_advertisemen_content
-- ----------------------------

-- ----------------------------
-- Table structure for cm_advertisemen_list
-- ----------------------------
DROP TABLE IF EXISTS `cm_advertisemen_list`;
CREATE TABLE `cm_advertisemen_list` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `title` varchar(16) DEFAULT NULL COMMENT '标题',
  `connect_url` varchar(160) DEFAULT NULL COMMENT '连接地址',
  `channelid` varchar(32) DEFAULT NULL COMMENT '频道ID',
  `brief` varchar(100) DEFAULT NULL COMMENT '摘要',
  `img_url` varchar(160) DEFAULT NULL COMMENT '列表图片',
  `slide_url` varchar(160) DEFAULT NULL COMMENT '列表幻灯片',
  `order_time` datetime DEFAULT NULL COMMENT '排序时间',
  `is_comment` tinyint(1) DEFAULT NULL COMMENT '是否开启评论',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(16) DEFAULT NULL COMMENT '创建人',
  `issue_user` varchar(16) DEFAULT NULL COMMENT '发布人',
  `issue_datetime` datetime DEFAULT NULL COMMENT '发布时间',
  `visit_num` int(11) DEFAULT NULL COMMENT '访问量',
  `adverti_status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='列表页广告';

-- ----------------------------
-- Records of cm_advertisemen_list
-- ----------------------------

-- ----------------------------
-- Table structure for cm_advertisemen_list_and_mobile_channel
-- ----------------------------
DROP TABLE IF EXISTS `cm_advertisemen_list_and_mobile_channel`;
CREATE TABLE `cm_advertisemen_list_and_mobile_channel` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `channelid` varchar(32) NOT NULL COMMENT '频道ID',
  `advertisemen_listid` varchar(32) NOT NULL COMMENT '广告列表ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告列表和频道关系表';

-- ----------------------------
-- Records of cm_advertisemen_list_and_mobile_channel
-- ----------------------------

-- ----------------------------
-- Table structure for cm_advertisemen_starting
-- ----------------------------
DROP TABLE IF EXISTS `cm_advertisemen_starting`;
CREATE TABLE `cm_advertisemen_starting` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高度',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽度',
  `img_url` varchar(160) DEFAULT NULL COMMENT '图片地址',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  `jump` int(4) DEFAULT NULL COMMENT '判断是否跳转',
  `showtime` double(4,1) DEFAULT NULL COMMENT '显示时间',
  `display` int(4) DEFAULT NULL COMMENT '是否显示',
  `siteId` varchar(32) DEFAULT NULL COMMENT '站点id',
  `sort` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='启动画面广告';

-- ----------------------------
-- Records of cm_advertisemen_starting
-- ----------------------------

-- ----------------------------
-- Table structure for cm_comments
-- ----------------------------
DROP TABLE IF EXISTS `cm_comments`;
CREATE TABLE `cm_comments` (
  `id` varchar(32) NOT NULL COMMENT 'comment_id',
  `contents_id` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `comment_type` varchar(50) DEFAULT NULL COMMENT '评价类型',
  `user_id` mediumint(8) unsigned DEFAULT NULL COMMENT '作者ID',
  `user_name` varchar(100) DEFAULT NULL COMMENT '作者',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `time` datetime DEFAULT NULL COMMENT '创建时间',
  `lastreply` datetime DEFAULT NULL COMMENT '最后回复时间',
  `reply_name` varchar(100) DEFAULT NULL COMMENT '回复者名称',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `comment` text COMMENT '内容',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  `display` varchar(255) DEFAULT NULL COMMENT 'display',
  `p_index` tinyint(2) DEFAULT NULL COMMENT 'p_index',
  `disabled` varchar(255) DEFAULT NULL COMMENT 'disabled',
  `grade` int(11) DEFAULT NULL COMMENT '评分',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动内容评价表';

-- ----------------------------
-- Records of cm_comments
-- ----------------------------

-- ----------------------------
-- Table structure for cm_content
-- ----------------------------
DROP TABLE IF EXISTS `cm_content`;
CREATE TABLE `cm_content` (
  `id` varchar(32) NOT NULL COMMENT '内容ID',
  `catid` varchar(32) NOT NULL COMMENT '栏目ID',
  `pathids` varchar(100) DEFAULT NULL COMMENT 'pathids',
  `modelid` varchar(32) DEFAULT NULL COMMENT '模型ID',
  `classify` varchar(255) DEFAULT NULL COMMENT '分类(1文章2组图3链接4视频5活动6投票7访谈8调查9专题)',
  `title` char(80) NOT NULL COMMENT '标题',
  `subtitle` varchar(120) DEFAULT NULL COMMENT '短标题',
  `color` text COMMENT '颜色',
  `thumb` varchar(255) DEFAULT NULL,
  `tags` char(60) DEFAULT NULL COMMENT '标签',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `editor` varchar(15) DEFAULT NULL COMMENT '编辑人',
  `sourceid` varchar(255) DEFAULT NULL COMMENT '来源ID',
  `url` char(100) DEFAULT NULL COMMENT 'URL路径',
  `weight` tinyint(3) DEFAULT '60' COMMENT '宽度',
  `status` varchar(255) DEFAULT '6' COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(255) DEFAULT NULL COMMENT '创建人',
  `published` datetime DEFAULT NULL COMMENT '发布时间',
  `publishedby` varchar(255) DEFAULT NULL COMMENT '发布人',
  `unpublished` bigint(20) DEFAULT NULL COMMENT 'unpublished',
  `unpublishedby` mediumint(8) DEFAULT NULL COMMENT 'unpublishedby',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modifiedby` varchar(255) DEFAULT NULL COMMENT '修改人',
  `checked` datetime DEFAULT NULL COMMENT '检查时间',
  `checkedby` varchar(255) DEFAULT NULL COMMENT '检查人',
  `locked` datetime DEFAULT NULL COMMENT '锁定时间',
  `lockedby` varchar(255) DEFAULT NULL COMMENT '锁定人',
  `noted` datetime DEFAULT NULL COMMENT '注解时间',
  `notedby` varchar(255) DEFAULT NULL COMMENT '注解人',
  `note` tinyint(1) DEFAULT '0' COMMENT '注解',
  `workflow_step` tinyint(1) DEFAULT NULL COMMENT '工作流步骤',
  `workflow_roleid` varchar(255) DEFAULT NULL COMMENT '工作流角色ID',
  `iscontribute` varchar(255) DEFAULT '0' COMMENT '是否投稿',
  `spaceid` mediumint(8) DEFAULT NULL COMMENT '专栏ID',
  `related` tinyint(3) DEFAULT '0' COMMENT 'related',
  `pv` mediumint(8) DEFAULT '0' COMMENT '浏览量',
  `allowcomment` varchar(255) DEFAULT '0' COMMENT '是否允许评论',
  `docExtendJson` varchar(4000) DEFAULT NULL COMMENT '扩展字段json',
  `digest` varchar(4000) DEFAULT NULL COMMENT '摘要',
  `attribute` varchar(255) DEFAULT NULL COMMENT '属性',
  `extendCount` int(11) DEFAULT '0' COMMENT '扩张字段数',
  `correlation` varchar(255) DEFAULT NULL COMMENT '相关',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `channelName` varchar(50) DEFAULT NULL COMMENT '频道名称',
  `iscollect` varchar(50) DEFAULT '0' COMMENT '是否收藏',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点Id',
  `grade` int(11) DEFAULT '0' COMMENT '评分',
  `publishedbyid` varchar(255) DEFAULT NULL COMMENT '发布人id',
  `list_thumbnail` varchar(255) DEFAULT NULL COMMENT '列表缩略图',
  `content_thumbnail` varchar(255) DEFAULT NULL COMMENT '内容缩略图',
  `slide_thumbnail` varchar(255) DEFAULT NULL COMMENT '幻灯片缩略图',
  `sort_dateTime` datetime DEFAULT NULL COMMENT '排序时间',
  `content_type` varchar(255) DEFAULT NULL COMMENT '移动内容类型',
  `two_code` varchar(255) DEFAULT NULL COMMENT '二维码',
  `content_mark` varchar(255) DEFAULT NULL COMMENT '内容标记',
  `relevanceid` varchar(32) DEFAULT NULL COMMENT '关联内容',
  `is_top` int(11) DEFAULT '0' COMMENT '置顶',
  `is_top_pic` int(11) DEFAULT '0' COMMENT '移动头图 0不是头图 1是头图',
  `isposter` int(2) DEFAULT '0' COMMENT '是否广告(0否1是)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of cm_content
-- ----------------------------

-- ----------------------------
-- Table structure for cm_content_article
-- ----------------------------
DROP TABLE IF EXISTS `cm_content_article`;
CREATE TABLE `cm_content_article` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `content` text COMMENT '内容',
  `pagecount` tinyint(2) NOT NULL DEFAULT '0' COMMENT '页数',
  `saveremoteimage` tinyint(1) NOT NULL DEFAULT '1' COMMENT '保存远程图片',
  `words_count` smallint(5) NOT NULL DEFAULT '0' COMMENT '字数',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of cm_content_article
-- ----------------------------

-- ----------------------------
-- Table structure for cm_feedback
-- ----------------------------
DROP TABLE IF EXISTS `cm_feedback`;
CREATE TABLE `cm_feedback` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `content` varchar(255) NOT NULL COMMENT '意见反馈内容',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `version` varchar(20) DEFAULT NULL COMMENT '应用版本',
  `system` varchar(30) DEFAULT NULL COMMENT '系统',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of cm_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for cm_invitation
-- ----------------------------
DROP TABLE IF EXISTS `cm_invitation`;
CREATE TABLE `cm_invitation` (
  `id` varchar(32) NOT NULL COMMENT 'comment_id',
  `contents_id` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `invitation_type` varchar(50) DEFAULT NULL COMMENT '跟帖类型',
  `user_id` varchar(32) DEFAULT NULL COMMENT '作者ID',
  `user_name` varchar(100) DEFAULT NULL COMMENT '作者',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `time` datetime DEFAULT NULL COMMENT '创建时间',
  `lastreply` datetime DEFAULT NULL COMMENT '最后回复时间',
  `reply_name` varchar(100) DEFAULT NULL COMMENT '回复者名称',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `comment` text COMMENT '内容',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  `display` varchar(255) DEFAULT NULL COMMENT 'display',
  `p_index` tinyint(2) DEFAULT NULL COMMENT 'p_index',
  `disabled` varchar(255) DEFAULT NULL COMMENT 'disabled',
  `grade` int(11) DEFAULT NULL COMMENT '评分',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `contents_title` varchar(255) DEFAULT NULL COMMENT '内容标题',
  `contents_url` varchar(255) DEFAULT NULL COMMENT '内容链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动内容跟帖表';

-- ----------------------------
-- Records of cm_invitation
-- ----------------------------

-- ----------------------------
-- Table structure for cm_link
-- ----------------------------
DROP TABLE IF EXISTS `cm_link`;
CREATE TABLE `cm_link` (
  `id` varchar(32) NOT NULL COMMENT '链接id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `linkname` varchar(255) DEFAULT NULL COMMENT '链接名称',
  `linkurl` varchar(4000) DEFAULT NULL COMMENT '链接url',
  `linkremark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `site_id` varchar(32) DEFAULT NULL COMMENT '点站id',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of cm_link
-- ----------------------------

-- ----------------------------
-- Table structure for cm_message
-- ----------------------------
DROP TABLE IF EXISTS `cm_message`;
CREATE TABLE `cm_message` (
  `id` varchar(32) NOT NULL DEFAULT '0' COMMENT '通知id',
  `inform_date` datetime DEFAULT NULL COMMENT '通知时间',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `inform_content` text COMMENT '通知内容',
  `inform_detail` varchar(255) DEFAULT NULL COMMENT '通知页面',
  `inform_type` varchar(11) DEFAULT NULL COMMENT '通知类型',
  `entironment_type` char(1) DEFAULT '1' COMMENT '运行环境类型(0,测试环境1,正式环境)',
  `entironment_name` varchar(100) DEFAULT NULL COMMENT '运行换环境名称',
  `target` int(11) DEFAULT '1' COMMENT '推送目标（1苹果,2安卓,3苹果+安卓）',
  `url` varchar(150) DEFAULT NULL COMMENT '连接的URL',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片的URL',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动通知表';

-- ----------------------------
-- Records of cm_message
-- ----------------------------

-- ----------------------------
-- Table structure for cm_mobile_channel
-- ----------------------------
DROP TABLE IF EXISTS `cm_mobile_channel`;
CREATE TABLE `cm_mobile_channel` (
  `id` varchar(32) NOT NULL COMMENT '频道id',
  `name` varchar(50) DEFAULT NULL COMMENT '频道名称',
  `pathids` varchar(255) DEFAULT NULL COMMENT '路径',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父频道id',
  `parentids` varchar(255) DEFAULT '0,' COMMENT '所有父频道id',
  `cat_id` varchar(255) DEFAULT NULL COMMENT '栏目ID',
  `channel_ico` varchar(255) DEFAULT NULL COMMENT '图标',
  `slide_show` int(1) DEFAULT NULL COMMENT '显示幻灯片(0代表 禁用   1代表 启用)',
  `slide_number` int(10) DEFAULT NULL COMMENT '幻灯片数量',
  `channel_states` int(1) DEFAULT NULL COMMENT '状态(0代表 禁用   1代表 启用)',
  `channel_top` int(1) DEFAULT '0' COMMENT '头条频道(0代表 否   1代表 是)',
  `pv` int(10) DEFAULT NULL COMMENT '浏览量',
  `comments` int(10) DEFAULT NULL COMMENT '评论数',
  `issued_amount` int(10) DEFAULT NULL COMMENT '发稿量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modifiedby` varchar(50) DEFAULT NULL COMMENT '修改人',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `levels` int(11) DEFAULT NULL COMMENT '级别',
  `workflowid` varchar(32) DEFAULT NULL COMMENT '工作流ID',
  `channel_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `path` varchar(100) DEFAULT NULL COMMENT '生成路径',
  `url` varchar(100) DEFAULT NULL COMMENT 'url',
  `constants` varchar(11) DEFAULT NULL COMMENT '文章状态',
  `channelHot` int(1) DEFAULT '0' COMMENT '热门频道 0：不是 1：是',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动频道';

-- ----------------------------
-- Records of cm_mobile_channel
-- ----------------------------
INSERT INTO `cm_mobile_channel` VALUES ('19', '图片', '0,19,', null, '0,', null, 'icon-picture', null, null, null, null, null, null, null, null, null, null, null, '2', '0', null, 'pic', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('23', '视频', '0,23,', null, '0,', null, 'icon-facetime-video', null, null, null, null, null, null, null, null, null, null, null, '1', '0', null, 'video', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('24', '唯美', '0,19,24,', '19', '0,19,', null, 'icon-picture', null, null, null, '1', null, null, null, '2015-06-04 16:29:29', null, null, null, '1', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('25', '资讯', '0,23,25,', '23', '0,23,', null, 'icon-facetime-video', null, null, null, '0', null, null, null, '2015-06-04 16:29:31', null, null, null, '2', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('27', '搞笑', '0,23,27,', '23', '0,23,', null, 'icon-facetime-video', null, null, null, '1', null, null, null, '2015-05-04 16:29:34', null, null, null, '1', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('297ebc2d4e2d69bd014e2ebcdd420013', '百态', '0,19,297ebc2d4e2d69bd014e2ebcdd420013', '19', '0,19,', null, '', null, null, null, '0', null, null, null, '2015-06-26 15:20:06', null, null, null, '0', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('297ebc2d4e2d69bd014e2ebf20680018', '综艺', '0,23,297ebc2d4e2d69bd014e2ebf20680018', '23', '0,23,', null, '', null, null, null, '0', null, null, null, '2015-06-26 15:22:34', null, null, null, '0', '1', null, 'video', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('297ebc2d4e2d69bd014e2ebfbdc5001a', '旅游', '0,34,297ebc2d4e2d69bd014e2ebfbdc5001a', '34', '0,34,', null, '', null, null, null, '0', null, null, null, '2015-06-26 15:23:14', null, null, null, '0', '1', null, 'news', null, null, null, '1', '1');
INSERT INTO `cm_mobile_channel` VALUES ('34', '新闻', '0,34', null, '0,', null, 'icon-book', null, null, null, null, null, null, null, null, null, null, null, '3', '0', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('35', '社会', '0,34,35', '34', '0,34,', null, 'icon-book', null, null, null, '1', null, null, null, null, null, null, null, '8', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('36', '明星', '0,34,36', '34', '0,34,', null, 'icon-book', null, null, null, '0', null, null, null, '2015-06-04 16:03:02', null, null, null, '7', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('37', '汽车', '0,34,37', '34', '0,34,', null, 'icon-book', null, null, null, '0', null, null, null, '2015-06-04 16:29:38', null, null, null, '6', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('38', '房产', '0,34,38', '34', '0,34,', null, 'icon-book', null, null, null, '0', null, null, null, '2015-06-04 16:29:41', null, null, null, '5', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('39', '八卦', '0,34,39', '34', '0,34,', null, 'icon-book', null, null, null, '0', null, null, null, '2015-05-04 16:29:43', null, null, null, '4', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('40', '美食', '0,34,40', '34', '0,34,', null, 'icon-book', null, null, null, '0', null, null, null, '2015-06-04 16:29:46', null, null, null, '3', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('45', '奇闻', '0,34,45', '34', '0,34,', null, 'icon-book', null, null, null, '0', null, null, null, '2015-06-04 16:29:48', null, null, null, '0', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('52', '国际', '0,34,52', '34', '0,34,', null, '', null, null, null, '0', null, null, null, '2015-06-04 16:29:51', null, null, null, '0', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('54', '国内', '0,34,54', '34', '0,34,', null, '', null, null, null, '0', null, null, null, '2015-06-04 16:29:53', null, null, null, '0', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('55', '投票', '0,55', null, '0,', null, '', null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('56', '趣图', '0,19,56', '19', '0,19,', null, 'icon-picture', null, null, null, '0', null, null, null, '2015-06-04 16:29:55', null, null, null, '0', '1', null, 'news', null, null, null, '0', '1');
INSERT INTO `cm_mobile_channel` VALUES ('58', '专题', '0,58', null, '0,', null, '', null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '', null, null, null, '0', '1');

-- ----------------------------
-- Table structure for cm_mobile_channel_priv
-- ----------------------------
DROP TABLE IF EXISTS `cm_mobile_channel_priv`;
CREATE TABLE `cm_mobile_channel_priv` (
  `id` varchar(32) NOT NULL COMMENT '栏目权限ID',
  `channelid` varchar(32) DEFAULT NULL COMMENT '移动栏目ID',
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动栏目权限表';

-- ----------------------------
-- Records of cm_mobile_channel_priv
-- ----------------------------
INSERT INTO `cm_mobile_channel_priv` VALUES ('1', '19', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('10', '37', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('100', '52', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('101', '54', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('102', '55', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('103', '19', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('104', '24', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('105', '56', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('106', '23', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('107', '25', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('108', '27', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('109', '34', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('11', '38', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('110', '35', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('111', '36', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('112', '37', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('113', '38', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('114', '39', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('115', '40', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('116', '45', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('117', '52', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('118', '54', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('119', '55', '402881f54a858830014a858adf1c0002', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('12', '39', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('120', '58', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('121', '58', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('13', '40', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('14', '45', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('15', '52', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('16', '54', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('17', '55', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('18', '19', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('19', '24', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('2', '24', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('20', '56', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('21', '23', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('22', '25', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('23', '27', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('24', '34', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('25', '35', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('26', '36', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('27', '37', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('28', '38', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('29', '39', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('297ebc2d4e2ee4d6014e2ef46488004d', '297ebc2d4e2d69bd014e2ebcdd420013', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('297ebc2d4e2ee4d6014e2ef4648b004e', '297ebc2d4e2d69bd014e2ebf20680018', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('3', '56', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('30', '40', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('31', '45', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('32', '52', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('33', '54', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('34', '55', '402881ea452582c101452583a5060043', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('4', '23', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881854e3d6517014e3eb208c40024', '297ebc2d4e2d69bd014e2ebfbdc5001a', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b60240002', '19', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b60950003', '24', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b60d60004', '56', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b60fb0005', '23', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b61140006', '25', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b61320007', '27', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b614a0008', '34', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b616c0009', '35', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b6189000a', '36', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b61a0000b', '37', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b61ee000c', '38', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b6484000d', '39', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b64a9000e', '40', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b64c4000f', '45', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b64e20010', '52', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b64fd0011', '54', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b65170012', '55', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('402881e54db35bdc014db39b65430013', '58', '402881e54db2caf6014db2e7bfdd0003', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('5', '25', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('52', '19', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('53', '24', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('54', '56', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('55', '23', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('56', '25', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('57', '27', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('58', '34', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('59', '35', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('6', '27', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('60', '36', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('61', '37', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('62', '38', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('63', '39', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('64', '40', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('65', '45', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('66', '52', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('67', '54', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('68', '55', '402881f54a858830014a859c8342004c', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('69', '19', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('7', '34', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('70', '24', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('71', '56', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('72', '23', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('73', '25', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('74', '27', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('75', '34', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('76', '35', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('77', '36', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('78', '37', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('79', '38', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('8', '35', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('80', '39', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('81', '40', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('82', '45', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('83', '52', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('84', '54', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('85', '55', '402882494aeb5bc9014aebce3fb40019', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('86', '19', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('87', '24', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('88', '56', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('89', '23', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('9', '36', '402881ea452582c101452583a5040042', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('90', '25', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('91', '27', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('92', '34', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('93', '35', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('94', '36', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('95', '37', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('96', '38', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('97', '39', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('98', '40', '402882494b2e74b3014b2f72f59d002a', null);
INSERT INTO `cm_mobile_channel_priv` VALUES ('99', '45', '402882494b2e74b3014b2f72f59d002a', null);

-- ----------------------------
-- Table structure for cm_picturealone
-- ----------------------------
DROP TABLE IF EXISTS `cm_picturealone`;
CREATE TABLE `cm_picturealone` (
  `id` varchar(32) NOT NULL COMMENT '单图片ID',
  `picturegroupid` varchar(32) DEFAULT NULL COMMENT '组图ID',
  `picture_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `picture_message` varchar(255) DEFAULT NULL COMMENT '图片信息',
  `picture_width` varchar(255) DEFAULT NULL COMMENT '宽度',
  `picture_height` varchar(255) DEFAULT NULL COMMENT '长度',
  `picture_sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of cm_picturealone
-- ----------------------------

-- ----------------------------
-- Table structure for cm_picture_classify
-- ----------------------------
DROP TABLE IF EXISTS `cm_picture_classify`;
CREATE TABLE `cm_picture_classify` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `marker` varchar(255) DEFAULT NULL COMMENT '标记',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动图片分类表';

-- ----------------------------
-- Records of cm_picture_classify
-- ----------------------------

-- ----------------------------
-- Table structure for cm_picture_group
-- ----------------------------
DROP TABLE IF EXISTS `cm_picture_group`;
CREATE TABLE `cm_picture_group` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `image` varchar(255) DEFAULT NULL COMMENT '图片名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `url` text COMMENT 'url',
  `url_thumb` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `sort` tinyint(11) unsigned DEFAULT '0' COMMENT '排序',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `pictureclassifyid` varchar(32) DEFAULT NULL COMMENT '图片分类id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片组表';

-- ----------------------------
-- Records of cm_picture_group
-- ----------------------------

-- ----------------------------
-- Table structure for cm_relate_content
-- ----------------------------
DROP TABLE IF EXISTS `cm_relate_content`;
CREATE TABLE `cm_relate_content` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'id',
  `content_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '内容ID',
  `relate_title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `relate_url` char(100) DEFAULT NULL COMMENT 'URL路径',
  `images` char(100) NOT NULL DEFAULT '60' COMMENT '缩略图',
  `relate_type` varchar(255) NOT NULL DEFAULT '6' COMMENT '类型',
  `relate_order` int(10) DEFAULT NULL COMMENT '顺序',
  `newdate` datetime DEFAULT NULL COMMENT '表单新增时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `part` varchar(255) DEFAULT NULL COMMENT '区别内容id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相关内容表';

-- ----------------------------
-- Records of cm_relate_content
-- ----------------------------

-- ----------------------------
-- Table structure for cm_simplespecial
-- ----------------------------
DROP TABLE IF EXISTS `cm_simplespecial`;
CREATE TABLE `cm_simplespecial` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `special_name` varchar(255) DEFAULT NULL COMMENT '专题名称',
  `special_content` text COMMENT '专题内容',
  `special_thub` varchar(255) DEFAULT NULL COMMENT '列表缩略图',
  `special_create` datetime DEFAULT NULL COMMENT '创建时间',
  `special_created` varchar(255) DEFAULT NULL COMMENT '创建人',
  `special_mark` varchar(255) DEFAULT NULL COMMENT '专题标记',
  `special_state` varchar(255) DEFAULT NULL COMMENT '专题说明',
  `special_type` varchar(255) DEFAULT NULL COMMENT '专题分类',
  `special_slide` varchar(255) DEFAULT NULL COMMENT '专题头图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单专题';

-- ----------------------------
-- Records of cm_simplespecial
-- ----------------------------

-- ----------------------------
-- Table structure for cm_simplespecial_content
-- ----------------------------
DROP TABLE IF EXISTS `cm_simplespecial_content`;
CREATE TABLE `cm_simplespecial_content` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `simplespecialid` varchar(32) DEFAULT NULL COMMENT '简单专题id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单专题内容关联表';

-- ----------------------------
-- Records of cm_simplespecial_content
-- ----------------------------

-- ----------------------------
-- Table structure for cm_suggest
-- ----------------------------
DROP TABLE IF EXISTS `cm_suggest`;
CREATE TABLE `cm_suggest` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `suggest_content` text COMMENT '反馈意见内容',
  `suggest_type` varchar(32) DEFAULT NULL COMMENT '反馈类别',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(32) DEFAULT NULL COMMENT '电话',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of cm_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for cm_survey
-- ----------------------------
DROP TABLE IF EXISTS `cm_survey`;
CREATE TABLE `cm_survey` (
  `id` varchar(32) NOT NULL,
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `custom` varchar(255) DEFAULT NULL COMMENT '自定义模板',
  `pageBackground` varchar(1000) DEFAULT NULL COMMENT '页面背景图',
  `recipient` varchar(255) DEFAULT NULL COMMENT '接收人',
  `surveyStartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `surveyEndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `surveyPeoLimit` varchar(255) DEFAULT NULL COMMENT '人数限制',
  `surveyIpLimit` varchar(255) DEFAULT NULL COMMENT 'IP限制',
  `isVip` varchar(255) DEFAULT NULL COMMENT '是否会员',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `surveyid` varchar(32) DEFAULT NULL COMMENT '调查PCId',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查表';

-- ----------------------------
-- Records of cm_survey
-- ----------------------------

-- ----------------------------
-- Table structure for cm_sys_iso_token
-- ----------------------------
DROP TABLE IF EXISTS `cm_sys_iso_token`;
CREATE TABLE `cm_sys_iso_token` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `token` varchar(100) NOT NULL COMMENT 'token',
  `sys_type` varchar(50) DEFAULT NULL COMMENT '系统类型',
  `phone_name` varchar(50) DEFAULT NULL COMMENT '手机品牌',
  `phone_type` varchar(50) DEFAULT NULL COMMENT '手机型号',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='获取IOS设备的token';

-- ----------------------------
-- Records of cm_sys_iso_token
-- ----------------------------

-- ----------------------------
-- Table structure for cm_update_version
-- ----------------------------
DROP TABLE IF EXISTS `cm_update_version`;
CREATE TABLE `cm_update_version` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `sys_type` varchar(20) DEFAULT NULL COMMENT '系统类型',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `account` varchar(3000) DEFAULT NULL COMMENT '更新说明',
  `down_url` varchar(200) DEFAULT NULL COMMENT '下载地址',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本升级';

-- ----------------------------
-- Records of cm_update_version
-- ----------------------------

-- ----------------------------
-- Table structure for cm_video
-- ----------------------------
DROP TABLE IF EXISTS `cm_video`;
CREATE TABLE `cm_video` (
  `id` varchar(32) NOT NULL COMMENT '视频ID',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `videoname` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `videourl` varchar(4000) DEFAULT NULL COMMENT '视频url',
  `videoclassify` varchar(255) DEFAULT NULL COMMENT '分类',
  `time` varchar(255) DEFAULT NULL COMMENT '视频时长',
  `special` varchar(255) DEFAULT NULL COMMENT '视频专辑',
  `videoremark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `videoclassifyid` varchar(32) DEFAULT NULL COMMENT '视频分类id',
  `createdtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of cm_video
-- ----------------------------

-- ----------------------------
-- Table structure for cm_video_classify
-- ----------------------------
DROP TABLE IF EXISTS `cm_video_classify`;
CREATE TABLE `cm_video_classify` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `marker` varchar(255) DEFAULT NULL COMMENT '标记',
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动视频分类表';

-- ----------------------------
-- Records of cm_video_classify
-- ----------------------------

-- ----------------------------
-- Table structure for cm_vote
-- ----------------------------
DROP TABLE IF EXISTS `cm_vote`;
CREATE TABLE `cm_vote` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容ID',
  `voteType` varchar(255) DEFAULT NULL COMMENT '投票类型',
  `votePattern` varchar(255) DEFAULT NULL COMMENT '投票模式',
  `voteIntroduce` varchar(255) DEFAULT NULL COMMENT '介绍',
  `voteIpLimit` varchar(255) DEFAULT NULL COMMENT 'IP限制',
  `voteProvinceLimit` varchar(255) DEFAULT NULL COMMENT '是否省份限制',
  `voteStartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `voteEndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `voteTotal` int(255) DEFAULT NULL COMMENT '总票数',
  `voteMinInterval` varchar(255) DEFAULT NULL COMMENT '时间间隔',
  `maxVotes` int(255) DEFAULT NULL COMMENT '最多票数',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `voteid` varchar(32) DEFAULT NULL COMMENT '投票PCId',
  `createdtime` datetime DEFAULT NULL COMMENT '创建世界',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票表';

-- ----------------------------
-- Records of cm_vote
-- ----------------------------

-- ----------------------------
-- Table structure for sina_content
-- ----------------------------
DROP TABLE IF EXISTS `sina_content`;
CREATE TABLE `sina_content` (
  `id` varchar(32) NOT NULL,
  `sina_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sina_digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `sina_thumb` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `sina_url` varchar(255) DEFAULT NULL,
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `contentid` varchar(32) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sina_content
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_button
-- ----------------------------
DROP TABLE IF EXISTS `wechat_button`;
CREATE TABLE `wechat_button` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `wuId` varchar(32) DEFAULT NULL COMMENT '公众号Id',
  `token` varchar(255) DEFAULT NULL COMMENT '公众号token',
  `pid` varchar(32) DEFAULT NULL COMMENT '父Id',
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `type` varchar(32) DEFAULT NULL COMMENT '响应动作类型',
  `media_id` varchar(256) DEFAULT NULL COMMENT '资源Id',
  `url` varchar(256) DEFAULT NULL COMMENT '网页链接',
  `menuKey` varchar(128) DEFAULT NULL COMMENT '菜单KEY值',
  `level` int(11) DEFAULT NULL COMMENT '菜单级别',
  `isShow` bit(1) DEFAULT b'1' COMMENT '是否显示',
  `version` int(11) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单';

-- ----------------------------
-- Records of wechat_button
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_cert
-- ----------------------------
DROP TABLE IF EXISTS `wechat_cert`;
CREATE TABLE `wechat_cert` (
  `id` int(11) NOT NULL COMMENT '密钥Id',
  `whId` varchar(32) DEFAULT NULL COMMENT '公众号Id',
  `token` varchar(32) DEFAULT NULL COMMENT 'token',
  `apiclient_cert` varchar(255) DEFAULT NULL COMMENT '密钥',
  `apiclient_key` varchar(255) DEFAULT NULL COMMENT '私钥',
  `rootca` varchar(255) DEFAULT NULL COMMENT 'rootca',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='密钥管理';

-- ----------------------------
-- Records of wechat_cert
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `wechat_config`;
CREATE TABLE `wechat_config` (
  `id` varchar(255) NOT NULL COMMENT 'id',
  `configName` varchar(255) DEFAULT NULL COMMENT '参数名称',
  `configValue` varchar(1000) DEFAULT NULL COMMENT '参数值',
  `remark` text COMMENT '备注',
  `version` int(11) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信参数';

-- ----------------------------
-- Records of wechat_config
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_configure
-- ----------------------------
DROP TABLE IF EXISTS `wechat_configure`;
CREATE TABLE `wechat_configure` (
  `Id` varchar(32) NOT NULL COMMENT 'id',
  `AppId` varchar(255) NOT NULL COMMENT '微信公众账号appid',
  `Secret` varchar(255) NOT NULL COMMENT '微信公众号的秘钥',
  `token` varchar(255) NOT NULL COMMENT '微信公众号的token',
  `AesKey` varchar(255) NOT NULL COMMENT '微信公众号的EncodingAESKey',
  `siteid` varchar(32) NOT NULL COMMENT '站点id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechat_configure
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_content
-- ----------------------------
DROP TABLE IF EXISTS `wechat_content`;
CREATE TABLE `wechat_content` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `WEIXIN_TITLE` varchar(255) DEFAULT NULL COMMENT '内容标题',
  `WEIXIN_DIGEST` varchar(255) DEFAULT NULL COMMENT '内容摘要',
  `WEIXIN_CONTENT` text COMMENT '内容',
  `WEIXIN_CONTENTADDRESS` varchar(255) DEFAULT NULL COMMENT '内容地址',
  `WEIXIN_PICTUREURL` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `WEIXIN_SORT` varchar(255) DEFAULT NULL COMMENT '排序',
  `WEIXIN_TOP` int(11) DEFAULT NULL COMMENT ' 是否是头条, 1:是,0:否',
  `CONTENT_ID` varchar(32) DEFAULT NULL COMMENT '文章内容id',
  `WEIXIN_ID` varchar(32) DEFAULT NULL COMMENT '微信id',
  `SHOW_COVER_PIC` int(11) DEFAULT NULL COMMENT '是否显示封面，1为显示，0为不显示',
  `WEIXIN_AUTHOR` varchar(255) DEFAULT NULL COMMENT '作者',
  `WEIXIN_CREATETIME` datetime DEFAULT NULL COMMENT '微信内容创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechat_content
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_push
-- ----------------------------
DROP TABLE IF EXISTS `wechat_push`;
CREATE TABLE `wechat_push` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '微信id',
  `CREATE_PERSON` varchar(255) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PUSH_PERSON` varchar(255) DEFAULT NULL COMMENT '推送人',
  `PUSH_TIME` datetime DEFAULT NULL COMMENT '推送时间',
  `IS_PUSH` int(11) DEFAULT NULL COMMENT '是否推送,1:是,0:否',
  `IS_SUCESSPUSH` int(11) DEFAULT NULL COMMENT '是否推送成功,1:成功,0:失败',
  `site_id` varchar(32) DEFAULT NULL COMMENT '站点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechat_push
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `wechat_user`;
CREATE TABLE `wechat_user` (
  `id` varchar(32) NOT NULL COMMENT '公众号Id',
  `name` varchar(255) DEFAULT NULL COMMENT '公众号名称',
  `originalId` varchar(255) DEFAULT NULL COMMENT '公众号原始id',
  `wechatId` varchar(255) DEFAULT NULL COMMENT '微信号',
  `appId` varchar(255) DEFAULT NULL COMMENT 'AppID',
  `appSecret` varchar(255) DEFAULT NULL COMMENT 'AppSecret',
  `qrPath` varchar(400) DEFAULT NULL COMMENT '二维码',
  `type` varchar(255) DEFAULT NULL COMMENT '微信号类型',
  `access_token` varchar(1024) DEFAULT NULL COMMENT 'access_token',
  `aeskey` varchar(255) DEFAULT NULL COMMENT '消息加解密密钥',
  `encode` varchar(255) DEFAULT NULL COMMENT '消息加密方式',
  `headerpic` varchar(255) DEFAULT NULL COMMENT '头像',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `QQ` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `lastGetAccessTokenTime` datetime DEFAULT NULL COMMENT '最后一次获取accessToken时间',
  `lastOverdueTime` datetime DEFAULT NULL COMMENT '倒数第二次获取accessToken实际到期时间',
  `isUpdate` bit(1) DEFAULT b'0' COMMENT '是否已经提前更新',
  `version` int(11) DEFAULT NULL COMMENT '版本',
  `email` varchar(100) DEFAULT NULL COMMENT '公众号邮箱',
  `fansCount` int(11) DEFAULT '0' COMMENT '粉丝数',
  `isStartingUsingCoupons` bit(1) DEFAULT b'0' COMMENT '是否启用微信卡券',
  `isShowNearbyNews` bit(1) DEFAULT b'0' COMMENT '是否启用附近图文',
  `isOpenChat` bit(1) DEFAULT b'0' COMMENT '是否开启聊天（小黄鸡）',
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `city` varchar(100) DEFAULT NULL COMMENT '市',
  `region` varchar(150) DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wechat_user
-- ----------------------------
