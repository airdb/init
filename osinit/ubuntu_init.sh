#!/bin/bash

function base() {
  echo "Set timezone"
  ln -snf /usr/share/zoneinfo/Asia/Singapore /etc/localtime && echo 'Asia/Singapore' > /etc/timezone
  # "cat /etc/bar" > /etc/update-motd.d/10-help-text
  apt-get -y install update-motd
  update-motd
}

function common() {
  export RUNNING_CONTEXT=docker
  export INSTALL_PACKAGES=yes
  apt-get -y install python-pip python-dev libmysqlclient-dev vim
  apt-get -y install iputils-ping telnet net-tools
  apt-get -y install redis-server
  export LC_ALL=C
  pip install -U pip
  pip install MySQL-python
}

function golang() {
    # apt-get -y install golang # go1.6
    # wget https://dl.google.com/go/go1.12.5.linux-386.tar.gz -O /tmp/
    echo golang
}

function php() {
    apt-get -y install software-properties-common
    apt-get update
    add-apt-repository ppa:ondrej/php

    # libpcre3 libssl1.1 php-common php7.1-common php7.1-json php7.1-opcache php7.1-readline php7.1-cli php7.1-fpm
    apt-get -y --allow-unauthenticated install php7.1-fpm
    #apt-get -y --allow-unauthenticated install php7.1 php7.1-xml php7.1-process php7.1-mbstring php7.1-mysql php7.1-gd php7.1-common php7.1-cli php7.1-pear php7.1-opcache php7.1-bcmath php7.1-pdo php7.1-dev php7.1-fpm php7.1-pecl-imagick mod_php7.1 php7.1-pecl-apcu
}

function usage() {
   echo "Usage: $0 Options"
   echo
   echo "Options:"
   echo "\tbase"
   echo "\tcommon"
   echo "\tgolang"
   echo "\tpython"
   echo "\tphp"
}

function main() {
    case $1 in
        base)
            base
            ;;
        common)
            base
            common
            ;;
        golang)
            golang
            ;;
        python)
            ;;
        python3)
            ;;
        php)
            php
            ;;
        *)
            usage
            ;;
    esac
}

## here we go
main "$@"
