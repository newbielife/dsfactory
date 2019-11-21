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

 Date: 21/11/2019 22:59:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Client
-- ----------------------------
DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
  `Client_no` char(20) NOT NULL,
  `Client_name` char(30) DEFAULT NULL,
  `Password` char(50) DEFAULT NULL,
  `Client_type` char(10) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL,
  PRIMARY KEY (`Client_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Client
-- ----------------------------
BEGIN;
INSERT INTO `Client` VALUES ('000001', '425', '21', 'VIP10', 35, '2425');
INSERT INTO `Client` VALUES ('000002', '虚拟用户A', '827ccb0eea8a706c4c34a16891f84e7b', 'VIP01', 20, '（该客户无详细资料介绍）');
INSERT INTO `Client` VALUES ('000003', '虚拟用户A', 'e10adc3949ba59abbe56e057f20f883e', 'VIP10', 40, '（该客户无详细资料介绍）');
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
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of DS_functions
-- ----------------------------
BEGIN;
INSERT INTO `DS_functions` VALUES (1, '0001', '系统管理', '0', '', b'1', '0910', b'1', '电脑版', '', 'icon-settings', '0');
INSERT INTO `DS_functions` VALUES (13, '000102', '角色管理', '0001', '/pages/manage/role.html', b'0', '0130', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (14, '000103', '用户管理', '0001', '/pages/manage/user.html', b'0', '0140', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (15, '000104', '日志管理', '0001', '/pages/manage/log.html', b'0', '0160', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (16, '000105', '功能管理', '0001', '/pages/manage/functions.html', b'0', '0135', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (21, '0101', '商品管理', '0', '', b'0', '0620', b'1', '电脑版', NULL, 'icon-social-dropbox', '0');
INSERT INTO `DS_functions` VALUES (22, '010101', '商品类别', '0101', '/pages/materials/materialcategory.html', b'0', '0230', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (23, '010102', '商品信息', '0101', '/pages/materials/material.html', b'0', '0240', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (24, '0102', '基本资料', '0', '', b'0', '0750', b'1', '电脑版', NULL, 'icon-grid', '0');
INSERT INTO `DS_functions` VALUES (26, '010202', '仓库信息', '0102', '/pages/manage/depot.html', b'0', '0270', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (31, '010206', '经手人管理', '0102', '/pages/materials/person.html', b'0', '0284', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (32, '0502', '采购管理', '0', '', b'0', '0230', b'1', '电脑版', '', 'icon-loop', '0');
INSERT INTO `DS_functions` VALUES (33, '050201', '采购入库', '0502', '/pages/materials/purchase_in_list.html', b'0', '0340', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (38, '0603', '销售管理', '0', '', b'0', '0290', b'1', '电脑版', '', 'icon-briefcase', '0');
INSERT INTO `DS_functions` VALUES (41, '060303', '销售出库', '0603', '/pages/materials/sale_out_list.html', b'0', '0394', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (44, '0704', '财务管理', '0', '', b'0', '0450', b'1', '电脑版', '', 'icon-map', '0');
INSERT INTO `DS_functions` VALUES (59, '040106', '库存状况', '0401', '/pages/reports/in_out_stock_report.html', b'0', '0600', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (194, '010204', '收支项目', '0102', '/pages/manage/inOutItem.html', b'0', '0282', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (195, '010205', '结算账户', '0102', '/pages/manage/account.html', b'0', '0283', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (198, '0301', '生产车间管理', '0', '', b'0', '0570', b'1', '电脑版', NULL, 'icon-pie-chart', '0');
INSERT INTO `DS_functions` VALUES (200, '060305', '销售退货', '0603', '/pages/materials/sale_back_list.html', b'0', '0396', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (201, '080103', '食品入库', '0801', '/pages/materials/other_in_list.html', b'0', '0803', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (202, '080105', '食品出库', '0801', '/pages/materials/other_out_list.html', b'0', '0805', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (204, '070404', '收款单', '0704', '/pages/financial/money_in.html', b'0', '0475', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (206, '070406', '退款单', '0704', '/pages/financial/giro.html', b'0', '0490', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (207, '070412', '结算账户', '0704', '/pages/reports/account_report.html', b'0', '0610', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (209, '060304', '销售统计', '0603', '/pages/reports/sale_out_report.html', b'0', '0630', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (210, '040102', '生产计划制定', '0401', '/pages/materials/retail_out_list.html', b'0', '0405', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (211, '040104', '生产计划查询', '0401', '/pages/materials/retail_back_list.html', b'0', '0407', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (217, '01020102', '客户信息', '0102', '/pages/manage/customer.html', b'0', '0262', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (218, '01020103', '会员信息', '0102', '/pages/manage/member.html', b'0', '0263', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (219, '000107', '资产管理', '0001', '/pages/asset/asset.html', b'0', '0170', b'0', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (220, '010103', '计量单位', '0101', '/pages/manage/unit.html', b'0', '0245', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (225, '0401', '生产计划管理', '0', '', b'0', '0101', b'1', '电脑版', '', 'icon-present', '0');
INSERT INTO `DS_functions` VALUES (226, '030106', '入库明细', '0301', '/pages/reports/in_detail.html', b'0', '0640', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (227, '030107', '出库明细', '0301', '/pages/reports/out_detail.html', b'0', '0645', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (228, '030108', '入库汇总', '0301', '/pages/reports/in_material_count.html', b'0', '0650', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (229, '030109', '出库汇总', '0301', '/pages/reports/out_material_count.html', b'0', '0655', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (232, '080109', '食品配料单', '0801', '/pages/materials/assemble_list.html', b'0', '0809', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (234, '000105', '系统配置', '0001', '/pages/manage/systemConfig.html', b'0', '0165', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (235, '070408', '客户对账', '0704', '/pages/reports/customer_account.html', b'0', '0410', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (236, '000106', '商品属性', '0001', '/pages/materials/materialProperty.html', b'0', '0168', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (239, '0801', '仓库管理', '0', '', b'0', '0420', b'1', '电脑版', '', 'icon-layers', '0');
INSERT INTO `DS_functions` VALUES (240, '010104', '序列号', '0101', '/pages/manage/serialNumber.html', b'0', '0246', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (242, '060301', '销售订单', '0603', '/pages/materials/sale_orders_list.html', b'0', '0392', b'1', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (243, '000108', '机构管理', '0001', '/pages/manage/organization.html', b'1', '0139', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `DS_functions` VALUES (244, '080112', '库存预警', '0801', '/pages/reports/stock_warning_report.html', b'0', '0812', b'1', '电脑版', '', 'icon-notebook', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=6514 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of DS_log
-- ----------------------------
BEGIN;
INSERT INTO `DS_log` VALUES (1722, 63, '登录系统', '192.168.1.104', '2016-11-27 13:17:17', 0, '管理用户：jsh 登录系统', 'jsh 登录系统', NULL);
INSERT INTO `DS_log` VALUES (1723, 63, '登录系统', '192.168.1.104', '2016-11-27 13:17:30', 0, '管理用户：jsh 登录系统', 'jsh 登录系统', NULL);
INSERT INTO `DS_log` VALUES (1724, 63, '退出系统', '192.168.1.104', '2016-11-27 13:17:48', 0, '管理用户：jsh 退出系统', 'jsh 退出系统', NULL);
INSERT INTO `DS_log` VALUES (1725, 65, '登录系统', '192.168.1.104', '2016-11-27 13:17:52', 0, '管理用户：ls 登录系统', 'ls 登录系统', NULL);
INSERT INTO `DS_log` VALUES (1726, 65, '退出系统', '192.168.1.104', '2016-11-27 13:18:18', 0, '管理用户：ls 退出系统', 'ls 退出系统', NULL);
INSERT INTO `DS_log` VALUES (1727, 63, '登录系统', '192.168.1.104', '2016-11-27 13:18:22', 0, '管理用户：jsh 登录系统', 'jsh 登录系统', NULL);
INSERT INTO `DS_log` VALUES (1728, 63, '更新UserBusiness', '192.168.1.104', '2016-11-27 13:18:44', 0, '更新UserBusiness的ID为  6 成功！', '更新UserBusiness成功', NULL);
INSERT INTO `DS_log` VALUES (1729, 63, '退出系统', '192.168.1.104', '2016-11-27 13:18:48', 0, '管理用户：jsh 退出系统', 'jsh 退出系统', NULL);
INSERT INTO `DS_log` VALUES (1730, 65, '登录系统', '192.168.1.104', '2016-11-27 13:18:53', 0, '管理用户：ls 登录系统', 'ls 登录系统', NULL);
INSERT INTO `DS_log` VALUES (1731, 63, '登录系统', '192.168.1.104', '2016-12-04 10:38:50', 0, '管理用户：jsh 登录系统', 'jsh 登录系统', NULL);
INSERT INTO `DS_log` VALUES (1732, 63, '增加物料', '192.168.1.104', '2016-12-04 10:40:52', 0, '增加物料名称为  11 成功！', '增加物料成功', NULL);
INSERT INTO `DS_log` VALUES (1733, 63, '更新物料', '192.168.1.104', '2016-12-04 10:59:57', 0, '更新物料ID为  499 成功！', '更新物料成功', NULL);
INSERT INTO `DS_log` VALUES (1734, 63, '更新物料', '192.168.1.104', '2016-12-04 11:00:13', 0, '更新物料ID为  499 成功！', '更新物料成功', NULL);
INSERT INTO `DS_log` VALUES (1735, 63, '删除物料', '192.168.1.104', '2016-12-04 11:00:38', 0, '删除物料ID为  499 成功！', '删除物料成功', NULL);
INSERT INTO `DS_log` VALUES (1736, 63, '增加物料', '192.168.1.104', '2016-12-04 11:02:35', 0, '增加物料名称为  11 成功！', '增加物料成功', NULL);
INSERT INTO `DS_log` VALUES (1737, 63, '批量删除物料', '192.168.1.104', '2016-12-04 11:02:41', 0, '批量删除物料ID为  500 成功！', '批量删除物料成功', NULL);
INSERT INTO `DS_log` VALUES (1738, 63, '更新功能', '192.168.1.104', '2016-12-04 11:04:43', 0, '更新功能ID为  26 成功！', '更新功能成功', NULL);
INSERT INTO `DS_log` VALUES (1739, 63, '增加供应商', '192.168.1.104', '2016-12-04 11:38:13', 0, '增加供应商名称为  aa 成功！', '增加供应商成功', NULL);
INSERT INTO `DS_log` VALUES (1740, 63, '增加供应商', '192.168.1.104', '2016-12-04 11:48:36', 0, '增加供应商名称为  aaaa 成功！', '增加供应商成功', NULL);
INSERT INTO `DS_log` VALUES (1741, 63, '删除供应商', '192.168.1.104', '2016-12-04 11:48:53', 0, '删除供应商ID为  3,名称为  aa成功！', '删除供应商成功', NULL);
INSERT INTO `DS_log` VALUES (1742, 63, '更新供应商', '192.168.1.104', '2016-12-04 11:48:59', 0, '更新供应商ID为  4 成功！', '更新供应商成功', NULL);
INSERT INTO `DS_log` VALUES (5852, 63, '单据', '127.0.0.1', '2019-03-09 15:49:57', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5853, 63, '商品', '127.0.0.1', '2019-03-09 15:50:31', 0, '新增商品', '新增商品', NULL);
INSERT INTO `DS_log` VALUES (5854, 63, '商品', '127.0.0.1', '2019-03-09 15:50:49', 0, '更新,id:563商品', '更新,id:563商品', NULL);
INSERT INTO `DS_log` VALUES (5855, 63, '单据', '127.0.0.1', '2019-03-09 15:52:06', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5856, 63, '单据', '127.0.0.1', '2019-03-09 15:52:21', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5857, 63, '单据', '127.0.0.1', '2019-03-09 15:53:07', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5858, 63, '单据', '127.0.0.1', '2019-03-09 15:57:26', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5859, 63, '商品', '127.0.0.1', '2019-03-09 16:00:18', 0, '更新,id:562商品', '更新,id:562商品', NULL);
INSERT INTO `DS_log` VALUES (5860, 63, '商品', '127.0.0.1', '2019-03-09 16:01:17', 0, '更新,id:562商品', '更新,id:562商品', NULL);
INSERT INTO `DS_log` VALUES (5861, 63, '单据', '127.0.0.1', '2019-03-09 16:02:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5862, 63, '功能', '127.0.0.1', '2019-03-09 16:10:29', 0, '更新,id:241功能', '更新,id:241功能', NULL);
INSERT INTO `DS_log` VALUES (5863, 63, '单据', '127.0.0.1', '2019-03-09 16:27:38', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5864, 63, '单据', '127.0.0.1', '2019-03-09 16:35:53', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5865, 63, '单据', '127.0.0.1', '2019-03-09 16:37:34', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5866, 63, '单据', '127.0.0.1', '2019-03-09 16:38:03', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5867, 63, '商品', '127.0.0.1', '2019-03-09 16:54:36', 0, '更新,id:563商品', '更新,id:563商品', NULL);
INSERT INTO `DS_log` VALUES (5868, 63, '单据', '127.0.0.1', '2019-03-09 22:35:21', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5869, 63, '单据', '127.0.0.1', '2019-03-09 23:13:40', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5870, 63, '单据', '127.0.0.1', '2019-03-09 23:19:15', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5871, 63, '单据', '127.0.0.1', '2019-03-09 23:27:52', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5872, 63, '单据', '127.0.0.1', '2019-03-09 23:28:43', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5873, 63, '单据', '127.0.0.1', '2019-03-09 23:32:57', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5874, 63, '单据', '127.0.0.1', '2019-03-09 23:35:07', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5875, 63, '单据', '127.0.0.1', '2019-03-09 23:38:10', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5876, 63, '单据', '127.0.0.1', '2019-03-09 23:39:46', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5877, 63, '单据', '127.0.0.1', '2019-03-10 15:48:42', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5878, 63, '单据', '127.0.0.1', '2019-03-10 15:54:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5879, 63, '单据', '127.0.0.1', '2019-03-10 15:56:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5880, 63, '单据', '127.0.0.1', '2019-03-10 16:05:10', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5881, 63, '单据', '127.0.0.1', '2019-03-10 16:46:13', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5882, 63, '单据', '127.0.0.1', '2019-03-10 16:47:04', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5883, 63, '单据', '127.0.0.1', '2019-03-10 17:00:25', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5884, 63, '单据', '127.0.0.1', '2019-03-10 17:40:13', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5885, 63, '单据', '127.0.0.1', '2019-03-10 17:42:11', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5886, 63, '单据', '127.0.0.1', '2019-03-10 17:44:49', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5887, 63, '单据', '127.0.0.1', '2019-03-10 17:47:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5888, 63, '单据', '127.0.0.1', '2019-03-10 17:48:28', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5889, 63, '单据', '127.0.0.1', '2019-03-10 17:49:51', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5890, 63, '单据', '127.0.0.1', '2019-03-10 17:50:19', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5891, 63, '单据', '127.0.0.1', '2019-03-10 18:13:00', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5892, 63, '单据', '127.0.0.1', '2019-03-10 18:16:25', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5893, 63, '单据', '127.0.0.1', '2019-03-10 18:24:54', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5894, 63, '单据', '127.0.0.1', '2019-03-10 18:30:56', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5895, 63, '单据', '127.0.0.1', '2019-03-10 18:43:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5896, 63, '单据', '127.0.0.1', '2019-03-10 19:19:45', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5897, 63, '单据', '127.0.0.1', '2019-03-10 19:21:56', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5898, 63, '单据', '127.0.0.1', '2019-03-10 20:00:11', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5899, 63, '单据', '127.0.0.1', '2019-03-10 20:02:01', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5900, 63, '单据', '127.0.0.1', '2019-03-10 20:02:33', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5901, 63, '仓库', '127.0.0.1', '2019-03-15 23:02:54', 0, '更新,id:2仓库', '更新,id:2仓库', NULL);
INSERT INTO `DS_log` VALUES (5902, 63, '仓库', '127.0.0.1', '2019-03-15 23:03:55', 0, '更新,id:2仓库', '更新,id:2仓库', NULL);
INSERT INTO `DS_log` VALUES (5903, 63, '仓库', '127.0.0.1', '2019-03-15 23:04:10', 0, '更新,id:1仓库', '更新,id:1仓库', NULL);
INSERT INTO `DS_log` VALUES (5904, 63, '仓库', '127.0.0.1', '2019-03-15 23:04:15', 0, '更新,id:3仓库', '更新,id:3仓库', NULL);
INSERT INTO `DS_log` VALUES (5905, 63, '单据', '127.0.0.1', '2019-03-15 23:05:40', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5906, 63, '单据', '127.0.0.1', '2019-03-15 23:06:22', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5907, 63, '单据', '127.0.0.1', '2019-03-15 23:06:52', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5908, 63, '单据', '127.0.0.1', '2019-03-15 23:08:18', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5909, 63, '单据', '127.0.0.1', '2019-03-15 23:08:33', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5910, 63, '计量单位', '127.0.0.1', '2019-03-15 23:12:39', 0, '新增计量单位', '新增计量单位', NULL);
INSERT INTO `DS_log` VALUES (5911, 63, '单据', '127.0.0.1', '2019-03-15 23:15:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5912, 63, '角色', '0:0:0:0:0:0:0:1', '2019-03-17 21:37:05', 0, '新增角色', '新增角色', NULL);
INSERT INTO `DS_log` VALUES (5913, 63, '角色', '0:0:0:0:0:0:0:1', '2019-03-17 23:26:30', 0, '新增角色', '新增角色', NULL);
INSERT INTO `DS_log` VALUES (5914, 63, '商家', '127.0.0.1', '2019-03-18 22:38:21', 0, '新增商家', '新增商家', 1);
INSERT INTO `DS_log` VALUES (5915, 63, '商家', '127.0.0.1', '2019-03-18 22:38:33', 0, '新增商家', '新增商家', 1);
INSERT INTO `DS_log` VALUES (5916, 63, '仓库', '127.0.0.1', '2019-03-18 22:38:39', 0, '新增仓库', '新增仓库', 1);
INSERT INTO `DS_log` VALUES (5917, 63, '账户', '127.0.0.1', '2019-03-18 22:38:58', 0, '新增账户', '新增账户', 1);
INSERT INTO `DS_log` VALUES (5918, 63, '经手人', '127.0.0.1', '2019-03-18 22:45:08', 0, '新增经手人', '新增经手人', 1);
INSERT INTO `DS_log` VALUES (5919, 63, '商品', '127.0.0.1', '2019-03-18 23:07:31', 0, '新增商品', '新增商品', 1);
INSERT INTO `DS_log` VALUES (5920, 63, '商家', '127.0.0.1', '2019-03-18 23:38:47', 0, '新增商家', '新增商家', 1);
INSERT INTO `DS_log` VALUES (5921, 63, '收支项目', '127.0.0.1', '2019-03-18 23:39:09', 0, '新增收支项目', '新增收支项目', 1);
INSERT INTO `DS_log` VALUES (5922, 63, '计量单位', '127.0.0.1', '2019-03-18 23:49:08', 0, '新增计量单位', '新增计量单位', 1);
INSERT INTO `DS_log` VALUES (5923, 63, '关联关系', '127.0.0.1', '2019-03-18 23:49:31', 0, '新增关联关系', '新增关联关系', 1);
INSERT INTO `DS_log` VALUES (5924, 63, '商家', '127.0.0.1', '2019-03-19 21:57:45', 0, '新增商家', '新增商家', 1);
INSERT INTO `DS_log` VALUES (5925, 63, '关联关系', '127.0.0.1', '2019-03-19 22:00:49', 0, '更新,id:3关联关系', '更新,id:3关联关系', 1);
INSERT INTO `DS_log` VALUES (5926, 63, '关联关系', '127.0.0.1', '2019-03-19 22:01:14', 0, '更新,id:7关联关系', '更新,id:7关联关系', 1);
INSERT INTO `DS_log` VALUES (5927, 63, '关联关系', '127.0.0.1', '2019-03-19 22:01:21', 0, '更新,id:7关联关系', '更新,id:7关联关系', 1);
INSERT INTO `DS_log` VALUES (5928, 63, '关联关系', '127.0.0.1', '2019-03-19 22:05:11', 0, '新增关联关系', '新增关联关系', 1);
INSERT INTO `DS_log` VALUES (5933, 96, '商品', '127.0.0.1', '2019-03-19 22:08:46', 0, '更新,id:564商品', '更新,id:564商品', 1);
INSERT INTO `DS_log` VALUES (5934, 96, '单据', '127.0.0.1', '2019-03-19 22:10:17', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5935, 96, '单据', '127.0.0.1', '2019-03-19 22:10:35', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5936, 96, '单据', '127.0.0.1', '2019-03-19 22:11:39', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5937, 96, '单据', '127.0.0.1', '2019-03-19 22:12:04', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5938, 96, '单据', '127.0.0.1', '2019-03-19 22:12:18', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5939, 96, '单据', '127.0.0.1', '2019-03-19 22:12:29', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5940, 96, '单据', '127.0.0.1', '2019-03-19 22:12:43', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5941, 96, '单据', '127.0.0.1', '2019-03-19 22:12:53', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5942, 96, '单据', '127.0.0.1', '2019-03-19 22:13:20', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5943, 96, '单据', '127.0.0.1', '2019-03-19 22:13:34', 0, '新增单据', '新增单据', 1);
INSERT INTO `DS_log` VALUES (5944, 96, '收支项目', '127.0.0.1', '2019-03-19 22:14:18', 0, '新增收支项目', '新增收支项目', 1);
INSERT INTO `DS_log` VALUES (5945, 96, '经手人', '127.0.0.1', '2019-03-19 22:14:33', 0, '新增经手人', '新增经手人', 1);
INSERT INTO `DS_log` VALUES (5946, 96, '财务', '127.0.0.1', '2019-03-19 22:14:50', 0, '新增财务', '新增财务', 1);
INSERT INTO `DS_log` VALUES (5947, 96, '财务', '127.0.0.1', '2019-03-19 22:15:09', 0, '新增财务', '新增财务', 1);
INSERT INTO `DS_log` VALUES (5948, 96, '财务', '127.0.0.1', '2019-03-19 22:15:22', 0, '新增财务', '新增财务', 1);
INSERT INTO `DS_log` VALUES (5949, 96, '财务', '127.0.0.1', '2019-03-19 22:15:36', 0, '新增财务', '新增财务', 1);
INSERT INTO `DS_log` VALUES (5950, 96, '财务', '127.0.0.1', '2019-03-19 22:16:04', 0, '新增财务', '新增财务', 1);
INSERT INTO `DS_log` VALUES (5951, 96, '商品', '127.0.0.1', '2019-03-19 22:35:56', 0, '新增商品', '新增商品', 1);
INSERT INTO `DS_log` VALUES (5952, 96, '商品', '127.0.0.1', '2019-03-19 22:36:03', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5953, 96, '商品', '127.0.0.1', '2019-03-19 22:36:11', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5954, 96, '商品', '127.0.0.1', '2019-03-19 22:36:24', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5955, 96, '商品', '127.0.0.1', '2019-03-19 22:37:17', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5956, 96, '商品', '127.0.0.1', '2019-03-19 22:44:12', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5957, 96, '商品', '127.0.0.1', '2019-03-19 22:44:18', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5958, 96, '商品', '127.0.0.1', '2019-03-19 22:44:23', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `DS_log` VALUES (5959, 63, '单据', '127.0.0.1', '2019-03-19 22:48:07', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5960, 63, '单据', '127.0.0.1', '2019-03-19 22:48:22', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5961, 63, '单据', '127.0.0.1', '2019-03-19 22:48:40', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5962, 63, '商家', '127.0.0.1', '2019-03-21 23:50:49', 0, '新增商家', '新增商家', NULL);
INSERT INTO `DS_log` VALUES (5963, 63, '商家', '127.0.0.1', '2019-03-21 23:51:05', 0, '批量删除,id集:51商家', '批量删除,id集:51商家', NULL);
INSERT INTO `DS_log` VALUES (5964, 63, NULL, '127.0.0.1', '2019-03-21 23:57:46', 0, '删除,id:101null', '删除,id:101null', NULL);
INSERT INTO `DS_log` VALUES (5965, 63, '单据', '127.0.0.1', '2019-03-21 23:58:56', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5966, 63, '单据', '127.0.0.1', '2019-03-21 23:59:18', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (5967, 63, '财务', '127.0.0.1', '2019-03-21 23:59:38', 0, '新增财务', '新增财务', NULL);
INSERT INTO `DS_log` VALUES (5968, 63, '角色', '127.0.0.1', '2019-03-24 23:51:47', 0, '新增角色', '新增角色', NULL);
INSERT INTO `DS_log` VALUES (5969, 63, '角色', '127.0.0.1', '2019-03-29 00:07:16', 0, '新增角色', '新增角色', NULL);
INSERT INTO `DS_log` VALUES (5970, 63, '关联关系', '127.0.0.1', '2019-03-29 00:07:21', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (5971, 63, '关联关系', '127.0.0.1', '2019-03-29 00:07:52', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (5972, 63, '关联关系', '127.0.0.1', '2019-03-29 00:08:07', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `DS_log` VALUES (5973, 63, '角色', '127.0.0.1', '2019-03-29 00:08:21', 0, '批量删除,id集:9角色', '批量删除,id集:9角色', NULL);
INSERT INTO `DS_log` VALUES (5974, 63, '角色', '127.0.0.1', '2019-03-29 00:08:24', 0, '删除,id:8角色', '删除,id:8角色', NULL);
INSERT INTO `DS_log` VALUES (5975, 63, '角色', '127.0.0.1', '2019-03-29 00:08:26', 0, '删除,id:7角色', '删除,id:7角色', NULL);
INSERT INTO `DS_log` VALUES (5976, 63, '角色', '127.0.0.1', '2019-03-29 00:08:27', 0, '删除,id:6角色', '删除,id:6角色', NULL);
INSERT INTO `DS_log` VALUES (5977, 63, '关联关系', '127.0.0.1', '2019-03-29 00:08:35', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `DS_log` VALUES (5978, 113, '角色', '127.0.0.1', '2019-03-29 00:10:02', 0, '新增角色', '新增角色', 10);
INSERT INTO `DS_log` VALUES (5979, 113, '角色', '127.0.0.1', '2019-03-29 00:11:34', 0, '新增角色', '新增角色', 113);
INSERT INTO `DS_log` VALUES (5980, 113, '角色', '127.0.0.1', '2019-03-29 00:11:39', 0, '删除,id:12角色', '删除,id:12角色', 113);
INSERT INTO `DS_log` VALUES (5981, 115, '用户', '127.0.0.1', '2019-03-31 21:18:29', 0, '新增用户', '新增用户', 115);
INSERT INTO `DS_log` VALUES (5983, 63, '用户', '127.0.0.1', '2019-03-31 21:49:38', 0, '新增用户', '新增用户', NULL);
INSERT INTO `DS_log` VALUES (5984, 63, '用户', '127.0.0.1', '2019-03-31 21:49:49', 0, '删除,id:118用户', '删除,id:118用户', NULL);
INSERT INTO `DS_log` VALUES (6026, 63, '用户', '127.0.0.1', '2019-03-31 22:18:21', 0, '修改,id:63用户', '修改,id:63用户', NULL);
INSERT INTO `DS_log` VALUES (6046, 120, '关联关系', '127.0.0.1', '2019-03-31 23:17:23', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6047, 120, '关联关系', '127.0.0.1', '2019-03-31 23:18:10', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6048, 63, '角色', '127.0.0.1', '2019-04-01 22:36:16', 0, '新增角色', '新增角色', NULL);
INSERT INTO `DS_log` VALUES (6049, 63, '关联关系', '127.0.0.1', '2019-04-01 22:36:27', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6050, 63, '关联关系', '127.0.0.1', '2019-04-01 22:36:50', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6051, 63, '关联关系', '127.0.0.1', '2019-04-01 22:37:14', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6052, 63, '关联关系', '127.0.0.1', '2019-04-01 22:39:07', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6053, 63, '关联关系', '127.0.0.1', '2019-04-01 22:39:14', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6054, 63, '关联关系', '127.0.0.1', '2019-04-01 22:39:52', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6055, 63, '关联关系', '127.0.0.1', '2019-04-01 22:41:39', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6056, 63, '关联关系', '127.0.0.1', '2019-04-01 22:49:09', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6057, 63, '关联关系', '127.0.0.1', '2019-04-01 22:49:41', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `DS_log` VALUES (6058, 63, '关联关系', '127.0.0.1', '2019-04-01 23:16:20', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6059, 63, '关联关系', '127.0.0.1', '2019-04-01 23:20:23', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6060, 63, '关联关系', '127.0.0.1', '2019-04-01 23:22:00', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6061, 63, '关联关系', '127.0.0.1', '2019-04-01 23:23:26', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6062, 63, '关联关系', '127.0.0.1', '2019-04-01 23:25:33', 0, '修改,id:45关联关系', '修改,id:45关联关系', NULL);
INSERT INTO `DS_log` VALUES (6063, 63, '关联关系', '127.0.0.1', '2019-04-01 23:34:27', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6064, 63, '关联关系', '127.0.0.1', '2019-04-01 23:39:52', 0, '修改,id:46关联关系', '修改,id:46关联关系', NULL);
INSERT INTO `DS_log` VALUES (6065, 63, '关联关系', '127.0.0.1', '2019-04-01 23:43:21', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6066, 63, '关联关系', '127.0.0.1', '2019-04-01 23:43:43', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `DS_log` VALUES (6067, 63, '关联关系', '127.0.0.1', '2019-04-01 23:43:58', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `DS_log` VALUES (6069, 63, '关联关系', '127.0.0.1', '2019-04-01 23:46:01', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `DS_log` VALUES (6070, 63, '关联关系', '127.0.0.1', '2019-04-01 23:46:26', 0, '修改,id:21关联关系', '修改,id:21关联关系', NULL);
INSERT INTO `DS_log` VALUES (6071, 63, '关联关系', '127.0.0.1', '2019-04-01 23:48:17', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `DS_log` VALUES (6072, 63, '关联关系', '127.0.0.1', '2019-04-01 23:49:09', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `DS_log` VALUES (6073, 115, '用户', '127.0.0.1', '2019-04-02 22:21:51', 0, '删除,id:116用户', '删除,id:116用户', 115);
INSERT INTO `DS_log` VALUES (6074, 115, '用户', '127.0.0.1', '2019-04-02 22:21:58', 0, '新增用户', '新增用户', 115);
INSERT INTO `DS_log` VALUES (6075, 120, '关联关系', '127.0.0.1', '2019-04-02 22:23:53', 0, '修改,id:16关联关系', '修改,id:16关联关系', NULL);
INSERT INTO `DS_log` VALUES (6076, 120, '关联关系', '127.0.0.1', '2019-04-02 22:24:16', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `DS_log` VALUES (6077, 115, '商品类型', '127.0.0.1', '2019-04-02 22:28:07', 0, '新增商品类型', '新增商品类型', 115);
INSERT INTO `DS_log` VALUES (6078, 115, '商品', '127.0.0.1', '2019-04-02 22:28:28', 0, '新增商品', '新增商品', 115);
INSERT INTO `DS_log` VALUES (6079, 115, '商家', '127.0.0.1', '2019-04-02 22:28:37', 0, '新增商家', '新增商家', 115);
INSERT INTO `DS_log` VALUES (6080, 115, '仓库', '127.0.0.1', '2019-04-02 22:28:45', 0, '新增仓库', '新增仓库', 115);
INSERT INTO `DS_log` VALUES (6081, 115, '账户', '127.0.0.1', '2019-04-02 22:28:56', 0, '新增账户', '新增账户', 115);
INSERT INTO `DS_log` VALUES (6082, 115, '账户', '127.0.0.1', '2019-04-02 22:28:57', 0, '修改,id:16账户', '修改,id:16账户', 115);
INSERT INTO `DS_log` VALUES (6083, 115, '经手人', '127.0.0.1', '2019-04-02 22:29:11', 0, '新增经手人', '新增经手人', 115);
INSERT INTO `DS_log` VALUES (6084, 115, '关联关系', '127.0.0.1', '2019-04-02 22:29:28', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `DS_log` VALUES (6085, 115, '关联关系', '127.0.0.1', '2019-04-02 22:29:46', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `DS_log` VALUES (6086, 115, '单据', '127.0.0.1', '2019-04-02 22:30:01', 0, '新增单据', '新增单据', 115);
INSERT INTO `DS_log` VALUES (6087, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:01', 0, '新增单据明细', '新增单据明细', 115);
INSERT INTO `DS_log` VALUES (6088, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:01', 0, '删除,id:单据明细', '删除,id:单据明细', 115);
INSERT INTO `DS_log` VALUES (6089, 115, '单据', '127.0.0.1', '2019-04-02 22:30:20', 0, '新增单据', '新增单据', 115);
INSERT INTO `DS_log` VALUES (6090, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:20', 0, '新增单据明细', '新增单据明细', 115);
INSERT INTO `DS_log` VALUES (6091, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:20', 0, '删除,id:单据明细', '删除,id:单据明细', 115);
INSERT INTO `DS_log` VALUES (6092, 63, '单据', '127.0.0.1', '2019-04-02 22:32:00', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6093, 63, '单据明细', '127.0.0.1', '2019-04-02 22:32:00', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6094, 63, '单据明细', '127.0.0.1', '2019-04-02 22:32:00', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6095, 63, '单据', '127.0.0.1', '2019-04-02 22:39:44', 0, '删除,id:178单据', '删除,id:178单据', NULL);
INSERT INTO `DS_log` VALUES (6096, 63, '单据', '127.0.0.1', '2019-04-02 22:39:45', 0, '删除,id:178单据', '删除,id:178单据', NULL);
INSERT INTO `DS_log` VALUES (6097, 63, '角色', '127.0.0.1', '2019-04-02 22:39:55', 0, '新增角色', '新增角色', NULL);
INSERT INTO `DS_log` VALUES (6098, 63, '序列号', '127.0.0.1', '2019-04-02 22:39:57', 0, '删除,id:14序列号', '删除,id:14序列号', NULL);
INSERT INTO `DS_log` VALUES (6099, 63, '单据', '127.0.0.1', '2019-04-04 23:06:58', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6100, 63, '单据明细', '127.0.0.1', '2019-04-04 23:06:58', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6101, 63, '单据明细', '127.0.0.1', '2019-04-04 23:06:58', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6102, 115, '关联关系', '127.0.0.1', '2019-04-05 17:13:49', 0, '修改,id:54关联关系', '修改,id:54关联关系', 115);
INSERT INTO `DS_log` VALUES (6103, 115, '角色', '127.0.0.1', '2019-04-05 17:14:12', 0, '新增角色', '新增角色', 115);
INSERT INTO `DS_log` VALUES (6104, 115, '商家', '127.0.0.1', '2019-04-05 17:14:26', 0, '新增商家', '新增商家', 115);
INSERT INTO `DS_log` VALUES (6105, 115, '关联关系', '127.0.0.1', '2019-04-05 17:14:39', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `DS_log` VALUES (6106, 115, '关联关系', '127.0.0.1', '2019-04-05 17:14:52', 0, '修改,id:54关联关系', '修改,id:54关联关系', 115);
INSERT INTO `DS_log` VALUES (6107, 115, '关联关系', '127.0.0.1', '2019-04-05 17:15:20', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `DS_log` VALUES (6108, 115, '关联关系', '127.0.0.1', '2019-04-05 17:15:32', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `DS_log` VALUES (6109, 115, '用户', '127.0.0.1', '2019-04-05 17:19:53', 0, '修改,id:115用户', '修改,id:115用户', 115);
INSERT INTO `DS_log` VALUES (6110, 115, '用户', '127.0.0.1', '2019-04-05 17:20:05', 0, '修改,id:115用户', '修改,id:115用户', 115);
INSERT INTO `DS_log` VALUES (6111, 115, '关联关系', '127.0.0.1', '2019-04-05 17:20:56', 0, '修改,id:56关联关系', '修改,id:56关联关系', 115);
INSERT INTO `DS_log` VALUES (6112, 115, '关联关系', '127.0.0.1', '2019-04-05 17:21:31', 0, '修改,id:56关联关系', '修改,id:56关联关系', 115);
INSERT INTO `DS_log` VALUES (6113, 63, '单据', '127.0.0.1', '2019-04-07 20:23:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6114, 63, '单据明细', '127.0.0.1', '2019-04-07 20:23:23', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6115, 63, '单据明细', '127.0.0.1', '2019-04-07 20:23:23', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6116, 63, '单据', '127.0.0.1', '2019-04-07 20:25:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6117, 63, '单据明细', '127.0.0.1', '2019-04-07 20:25:30', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6118, 63, '单据明细', '127.0.0.1', '2019-04-07 20:25:30', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6119, 63, '单据', '127.0.0.1', '2019-04-07 20:35:00', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6120, 63, '单据明细', '127.0.0.1', '2019-04-07 20:35:01', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6121, 63, '单据明细', '127.0.0.1', '2019-04-07 20:35:01', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6122, 63, '单据', '127.0.0.1', '2019-04-07 20:44:09', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6123, 63, '单据明细', '127.0.0.1', '2019-04-07 20:44:09', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6124, 63, '单据明细', '127.0.0.1', '2019-04-07 20:44:09', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6125, 63, '单据', '127.0.0.1', '2019-04-07 20:44:25', 0, '删除,id:184单据', '删除,id:184单据', NULL);
INSERT INTO `DS_log` VALUES (6126, 63, '单据', '127.0.0.1', '2019-04-07 20:44:25', 0, '删除,id:184单据', '删除,id:184单据', NULL);
INSERT INTO `DS_log` VALUES (6127, 63, '单据', '127.0.0.1', '2019-04-07 20:44:29', 0, '删除,id:185单据', '删除,id:185单据', NULL);
INSERT INTO `DS_log` VALUES (6128, 63, '单据', '127.0.0.1', '2019-04-07 20:44:29', 0, '删除,id:185单据', '删除,id:185单据', NULL);
INSERT INTO `DS_log` VALUES (6129, 63, '单据', '127.0.0.1', '2019-04-07 20:44:32', 0, '删除,id:186单据', '删除,id:186单据', NULL);
INSERT INTO `DS_log` VALUES (6130, 63, '单据', '127.0.0.1', '2019-04-07 20:44:32', 0, '删除,id:186单据', '删除,id:186单据', NULL);
INSERT INTO `DS_log` VALUES (6131, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:183,182单据', '删除,id:183,182单据', NULL);
INSERT INTO `DS_log` VALUES (6132, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:183单据', '删除,id:183单据', NULL);
INSERT INTO `DS_log` VALUES (6133, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:183单据', '删除,id:183单据', NULL);
INSERT INTO `DS_log` VALUES (6134, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:182单据', '删除,id:182单据', NULL);
INSERT INTO `DS_log` VALUES (6135, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:182单据', '删除,id:182单据', NULL);
INSERT INTO `DS_log` VALUES (6136, 63, '单据', '127.0.0.1', '2019-04-07 20:45:09', 0, '删除,id:179单据', '删除,id:179单据', NULL);
INSERT INTO `DS_log` VALUES (6137, 63, '单据', '127.0.0.1', '2019-04-07 20:45:09', 0, '删除,id:179单据', '删除,id:179单据', NULL);
INSERT INTO `DS_log` VALUES (6138, 63, '单据', '127.0.0.1', '2019-04-07 20:51:51', 0, '新增单据', '新增单据', NULL);
INSERT INTO `DS_log` VALUES (6139, 63, '单据明细', '127.0.0.1', '2019-04-07 20:51:51', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6140, 63, '单据明细', '127.0.0.1', '2019-04-07 20:51:51', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6141, 63, '单据', '127.0.0.1', '2019-04-07 22:36:48', 0, '修改,id:188单据', '修改,id:188单据', NULL);
INSERT INTO `DS_log` VALUES (6142, 63, '单据明细', '127.0.0.1', '2019-04-07 22:36:48', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6143, 63, '单据明细', '127.0.0.1', '2019-04-07 22:36:48', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6144, 63, '单据', '127.0.0.1', '2019-04-07 22:38:23', 0, '修改,id:188单据', '修改,id:188单据', NULL);
INSERT INTO `DS_log` VALUES (6145, 63, '单据明细', '127.0.0.1', '2019-04-07 22:38:24', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6146, 63, '单据明细', '127.0.0.1', '2019-04-07 22:38:24', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6147, 63, '单据', '127.0.0.1', '2019-04-07 22:39:59', 0, '修改,id:188单据', '修改,id:188单据', NULL);
INSERT INTO `DS_log` VALUES (6148, 63, '单据明细', '127.0.0.1', '2019-04-07 22:39:59', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `DS_log` VALUES (6149, 63, '单据明细', '127.0.0.1', '2019-04-07 22:39:59', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `DS_log` VALUES (6150, 63, '商品类型', '127.0.0.1', '2019-04-10 22:18:12', 0, '新增商品类型', '新增商品类型', 63);
INSERT INTO `DS_log` VALUES (6151, 63, '商品', '127.0.0.1', '2019-04-10 22:18:23', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6152, 63, '商家', '127.0.0.1', '2019-04-10 22:18:33', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6153, 63, '商家', '127.0.0.1', '2019-04-10 22:18:41', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6154, 63, '账户', '127.0.0.1', '2019-04-10 22:18:54', 0, '新增账户', '新增账户', 63);
INSERT INTO `DS_log` VALUES (6155, 63, '账户', '127.0.0.1', '2019-04-10 22:19:19', 0, '修改,id:17账户', '修改,id:17账户', 63);
INSERT INTO `DS_log` VALUES (6156, 63, '仓库', '127.0.0.1', '2019-04-10 22:20:07', 0, '新增仓库', '新增仓库', 63);
INSERT INTO `DS_log` VALUES (6157, 63, '关联关系', '127.0.0.1', '2019-04-10 22:20:19', 0, '修改,id:18关联关系', '修改,id:18关联关系', 63);
INSERT INTO `DS_log` VALUES (6170, 63, '商品', '127.0.0.1', '2019-04-10 22:24:35', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6179, 63, '商品', '127.0.0.1', '2019-04-10 22:25:23', 0, '修改,id:568商品', '修改,id:568商品', 63);
INSERT INTO `DS_log` VALUES (6180, 63, '商品', '127.0.0.1', '2019-04-10 22:25:32', 0, '修改,id:569商品', '修改,id:569商品', 63);
INSERT INTO `DS_log` VALUES (6181, 63, '单据', '127.0.0.1', '2019-04-10 22:25:49', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6182, 63, '单据明细', '127.0.0.1', '2019-04-10 22:25:49', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6183, 63, '单据明细', '127.0.0.1', '2019-04-10 22:25:49', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6184, 63, '单据', '127.0.0.1', '2019-04-10 22:26:00', 0, '修改,id:189单据', '修改,id:189单据', 63);
INSERT INTO `DS_log` VALUES (6185, 63, '单据明细', '127.0.0.1', '2019-04-10 22:26:00', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6186, 63, '单据明细', '127.0.0.1', '2019-04-10 22:26:00', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6187, 63, '用户', '127.0.0.1', '2019-04-13 19:38:11', 0, '新增用户', '新增用户', 63);
INSERT INTO `DS_log` VALUES (6188, 63, '用户', '127.0.0.1', '2019-04-13 19:38:22', 0, '删除,id:122用户', '删除,id:122用户', 63);
INSERT INTO `DS_log` VALUES (6189, 63, '单据', '127.0.0.1', '2019-04-13 19:57:43', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6190, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:43', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6191, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:43', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6192, 63, '单据', '127.0.0.1', '2019-04-13 19:57:58', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6193, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:58', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6194, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:58', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6195, 63, '单据', '127.0.0.1', '2019-04-13 19:58:02', 0, '删除,id:190单据', '删除,id:190单据', 63);
INSERT INTO `DS_log` VALUES (6196, 63, '单据', '127.0.0.1', '2019-04-13 19:58:02', 0, '删除,id:190单据', '删除,id:190单据', 63);
INSERT INTO `DS_log` VALUES (6197, 63, '商品', '127.0.0.1', '2019-04-13 19:58:23', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6198, 63, '单据', '127.0.0.1', '2019-04-20 00:36:23', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6199, 63, '单据明细', '127.0.0.1', '2019-04-20 00:36:24', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6200, 63, '单据明细', '127.0.0.1', '2019-04-20 00:36:24', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6201, 63, '商家', '127.0.0.1', '2019-04-29 23:39:40', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `DS_log` VALUES (6202, 63, '关联关系', '127.0.0.1', '2019-04-29 23:40:06', 0, '修改,id:27关联关系', '修改,id:27关联关系', 63);
INSERT INTO `DS_log` VALUES (6203, 63, '商品', '127.0.0.1', '2019-04-29 23:40:44', 0, '修改,id:569商品', '修改,id:569商品', 63);
INSERT INTO `DS_log` VALUES (6204, 63, '单据', '127.0.0.1', '2019-04-29 23:41:02', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6205, 63, '单据明细', '127.0.0.1', '2019-04-29 23:41:02', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6206, 63, '单据明细', '127.0.0.1', '2019-04-29 23:41:02', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6207, 63, '商家', '127.0.0.1', '2019-04-29 23:41:29', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `DS_log` VALUES (6208, 63, '商家', '127.0.0.1', '2019-04-29 23:41:35', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `DS_log` VALUES (6209, 63, '商家', '127.0.0.1', '2019-04-29 23:41:39', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `DS_log` VALUES (6210, 63, '仓库', '127.0.0.1', '2019-04-30 22:31:32', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `DS_log` VALUES (6211, 63, '关联关系', '127.0.0.1', '2019-04-30 22:32:09', 0, '修改,id:18关联关系', '修改,id:18关联关系', 63);
INSERT INTO `DS_log` VALUES (6212, 63, '仓库', '127.0.0.1', '2019-04-30 22:32:36', 0, '新增仓库', '新增仓库', 63);
INSERT INTO `DS_log` VALUES (6213, 63, '关联关系', '127.0.0.1', '2019-04-30 22:32:49', 0, '修改,id:18关联关系', '修改,id:18关联关系', 63);
INSERT INTO `DS_log` VALUES (6214, 63, '仓库', '127.0.0.1', '2019-04-30 22:33:04', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `DS_log` VALUES (6215, 63, '仓库', '127.0.0.1', '2019-04-30 22:33:04', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `DS_log` VALUES (6216, 63, '单据', '127.0.0.1', '2019-04-30 22:33:23', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6217, 63, '单据明细', '127.0.0.1', '2019-04-30 22:33:24', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6218, 63, '单据明细', '127.0.0.1', '2019-04-30 22:33:24', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6219, 63, '账户', '127.0.0.1', '2019-04-30 22:34:23', 0, '新增账户', '新增账户', 63);
INSERT INTO `DS_log` VALUES (6220, 63, '单据', '127.0.0.1', '2019-04-30 22:34:45', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6221, 63, '单据明细', '127.0.0.1', '2019-04-30 22:34:45', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6222, 63, '单据明细', '127.0.0.1', '2019-04-30 22:34:45', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6223, 63, '单据', '127.0.0.1', '2019-04-30 22:35:53', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6224, 63, '单据明细', '127.0.0.1', '2019-04-30 22:35:53', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6225, 63, '单据明细', '127.0.0.1', '2019-04-30 22:35:53', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6226, 120, '功能', '127.0.0.1', '2019-04-30 22:43:37', 0, '新增功能', '新增功能', NULL);
INSERT INTO `DS_log` VALUES (6227, 120, '关联关系', '127.0.0.1', '2019-04-30 22:43:52', 0, '修改,id:5关联关系', '修改,id:5关联关系', NULL);
INSERT INTO `DS_log` VALUES (6228, 120, '功能', '127.0.0.1', '2019-04-30 22:44:46', 0, '修改,id:244功能', '修改,id:244功能', NULL);
INSERT INTO `DS_log` VALUES (6229, 120, '关联关系', '127.0.0.1', '2019-04-30 22:46:03', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `DS_log` VALUES (6230, 63, '商品', '127.0.0.1', '2019-04-30 22:47:10', 0, '修改,id:568商品', '修改,id:568商品', 63);
INSERT INTO `DS_log` VALUES (6231, 63, '商品', '127.0.0.1', '2019-04-30 22:47:17', 0, '修改,id:569商品', '修改,id:569商品', 63);
INSERT INTO `DS_log` VALUES (6232, 63, '商品', '127.0.0.1', '2019-04-30 22:47:30', 0, '修改,id:570商品', '修改,id:570商品', 63);
INSERT INTO `DS_log` VALUES (6233, 63, '商家', '127.0.0.1', '2019-04-30 22:48:41', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6234, 63, '商家', '127.0.0.1', '2019-04-30 22:50:03', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6235, 63, '商家', '127.0.0.1', '2019-04-30 22:50:15', 0, '修改,id:60商家', '修改,id:60商家', 63);
INSERT INTO `DS_log` VALUES (6236, 63, '商家', '127.0.0.1', '2019-04-30 22:50:17', 0, '修改,id:60商家', '修改,id:60商家', 63);
INSERT INTO `DS_log` VALUES (6237, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:32', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `DS_log` VALUES (6238, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:32', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `DS_log` VALUES (6239, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:36', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `DS_log` VALUES (6240, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:36', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `DS_log` VALUES (6241, 63, '仓库', '127.0.0.1', '2019-04-30 23:09:07', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `DS_log` VALUES (6242, 63, '仓库', '127.0.0.1', '2019-04-30 23:09:07', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `DS_log` VALUES (6243, 63, '单据', '127.0.0.1', '2019-04-30 23:15:27', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6244, 63, '单据明细', '127.0.0.1', '2019-04-30 23:15:27', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6245, 63, '单据明细', '127.0.0.1', '2019-04-30 23:15:27', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6246, 63, '单据', '127.0.0.1', '2019-05-03 11:50:21', 0, '修改,id:196单据', '修改,id:196单据', 63);
INSERT INTO `DS_log` VALUES (6247, 63, '单据明细', '127.0.0.1', '2019-05-03 11:50:21', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6248, 63, '单据明细', '127.0.0.1', '2019-05-03 11:50:21', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6249, 63, '单据', '127.0.0.1', '2019-05-03 11:51:52', 0, '修改,id:196单据', '修改,id:196单据', 63);
INSERT INTO `DS_log` VALUES (6250, 63, '单据明细', '127.0.0.1', '2019-05-03 11:51:52', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6251, 63, '单据明细', '127.0.0.1', '2019-05-03 11:51:52', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6252, 63, '单据', '127.0.0.1', '2019-05-03 11:57:49', 0, '修改,id:196单据', '修改,id:196单据', 63);
INSERT INTO `DS_log` VALUES (6253, 63, '单据明细', '127.0.0.1', '2019-05-03 11:57:49', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6254, 63, '单据明细', '127.0.0.1', '2019-05-03 11:57:49', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6255, 63, '商家', '127.0.0.1', '2019-05-03 13:05:32', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6256, 63, '商家', '127.0.0.1', '2019-05-03 13:20:45', 0, '删除,id:61商家', '删除,id:61商家', 63);
INSERT INTO `DS_log` VALUES (6257, 63, '商家', '127.0.0.1', '2019-05-03 13:25:50', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `DS_log` VALUES (6258, 63, '商家', '127.0.0.1', '2019-05-03 13:25:58', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `DS_log` VALUES (6259, 63, '商家', '127.0.0.1', '2019-05-03 13:27:23', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `DS_log` VALUES (6260, 63, '商家', '127.0.0.1', '2019-05-03 13:27:32', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `DS_log` VALUES (6261, 63, '商家', '127.0.0.1', '2019-05-03 13:28:45', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6262, 63, '商家', '127.0.0.1', '2019-05-03 13:43:28', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6263, 63, '商家', '127.0.0.1', '2019-05-03 13:43:31', 0, '删除,id:63商家', '删除,id:63商家', 63);
INSERT INTO `DS_log` VALUES (6264, 63, '商家', '127.0.0.1', '2019-05-03 13:43:35', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6265, 63, '商家', '127.0.0.1', '2019-05-03 13:43:44', 0, '修改,id:64商家', '修改,id:64商家', 63);
INSERT INTO `DS_log` VALUES (6266, 63, '商家', '127.0.0.1', '2019-05-03 13:45:52', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6267, 63, '商家', '127.0.0.1', '2019-05-03 13:46:17', 0, '修改,id:65商家', '修改,id:65商家', 63);
INSERT INTO `DS_log` VALUES (6268, 63, '商家', '127.0.0.1', '2019-05-03 13:46:23', 0, '删除,id:62,64,65商家', '删除,id:62,64,65商家', 63);
INSERT INTO `DS_log` VALUES (6269, 63, '商家', '127.0.0.1', '2019-05-03 13:46:28', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6270, 63, '商家', '127.0.0.1', '2019-05-03 13:46:34', 0, '删除,id:66商家', '删除,id:66商家', 63);
INSERT INTO `DS_log` VALUES (6271, 63, '商家', '127.0.0.1', '2019-05-03 13:46:58', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6272, 63, '商家', '127.0.0.1', '2019-05-03 13:47:07', 0, '修改,id:67商家', '修改,id:67商家', 63);
INSERT INTO `DS_log` VALUES (6273, 63, '商家', '127.0.0.1', '2019-05-03 13:47:17', 0, '修改,id:67商家', '修改,id:67商家', 63);
INSERT INTO `DS_log` VALUES (6274, 63, '商家', '127.0.0.1', '2019-05-03 13:54:20', 0, '删除,id:67商家', '删除,id:67商家', 63);
INSERT INTO `DS_log` VALUES (6275, 63, '商家', '127.0.0.1', '2019-05-03 13:54:32', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6276, 63, '商家', '127.0.0.1', '2019-05-03 13:55:00', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6277, 63, '商家', '127.0.0.1', '2019-05-03 13:55:33', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6278, 63, '商家', '127.0.0.1', '2019-05-03 13:56:22', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6279, 63, '商家', '127.0.0.1', '2019-05-03 13:56:42', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6280, 63, '商家', '127.0.0.1', '2019-05-03 13:57:06', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6281, 63, '商家', '127.0.0.1', '2019-05-03 13:57:24', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6282, 63, '商家', '127.0.0.1', '2019-05-03 13:57:42', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6283, 63, '商家', '127.0.0.1', '2019-05-03 13:57:50', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6284, 63, '商家', '127.0.0.1', '2019-05-03 13:58:33', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6285, 63, '商家', '127.0.0.1', '2019-05-03 13:58:43', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `DS_log` VALUES (6286, 63, '计量单位', '127.0.0.1', '2019-05-03 14:00:00', 0, '新增计量单位', '新增计量单位', 63);
INSERT INTO `DS_log` VALUES (6287, 63, '商品', '127.0.0.1', '2019-05-03 14:00:56', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6288, 63, '商品', '127.0.0.1', '2019-05-03 14:06:56', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6289, 63, '商品', '127.0.0.1', '2019-05-03 14:07:09', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6290, 63, '商品', '127.0.0.1', '2019-05-03 14:07:19', 0, '删除,id:572,573商品', '删除,id:572,573商品', 63);
INSERT INTO `DS_log` VALUES (6291, 63, '商品', '127.0.0.1', '2019-05-03 14:14:43', 0, '删除,id:571商品', '删除,id:571商品', 63);
INSERT INTO `DS_log` VALUES (6292, 63, '商品', '127.0.0.1', '2019-05-03 14:15:13', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6295, 63, '商品', '127.0.0.1', '2019-05-03 14:16:06', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6296, 63, '商品', '127.0.0.1', '2019-05-03 14:16:15', 0, '删除,id:574,575商品', '删除,id:574,575商品', 63);
INSERT INTO `DS_log` VALUES (6297, 63, '商品', '127.0.0.1', '2019-05-03 14:17:08', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6298, 63, '商品', '127.0.0.1', '2019-05-03 14:17:12', 0, '删除,id:576商品', '删除,id:576商品', 63);
INSERT INTO `DS_log` VALUES (6299, 63, '商品', '127.0.0.1', '2019-05-03 14:17:39', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6300, 63, '商品', '127.0.0.1', '2019-05-03 14:18:59', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6301, 63, '商品', '127.0.0.1', '2019-05-03 14:19:17', 0, '修改,id:578商品', '修改,id:578商品', 63);
INSERT INTO `DS_log` VALUES (6302, 63, '商品', '127.0.0.1', '2019-05-03 14:19:27', 0, '修改,id:578商品', '修改,id:578商品', 63);
INSERT INTO `DS_log` VALUES (6303, 63, '商品', '127.0.0.1', '2019-05-03 14:19:34', 0, '修改,id:578商品', '修改,id:578商品', 63);
INSERT INTO `DS_log` VALUES (6304, 63, '单据', '127.0.0.1', '2019-05-03 14:20:56', 0, '新增单据', '新增单据', 63);
INSERT INTO `DS_log` VALUES (6305, 63, '单据明细', '127.0.0.1', '2019-05-03 14:20:56', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `DS_log` VALUES (6306, 63, '单据明细', '127.0.0.1', '2019-05-03 14:20:56', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `DS_log` VALUES (6307, 63, '商品', '127.0.0.1', '2019-05-03 14:21:11', 0, '删除,id:578商品', '删除,id:578商品', 63);
INSERT INTO `DS_log` VALUES (6312, 63, '商品', '127.0.0.1', '2019-05-03 14:35:11', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6314, 63, '商品', '127.0.0.1', '2019-05-03 14:36:06', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6315, 63, '商品', '127.0.0.1', '2019-05-03 14:36:18', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6316, 63, '商品', '127.0.0.1', '2019-05-03 14:40:05', 0, '修改,id:581商品', '修改,id:581商品', 63);
INSERT INTO `DS_log` VALUES (6317, 63, '商品', '127.0.0.1', '2019-05-03 14:40:07', 0, '修改,id:581商品', '修改,id:581商品', 63);
INSERT INTO `DS_log` VALUES (6318, 63, '商品', '127.0.0.1', '2019-05-03 14:40:10', 0, '删除,id:581商品', '删除,id:581商品', 63);
INSERT INTO `DS_log` VALUES (6319, 63, '商品', '127.0.0.1', '2019-05-03 14:40:12', 0, '删除,id:580商品', '删除,id:580商品', 63);
INSERT INTO `DS_log` VALUES (6320, 63, '商品', '127.0.0.1', '2019-05-03 14:40:24', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6321, 63, '商品', '127.0.0.1', '2019-05-03 14:40:46', 0, '修改,id:582商品', '修改,id:582商品', 63);
INSERT INTO `DS_log` VALUES (6322, 63, '商品', '127.0.0.1', '2019-05-03 14:43:25', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6323, 63, '商品', '127.0.0.1', '2019-05-03 14:43:28', 0, '删除,id:583商品', '删除,id:583商品', 63);
INSERT INTO `DS_log` VALUES (6324, 63, '商品', '127.0.0.1', '2019-05-03 14:45:57', 0, '删除,id:582商品', '删除,id:582商品', 63);
INSERT INTO `DS_log` VALUES (6325, 63, '商品', '127.0.0.1', '2019-05-03 14:46:18', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6326, 63, '商品', '127.0.0.1', '2019-05-03 14:46:38', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6327, 63, '商品', '127.0.0.1', '2019-05-03 14:46:43', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6328, 63, '商品', '127.0.0.1', '2019-05-03 14:46:51', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6329, 63, '商品', '127.0.0.1', '2019-05-03 14:47:13', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6330, 63, '商品', '127.0.0.1', '2019-05-03 14:47:18', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6331, 63, '商品', '127.0.0.1', '2019-05-03 14:47:21', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6332, 63, '商品', '127.0.0.1', '2019-05-03 14:47:29', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6333, 63, '商品', '127.0.0.1', '2019-05-03 14:48:53', 0, '删除,id:584商品', '删除,id:584商品', 63);
INSERT INTO `DS_log` VALUES (6334, 63, '商品', '127.0.0.1', '2019-05-03 14:49:11', 0, '新增商品', '新增商品', 63);
INSERT INTO `DS_log` VALUES (6335, 63, '商家', '127.0.0.1', '2019-05-03 14:55:10', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6336, 63, '商家', '127.0.0.1', '2019-05-03 14:55:26', 0, '删除,id:69商家', '删除,id:69商家', 63);
INSERT INTO `DS_log` VALUES (6337, 63, '商家', '127.0.0.1', '2019-05-03 14:56:46', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6338, 63, '商家', '127.0.0.1', '2019-05-03 14:57:13', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6339, 63, '商家', '127.0.0.1', '2019-05-03 14:58:47', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6340, 63, '商家', '127.0.0.1', '2019-05-03 14:58:52', 0, '新增商家', '新增商家', 63);
INSERT INTO `DS_log` VALUES (6341, 63, '商家', '127.0.0.1', '2019-05-03 14:59:03', 0, '删除,id:70,72,73商家', '删除,id:70,72,73商家', 63);
INSERT INTO `DS_log` VALUES (6342, 120, '关联关系', '127.0.0.1', '2019-05-03 16:37:15', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `DS_log` VALUES (6343, 120, '功能', '127.0.0.1', '2019-05-03 16:55:52', 0, '新增功能', '新增功能', NULL);
INSERT INTO `DS_log` VALUES (6344, 120, '关联关系', '127.0.0.1', '2019-05-03 16:56:20', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `DS_log` VALUES (6345, 120, '关联关系', '127.0.0.1', '2019-05-03 16:57:24', 0, '修改,id:5关联关系', '修改,id:5关联关系', NULL);
INSERT INTO `DS_log` VALUES (6346, 120, '功能', '127.0.0.1', '2019-05-03 16:58:04', 0, '修改,id:245功能', '修改,id:245功能', NULL);
INSERT INTO `DS_log` VALUES (6347, 63, '角色', '127.0.0.1', '2019-05-03 17:06:47', 0, '新增角色', '新增角色', 63);
INSERT INTO `DS_log` VALUES (6348, 120, '用户', '127.0.0.1', '2019-11-16 19:51:11', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6349, 120, '用户', '127.0.0.1', '2019-11-16 20:06:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6350, 120, '用户', '127.0.0.1', '2019-11-16 20:34:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6351, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-16 21:45:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6352, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-16 22:24:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6353, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 00:08:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6354, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 00:09:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6355, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 00:11:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6356, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 00:17:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6357, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 00:18:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6358, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 00:25:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6359, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 12:20:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6360, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 12:21:34', 0, '修改,id:120用户', '修改,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6361, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 12:21:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6362, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 12:37:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6363, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 13:23:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6364, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 13:31:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6365, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 13:31:24', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6366, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 13:31:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6367, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:02:11', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6368, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:09:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6369, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:09:36', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6370, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:11:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6371, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:18:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6372, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:24:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6373, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:30:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6374, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:42:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6375, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:45:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6376, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:47:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6377, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:47:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6378, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:56:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6379, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 14:58:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6380, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:00:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6381, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:01:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6382, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:07:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6383, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:09:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6384, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:16:03', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6385, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:17:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6386, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:47:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6387, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 15:50:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6388, 120, '用户', '127.0.0.1', '2019-11-17 16:12:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6389, 120, '用户', '127.0.0.1', '2019-11-17 16:24:28', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6390, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 20:25:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6391, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-17 21:02:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6392, 120, '用户', '127.0.0.1', '2019-11-17 21:59:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6393, 120, '用户', '127.0.0.1', '2019-11-17 22:12:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6394, 120, '用户', '127.0.0.1', '2019-11-17 22:18:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6395, 120, '用户', '127.0.0.1', '2019-11-18 00:04:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6396, 120, '用户', '127.0.0.1', '2019-11-18 00:08:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6397, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:11:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6398, 120, '用户', '127.0.0.1', '2019-11-18 00:12:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6399, 120, '用户', '127.0.0.1', '2019-11-18 00:20:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6400, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:24:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6401, 120, '用户', '127.0.0.1', '2019-11-18 00:28:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6402, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:29:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6403, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:30:32', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6404, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:31:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6405, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:31:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6406, 120, '用户', '127.0.0.1', '2019-11-18 00:32:43', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6407, 120, '用户', '127.0.0.1', '2019-11-18 00:33:46', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6408, 120, '用户', '127.0.0.1', '2019-11-18 00:34:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6409, 120, '用户', '127.0.0.1', '2019-11-18 00:35:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6410, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:36:29', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6411, 120, '用户', '127.0.0.1', '2019-11-18 00:39:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6412, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 00:42:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6413, 120, '用户', '127.0.0.1', '2019-11-18 00:48:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6414, 120, '用户', '127.0.0.1', '2019-11-18 00:52:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6415, 120, '用户', '127.0.0.1', '2019-11-18 00:58:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6416, 120, '用户', '127.0.0.1', '2019-11-18 00:59:13', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6417, 120, '用户', '127.0.0.1', '2019-11-18 01:04:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6418, 120, '用户', '127.0.0.1', '2019-11-18 01:11:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6419, 120, '用户', '127.0.0.1', '2019-11-18 01:13:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6420, 120, '用户', '127.0.0.1', '2019-11-18 01:13:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6421, 120, '用户', '127.0.0.1', '2019-11-18 01:21:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6422, 120, '用户', '127.0.0.1', '2019-11-18 01:21:58', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6423, 120, '用户', '127.0.0.1', '2019-11-18 01:26:33', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6424, 120, '用户', '127.0.0.1', '2019-11-18 01:44:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6425, 120, '用户', '127.0.0.1', '2019-11-18 01:48:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6426, 120, '用户', '127.0.0.1', '2019-11-18 01:49:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6427, 120, '用户', '127.0.0.1', '2019-11-18 01:49:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6428, 120, '用户', '127.0.0.1', '2019-11-18 01:50:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6429, 120, '用户', '0:0:0:0:0:0:0:1', '2019-11-18 13:12:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6430, 120, '用户', '127.0.0.1', '2019-11-18 13:50:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6431, 120, '用户', '127.0.0.1', '2019-11-18 13:52:48', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6432, 120, '用户', '127.0.0.1', '2019-11-18 15:03:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6433, 120, '用户', '127.0.0.1', '2019-11-18 15:26:39', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6434, 120, '用户', '127.0.0.1', '2019-11-18 15:26:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6435, 120, '用户', '127.0.0.1', '2019-11-18 15:41:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6436, 120, '用户', '127.0.0.1', '2019-11-18 15:46:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6437, 120, '用户', '127.0.0.1', '2019-11-18 15:49:11', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6438, 120, '用户', '127.0.0.1', '2019-11-18 16:39:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6439, 120, '用户', '127.0.0.1', '2019-11-18 16:40:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6440, 120, '用户', '127.0.0.1', '2019-11-18 16:46:02', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6441, 120, '用户', '127.0.0.1', '2019-11-18 16:52:26', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6442, 120, '用户', '127.0.0.1', '2019-11-18 16:55:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6443, 120, '用户', '127.0.0.1', '2019-11-18 17:03:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6444, 120, '用户', '127.0.0.1', '2019-11-18 17:16:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6445, 120, '用户', '127.0.0.1', '2019-11-18 17:41:53', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6446, 120, '用户', '127.0.0.1', '2019-11-18 17:50:45', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6447, 120, '用户', '127.0.0.1', '2019-11-18 17:55:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6448, 120, '用户', '127.0.0.1', '2019-11-18 20:13:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6449, 120, '用户', '127.0.0.1', '2019-11-18 20:24:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6450, 120, '用户', '127.0.0.1', '2019-11-18 20:56:23', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6451, 120, '用户', '127.0.0.1', '2019-11-18 20:57:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6452, 120, '用户', '127.0.0.1', '2019-11-18 20:59:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6453, 120, '用户', '127.0.0.1', '2019-11-18 21:03:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6454, 120, '用户', '127.0.0.1', '2019-11-18 21:11:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6455, 120, '用户', '127.0.0.1', '2019-11-18 21:18:22', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6456, 120, '用户', '127.0.0.1', '2019-11-18 23:21:18', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6457, 120, '用户', '127.0.0.1', '2019-11-18 23:34:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6458, 120, '用户', '127.0.0.1', '2019-11-18 23:35:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6459, 120, '用户', '127.0.0.1', '2019-11-18 23:37:42', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6460, 120, '用户', '127.0.0.1', '2019-11-18 23:39:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6461, 120, '用户', '127.0.0.1', '2019-11-18 23:48:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6462, 120, '用户', '127.0.0.1', '2019-11-19 00:08:09', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6463, 120, '用户', '127.0.0.1', '2019-11-19 00:11:25', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6464, 120, '用户', '127.0.0.1', '2019-11-19 00:14:44', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6465, 120, '用户', '127.0.0.1', '2019-11-19 00:17:01', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6466, 120, '用户', '127.0.0.1', '2019-11-19 09:57:49', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6467, 120, '用户', '127.0.0.1', '2019-11-19 11:10:51', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6468, 120, '用户', '127.0.0.1', '2019-11-19 11:32:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6469, 120, '用户', '127.0.0.1', '2019-11-19 11:37:47', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6470, 120, '用户', '127.0.0.1', '2019-11-19 11:39:00', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6471, 120, '用户', '127.0.0.1', '2019-11-19 11:40:10', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6472, 120, '用户', '127.0.0.1', '2019-11-19 11:43:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6473, 120, '用户', '127.0.0.1', '2019-11-19 12:11:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6474, 120, '用户', '127.0.0.1', '2019-11-19 12:12:56', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6475, 120, '用户', '127.0.0.1', '2019-11-19 12:16:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6476, 120, '用户', '127.0.0.1', '2019-11-19 16:28:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6477, 120, '用户', '127.0.0.1', '2019-11-19 16:48:15', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6478, 120, '用户', '127.0.0.1', '2019-11-19 17:25:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6479, 120, '用户', '127.0.0.1', '2019-11-19 18:43:07', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6480, 120, '用户', '127.0.0.1', '2019-11-19 20:34:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6481, 120, '用户', '127.0.0.1', '2019-11-19 20:47:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6482, 120, '用户', '127.0.0.1', '2019-11-19 20:59:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6483, 120, '用户', '127.0.0.1', '2019-11-20 00:32:55', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6484, 120, '用户', '127.0.0.1', '2019-11-20 00:48:17', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6485, 120, '用户', '127.0.0.1', '2019-11-20 01:12:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6486, 120, '用户', '127.0.0.1', '2019-11-20 11:07:04', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6487, 120, '用户', '127.0.0.1', '2019-11-20 11:11:30', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6488, 120, '用户', '127.0.0.1', '2019-11-20 11:27:16', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6489, 120, '用户', '127.0.0.1', '2019-11-20 11:45:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6490, 120, '用户', '127.0.0.1', '2019-11-20 11:50:27', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6491, 120, '用户', '127.0.0.1', '2019-11-20 14:12:40', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6492, 120, '用户', '127.0.0.1', '2019-11-20 15:22:14', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6493, 120, '用户', '127.0.0.1', '2019-11-20 15:37:08', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6494, 120, '用户', '127.0.0.1', '2019-11-20 17:29:37', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6495, 120, '用户', '127.0.0.1', '2019-11-20 17:30:41', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6496, 120, '用户', '127.0.0.1', '2019-11-20 17:42:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6497, 120, '用户', '127.0.0.1', '2019-11-20 17:43:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6498, 120, '用户', '127.0.0.1', '2019-11-20 17:53:31', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6499, 120, '用户', '127.0.0.1', '2019-11-20 20:31:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6500, 120, '用户', '127.0.0.1', '2019-11-20 20:33:35', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6501, 120, '用户', '127.0.0.1', '2019-11-20 20:36:19', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6502, 120, '用户', '127.0.0.1', '2019-11-20 20:37:21', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6503, 120, '用户', '127.0.0.1', '2019-11-20 20:41:57', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6504, 120, '用户', '127.0.0.1', '2019-11-20 20:46:59', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6505, 120, '用户', '127.0.0.1', '2019-11-20 23:46:34', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6506, 120, '用户', '127.0.0.1', '2019-11-20 23:49:06', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6507, 120, '用户', '127.0.0.1', '2019-11-20 23:55:52', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6508, 120, '用户', '127.0.0.1', '2019-11-21 00:19:38', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6509, 120, '用户', '127.0.0.1', '2019-11-21 10:03:05', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6510, 120, '用户', '127.0.0.1', '2019-11-21 11:25:50', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6511, 120, '用户', '127.0.0.1', '2019-11-21 11:30:12', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6512, 120, '用户', '127.0.0.1', '2019-11-21 11:33:20', 0, '登录,id:120用户', '登录,id:120用户', NULL);
INSERT INTO `DS_log` VALUES (6513, 120, '用户', '127.0.0.1', '2019-11-21 18:33:54', 0, '登录,id:120用户', '登录,id:120用户', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='租户';

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
-- Table structure for DS_user
-- ----------------------------
DROP TABLE IF EXISTS `DS_user`;
CREATE TABLE `DS_user` (
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
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of DS_user
-- ----------------------------
BEGIN;
INSERT INTO `DS_user` VALUES (63, 'ztm', 'jsh', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 1, 0, '', NULL, 63);
INSERT INTO `DS_user` VALUES (64, '张三', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (65, '李四', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (67, 'fas666', 'asd555', NULL, 'asdf333', NULL, '11111@qq.com', '222222', 1, 0, 0, 'sdf0000', NULL, NULL);
INSERT INTO `DS_user` VALUES (74, '21312sfdfsdf', '1231234', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (84, '123123', 'jsh123', NULL, '3123', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (86, '2333', 'sdf111aaa', NULL, '3232', NULL, '', '32323', 1, 0, 0, '33232', NULL, NULL);
INSERT INTO `DS_user` VALUES (87, '122123132', 'sdfasd1', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (90, '232343', '233', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (91, 'jsh1231', 'jsh1231', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (92, '213123', 'aaaa', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (93, '111', 'ffff', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (94, 'sdfsdf', 'fsdfsdsd', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (95, '4444444', '4444', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `DS_user` VALUES (96, 'lili', 'lili', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 1);
INSERT INTO `DS_user` VALUES (113, 'yuyu123', 'yuyu123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 113);
INSERT INTO `DS_user` VALUES (115, 'laoba123', 'laoba123', 'e10adc3949ba59abbe56e057f20f883e', '33333', NULL, '', '', 1, 0, 0, '', NULL, 115);
INSERT INTO `DS_user` VALUES (116, 'gggg123', 'gggg123', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 115);
INSERT INTO `DS_user` VALUES (120, '管理员', 'admin', '3c6da47dc7ac9313b1ed7f98f91700de', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `DS_user` VALUES (121, 'hhhh', 'hhhh', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 115);
INSERT INTO `DS_user` VALUES (122, 'admin1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 63);
INSERT INTO `DS_user` VALUES (123, 'caoyuli', 'caoyuli', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 123);
INSERT INTO `DS_user` VALUES (124, 'jchb', 'jchb', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 124);
INSERT INTO `DS_user` VALUES (126, '123123', '123123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 126);
INSERT INTO `DS_user` VALUES (127, '2345123', '2345123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 127);
INSERT INTO `DS_user` VALUES (128, 'q12341243', 'q12341243', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 128);
INSERT INTO `DS_user` VALUES (130, 'jsh666', 'jsh666', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 130);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';

-- ----------------------------
-- Records of DS_userbusiness
-- ----------------------------
BEGIN;
INSERT INTO `DS_userbusiness` VALUES (5, 'RoleFunctions', '4', '[245][13][12][16][243][14][15][234][236][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
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
COMMIT;

-- ----------------------------
-- Table structure for Expired_Food
-- ----------------------------
DROP TABLE IF EXISTS `Expired_Food`;
CREATE TABLE `Expired_Food` (
  `Food_no` char(20) NOT NULL,
  `Food_type` char(8) DEFAULT NULL COMMENT '原料还是成品',
  `Food_name` char(100) DEFAULT NULL,
  `Expired_date` datetime DEFAULT NULL COMMENT '过期时间',
  `Loss_num` char(20) DEFAULT NULL COMMENT '损失的数目+单位',
  `Loss_money` int(255) DEFAULT NULL,
  `Processing_method` char(255) DEFAULT NULL COMMENT '处理方式（地点或者碾碎之类的）',
  PRIMARY KEY (`Food_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Expired_Food
-- ----------------------------
BEGIN;
INSERT INTO `Expired_Food` VALUES ('0000000001', '成品', '巧克力', '2019-10-02 17:28:59', '300--车', 10, NULL);
INSERT INTO `Expired_Food` VALUES ('0000000002', '成品', '小面包', '2019-11-20 17:29:37', '3000--公斤', 1800000, '焚烧');
INSERT INTO `Expired_Food` VALUES ('0000000003', '成品', '小面包', '2019-11-20 17:30:41', '3000--公斤', 1800000, '焚烧');
INSERT INTO `Expired_Food` VALUES ('0000000004', '成品', '小面包', '2019-11-20 17:42:06', '3000--公斤', 1800000, '焚烧');
INSERT INTO `Expired_Food` VALUES ('0000000005', '成品', '小面包', '2019-11-20 17:43:34', '3000--公斤', 1800000, '焚烧');
INSERT INTO `Expired_Food` VALUES ('0000000006', '成品', '小面包', '2019-11-20 17:53:31', '3000--公斤', 1800000, '焚烧');
COMMIT;

-- ----------------------------
-- Table structure for Export_Record
-- ----------------------------
DROP TABLE IF EXISTS `Export_Record`;
CREATE TABLE `Export_Record` (
  `Export_no` char(50) NOT NULL,
  `Staff_no` char(20) DEFAULT NULL COMMENT '发货负责人',
  `Order_no_details` char(255) DEFAULT NULL COMMENT '货物，运输量',
  `Source_place` char(255) DEFAULT NULL,
  `Target_place` char(255) DEFAULT NULL,
  `Delivery_date` datetime DEFAULT NULL,
  `Transport_link` char(255) DEFAULT NULL COMMENT '物流信息',
  `Progress` char(30) DEFAULT NULL,
  PRIMARY KEY (`Export_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Export_Record
-- ----------------------------
BEGIN;
INSERT INTO `Export_Record` VALUES ('0000000001', '000001', '00000008-00', '大山食品厂', 'Java实训集中营', '2019-11-20 20:14:11', '东风快递', '进行中。。。');
INSERT INTO `Export_Record` VALUES ('0000000002', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:37:22', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000003', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:41:58', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000004', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:46:59', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000005', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:46:35', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000006', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:49:07', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000007', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:55:53', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000008', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 00:19:39', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000009', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 10:03:05', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000010', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:25:51', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000011', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:30:13', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000012', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:33:20', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000013', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 18:33:55', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
INSERT INTO `Export_Record` VALUES ('0000000014', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 08:58:38', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂');
COMMIT;

-- ----------------------------
-- Table structure for Manufacture_Design
-- ----------------------------
DROP TABLE IF EXISTS `Manufacture_Design`;
CREATE TABLE `Manufacture_Design` (
  `Manufacture_no` char(40) NOT NULL,
  `Order_no_details` char(255) DEFAULT NULL,
  `Staff_no_design` char(20) DEFAULT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Deadline` datetime DEFAULT NULL,
  `Progress` char(20) DEFAULT NULL,
  `Workshop` char(20) DEFAULT NULL,
  `Raw_materials_requirement` char(20) DEFAULT NULL,
  `Products_requirement` char(20) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL,
  PRIMARY KEY (`Manufacture_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Manufacture_Design
-- ----------------------------
BEGIN;
INSERT INTO `Manufacture_Design` VALUES ('0000000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for Manufacture_Result
-- ----------------------------
DROP TABLE IF EXISTS `Manufacture_Result`;
CREATE TABLE `Manufacture_Result` (
  `Manufacture_no` char(40) NOT NULL,
  `Order_no_details` char(255) DEFAULT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Staff_no_design` char(20) DEFAULT NULL,
  `Staff_no_manufacture` char(255) DEFAULT NULL,
  `Stock_no` char(20) DEFAULT NULL,
  `Update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Manufacture_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Manufacture_Result
-- ----------------------------
BEGIN;
INSERT INTO `Manufacture_Result` VALUES ('0000000001', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for Order_Details
-- ----------------------------
DROP TABLE IF EXISTS `Order_Details`;
CREATE TABLE `Order_Details` (
  `Order_no_details` char(50) NOT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Products_requirement` char(20) DEFAULT NULL,
  `Client_no` char(20) DEFAULT NULL,
  `Delivery_date` datetime DEFAULT NULL COMMENT '预计发货日期',
  `Payment_deadline` datetime DEFAULT NULL COMMENT '尾款截止期限   数字+单位',
  `Check` int(255) DEFAULT NULL,
  PRIMARY KEY (`Order_no_details`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order_Details
-- ----------------------------
BEGIN;
INSERT INTO `Order_Details` VALUES ('00000001-01', '0002', '5000--公斤', '000001', '2019-10-12 23:47:38', NULL, 0);
INSERT INTO `Order_Details` VALUES ('00000002-01', '0002', '2000--箱', '000002', '2019-11-22 08:58:38', '2019-12-21 08:58:38', 1);
INSERT INTO `Order_Details` VALUES ('00000002-02', '0001', '6000--箱', '000002', '2019-11-19 15:49:11', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000003-00', '0001', '2000--公斤', '000001', '2020-02-19 15:49:11', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000003-01', '0002', '500--车', '000001', '2019-11-24 15:49:11', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000004-00', '0001', '2000--公斤', '000001', '2020-02-19 16:39:35', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000004-01', '0002', '500--车', '000001', '2019-11-24 16:39:35', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000005-00', '0001', '2000--公斤', '000001', '2020-02-19 16:40:46', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000005-01', '0002', '500--车', '000001', '2019-11-24 16:40:46', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000006-00', '0001', '2000--公斤', '000001', '2020-02-19 16:46:03', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000006-01', '0002', '500--车', '000001', '2019-11-24 16:46:03', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000007-00', '0001', '2000--公斤', '000001', '2020-02-19 16:52:26', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000007-01', '0002', '500--车', '000001', '2019-11-24 16:52:26', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000008-00', '0001', '2000--公斤', '000001', '2020-02-19 16:55:16', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000008-01', '0002', '500--车', '000001', '2019-11-21 08:58:38', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000009-00', '0001', '2000--公斤', '000001', '2020-02-19 17:03:06', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000009-01', '0002', '500--车', '000001', '2019-11-24 17:03:06', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000010-00', '0001', '2000--公斤', '000001', '2020-02-19 17:16:09', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000010-01', '0002', '500--车', '000001', '2019-11-24 17:16:09', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000011-00', '0001', '2000--公斤', '000001', '2020-02-19 17:41:53', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000011-01', '0002', '500--车', '000001', '2019-11-24 17:41:53', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000012-00', '0001', '2000--公斤', '000001', '2020-02-19 17:50:45', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000012-01', '0002', '500--车', '000001', '2019-11-24 17:50:45', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000013-00', '0001', '2000--公斤', '000001', '2020-02-19 17:55:22', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000013-01', '0002', '500--车', '000001', '2019-11-24 17:55:22', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000014-00', '0001', '2000--公斤', '000001', '2020-02-19 20:13:10', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000014-01', '0002', '500--车', '000001', '2019-11-24 20:13:10', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000015-00', '0001', '2000--公斤', '000001', '2020-02-19 20:24:41', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000015-01', '0002', '500--车', '000001', '2019-11-24 20:24:41', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000016-00', '0001', '2000--公斤', '000001', '2020-02-19 20:56:23', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000016-01', '0002', '500--车', '000001', '2019-11-24 20:56:23', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000017-00', '0001', '2000--公斤', '000001', '2020-02-19 20:57:44', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000017-01', '0002', '500--车', '000001', '2019-11-24 20:57:44', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000018-00', '0001', '2000--公斤', '000001', '2020-02-19 20:59:36', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000018-01', '0002', '500--车', '000001', '2019-11-24 20:59:36', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000019-00', '0001', '2000--公斤', '000001', '2020-02-19 21:03:42', NULL, 1);
INSERT INTO `Order_Details` VALUES ('00000019-01', '0002', '500--车', '000001', '2019-11-24 21:03:42', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for Order_Form
-- ----------------------------
DROP TABLE IF EXISTS `Order_Form`;
CREATE TABLE `Order_Form` (
  `Order_no` char(40) NOT NULL,
  `Client_no` char(20) DEFAULT NULL,
  `Staff_no` char(20) DEFAULT NULL,
  `Order_Create_date` datetime DEFAULT NULL,
  `Order_sum_amount` int(255) DEFAULT NULL,
  `Progress` char(40) DEFAULT NULL,
  `Liquidated_damages` int(255) DEFAULT NULL COMMENT '违约金',
  `Check` int(255) DEFAULT NULL,
  PRIMARY KEY (`Order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Order_Form
-- ----------------------------
BEGIN;
INSERT INTO `Order_Form` VALUES ('00000001', '000001', '000001', '2019-11-16 16:19:12', 900, '进行中。。。', 100, 0);
INSERT INTO `Order_Form` VALUES ('00000002', '000002', '000003', '2019-11-21 08:58:38', NULL, NULL, NULL, 1);
INSERT INTO `Order_Form` VALUES ('00000003', '000001', NULL, '2019-11-18 15:49:11', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000004', '000001', NULL, '2019-11-18 16:39:35', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000005', '000001', NULL, '2019-11-18 16:40:46', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000006', '000001', NULL, '2019-11-18 16:46:03', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000007', '000001', NULL, '2019-11-18 16:52:26', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000008', '000001', NULL, '2019-11-18 16:55:16', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000009', '000001', NULL, '2019-11-18 17:03:06', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000010', '000001', NULL, '2019-11-18 17:16:09', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000011', '000001', NULL, '2019-11-18 17:41:53', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000012', '000001', NULL, '2019-11-18 17:50:45', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000013', '000001', NULL, '2019-11-18 17:55:22', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000014', '000001', NULL, '2019-11-18 20:13:10', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000015', '000001', NULL, '2019-11-18 20:24:41', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000016', '000001', NULL, '2019-11-18 20:56:23', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000017', '000001', NULL, '2019-11-18 20:57:44', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000018', '000001', NULL, '2019-11-18 20:59:36', 1450000, '正在生产计划与讨论。。。', 145000, 1);
INSERT INTO `Order_Form` VALUES ('00000019', '000001', NULL, '2019-11-18 21:03:42', 1450000, '正在生产计划与讨论。。。', 145000, 1);
COMMIT;

-- ----------------------------
-- Table structure for Payment
-- ----------------------------
DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `Payment_no` char(50) NOT NULL,
  `Order_no` char(40) DEFAULT NULL,
  `Staff_no_accountant` char(20) DEFAULT NULL,
  `Money` int(255) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL COMMENT '尾款，预约款，贷款，赔款等',
  `Payment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Payment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Payment
-- ----------------------------
BEGIN;
INSERT INTO `Payment` VALUES ('0000000001', '00000001', '000001', 900, '尾款', '2019-11-21 11:36:11');
COMMIT;

-- ----------------------------
-- Table structure for Product_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Product_Criteria`;
CREATE TABLE `Product_Criteria` (
  `Product_no` char(20) NOT NULL,
  `Product_name` char(50) DEFAULT NULL,
  `Product_type` char(20) DEFAULT NULL,
  `Ingredient_List` char(255) DEFAULT NULL,
  `Manufacture_duration` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Guarantee_period` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Unit_Price` int(255) DEFAULT NULL,
  PRIMARY KEY (`Product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Product_Criteria
-- ----------------------------
BEGIN;
INSERT INTO `Product_Criteria` VALUES ('0001', '小面包', '面包', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '3--月', '12--月', 600);
INSERT INTO `Product_Criteria` VALUES ('0002', '巧克力', '糖果', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '5--天', '3--年', 500);
COMMIT;

-- ----------------------------
-- Table structure for Product_Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Product_Warehouse`;
CREATE TABLE `Product_Warehouse` (
  `Stock_no` char(40) NOT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Staff_no_storage` char(20) DEFAULT NULL COMMENT '成品负责人编号',
  `Staff_no_workshop` char(20) DEFAULT NULL COMMENT '车间负责人编号',
  `Storage_address` char(255) DEFAULT NULL,
  `Manufacture_date` datetime DEFAULT NULL,
  `Stock_num` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Details` char(255) DEFAULT NULL,
  PRIMARY KEY (`Stock_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Product_Warehouse
-- ----------------------------
BEGIN;
INSERT INTO `Product_Warehouse` VALUES ('00000001', '0001', '000002', '000003', '第一仓库', '2019-11-21 10:27:00', '300--千克', NULL);
INSERT INTO `Product_Warehouse` VALUES ('00000002', '0001', '000002', '000003', '第一仓库', '2019-11-01 10:27:00', '300--千克', NULL);
INSERT INTO `Product_Warehouse` VALUES ('00000003', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 11:30:13', '500--升', '');
INSERT INTO `Product_Warehouse` VALUES ('00000004', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 11:33:21', '500--升', '');
INSERT INTO `Product_Warehouse` VALUES ('00000005', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 18:33:55', '500--升', '');
INSERT INTO `Product_Warehouse` VALUES ('00000006', '0001', '', '', '大山食品厂----7625254号厂房', '2019-11-21 08:58:38', '500--升', '');
COMMIT;

-- ----------------------------
-- Table structure for Raw_Materials_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Raw_Materials_Criteria`;
CREATE TABLE `Raw_Materials_Criteria` (
  `Material_no` char(40) NOT NULL,
  `Material_name` char(100) DEFAULT NULL,
  `Material_type` char(30) DEFAULT NULL,
  `Guarantee_period` char(20) DEFAULT NULL COMMENT '数字+单位',
  PRIMARY KEY (`Material_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Raw_Materials_Criteria
-- ----------------------------
BEGIN;
INSERT INTO `Raw_Materials_Criteria` VALUES ('', NULL, NULL, NULL);
INSERT INTO `Raw_Materials_Criteria` VALUES ('0001', '面粉', '谷物类', '3--年');
COMMIT;

-- ----------------------------
-- Table structure for Raw_Materials_Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Raw_Materials_Warehouse`;
CREATE TABLE `Raw_Materials_Warehouse` (
  `Stock_no` char(40) NOT NULL,
  `Material_no` char(20) DEFAULT NULL,
  `Staff_no_storage` char(20) DEFAULT NULL,
  `Storage_address` char(255) DEFAULT NULL,
  `Product_date` datetime DEFAULT NULL,
  `Stock_num` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Details` char(255) DEFAULT NULL COMMENT 's',
  PRIMARY KEY (`Stock_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Raw_Materials_Warehouse
-- ----------------------------
BEGIN;
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000001', '0002', '000001', '巨魔蘸酱', '2019-11-09 11:32:46', NULL, NULL);
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000002', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 11:33:21', '500--升', '');
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000003', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 18:33:55', '500--升', '');
INSERT INTO `Raw_Materials_Warehouse` VALUES ('00000004', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 08:58:38', '500--升', '');
COMMIT;

-- ----------------------------
-- Table structure for Refund_Application
-- ----------------------------
DROP TABLE IF EXISTS `Refund_Application`;
CREATE TABLE `Refund_Application` (
  `Refund_no` char(40) NOT NULL,
  `Order_no` char(40) DEFAULT NULL,
  `Client_no` char(20) DEFAULT NULL,
  `Reason` char(255) DEFAULT NULL COMMENT '不合格成品+详情',
  `Staff_no_checker` char(20) DEFAULT NULL,
  `Progress` char(20) DEFAULT NULL,
  `Permission` int(255) DEFAULT NULL,
  `Refund_Payment` int(255) DEFAULT NULL,
  PRIMARY KEY (`Refund_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Refund_Application
-- ----------------------------
BEGIN;
INSERT INTO `Refund_Application` VALUES ('00000001', '00000001', '000003', '产品质量问题', '000002', '提交成功', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for Staff
-- ----------------------------
DROP TABLE IF EXISTS `Staff`;
CREATE TABLE `Staff` (
  `Staff_no` char(20) NOT NULL,
  `Staff_name` char(30) DEFAULT NULL,
  `Password` char(50) DEFAULT NULL,
  `Department` char(20) DEFAULT NULL,
  `Workshop` char(40) DEFAULT NULL,
  `Authority` char(255) DEFAULT NULL,
  `Busy` int(255) DEFAULT NULL,
  `Position` char(20) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL,
  PRIMARY KEY (`Staff_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Staff
-- ----------------------------
BEGIN;
INSERT INTO `Staff` VALUES ('000001', '11111', '827ccb0eea8a706c4c34a16891f84e7b', '销售', NULL, '0101110110101001110101', 20, '5', NULL);
INSERT INTO `Staff` VALUES ('000002', '1234', '827ccb0eea8a706c4c34a16891f84e7b', '销售', NULL, '0101110110101001110101', 13, NULL, NULL);
INSERT INTO `Staff` VALUES ('000003', '12345', '827ccb0eea8a706c4c34a16891f84e7b', '生产车间', '车间A', '0101110110101001110101', 0, '普通职工', '');
INSERT INTO `Staff` VALUES ('000004', 'TCP/IP', 'ba7bc92fcd57e337ebb9e74308c811f', '生产车间', '车间A', '0101110110101001110101', 0, '普通职工', '');
COMMIT;

-- ----------------------------
-- Table structure for Z_Client
-- ----------------------------
DROP TABLE IF EXISTS `Z_Client`;
CREATE TABLE `Z_Client` (
  `Client_no` char(20) DEFAULT NULL,
  `Client_name` char(30) DEFAULT NULL,
  `Password` char(50) DEFAULT NULL,
  `Client_type` char(10) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Client
-- ----------------------------
BEGIN;
INSERT INTO `Z_Client` VALUES ('1213', '425', '21', '242', 352, '2425');
INSERT INTO `Z_Client` VALUES ('000002', '虚拟用户A', '827ccb0eea8a706c4c34a16891f84e7b', 'VIP01', 20, '（该客户无详细资料介绍）');
INSERT INTO `Z_Client` VALUES ('000001', '425', '21', 'VIP10', 35, '2425');
INSERT INTO `Z_Client` VALUES ('000003', '虚拟用户A', 'e10adc3949ba59abbe56e057f20f883e', 'VIP10', 40, '（该客户无详细资料介绍）');
COMMIT;

-- ----------------------------
-- Table structure for Z_Expired_Food
-- ----------------------------
DROP TABLE IF EXISTS `Z_Expired_Food`;
CREATE TABLE `Z_Expired_Food` (
  `Food_no` char(20) DEFAULT NULL COMMENT '就是原料库或成品库的Stock_no',
  `Food_type` char(8) DEFAULT NULL COMMENT '原料还是成品',
  `Food_name` char(100) DEFAULT NULL,
  `Expired_date` datetime DEFAULT NULL COMMENT '过期时间',
  `Loss_num` char(20) DEFAULT NULL COMMENT '损失的数目+单位',
  `Loss_money` int(255) DEFAULT NULL,
  `Processing_method` char(255) DEFAULT NULL COMMENT '处理方式（地点或者碾碎之类的）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Z_Export_Record
-- ----------------------------
DROP TABLE IF EXISTS `Z_Export_Record`;
CREATE TABLE `Z_Export_Record` (
  `Export_no` char(50) DEFAULT NULL,
  `Staff_no` char(20) DEFAULT NULL COMMENT '发货负责人',
  `Order_no_details` char(255) DEFAULT NULL COMMENT '货物，运输量',
  `Source_place` char(255) DEFAULT NULL,
  `Target_place` char(255) DEFAULT NULL,
  `Delivery_date` datetime DEFAULT NULL,
  `Transport_link` char(255) DEFAULT NULL COMMENT '物流信息',
  `Progress` char(30) DEFAULT NULL,
  `Evaluation` char(255) DEFAULT NULL COMMENT '评价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Export_Record
-- ----------------------------
BEGIN;
INSERT INTO `Z_Export_Record` VALUES ('00000001', '000002', '00000008-00', '大山食品厂', 'Java实训集中营', '2019-11-20 20:14:11', '东风快递', '进行中。。。', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000001', '000001', '00000008-00', '大山食品厂', 'Java实训集中营', '2019-11-20 20:14:11', '东风快递', '进行中。。。', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000002', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:37:22', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000003', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:41:58', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000004', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 20:46:59', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000005', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:46:35', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000006', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:49:07', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000007', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-20 23:55:53', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000008', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 00:19:39', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000009', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 10:03:05', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000010', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:25:51', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000011', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:30:13', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000012', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 11:33:20', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000013', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 18:33:55', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
INSERT INTO `Z_Export_Record` VALUES ('0000000014', NULL, '00000008-01', '大山食品厂', '山大威海学生宿舍7号楼', '2019-11-21 08:58:38', '窝窝头，一块钱四个，嘿嘿！', '开始配送，当前位置：大山食品厂', NULL);
COMMIT;

-- ----------------------------
-- Table structure for Z_Manufacture_Design
-- ----------------------------
DROP TABLE IF EXISTS `Z_Manufacture_Design`;
CREATE TABLE `Z_Manufacture_Design` (
  `Manufacture_no` char(40) DEFAULT NULL,
  `Staff_no_design` char(20) DEFAULT NULL,
  `Deadline` datetime DEFAULT NULL,
  `Progress` char(20) DEFAULT NULL,
  `Raw_materials_requirement` char(20) DEFAULT NULL,
  `Workshop` char(20) DEFAULT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Products_requirement` char(20) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Z_Manufacture_Result
-- ----------------------------
DROP TABLE IF EXISTS `Z_Manufacture_Result`;
CREATE TABLE `Z_Manufacture_Result` (
  `Manufacture_no` char(40) DEFAULT NULL,
  `Staff_no_manufacture` char(255) DEFAULT NULL,
  `Staff_no_design` char(20) DEFAULT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Product_num` char(20) DEFAULT NULL COMMENT '数字+单位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Z_Order_Details
-- ----------------------------
DROP TABLE IF EXISTS `Z_Order_Details`;
CREATE TABLE `Z_Order_Details` (
  `Order_no_details` char(50) DEFAULT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Products_requirement` char(20) DEFAULT NULL,
  `Client_no` char(20) DEFAULT NULL,
  `Delivery_date` datetime DEFAULT NULL COMMENT '预计发货日期',
  `Payment_deadline` datetime DEFAULT NULL COMMENT '尾款截止期限   数字+单位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Order_Details
-- ----------------------------
BEGIN;
INSERT INTO `Z_Order_Details` VALUES ('wfwf', 'efw', 'efe', 'f231', '2019-11-12 16:21:38', '2020-02-08 16:21:44');
INSERT INTO `Z_Order_Details` VALUES ('00000003-00', '0001', '2000--公斤', '000001', '2020-02-19 15:49:11', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000003-01', '0002', '500--车', '000001', '2019-11-24 15:49:11', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000002-02', '0001', '6000--箱', '000002', '2019-11-19 15:49:11', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000001-01', '0002', '5000--公斤', '000001', '2019-10-12 23:47:38', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000004-00', '0001', '2000--公斤', '000001', '2020-02-19 16:39:35', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000004-01', '0002', '500--车', '000001', '2019-11-24 16:39:35', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000005-00', '0001', '2000--公斤', '000001', '2020-02-19 16:40:46', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000005-01', '0002', '500--车', '000001', '2019-11-24 16:40:46', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000006-00', '0001', '2000--公斤', '000001', '2020-02-19 16:46:03', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000006-01', '0002', '500--车', '000001', '2019-11-24 16:46:03', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000007-00', '0001', '2000--公斤', '000001', '2020-02-19 16:52:26', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000007-01', '0002', '500--车', '000001', '2019-11-24 16:52:26', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000008-00', '0001', '2000--公斤', '000001', '2020-02-19 16:55:16', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000009-00', '0001', '2000--公斤', '000001', '2020-02-19 17:03:06', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000009-01', '0002', '500--车', '000001', '2019-11-24 17:03:06', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000010-00', '0001', '2000--公斤', '000001', '2020-02-19 17:16:09', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000010-01', '0002', '500--车', '000001', '2019-11-24 17:16:09', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000011-00', '0001', '2000--公斤', '000001', '2020-02-19 17:41:53', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000011-01', '0002', '500--车', '000001', '2019-11-24 17:41:53', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000012-00', '0001', '2000--公斤', '000001', '2020-02-19 17:50:45', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000012-01', '0002', '500--车', '000001', '2019-11-24 17:50:45', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000013-00', '0001', '2000--公斤', '000001', '2020-02-19 17:55:22', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000013-01', '0002', '500--车', '000001', '2019-11-24 17:55:22', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000014-00', '0001', '2000--公斤', '000001', '2020-02-19 20:13:10', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000014-01', '0002', '500--车', '000001', '2019-11-24 20:13:10', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000015-00', '0001', '2000--公斤', '000001', '2020-02-19 20:24:41', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000015-01', '0002', '500--车', '000001', '2019-11-24 20:24:41', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000016-00', '0001', '2000--公斤', '000001', '2020-02-19 20:56:23', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000016-01', '0002', '500--车', '000001', '2019-11-24 20:56:23', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000017-00', '0001', '2000--公斤', '000001', '2020-02-19 20:57:44', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000017-01', '0002', '500--车', '000001', '2019-11-24 20:57:44', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000018-00', '0001', '2000--公斤', '000001', '2020-02-19 20:59:36', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000018-01', '0002', '500--车', '000001', '2019-11-24 20:59:36', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000019-00', '0001', '2000--公斤', '000001', '2020-02-19 21:03:42', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000019-01', '0002', '500--车', '000001', '2019-11-24 21:03:42', NULL);
INSERT INTO `Z_Order_Details` VALUES ('00000002-01', '0002', '2000--箱', '000002', '2019-11-22 08:58:38', '2019-12-21 08:58:38');
INSERT INTO `Z_Order_Details` VALUES ('00000008-01', '0002', '500--车', '000001', '2019-11-21 08:58:38', NULL);
COMMIT;

-- ----------------------------
-- Table structure for Z_Order_Form
-- ----------------------------
DROP TABLE IF EXISTS `Z_Order_Form`;
CREATE TABLE `Z_Order_Form` (
  `Order_no` char(40) DEFAULT NULL,
  `Client_no` char(20) DEFAULT NULL,
  `Staff_no` char(20) DEFAULT NULL,
  `Order_Create_date` datetime DEFAULT NULL,
  `Order_sum_amount` int(255) DEFAULT NULL,
  `Progress` char(40) DEFAULT NULL,
  `Liquidated_damages` int(255) DEFAULT NULL COMMENT '违约金'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Order_Form
-- ----------------------------
BEGIN;
INSERT INTO `Z_Order_Form` VALUES ('000002', '000001', '000003', '2019-11-16 19:56:27', NULL, NULL, NULL);
INSERT INTO `Z_Order_Form` VALUES ('00000001', '000001', '000001', '2019-11-16 16:19:12', 900, '进行中。。。', 100);
INSERT INTO `Z_Order_Form` VALUES ('231', '', '', NULL, 100, '', 90);
INSERT INTO `Z_Order_Form` VALUES ('00000003', '000001', NULL, '2019-11-18 15:49:11', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000004', '000001', NULL, '2019-11-18 16:39:35', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000005', '000001', NULL, '2019-11-18 16:40:46', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000006', '000001', NULL, '2019-11-18 16:46:03', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000007', '000001', NULL, '2019-11-18 16:52:26', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000008', '000001', NULL, '2019-11-18 16:55:16', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000009', '000001', NULL, '2019-11-18 17:03:06', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000010', '000001', NULL, '2019-11-18 17:16:09', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000011', '000001', NULL, '2019-11-18 17:41:53', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000012', '000001', NULL, '2019-11-18 17:50:45', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000013', '000001', NULL, '2019-11-18 17:55:22', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000014', '000001', NULL, '2019-11-18 20:13:10', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000015', '000001', NULL, '2019-11-18 20:24:41', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000016', '000001', NULL, '2019-11-18 20:56:23', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000017', '000001', NULL, '2019-11-18 20:57:44', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000018', '000001', NULL, '2019-11-18 20:59:36', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000019', '000001', NULL, '2019-11-18 21:03:42', 1450000, '正在生产计划与讨论。。。', 145000);
INSERT INTO `Z_Order_Form` VALUES ('00000002', '000002', '000003', '2019-11-21 08:58:38', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for Z_Payment
-- ----------------------------
DROP TABLE IF EXISTS `Z_Payment`;
CREATE TABLE `Z_Payment` (
  `Payment_no` char(50) DEFAULT NULL,
  `Order_no` char(40) DEFAULT NULL,
  `Staff_no_accountant` char(20) DEFAULT NULL,
  `Money` int(255) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL COMMENT '尾款，预约款，贷款，赔款等'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Payment
-- ----------------------------
BEGIN;
INSERT INTO `Z_Payment` VALUES ('0000000001', '00000001', '000001', 900, '尾款');
COMMIT;

-- ----------------------------
-- Table structure for Z_Product_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Z_Product_Criteria`;
CREATE TABLE `Z_Product_Criteria` (
  `Product_no` char(20) DEFAULT NULL,
  `Product_name` char(50) DEFAULT NULL,
  `Product_type` char(20) DEFAULT NULL,
  `Ingredient_List` char(255) DEFAULT NULL,
  `Guarantee_period` char(20) DEFAULT NULL COMMENT '数字+单位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Product_Criteria
-- ----------------------------
BEGIN;
INSERT INTO `Z_Product_Criteria` VALUES ('0001', '小面包', '面包', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '12--月');
INSERT INTO `Z_Product_Criteria` VALUES ('0002', '巧克力', '糖果', '每单位：00001（30%，2--公斤）；00002（40%，3000--毫升）；00005（30%，15--袋）', '3--年');
COMMIT;

-- ----------------------------
-- Table structure for Z_Product_Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Z_Product_Warehouse`;
CREATE TABLE `Z_Product_Warehouse` (
  `Stock_no` char(40) DEFAULT NULL,
  `Product_no` char(20) DEFAULT NULL,
  `Staff_no_storage` char(20) DEFAULT NULL COMMENT '成品负责人编号',
  `Manufacture_date` datetime DEFAULT NULL,
  `Guarantee_period` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Stock_num` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Staff_no_workshop` char(20) DEFAULT NULL COMMENT '车间负责人编号',
  `Storage_address` char(255) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Product_Warehouse
-- ----------------------------
BEGIN;
INSERT INTO `Z_Product_Warehouse` VALUES ('00000001', '0001', '000002', '2019-11-21 10:27:00', NULL, '300--千克', '000003', '第一仓库', NULL);
INSERT INTO `Z_Product_Warehouse` VALUES ('00000002', '0001', '000002', '2019-11-01 10:27:00', NULL, '300--千克', '000003', '第一仓库', NULL);
INSERT INTO `Z_Product_Warehouse` VALUES ('00000003', '0001', '', '2019-11-21 11:30:13', NULL, '500--升', '', '大山食品厂----7625254号厂房', '');
INSERT INTO `Z_Product_Warehouse` VALUES ('00000004', '0001', '', '2019-11-21 11:33:21', NULL, '500--升', '', '大山食品厂----7625254号厂房', '');
INSERT INTO `Z_Product_Warehouse` VALUES ('00000005', '0001', '', '2019-11-21 18:33:55', NULL, '500--升', '', '大山食品厂----7625254号厂房', '');
INSERT INTO `Z_Product_Warehouse` VALUES ('00000006', '0001', '', '2019-11-21 08:58:38', NULL, '500--升', '', '大山食品厂----7625254号厂房', '');
COMMIT;

-- ----------------------------
-- Table structure for Z_Raw_Materials_Criteria
-- ----------------------------
DROP TABLE IF EXISTS `Z_Raw_Materials_Criteria`;
CREATE TABLE `Z_Raw_Materials_Criteria` (
  `Material_no` char(40) DEFAULT NULL,
  `Material_name` char(100) DEFAULT NULL,
  `Material_type` char(30) DEFAULT NULL,
  `Guarantee_period` char(20) DEFAULT NULL COMMENT '数字+单位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Z_Raw_Materials_Warehouse
-- ----------------------------
DROP TABLE IF EXISTS `Z_Raw_Materials_Warehouse`;
CREATE TABLE `Z_Raw_Materials_Warehouse` (
  `Stock_no` char(40) NOT NULL,
  `Material_no` char(20) DEFAULT NULL,
  `Staff_no_storage` char(20) DEFAULT NULL,
  `Storage_address` char(255) DEFAULT NULL,
  `Product_date` datetime DEFAULT NULL,
  `Stock_num` char(20) DEFAULT NULL COMMENT '数字+单位',
  `Details` char(255) DEFAULT NULL COMMENT 's',
  PRIMARY KEY (`Stock_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Raw_Materials_Warehouse
-- ----------------------------
BEGIN;
INSERT INTO `Z_Raw_Materials_Warehouse` VALUES ('00000001', '0002', '000001', '巨魔蘸酱', '2019-11-09 11:32:46', NULL, NULL);
INSERT INTO `Z_Raw_Materials_Warehouse` VALUES ('00000002', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 11:33:21', '500--升', '');
INSERT INTO `Z_Raw_Materials_Warehouse` VALUES ('00000003', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 18:33:55', '500--升', '');
INSERT INTO `Z_Raw_Materials_Warehouse` VALUES ('00000004', '0001', '', '大山食品厂----10086号厂房', '2019-11-21 08:58:38', '500--升', '');
COMMIT;

-- ----------------------------
-- Table structure for Z_Refund_Application
-- ----------------------------
DROP TABLE IF EXISTS `Z_Refund_Application`;
CREATE TABLE `Z_Refund_Application` (
  `Refund_no` char(40) DEFAULT NULL,
  `Order_no` char(40) DEFAULT NULL,
  `Client_no` char(20) DEFAULT NULL,
  `Reason` char(255) DEFAULT NULL COMMENT '不合格成品+详情',
  `Staff_no_checker` char(20) DEFAULT NULL,
  `Progress` char(20) DEFAULT NULL,
  `Permission` int(255) DEFAULT NULL,
  `Refund_Payment` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Refund_Application
-- ----------------------------
BEGIN;
INSERT INTO `Z_Refund_Application` VALUES ('00000001', '00000001', '000003', '产品质量问题', '000002', '提交成功', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for Z_Staff
-- ----------------------------
DROP TABLE IF EXISTS `Z_Staff`;
CREATE TABLE `Z_Staff` (
  `Staff_no` char(20) DEFAULT NULL,
  `Staff_name` char(30) DEFAULT NULL,
  `Password` char(50) DEFAULT NULL,
  `Department` char(20) DEFAULT NULL,
  `Workshop` char(40) DEFAULT NULL,
  `Authority` char(255) DEFAULT NULL,
  `Busy` int(255) DEFAULT NULL,
  `Position` char(20) DEFAULT NULL,
  `Details` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Z_Staff
-- ----------------------------
BEGIN;
INSERT INTO `Z_Staff` VALUES ('11111', '11111', '12345', '销售', NULL, NULL, 20, '5', NULL);
INSERT INTO `Z_Staff` VALUES ('12', 'wfwqf', 'wwqe', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Z_Staff` VALUES ('12345', '12345', '12345', '销售', NULL, NULL, 13, NULL, NULL);
INSERT INTO `Z_Staff` VALUES ('fdfs', 'dgf', 'r3', '35245', 'scs342', '3423', 5, '0', 'trege');
INSERT INTO `Z_Staff` VALUES ('zzz', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Z_Staff` VALUES ('zzz1', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Z_Staff` VALUES ('987654321', '<无名氏>', 'e10adc3949ba59abbe56e057f20f883e', '生产车间', '车间A', '8', 0, '普通职工', '');
INSERT INTO `Z_Staff` VALUES ('00001', '11111', '12345', '销售', NULL, NULL, 20, '5', NULL);
INSERT INTO `Z_Staff` VALUES ('00002', '12345', '12345', '销售', NULL, NULL, 13, NULL, NULL);
INSERT INTO `Z_Staff` VALUES ('00003', '<无名氏>', 'e10adc3949ba59abbe56e057f20f883e', '生产车间', '车间A', '8', 0, '普通职工', '');
INSERT INTO `Z_Staff` VALUES ('000001', '11111', '827ccb0eea8a706c4c34a16891f84e7b', '销售', NULL, '0101110110101001110101', 20, '5', NULL);
INSERT INTO `Z_Staff` VALUES ('000002', '1234', '827ccb0eea8a706c4c34a16891f84e7b', '销售', NULL, '0101110110101001110101', 13, NULL, NULL);
INSERT INTO `Z_Staff` VALUES ('000003', '12345', '827ccb0eea8a706c4c34a16891f84e7b', '生产车间', '车间A', '0101110110101001110101', 0, '普通职工', '');
INSERT INTO `Z_Staff` VALUES ('000004', 'TCP/IP', 'ba7bc92fcd57e337ebb9e74308c811f', '生产车间', '车间A', '0101110110101001110101', 0, '普通职工', '');
COMMIT;

-- ----------------------------
-- View structure for popularity_products
-- ----------------------------
DROP VIEW IF EXISTS `popularity_products`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `popularity_products` AS select `order_details`.`Product_no` AS `Product_no`,count(`order_details`.`Product_no`) AS `count(Order_Details.Product_no)` from `order_details` group by `order_details`.`Product_no` order by count(`order_details`.`Product_no`) desc;

-- ----------------------------
-- Triggers structure for table Client
-- ----------------------------
DROP TRIGGER IF EXISTS `client_trigger_insert`;
delimiter ;;
CREATE TRIGGER `client_trigger_insert` AFTER INSERT ON `Client` FOR EACH ROW begin 
	INSERT 
	INTO Z_Client(Client_no,Client_name,Client_type,Credit,Details,password) 
	VALUES (New.Client_no,new.Client_name,new.Client_type,new.Credit,new.Details,new.password);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Client
-- ----------------------------
DROP TRIGGER IF EXISTS `client_trigger_update`;
delimiter ;;
CREATE TRIGGER `client_trigger_update` AFTER UPDATE ON `Client` FOR EACH ROW begin 
DELETE from Z_Client where Z_Client.Client_no = new.Client_no;
INSERT 
	INTO Z_Client(Client_no,Client_name,Client_type,Credit,Details,password) 
	VALUES (New.Client_no,new.Client_name,new.Client_type,new.Credit,new.Details,new.password);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Export_Record
-- ----------------------------
DROP TRIGGER IF EXISTS `Export_Record_trigger_add`;
delimiter ;;
CREATE TRIGGER `Export_Record_trigger_add` AFTER INSERT ON `Export_Record` FOR EACH ROW begin 
	INSERT 
	INTO Z_Export_Record(Export_no,Staff_no,Order_no_details,Source_place,Target_place,Delivery_date,Transport_link,Progress) 
	VALUES (New.Export_no,new.Staff_no,new.Order_no_details,new.Source_place,new.Target_place,new.Delivery_date,new.Transport_link,new.Progress);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Export_Record
-- ----------------------------
DROP TRIGGER IF EXISTS `Export_Record_trigger_update`;
delimiter ;;
CREATE TRIGGER `Export_Record_trigger_update` AFTER UPDATE ON `Export_Record` FOR EACH ROW begin 
DELETE from Z_Export_Record where Z_Export_Record.Export_no = new.Export_no;
	INSERT 
	INTO Z_Export_Record(Export_no,Staff_no,Order_no_details,Source_place,Target_place,Delivery_date,Transport_link,Progress) 
	VALUES (New.Export_no,new.Staff_no,new.Order_no_details,new.Source_place,new.Target_place,new.Delivery_date,new.Transport_link,new.Progress);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Order_Details
-- ----------------------------
DROP TRIGGER IF EXISTS `Order_Details_trigger_add`;
delimiter ;;
CREATE TRIGGER `Order_Details_trigger_add` AFTER INSERT ON `Order_Details` FOR EACH ROW begin 
	INSERT 
	INTO Z_Order_Details(Order_no_details,Product_no,Products_requirement,Client_no,Delivery_date,payment_deadline) 
	VALUES (New.Order_no_details,new.Product_no,new.Products_requirement,new.Client_no,new.Delivery_date,new.payment_deadline);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Order_Details
-- ----------------------------
DROP TRIGGER IF EXISTS `Order_Details_trigger_update`;
delimiter ;;
CREATE TRIGGER `Order_Details_trigger_update` AFTER UPDATE ON `Order_Details` FOR EACH ROW begin 
DELETE from Z_Order_Details where Z_Order_Details.Order_no_details = new.Order_no_details;
	INSERT 
	INTO Z_Order_Details(Order_no_details,Product_no,Products_requirement,Client_no,Delivery_date,payment_deadline) 
	VALUES (New.Order_no_details,new.Product_no,new.Products_requirement,new.Client_no,new.Delivery_date,new.payment_deadline);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Order_Form
-- ----------------------------
DROP TRIGGER IF EXISTS `Order_Form_trigger_add`;
delimiter ;;
CREATE TRIGGER `Order_Form_trigger_add` AFTER INSERT ON `Order_Form` FOR EACH ROW begin 
	INSERT 
	INTO Z_Order_Form(Order_no,Client_no,Staff_no,Order_create_date,Order_sum_amount,Progress,Liquidated_damages) 
	VALUES (New.Order_no,new.Client_no,new.Staff_no,new.Order_create_date,new.Order_sum_amount,new.Progress,new.Liquidated_damages);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Order_Form
-- ----------------------------
DROP TRIGGER IF EXISTS `Order_Form_trigger_update`;
delimiter ;;
CREATE TRIGGER `Order_Form_trigger_update` AFTER UPDATE ON `Order_Form` FOR EACH ROW begin 
DELETE from Z_Order_Form where Z_Order_Form.Order_no = new.Order_no;
	INSERT 
	INTO Z_Order_Form(Order_no,Client_no,Staff_no,Order_create_date,Order_sum_amount,Progress,Liquidated_damages) 
	VALUES (New.Order_no,new.Client_no,new.Staff_no,new.Order_create_date,new.Order_sum_amount,new.Progress,new.Liquidated_damages);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Payment
-- ----------------------------
DROP TRIGGER IF EXISTS `Payment_trigger_add`;
delimiter ;;
CREATE TRIGGER `Payment_trigger_add` AFTER INSERT ON `Payment` FOR EACH ROW begin 
	INSERT 
	INTO Z_Payment(Payment_no,Order_no,Staff_no_accountant,Money,Details) 
	VALUES (New.Payment_no,new.Order_no,new.Staff_no_accountant,new.Money,new.Details);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Payment
-- ----------------------------
DROP TRIGGER IF EXISTS `Payment_trigger_update`;
delimiter ;;
CREATE TRIGGER `Payment_trigger_update` AFTER UPDATE ON `Payment` FOR EACH ROW begin 
DELETE from Z_Payment where Z_Payment.Payment_no = new.Payment_no;
	INSERT 
	INTO Z_Payment(Payment_no,Order_no,Staff_no_accountant,Money,Details) 
	VALUES (New.Payment_no,new.Order_no,new.Staff_no_accountant,new.Money,new.Details);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Product_Criteria
-- ----------------------------
DROP TRIGGER IF EXISTS `Product_Criteria_trigger_add`;
delimiter ;;
CREATE TRIGGER `Product_Criteria_trigger_add` AFTER INSERT ON `Product_Criteria` FOR EACH ROW begin 
	INSERT 
	INTO Z_Product_Criteria(Product_no,Product_name,Product_type,ingredient_list,Guarantee_period) 
	VALUES (New.Product_no,new.Product_name,new.Product_type,new.ingredient_list,new.Guarantee_period);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Product_Criteria
-- ----------------------------
DROP TRIGGER IF EXISTS `Product_Criteria_trigger_update`;
delimiter ;;
CREATE TRIGGER `Product_Criteria_trigger_update` AFTER UPDATE ON `Product_Criteria` FOR EACH ROW begin 
DELETE from Z_Product_Criteria where Z_Product_Criteria.Product_no = new.Product_no;
	INSERT 
	INTO Z_Product_Criteria(Product_no,Product_name,Product_type,ingredient_list,Guarantee_period) 
	VALUES (New.Product_no,new.Product_name,new.Product_type,new.ingredient_list,new.Guarantee_period);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Product_Warehouse
-- ----------------------------
DROP TRIGGER IF EXISTS `Product_Warehouse_trigger_add`;
delimiter ;;
CREATE TRIGGER `Product_Warehouse_trigger_add` AFTER INSERT ON `Product_Warehouse` FOR EACH ROW begin 
	INSERT 
	INTO Z_Product_Warehouse(Storage_address,Stock_no,Product_no,Staff_no_storage,Manufacture_date,stock_num,staff_no_workshop,details) 
	VALUES (new.Storage_address,New.Stock_no,new.Product_no,new.Staff_no_storage,new.Manufacture_date,new.stock_num,new.staff_no_workshop,new.details);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Product_Warehouse
-- ----------------------------
DROP TRIGGER IF EXISTS `Product_Warehouse_trigger_update`;
delimiter ;;
CREATE TRIGGER `Product_Warehouse_trigger_update` AFTER UPDATE ON `Product_Warehouse` FOR EACH ROW begin 
DELETE from Z_Product_Warehouse where Z_Product_Warehouse.Stock_no = new.Stock_no;
	INSERT 
	INTO Z_Product_Warehouse(Storage_address,Stock_no,Product_no,Staff_no_storage,Manufacture_date,stock_num,staff_no_workshop,details) 
	VALUES (new.Storage_address,New.Stock_no,new.Product_no,new.Staff_no_storage,new.Manufacture_date,new.stock_num,new.staff_no_workshop,new.details);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Raw_Materials_Warehouse
-- ----------------------------
DROP TRIGGER IF EXISTS `Raw_Materials_Warehouse_trigger_add`;
delimiter ;;
CREATE TRIGGER `Raw_Materials_Warehouse_trigger_add` AFTER INSERT ON `Raw_Materials_Warehouse` FOR EACH ROW begin 
	INSERT 
	INTO Z_Raw_Materials_Warehouse(Stock_no,Material_no,Storage_address,Product_date,Staff_no_storage,details,Stock_num) 
	VALUES (New.Stock_no,new.Material_no,new.Storage_address,new.Product_date,new.Staff_no_storage,new.details,new.Stock_num);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Raw_Materials_Warehouse
-- ----------------------------
DROP TRIGGER IF EXISTS `Raw_Materials_Warehouse_trigger_update`;
delimiter ;;
CREATE TRIGGER `Raw_Materials_Warehouse_trigger_update` AFTER UPDATE ON `Raw_Materials_Warehouse` FOR EACH ROW begin 
DELETE from Z_Raw_Materials_Warehouse where Z_Raw_Materials_Warehouse.Stock_no = new.Stock_no;
	INSERT 
	INTO Z_Raw_Materials_Warehouse(Stock_no,Material_no,Storage_address,Product_date,Staff_no_storage,details,Stock_num) 
	VALUES (New.Stock_no,new.Material_no,new.Storage_address,new.Product_date,new.Staff_no_storage,new.details,new.Stock_num);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Refund_Application
-- ----------------------------
DROP TRIGGER IF EXISTS `Refund_Application_trigger_add`;
delimiter ;;
CREATE TRIGGER `Refund_Application_trigger_add` AFTER INSERT ON `Refund_Application` FOR EACH ROW begin 
	INSERT 
	INTO Z_Refund_Application(Refund_no,Order_no,Client_no,Reason,Staff_no_checker,Progress,Permission,Refund_payment) 
	VALUES (New.Refund_no,new.Order_no,new.Client_no,new.Reason,new.Staff_no_checker,new.Progress,new.Permission,new.Refund_payment);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Refund_Application
-- ----------------------------
DROP TRIGGER IF EXISTS `Refund_Application_trigger_update`;
delimiter ;;
CREATE TRIGGER `Refund_Application_trigger_update` AFTER UPDATE ON `Refund_Application` FOR EACH ROW begin 
DELETE from Z_Refund_Application where Z_Refund_Application.Refund_no = new.Refund_no;
	INSERT 
	INTO Z_Refund_Application(Refund_no,Order_no,Client_no,Reason,Staff_no_checker,Progress,Permission,Refund_payment) 
	VALUES (New.Refund_no,new.Order_no,new.Client_no,new.Reason,new.Staff_no_checker,new.Progress,new.Permission,new.Refund_payment);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Staff
-- ----------------------------
DROP TRIGGER IF EXISTS `Staff_trigger_add`;
delimiter ;;
CREATE TRIGGER `Staff_trigger_add` AFTER INSERT ON `Staff` FOR EACH ROW begin 
	INSERT 
	INTO Z_Staff(Staff_no,Staff_name,Department,Workshop,authority,password,details,Busy,Position) 
	VALUES (New.Staff_no,new.Staff_name,new.Department,new.Workshop,new.authority,new.password,new.details,new.Busy,new.Position);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Staff
-- ----------------------------
DROP TRIGGER IF EXISTS `Staff_trigger_update`;
delimiter ;;
CREATE TRIGGER `Staff_trigger_update` AFTER UPDATE ON `Staff` FOR EACH ROW begin 
DELETE from Z_Staff where Z_Staff.Staff_no = new.Staff_no;
	INSERT 
	INTO Z_Staff(Staff_no,Staff_name,Department,Workshop,authority,password,details,Busy,Position) 
	VALUES (New.Staff_no,new.Staff_name,new.Department,new.Workshop,new.authority,new.password,new.details,new.Busy,new.Position);
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
