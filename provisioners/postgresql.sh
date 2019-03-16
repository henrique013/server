#!/usr/bin/env bash


echo "================================================================================================"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PostgreSQL <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "================================================================================================"

apt-get install -y postgresql-9.3

cd /etc/postgresql/9.3/main

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" postgresql.conf
echo "host  all  all  10.0.2.0/24  md5" >> pg_hba.conf
service postgresql restart

sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"