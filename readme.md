# Terri's Dotfiles

This is a repository of my MacOS dotfiles. Project is still a work in progress.

## Files include

* `.profile` bash profile
* `.gitconfig` git configuration
* `.gitignore_global` a global git ignore

## Requirements

Set bash as your login shell.

## Install

Clone onto your laptop:

    git clone git://github.com/terriann/dotfiles.git ~/.dotfiles

(Or, [fork and keep your forked copy
updated](https://help.github.com/articles/syncing-a-fork/)).

Install the dotfiles:

    bash ~/.dotfiles/setup.sh

This command will create symlinks for config files in your home directory.

## Features

### Private local settings

Create a .local copy of setting you don't want to publish. The configs will give higher precedence to private local settings named with a .local filename extension.

ex. `~/.dotfiles/<<CONFIG>>.local`

Some sample local files are included, just rename the file to remove `.sample`

## What's inside

### [git](http://git-scm.com/) Configuration

* Enables git shell colors

#### Git Shortcuts

| Alias   |  Command     |  Description                                             |
|---------|--------------|----------------------------------------------------------|
| `a`     |  `git a`     |  add files to repository                        |
| `aa`    |  `git aa`    |  add all unstaged files to repository           |
| `aliases`     |  `git aliases`     |  Displays all availiable aliases         |
| `amend`    |  `git amend`    |  Amend your last commit with new message or additional satged changes           |
| `br`    |  `git br`    |  branch                                        |
| `ci`    |  `git ci`    |  commit all changes files `git commit -a`       |
| `co`    |  `git co`    |  chechout                                   |
| `graph` |  `git graph` |  display a graph view of the recent git history |
| `last`    |  `git last`    |  View last commit to branch                 |
| `lg`    |  `git lg`    |  log that shows relative dates and files changed                                   |
| `st`    |  `git st`    |  status                                   |
| `unstage`    |  `git unstage`    |  Unstage changes `reset HEAD --`         |

### Shell Aliases & Configurations

#### Shell Shortcuts

|   Alias    | Command      | Description   |
|---    |---    |---    |
|   `..`    |    `cd ../`   |       |
|   `...`    |   `cd ../../`    |       |
|   `mkdir`    |   `mkdir -p`    |   Create intermediate directories as required but will not error on existing directories    |
|   `ll`    |   `ls -lhaG`    |    Verbose, human readable color directory listing  |
|   `ls`    |   `ls -GA`    |   Always ls in color and hide `.` and `..`    |
|   `grep`    |   `grep --color=auto`    |    Always grep in color   |
|   `ps`    |   `ps -ax`    |   Processes    |
|   `reload`    |   `source ~/.profile`    |   Refresh Shell and reload from ~/.profile    |
|   `refresh`    |   `reload`    |    Because that part of my memory appears to be broken   |
|   `catn`    |   `cat -n`    |   Concatenate and print content of files with line numbers    |
|   `pubkey`    |   `"more ~/.ssh/id_rsa.pub \| pbcopy \| printf '=> Public key copied to pasteboard.\n'"`   |   Copy public key to keyboard    |

#### Shortcuts for Common Applications

|   Alias   |   Description     |
|---    |---    |
|   `sublime`    |    Open file (or current working directory) in Sublime Text    |
|   `phpstorm`    |    Open file (or current working directory) in PhpStorm    |
|   `photoshop`    |    Open file (or current working directory) in Adobe Photoshop CS    |
|   `preview`    |    Open file (or current working directory) in Preview    |
|   `chrome`    |    Open file (or current working directory) in Google Chrome    |
|   `safari`    |    Open file (or current working directory) in Safari    |
|   `finder`    |    Open file (or current working directory) in Finder    |

#### Shortcuts for MacOS Configs and Settings

|   Alias   | Description   |
|---     |---    |
|   `showdotfiles`    |   Make `*.` files visable throughout OS   |
|   `hidedotfiles`    |   Make `*.` files hidden throughout OS   |
|   `hidedeskicons`    |   Hide icons on desktop (good for presenting)   |
|   `showdeskicons`    |   Show icons on desktop   |
|   `unquarantine`    |   Removed xattr quarantine   |
|   `rmdropboxattr`    |   Removed xattr dropbox attributes   |
|   `stdchmod`    |   Applies standard chmod settings for directories (755) and files (644)   |

#### Networking Shortcuts

|   Alias    | Command      | Description   |
|---    |---    |---    |
|   `flushdns`    |   `dscacheutil -flushcache`    |   Flush DNS    |
|   `ip`    |   `ifconfig \| grep "inet " \| grep -v 127.0.0.1 \| cut -d\ -f2`    |   Simple IP information output    |
|   `ip1`    |   `ifconfig -a \| perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'`    |   More detailed IP information output    |
|   `ip2`    |   `curl -s http://www.showmyip.com/simple/ \| awk '{print $1}'`    |   External IP information output    |

## Resources

Some of the resources I used and found while setting up configurations

* [Customize Your Shell & Command Prompt](http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/) - June 2012
* [How to Make a Fancy and Useful Bash Prompt in Linux](https://www.linux.com/learn/how-make-fancy-and-useful-bash-prompt-linux) - May 2014
* [Git Basics - Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) - Documentation
* [Github thoughtbot/dotfiles Repo](https://github.com/thoughtbot/dotfiles)
* [Github yanyaoer/dotfile Repo](https://github.com/yanyaoer/dotfile/blob/master/runme.sh)
* [Github holman/dotfile Repo](https://github.com/holman/dotfiles)
* [Github ymendel/dotfile Repo](https://github.com/ymendel/dotfiles)
* [Gist octocat/.gitignore](https://gist.github.com/octocat/9257657)
* [7 Git Hacks](https://medium.freecodecamp.org/7-git-hacks-you-just-can-t-ignore-41aea137727a)
