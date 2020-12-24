---
title: 'linux常用命令'
date: 2020-3-23 10:40:33
tags: 
  - linux
---

### 查看使用容量

```shell
#查看当前目录总共占的容量。而不单独列出各子项占用的容量 
du -sh 
#查看当前目录下一级子文件和子目录占用的磁盘容量
du -lh --max-depth=1
#统计当前文件夹(目录)大小，并按文件大小排序
du -sh * | sort -nr 
#查看指定文件大小
du -sk filename 
```

```shell
find -maxdepth 1 -name "sellerbar-web-root-*.tar.gz" | xargs -i tar zxvf {}*
```

```shell
**/sellerbar-web-root-*.tar.gz
```

```shell
cd /opt/webapps
find -maxdepth 1 -name "sellerbar-web-root-*.tar.gz" | xargs -i tar zxvf {}
cd sellerbar-web-root-*
cd bin
./install.sh
```

```shell
# 清理yum缓存使用yum clean 命令， 清理/var/cahche
yum clean headers  #清理/var/cache/yum的headers
yum clean packages #清理/var/cache/yum下的软件包
yum clean metadata
```

<!-- more -->

### 设置git代理

```shell
git config --global http.proxy http://account:password@domian:port
```

### 手动启动ss服务

```shell
ssserver -p 8281 -k password -m rc4-md5 -d start
```

pwd 显示当前路径

find 查找绝对路径

### 在线安装mysql

```shell
view http://repo.mysql.com
select **community-release-e**的 repo
```

```shell
cd /opt
wget http://repo.mysql.com/mysql57-community-release-el7.rpm
sudo rpm -Uvh mysql57-community-release-el7.rpm
sudo yum install mysql -y
grep 'temporary password' /var/log/mysqld.log
```

### 在线安装nginx

```shell
vim /etc/yum.repos.d/nginx.repo
```

```shell
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
```

```shell
sudo yum install nginx -y
```

```shell
systemctl start nginx #启动
systemctl stop nginx #停止
systemctl restart nginx #重启
systemctl status nginx #查看运行状态
systemctl enable nginx #开机启动
```



配置文件可能会缺少server

谷歌插件安装位置

```shell
C:\Users\lucui\AppData\Local\Google\Chrome\User Data\Default\Extensions
```

### 更新node&npm

update node

```shell
npm install -g n
n latest
```

update npm

```shell
npm install -g npm
npm install npm@latest -g
or
npm update -g
```

### 安装shadowsocks

```shell
yum install python-setuptools -y
```

```shell
pip install shadowsocks
```

```shell
ssserver -p 8281 -k password -m rc4-md5 -d start
```

### 主机名修改
```shell script
hostnamectl set-hostname node01
hostname
```

