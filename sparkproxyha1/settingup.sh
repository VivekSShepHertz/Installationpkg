#!/bin/bash

if [ "$1" == "qscguk." ]; then

/home/azureuser/Installationpkg/comman/setenv poiuytrewq
if [ $? -nq 0 ]; then
exit 1
fi
sudo chmod 777 /etc /etc/yum.repos.d /etc/yum.repos.d/CentOS-Base.repo && sudo cat /home/azureuser/Installationpkg/comman/centos.repo >> /etc/yum.repos.d/CentOS-Base.repo && sudo chmod 755 /etc /etc/yum.repos.d && sudo chmod 644 /etc/yum.repos.d/CentOS-Base.repo && sudo yum clean all
if [ $? -eq 0 ]; then
sleep 10
sudo yum install -y /home/azureuser/Installationpkg/comman/rpms/core/bash* /home/azureuser/Installationpkg/comman/rpms/utility/fsarchiver* /home/azureuser/Installationpkg/comman/rpms/utility/mutt* /home/azureuser/Installationpkg/comman/rpms/utility/nc* /home/azureuser/Installationpkg/comman/rpms/utility/tokyocabinet* /home/azureuser/Installationpkg/comman/rpms/utility/urlview* /home/azureuser/Installationpkg/comman/rpms/utility/java-1.7.0-openjdk-devel-1.7.0.151-2.6.11.0.el6_9.x86_64.rpm /home/azureuser/Installationpkg/comman/rpms/utility/java-1.7.0-openjdk-1.7.0.151-2.6.11.0.el6_9.x86_64.rpm
if [ $? -eq 0 ]; then
	sleep 10
	sudo yum install -y bash 
	if [ $? -eq 0 ]; then
		sleep 10
		sudo yum install -y /home/azureuser/Installationpkg/comman/rpms/utility/zookeeper-server-3.4.5+cdh5.13.0+118-1.cdh5.13.0.p0.34.el6.x86_64.rpm /home/azureuser/Installationpkg/comman/rpms/utility/zookeeper-3.4.5+cdh5.13.0+118-1.cdh5.13.0.p0.34.el6.x86_64.rpm /home/azureuser/Installationpkg/comman/rpms/utility/bigtop-utils-0.7.0+cdh5.13.0+0-1.cdh5.13.0.p0.34.el6.noarch.rpm /home/azureuser/Installationpkg/comman/rpms/utility/haproxy-1.5.18-1.el6.x86_64.rpm

		if [ $? -eq 0 ]; then
			sudo cp -arf /home/azureuser/Installationpkg/sparkproxyha1/app42RDS /.
			/home/azureuser/Installationpkg/comman/s_Config poiuytrewq
			sudo cp -arf /home/azureuser/Installationpkg/comman/.ssh /root/.
			sudo chown -R root.root /root/.ssh && sudo chmod 700 /root/.ssh && sudo chmod 600 /root/.ssh/authorized_keys /root/.ssh/id_rsa && sudo chmod 644 /root/.ssh/id_rsa.pub
			if [ $? -eq 0 ]; then
				echo "SparkProxyHA1 Configured Successfully"
			else
				echo "SparkProxyHA1 SSH Key Not Installed"
				exit 1
			fi
		else
			echo "SparkProxyHA1 Config Configuration Failed"
			exit 1
		fi
	else
		echo "SparkProxyHA1 Service Could Not Be Installed"
		exit 1
	fi
else
	echo "SparkProxyHA1 Repo Setup Failed"
	exit 1
fi

else
        echo "SparkProxyHA1 CentOS Repo Setup Failed"
        exit 1
fi


else
        echo "You are not authourize person, Please leave now."
        exit
fi
