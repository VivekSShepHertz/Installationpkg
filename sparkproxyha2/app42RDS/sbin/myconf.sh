#!/bin/bash


if [ "$1" == "qwertyuiop" ]; then

echo "# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

maxClientCnxns=50
# The number of milliseconds of each tick
tickTime=2000
# The number of ticks that the initial
# synchronization phase can take
initLimit=10
# The number of ticks that can pass between
# sending a request and getting an acknowledgement
syncLimit=5
# the directory where the snapshot is stored.
dataDir=/var/lib/zookeeper
# the port at which the clients will connect
clientPort=2181
# the directory where the transaction logs are stored.
dataLogDir=/var/lib/zookeeper

server.1=10.20.1.5:2888:3888
server.2=10.20.1.6:2888:3888" > /home/azureuser/Installationpkg/sparkproxyha2/app42RDS/sbin/zoo.cfg


echo "global
    log 127.0.0.1   local2
    chroot /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haproxy
    group       haproxy
    daemon

    stats socket /var/lib/haproxy/stats


defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    option http-server-close
    option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000

frontend haproxy_in
    bind *:80
    default_backend haproxy_in

backend haproxy_in
    mode http
    balance roundrobin
    option httpchk GET /
    http-check expect string ALIVE
    server web01 10.20.1.7:8080 check
    server web02 10.20.1.8:8080 check" > /home/azureuser/Installationpkg/sparkproxyha2/app42RDS/sbin/haproxy.cfg

else
        echo "You are not authourize person, Please leave now."
        exit
fi

