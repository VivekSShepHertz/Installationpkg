#!/bin/bash

case $1 in

create_lvm)
	echo "disable SELINUX"
	setenforce 0
        echo "setenforce 0" >> /etc/rc.local
        sed -i 's/'SELINUX=enforcing'/'SELINUX=disabled'/g' /etc/selinux/config
	echo "Set IP Forwording"
	echo "1" > /proc/sys/net/ipv4/ip_forward
        sed -i s/'net.ipv4.ip_forward = 0'/'net.ipv4.ip_forward = 1'/g /etc/sysctl.conf
	echo "Set Kernel Limits"
	echo "999999" > /proc/sys/fs/file-max
	echo "8388608" > /proc/sys/net/core/rmem_max
	echo "8388608" > /proc/sys/net/core/wmem_max
	echo "65536" > /proc/sys/net/core/wmem_default
	echo "65536" > /proc/sys/net/core/rmem_default
	echo "8388608 8388608 8388608" > /proc/sys/net/ipv4/tcp_mem
	echo "4096 65536 8388608" > /proc/sys/net/ipv4/tcp_wmem
	echo "4096 87380 8388608" > /proc/sys/net/ipv4/tcp_rmem
	echo "128 3200 256 256" > /proc/sys/kernel/sem
	echo "fs.file-max = 999999" >> /etc/sysctl.conf
	echo "net.core.rmem_max = 8388608" >> /etc/sysctl.conf
	echo "net.core.wmem_max = 8388608" >> /etc/sysctl.conf
	echo "net.core.rmem_default = 65536" >> /etc/sysctl.conf
	echo "net.core.wmem_default = 65536" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_rmem = 4096 87380 8388608" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_wmem = 4096 65536 8388608" >> /etc/sysctl.conf
	echo "net.ipv4.tcp_mem = 8388608 8388608 8388608" >> /etc/sysctl.conf
	echo "net.ipv4.route.flush = 1" >> /etc/sysctl.conf
	echo "kernel.sem=128 3200 256 256" >> /etc/sysctl.conf
	echo 'echo "never" > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
	echo 'echo "never" >/sys/kernel/mm/transparent_hugepage/defrag' >> /etc/rc.local
	echo "Set File Limits"
	echo "root            soft    nofile          1000000
root            hard    nofile          1000000
azureuser       soft    nofile          1000000
azureuser       hard    nofile          1000000
zookeeper        soft    nofile          1000000
zookeeper        hard    nofile          1000000
zookeeper     soft    nproc     600000
haproxy        soft    nofile          1000000
haproxy        hard    nofile          1000000
haproxy     soft    nproc     600000" >> /etc/security/limits.conf
	echo "Set File Limits OnSession"
	ulimit -Hn 1000000
	ulimit -Sn 1000000
	echo "Set Gurb Entry"
	sudo sed -i s/"rd_NO_DM"/"rd_NO_DM disable_mtrr_trim"/g /boot/grub/grub.conf
	
	echo "Setup Zookeeper"
	/home/azureuser/Installationpkg/sparkproxyha2/app42RDS/sbin/myconf qwertyuiop $lbip
	cp /home/azureuser/Installationpkg/sparkproxyha2/app42RDS/sbin/haproxy.cfg /etc/haproxy/.
	cp /home/azureuser/Installationpkg/sparkproxyha2/app42RDS/sbin/zoo.cfg /etc/zookeeper/conf/.

	/app42RDS/sbin/ConfigConstructer
	/etc/init.d/sshd restart
	sleep 10 
	#echo "*/2     *       *       *       *       root    /app42RDS/sbin/check_db" >> /etc/crontab
	#/etc/init.d/crond restart
	/etc/init.d/zookeeper-server init
	echo 2 > /var/lib/zookeeper/myid
	/etc/init.d/zookeeper-server start
	/etc/init.d/haproxy start
	
        ;;

conf_master)
	/etc/init.d/spark-master start
	/etc/init.d/spark-worker start

        ;;

esac
