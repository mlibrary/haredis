#!/bin/bash

sudo service redis-server stop

redis-server --port 6666 &
redis-server --port 6667 &
redis-server --port 6668 &
sleep 10

redis-cli -p 6667 SLAVEOF 127.0.0.1 6666
redis-cli -p 6668 SLAVEOF 128.0.0.1 6666

sleep 20
redis-server sentinel.conf --sentinel &
 
haproxy -f haproxy.cfg -db &

