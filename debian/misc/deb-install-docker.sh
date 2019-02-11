#!/bin/bash

DISTRIBUTION="debian"

### uninstall old version
sudo apt-get -y remove docker docker-engine docker.io

### setup repository
sudo apt-get -y update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/${DISTRIBUTION}/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/${DISTRIBUTION} $(lsb_release -cs) stable"

### install new version
sudo apt-get -y update
sudo apt-get -y install docker-ce

