---
title: 'kong 网关基础内容'
date: 2020-09-23 10:40:33
tags: 
  - linux
  - kong
  - api
---

```shell script
# 最新安装包位置
https://kong.bintray.com/kong-community-edition-rpm/centos/7/
```

```shell script
yum install -y https://kong.bintray.com/kong-community-edition-rpm/centos/7/kong-community-edition-1.1.2.el7.noarch.rpm
```
```shell script
# 前王该地址获取最新包
https://yum.postgresql.org/repopackages/
```

```shell script
yum install postgresql13-contrib postgresql13-server -y
```

```shell script
# 安装
/usr/pgsql-13/bin/postgresql-13-setup initdb
vim /var/lib/pgsql/13/data/postgresql.conf
vim /var/lib/pgsql/13/data/pg_hba.conf
# 修改 listen_addresses
sed -i  /^listen_addresses/c\listen_addresses=\'*\' /var/lib/pgsql/13/data postgresql.conf
```

```shell script
# pg 查询用户
select rolname,rolpassword from pg_authid;
```

```shell script
su - postgres << EOF

psql << XOF

CREATE USER kong;
CREATE DATABASE kong OWNER kong;
ALTER USER kong PASSWORD 'Kong@123';

XOF

EOF
```
```shell script
# 修改pg密码
\password role
```

```shell script
# kong docker 安装地址
https://docs.konghq.com/install/docker/
# 配置修改
vim /etc/kong/kong.conf

kong 
```

```shell script
docker run -d --name kong \
     --network=kong-net \
     -e "KONG_DATABASE=postgres" \
     -e "KONG_PG_HOST=kong-database" \
     -e "KONG_PG_USER=kong" \
     -e "KONG_PG_PASSWORD=kong" \
     -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
     -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
     -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
     -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
     -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
     -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
     -p 8000:8000 \
     -p 8443:8443 \
     -p 10.0.0.22:8001:8001 \
     -p 10.0.0.22:8444:8444 \
     kong:latest
```

```shell script
curl -i -X POST \
  --url http://10.0.0.22:8001/services/ \
  --data 'name=actifio-service' \
  --data 'url=https://10.0.0.6'
```

```shell script
curl -i -X POST \
  --url http://10.0.0.22:8001/services/actifio-service/routes \
  --data 'hosts[]=activeio.com.cn'
```

```shell script
curl -i -X GET \
  --url http://10.0.0.22:8000/ \
  --header 'Host: activeio.com.cn'
```
