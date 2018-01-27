/*
 Navicat Premium Data Transfer

 Source Server         : 本机Mysql数据库
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : mxonline

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 27/01/2018 20:47:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Banner
-- ----------------------------
DROP TABLE IF EXISTS `Banner`;
CREATE TABLE `Banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_croatian_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of Banner
-- ----------------------------
BEGIN;
INSERT INTO `Banner` VALUES (1, '好课程就免费', 'Banner/2018/01/57a801860001c34b12000460_z4Vb8zl.jpg', 'http://127.0.0.1:8000/course_detail/1/', 0, '2017-12-27 18:03:30.000000');
INSERT INTO `Banner` VALUES (2, '第二个', 'Banner/2018/01/57aa86a0000145c512000460_GXIBATC.jpg', 'http://127.0.0.1:8000/course_detail/2/', 1, '2018-01-06 12:52:24.000000');
COMMIT;

-- ----------------------------
-- Table structure for CityDict
-- ----------------------------
DROP TABLE IF EXISTS `CityDict`;
CREATE TABLE `CityDict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_croatian_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of CityDict
-- ----------------------------
BEGIN;
INSERT INTO `CityDict` VALUES (1, '北京市', '北京', '2017-12-27 20:41:58.000000');
INSERT INTO `CityDict` VALUES (2, '上海市', '上海市', '2017-12-29 22:13:01.000000');
INSERT INTO `CityDict` VALUES (3, '广州市', '广州市', '2017-12-29 22:13:10.000000');
INSERT INTO `CityDict` VALUES (4, '深证市', '深证市', '2017-12-29 22:13:21.000000');
INSERT INTO `CityDict` VALUES (5, '郑州市', '郑州市', '2017-12-29 22:13:35.000000');
INSERT INTO `CityDict` VALUES (6, '驻马店市', '驻马店市', '2017-12-29 22:13:48.000000');
INSERT INTO `CityDict` VALUES (7, '商丘市', '商丘市', '2017-12-29 22:13:56.000000');
INSERT INTO `CityDict` VALUES (8, '合肥市', '合肥市', '2017-12-29 22:14:06.000000');
INSERT INTO `CityDict` VALUES (9, '南京市', '南京市', '2017-12-29 22:14:15.000000');
INSERT INTO `CityDict` VALUES (10, '大庆市', '大庆市', '2017-12-29 22:14:24.000000');
INSERT INTO `CityDict` VALUES (11, '河北市', '河北市', '2017-12-29 22:15:52.000000');
INSERT INTO `CityDict` VALUES (12, '天津市', '天津市', '2017-12-29 22:16:01.000000');
INSERT INTO `CityDict` VALUES (13, '哈尔滨', '黑龙江哈尔滨', '2017-12-29 22:25:47.000000');
COMMIT;

-- ----------------------------
-- Table structure for Coures
-- ----------------------------
DROP TABLE IF EXISTS `Coures`;
CREATE TABLE `Coures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `desc` varchar(300) COLLATE utf8_croatian_ci NOT NULL,
  `detail` longtext COLLATE utf8_croatian_ci NOT NULL,
  `degree` varchar(5) COLLATE utf8_croatian_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `kcjs_org_id` int(11) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL,
  `tag` varchar(20) COLLATE utf8_croatian_ci,
  `kcxz` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL,
  `xdaoshenm` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `is_tg` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Coures_course_org_id_84f074b5_fk_CourseOrg_id` (`course_org_id`),
  KEY `Coures_kcjs_org_id_2f195f92_fk_Teacher_id` (`kcjs_org_id`),
  CONSTRAINT `Coures_course_org_id_84f074b5_fk_CourseOrg_id` FOREIGN KEY (`course_org_id`) REFERENCES `CourseOrg` (`id`),
  CONSTRAINT `Coures_kcjs_org_id_2f195f92_fk_Teacher_id` FOREIGN KEY (`kcjs_org_id`) REFERENCES `Teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of Coures
-- ----------------------------
BEGIN;
INSERT INTO `Coures` VALUES (1, 'Django基础', 'Django基础Django基础', '<p>&nbsp; &nbsp;<img src=\"http://img.baidu.com/hi/jx2/j_0015.gif\"/> <span style=\"color: rgb(255, 0, 0);\"></span><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\">基础</span></span></p><table><tbody><tr class=\"firstRow\"><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr><tr><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td><td width=\"37\" valign=\"top\"><br/> </td></tr></tbody></table><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\">Django基础<img src=\"/Banner/course/image/LIVE_20180107015528_540.gif\" alt=\"LIVE.gif\"/>Djan</span></span><br/> </p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"><br/> </span></span></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"><img src=\"/Banner/course/image/0_20180107015951.gif\" title=\"\" alt=\"0.gif\"/> <img src=\"/Banner/course/image/LIVE_20180107022701.gif\" title=\"\" alt=\"LIVE.gif\"/> </span></span></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"><br/> </span></span></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"></span></span></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/> <a style=\"font-size:12px; color:#0066cc;\" href=\"/Banner/courses/file/OKIJUHGY_20180107020008.jpg\" title=\"OKIJUHGY.jpg\">OKIJUHGY.jpg</a></p><p><img src=\"/Banner/course/image/LIVE_20180107020028.gif\" title=\"\" alt=\"LIVE.gif\"/> <img src=\"/Banner/course/image/0_20180107022712.gif\" title=\"\" alt=\"0.gif\"/> <span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"><img src=\"http://img.baidu.com/hi/jx2/j_0061.gif\"/> </span></span><br/> </p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/> <a style=\"font-size:12px; color:#0066cc;\" href=\"/Banner/courses/file/LIVE_20180107020041.gif\" title=\"LIVE.gif\">LIVE.gif</a></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"><br/> </span></span></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"><br/> </span></span></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\"></span></span></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/> <a style=\"font-size:12px; color:#0066cc;\" href=\"/Banner/courses/file/0_20180107015549_220.gif\" title=\"0.gif\">0.gif</a></p><p><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\"><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px; color: rgb(255, 0, 0);\">go基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础</span>Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础Django基础</span><br/> </p><table><tbody><tr class=\"firstRow\"><td width=\"271\" valign=\"top\" style=\"word-break: break-all;\"><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">333333333333333333333</span></td><td width=\"271\" valign=\"top\" style=\"word-break: break-all;\"><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">111111111111</span></td></tr><tr><td width=\"271\" valign=\"top\" style=\"word-break: break-all;\"><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">4444444444444</span></td><td width=\"271\" valign=\"top\" style=\"word-break: break-all;\"><span label=\"强调\" style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">222222222222</span></td></tr></tbody></table><p><br/> </p>', 'zj', 111, 100, 96, 'courses/2017/12/094it9gkfv.jpg', 1172, '2017-12-27 20:45:21.000000', 2, 2, 'Django开发', 'Python开发', '这是Django课程，需要您有Python基础，不然讲到后面你会懵逼的！', '让你从Django的入门到放弃！！！！！！！！！', 0);
INSERT INTO `Coures` VALUES (2, 'Python高级开发', '高级开发的课程描述', '<p>&nbsp; &nbsp; 课程详情的课程详情<img src=\"/Banner/course/image/0_20180107111355.gif\" title=\"\" alt=\"0.gif\"/>\r\n </p>', 'zj', 20, 2000, 12, 'courses/2018/01/LIVE.gif', 90137, '2017-12-31 19:46:21.000000', 2, 1, 'Python开发', 'Python开发', NULL, NULL, 1);
INSERT INTO `Coures` VALUES (3, 'Django基础', '描述是吧', '课程详情是吧', 'zj', 0, 0, 0, 'courses/2018/01/1.jpg', 0, '2018-01-06 13:17:29.000000', 3, 2, 'Django', 'Python开发', '课程须知是吧', '能学到什么是吧', 0);
INSERT INTO `Coures` VALUES (4, 'java基础', 'java基础的描述', 'java基础的课程详情', 'gj', 0, 0, 0, 'courses/2018/01/2.jpg', 6, '2018-01-06 13:18:52.000000', 7, 1, 'java课程类别是吧', '课程标签是吧', 'java课程须知是吧', '能学到什么是吧', 0);
INSERT INTO `Coures` VALUES (5, 'PHP入门到放弃', '课程描述是吧', '课程详情是吧', 'zj', 0, 0, 0, 'courses/2018/01/3EEE12121.jpg', 0, '2018-01-06 13:20:02.000000', 6, 2, '课程类别是吧', 'php开发', '课程须知是吧', '能学到什么是吧', 0);
INSERT INTO `Coures` VALUES (6, 'ios入门到大神', '课程描述是吧', '课程详情是吧', 'zj', 0, 0, 0, 'courses/2018/01/3EE.jpg', 2, '2018-01-06 13:21:20.000000', 3, 2, '课程类别是吧', 'IOS开发', '课程须知是吧', '能学到什么是吧', 1);
INSERT INTO `Coures` VALUES (7, 'Python进阶开发', '课程描述是吧', '课程详情是吧', 'zj', 0, 0, 0, 'courses/2018/01/22.jpg', 4, '2018-01-06 13:22:19.000000', 9, 2, '课程类别是吧', 'Python开发', '课程须知是吧', '能学到什么是吧', 0);
INSERT INTO `Coures` VALUES (8, 'C语言入门到放弃', '课程描述是吧', '<p>&nbsp; &nbsp; 课程详情是吧<img src=\"/Banner/course/image/LIVE_20180107020318.gif\" alt=\"LIVE.gif\"/></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Banner/courses/file/LIVE_20180107020329.gif\" title=\"LIVE.gif\">LIVE.gif</a></p><p><br/></p>', 'cj', 0, 0, 1, 'courses/2018/01/9.jpg', 9, '2018-01-06 13:23:33.000000', 8, 2, '课程类别', 'C语言开发', '课程须知', '能学到什么', 0);
COMMIT;

-- ----------------------------
-- Table structure for CourseComments
-- ----------------------------
DROP TABLE IF EXISTS `CourseComments`;
CREATE TABLE `CourseComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(300) COLLATE utf8_croatian_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CourseComments_course_id_e71e2e9f_fk_Coures_id` (`course_id`),
  KEY `CourseComments_user_id_de1dcfa4_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `CourseComments_course_id_e71e2e9f_fk_Coures_id` FOREIGN KEY (`course_id`) REFERENCES `Coures` (`id`),
  CONSTRAINT `CourseComments_user_id_de1dcfa4_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of CourseComments
-- ----------------------------
BEGIN;
INSERT INTO `CourseComments` VALUES (3, '哈哈哈哈哈哈哈或或或或，这是一条评论啦', '2018-01-02 21:04:26.000000', 1, 1);
INSERT INTO `CourseComments` VALUES (4, '111111111', '2018-01-02 21:46:35.933388', 1, 1);
INSERT INTO `CourseComments` VALUES (5, 'hhhhhhhhh', '2018-01-02 21:46:47.527776', 1, 1);
INSERT INTO `CourseComments` VALUES (6, '我是专业的水军，获得世界冠军的键盘侠！！！！！！！！！！！！', '2018-01-02 21:47:41.596916', 1, 1);
INSERT INTO `CourseComments` VALUES (7, '111111111111', '2018-01-05 17:53:38.901076', 2, 1);
INSERT INTO `CourseComments` VALUES (8, '11111111111', '2018-01-05 23:34:51.143983', 2, 1);
INSERT INTO `CourseComments` VALUES (9, '1', '2018-01-13 18:06:34.545727', 8, 2);
INSERT INTO `CourseComments` VALUES (10, '111111', '2018-01-13 18:06:38.602817', 8, 2);
INSERT INTO `CourseComments` VALUES (11, '111111', '2018-01-13 18:06:41.954408', 8, 2);
INSERT INTO `CourseComments` VALUES (12, '1111', '2018-01-13 18:06:44.617787', 8, 2);
INSERT INTO `CourseComments` VALUES (13, '11111', '2018-01-13 18:06:47.356824', 8, 2);
INSERT INTO `CourseComments` VALUES (14, '1111', '2018-01-13 18:06:50.494332', 8, 2);
INSERT INTO `CourseComments` VALUES (15, '111', '2018-01-13 18:06:52.501461', 8, 2);
INSERT INTO `CourseComments` VALUES (16, '111', '2018-01-13 18:06:54.818907', 8, 2);
INSERT INTO `CourseComments` VALUES (17, '11111', '2018-01-13 18:06:58.346519', 8, 2);
INSERT INTO `CourseComments` VALUES (18, '11111', '2018-01-13 18:07:01.452982', 8, 2);
INSERT INTO `CourseComments` VALUES (19, '11111', '2018-01-13 18:07:09.205441', 8, 2);
INSERT INTO `CourseComments` VALUES (20, '1111', '2018-01-13 18:07:12.094387', 8, 2);
INSERT INTO `CourseComments` VALUES (21, '1111', '2018-01-13 18:07:14.514085', 8, 2);
INSERT INTO `CourseComments` VALUES (22, '1111', '2018-01-13 18:07:16.683582', 8, 2);
INSERT INTO `CourseComments` VALUES (23, '1111', '2018-01-13 18:07:18.983656', 8, 2);
INSERT INTO `CourseComments` VALUES (24, '1111', '2018-01-13 18:07:21.133001', 8, 2);
INSERT INTO `CourseComments` VALUES (25, '1111', '2018-01-13 18:07:23.385912', 8, 2);
INSERT INTO `CourseComments` VALUES (26, '112222', '2018-01-13 18:07:26.307233', 8, 2);
INSERT INTO `CourseComments` VALUES (27, '1111', '2018-01-13 18:07:28.919071', 8, 2);
COMMIT;

-- ----------------------------
-- Table structure for CourseOrg
-- ----------------------------
DROP TABLE IF EXISTS `CourseOrg`;
CREATE TABLE `CourseOrg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `desc` longtext COLLATE utf8_croatian_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `catgory` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `kcs` int(11) NOT NULL,
  `lxfs` varchar(20) COLLATE utf8_croatian_ci NOT NULL,
  `xxrs` int(11) NOT NULL,
  `org_tag` varchar(4) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CourseOrg_city_id_a58b7f7e_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `CourseOrg_city_id_a58b7f7e_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of CourseOrg
-- ----------------------------
BEGIN;
INSERT INTO `CourseOrg` VALUES (2, '北京大学', '北京大学，简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是最早以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中国高等教育的奠基者。[1] \r\n1912年5月3日，京师大学堂改称北京大学校，严复为首任校长。[2]  1916年，蔡元培出任校长，“循思想自由原则、取兼容并包之义”，把北大办成全国学术和思想中心，使北大成为新文化运动中心、五四运动策源地。1937年抗日战争爆发，北大与清华大学、南开大学南迁长沙，组成国立长沙临时大学。不久迁往昆明，改称国立西南联合大学。1946年10月在北平复学。[1]  1952年院系调整，校园从内城沙滩红楼迁至西北郊燕园。[3-4] \r\n                北大由教育部直属，中央直管副部级建制，是国家双一流[5]  、211工程[1]  、985工程[1]  、2011计划重点建设的全国重点大学；是九校联盟（C9）[6]  及中国大学校长联谊会、亚洲大学联盟[7]  、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、东亚四大学论坛、国际公立大学论坛、中俄综合性大学联盟[8]  重要成员。[9-11] \r\n                北大始终与国家民族的命运紧密相连，聚集了许多学者专家，培养了众多优秀人才，创造了大批重大科学成果，影响和推动了中国近现代思想理论、科学技术、文化教育和社会发展的进程。', 99, 5, 'org/2017/12/timg.jpeg', '北京市海淀区', 1, 'gx', 2, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (3, '河南大学', '河南大学（Henan University），简称河大，由中华人民共和国教育部与河南省人民政府共建[1]  ，首批国家“双一流”世界一流学科建设高校，[2]  坐落于国家历史文化名城——开封，入选中西部高校基础能力建设工程、“111计划”[3]  、卓越医生教育培养计划、卓越教师培养计划、卓越法律人才教育培养计划、海外高层次人才引进计划，具有“推荐免试研究生”资格和“国防生后备军官”选培资格，为UNAI、IAUP、AUAP成员。\r\n1912年，以林伯襄先生为代表的一批河南教育家，在袁世凯与河南都督张镇芳支持下，在清代开封国家贡院旧址创办了河南留学欧美预备学校（河大前身），成为当时中国的三大留学培训基地之一，与清华学校（今清华大学）和南洋公学（今西安交通大学、上海交通大学）呈三足鼎立的局面。冯玉祥将军将其改建为国立第五中山大学，后历经中州大学、国立第五中山大学、省立河南大学、国立河南大学、河南师范学院、开封师范学院、河南师范大学等阶段，1984年恢复河南大学校名。大批知名教授学者，如范文澜、冯友兰、董作宾、郭绍虞、高亨、蒙文通、罗廷光、嵇文甫、罗章龙、毛礼锐等曾先后在校执教。\r\n截至2017年10月，河南大学校区总面积220万平方米，建筑面积147万平方米；有33个学院（部），42个硕士学位授权一级学科，12个博士学位授权一级学科，教职工4300多人，其中专兼职院士13人，正副高级职称1600多人。全日制在校生5万人，其中研究生近1万人，留学生500人。', 0, 3, 'org/2017/12/QQ20171229-2224362x.png', '河南省', 6, 'gr', 99, '010-00000000', 100, '全国知名');
INSERT INTO `CourseOrg` VALUES (4, '东北大学', '东北大学（Northeastern University），简称东大(NEU)，教育部直属的理工类研究型大学，坐落于东北中心城市沈阳，在河北省秦皇岛市设有东北大学秦皇岛分校，是国家首批“双一流”、“211工程”和“985工程”重点建设高校，由教育部、辽宁省、沈阳市三方重点共建，入选“2011计划”、“111计划”、“卓越工程师教育培养计划”、“国家大学生创新性实验计划”等，为“21世纪学术联盟”成员高校，是我国在上世纪八十年代最早设立研究生院的三十二所高校之一、研究生招生三十四所自主划线高校之一，是中共中央1960年、1978年确定的全国重点大学，国务院在1981年首批批准的具有博士学位授予权的高校。[1] \r\n东北大学始建于1923年4月。1928年8月至1937年1月，著名爱国将领张学良将军任校长。“九·一八”事变后，东北大学被迫迁徙北平、开封、西安、四川三台等地。1950年8月，沈阳工学院、抚顺矿专和鞍山工专合组为东北工学院。1993年3月，复名为东北大学。东大建有中国第一个大学软件园，第一台模拟电子计算机，第一家上市的校办企业。\r\n截至2016年12月，学校占地总面积255万平方米，建筑面积155万平方米。设有66个本科专业，其中国家级特色专业15个；有177个学科有权招收和培养硕士研究生（另设10个专业学位授权点），108个学科有权招收和培养博士研究生；有17个博士后流动站。在校博士研究生3730人，硕士研究生10362人，普通本科生29804人，外国留学生1408人。', 199, 1, 'org/2017/12/timg_1.jpeg', '黑龙江哈尔滨', 13, 'gx', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (5, '上海大学', '上海大学（Shanghai University），简称“上大”，是上海市属、国家“211工程”重点建设的综合性大学，国家教育部、国家国防科技工业局与上海市人民政府共建高校，国家“双一流”世界一流学科建设高校，全国首批博士学位授予单位，入选“教育部来华留学示范基地”，“卓越工程师教育培养计划”、“卓越新闻传播人才教育培养计划”、“国家建设高水平大学公派研究生项目”、“千人计划”、“111计划”。\r\n1922年10月，国共合作创建上海大学，1927年被国民党当局强行关闭。1983年，上海市人民政府复办上海大学。1994年5月，上海工业大学（成立于1960年）、上海科学技术大学（成立于1958年）、上海大学、上海科技高等专科学校（成立于1959年）合并组建为新的上海大学。\r\n“三钱”之一、中国科学院院士钱伟长教授于1983年出任上海工业大学校长，1994年至2010年担任新上海大学校长，在国内率先建立了以学分制、选课制、三学期制为核心的人才培养模式。学校与中国科学院长三角地区研究院所、中国社会科学院等单位开展全面合作。在2017年QS全球建校50年以下大学排名中列世界前60名、中国大陆第1名，在2017年QS世界大学排名中列中国大陆第15名，在2017年USNews世界大学排名中列中国大陆第31名。学校战略目标是建设成为世界一流、特色鲜明的综合性研究型大学。\r\n截至2017年2月，学校有宝山、延长、嘉定三个校区，占地近3000亩，建筑面积123.2万平方米；研究生14310人，全日制本科生20902人，留学生4117人。', 0, 1, 'org/2017/12/timg_2.jpeg', '上海市', 2, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (6, '上海大学1', '上海大学（Shanghai University），简称“上大”，是上海市属、国家“211工程”重点建设的综合性大学，国家教育部、国家国防科技工业局与上海市人民政府共建高校，国家“双一流”世界一流学科建设高校，全国首批博士学位授予单位，入选“教育部来华留学示范基地”，“卓越工程师教育培养计划”、“卓越新闻传播人才教育培养计划”、“国家建设高水平大学公派研究生项目”、“千人计划”、“111计划”。\r\n1922年10月，国共合作创建上海大学，1927年被国民党当局强行关闭。1983年，上海市人民政府复办上海大学。1994年5月，上海工业大学（成立于1960年）、上海科学技术大学（成立于1958年）、上海大学、上海科技高等专科学校（成立于1959年）合并组建为新的上海大学。\r\n“三钱”之一、中国科学院院士钱伟长教授于1983年出任上海工业大学校长，1994年至2010年担任新上海大学校长，在国内率先建立了以学分制、选课制、三学期制为核心的人才培养模式。学校与中国科学院长三角地区研究院所、中国社会科学院等单位开展全面合作。在2017年QS全球建校50年以下大学排名中列世界前60名、中国大陆第1名，在2017年QS世界大学排名中列中国大陆第15名，在2017年USNews世界大学排名中列中国大陆第31名。学校战略目标是建设成为世界一流、特色鲜明的综合性研究型大学。\r\n截至2017年2月，学校有宝山、延长、嘉定三个校区，占地近3000亩，建筑面积123.2万平方米；研究生14310人，全日制本科生20902人，留学生4117人。', 0, 0, 'org/2017/12/timg_2_TdNdGue.jpeg', '上海市', 2, 'gx', 0, '010-00000000', 10, '全国知名');
INSERT INTO `CourseOrg` VALUES (7, '上海大学2', '上海大学（Shanghai University），简称“上大”，是上海市属、国家“211工程”重点建设的综合性大学，国家教育部、国家国防科技工业局与上海市人民政府共建高校，国家“双一流”世界一流学科建设高校，全国首批博士学位授予单位，入选“教育部来华留学示范基地”，“卓越工程师教育培养计划”、“卓越新闻传播人才教育培养计划”、“国家建设高水平大学公派研究生项目”、“千人计划”、“111计划”。\r\n1922年10月，国共合作创建上海大学，1927年被国民党当局强行关闭。1983年，上海市人民政府复办上海大学。1994年5月，上海工业大学（成立于1960年）、上海科学技术大学（成立于1958年）、上海大学、上海科技高等专科学校（成立于1959年）合并组建为新的上海大学。\r\n“三钱”之一、中国科学院院士钱伟长教授于1983年出任上海工业大学校长，1994年至2010年担任新上海大学校长，在国内率先建立了以学分制、选课制、三学期制为核心的人才培养模式。学校与中国科学院长三角地区研究院所、中国社会科学院等单位开展全面合作。在2017年QS全球建校50年以下大学排名中列世界前60名、中国大陆第1名，在2017年QS世界大学排名中列中国大陆第15名，在2017年USNews世界大学排名中列中国大陆第31名。学校战略目标是建设成为世界一流、特色鲜明的综合性研究型大学。\r\n截至2017年2月，学校有宝山、延长、嘉定三个校区，占地近3000亩，建筑面积123.2万平方米；研究生14310人，全日制本科生20902人，留学生4117人。', 0, 0, 'org/2017/12/timg_1_w84QV2h.jpeg', '上海市', 2, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (8, '广州大学', '广州大学，简称“广大”，是广东省和广州市重点建设的全国重点大学[1]  ，教育部、财政部“国培计划”9所实施高校之一，全国首批12所“CDIO工程教育模式改革研究与实践”试点高校，也是“卓越法律人才教育培养计划”、“卓越工程师教育培养计划”、“国家级大学生创新创业训练计划”重点建设高校。学校已发展成为一所拥有哲学、经济学、法学、教育学、文学、历史学、理学、工学、管理学、艺术学等十大学科门类，在国内外具有一定知名度的综合性研究教学型大学。[2-4] \r\n广州大学有大学城、桂花岗两个校区，校园总面积1880亩，现有在校全日制学生33833 人，其中硕士研究生2798人，博士研究生122人，有91个本科专业，具有3个博士后科研流动站，3个一级学科博士学位授权点，26个一级学科硕士学位授权点，9个专业硕士学位点。[2] \r\n广州大学有在编教职工2607人，其中教学科研人员1686人，博士占比54.7%，全校具有副高以上职称者1130人，拥有两院院士3人，双聘院士6人。[2] \r\n广州大学先后与30个国家或地区的200多所大学和科研院所建立了教育与科技合作关系,2002年创办了全国第一所中法旅游学院；先后与意大利帕多瓦大学、美国卫斯理安学院和伊朗马赞德兰大学合作建立了孔子学院。与淡江大学、帕多瓦大学、林雪平大学等知名高校建立科研平台和机构。', 0, 1, 'org/2017/12/timg_3.jpeg', '广州市', 3, 'gx', 1, '010-00000000', 10, '全国知名');
INSERT INTO `CourseOrg` VALUES (9, '个人机构', '个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构个人机构的简介', 0, 0, 'org/2017/12/0.gif', '大庆市', 10, 'gr', 99, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (10, '机构1', '机构的描述信息', 0, 0, 'org/2018/01/3EWW1.jpg', '机构的地址', 3, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (11, '机构2', '机构的描述信息', 0, 0, 'org/2018/01/3WW1.jpg', '机构的地址', 2, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (12, '机构3', '机构的描述信息', 0, 0, 'org/2018/01/16.jpg', '机构的地址', 2, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (13, '机构4', '机构的描述信息', 0, 0, 'org/2018/01/21W.jpg', '机构的地址', 3, 'gx', 0, '010-00000000', 0, '全国机构');
INSERT INTO `CourseOrg` VALUES (14, '机构的机构', '机构的描述', 0, 0, 'org/2018/01/20.jpg', '机构的描述', 2, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (15, '机构的描述', '机构的描述', 0, 0, 'org/2018/01/15.jpg', '机构的描述', 3, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (16, '2222222', '1111111111111', 0, 0, 'org/2018/01/13.jpg', '1111111111', 2, 'pxjg', 0, '010-00000000', 0, '全国知名');
INSERT INTO `CourseOrg` VALUES (17, '2222222222', '11111111111111111', 0, 0, 'org/2018/01/29.jpg', '222222222', 4, 'gx', 0, '010-00000000', 0, '全国知名');
COMMIT;

-- ----------------------------
-- Table structure for CourseResource
-- ----------------------------
DROP TABLE IF EXISTS `CourseResource`;
CREATE TABLE `CourseResource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `download` varchar(150) COLLATE utf8_croatian_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CourseResource_course_id_765137ae_fk_Coures_id` (`course_id`),
  CONSTRAINT `CourseResource_course_id_765137ae_fk_Coures_id` FOREIGN KEY (`course_id`) REFERENCES `Coures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of CourseResource
-- ----------------------------
BEGIN;
INSERT INTO `CourseResource` VALUES (1, '啊啊啊啊啊啊啊啊啊啊', 'course/resource/2018/01/project.zip', '2017-12-27 20:47:15.000000', 1);
INSERT INTO `CourseResource` VALUES (2, '我是第二个附件下载', 'course/resource/2018/01/完整源代码.zip', '2018-01-02 19:04:11.000000', 1);
INSERT INTO `CourseResource` VALUES (3, '附件啦', 'course/resource/2018/01/完整源代码_x1mbGwT.zip', '2018-01-02 20:04:14.000000', 2);
COMMIT;

-- ----------------------------
-- Table structure for EmailVerifyRecord
-- ----------------------------
DROP TABLE IF EXISTS `EmailVerifyRecord`;
CREATE TABLE `EmailVerifyRecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_croatian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `send_type` varchar(20) COLLATE utf8_croatian_ci NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `is_sx` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of EmailVerifyRecord
-- ----------------------------
BEGIN;
INSERT INTO `EmailVerifyRecord` VALUES (56, 'zYTsx', 'btmeiju@126.com', 'upload_email', '2018-01-04 23:39:26.564537', 0);
INSERT INTO `EmailVerifyRecord` VALUES (57, '2GEqU', '18611662860@126.com', 'upload_email', '2018-01-04 23:41:52.709521', 0);
INSERT INTO `EmailVerifyRecord` VALUES (58, 'LrXJH3ZOpg1skHvy', '18611662860@126.com', 'forget', '2018-01-04 23:44:42.240059', 0);
INSERT INTO `EmailVerifyRecord` VALUES (59, 'Cuj3E', '18611662860@163.com', 'upload_email', '2018-01-04 23:47:36.635006', 0);
INSERT INTO `EmailVerifyRecord` VALUES (60, 'sWU6J', '18611662860@163.com', 'upload_email', '2018-01-05 00:40:13.082737', 0);
INSERT INTO `EmailVerifyRecord` VALUES (61, 'GxUuQ', '18611662860@126.com', 'upload_email', '2018-01-05 17:50:31.799222', 0);
INSERT INTO `EmailVerifyRecord` VALUES (62, 'QulRf', '18611662860@163.com', 'upload_email', '2018-01-05 17:52:12.020923', 0);
INSERT INTO `EmailVerifyRecord` VALUES (63, '41FcbuESqncMrASZ', 'btmeiju@126.com', 'register', '2018-01-06 00:05:58.029370', 0);
INSERT INTO `EmailVerifyRecord` VALUES (64, 'T1fflgIZbOwhcnrk', '18611662860@162.com', 'register', '2018-01-13 18:05:03.528771', 1);
COMMIT;

-- ----------------------------
-- Table structure for Lesson
-- ----------------------------
DROP TABLE IF EXISTS `Lesson`;
CREATE TABLE `Lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_croatian_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Lesson_course_id_280a4093_fk_Coures_id` (`course_id`),
  CONSTRAINT `Lesson_course_id_280a4093_fk_Coures_id` FOREIGN KEY (`course_id`) REFERENCES `Coures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of Lesson
-- ----------------------------
BEGIN;
INSERT INTO `Lesson` VALUES (1, '第一章 Django简介', '2017-12-27 20:46:23.000000', 1);
INSERT INTO `Lesson` VALUES (2, '第二章 Django的高性能优化', '2018-01-02 17:51:05.000000', 1);
INSERT INTO `Lesson` VALUES (3, '第一章', '2018-01-06 22:08:09.000000', 2);
INSERT INTO `Lesson` VALUES (4, '第三章', '2018-01-06 22:09:06.000000', 1);
COMMIT;

-- ----------------------------
-- Table structure for Teacher
-- ----------------------------
DROP TABLE IF EXISTS `Teacher`;
CREATE TABLE `Teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_croatian_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_comfany` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `work_position` varchar(60) COLLATE utf8_croatian_ci NOT NULL,
  `points` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacher_arg` int(11) NOT NULL,
  `teacher_td` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Teacher_org_id_520db18d_fk_CourseOrg_id` (`org_id`),
  CONSTRAINT `Teacher_org_id_520db18d_fk_CourseOrg_id` FOREIGN KEY (`org_id`) REFERENCES `CourseOrg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of Teacher
-- ----------------------------
BEGIN;
INSERT INTO `Teacher` VALUES (1, '陈书剑', 10, '北京大学', 'ceo', '会开车，特点好色', 71, 22, '2017-12-31 19:37:33.000000', 3, 'js/2018/01/2.png', 20, NULL);
INSERT INTO `Teacher` VALUES (2, '陈211', 5, '北京大学2', 'django', 'django', 41, 32, '2017-12-31 19:38:33.000000', 2, 'js/2017/12/0_RvMKnA0.gif', 20, NULL);
COMMIT;

-- ----------------------------
-- Table structure for UserAsk
-- ----------------------------
DROP TABLE IF EXISTS `UserAsk`;
CREATE TABLE `UserAsk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_croatian_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_croatian_ci NOT NULL,
  `course_name` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of UserAsk
-- ----------------------------
BEGIN;
INSERT INTO `UserAsk` VALUES (26, 'admin', '18611662860', '垃圾PHP', '2017-12-30 19:10:17.541196');
COMMIT;

-- ----------------------------
-- Table structure for UserCourse
-- ----------------------------
DROP TABLE IF EXISTS `UserCourse`;
CREATE TABLE `UserCourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserCourse_course_id_d7e3582b_fk_Coures_id` (`course_id`),
  KEY `UserCourse_user_id_bb00a165_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `UserCourse_course_id_d7e3582b_fk_Coures_id` FOREIGN KEY (`course_id`) REFERENCES `Coures` (`id`),
  CONSTRAINT `UserCourse_user_id_bb00a165_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of UserCourse
-- ----------------------------
BEGIN;
INSERT INTO `UserCourse` VALUES (8, '2018-01-03 11:23:44.082171', 2, 1);
INSERT INTO `UserCourse` VALUES (9, '2018-01-03 11:23:55.947759', 1, 1);
INSERT INTO `UserCourse` VALUES (10, '2018-01-06 00:07:59.736072', 2, 2);
INSERT INTO `UserCourse` VALUES (11, '2018-01-07 02:24:08.742200', 7, 1);
INSERT INTO `UserCourse` VALUES (12, '2018-01-13 18:06:28.756188', 8, 2);
COMMIT;

-- ----------------------------
-- Table structure for UserFavorite
-- ----------------------------
DROP TABLE IF EXISTS `UserFavorite`;
CREATE TABLE `UserFavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_tile` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserFavorite_user_id_48795a4f_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `UserFavorite_user_id_48795a4f_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of UserFavorite
-- ----------------------------
BEGIN;
INSERT INTO `UserFavorite` VALUES (62, 3, 2, '2018-01-05 23:13:40.740063', 1);
INSERT INTO `UserFavorite` VALUES (64, 1, 3, '2018-01-05 23:22:45.610741', 1);
INSERT INTO `UserFavorite` VALUES (66, 1, 3, '2018-01-06 00:08:10.879354', 2);
INSERT INTO `UserFavorite` VALUES (67, 2, 2, '2018-01-06 00:08:17.882891', 2);
INSERT INTO `UserFavorite` VALUES (68, 8, 1, '2018-01-06 16:05:02.896729', 1);
INSERT INTO `UserFavorite` VALUES (69, 8, 2, '2018-01-06 16:05:04.074500', 1);
INSERT INTO `UserFavorite` VALUES (70, 2, 2, '2018-01-07 02:27:38.734404', 1);
INSERT INTO `UserFavorite` VALUES (71, 1, 1, '2018-01-07 02:27:40.544014', 1);
COMMIT;

-- ----------------------------
-- Table structure for UserMessage
-- ----------------------------
DROP TABLE IF EXISTS `UserMessage`;
CREATE TABLE `UserMessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) COLLATE utf8_croatian_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of UserMessage
-- ----------------------------
BEGIN;
INSERT INTO `UserMessage` VALUES (2, 1, 'wwwwwwwwww', 1, '2018-01-05 23:32:44.000000');
INSERT INTO `UserMessage` VALUES (3, 1, '11111111111111111', 1, '2018-01-05 23:53:01.000000');
INSERT INTO `UserMessage` VALUES (4, 1, '11111111111111111111111111', 1, '2018-01-05 23:53:14.000000');
INSERT INTO `UserMessage` VALUES (5, 0, '22222222222222222', 0, '2018-01-05 23:53:20.000000');
INSERT INTO `UserMessage` VALUES (6, 1, '333333333333333', 1, '2018-01-05 23:53:28.000000');
INSERT INTO `UserMessage` VALUES (7, 2, '欢迎btmeiju@126.com注册, 让我们一起学习, 一起成长吧！', 1, '2018-01-06 00:05:58.027774');
INSERT INTO `UserMessage` VALUES (8, 3, '欢迎18611662860@162.com注册, 让我们一起学习, 一起成长吧！', 0, '2018-01-13 18:05:03.526234');
COMMIT;

-- ----------------------------
-- Table structure for Video
-- ----------------------------
DROP TABLE IF EXISTS `Video`;
CREATE TABLE `Video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_croatian_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `video_url` varchar(200) COLLATE utf8_croatian_ci DEFAULT NULL,
  `video_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Video_lesson_id_8d91d8be_fk_Lesson_id` (`lesson_id`),
  CONSTRAINT `Video_lesson_id_8d91d8be_fk_Lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `Lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of Video
-- ----------------------------
BEGIN;
INSERT INTO `Video` VALUES (2, '第一个Django应用', '2018-01-02 17:46:40.000000', 1, 'http://127.0.0.1', 11);
INSERT INTO `Video` VALUES (3, '如何优化Django', '2018-01-02 17:51:46.000000', 2, 'http://127.0.0.1', 1);
INSERT INTO `Video` VALUES (4, 'Django的入门到放弃', '2018-01-02 18:54:24.000000', 1, 'http://www.aaa.com', 99);
INSERT INTO `Video` VALUES (5, '11111111111111111', '2018-01-06 22:16:15.000000', 4, 'http://111111111111.com', 1111111111);
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (19, 'Can add 轮播图', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (20, 'Can change 轮播图', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 轮播图', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (22, 'Can add 邮箱验证码', 8, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (23, 'Can change 邮箱验证码', 8, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 邮箱验证码', 8, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (25, 'Can add 课程机构', 9, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (26, 'Can change 课程机构', 9, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 课程机构', 9, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (28, 'Can add city dict', 10, 'add_citydict');
INSERT INTO `auth_permission` VALUES (29, 'Can change city dict', 10, 'change_citydict');
INSERT INTO `auth_permission` VALUES (30, 'Can delete city dict', 10, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (31, 'Can add 教师信息', 11, 'add_teacher');
INSERT INTO `auth_permission` VALUES (32, 'Can change 教师信息', 11, 'change_teacher');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 教师信息', 11, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (34, 'Can add 课程详情', 12, 'add_coures');
INSERT INTO `auth_permission` VALUES (35, 'Can change 课程详情', 12, 'change_coures');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 课程详情', 12, 'delete_coures');
INSERT INTO `auth_permission` VALUES (37, 'Can add 视频资源', 13, 'add_video');
INSERT INTO `auth_permission` VALUES (38, 'Can change 视频资源', 13, 'change_video');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 视频资源', 13, 'delete_video');
INSERT INTO `auth_permission` VALUES (40, 'Can add 课程章节', 14, 'add_lesson');
INSERT INTO `auth_permission` VALUES (41, 'Can change 课程章节', 14, 'change_lesson');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 课程章节', 14, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (43, 'Can add 课程附件', 15, 'add_courseresource');
INSERT INTO `auth_permission` VALUES (44, 'Can change 课程附件', 15, 'change_courseresource');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 课程附件', 15, 'delete_courseresource');
INSERT INTO `auth_permission` VALUES (46, 'Can add 用户报名', 16, 'add_userask');
INSERT INTO `auth_permission` VALUES (47, 'Can change 用户报名', 16, 'change_userask');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 用户报名', 16, 'delete_userask');
INSERT INTO `auth_permission` VALUES (49, 'Can add 用户收藏', 17, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (50, 'Can change 用户收藏', 17, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 用户收藏', 17, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (52, 'Can add 用户课程', 18, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (53, 'Can change 用户课程', 18, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 用户课程', 18, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (55, 'Can add 用户评论', 19, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (56, 'Can change 用户评论', 19, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (57, 'Can delete 用户评论', 19, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (58, 'Can add 用户消息', 20, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (59, 'Can change 用户消息', 20, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (60, 'Can delete 用户消息', 20, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (61, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (62, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (63, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (64, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (65, 'Can view 课程详情', 12, 'view_coures');
INSERT INTO `auth_permission` VALUES (66, 'Can view 课程附件', 15, 'view_courseresource');
INSERT INTO `auth_permission` VALUES (67, 'Can view 课程章节', 14, 'view_lesson');
INSERT INTO `auth_permission` VALUES (68, 'Can view 视频资源', 13, 'view_video');
INSERT INTO `auth_permission` VALUES (69, 'Can view 用户评论', 19, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (70, 'Can view 用户报名', 16, 'view_userask');
INSERT INTO `auth_permission` VALUES (71, 'Can view 用户课程', 18, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (72, 'Can view 用户收藏', 17, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (73, 'Can view 用户消息', 20, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (74, 'Can view city dict', 10, 'view_citydict');
INSERT INTO `auth_permission` VALUES (75, 'Can view 课程机构', 9, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (76, 'Can view 教师信息', 11, 'view_teacher');
INSERT INTO `auth_permission` VALUES (77, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (78, 'Can view 轮播图', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (79, 'Can view 邮箱验证码', 8, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (80, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (81, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (84, 'Can add User Setting', 22, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (85, 'Can change User Setting', 22, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (86, 'Can delete User Setting', 22, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (87, 'Can add User Widget', 23, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (88, 'Can change User Widget', 23, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (89, 'Can delete User Widget', 23, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (90, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (91, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (92, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (93, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (94, 'Can view log entry', 24, 'view_log');
INSERT INTO `auth_permission` VALUES (95, 'Can view User Setting', 22, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (96, 'Can view User Widget', 23, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can add captcha store', 25, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (98, 'Can change captcha store', 25, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (99, 'Can delete captcha store', 25, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (100, 'Can view captcha store', 25, 'view_captchastore');
INSERT INTO `auth_permission` VALUES (101, 'Can view 轮播课程', 26, 'view_bannercoures');
INSERT INTO `auth_permission` VALUES (102, 'Can add 轮播课程', 12, 'add_bannercoures');
INSERT INTO `auth_permission` VALUES (103, 'Can change 轮播课程', 12, 'change_bannercoures');
INSERT INTO `auth_permission` VALUES (104, 'Can delete 轮播课程', 12, 'delete_bannercoures');
COMMIT;

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `response` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `hashkey` varchar(40) COLLATE utf8_croatian_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
BEGIN;
INSERT INTO `captcha_captchastore` VALUES (358, 'KYFT', 'kyft', 'e78144b917ca3876e7878ac24dbe30440217ea2e', '2018-01-13 18:08:52.086348');
INSERT INTO `captcha_captchastore` VALUES (361, 'BLFM', 'blfm', '859afc0c583c16c1f4f898e3f7444a8a4be9dbe6', '2018-01-13 18:09:34.826444');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_croatian_ci,
  `object_repr` varchar(200) COLLATE utf8_croatian_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_croatian_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2017-12-27 15:36:32.423711', '6', '陈娜娜女', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2017-12-27 15:37:09.234184', '6', '陈娜娜女', 2, '[{\"changed\": {\"fields\": [\"is_active\", \"birday\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (3, '2017-12-27 15:37:20.259532', '6', '陈娜娜女', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (4, '2017-12-27 15:44:24.983328', '3', 'adminaa', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (5, '2017-12-27 15:44:30.462249', '4', 'adminaaa', 3, '', 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (25, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (26, 'courses', 'bannercoures');
INSERT INTO `django_content_type` VALUES (12, 'courses', 'coures');
INSERT INTO `django_content_type` VALUES (15, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (14, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (13, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (19, 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES (16, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (18, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (17, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (20, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (10, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (9, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (11, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (8, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'userwidget');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2017-12-26 15:41:33.957133');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2017-12-26 15:41:34.000248');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2017-12-26 15:41:34.178405');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2017-12-26 15:41:34.203277');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2017-12-26 15:41:34.210078');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2017-12-26 15:41:34.216516');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2017-12-26 15:41:34.223293');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2017-12-26 15:41:34.225226');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2017-12-26 15:41:34.231715');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2017-12-26 15:41:34.239772');
INSERT INTO `django_migrations` VALUES (11, 'users', '0001_initial', '2017-12-26 15:41:34.424768');
INSERT INTO `django_migrations` VALUES (12, 'admin', '0001_initial', '2017-12-26 15:41:34.509164');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0002_logentry_remove_auto_add', '2017-12-26 15:41:34.547520');
INSERT INTO `django_migrations` VALUES (14, 'sessions', '0001_initial', '2017-12-26 15:41:34.589822');
INSERT INTO `django_migrations` VALUES (15, 'users', '0002_auto_20171226_1542', '2017-12-26 15:43:02.317784');
INSERT INTO `django_migrations` VALUES (16, 'users', '0003_auto_20171226_1544', '2017-12-26 15:44:48.430850');
INSERT INTO `django_migrations` VALUES (17, 'users', '0004_auto_20171226_1545', '2017-12-26 15:45:28.726970');
INSERT INTO `django_migrations` VALUES (18, 'users', '0002_banner_emailverifyrecord', '2017-12-27 02:11:51.636150');
INSERT INTO `django_migrations` VALUES (19, 'courses', '0001_initial', '2017-12-27 05:07:54.898403');
INSERT INTO `django_migrations` VALUES (20, 'organization', '0001_initial', '2017-12-27 05:07:55.007288');
INSERT INTO `django_migrations` VALUES (21, 'operation', '0001_initial', '2017-12-27 06:39:22.110899');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0001_initial', '2017-12-27 15:57:21.433266');
INSERT INTO `django_migrations` VALUES (23, 'xadmin', '0002_log', '2017-12-27 15:57:21.517142');
INSERT INTO `django_migrations` VALUES (24, 'xadmin', '0003_auto_20160715_0100', '2017-12-27 15:57:21.552345');
INSERT INTO `django_migrations` VALUES (25, 'users', '0003_auto_20171227_1725', '2017-12-27 17:25:15.244037');
INSERT INTO `django_migrations` VALUES (26, 'users', '0004_auto_20171227_1726', '2017-12-27 17:26:48.282099');
INSERT INTO `django_migrations` VALUES (27, 'users', '0005_auto_20171227_1805', '2017-12-27 18:05:42.675073');
INSERT INTO `django_migrations` VALUES (28, 'organization', '0002_auto_20171227_2037', '2017-12-27 20:37:58.738377');
INSERT INTO `django_migrations` VALUES (29, 'captcha', '0001_initial', '2017-12-28 21:46:32.537577');
INSERT INTO `django_migrations` VALUES (30, 'courses', '0002_auto_20171228_2204', '2017-12-28 22:05:11.119537');
INSERT INTO `django_migrations` VALUES (31, 'users', '0006_auto_20171229_0036', '2017-12-29 00:37:06.987096');
INSERT INTO `django_migrations` VALUES (32, 'users', '0007_userprofile_is_jh', '2017-12-29 11:43:36.428707');
INSERT INTO `django_migrations` VALUES (33, 'users', '0008_auto_20171229_1144', '2017-12-29 11:44:08.193839');
INSERT INTO `django_migrations` VALUES (34, 'users', '0009_emailverifyrecord_is_sx', '2017-12-29 12:07:05.892233');
INSERT INTO `django_migrations` VALUES (35, 'users', '0010_auto_20171229_1225', '2017-12-29 12:25:36.270535');
INSERT INTO `django_migrations` VALUES (36, 'users', '0011_auto_20171229_1226', '2017-12-29 12:26:12.989374');
INSERT INTO `django_migrations` VALUES (37, 'organization', '0003_courseorg_catgory', '2017-12-29 22:36:19.965228');
INSERT INTO `django_migrations` VALUES (38, 'organization', '0004_auto_20171229_2237', '2017-12-29 22:37:43.216954');
INSERT INTO `django_migrations` VALUES (39, 'organization', '0002_auto_20171230_0106', '2017-12-30 01:06:36.382729');
INSERT INTO `django_migrations` VALUES (40, 'organization', '0003_courseorg_xxrs', '2017-12-30 13:05:27.118056');
INSERT INTO `django_migrations` VALUES (41, 'courses', '0003_coures_course_org', '2017-12-31 19:44:32.326715');
INSERT INTO `django_migrations` VALUES (42, 'courses', '0004_auto_20171231_1945', '2017-12-31 19:45:56.716805');
INSERT INTO `django_migrations` VALUES (43, 'organization', '0004_teacher_image', '2017-12-31 21:13:16.369461');
INSERT INTO `django_migrations` VALUES (44, 'courses', '0005_coures_kcjs_org', '2017-12-31 22:39:10.254003');
INSERT INTO `django_migrations` VALUES (45, 'courses', '0006_auto_20180101_2027', '2018-01-01 20:27:29.665158');
INSERT INTO `django_migrations` VALUES (46, 'courses', '0007_coures_tag', '2018-01-01 21:33:53.573485');
INSERT INTO `django_migrations` VALUES (47, 'courses', '0008_auto_20180101_2136', '2018-01-01 21:37:27.842935');
INSERT INTO `django_migrations` VALUES (48, 'courses', '0009_video_video_url', '2018-01-02 17:49:16.963591');
INSERT INTO `django_migrations` VALUES (49, 'courses', '0010_video_video_time', '2018-01-02 18:43:01.608958');
INSERT INTO `django_migrations` VALUES (50, 'courses', '0011_auto_20180102_2017', '2018-01-02 20:17:53.310936');
INSERT INTO `django_migrations` VALUES (51, 'organization', '0005_auto_20180103_1229', '2018-01-03 12:29:58.755328');
INSERT INTO `django_migrations` VALUES (52, 'organization', '0006_auto_20180103_1230', '2018-01-03 12:31:07.879495');
INSERT INTO `django_migrations` VALUES (53, 'users', '0012_auto_20180104_1600', '2018-01-04 16:00:48.219787');
INSERT INTO `django_migrations` VALUES (54, 'users', '0013_auto_20180104_1603', '2018-01-04 16:03:18.262142');
INSERT INTO `django_migrations` VALUES (55, 'users', '0014_auto_20180104_2237', '2018-01-04 22:37:29.752404');
INSERT INTO `django_migrations` VALUES (56, 'users', '0015_auto_20180104_2309', '2018-01-04 23:09:58.475517');
INSERT INTO `django_migrations` VALUES (57, 'users', '0016_auto_20180104_2319', '2018-01-04 23:19:43.413660');
INSERT INTO `django_migrations` VALUES (58, 'users', '0017_auto_20180104_2322', '2018-01-04 23:22:45.445426');
INSERT INTO `django_migrations` VALUES (59, 'users', '0018_auto_20180104_2333', '2018-01-04 23:34:13.744343');
INSERT INTO `django_migrations` VALUES (60, 'users', '0019_auto_20180104_2337', '2018-01-04 23:38:37.346965');
INSERT INTO `django_migrations` VALUES (61, 'users', '0020_auto_20180104_2341', '2018-01-04 23:41:18.359598');
INSERT INTO `django_migrations` VALUES (62, 'courses', '0012_coures_is_tg', '2018-01-06 13:02:28.281324');
INSERT INTO `django_migrations` VALUES (63, 'organization', '0007_courseorg_org_tag', '2018-01-06 13:28:50.341953');
INSERT INTO `django_migrations` VALUES (64, 'courses', '0013_auto_20180107_0030', '2018-01-07 00:31:20.899886');
INSERT INTO `django_migrations` VALUES (65, 'courses', '0014_auto_20180107_0052', '2018-01-07 00:52:35.276978');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_croatian_ci NOT NULL,
  `session_data` longtext COLLATE utf8_croatian_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('09vh262c2tx3nepupefgdm5v0ch40a8o', 'NzRmMTZmY2ZkOTg0ZDI4YzJmYzI4NmM5OWRkMGEzZjc2OTQ2ZTgyZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmQ3ODVjMmY0MDZjN2I1NmE5NWQxMTljNWE2ZjQ5MTc4Y2I0Zjk2IiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJlcyJdLCIiXX0=', '2018-01-19 22:09:58.653456');
INSERT INTO `django_session` VALUES ('0epc9ii2jzcps87re4o9n8ai7sw2h0wi', 'MjE0ZTg1Mjc0ZWMxMjNjMTI2OGVhNjRjN2UxNGNlMWIyYzVlMmI2Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTgwZjI2MjYxMWRmNWQwODA3YmNhYmU0NWU5NTI3N2Y2NmZhNGYyIn0=', '2018-01-18 22:25:53.578981');
INSERT INTO `django_session` VALUES ('3zrl222wok81f2ln9zwvxkeqa9753iun', 'ZTBkNjlhNGI1YjEwMTYzMTVlNmUzMWU5M2Q0ZTdmNjhiMWI5YWUwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mjc3MjFkZjU2OGEyNjdmM2U2ZTdkYjViNzMzYzM2NDEzZTUwZDIwIn0=', '2018-01-18 11:45:26.423631');
INSERT INTO `django_session` VALUES ('eckv5hr83ciekaj9lsz8wl3hc1f1q289', 'MDg0MDM1NTI4NmFjZDMyODQ0YzlhNDkwMDc0MDY1YTNmZTdmN2JhMjp7fQ==', '2018-01-20 13:46:42.316417');
INSERT INTO `django_session` VALUES ('j2iu1gyswnein9529diw89ke9r1vlou1', 'MDg0MDM1NTI4NmFjZDMyODQ0YzlhNDkwMDc0MDY1YTNmZTdmN2JhMjp7fQ==', '2018-01-20 13:55:48.261671');
INSERT INTO `django_session` VALUES ('jz3fn7x2jjr522o1u3cejyy1q2jhbap4', 'ODZhZTE3ZTk3ZTlhNDc1ZWJlN2Q4YjVhMDM2NWFkZTYwNjFjN2Y1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmQ3ODVjMmY0MDZjN2I1NmE5NWQxMTljNWE2ZjQ5MTc4Y2I0Zjk2In0=', '2018-01-20 14:08:32.528008');
INSERT INTO `django_session` VALUES ('jzgu985zg3uibsgj6mypksnsz0eb7lvw', 'ZDI2ZTA3MzU4NzAzNzY0NmJmZDIxOTc4YzNjNmNjNGQwY2I0Mzk4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mjc3MjFkZjU2OGEyNjdmM2U2ZTdkYjViNzMzYzM2NDEzZTUwZDIwIiwiTElTVF9RVUVSWSI6W1sib3BlcmF0aW9uIiwidXNlcmFzayJdLCIiXX0=', '2018-01-13 14:35:14.579258');
INSERT INTO `django_session` VALUES ('lwaqbvekv6ojgffio7wkpkhawu82ywmj', 'ZGIwODZiYTcxYmYzNDMwNGU1Mzk5ZWQzMTgzYjBlMDBiMGE3MGZhODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MDllNTU4ZjE2NDU3MzdmMjMzZjQ4ZTg1NmY2YzRiNmMwMmM1ZjEwIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJlcyJdLCIiXSwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTY3M2FcdTY3ODRcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtaC1zcXVhcmVcIiwgXCJvcmRlclwiOiA3fSwge1widGl0bGVcIjogXCJcdTU3Y2VcdTVlMDJcdTU3MzBcdTU3NDBcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NhdGlvbi1hcnJvd1wiLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1NjU1OVx1NWUwOFx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcmdhbml6YXRpb24vdGVhY2hlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtaC1zcXVhcmVcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NGNkXHU0ZjVjXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2MmE1XHU1NDBkXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyYXNrL1wiLCBcImljb25cIjogXCJmYSBmYS1wZW5jaWwtc3F1YXJlLW9cIiwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmM0XHU4YmJhXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi9jb3Vyc2Vjb21tZW50cy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29tbWVudHNcIiwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4NWNmXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyZmF2b3JpdGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLWhlYXJ0XCIsIFwib3JkZXJcIjogMTd9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NmQ4OFx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcGVyYXRpb24vdXNlcm1lc3NhZ2UvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvbW1lbnRcIiwgXCJvcmRlclwiOiAxOH0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmZlXHU3YTBiXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wiLCBcImljb25cIjogXCJmYSBmYS1ib29rXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtcGVuY2lsLXNxdWFyZS1vXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyYXNrL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzfSwge1widGl0bGVcIjogXCJcdTkwYWVcdTdiYjFcdTlhOGNcdThiYzFcdTc4MDFcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlcnMvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwiaWNvblwiOiBcImZhIGZhLWVudmVsb3BlXCIsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtcGljdHVyZS1vXCIsIFwib3JkZXJcIjogNn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMjF9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJlNlx1NjBjNVwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2NvdXJlcy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcIm9yZGVyXCI6IDEwfSwge1widGl0bGVcIjogXCJcdThmNmVcdTY0YWRcdThiZmVcdTdhMGJcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY291cnNlcy9iYW5uZXJjb3VyZXMvXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2tcIiwgXCJvcmRlclwiOiAxMX0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU3YWUwXHU4MjgyXCIsIFwidXJsXCI6IFwiL2FkbWluL2NvdXJzZXMvbGVzc29uL1wiLCBcImljb25cIjogXCJmYSBmYS1ib29rbWFya1wiLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdTg5YzZcdTk4OTFcdThkNDRcdTZlOTBcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY291cnNlcy92aWRlby9cIiwgXCJpY29uXCI6IFwiZmEgZmEtYm9sdFwiLCBcIm9yZGVyXCI6IDEzfSwge1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTk2NDRcdTRlZjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY291cnNlcy9jb3Vyc2VyZXNvdXJjZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY2xvdWQtdXBsb2FkXCIsIFwib3JkZXJcIjogMTR9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2NvdXJlcy9cIn1dIn0=', '2018-01-21 02:07:45.037374');
INSERT INTO `django_session` VALUES ('mjm1vlcnnorocaq2fgstdpeftvcxee7j', 'ODZhZTE3ZTk3ZTlhNDc1ZWJlN2Q4YjVhMDM2NWFkZTYwNjFjN2Y1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmQ3ODVjMmY0MDZjN2I1NmE5NWQxMTljNWE2ZjQ5MTc4Y2I0Zjk2In0=', '2018-01-19 22:57:42.088349');
INSERT INTO `django_session` VALUES ('n90g82y6nbjivfacpjzpk049zxp6yfqc', 'YTE0OGYzMzNhMTc0NGFmYjM0YjY4ZGZjMjJmYTdhYjUzNGE1NTA4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmQ3ODVjMmY0MDZjN2I1NmE5NWQxMTljNWE2ZjQ5MTc4Y2I0Zjk2IiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJlcyJdLCIiXSwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTU3Y2VcdTVlMDJcdTU3MzBcdTU3NDBcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3fSwge1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTY3M2FcdTY3ODRcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOH0sIHtcInRpdGxlXCI6IFwiXHU2NTU5XHU1ZTA4XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL29yZ2FuaXphdGlvbi90ZWFjaGVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA5fV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL29yZ2FuaXphdGlvbi9jaXR5ZGljdC9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZTJkXHU1ZmMzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2MmE1XHU1NDBkXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyYXNrL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNH0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmM0XHU4YmJhXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi9jb3Vyc2Vjb21tZW50cy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTV9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcGVyYXRpb24vdXNlcmZhdm9yaXRlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VybWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OGJmZVx1N2EwYlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcGVyYXRpb24vdXNlcmNvdXJzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTh9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vb3BlcmF0aW9uL3VzZXJhc2svXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi91c2Vycy91c2VycHJvZmlsZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OTBhZVx1N2JiMVx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2Vycy9lbWFpbHZlcmlmeXJlY29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMjB9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJlNlx1NjBjNVwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2NvdXJlcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2FlMFx1ODI4MlwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2xlc3Nvbi9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTF9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVx1OGQ0NFx1NmU5MFwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL3ZpZGVvL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMn0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU5NjQ0XHU0ZWY2XCIsIFwidXJsXCI6IFwiL2FkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEzfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2NvdXJzZXMvY291cmVzL1wifV0ifQ==', '2018-01-20 15:46:13.000655');
INSERT INTO `django_session` VALUES ('ozd2r0fxk7rk7ls5yyns9bpu4qcxozvw', 'YTE0OGYzMzNhMTc0NGFmYjM0YjY4ZGZjMjJmYTdhYjUzNGE1NTA4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmQ3ODVjMmY0MDZjN2I1NmE5NWQxMTljNWE2ZjQ5MTc4Y2I0Zjk2IiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJlcyJdLCIiXSwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTU3Y2VcdTVlMDJcdTU3MzBcdTU3NDBcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3fSwge1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTY3M2FcdTY3ODRcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOH0sIHtcInRpdGxlXCI6IFwiXHU2NTU5XHU1ZTA4XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL29yZ2FuaXphdGlvbi90ZWFjaGVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA5fV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL29yZ2FuaXphdGlvbi9jaXR5ZGljdC9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZTJkXHU1ZmMzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2MmE1XHU1NDBkXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyYXNrL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNH0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmM0XHU4YmJhXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi9jb3Vyc2Vjb21tZW50cy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTV9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcGVyYXRpb24vdXNlcmZhdm9yaXRlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VybWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OGJmZVx1N2EwYlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcGVyYXRpb24vdXNlcmNvdXJzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTh9XSwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vb3BlcmF0aW9uL3VzZXJhc2svXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi91c2Vycy91c2VycHJvZmlsZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OTBhZVx1N2JiMVx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi9hZG1pbi91c2Vycy9lbWFpbHZlcmlmeXJlY29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMjB9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJlNlx1NjBjNVwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2NvdXJlcy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2FlMFx1ODI4MlwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2xlc3Nvbi9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTF9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVx1OGQ0NFx1NmU5MFwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL3ZpZGVvL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMn0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU5NjQ0XHU0ZWY2XCIsIFwidXJsXCI6IFwiL2FkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEzfV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2NvdXJzZXMvY291cmVzL1wifV0ifQ==', '2018-01-20 15:06:01.861039');
INSERT INTO `django_session` VALUES ('tv3992t0f90zvr593rfxgnx4vysqf8sf', 'MDg0MDM1NTI4NmFjZDMyODQ0YzlhNDkwMDc0MDY1YTNmZTdmN2JhMjp7fQ==', '2018-01-12 00:51:10.975011');
INSERT INTO `django_session` VALUES ('zoazl2wm6odv3fi1jquvjbif0y6i6rw1', 'ZDZhNDUyOTBmZDA2MzU1YzhjYjUzMTIxZjJjZTNiNjYwMDkxODRmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MDllNTU4ZjE2NDU3MzdmMjMzZjQ4ZTg1NmY2YzRiNmMwMmM1ZjEwIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImxlc3NvbiJdLCIiXSwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTY3M2FcdTY3ODRcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtaC1zcXVhcmVcIiwgXCJvcmRlclwiOiA3fSwge1widGl0bGVcIjogXCJcdTU3Y2VcdTVlMDJcdTU3MzBcdTU3NDBcIiwgXCJ1cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NhdGlvbi1hcnJvd1wiLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1NjU1OVx1NWUwOFx1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcmdhbml6YXRpb24vdGVhY2hlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtaC1zcXVhcmVcIiwgXCJmaXJzdF91cmxcIjogXCIvYWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NGNkXHU0ZjVjXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2MmE1XHU1NDBkXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyYXNrL1wiLCBcImljb25cIjogXCJmYSBmYS1wZW5jaWwtc3F1YXJlLW9cIiwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmM0XHU4YmJhXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi9jb3Vyc2Vjb21tZW50cy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29tbWVudHNcIiwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4NWNmXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyZmF2b3JpdGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLWhlYXJ0XCIsIFwib3JkZXJcIjogMTd9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NmQ4OFx1NjA2ZlwiLCBcInVybFwiOiBcIi9hZG1pbi9vcGVyYXRpb24vdXNlcm1lc3NhZ2UvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvbW1lbnRcIiwgXCJvcmRlclwiOiAxOH0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmZlXHU3YTBiXCIsIFwidXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wiLCBcImljb25cIjogXCJmYSBmYS1ib29rXCIsIFwib3JkZXJcIjogMTl9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtcGVuY2lsLXNxdWFyZS1vXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL29wZXJhdGlvbi91c2VyYXNrL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzfSwge1widGl0bGVcIjogXCJcdTkwYWVcdTdiYjFcdTlhOGNcdThiYzFcdTc4MDFcIiwgXCJ1cmxcIjogXCIvYWRtaW4vdXNlcnMvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwiaWNvblwiOiBcImZhIGZhLWVudmVsb3BlXCIsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL2FkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtcGljdHVyZS1vXCIsIFwib3JkZXJcIjogNn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMjF9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJlNlx1NjBjNVwiLCBcInVybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2NvdXJlcy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcIm9yZGVyXCI6IDEwfSwge1widGl0bGVcIjogXCJcdThmNmVcdTY0YWRcdThiZmVcdTdhMGJcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY291cnNlcy9iYW5uZXJjb3VyZXMvXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2tcIiwgXCJvcmRlclwiOiAxMX0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU3YWUwXHU4MjgyXCIsIFwidXJsXCI6IFwiL2FkbWluL2NvdXJzZXMvbGVzc29uL1wiLCBcImljb25cIjogXCJmYSBmYS1ib29rbWFya1wiLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdTg5YzZcdTk4OTFcdThkNDRcdTZlOTBcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY291cnNlcy92aWRlby9cIiwgXCJpY29uXCI6IFwiZmEgZmEtYm9sdFwiLCBcIm9yZGVyXCI6IDEzfSwge1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcdTk2NDRcdTRlZjZcIiwgXCJ1cmxcIjogXCIvYWRtaW4vY291cnNlcy9jb3Vyc2VyZXNvdXJjZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY2xvdWQtdXBsb2FkXCIsIFwib3JkZXJcIjogMTR9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi9jb3Vyc2VzL2NvdXJlcy9cIn1dIn0=', '2018-01-21 12:16:05.379281');
COMMIT;

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) COLLATE utf8_croatian_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_croatian_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `birday` date DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_croatian_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_croatian_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_croatian_ci NOT NULL,
  `is_jh` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `users_userprofile` VALUES (1, 'admin', 'pbkdf2_sha256$36000$POBbw3xglk7K$aV+US6e5rdRElK1lY/VoAdkqa3WVrx2P4p6C4hvW3GM=', '2018-01-07 02:14:29.652372', 1, '', '', '18611662860@163.com', 1, 1, '2017-12-26 15:42:12.000000', '陈冠西111111', '2017-12-27', '北京市朝阳区HHH', '1822222222', 'image/2018/01/default_big_14_KhH09zi.png', 'female', 1);
INSERT INTO `users_userprofile` VALUES (2, 'btmeiju@126.com', 'pbkdf2_sha256$36000$S5volnxlsdGl$kV8g8V7VMv1rVstWnwN/HqzboAectfZCqs4l74IOpGY=', '2018-01-13 18:06:16.562942', 0, '', '', 'btmeiju@126.com', 0, 1, '2018-01-06 00:05:57.979100', '哈哈哈哈', '2018-01-01', '1111111111', '1878888888', 'image/2018/01/default_middile_2_WZ1559E_yWcw4w1.png', 'male', 1);
INSERT INTO `users_userprofile` VALUES (3, '18611662860@162.com', 'pbkdf2_sha256$36000$klHbhUuYIYTX$yEbG2zpT18y5DxxffcjcXngSX9pLiu0TjvWzJ8ZAmtc=', NULL, 0, '', '', '18611662860@162.com', 0, 1, '2018-01-13 18:05:03.478150', '匿名用户', NULL, '', NULL, 'image/default.png', 'female', 0);
COMMIT;

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  `url_name` varchar(64) COLLATE utf8_croatian_ci NOT NULL,
  `query` varchar(1000) COLLATE utf8_croatian_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) COLLATE utf8_croatian_ci DEFAULT NULL,
  `object_id` longtext COLLATE utf8_croatian_ci,
  `object_repr` varchar(200) COLLATE utf8_croatian_ci NOT NULL,
  `action_flag` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `message` longtext COLLATE utf8_croatian_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_log` VALUES (1, '2017-12-27 17:01:27.980303', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (2, '2017-12-27 17:01:35.409462', '127.0.0.1', NULL, '', 'delete', '批量删除 2 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (3, '2017-12-27 17:08:11.857584', '127.0.0.1', '7', 'admin1', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (4, '2017-12-27 17:10:50.116057', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (5, '2017-12-27 17:36:42.129913', '127.0.0.1', '1', 'aaa@qq.com', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (6, '2017-12-27 17:38:52.056822', '127.0.0.1', '1', 'aaa@qq.com', 'change', '没有字段被修改。', 8, 1);
INSERT INTO `xadmin_log` VALUES (7, '2017-12-27 17:39:09.217433', '127.0.0.1', '1', 'aaa@qq.com', 'change', '没有字段被修改。', 8, 1);
INSERT INTO `xadmin_log` VALUES (8, '2017-12-27 17:53:31.471111', '127.0.0.1', '2', 'dddd@qq.com', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (9, '2017-12-27 18:04:20.634218', '127.0.0.1', '1', '好课程就免费', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (10, '2017-12-27 18:05:48.906664', '127.0.0.1', '1', '好课程就免费', 'change', '没有字段被修改。', 7, 1);
INSERT INTO `xadmin_log` VALUES (11, '2017-12-27 18:11:20.613409', '127.0.0.1', '1', '好课程就免费', 'change', '修改 image', 7, 1);
INSERT INTO `xadmin_log` VALUES (12, '2017-12-27 18:14:06.480982', '127.0.0.1', '1', '好课程就免费', 'change', '修改 index', 7, 1);
INSERT INTO `xadmin_log` VALUES (13, '2017-12-27 18:19:27.001074', '127.0.0.1', '2', '1475348764@qq.com', 'change', '修改 code 和 email', 8, 1);
INSERT INTO `xadmin_log` VALUES (14, '2017-12-27 18:19:35.392969', '127.0.0.1', '1', '1475348764@qq.com', 'change', '修改 email', 8, 1);
INSERT INTO `xadmin_log` VALUES (15, '2017-12-27 18:19:45.034063', '127.0.0.1', '2', '1475348764@qq.com', 'change', '修改 send_time', 8, 1);
INSERT INTO `xadmin_log` VALUES (16, '2017-12-27 18:19:49.900001', '127.0.0.1', '1', '1475348764@qq.com', 'change', '修改 send_time', 8, 1);
INSERT INTO `xadmin_log` VALUES (17, '2017-12-27 18:19:54.373475', '127.0.0.1', '2', '1475348764@qq.com', 'change', '没有字段被修改。', 8, 1);
INSERT INTO `xadmin_log` VALUES (18, '2017-12-27 18:20:40.060542', '127.0.0.1', '2', '1475348764@qq.com', 'change', '修改 send_time', 8, 1);
INSERT INTO `xadmin_log` VALUES (19, '2017-12-27 20:20:21.810689', '127.0.0.1', '8', 'adminaaaaa', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (20, '2017-12-27 20:20:59.119718', '127.0.0.1', '9', '小白狗', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (21, '2017-12-27 20:23:32.114052', '127.0.0.1', '10', '123456', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (22, '2017-12-27 20:42:11.196043', '127.0.0.1', '1', '北京', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (23, '2017-12-27 20:42:54.886969', '127.0.0.1', '1', '尚德机构', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (24, '2017-12-27 20:46:06.749823', '127.0.0.1', '1', 'Django基础', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (25, '2017-12-27 20:46:41.589512', '127.0.0.1', '1', '第一章 Django简介', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (26, '2017-12-27 20:47:11.329972', '127.0.0.1', '1', '第一节 Django简介', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (27, '2017-12-27 20:47:25.794316', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (28, '2017-12-27 20:47:39.049697', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'change', '没有字段被修改。', 15, 1);
INSERT INTO `xadmin_log` VALUES (29, '2017-12-27 20:47:55.790326', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'change', '修改 download', 15, 1);
INSERT INTO `xadmin_log` VALUES (30, '2017-12-27 21:28:23.148580', '127.0.0.1', NULL, '', 'delete', '批量删除 3 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (31, '2017-12-28 00:05:42.691073', '127.0.0.1', '11', 'aaa', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (32, '2017-12-29 00:19:59.969560', '127.0.0.1', NULL, '', 'delete', '批量删除 9 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (33, '2017-12-29 00:27:07.622580', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (34, '2017-12-29 00:34:58.996151', '127.0.0.1', '22', 'lrjorg@sina.com', 'change', '修改 is_active，address 和 image', 6, 1);
INSERT INTO `xadmin_log` VALUES (35, '2017-12-29 00:37:38.676702', '127.0.0.1', '22', 'lrjorg@sina.com', 'change', '修改 is_active', 6, 1);
INSERT INTO `xadmin_log` VALUES (36, '2017-12-29 01:01:30.447358', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (37, '2017-12-29 10:34:34.790660', '127.0.0.1', NULL, '', 'delete', '批量删除 6 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (38, '2017-12-29 10:50:46.982512', '127.0.0.1', NULL, '', 'delete', '批量删除 3 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (39, '2017-12-29 11:46:37.305713', '127.0.0.1', NULL, '', 'delete', '批量删除 2 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (40, '2017-12-29 12:32:42.359452', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (41, '2017-12-29 18:09:15.845615', '127.0.0.1', NULL, '', 'delete', '批量删除 2 个 邮箱验证码', NULL, 1);
INSERT INTO `xadmin_log` VALUES (42, '2017-12-29 18:09:24.384731', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 邮箱验证码', NULL, 1);
INSERT INTO `xadmin_log` VALUES (43, '2017-12-29 18:10:33.617107', '127.0.0.1', NULL, '', 'delete', '批量删除 31 个 邮箱验证码', NULL, 1);
INSERT INTO `xadmin_log` VALUES (44, '2017-12-29 22:12:58.809889', '127.0.0.1', '1', '北京市', 'change', '修改 name', 10, 1);
INSERT INTO `xadmin_log` VALUES (45, '2017-12-29 22:13:08.561064', '127.0.0.1', '2', '上海市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (46, '2017-12-29 22:13:19.533358', '127.0.0.1', '3', '广州市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (47, '2017-12-29 22:13:33.294473', '127.0.0.1', '4', '深证市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (48, '2017-12-29 22:13:46.406762', '127.0.0.1', '5', '郑州市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (49, '2017-12-29 22:13:55.238274', '127.0.0.1', '6', '驻马店市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (50, '2017-12-29 22:14:04.011429', '127.0.0.1', '7', '商丘市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (51, '2017-12-29 22:14:13.529984', '127.0.0.1', '8', '合肥市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (52, '2017-12-29 22:14:22.029948', '127.0.0.1', '9', '南京市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (53, '2017-12-29 22:14:56.944469', '127.0.0.1', '10', '大庆市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (54, '2017-12-29 22:15:59.815983', '127.0.0.1', '11', '河北市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (55, '2017-12-29 22:16:08.169798', '127.0.0.1', '12', '天津市', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (56, '2017-12-29 22:20:37.115867', '127.0.0.1', '2', '北京大学', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (57, '2017-12-29 22:21:08.758538', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 课程机构', NULL, 1);
INSERT INTO `xadmin_log` VALUES (58, '2017-12-29 22:24:45.951946', '127.0.0.1', '3', '河南大学', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (59, '2017-12-29 22:25:59.765248', '127.0.0.1', '13', '哈尔滨', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (60, '2017-12-29 22:26:24.489039', '127.0.0.1', '4', '东北大学', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (61, '2017-12-29 22:27:51.734980', '127.0.0.1', '5', '上海大学', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (62, '2017-12-29 22:28:32.551976', '127.0.0.1', '6', '上海大学1', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (63, '2017-12-29 22:29:14.116094', '127.0.0.1', '7', '上海大学2', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (64, '2017-12-29 22:29:58.069258', '127.0.0.1', '8', '广州大学', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (65, '2017-12-29 22:38:04.374048', '127.0.0.1', '8', '广州大学', 'change', '修改 catgory', 9, 1);
INSERT INTO `xadmin_log` VALUES (66, '2017-12-29 22:38:11.706061', '127.0.0.1', '2', '北京大学', 'change', '修改 catgory', 9, 1);
INSERT INTO `xadmin_log` VALUES (67, '2017-12-29 22:38:18.526364', '127.0.0.1', '3', '河南大学', 'change', '修改 catgory', 9, 1);
INSERT INTO `xadmin_log` VALUES (68, '2017-12-29 22:38:56.856309', '127.0.0.1', '6', '上海大学1', 'change', '修改 catgory', 9, 1);
INSERT INTO `xadmin_log` VALUES (69, '2017-12-29 22:39:03.452347', '127.0.0.1', '6', '上海大学1', 'change', '修改 catgory', 9, 1);
INSERT INTO `xadmin_log` VALUES (70, '2017-12-29 22:39:30.668038', '127.0.0.1', '4', '东北大学', 'change', '修改 catgory', 9, 1);
INSERT INTO `xadmin_log` VALUES (71, '2017-12-29 22:42:25.537763', '127.0.0.1', '9', '个人机构', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (72, '2017-12-30 12:24:06.494121', '127.0.0.1', '2', '北京大学', 'change', '修改 click_nums', 9, 1);
INSERT INTO `xadmin_log` VALUES (73, '2017-12-30 12:25:30.805608', '127.0.0.1', '2', '北京大学', 'change', '没有字段被修改。', 9, 1);
INSERT INTO `xadmin_log` VALUES (74, '2017-12-30 12:25:38.228692', '127.0.0.1', '9', '个人机构', 'change', '修改 kcs', 9, 1);
INSERT INTO `xadmin_log` VALUES (75, '2017-12-30 12:25:49.454260', '127.0.0.1', '2', '北京大学', 'change', '修改 kcs', 9, 1);
INSERT INTO `xadmin_log` VALUES (76, '2017-12-30 12:41:18.926239', '127.0.0.1', '4', '东北大学', 'change', '修改 click_nums', 9, 1);
INSERT INTO `xadmin_log` VALUES (77, '2017-12-30 13:06:15.773926', '127.0.0.1', '8', '广州大学', 'change', '修改 xxrs', 9, 1);
INSERT INTO `xadmin_log` VALUES (78, '2017-12-30 13:21:18.640464', '127.0.0.1', '6', '上海大学1', 'change', '修改 xxrs', 9, 1);
INSERT INTO `xadmin_log` VALUES (79, '2017-12-30 18:00:51.543347', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户报名', NULL, 1);
INSERT INTO `xadmin_log` VALUES (80, '2017-12-30 18:15:02.932318', '127.0.0.1', NULL, '', 'delete', '批量删除 13 个 用户报名', NULL, 1);
INSERT INTO `xadmin_log` VALUES (81, '2017-12-30 18:23:51.405838', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户报名', NULL, 1);
INSERT INTO `xadmin_log` VALUES (82, '2017-12-30 18:32:58.053881', '127.0.0.1', NULL, '', 'delete', '批量删除 7 个 用户报名', NULL, 1);
INSERT INTO `xadmin_log` VALUES (83, '2017-12-30 18:34:56.625748', '127.0.0.1', NULL, '', 'delete', '批量删除 3 个 用户报名', NULL, 1);
INSERT INTO `xadmin_log` VALUES (84, '2017-12-31 19:38:20.502915', '127.0.0.1', '1', '陈书剑', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (85, '2017-12-31 19:39:13.842643', '127.0.0.1', '2', '陈211', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (86, '2017-12-31 19:46:19.280494', '127.0.0.1', '1', 'Django基础', 'change', '修改 course_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (87, '2017-12-31 19:47:07.784079', '127.0.0.1', '2', 'Python高级开发', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (88, '2017-12-31 21:13:43.970792', '127.0.0.1', '1', '陈书剑', 'change', '修改 image', 11, 1);
INSERT INTO `xadmin_log` VALUES (89, '2017-12-31 21:13:51.075826', '127.0.0.1', '2', '陈211', 'change', '修改 image', 11, 1);
INSERT INTO `xadmin_log` VALUES (90, '2017-12-31 22:39:44.248331', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 kcjs_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (91, '2017-12-31 22:39:50.401931', '127.0.0.1', '1', 'Django基础', 'change', '修改 kcjs_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (92, '2018-01-01 15:18:53.823298', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 course_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (93, '2018-01-01 15:43:22.861599', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 click_nums', 12, 1);
INSERT INTO `xadmin_log` VALUES (94, '2018-01-01 17:01:16.705066', '127.0.0.1', '1', '第一章 Django简介', 'change', '修改 course', 14, 1);
INSERT INTO `xadmin_log` VALUES (95, '2018-01-01 20:28:24.787469', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 category', 12, 1);
INSERT INTO `xadmin_log` VALUES (96, '2018-01-01 20:28:48.870158', '127.0.0.1', '1', 'Django基础', 'change', '修改 category', 12, 1);
INSERT INTO `xadmin_log` VALUES (97, '2018-01-01 20:36:13.484122', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 detail', 12, 1);
INSERT INTO `xadmin_log` VALUES (98, '2018-01-01 20:52:02.861035', '127.0.0.1', '5', 'UserCourse object', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (99, '2018-01-01 20:57:19.213544', '127.0.0.1', '6', 'UserCourse object', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (100, '2018-01-01 20:58:22.656628', '127.0.0.1', '7', 'UserCourse object', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (101, '2018-01-01 21:12:08.442503', '127.0.0.1', '1', 'Django基础', 'change', '修改 course_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (102, '2018-01-01 21:19:13.838015', '127.0.0.1', '9', '个人机构', 'change', '没有字段被修改。', 9, 1);
INSERT INTO `xadmin_log` VALUES (103, '2018-01-01 21:22:01.917994', '127.0.0.1', '3', '河南大学', 'change', '修改 kcs 和 xxrs', 9, 1);
INSERT INTO `xadmin_log` VALUES (104, '2018-01-01 21:28:00.501029', '127.0.0.1', '2', '陈211', 'change', '修改 org', 11, 1);
INSERT INTO `xadmin_log` VALUES (105, '2018-01-01 21:28:07.294988', '127.0.0.1', '1', '陈书剑', 'change', '修改 org', 11, 1);
INSERT INTO `xadmin_log` VALUES (106, '2018-01-01 21:38:02.327098', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 tag', 12, 1);
INSERT INTO `xadmin_log` VALUES (107, '2018-01-01 21:38:18.891793', '127.0.0.1', '1', 'Django基础', 'change', '修改 tag', 12, 1);
INSERT INTO `xadmin_log` VALUES (108, '2018-01-01 21:49:28.605966', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 learn_times', 12, 1);
INSERT INTO `xadmin_log` VALUES (109, '2018-01-01 21:51:06.530202', '127.0.0.1', '1', 'Django基础', 'change', '修改 tag', 12, 1);
INSERT INTO `xadmin_log` VALUES (110, '2018-01-02 17:45:59.859756', '127.0.0.1', '1', '第一章 Django简介', 'change', '没有字段被修改。', 14, 1);
INSERT INTO `xadmin_log` VALUES (111, '2018-01-02 17:46:57.505158', '127.0.0.1', '2', '第一个Django应用', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (112, '2018-01-02 17:47:09.632056', '127.0.0.1', '1', '第二节 Django简介', 'change', '修改 name', 13, 1);
INSERT INTO `xadmin_log` VALUES (113, '2018-01-02 17:50:08.166411', '127.0.0.1', '2', '第一个Django应用', 'change', '修改 video_url', 13, 1);
INSERT INTO `xadmin_log` VALUES (114, '2018-01-02 17:50:12.466580', '127.0.0.1', '2', '第一个Django应用', 'change', '没有字段被修改。', 13, 1);
INSERT INTO `xadmin_log` VALUES (115, '2018-01-02 17:50:21.727202', '127.0.0.1', '1', '第二节 Django简介', 'change', '修改 video_url', 13, 1);
INSERT INTO `xadmin_log` VALUES (116, '2018-01-02 17:50:25.704360', '127.0.0.1', '1', '第二节 Django简介', 'change', '没有字段被修改。', 13, 1);
INSERT INTO `xadmin_log` VALUES (117, '2018-01-02 17:51:20.729655', '127.0.0.1', '2', '第二章', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (118, '2018-01-02 17:51:38.245329', '127.0.0.1', '2', '第二章 Django的高性能优化', 'change', '修改 name', 14, 1);
INSERT INTO `xadmin_log` VALUES (119, '2018-01-02 17:52:04.839710', '127.0.0.1', '3', '如何优化Django', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (120, '2018-01-02 17:52:23.580302', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'change', '没有字段被修改。', 15, 1);
INSERT INTO `xadmin_log` VALUES (121, '2018-01-02 18:00:35.605113', '127.0.0.1', '1', '第一章 Django简介', 'change', '修改 course', 14, 1);
INSERT INTO `xadmin_log` VALUES (122, '2018-01-02 18:54:23.032408', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 视频资源', NULL, 1);
INSERT INTO `xadmin_log` VALUES (123, '2018-01-02 18:54:45.435070', '127.0.0.1', '4', 'Django的入门到放弃', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (124, '2018-01-02 18:55:01.413901', '127.0.0.1', '2', '第一个Django应用', 'change', '修改 video_time', 13, 1);
INSERT INTO `xadmin_log` VALUES (125, '2018-01-02 18:55:05.507887', '127.0.0.1', '4', 'Django的入门到放弃', 'change', '没有字段被修改。', 13, 1);
INSERT INTO `xadmin_log` VALUES (126, '2018-01-02 18:55:10.924382', '127.0.0.1', '3', '如何优化Django', 'change', '修改 video_time', 13, 1);
INSERT INTO `xadmin_log` VALUES (127, '2018-01-02 18:59:10.995324', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'change', '没有字段被修改。', 15, 1);
INSERT INTO `xadmin_log` VALUES (128, '2018-01-02 19:02:04.985751', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'change', '修改 download', 15, 1);
INSERT INTO `xadmin_log` VALUES (129, '2018-01-02 19:04:11.040282', '127.0.0.1', '1', '啊啊啊啊啊啊啊啊啊啊', 'change', '没有字段被修改。', 15, 1);
INSERT INTO `xadmin_log` VALUES (130, '2018-01-02 19:04:29.391493', '127.0.0.1', '2', '我是第二个附件下载', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (131, '2018-01-02 20:04:26.745699', '127.0.0.1', '3', '附件啦', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (132, '2018-01-02 20:19:59.577068', '127.0.0.1', '1', 'Django基础', 'change', '修改 kcxz 和 xdaoshenm', 12, 1);
INSERT INTO `xadmin_log` VALUES (133, '2018-01-02 21:06:05.446368', '127.0.0.1', '3', '哈哈哈哈哈哈哈或或或或，这是一条评论啦', 'create', '已添加。', 19, 1);
INSERT INTO `xadmin_log` VALUES (134, '2018-01-02 22:04:08.361799', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (135, '2018-01-03 10:44:40.474303', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 students', 12, 1);
INSERT INTO `xadmin_log` VALUES (136, '2018-01-03 11:19:31.414046', '127.0.0.1', NULL, '', 'delete', '批量删除 2 个 用户课程', NULL, 1);
INSERT INTO `xadmin_log` VALUES (137, '2018-01-03 17:38:08.437803', '127.0.0.1', '1', '陈书剑', 'change', '修改 points', 11, 1);
INSERT INTO `xadmin_log` VALUES (138, '2018-01-03 20:24:55.395123', '127.0.0.1', '1', 'Django基础', 'change', '修改 course_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (139, '2018-01-03 20:34:47.755225', '127.0.0.1', '3', '河南大学', 'change', '没有字段被修改。', 9, 1);
INSERT INTO `xadmin_log` VALUES (140, '2018-01-03 20:56:31.043799', '127.0.0.1', NULL, '', 'delete', '批量删除 5 个 用户收藏', NULL, 1);
INSERT INTO `xadmin_log` VALUES (141, '2018-01-03 21:29:49.714711', '127.0.0.1', '2', '陈211', 'change', '修改 org', 11, 1);
INSERT INTO `xadmin_log` VALUES (142, '2018-01-04 11:18:39.886127', '127.0.0.1', '1', '陈书剑', 'change', '修改 points', 11, 1);
INSERT INTO `xadmin_log` VALUES (143, '2018-01-04 16:03:33.907600', '127.0.0.1', '1', 'admin', 'change', '修改 nick_name，birday，address，mobile 和 gender', 6, 1);
INSERT INTO `xadmin_log` VALUES (144, '2018-01-04 16:03:59.145465', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (145, '2018-01-04 16:04:28.354766', '127.0.0.1', '1', 'admin', 'change', '修改 email 和 image', 6, 1);
INSERT INTO `xadmin_log` VALUES (146, '2018-01-04 16:04:39.888976', '127.0.0.1', '1', 'admin', 'change', '没有字段被修改。', 6, 1);
INSERT INTO `xadmin_log` VALUES (147, '2018-01-04 16:09:26.285907', '127.0.0.1', '1', 'admin', 'change', '没有字段被修改。', 6, 1);
INSERT INTO `xadmin_log` VALUES (148, '2018-01-04 16:28:50.761337', '127.0.0.1', '1', '陈书剑', 'change', '修改 image', 11, 1);
INSERT INTO `xadmin_log` VALUES (149, '2018-01-04 16:29:39.415452', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 image', 12, 1);
INSERT INTO `xadmin_log` VALUES (150, '2018-01-04 21:56:42.205018', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (151, '2018-01-04 23:11:22.224870', '127.0.0.1', NULL, '', 'delete', '批量删除 18 个 邮箱验证码', NULL, 1);
INSERT INTO `xadmin_log` VALUES (152, '2018-01-04 23:22:59.640990', '127.0.0.1', '53', 'btmeiju@126.com', 'change', '修改 is_sx', 8, 1);
INSERT INTO `xadmin_log` VALUES (153, '2018-01-04 23:23:08.940226', '127.0.0.1', '53', 'btmeiju@126.com', 'change', '修改 is_sx', 8, 1);
INSERT INTO `xadmin_log` VALUES (154, '2018-01-04 23:25:10.907851', '127.0.0.1', '53', 'btmeiju@126.com', 'change', '修改 is_sx', 8, 1);
INSERT INTO `xadmin_log` VALUES (155, '2018-01-04 23:31:50.703780', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 邮箱验证码', NULL, 1);
INSERT INTO `xadmin_log` VALUES (156, '2018-01-05 20:19:30.017612', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 fav_nums', 12, 1);
INSERT INTO `xadmin_log` VALUES (157, '2018-01-05 22:09:58.271592', '127.0.0.1', '1', 'Django基础', 'change', '修改 kcjs_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (158, '2018-01-05 23:33:53.911634', '127.0.0.1', '2', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (159, '2018-01-05 23:51:58.818547', '127.0.0.1', '2', 'UserMessage object', 'change', '修改 user', 20, 1);
INSERT INTO `xadmin_log` VALUES (160, '2018-01-05 23:52:55.655546', '127.0.0.1', '2', 'UserMessage object', 'change', '没有字段被修改。', 20, 1);
INSERT INTO `xadmin_log` VALUES (161, '2018-01-05 23:53:05.685697', '127.0.0.1', '3', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (162, '2018-01-05 23:53:18.685125', '127.0.0.1', '4', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (163, '2018-01-05 23:53:22.434823', '127.0.0.1', '5', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (164, '2018-01-05 23:53:31.143680', '127.0.0.1', '6', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (165, '2018-01-06 00:31:42.020981', '127.0.0.1', '2', 'UserMessage object', 'change', '修改 has_read', 20, 1);
INSERT INTO `xadmin_log` VALUES (166, '2018-01-06 00:36:41.946638', '127.0.0.1', '3', 'UserMessage object', 'change', '修改 user', 20, 1);
INSERT INTO `xadmin_log` VALUES (167, '2018-01-06 02:09:58.420659', '127.0.0.1', '4', 'UserMessage object', 'change', '修改 user', 20, 1);
INSERT INTO `xadmin_log` VALUES (168, '2018-01-06 02:11:23.679327', '127.0.0.1', '6', 'UserMessage object', 'change', '修改 user', 20, 1);
INSERT INTO `xadmin_log` VALUES (169, '2018-01-06 12:52:21.479356', '127.0.0.1', '1', '好课程就免费', 'change', '修改 image 和 url', 7, 1);
INSERT INTO `xadmin_log` VALUES (170, '2018-01-06 12:52:53.749576', '127.0.0.1', '2', '第二个', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (171, '2018-01-06 12:57:06.658920', '127.0.0.1', '2', '第二个', 'change', '修改 url', 7, 1);
INSERT INTO `xadmin_log` VALUES (172, '2018-01-06 12:57:22.865205', '127.0.0.1', '1', '好课程就免费', 'change', '修改 url', 7, 1);
INSERT INTO `xadmin_log` VALUES (173, '2018-01-06 13:03:02.601228', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 is_tg', 12, 1);
INSERT INTO `xadmin_log` VALUES (174, '2018-01-06 13:03:10.881471', '127.0.0.1', '1', 'Django基础', 'change', '修改 is_tg', 12, 1);
INSERT INTO `xadmin_log` VALUES (175, '2018-01-06 13:10:21.714572', '127.0.0.1', '1', 'Django基础', 'change', '修改 is_tg', 12, 1);
INSERT INTO `xadmin_log` VALUES (176, '2018-01-06 13:18:45.423920', '127.0.0.1', '3', 'Django基础', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (177, '2018-01-06 13:19:59.758704', '127.0.0.1', '4', 'java基础', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (178, '2018-01-06 13:21:15.763624', '127.0.0.1', '5', 'PHP入门到放弃', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (179, '2018-01-06 13:22:14.891634', '127.0.0.1', '6', 'ios入门到大神', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (180, '2018-01-06 13:23:18.106726', '127.0.0.1', '7', 'Python进阶开发', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (181, '2018-01-06 13:24:33.014095', '127.0.0.1', '8', 'C语言入门到放弃', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (182, '2018-01-06 13:25:22.760659', '127.0.0.1', '7', 'Python进阶开发', 'change', '修改 is_tg', 12, 1);
INSERT INTO `xadmin_log` VALUES (183, '2018-01-06 13:40:51.055887', '127.0.0.1', '10', '机构1', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (184, '2018-01-06 13:41:12.004078', '127.0.0.1', '11', '机构2', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (185, '2018-01-06 13:41:35.905748', '127.0.0.1', '12', '机构3', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (186, '2018-01-06 13:42:02.837387', '127.0.0.1', '13', '机构4', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (187, '2018-01-06 13:42:23.786955', '127.0.0.1', '14', '机构的机构', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (188, '2018-01-06 13:42:43.414645', '127.0.0.1', '15', '机构的描述', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (189, '2018-01-06 13:42:58.730141', '127.0.0.1', '14', '机构的机构', 'change', '修改 image', 9, 1);
INSERT INTO `xadmin_log` VALUES (190, '2018-01-06 13:43:14.852120', '127.0.0.1', '16', '2222222', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (191, '2018-01-06 13:43:30.405287', '127.0.0.1', '17', '2222222222', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (192, '2018-01-06 15:06:01.767692', '127.0.0.1', '8', 'C语言入门到放弃', 'change', '修改 image', 12, 1);
INSERT INTO `xadmin_log` VALUES (193, '2018-01-06 15:45:34.653427', '127.0.0.1', '8', 'C语言入门到放弃', 'change', '修改 image', 12, 1);
INSERT INTO `xadmin_log` VALUES (194, '2018-01-06 15:46:12.911024', '127.0.0.1', '8', 'C语言入门到放弃', 'change', '修改 image', 12, 1);
INSERT INTO `xadmin_log` VALUES (195, '2018-01-06 20:59:30.088605', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 course_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (196, '2018-01-06 20:59:39.024867', '127.0.0.1', '2', 'Python高级开发', 'change', '没有字段被修改。', 12, 1);
INSERT INTO `xadmin_log` VALUES (197, '2018-01-06 21:00:07.465984', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 course_org', 12, 1);
INSERT INTO `xadmin_log` VALUES (198, '2018-01-06 22:08:35.134145', '127.0.0.1', '2', 'Python高级开发', 'change', '没有字段被修改。', 12, 1);
INSERT INTO `xadmin_log` VALUES (199, '2018-01-06 22:09:19.050811', '127.0.0.1', '1', 'Django基础', 'change', '没有字段被修改。', 12, 1);
INSERT INTO `xadmin_log` VALUES (200, '2018-01-06 22:16:48.139240', '127.0.0.1', '4', '第三章', 'change', '没有字段被修改。', 14, 1);
INSERT INTO `xadmin_log` VALUES (201, '2018-01-06 22:41:09.362717', '127.0.0.1', '6', 'ios入门到大神', 'change', '修改 is_tg', 12, 1);
INSERT INTO `xadmin_log` VALUES (202, '2018-01-06 22:41:53.171023', '127.0.0.1', '7', 'Python进阶开发', 'change', '修改 is_tg', 26, 1);
INSERT INTO `xadmin_log` VALUES (203, '2018-01-07 11:08:05.412882', '127.0.0.1', '2', '北京大学', 'change', '修改 kcs', 9, 1);
INSERT INTO `xadmin_log` VALUES (204, '2018-01-07 11:13:55.720684', '127.0.0.1', '2', 'Python高级开发', 'change', '修改 detail', 26, 1);
COMMIT;

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) COLLATE utf8_croatian_ci NOT NULL,
  `value` longtext COLLATE utf8_croatian_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'site-theme', 'https://bootswatch.com/3/united/bootstrap.min.css', 1);
INSERT INTO `xadmin_usersettings` VALUES (3, 'users_userprofile_editform_portal', 'box-0,box-1,box-2,box-3,box-4|box-5', 1);
INSERT INTO `xadmin_usersettings` VALUES (4, 'courses_coures_editform_portal', 'box-0,lesson_set-group,,,', 1);
COMMIT;

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) COLLATE utf8_croatian_ci NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `value` longtext COLLATE utf8_croatian_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

SET FOREIGN_KEY_CHECKS = 1;
