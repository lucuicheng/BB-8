---
title: 'ssh 配置文件开启 sftp'
date: 2020-05-20 13:28:33
tags: 
  - linux
  - ssh
---

```shell
# /etc/ssh/sshd_config, 修改配置文件

# 保持该配置注释
#Subsystem   sftp   /usr/libexec/openssh/sftp-server

# 添加如下
Subsystem   sftp    internal-sftp
```

