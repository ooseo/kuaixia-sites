ALTER TABLE report ADD uri varchar(128) COMMENT '请求路径' AFTER UA;
ALTER TABLE system_config DROP COLUMN auto_update,DROP COLUMN auto_clean,DROP COLUMN auto_check;
ALTER TABLE sites DROP COLUMN cache_file;
ALTER TABLE copy_config ADD inter_word_entity TINYINT(4) COMMENT '叠词编码' DEFAULT 0 AFTER inter_tdk_entity;
ALTER TABLE copy_config ADD replace_h1 TINYINT(4) COMMENT '替换H1标签' DEFAULT 0 AFTER inter_word_entity;
ALTER TABLE copy_config ADD js_coding TEXT COMMENT '统计代码' AFTER preg_description;
ALTER TABLE copy_config DROP COLUMN rand_tdk;

ALTER TABLE system_config ADD close_sites TINYINT(4) COMMENT '关闭站点' DEFAULT 0 AFTER id;
ALTER TABLE system_config ADD close_post TINYINT(4) COMMENT '关闭POST请求' DEFAULT 0 AFTER close_sites;
ALTER TABLE system_config ADD uri_length INT COMMENT '请求路径长度' DEFAULT 100 AFTER mobile_landing;
ALTER TABLE system_config ADD close_ips TEXT COMMENT 'IP黑名单' AFTER landing_page;
ALTER TABLE system_config DROP COLUMN js_coding;

ALTER TABLE sites ADD host varchar(64) COMMENT '访问域名' AFTER id;
ALTER TABLE target ADD scheme char(10) COMMENT '目标站协议' AFTER id;
ALTER TABLE target ADD host varchar(64) COMMENT '目标站域名' AFTER id;
ALTER TABLE target ADD domain char(64) COMMENT '目标站主域名' AFTER id;

DROP TABLE safe_config;