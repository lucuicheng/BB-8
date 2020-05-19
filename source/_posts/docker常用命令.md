---
title: 'docker常用命令'
date: 2019-05-19 10:40:33
categories: linux
tags: 
  - docker
  - linux
---

### list docker

```shell
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" -a
```

### 国内加速地址

```shell
#Docker中国区官方镜像
https://registry.docker-cn.com
#网易
http://hub-mirror.c.163.com
#中国科技大学
https://docker.mirrors.ustc.edu.cn
```

### consul

```shell
docker pull consul
```

```shell
sudo mkdir -p /Users/mklop/data/consul
```

```shell
sudo docker run -d -p 8500:8500 -v /Users/mklop/data/consul:/consul/data -e CONSUL_BIND_INTERFACE='eth0' --name=consul1 consul agent -server -bootstrap -ui -client='0.0.0.0'
```

```shell
sudo mkdir -p /opt/data/consul
```

```shell
sudo docker run -d --restart=always -p 8500:8500 -v /opt/data/consul:/consul/data -e CONSUL_BIND_INTERFACE='eth0' --name=consul-master consul agent -server -bootstrap -ui -client='0.0.0.0'
```

<!-- more -->

### 私服

```shell
# 查看私服所有镜像
http://ip_address:5000/v2/_catalog
http://192.168.3.100:5000/v2/_catalog
#客户端
/etc/docker/daemon.json
#
{
  "registry-mirrors": [
    "https://registry.docker-cn.com"
  ],
  "insecure-registries": [
    "ip:5000"
  ]
}
#
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### 打包后的jar包

```shell
docker run -d -p 8082:8082 -e "SPRING_PROFILES_ACTIVE=dev" --name vich-test 47.103.196.249:10077/vendorsbar-manager-logistics-api:0.0.1
```

### nexus

```shell
docker run -d --name nexus3 --restart=always -p 8081:8081 -v /opt/nexus-data:/nexus-data sonatype/nexus3
```

```shell
chmod 777 /opt/nexus-data
```

### registry

```shell
docker run -d --name registry --restart=always -p 5000:5000 -v /usr/local/registry:/var/lib/registry registry
```

### gitlab

```shell
docker run -d --name gitlab --restart always -p 443:443 -p 90:80 -p 222:22   -v /opt/gitlab/config:/etc/gitlab -v /opt/gitlab/logs:/var/log/gitlab -v /opt/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce
```

```shell
# gitlab.rb文件内容默认全是注释
$ vim /opt/gitlab/config/gitlab.rb
```

```shell
# 配置http协议所使用的访问地址,不加端口号默认为80
external_url 'http://192.168.0.100:90'

# 配置ssh协议所使用的访问地址和端口
gitlab_rails['gitlab_ssh_host'] = '192.168.0.100'
gitlab_rails['gitlab_shell_ssh_port'] = 222 # 此端口是run时22端口映射的222端口
:wq #保存配置文件并退出
```

### jenkins

```shell
docker run -d --name jenkins --restart always -p 8090:8080 -v /opt/jenkins:/var/jenkins_home jenkins:latest
```

```shell
chmod 777 /opt/jenkins
```

### enter docker

```shell
docker exec -it a9247d879ae6 /bin/bash
```

### mysql

```shell
docker pull mysql5.7
```

```shell
docker run -p 3306:3306 --name mysql -v D:/Docker/mysql/conf:/etc/mysql/conf.d -v D:/Docker/mysql/logs:/logs -v D:/Docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
```

```shell
mkdir -p /opt/data/mysql
mkdir conf logs data
```

```bash
docker run --restart=always -p 3306:3306 --name mysql -v /opt/data/mysql/conf:/etc/mysql/conf.d -v /opt/data/mysql/logs:/logs -v /opt/data/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
```

```shell
docker run --restart=always -p 33063:3306 --name mysql -v /opt/data/mysql/conf:/etc/mysql/conf.d -v /opt/data/mysql/logs:/logs -v /opt/data/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql
```

```shell
docker run --restart=always -p 3306:3306 --name mysql -v /Users/cuichenglu/opt/data/conf:/etc/mysql/conf.d -v /Users/cuichenglu/opt/data/conf/my.cnf:/etc/mysql/my.cnf -v /Users/cuichenglu/opt/data/logs:/logs -v /Users/cuichenglu/opt/data/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql
```

```shell
docker run --restart=always -p 3306:3306 --name mysql -v /Users/cuichenglu/opt/data/conf:/etc/mysql/conf.d -v /Users/cuichenglu/opt/data/logs:/logs -v /Users/cuichenglu/opt/data/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql
```

### rabbitmq

```shell
 mkdir -p /opt/data/rabbitmq/data
```

```shell
docker pull rabbitmq:3.8.3-management
```

```shell
docker run --restart=always --name rabbitmq -p 5672:5672 -p 15672:15672 -v /opt/data/rabbitmq:/var/lib/rabbitmq --hostname vich-rabbit -e RABBITMQ_DEFAULT_VHOST=vich-rabbit-vhost -e RABBITMQ_DEFAULT_USER=vich -e RABBITMQ_DEFAULT_PASS=Kanyan123! rabbitmq:3.8.3-management
```

### redis

```shell
docker pull redis
```

```shell
docker run -p 6379:6379 --name redis -v D:/Docker/redis/data:/data -d redis
```

```shell
docker run -p 6379:6379 --name redis -v /opt/data/redis/data:/data -d redis
```

```shell
docker run -d --restart=always -v /opt/data/redis/data:/data --name redis -p 6379:6379 redis --requirepass "123456"
```

### portainer 

```shell
docker pull portainer/portainer
```

```shell
docker run -p 9000:9000 --restart=always --name prtainer -v /var/run/docker.sock:/var/run/docker.sock -d  portainer/portainer
```

### mongo

```shell
docker run -d --restart=always -p 17027:27017 -v /opt/container/mongo_configdb:/data/configdb -v /opt/container/mongo_db:/data/db --name mongo docker.io/mongo
```

### elasticsearch

```bash
docker network create search-network
```

```shell
docker run -d --restart=always --net search-network -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" --name elasticsearch docker.elastic.co/elasticsearch/elasticsearch:7.4.2 
```

