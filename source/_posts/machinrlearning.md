---
title: '机器学习'
date: 2018-12-23 10:40:33
tags: 
  - pytorch
  - tensorflow
  - windows 10
---

### 设置终端翻墙
```shell script
set http_proxy=127.0.0.1:1080
set https_proxy=127.0.0.1:1080
# 测试
curl -v http://www.google.com
```

### 创建虚拟环境
```python
conda create -n pytorch python=3.7
```
### 直接安装
```shell script
conda install pytorch torchvision cudatoolkit=10.2 -c pytorch
# 使用国内源时，不需要后面的 -c pytorch
```

### 问题解决

```shell script
    打开终端，提示 “无法加载文件C:\XXX\WindowsPowerShell\profile.ps1，
    因为在此系统上禁止运行脚本” 的错误
    
    FIX
    
    1. 以管理员身份运行PowerShell
    
    2. 执行：get-ExecutionPolicy，回复Restricted，表示状态是禁止的
    
    3.执行：set-ExecutionPolicy RemoteSigned即可 选择 Y 
    
    一定要以管理员的身份运行PowerShell，不是cmd窗口
```

### 国内源
    修改位置为  ‪C:\Users\mklop\.condarc
```shell script
ssl_verify: true
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
  - defaults
show_channel_urls: true
```