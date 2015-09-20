#!/usr/bin/env bash

lnif() {
  if [ -e "$1" ]; then
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

# man, tmux, vim-nox
install_required_packages(){
  sudo apt-get install -y --fix-missing \
  vim \
  vim-nox \
  git \
  zsh \
  curl &> /dev/null 2>&1
  success "Installed Required Packages"
}

install_ohmyzsh(){
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null 2>&1
  cp -R "/vagrant/config/oh-my-zsh/custom" "$HOME/.oh-my-zsh"

  # powerlevel9k theme
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"/g' ~/.zshrc
  echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv virtualenv vcs)' >> $HOME/.zshrc
  # echo 'POWERLEVEL9K_COLOR_SCHEME="light"' >> $HOME/.zshrc
  # echo 'POWERLEVEL9K_DISABLE_RPROMPT=true' >> $HOME/.zshrc
  success "Installed Oh-my-zsh"
}

install_spf13_web(){
  git clone https://github.com/spf13/spf13-vim &> /dev/null 2>&1

  # setup local config
  lnif "/vagrant/config/vim/.vimrc.bundles.local" "$HOME/.vimrc.bundles.local"
  lnif "/vagrant/config/vim/.vimrc.local" "$HOME/.vimrc.local"

  sh spf13-vim/bootstrap.sh &> /dev/null 2>&1
  rm -rf $HOME/spf13-vim
  success "Installed spf13-vim"
}

install_spf13_local(){
  # using copy because virtualbox mounted folders are very slow

  cp -R "/vagrant/config/vim/.spf13-vim-3" "$HOME/.spf13-vim-3"
  cp -R "/vagrant/config/vim/.vim" "$HOME/.vim"
  cp "/vagrant/config/vim/.vimrc" "$HOME/.vimrc"
  cp "/vagrant/config/vim/.vimrc.bundles" "$HOME/.vimrc.bundles"
  cp "/vagrant/config/vim/.vimrc.before" "$HOME/.vimrc.before"

  # setup local config
  cp "/vagrant/config/vim/.vimrc.bundles.local" "$HOME/.vimrc.bundles.local"
  cp "/vagrant/config/vim/.vimrc.local" "$HOME/.vimrc.local"

  success "Installed spf13-vim"
}

update_packages
install_required_packages
install_ohmyzsh
install_spf13_local
# install_spf13_web

echo 'export TERM="xterm-256color"' >> $HOME/.zshrc
sudo chsh -s $(which zsh) vagrant

success "Minimal Setup Done. Run /vagrant/extra.sh to install extra packages."