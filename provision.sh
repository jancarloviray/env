#!/bin/bash
echo "Updating"
sudo apt-get update

echo "Upgrading"
sudo apt-get upgrade

echo "Installing Required Binaries"
sudo apt-get install -y --fix-missing \
  build-essential \
  software-properties-common \
  htop \
  man \
  cmake \
  python-dev \
  tmux \
  curl \
  wget \
  vim-nox \
  supervisor \
  git \
  zsh \
  linux-image-generic-lts-trusty \
  nginx

echo "Installing Node Version Manager"
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash > /dev/null 2>&1

echo "Installing Docker"
#curl -sSL https://get.docker.com/ | sh > /dev/null 2>&1

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null 2>&1
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="wezm"/g' ~/.zshrc
sudo chsh -s $(which zsh)

echo "Installing spf13-vim"
git clone https://github.com/spf13/spf13-vim && sh spf13-vim/bootstrap.sh > /dev/null 2>&1

# fix vim colors inside tmux
echo 'export TERM="xterm-256color"' >> ~/.zshrc
echo 'export TERM="xterm-256color"' >> ~/.bashrc

echo "Done"
