---
title: 'Hyper-v 和 VMware 切换'
date: 2018-05-25 16:57:33
tags: 
  - Windows10
  - WSL
---

###  Win10 下 Hyper-v 和 VMware 切换

```shell
# 必须用管理员权限，

# 关闭 Hyper-v
bcdedit /set hypervisorlaunchtype off

# 开启 Hyper-v
bcdedit /set hypervisorlaunchtype off

```

