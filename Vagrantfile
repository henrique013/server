# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = File.basename(Dir.getwd) # current directory


  # PORTS
  config.vm.network "forwarded_port", guest: 80, host: 8080      # apache
  #config.vm.network "forwarded_port", guest: 6379, host: 6379    # redis
  #config.vm.network "forwarded_port", guest: 3000, host: 3000    # react
  #config.vm.network "forwarded_port", guest: 3306, host: 3306    # mysql
  config.vm.network "forwarded_port", guest: 5432, host: 5432    # postgres
  #config.vm.network "forwarded_port", guest: 15672, host: 15672 # rabbit monitor
  #config.vm.network "forwarded_port", guest: 5672, host: 5672   # rabbit


  # SYNC FOLDER
  config.vm.synced_folder File.read("./params/synced_folder"), "/var/www", id: "vagrant-root", owner: "vagrant", group: "www-data", mount_options: ["dmode=777,fmode=777"]


  # MEMORY
  config.vm.provider "virtualbox" do |vb|
     vb.memory = File.read("./params/memory")
  end


  # ORACLE FILES
  #config.vm.provision "file", source: "./oracle/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm", destination: "$HOME/oracle/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm"
  #config.vm.provision "file", source: "./oracle/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm", destination: "$HOME/oracle/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm"
  #config.vm.provision "file", source: "./oracle/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm", destination: "$HOME/oracle/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm"
  #config.vm.provision "file", source: "./oracle/oci8.so", destination: "$HOME/oracle/oci8.so"
  #config.vm.provision "file", source: "./oracle/pdo_oci.so", destination: "$HOME/oracle/pdo_oci.so"


  # ORACLE FILES
  config.vm.provision "shell", path: "./provisioners/setup-before.sh"
  #config.vm.provision "shell", path: "./provisioners/hosts.sh"
  config.vm.provision "shell", path: "./provisioners/util.sh"
  #config.vm.provision "shell", path: "./provisioners/rabbitmq.sh"
  #config.vm.provision "shell", path: "./provisioners/redis.sh"
  config.vm.provision "shell", path: "./provisioners/apache-php.sh"
  #config.vm.provision "shell", path: "./provisioners/mysql.sh"
  config.vm.provision "shell", path: "./provisioners/postgresql.sh"
  #config.vm.provision "shell", path: "./provisioners/oracle-drivers.sh"
  config.vm.provision "shell", path: "./provisioners/composer.sh"
  config.vm.provision "shell", path: "./provisioners/nvm.sh", privileged: false
  #config.vm.provision "shell", path: "./provisioners/cron.sh", privileged: false
  config.vm.provision "shell", path: "./provisioners/setup-after.sh"

end