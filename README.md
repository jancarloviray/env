# vm

Super environment provisioned by Vagrantfile. Contains docker, spf13-vim, ohmyzsh.

## Requirements

- Install [Vagrant](https://www.vagrantup.com/)

## Instructions

- just run `vagrant up` and it will install.
- now you can `vagrant ssh` to the box.

## Notes

Note that `./data` is shared and is required.

To change between solarized light and dark theme, you must first change the terminal theme, then do a `:set background=light` or `:set background=dark` within Vim.

## Roadmap

- separate between minimal vs complete for slow or low-bandwidth environments
- cache some setups such as vim, with option to update to latest

## Ideal Configuration

Vim:
	- set background=dark

iTerm2:
	- (font: Andale Mono, anti-aliased, 13, vertical lineheight 1.3)
	- font: Meslo M DZ Regular for Powerline, 14, lineheight 1.0 (more standard)
	- colorscheme: solarized (dark or light) that is synced with vim color
