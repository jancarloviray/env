#!/usr/bin/env bash

echo "Updating Apt-Get"
sudo apt-get update

echo "Downloading and installing Docker"
curl -sSL https://get.docker.com/ | sh

echo "Create Docker group and add current user. Remember to logout after this."
sudo usermod -aG docker vagrant