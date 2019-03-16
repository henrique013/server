#!/usr/bin/env bash

echo "================================================================================================"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Oracle <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "================================================================================================"

apt-get install -y alien
cd /home/vagrant/oracle

alien -i oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
alien -i oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
alien -i oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

apt-get install libaio1

touch /etc/ld.so.conf.d/oracle.conf
echo "/usr/lib/oracle/12.1/client64/lib" > /etc/ld.so.conf.d/oracle.conf

ldconfig

export ORACLE_HOME=/usr/lib/oracle/12.1/client64/


# Bibliotecas Oracle
cp /home/vagrant/oracle/oci8.so /usr/lib/php/20160303/oci8.so
cp /home/vagrant/oracle/pdo_oci.so /usr/lib/php/20160303/pdo_oci.so

# Lib Oracle
liboracle="
	extension=/usr/lib/php/20160303/oci8.so
	extension=/usr/lib/php/20160303/pdo_oci.so"

echo "${liboracle}" >> /etc/php/7.1/apache2/php.ini
echo "${liboracle}" >> /etc/php/7.1/cli/php.ini

# restart Apache
service apache2 restart