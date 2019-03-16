#!/usr/bin/env bash


echo "================================================================================================"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SETUP - BEFORE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "================================================================================================"


# set locale
locale-gen en_US.UTF-8
update-locale LANG="en_US.UTF-8"
update-locale LANGUAGE="en_US"
update-locale LC_CTYPE="en_US.UTF-8"
update-locale LC_NUMERIC="en_US.UTF-8"
update-locale LC_TIME="en_US.UTF-8"
update-locale LC_COLLATE="en_US.UTF-8"
update-locale LC_MONETARY="en_US.UTF-8"
update-locale LC_MESSAGES="en_US.UTF-8"
update-locale LC_PAPER="en_US.UTF-8"
update-locale LC_NAME="en_US.UTF-8"
update-locale LC_ADDRESS="en_US.UTF-8"
update-locale LC_TELEPHONE="en_US.UTF-8"
update-locale LC_MEASUREMENT="en_US.UTF-8"
update-locale LC_IDENTIFICATION="en_US.UTF-8"

# timezone
timedatectl set-timezone America/Sao_Paulo