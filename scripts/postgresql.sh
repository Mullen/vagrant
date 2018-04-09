#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/postgresql.sh

hash psql 2>/dev/null || {
  rpm -Uvh https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
  yum install -y postgresql10-server postgresql10 postgresql10-libs postgresql10-contrib postgresql10-devel
  rm -rf /var/lib/pgsql/10/data
  /usr/pgsql-10/bin/postgresql-10-setup initdb
  systemctl start postgresql-10
  systemctl enable postgresql-10
  chkconfig postgresql-10 on
  sudo -u postgres psql 2>/dev/null -c "alter user postgres with password 'postgres'"
  sudo -u postgres createuser -s vagrant
  echo "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/10/data/pg_hba.conf
  sed -i "s/peer/md5/g" /var/lib/pgsql/10/data/pg_hba.conf
  sed -i "s/ident/md5/g" /var/lib/pgsql/10/data/pg_hba.conf
  echo "listen_addresses = '*'" >> /var/lib/pgsql/10/data/postgresql.conf
  ln -s /usr/pgsql-10/bin/p* /usr/local/bin
  systemctl restart postgresql-10
} > /dev/null 2>&1
