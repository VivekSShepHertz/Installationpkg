#!/bin/bash

if [ "$1" == "poiuytrewq" ]; then

cluster_name=`hostname|cut -d "-" -f1`

echo "
local   all             postgres                                peer

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
# Allow replication connections from localhost, by a user with the
# replication privilege.

# PostgreSQL Allow IP's address
host    repmgr          repmgr     10.20.1.0/24     trust
host    replication     repmgr     10.20.1.0/24     trust
host    all         all  0.0.0.0/0     md5" > $HOME/Installationpkg/comman-postgresql/pg_hba.conf

echo "cluster=$cluster_name
node=1
node_name=`hostname`
use_replication_slots=1
conninfo='host=10.20.1.7 user=repmgr dbname=repmgr'
pg_bindir=/usr/lib/postgresql/9.6/bin" >  $HOME/Installationpkg/comman-postgresql/repmgr-master.conf

echo "cluster=$cluster_name
node=2
node_name=`hostname`
use_replication_slots=1
conninfo='host=10.20.1.8 user=repmgr dbname=repmgr'
pg_bindir=/usr/lib/postgresql/9.6/bin" >  $HOME/Installationpkg/comman-postgresql/repmgr-standby.conf


else
        echo "You are not authourize person, Please leave now."
        exit
fi

