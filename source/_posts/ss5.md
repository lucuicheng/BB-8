```shell
 wget https://nchc.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
 
 yum -y install gcc automake make
 
yum -y install pam-devel openldap-devel cyrus-sasl-devel openssl-devel

tar xvf ss5-3.8.9-8.tar.gz

cd ss5-3.8.9-8

./configure && make && make install

# 修改配置文件
/etc/opt/ss5/ss5.conf
auth    0.0.0.0/0               -               -
permit -	0.0.0.0/0	-	0.0.0.0/0	-	-	-	-	-	

# 端口ip文件，取消注释
/etc/sysconfig/ss5
# 改成如下内容
SS5_OPTS=" -u root -b 0.0.0.0:1080" # 端口自定义，默认1080

chmod 755 /etc/rc.d/init.d/ss5

service ss5 start

netstat -lanp | grep *port
```