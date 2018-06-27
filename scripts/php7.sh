#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/php7.sh

hash php 2>/dev/null || {
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
  rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm 
  yum install -y php71w php71w-opcache --skip-broken
  yum install -y yum-plugin-replace
  yum replace -y php-common --replace-with=php71w-common
  yum install -y php71u-gd php71w-mysql php71w-mbstring php71w-intl
  cd /tmp
  curl -sS https://getcomposer.org/installer | php
  chmod +x composer.phar
  mv composer.phar /usr/local/bin/composer
} > /dev/null 2>&1
