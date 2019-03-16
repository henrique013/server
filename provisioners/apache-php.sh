#!/usr/bin/env bash


echo "================================================================================================"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Apache/PHP <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "================================================================================================"


# Apache
apt-get install -y apache2

cd /etc/apache2/conf-available

touch servername.conf
echo "ServerName localhost" > servername.conf
a2enconf servername

vhost="
<VirtualHost *:80>
  DocumentRoot /var/www/holder/public
  ServerName holder-localhost
  <Directory /var/www/holder/public>
    AllowOverride All
  </Directory>
</VirtualHost>
"

echo "${vhost}" > /etc/apache2/sites-available/site_vagrant.conf

a2ensite site_vagrant.conf
a2enmod rewrite


# PHP
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y php7.1 php7.1-mbstring php7.1-curl php7.1-redis php7.1-bcmath php7.1-soap php7.1-gd libapache2-mod-php7.1 php7.1-zip php7.1-xml php7.1-pgsql php7.1-mysql php7.1-intl php7.1-ldap php-xdebug php-pear php-dev

update-alternatives --set php /usr/bin/php7.1


cd /etc/php/7.1


# Xdebug
xdebug="
xdebug.remote_autostart=0
xdebug.remote_enable=1
xdebug.remote_host=10.0.2.2"

echo "${xdebug}" >> mods-available/xdebug.ini

# PHP ini - Apache
sed -i 's#short_open_tag =.*#short_open_tag = On#' apache2/php.ini
sed -i 's#.*date.timezone =.*#date.timezone = "America/Sao_Paulo"#' apache2/php.ini
sed -i 's#memory_limit =.*#memory_limit = -1#' apache2/php.ini
sed -i 's#max_execution_time =.*#max_execution_time = 6000#' apache2/php.ini
sed -i 's#display_errors =.*#display_errors = On#' apache2/php.ini
sed -i 's#display_startup_errors =.*#display_startup_errors = On#' apache2/php.ini
sed -i 's#error_reporting =.*#error_reporting = E_ALL#' apache2/php.ini

# PHP ini - CLI
sed -i 's#short_open_tag =.*#short_open_tag = On#' cli/php.ini
sed -i 's#.*date.timezone =.*#date.timezone = "America/Sao_Paulo"#' cli/php.ini
sed -i 's#memory_limit =.*#memory_limit = -1#' cli/php.ini
sed -i 's#max_execution_time =.*#max_execution_time = 0#' cli/php.ini
sed -i 's#display_errors =.*#display_errors = On#' cli/php.ini
sed -i 's#display_startup_errors =.*#display_startup_errors = On#' cli/php.ini
sed -i 's#error_reporting =.*#error_reporting = E_ALL#' cli/php.ini

# restart Apache
service apache2 restart