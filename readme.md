#Terri's Dotfiles

This is a repository of my MacOS dotfiles. Project is still a work in progress.

*Files include*
* `.profile` bash profile
* `.gitconfig` git configuration
**  `.gitignore_global` a global git ignore

Requirements
------------
Set bash as your login shell.

Install
-------
Clone onto your laptop:

    git clone git://github.com/terriann/dotfiles.git ~/.dotfiles

(Or, [fork and keep your forked copy
updated](https://help.github.com/articles/syncing-a-fork/)).

Install the dotfiles:

    bash setup.sh

This command will create symlinks for config files in your home directory.

Features
-------
*Private local settings*
Create a .local copy of setting you don't want to publish. The configs will give higher precedence to private local settings named with a .local filename extension.
ex. `~/.dotfiles/<<CONFIG>>.local`

My To Do List
-------
* Document functionality better
_thoutbot did nicely in thier[readme.md](https://github.com/thoughtbot/dotfiles)_
* Make thigs more modular

## Resources
Some of the resources I used and found while setting up configurations
* http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/
* https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases 
* https://github.com/thoughtbot/dotfiles
* https://github.com/yanyaoer/dotfile/blob/master/runme.sh
* https://gist.github.com/octocat/9257657
