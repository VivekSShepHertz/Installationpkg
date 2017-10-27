#!/bin/bash

if [ "$1" == "qscguk." ]; then

#/home/azureuser/Installationpkg/comman/setenv poiuytrewq
apt-get update
if [ $? -nq 0 ]; then
exit 1
fi

apt-get -y upgrade
if [ $? -nq 0 ]; then
exit 1
fi

echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' | tee /etc/apt/sources.list.d/postgresql.list
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
if [ $? -nq 0 ]; then
exit 1
fi

#sudo chmod 777 /etc /etc/yum.repos.d /etc/yum.repos.d/CentOS-Base.repo && sudo cat /home/azureuser/Installationpkg/comman/centos.repo >> /etc/yum.repos.d/CentOS-Base.repo && sudo chmod 755 /etc /etc/yum.repos.d && sudo chmod 644 /etc/yum.repos.d/CentOS-Base.repo && sudo yum clean all
apt-get update
if [ $? -eq 0 ]; then

#sudo yum install -y /home/azureuser/Installationpkg/comman/rpms/core/bash* /home/azureuser/Installationpkg/comman/rpms/utility/mha4mysql* /home/azureuser/Installationpkg/comman/rpms/utility/perl* /home/azureuser/Installationpkg/comman/rpms/utility/fsarchiver* /home/azureuser/Installationpkg/comman/rpms/utility/mysql-community-release*
apt-get install -y postgresql-9.6 postgresql-contrib-9.6 wget ca-certificates postgresql-9.6-remgr

if [ $? -eq 0 ]; then
	systemctl enable postgresql
	#sudo sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/mysql-community.repo && sudo yum install -y mysql-community-server-$3 mysql-community-client-$3 mysql-community-common-$3 mysql-community-libs-compat-$3 mysql-community-libs-$3 && sudo cp -arf /home/azureuser/Installationpkg/mysqlha1/app42RDS /.
	#sudo chown -R root.root /app42RDS
	if [ $? -eq 0 ]; then
		$HOME/Installationpkg/comman-postgresql/master_config poiuytrewq $2
		sudo cp -arf $HOME/Installationpkg/comman-postgresql/postgresql.conf /etc/postgresql/9.6/main/postgresql.conf
		sudo cp -arf $HOME/Installationpkg/comman-postgresql/pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf
		sudo mkdir -p /etc/repmgr
		sudo cp -arf $HOME/Installationpkg/comman-postgresql/repmgr-master.conf /etc/repmgr/repmgr.conf
		sudo chown -R postgres.postgres /etc/postgresql/9.6/main
		sudo chown -R postgres.postgres /etc/repmgr
		if [ $? -eq 0 ]; then
			$HOME/Installationpkg/comman/s_Config poiuytrewq
			sudo cp -arf $HOME/Installationpkg/comman/.ssh /root/.
			sudo cp -arf $HOME/Installationpkg/comman/.ssh /var/lib/postgresql/.
			sudo chown -R root.root /root/.ssh && sudo chmod 700 /root/.ssh && sudo chmod 600 /root/.ssh/authorized_keys /root/.ssh/id_rsa && sudo chmod 644 /root/.ssh/id_rsa.pub
			sudo chown -R postgres.postgres /var/lib/postgresql/.ssh && sudo chmod 700 /var/lib/postgresql/.ssh && sudo chmod 600 /var/lib/postgresql/.ssh/authorized_keys /var/lib/postgresql/.ssh/id_rsa && sudo chmod 644 /var/lib/postgresql/.ssh/id_rsa.pub
			if [ $? -eq 0 ]; then
				echo "PostgreSQLHA1 Configured Successfully"
			else
				echo "SSH Key Not Installed"
				exit 1
			fi
		else
			echo "PostgreSQLHA1 Config Configuration Failed"
			exit 1
		fi
	else
		echo "PostgreSQLHA1 Service Could Not Be Enabled"
		exit 1
	fi
else
	echo "PostgreSQLHA1 Installation Failed"
	exit 1
fi

else 

	echo "Repo Mirror not set"
        exit 1
fi

else
        echo "You are not authourize person, Please leave now."
        exit
fi
