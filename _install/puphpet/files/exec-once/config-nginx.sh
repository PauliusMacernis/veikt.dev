#!/usr/bin/env bash

# Remove all existing sites
sudo rm /etc/nginx/sites-enabled/*.*

# Copy new sites
sudo cp /home/_install/nginx/download.veikt.dev.conf /etc/nginx/sites-enabled/download.veikt.dev.conf
sudo cp /home/_install/nginx/normalize.veikt.dev.conf /etc/nginx/sites-enabled/normalize.veikt.dev.conf
sudo cp /home/_install/nginx/output.veikt.dev.conf /etc/nginx/sites-enabled/output.veikt.dev.conf

# Enable the new sites
sudo service nginx restart
