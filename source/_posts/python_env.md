---
title: 'centos7 python3 虚拟环境安装'
date: 2020-07-15 13:27:33
tags: 
  - linux
  - python
---

### 准备依赖
```shell script
pip install virtualenv

pip install virtualenvwrapper
```

### 配置 bashrc

#### 增加如下配置
```shell script
export WORKON_HOME=~/.environments
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/root/.local/bin/virtualenv
source /root/.local/bin/virtualenvwrapper.sh
```
#### 启用配置
```shell script
source ~/.bashrc
```
### 虚拟环境

#### 创建
```shell script
mkvirtualenv -p python3 py3_flask
```
#### 查看
```shell script
workon
```
#### 切换
```shell script
workon py3_flask
```
