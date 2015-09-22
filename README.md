# vm

Tired of configuring and reconfiguring your machine everytime you get a new one!? **Well, I am.** With [Vagrant](https://www.vagrantup.com/) and [jancarloviray/vm](https://github.com/jancarloviray/vm), you will always have the same amazing development environment anywhere you go. Includes a **pimped up vim** and a shell so superior, you'll be saying **oh my zsh!** *Two-way syncing is enabled by default, so you can now sync between the host and the guest environment! Just add your files to `./data`.* What more can you ask? Thanks to Vagrant, this is OS-agnostic! **Now you will never have an excuse to buy that shiny new Mac Apple releases every year!**

![](https://raw.githubusercontent.com/jancarloviray/vm/master/img-cli.png)

![](https://raw.githubusercontent.com/jancarloviray/vm/master/img-vim.png)

## Installation

- Install [Vagrant](https://www.vagrantup.com/)

- Run the following commands:

```shell
mkdir -p $HOME/vm
cd $HOME/vm
# update and sync vbguest additions
vagrant plugin install vagrant-vbguest
git clone git@github.com:jancarloviray/vm.git .
vagrant up
vagrant ssh
```

- The themes require powerline-compatible fonts. Install **fonts** located at `$HOME/config/fonts` to your machine, or go to [https://github.com/powerline/fonts](https://github.com/powerline/fonts) for additional compatible fonts. Set those fonts as your terminal default font.

- Change your Terminal colorscheme to **solarized**. iTerm2 colors are located in `$HOME/config/iterm2-colors`.

- Machine's default private network: **192.168.33.10**. Just modify this line `config.vm.network "private_network", ip: "192.168.33.10"` located at `Vagrantfile` to change.

## Notes

Note that `./data` is shared and is required to exist. 

*I highly suggest to not work on `/vagrant_data/` since Virtual Box vboxsf is very slow. I would just use that folder as one-off sharing folder, or to copy source code from*

## Roadmap

- separate between minimal vs complete for slow or low-bandwidth environments
- cache some setups such as vim, with option to update to latest

## Credits

This consumed time, sweat and tears. Please *star* and *fork* this to show support. Thank you.

Thank you [spf13](https://github.com/spf13/spf13-vim) for the amazing VIM distribution.

Thank you [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh) for the ultimate ZSH framework.

[Jan Carlo Viray](http://www.jancarloviray.com)