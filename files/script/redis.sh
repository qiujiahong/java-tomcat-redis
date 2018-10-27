#!/bin/bash
/usr/local/redis/bin/redis-server /etc/redis/6379.conf
/usr/local/redis/bin/redis-server /etc/redis/6380.conf
/usr/local/redis/bin/redis-server /etc/redis/6381.conf
/usr/local/redis/bin/redis-sentinel /etc/redis/26379.conf
