---
title: 'mysql 在线安装后基础配置'
date: 2018-05-26 13:28:33
tags:
- linux
- mysql
---

### 修改策略，及密码长度
```shell
set global validate_password_length=1;
```

```shell
set global validate_password_policy=0
```

### 修改密码
```shell
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
```
```shell
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
```
```shell
FLUSH PRIVILEGES;
```

### 修改权限
```shell
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'YYBrhr_2018' WITH GRANT OPTION;
```
```shell
FLUSH PRIVILEGES;
```