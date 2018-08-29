#!/bin/bash

# Using bento/ubuntu-14.04 vm box and Vagrant v1.9.8
# Corresponding line in Vagrantfile: config.vm.provision "shell", path: "bash-it.sh", privileged: false
# https://github.com/Bash-it/bash-it
# https://www.vagrantup.com

# remove old repo
rm -rf /home/vagrant/.bash_it/

# clonning bash-it repo
git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/vagrant/.bash_it

# installation
/home/vagrant/.bash_it/install.sh --silent

# Activate Bash-it plugins, aliases and completion manually
# (Add yours following this pattern)
# Adding git aliases
ln -sf /home/vagrant/.bash_it/aliases/available/git.aliases.bash /home/vagrant/.bash_it/aliases/git.aliases.bash
# Adding git completion
# Adding git plugin

# bashrc
cat <<EOT >> /home/vagrant/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export BASH_IT_THEME='bobby'
EOT

exit 0
