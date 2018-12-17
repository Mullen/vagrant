#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/rvm_te.sh

hash rvm 2>/dev/null || {
  command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
  \curl -sSL https://get.rvm.io | bash -s stable
  source /home/vagrant/.rvm/scripts/rvm
  # rvm install 2.5.3
  # rvm use 2.5.3
  echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
} > /dev/null 2>&1
