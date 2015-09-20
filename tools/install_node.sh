#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update

echo "Downloading and installing Node Version Manager"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash