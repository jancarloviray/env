#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update

echo "Downloading and installing Docker"
curl -sSL https://get.docker.com/ | sh