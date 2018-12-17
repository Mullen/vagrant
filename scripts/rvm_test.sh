#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/rvm_te.sh

hash rvm 2>/dev/null || {
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable
  rvm install 2.5.1
  rvm use 2.5.1
  echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
} > /dev/null 2>&1
