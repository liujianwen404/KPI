/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : db_examine

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 20/02/2021 15:52:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '20201204.01', 'xt INIT Table', 'SQL', 'V20201204_01__xt_INIT_Table.sql', 1026842755, 'examine', '2021-01-18 11:12:13', 9200, 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'report_data_source', '报表数据源表', NULL, NULL, 'ReportDataSource', 'crud', 'com.xt.examine.report', 'report', 'datasource', '报数据源', 'ruoyi', '1', 'D:/report1/', '{\"parentMenuId\":\"3\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统工具\",\"treeCode\":\"\"}', 'admin', '2020-11-26 18:45:54', '', '2020-11-26 18:51:11', '');
INSERT INTO `gen_table` VALUES (2, 't_business_journal', '员工日报表', NULL, NULL, 'TBusinessJournal', 'crud', 'com.ruoyi.system', 'system', 'journal', '员工日报', 'ruoyi', '0', '/', NULL, 'admin', '2021-01-19 18:15:00', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 't_performance_collect', '个人月度绩效考核汇总表', NULL, NULL, 'PerformanceCollect', 'crud', 'com.ruoyi.business', 'admin', 'collect', '个人月度绩效考核汇总', 'ruoyi', '0', '/', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2021-02-18 15:18:10', '', '2021-02-18 15:24:14', '');
INSERT INTO `gen_table` VALUES (4, 't_performance_job', '个人工作表现考核表', NULL, NULL, 'PerformanceJob', 'crud', 'com.ruoyi.business', 'admin', 'job', '个人工作现考核', 'ruoyi', '0', '/', '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2021-02-18 15:18:10', '', '2021-02-18 15:24:20', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', '数据源名称', 'varchar(72)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (3, '1', 'code', '数据源代码', 'varchar(72)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (4, '1', 'url', '连接地址', 'varchar(256)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (5, '1', 'username', '用户名', 'varchar(64)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (6, '1', 'password', '密码', 'varchar(128)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (7, '1', 'initial_size', '初始连接数', 'int(11)', 'Long', 'initialSize', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (8, '1', 'min_idle', '最小连接池数量', 'int(11)', 'Long', 'minIdle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (9, '1', 'max_active', '最大连接池数量', 'int(11)', 'Long', 'maxActive', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (10, '1', 'max_wait', '配置获取连接等待超时的时间', 'int(11)', 'Long', 'maxWait', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (11, '1', 'validation_query', '配置检测连接是否有效', 'varchar(128)', 'String', 'validationQuery', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (12, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (13, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (14, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (15, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (16, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2020-11-26 18:45:54', NULL, '2020-11-26 18:51:11');
INSERT INTO `gen_table_column` VALUES (17, '2', 'id', '主键ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'date', '日期', 'date', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '2', 'zentao_id', '禅道任务ID', 'bigint(20)', 'Long', 'zentaoId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'zentao_name', '禅道任务名称', 'varchar(255)', 'String', 'zentaoName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'task_progress', '任务进度', 'varchar(255)', 'String', 'taskProgress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'emp_id', '员工id', 'bigint(20)', 'Long', 'empId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '2', 'emp_name', '员工名称', 'varchar(255)', 'String', 'empName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '2', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '2', 'dept_name', '部门名称', 'varchar(255)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '2', 'post_id', '岗位id', 'bigint(20)', 'Long', 'postId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '2', 'post_name', '岗位名称', 'varchar(255)', 'String', 'postName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '2', 'create_id', '创建者id', 'bigint(20)', 'Long', 'createId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '2', 'update_id', '更新者id', 'bigint(20)', 'Long', 'updateId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '2', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 19, 'admin', '2021-01-19 18:15:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '3', 'id', '主键ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (37, '3', 'date', '日期', 'date', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (38, '3', 'job_schedule', '工作进度', 'decimal(10,2)', 'BigDecimal', 'jobSchedule', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (39, '3', 'job_quality', '工作质量', 'decimal(10,2)', 'BigDecimal', 'jobQuality', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (40, '3', 'job_performance', '工作表现', 'decimal(10,2)', 'BigDecimal', 'jobPerformance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (41, '3', 'product_satisfaction', '产品满意度', 'varchar(255)', 'String', 'productSatisfaction', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (42, '3', 'assess_total', '考核合计', 'decimal(10,2)', 'BigDecimal', 'assessTotal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (43, '3', 'learning_promotion', '学习提升', 'decimal(10,2)', 'BigDecimal', 'learningPromotion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (44, '3', 'quality_assurance', '质量保障', 'decimal(10,2)', 'BigDecimal', 'qualityAssurance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (45, '3', 'patent', '专利资质', 'decimal(10,2)', 'BigDecimal', 'patent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (46, '3', 'efficiency', '效率优化', 'decimal(10,2)', 'BigDecimal', 'efficiency', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (47, '3', 'encourage_total', '鼓励合计', 'decimal(10,2)', 'BigDecimal', 'encourageTotal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (48, '3', 'performance_grade', '绩效评分', 'decimal(10,2)', 'BigDecimal', 'performanceGrade', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (49, '3', 'performance_rate', '绩效评级', 'decimal(10,2)', 'BigDecimal', 'performanceRate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (50, '3', 'user_id', '员工id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (51, '3', 'user_name', '员工姓名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 16, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (52, '3', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (53, '3', 'dept_name', '部门名称', 'varchar(255)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 18, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (54, '3', 'post_id', '岗位id', 'bigint(20)', 'Long', 'postId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (55, '3', 'post_name', '岗位名称', 'varchar(255)', 'String', 'postName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 20, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (56, '3', 'create_id', '创建者id', 'bigint(20)', 'Long', 'createId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (57, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (58, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (59, '3', 'update_id', '更新者id', 'bigint(20)', 'Long', 'updateId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (60, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 25, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (61, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 26, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (62, '3', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 27, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (63, '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 28, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:14');
INSERT INTO `gen_table_column` VALUES (64, '4', 'id', '主键ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (65, '4', 'date', '日期', 'date', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (66, '4', 'info_code_standards', '代码规范（个人）', 'decimal(10,2)', 'BigDecimal', 'infoCodeStandards', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (67, '4', 'info_coordination', '沟通协调（个人）', 'decimal(10,2)', 'BigDecimal', 'infoCoordination', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (68, '4', 'info_responsibility', '责任感（个人）', 'decimal(10,2)', 'BigDecimal', 'infoResponsibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (69, '4', 'opinion', '意见建议', 'varchar(255)', 'String', 'opinion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (70, '4', 'superior_code_standards', '代码规范（上级）', 'decimal(10,2)', 'BigDecimal', 'superiorCodeStandards', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (71, '4', 'superior_coordination', '沟通协调（上级）', 'decimal(10,2)', 'BigDecimal', 'superiorCoordination', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (72, '4', 'superior_responsibility', '责任感（上级）', 'decimal(10,2)', 'BigDecimal', 'superiorResponsibility', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (73, '4', 'superior_grade', '上级评分', 'decimal(10,2)', 'BigDecimal', 'superiorGrade', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (74, '4', 'explain', '说明', 'varchar(255)', 'String', 'explain', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (75, '4', 'user_id', '员工id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (76, '4', 'user_name', '员工姓名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 13, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (77, '4', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (78, '4', 'dept_name', '部门名称', 'varchar(255)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 15, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (79, '4', 'post_id', '岗位id', 'bigint(20)', 'Long', 'postId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (80, '4', 'post_name', '岗位名称', 'varchar(255)', 'String', 'postName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 17, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (81, '4', 'create_id', '创建者id', 'bigint(20)', 'Long', 'createId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (82, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (83, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (84, '4', 'update_id', '更新者id', 'bigint(20)', 'Long', 'updateId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (85, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (86, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (87, '4', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');
INSERT INTO `gen_table_column` VALUES (88, '4', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 25, 'admin', '2021-02-18 15:18:10', NULL, '2021-02-18 15:24:20');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E74697479000000000000000102000A4C0008637265617465427971007E00094C0008637265617465496471007E000A4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C0008757064617465496471007E000A4C000A75706461746554696D6571007E000C787074000561646D696E707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001760405BA88787070740000707070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E74697479000000000000000102000A4C0008637265617465427971007E00094C0008637265617465496471007E000A4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C0008757064617465496471007E000A4C000A75706461746554696D6571007E000C787074000561646D696E707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001760405BA88787070740000707070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E74697479000000000000000102000A4C0008637265617465427971007E00094C0008637265617465496471007E000A4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C0008757064617465496471007E000A4C000A75706461746554696D6571007E000C787074000561646D696E707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001760405BA88787070740000707070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'PC-20200505EEJK1613804762453', 1613807526621, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1613804770000, -1, 5, 'PAUSED', 'CRON', 1613804762000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1613804775000, -1, 5, 'PAUSED', 'CRON', 1613804763000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1613804780000, -1, 5, 'PAUSED', 'CRON', 1613804763000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-11-26 18:07:31', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-11-26 18:07:31', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-11-26 18:07:31', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2020-11-26 18:07:31', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2020-11-26 18:07:31', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2020-11-26 18:07:31', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2020-11-26 18:07:32', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2020-11-26 18:07:32', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2020-11-26 18:07:32', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 100, '0,100', '总经办', 0, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (2, 100, '0,100', '经营中心', 1, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (3, 100, '0,100', '人力资源管理中心', 2, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (4, 100, '0,100', '财务部', 3, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (5, 100, '0,100', '供应链中心', 4, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (6, 100, '0,100', '技术中心', 5, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', 'admin', '2021-02-18 17:36:59');
INSERT INTO `sys_dept` VALUES (7, 6, '0,100,6', '产品部', 0, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (8, 26, '0,100,6,26', '软件开发部', 5, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', 'admin', '2021-02-18 17:36:59');
INSERT INTO `sys_dept` VALUES (9, 26, '0,100,6,26', '质量保障部', 15, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (10, 7, '0,100,6,7', '产品组', 1, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (11, 26, '0,100,6,26', '产品设计部', 2, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', '', NULL);
INSERT INTO `sys_dept` VALUES (12, 7, '0,100,6,7', '架构组', 3, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (13, 8, '0,100,6,26,8', '到店线', 6, '113', '', 'wujun0400@dingtalk.com', '0', '0', 'admin', '2021-01-20 15:26:43', 'admin', '2021-02-17 15:43:09');
INSERT INTO `sys_dept` VALUES (14, 8, '0,100,6,26,8', '仓储线', 7, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (15, 8, '0,100,6,26,8', '客户线', 8, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (16, 8, '0,100,6,26,8', '到家线', 9, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (17, 9, '0,100,6,26,9', '测试组', 16, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (18, 9, '0,100,6,26,9', '运维组', 17, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (19, 9, '0,100,6,26,9', '实施组', 18, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (20, 8, '0,100,6,26,8', '支撑线', 10, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (21, 8, '0,100,6,26,8', '客服线', 11, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (22, 8, '0,100,6,26,8', '成本线', 12, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:43', '', NULL);
INSERT INTO `sys_dept` VALUES (23, 8, '0,100,6,26,8', '人力线', 13, '113', '', 'wujun0400@dingtalk.com', '0', '0', 'admin', '2021-01-20 15:26:43', 'admin', '2021-02-18 17:36:59');
INSERT INTO `sys_dept` VALUES (24, 26, '0,100,6,26', '行政组', 25, '100', '', '', '0', '0', 'admin', '2021-01-20 15:26:43', 'admin', '2021-01-20 16:23:54');
INSERT INTO `sys_dept` VALUES (26, 6, '0,100,6', '研发部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2021-01-20 15:26:42', 'admin', '2021-02-18 17:36:59');
INSERT INTO `sys_dept` VALUES (100, 0, '0', '鲜恬科技', 0, '1', '15888888888', 'xt@qq.com', '0', '0', 'admin', '2020-11-26 18:07:11', 'admin', '2021-02-18 17:36:59');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:29', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-26 18:07:30', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-11-26 18:07:28', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-11-26 18:07:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-11-26 18:07:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-26 18:07:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 437 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 11:27:11');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 12:03:02');
INSERT INTO `sys_logininfor` VALUES (178, 'liuhaha', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-18 12:03:10');
INSERT INTO `sys_logininfor` VALUES (179, 'liuhaha', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-18 12:03:19');
INSERT INTO `sys_logininfor` VALUES (180, 'liuhaha', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-18 12:03:22');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:47:09');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 17:16:57');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 18:51:19');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 19:20:50');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 19:21:40');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 19:30:56');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 09:45:42');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 10:07:32');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 15:10:04');
INSERT INTO `sys_logininfor` VALUES (190, 'molifang', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-19 15:10:18');
INSERT INTO `sys_logininfor` VALUES (191, 'molifang', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-19 15:10:21');
INSERT INTO `sys_logininfor` VALUES (192, 'molifang', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-19 15:10:25');
INSERT INTO `sys_logininfor` VALUES (193, 'molifang', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:10:27');
INSERT INTO `sys_logininfor` VALUES (194, 'molifang', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 15:10:58');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:11:02');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 15:11:49');
INSERT INTO `sys_logininfor` VALUES (197, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:11:53');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:48:12');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:49:41');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:57:47');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 18:08:49');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '192.168.10.74', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 10:09:22');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '192.168.10.125', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-20 10:35:14');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '192.168.10.125', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 10:35:18');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 11:00:34');
INSERT INTO `sys_logininfor` VALUES (206, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:00:40');
INSERT INTO `sys_logininfor` VALUES (207, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:02:52');
INSERT INTO `sys_logininfor` VALUES (208, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 11:04:46');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:04:48');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 11:07:20');
INSERT INTO `sys_logininfor` VALUES (211, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:07:26');
INSERT INTO `sys_logininfor` VALUES (212, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 11:07:33');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:07:36');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 11:07:53');
INSERT INTO `sys_logininfor` VALUES (215, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:07:59');
INSERT INTO `sys_logininfor` VALUES (216, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 11:32:04');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 11:32:08');
INSERT INTO `sys_logininfor` VALUES (218, 'chenmingwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-01-20 13:53:05');
INSERT INTO `sys_logininfor` VALUES (219, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-01-20 14:22:39');
INSERT INTO `sys_logininfor` VALUES (220, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-01-20 14:23:04');
INSERT INTO `sys_logininfor` VALUES (221, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2021-01-20 14:23:40');
INSERT INTO `sys_logininfor` VALUES (222, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-01-20 14:39:50');
INSERT INTO `sys_logininfor` VALUES (223, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-01-20 14:40:14');
INSERT INTO `sys_logininfor` VALUES (224, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2021-01-20 14:40:48');
INSERT INTO `sys_logininfor` VALUES (225, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-01-20 15:12:59');
INSERT INTO `sys_logininfor` VALUES (226, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 15:13:28');
INSERT INTO `sys_logininfor` VALUES (227, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 15:13:48');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 15:13:51');
INSERT INTO `sys_logininfor` VALUES (229, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-01-20 15:26:43');
INSERT INTO `sys_logininfor` VALUES (230, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-01-20 15:27:04');
INSERT INTO `sys_logininfor` VALUES (231, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-20 15:27:13');
INSERT INTO `sys_logininfor` VALUES (232, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 15:27:18');
INSERT INTO `sys_logininfor` VALUES (233, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 15:27:21');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 15:27:26');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:07:30');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:11:14');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:17:59');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:23:27');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:42:06');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:43:37');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 16:47:42');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 17:07:46');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 17:28:40');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 17:32:48');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 17:39:51');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-20 17:46:15');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 17:46:17');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 17:57:51');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-20 18:04:19');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 18:04:20');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 18:12:50');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 18:29:25');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 18:43:17');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:15:00');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:17:36');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:20:53');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:40:06');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:43:53');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:50:14');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:55:18');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 10:58:09');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:00:45');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:03:17');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:07:32');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:15:39');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:20:48');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:34:34');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:37:34');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:41:14');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:43:05');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:45:34');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:48:35');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 13:45:08');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 13:47:49');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 13:53:19');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 13:58:31');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:16:32');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:17:40');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:20:40');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:34:30');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:36:49');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:57:12');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:01:09');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:03:16');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:05:45');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:07:56');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:16:37');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-21 15:18:38');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:18:41');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:27:41');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:30:32');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:32:53');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:36:48');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:40:56');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-21 15:44:02');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:44:05');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:54:41');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 15:59:27');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 16:03:23');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 16:07:18');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 16:58:30');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 17:22:39');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 17:28:53');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 17:38:06');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 17:50:20');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:02:34');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:05:32');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:16:08');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:21:54');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:24:59');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:26:56');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:29:14');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 18:32:08');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-28 16:22:04');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 11:28:28');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-02 11:36:11');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 11:36:14');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 13:33:08');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-02 13:34:19');
INSERT INTO `sys_logininfor` VALUES (320, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-02 13:34:25');
INSERT INTO `sys_logininfor` VALUES (321, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-02 13:34:30');
INSERT INTO `sys_logininfor` VALUES (322, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-02-02 13:34:35');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-02 13:34:44');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 13:35:05');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-02 13:36:00');
INSERT INTO `sys_logininfor` VALUES (326, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-02 13:36:08');
INSERT INTO `sys_logininfor` VALUES (327, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 13:36:21');
INSERT INTO `sys_logininfor` VALUES (328, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-02 13:37:08');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 13:37:10');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-02 13:37:54');
INSERT INTO `sys_logininfor` VALUES (331, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 13:38:03');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 14:00:06');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 14:11:34');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-02 14:47:32');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-17 14:47:58');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-17 15:40:56');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 16:51:18');
INSERT INTO `sys_logininfor` VALUES (338, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-18 16:51:28');
INSERT INTO `sys_logininfor` VALUES (339, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-18 16:51:31');
INSERT INTO `sys_logininfor` VALUES (340, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-02-18 16:52:17');
INSERT INTO `sys_logininfor` VALUES (341, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-18 16:52:32');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-18 16:53:18');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 16:53:25');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 16:54:07');
INSERT INTO `sys_logininfor` VALUES (345, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 16:54:13');
INSERT INTO `sys_logininfor` VALUES (346, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-18 16:55:33');
INSERT INTO `sys_logininfor` VALUES (347, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 16:55:36');
INSERT INTO `sys_logininfor` VALUES (348, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 16:55:54');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 16:55:58');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 16:59:22');
INSERT INTO `sys_logininfor` VALUES (351, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 16:59:29');
INSERT INTO `sys_logininfor` VALUES (352, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 17:00:16');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:00:19');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:05:23');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 17:05:26');
INSERT INTO `sys_logininfor` VALUES (356, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:05:32');
INSERT INTO `sys_logininfor` VALUES (357, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:21:56');
INSERT INTO `sys_logininfor` VALUES (358, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:23:25');
INSERT INTO `sys_logininfor` VALUES (359, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 17:25:18');
INSERT INTO `sys_logininfor` VALUES (360, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:25:24');
INSERT INTO `sys_logininfor` VALUES (361, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 17:25:27');
INSERT INTO `sys_logininfor` VALUES (362, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-02-18 17:26:29');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:26:35');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:34:52');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 17:37:54');
INSERT INTO `sys_logininfor` VALUES (366, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:38:02');
INSERT INTO `sys_logininfor` VALUES (367, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-18 17:47:44');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 17:47:46');
INSERT INTO `sys_logininfor` VALUES (369, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:10:42');
INSERT INTO `sys_logininfor` VALUES (370, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:13:29');
INSERT INTO `sys_logininfor` VALUES (371, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:14:48');
INSERT INTO `sys_logininfor` VALUES (372, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-18 18:19:45');
INSERT INTO `sys_logininfor` VALUES (373, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-18 18:19:47');
INSERT INTO `sys_logininfor` VALUES (374, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:19:54');
INSERT INTO `sys_logininfor` VALUES (375, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:22:08');
INSERT INTO `sys_logininfor` VALUES (376, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:30:52');
INSERT INTO `sys_logininfor` VALUES (377, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:40:47');
INSERT INTO `sys_logininfor` VALUES (378, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:41:51');
INSERT INTO `sys_logininfor` VALUES (379, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:44:12');
INSERT INTO `sys_logininfor` VALUES (380, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-18 18:47:05');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 10:59:29');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:06:04');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 14:06:48');
INSERT INTO `sys_logininfor` VALUES (384, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:06:54');
INSERT INTO `sys_logininfor` VALUES (385, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 14:07:02');
INSERT INTO `sys_logininfor` VALUES (386, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:07:07');
INSERT INTO `sys_logininfor` VALUES (387, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 14:07:11');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:07:14');
INSERT INTO `sys_logininfor` VALUES (389, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:29:53');
INSERT INTO `sys_logininfor` VALUES (390, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:35:19');
INSERT INTO `sys_logininfor` VALUES (391, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:40:26');
INSERT INTO `sys_logininfor` VALUES (392, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:43:38');
INSERT INTO `sys_logininfor` VALUES (393, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:55:11');
INSERT INTO `sys_logininfor` VALUES (394, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 14:59:16');
INSERT INTO `sys_logininfor` VALUES (395, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:02:41');
INSERT INTO `sys_logininfor` VALUES (396, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:04:00');
INSERT INTO `sys_logininfor` VALUES (397, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:04:04');
INSERT INTO `sys_logininfor` VALUES (398, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:04:10');
INSERT INTO `sys_logininfor` VALUES (399, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:04:14');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:04:16');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:07:45');
INSERT INTO `sys_logininfor` VALUES (402, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:07:50');
INSERT INTO `sys_logininfor` VALUES (403, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:08:11');
INSERT INTO `sys_logininfor` VALUES (404, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:08:17');
INSERT INTO `sys_logininfor` VALUES (405, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:12:25');
INSERT INTO `sys_logininfor` VALUES (406, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:12:57');
INSERT INTO `sys_logininfor` VALUES (407, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:13:05');
INSERT INTO `sys_logininfor` VALUES (408, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:21:14');
INSERT INTO `sys_logininfor` VALUES (409, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:24:45');
INSERT INTO `sys_logininfor` VALUES (410, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:24:53');
INSERT INTO `sys_logininfor` VALUES (411, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:24:59');
INSERT INTO `sys_logininfor` VALUES (412, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:25:06');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:25:08');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:25:25');
INSERT INTO `sys_logininfor` VALUES (415, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:25:33');
INSERT INTO `sys_logininfor` VALUES (416, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:25:41');
INSERT INTO `sys_logininfor` VALUES (417, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:25:47');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:32:22');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:32:40');
INSERT INTO `sys_logininfor` VALUES (420, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:32:45');
INSERT INTO `sys_logininfor` VALUES (421, 'wujun', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 15:33:00');
INSERT INTO `sys_logininfor` VALUES (422, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 15:33:06');
INSERT INTO `sys_logininfor` VALUES (423, 'liujianwen', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-19 16:07:03');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 16:07:07');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 17:22:56');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 17:26:32');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 17:51:36');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 18:09:44');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-19 18:35:55');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 11:27:53');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 13:44:39');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 14:35:09');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 14:38:17');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 14:53:26');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 15:06:12');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-20 15:43:52');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'admin', '2020-11-26 18:07:14', 'admin', '2021-02-18 14:02:44', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'admin', '2020-11-26 18:07:14', 'admin', '2021-02-18 14:02:52', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 2, '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'admin', '2020-11-26 18:07:14', 'admin', '2021-02-18 14:02:48', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '鲜恬官网', 0, 0, 'http://121.com', 'menuBlank', 'C', '0', '', 'fa fa-location-arrow', 'admin', '2020-11-26 18:07:14', 'admin', '2021-02-18 14:02:38', '鲜恬官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', 'fa fa-user-o', 'admin', '2020-11-26 18:07:14', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', 'fa fa-user-secret', 'admin', '2020-11-26 18:07:14', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', 'fa fa-th-list', 'admin', '2020-11-26 18:07:14', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', 'fa fa-outdent', 'admin', '2020-11-26 18:07:14', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', 'fa fa-address-card-o', 'admin', '2020-11-26 18:07:14', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2020-11-26 18:07:14', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', 'fa fa-sun-o', 'admin', '2020-11-26 18:07:14', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2020-11-26 18:07:14', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', 'fa fa-pencil-square-o', 'admin', '2020-11-26 18:07:14', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2020-11-26 18:07:14', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', 'fa fa-tasks', 'admin', '2020-11-26 18:07:15', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', 'fa fa-bug', 'admin', '2020-11-26 18:07:15', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', 'monitor:server:view', 'fa fa-server', 'admin', '2020-11-26 18:07:15', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', 'monitor:cache:view', 'fa fa-cube', 'admin', '2020-11-26 18:07:15', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', 'fa fa-wpforms', 'admin', '2020-11-26 18:07:15', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', 'fa fa-code', 'admin', '2020-11-26 18:07:15', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', 'fa fa-gg', 'admin', '2020-11-26 18:07:15', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2020-11-26 18:07:15', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2020-11-26 18:07:15', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2020-11-26 18:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2020-11-26 18:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2020-11-26 18:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2020-11-26 18:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2020-11-26 18:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2020-11-26 18:07:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2020-11-26 18:07:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2020-11-26 18:07:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2020-11-26 18:07:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '任务管理', 0, 4, '#', 'menuItem', 'M', '0', '', 'fa fa-area-chart', 'admin', '2020-12-02 10:07:13', 'admin', '2021-02-18 14:03:04', '');
INSERT INTO `sys_menu` VALUES (2001, 'Bug清单', 2000, 5, '/zentao/bug', 'menuItem', 'C', '0', '', '#', 'admin', '2020-12-02 10:08:27', 'admin', '2020-12-02 15:50:19', '');
INSERT INTO `sys_menu` VALUES (2002, 'Bug统计', 2000, 6, '/zentao/bug/statistics', 'menuItem', 'C', '0', '', '#', 'admin', '2020-12-03 09:37:52', 'admin', '2020-12-03 13:59:04', '');
INSERT INTO `sys_menu` VALUES (2003, '任务清单', 2000, 1, '/zentao/task', 'menuItem', 'C', '0', NULL, '#', 'admin', '2020-12-03 13:59:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '任务统计', 2000, 2, '/zentao/task/statistics', 'menuItem', 'C', '1', '', '#', 'admin', '2020-12-03 14:00:28', 'admin', '2021-02-20 13:45:29', '');
INSERT INTO `sys_menu` VALUES (2005, '绩效考核生成', 2000, 99, '/performance/examine/upload', 'menuItem', 'C', '0', NULL, '#', 'admin', '2020-12-03 15:17:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '周报管理', 0, 6, '#', 'menuItem', 'M', '0', '', 'fa fa-calendar', 'admin', '2021-01-19 17:55:26', 'admin', '2021-02-18 14:03:19', '');
INSERT INTO `sys_menu` VALUES (2007, '日报管理', 2006, 1, '/business/journal', 'menuItem', 'C', '0', 'business:journal:view', '#', 'admin', '2021-01-19 17:56:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '查看日报列表', 2007, 1, '#', 'menuItem', 'F', '0', 'business:journal:list', '#', 'admin', '2021-01-20 11:06:05', 'admin', '2021-01-20 11:06:46', '');
INSERT INTO `sys_menu` VALUES (2009, '导出日报列表', 2007, 2, '#', 'menuItem', 'F', '0', 'business:journal:export', '#', 'admin', '2021-01-20 11:07:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '绩效考核', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-line-chart', 'admin', '2021-02-18 13:54:13', 'admin', '2021-02-18 14:03:11', '');
INSERT INTO `sys_menu` VALUES (2011, '工作表现', 2010, 2, '/business/performance/job', 'menuItem', 'C', '0', 'performance:job:view', '#', 'admin', '2021-02-18 13:57:41', 'admin', '2021-02-20 11:52:44', '');
INSERT INTO `sys_menu` VALUES (2012, '绩效考核汇总', 2010, 0, '/business/performance/collect', 'menuItem', 'C', '0', 'performance:collect:view', '#', 'admin', '2021-02-18 14:01:00', 'admin', '2021-02-20 11:52:55', '');
INSERT INTO `sys_menu` VALUES (2013, '工作进度', 2010, 1, '/zentao/task/statistics', 'menuItem', 'C', '0', NULL, '#', 'admin', '2021-02-20 11:52:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 362 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"鲜恬官网\"],\"url\":[\"http://121.com\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-18 11:30:00');
INSERT INTO `sys_oper_log` VALUES (135, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"刘剑文\"],\"deptName\":[\"\"],\"phonenumber\":[\"15927444878\"],\"email\":[\"\"],\"loginName\":[\"liujianwen\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 15:11:44');
INSERT INTO `sys_oper_log` VALUES (136, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"\"],\"taskProgress1\":[\"\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-19 16:31:35');
INSERT INTO `sys_oper_log` VALUES (137, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"\"],\"taskProgress1\":[\"\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-19 16:33:48');
INSERT INTO `sys_oper_log` VALUES (138, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"10%\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-19 16:41:16');
INSERT INTO `sys_oper_log` VALUES (139, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"123\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-19 16:47:12');
INSERT INTO `sys_oper_log` VALUES (140, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"123\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-19 16:55:51');
INSERT INTO `sys_oper_log` VALUES (141, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"123\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-19 16:56:10');
INSERT INTO `sys_oper_log` VALUES (142, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"建行卡\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', 'null', 1, 'Invalid bound statement (not found): com.ruoyi.business.mapper.JournalMapper.insert', '2021-01-19 16:57:51');
INSERT INTO `sys_oper_log` VALUES (143, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"复合弓\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', 'null', 1, 'Invalid bound statement (not found): com.ruoyi.business.mapper.JournalMapper.insert', '2021-01-19 17:02:27');
INSERT INTO `sys_oper_log` VALUES (144, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"123\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\r\n### The error may exist in com/ruoyi/business/mapper/JournalMapper.java (best guess)\r\n### The error may involve com.ruoyi.business.mapper.JournalMapper.insert\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-01-19 17:06:05');
INSERT INTO `sys_oper_log` VALUES (145, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"l好几款\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\r\n### The error may exist in com/ruoyi/business/mapper/JournalMapper.java (best guess)\r\n### The error may involve com.ruoyi.business.mapper.JournalMapper.insert\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2021-01-19 17:09:24');
INSERT INTO `sys_oper_log` VALUES (146, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"好几款\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:15:36');
INSERT INTO `sys_oper_log` VALUES (147, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\"],\"oldSize\":[\"1\"],\"task1\":[\"1351458274587152386\",\"2021-01-19\"],\"taskProgress1\":[\"好几款\"],\"date2\":[\"2021-01-20\"],\"taskProgress2\":[\"12\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1351458356057313281\' for key \'PRIMARY\'\r\n### The error may exist in com/ruoyi/business/mapper/JournalMapper.java (best guess)\r\n### The error may involve com.ruoyi.business.mapper.JournalMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_business_journal  ( id, date, zentao_id, zentao_name, task_progress, emp_id, emp_name,      create_id, create_by, create_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?,      ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1351458356057313281\' for key \'PRIMARY\'\n; Duplicate entry \'1351458356057313281\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1351458356057313281\' for key \'PRIMARY\'', '2021-01-19 17:15:55');
INSERT INTO `sys_oper_log` VALUES (148, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"10\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:18:43');
INSERT INTO `sys_oper_log` VALUES (149, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\"],\"oldSize\":[\"1\"],\"task1\":[\"1351458356057313282\",\"2021-01-19\"],\"taskProgress1\":[\"10\"],\"date2\":[\"2021-01-20\"],\"taskProgress2\":[\"20\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:18:51');
INSERT INTO `sys_oper_log` VALUES (150, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"id\":[\"1351458356057313282\"]}', 'null', 1, '', '2021-01-19 17:19:01');
INSERT INTO `sys_oper_log` VALUES (151, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"id\":[\"1351458356057313282\"]}', 'null', 1, '', '2021-01-19 17:19:49');
INSERT INTO `sys_oper_log` VALUES (152, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1351458356057313282\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:20:28');
INSERT INTO `sys_oper_log` VALUES (153, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1351458356057313283\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:22:17');
INSERT INTO `sys_oper_log` VALUES (154, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1351458356057313284\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:22:29');
INSERT INTO `sys_oper_log` VALUES (155, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"10\"],\"date2\":[\"2021-01-20\"],\"taskProgress2\":[\"20\"],\"count\":[\"2\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:24:44');
INSERT INTO `sys_oper_log` VALUES (156, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:24:51');
INSERT INTO `sys_oper_log` VALUES (157, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\"],\"oldSize\":[\"2\"],\"task1\":[\"2\"],\"date1\":[\"2021-01-20\"],\"taskProgress1\":[\"20\"],\"date2\":[\"2021-01-21\"],\"taskProgress2\":[\"30\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:25:10');
INSERT INTO `sys_oper_log` VALUES (158, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:26:07');
INSERT INTO `sys_oper_log` VALUES (159, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:26:11');
INSERT INTO `sys_oper_log` VALUES (160, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\"],\"oldSize\":[\"3\"],\"task1\":[\"4\"],\"date1\":[\"2021-01-21\"],\"taskProgress1\":[\"30\"],\"date2\":[\"2021-01-22\"],\"taskProgress2\":[\"40\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:27:00');
INSERT INTO `sys_oper_log` VALUES (161, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:28:57');
INSERT INTO `sys_oper_log` VALUES (162, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:29:05');
INSERT INTO `sys_oper_log` VALUES (163, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"10\"],\"date2\":[\"2021-01-20\"],\"taskProgress2\":[\"20\"],\"count\":[\"2\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:32:36');
INSERT INTO `sys_oper_log` VALUES (164, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:32:42');
INSERT INTO `sys_oper_log` VALUES (165, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\"],\"oldSize\":[\"2\"],\"task1\":[\"2\"],\"date1\":[\"2021-01-20\"],\"taskProgress1\":[\"20\"],\"date2\":[\"2021-01-21\"],\"taskProgress2\":[\"30\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:32:49');
INSERT INTO `sys_oper_log` VALUES (166, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:39:24');
INSERT INTO `sys_oper_log` VALUES (167, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:39:26');
INSERT INTO `sys_oper_log` VALUES (168, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"50\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:49:00');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"周报管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:55:26');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"日报管理\"],\"url\":[\"/business/journal\"],\"target\":[\"menuItem\"],\"perms\":[\"business:journal:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:56:16');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"绩效考核\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-area-chart\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 17:58:37');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_business_journal\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:15:00');
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/t_business_journal', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:15:10');
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_business_journal\"]}', 'null', 0, NULL, '2021-01-19 18:16:24');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_business_journal\"]}', 'null', 0, NULL, '2021-01-19 18:16:27');
INSERT INTO `sys_oper_log` VALUES (176, '员工日报', 3, 'com.ruoyi.business.controller.JournalController.remove()', 'POST', 1, 'admin', '研发部门', '/business/journal/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:40:33');
INSERT INTO `sys_oper_log` VALUES (177, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"30\"],\"count\":[\"1\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:40:41');
INSERT INTO `sys_oper_log` VALUES (178, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"1\",\"\"],\"oldSize\":[\"1\"],\"task1\":[\"5\",\"2021-01-18\"],\"taskProgress1\":[\"10\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:41:17');
INSERT INTO `sys_oper_log` VALUES (179, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"1\",\"\"],\"oldSize\":[\"1\"],\"task1\":[\"5\",\"2021-01-18\"],\"taskProgress1\":[\"10\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:41:29');
INSERT INTO `sys_oper_log` VALUES (180, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"1\",\"\"],\"oldSize\":[\"1\"],\"task1\":[\"5\",\"2021-01-18\"],\"taskProgress1\":[\"10\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:41:48');
INSERT INTO `sys_oper_log` VALUES (181, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"1\",\"\"],\"oldSize\":[\"1\"],\"task1\":[\"5\"],\"date1\":[\"2021-01-18\"],\"taskProgress1\":[\"10\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:42:50');
INSERT INTO `sys_oper_log` VALUES (182, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\"],\"oldSize\":[\"1\"],\"task1\":[\"5\"],\"date1\":[\"2021-01-18\"],\"taskProgress1\":[\"10\"],\"date2\":[\"2021-01-19\"],\"taskProgress2\":[\"20\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:43:06');
INSERT INTO `sys_oper_log` VALUES (183, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3347\"],\"zentaoName\":[\"iOS端--优惠券引导领取优化--页面开发及接口对接联调\"],\"count\":[\"2\",\"2\",\"\"],\"oldSize\":[\"2\",\"2\"],\"task1\":[\"5\"],\"date1\":[\"2021-01-18\"],\"taskProgress1\":[\"10.5\"],\"task2\":[\"6\"],\"date2\":[\"2021-01-19\"],\"taskProgress2\":[\"20\"],\"empId\":[\"1\"],\"empName\":[\"鲜恬\"],\"deptId\":[\"103\"],\"deptName\":[\"研发部门\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:43:32');
INSERT INTO `sys_oper_log` VALUES (184, '员工日报', 5, 'com.ruoyi.business.controller.JournalController.export()', 'POST', 1, 'admin', '研发部门', '/business/journal/export', '127.0.0.1', '内网IP', '{\"date\":[\"\"],\"zentaoName\":[\"\"],\"empName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"fa646fe3-8e4f-410c-ae71-17509277e3e0_journal.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:53:04');
INSERT INTO `sys_oper_log` VALUES (185, '员工日报', 5, 'com.ruoyi.business.controller.JournalController.export()', 'POST', 1, 'admin', '研发部门', '/business/journal/export', '127.0.0.1', '内网IP', '{\"date\":[\"\"],\"zentaoName\":[\"\"],\"empName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"8d7df5ba-c389-402d-82b5-21cba6fec3c4_journal.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-19 18:55:31');
INSERT INTO `sys_oper_log` VALUES (186, '员工日报', 5, 'com.ruoyi.business.controller.JournalController.export()', 'POST', 1, 'admin', '研发部门', '/business/journal/export', '127.0.0.1', '内网IP', '{\"date\":[\"\"],\"params[beginDate]\":[\"\"],\"params[endDate]\":[\"\"],\"zentaoName\":[\"\"],\"empName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"703a65f9-3109-4431-9f85-c9f6c85d47cf_journal.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 10:11:52');
INSERT INTO `sys_oper_log` VALUES (187, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'liujianwen', NULL, '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3965\"],\"zentaoName\":[\"OA用户主页--页面开发\"],\"date1\":[\"2021-01-17\"],\"taskProgress1\":[\"100\"],\"count\":[\"1\"],\"empId\":[\"101\"],\"empName\":[\"刘剑文\"],\"deptId\":[\"\"],\"deptName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:03:21');
INSERT INTO `sys_oper_log` VALUES (188, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'liujianwen', NULL, '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3966\"],\"zentaoName\":[\"OA用户主页--接口开发\"],\"date1\":[\"2021-01-18\"],\"taskProgress1\":[\"100\"],\"count\":[\"1\"],\"empId\":[\"101\"],\"empName\":[\"刘剑文\"],\"deptId\":[\"\"],\"deptName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:03:38');
INSERT INTO `sys_oper_log` VALUES (189, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'liujianwen', NULL, '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3965\"],\"zentaoName\":[\"OA用户主页--页面开发\"],\"count\":[\"1\",\"\"],\"oldSize\":[\"1\"],\"task1\":[\"7\"],\"date1\":[\"2021-01-18\"],\"taskProgress1\":[\"100\"],\"empId\":[\"101\"],\"empName\":[\"刘剑文\"],\"deptId\":[\"\"],\"deptName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:03:47');
INSERT INTO `sys_oper_log` VALUES (190, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'liujianwen', NULL, '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3969\"],\"zentaoName\":[\"周报功能--月度日历日报开发\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"50\"],\"count\":[\"1\"],\"empId\":[\"101\"],\"empName\":[\"刘剑文\"],\"deptId\":[\"\"],\"deptName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:04:15');
INSERT INTO `sys_oper_log` VALUES (191, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'liujianwen', NULL, '/business/journal/add', '127.0.0.1', '内网IP', '{\"zentaoId\":[\"3971\"],\"zentaoName\":[\"周报功能--导出个人一周excel开发\"],\"date1\":[\"2021-01-19\"],\"taskProgress1\":[\"20\"],\"count\":[\"1\"],\"empId\":[\"101\"],\"empName\":[\"刘剑文\"],\"deptId\":[\"\"],\"deptName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:04:42');
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"deptId\":[\"\"],\"userName\":[\"刘剑文\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"15927444878\"],\"email\":[\"\"],\"loginName\":[\"liujianwen\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:05:09');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"查看日报\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"business:journal:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:06:05');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"查看日报列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"business:journal:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:06:46');
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"导出日报列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"business:journal:export\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:07:05');
INSERT INTO `sys_oper_log` VALUES (196, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2003,2004,2001,2002,2005,2006,2007,2008,2009,4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 11:07:51');
INSERT INTO `sys_oper_log` VALUES (197, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"24\"],\"parentId\":[\"26\"],\"parentName\":[\"研发部\"],\"deptName\":[\"行政组\"],\"orderNum\":[\"25\"],\"leader\":[\"100\"],\"leaderName\":[\"莫莉芳\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 16:23:54');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '鲜恬科技', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_business_journal\"]}', 'null', 0, NULL, '2021-01-20 17:02:58');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '鲜恬科技', '/tool/gen/genCode/t_business_journal', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 17:05:14');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '鲜恬科技', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_business_journal\"]}', 'null', 0, NULL, '2021-01-20 17:05:27');
INSERT INTO `sys_oper_log` VALUES (201, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务\"],\"taskProgress\":[\"10\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 17:08:52');
INSERT INTO `sys_oper_log` VALUES (202, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务2\"],\"taskProgress\":[\"100%\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 17:10:57');
INSERT INTO `sys_oper_log` VALUES (203, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务3\"],\"taskProgress\":[\"25.5\"],\"remark\":[\"\"]}', 'null', 1, '', '2021-01-20 17:29:10');
INSERT INTO `sys_oper_log` VALUES (204, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务3\"],\"taskProgress\":[\"10\"],\"remark\":[\"\"]}', 'null', 1, '', '2021-01-20 17:30:53');
INSERT INTO `sys_oper_log` VALUES (205, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务3\"],\"taskProgress\":[\"10\"],\"remark\":[\"\"]}', 'null', 1, '', '2021-01-20 17:31:14');
INSERT INTO `sys_oper_log` VALUES (206, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务3\"],\"taskProgress\":[\"25.5\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 17:33:04');
INSERT INTO `sys_oper_log` VALUES (207, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"23\"],\"parentId\":[\"8\"],\"parentName\":[\"软件开发部\"],\"deptName\":[\"人力线\"],\"orderNum\":[\"13\"],\"leader\":[\"112\"],\"leaderName\":[\"刘剑文\"],\"phone\":[\"\"],\"email\":[\"liujianwen404@dingtalk.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 17:46:40');
INSERT INTO `sys_oper_log` VALUES (208, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-21\"],\"zentaoName\":[\"请假\"],\"taskProgress\":[\"100\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 17:49:22');
INSERT INTO `sys_oper_log` VALUES (209, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务4\"],\"taskProgress\":[\"10\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 18:56:06');
INSERT INTO `sys_oper_log` VALUES (210, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务5\"],\"taskProgress\":[\"15\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 19:02:01');
INSERT INTO `sys_oper_log` VALUES (211, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-20\"],\"zentaoName\":[\"admin的测试任务6\"],\"taskProgress\":[\"16\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 19:02:19');
INSERT INTO `sys_oper_log` VALUES (212, '员工日报', 1, 'com.ruoyi.business.controller.JournalController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/add', '127.0.0.1', '内网IP', '{\"date\":[\"2021-01-21\"],\"zentaoName\":[\"admin的测试任务7\"],\"taskProgress\":[\"77\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-20 19:02:55');
INSERT INTO `sys_oper_log` VALUES (213, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/business/mapper/JournalMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,user_id,user_name,dept_id,dept_name,post_id,post_name,date,zentao_id,zentao_name,task_progress,search_value,create_id,create_by,create_time,update_id,update_by,update_time,remark,del_flag FROM t_business_journal WHERE id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'', '2021-01-21 10:15:08');
INSERT INTO `sys_oper_log` VALUES (214, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 10:18:14');
INSERT INTO `sys_oper_log` VALUES (215, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 10:19:43');
INSERT INTO `sys_oper_log` VALUES (216, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 10:21:07');
INSERT INTO `sys_oper_log` VALUES (217, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '', '2021-01-21 10:40:16');
INSERT INTO `sys_oper_log` VALUES (218, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '', '2021-01-21 10:40:37');
INSERT INTO `sys_oper_log` VALUES (219, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '', '2021-01-21 10:45:11');
INSERT INTO `sys_oper_log` VALUES (220, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '', '2021-01-21 10:50:49');
INSERT INTO `sys_oper_log` VALUES (221, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-21 10:55:25');
INSERT INTO `sys_oper_log` VALUES (222, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '原模板文件不存在', '2021-01-21 10:58:14');
INSERT INTO `sys_oper_log` VALUES (223, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '原模板文件不存在', '2021-01-21 10:59:12');
INSERT INTO `sys_oper_log` VALUES (224, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, 'The supplied data appears to be in the Office 2007+ XML. You are calling the part of POI that deals with OLE2 Office Documents. You need to call a different part of POI to process this data (eg XSSF instead of HSSF)', '2021-01-21 11:00:57');
INSERT INTO `sys_oper_log` VALUES (225, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, 'The supplied data appears to be in the Office 2007+ XML. You are calling the part of POI that deals with OLE2 Office Documents. You need to call a different part of POI to process this data (eg XSSF instead of HSSF)', '2021-01-21 11:02:20');
INSERT INTO `sys_oper_log` VALUES (226, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:04:09');
INSERT INTO `sys_oper_log` VALUES (227, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:07:39');
INSERT INTO `sys_oper_log` VALUES (228, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"E:\\\\IdeaProjects\\\\zentao-kpi\\\\excelTemplate\\\\报表-1611198947340.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:15:47');
INSERT INTO `sys_oper_log` VALUES (229, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"D:\\\\ruoyi\\\\uploadPath\\\\download\\\\报表-1611199252388.xls\\\\报表-1611199252388.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:20:52');
INSERT INTO `sys_oper_log` VALUES (230, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"D:\\\\ruoyi\\\\uploadPath\\\\download\\\\报表-1611199642475.xls\\\\报表-1611199642475.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:27:22');
INSERT INTO `sys_oper_log` VALUES (231, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"D:\\\\ruoyi\\\\uploadPath\\\\download\\\\报表-1611199880867.xls\\\\报表-1611199880867.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:31:20');
INSERT INTO `sys_oper_log` VALUES (232, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"员工周报-1611200079068.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:34:39');
INSERT INTO `sys_oper_log` VALUES (233, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-21 11:37:40');
INSERT INTO `sys_oper_log` VALUES (234, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-01-21 11:41:19');
INSERT INTO `sys_oper_log` VALUES (235, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '', '2021-01-21 11:43:09');
INSERT INTO `sys_oper_log` VALUES (236, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, 'null', 1, '', '2021-01-21 11:44:45');
INSERT INTO `sys_oper_log` VALUES (237, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"员工周报-1611200745236.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:45:57');
INSERT INTO `sys_oper_log` VALUES (238, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611200923672.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 11:48:44');
INSERT INTO `sys_oper_log` VALUES (239, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611208084837.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 13:48:04');
INSERT INTO `sys_oper_log` VALUES (240, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611208413772.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 13:53:34');
INSERT INTO `sys_oper_log` VALUES (241, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611208575369.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 13:56:15');
INSERT INTO `sys_oper_log` VALUES (242, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-20\"],\"endTime\":[\"2021-01-21\"]}', '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611208742178.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 13:59:02');
INSERT INTO `sys_oper_log` VALUES (243, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-20\"],\"endTime\":[\"2021-01-21\"]}', '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611209803428.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 14:16:43');
INSERT INTO `sys_oper_log` VALUES (244, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-20\"],\"endTime\":[\"2021-01-21\"]}', '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611209874557.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 14:17:54');
INSERT INTO `sys_oper_log` VALUES (245, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-25\"]}', '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611210068125.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 14:21:08');
INSERT INTO `sys_oper_log` VALUES (246, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-23\"]}', '{\r\n  \"msg\" : \"员工周报\\\\员工周报-1611210090324.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 14:21:30');
INSERT INTO `sys_oper_log` VALUES (247, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报\\\\刘剑文.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 14:34:42');
INSERT INTO `sys_oper_log` VALUES (248, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"刘剑文.xls\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 14:37:05');
INSERT INTO `sys_oper_log` VALUES (249, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, '', '2021-01-21 14:57:28');
INSERT INTO `sys_oper_log` VALUES (250, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, '', '2021-01-21 15:01:20');
INSERT INTO `sys_oper_log` VALUES (251, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, '', '2021-01-21 15:04:10');
INSERT INTO `sys_oper_log` VALUES (252, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"ab550122-6802-44df-9fa6-a0a3e76896dd.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:06:08');
INSERT INTO `sys_oper_log` VALUES (253, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"5244804a-c042-4ed7-bc40-2b19502c16d7.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:08:06');
INSERT INTO `sys_oper_log` VALUES (254, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"66347734-1feb-4150-b5d6-ea272415901b.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:15:35');
INSERT INTO `sys_oper_log` VALUES (255, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"ae871364-024f-4ad7-b4e2-c2b32ea46ad3.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:16:48');
INSERT INTO `sys_oper_log` VALUES (256, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-23\"]}', 'null', 1, 'IOException: Stream Closed', '2021-01-21 15:18:49');
INSERT INTO `sys_oper_log` VALUES (257, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-19\"],\"endTime\":[\"2021-01-29\"]}', 'null', 1, 'Zip file [D:\\ruoyi\\uploadPath\\download\\员工周报] must not be a directory !', '2021-01-21 15:27:50');
INSERT INTO `sys_oper_log` VALUES (258, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-28\"]}', '{\r\n  \"msg\" : \"be0eebd9-4d18-4384-9380-ecabfbdacb40.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:30:58');
INSERT INTO `sys_oper_log` VALUES (259, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-27\"]}', 'null', 1, 'Zip file path [D:\\ruoyi\\uploadPath\\download\\刘剑文.xls] must not be the child directory of [D:\\ruoyi\\uploadPath\\download] !', '2021-01-21 15:33:12');
INSERT INTO `sys_oper_log` VALUES (260, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-16\"],\"endTime\":[\"2021-01-26\"]}', 'null', 1, 'Zip file path [D:\\ruoyi\\uploadPath\\download\\刘剑文刘剑文.xls] must not be the child directory of [D:\\ruoyi\\uploadPath\\download] !', '2021-01-21 15:37:01');
INSERT INTO `sys_oper_log` VALUES (261, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-21\"],\"endTime\":[\"2021-01-25\"]}', 'null', 1, 'Zip file [D:\\ruoyi\\uploadPath\\download] must not be a directory !', '2021-01-21 15:41:14');
INSERT INTO `sys_oper_log` VALUES (262, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-10\"],\"endTime\":[\"2021-01-15\"]}', '{\r\n  \"msg\" : \"5c3c714a-76b5-47f0-a3cc-5c550c4d1206.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:44:17');
INSERT INTO `sys_oper_log` VALUES (263, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-27\"]}', '{\r\n  \"msg\" : \"46ac761d-475d-4f79-8b79-5ab9ec11a4ff.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:54:55');
INSERT INTO `sys_oper_log` VALUES (264, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-27\"]}', '{\r\n  \"msg\" : \"1ae8dc4f-d9ca-41eb-af64-fa02b767d286.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:55:20');
INSERT INTO `sys_oper_log` VALUES (265, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-21\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"94a7eebb-f7d3-4f08-b9fa-6cb2e7f69af6.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 15:59:35');
INSERT INTO `sys_oper_log` VALUES (266, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-21\"],\"endTime\":[\"2021-01-31\"]}', '{\r\n  \"msg\" : \"3589ee7f-889d-46eb-8d1a-43f7cc5ac6ba.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 16:03:33');
INSERT INTO `sys_oper_log` VALUES (267, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-21\"],\"endTime\":[\"2021-01-25\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 16:07:29');
INSERT INTO `sys_oper_log` VALUES (268, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'Index: 10, Size: 10', '2021-01-21 17:22:58');
INSERT INTO `sys_oper_log` VALUES (269, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 17:29:05');
INSERT INTO `sys_oper_log` VALUES (270, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 17:38:16');
INSERT INTO `sys_oper_log` VALUES (271, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 17:42:15');
INSERT INTO `sys_oper_log` VALUES (272, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 17:50:33');
INSERT INTO `sys_oper_log` VALUES (273, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:02:48');
INSERT INTO `sys_oper_log` VALUES (274, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-23\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:05:43');
INSERT INTO `sys_oper_log` VALUES (275, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-23\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:16:29');
INSERT INTO `sys_oper_log` VALUES (276, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-15\"],\"endTime\":[\"2021-01-30\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:22:15');
INSERT INTO `sys_oper_log` VALUES (277, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:25:08');
INSERT INTO `sys_oper_log` VALUES (278, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-29\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:27:07');
INSERT INTO `sys_oper_log` VALUES (279, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-23\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:29:23');
INSERT INTO `sys_oper_log` VALUES (280, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-23\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:32:17');
INSERT INTO `sys_oper_log` VALUES (281, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 18:53:07');
INSERT INTO `sys_oper_log` VALUES (282, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-18\"],\"endTime\":[\"2021-01-23\"]}', 'null', 1, 'File [D:\\ruoyi\\uploadPath\\download\\员工周报] not exist!', '2021-01-21 19:18:08');
INSERT INTO `sys_oper_log` VALUES (283, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-23\"]}', 'null', 1, 'File [D:\\ruoyi\\uploadPath\\download\\员工周报] not exist!', '2021-01-21 19:20:45');
INSERT INTO `sys_oper_log` VALUES (284, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-23\"]}', 'null', 1, 'File [D:\\ruoyi\\uploadPath\\download\\员工周报] not exist!', '2021-01-21 19:21:45');
INSERT INTO `sys_oper_log` VALUES (285, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, '要导出的员工数据为空！', '2021-01-21 19:29:28');
INSERT INTO `sys_oper_log` VALUES (286, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'For input string: \"\"', '2021-01-21 19:29:42');
INSERT INTO `sys_oper_log` VALUES (287, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'For input string: \"\"', '2021-01-21 19:31:00');
INSERT INTO `sys_oper_log` VALUES (288, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'null', '2021-01-21 19:31:58');
INSERT INTO `sys_oper_log` VALUES (289, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'For input string: \"\"', '2021-01-21 19:33:54');
INSERT INTO `sys_oper_log` VALUES (290, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'For input string: \"\"', '2021-01-21 19:35:48');
INSERT INTO `sys_oper_log` VALUES (291, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', 'null', 1, 'For input string: \"\"', '2021-01-21 19:38:06');
INSERT INTO `sys_oper_log` VALUES (292, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-17\"],\"endTime\":[\"2021-01-22\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-21 19:44:59');
INSERT INTO `sys_oper_log` VALUES (293, '员工周报', 5, 'com.ruoyi.business.controller.JournalController.exportUser()', 'POST', 1, 'admin', '鲜恬科技', '/business/journal/exportUser', '127.0.0.1', '内网IP', '{\"startTime\":[\"2021-01-25\"],\"endTime\":[\"2021-01-30\"]}', '{\r\n  \"msg\" : \"员工周报.zip\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-01-28 16:24:59');
INSERT INTO `sys_oper_log` VALUES (294, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"23\"],\"parentId\":[\"8\"],\"parentName\":[\"软件开发部\"],\"deptName\":[\"人力线\"],\"orderNum\":[\"13\"],\"leader\":[\"112\"],\"leaderName\":[\"刘剑文\"],\"phone\":[\"\"],\"email\":[\"liujianwen404@dingtalk.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-02 13:37:46');
INSERT INTO `sys_oper_log` VALUES (295, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"13\"],\"parentId\":[\"8\"],\"parentName\":[\"软件开发部\"],\"deptName\":[\"到店线\"],\"orderNum\":[\"6\"],\"leader\":[\"113\"],\"leaderName\":[\"吴军\"],\"phone\":[\"\"],\"email\":[\"wujun0400@dingtalk.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-17 15:43:10');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"任务管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-area-chart\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 13:52:33');
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"绩效考核\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-line-chart\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 13:54:13');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"工作表现考核\"],\"url\":[\"/performance/job\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:job:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 13:57:41');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"产品满意度调查考核\"],\"url\":[\"/performance\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:product:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:01:00');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人工作表现考核\"],\"url\":[\"/performance/job\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:job:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:01:25');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"周报管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:01:51');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"绩效考核\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-line-chart\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:01:58');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:05');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:14');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:23');
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"鲜恬官网\"],\"url\":[\"http://121.com\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:38');
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:44');
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:48');
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:02:52');
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"任务管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-area-chart\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:03:04');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"绩效考核\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-line-chart\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:03:11');
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"周报管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 14:03:19');
INSERT INTO `sys_oper_log` VALUES (313, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '鲜恬科技', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_performance_collect,t_performance_job\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:18:11');
INSERT INTO `sys_oper_log` VALUES (314, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_performance_collect\"],\"tableComment\":[\"个人月度绩效考核汇总表\"],\"className\":[\"TPerformanceCollect\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"日期\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"date\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"工作进度\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"jobSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"39\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"工作质量\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"jobQuality\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"40\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"工作表现\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"jobPerformance\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"41\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"产品满意度\"],\"columns[5].javaType\":[\"String\"],\"columns[5].j', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:22:41');
INSERT INTO `sys_oper_log` VALUES (315, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_performance_job\"],\"tableComment\":[\"个人工作表现考核表\"],\"className\":[\"TPerformanceJob\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"64\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"65\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"日期\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"date\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"66\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"代码规范（个人）\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"infoCodeStandards\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"67\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"沟通协调（个人）\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"infoCoordination\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"68\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"责任感（个人）\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"infoResponsibility\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"69\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"意见建议\"],\"columns[5].javaType\":[\"String', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:23:03');
INSERT INTO `sys_oper_log` VALUES (316, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '鲜恬科技', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_performance_collect,t_performance_job\"]}', 'null', 0, NULL, '2021-02-18 15:23:11');
INSERT INTO `sys_oper_log` VALUES (317, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_performance_collect\"],\"tableComment\":[\"个人月度绩效考核汇总表\"],\"className\":[\"PerformanceCollect\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"日期\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"date\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"工作进度\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"jobSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"39\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"工作质量\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"jobQuality\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"40\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"工作表现\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"jobPerformance\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"41\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"产品满意度\"],\"columns[5].javaType\":[\"String\"],\"columns[5].ja', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:24:14');
INSERT INTO `sys_oper_log` VALUES (318, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_performance_job\"],\"tableComment\":[\"个人工作表现考核表\"],\"className\":[\"PerformanceJob\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"64\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"65\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"日期\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"date\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"66\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"代码规范（个人）\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"infoCodeStandards\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"67\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"沟通协调（个人）\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"infoCoordination\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"68\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"责任感（个人）\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"infoResponsibility\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"69\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"意见建议\"],\"columns[5].javaType\":[\"String\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:24:20');
INSERT INTO `sys_oper_log` VALUES (319, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '鲜恬科技', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_performance_collect,t_performance_job\"]}', 'null', 0, NULL, '2021-02-18 15:24:24');
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人工作表现考核\"],\"url\":[\"/business/performance/job\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:job:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:37:57');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"绩效考核汇总\"],\"url\":[\"/business/performance/collect\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:collect:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 15:39:17');
INSERT INTO `sys_oper_log` VALUES (322, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"4,2000,2003,2004,2001,2002,2005,2010,2011,2012,2006,2007,2008,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 16:51:14');
INSERT INTO `sys_oper_log` VALUES (323, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"113\"],\"loginName\":[\"wujun\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 16:54:04');
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人工作表现考核\"],\"url\":[\"/business/performance/job\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:job:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 17:26:57');
INSERT INTO `sys_oper_log` VALUES (325, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"23\"],\"parentId\":[\"8\"],\"parentName\":[\"软件开发部\"],\"deptName\":[\"人力线\"],\"orderNum\":[\"13\"],\"leader\":[\"113\"],\"leaderName\":[\"吴军\"],\"phone\":[\"\"],\"email\":[\"wujun0400@dingtalk.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 17:37:00');
INSERT INTO `sys_oper_log` VALUES (326, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"112\"],\"loginName\":[\"liujianwen\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 17:37:14');
INSERT INTO `sys_oper_log` VALUES (327, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', 'null', 1, '不允许操作超级管理员用户', '2021-02-18 17:37:21');
INSERT INTO `sys_oper_log` VALUES (328, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"哈哈哈\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'db_examine.performance_job\' doesn\'t exist\r\n### The error may exist in com/ruoyi/business/mapper/PerformanceJobMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,date,info_code_standards,info_coordination,info_responsibility,opinion,info_grade,superior_code_standards,superior_coordination,superior_responsibility,superior_grade,user_id,user_name,dept_id,dept_name,post_id,post_name,create_id,update_id,del_flag,remark,search_value,create_by,create_time,update_by,update_time FROM performance_job    WHERE date = ?   AND delFlag = ?   AND userId = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'db_examine.performance_job\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'db_examine.performance_job\' doesn\'t exist', '2021-02-18 18:11:09');
INSERT INTO `sys_oper_log` VALUES (329, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"哈哈哈\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/business/mapper/PerformanceJobMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,date,info_code_standards,info_coordination,info_responsibility,opinion,info_grade,superior_code_standards,superior_coordination,superior_responsibility,superior_grade,user_id,user_name,dept_id,dept_name,post_id,post_name,create_id,update_id,del_flag,remark,search_value,create_by,create_time,update_by,update_time FROM t_performance_job    WHERE date = ?   AND delFlag = ?   AND userId = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'', '2021-02-18 18:13:43');
INSERT INTO `sys_oper_log` VALUES (330, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"hahah阿斯顿撒\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/business/mapper/PerformanceJobMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,date,info_code_standards,info_coordination,info_responsibility,opinion,info_grade,superior_code_standards,superior_coordination,superior_responsibility,superior_grade,user_id,user_name,dept_id,dept_name,post_id,post_name,create_id,update_id,del_flag,remark,search_value,create_by,create_time,update_by,update_time FROM t_performance_job    WHERE date = ?   AND del_flag = ?   AND user_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'', '2021-02-18 18:15:03');
INSERT INTO `sys_oper_log` VALUES (331, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"深大\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/business/mapper/PerformanceJobMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,date,info_code_standards,info_coordination,info_responsibility,opinion,info_grade,superior_code_standards,superior_coordination,superior_responsibility,superior_grade,user_id,user_name,dept_id,dept_name,post_id,post_name,create_id,update_id,del_flag,remark,search_value,create_by,create_time,update_by,update_time FROM t_performance_job    WHERE date = ?   AND del_flag = ?   AND user_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'', '2021-02-18 18:20:10');
INSERT INTO `sys_oper_log` VALUES (332, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"是多少\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:22:27');
INSERT INTO `sys_oper_log` VALUES (333, '个人工作现考核', 2, 'com.ruoyi.business.controller.PerformanceJobController.editSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"infoCodeStandards\":[\"3.00\"],\"infoCoordination\":[\"3.00\"],\"infoResponsibility\":[\"5\"],\"opinion\":[\"是多少\"],\"infoGrade\":[\"11\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:23:55');
INSERT INTO `sys_oper_log` VALUES (334, '个人工作现考核', 2, 'com.ruoyi.business.controller.PerformanceJobController.editSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"infoCodeStandards\":[\"3.00\"],\"infoCoordination\":[\"3.00\"],\"infoResponsibility\":[\"5.00\"],\"opinion\":[\"是多少啊\"],\"infoGrade\":[\"11.00\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:29:07');
INSERT INTO `sys_oper_log` VALUES (335, '个人工作现考核', 3, 'com.ruoyi.business.controller.PerformanceJobController.remove()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:31:02');
INSERT INTO `sys_oper_log` VALUES (336, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"发发\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:31:26');
INSERT INTO `sys_oper_log` VALUES (337, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"4\"],\"infoCoordination\":[\"4\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"4\"],\"infoGrade\":[\"4\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:33:13');
INSERT INTO `sys_oper_log` VALUES (338, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"3\"],\"opinion\":[\"3\"],\"infoGrade\":[\"3\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'id\' not found. Available parameters are [preMonth, userId, param1, param2]', '2021-02-18 18:41:05');
INSERT INTO `sys_oper_log` VALUES (339, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"3\"],\"opinion\":[\"3\"],\"infoGrade\":[\"3\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:43:44');
INSERT INTO `sys_oper_log` VALUES (340, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"12\"],\"infoCoordination\":[\"12\"],\"infoResponsibility\":[\"12\"],\"opinion\":[\"12\"],\"infoGrade\":[\"12\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:45:03');
INSERT INTO `sys_oper_log` VALUES (341, '个人工作现考核', 3, 'com.ruoyi.business.controller.PerformanceJobController.remove()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:47:10');
INSERT INTO `sys_oper_log` VALUES (342, '个人工作现考核', 3, 'com.ruoyi.business.controller.PerformanceJobController.remove()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:47:12');
INSERT INTO `sys_oper_log` VALUES (343, '个人工作现考核', 3, 'com.ruoyi.business.controller.PerformanceJobController.remove()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-18 18:47:14');
INSERT INTO `sys_oper_log` VALUES (344, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"3\"],\"opinion\":[\"3\"],\"infoGrade\":[\"3\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '上月的个人工作表现数据已存在', '2021-02-18 18:47:31');
INSERT INTO `sys_oper_log` VALUES (345, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"3\"],\"opinion\":[\"3\"],\"infoGrade\":[\"3\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '上月的个人工作表现数据已存在', '2021-02-18 18:47:41');
INSERT INTO `sys_oper_log` VALUES (346, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"3\"],\"opinion\":[\"3\"],\"infoGrade\":[\"3\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '上月的个人工作表现数据已存在', '2021-02-18 18:47:45');
INSERT INTO `sys_oper_log` VALUES (347, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'liujianwen', '人力线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"3\"],\"opinion\":[\"3\"],\"infoGrade\":[\"3\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '上月的个人工作表现数据已存在', '2021-02-19 15:07:59');
INSERT INTO `sys_oper_log` VALUES (348, '个人工作现考核', 2, 'com.ruoyi.business.controller.PerformanceJobController.editSave()', 'POST', 1, 'wujun', '到店线', '/business/performance/job/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"infoCodeStandards\":[\"3.00\"],\"infoCoordination\":[\"3.00\"],\"infoResponsibility\":[\"4.00\"],\"opinion\":[\"发发\"],\"infoGrade\":[\"10.00\"],\"superiorCodeStandards\":[\"3\"],\"superiorCoordination\":[\"3\"],\"superiorResponsibility\":[\"4\"],\"superiorGrade\":[\"10\"],\"remark\":[\"阿斯顿撒多\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-19 15:09:27');
INSERT INTO `sys_oper_log` VALUES (349, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'wujun', '到店线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"深大\"],\"infoGrade\":[\"10\"],\"superiorCodeStandards\":[\"3\"],\"superiorCoordination\":[\"3\"],\"superiorResponsibility\":[\"4\"],\"superiorGrade\":[\"10\"],\"remark\":[\"啊实打实\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-19 15:12:44');
INSERT INTO `sys_oper_log` VALUES (350, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'wujun', '到店线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"123\"],\"infoGrade\":[\"12\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '上月的个人工作表现数据已存在', '2021-02-19 15:26:02');
INSERT INTO `sys_oper_log` VALUES (351, '个人工作现考核', 1, 'com.ruoyi.business.controller.PerformanceJobController.addSave()', 'POST', 1, 'wujun', '到店线', '/business/performance/job/add', '127.0.0.1', '内网IP', '{\"infoCodeStandards\":[\"3\"],\"infoCoordination\":[\"3\"],\"infoResponsibility\":[\"4\"],\"opinion\":[\"123\"],\"infoGrade\":[\"12\"],\"superiorCodeStandards\":[\"\"],\"superiorCoordination\":[\"\"],\"superiorResponsibility\":[\"\"],\"superiorGrade\":[\"\"],\"remark\":[\"\"]}', 'null', 1, '上月的个人工作表现数据已存在', '2021-02-19 15:26:05');
INSERT INTO `sys_oper_log` VALUES (352, '个人月度绩效考核汇总', 5, 'com.ruoyi.business.controller.PerformanceCollectController.export()', 'POST', 1, 'admin', '鲜恬科技', '/business/performance/collect/export', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', 'null', 1, 'Can not find \'Converter\' support class Map.', '2021-02-19 17:51:42');
INSERT INTO `sys_oper_log` VALUES (353, '个人月度绩效考核汇总', 5, 'com.ruoyi.business.controller.PerformanceCollectController.export()', 'POST', 1, 'admin', '鲜恬科技', '/business/performance/collect/export', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"月度绩效考核汇总.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-19 18:34:44');
INSERT INTO `sys_oper_log` VALUES (354, '个人月度绩效考核汇总', 5, 'com.ruoyi.business.controller.PerformanceCollectController.export()', 'POST', 1, 'admin', '鲜恬科技', '/business/performance/collect/export', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"月度绩效考核汇总.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-19 18:36:01');
INSERT INTO `sys_oper_log` VALUES (355, '个人月度绩效考核汇总', 5, 'com.ruoyi.business.controller.PerformanceCollectController.export()', 'POST', 1, 'admin', '鲜恬科技', '/business/performance/collect/export', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"月度绩效考核汇总.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 11:28:01');
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"工作进度\"],\"url\":[\"/zentao/task/statistics\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 11:52:26');
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"工作表现\"],\"url\":[\"/business/performance/job\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:job:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 11:52:44');
INSERT INTO `sys_oper_log` VALUES (358, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"绩效考核汇总\"],\"url\":[\"/business/performance/collect\"],\"target\":[\"menuItem\"],\"perms\":[\"performance:collect:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 11:52:55');
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '鲜恬科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"任务统计\"],\"url\":[\"/zentao/task/statistics\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 13:45:29');
INSERT INTO `sys_oper_log` VALUES (360, '个人月度绩效考核汇总', 3, 'com.ruoyi.business.controller.PerformanceCollectController.remove()', 'POST', 1, 'admin', '鲜恬科技', '/business/performance/collect/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 14:39:01');
INSERT INTO `sys_oper_log` VALUES (361, '个人月度绩效考核汇总', 3, 'com.ruoyi.business.controller.PerformanceCollectController.remove()', 'POST', 1, 'admin', '鲜恬科技', '/business/performance/collect/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5,6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-02-20 15:06:29');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2020-11-26 18:07:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2020-11-26 18:07:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2020-11-26 18:07:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2020-11-26 18:07:13', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2020-11-26 18:07:13', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2020-11-26 18:07:13', 'admin', '2021-02-18 16:51:14', '普通角色');
INSERT INTO `sys_role` VALUES (100, '助理', 'assistant', 3, '1', '0', '0', 'admin', '2020-12-04 10:34:21', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '鲜恬', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2020/12/03/45985fed-7718-49f2-9dff-65e804c7e98f.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-02-20 15:43:53', '2020-11-26 18:07:12', 'admin', '2020-11-26 18:07:12', '', '2021-02-20 15:43:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'ry', '鲜恬', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2020-11-26 18:07:12', '2020-11-26 18:07:12', 'admin', '2020-11-26 18:07:12', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 24, 'molifang', '莫莉芳', '00', '', '', '1', '', '04eb08ceb91d104cd1f4150b15f918d4', '2fe957', '0', '0', '127.0.0.1', '2021-01-19 15:10:28', NULL, 'admin', '2020-12-04 10:36:41', '', '2021-01-19 15:10:27', NULL);
INSERT INTO `sys_user` VALUES (112, 23, 'liujianwen', '刘剑文', '00', 'liujianwen404@dingtalk.com', '', '0', '', 'd32924b3a92adc4adfd19bbba63ed28f', 'ffee3e', '0', '0', '127.0.0.1', '2021-02-19 15:33:07', NULL, 'admin', '2021-01-20 15:26:42', '', '2021-02-19 15:33:06', '禅道用户');
INSERT INTO `sys_user` VALUES (113, 13, 'wujun', '吴军', '00', 'wujun0400@dingtalk.com', '', '0', '', '3c44d7d951cfec43867e0e95fd5c2b4c', 'bf2e71', '0', '0', '127.0.0.1', '2021-02-19 15:32:46', NULL, 'admin', '2021-02-02 13:34:25', '', '2021-02-19 15:32:45', '禅道用户');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('09ca7812-d340-4e9d-9eba-7cb212149f63', 'admin', '鲜恬科技', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2021-02-20 15:43:48', '2021-02-20 15:43:53', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);
INSERT INTO `sys_user_role` VALUES (109, 2);
INSERT INTO `sys_user_role` VALUES (110, 2);
INSERT INTO `sys_user_role` VALUES (111, 2);
INSERT INTO `sys_user_role` VALUES (112, 2);
INSERT INTO `sys_user_role` VALUES (113, 2);

-- ----------------------------
-- Table structure for t_business_journal
-- ----------------------------
DROP TABLE IF EXISTS `t_business_journal`;
CREATE TABLE `t_business_journal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `zentao_id` bigint(20) NULL DEFAULT NULL COMMENT '禅道任务ID',
  `zentao_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '禅道任务名称',
  `task_progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务进度',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '员工id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `post_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位id',
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工日报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_business_journal
-- ----------------------------
INSERT INTO `t_business_journal` VALUES (1, '2021-01-19', 3347, 'iOS端--优惠券引导领取优化--页面开发及接口对接联调', '10', 1, '', NULL, NULL, NULL, NULL, 1, 'admin', '2021-01-19 17:32:36', NULL, '', '2021-01-19 17:32:42', '1', NULL);
INSERT INTO `t_business_journal` VALUES (2, '2021-01-20', 3347, 'iOS端--优惠券引导领取优化--页面开发及接口对接联调', '20', 1, '', NULL, NULL, NULL, NULL, 1, 'admin', '2021-01-19 17:32:36', 1, 'admin', '2021-01-19 17:39:26', '1', NULL);
INSERT INTO `t_business_journal` VALUES (3, '2021-01-21', 3347, 'iOS端--优惠券引导领取优化--页面开发及接口对接联调', '30', 1, '', NULL, NULL, NULL, NULL, 1, 'admin', '2021-01-19 17:32:50', 1, 'admin', '2021-01-19 17:39:24', '1', NULL);
INSERT INTO `t_business_journal` VALUES (4, '2021-01-19', 3347, 'iOS端--优惠券引导领取优化--页面开发及接口对接联调', '50', 1, '', NULL, NULL, NULL, NULL, 1, 'admin', '2021-01-19 17:49:00', NULL, '', '2021-01-19 18:40:33', '1', NULL);
INSERT INTO `t_business_journal` VALUES (5, '2021-01-18', 3347, 'iOS端--优惠券引导领取优化--页面开发及接口对接联调', '10.5', 1, '鲜恬', 1, '', NULL, NULL, 1, 'admin', '2021-01-19 18:40:42', 1, 'admin', '2021-01-20 16:50:16', '0', NULL);
INSERT INTO `t_business_journal` VALUES (6, '2021-01-19', 3347, 'iOS端--优惠券引导领取优化--页面开发及接口对接联调', '20', 1, '鲜恬', 1, '', NULL, NULL, 1, 'admin', '2021-01-19 18:43:07', 1, 'admin', '2021-01-20 16:50:17', '0', NULL);
INSERT INTO `t_business_journal` VALUES (7, '2021-01-18', 3965, 'OA用户主页--页面开发', '100', 112, '刘剑文', 23, '', NULL, NULL, 101, 'liujianwen', '2021-01-20 11:03:22', 101, 'liujianwen', '2021-01-20 16:50:07', '0', NULL);
INSERT INTO `t_business_journal` VALUES (8, '2021-01-18', 3966, 'OA用户主页--接口开发', '100', 112, '刘剑文', 23, '', NULL, NULL, 101, 'liujianwen', '2021-01-20 11:03:39', NULL, '', '2021-01-20 16:50:06', '0', NULL);
INSERT INTO `t_business_journal` VALUES (9, '2021-01-19', 3969, '周报功能--月度日历日报开发', '50', 112, '刘剑文', 23, '', NULL, NULL, 101, 'liujianwen', '2021-01-20 11:04:16', NULL, '', '2021-01-20 16:50:05', '0', NULL);
INSERT INTO `t_business_journal` VALUES (10, '2021-01-19', 3971, '周报功能--导出个人一周excel开发', '20', 112, '刘剑文', 23, '', NULL, NULL, 101, 'liujianwen', '2021-01-20 11:04:42', NULL, '', '2021-01-20 16:50:04', '0', NULL);
INSERT INTO `t_business_journal` VALUES (11, '2021-01-20', NULL, 'admin的测试任务', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '2021-01-20 17:08:52', NULL, '', '2021-01-21 16:14:29', '0', '');
INSERT INTO `t_business_journal` VALUES (12, '2021-01-20', NULL, 'admin的测试任务2', '100', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', '2021-01-20 17:10:57', NULL, '', '2021-01-21 16:14:31', '0', '');
INSERT INTO `t_business_journal` VALUES (13, '2021-01-20', NULL, 'admin的测试任务3', '25.5', 1, '鲜恬', 100, '鲜恬科技', NULL, NULL, NULL, '', '2021-01-20 17:33:04', 1, 'admin', '2021-01-20 17:33:01', '0', '');
INSERT INTO `t_business_journal` VALUES (14, '2021-01-21', NULL, '请假', '100', 1, '鲜恬', 100, '鲜恬科技', NULL, NULL, NULL, '', '2021-01-20 17:49:22', 1, 'admin', '2021-01-20 17:49:22', '0', '');
INSERT INTO `t_business_journal` VALUES (15, '2021-01-20', NULL, 'admin的测试任务4', '10', 1, '鲜恬', 100, '鲜恬科技', NULL, NULL, NULL, '', '2021-01-20 18:56:06', 1, 'admin', '2021-01-20 18:56:06', '0', '');
INSERT INTO `t_business_journal` VALUES (16, '2021-01-20', NULL, 'admin的测试任务5', '15', 1, '鲜恬', 100, '鲜恬科技', NULL, NULL, NULL, '', '2021-01-20 19:02:01', 1, 'admin', '2021-01-20 19:02:02', '0', '');
INSERT INTO `t_business_journal` VALUES (17, '2021-01-20', NULL, 'admin的测试任务6', '16', 1, '鲜恬', 100, '鲜恬科技', NULL, NULL, NULL, '', '2021-01-20 19:02:19', 1, 'admin', '2021-01-20 19:02:19', '0', '');
INSERT INTO `t_business_journal` VALUES (18, '2021-01-21', NULL, 'admin的测试任务7', '77', 1, '鲜恬', 100, '鲜恬科技', NULL, NULL, NULL, '', '2021-01-20 19:02:55', 1, 'admin', '2021-01-20 19:02:56', '0', '');

-- ----------------------------
-- Table structure for t_performance_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_performance_collect`;
CREATE TABLE `t_performance_collect`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `job_schedule` decimal(10, 2) NULL DEFAULT NULL COMMENT '工作进度',
  `job_quality` decimal(10, 2) NULL DEFAULT NULL COMMENT '工作质量',
  `job_performance` decimal(10, 2) NULL DEFAULT NULL COMMENT '工作表现',
  `product_satisfaction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品满意度',
  `assess_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '考核合计',
  `learning_promotion` decimal(10, 2) NULL DEFAULT NULL COMMENT '学习提升',
  `quality_assurance` decimal(10, 2) NULL DEFAULT NULL COMMENT '质量保障',
  `patent` decimal(10, 2) NULL DEFAULT NULL COMMENT '专利资质',
  `efficiency` decimal(10, 2) NULL DEFAULT NULL COMMENT '效率优化',
  `encourage_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '鼓励合计',
  `performance_grade` decimal(10, 2) NULL DEFAULT NULL COMMENT '绩效评分',
  `performance_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绩效评级',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '员工id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `post_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位id',
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人月度绩效考核汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_performance_collect
-- ----------------------------
INSERT INTO `t_performance_collect` VALUES (7, '2021-01-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, '莫莉芳', 24, '行政组', NULL, NULL, 100, 'admin', '2021-02-20 15:06:31', NULL, '', NULL, '0', NULL);
INSERT INTO `t_performance_collect` VALUES (8, '2021-01-20', 60.00, NULL, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, '刘剑文', 23, '人力线', NULL, NULL, 112, 'admin', '2021-02-20 15:06:31', NULL, '', NULL, '0', NULL);
INSERT INTO `t_performance_collect` VALUES (9, '2021-01-20', NULL, NULL, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, '吴军', 13, '到店线', NULL, NULL, 113, 'admin', '2021-02-20 15:06:31', NULL, '', NULL, '0', NULL);

-- ----------------------------
-- Table structure for t_performance_job
-- ----------------------------
DROP TABLE IF EXISTS `t_performance_job`;
CREATE TABLE `t_performance_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `info_code_standards` decimal(10, 2) NULL DEFAULT NULL COMMENT '代码规范（个人）',
  `info_coordination` decimal(10, 2) NULL DEFAULT NULL COMMENT '沟通协调（个人）',
  `info_responsibility` decimal(10, 2) NULL DEFAULT NULL COMMENT '责任感（个人）',
  `opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意见建议',
  `info_grade` decimal(10, 2) NULL DEFAULT NULL COMMENT '自我评分',
  `superior_code_standards` decimal(10, 2) NULL DEFAULT NULL COMMENT '代码规范（上级）',
  `superior_coordination` decimal(10, 2) NULL DEFAULT NULL COMMENT '沟通协调（上级）',
  `superior_responsibility` decimal(10, 2) NULL DEFAULT NULL COMMENT '责任感（上级）',
  `superior_grade` decimal(10, 2) NULL DEFAULT NULL COMMENT '上级评分',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '员工id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `post_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位id',
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人工作表现考核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_performance_job
-- ----------------------------
INSERT INTO `t_performance_job` VALUES (2, '2021-01-18', 3.00, 3.00, 4.00, '发发', 10.00, 3.00, 3.00, 4.00, 10.00, 112, '刘剑文', 23, '人力线', NULL, NULL, 112, '', '2021-02-18 18:31:26', NULL, '', '2021-02-19 15:24:20', '0', '阿斯顿撒多');
INSERT INTO `t_performance_job` VALUES (6, '2021-01-19', 3.00, 3.00, 4.00, '深大', 10.00, 3.00, 3.00, 4.00, 10.00, 113, '吴军', 13, '到店线', NULL, NULL, 113, '', '2021-02-19 15:12:44', NULL, '', NULL, '0', '啊实打实');

SET FOREIGN_KEY_CHECKS = 1;
