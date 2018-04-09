#!/bin/bash

# https://raw.githubusercontent.com/Mullen/vagrant/master/scripts/elasticsearch.sh

curl -s "http://localhost:9200" 2>&1 > /dev/null
if [ $? != 0 ]; then
  yum install java-1.8.0-openjdk.x86_64 -y
  cd /tmp
  wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.1.1.rpm
  yum install elasticsearch-5.1.1.noarch.rpm -y
  systemctl daemon-reload
  systemctl enable elasticsearch.service
  systemctl start elasticsearch.service
fi > /dev/null 2>&1
