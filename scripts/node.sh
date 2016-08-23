#!/bin/bash

hash node 2>/dev/null || {
  echo "Installing Node.js"
  curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash > /dev/null 2>&1
  echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
  source /home/vagrant/.profile
  nvm install 5.0 > /dev/null 2>&1
  nvm use 5.0 > /dev/null 2>&1
  nvm alias default 5.0 > /dev/null 2>&1
}