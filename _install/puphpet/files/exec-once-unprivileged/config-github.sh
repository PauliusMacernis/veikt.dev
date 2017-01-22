#!/usr/bin/env bash
date
bash --version
php -v

# Install Composer
cd /home/_install/php
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --version=1.2.4
php -r "unlink('composer-setup.php');"

# Remove all project files
cd /home/veikt.dev/httpdocs
sudo rm -r -f cd /home/veikt.dev/httpdocs/* cd /home/veikt.dev/httpdocs/.*

# Get the source of the project
git clone https://github.com/sugalvojau/veikt.com.git .
git checkout master

# In case something exists inside
cd /home/veikt.dev/httpdocs;
git stash;
git stash clear;
git pull;

# Make main.sh ready
chmod 774 /home/veikt.dev/httpdocs/main.sh


##############################################
# Prepare download. [CLEAN INSTALL]
##############################################

cd /home/veikt.dev/httpdocs/download/code/php
# Update vendors
rm -rf vendor
rm -f composer.lock
# This one is not here anyway, but to be sure...
rm -f composer.phar
# Install composer.phar
cp /home/_install/php/composer.phar /home/veikt.dev/httpdocs/download/code/php/composer.phar
php /home/veikt.dev/httpdocs/download/code/php/composer.phar update

##############################################
# Prepare normalize. [CLEAN INSTALL]
##############################################

cd /home/veikt.dev/httpdocs/normalize/code/php
rm -rf vendor
rm -f composer.lock
rm -f composer.phar
cp /home/_install/php/composer.phar /home/veikt.dev/httpdocs/normalize/code/php/composer.phar
php /home/veikt.dev/httpdocs/normalize/code/php/composer.phar update

##############################################
# Prepare publicize. [CLEAN INSTALL]
##############################################

cd /home/veikt.dev/httpdocs/publicize/code/php
rm -rf vendor
rm -f composer.lock
rm -f composer.phar
cp /home/_install/php/composer.phar /home/veikt.dev/httpdocs/publicize/code/php/composer.phar
php /home/veikt.dev/httpdocs/publicize/code/php/composer.phar update

##############################################
# Prepare www. [INSTALL]
##############################################

#SYMFONY_ENV=prod;
cd /home/veikt.dev/httpdocs/www

rm -rf vendor
rm -f composer.lock
rm -f composer.phar

#php bin/console cache:clear --env=prod;
#cd /home/veikt.dev/httpdocs/www;
cp /home/_install/php/composer.phar /home/veikt.dev/httpdocs/www/composer.phar
php /home/veikt.dev/httpdocs/www/composer.phar update

#SYMFONY_ENV=prod
php /home/veikt.dev/httpdocs/www/composer.phar dump-autoload

php artisan clear-compiled

php /home/veikt.dev/httpdocs/www/composer.phar update --no-dev --optimize-autoloader
#php bin/console cache:clear --env=prod;
#doctrine:migrations:migrate;\n"
#SYMFONY_ENV=prod php bin/console --no-interaction doctrine:migrations:migrate;

#cp /home/_install/yml/parameters.yml /home/veikt.dev/httpdocs/www/app/config/parameters.yml
#cp /home/_install/yml/settings.database.private.json /home/veikt.dev/httpdocs/settings.database.private.json
#cp /home/_install/yml/settings.mail.private.json /home/veikt.dev/httpdocs/settings.mail.private.json

php artisan migrate --force

chmod 774 /home/veikt.dev/httpdocs/main.sh



##############################################
# Prepare www. [INSTALL FRONTEND STUFF]
##############################################

npm rebuild node-sass --no-bin-links
