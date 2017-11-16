#!/bin/bash

Email="vivek.soni@shephertz.co.in, sintu.kumar@shephertz.co.in, dharampal.singh@shephertz.co.in"
setup_name=`hostname|cut -d"-" -f1`
ip=`ip \r|grep "proto kernel  scope link  src"|rev|awk '{print $1}'|rev`
cluster=`hostname |cut -d"-" -f1`

elasticsearch_server=`ps ax |grep java|grep elasticsearch|grep -v grep|awk '{print $1}'`
if [ -z $elasticsearch_server ]; then
/etc/init.d/elasticsearch restart
if [ $? -eq 0 ]; then
        mail -s "$setup_name : Elasticsearch VM4 Service Running Successfully : $ip" $Email < /var/lib/elasticsearch/logs/${cluster}.log
else
        mail -s "$setup_name : Elasticsearch VM4 Service Starting Failed : $ip" $Email < /var/lib/elasticsearch/logs/${cluster}.log
fi
else
/bin/echo "Process Elasticsearch VM4 Server  Is Running"
fi

