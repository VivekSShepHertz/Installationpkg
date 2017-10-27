#!/bin/bash

if [ "$1" == "poiuytrewq" ]; then

echo "
data_directory = '/var/lib/postgresql/9.6/main'		# use data in another directory
hba_file = '/etc/postgresql/9.6/main/pg_hba.conf'	# host-based authentication file
ident_file = '/etc/postgresql/9.6/main/pg_ident.conf'	# ident configuration file
external_pid_file = '/var/run/postgresql/9.6-main.pid'			# write an extra PID file
listen_addresses = '*'		# what IP address(es) to listen on;
port = 5432				# (change requires restart)
max_connections = 100			# (change requires restart)
unix_socket_directories = '/var/run/postgresql'	# comma-separated list of directories
ssl = on				# (change requires restart)
ssl_cert_file = '/etc/ssl/certs/ssl-cert-snakeoil.pem'		# (change requires restart)
ssl_key_file = '/etc/ssl/private/ssl-cert-snakeoil.key'		# (change requires restart)
shared_buffers = 128MB			# min 128kB
dynamic_shared_memory_type = posix	# the default is the first option
shared_preload_libraries = 'repmgr_funcs'		# (change requires restart)
wal_level = hot_standby			# minimal, replica, or logical
synchronous_commit = local		# synchronization level;
archive_mode = on		# enables archiving; off, on, or always
archive_command = 'cd .'		# command to use to archive a logfile segment
max_wal_senders = 10		# max number of walsender processes
wal_keep_segments = 10		# in logfile segments, 16MB each; 0 disables
max_replication_slots = 1	# max number of replication slots
hot_standby = on			# \"on\" allows queries during recovery
log_line_prefix = '%m [%p] %q%u@%d '			# special values:
log_timezone = 'localtime'
cluster_name = '9.6/main'			# added to process titles if nonempty
stats_temp_directory = '/var/run/postgresql/9.6-main.pg_stat_tmp'
datestyle = 'iso, mdy'
timezone = 'localtime'
lc_messages = 'en_IN'			# locale for system error message
lc_monetary = 'en_IN'			# locale for monetary formatting
lc_numeric = 'en_IN'			# locale for number formatting
lc_time = 'en_IN'				# locale for time formatting
default_text_search_config = 'pg_catalog.english'
include_dir = 'conf.d'			# include files ending in '.conf' from" > $HOME/Installationpkg/comman-postgresql/postgresql.conf

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

