#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update &> /dev/null 2>&1

echo "Upgrading Current Packages"
sudo apt-get upgrade -y

echo "Installing Required Packages"
sudo apt-get install -y --fix-missing \
  cmake \
  wget \
  supervisor \
  linux-image-generic-lts-trusty \
  nginx \

echo "Downloading and installing Node Version Manager"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash > /dev/null 2>&1

echo "Downloading and installing Docker"
curl -sSL https://get.docker.com/ | sh > /dev/null 2>&1
