DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(50)NOT NULL ,
  `name` VARCHAR(50)NOT NULL ,
  `login_time` DATETIME NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_user_name_Unique` (`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50)NOT NULL COMMENT '角色名',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_ROLE_NAME` (`name`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `admin_function`;
CREATE TABLE `admin_function`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32)NOT NULL COMMENT '名称',
  `state` VARCHAR(10) NOT NULL DEFAULT 'open' COMMENT '状态,open/closed',
  `parent_id` INT(10) NOT NULL COMMENT '父节点',
  `url` VARCHAR(64) NOT NULL COMMENT '连接',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_func_url_UNIQUE` (`url`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8 COMMENT 'ERP菜单表';

DROP TABLE IF EXISTS `admin_role_function`;
CREATE TABLE `admin_role_function` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `admin_role_id` INT(10) NOT NULL COMMENT '角色ID',
  `admin_func_id` INT(10) NOT NULL COMMENT '功能ID',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_role_func_UNIQUE`(`admin_role_id`,`admin_func_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8 COMMENT 'admin角色功能树对应关系表';

DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`(
  `id`BIGINT(20) NOT NULL AUTO_INCREMENT,
  `admin_user_id` INT(10) NOT NULL COMMENT '用户ID',
  `admin_role_id` INT(10) NOT NULL COMMENT '角色ID',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `admin_user_role_id`(`admin_user_id`,`admin_role_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8 COMMENT 'admin用户角色对应关系表';


DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '商家ID',
  `name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '商家名称',
  `description` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '商家描述',
  `image_id` BIGINT(20) NOT NULL COMMENT '关联图片',
  `level` INT(4) NOT NULL COMMENT '商家级别',
  `hot_level` INT(4) NOT NULL COMMENT '热度级别',
  `status` INT(2) NOT NULL COMMENT '发布状态',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `url` VARCHAR(100)NOT NULL COMMENT '商家url',
  PRIMARY KEY (`id`),
  UNIQUE KEY `merchant_name_UNIQUE` (`name`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `start_remind`;
CREATE TABLE `start_remind`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL ,
  `deal_id` BIGINT(20) NOT NULL ,
  `deal_sku_id` VARCHAR(64) NOT NULL ,
  `deal_title` VARCHAR(200) NOT NULL ,
  `start_time` DATETIME NOT NULL COMMENT '开团时间',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `remind_user_deal_UNIQUE` (`user_id`,`deal_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;