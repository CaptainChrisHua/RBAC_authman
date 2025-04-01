SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `pids` varchar(1000) DEFAULT NULL,
  `dept_code` varchar(100) DEFAULT NULL,
  `dept_name` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 1, '0,1,', 'christech', 'Chris Technology', '2021-03-29 14:34:18', '', NULL, '');
INSERT INTO `sys_dept` VALUES (2, 1, '0,1,', 'IT Department', 'IT Department', '2021-03-29 14:41:12', '', '2021-03-29 14:41:52', '');
INSERT INTO `sys_dept` VALUES (3, 1, '0,1,', 'Sale', 'Marketing Department', '2021-03-29 14:41:15', '', '2021-03-29 14:41:54', '');
INSERT INTO `sys_dept` VALUES (4, 1, '0,1,', 'fnc', 'Finance Department', '2021-03-29 14:41:17', '', '2021-03-29 14:41:57', '');
INSERT INTO `sys_dept` VALUES (7, 1, '0,1,', 'public', 'Public Relations Department', '2025-03-08 15:45:06', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (27, 1, '0,1,', 'sales', 'Sales Department', '2025-03-13 15:53:48', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT '0',
  `menu_code` varchar(100) DEFAULT NULL,
  `menu_name` varchar(500) DEFAULT NULL,
  `menu_type` varchar(10) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL COMMENT 'Opening method (menuItem tab, menuBlank new window)',
  `url` varchar(1000) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_outside` tinyint(1) DEFAULT NULL COMMENT 'Whether external link 0',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, 'system', 'System Management', '0', NULL, '', 'layui-icon-set-fill', NULL, '2025-03-04 15:06:28', NULL, '2025-03-06 02:16:30', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, 'system:dept', 'Department Management', '1', NULL, 'sysDept/listUI', '', NULL, '2025-03-05 14:34:30', NULL, '2025-03-05 14:34:30', NULL);
INSERT INTO `sys_menu` VALUES (4, 1, 'system:role', 'Role Management', '1', NULL, 'sysRole/listUI', '', NULL, '2025-03-05 14:36:59', NULL, '2025-03-05 14:36:59', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, 'system:menu', 'Permission Management', '1', NULL, 'sysMenu/listUI', '', NULL, '2025-03-05 15:03:04', NULL, '2025-03-05 15:03:04', NULL);
INSERT INTO `sys_menu` VALUES (6, 1, 'system:user', 'User Management', '1', NULL, 'sysUser/listUI', '', NULL, '2025-03-05 15:03:36', NULL, '2025-03-05 15:03:36', NULL);
INSERT INTO `sys_menu` VALUES (8, 0, 'monitor', 'System Monitoring', '0', NULL, '', 'layui-icon-chart-screen', NULL, '2025-03-11 03:07:03', NULL, '2025-03-11 03:07:03', NULL);
INSERT INTO `sys_menu` VALUES (9, 8, 'monitor:log', 'Log Management', '1', NULL, 'operlog/listUI', '', NULL, '2025-03-11 03:14:40', NULL, '2025-03-11 03:14:40', NULL);
INSERT INTO `sys_menu` VALUES (10, 3, 'dept:add', 'Add', '2', NULL, '', '', NULL, '2025-03-11 04:49:52', NULL, '2025-03-11 04:49:52', NULL);
INSERT INTO `sys_menu` VALUES (11, 3, 'dept:edit', 'Edit', '2', NULL, '', '', NULL, '2025-03-11 05:01:10', NULL, '2025-03-11 14:19:30', NULL);
INSERT INTO `sys_menu` VALUES (12, 3, 'dept:remove', 'Delete', '2', NULL, '', '', NULL, '2025-03-11 05:05:38', NULL, '2025-03-11 05:05:38', NULL);
INSERT INTO `sys_menu` VALUES (13, 4, 'role:add', 'Add', '2', NULL, '', '', NULL, '2025-03-11 05:06:49', NULL, '2025-03-11 05:06:49', NULL);
INSERT INTO `sys_menu` VALUES (14, 4, 'role:edit', 'Edit', '2', NULL, '', '', NULL, '2025-03-11 05:07:13', NULL, '2025-03-11 14:19:36', NULL);
INSERT INTO `sys_menu` VALUES (15, 4, 'role:remove', 'Delete', '2', NULL, '', '', NULL, '2025-03-11 05:07:33', NULL, '2025-03-11 05:07:33', NULL);
INSERT INTO `sys_menu` VALUES (16, 4, 'role:addMenu', 'Assign Permissions', '2', NULL, '', '', NULL, '2025-03-11 05:07:52', NULL, '2025-03-11 05:07:52', NULL);
INSERT INTO `sys_menu` VALUES (17, 6, 'user:add', 'Add', '2', NULL, '', '', NULL, '2025-03-11 14:17:23', NULL, '2025-03-11 14:17:23', NULL);
INSERT INTO `sys_menu` VALUES (18, 6, 'user:edit', 'Edit', '2', NULL, '', '', NULL, '2025-03-11 14:17:55', NULL, '2025-03-11 14:19:43', NULL);
INSERT INTO `sys_menu` VALUES (19, 6, 'user:remove', 'Delete', '2', NULL, '', '', NULL, '2025-03-11 14:18:12', NULL, '2025-03-11 14:18:12', NULL);
INSERT INTO `sys_menu` VALUES (20, 6, 'user:addRole', 'Assign Roles', '2', NULL, '', '', NULL, '2025-03-11 14:18:31', NULL, '2025-03-11 14:18:31', NULL);
INSERT INTO `sys_menu` VALUES (21, 5, 'menu:add', 'Add', '2', NULL, '', '', NULL, '2025-03-11 14:20:03', NULL, '2025-03-11 14:20:03', NULL);
INSERT INTO `sys_menu` VALUES (22, 5, 'menu:edit', 'Edit', '2', NULL, '', '', NULL, '2025-03-11 14:20:17', NULL, '2025-03-11 14:20:17', NULL);
INSERT INTO `sys_menu` VALUES (23, 5, 'menu:remove', 'Delete', '2', NULL, '', '', NULL, '2025-03-11 14:20:37', NULL, '2025-03-11 14:20:37', NULL);
INSERT INTO `sys_menu` VALUES (24, 8, 'monitor:remove', 'Delete', '2', NULL, ' ', ' ', NULL, '2025-03-11 14:20:37', NULL, '2025-03-11 14:20:37', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oper_module` varchar(100) DEFAULT NULL COMMENT 'Operation Module',
  `oper_method` varchar(100) DEFAULT NULL COMMENT 'Which method was operated',
  `oper_type` varchar(100) DEFAULT NULL COMMENT 'Operation type, such as query, delete, etc.',
  `oper_desc` varchar(500) DEFAULT NULL COMMENT 'Operation description',
  `req_method` varchar(100) DEFAULT NULL COMMENT 'Request method',
  `oper_param` varchar(500) DEFAULT NULL COMMENT 'Request parameters',
  `oper_ip` varchar(100) DEFAULT NULL COMMENT 'Request IP',
  `oper_uri` varchar(500) DEFAULT NULL COMMENT 'Request address',
  `oper_user` varchar(100) DEFAULT NULL COMMENT 'Operator',
  `create_time` varchar(50) DEFAULT NULL COMMENT 'Operation time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:38:09');
INSERT INTO `sys_oper_log` VALUES (2, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:8}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:38:29');
INSERT INTO `sys_oper_log` VALUES (3, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:39:43');
INSERT INTO `sys_oper_log` VALUES (4, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:9}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:39:46');
INSERT INTO `sys_oper_log` VALUES (5, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:40:05');
INSERT INTO `sys_oper_log` VALUES (6, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:40:34');
INSERT INTO `sys_oper_log` VALUES (7, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=bb, deptCode=bb, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:41:05');
INSERT INTO `sys_oper_log` VALUES (8, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:41:26');
INSERT INTO `sys_oper_log` VALUES (9, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=dd, deptCode=dd, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:41:48');
INSERT INTO `sys_oper_log` VALUES (10, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=ee, deptCode=ee, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:42:09');
INSERT INTO `sys_oper_log` VALUES (11, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:12}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:02');
INSERT INTO `sys_oper_log` VALUES (12, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:13}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:03');
INSERT INTO `sys_oper_log` VALUES (13, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:14}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:05');
INSERT INTO `sys_oper_log` VALUES (14, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:15}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:08');
INSERT INTO `sys_oper_log` VALUES (15, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=null, pids=null, deptName=bb, deptCode=bb, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:44:14');
INSERT INTO `sys_oper_log` VALUES (16, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:47:43');
INSERT INTO `sys_oper_log` VALUES (17, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=dd, deptCode=dd, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:48:19');
INSERT INTO `sys_oper_log` VALUES (18, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=ee, deptCode=ee, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:48:52');
INSERT INTO `sys_oper_log` VALUES (19, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:18}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:00');
INSERT INTO `sys_oper_log` VALUES (20, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:17}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:02');
INSERT INTO `sys_oper_log` VALUES (21, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:16}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:04');
INSERT INTO `sys_oper_log` VALUES (22, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:11}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:06');
INSERT INTO `sys_oper_log` VALUES (23, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:49:24');
INSERT INTO `sys_oper_log` VALUES (24, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=bb, deptCode=bb, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:49:48');
INSERT INTO `sys_oper_log` VALUES (25, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:49:59');
INSERT INTO `sys_oper_log` VALUES (26, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:20}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:04');
INSERT INTO `sys_oper_log` VALUES (27, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:21}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:06');
INSERT INTO `sys_oper_log` VALUES (28, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:19}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:08');
INSERT INTO `sys_oper_log` VALUES (29, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:50:23');
INSERT INTO `sys_oper_log` VALUES (30, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:22}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:27');
INSERT INTO `sys_oper_log` VALUES (31, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:10}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:51:05');
INSERT INTO `sys_oper_log` VALUES (32, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:51:16');
INSERT INTO `sys_oper_log` VALUES (33, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:51:45');
INSERT INTO `sys_oper_log` VALUES (34, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:52:00');
INSERT INTO `sys_oper_log` VALUES (35, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:25}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:17');
INSERT INTO `sys_oper_log` VALUES (36, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:24}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:18');
INSERT INTO `sys_oper_log` VALUES (37, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:53:23');
INSERT INTO `sys_oper_log` VALUES (38, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:23}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:28');
INSERT INTO `sys_oper_log` VALUES (39, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:53:48');
INSERT INTO `sys_oper_log` VALUES (40, 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:26}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:51');
INSERT INTO `sys_oper_log` VALUES (41, 'User Management', 'com.chris.java.authman.controller.SysRoleController.add', 'Edit', 'Edit role', 'POST', 'SysRole(id=null, roleName=Sales Representative, roleCode=sale, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-14 00:29:25');
INSERT INTO `sys_oper_log` VALUES (42, 'User Management', 'com.chris.java.authman.controller.SysRoleController.add', 'Edit', 'Edit role', 'POST', 'SysRole(id=null, roleName=aa, roleCode=aa, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-14 00:30:31');
INSERT INTO `sys_oper_log` VALUES (43, 'User Management', 'com.chris.java.authman.controller.SysRoleController.add', 'Edit', 'Edit role', 'POST', 'SysRole(id=null, roleName=bb, roleCode=bb, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-14 00:30:36');
INSERT INTO `sys_oper_log` VALUES (44, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.remove', 'Delete', 'Delete role', 'POST', '{id:17}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/remove', 'admin', '2025-03-14 00:30:38');
INSERT INTO `sys_oper_log` VALUES (45, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.remove', 'Delete', 'Delete role', 'POST', '{id:16}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/remove', 'admin', '2025-03-14 00:30:40');
INSERT INTO `sys_oper_log` VALUES (46, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Edit', 'Assign permissions', 'POST', '{roleId:15}\n{menuIds:[1, 3, 10, 11, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-14 00:31:14');
INSERT INTO `sys_oper_log` VALUES (47, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Edit', 'Assign permissions', 'POST', '{roleId:15}\n{menuIds:[1, 3, 10, 11, 4, 14, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-14 00:31:56');
INSERT INTO `sys_oper_log` VALUES (48, 'User Management', 'com.laoxu.java.authman.controller.SysRoleController.add', 'Modify', 'Modify Role', 'POST', 'SysRole(id=null, roleName=Guest, roleCode=guest, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-30 10:15:57');
INSERT INTO `sys_oper_log` VALUES (49, 'Department Management', 'com.laoxu.java.authman.controller.SysDeptController.add', 'Modify', 'Modify Department', 'POST', 'SysDept(id=1, pid=1, pids=null, deptName=Chris Technology, deptCode=christech, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-30 10:16:11');
INSERT INTO `sys_oper_log` VALUES (50, 'User Management', 'com.chris.java.authman.controller.SysUserController.add', 'Modify', 'Modify User', 'POST', 'SysUser(id=null, username=guest, password=guest, truename=guest, email=null, phone=null, deptId=1, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=Chris Technology, role=null, dept=null){org.springframework.validation.BindingResult.sysUser=org.springframework.validation.BeanPropertyBindingResult: 0 errors}', '0:0:0:0:0:0:0:1', '/authman/sysUser/save', 'admin', '2025-03-30 11:14:08');
INSERT INTO `sys_oper_log` VALUES (51, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Modify', 'Assign Permissions', 'POST', '{roleId:18}\n{menuIds:[1, 3, 4, 5, 6, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-30 11:20:29');
INSERT INTO `sys_oper_log` VALUES (52, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Modify', 'Assign Permissions', 'POST', '{roleId:18}\n{menuIds:[1, 3, 10, 11, 12, 4, 13, 14, 15, 16, 5, 21, 22, 23, 6, 17, 18, 19, 20, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-30 11:21:55');
INSERT INTO `sys_oper_log` VALUES (53, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Modify', 'Assign Permissions', 'POST', '{roleId:18}\n{menuIds:[1, 3, 4, 5, 6, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-30 11:24:15');
INSERT INTO `sys_oper_log` VALUES (57, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Modify', 'Assign Permissions', 'POST', '{roleId:18}\n{menuIds:[1, 3, 4, 5, 6, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-30 11:40:41');
INSERT INTO `sys_oper_log` VALUES (58, 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Modify', 'Assign Permissions', 'POST', '{roleId:18}\n{menuIds:[1, 3, 4, 5, 6, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-30 15:18:51');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(100) DEFAULT NULL,
  `role_name` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 'admin', 'System Administrator', '2025-03-01 11:00:19', NULL, '2025-03-01 11:00:19', NULL);
INSERT INTO `sys_role` VALUES (14, 'user', 'Regular User', '2025-03-07 14:58:18', NULL, '2025-03-07 14:58:18', NULL);
INSERT INTO `sys_role` VALUES (15, 'sale', 'Sales Representative', '2025-03-13 16:29:26', NULL, '2025-03-13 16:29:26', NULL);
INSERT INTO `sys_role` VALUES (18, 'guest', 'Guest', '2025-03-30 10:15:58', NULL, '2025-03-30 10:15:58', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (14, 1, 1, '2025-03-05 16:03:30', NULL);
INSERT INTO `sys_role_menu` VALUES (15, 1, 4, '2025-03-05 16:03:30', NULL);
INSERT INTO `sys_role_menu` VALUES (16, 1, 5, '2025-03-05 16:03:30', NULL);
INSERT INTO `sys_role_menu` VALUES (20, 1, 6, '2025-03-06 07:34:46', NULL);
INSERT INTO `sys_role_menu` VALUES (21, 1, 3, '2025-03-10 15:41:46', NULL);
INSERT INTO `sys_role_menu` VALUES (22, 1, 8, '2025-03-11 03:15:06', NULL);
INSERT INTO `sys_role_menu` VALUES (23, 1, 9, '2025-03-11 03:15:06', NULL);
INSERT INTO `sys_role_menu` VALUES (24, 14, 8, '2025-03-11 03:24:33', NULL);
INSERT INTO `sys_role_menu` VALUES (25, 14, 9, '2025-03-11 03:24:33', NULL);
INSERT INTO `sys_role_menu` VALUES (26, 1, 13, '2025-03-11 05:16:14', NULL);
INSERT INTO `sys_role_menu` VALUES (27, 1, 10, '2025-03-11 05:27:08', NULL);
INSERT INTO `sys_role_menu` VALUES (28, 1, 14, '2025-03-11 05:34:40', NULL);
INSERT INTO `sys_role_menu` VALUES (29, 1, 15, '2025-03-11 05:34:40', NULL);
INSERT INTO `sys_role_menu` VALUES (30, 1, 16, '2025-03-11 05:34:40', NULL);
INSERT INTO `sys_role_menu` VALUES (31, 1, 11, '2025-03-11 05:34:40', NULL);
INSERT INTO `sys_role_menu` VALUES (32, 1, 12, '2025-03-11 05:34:40', NULL);
INSERT INTO `sys_role_menu` VALUES (33, 1, 21, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (34, 1, 22, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (35, 1, 23, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (36, 1, 17, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (37, 1, 18, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (38, 1, 19, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (39, 1, 20, '2025-03-11 14:40:09', NULL);
INSERT INTO `sys_role_menu` VALUES (40, 14, 1, '2025-03-12 01:03:29', NULL);
INSERT INTO `sys_role_menu` VALUES (41, 14, 3, '2025-03-12 01:03:29', NULL);
INSERT INTO `sys_role_menu` VALUES (42, 14, 10, '2025-03-12 02:10:39', NULL);
INSERT INTO `sys_role_menu` VALUES (43, 15, 1, '2025-03-13 16:31:15', NULL);
INSERT INTO `sys_role_menu` VALUES (44, 15, 3, '2025-03-13 16:31:15', NULL);
INSERT INTO `sys_role_menu` VALUES (45, 15, 10, '2025-03-13 16:31:15', NULL);
INSERT INTO `sys_role_menu` VALUES (46, 15, 11, '2025-03-13 16:31:15', NULL);
INSERT INTO `sys_role_menu` VALUES (47, 15, 8, '2025-03-13 16:31:15', NULL);
INSERT INTO `sys_role_menu` VALUES (48, 15, 9, '2025-03-13 16:31:15', NULL);
INSERT INTO `sys_role_menu` VALUES (49, 15, 4, '2025-03-13 16:31:57', NULL);
INSERT INTO `sys_role_menu` VALUES (50, 15, 14, '2025-03-13 16:31:57', NULL);
INSERT INTO `sys_role_menu` VALUES (51, 18, 1, '2025-03-30 11:20:30', NULL);
INSERT INTO `sys_role_menu` VALUES (52, 18, 3, '2025-03-30 11:20:30', NULL);
INSERT INTO `sys_role_menu` VALUES (53, 18, 4, '2025-03-30 11:20:30', NULL);
INSERT INTO `sys_role_menu` VALUES (54, 18, 5, '2025-03-30 11:20:30', NULL);
INSERT INTO `sys_role_menu` VALUES (55, 18, 6, '2025-03-30 11:20:30', NULL);
INSERT INTO `sys_role_menu` VALUES (56, 18, 8, '2025-03-30 11:20:30', NULL);
INSERT INTO `sys_role_menu` VALUES (72, 18, 9, '2025-03-30 11:37:37', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT 'Role ID',
  `user_id` int DEFAULT NULL COMMENT 'User ID',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `create_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='User-Role relationship table';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_user` VALUES (8, 1, 3, '2025-03-07 15:27:26', NULL);
INSERT INTO `sys_role_user` VALUES (10, 14, 7, '2025-03-11 03:24:18', NULL);
INSERT INTO `sys_role_user` VALUES (11, 14, 6, '2025-03-12 10:37:58', NULL);
INSERT INTO `sys_role_user` VALUES (12, 14, 12, '2025-03-12 10:51:23', NULL);
INSERT INTO `sys_role_user` VALUES (13, 14, 13, '2025-03-12 10:58:51', NULL);
INSERT INTO `sys_role_user` VALUES (14, 14, 16, '2025-03-12 11:23:53', NULL);
INSERT INTO `sys_role_user` VALUES (16, 1, 16, '2025-03-12 11:33:54', NULL);
INSERT INTO `sys_role_user` VALUES (17, 18, 18, '2025-03-30 11:31:53', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_id` int DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `truename` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (3, 2, 'admin', 'd022646351048ac0ba397d12dfafa304', 'Chris', NULL, NULL, '2025-03-07 14:45:16', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 4, 'zsaa', 'e3d0c85bf9d69d7ff11c1440a870d6c7', 'aaa', NULL, NULL, '2025-03-07 15:31:25', '', '2025-03-07 15:33:23', NULL);
INSERT INTO `sys_user` VALUES (7, 2, 'zs', '00e4595eafdabb56b49cbf810aadd5aa', 'Zhang San', NULL, NULL, '2025-03-11 03:24:08', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 4, 'aa', 'd022646351048ac0ba397d12dfafa304', 'aa', NULL, NULL, '2025-03-12 09:32:23', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 7, 'cc', 'd022646351048ac0ba397d12dfafa304', 'cc', NULL, NULL, '2025-03-12 09:34:35', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (16, 3, 'rr', 'd022646351048ac0ba397d12dfafa304', 'rr', NULL, NULL, '2025-03-12 10:37:47', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (17, 4, 'ee', '50beb21c886a3a1b28e05860a6b28f03', 'ee', NULL, NULL, '2025-03-12 11:34:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (18, 1, 'guest', 'f868351dc6c2f5534c809390780da858', 'guest', NULL, NULL, '2025-03-30 11:14:08', '', NULL, NULL);
COMMIT;
