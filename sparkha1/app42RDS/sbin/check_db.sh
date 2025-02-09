#!/bin/bash

Email="vivek.soni@shephertz.co.in, sintu.kumar@shephertz.co.in, dharampal.singh@shephertz.co.in "
setup_name=`hostname|cut -d"-" -f1`
ip=`ip \r|grep "proto kernel  scope link  src"|rev|awk '{print $1}'|rev`
mongo=`ps ax |grep mongod|grep -v grep |grep -v dhclient|awk '{print $1}'`
/bin/echo "d=$mongo"

if [ -z $mongo ]; then
/etc/init.d/mongod restart
if [ $? -eq 0 ]; then
        mail -s "$setup_name : $ip : MongoDB Service Running Successfully : MongoDBHA1" $Email < /var/lib/mongo/logs/mongod.log
else
        mail -s "$setup_name : $ip : MongoDB Service Starting Failed : MongoDBHA1" $Email < /var/lib/mongo/logs/mongod.log
fi
else
/bin/echo "Process MongoDB Is Running"
fi

