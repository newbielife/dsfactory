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

 Date: 05/07/2020 10:44:00
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
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of DS_functions
-- ----------------------------
BEGIN;
INSERT INTO `DS_functions` VALUES (1, '0001', '系统管理', '0', '', b'1', '0009', b'1', '电脑版', '', 'icon-settings', '0');
INSERT INTO `DS_functions` VALUES (13, '000102', '角色管理', '0001', '/pages/manage/role.html', b'0', '0130', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (14, '000103', '用户管理', '0001', '/pages/manage/user.html', b'0', '0140', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (15, '000104', '日志管理', '0001', '/pages/manage/log.html', b'0', '0160', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (16, '000105', '功能管理', '0001', '/pages/manage/functions.html', b'0', '0135', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (21, '0101', '商品管理部', '0', '', b'0', '0008', b'1', '电脑版', NULL, 'icon-social-dropbox', '0');
INSERT INTO `DS_functions` VALUES (22, '060301', '商品购买', '0603', '/pages/materials/product_purchase.html', b'0', '0230', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (23, '010102', '商品信息', '0101', '/pages/materials/product_popularity.html', b'0', '0240', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (24, '0102', '基本资料', '0', '', b'0', '0010', b'1', '电脑版', NULL, 'icon-grid', '0');
INSERT INTO `DS_functions` VALUES (26, '010202', '客户管理', '0102', '/pages/manage/clientManage.html', b'0', '0270', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (31, '010206', '成品标准管理', '0102', '/pages/manage/product_criteriaManage.html', b'0', '0284', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (32, '0502', '原料采购部', '0', '', b'0', '0005', b'1', '电脑版', '', 'icon-loop', '0');
INSERT INTO `DS_functions` VALUES (33, '050201', '原料标准查询', '0502', '/pages/materials/raw_materials_criteria.html', b'0', '0340', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (34, '050202', '原料购买', '0502', '/pages/manage/raw_materials_warehouseManage.html', b'0', '0340', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (36, '030109', '配方查询', '0301', '/pages/materials/product_criteria.html', b'0', '0651', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (38, '0603', '销售部', '0', '', b'0', '0001', b'1', '电脑版', '', 'icon-briefcase', '0');
INSERT INTO `DS_functions` VALUES (41, '060303', '运输状态查询', '0603', '/pages/materials/export_record.html', b'0', '0394', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (44, '0704', '财务部', '0', '', b'0', '0002', b'1', '电脑版', '', 'icon-map', '0');
INSERT INTO `DS_functions` VALUES (59, '040106', '成品库存查询', '0401', '/pages/materials/product_warehouse.html', b'0', '0600', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (60, '040107', '生产进度查询', '0401', '/pages/materials/manufacture_result.html', b'0', '0600', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (195, '010205', '原料标准管理', '0102', '/pages/manage/raw_materials_criteriaManage.html', b'0', '0283', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (198, '0301', '生产车间', '0', '', b'0', '0004', b'1', '电脑版', NULL, 'icon-pie-chart', '0');
INSERT INTO `DS_functions` VALUES (200, '060305', '销售退货', '0603', '/pages/manage/refund_applicationManage.html', b'0', '0396', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (201, '040103', '生产计划制定', '0401', '/pages/manage/manufacture_designManage.html', b'0', '0403', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (204, '070404', '会计订单管理', '0704', '/pages/manage/order_formManage_accountant.html', b'0', '0475', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (206, '070406', '退款单', '0704', '/pages/manage/refund_applicationManage.html', b'0', '0490', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (207, '070412', '收款单', '0704', '/pages/materials/payment.html', b'0', '0510', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (209, '060304', '成品库查询', '0603', '/pages/materials/product_warehouse.html', b'0', '0630', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (210, '040102', '订单详情查询', '0401', '/pages/materials/order_details.html', b'0', '0405', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (211, '040104', '原料库存查询', '0401', '/pages/materials/raw_materials_warehouse.html', b'0', '0407', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (217, '01020102', '客户信息', '0102', '/pages/materials/client.html', b'0', '0262', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (220, '010103', '计量单位', '0101', '/pages/manage/unit.html', b'0', '0245', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (225, '0401', '生产计划科', '0', '', b'0', '0003', b'1', '电脑版', '', 'icon-present', '0');
INSERT INTO `DS_functions` VALUES (228, '030108', '生产进度更新', '0301', '/pages/manage/manufacture_design_workshop.html', b'0', '0650', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (235, '070408', '资金流水', '0704', '/pages/manage/paymentManage.html', b'0', '0410', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (239, '0801', '原料仓库', '0', '', b'0', '0006', b'1', '电脑版', '', 'icon-layers', '0');
INSERT INTO `DS_functions` VALUES (240, '010104', '配方管理', '0101', '/pages/manage/product_criteriaManage.html', b'0', '0246', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (242, '060302', '销售订单管理', '0603', '/pages/manage/order_formManage_salesman.html', b'0', '0392', b'1', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (244, '080112', '原料入库', '0801', '/pages/manage/raw_materials_warehouseManage.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (245, '010113', '过期食品详情', '0101', '/pages/materials/expired_food.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (246, '080114', '过期原料处理', '0801', '/pages/manage/expired_foodManage_materials.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (250, '0901', '成品仓库', '0', '', b'0', '0007', b'1', '电脑版', '', 'icon-layers', '0');
INSERT INTO `DS_functions` VALUES (252, '090109', '成品入库', '0901', '/pages/manage/product_warehouseManage.html', b'0', '0902', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (253, '090113', '成品出库', '0901', '/pages/manage/export_recordManage.html', b'0', '0903', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (258, '090114', '过期食品处理', '0901', '/pages/manage/expired_foodManage_products.html', b'0', '0904', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (259, '000107', '部门管理', '0001', 'sss', b'1', '9011', b'1', '电脑版', NULL, NULL, '0');
INSERT INTO `DS_functions` VALUES (260, '000110', '角色2', '0001', '/pages/manage/role.html', NULL, '0170', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (262, '000122', '测试2', '0801', '/pages/manage/raw_materials_criteriaManage.html', NULL, '1234', b'1', NULL, NULL, NULL, '0');
INSERT INTO `DS_functions` VALUES (263, '010199', '原料标准管理', '0101', '/pages/manage/raw_materials_criteriaManage.html', NULL, '', b'1', '电脑版', NULL, 'icon-notebook', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=7207 DEFAULT CHARSET=utf8 COMMENT='操作日志';

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
INSERT INTO `DS_log` VALUES (6762, 120, '用户', '127.0.0.1', '2019-11-30 11:38:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6763, 120, '用户', '127.0.0.1', '2019-11-30 11:46:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6764, 120, '用户', '127.0.0.1', '2019-11-30 11:48:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6765, 120, '用户', '127.0.0.1', '2019-11-30 11:49:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6766, 120, '用户', '127.0.0.1', '2019-11-30 11:52:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6767, 120, '用户', '127.0.0.1', '2019-11-30 11:53:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6768, 120, '序列号', '127.0.0.1', '2019-11-30 12:01:32', 0, '删除,id:10序列号', '删除,id:10序列号', NULL);
INSERT INTO `DS_log` VALUES (6769, 120, '用户', '127.0.0.1', '2019-11-30 14:09:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6770, 120, '用户', '127.0.0.1', '2019-11-30 15:03:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6771, 120, '用户', '127.0.0.1', '2019-11-30 15:05:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6772, 120, '用户', '127.0.0.1', '2019-11-30 15:42:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6773, 120, '用户', '127.0.0.1', '2019-11-30 15:52:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6774, 120, '用户', '127.0.0.1', '2019-11-30 15:54:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6775, 120, '用户', '127.0.0.1', '2019-11-30 15:59:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6776, 120, '用户', '127.0.0.1', '2019-11-30 16:00:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6777, 120, '用户', '127.0.0.1', '2019-11-30 16:57:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6778, 120, '用户', '127.0.0.1', '2019-11-30 16:57:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6779, 120, '用户', '127.0.0.1', '2019-11-30 17:00:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6780, 120, '用户', '127.0.0.1', '2019-11-30 17:15:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6781, 120, '用户', '127.0.0.1', '2019-11-30 17:17:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6782, 120, '用户', '127.0.0.1', '2019-11-30 21:40:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6783, 120, '用户', '127.0.0.1', '2019-11-30 21:56:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6784, 120, '用户', '127.0.0.1', '2019-11-30 22:06:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6785, 120, '用户', '127.0.0.1', '2019-11-30 22:07:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6786, 120, '用户', '127.0.0.1', '2019-11-30 22:10:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6787, 120, '用户', '127.0.0.1', '2019-11-30 22:11:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6788, 120, '用户', '127.0.0.1', '2019-11-30 22:16:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6789, 120, '用户', '127.0.0.1', '2019-11-30 22:18:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6790, 120, '用户', '127.0.0.1', '2019-12-01 11:01:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6791, 120, '用户', '127.0.0.1', '2019-12-01 11:03:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6792, 120, '用户', '127.0.0.1', '2019-12-01 11:05:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6793, 120, '用户', '127.0.0.1', '2019-12-01 11:13:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6794, 120, '用户', '127.0.0.1', '2019-12-01 12:29:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6795, 120, '用户', '127.0.0.1', '2019-12-01 12:31:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6796, 120, '用户', '127.0.0.1', '2019-12-01 12:34:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6797, 120, '用户', '127.0.0.1', '2019-12-01 12:35:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6798, 120, '用户', '127.0.0.1', '2019-12-01 12:38:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6799, 120, '用户', '127.0.0.1', '2019-12-01 12:40:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6800, 120, '用户', '127.0.0.1', '2019-12-01 12:45:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6801, 120, '用户', '127.0.0.1', '2019-12-01 12:48:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6802, 120, '用户', '127.0.0.1', '2019-12-01 12:50:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6803, 120, '用户', '127.0.0.1', '2019-12-01 12:55:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6804, 120, '用户', '127.0.0.1', '2019-12-01 12:58:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6805, 120, '用户', '127.0.0.1', '2019-12-01 13:07:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6806, 120, '用户', '127.0.0.1', '2019-12-01 13:09:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6807, 120, '用户', '127.0.0.1', '2019-12-01 13:14:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6808, 120, '用户', '127.0.0.1', '2019-12-01 13:21:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6809, 120, '用户', '127.0.0.1', '2019-12-01 13:22:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6810, 120, '用户', '127.0.0.1', '2019-12-01 13:27:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6811, 120, '用户', '127.0.0.1', '2019-12-01 13:34:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6812, 120, '用户', '127.0.0.1', '2019-12-01 13:35:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6813, 120, '用户', '127.0.0.1', '2019-12-01 13:36:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6814, 120, '用户', '127.0.0.1', '2019-12-01 13:38:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6815, 120, '用户', '127.0.0.1', '2019-12-01 13:40:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6816, 120, '用户', '127.0.0.1', '2019-12-01 13:43:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6817, 120, '用户', '127.0.0.1', '2019-12-01 13:49:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6818, 120, '用户', '127.0.0.1', '2019-12-01 13:50:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6819, 120, '用户', '127.0.0.1', '2019-12-01 13:51:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6820, 120, '用户', '127.0.0.1', '2019-12-01 13:53:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6821, 120, '用户', '127.0.0.1', '2019-12-01 13:53:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6822, 120, '用户', '127.0.0.1', '2019-12-01 13:54:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6823, 120, '用户', '127.0.0.1', '2019-12-01 13:57:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6824, 120, '用户', '127.0.0.1', '2019-12-01 14:07:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6825, 120, '用户', '127.0.0.1', '2019-12-01 14:14:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6826, 120, '用户', '127.0.0.1', '2019-12-01 14:17:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6827, 120, '用户', '127.0.0.1', '2019-12-01 14:30:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6828, 120, '用户', '127.0.0.1', '2019-12-01 14:32:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6829, 120, '用户', '127.0.0.1', '2019-12-01 14:38:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6830, 120, '用户', '127.0.0.1', '2019-12-01 14:40:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6831, 120, '用户', '127.0.0.1', '2019-12-01 14:42:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6832, 120, '用户', '127.0.0.1', '2019-12-01 14:43:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6833, 120, '用户', '127.0.0.1', '2019-12-01 14:47:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6834, 120, '用户', '127.0.0.1', '2019-12-01 16:31:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6835, 120, '用户', '127.0.0.1', '2019-12-01 16:32:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6836, 120, '用户', '127.0.0.1', '2019-12-01 16:37:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6837, 120, '用户', '127.0.0.1', '2019-12-01 16:38:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6838, 120, '用户', '127.0.0.1', '2019-12-01 16:40:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6839, 120, '用户', '127.0.0.1', '2019-12-01 16:44:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6840, 120, '用户', '127.0.0.1', '2019-12-01 16:47:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6841, 120, '用户', '127.0.0.1', '2019-12-01 16:49:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6842, 120, '用户', '127.0.0.1', '2019-12-01 16:57:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6843, 120, '用户', '127.0.0.1', '2019-12-01 16:59:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6844, 120, '用户', '127.0.0.1', '2019-12-01 17:08:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6845, 120, '用户', '127.0.0.1', '2019-12-01 17:10:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6846, 120, '用户', '127.0.0.1', '2019-12-01 17:12:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6847, 120, '用户', '127.0.0.1', '2019-12-01 17:15:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6848, 120, '用户', '127.0.0.1', '2019-12-01 17:17:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6849, 120, '用户', '127.0.0.1', '2019-12-01 17:21:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6850, 120, '用户', '127.0.0.1', '2019-12-02 12:51:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6851, 120, '用户', '127.0.0.1', '2019-12-02 13:17:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6852, 120, '用户', '127.0.0.1', '2019-12-02 13:50:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6853, 120, '用户', '127.0.0.1', '2019-12-02 13:57:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6854, 120, '用户', '127.0.0.1', '2019-12-02 17:08:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6855, 120, '用户', '127.0.0.1', '2019-12-02 17:08:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6856, 120, '用户', '127.0.0.1', '2019-12-02 17:19:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6857, 120, '用户', '127.0.0.1', '2019-12-02 17:21:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6858, 120, '用户', '127.0.0.1', '2019-12-02 17:22:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6859, 120, '用户', '127.0.0.1', '2019-12-02 17:22:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6860, 120, '用户', '127.0.0.1', '2019-12-02 17:23:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6861, 120, '用户', '127.0.0.1', '2019-12-02 17:26:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6862, 120, '用户', '127.0.0.1', '2019-12-02 17:30:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6863, 120, '用户', '127.0.0.1', '2019-12-02 17:31:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6864, 120, '用户', '127.0.0.1', '2019-12-02 17:32:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6865, 120, '用户', '127.0.0.1', '2019-12-02 17:34:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6866, 120, '用户', '127.0.0.1', '2019-12-02 17:35:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6867, 120, '用户', '127.0.0.1', '2019-12-02 17:36:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6868, 120, '用户', '127.0.0.1', '2019-12-02 17:37:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6869, 120, '用户', '127.0.0.1', '2019-12-02 17:39:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6870, 120, '用户', '127.0.0.1', '2019-12-02 17:40:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6871, 120, '用户', '127.0.0.1', '2019-12-02 17:40:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6872, 120, '用户', '127.0.0.1', '2019-12-02 17:41:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6873, 120, '用户', '127.0.0.1', '2019-12-02 20:20:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6874, 120, '用户', '127.0.0.1', '2019-12-02 20:21:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6875, 120, '用户', '127.0.0.1', '2019-12-02 20:23:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6876, 120, '用户', '127.0.0.1', '2019-12-02 20:24:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6877, 120, '用户', '127.0.0.1', '2019-12-02 20:30:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6878, 120, '用户', '127.0.0.1', '2019-12-02 20:35:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6879, 120, '用户', '127.0.0.1', '2019-12-02 20:39:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6880, 120, '用户', '127.0.0.1', '2019-12-02 21:05:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6881, 120, '用户', '127.0.0.1', '2019-12-02 21:11:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6882, 120, '用户', '127.0.0.1', '2019-12-02 21:20:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6883, 120, '用户', '127.0.0.1', '2019-12-02 21:24:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6884, 120, '用户', '127.0.0.1', '2019-12-02 21:27:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6885, 120, '用户', '127.0.0.1', '2019-12-02 22:42:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6886, 120, '用户', '127.0.0.1', '2019-12-02 22:44:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6887, 120, '用户', '127.0.0.1', '2019-12-02 22:45:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6888, 120, '用户', '127.0.0.1', '2019-12-02 22:46:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6889, 120, '用户', '127.0.0.1', '2019-12-02 22:47:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6890, 120, '用户', '127.0.0.1', '2019-12-02 22:48:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6891, 120, '用户', '127.0.0.1', '2019-12-02 22:49:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6892, 120, '用户', '127.0.0.1', '2019-12-02 22:50:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6893, 120, '用户', '127.0.0.1', '2019-12-02 22:53:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6894, 120, '用户', '127.0.0.1', '2019-12-02 22:54:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6895, 120, '用户', '127.0.0.1', '2019-12-02 22:55:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6896, 120, '用户', '127.0.0.1', '2019-12-02 22:56:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6897, 120, '用户', '127.0.0.1', '2019-12-02 22:56:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6898, 120, '用户', '127.0.0.1', '2019-12-02 22:57:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6899, 120, '用户', '127.0.0.1', '2019-12-02 22:57:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6900, 120, '用户', '127.0.0.1', '2019-12-02 22:58:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6901, 120, '用户', '127.0.0.1', '2019-12-02 23:01:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6902, 120, '用户', '127.0.0.1', '2019-12-02 23:02:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6903, 120, '用户', '127.0.0.1', '2019-12-02 23:03:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6904, 120, '用户', '127.0.0.1', '2019-12-02 23:04:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6905, 120, '用户', '127.0.0.1', '2019-12-02 23:07:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6906, 120, '用户', '127.0.0.1', '2019-12-02 23:17:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6907, 120, '用户', '127.0.0.1', '2019-12-03 15:36:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6908, 120, '用户', '127.0.0.1', '2019-12-03 15:40:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6909, 120, '用户', '127.0.0.1', '2019-12-03 15:43:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6910, 120, '用户', '127.0.0.1', '2019-12-03 15:56:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6911, 120, '用户', '127.0.0.1', '2019-12-03 15:57:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6912, 120, '用户', '127.0.0.1', '2019-12-03 16:00:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6913, 120, '用户', '127.0.0.1', '2019-12-03 16:01:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6914, 120, '用户', '127.0.0.1', '2019-12-03 16:03:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6915, 120, '用户', '127.0.0.1', '2019-12-03 16:05:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6916, 120, '用户', '127.0.0.1', '2019-12-03 16:06:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6917, 120, '用户', '127.0.0.1', '2019-12-03 16:15:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6918, 120, '用户', '127.0.0.1', '2019-12-03 16:16:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6919, 120, '用户', '127.0.0.1', '2019-12-03 16:17:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6920, 120, '用户', '127.0.0.1', '2019-12-03 16:19:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6921, 120, '用户', '127.0.0.1', '2019-12-03 16:20:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6922, 120, '用户', '127.0.0.1', '2019-12-03 16:21:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6923, 120, '用户', '127.0.0.1', '2019-12-03 16:22:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6924, 120, '用户', '127.0.0.1', '2019-12-03 16:23:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6925, 120, '用户', '127.0.0.1', '2019-12-03 16:29:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6926, 120, '序列号', '127.0.0.1', '2019-12-03 16:39:27', 0, '删除,id:4序列号', '删除,id:4序列号', NULL);
INSERT INTO `DS_log` VALUES (6927, 120, '用户', '127.0.0.1', '2019-12-03 16:45:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6928, 120, '用户', '127.0.0.1', '2019-12-03 16:49:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6929, 120, '序列号', '127.0.0.1', '2019-12-03 16:49:59', 0, '删除,id:39序列号', '删除,id:39序列号', NULL);
INSERT INTO `DS_log` VALUES (6930, 120, '用户', '127.0.0.1', '2019-12-03 16:52:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6931, 120, '用户', '127.0.0.1', '2019-12-03 16:58:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6932, 120, '用户', '127.0.0.1', '2019-12-03 17:01:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6933, 120, '用户', '127.0.0.1', '2019-12-03 17:03:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6934, 120, '用户', '127.0.0.1', '2019-12-03 17:06:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6935, 120, '用户', '127.0.0.1', '2019-12-03 17:16:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6936, 120, '用户', '127.0.0.1', '2019-12-03 17:17:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6937, 120, '用户', '127.0.0.1', '2019-12-03 17:18:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6938, 120, '用户', '127.0.0.1', '2019-12-03 17:20:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6939, 120, '用户', '127.0.0.1', '2019-12-03 17:22:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6940, 120, '用户', '127.0.0.1', '2019-12-03 17:24:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6941, 120, '用户', '127.0.0.1', '2019-12-03 17:29:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6942, 120, '用户', '127.0.0.1', '2019-12-03 17:30:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6943, 120, '用户', '127.0.0.1', '2019-12-03 17:31:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6944, 120, '用户', '127.0.0.1', '2019-12-03 17:33:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6945, 120, '用户', '127.0.0.1', '2019-12-03 17:40:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6946, 120, '用户', '127.0.0.1', '2019-12-03 17:42:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6947, 120, '用户', '127.0.0.1', '2019-12-03 19:48:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6948, 120, '用户', '127.0.0.1', '2019-12-03 19:53:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6949, 120, '用户', '127.0.0.1', '2019-12-03 20:23:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6950, 120, '用户', '127.0.0.1', '2019-12-03 20:33:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6951, 120, '用户', '127.0.0.1', '2019-12-03 20:37:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6952, 120, '用户', '127.0.0.1', '2019-12-03 20:37:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6953, 120, '用户', '127.0.0.1', '2019-12-03 20:45:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6954, 120, '用户', '127.0.0.1', '2019-12-03 20:56:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6955, 120, '用户', '127.0.0.1', '2019-12-03 21:08:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6956, 120, '用户', '127.0.0.1', '2019-12-03 21:10:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6957, 120, '用户', '127.0.0.1', '2019-12-03 21:22:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6958, 120, '用户', '127.0.0.1', '2019-12-03 21:24:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6959, 120, '用户', '127.0.0.1', '2019-12-03 21:28:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6960, 120, '用户', '127.0.0.1', '2019-12-03 21:31:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6961, 120, '用户', '127.0.0.1', '2019-12-03 21:45:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6962, 120, '用户', '127.0.0.1', '2019-12-03 22:03:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6963, 120, '用户', '127.0.0.1', '2019-12-03 22:07:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6964, 120, '用户', '127.0.0.1', '2019-12-03 22:08:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6965, 120, '用户', '127.0.0.1', '2019-12-03 22:13:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6966, 120, '用户', '127.0.0.1', '2019-12-03 22:29:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6967, 120, '用户', '127.0.0.1', '2019-12-03 22:34:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6968, 120, '用户', '127.0.0.1', '2019-12-03 22:37:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6969, 120, '用户', '127.0.0.1', '2019-12-03 22:38:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6970, 120, '用户', '127.0.0.1', '2019-12-03 22:47:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6971, 120, '用户', '127.0.0.1', '2019-12-03 22:48:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6972, 120, '用户', '127.0.0.1', '2019-12-03 22:49:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6973, 120, '用户', '127.0.0.1', '2019-12-03 22:51:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6974, 120, '用户', '127.0.0.1', '2019-12-03 23:00:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6975, 120, '用户', '127.0.0.1', '2019-12-04 23:09:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6976, 120, '用户', '127.0.0.1', '2019-12-04 23:19:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6977, 120, '用户', '127.0.0.1', '2019-12-04 23:26:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6978, 120, '用户', '127.0.0.1', '2019-12-04 23:32:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6979, 120, '用户', '127.0.0.1', '2019-12-04 23:41:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6980, 120, '用户', '127.0.0.1', '2019-12-04 23:50:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6981, 120, '用户', '127.0.0.1', '2019-12-05 00:02:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6982, 120, '用户', '127.0.0.1', '2019-12-05 16:25:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6983, 120, '用户', '127.0.0.1', '2019-12-05 16:27:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6984, 120, '用户', '127.0.0.1', '2019-12-05 16:29:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6985, 120, '用户', '127.0.0.1', '2019-12-05 16:37:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6986, 120, '用户', '127.0.0.1', '2019-12-05 16:40:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6987, 120, '用户', '127.0.0.1', '2019-12-05 16:43:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6988, 120, '用户', '127.0.0.1', '2019-12-05 16:44:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6989, 120, '用户', '127.0.0.1', '2019-12-05 16:50:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6990, 120, '用户', '127.0.0.1', '2019-12-05 18:30:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6991, 120, '用户', '127.0.0.1', '2019-12-05 18:32:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6992, 120, '用户', '127.0.0.1', '2019-12-05 18:36:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6993, 120, '用户', '127.0.0.1', '2019-12-05 18:40:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6994, 120, '用户', '127.0.0.1', '2019-12-05 18:56:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6995, 120, '用户', '127.0.0.1', '2019-12-05 18:59:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6996, 120, '用户', '127.0.0.1', '2019-12-05 23:32:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6997, 120, '用户', '127.0.0.1', '2019-12-05 23:52:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6998, 120, '用户', '127.0.0.1', '2019-12-05 23:57:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6999, 120, '用户', '127.0.0.1', '2019-12-06 12:45:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7000, 120, '用户', '127.0.0.1', '2019-12-06 12:54:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7001, 120, '用户', '127.0.0.1', '2019-12-06 13:03:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7002, 120, '用户', '127.0.0.1', '2019-12-06 13:07:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7003, 120, '用户', '127.0.0.1', '2019-12-06 13:10:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7004, 120, '用户', '127.0.0.1', '2019-12-07 13:58:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7005, 120, '用户', '127.0.0.1', '2019-12-07 14:13:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7006, 120, '用户', '127.0.0.1', '2019-12-07 14:14:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7007, 120, '用户', '127.0.0.1', '2019-12-07 14:14:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7008, 120, '用户', '127.0.0.1', '2019-12-07 14:15:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7009, 120, '用户', '127.0.0.1', '2019-12-07 14:15:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7010, 120, '用户', '127.0.0.1', '2019-12-07 14:54:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7011, 120, '用户', '127.0.0.1', '2019-12-07 14:55:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7012, 120, '用户', '127.0.0.1', '2019-12-07 14:56:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7013, 120, '用户', '127.0.0.1', '2019-12-07 15:13:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7014, 120, '用户', '127.0.0.1', '2019-12-07 15:14:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7015, 120, '用户', '127.0.0.1', '2019-12-07 15:15:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7016, 120, '用户', '127.0.0.1', '2019-12-07 15:16:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7017, 120, '用户', '127.0.0.1', '2019-12-07 15:52:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7018, 120, '用户', '127.0.0.1', '2019-12-07 15:57:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7019, 120, '用户', '127.0.0.1', '2019-12-07 15:59:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7020, 120, '用户', '127.0.0.1', '2019-12-07 16:02:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7021, 120, '用户', '127.0.0.1', '2019-12-07 16:05:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7022, 120, '用户', '127.0.0.1', '2019-12-07 16:11:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7023, 120, '用户', '127.0.0.1', '2019-12-07 16:19:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7024, 120, '用户', '127.0.0.1', '2019-12-07 16:26:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7025, 120, '用户', '127.0.0.1', '2019-12-07 16:31:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7026, 120, '用户', '127.0.0.1', '2019-12-07 16:51:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7027, 120, '用户', '127.0.0.1', '2019-12-07 16:56:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7028, 120, '用户', '127.0.0.1', '2019-12-07 16:57:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7029, 120, '用户', '127.0.0.1', '2019-12-07 16:59:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7030, 120, '用户', '127.0.0.1', '2019-12-07 17:02:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7031, 120, '用户', '127.0.0.1', '2019-12-07 17:05:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7032, 120, '用户', '127.0.0.1', '2019-12-07 17:09:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7033, 120, '用户', '127.0.0.1', '2019-12-07 17:10:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7034, 120, '用户', '127.0.0.1', '2019-12-07 17:12:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7035, 120, '用户', '127.0.0.1', '2019-12-07 17:15:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7036, 120, '用户', '127.0.0.1', '2019-12-07 17:19:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7037, 120, '用户', '127.0.0.1', '2019-12-07 17:22:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7038, 120, '用户', '127.0.0.1', '2019-12-07 17:40:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7039, 120, '用户', '127.0.0.1', '2019-12-07 17:42:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7040, 120, '用户', '127.0.0.1', '2019-12-07 17:51:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7041, 120, '用户', '127.0.0.1', '2019-12-07 19:22:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7042, 120, '用户', '127.0.0.1', '2019-12-07 19:26:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7043, 120, '用户', '127.0.0.1', '2019-12-07 19:32:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7044, 120, '用户', '127.0.0.1', '2019-12-07 19:33:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7045, 120, '用户', '127.0.0.1', '2019-12-07 19:36:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7046, 120, '用户', '127.0.0.1', '2019-12-07 19:41:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7047, 120, '用户', '127.0.0.1', '2019-12-07 19:43:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7048, 120, '用户', '127.0.0.1', '2019-12-07 19:46:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7049, 120, '用户', '127.0.0.1', '2019-12-07 19:49:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7050, 120, '用户', '127.0.0.1', '2019-12-07 19:50:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7051, 120, '用户', '127.0.0.1', '2019-12-07 19:53:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7052, 120, '用户', '127.0.0.1', '2019-12-07 19:59:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7053, 120, '用户', '127.0.0.1', '2019-12-07 20:00:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7054, 120, '用户', '127.0.0.1', '2019-12-07 20:03:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7055, 120, '用户', '127.0.0.1', '2019-12-07 20:03:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7056, 120, '用户', '127.0.0.1', '2019-12-07 20:05:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7057, 120, '用户', '127.0.0.1', '2019-12-07 20:10:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7058, 120, '用户', '127.0.0.1', '2019-12-07 20:15:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7059, 120, '用户', '127.0.0.1', '2019-12-07 20:20:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7060, 120, '用户', '127.0.0.1', '2019-12-07 20:50:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7061, 120, '用户', '127.0.0.1', '2019-12-07 20:54:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7062, 120, '用户', '127.0.0.1', '2019-12-07 20:56:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7063, 120, '用户', '127.0.0.1', '2019-12-07 20:57:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7064, 120, '用户', '127.0.0.1', '2019-12-07 21:02:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7065, 120, '用户', '127.0.0.1', '2019-12-07 21:48:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7066, 120, '用户', '127.0.0.1', '2019-12-07 22:00:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7067, 120, '用户', '127.0.0.1', '2019-12-07 22:03:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7068, 120, '用户', '127.0.0.1', '2019-12-07 22:05:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7069, 120, '用户', '127.0.0.1', '2019-12-07 22:16:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7070, 120, '用户', '127.0.0.1', '2019-12-07 22:20:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7071, 120, '用户', '127.0.0.1', '2019-12-07 22:25:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7072, 120, '用户', '127.0.0.1', '2019-12-07 22:51:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7073, 120, '用户', '127.0.0.1', '2019-12-07 22:59:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7074, 120, '用户', '127.0.0.1', '2019-12-07 23:07:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7075, 120, '用户', '127.0.0.1', '2019-12-07 23:08:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7076, 120, '用户', '127.0.0.1', '2019-12-07 23:14:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7077, 120, '用户', '127.0.0.1', '2019-12-08 00:32:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7078, 120, '用户', '127.0.0.1', '2019-12-08 00:32:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7079, 120, '用户', '127.0.0.1', '2019-12-08 00:33:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7080, 120, '用户', '127.0.0.1', '2019-12-08 00:37:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7081, 120, '用户', '127.0.0.1', '2019-12-08 00:37:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7082, 120, '用户', '127.0.0.1', '2019-12-08 00:42:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7083, 120, '用户', '127.0.0.1', '2019-12-08 00:44:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7084, 120, '订单', '127.0.0.1', '2019-12-08 00:44:44', 0, '查询, id: 120订单', '查询, id: 120订单', NULL);
INSERT INTO `DS_log` VALUES (7085, 120, '订单', '127.0.0.1', '2019-12-08 00:45:24', 0, '查询, id: 120订单', '查询, id: 120订单', NULL);
INSERT INTO `DS_log` VALUES (7086, 120, '订单', '127.0.0.1', '2019-12-08 00:45:42', 0, '查询, id: 120订单', '查询, id: 120订单', NULL);
INSERT INTO `DS_log` VALUES (7087, 120, '用户', '127.0.0.1', '2019-12-08 10:37:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7088, 120, '用户', '127.0.0.1', '2019-12-08 10:47:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7089, 120, '用户', '127.0.0.1', '2019-12-08 10:48:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7090, 120, '用户', '127.0.0.1', '2019-12-08 10:49:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7091, 120, '用户', '127.0.0.1', '2019-12-08 10:54:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7092, 120, '用户', '127.0.0.1', '2019-12-08 10:54:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7093, 120, '用户', '127.0.0.1', '2019-12-08 10:59:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7094, 120, '用户', '127.0.0.1', '2019-12-08 11:07:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7095, 120, '用户', '127.0.0.1', '2019-12-08 11:09:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7096, 120, '用户', '127.0.0.1', '2019-12-08 11:19:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7097, 120, '用户', '127.0.0.1', '2019-12-08 11:20:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7098, 120, '用户', '127.0.0.1', '2019-12-08 11:27:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7099, 120, '用户', '127.0.0.1', '2019-12-08 11:28:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7100, 120, '用户', '127.0.0.1', '2019-12-08 11:29:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7101, 120, '用户', '127.0.0.1', '2019-12-08 11:43:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7102, 120, '用户', '127.0.0.1', '2019-12-08 11:44:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7103, 120, '商品购买', '127.0.0.1', '2019-12-08 11:44:21', 0, '查询, id: 120商品购买', '查询, id: 120商品购买', NULL);
INSERT INTO `DS_log` VALUES (7104, 120, '用户', '127.0.0.1', '2019-12-08 12:10:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7105, 120, '用户', '127.0.0.1', '2019-12-08 12:12:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7106, 120, '用户', '127.0.0.1', '2019-12-08 12:13:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7107, 120, '用户', '127.0.0.1', '2019-12-08 12:13:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7108, 120, '用户', '127.0.0.1', '2019-12-08 12:14:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7109, 120, '用户', '127.0.0.1', '2019-12-08 12:15:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7110, 120, '用户', '127.0.0.1', '2019-12-08 12:15:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7111, 120, '用户', '127.0.0.1', '2019-12-08 12:16:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7112, 120, '用户', '127.0.0.1', '2019-12-08 12:16:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7113, 120, '用户', '127.0.0.1', '2019-12-08 12:18:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7114, 120, '生产制造', '127.0.0.1', '2019-12-08 12:19:08', 0, '查询, id: 120生产制造', '查询, id: 120生产制造', NULL);
INSERT INTO `DS_log` VALUES (7115, 120, '用户', '127.0.0.1', '2019-12-08 12:23:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7116, 120, '用户', '127.0.0.1', '2019-12-08 12:24:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7117, 120, '用户', '127.0.0.1', '2019-12-08 12:25:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7118, 120, '用户', '127.0.0.1', '2019-12-08 12:36:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7119, 120, '用户', '127.0.0.1', '2019-12-08 12:37:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7120, 120, '用户', '127.0.0.1', '2019-12-08 12:40:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7121, 120, '用户', '127.0.0.1', '2019-12-08 12:47:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7122, 120, '用户', '127.0.0.1', '2019-12-08 12:50:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7123, 120, '收款', '127.0.0.1', '2019-12-08 12:50:45', 0, '查询, id: 120收款', '查询, id: 120收款', NULL);
INSERT INTO `DS_log` VALUES (7124, 120, '收款', '127.0.0.1', '2019-12-08 12:50:49', 0, '查询, id: 120收款', '查询, id: 120收款', NULL);
INSERT INTO `DS_log` VALUES (7125, 120, '成品仓库', '127.0.0.1', '2019-12-08 12:51:19', 0, '查询, id: 120成品仓库', '查询, id: 120成品仓库', NULL);
INSERT INTO `DS_log` VALUES (7126, 120, '原料仓库', '127.0.0.1', '2019-12-08 12:51:26', 0, '查询, id: 120原料仓库', '查询, id: 120原料仓库', NULL);
INSERT INTO `DS_log` VALUES (7127, 120, '生产制造', '127.0.0.1', '2019-12-08 12:51:31', 0, '查询, id: 120生产制造', '查询, id: 120生产制造', NULL);
INSERT INTO `DS_log` VALUES (7128, 120, '生产制造', '127.0.0.1', '2019-12-08 12:51:36', 0, '查询, id: 120生产制造', '查询, id: 120生产制造', NULL);
INSERT INTO `DS_log` VALUES (7129, 120, '生产计划', '127.0.0.1', '2019-12-08 12:51:49', 0, '修改,id:, id: 120生产计划', '修改,id:, id: 120生产计划', NULL);
INSERT INTO `DS_log` VALUES (7130, 120, '生产制造', '127.0.0.1', '2019-12-08 12:51:49', 0, '查询, id: 120生产制造', '查询, id: 120生产制造', NULL);
INSERT INTO `DS_log` VALUES (7131, 120, '生产制造', '127.0.0.1', '2019-12-08 12:51:58', 0, '查询, id: 120生产制造', '查询, id: 120生产制造', NULL);
INSERT INTO `DS_log` VALUES (7132, 120, '用户', '127.0.0.1', '2019-12-08 12:56:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7133, 120, '用户', '127.0.0.1', '2019-12-08 12:57:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7134, 120, '用户', '127.0.0.1', '2019-12-08 13:01:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7135, 120, '用户', '127.0.0.1', '2019-12-08 13:02:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7136, 120, '用户', '127.0.0.1', '2019-12-08 13:03:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7137, 120, '用户', '127.0.0.1', '2019-12-08 13:04:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7138, 120, '用户', '127.0.0.1', '2019-12-08 13:09:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7139, 120, '用户', '127.0.0.1', '2019-12-08 13:10:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7140, 120, '用户', '127.0.0.1', '2019-12-08 13:11:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7141, 120, '用户', '127.0.0.1', '2019-12-08 13:13:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7142, 120, '用户', '127.0.0.1', '2019-12-08 13:15:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7143, 120, '用户', '127.0.0.1', '2019-12-08 13:16:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7144, 120, '用户', '127.0.0.1', '2019-12-08 13:17:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7145, 120, '用户', '127.0.0.1', '2019-12-08 13:18:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7146, 120, '商品购买', '127.0.0.1', '2019-12-08 13:18:54', 0, '查询, id: 120商品购买', '查询, id: 120商品购买', NULL);
INSERT INTO `DS_log` VALUES (7147, 120, '出库单', '127.0.0.1', '2019-12-08 13:18:56', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7148, 120, '用户', '127.0.0.1', '2019-12-08 13:20:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7149, 120, '用户', '127.0.0.1', '2019-12-08 13:22:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7150, 120, '收款', '127.0.0.1', '2019-12-08 13:22:53', 0, '查询, id: 120收款', '查询, id: 120收款', NULL);
INSERT INTO `DS_log` VALUES (7151, 120, '成品仓库', '127.0.0.1', '2019-12-08 13:22:58', 0, '查询, id: 120成品仓库', '查询, id: 120成品仓库', NULL);
INSERT INTO `DS_log` VALUES (7152, 120, '生产制造', '127.0.0.1', '2019-12-08 13:23:00', 0, '查询, id: 120生产制造', '查询, id: 120生产制造', NULL);
INSERT INTO `DS_log` VALUES (7153, 120, '用户', '127.0.0.1', '2019-12-08 14:08:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7154, 120, '过期食品', '127.0.0.1', '2019-12-08 14:08:38', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7155, 120, '过期食品', '127.0.0.1', '2019-12-08 14:08:40', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7156, 120, '过期食品', '127.0.0.1', '2019-12-08 14:08:41', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7157, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:12', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7158, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:21', 0, '修改,id:, id: 120过期食品', '修改,id:, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7159, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:21', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7160, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:30', 0, '修改,id:, id: 120过期食品', '修改,id:, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7161, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:30', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7162, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:33', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7163, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:36', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7164, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:42', 0, '修改,id:, id: 120过期食品', '修改,id:, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7165, 120, '过期食品', '127.0.0.1', '2019-12-08 14:09:42', 0, '查询, id: 120过期食品', '查询, id: 120过期食品', NULL);
INSERT INTO `DS_log` VALUES (7166, 120, '用户', '127.0.0.1', '2019-12-08 14:16:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7167, 120, '成品仓库', '127.0.0.1', '2019-12-08 14:16:10', 0, '查询, id: 120成品仓库', '查询, id: 120成品仓库', NULL);
INSERT INTO `DS_log` VALUES (7168, 120, '出库单', '127.0.0.1', '2019-12-08 14:16:10', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7169, 120, '出库单', '127.0.0.1', '2019-12-08 14:16:14', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7170, 120, '成品仓库', '127.0.0.1', '2019-12-08 14:16:18', 0, '查询, id: 120成品仓库', '查询, id: 120成品仓库', NULL);
INSERT INTO `DS_log` VALUES (7171, 120, '成品仓库', '127.0.0.1', '2019-12-08 14:16:23', 0, '修改,id:, id: 120成品仓库', '修改,id:, id: 120成品仓库', NULL);
INSERT INTO `DS_log` VALUES (7172, 120, '成品仓库', '127.0.0.1', '2019-12-08 14:16:23', 0, '查询, id: 120成品仓库', '查询, id: 120成品仓库', NULL);
INSERT INTO `DS_log` VALUES (7173, 120, '用户', '127.0.0.1', '2019-12-08 14:19:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7174, 120, '出库单', '127.0.0.1', '2019-12-08 14:19:22', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7175, 120, '出库单', '127.0.0.1', '2019-12-08 14:19:24', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7176, 120, '用户', '127.0.0.1', '2019-12-08 14:20:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7177, 120, '出库单', '127.0.0.1', '2019-12-08 14:20:29', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7178, 120, '出库单', '127.0.0.1', '2019-12-08 14:20:31', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7179, 120, '用户', '127.0.0.1', '2019-12-08 14:21:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7180, 120, '出库单', '127.0.0.1', '2019-12-08 14:21:36', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7181, 120, '出库单', '127.0.0.1', '2019-12-08 14:21:39', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7182, 120, '出库单', '127.0.0.1', '2019-12-08 14:21:41', 0, '修改,id:, id: 120出库单', '修改,id:, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7183, 120, '出库单', '127.0.0.1', '2019-12-08 14:21:42', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7184, 120, '出库单', '127.0.0.1', '2019-12-08 14:21:47', 0, '修改,id:, id: 120出库单', '修改,id:, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7185, 120, '出库单', '127.0.0.1', '2019-12-08 14:21:47', 0, '查询, id: 120出库单', '查询, id: 120出库单', NULL);
INSERT INTO `DS_log` VALUES (7186, 120, '用户', '127.0.0.1', '2019-12-08 14:40:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7187, 120, '用户', '127.0.0.1', '2019-12-08 14:41:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7188, 120, '用户', '127.0.0.1', '2019-12-08 14:42:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7189, 134, '用户', '127.0.0.1', '2019-12-08 14:42:30', 0, '登录,id:134用户', '登录,id:134用户', NULL);
INSERT INTO `DS_log` VALUES (7190, 120, '用户', '127.0.0.1', '2019-12-08 14:42:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7191, 120, '用户', '127.0.0.1', '2019-12-08 15:36:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7192, 120, NULL, '127.0.0.1', '2019-12-08 15:36:53', 0, '修改,id:, id: 120null', '修改,id:, id: 120null', NULL);
INSERT INTO `DS_log` VALUES (7193, 120, '用户', '127.0.0.1', '2019-12-15 19:13:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7194, 120, '退货单', '127.0.0.1', '2019-12-15 19:25:41', 0, '查询, id: 120退货单', '查询, id: 120退货单', NULL);
INSERT INTO `DS_log` VALUES (7195, 120, '退货单', '127.0.0.1', '2019-12-15 19:25:54', 0, '查询, id: 120退货单', '查询, id: 120退货单', NULL);
INSERT INTO `DS_log` VALUES (7196, 120, '用户', '127.0.0.1', '2019-12-18 15:34:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7197, 120, '收款', '127.0.0.1', '2019-12-18 15:34:33', 0, '查询, id: 120收款', '查询, id: 120收款', NULL);
INSERT INTO `DS_log` VALUES (7198, 120, '收款', '127.0.0.1', '2019-12-18 15:34:37', 0, '查询, id: 120收款', '查询, id: 120收款', NULL);
INSERT INTO `DS_log` VALUES (7199, 120, '退货单', '127.0.0.1', '2019-12-18 15:34:39', 0, '查询, id: 120退货单', '查询, id: 120退货单', NULL);
INSERT INTO `DS_log` VALUES (7200, 120, '订单', '127.0.0.1', '2019-12-18 15:34:40', 0, '查询, id: 120订单', '查询, id: 120订单', NULL);
INSERT INTO `DS_log` VALUES (7201, 120, '用户', '127.0.0.1', '2020-06-24 11:41:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7202, 120, '用户', '127.0.0.1', '2020-07-03 18:25:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7203, 120, '订单', '127.0.0.1', '2020-07-03 18:25:16', 0, '查询, id: 120订单', '查询, id: 120订单', NULL);
INSERT INTO `DS_log` VALUES (7204, 120, '用户', '127.0.0.1', '2020-07-05 10:28:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (7205, 120, '商品购买', '127.0.0.1', '2020-07-05 10:28:33', 0, '查询, id: 120商品购买', '查询, id: 120商品购买', NULL);
INSERT INTO `DS_log` VALUES (7206, 120, '商品购买', '127.0.0.1', '2020-07-05 10:28:45', 0, '查询, id: 120商品购买', '查询, id: 120商品购买', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of DS_role
-- ----------------------------
BEGIN;
INSERT INTO `DS_role` VALUES (4, '测试管理员（系统代码测试）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (5, '系统管理员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (10, '部门管理员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (12, '业务人员', NULL, NULL, NULL, 117, '0');
INSERT INTO `DS_role` VALUES (13, '企业管理者', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (14, '客户', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (15, '普通销售员', NULL, NULL, NULL, 115, '0');
INSERT INTO `DS_role` VALUES (16, '特权销售员', NULL, NULL, NULL, 63, '0');
INSERT INTO `DS_role` VALUES (17, '销售管理（人员）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (18, '销售管理（系统）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (19, '普通会计', NULL, NULL, NULL, 115, '0');
INSERT INTO `DS_role` VALUES (20, '特权会计', NULL, NULL, NULL, 63, '0');
INSERT INTO `DS_role` VALUES (21, '财务管理（人员）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (22, '财务管理（系统）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (23, '生产计划人员', NULL, NULL, NULL, 115, '0');
INSERT INTO `DS_role` VALUES (24, '生产计划负责人', NULL, NULL, NULL, 63, '0');
INSERT INTO `DS_role` VALUES (25, '生产计划管理（人员）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (26, '生产计划管理（系统）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (27, '车间工作人员', NULL, NULL, NULL, 115, '0');
INSERT INTO `DS_role` VALUES (28, '车间工头', NULL, NULL, NULL, 63, '0');
INSERT INTO `DS_role` VALUES (29, '车间管理（人员）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (30, '原料库负责人', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (31, '成品库负责人', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (32, '仓库管理（人员）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (33, '仓库管理（系统）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (34, '采购人员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (35, '采购负责人', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (36, '商品管理员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (37, '商品管理员（高级）', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (38, '客户管理员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `DS_role` VALUES (39, 'sss', NULL, NULL, NULL, NULL, '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';

-- ----------------------------
-- Records of DS_userbusiness
-- ----------------------------
BEGIN;
INSERT INTO `DS_userbusiness` VALUES (5, 'RoleFunctions', '4', '[22][242][41][200][209][235][204][206][207][201][210][211][59][60][228][36][33][34][244][246][252][253][258][23][220][240][245][13][16][14][15][217][26][195][31]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
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
INSERT INTO `DS_userbusiness` VALUES (69, 'UserRole', '134', '[0]', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for Department
-- ----------------------------
DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
  `Dno` char(20) NOT NULL,
  `Department` char(50) DEFAULT NULL,
  `Workshop` char(255) DEFAULT NULL,
  PRIMARY KEY (`Dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Department
-- ----------------------------
BEGIN;
INSERT INTO `Department` VALUES ('01--001', '管理部门', '最高管理部');
INSERT INTO `Department` VALUES ('02--001', '销售部', '销售部A');
INSERT INTO `Department` VALUES ('03--001', '会计部', '会计部A');
INSERT INTO `Department` VALUES ('04--001', '生产计划科', '生产计划科A');
INSERT INTO `Department` VALUES ('05--001', '生产车间', '车间A');
INSERT INTO `Department` VALUES ('06--001', '仓库', '原料库A');
INSERT INTO `Department` VALUES ('06--002', '仓库', '成品库A');
INSERT INTO `Department` VALUES ('07--001', '商品管理', '商品部A');
INSERT INTO `Department` VALUES ('08--001', '采购部门', '蔬菜采购组A');
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
INSERT INTO `Expired_Food` VALUES ('0000000002', '原料', '小面包', '2019-11-20 17:29:37', '3000--kg', 1800000, 'baiwan', 0);
INSERT INTO `Expired_Food` VALUES ('0000000003', '成品', '小面包', '2019-11-20 17:30:41', '3000--公斤', 1800000, '来来来', 0);
INSERT INTO `Expired_Food` VALUES ('0000000004', '成品', '小面包', '2019-11-20 17:42:06', '3000--公斤', 1800000, '成品仓库00001；焚烧', 1);
INSERT INTO `Expired_Food` VALUES ('0000000005', '成品', '小面包', '2019-11-20 17:43:34', '3000--公斤', 1800000, '成品仓库00001；焚烧', 0);
INSERT INTO `Expired_Food` VALUES ('0000000006', '成品', '小面包', '2019-11-20 17:53:31', '3000--公斤', 1800000, '成品仓库00001；焚烧', 0);
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
INSERT INTO `Export_Record` VALUES ('0000000040', '', '00000008-01', '大山食品厂', '', '2019-11-23 13:13:19', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
INSERT INTO `Export_Record` VALUES ('0000000041', '463', '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-23 13:16:05', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', 0);
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
  `Order_no_details` varchar(255) NOT NULL,
  `Staff_no_design` char(20) NOT NULL,
  `Product_no` char(20) NOT NULL,
  `Deadline` datetime DEFAULT NULL,
  `Progress` char(100) NOT NULL,
  `Workshop` char(255) NOT NULL,
  `Raw_materials_requirement` char(255) NOT NULL,
  `Products_requirement` char(255) NOT NULL,
  `Details` char(255) NOT NULL,
  `flag` int(4) NOT NULL DEFAULT '0',
  `Update_date` datetime COMMENT '创建时间',
  PRIMARY KEY (`Manufacture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Manufacture_Design
-- ----------------------------
BEGIN;
INSERT INTO `Manufacture_Design` VALUES ('0000000001', '0000001-01', '', '1111', '2019-11-21 12:38:06', '', '', '原料所需：00008（70%，800--捆）；00017（30%，8932--打）', '', '', 1, '2019-12-04 23:48:40');
INSERT INTO `Manufacture_Design` VALUES ('0000000002', '0000001-01', '00002', '0001', '2020-02-22 00:56:40', '开始', '车间ABC', '原料所需：00041（30%，3948--公斤）；00023（70%，50760--袋）', '300--箱', '第一个订单修改', 0, '2019-12-07 22:06:11');
INSERT INTO `Manufacture_Design` VALUES ('0000000003', '00000010-01；00000011-01；00000023-02；00000024-02', '000002', '0002', '2019-12-06 14:33:46', '', '车间A；车间B；车间C', '原料所需：00001（30%，6864--公斤）；00002（40%，10296000--毫升）；00005（30%，51480--袋）', '1288--公斤', '该生产计划新增子订单：00000024-02', 0, '2019-12-04 23:48:24');
INSERT INTO `Manufacture_Design` VALUES ('0000000004', '00000021-02', '000001', '0001', '2020-03-01 14:14:59', '', '车间C', '原料所需：00041（30%，3948--公斤）；00023（70%，50760--袋）', '20--箱', '', 0, '2019-12-04 23:48:24');
INSERT INTO `Manufacture_Design` VALUES ('0000000005', '00000021-02；00000023-01', '000001', '0001', '2020-03-01 14:30:41', '', '车间C；车间D', '原料所需：00041（30%，6363--公斤）；00023（70%，81810--袋）', '345--公斤', '该生产计划新增子订单：00000023-01', 0, '2019-12-04 23:48:24');
INSERT INTO `Manufacture_Design` VALUES ('0000000006', '00000022-02', '000001', '0001', '2019-12-06 14:18:49', '', '车间C', '原料所需：00041（30%，3948--公斤）；00023（70%，50760--袋）', '300--箱', '该生产计划新增子订单：00000022-02', 0, '2019-12-04 23:48:24');
INSERT INTO `Manufacture_Design` VALUES ('0000000007', '00000006-00；00000004-00', '0002314', '0001', '2020-03-02 23:20:12', '', '车间A；车间B', '原料所需：00041（30%，42000--公斤）；00023（70%，540000--袋）', '4000--公斤', '该生产计划新增子订单：00000004-00', 0, '2019-12-04 23:48:24');
INSERT INTO `Manufacture_Design` VALUES ('0000000008', '00000009-00；00000011-00', '000001', '0001', '2020-03-04 23:53:54', '', '去吧，皮卡丘！；去吧，伊布！', '原料所需：00041（30%，42000--公斤）；00023（70%，540000--袋）', '4000--公斤', '', 0, '2019-12-08 12:51:49');
INSERT INTO `Manufacture_Design` VALUES ('0000000009', '00000005-00；00000006-00', '', '0001', '2020-03-05 00:05:12', '来了来了', '', '原料所需：00041（30%，42000--公斤）；00023（70%，540000--袋）', '4000--公斤', '该生产计划新增子订单：00000006-00', 0, '2019-12-07 22:06:20');
COMMIT;

-- ----------------------------
-- Table structure for Manufacture_Result
-- ----------------------------
DROP TABLE IF EXISTS `Manufacture_Result`;
CREATE TABLE `Manufacture_Result` (
  `Manufacture_no` char(40) NOT NULL,
  `Order_no_details` varchar(255) NOT NULL,
  `Product_no` char(20) NOT NULL,
  `Staff_no_design` char(20) NOT NULL,
  `Staff_no_manufacture` char(255) NOT NULL,
  `Stock_no` char(20) NOT NULL,
  `Update_date` datetime COMMENT '创建时间',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Manufacture_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Manufacture_Result
-- ----------------------------
BEGIN;
INSERT INTO `Manufacture_Result` VALUES ('0000000001', '', '', '', '', '23', '2019-11-16 12:45:57', 1);
INSERT INTO `Manufacture_Result` VALUES ('0000000002', '00000011-00', '0001', '000002', '000003;000004', '', '2019-11-22 00:56:40', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000003', '00000010-01；00000011-01；00000023-02；00000024-02', '0002', '00002', '车间A', '0', '2019-12-01 14:33:46', 1);
INSERT INTO `Manufacture_Result` VALUES ('0000000004', '00000021-02', '0001', '000001', '车间C', '0', '2019-12-01 14:14:59', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000005', '00000021-02；00000023-01', '0001', '000001', '车间C', '0', '2019-12-01 14:30:41', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000006', '00000022-02', '0002', '000001', '车间C', '0', '2019-12-01 14:18:50', 1);
INSERT INTO `Manufacture_Result` VALUES ('0000000007', '00000006-00；00000004-00', '0001', '000002', '车间A', '0', '2019-12-02 23:20:12', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000008', '00000009-00；00000011-00', '0001', '000001', '去吧，皮卡丘！', '0', '2019-12-04 23:53:54', 0);
INSERT INTO `Manufacture_Result` VALUES ('0000000009', '00000005-00；00000006-00', '0001', '', '', '0', '2019-12-05 00:05:12', 0);
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
INSERT INTO `Order_Details` VALUES ('00000002-01', '0002', '2000--箱', '000002', '2019-11-24 02:19:42', '2019-12-23 02:19:42', 1, 1);
INSERT INTO `Order_Details` VALUES ('00000002-02', '0001', '6000--箱', '000002', '2019-11-19 15:49:11', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000003-00', '0001', '2000--公斤', '000001', '2020-02-19 15:49:11', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000003-01', '0002', '500--车', '000001', '2019-11-24 15:49:11', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000004-00', '0001', '2000--公斤', '000001', '2020-02-19 16:39:35', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000004-01', '0002', '500--车', '000001', '2019-11-24 16:39:35', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000005-00', '0001', '2000--公斤', '000001', '2020-03-06 00:04:52', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000005-01', '0002', '500--车', '000001', '2019-11-24 16:40:46', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000006-00', '0001', '2000--公斤', '000001', '2020-03-03 23:19:16', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000006-01', '0002', '500--车', '000001', '2019-11-24 16:46:03', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000007-00', '0001', '2000--公斤', '000001', '2020-02-19 16:52:26', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000007-01', '0002', '500--车', '000001', '2019-11-24 16:52:26', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000008-00', '0001', '2000--公斤', '000001', '2020-02-19 16:55:16', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000008-01', '0002', '500--车', '000001', '2019-11-23 02:19:43', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000009-00', '0001', '2000--公斤', '000001', '2020-03-05 23:52:09', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000009-01', '0002', '500--车', '000001', '2019-11-24 17:03:06', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000010-00', '0001', '2000--公斤', '000001', '2020-02-19 17:16:09', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000010-01', '0002', '500--车', '000001', '2019-12-07 12:40:53', NULL, 1, 0);
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
INSERT INTO `Order_Details` VALUES ('00000018-00', '0001', '2000--公斤', '000001', '2020-02-19 20:59:36', NULL, 2, 0);
INSERT INTO `Order_Details` VALUES ('00000018-01', '0002', '500--车', '000001', '2019-11-24 20:59:36', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000019-00', '0001', '2000--公斤', '000001', '2020-02-19 21:03:42', NULL, 2, 0);
INSERT INTO `Order_Details` VALUES ('00000019-01', '0002', '500--车', '000001', '2019-11-24 21:03:42', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000020-01', '0002', '222--公斤', '000001', '2019-12-05 07:52:29', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000020-02', '0001', '333--公斤', '000001', '2020-02-29 07:52:29', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000021-02', '0001', '564--公斤', '000001', '2020-03-02 14:18:09', NULL, -1, 0);
INSERT INTO `Order_Details` VALUES ('00000022-01', '0001', '33--公斤', '000001', '2020-02-29 07:57:48', NULL, -3, 0);
INSERT INTO `Order_Details` VALUES ('00000022-02', '0002', '675745--公斤', '000001', '2019-12-07 14:18:49', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000023-01', '0001', '45--公斤', '000001', '2020-02-29 08:10:12', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000023-02', '0002', '44--公斤', '000001', '2019-12-05 08:10:12', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000024-01', '0001', '23--公斤', '000001', '2020-02-29 02:14:01', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000024-02', '0002', '444--公斤', '000001', '2019-12-05 02:14:01', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000025-01', '0001', '34--公斤', '000001', '2020-02-29 16:22:03', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000026-01', '0002', '342--公斤', '000001', '2019-12-05 16:26:23', NULL, 2, 0);
INSERT INTO `Order_Details` VALUES ('00000027-01', '0001', '43--箱', '000001', '2020-02-29 16:26:50', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000028-01', '0002', '33--个', '000001', '2019-12-05 16:28:22', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000029-01', '0001', '999--克', '000001', '2020-02-29 16:28:31', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000030-01', '0001', '545--车', '000001', '2020-02-29 16:28:43', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000030-02', '0002', '86--克', '000001', '2019-12-05 16:28:43', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000031-01', '0003', '23--打', '000001', '2019-12-05 20:48:40', NULL, 1, 1);
INSERT INTO `Order_Details` VALUES ('00000032-01', '0001', '33--公斤', '000001', '2020-03-04 22:04:26', NULL, 2, 0);
INSERT INTO `Order_Details` VALUES ('00000032-02', '0002', '23--公斤', '000001', '2019-12-09 22:04:26', NULL, 2, 0);
INSERT INTO `Order_Details` VALUES ('00000032-03', '0003', '445--公斤', '000001', '2019-12-05 22:04:26', NULL, 2, 0);
INSERT INTO `Order_Details` VALUES ('00000033-01', '0001', '23--公斤', '000002', '2020-03-04 22:29:58', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000033-02', '0002', '44--公斤', '000002', '2019-12-09 22:29:58', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000033-03', '0003', '323--公斤', '000002', '2019-12-05 22:29:58', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000034-01', '0003', '43--公斤', '000001', '2019-12-05 22:38:47', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000035-01', '0001', '23--吨', '000001', '2020-03-08 16:05:31', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000035-02', '0002', '44--公斤', '000001', '2019-12-13 16:05:31', NULL, 1, 0);
INSERT INTO `Order_Details` VALUES ('00000035-03', '0003', '23--包', '000001', '2019-12-09 16:05:31', NULL, 1, 0);
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
  `Update_date` datetime COMMENT '创建时间',
  PRIMARY KEY (`Order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order_Form
-- ----------------------------
BEGIN;
INSERT INTO `Order_Form` VALUES ('00000001', '000001', '000001', '2019-11-16 16:19:12', 900, '退款商谈阶段', 322, 0, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000002', '000002', '000003', '2019-11-23 02:19:42', 0, '订单终止', 1100, 1, 0, '2019-12-05 18:42:06');
INSERT INTO `Order_Form` VALUES ('00000003', '000001', '000002', '2019-11-18 15:49:11', 1450000, '退款商谈阶段', 1450000, 1, 0, '2019-12-05 19:02:08');
INSERT INTO `Order_Form` VALUES ('00000004', '000001', '', '2019-11-18 16:39:35', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000005', '000001', '', '2019-11-18 16:40:46', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000006', '000001', '', '2019-11-18 16:46:03', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000007', '000001', '', '2019-11-18 16:52:26', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000008', '000001', '', '2019-11-18 16:55:16', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000009', '000001', '', '2019-11-18 17:03:06', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000010', '000001', '', '2019-11-18 17:16:09', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000011', '000001', '', '2019-11-18 17:41:53', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000012', '000001', '', '2019-11-18 17:50:45', 1450000, '客户提交成功', 145000, 1, 1, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000013', '000001', '', '2019-11-18 17:55:22', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000014', '000001', '', '2019-11-18 20:13:10', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000015', '000001', '', '2019-11-18 20:24:41', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000016', '000001', '', '2019-11-18 20:56:23', 1450000, '销售员接单', 145000, 1, 0, '2019-12-03 22:07:28');
INSERT INTO `Order_Form` VALUES ('00000017', '000001', '', '2019-11-18 20:57:44', 1450000, '客户提交成功', 145000, 1, 0, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000018', '000001', '', '2019-11-18 20:59:36', 1450000, '客户提交成功', 145000, 0, 1, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000019', '000001', '', '2019-11-18 21:03:42', 1450000, '客户提交成功', 145000, 1, 1, '2019-12-03 21:58:22');
INSERT INTO `Order_Form` VALUES ('00000020', '000001', '', '2019-11-29 07:52:29', 310800, '客户提交成功', 31080, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000021', '000001', '', '2019-11-29 07:56:59', 3715400, '客户提交成功', 371540, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000022', '000001', '', '2019-11-29 07:57:48', 337892300, '客户提交成功', 33789230, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000023', '000001', '', '2019-11-29 08:10:12', 49000, '客户提交成功', 4900, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000024', '000001', '', '2019-11-29 02:14:01', 235800, '客户提交成功', 23580, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000025', '000001', '', '2019-11-29 16:22:03', 20400, '会计初审完成', 2222, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000026', '000001', '', '2019-11-29 16:26:23', 171000, '尾款缴纳成功', 17100, 1, 0, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000027', '000001', '', '2019-11-29 16:26:50', 25800, '售后服务', 2580, 1, 0, '2019-12-03 22:07:34');
INSERT INTO `Order_Form` VALUES ('00000028', '000001', '', '2019-11-29 16:28:22', 16500, '订单终止', 34222, 1, 1, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000029', '000001', '000002', '2019-11-29 16:28:31', 599400, '订单终止', 59940, 1, 1, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000030', '000001', '', '2019-11-29 16:28:43', 370000, '客户提交成功', 37000, 1, 1, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000031', '000001', '', '2019-12-03 20:48:40', 460, '订单终止', 0, 1, 1, '2019-12-03 21:40:12');
INSERT INTO `Order_Form` VALUES ('00000032', '000001', '', '2019-12-03 22:04:26', 40200, '生产计划与车间工作中', 0, 1, 0, '2019-12-03 22:10:43');
INSERT INTO `Order_Form` VALUES ('00000033', '000002', '', '2019-12-03 22:29:58', 42260, '客户提交成功', 0, 1, 0, '2019-12-03 22:29:58');
INSERT INTO `Order_Form` VALUES ('00000034', '000001', '', '2019-12-03 22:38:47', 860, '客户提交成功', 0, 1, 0, '2019-12-03 22:38:46');
INSERT INTO `Order_Form` VALUES ('00000035', '000001', '', '2019-12-07 16:05:31', 36260, '客户提交成功', 0, 1, 0, '2019-12-07 16:05:31');
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
INSERT INTO `Payment` VALUES ('0000000002', '00000002', '000001', 80, '预付款', '2019-12-03 19:37:43', 0);
INSERT INTO `Payment` VALUES ('0000000003', '00000002', '000002', -300, '退款', '2019-12-03 20:24:22', 0);
INSERT INTO `Payment` VALUES ('0000000004', '00000002', '000002', -300, '退款', '2019-12-03 20:28:34', 0);
INSERT INTO `Payment` VALUES ('0000000005', '00000001', '', -222, '退款', '2019-12-03 20:29:03', 0);
INSERT INTO `Payment` VALUES ('0000000006', '00000002', '', 500, '违约金', '2019-12-03 20:30:24', 0);
INSERT INTO `Payment` VALUES ('0000000007', '00000003', '000001', 500, '补款', '2019-12-05 19:00:55', 0);
INSERT INTO `Payment` VALUES ('0000000008', '00000003', '000001', 145000, '补款', '2019-12-05 19:01:25', 0);
INSERT INTO `Payment` VALUES ('0000000009', '00000003', '000002', 1304500, '尾款', '2019-12-05 19:02:09', 0);
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
INSERT INTO `Product_Criteria` VALUES ('0001', '小面包', '焙烤食品', '每单位：00041（30%，7--公斤）；00023（70%，90--袋）', '3--月', '12--月', 600, 0);
INSERT INTO `Product_Criteria` VALUES ('0002', '巧克力', '可可制品、巧克力和巧克力制品、以及糖果', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '5--天', '3--年', 500, 0);
INSERT INTO `Product_Criteria` VALUES ('0003', '章鱼小丸子', '水产品及其制品', '每单位：00071（50%，12--个）；00014（20%，6--毫升）；00035（30%，15--根）', '1--天', '3--天', 20, 0);
INSERT INTO `Product_Criteria` VALUES ('0004', '烤冷面', '脂肪、油和乳化脂肪制品', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '1--天', '1--天', 30, 0);
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
INSERT INTO `Product_Warehouse` VALUES ('00000001', '0001', '000002', '000003', '第一仓库', '2019-11-21 10:27:00', '300--千克', '114t3t3', 0);
INSERT INTO `Product_Warehouse` VALUES ('00000002', '0001', '000002', '000003', '第一仓库', '2019-11-01 10:27:00', '300--千克', '22', 0);
COMMIT;

-- ----------------------------
-- Table structure for Raw_Materials_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Raw_Materials_Criteria`;
CREATE TABLE `Raw_Materials_Criteria` (
  `Material_no` char(40) NOT NULL,
  `Material_name` char(100) NOT NULL,
  `Material_type` char(100) NOT NULL,
  `Guarantee_period` char(20) NOT NULL COMMENT '数字+单位',
  `flag` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Material_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Raw_Materials_Criteria
-- ----------------------------
BEGIN;
INSERT INTO `Raw_Materials_Criteria` VALUES ('00001', '面粉', '谷物类', '3--年', 0);
INSERT INTO `Raw_Materials_Criteria` VALUES ('00002', '鸡蛋', '蛋白类', '7--天', 0);
INSERT INTO `Raw_Materials_Criteria` VALUES ('00003', '牛奶', '乳制品', '30--天', 0);
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
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000001', '00002', '000001', '巨魔蘸酱', '2019-11-09 11:32:46', '334--百瓶', '奥利给', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000002', '00001', '', '大山食品厂----10086号厂房', '2019-11-21 11:33:21', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000003', '00001', '', '大山食品厂----10086号厂房', '2019-11-21 18:33:55', '500--升', '', 0);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000004', '00001', 'ztm', '士大夫', '2019-12-07 22:21:05', '500--公斤', '算法', 0);
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
INSERT INTO `Refund_Application` VALUES ('0000000001', '', '', '', '', '', 0, 0, 1);
INSERT INTO `Refund_Application` VALUES ('0000000002', '00000002', '000002', '（该用户未填写原因）', '000002', '提交成功', 1, 300, 0);
INSERT INTO `Refund_Application` VALUES ('0000000003', '00000001', '000001', '（该用户未填写原因）', '', '提交成功', 0, 222, 0);
INSERT INTO `Refund_Application` VALUES ('0000000004', '00000003', '000001', '（该用户未填写原因）', '', '提交成功', 1, -500, 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of Staff
-- ----------------------------
BEGIN;
INSERT INTO `Staff` VALUES (63, 'ztm', 'ztm', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 1, 0, '', NULL, 0);
INSERT INTO `Staff` VALUES (64, '张三', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '352634', NULL, '5646@163.com', '56547', 1, 0, 0, '', NULL, 0);
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
INSERT INTO `Staff` VALUES (134, '201700800498', '201700800498', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for Unit
-- ----------------------------
DROP TABLE IF EXISTS `Unit`;
CREATE TABLE `Unit` (
  `Unit_no` char(10) NOT NULL,
  `Unit_name` char(20) DEFAULT NULL,
  `Unit_name_en` char(20) DEFAULT NULL,
  `Unit_rate` char(20) DEFAULT NULL,
  `Default_type` char(20) DEFAULT NULL,
  `Food_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Unit_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Unit
-- ----------------------------
BEGIN;
INSERT INTO `Unit` VALUES ('001', '公斤', 'kg', '1:1', '公斤', '脂肪、油和乳化脂肪制品；水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；粮食和粮食制品；焙烤食品；蛋及蛋制品；肉及肉制品；水产品及其制品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('002', '公升', 'L', '1:1', '公升', '乳与乳制品；冷冻饮品；饮料类；酒类；粮食和粮食制品；焙烤食品；脂肪、油和乳化脂肪制品；特殊营养食品；其他类；甜味料；调味品');
INSERT INTO `Unit` VALUES ('003', '毫升', 'ml', '1000:1', '毫升', '乳与乳制品；冷冻饮品；饮料类；酒类；粮食和粮食制品；焙烤食品；脂肪、油和乳化脂肪制品；甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('004', '箱', 'trunk', '30:1', '个', '乳与乳制品；冷冻饮品；饮料类；酒类；水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；粮食和粮食制品；焙烤食品；蛋及蛋制品；肉及肉制品；水产品及其制品；甜味料；调味品；特殊营养食品；其他类；脂肪、油和乳化脂肪制品');
INSERT INTO `Unit` VALUES ('005', '罐', 'tin', '3:2', '公升', '乳与乳制品；冷冻饮品；饮料类；酒类；甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('006', '磅', 'pound', '9:20', '公斤', '乳与乳制品；冷冻饮品；饮料类；酒类；脂肪、油和乳化脂肪制品；蛋及蛋制品；肉及肉制品；水产品及其制品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('007', '盒', 'case', '20:1', '个', '乳与乳制品；冷冻饮品；饮料类；酒类；脂肪、油和乳化脂肪制品；甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('008', '瓶', 'bot', '2:1', '公升', '乳与乳制品；冷冻饮品；饮料类；酒类；脂肪、油和乳化脂肪制品；甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('009', '吨', 'ton', '1:1000', '公斤', '脂肪、油和乳化脂肪制品；水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；粮食和粮食制品；焙烤食品；蛋及蛋制品；肉及肉制品；水产品及其制品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('010', '克', 'g', '1000:1', '公斤', '脂肪、油和乳化脂肪制品；水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；粮食和粮食制品；焙烤食品；蛋及蛋制品；肉及肉制品；水产品及其制品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('011', '车', 'cl.', '1:500', '箱', '脂肪、油和乳化脂肪制品；水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；粮食和粮食制品；焙烤食品；蛋及蛋制品；肉及肉制品；水产品及其制品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('012', '根', 'bar', '1:1', '根', '水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('013', '捆', 'bundle', '1:6', '根', '水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('014', '袋', 'bag', '1:2', '公斤', '水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；粮食和粮食制品；焙烤食品；甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('015', '个', 'one', '1:1', '个', '水果、蔬菜、豆类、食用菌、藻类、坚果以及籽类；可可制品、巧克力和巧克力制品、以及糖果；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('016', '件', 'pcs', '1:1', '个', '甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('017', '包', 'pkt.', '1:10', '个', '脂肪、油和乳化脂肪制品；粮食和粮食制品；焙烤食品；蛋及蛋制品；肉及肉制品；水产品及其制品；甜味料；调味品；特殊营养食品；其他类');
INSERT INTO `Unit` VALUES ('018', '打', 'dozen', '1:12', '个', '蛋及蛋制品；肉及肉制品；水产品及其制品；特殊营养食品；其他类');
COMMIT;

-- ----------------------------
-- View structure for popularity_products
-- ----------------------------
DROP VIEW IF EXISTS `popularity_products`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `popularity_products` AS select `order_details`.`Product_no` AS `Product_no`,count(`order_details`.`Product_no`) AS `count(Order_Details.Product_no)` from `order_details` group by `order_details`.`Product_no` order by count(`order_details`.`Product_no`) desc;

-- ----------------------------
-- Triggers structure for table Manufacture_Design
-- ----------------------------
DROP TRIGGER IF EXISTS `update_manufacture_design_time`;
delimiter ;;
CREATE TRIGGER `update_manufacture_design_time` BEFORE UPDATE ON `Manufacture_Design` FOR EACH ROW BEGIN
    SET new.Update_date =now()
    ;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Manufacture_Result
-- ----------------------------
DROP TRIGGER IF EXISTS `update_manufacture_result_time`;
delimiter ;;
CREATE TRIGGER `update_manufacture_result_time` BEFORE UPDATE ON `Manufacture_Result` FOR EACH ROW BEGIN
    SET new.Update_date =now()
    ;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Order_Form
-- ----------------------------
DROP TRIGGER IF EXISTS `update_order_form_time`;
delimiter ;;
CREATE TRIGGER `update_order_form_time` BEFORE UPDATE ON `Order_Form` FOR EACH ROW BEGIN
    SET new.Update_date =now()
    ;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
