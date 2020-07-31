---
title: '还原修复yum环境'
date: 2020-07-18 10:40:33
tags: 
  - linux
  - python
  - yum
---

### 下载如下安装包到本地目录

    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-2.7.5-88.el7.x86_64.rpm 
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-chardet-2.2.1-3.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-devel-2.7.5-88.el7.x86_64.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-iniparse-0.4-9.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-kitchen-1.1.1-5.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-libs-2.7.5-88.el7.x86_64.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-pycurl-7.19.0-19.el7.x86_64.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-setuptools-0.9.8-7.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/python-urlgrabber-3.10-10.el7.noarch.rpm
    
    http://mirrors.163.com/centos/7/os/x86_64/Packages/rpm-python-4.11.3-43.el7.x86_64.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-3.4.3-167.el7.centos.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-plugin-aliases-1.1.31-53.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-53.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-plugin-protectbase-1.1.31-53.el7.noarch.rpm 
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-updateonboot-1.1.31-53.el7.noarch.rpm
    http://mirrors.163.com/centos/7/os/x86_64/Packages/yum-utils-1.1.31-53.el7.noarch.rpm

### 本地目录安装
```shell script
rpm -ivh --force *.rpm --nodeps
```
