#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/php7.sh

hash php 2>/dev/null || {
  sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
  sudo yum install -y yum-utils
  sudo yum-config-manager --enable remi-php72
  sudo yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo  php-mbstring php-intl php-xml php-dom
  sudo yum -y install php-pecl-zendopcache
  sed -i -e 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf 
  cd /tmp
  curl -sS https://getcomposer.org/installer | php
  chmod +x composer.phar
  mv composer.phar /usr/local/bin/composer
} > /dev/null 2>&1
