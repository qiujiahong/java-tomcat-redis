#!/usr/bin/env bash

echo "start build file"

export name=java-tomcat-redis:v1.0

docker build --no-cache -t fangle/$name   .

# docker push fangle/$name

# docker run -d fangle/java-tomcat-redis:v1.0 tail -f /dev/null