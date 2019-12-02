/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : DS_erp

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 30/11/2019 11:36:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Client
-- ----------------------------
DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
  `Client_no` char(20) NOT NULL,
  `Client_name` char(30) NOT NULL,
  `Password` char(50) NOT NULL,
  `Client_type` char(10) NOT NULL,
  `Credit` int(255) NOT NULL DEFAULT '0',
  `Details` char(255) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Client_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Client
-- ----------------------------
BEGIN;
INSERT INTO `Client` VALUES ('000001', '425', '21', 'VIP10', 35, '2425', 0);
INSERT INTO `Client` VALUES ('000002', '虚拟用户A', '827ccb0eea8a706c4c34a16891f84e7b', 'VIP01', 20, '（该客户无详细资料介绍）', 0);
INSERT INTO `Client` VALUES ('000003', '天道酬勤', 'e10adc3949ba59abbe56e057f20f883e', 'VIP02', 5, '苍天绕过谁', 0);
INSERT INTO `Client` VALUES ('000004', '000004', 'e10adc3949ba59abbe56e057f20f883e', 'VIP10', 5, '（该客户无详细资料介绍）', 0);
INSERT INTO `Client` VALUES ('000005', '二愣子', '3c6da47dc7ac9313b1ed7f98f91700de', 'VIP01', 0, '（该客户无详细资料介绍）', 0);
INSERT INTO `Client` VALUES ('000006', 'ZERAORA', 'e10adc3949ba59abbe56e057f20f883e', 'VIP08', 50, '十万伏特', 0);
INSERT INTO `Client` VALUES ('000007', '卡噗-鸣鸣', 'e10adc3949ba59abbe56e057f20f883e', 'VIP03', 25, '电气场地', 0);
INSERT INTO `Client` VALUES ('000008', 'ztm', 'e10adc3949ba59abbe56e057f20f883e', 'VIP10', 100, '二傻子', 0);
INSERT INTO `Client` VALUES ('000009', 'zzz', 'e10adc3949ba59abbe56e057f20f883e', 'VIP10', 95, '343', 0);
COMMIT;

-- ----------------------------
-- Table structure for DS_functions
-- ----------------------------
DROP TABLE IF EXISTS `DS_functions`;
CREATE TABLE `DS_functions` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Number` varchar(50) DEFAULT NULL COMMENT '编号',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `PNumber` varchar(50) DEFAULT NULL COMMENT '上级编号',
  `URL` varchar(100) DEFAULT NULL COMMENT '链接',
  `State` bit(1) DEFAULT NULL COMMENT '收缩',
  `Sort` varchar(50) DEFAULT NULL COMMENT '排序',
  `Enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型',
  `PushBtn` varchar(50) DEFAULT NULL COMMENT '功能按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of DS_functions
-- ----------------------------
BEGIN;
INSERT INTO `DS_functions` VALUES (1, '0001', '系统管理', '0', '', b'1', '0910', b'1', '电脑版', '', 'icon-settings', '0');
INSERT INTO `DS_functions` VALUES (13, '000102', '角色管理', '0001', '/pages/manage/role.html', b'0', '0130', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (14, '000103', '用户管理', '0001', '/pages/manage/user.html', b'0', '0140', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (15, '000104', '日志管理', '0001', '/pages/manage/log.html', b'0', '0160', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (16, '000105', '部门管理', '0001', '/pages/manage/functions.html', b'0', '0135', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (21, '0101', '商品管理部', '0', '', b'0', '0620', b'1', '电脑版', NULL, 'icon-social-dropbox', '0');
INSERT INTO `DS_functions` VALUES (22, '060301', '商品购买', '0603', '/pages/materials/product_popularity.html', b'0', '0230', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (23, '010102', '商品信息', '0101', '/pages/materials/product_popularity.html', b'0', '0240', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (24, '0102', '基本资料', '0', '', b'0', '0750', b'1', '电脑版', NULL, 'icon-grid', '0');
INSERT INTO `DS_functions` VALUES (26, '010202', '客户管理', '0102', '/pages/manage/clientManage.html', b'0', '0270', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (31, '010206', '成品标准管理', '0102', '/pages/manage/product_criteriaManage.html', b'0', '0284', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (32, '0502', '原料采购部', '0', '', b'0', '0230', b'1', '电脑版', '', 'icon-loop', '0');
INSERT INTO `DS_functions` VALUES (33, '050201', '原料标准查询', '0502', '/pages/materials/raw_materials_criteria.html', b'0', '0340', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (34, '050202', '原料购买', '0502', '/pages/manage/raw_materials_warehouseManage.html', b'0', '0340', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (36, '030109', '配方查询', '0301', '/pages/materials/product_criteria.html', b'0', '0651', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (38, '0603', '销售部', '0', '', b'0', '0290', b'1', '电脑版', '', 'icon-briefcase', '0');
INSERT INTO `DS_functions` VALUES (41, '060303', '运输状态查询', '0603', '/pages/materials/export_record.html', b'0', '0394', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (44, '0704', '财务部', '0', '', b'0', '0450', b'1', '电脑版', '', 'icon-map', '0');
INSERT INTO `DS_functions` VALUES (59, '040106', '成品库存查询', '0401', '/pages/materials/product_warehouse.html', b'0', '0600', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (60, '040107', '生产进度查询', '0401', '/pages/materials/manufacture_result.html', b'0', '0600', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (195, '010205', '原料标准管理', '0102', '/pages/manage/raw_materials_criteriaManage.html', b'0', '0283', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (198, '0301', '生产车间', '0', '', b'0', '0570', b'1', '电脑版', NULL, 'icon-pie-chart', '0');
INSERT INTO `DS_functions` VALUES (200, '060305', '销售退货', '0603', '/pages/manage/refund_applicationManage.html', b'0', '0396', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (201, '040103', '生产计划制定', '0401', '/pages/manage/manufacture_designManage.html', b'0', '0403', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (204, '070404', '总订单查阅', '0704', '/pages/materials/order_form.html', b'0', '0475', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (206, '070406', '退款单', '0704', '/pages/manage/refund_applicationManage.html', b'0', '0490', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (207, '070412', '收款单', '0704', '/pages/materials/payment.html', b'0', '0610', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (209, '060304', '订单细节设置', '0603', '/pages/manage/order_detailsManage.html', b'0', '0630', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (210, '040102', '订单详情查询', '0401', '/pages/materials/order_details.html', b'0', '0405', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (211, '040104', '原料库存查询', '0401', '/pages/materials/raw_materials_warehouse.html', b'0', '0407', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (217, '01020102', '客户信息', '0102', '/pages/materials/client.html', b'0', '0262', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (220, '010103', '计量单位', '0101', '/pages/manage/unit.html', b'0', '0245', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (225, '0401', '生产计划科', '0', '', b'0', '0101', b'1', '电脑版', '', 'icon-present', '0');
INSERT INTO `DS_functions` VALUES (227, '030107', '生产进度更新', '0301', '/pages/manage/manufacture_resultManage.html', b'0', '0645', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (228, '030108', '生产计划查询', '0301', '/pages/materials/manufacture_design.html', b'0', '0650', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (235, '070408', '资金流水', '0704', '/pages/manage/paymentManage.html', b'0', '0410', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (239, '0801', '原料仓库', '0', '', b'0', '0420', b'1', '电脑版', '', 'icon-layers', '0');
INSERT INTO `DS_functions` VALUES (240, '010104', '配方管理', '0101', '/pages/manage/product_criteriaManage.html', b'0', '0246', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (242, '060302', '销售订单', '0603', '/pages/manage/order_formManage_salesman.html', b'0', '0392', b'1', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (244, '080112', '原料入库', '0801', '/pages/manage/raw_materials_warehouseManage.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (245, '080113', '过期食品详情', '0801', '/pages/materials/expired_food.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (246, '080114', '过期食品处理', '0801', '/pages/manage/expired_foodManage.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (250, '0901', '成品仓库', '0', '', b'0', '0901', b'1', '电脑版', '', 'icon-layers', '0');
INSERT INTO `DS_functions` VALUES (252, '090109', '成品入库', '0901', '/pages/manage/product_warehouseManage.html', b'0', '0902', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (253, '090113', '成品出库', '0901', '/pages/manage/export_recordManage.html', b'0', '0903', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (258, '090114', '过期食品处理', '0901', '/pages/manage/expired_foodManage.html', b'0', '0904', b'1', '电脑版', '', 'icon-notebook', '0');
COMMIT;

-- ----------------------------
-- Table structure for DS_log
-- ----------------------------
DROP TABLE IF EXISTS `DS_log`;
CREATE TABLE `DS_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userID` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) DEFAULT NULL COMMENT '操作模块名称',
  `clientIP` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) DEFAULT NULL COMMENT '操作详情',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `FKF2696AA13E226853` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6762 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of DS_log
-- ----------------------------
BEGIN;
INSERT INTO `DS_log` VALUES (1, 120, '用户', '127.0.0.1', '2019-11-18 15:49:11', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (2, 120, '用户', '127.0.0.1', '2019-11-18 16:39:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (3, 120, '用户', '127.0.0.1', '2019-11-18 16:40:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (4, 120, '用户', '127.0.0.1', '2019-11-18 16:46:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (5, 120, '用户', '127.0.0.1', '2019-11-18 16:52:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6, 120, '用户', '127.0.0.1', '2019-11-18 16:55:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7, 120, '用户', '127.0.0.1', '2019-11-26 01:34:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (8, 120, '用户', '127.0.0.1', '2019-11-26 01:35:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (9, 120, '用户', '127.0.0.1', '2019-11-26 01:42:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (10, 120, '用户', '127.0.0.1', '2019-11-26 07:13:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (11, 120, '用户', '127.0.0.1', '2019-11-26 07:40:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (12, 120, '用户', '127.0.0.1', '2019-11-26 09:57:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (13, 120, '用户', '127.0.0.1', '2019-11-26 10:06:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (14, 120, '用户', '127.0.0.1', '2019-11-26 10:19:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (15, 120, '用户', '127.0.0.1', '2019-11-26 10:21:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6576, 120, '用户', '127.0.0.1', '2019-11-27 10:14:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6577, 120, '用户', '127.0.0.1', '2019-11-27 10:20:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6578, 120, '用户', '127.0.0.1', '2019-11-27 10:22:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6579, 120, '用户', '127.0.0.1', '2019-11-27 10:30:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6580, 120, '用户', '127.0.0.1', '2019-11-27 10:39:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6581, 120, '用户', '127.0.0.1', '2019-11-27 10:41:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6582, 120, '用户', '127.0.0.1', '2019-11-27 10:43:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6583, 120, '用户', '127.0.0.1', '2019-11-27 10:44:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6584, 120, '用户', '127.0.0.1', '2019-11-27 10:46:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6585, 120, '用户', '127.0.0.1', '2019-11-27 10:49:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6586, 120, '用户', '127.0.0.1', '2019-11-27 10:50:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6587, 120, '用户', '127.0.0.1', '2019-11-27 10:51:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6588, 120, '用户', '127.0.0.1', '2019-11-27 10:53:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6589, 120, '用户', '127.0.0.1', '2019-11-27 10:58:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6590, 120, '用户', '127.0.0.1', '2019-11-27 11:00:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6591, 120, '用户', '127.0.0.1', '2019-11-27 11:01:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6592, 120, '用户', '127.0.0.1', '2019-11-27 11:04:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6593, 120, '用户', '127.0.0.1', '2019-11-27 11:06:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6594, 120, '用户', '127.0.0.1', '2019-11-27 11:14:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6595, 120, '用户', '127.0.0.1', '2019-11-27 11:17:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6596, 120, '用户', '127.0.0.1', '2019-11-27 11:19:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6597, 120, '用户', '127.0.0.1', '2019-11-27 11:28:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6598, 120, '用户', '127.0.0.1', '2019-11-27 11:56:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6599, 120, '用户', '127.0.0.1', '2019-11-27 11:58:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6600, 120, '用户', '127.0.0.1', '2019-11-27 11:59:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6601, 120, '用户', '127.0.0.1', '2019-11-27 12:01:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6602, 120, '用户', '127.0.0.1', '2019-11-27 12:05:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6603, 120, '用户', '127.0.0.1', '2019-11-27 12:15:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6604, 120, '用户', '127.0.0.1', '2019-11-27 12:21:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6605, 120, '用户', '127.0.0.1', '2019-11-27 12:36:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6606, 120, '用户', '127.0.0.1', '2019-11-27 12:38:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6607, 120, '用户', '127.0.0.1', '2019-11-27 12:43:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6608, 120, '用户', '127.0.0.1', '2019-11-27 12:59:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6609, 120, '用户', '127.0.0.1', '2019-11-27 13:11:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6610, 120, '用户', '127.0.0.1', '2019-11-27 13:13:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6611, 120, '用户', '127.0.0.1', '2019-11-27 13:29:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6612, 120, '用户', '127.0.0.1', '2019-11-27 15:52:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6613, 120, '用户', '127.0.0.1', '2019-11-27 16:00:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6614, 120, '用户', '127.0.0.1', '2019-11-27 16:24:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6615, 120, '用户', '127.0.0.1', '2019-11-28 03:02:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6616, 120, '用户', '127.0.0.1', '2019-11-28 03:04:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6617, 120, '用户', '127.0.0.1', '2019-11-28 03:05:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6618, 120, '用户', '127.0.0.1', '2019-11-28 03:06:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6619, 120, '用户', '127.0.0.1', '2019-11-28 03:08:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6620, 120, '用户', '127.0.0.1', '2019-11-28 03:09:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6621, 120, '用户', '127.0.0.1', '2019-11-28 03:28:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6622, 120, '用户', '127.0.0.1', '2019-11-28 03:39:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6623, 120, '用户', '127.0.0.1', '2019-11-28 03:44:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6624, 120, '用户', '127.0.0.1', '2019-11-28 04:00:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6625, 120, '用户', '127.0.0.1', '2019-11-28 04:12:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6626, 120, '用户', '127.0.0.1', '2019-11-28 04:13:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6627, 120, '用户', '127.0.0.1', '2019-11-28 04:16:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6628, 120, '用户', '127.0.0.1', '2019-11-28 04:19:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6629, 120, '用户', '127.0.0.1', '2019-11-28 04:20:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6630, 120, '用户', '127.0.0.1', '2019-11-28 04:21:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6631, 120, '用户', '127.0.0.1', '2019-11-28 04:21:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6632, 120, '用户', '127.0.0.1', '2019-11-28 04:25:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6633, 120, '用户', '127.0.0.1', '2019-11-28 04:29:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6634, 120, '用户', '127.0.0.1', '2019-11-28 04:30:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6635, 120, '用户', '127.0.0.1', '2019-11-28 04:32:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6636, 120, '用户', '127.0.0.1', '2019-11-28 04:35:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6637, 120, '用户', '127.0.0.1', '2019-11-28 04:37:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6638, 120, '用户', '127.0.0.1', '2019-11-28 04:38:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6639, 120, '用户', '127.0.0.1', '2019-11-28 04:42:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6640, 120, '用户', '127.0.0.1', '2019-11-28 04:51:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6641, 120, '用户', '127.0.0.1', '2019-11-28 04:59:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6642, 120, '用户', '127.0.0.1', '2019-11-28 08:39:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6643, 120, '用户', '127.0.0.1', '2019-11-28 08:43:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6644, 120, '用户', '127.0.0.1', '2019-11-28 08:44:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6645, 120, '用户', '127.0.0.1', '2019-11-28 08:46:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6646, 120, '用户', '127.0.0.1', '2019-11-28 08:50:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6647, 120, '用户', '127.0.0.1', '2019-11-28 08:52:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6648, 120, '用户', '127.0.0.1', '2019-11-28 09:12:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6649, 120, '用户', '127.0.0.1', '2019-11-28 15:09:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6650, 120, '用户', '127.0.0.1', '2019-11-28 15:22:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6651, 120, '用户', '127.0.0.1', '2019-11-28 15:25:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6652, 120, '用户', '127.0.0.1', '2019-11-28 15:26:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6653, 120, '用户', '127.0.0.1', '2019-11-28 15:27:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6654, 120, '用户', '127.0.0.1', '2019-11-28 15:29:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6655, 120, '用户', '127.0.0.1', '2019-11-28 15:32:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6656, 120, '用户', '127.0.0.1', '2019-11-28 15:34:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6657, 120, '用户', '127.0.0.1', '2019-11-28 15:41:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6658, 120, '用户', '127.0.0.1', '2019-11-28 15:44:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6659, 120, '用户', '127.0.0.1', '2019-11-28 15:46:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6660, 120, '用户', '127.0.0.1', '2019-11-28 15:47:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6661, 120, '用户', '127.0.0.1', '2019-11-28 15:49:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6662, 120, '用户', '127.0.0.1', '2019-11-28 15:50:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6663, 120, '用户', '127.0.0.1', '2019-11-28 15:53:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6664, 120, '用户', '127.0.0.1', '2019-11-28 16:00:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6665, 120, '用户', '127.0.0.1', '2019-11-28 16:01:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6666, 120, '用户', '127.0.0.1', '2019-11-28 16:06:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6667, 120, '用户', '127.0.0.1', '2019-11-28 16:07:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6668, 120, '用户', '127.0.0.1', '2019-11-28 16:12:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6669, 120, '用户', '127.0.0.1', '2019-11-28 16:17:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6670, 120, '用户', '127.0.0.1', '2019-11-28 16:19:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6671, 120, '用户', '127.0.0.1', '2019-11-28 16:20:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6672, 120, '用户', '127.0.0.1', '2019-11-29 00:31:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6673, 120, '用户', '127.0.0.1', '2019-11-28 16:33:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6674, 120, '用户', '127.0.0.1', '2019-11-28 16:35:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6675, 120, '用户', '127.0.0.1', '2019-11-28 16:36:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6676, 120, '用户', '127.0.0.1', '2019-11-28 16:46:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6677, 120, '用户', '127.0.0.1', '2019-11-28 16:48:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6678, 120, '用户', '127.0.0.1', '2019-11-28 16:52:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6679, 120, '用户', '127.0.0.1', '2019-11-28 16:53:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6680, 120, '用户', '127.0.0.1', '2019-11-28 16:54:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6681, 120, '用户', '127.0.0.1', '2019-11-28 16:57:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6682, 120, '用户', '127.0.0.1', '2019-11-28 16:58:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6683, 120, '用户', '127.0.0.1', '2019-11-28 17:00:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6684, 120, '用户', '127.0.0.1', '2019-11-28 11:07:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6685, 120, '用户', '127.0.0.1', '2019-11-28 17:08:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6686, 120, '用户', '127.0.0.1', '2019-11-28 17:08:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6687, 120, '用户', '127.0.0.1', '2019-11-28 17:09:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6688, 120, '用户', '127.0.0.1', '2019-11-29 04:49:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6689, 120, '用户', '127.0.0.1', '2019-11-29 04:49:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6690, 120, '用户', '127.0.0.1', '2019-11-29 05:09:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6691, 120, '用户', '127.0.0.1', '2019-11-29 05:13:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6692, 120, '用户', '127.0.0.1', '2019-11-29 05:17:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6693, 120, '用户', '127.0.0.1', '2019-11-29 05:19:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6694, 120, '用户', '127.0.0.1', '2019-11-29 05:20:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6695, 120, '用户', '127.0.0.1', '2019-11-29 05:26:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6696, 120, '用户', '127.0.0.1', '2019-11-29 05:36:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6697, 120, '用户', '127.0.0.1', '2019-11-29 05:38:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6698, 120, '用户', '127.0.0.1', '2019-11-29 05:42:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6699, 120, '用户', '127.0.0.1', '2019-11-29 05:43:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6700, 120, '用户', '127.0.0.1', '2019-11-29 05:48:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6701, 120, '用户', '127.0.0.1', '2019-11-29 05:50:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6702, 120, '用户', '127.0.0.1', '2019-11-29 05:50:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6703, 120, '用户', '127.0.0.1', '2019-11-29 05:51:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6704, 120, '用户', '127.0.0.1', '2019-11-29 05:52:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6705, 120, '用户', '127.0.0.1', '2019-11-29 05:53:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6706, 120, '用户', '127.0.0.1', '2019-11-29 05:55:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6707, 120, '用户', '127.0.0.1', '2019-11-29 06:04:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6708, 120, '用户', '127.0.0.1', '2019-11-29 06:05:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6709, 120, '用户', '127.0.0.1', '2019-11-29 06:06:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6710, 120, '用户', '127.0.0.1', '2019-11-29 06:10:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6711, 120, '用户', '127.0.0.1', '2019-11-29 06:10:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6712, 120, '用户', '127.0.0.1', '2019-11-29 06:28:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6713, 120, '用户', '127.0.0.1', '2019-11-29 06:33:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6714, 120, '用户', '127.0.0.1', '2019-11-29 06:42:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6715, 120, '用户', '127.0.0.1', '2019-11-29 06:45:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6716, 120, '用户', '127.0.0.1', '2019-11-29 07:03:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6717, 120, '用户', '127.0.0.1', '2019-11-29 07:22:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6718, 120, '用户', '127.0.0.1', '2019-11-29 07:23:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6719, 120, '用户', '127.0.0.1', '2019-11-29 07:24:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6720, 120, '用户', '127.0.0.1', '2019-11-29 07:32:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6721, 120, '用户', '127.0.0.1', '2019-11-29 07:36:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6722, 120, '用户', '127.0.0.1', '2019-11-29 07:37:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6723, 120, '用户', '127.0.0.1', '2019-11-29 07:43:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6724, 120, '用户', '127.0.0.1', '2019-11-29 07:46:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6725, 120, '用户', '127.0.0.1', '2019-11-29 07:47:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6726, 120, '用户', '127.0.0.1', '2019-11-29 07:52:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6727, 120, '用户', '127.0.0.1', '2019-11-29 07:56:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6728, 120, '用户', '127.0.0.1', '2019-11-29 07:57:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6729, 120, '用户', '127.0.0.1', '2019-11-29 08:00:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6730, 120, '用户', '127.0.0.1', '2019-11-29 08:04:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6731, 120, '用户', '127.0.0.1', '2019-11-29 08:05:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6732, 120, '用户', '127.0.0.1', '2019-11-29 08:06:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6733, 120, '用户', '127.0.0.1', '2019-11-29 08:09:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6734, 120, '用户', '127.0.0.1', '2019-11-29 02:13:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6735, 120, '用户', '127.0.0.1', '2019-11-29 16:16:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6736, 120, '用户', '127.0.0.1', '2019-11-29 16:20:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6737, 120, '用户', '127.0.0.1', '2019-11-29 16:21:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6738, 120, '用户', '127.0.0.1', '2019-11-29 16:26:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6739, 120, '用户', '127.0.0.1', '2019-11-29 16:28:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6740, 120, '用户', '127.0.0.1', '2019-11-29 23:50:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6741, 120, '用户', '127.0.0.1', '2019-11-29 23:52:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6742, 120, '用户', '127.0.0.1', '2019-11-29 23:53:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6743, 120, '用户', '127.0.0.1', '2019-11-29 23:58:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6744, 120, '用户', '127.0.0.1', '2019-11-29 23:59:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6745, 120, '用户', '127.0.0.1', '2019-11-30 00:00:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6746, 120, '用户', '127.0.0.1', '2019-11-30 00:02:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6747, 120, '用户', '127.0.0.1', '2019-11-30 00:03:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6748, 120, '用户', '127.0.0.1', '2019-11-30 00:10:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6749, 120, '用户', '127.0.0.1', '2019-11-30 00:15:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6750, 120, '用户', '127.0.0.1', '2019-11-30 00:22:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6751, 120, '用户', '127.0.0.1', '2019-11-30 00:23:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6752, 120, '用户', '127.0.0.1', '2019-11-30 00:30:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6753, 120, '用户', '127.0.0.1', '2019-11-30 00:41:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6754, 120, '用户', '127.0.0.1', '2019-11-30 00:44:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6755, 120, '用户', '127.0.0.1', '2019-11-30 00:47:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6756, 120, '用户', '127.0.0.1', '2019-11-30 00:48:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6757, 120, '用户', '127.0.0.1', '2019-11-30 00:50:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6758, 120, '用户', '127.0.0.1', '2019-11-30 00:51:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6759, 120, '用户', '127.0.0.1', '2019-11-30 01:05:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6760, 120, '用户', '127.0.0.1', '2019-11-30 11:29:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6761, 120, '用户', '127.0.0.1', '2019-11-30 11:31:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
COMMIT;

-- ----------------------------
-- Table structure for DS_role
-- ----------------------------
DROP TABLE IF EXISTS `DS_role`;
CREATE TABLE `DS_role` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of DS_role
-- ----------------------------
BEGIN;
INSERT INTO `DS_role` VALUES (4, '管理员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (5, '仓管员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (10, '租户', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (12, '角色123', NULL, NULL, NULL, 117, '0');
INSERT INTO `DS_role` VALUES (13, '角色test', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (14, '44444', NULL, NULL, NULL, NULL, '1');
INSERT INTO `DS_role` VALUES (15, 'laoba角色', NULL, NULL, NULL, 115, '0');
INSERT INTO `DS_role` VALUES (16, '测试角色123', NULL, NULL, NULL, 63, '0');
COMMIT;

-- ----------------------------
-- Table structure for DS_tenant
-- ----------------------------
DROP TABLE IF EXISTS `DS_tenant`;
CREATE TABLE `DS_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `user_num_limit` int(11) DEFAULT NULL COMMENT '用户数量限制',
  `bills_num_limit` int(11) DEFAULT NULL COMMENT '单据数量限制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='租户';

-- ----------------------------
-- Records of DS_tenant
-- ----------------------------
BEGIN;
INSERT INTO `DS_tenant` VALUES (13, 63, 'jsh', 20, 2000, NULL);
INSERT INTO `DS_tenant` VALUES (14, 113, 'abc123', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (15, 115, 'jzh', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (16, 123, 'caoyuli', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (17, 124, 'jchb', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (18, 126, '123123', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (19, 127, '2345123', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (20, 128, 'q12341243', 2, 200, NULL);
INSERT INTO `DS_tenant` VALUES (21, 130, 'jsh666', 2, 200, NULL);
COMMIT;

-- ----------------------------
-- Table structure for DS_userbusiness
-- ----------------------------
DROP TABLE IF EXISTS `DS_userbusiness`;
CREATE TABLE `DS_userbusiness` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类别',
  `KeyId` varchar(50) DEFAULT NULL COMMENT '主ID',
  `Value` varchar(10000) DEFAULT NULL COMMENT '值',
  `BtnStr` varchar(2000) DEFAULT NULL COMMENT '按钮权限',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';

-- ----------------------------
-- Records of DS_userbusiness
-- ----------------------------
BEGIN;
INSERT INTO `DS_userbusiness` VALUES (5, 'RoleFunctions', '4', '[1][13][14][15][16][21][22][23][24][25][26][31][32][33][34][36][38][41][44][59][60][195][198][200][201][202][204][206][207][209][210][211][217][220][225][226][227][228][229][232][235][239][240][242][244][245][246][250][252][253][258]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `DS_userbusiness` VALUES (6, 'RoleFunctions', '5', '[22][23][25][26][194][195][31][33][200][201][41][199][202]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (7, 'RoleFunctions', '6', '[22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]', '[{\"funId\":\"33\",\"btnStr\":\"4\"}]', '0');
INSERT INTO `DS_userbusiness` VALUES (9, 'RoleFunctions', '7', '[168][13][12][16][14][15][189][18][19][132]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (10, 'RoleFunctions', '8', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (11, 'RoleFunctions', '9', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (12, 'UserRole', '1', '[5]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (13, 'UserRole', '2', '[6][7]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (14, 'UserDepot', '2', '[1][2][6][7]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (15, 'UserDepot', '1', '[1][2][5][6][7][10][12][14][15][17]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (16, 'UserRole', '63', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (18, 'UserDepot', '63', '[14][15]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (19, 'UserDepot', '5', '[6][45][46][50]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (20, 'UserRole', '5', '[5]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (21, 'UserRole', '64', '[13]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (22, 'UserDepot', '64', '[1]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (23, 'UserRole', '65', '[5]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (24, 'UserDepot', '65', '[1]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (25, 'UserCustomer', '64', '[5][2]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (26, 'UserCustomer', '65', '[6]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (27, 'UserCustomer', '63', '[58]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (28, 'UserDepot', '96', '[7]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (29, 'UserRole', '96', '[6]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (30, 'UserRole', '113', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (32, 'RoleFunctions', '10', '[245][13][243][14][15][234][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `DS_userbusiness` VALUES (34, 'UserRole', '115', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (35, 'UserRole', '117', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (36, 'UserDepot', '117', '[8][9]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (37, 'UserCustomer', '117', '[52]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (38, 'UserRole', '120', '[4]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (39, 'UserDepot', '120', '[7][8][9][10][11][12][2][1][3]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (40, 'UserCustomer', '120', '[52][48][6][5][2]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (41, 'RoleFunctions', '12', '', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (48, 'RoleFunctions', '13', '[59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (51, 'UserRole', '74', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (52, 'UserDepot', '121', '[13]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (54, 'UserDepot', '115', '[13]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (56, 'UserCustomer', '115', '[56]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (57, 'UserCustomer', '121', '[56]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (58, 'UserRole', '121', '[15]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (59, 'UserRole', '123', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (60, 'UserRole', '124', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (61, 'UserRole', '125', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (62, 'UserRole', '126', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (63, 'UserRole', '127', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (64, 'UserRole', '128', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (65, 'UserRole', '129', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (66, 'UserRole', '130', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (67, 'UserRole', '132', '[10]', NULL, '0');
INSERT INTO `DS_userbusiness` VALUES (68, 'UserRole', '133', '[10]', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for Expired_Food
-- ----------------------------
DROP TABLE IF EXISTS `Expired_Food`;
CREATE TABLE `Expired_Food` (
  `Food_no` char(20) NOT NULL,
  `Food_type` char(8) NOT NULL COMMENT '原料还是成品',
  `Food_name` char(100) NOT NULL,
  `Expired_date` datetime DEFAULT NULL COMMENT '过期时间',
  `Loss_num` char(20) NOT NULL COMMENT '损失的数目+单位',
  `Loss_money` int(255) NOT NULL DEFAULT '0',
  `Processing_method` char(255) NOT NULL COMMENT '处理方式（地点或者碾碎之类的）',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Food_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Expired_Food
-- ----------------------------
BEGIN;
INSERT INTO `Expired_Food` VALUES ('0000000001', '成品', '巧克力', '2019-10-02 17:28:59', '300--车', 10, '', 0);
INSERT INTO `Expired_Food` VALUES ('0000000002', '成品', '小面包', '2019-11-20 17:29:37', '3000--公斤', 1800000, '焚烧', 0);
INSERT INTO `Expired_Food` VALUES ('0000000003', '成品', '小面包', '2019-11-20 17:30:41', '3000--公斤', 1800000, '焚烧', 0);
INSERT INTO `Expired_Food` VALUES ('0000000004', '成品', '小面包', '2019-11-20 17:42:06', '3000--公斤', 1800000, '焚烧', 1);
INSERT INTO `Expired_Food` VALUES ('0000000005', '成品', '小面包', '2019-11-20 17:43:34', '3000--公斤', 1800000, '焚烧', 0);
INSERT INTO `Expired_Food` VALUES ('0000000006', '成品', '小面包', '2019-11-20 17:53:31', '3000--公斤', 1800000, '焚烧', 0);
COMMIT;

-- ----------------------------
-- Table structure for Export_Record
-- ----------------------------
DROP TABLE IF EXISTS `Export_Record`;
CREATE TABLE `Export_Record` (
  `Export_no` char(50) NOT NULL,
  `Staff_no` char(20) NOT NULL COMMENT '发货负责人',
  `Order_no_details` char(255) NOT NULL COMMENT '货物，运输量',
  `Source_place` char(255) NOT NULL,
  `Target_place` char(255) NOT NULL,
  `Delivery_date` datetime DEFAULT NULL,
  `Transport_link` char(255) NOT NULL COMMENT '物流信息',
  `Progress` char(30) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Export_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Export_Record
-- ----------------------------
BEGIN;
INSERT INTO `Export_Record` VALUES ('0000000001', '000001', '00000008-00', '大山食品厂', 'Java实训集中营', '2019-11-20 20:14:11', '东风快递', '进行中。。。', 0);
INSERT INTO `Export_Record` VALUES ('0000000002', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:37:22', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000003', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:41:58', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000004', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:46:59', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000005', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:46:35', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000006', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:49:07', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000007', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:55:53', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000008', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 00:19:39', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000009', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 10:03:05', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000010', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:25:51', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000011', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:30:13', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000012', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:33:20', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000013', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 18:33:55', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000014', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 08:58:38', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000015', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 09:03:56', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000016', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 00:19:55', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000017', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 00:21:48', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000018', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 00:22:30', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000019', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 00:25:38', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000020', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 00:53:03', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000021', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 00:56:40', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000022', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 01:01:41', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000023', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 01:03:04', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000024', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 01:19:09', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000025', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 21:09:08', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000026', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 21:32:55', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000027', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 21:35:08', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000028', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 21:36:48', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000029', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 21:37:53', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000030', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 09:38:00', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000031', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 09:46:18', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000032', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 09:56:04', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000033', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 09:58:34', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000034', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-22 10:03:03', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000035', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 12:27:47', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000036', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 12:38:48', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000037', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 12:38:53', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000038', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 13:09:41', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000039', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 13:12:01', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000040', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 13:13:19', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000041', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 13:16:05', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000042', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 02:12:28', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000043', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 02:15:54', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000044', '', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 02:19:43', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
COMMIT;

-- ----------------------------
-- Table structure for Manufacture_Design
-- ----------------------------
DROP TABLE IF EXISTS `Manufacture_Design`;
CREATE TABLE `Manufacture_Design` (
  `Manufacture_no` char(40) NOT NULL,
  `Order_no_details` char(255) NOT NULL,
  `Staff_no_design` char(20) NOT NULL,
  `Product_no` char(20) NOT NULL,
  `Deadline` datetime DEFAULT NULL,
  `Progress` char(100) NOT NULL,
  `Workshop` char(50) NOT NULL,
  `Raw_materials_requirement` char(255) NOT NULL,
  `Products_requirement` char(255) NOT NULL,
  `Details` char(255) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Manufacture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Manufacture_Design
-- ----------------------------
BEGIN;
INSERT INTO `Manufacture_Design` VALUES ('0000000001', '0000001-01', '', '', '2019-11-21 12:38:06', '', '', '', '', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000002', '0000001-01', '000002', '0001', '2020-02-22 00:56:40', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '第一个订单', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000003', '', '000002', '0001', '2020-02-22 01:01:42', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000004', '', '000002', '0001', '2020-02-22 01:03:04', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000005', '', '000002', '0001', '2020-02-22 01:19:09', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000006', '', '000002', '0001', '2020-02-22 09:38:00', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000007', '', '000002', '0001', '2020-02-22 09:46:18', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000008', '', '000002', '0001', '2020-02-22 09:56:04', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000009', '', '000002', '0001', '2020-02-22 09:58:34', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000010', '', '000002', '0001', '2020-02-22 10:03:04', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000011', '', '000002', '0001', '2020-02-23 02:12:28', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000012', '', '000002', '0001', '2020-02-23 02:15:54', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
INSERT INTO `Manufacture_Design` VALUES ('0000000013', '', '000002', '0001', '2020-02-23 02:19:43', '生产计划商论阶段', '车间A', '原料所需：00001（30%，4000--公斤）；00002（40%，6000000--毫升）；00005（30%，30000--袋）', '2000--公斤', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for Manufacture_Result
-- ----------------------------
DROP TABLE IF EXISTS `Manufacture_Result`;
CREATE TABLE `Manufacture_Result` (
  `Manufacture_no` char(40) NOT NULL,
  `Order_no_details` char(255) NOT NULL,
  `Product_no` char(20) NOT NULL,
  `Staff_no_design` char(20) NOT NULL,
  `Staff_no_manufacture` char(255) NOT NULL,
  `Stock_no` char(20) NOT NULL,
  `Update_date` datetime DEFAULT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Manufacture_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Manufacture_Result
-- ----------------------------
BEGIN;
INSERT INTO `Manufacture_Result` VALUES ('0000000001', '', '', '', '', '23', '2019-11-16 12:45:57', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000002', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 00:56:40', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000003', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 01:01:42', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000004', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 01:03:04', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000005', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 01:19:09', 1);
INSERT INTO `Manufacture_Result` VALUES ('0000000006', '00000011-00', '0001', '000002', '000003;000004', '23', '2019-11-22 09:38:00', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000007', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 09:46:18', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000008', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 09:56:04', 1);
INSERT INTO `Manufacture_Result` VALUES ('0000000009', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 09:58:34', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000010', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 10:03:04', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000011', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-23 02:12:28', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000012', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-23 02:15:54', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000013', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-23 02:19:43', 0);
COMMIT;

-- ----------------------------
-- Table structure for Order_Details
-- ----------------------------
DROP TABLE IF EXISTS `Order_Details`;
CREATE TABLE `Order_Details` (
  `Order_no_details` char(50) NOT NULL,
  `Product_no` char(20) NOT NULL,
  `Products_requirement` char(50) NOT NULL,
  `Client_no` char(20) NOT NULL,
  `Delivery_date` datetime DEFAULT NULL COMMENT '预计发货日期',
  `Payment_deadline` datetime DEFAULT NULL COMMENT '尾款截止期限   数字+单位',
  `Check` int(255) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Order_no_details`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order_Details
-- ----------------------------
BEGIN;
INSERT INTO `Order_Details` VALUES ('00000001-01', '0002', '5000--公斤', '000001', '2019-10-12 23:47:38', NULL, 0, 0);
INSERT INTO `Order_Details` VALUES ('00000002-01', '0002', '2000--箱', '000002', '2019-11-24 02:19:42', '2019-12-23 02:19:42', 1, 0);
INSERT INTO `Order_Details` VALUES ('00000002-02', '0001', '6000--箱', '000002', '2019-11-19 15:49:11', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000003-00', '0001', '2000--公斤', '000001', '2020-02-19 15:49:11', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000003-01', '0002', '500--车', '000001', '2019-11-24 15:49:11', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000004-00', '0001', '2000--公斤', '000001', '2020-02-19 16:39:35', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000004-01', '0002', '500--车', '000001', '2019-11-24 16:39:35', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000005-00', '0001', '2000--公斤', '000001', '2020-02-19 16:40:46', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000005-01', '0002', '500--车', '000001', '2019-11-24 16:40:46', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000006-00', '0001', '2000--公斤', '000001', '2020-02-19 16:46:03', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000006-01', '0002', '500--车', '000001', '2019-11-24 16:46:03', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000007-00', '0001', '2000--公斤', '000001', '2020-02-19 16:52:26', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000007-01', '0002', '500--车', '000001', '2019-11-24 16:52:26', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000008-00', '0001', '2000--公斤', '000001', '2020-02-19 16:55:16', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000008-01', '0002', '500--车', '000001', '2019-11-23 02:19:43', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000009-00', '0001', '2000--公斤', '000001', '2020-02-19 17:03:06', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000009-01', '0002', '500--车', '000001', '2019-11-24 17:03:06', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000010-00', '0001', '2000--公斤', '000001', '2020-02-19 17:16:09', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000010-01', '0002', '500--车', '000001', '2019-11-24 17:16:09', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000011-00', '0001', '2000--公斤', '000001', '2020-02-24 02:19:43', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000011-01', '0002', '500--车', '000001', '2019-11-24 17:41:53', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000012-00', '0001', '2000--公斤', '000001', '2020-02-19 17:50:45', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000012-01', '0002', '500--车', '000001', '2019-11-24 17:50:45', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000013-00', '0001', '2000--公斤', '000001', '2020-02-19 17:55:22', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000013-01', '0002', '500--车', '000001', '2019-11-24 17:55:22', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000014-00', '0001', '2000--公斤', '000001', '2020-02-19 20:13:10', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000014-01', '0002', '500--车', '000001', '2019-11-24 20:13:10', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000015-00', '0001', '2000--公斤', '000001', '2020-02-19 20:24:41', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000015-01', '0002', '500--车', '000001', '2019-11-24 20:24:41', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000016-00', '0001', '2000--公斤', '000001', '2020-02-19 20:56:23', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000016-01', '0002', '500--车', '000001', '2019-11-24 20:56:23', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000017-00', '0001', '2000--公斤', '000001', '2020-02-19 20:57:44', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000017-01', '0002', '500--车', '000001', '2019-11-24 20:57:44', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000018-00', '0001', '2000--公斤', '000001', '2020-02-19 20:59:36', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000018-01', '0002', '500--车', '000001', '2019-11-24 20:59:36', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000019-00', '0001', '2000--公斤', '000001', '2020-02-19 21:03:42', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000019-01', '0002', '500--车', '000001', '2019-11-24 21:03:42', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000020-01', '0002', '222--公斤', '000001', '2019-12-05 07:52:29', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000020-02', '0001', '333--公斤', '000001', '2020-02-29 07:52:29', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000021-02', '0001', '564--公斤', '000001', '2020-02-29 07:56:59', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000022-01', '0001', '33--公斤', '000001', '2020-02-29 07:57:48', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000022-02', '0002', '675745--公斤', '000001', '2019-12-05 07:57:48', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000023-01', '0001', '45--公斤', '000001', '2020-02-29 08:10:12', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000023-02', '0002', '44--公斤', '000001', '2019-12-05 08:10:12', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000024-01', '0001', '23--公斤', '000001', '2020-02-29 02:14:01', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000024-02', '0002', '444--公斤', '000001', '2019-12-05 02:14:01', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000025-01', '0001', '34--公斤', '000001', '2020-02-29 16:22:03', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000026-01', '0002', '342--公斤', '000001', '2019-12-05 16:26:23', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000027-01', '0001', '43--箱', '000001', '2020-02-29 16:26:50', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000028-01', '0002', '33--个', '000001', '2019-12-05 16:28:22', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000029-01', '0001', '999--克', '000001', '2020-02-29 16:28:31', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000030-01', '0001', '545--车', '000001', '2020-02-29 16:28:43', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000030-02', '0002', '86--克', '000001', '2019-12-05 16:28:43', NULL, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for Order_Form
-- ----------------------------
DROP TABLE IF EXISTS `Order_Form`;
CREATE TABLE `Order_Form` (
  `Order_no` char(40) NOT NULL,
  `Client_no` char(20) NOT NULL,
  `Staff_no` char(20) NOT NULL,
  `Order_Create_date` datetime DEFAULT NULL,
  `Order_sum_amount` int(255) NOT NULL DEFAULT '0',
  `Progress` char(40) NOT NULL,
  `Liquidated_damages` int(255) NOT NULL DEFAULT '0' COMMENT '违约金',
  `Check` int(255) NOT NULL DEFAULT '0',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order_Form
-- ----------------------------
BEGIN;
INSERT INTO `Order_Form` VALUES ('00000001', '000001', '000001', '2019-11-16 16:19:12', 900, '尾款全部缴清，未违约', 100, 0, 0);
INSERT INTO `Order_Form` VALUES ('00000002', '000002', '000003', '2019-11-23 02:19:42', 0, '进行中。。。', 0, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000003', '000001', '000002', '2019-11-18 15:49:11', 1450000, '尾款逾期，违约金及定金差3000元', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000004', '000001', '', '2019-11-18 16:39:35', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000005', '000001', '', '2019-11-18 16:40:46', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000006', '000001', '', '2019-11-18 16:46:03', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000007', '000001', '', '2019-11-18 16:52:26', 1450000, '尾款全部缴清，未违约', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000008', '000001', '', '2019-11-18 16:55:16', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000009', '000001', '', '2019-11-18 17:03:06', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000010', '000001', '', '2019-11-18 17:16:09', 1450000, '当前支付9000元，共计1次支付记录', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000011', '000001', '', '2019-11-18 17:41:53', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000012', '000001', '', '2019-11-18 17:50:45', 1450000, '正在生产计划与讨论。。。', 145000, 1, 1);
INSERT INTO `Order_Form` VALUES ('00000013', '000001', '', '2019-11-18 17:55:22', 1450000, '当前支付78800元，共计3次支付记录', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000014', '000001', '', '2019-11-18 20:13:10', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000015', '000001', '', '2019-11-18 20:24:41', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000016', '000001', '', '2019-11-18 20:56:23', 1450000, '当前支付300元，共计2次支付记录', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000017', '000001', '', '2019-11-18 20:57:44', 1450000, '正在生产计划与讨论。。。', 145000, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000018', '000001', '', '2019-11-18 20:59:36', 1450000, '尾款全部缴清，未违约', 145000, 0, 1);
INSERT INTO `Order_Form` VALUES ('00000019', '000001', '', '2019-11-18 21:03:42', 1450000, '正在生产计划与讨论。。。', 145000, 1, 1);
INSERT INTO `Order_Form` VALUES ('00000020', '000001', '', '2019-11-29 07:52:29', 310800, '正在生产计划与讨论。。。', 31080, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000021', '000001', '', '2019-11-29 07:56:59', 3715400, '当前支付7862元，共计1次支付记录', 371540, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000022', '000001', '', '2019-11-29 07:57:48', 337892300, '正在生产计划与讨论。。。', 33789230, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000023', '000001', '', '2019-11-29 08:10:12', 49000, '正在生产计划与讨论。。。', 4900, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000024', '000001', '', '2019-11-29 02:14:01', 235800, '正在生产计划与讨论。。。', 23580, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000025', '000001', '', '2019-11-29 16:22:03', 20400, '当前支付300元，共计2次支付记录', 2040, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000026', '000001', '', '2019-11-29 16:26:23', 171000, '正在生产计划与讨论。。。', 17100, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000027', '000001', '', '2019-11-29 16:26:50', 25800, '审核通过', 2580, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000028', '000001', '', '2019-11-29 16:28:22', 16500, '正在生产计划与讨论。。。', 1650, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000029', '000001', '', '2019-11-29 16:28:31', 599400, '当前支付300元，共计2次支付记录', 59940, 1, 0);
INSERT INTO `Order_Form` VALUES ('00000030', '000001', '', '2019-11-29 16:28:43', 370000, '当前未有支付记录', 37000, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for Payment
-- ----------------------------
DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `Payment_no` char(50) NOT NULL,
  `Order_no` char(40) NOT NULL,
  `Staff_no_accountant` char(20) NOT NULL,
  `Money` int(255) NOT NULL DEFAULT '0',
  `Details` char(255) NOT NULL COMMENT '尾款，预约款，贷款，赔款等',
  `Payment_date` datetime DEFAULT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Payment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Payment
-- ----------------------------
BEGIN;
INSERT INTO `Payment` VALUES ('0000000001', '00000001', '000001', 900, '尾款', '2019-11-21 11:36:11', 0);
COMMIT;

-- ----------------------------
-- Table structure for Product_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Product_Criteria`;
CREATE TABLE `Product_Criteria` (
  `Product_no` char(20) NOT NULL,
  `Product_name` char(50) NOT NULL,
  `Product_type` char(20) NOT NULL,
  `Ingredient_List` char(255) NOT NULL,
  `Manufacture_duration` char(20) NOT NULL COMMENT '数字+单位',
  `Guarantee_period` char(20) NOT NULL COMMENT '数字+单位',
  `Unit_Price` int(255) NOT NULL DEFAULT '0',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Product_Criteria
-- ----------------------------
BEGIN;
INSERT INTO `Product_Criteria` VALUES ('0001', '小面包', '焙烤食品', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '3--月', '12--月', 600, 0);
INSERT INTO `Product_Criteria` VALUES ('0002', '巧克力', '可可制品、巧克力和巧克力制品、以及糖果', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '5--天', '3--年', 500, 0);
COMMIT;

-- ----------------------------
-- Table structure for Product_Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Product_Warehouse`;
CREATE TABLE `Product_Warehouse` (
  `Stock_no` char(40) NOT NULL,
  `Product_no` char(20) NOT NULL,
  `Staff_no_storage` char(20) NOT NULL COMMENT '成品负责人编号',
  `Staff_no_workshop` char(20) NOT NULL COMMENT '车间负责人编号',
  `Storage_address` char(255) NOT NULL,
  `Manufacture_date` datetime DEFAULT NULL,
  `Stock_num` char(20) NOT NULL COMMENT '数字+单位',
  `Details` char(255) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Stock_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Product_Warehouse
-- ----------------------------
BEGIN;
INSERT INTO `Product_Warehouse` VALUES ('00000001', '0001', '000002', '000003', '第一仓库', '2019-11-21 10:27:00', '300--千克', '', 1);
INSERT INTO `Product_Warehouse` VALUES ('00000002', '0001', '000002', '000003', '第一仓库', '2019-11-01 10:27:00', '300--千克', '', 1);
INSERT INTO `Product_Warehouse` VALUES ('00000003', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 11:30:13', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000004', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 11:33:21', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000005', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 18:33:55', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000006', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 08:58:38', '500--升', '', 1);
INSERT INTO `Product_Warehouse` VALUES ('00000007', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 09:03:56', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000008', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 00:19:56', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000009', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 00:21:48', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000010', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 00:22:30', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000011', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 00:25:38', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000012', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 00:53:03', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000013', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 00:56:40', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000014', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 01:01:42', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000015', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 01:03:04', '500--升', '', 1);
INSERT INTO `Product_Warehouse` VALUES ('00000016', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 01:19:09', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000017', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 21:09:08', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000018', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 21:32:56', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000019', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 21:35:08', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000020', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 21:36:49', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000021', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 21:37:53', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000022', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 09:38:00', '500--升', '', 1);
INSERT INTO `Product_Warehouse` VALUES ('00000023', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 09:46:18', '500--升', '', 1);
INSERT INTO `Product_Warehouse` VALUES ('00000024', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 09:56:04', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000025', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 09:58:34', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000026', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-22 10:03:04', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000027', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 12:27:47', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000028', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 12:38:48', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000029', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 12:38:53', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000030', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 13:09:42', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000031', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 13:12:02', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000032', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 13:13:19', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000033', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 13:16:06', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000034', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 02:12:28', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000035', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 02:15:54', '500--升', '', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000036', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-23 02:19:43', '500--升', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for Raw_Materials_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Raw_Materials_Criteria`;
CREATE TABLE `Raw_Materials_Criteria` (
  `Material_no` char(40) NOT NULL,
  `Material_name` char(100) NOT NULL,
  `Material_type` char(30) NOT NULL,
  `Guarantee_period` char(20) NOT NULL COMMENT '数字+单位',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Material_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Raw_Materials_Criteria
-- ----------------------------
BEGIN;
INSERT INTO `Raw_Materials_Criteria` VALUES ('0001', '面粉', '谷物类', '3--年', 0);
COMMIT;

-- ----------------------------
-- Table structure for Raw_Materials_Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Raw_Materials_Warehouse`;
CREATE TABLE `Raw_Materials_Warehouse` (
  `Stock_no` char(40) NOT NULL,
  `Material_no` char(20) NOT NULL,
  `Staff_no_storage` char(20) NOT NULL,
  `Storage_address` char(255) NOT NULL,
  `Product_date` datetime DEFAULT NULL,
  `Stock_num` char(20) NOT NULL COMMENT '数字+单位',
  `Details` char(255) NOT NULL COMMENT 's',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Stock_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Raw_Materials_Warehouse
-- ----------------------------
BEGIN;
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000001', '0002', '000001', '巨魔蘸酱', '2019-11-09 11:32:46', '334--百瓶', '奥利给', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000002', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 11:33:21', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000003', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 18:33:55', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000004', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 08:58:38', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000005', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 09:03:56', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000006', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 00:19:56', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000007', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 00:21:48', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000008', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 00:22:30', '500--升', '', 1);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000009', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 00:25:38', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000010', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 00:53:03', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000011', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 00:56:40', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000012', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 01:01:42', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000013', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 01:03:04', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000014', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 01:19:09', '500--升', '', 1);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000015', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 21:09:08', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000016', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 21:32:56', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000017', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 21:35:08', '500--升', '', 1);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000018', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 21:36:49', '500--升', '', 1);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000019', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 21:37:53', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000020', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 09:38:00', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000021', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 09:46:18', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000022', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 09:56:04', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000023', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 09:58:34', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000024', '0001', '', '大山食品厂----10086号厂房', '2019-11-22 10:03:04', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000025', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 12:27:47', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000026', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 12:38:48', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000027', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 12:38:53', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000028', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 13:09:42', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000029', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 13:12:02', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000030', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 13:13:19', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000031', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 13:16:06', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000032', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 02:12:28', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000033', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 02:15:54', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000034', '0001', '', '大山食品厂----10086号厂房', '2019-11-23 02:19:43', '500--升', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for Refund_Application
-- ----------------------------
DROP TABLE IF EXISTS `Refund_Application`;
CREATE TABLE `Refund_Application` (
  `Refund_no` char(40) NOT NULL,
  `Order_no` char(40) NOT NULL,
  `Client_no` char(20) NOT NULL,
  `Reason` char(255) NOT NULL COMMENT '不合格成品+详情',
  `Staff_no_checker` char(20) NOT NULL,
  `Progress` char(20) NOT NULL,
  `Permission` int(255) NOT NULL DEFAULT '0',
  `Refund_Payment` int(255) NOT NULL DEFAULT '0',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Refund_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Refund_Application
-- ----------------------------
BEGIN;
INSERT INTO `Refund_Application` VALUES ('00000001', '00000001', '000003', '产品质量问题', '000002', '提交成功', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for Staff
-- ----------------------------
DROP TABLE IF EXISTS `Staff`;
CREATE TABLE `Staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如张三',
  `loginame` varchar(255) DEFAULT NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `position` varchar(200) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `ismanager` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统自带数据 ',
  `Status` tinyint(4) DEFAULT '0' COMMENT '状态，0：正常，1：删除，2封禁',
  `description` varchar(500) DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `flag` int(4) DEFAULT '0' COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of Staff
-- ----------------------------
BEGIN;
INSERT INTO `Staff` VALUES (63, 'ztm', 'ztm', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 1, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (64, '张三', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (65, '李四', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (67, 'fas666', 'asd555', NULL, 'asdf333', NULL, '11111@qq.com', '222222', 1, 0, 0, 'sdf0000', NULL, 0);
INSERT INTO `Staff` VALUES (74, '21312sfdfsdf', '1231234', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (84, '123123', 'jsh123', NULL, '3123', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (86, '2333', 'sdf111aaa', NULL, '3232', NULL, '', '32323', 1, 0, 0, '33232', NULL, 0);
INSERT INTO `Staff` VALUES (87, '122123132', 'sdfasd1', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (90, '232343', '233', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (91, 'jsh1231', 'jsh1231', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (92, '213123', 'aaaa', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 0);
INSERT INTO `Staff` VALUES (93, '111', 'ffff', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 0);
INSERT INTO `Staff` VALUES (94, 'sdfsdf', 'fsdfsdsd', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 0);
INSERT INTO `Staff` VALUES (95, '4444444', '4444', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (96, 'lili', 'lili', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (113, 'yuyu123', 'yuyu123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (115, 'laoba123', 'laoba123', 'e10adc3949ba59abbe56e057f20f883e', '33333', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (116, 'gggg123', 'gggg123', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 0);
INSERT INTO `Staff` VALUES (120, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (121, 'hhhh', 'hhhh', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (122, 'admin1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 0);
INSERT INTO `Staff` VALUES (123, 'caoyuli', 'caoyuli', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (124, 'jchb', 'jchb', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (126, '123123', '123123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (127, '2345123', '2345123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (128, 'q12341243', 'q12341243', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (130, 'jsh666', 'jsh666', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (131, 'hahaha', NULL, '654321', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (132, 'hahaha', 'hahaha', '123456', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `Staff` VALUES (133, 'cnmb', 'cnmb', '35a903b377414e8da7954ed1a8da490c', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- View structure for popularity_products
-- ----------------------------
DROP VIEW IF EXISTS `popularity_products`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `popularity_products` AS select `order_details`.`Product_no` AS `Product_no`,count(`order_details`.`Product_no`) AS `count(Order_Details.Product_no)` from `order_details` group by `order_details`.`Product_no` order by count(`order_details`.`Product_no`) desc;

SET FOREIGN_KEY_CHECKS = 1;
