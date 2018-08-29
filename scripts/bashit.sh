#!/bin/bash

hash bash-it 2>/dev/null || {
  # Using bento/ubuntu-14.04 vm box and Vagrant v1.9.8
  # Corresponding line in Vagrantfile: config.vm.provision "shell", path: "bash-it.sh", privileged: false
  # https://github.com/Bash-it/bash-it
  # https://www.vagrantup.com

  # remove old repo
  rm -rf /home/vagrant/.bash_it/

  # clonning bash-it repo
  git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/vagrant/.bash_it

  # installation
  /home/vagrant/.bash_it/install.sh

  # Activate Bash-it plugins, aliases and completion manually
  # (Add yours following this pattern)
  # Adding git aliases
  ln -sf /home/vagrant/.bash_it/aliases/available/git.aliases.bash /home/vagrant/.bash_it/aliases/git.aliases.bash
  # Adding git completion
  # Adding git plugin

  # bashrc
  echo "export BASH_IT_THEME='bobby'" >> /home/vagrant/.bashrc
} > /dev/null 2>&1
