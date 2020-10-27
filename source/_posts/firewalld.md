---
title: 'centos 防火墙'
date: 2018-05-26 13:28:33
tags:
  - linux
  - firewall
---

### 单个
```shell
firewall-cmd --permanent --zone=public --add-port=100/tcp
firewall-cmd --permanent --zone=public --add-port=100/udp
firewall-cmd --reload
```
### 范围
```shell
firewall-cmd --permanent --zone=public --add-port=100-500/tcp
firewall-cmd --permanent --zone=public --add-port=100-500/udp
firewall-cmd --reload
```
