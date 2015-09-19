#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get update &> /dev/null 2>&1

echo "Upgrading Current Packages"
# sudo apt-get upgrade -y

echo "Installing Required Packages"
sudo apt-get install -y --fix-missing \
  man \
  tmux \
  vim \
  vim-nox \
  git \
  zsh \
  curl &> /dev/null 2>&1

echo "Downloading and installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null 2>&1
# sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="pygmalion"/g' ~/.zshrc

echo "Downloading spf13-vim"
git clone https://github.com/spf13/spf13-vim &> /dev/null 2>&1

echo "Installing spf13-vim"
ln -s /vagrant/config/vim/.vimrc.local $HOME/.vimrc.local
ln -s /vagrant/config/vim/.vimrc.bundles.local $HOME/.vimrc.bundles.local
sh spf13-vim/bootstrap.sh &> /dev/null 2>&1
rm -rf $HOME/spf13-vim

# fix vim colors inside tmux
echo 'export TERM="xterm-256color"' >> $HOME/.zshrc

sudo chsh -s $(which zsh) vagrant
# vim +BundleInstall! +BundleClean! +q!

echo "Minimal Setup Done. Execute /vagrant/extra.sh to install the rest of the packages."
