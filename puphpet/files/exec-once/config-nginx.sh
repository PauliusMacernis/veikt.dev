#!/usr/bin/env bash
cp /home/_install/nginx/step1.veikt.dev.conf /etc/nginx/sites-enabled/step1.veikt.dev.conf
cp /home/_install/nginx/step2.veikt.dev.conf /etc/nginx/sites-enabled/step2.veikt.dev.conf
cp /home/_install/nginx/step3.veikt.dev.conf /etc/nginx/sites-enabled/step3.veikt.dev.conf
service nginx restart
