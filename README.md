# linux-dotfiles
My dotfiles, for Linux

Uses [vcsh](https://github.com/RichiH/vcsh) for source control.

Requirements:
* emacs 27 or greater.
* git
* vcsh - managing home dir dotfiles with git
* asdf - managing Ruby, Node, and Postgres versions
* [karlicoss/grasp](https://github.com/karlicoss/grasp) set up as a system service for org-capturing from Firefox.
* ag / the-silver-searcher - fast searching

Steps to set up a new Linux laptop again, for my own edification:

1. `sudo apt update`
1. `sudo apt install vcsh silversearcher-ag vim luarocks spotify-client gnupg tmux tlp s-tui htop smartmontools`
1. (if gnome) `sudo apt install gnome-tweak-tool`
1. `ssh-keygen`
1. Set up [gh](https://github.com/jdxcode/gh)
1. Install vcsh (from apt, etc)
1. In home directory: `vcsh clone https://github.com/mathias/linux-dotfiles linux-dotfiles`
1. Make sure that emacs can load `init.el` cleanly