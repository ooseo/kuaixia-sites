# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19-log)
# Database: dafeiji-sites
# Generation Time: 2021-02-26 03:43:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table copy_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `copy_config`;

CREATE TABLE `copy_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inter_big` tinyint(4) NOT NULL,
  `inter_tdk_big` tinyint(4) NOT NULL,
  `inter_tdk_entity` tinyint(4) NOT NULL,
  `inter_word_entity` tinyint(4) NOT NULL,
  `replace_h1` tinyint(4) DEFAULT '0' COMMENT '替换H1标签',
  `inter_template` tinyint(4) NOT NULL,
  `is_inpage_word` tinyint(4) NOT NULL,
  `is_ascii` tinyint(4) NOT NULL,
  `rand_tdk` tinyint(4) NOT NULL,
  `preg_title` varchar(128) DEFAULT '',
  `preg_keywords` varchar(128) DEFAULT '',
  `preg_description` varchar(256) DEFAULT '',
  `js_coding` text,
  `base_domain_redirect` tinyint(4) NOT NULL COMMENT '主域重定向',
  `inter_word_num` int(11) NOT NULL,
  `inter_side_link_num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(128) NOT NULL,
  `spider_type` tinyint(4) NOT NULL DEFAULT '0',
  `ip` varchar(64) DEFAULT '',
  `is_spider_ip` tinyint(4) DEFAULT '0',
  `ua` varchar(256) DEFAULT '',
  `uri` varchar(256) DEFAULT '',
  `referer` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table safe_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `safe_config`;

CREATE TABLE `safe_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `close_sites` tinyint(4) NOT NULL DEFAULT '0',
  `close_post` tinyint(4) NOT NULL DEFAULT '0',
  `uri_length` int(11) NOT NULL DEFAULT '0',
  `close_ips` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) DEFAULT NULL,
  `domain` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `tid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `mapping_at` datetime DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table sites_source
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites_source`;

CREATE TABLE `sites_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate` tinyint(11) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uni_value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table spider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spider`;

CREATE TABLE `spider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `baiduspider` text,
  `googlebot` text,
  `sogou` text,
  `yisou` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `spider` WRITE;
/*!40000 ALTER TABLE `spider` DISABLE KEYS */;

INSERT INTO `spider` (`id`, `baiduspider`, `googlebot`, `sogou`, `yisou`)
VALUES
	(1,'116.179.32.*,124.166.232.*,123.125.66.*,220.181.7.*,121.14.89.*,220.181.108.*,123.125.71.*,210.72.225.*,203.208.60.*,123.125.68.*,220.181.68.*,125.90.88.*','139.198.19.213,202.101.43.*,222.73.247.*,66.249.65.*,66.249.16.*,210.72.225.*,203.208.60.*,216.239.33.*,216.239.35.*,216.239.37.*,216.239.39.*,216.239.51.*,216.239.53.*,216.239.55.*,216.239.57.*,216.239.59.*,64.233.161.*,64.233.189.*,66.102.11.*,66.102.7.*,66.102.9.*,66.249.64.*,66.249.65.*,66.249.66.*,66.249.68.*,66.249.71.*,66.249.72.*,66.249.72.*,66.249.73.*,66.249.74.*,66.249.75.*,66.249.76.*,66.249.77.*,66.249.78.*,66.249.79.*,66.249.70.*,72.14.207.*','58.250.125.*,106.38.241.*,106.120.173.*,220.181.89.*,123.126.113.*,218.30.103.*,61.135.189.*,111.202.101.*,111.202.100.*','42.156.136.*,42.156.137.*,42.156.138.*,42.156.139.*,42.120.160.*,42.120.161.*');

/*!40000 ALTER TABLE `spider` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table system_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_config`;

CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `close_sites` tinyint(4) DEFAULT '0' COMMENT '关闭站点',
  `close_post` tinyint(11) DEFAULT '0',
  `check_spider_ua` tinyint(4) NOT NULL,
  `check_spider_ip` tinyint(4) NOT NULL,
  `pc_landing` varchar(128) DEFAULT '',
  `mobile_landing` varchar(128) DEFAULT '',
  `uri_length` int(11) DEFAULT '100',
  `error_page` mediumtext COMMENT '错误页面',
  `landing_page` mediumtext COMMENT '跳转页面',
  `close_ips` text,
  `js_coding` mediumtext COMMENT '其他js代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table target
# ------------------------------------------------------------

DROP TABLE IF EXISTS `target`;

CREATE TABLE `target` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scheme` char(10) DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `domain` varchar(128) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `encoding` varchar(64) DEFAULT '',
  `index` varchar(128) DEFAULT '',
  `source_path` varchar(128) DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `is_admin` tinyint(4) DEFAULT '0',
  `salt` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) DEFAULT '',
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`, `is_admin`, `salt`, `email`, `status`, `created_at`)
VALUES
	(1,'admin','58db03b1adf2413f3f4225e174426709',1,'KvJuLO','admin@163.com',0,'2021-01-23 14:11:27');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table words_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `words_file`;

CREATE TABLE `words_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `origin_name` varchar(128) DEFAULT '',
  `size` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `path` varchar(256) DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
