#!/bin/bash

if [ "$1" == "qscguk." ]; then

/home/azureuser/Installationpkg/comman/setenv poiuytrewq
if [ $? -nq 0 ]; then
exit 1
fi
sudo chmod 777 /etc /etc/yum.repos.d /etc/yum.repos.d/CentOS-Base.repo && sudo cat /home/azureuser/Installationpkg/comman/centos.repo >> /etc/yum.repos.d/CentOS-Base.repo && sudo chmod 755 /etc /etc/yum.repos.d && sudo chmod 644 /etc/yum.repos.d/CentOS-Base.repo && sudo yum clean all
if [ $? -eq 0 ]; then
sleep 10
sudo yum install -y /home/azureuser/Installationpkg/comman/rpms/core/bash* /home/azureuser/Installationpkg/comman/rpms/utility/fsarchiver* /home/azureuser/Installationpkg/comman/rpms/utility/mutt* /home/azureuser/Installationpkg/comman/rpms/utility/nc* /home/azureuser/Installationpkg/comman/rpms/utility/tokyocabinet* /home/azureuser/Installationpkg/comman/rpms/utility/urlview* http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
if [ $? -eq 0 ]; then
yum install -y redis
	sleep 10
	yum install -y haproxy
	sudo cp -arf /home/azureuser/Installationpkg/redisproxyha1/app42RDS /.
	if [ $? -eq 0 ]; then
		/home/azureuser/Installationpkg/comman/s_Config poiuytrewq
		if [ $? -eq 0 ]; then
			sudo cp -arf /home/azureuser/Installationpkg/comman/.ssh /root/.
		        sudo chown -R root.root /root/.ssh && sudo chmod 700 /root/.ssh && sudo chmod 600 /root/.ssh/authorized_keys /root/.ssh/id_rsa && sudo chmod 644 /root/.ssh/id_rsa.pub
			if [ $? -eq 0 ]; then
				echo "RedisProxyHA1 Configured Successfully"
			else
				echo "RedisProxyHA1 SSH Key Not Installed"
				exit 1
			fi
		else
			echo "RedisProxyHA1 Config Configuration Failed"
			exit 1
		fi
	else
		echo "RedisProxyHA1 Service Could Not Be Installed"
		exit 1
	fi
else
	echo "RedisProxyHA1 Repo Setup Failed"
	exit 1
fi

else
        echo "RedisProxyHA1 CentOS Repo Setup Failed"
        exit 1
fi


else
        echo "You are not authourize person, Please leave now."
        exit
fi
