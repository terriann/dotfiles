#Terri's Dotfiles

This is a repository of my MacOS dotfiles.

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

(Or, [fork and keep your fork
updated](http://robots.thoughtbot.com/keeping-a-github-fork-updated)).

Install the dotfiles:

    bash setup.sh

This command will create symlinks for config files in your home directory.

* Give higher precedence to local overrides named with a .local filename
  `~/.dotfiles/<<CONFIG>>.local`
* Excludes repository files that not need to be symlinked

Features
-------
*Private local settings*
Create a .local copy of setting you don't want to publish 

To Do
-------
* Document functionality better
_thoutbot did nicely in thier[readme.md](https://github.com/thoughtbot/dotfiles)_
* Rescan for private info
* Make thigs more modular
* Push to github


## Resources
Some of the resources I used and found while setting up configurations
* http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/
* https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases 
* https://github.com/thoughtbot/dotfiles
* https://github.com/yanyaoer/dotfile/blob/master/runme.sh
* https://gist.github.com/octocat/9257657
