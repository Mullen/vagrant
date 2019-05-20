#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/rvm.sh

hash rvm 2>/dev/null || {
  gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s stable --gems=bundler
  echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
} > /dev/null 2>&1
