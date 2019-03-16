#!/usr/bin/env bash


echo "================================================================================================"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MySQL <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "================================================================================================"

# Updating packages
apt-get update -y

# ---------------------------------------
#          MySQL Setup
# ---------------------------------------

# Setting MySQL root user password root/root
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'


# Installing packages
apt-get install -y mysql-server mysql-client

# Allow External Connections on your MySQL Service

var_charset="[mysqld]\ncharacter_set_server = utf8mb4\ncollation_server = utf8mb4_general_ci"

sudo sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/my.cnf
sudo sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/my.cnf
sudo sed -i -e "s/\[mysqld\]/$var_charset/g" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH privileges;"
sudo service mysql restart

# create client database
mysql -u root -proot -e "CREATE DATABASE mw;"