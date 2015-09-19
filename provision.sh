#!/bin/bash

lnif(){
  if[ -e "$1" ]; then
    ln -sf "$1" "$2"
  fi
}

msg() {
  printf '%b\n' "$1" >&2
}

success() {
  msg "\33[32m[✔]\33[0m ${1}${2}"
}

update_packages(){
  sudo apt-get update &> /dev/null 2>&1
  success "Updated apt-get"
}

install_required_packages(){
  sudo apt-get install -y --fix-missing \
  man \
  tmux \
  vim \
  vim-nox \
  git \
  zsh \
  curl &> /dev/null 2>&1
  success "Installed Required Packages"
}

install_ohmyzsh(){
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null 2>&1
  success "Installed Oh-my-zsh"
# sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="pygmalion"/g' ~/.zshrc
}

install_spf13(){
  git clone https://github.com/spf13/spf13-vim &> /dev/null 2>&1
  lnif "/vagrant/config/vim/.vimrc.local" "$HOME/.vimrc.local"
  lnif "/vagrant/config/vim/.vimrc.bundles.local" "$HOME/.vimrc.bundles.local"
  sh spf13-vim/bootstrap.sh &> /dev/null 2>&1
  rm -rf $HOME/spf13-vim
  success "Install spf13-vim"
}

update_package 
install_required_packages
install_ohmyzsh
install_spf13

echo 'export TERM="xterm-256color"' >> $HOME/.zshrc
sudo chsh -s $(which zsh) vagrant

success "Minimal Setup Done."
msg "Execute /vagrant/extra.sh to install the rest of the packages."
