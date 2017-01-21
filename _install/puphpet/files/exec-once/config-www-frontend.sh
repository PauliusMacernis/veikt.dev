#!/usr/bin/env bash

# veikt.com -- nodejs, npm, gulp

curl --silent --location https://rpm.nodesource.com/setup_7.x | bash -
sudo yum -y install nodejs
yum install gcc-c++ make
sudo yum install nodejs npm --enablerepo=epel
sudo npm install -g gulp

# Try 10x.. TODO: find better solution than this...
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
sudo npm install --no-bin-links
