---
title: 'centos7 python 源码安装'
date: 2020-07-15 10:40:33
tags: 
  - linux
  - python
---
### 备注 
    centos 环境下 不建议完全直接删除原有自带的python, 可能会造成 yum 无法使用
    如果想要完全卸载自带python，请使用以下命令：
```shell script
# 卸载
rpm -qa|grep python|xargs rpm -ev --allmatches --nodeps

# 删除残余文件
whereis python |xargs rm -frv

# 验证删除
whereis python
```

### 准备依赖
```shell script
yum install wget openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel
```
### 指定源码包存放位置，以下都在该位置进行
```shell script
cd ${SOME_PATH}
```

### 获取源码包
```shell script
# www.python.org/ftp/python
wget https://www.python.org/ftp/python/3.8.4/Python-3.8.4.tgz
tar zxvf Python-3.8.4.tgz
```
   
### 配置并安装

```shell script
cd Python-3.8.4

./configure --with-ssl --enable-optimizations --prefix=/usr/local/python3

make && make install

ln -s /usr/local/python/bin/python3 /usr/bin/python

ln -s /usr/local/python/bin/pip3 /usr/bin/pip
```

### 检查安装

```shell script
python -V
```

### s


