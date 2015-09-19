#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update &> /dev/null 2>&1

echo "Upgrading Current Packages"
# sudo apt-get upgrade -y

echo "Installing Required Packages"
sudo apt-get install -y --fix-missing \
  man \
  cmake \
  tmux \
  wget \
  vim-nox \
  supervisor \
  linux-image-generic-lts-trusty \
  nginx \
  git \
  zsh \
  curl &> /dev/null 2>&1

# echo "Downloading and installing Node Version Manager"
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash > /dev/null 2>&1

# echo "Downloading and installing Docker"
# curl -sSL https://get.docker.com/ | sh > /dev/null 2>&1

echo "Downloading and installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null 2>&1
# sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="pygmalion"/g' ~/.zshrc

echo "Downloading spf13-vim"
git clone https://github.com/spf13/spf13-vim &> /dev/null 2>&1

echo "Installing spf13-vim"
cp /vagrant/config/vim/.vimrc.local $HOME/.vimrc.local
sh spf13-vim/bootstrap.sh &> /dev/null 2>&1

# fix vim colors inside tmux
echo 'export TERM="xterm-256color"' >> $HOME/.zshrc

sudo chsh -s $(which zsh) vagrant
# vim +BundleInstall! +BundleClean! +q!

echo "Done"
