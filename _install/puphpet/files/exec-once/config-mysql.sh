#!/usr/bin/env bash

# Apply config settings
sudo cp /home/_install/mysql/veikt.cnf /etc/my.cnf.d/veikt.cnf

# Enable the new settings
sudo service mysqld restart
