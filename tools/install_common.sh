#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update

echo "Upgrading Current Packages"
sudo apt-get upgrade -y

echo "Installing Required Packages"
sudo apt-get install -y --fix-missing \
  cmake \
  wget \
  supervisor \
  linux-image-generic-lts-trusty \
  nginx