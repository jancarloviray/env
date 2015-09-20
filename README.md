# vm

Automate and synchronize your dev environment. OS agnostic and powered with spf13-vim and ohmyzsh. Quick and simple to set up. OSX, Windows, Linux compatible.

![](https://raw.githubusercontent.com/jancarloviray/vm/master/img-cli.png)

![](https://raw.githubusercontent.com/jancarloviray/vm/master/img-vim.png)

## Installation

- Install [Vagrant](https://www.vagrantup.com/)

- Run the following commands:

```shell
mkdir -p /your/path
cd /your/path
git clone git@github.com:jancarloviray/vm.git .
vagrant up
vagrant ssh
```

- The themes require powerline-compatible fonts. Install **fonts** located at `/your/path/config/fonts` to your machine, or go to [https://github.com/powerline/fonts](https://github.com/powerline/fonts) for additional compatible fonts. Set those fonts as your terminal default font.

- Change your Terminal colorscheme to **solarized**. iTerm2 colors are located in `/your/path/config/iterm2-colors`.

- Machine's default private network: **192.168.33.10**. Just modify this line `config.vm.network "private_network", ip: "192.168.33.10"` located at `Vagrantfile` to change.

## Notes

Note that `./data` is shared and is required to exist. 

*I highly suggest to not work on `/vagrant_data/` since Virtual Box vboxsf is very slow. I would just use that folder as one-off sharing folder, or to copy source code from*

## Roadmap

- separate between minimal vs complete for slow or low-bandwidth environments
- cache some setups such as vim, with option to update to latest

## Credits

This consumed time, sweat and tears. Please *star* and *fork* this to show support. Thank you.

[Jan Carlo Viray](http://www.jancarloviray.com)