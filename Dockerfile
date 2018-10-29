FROM centos:7.5.1804

MAINTAINER Nick qiujh@szfangle.com


copy ./files /tmp/

RUN echo "==> start to install base image..." && \
    cd /tmp/soft/  && \
    yum -y install gcc automake autoconf libtool make aclocal autoheader makeinfo cc crontabs && \
    mkdir -p /etc/redis/ && \
    mkdir -p /opt/soft/redis/data && \
    mkdir -p /var/log/redis/ && \
    cp /tmp/script/* /etc/redis && \
    tar -xzvf redis-*.tar.gz && \
    cd redis-*  && \
    make && make PREFIX=/usr/local/redis install &&\
    sed -i '/export PATH/d'  ~/.bash_profile &&\
    echo "PATH=\$PATH:/usr/local/redis/bin/" >> ~/.bash_profile &&\
    echo "export PATH" >> ~/.bash_profile && \
    cp /tmp/script/redis.sh /usr/local/redis/bin/ && \
    chmod +x /usr/local/redis/bin/redis.sh && \
    echo "install redis end............"  && \
    cd /tmp/soft/ && \
    rpm -ivh jdk-8u*-linux-x64.rpm  && \
    tar -xzvf apache-tomcat-9.0.10.tar.gz  && \
    mv apache-tomcat-9.0.10 /usr/local/tomcat && \
    rm -rf /usr/local/tomcat/webapps/*  && \
    mkdir /usr/local/tomcat/webapps/ROOT && \
    echo "home" > /usr/local/tomcat/webapps/ROOT/index.html && \
    rm -rf /usr/local/tomcat/bin/catalina.sh && \
    cp /tmp/script/catalina.sh /usr/local/tomcat/bin/ && \
    chmod +x /usr/local/tomcat/bin/catalina.sh && \ 
    echo "start to install cronolog" && \
    cd /tmp/soft/ && \
    echo "1111" && \
    ls && \
    tar -xzvf cronolog-1.6.2.tar.gz &&\
    echo "222" && \
    ls && \
    cd cronolog-1.6.2 && \
    ./configure && \
    make && \
    make install && \
    echo "clear packages soft....."  && \
    rm -rf /tmp/soft/  && \
    rm -rf /tmp/script/ && \
    echo "Install finised"

EXPOSE 26379
EXPOSE 6379
EXPOSE 6380
EXPOSE 6381
EXPOSE 8080

# ENTRYPOINT ["/usr/local/redis/bin/redis.sh"]