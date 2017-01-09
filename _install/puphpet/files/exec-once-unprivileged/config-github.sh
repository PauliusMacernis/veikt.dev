#!/usr/bin/env bash

# Remove all project files
sudo rm -r -f cd /home/veikt.dev/httpdocs/* cd /home/veikt.dev/httpdocs/.*

cd /home/veikt.dev/httpdocs/

# Get the source of the project
git clone https://github.com/sugalvojau/veikt.com.git .
git checkout master

chmod 774 /home/veikt.dev/main.sh

#######################
# Prepare download.
#######################
cd /home/veikt.dev/httpdocs/download/code/php
# Update vendors
rm -rf vendor
rm -f composer.lock
# This one is not here anyway, but to be sure...
rm -f composer.phar

# Install composer.phar
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('SHA384', 'composer-setup.php') === 'c32408bcd017c577ce80605420e5987ce947a5609e8443dd72cd3867cc3a0cf442e5bf4edddbcbe72246a953a6c48e21') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# Getting v1.2.4, because the newest version v3.0 has some problems..
php composer-setup.php --version=1.2.4
php -r "unlink('composer-setup.php');"

# Composer update (install)
# Comment it out, because we want to stick with version 1.2.4
#php composer.phar self-update
php composer.phar update


#######################
# Prepare normalize.
#######################
cd /home/veikt.dev/httpdocs/normalize/code/php
# Update vendors
rm -rf vendor
rm -f composer.lock
# This one is not here anyway, but to be sure...
rm -f composer.phar

# Install composer.phar
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('SHA384', 'composer-setup.php') === 'c32408bcd017c577ce80605420e5987ce947a5609e8443dd72cd3867cc3a0cf442e5bf4edddbcbe72246a953a6c48e21') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --version=1.2.4
php -r "unlink('composer-setup.php');"

# Composer update (install)
#php composer.phar self-update
php composer.phar update


#######################
# Prepare output.
#######################
cd /home/veikt.dev/httpdocs/www
# Update vendors
rm -rf vendor
rm -f composer.lock
# This one is not here anyway, but to be sure...
rm -f composer.phar

# Install composer.phar
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('SHA384', 'composer-setup.php') === 'c32408bcd017c577ce80605420e5987ce947a5609e8443dd72cd3867cc3a0cf442e5bf4edddbcbe72246a953a6c48e21') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --version=1.2.4
php -r "unlink('composer-setup.php');"

# Composer update (install)
#php composer.phar self-update
php composer.phar update


##############################################
# Prepare www. [INSTALL]
##############################################

cd /home/veikt.dev/www;




