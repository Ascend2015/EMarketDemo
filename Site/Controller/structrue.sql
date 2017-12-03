CREATE DATABASE IF NOT EXISTS `groupon` DEFAULT CHARACTER SET UTF8;
USE `groupon`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45)NOT NULL ,
  `name` VARCHAR(45)NOT NULL ,
  `login_time` DATETIME NOT NULL ,
  `create_time` DATETIME NOT NULL ,
  `update_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_Unique` (`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order_basic`(
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '用户ID',
  `order_status` INT(4) NOT NULL COMMENT '订单状态',
  `total_settlement_price` INT(11) NOT NULL COMMENT '订单结算总价',
  `address` MEDIUMTEXT COMMENT '收货地址',
  `receiver` VARCHAR(128) NOT NULL COMMENT '收件人',
  `phone` VARCHAR(20) NOT NULL COMMENT '联系电话',
  `pay_type` INT(2) DEFAULT '0' COMMENT '支付方式：1：微信，2：支付宝，3：货到付款',
  `create_time` DATETIME NOT NULL ,
  `update_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_INDEX` (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET =utf8;



DROP TABLE IF EXISTS `deal`;
CREATE TABLE `deal`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `area_id` BIGINT(20) NOT NULL ,
  `area_name` VARCHAR(64) NOT NULL ,
  `sku_id` BIGINT(20) NOT NULL COMMENT '商品ID',
  `deal_class` INT(2)NOT NULL COMMENT '商品类型',
  `merchant_id` BIGINT(20) NOT NULL COMMENT '厂商ID',
  `merchant_sku` BIGINT(20) NOT NULL ,
  `deal_title` VARCHAR(200) NOT NULL COMMENT '商品标题',
  `deal_price` DECIMAL(10,0)NOT NULL COMMENT '商品价格',
  `market_price`DECIMAL(10,0) NOT NULL COMMENT '市场价',
  `settlement_price` DECIMAL(10,0)NOT NULL ,
  `settlement_price_max` DECIMAL(10,0) NOT NULL COMMENT '最大可接受结算价',
  `discount` INT(3) DEFAULT NULL COMMENT '折扣',
  `bonus_point` INT(5) DEFAULT NULL COMMENT '积分',
  `deal_type` INT(3) NOT NULL COMMENT '商品类别',
  `image_id` BIGINT(20) DEFAULT '0' COMMENT '对应商品图片',
  `deal_level` INT(4) NOT NULL COMMENT '商品优先级',
  `max_purchase_count` INT(4) DEFAULT NULL ,
  `publish_status` INT(2) NOT NULL COMMENT '发布状态',
  `inventory_amount` INT(4) NOT NULL COMMENT '商品库存数量',
  `vendibility_amount` INT(4) NOT NULL COMMENT '商品可售数量',
  `oos_status` INT(2) NOT NULL COMMENT '售空标识',
  `start_time` DATETIME NOT NULL COMMENT '销售开始时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '销售结束时间',
  `publish_time` DATETIME DEFAULT NULL COMMENT '发布时间',
  `merchant_code` VARCHAR(15) DEFAULT NULL COMMENT '商家编码',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  `category_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '商品类别ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deal_sku_UNIQUE` (`sku_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `deal_detail`;
CREATE TABLE `deal_detail`(
  `id` BIGINT(20) NOT NULL ,
  `deal_id` BIGINT(20) NOT NULL ,
  `deal_detail` VARCHAR(8000) DEFAULT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `detail_deal_UNIQUE` (`deal_id`)
)ENGINE = InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `deal_category`;
CREATE TABLE `deal_category`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` BIGINT NOT NULL COMMENT '父ID',
  `name` VARCHAR(100) NOT NULL COMMENT '名称',
  `url_name` VARCHAR(32) NOT NULL COMMENT '分类URL',
  `publish_status` INT(2) NOT NULL COMMENT '发布状态',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `order_num` INT(10) UNSIGNED NOT NULL COMMENT '排序号码',
  `deep` INT(10) UNSIGNED NOT NULL COMMENT '层次深度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deal_category_url_name_UNIQUE` (`url_name`),
  UNIQUE KEY `deal_category_name_UNIQUE` (`name`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL COMMENT '名称',
  `parent_id` BIGINT(20) NOT NULL ,
  `common` INT(4) NOT NULL ,
  `type` VARCHAR(16) NOT NULL COMMENT '类型：省，市',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_name_UNIQUE` (`name`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `image_info`;
CREATE TABLE `image_info` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `width` INT(4) DEFAULT NULL COMMENT '图片宽度',
  `height` INT(4) DEFAULT NULL COMMENT '图片高度',
  `source_path` VARCHAR(100) DEFAULT NULL COMMENT '图片源路径',
  PRIMARY KEY (`id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL ,
  `deal_id` BIGINT(20) NOT NULL ,
  `deal_sku_id` BIGINT(20) NOT NULL ,
  `count` INT(4) NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cart_user_id` (`user_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `order_id` BIGINT(20) NOT NULL COMMENT '订单ID',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户ID',
  `merchant_sku` INT(20) DEFAULT NULL COMMENT '商家商品SKU',
  `merchant_id` BIGINT(20) DEFAULT NULL COMMENT '商家ID',
  `merchant_code` VARCHAR(32)DEFAULT NULL COMMENT '商家编码',
  `deal_id` BIGINT(20) NOT NULL COMMENT '商品ID',
  `deal_sku_id` BIGINT(20)NOT NULL ,
  `deal_img_id`BIGINT(20) NOT NULL ,
  `deal_title`VARCHAR(200) NOT NULL COMMENT 'deal名称',
  `deal_count` INT(11)NOT NULL COMMENT 'deal数量',
  `deal_price` INT(11) NOT NULL COMMENT 'deal单价',
  `total_price` INT(11)NOT NULL COMMENT 'deal总价',
  `settlement_price` INT(11) NOT NULL ,
  `total_settlement_price` INT(11) NOT NULL ,
  `detail_status` INT(11) NOT NULL COMMENT '详情状态',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `detail_user_id_INDEX` (`user_id`),
  KEY `detail_order_id_INDEX` (`order_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info`(
  `id` INT(10) NOT NULL ,
  `nickname` VARCHAR(32) NOT NULL ,
  `realname` VARCHAR(32) NOT NULL ,
  `matl` VARCHAR(32) NOT NULL ,
  `phone` VARCHAR(32) NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`(
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20)NOT NULL ,
  `receiver` VARCHAR(64) NOT NULL ,
  `area` VARCHAR(256) NOT NULL ,
  `detail` VARCHAR(256) NOT NULL ,
  `type` VARCHAR(8) NOT NULL ,
  `phone` VARCHAR(16) NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_USER_ID` (`user_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL ,
  `deal_id` BIGINT(20) NOT NULL ,
  `deal_sku_id` BIGINT(20) NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `favorite_user_deal_id` (`user_id`,`deal_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL ,
  `title` VARCHAR(64) NOT NULL ,
  `content` VARCHAR(256) NOT NULL ,
  `readed` VARCHAR(4) NOT NULL ,
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `message_user_INDEX` (`user_id`)
)ENGINE =InnoDB DEFAULT CHARSET =utf8;