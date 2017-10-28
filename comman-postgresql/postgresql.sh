#!/bin/bash

if [ "$1" == "poiuytrewq" ]; then

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

# Localhost
host    replication     replica          127.0.0.1/32            md5

# PostgreSQL Master IP address
#host    replication     replica          192.168.1.0/0            md5

# PostgreSQL SLave IP address
#host    replication     replica          192.168.1.0/0            md5

host    repmgr          repmgr     192.168.1.0/0     trust
host    replication     repmgr     192.168.1.0/0     trust
host    all         all  0.0.0.0/0     md5" > $HOME/Installationpkg/comman-postgresql/pg_hba.conf

echo "cluster=test
node=1
node_name=autopg1
use_replication_slots=1
conninfo='host=autopg1 user=repmgr dbname=repmgr'
pg_bindir=/usr/lib/postgresql/9.6/bin" >  $HOME/Installationpkg/comman-postgresql/repmgr-master.conf

echo "cluster=test
node=1
node_name=autopg2
use_replication_slots=1
conninfo='host=autopg2 user=repmgr dbname=repmgr'
pg_bindir=/usr/lib/postgresql/9.6/bin" >  $HOME/Installationpkg/comman-postgresql/repmgr-standby.conf


else
        echo "You are not authourize person, Please leave now."
        exit
fi

