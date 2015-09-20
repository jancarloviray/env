#!/usr/bin/env bash

set -e

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
ncolors=$(tput colors)
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
  exit
fi
unset CHECK_ZSH_INSTALLED

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
sed "/^export ZSH=/ c\\
export ZSH=$ZSH
" ~/.zshrc > ~/.zshrc-omztemp
mv -f ~/.zshrc-omztemp ~/.zshrc

printf "${BLUE}Copying your current PATH and adding it to the end of ~/.zshrc for you.${NORMAL}\n"
sed "/export PATH=/ c\\
export PATH=\"$PATH\"
" ~/.zshrc > ~/.zshrc-omztemp
mv -f ~/.zshrc-omztemp ~/.zshrc

# # If this user's login shell is not already "zsh", attempt to switch.
# if [ "$(expr "$SHELL" : '.*/\(.*\)')" != "zsh" ]; then
#   # If this platform provides a "chsh" command (not Cygwin), do it, man!
#   if hash chsh >/dev/null 2>&1; then
#     printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
#     chsh -s $(grep /zsh$ /etc/shells | tail -1)
#   # Else, suggest the user do so manually.
#   else
#     printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
#   fi
# fi

env zsh

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH/custom"
fi

# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$ZSH/cache/"
fi

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ($ZSH/lib/*.zsh); do
  custom_config_file="${ZSH_CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || test -f $base_dir/plugins/$name/_$name
}
# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
  if is_plugin $ZSH_CUSTOM $plugin; then
    fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
  elif is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  fi
done

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # OS X's $HOST changes with dhcp, etc. Use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

sh /vagrant/backup/oh-my-zsh/oh-my-zsh.sh