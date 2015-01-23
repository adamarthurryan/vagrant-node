#!/bin/bash

# update apt-get
sudo apt-get update

# install mongo db
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org


# install git
sudo apt-get install -y git

# install g++
sudo apt-get install -y g++

# install node.js
sudo apt-get -y install curl
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

# install the npm-prepare and mongod-start scripts
sudo cp /vagrant/npm-prepare /usr/local/bin
sudo chmod a+rx /usr/local/bin/npm-prepare
sudo cp /vagrant/mongod-start /usr/local/bin
sudo chmod a+rx /usr/local/bin/mongod-start

# install the SASS rubygem
sudo gem install sass