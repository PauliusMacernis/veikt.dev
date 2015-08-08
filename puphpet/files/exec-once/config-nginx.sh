#!/usr/bin/env bash
cp /home/_install/nginx/veikt.dev.conf /etc/nginx/sites-enabled/veikt.dev.conf
cp /home/_install/nginx/cron.veikt.dev.conf /etc/nginx/sites-enabled/cron.veikt.dev.conf
service nginx restart
