/*
 Navicat MySQL Data Transfer

 Source Server         : xammpp_mysql
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : 127.0.0.1:3306
 Source Schema         : orderplatform

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 10/05/2023 22:15:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int NOT NULL,
  `a_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a_shopid` int NULL DEFAULT NULL,
  `a_power` int NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123', 1, 1);
INSERT INTO `admin` VALUES (2, 'gly', '321', 2, 1);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `banner_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `banner_height` double NOT NULL,
  `banner_width` double NOT NULL,
  `banner_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'ad_10years.jpg', 653, 1400, '1');
INSERT INTO `banner` VALUES (2, 'ad_feikuai.jpg', 653, 1400, '1');
INSERT INTO `banner` VALUES (3, 'ad_zhuanxingsong.jpg', 653, 1400, '1');
INSERT INTO `banner` VALUES (4, 'jfalskd.png', 234, 74893, 'http://www.fjalkdf.com/fasdf.png');
INSERT INTO `banner` VALUES (5, 'GAKKI.png', 44444444444, 444444444, 'www.baidu.com');
INSERT INTO `banner` VALUES (6, 'img-1640860928489a54e4b5b085aadf2ff618046a8e0eae3.jpg', 22222, 22222, 'www.baidu.com');
INSERT INTO `banner` VALUES (7, 'img-1640860867097beedf4d68b78f44ccf63cf4c3a108cc9.jpg', 23, 34, 'wwwwww.bbbbaidduuu.commmm');
INSERT INTO `banner` VALUES (8, 'img_0144.jpg', 23, 3, 'wwww.baidu.cccccc');
INSERT INTO `banner` VALUES (9, 'flowers.jpg', 23, 23, 'rrrrr.baid.cooo.org');
INSERT INTO `banner` VALUES (10, 'img-16408608730070d6aa1d00db1e046e45a5628db3c341c.jpg', 23, 23, 'eeeee.org');
INSERT INTO `banner` VALUES (11, '20151130034835226.jpg.source.jpg', 1920, 1200, 'https://www.baidu.com');

-- ----------------------------
-- Table structure for bannergroup
-- ----------------------------
DROP TABLE IF EXISTS `bannergroup`;
CREATE TABLE `bannergroup`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NULL DEFAULT NULL,
  `banner_id` int NULL DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_status` int NULL DEFAULT NULL,
  `shop_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bannergroup
-- ----------------------------
INSERT INTO `bannergroup` VALUES (1, 1, 1, 'banner组测试', 1, 1);
INSERT INTO `bannergroup` VALUES (2, 1, 2, 'banner组测试', 1, 1);
INSERT INTO `bannergroup` VALUES (3, 2, 1, 'banner组测试2', 1, 2);
INSERT INTO `bannergroup` VALUES (4, 3, 9, 'banner组组组3', 0, 3);
INSERT INTO `bannergroup` VALUES (5, 1, 3, 'banner组测试', 1, 1);
INSERT INTO `bannergroup` VALUES (6, 4, 1, '呃呃呃呃呃呃呃呃呃呃呃', 0, 1);
INSERT INTO `bannergroup` VALUES (7, 4, 2, '呃呃呃呃呃呃呃呃呃呃呃', 0, 1);
INSERT INTO `bannergroup` VALUES (8, 5, 4, '新建的banner组', 0, 1);
INSERT INTO `bannergroup` VALUES (9, 5, 8, '新建的banner组', 0, 1);
INSERT INTO `bannergroup` VALUES (10, 6, 1, 'testtesttest', 0, 1);
INSERT INTO `bannergroup` VALUES (11, 6, 3, 'testtesttest', 0, 1);
INSERT INTO `bannergroup` VALUES (12, 7, 1, 'fadsf ', 0, 1);
INSERT INTO `bannergroup` VALUES (13, 7, 2, 'fadsf ', 0, 1);
INSERT INTO `bannergroup` VALUES (14, 8, 1, '这是banner组名', 0, 1);
INSERT INTO `bannergroup` VALUES (15, 8, 2, '这是banner组名', 0, 1);
INSERT INTO `bannergroup` VALUES (16, 8, 3, '这是banner组名', 0, 1);
INSERT INTO `bannergroup` VALUES (17, 9, 3, '新建banner测试', 0, 1);
INSERT INTO `bannergroup` VALUES (18, 9, 11, '新建banner测试', 0, 1);
INSERT INTO `bannergroup` VALUES (19, 10, 7, '发大财', 0, 1);
INSERT INTO `bannergroup` VALUES (20, 10, 6, '发大财', 0, 1);

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `f_id` int NOT NULL,
  `f_u_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `f_price` int NULL DEFAULT NULL,
  `f_status` int NULL DEFAULT NULL,
  `f_g_id` int NULL DEFAULT NULL,
  `f_num` int NULL DEFAULT NULL,
  `f_time` int NULL DEFAULT NULL,
  `f_s_id` int NULL DEFAULT NULL,
  `f_tableid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES (1, 1681723093, 'lesw7vz502', 100, 3, 1, 2, 1681723093, 1, 1);
INSERT INTO `form` VALUES (2, 1681723093, 'lesw7vz502', 50, 3, 2, 1, 1681723093, 1, 1);
INSERT INTO `form` VALUES (3, 1681723093, 'lesw7vz502', 300, 3, 3, 6, 1681723093, 1, 1);
INSERT INTO `form` VALUES (4, 1681723093, 'lesw7vz502', 100, 3, 1, 2, 1681723093, 1, 1);
INSERT INTO `form` VALUES (5, 1681723093, 'lesw7vz502', 50, 3, 2, 1, 1681723093, 1, 1);
INSERT INTO `form` VALUES (6, 1681723093, 'lesw7vz502', 300, 3, 3, 6, 1681723093, 1, 1);
INSERT INTO `form` VALUES (7, 1681723093, 'lesw7vz502', 100, 3, 1, 2, 1681723093, 1, 1);
INSERT INTO `form` VALUES (8, 1679310955, 'lesw7vz502', 100, 3, 1, 2, 1679310955, 1, 1);
INSERT INTO `form` VALUES (9, 1679138155, 'lesw7vz502', 100, 1, 1, 2, 1679138155, 1, 1);
INSERT INTO `form` VALUES (10, 1679224555, 'lesw7vz502', 100, 0, 1, 2, 1679224555, 1, 1);
INSERT INTO `form` VALUES (11, 1681550293, 'lesw7vz502', 100, 0, 1, 2, 1681550293, 1, 1);
INSERT INTO `form` VALUES (12, 1681550293, 'lesw7vz502', 50, 0, 2, 1, 1681550293, 1, 1);
INSERT INTO `form` VALUES (13, 1681550293, 'lesw7vz502', 300, 0, 3, 6, 1681550293, 1, 1);
INSERT INTO `form` VALUES (14, 1681550293, 'lesw7vz502', 100, 0, 1, 2, 1681550293, 1, 1);
INSERT INTO `form` VALUES (15, 1681550293, 'lesw7vz502', 50, 0, 2, 1, 1681550293, 1, 1);
INSERT INTO `form` VALUES (16, 1681550293, 'lesw7vz502', 300, 0, 3, 6, 1681550293, 1, 1);
INSERT INTO `form` VALUES (17, 1678929355, 'lesw7vz502', 100, 0, 1, 2, 1678929355, 1, 1);
INSERT INTO `form` VALUES (18, 1678929355, 'lesw7vz502', 50, 0, 2, 1, 1678929355, 1, 1);
INSERT INTO `form` VALUES (19, 1678929355, 'lesw7vz502', 300, 0, 3, 6, 1678929355, 1, 1);
INSERT INTO `form` VALUES (20, 1678842955, 'lesw7vz502', 100, 0, 1, 2, 1678842955, 1, 1);
INSERT INTO `form` VALUES (21, 1678842955, 'lesw7vz502', 50, 0, 2, 1, 1678842955, 1, 1);
INSERT INTO `form` VALUES (22, 1678842955, 'lesw7vz502', 300, 0, 3, 6, 1678842955, 1, 1);
INSERT INTO `form` VALUES (23, 1678756555, 'lesw7vz502', 100, 0, 1, 2, 1678756555, 1, 1);
INSERT INTO `form` VALUES (24, 1678756555, 'lesw7vz502', 50, 0, 2, 1, 1678756555, 1, 1);
INSERT INTO `form` VALUES (25, 1678756555, 'lesw7vz502', 300, 0, 3, 6, 1678756555, 1, 1);
INSERT INTO `form` VALUES (26, 2147483647, 'lesw7vz502', 0, 0, 44, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (27, 2147483647, 'lesw7vz502', 10000, 0, 0, 2, 2147483647, 1, 3);
INSERT INTO `form` VALUES (28, 2147483647, 'lesw7vz502', 0, 0, 44, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (29, 2147483647, 'lesw7vz502', 10000, 0, 0, 2, 2147483647, 1, 3);
INSERT INTO `form` VALUES (30, 2147483647, 'lesw7vz502', 5000, 0, 1, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (31, 2147483647, 'lesw7vz502', 0, 0, 44, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (32, 2147483647, 'lesw7vz502', 10000, 0, 0, 2, 2147483647, 1, 3);
INSERT INTO `form` VALUES (33, 2147483647, 'lesw7vz502', 5000, 0, 1, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (34, 2147483647, 'lesw7vz502', 0, 0, 44, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (35, 2147483647, 'lesw7vz502', 10000, 0, 0, 2, 2147483647, 1, 3);
INSERT INTO `form` VALUES (36, 2147483647, 'lesw7vz502', 5000, 0, 1, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (37, 2147483647, 'lesw7vz502', 0, 0, 44, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (38, 2147483647, 'lesw7vz502', 10000, 0, 0, 2, 2147483647, 1, 3);
INSERT INTO `form` VALUES (39, 2147483647, 'lesw7vz502', 5000, 0, 1, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (40, 2147483647, 'lesw7vz502', 0, 0, 44, 1, 2147483647, 1, 3);
INSERT INTO `form` VALUES (41, 1683551884, 'lesw7vz502', 10000, 0, 0, 2, 1683551884, 1, 3);
INSERT INTO `form` VALUES (42, 1683551884, 'lesw7vz502', 5000, 0, 1, 1, 1683551884, 1, 3);
INSERT INTO `form` VALUES (43, 1683551884, 'lesw7vz502', 0, 0, 44, 1, 1683551884, 1, 3);
INSERT INTO `form` VALUES (44, 1683551884, 'lesw7vz502', 10000, 0, 0, 2, 1683551884, 1, 3);
INSERT INTO `form` VALUES (45, 1683646662, 'lesw7vz502', 5000, 0, 1, 1, 1683646662, 1, 3);
INSERT INTO `form` VALUES (46, 1683646662, 'lesw7vz502', 0, 0, 44, 1, 1683646662, 1, 3);
INSERT INTO `form` VALUES (47, 1683646662, 'lesw7vz502', 10000, 0, 0, 2, 1683646662, 1, 3);
INSERT INTO `form` VALUES (48, 1683646662, 'lesw7vz502', 5000, 0, 1, 1, 1683646662, 1, 3);
INSERT INTO `form` VALUES (49, 1683649671, 'lesw7vz502', 5000, 0, 4, 1, 1683649671, 1, 3);
INSERT INTO `form` VALUES (50, 1683649671, 'lesw7vz502', 10000, 0, 5, 2, 1683649671, 1, 3);
INSERT INTO `form` VALUES (51, 1683649696, 'lesw7vz502', 5000, 0, 4, 1, 1683649696, 1, 3);
INSERT INTO `form` VALUES (52, 1683649696, 'lesw7vz502', 10000, 0, 5, 2, 1683649696, 1, 3);
INSERT INTO `form` VALUES (53, 1683721976, 'mxl03g0xnco', 3000, 1, 42, 1, 1683721976, 1, 3);
INSERT INTO `form` VALUES (54, 1683721976, 'mxl03g0xnco', 9999, 1, 43, 1, 1683721976, 1, 3);
INSERT INTO `form` VALUES (55, 1683722076, 'mxl03g0xnco', 5000, 3, 3, 1, 1683722076, 1, 3);
INSERT INTO `form` VALUES (56, 1683722076, 'mxl03g0xnco', 5000, 3, 4, 1, 1683722076, 1, 3);
INSERT INTO `form` VALUES (57, 1683722076, 'mxl03g0xnco', 10000, 3, 5, 2, 1683722076, 1, 3);
INSERT INTO `form` VALUES (58, 1683722238, 'mxl03g0xnco', 40000, 1, 41, 2, 1683722238, 1, 3);
INSERT INTO `form` VALUES (59, 1683722238, 'mxl03g0xnco', 10000, 1, 9, 2, 1683722238, 1, 3);
INSERT INTO `form` VALUES (60, 1683722238, 'mxl03g0xnco', 5000, 1, 10, 1, 1683722238, 1, 3);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `g_dishName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_status` int NULL DEFAULT NULL COMMENT '0：下架；1：上架；',
  `g_dishDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_imgUrl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `g_createdTime` int NULL DEFAULT NULL,
  `g_publishTime` int NULL DEFAULT NULL,
  `g_type` int NULL DEFAULT NULL,
  `g_shopid` int NULL DEFAULT NULL,
  `g_price` int NULL DEFAULT NULL COMMENT '1000等于十元',
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (0, '海底捞新一代番茄火锅', 1, '选用新品种的熟成沙瓤番茄，皮薄肉厚，番茄口感更绵密，汁水充盈，酸甜味更佳，锅底中\r\n番茄添加量更多！', 'https://website.hdlcdns.com/website/image/0908ca0d8e164761b795fe8e83764fad-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (1, '经典麻辣火锅', 1, '选用精选牛油与青花椒和红花椒、及多种辣椒慢火熬煮而成。锅底油 \r\n色红亮、汤味醇厚，越煮越香不变味。搭配蒜泥香油味碟，这样吃才地道！', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/815c991fcb59421e9f425805a431df55-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (2, '清油麻辣火锅', 1, '严选花椒、辣椒、香辛料原料，地道川味火锅；传统工艺发酵豆瓣；汤底色泽鲜红，口味香辣浓 \r\n郁；推荐搭配经典毛肚、鸭肠、牛肉、羊肉类产品。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/c746b391bc2545ea8e71033e4d12549a-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (3, '三鲜火锅', 1, '选用现代工艺萃取的肉类浓缩骨汤为汤底；可根据喜好搭配不同的特色味碟、推荐搭配涮食海鲜类及素食类食材。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/34bb9afa210d4848808e3c0317bc60c7-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (4, '猪肚鸡火锅', 1, '精选猪肚、三黄鸡、经慢火熬制的风味猪肚汤料包，鲜香浓\r\n郁、椒香扑鼻；推荐搭配涮素食食材。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/5897814a4ed140a087e7cc5c4354e69c-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (5, '姬松茸菌汤火锅', 1, '菌菇 \r\n看得见，汤鲜味美；菌香浓郁、爽口；推荐搭配涮食菌菇类食材。', 'https://website.hdlcdns.com/website/image/8e61d8478d1d4356809eadc80f0d1f96-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (6, '真香锅', 1, '采用植物油和少量牛油混合 \r\n，并添加多种香辛料、辣椒、花椒混合炒制，汤底鲜香、麻辣适中、油脂香味突出，味道清爽不油腻。推荐搭配毛肚、牛肉、\r\n羊肉涮煮。', 'https://website.hdlcdns.com/website/image/66d9d0cff0b245308ec1f9fc4808bdc3-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (7, '牛肉汤火锅', 1, '使用萃取工艺，将鸡骨、牛骨浓缩为风味骨汤；搭配大块牛肉和新鲜白萝卜， \r\n鲜香味美，牛肉汤风味浓郁。', 'https://website.hdlcdns.com/website/image/13b25c5d78954a29aedb2b2e01c4f812-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (8, '海底捞泡菜鸭锅', 1, '酸辣突出，泡菜香味浓郁', 'https://website.hdlcdns.com/website/image/b391ba1b4f3048c49a41e21d0fdb4c04-396-543.jpg', 2147483647, 2147483647, 1, 1, 5000);
INSERT INTO `goods` VALUES (9, '捞派魔芋素毛肚', 1, '海底捞全新推出素毛肚，从此“毛肚”放肆吃，口感Q弹，8秒就涮好。', 'https://website.hdlcdns.com/website/image/22b537a88f814392b4b24202a8cb3eb1-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (10, '过足肉 瘾大块羊肋排', 1, '只选用12个月以内的羔羊肋排部位，不拆骨白卤入味，根根贴骨肉，更香更过瘾。', 'https://website.hdlcdns.com/website/image/790f515ed3494c1db21cd885dc6a9eb3-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (11, '海底\r\n捞咯吱咯吱贡菜丸子', 1, '选用优质猪腿、鸡腿肉，搭配干贡菜手工制作肉丸，贡菜的爽口，咯吱咯吱，香而不腻。', 'https://website.hdlcdns.com/website/image/594e681ab7854d349069919b7e825ce1-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (12, '嫩滑黑鱼片', 1, '选用大片黑鱼肉，肉质鲜嫩，口感更弹韧。', 'https://website.hdlcdns.com/website/image/08687dbca37e48b1906f669dcc659c5b-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (13, '捞派生鸭血', 1, '低温锁鲜，口感嫩滑 \r\n，你吃一口就知道。', 'https://website.hdlcdns.com/website/image/417d77ef9f214e86bbc281486a278f4c-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (14, '红薯苕皮', 1, '纯红薯加工制成，软糯劲道，嚼劲十足。', 'https://website.hdlcdns.com/website/image/340447a28d4345b3b1de300f7ee1d361-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (15, '一口爆 \r\n浆奶酪鱼条', 1, '5成以上鱼肉混合鲜甜干酪炸至金黄，咬下一口先有鱼香、再有浓浓奶酪味。', 'https://website.hdlcdns.com/website/image/e3ff25ef4d73457aa46dc17abcc7f41d-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (16, '葡萄油柑气 \r\n泡水', 1, '葡萄加油柑，清爽解辣。', 'https://website.hdlcdns.com/website/image/e41e5db2e3cb4a16bfe9721fb42c5cec-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (17, '山茶花香青柚茶', 1, '山茶花香浓郁，入口清甜。', 'https://website.hdlcdns.com/website/image/c6ae64cba90e49a9a402c4f5462ad51d-396-543.jpg', 2147483647, 2147483647, 2, 1, 5000);
INSERT INTO `goods` VALUES (18, '海底捞大麦拉格啤酒', 1, '荣获2021年CBC中国国际啤酒挑战赛天禄奖一星。甄选进口大麦芽及啤酒花，烘焙麦芽带来琥\r\n珀色的朦胧酒体，低温发酵使味道更加纯净，凸显层次丰富的麦香，清冽爽口。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/6825b47a46624fa487f6e86fa27bebb4-396-543.jpg', NULL, 2147483647, 3, 1, 5000);
INSERT INTO `goods` VALUES (19, '海底捞德式小麦啤酒', 1, '荣获2021年CCBA中国精酿啤酒大奖银奖。馥郁的果香结合酵母发酵带来的香气。洁白细腻的泡 \r\n泡啤酒帽，酒体朦胧，口感柔滑饱满，入口清爽。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/7a40ca7d8f89412ba2f9e133107883cd-396-543.jpg', 2147483647, 2147483647, 3, 1, 5000);
INSERT INTO `goods` VALUES (20, '海底捞淡爽 \r\n拉格拉格啤酒', 1, '荣获2020年CCBA中国精酿啤酒大奖拉格&混合啤酒经典组铜奖。\r\n本款酒体金黄的拉格啤酒，甄选大麦芽和啤酒花，呈现简单纯净的麦芽芬芳，伴随微微的酒花香气，酒精度低，口感清爽淡雅\r\n，冷饮更佳。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/b8bc628a5b6445a0b4e2232442bcac95-396-543.jpg', 2147483647, 2147483647, 3, 1, 5000);
INSERT INTO `goods` VALUES (21, '特色蘸料', 1, '锅底百搭', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/3245d784e99f4bbf9da8db3fb5052163-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (22, '鲜香味碟', 1, '提鲜\r\n必备', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/10053c392da7495d91af0d287e16fb1b-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (23, '香辣味碟', 1, '川渝搭档', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/26569279a2244f909914efa361c7b3d0-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (24, '海鲜味碟', 1, '海鲜专属', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/3e61fb1a7d7f4735bea5e2b093ecb778-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (25, '丸滑味碟', 1, '丸滑必备', 'https://website.hdlcdns.com/website/image/f1387fea632c417d89551ad97fab2b41-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (26, '酸辣味碟', 1, '酸辣开胃', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/a76c620af6a84e0091a36fd11e3fa513-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (27, '蒜泥香油碟', 1, '川 \r\n式口味', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/5bc97a0b65214482a8329f504c133392-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (28, '芝麻调味酱', 1, '老北京口味', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/1a6322e3ea98448fa932a51ec445f27a-523-543.png', 2147483647, 2147483647, 4, 1, 5000);
INSERT INTO `goods` VALUES (29, '现炸酥肉', 1, '选用上等猪肉原料，酥脆可口，椒香口味给您不一样的体验！配上干辣椒碟或者番茄酱食用，风味独特 \r\n，直接涮火锅食用也超赞哦。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/764c43cebc394ac3bcc82dc10593ca59-396-543.jpg', 14, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (30, '茴香小油条', 1, '配以鲜茴香和茴香籽，口感松 \r\n软，茴香味回味悠长，趁热吃外皮酥脆口感更佳。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/e112fabae81e4e8da13afb0036735719-396-543.jpg', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (31, '五常米饭', 1, '黑土滋养，天池水灌溉，经过精细加工，淘洗，蒸煮而成，米粒晶莹饱满，香甜软糯。', 'https://hdl-globalportal-oss-bucket.oss-cn-beijing.aliyuncs.com/website/image/2dc70638c16e4c038a0e1cfcadad0866-396-543.jpg', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (32, '酥酥嫩嫩炸牛奶', 1, '外面酥酥脆脆，内里绵软嫩滑，香甜适中，满口奶香。', 'https://website.hdlcdns.com/website/image/95052f1064ec4e7db6fced60b12bde23-396-543.jpg', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (33, '一口 \r\n爆浆奶酪鱼条', 1, '外酥里嫩 奶酪味十足。', 'https://website.hdlcdns.com/website/image/9c1da6d79cab4175ae66e63ea65f77ed-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (34, '酥酥嫩嫩炸牛奶', 1, '口感酥脆，老少皆宜', 'https://website.hdlcdns.com/website/image/d35d1739a46a4db788aaa5bd830f2868-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (35, ' \r\n热卤大猪蹄子', 1, '卤香浓郁、肥而不腻、胶绵而不沾牙。', 'https://website.hdlcdns.com/website/image/ee640713616b4b7b9635e197bcf56a83-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (36, '热卤耙鸡爪', 1, '卤香十足、口感软糯。', 'https://website.hdlcdns.com/website/image/64965852ec2b442c973cb778361311ee-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (37, '热卤耙肥肠', 1, '口感劲道，卤味独特。', 'https://website.hdlcdns.com/website/image/41d044612a6e4088b16346b4b7ed3221-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (38, '热卤大片素板筋', 1, '筋道弹韧 吮指回味（微辣）', 'https://website.hdlcdns.com/website/image/93cd4a3b0cc74c30ac7dd17b2289261d-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (39, '热卤四大天王', 1, '卤香浓郁、肥而不腻（微辣）', 'https://website.hdlcdns.com/website/image/259375dbcb854062b3a187deba56f09c-396-543.png', 2147483647, 2147483647, 5, 1, 5000);
INSERT INTO `goods` VALUES (41, '测试测试测试火锅', 1, '测试测试火锅的描述', 'http://localhost/allPHPCode/OrderPlatform/system/resource/shop/goods/ecosystem.png', 1679469557, 1679469557, 1, 1, 20000);
INSERT INTO `goods` VALUES (42, '商品名', 0, '描述', 'http://localhost/allPHPCode/OrderPlatform/system/resource/shop/goods/boat.jpg', 1679470934, NULL, 0, 1, 3000);
INSERT INTO `goods` VALUES (43, '图片测试', 0, '名名', 'http://localhost/allPHPCode/OrderPlatform/system/resource/shop/goods/7.jpg', 1679471011, NULL, 0, 1, 9999);
INSERT INTO `goods` VALUES (44, '应该没有问题', 0, '秒怂虎', 'http://localhost/allPHPCode/OrderPlatform/system/resource/shop/goods/img-16408608730070d6aa1d00db1e046e45a5628db3c341c.jpg', 1679471135, NULL, 0, 1, 6666);
INSERT INTO `goods` VALUES (45, '名', 0, '描述', 'http://localhost/allPHPCode/OrderPlatform/system/resource/shop/goods/cat.jpeg', 1679471288, NULL, 5, 1, 2323);

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power`  (
  `p_id` int NOT NULL,
  `p_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of power
-- ----------------------------

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `s_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_id` int NOT NULL,
  `s_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_balance` int NULL DEFAULT NULL,
  `s_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_tabbar_id` int NULL DEFAULT NULL,
  `s_power` int NULL DEFAULT NULL,
  `s_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `s_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `s_bannergroup_id` int NULL DEFAULT NULL,
  `s_bg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `s_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('admin', 1, '海底捞', 0, 'address', 1, 2, 'haidilao', '111', 1, '2.png', 'haidilao.ico', '#ffffff');
INSERT INTO `shop` VALUES ('admin', 2, '星巴克', 0, 'address', 2, 2, 'starbuck', '222', 2, '1.png', 'starbuck.png', '#006440');
INSERT INTO `shop` VALUES ('gly', 3, '活着', 0, 'address', 3, 3, 'shop3', '333', 3, '1.png', 'anngreen.jpeg', NULL);

-- ----------------------------
-- Table structure for tabbar
-- ----------------------------
DROP TABLE IF EXISTS `tabbar`;
CREATE TABLE `tabbar`  (
  `tab_id` int NOT NULL AUTO_INCREMENT,
  `tab_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tab_icon_active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tab_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tab_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tab_tabbar_id` int NULL DEFAULT NULL,
  `tab_tabbar_status` int NULL DEFAULT NULL,
  `tab_tabbar_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tabbar
-- ----------------------------
INSERT INTO `tabbar` VALUES (1, 'home.png', 'home_active.png', '首页', '/home', 1, 1, 'tabbar名字');
INSERT INTO `tabbar` VALUES (2, 'club.png', 'club_active.png', '首页', '/club', 2, 0, 'tabbar名字2');
INSERT INTO `tabbar` VALUES (3, 'orders.png', 'orders_active.png', '订单', '/order', 1, 1, 'tabbar名字');
INSERT INTO `tabbar` VALUES (4, 'mine.png', 'mine_active.png', '我的', '/mine', 1, 1, 'tabbar名字');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `u_balance` double NULL DEFAULT NULL,
  `u_payword` int NULL DEFAULT NULL,
  `u_score` int NULL DEFAULT NULL,
  `u_expirestime` int NULL DEFAULT NULL,
  `u_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `u_shopid` int NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`, `u_username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '18456772638', 100, 123456, 100, 1668668218, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (2, 'ds89fjksdf89sdf8', 0, 111111, 0, 1679369649, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (3, 'xxxxxxxxxxxx', 0, 111111, 0, 1679369524, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (4, 'xxxxxxxxxxxxxxxx', 0, 111111, 0, 1679369501, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (5, 'ds89fjksdf89sdf8', 0, 111111, 0, 1679369672, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (6, 'ds89fjfajskdf78asdf78asd7f8', 0, 111111, 0, 1679369692, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (7, 'anvkm1ba0cw', 0, 111111, 0, 1679369893, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (8, 'anvkm1ba0cw', 0, 111111, 0, 1679369920, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (9, 'anvkm1ba0cw', 0, 111111, 0, 1679369930, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (10, 'anvkm1ba0cw', 0, 111111, 0, 1679369944, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (11, 'undefined', 0, 111111, 0, 1679370068, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (12, 'lesw7vz502', 0, 111111, 0, 1679370165, 'anngreen.jpeg', 1);
INSERT INTO `user` VALUES (13, 'v2b14etimjk', 0, 111111, 0, 1682420136, 'anngreen.jpeg', 2);

SET FOREIGN_KEY_CHECKS = 1;
