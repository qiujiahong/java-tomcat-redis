# java redis tomcat 镜像

## 说明

该项目是一个基础镜像。包含了jdk1.8、redis 1哨兵，1主，2从，和一个tomcat 9 。 


## 文件路径

* redis安装目录: /usr/local/redis
* 启动redis: /usr/local/redis/bin/redis.sh
* tomcat安装目录: /usr/local/tomcat/

## 端口配置

* 26379 redis 哨兵
* 6379  redis master
* 6380  redis slave
* 6381  redis slave
* 8080 tomcat 端口



## docker hub地址

https://hub.docker.com/r/fangle/java-tomcat-redis/