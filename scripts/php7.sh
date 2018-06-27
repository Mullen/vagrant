#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/php7.sh

hash php 2>/dev/null || {
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
  rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm 
  yum install -y php70w php70w-opcache --skip-broken
  yum install -y yum-plugin-replace
  yum replace -y php-common --replace-with=php70w-common
  yum install -y php70u-gd php70w-mysql php70w-mbstring php70w-intl
  cd /tmp
  curl -sS https://getcomposer.org/installer | php
  chmod +x composer.phar
  mv composer.phar /usr/local/bin/composer
} > /dev/null 2>&1
