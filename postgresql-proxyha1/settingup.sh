#!/bin/bash

if [ "$1" == "qscguk." ]; then

sudo apt-get update
if [ $? -nq 0 ]; then
exit 1
fi

host=`hostname`
domain=`sudo cat /etc/resolv.conf |grep search|awk '{print $2}'`

#sudo debconf-set-selections <<< "postfix postfix/mailname string ${host}.${domain}"
#sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"

sudo apt-get install -y wget ca-certificates i
#postfix mutt mailutils

		if [ $? -eq 0 ]; then
			sudo cp -arf /home/azureuser/Installationpkg/postgresql-proxyha1/app42RDS /.
			$HOME/Installationpkg/comman-postgresql/s_Config poiuytrewq
			sudo cp -arf $HOME/Installationpkg/comman-postgresql/.ssh /root/.
			sudo chown -R root.root /root/.ssh && sudo chmod 700 /root/.ssh && sudo chmod 600 /root/.ssh/authorized_keys /root/.ssh/id_rsa && sudo chmod 644 /root/.ssh/id_rsa.pub
			if [ $? -eq 0 ]; then
				echo "PostgreSQL-ProxyHA1 Configured Successfully"
			else
				echo "SSH Key Not Installed"
				exit 1
			fi
		else
			echo "PostgreSQL-ProxyHA1 Config Configuration Failed"
			exit 1
		fi

else
        echo "You are not authourize person, Please leave now."
        exit
fi
