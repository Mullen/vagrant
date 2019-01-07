#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/node.sh

hash node 2>/dev/null || {
  curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
  source /home/vagrant/.profile
  version=$(nvm ls-remote | tac | grep "Latest LTS" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | sed -e 's/[^0-9.]//g')
  nvm install $version
  nvm use $version
  nvm alias default $version
} > /dev/null 2>&1
