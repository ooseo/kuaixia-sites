## 介绍

- 快侠镜像站群（V1.0.0）

## 特点

- 简单高效，方便管理
- 兼容 Linux、macOS，暂不支持 Windows 系统
- 结合多种常规/非常规 SEO 手法
- 全方位安全策略，让系统运行高枕无忧
- 自动化管理缓存，让您的站点时刻更新
- 实时报表分析，帮您定位流量来源
- 站点检测让被 K 核心词，被 K 站点及时下架 

## 安装

### 以 Centos 7.2 为例

1 安装最新宝塔面板（略）

2 极速安装 （控制面板操作）
- nginx 1.16.0 
- php-7.2 
- mysql 5.7.26 
- redis 5.0.5

3 PHP 配置
- 安装 PHP 解密扩展 [safegou](https://github.com/ooseo/safegou) （登陆服务器操作）
- 删除 PHP 禁用函数 （控制面板操作）
```
putenv
proc_open
shell_exec
```
- 安装 PHP 其他扩展（控制面板操作）
```
fileinfo
redis
yaf
readline
```
**Yaf扩展需要额外配置（控制面板操作）**
```
[yaf]
extension=/www/server/php/72/lib/php/extensions/no-debug-non-zts-20170718/yaf.so
yaf.environ = product
yaf.use_spl_autoload = 0
yaf.use_namespace = 1
```

4 数据库配置 （控制面板操作）
- 创建数据库（utf8）
- 上传数据库初始文件（init.sql）后导入

5 创建站点（www.xxoo.com） 
- 获取代码（登陆服务器操作）
 
```
cd /www/wwwroot/www.xxoo.com
git clone https://github.com/ooseo/kuaixia-sites.git
cd kuaixia-sites
php /usr/bin/composer install
```
- 站点配置（控制面板操作）

```
域名管理：添加站群所有域名的顶级和 www 二级域名
网站目录：/www/wwwroot/www.xxoo.com/kuaixia-sites
运行目录：/public
伪静态：
location / {
    if (!-e $request_filename) {
        rewrite ^(.*)$ /index.php/$1 last;
        break;
    }
}
配置文件（删除原有的静态文件配置）：
location ~ ^/alocal {
    root /www/wwwroot/www.xxoo.com/kuaixia-sites;
    expires      30d;
    error_log /dev/null;
    access_log off;
}
```
- 修改程序配置文件

config/application.ini
```
application.auth.code = 授权CODE
```
config/application.product.ini 
```
数据库配置（略）
Redis配置（略）

admin.domain = www.xxoo.com # 访问后台的域名
```

## 站群配置
- 登陆后台，默认用户 admin 默认密码 qq12345
- 数据管理导入站点数据（站点名称和站点核心词必须导入）
- 添加目标站点（添加后批量采集）
- 其他配置见系统内说明



 

