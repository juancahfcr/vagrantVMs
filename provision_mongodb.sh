#!/usr/bin/env bash

# Packages
#config.vm.provision "shell", inline: <<-SHELL
#    yum update -y
#    yum install epel-release -y
#    yum install ansible -y
#  SHELL

# MongoDB
[mongodb-org-4.2]
echo "Installing mongodb"
echo -e "[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc" | sudo tee /etc/yum.repos.d/mongodb-org-3.2.repo

# To install the most stable version
sudo yum install -y mongodb-org

# To install one specific version
#sudo yum install -y mongodb-org-4.2.5 mongodb-org-server-4.2.5 mongodb-org-shell-4.2.5 mongodb-org-mongos-4.2.5 mongodb-org-tools-4.2.5

sudo sed -i "s/bindIp:\ 127.0.0.1/bindIp:\ 0.0.0.0/g" /etc/mongod.conf
sudo systemctl start mongod.service
sudo systemctl enable mongod.service
sudo systemctl restart mongod.service

sudo yum update -y
sudo yum install epel-release -y
sudo yum install python-pip -y
pip --version

sudo yum install python-devel -y
pip install --upgrade pip
sudo pip install bottle
