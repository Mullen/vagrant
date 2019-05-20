#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/rvm.sh

hash rvm 2>/dev/null || {
  command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
  curl -sSL https://get.rvm.io | bash -s stable --gems=bundler
  echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
} > /dev/null 2>&1
