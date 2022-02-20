/*
 Navicat MySQL Data Transfer

 Source Server         : crm
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 20/02/2022 12:43:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `endDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('08dbb27a8d1c4ed9b73eb5f9ecb1c33a', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_13', '2022-02-13', '2022-02-13', '1000000', 'activity_13_description', '2022-02-06 20:22:08', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('0bdda68a761b40e597fe1cb84264898a', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_16', '2022-02-16', '2022-02-16', '1000000', 'activity_16_description', '2022-02-06 20:22:43', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('1a11536314c64086b889137986cc7892', '40f6cdea0bd34aceb77492a1656d9fb3', 'activity_6', '2022-01-20', '2022-01-20', '200', '操你大爷', '2022-01-20 21:32:19', '李四', NULL, NULL);
INSERT INTO `t_activity` VALUES ('28495b4b7d034e39a0d9fe4853b34662', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_10', '2022-02-10', '2022-02-10', '1000000', 'activity_10_description', '2022-02-06 20:21:24', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('2ab5cebb70f548d3a60bf3d8812a1bdd', '40f6cdea0bd34aceb77492a1656d9fb3', 'activity_5', '2022-01-22', '2022-01-22', '2', '吃饱喝足学习有劲', '2022-01-22 19:48:17', '李四', NULL, NULL);
INSERT INTO `t_activity` VALUES ('2bb0ae4a54694c1f99f731f0727345d6', '', 'activity_17', '2022-02-17', '2022-02-17', '1000000', 'activity_17_description', '2022-02-06 20:22:57', 'root', '2022-02-16 10:28:40', 'Admin');
INSERT INTO `t_activity` VALUES ('48b8e9943f7f471aae523d999b1579c8', '40f6cdea0bd34aceb77492a1656d9fb3', 'activity_4', '2022-01-22', '2022-01-22', '2', '吃饱喝足学习有劲', '2022-01-22 19:48:17', '李四', NULL, NULL);
INSERT INTO `t_activity` VALUES ('62903ca11a264738a024ce768a2db061', '40f6cdea0bd34aceb77492a1656d9fb3', 'activity_3', '2022-01-21', '2022-01-21', '1000', '呢', '2022-01-22 19:55:31', '李四', NULL, NULL);
INSERT INTO `t_activity` VALUES ('7135d20aea3f456a92c40876381858cc', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_8', '2022-02-08', '2022-02-08', '1000000', 'activity_8_description', '2022-02-06 20:17:30', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('768fb524cde5497fa71eea2747e0ddd4', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_11', '2022-02-11', '2022-02-11', '1000000', 'activity_11_description', '2022-02-06 20:21:35', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('7925dfae21b94d72a6486e9a1eabb63d', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_7', '2022-02-07', '2022-02-07', '10000', 'activity_7_description', '2022-02-06 20:16:59', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('891002b560144259b9a81354dfadfc4e', '06f5fc056eac41558a964f96daa7f27c', 'activity_2', '2022-01-20', '2022-01-20', '10000', '操你妈', '2022-01-20 21:24:44', '李四', NULL, NULL);
INSERT INTO `t_activity` VALUES ('a7b948d684844483ad5865b181d7c6a5', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_9', '2022-02-09', '2022-02-09', '1000000', 'activity_9_description', '2022-02-06 20:17:44', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('dba1260c414a4fb68653badeb90ab297', '06f5fc056eac41558a964f96daa7f27c', 'activity_1', '2022-01-22', '2022-01-22', '10', '有劲', '2022-01-21 16:02:13', '李四', NULL, NULL);
INSERT INTO `t_activity` VALUES ('dc4c2a6d8eb74d0398df03c964158052', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_14', '2022-02-14', '2022-02-14', '1000000', 'activity_14_description', '2022-02-06 20:22:20', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('df1f8805b7524c26aeb01ad0328fb46c', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_12', '2022-02-12', '2022-02-12', '1000000', 'activity_12\n_description', '2022-02-06 20:21:46', 'root', NULL, NULL);
INSERT INTO `t_activity` VALUES ('e7a17383ee574ab68ac586a02967ee65', '40f6cdea0bd34aceb79892a1656d9cia', 'activity_15', '2022-02-15', '2022-02-15', '1000000', 'activity_15_description', '2022-02-06 20:22:32', 'root', NULL, NULL);

-- ----------------------------
-- Table structure for t_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_remark`;
CREATE TABLE `t_activity_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_activity_remark
-- ----------------------------
INSERT INTO `t_activity_remark` VALUES ('02c14a968758486da8dcf936b7f19823', '3', '2022-02-16 10:30:56', 'Admin', NULL, NULL, '0', '0bdda68a761b40e597fe1cb84264898a');
INSERT INTO `t_activity_remark` VALUES ('16ff45d706fa4cd59cf5efde8638cbd2', '1', '2022-02-16 10:28:53', 'Admin', NULL, NULL, '0', '0bdda68a761b40e597fe1cb84264898a');
INSERT INTO `t_activity_remark` VALUES ('32f0d4b99fb24605bbffa0cb48473207', '1', '2022-02-16 10:28:38', 'Admin', NULL, NULL, '0', '2bb0ae4a54694c1f99f731f0727345d6');
INSERT INTO `t_activity_remark` VALUES ('3cd9f52ad47b4fc489b7c3d47655877d', '2', '2022-02-16 10:30:53', 'Admin', NULL, NULL, '0', '0bdda68a761b40e597fe1cb84264898a');
INSERT INTO `t_activity_remark` VALUES ('80a54fc3f85a489faa9127391ab2e907', '1', '2022-01-23 17:53:53', '李四', NULL, NULL, '0', 'dba1260c414a4fb68653badeb90ab297');
INSERT INTO `t_activity_remark` VALUES ('88167ad216644a1b97e4bb071321a7b1', '哈哈哈', '2022-01-23 15:56:54', NULL, '2022-01-23 18:02:58', '李四', '1', '48b8e9943f7f471aae523d999b1579c8');
INSERT INTO `t_activity_remark` VALUES ('8c46ed22ea5b43d6af673ca084f09425', '饿哈哈+', '2022-01-23 16:13:53', '李四', '2022-01-23 18:50:11', '李四', '1', '62903ca11a264738a024ce768a2db061');
INSERT INTO `t_activity_remark` VALUES ('8e8a39e6e0694c668a494661248a8b94', '吼++', '2022-01-23 16:12:28', NULL, '2022-01-23 18:53:37', '李四', '1', '48b8e9943f7f471aae523d999b1579c8');
INSERT INTO `t_activity_remark` VALUES ('c05e80c101544dbeb7435fe03b34ab34', '2', '2022-01-23 17:53:58', '李四', NULL, NULL, '0', 'dba1260c414a4fb68653badeb90ab297');

-- ----------------------------
-- Table structure for t_clue
-- ----------------------------
DROP TABLE IF EXISTS `t_clue`;
CREATE TABLE `t_clue`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_clue
-- ----------------------------
INSERT INTO `t_clue` VALUES ('50b97b0eb8f647c381cfcd8fc0061736', 'Larry Ellison', 'Mr.', '40f6cdea0bd34aceb79892a1656d9cia', 'Oracle Corporation', 'CTO', 'larry@oracle.com', '123-456', 'www.oracle.com', '1234567890', '', '', 'Admin', '2022-02-11 14:29:04', 'Admin', '2022-02-15 21:10:42', 'an American multinational computer technology corporation', 'hello', '2022-03-01', 'Austin, Texas, United States');
INSERT INTO `t_clue` VALUES ('6f828ef74fd94e5282aaf7044d802701', 'Elon Musk', 'Mr.', '40f6cdea0bd34aceb77492a1656d9fb3', 'Tesla, Inc', 'CEO', 'elon@tesla.com', '123-456', 'www.tesla.com', '1234567890', 'trying to contact', 'staff introduction', 'Admin', '2022-02-11 14:15:20', NULL, NULL, 'an American electric vehicle and clean energy company', '', '2022-02-18', '13101 Tesla Road, Austin, Texas, United States');
INSERT INTO `t_clue` VALUES ('9ea0c31851b8432490c567b50eae395f', 'Tim Cook', 'Mr.', '06f5fc056eac41558a964f96daa7f27c', 'Apple', 'CEO', 'tim@apple.com', '123-456', 'www.apple.com', '1234567890', 'contacted', 'web download', 'Admin', '2022-02-10 19:28:16', 'Admin', '2022-02-11 17:22:52', 'an American multinational technology company that specializes in consumer electronics, software and online services', '', '2022-02-11', '1 Apple Park Way, Cupertino, California, U.S.');
INSERT INTO `t_clue` VALUES ('c42e939c3ec04182a9c05f5c5b05a59e', 'Pat Gelsinger', 'Mr.', '40f6cdea0bd34aceb79892a1656d9cia', 'Intel Corporation', 'CEO', 'pat@intel.com', '123-456', 'www.intel.com', '1234567890', 'trying to contact', 'advertisement', 'Admin', '2022-02-11 14:31:31', 'Admin', '2022-02-15 22:05:46', 'an American multinational corporation and technology company', 'hello', '2022-02-25', 'Santa Clara, California, USA');
INSERT INTO `t_clue` VALUES ('cdb1ac1913314cac97da1ad93a3b6ef0', 'Jeff Bezos', 'Mr.', '40f6cdea0bd34aceb77492a1656d9fb3', 'Amazon.com, Inc.', 'Executive Chairman', 'jeff@amazon.com', '123-456', 'www.amazon.com', '1234567890', 'requirements', 'trade fairs', 'Admin', '2022-02-11 14:26:23', 'Admin', '2022-02-11 19:48:15', 'an American multinational technology company which focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence.', 'hello', '2022-02-28', 'Seattle, Washington, U.S.');
INSERT INTO `t_clue` VALUES ('d0da334955d241e38b5c7fa6882fc836', 'Bill Gates', 'Mr.', '40f6cdea0bd34aceb79892a1656d9cia', 'Microsoft', 'Member of the Board', 'bill@ms.com', '123-456', 'www.microsoft.com', '1234567890', 'contacted', 'web download', 'Admin', '2022-02-10 20:09:28', NULL, NULL, 'bill!', '', '2022-02-11', 'CA, USA');
INSERT INTO `t_clue` VALUES ('dacb0d424f1642588de77819ef88ec71', 'Mark Zuckerberg', 'Mr.', '06f5fc056eac41558a964f96daa7f27c', 'Meta Platforms, Inc.', 'CEO', 'mark@meta.com', '123-456', 'www.tesla.com', '1234567890', 'contact in future', 'web investigation', 'Admin', '2022-02-11 14:18:21', NULL, NULL, 'an American multinational technology conglomerate', '', '2022-02-15', 'Menlo Park, California, U.S.');

-- ----------------------------
-- Table structure for t_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_clue_activity_relation`;
CREATE TABLE `t_clue_activity_relation`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `clueId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_clue_activity_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_clue_remark`;
CREATE TABLE `t_clue_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `clueId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_clue_remark
-- ----------------------------

-- ----------------------------
-- Table structure for t_contacts
-- ----------------------------
DROP TABLE IF EXISTS `t_contacts`;
CREATE TABLE `t_contacts`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birth` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contacts
-- ----------------------------
INSERT INTO `t_contacts` VALUES ('24332e0261d24b918a7daf387fb98fdc', '40f6cdea0bd34aceb79892a1656d9cia', '', '4ea5cec989844d7294596f3b419c2f72', 'Larry Ellison', 'Mr.', 'larry@oracle.com', '1234567890', 'CTO', NULL, 'Admin', '2022-02-18 10:09:21', NULL, NULL, 'an American multinational computer technology corporation', 'hello', '2022-03-01', 'Austin, Texas, United States');
INSERT INTO `t_contacts` VALUES ('500da045c1384ecfb1dfd71134c7743f', '06f5fc056eac41558a964f96daa7f27c', 'web download', '76522886119347cd9d24784a7cb6c5cb', 'Tim Cook', 'Mr.', 'tim@apple.com', '1234567890', 'CEO', NULL, 'Admin', '2022-02-20 12:40:02', NULL, NULL, 'an American multinational technology company that specializes in consumer electronics, software and online services', '', '2022-02-11', '1 Apple Park Way, Cupertino, California, U.S.');
INSERT INTO `t_contacts` VALUES ('9a0ae0fd34124c79b36dadb60f434ea5', '06f5fc056eac41558a964f96daa7f27c', 'web download', '76522886119347cd9d24784a7cb6c5cb', 'Tim Cook', 'Mr.', 'tim@apple.com', '1234567890', 'CEO', NULL, 'Admin', '2022-02-20 12:39:42', NULL, NULL, 'an American multinational technology company that specializes in consumer electronics, software and online services', '', '2022-02-11', '1 Apple Park Way, Cupertino, California, U.S.');
INSERT INTO `t_contacts` VALUES ('a3e349e105954aa89e27dd40aee7a6e9', '06f5fc056eac41558a964f96daa7f27c', 'web investigation', '8167bf80e55b43258be09f6cbac7cc25', 'Mark Zuckerberg', 'Mr.', 'mark@meta.com', '1234567890', 'CEO', NULL, 'Admin', '2022-02-20 12:38:33', NULL, NULL, 'an American multinational technology conglomerate', '', '2022-02-15', 'Menlo Park, California, U.S.');
INSERT INTO `t_contacts` VALUES ('af82515e1197420b93fcfcbd04aa3caf', '06f5fc056eac41558a964f96daa7f27c', 'web investigation', '8167bf80e55b43258be09f6cbac7cc25', 'Mark Zuckerberg', 'Mr.', 'mark@meta.com', '1234567890', 'CEO', NULL, 'Admin', '2022-02-18 20:02:52', NULL, NULL, 'an American multinational technology conglomerate', '', '2022-02-15', 'Menlo Park, California, U.S.');

-- ----------------------------
-- Table structure for t_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_contacts_activity_relation`;
CREATE TABLE `t_contacts_activity_relation`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contactsId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contacts_activity_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_contacts_remark`;
CREATE TABLE `t_contacts_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contacts_remark
-- ----------------------------
INSERT INTO `t_contacts_remark` VALUES ('5bda27fdb3ca4b80957950dfa725c301', '2.1', 'Admin', '2022-02-18 09:21:53', NULL, NULL, '0', '1389222b2b8a43e9b308807da09f6a3c');
INSERT INTO `t_contacts_remark` VALUES ('613f1e0e7ea84ab58c3c17a68fed6c5a', '1', 'Admin', '2022-02-18 09:21:53', NULL, NULL, '0', '1389222b2b8a43e9b308807da09f6a3c');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('4ea5cec989844d7294596f3b419c2f72', '40f6cdea0bd34aceb79892a1656d9cia', 'Oracle Corporation', 'www.oracle.com', '123-456', 'Admin', '2022-02-18 10:09:21', NULL, NULL, 'hello', '2022-03-01', 'an American multinational computer technology corporation', 'Austin, Texas, United States');
INSERT INTO `t_customer` VALUES ('76522886119347cd9d24784a7cb6c5cb', '06f5fc056eac41558a964f96daa7f27c', 'Apple', 'www.apple.com', '123-456', 'Admin', '2022-02-20 12:39:42', NULL, NULL, '', '2022-02-11', 'an American multinational technology company that specializes in consumer electronics, software and online services', '1 Apple Park Way, Cupertino, California, U.S.');
INSERT INTO `t_customer` VALUES ('8167bf80e55b43258be09f6cbac7cc25', '06f5fc056eac41558a964f96daa7f27c', 'Meta Platforms, Inc.', 'www.tesla.com', '123-456', 'Admin', '2022-02-18 20:02:52', NULL, NULL, '', '2022-02-15', 'an American multinational technology conglomerate', 'Menlo Park, California, U.S.');
INSERT INTO `t_customer` VALUES ('e8fe40d4374e40fba4a7235ede1a6395', '40f6cdea0bd34aceb77492a1656d9fb3', 'Jeff', NULL, NULL, 'Admin', '2022-02-19 13:01:39', NULL, NULL, 'abc', '2022-02-28', 'abc', NULL);

-- ----------------------------
-- Table structure for t_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_remark`;
CREATE TABLE `t_customer_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_remark
-- ----------------------------

-- ----------------------------
-- Table structure for t_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_type`;
CREATE TABLE `t_dic_type`  (
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dic_type
-- ----------------------------
INSERT INTO `t_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `t_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `t_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `t_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `t_dic_type` VALUES ('source', '来源', '');
INSERT INTO `t_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `t_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for t_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_value`;
CREATE TABLE `t_dic_value`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '可以为空',
  `orderNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `typeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dic_value
-- ----------------------------
INSERT INTO `t_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', 'fake clue', 'fake clue', '4', 'clueState');
INSERT INTO `t_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', 'sales mail', 'sales mail', '8', 'source');
INSERT INTO `t_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', 'trade fairs', 'trade fairs', '11', 'source');
INSERT INTO `t_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', 'highest', 'highest', '2', 'returnPriority');
INSERT INTO `t_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', 'Prof.', 'Prof.', '5', 'appellation');
INSERT INTO `t_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', 'contact in future', 'contact in future', '2', 'clueState');
INSERT INTO `t_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', 'lost clue', 'lost clue', '5', 'clueState');
INSERT INTO `t_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', 'not yet start', 'not yet start', '1', 'returnState');
INSERT INTO `t_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07 deal', '07 deal', '7', 'stage');
INSERT INTO `t_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', 'trying to contact', 'trying to contact', '1', 'clueState');
INSERT INTO `t_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', 'Dr.', 'Dr.', '4', 'appellation');
INSERT INTO `t_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01 qualification review', '01 qualification review', '1', 'stage');
INSERT INTO `t_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08 lost clue', '08 lost clue', '8', 'stage');
INSERT INTO `t_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', 'chat', 'chat', '14', 'source');
INSERT INTO `t_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', 'low', 'low', '3', 'returnPriority');
INSERT INTO `t_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', 'advertisement', 'advertisement', '1', 'source');
INSERT INTO `t_dic_value` VALUES ('4d03a42898684135809d380597ed3268', 'partner seminar', 'partner seminar', '9', 'source');
INSERT INTO `t_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', 'Mr.', 'Mr.', '1', 'appellation');
INSERT INTO `t_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', 'high', 'high', '1', 'returnPriority');
INSERT INTO `t_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', 'Mrs.', 'Mrs.', '2', 'appellation');
INSERT INTO `t_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09 lost due to competition', '09 lost due to competition', '9', 'stage');
INSERT INTO `t_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web investigation', 'web investigation', '13', 'source');
INSERT INTO `t_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', 'Partners', 'Partners', '6', 'source');
INSERT INTO `t_dic_value` VALUES ('7c07db3146794c60bf975749952176df', 'no contact', 'no contact', '6', 'clueState');
INSERT INTO `t_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', 'internal seminar', 'internal seminar', '10', 'source');
INSERT INTO `t_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', 'in progress', 'in progress', '3', 'returnState');
INSERT INTO `t_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', 'existing business', 'existing business', '1', 'transactionType');
INSERT INTO `t_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', 'contacted', 'contacted', '3', 'clueState');
INSERT INTO `t_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', 'delay', 'delay', '2', 'returnState');
INSERT INTO `t_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', 'new business', 'new business', '2', 'transactionType');
INSERT INTO `t_dic_value` VALUES ('9ca96290352c40688de6596596565c12', 'finished', 'finished', '4', 'returnState');
INSERT INTO `t_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', 'requirements', 'requirements', '7', 'clueState');
INSERT INTO `t_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02 demand analysis', '02 demand analysis', '2', 'stage');
INSERT INTO `t_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', 'waiting for someone', 'waiting for someone', '5', 'returnState');
INSERT INTO `t_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', 'promotional call', 'promotional call', '2', 'source');
INSERT INTO `t_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', 'general', 'general', '5', 'returnPriority');
INSERT INTO `t_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05 proposal/quote', '05 proposal/quote', '5', 'stage');
INSERT INTO `t_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web download', 'web download', '12', 'source');
INSERT INTO `t_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03 value advice', '03 value advice', '3', 'stage');
INSERT INTO `t_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', 'lowest', 'lowest', '4', 'returnPriority');
INSERT INTO `t_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', 'staff introduction', 'staff introduction', '3', 'source');
INSERT INTO `t_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04 identify decision makers', '04 identify decision makers', '4', 'stage');
INSERT INTO `t_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', 'Miss.', 'Miss.', '3', 'appellation');
INSERT INTO `t_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06 negotiation/review', '06 negotiation/review', '6', 'stage');
INSERT INTO `t_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', 'online', 'online', '5', 'source');
INSERT INTO `t_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', 'public media', 'public media', '7', 'source');
INSERT INTO `t_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', 'external introduction', 'external introduction', '4', 'source');

-- ----------------------------
-- Table structure for t_tran
-- ----------------------------
DROP TABLE IF EXISTS `t_tran`;
CREATE TABLE `t_tran`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tran
-- ----------------------------
INSERT INTO `t_tran` VALUES ('1ade1047bd6f42a1b45cdf0ea9ca4916', '40f6cdea0bd34aceb77492a1656d9fb3', '1000,000,000', 'tran_1', '2022-02-28', 'e8fe40d4374e40fba4a7235ede1a6395', '05 proposal/quote', 'new business', 'web download', 'activityId', 'contactsId', 'Admin', '2022-02-19 13:01:39', 'Admin', '2022-02-20 11:35:31', 'abc', 'abc', '2022-02-28');
INSERT INTO `t_tran` VALUES ('52c1344355404ad6ac235f35ef13482e', '06f5fc056eac41558a964f96daa7f27c', '1000', 'tran_2', '2022-02-26', '8167bf80e55b43258be09f6cbac7cc25', '06 negotiation/review', 'existing business', 'web investigation', '08dbb27a8d1c4ed9b73eb5f9ecb1c33a', 'af82515e1197420b93fcfcbd04aa3caf', 'Admin', '2022-02-18 20:02:52', 'Admin', '2022-02-19 19:38:33', 'an American multinational technology conglomerate', '', '2022-02-15');
INSERT INTO `t_tran` VALUES ('8409e35d9ee04c28a87ad1c5e4c2c2d5', '06f5fc056eac41558a964f96daa7f27c', '1000,000,000', 'trade_2', '2022-02-28', '76522886119347cd9d24784a7cb6c5cb', '01 qualification review', NULL, 'web download', '0bdda68a761b40e597fe1cb84264898a', '9a0ae0fd34124c79b36dadb60f434ea5', 'Admin', '2022-02-20 12:39:42', NULL, NULL, 'an American multinational technology company that specializes in consumer electronics, software and online services', '', '2022-02-11');
INSERT INTO `t_tran` VALUES ('9711b3a146ee47d98a546a6ee95b91be', '06f5fc056eac41558a964f96daa7f27c', '1000000', 'trande 1', '2022-03-01', '8167bf80e55b43258be09f6cbac7cc25', '06 negotiation/review', NULL, 'web investigation', '08dbb27a8d1c4ed9b73eb5f9ecb1c33a', 'a3e349e105954aa89e27dd40aee7a6e9', 'Admin', '2022-02-20 12:38:33', NULL, NULL, 'an American multinational technology conglomerate', '', '2022-02-15');
INSERT INTO `t_tran` VALUES ('aea0d83102204cc3b593b61d13901a6a', '06f5fc056eac41558a964f96daa7f27c', '1000,000,000', 'trade_2', '2022-02-28', '76522886119347cd9d24784a7cb6c5cb', '02 demand analysis', NULL, 'web download', '', '500da045c1384ecfb1dfd71134c7743f', 'Admin', '2022-02-20 12:40:02', NULL, NULL, 'an American multinational technology company that specializes in consumer electronics, software and online services', '', '2022-02-11');
INSERT INTO `t_tran` VALUES ('b797d75d054f4cdbbb82faad8f20eaea', '40f6cdea0bd34aceb79892a1656d9cia', '1000,000,000', 'tran_3', '2022-02-28', '4ea5cec989844d7294596f3b419c2f72', '07 deal', 'b797d75d054f4cdbbb82faad8f20eaea', 'media', '', '24332e0261d24b918a7daf387fb98fdc', 'Admin', '2022-02-18 10:09:21', NULL, NULL, 'an American multinational computer technology corporation', 'hello', '2022-03-01');

-- ----------------------------
-- Table structure for t_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `t_tran_history`;
CREATE TABLE `t_tran_history`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tran_history
-- ----------------------------
INSERT INTO `t_tran_history` VALUES ('37c4e209bd4a401aa367b8c46d7a8a54', '04 identify decision makers', '1000,000,000', '2022-02-28', '2022-02-19 20:40:18', 'Admin', '1ade1047bd6f42a1b45cdf0ea9ca4916');
INSERT INTO `t_tran_history` VALUES ('63bc11871bf24ccab09218f708d3c479', '01 qualification review', '1000,000,000', '2022-02-28', '2022-02-19 20:40:09', 'Admin', '1ade1047bd6f42a1b45cdf0ea9ca4916');
INSERT INTO `t_tran_history` VALUES ('984b33c058b548449a25fefe66272528', '02 demand analysis', '1000,000,000', '2022-02-28', '2022-02-20 12:40:02', 'Admin', 'aea0d83102204cc3b593b61d13901a6a');
INSERT INTO `t_tran_history` VALUES ('98a3430964c04e23bd319517bd1da8af', '01 qualification review', '1000,000,000', '2022-02-28', '2022-02-20 12:39:42', 'Admin', '8409e35d9ee04c28a87ad1c5e4c2c2d5');
INSERT INTO `t_tran_history` VALUES ('ac083abeaaf64da3809bb7d5d0d794e2', '03 value advice', '1000,000,000', '2022-02-28', '2022-02-19 20:40:16', 'Admin', '1ade1047bd6f42a1b45cdf0ea9ca4916');
INSERT INTO `t_tran_history` VALUES ('baa9365c91194a72931ee1c68a887559', '02 demand analysis', '1000,000,000', '2022-02-28', '2022-02-19 20:40:14', 'Admin', '1ade1047bd6f42a1b45cdf0ea9ca4916');
INSERT INTO `t_tran_history` VALUES ('d1b05ab7a40341e78bb22829b0c8b2cb', '06 negotiation/review', '1000000', '2022-03-01', '2022-02-20 12:38:33', 'Admin', '9711b3a146ee47d98a546a6ee95b91be');
INSERT INTO `t_tran_history` VALUES ('dd643e5f2c6c46e1bb2c94eb76ef2a0e', '05 proposal/quote', '1000,000,000', '2022-02-28', '2022-02-20 11:35:31', 'Admin', '1ade1047bd6f42a1b45cdf0ea9ca4916');

-- ----------------------------
-- Table structure for t_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_tran_remark`;
CREATE TABLE `t_tran_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginAct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `loginPwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `expireTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lockState` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deptno` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `allowIps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'anna', 'Anna', '202cb962ac59075b964b07152d234b70', 'anna@google.com', '2024-03-29 00:00:00', '1', 'A001', '0:0:0:0:0:0:0:1', '2022-01-01 00:00:00', '李四', NULL, NULL);
INSERT INTO `t_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'bob', 'Bob', '202cb962ac59075b964b07152d234b70', 'bob@bob.com', '2024-03-29 00:00:00', '1', 'A001', '', '2022-01-01 00:00:00', '张三', NULL, NULL);
INSERT INTO `t_user` VALUES ('40f6cdea0bd34aceb79892a1656d9cia', 'root', 'Admin', '7b24afc8bc80e548d66c4e7ff72171c5', 'root@google.com', '2099-12-31 00:00:00', '1', 'adm', NULL, '2022-01-01 00:00:00', 'root', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
