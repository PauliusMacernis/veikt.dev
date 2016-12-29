#!/usr/bin/env bash

# Update all
sudo yum -y update

# Laravel 5.3 specials
sudo yum -y install php-mbstring
sudo yum -y install php-pdo

# Just to be sure all updates are enabled
sudo service php-fpm restart
sudo service nginx restart