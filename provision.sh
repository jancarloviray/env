#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update &> /dev/null 2>&1

echo "Upgrading Current Packages"
sudo apt-get upgrade

echo "Installing Required Packages"
sudo apt-get install -y --fix-missing \
  build-essential \
  software-properties-common \
  htop \
  man \
  cmake \
  python-dev \
  tmux \
  wget \
  vim-nox \
  supervisor \
  linux-image-generic-lts-trusty \
  nginx \
  git \
  zsh \
  curl &> /dev/null 2>&1

echo "Downloading and installing Node Version Manager"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash > /dev/null 2>&1

echo "Downloading and installing Docker"
curl -sSL https://get.docker.com/ | sh > /dev/null 2>&1

echo "Downloading and installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null 2>&1
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="wezm"/g' ~/.zshrc

echo "Downloading spf13-vim"
git clone https://github.com/spf13/spf13-vim &> /dev/null 2>&1

echo "Installing spf13-vim"
sh spf13-vim/bootstrap.sh &> /dev/null 2>&1

# fix vim colors inside tmux
echo 'export TERM="xterm-256color"' >> ~/.zshrc
echo 'export TERM="xterm-256color"' >> ~/.bashrc

sudo chsh -s $(which zsh) vagrant

source ~/.bashrc
source ~/.zshrc

echo "Done"
