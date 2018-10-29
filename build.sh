#!/usr/bin/env bash

echo "start build file"

export name=java-tomcat-redis
export version=v1.0

docker build --no-cache -t fangle/$name:$version   .

docker tag fangle/$name:$version fangle/$name:latest

# docker push fangle/$name:$version
# docker push fangle/$name:latest

# docker run -d fangle/java-tomcat-redis:v1.0 tail -f /dev/null
# docker run -d centos:6.10 tail -f /dev/null

# docker run -d tomcat:9.0.12-jre8 tail -f /dev/null
