#Terri's Dotfiles

This is a repository of my MacOS dotfiles. Project is still a work in progress.

*Files include*
* `.profile` bash profile
* `.gitconfig` git configuration
    * `.gitignore_global` a global git ignore

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

What's in it?
-------------
[git](http://git-scm.com/) configuration:

* Enables git shell colors
* Adds a `a` alias to add files to repository
* Adds a `aa` alias to add all unstaged files to repository
* Adds a `br` alias to branch.
* Adds a `ci` alias to commit

*<Incomplete>*

Shell aliases & configurations:

*Shell Shortcuts*

|   Alias    | Command      | Description   |
|---    |---    |---    |
|   `..`    |    `cd ../`   |       |
|   `...`    |   `cd ../../`    |       |
|   `mkdir`    |   `mkdir -p`    |   Create intermediate directories as required but will not error on existing directories    |
|   `ll`    |   `ls -lhaG`    |    Verbose, human readable color directory listing  |
|   `ls`    |   `ls -GA`    |   Always ls in color and hide `.` and `..`    |
|   `grep`    |   `grep --color=auto`    |    Always grep in color   |
|   `ps`    |   `ps -ax`    |   Processes    |
|   `reload`    |   `source ~/.bash_profile`    |   Refresh Shell    |
|   `refresh`    |   `reload`    |    Because that part of my memory appears to be broken   |
|   `catn`    |   `cat -n`    |   Concatenate and print content of files with line numbers    |
|   `pubkey`    |       |   Copy public key to keyboard    |

*Shortcuts for Common Applications*

|   Alias   |   Description     |
|---    |---    |
|   `sublime`    |    Open file (or current working directory) in Sublime Text 2    |
|   `phpstorm`    |    Open file (or current working directory) in PhpStorm    |
|   `photoshop`    |    Open file (or current working directory) in Adobe Photoshop CS    |
|   `preview`    |    Open file (or current working directory) in Preview    |
|   `chrome`    |    Open file (or current working directory) in Google Chrome    |
|   `safari`    |    Open file (or current working directory) in Safari    |
|   `finder`    |    Open file (or current working directory) in Finder    |

*Shortcuts for MacOS Configs and Settings*

|   Alias    | Command      | Description   |
|---    |---    |---    |
|   `showdotfiles`    |   Make `*.` files visable throughout OS   |
|   `hidedotfiles`    |   Make `*.` files hidden throughout OS   |
|   `hidedeskicons`    |   Hide icons on desktop (good for presenting)   |
|   `showdeskicons`    |   Show icons on desktop   |

*Networking Shortcuts*

|   Alias    | Command      | Description   |
|---    |---    |---    |
|   `flushdns`    |   `dscacheutil -flushcache`    |   Flush DNS    |
|   `ip`    |   `ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2`    |   Simple IP information output    |
|   `ip1`    |   `ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'`    |   More detailed IP information output    |
|   `ip2`    |   `curl -s http://www.showmyip.com/simple/ | awk '{print $1}'`    |   External IP information output    |

## Resources
Some of the resources I used and found while setting up configurations
* http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/
* https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases 
* https://github.com/thoughtbot/dotfiles
* https://github.com/yanyaoer/dotfile/blob/master/runme.sh
* https://gist.github.com/octocat/9257657
