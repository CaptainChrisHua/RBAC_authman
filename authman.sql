SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
                            `id` int(10) NOT NULL AUTO_INCREMENT,
                            `pid` int(10) DEFAULT NULL,
                            `pids` varchar(1000) DEFAULT NULL,
                            `dept_code` varchar(100) DEFAULT NULL,
                            `dept_name` varchar(500) DEFAULT NULL,
                            `create_time` datetime DEFAULT NULL,
                            `create_user` varchar(100) DEFAULT NULL,
                            `update_time` datetime DEFAULT NULL,
                            `update_user` varchar(100) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '0,', 'sgytech', 'Chris Technology', '2021-03-29 14:34:18', '', '2021-03-29 14:34:26', '');
INSERT INTO `sys_dept` VALUES ('2', '1', '0,1,', 'IT Department', 'IT Department', '2021-03-29 14:41:12', '', '2021-03-29 14:41:52', '');
INSERT INTO `sys_dept` VALUES ('3', '1', '0,1,', 'Sale', 'Marketing Department', '2021-03-29 14:41:15', '', '2021-03-29 14:41:54', '');
INSERT INTO `sys_dept` VALUES ('4', '1', '0,1,', 'fnc', 'Finance Department', '2021-03-29 14:41:17', '', '2021-03-29 14:41:57', '');
INSERT INTO `sys_dept` VALUES ('7', '1', '0,1,', 'public', 'Public Relations Department', '2025-03-08 15:45:06', '', null, null);
INSERT INTO `sys_dept` VALUES ('27', '1', '0,1,', 'sales', 'Sales Department', '2025-03-13 15:53:48', '', null, null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `id` int(10) NOT NULL AUTO_INCREMENT,
                            `pid` int(10) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', 'system', 'System Management', '0', null, '', 'layui-icon-set-fill', null, '2025-03-04 15:06:28', null, '2025-03-06 02:16:30', null);
INSERT INTO `sys_menu` VALUES ('3', '1', 'system:dept', 'Department Management', '1', null, 'sysDept/listUI', '', null, '2025-03-05 14:34:30', null, '2025-03-05 14:34:30', null);
INSERT INTO `sys_menu` VALUES ('4', '1', 'system:role', 'Role Management', '1', null, 'sysRole/listUI', '', null, '2025-03-05 14:36:59', null, '2025-03-05 14:36:59', null);
INSERT INTO `sys_menu` VALUES ('5', '1', 'system:menu', 'Permission Management', '1', null, 'sysMenu/listUI', '', null, '2025-03-05 15:03:04', null, '2025-03-05 15:03:04', null);
INSERT INTO `sys_menu` VALUES ('6', '1', 'system:user', 'User Management', '1', null, 'sysUser/listUI', '', null, '2025-03-05 15:03:36', null, '2025-03-05 15:03:36', null);
INSERT INTO `sys_menu` VALUES ('8', '0', 'monitor', 'System Monitoring', '0', null, '', 'layui-icon-chart-screen', null, '2025-03-11 03:07:03', null, '2025-03-11 03:07:03', null);
INSERT INTO `sys_menu` VALUES ('9', '8', 'monitor:log', 'Log Management', '1', null, 'operlog/listUI', '', null, '2025-03-11 03:14:40', null, '2025-03-11 03:14:40', null);
INSERT INTO `sys_menu` VALUES ('10', '3', 'dept:add', 'Add', '2', null, '', '', null, '2025-03-11 04:49:52', null, '2025-03-11 04:49:52', null);
INSERT INTO `sys_menu` VALUES ('11', '3', 'dept:edit', 'Edit', '2', null, '', '', null, '2025-03-11 05:01:10', null, '2025-03-11 14:19:30', null);
INSERT INTO `sys_menu` VALUES ('12', '3', 'dept:remove', 'Delete', '2', null, '', '', null, '2025-03-11 05:05:38', null, '2025-03-11 05:05:38', null);
INSERT INTO `sys_menu` VALUES ('13', '4', 'role:add', 'Add', '2', null, '', '', null, '2025-03-11 05:06:49', null, '2025-03-11 05:06:49', null);
INSERT INTO `sys_menu` VALUES ('14', '4', 'role:edit', 'Edit', '2', null, '', '', null, '2025-03-11 05:07:13', null, '2025-03-11 14:19:36', null);
INSERT INTO `sys_menu` VALUES ('15', '4', 'role:remove', 'Delete', '2', null, '', '', null, '2025-03-11 05:07:33', null, '2025-03-11 05:07:33', null);
INSERT INTO `sys_menu` VALUES ('16', '4', 'role:addMenu', 'Assign Permissions', '2', null, '', '', null, '2025-03-11 05:07:52', null, '2025-03-11 05:07:52', null);
INSERT INTO `sys_menu` VALUES ('17', '6', 'user:add', 'Add', '2', null, '', '', null, '2025-03-11 14:17:23', null, '2025-03-11 14:17:23', null);
INSERT INTO `sys_menu` VALUES ('18', '6', 'user:edit', 'Edit', '2', null, '', '', null, '2025-03-11 14:17:55', null, '2025-03-11 14:19:43', null);
INSERT INTO `sys_menu` VALUES ('19', '6', 'user:remove', 'Delete', '2', null, '', '', null, '2025-03-11 14:18:12', null, '2025-03-11 14:18:12', null);
INSERT INTO `sys_menu` VALUES ('20', '6', 'user:addRole', 'Assign Roles', '2', null, '', '', null, '2025-03-11 14:18:31', null, '2025-03-11 14:18:31', null);
INSERT INTO `sys_menu` VALUES ('21', '5', 'menu:add', 'Add', '2', null, '', '', null, '2025-03-11 14:20:03', null, '2025-03-11 14:20:03', null);
INSERT INTO `sys_menu` VALUES ('22', '5', 'menu:edit', 'Edit', '2', null, '', '', null, '2025-03-11 14:20:17', null, '2025-03-11 14:20:17', null);
INSERT INTO `sys_menu` VALUES ('23', '5', 'menu:remove', 'Delete', '2', null, '', '', null, '2025-03-11 14:20:37', null, '2025-03-11 14:20:37', null);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:38:09');
INSERT INTO `sys_oper_log` VALUES ('2', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:8}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:38:29');
INSERT INTO `sys_oper_log` VALUES ('3', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:39:43');
INSERT INTO `sys_oper_log` VALUES ('4', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:9}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:39:46');
INSERT INTO `sys_oper_log` VALUES ('5', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:40:05');
INSERT INTO `sys_oper_log` VALUES ('6', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:40:34');
INSERT INTO `sys_oper_log` VALUES ('7', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=bb, deptCode=bb, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:41:05');
INSERT INTO `sys_oper_log` VALUES ('8', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:41:26');
INSERT INTO `sys_oper_log` VALUES ('9', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=dd, deptCode=dd, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:41:48');
INSERT INTO `sys_oper_log` VALUES ('10', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=ee, deptCode=ee, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:42:09');
INSERT INTO `sys_oper_log` VALUES ('11', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:12}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:02');
INSERT INTO `sys_oper_log` VALUES ('12', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:13}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:03');
INSERT INTO `sys_oper_log` VALUES ('13', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:14}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:05');
INSERT INTO `sys_oper_log` VALUES ('14', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:15}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:44:08');
INSERT INTO `sys_oper_log` VALUES ('15', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=null, pids=null, deptName=bb, deptCode=bb, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:44:14');
INSERT INTO `sys_oper_log` VALUES ('16', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:47:43');
INSERT INTO `sys_oper_log` VALUES ('17', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=dd, deptCode=dd, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:48:19');
INSERT INTO `sys_oper_log` VALUES ('18', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=ee, deptCode=ee, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:48:52');
INSERT INTO `sys_oper_log` VALUES ('19', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:18}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:00');
INSERT INTO `sys_oper_log` VALUES ('20', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:17}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:02');
INSERT INTO `sys_oper_log` VALUES ('21', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:16}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:04');
INSERT INTO `sys_oper_log` VALUES ('22', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:11}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:49:06');
INSERT INTO `sys_oper_log` VALUES ('23', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:49:24');
INSERT INTO `sys_oper_log` VALUES ('24', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=bb, deptCode=bb, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:49:48');
INSERT INTO `sys_oper_log` VALUES ('25', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:49:59');
INSERT INTO `sys_oper_log` VALUES ('26', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:20}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:04');
INSERT INTO `sys_oper_log` VALUES ('27', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:21}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:06');
INSERT INTO `sys_oper_log` VALUES ('28', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:19}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:08');
INSERT INTO `sys_oper_log` VALUES ('29', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:50:23');
INSERT INTO `sys_oper_log` VALUES ('30', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:22}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:50:27');
INSERT INTO `sys_oper_log` VALUES ('31', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:10}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:51:05');
INSERT INTO `sys_oper_log` VALUES ('32', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:51:16');
INSERT INTO `sys_oper_log` VALUES ('33', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:51:45');
INSERT INTO `sys_oper_log` VALUES ('34', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:52:00');
INSERT INTO `sys_oper_log` VALUES ('35', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:25}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:17');
INSERT INTO `sys_oper_log` VALUES ('36', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:24}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:18');
INSERT INTO `sys_oper_log` VALUES ('37', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:53:23');
INSERT INTO `sys_oper_log` VALUES ('38', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:23}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:28');
INSERT INTO `sys_oper_log` VALUES ('39', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.add', 'Edit', 'Edit department', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=Sales Department, deptCode=sales, pname=Chris Technology, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2025-03-13 23:53:48');
INSERT INTO `sys_oper_log` VALUES ('40', 'Department Management', 'com.chris.java.authman.controller.SysDeptController.remove', 'Delete', 'Delete department', 'POST', '{id:26}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2025-03-13 23:53:51');
INSERT INTO `sys_oper_log` VALUES ('41', 'User Management', 'com.chris.java.authman.controller.SysRoleController.add', 'Edit', 'Edit role', 'POST', 'SysRole(id=null, roleName=Sales Representative, roleCode=sale, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-14 00:29:25');
INSERT INTO `sys_oper_log` VALUES ('42', 'User Management', 'com.chris.java.authman.controller.SysRoleController.add', 'Edit', 'Edit role', 'POST', 'SysRole(id=null, roleName=aa, roleCode=aa, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-14 00:30:31');
INSERT INTO `sys_oper_log` VALUES ('43', 'User Management', 'com.chris.java.authman.controller.SysRoleController.add', 'Edit', 'Edit role', 'POST', 'SysRole(id=null, roleName=bb, roleCode=bb, createTime=null, createUser=null, updateTime=null, updateUser=null, deptName=null, userList=null, checked=false)', '0:0:0:0:0:0:0:1', '/authman/sysRole/save', 'admin', '2025-03-14 00:30:36');
INSERT INTO `sys_oper_log` VALUES ('44', 'Role Management', 'com.chris.java.authman.controller.SysRoleController.remove', 'Delete', 'Delete role', 'POST', '{id:17}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/remove', 'admin', '2025-03-14 00:30:38');
INSERT INTO `sys_oper_log` VALUES ('45', 'Role Management', 'com.chris.java.authman.controller.SysRoleController.remove', 'Delete', 'Delete role', 'POST', '{id:16}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/remove', 'admin', '2025-03-14 00:30:40');
INSERT INTO `sys_oper_log` VALUES ('46', 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Edit', 'Assign permissions', 'POST', '{roleId:15}\n{menuIds:[1, 3, 10, 11, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-14 00:31:14');
INSERT INTO `sys_oper_log` VALUES ('47', 'Role Management', 'com.chris.java.authman.controller.SysRoleController.saveMenu', 'Edit', 'Assign permissions', 'POST', '{roleId:15}\n{menuIds:[1, 3, 10, 11, 4, 14, 8, 9]}\n', '0:0:0:0:0:0:0:1', '/authman/sysRole/saveMenu', 'admin', '2025-03-14 00:31:56');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(100) DEFAULT NULL,
  `role_name` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', 'System Administrator', '2025-03-01 11:00:19', null, '2025-03-01 11:00:19', null);
INSERT INTO `sys_role` VALUES ('14', 'user', 'Regular User', '2025-03-07 14:58:18', null, '2025-03-07 14:58:18', null);
INSERT INTO `sys_role` VALUES ('15', 'sale', 'Sales Representative', '2025-03-13 16:29:26', null, '2025-03-13 16:29:26', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `menu_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('14', '1', '1', '2025-03-05 16:03:30', null);
INSERT INTO `sys_role_menu` VALUES ('15', '1', '4', '2025-03-05 16:03:30', null);
INSERT INTO `sys_role_menu` VALUES ('16', '1', '5', '2025-03-05 16:03:30', null);
INSERT INTO `sys_role_menu` VALUES ('20', '1', '6', '2025-03-06 07:34:46', null);
INSERT INTO `sys_role_menu` VALUES ('21', '1', '3', '2025-03-10 15:41:46', null);
INSERT INTO `sys_role_menu` VALUES ('22', '1', '8', '2025-03-11 03:15:06', null);
INSERT INTO `sys_role_menu` VALUES ('23', '1', '9', '2025-03-11 03:15:06', null);
INSERT INTO `sys_role_menu` VALUES ('24', '14', '8', '2025-03-11 03:24:33', null);
INSERT INTO `sys_role_menu` VALUES ('25', '14', '9', '2025-03-11 03:24:33', null);
INSERT INTO `sys_role_menu` VALUES ('26', '1', '13', '2025-03-11 05:16:14', null);
INSERT INTO `sys_role_menu` VALUES ('27', '1', '10', '2025-03-11 05:27:08', null);
INSERT INTO `sys_role_menu` VALUES ('28', '1', '14', '2025-03-11 05:34:40', null);
INSERT INTO `sys_role_menu` VALUES ('29', '1', '15', '2025-03-11 05:34:40', null);
INSERT INTO `sys_role_menu` VALUES ('30', '1', '16', '2025-03-11 05:34:40', null);
INSERT INTO `sys_role_menu` VALUES ('31', '1', '11', '2025-03-11 05:34:40', null);
INSERT INTO `sys_role_menu` VALUES ('32', '1', '12', '2025-03-11 05:34:40', null);
INSERT INTO `sys_role_menu` VALUES ('33', '1', '21', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('34', '1', '22', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('35', '1', '23', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('36', '1', '17', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('37', '1', '18', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('38', '1', '19', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('39', '1', '20', '2025-03-11 14:40:09', null);
INSERT INTO `sys_role_menu` VALUES ('40', '14', '1', '2025-03-12 01:03:29', null);
INSERT INTO `sys_role_menu` VALUES ('41', '14', '3', '2025-03-12 01:03:29', null);
INSERT INTO `sys_role_menu` VALUES ('42', '14', '10', '2025-03-12 02:10:39', null);
INSERT INTO `sys_role_menu` VALUES ('43', '15', '1', '2025-03-13 16:31:15', null);
INSERT INTO `sys_role_menu` VALUES ('44', '15', '3', '2025-03-13 16:31:15', null);
INSERT INTO `sys_role_menu` VALUES ('45', '15', '10', '2025-03-13 16:31:15', null);
INSERT INTO `sys_role_menu` VALUES ('46', '15', '11', '2025-03-13 16:31:15', null);
INSERT INTO `sys_role_menu` VALUES ('47', '15', '8', '2025-03-13 16:31:15', null);
INSERT INTO `sys_role_menu` VALUES ('48', '15', '9', '2025-03-13 16:31:15', null);
INSERT INTO `sys_role_menu` VALUES ('49', '15', '4', '2025-03-13 16:31:57', null);
INSERT INTO `sys_role_menu` VALUES ('50', '15', '14', '2025-03-13 16:31:57', null);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT 'Role ID',
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `create_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='User-Role relationship table';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('8', '1', '3', '2025-03-07 15:27:26', null);
INSERT INTO `sys_role_user` VALUES ('10', '14', '7', '2025-03-11 03:24:18', null);
INSERT INTO `sys_role_user` VALUES ('11', '14', '6', '2025-03-12 10:37:58', null);
INSERT INTO `sys_role_user` VALUES ('12', '14', '12', '2025-03-12 10:51:23', null);
INSERT INTO `sys_role_user` VALUES ('13', '14', '13', '2025-03-12 10:58:51', null);
INSERT INTO `sys_role_user` VALUES ('14', '14', '16', '2025-03-12 11:23:53', null);
INSERT INTO `sys_role_user` VALUES ('16', '1', '16', '2025-03-12 11:33:54', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3', '2', 'admin', 'd022646351048ac0ba397d12dfafa304', 'Chris', null, null, '2025-03-07 14:45:16', '', null, null);
INSERT INTO `sys_user` VALUES ('6', '4', 'zsaa', 'e3d0c85bf9d69d7ff11c1440a870d6c7', 'aaa', null, null, '2025-03-07 15:31:25', '', '2025-03-07 15:33:23', null);
INSERT INTO `sys_user` VALUES ('7', '2', 'zs', '00e4595eafdabb56b49cbf810aadd5aa', 'Zhang San', null, null, '2025-03-11 03:24:08', '', null, null);
INSERT INTO `sys_user` VALUES ('12', '4', 'aa', 'd022646351048ac0ba397d12dfafa304', 'aa', null, null, '2025-03-12 09:32:23', '', null, null);
INSERT INTO `sys_user` VALUES ('13', '7', 'cc', 'd022646351048ac0ba397d12dfafa304', 'cc', null, null, '2025-03-12 09:34:35', '', null, null);
INSERT INTO `sys_user` VALUES ('16', '3', 'rr', 'd022646351048ac0ba397d12dfafa304', 'rr', null, null, '2025-03-12 10:37:47', '', null, null);
INSERT INTO `sys_user` VALUES ('17', '4', 'ee', '50beb21c886a3a1b28e05860a6b28f03', 'ee', null, null, '2025-03-12 11:34:40', '', null, null);