# Terri's Dotfiles

This is a repository of my MacOS dotfiles and other preferences and configs that are to be sync'd between machines to create a consistent experience. This project is always a work in progress.

* [Files include](#files-include)
* [Prerequisites](#prerequisites)
* [Install](#install)
* [Install the dotfiles](#install-the-dotfiles)
* [Installing Homebrew and formulae](#installing-homebrew-and-formulae)
  * [ZSH Conversion](#zsh-conversion)
* [Features](#features)
  * [Private local settings](#private-local-settings)
  * [Homebrew starter](#homebrew-starter)
  * [WordPress CLI Autocomplete Support](#wordpress-cli-autocomplete-support)
  * [git Configuration](#git-configuration)
    * [Git Shortcuts](#git-shortcuts)
  * [Shell Aliases \& Configurations](#shell-aliases--configurations)
    * [Shell Shortcuts](#shell-shortcuts)
    * [Utility Mini-scripts](#utility-mini-scripts)
    * [Shortcuts for Common Applications](#shortcuts-for-common-applications)
    * [Shortcuts for MacOS Configs and Settings](#shortcuts-for-macos-configs-and-settings)
    * [Networking Shortcuts](#networking-shortcuts)
* [Troubleshooting](#troubleshooting)
* [Changelog](#changelog)
* [Resources](#resources)
  * [Homebrew](#homebrew)
  * [Bash, Shell \& Terminal Resources](#bash-shell--terminal-resources)

## Files include

* `.profile` bash/zsh profile
* `.gitconfig` git configuration
* `.gitignore_global` a global git ignore

## Prerequisites

* Set zsh as your login shell.
* Install [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm) to manage Node.js and NPM versions.

## Install

Clone onto your machine:

```shell
git clone git://github.com/terriann/dotfiles.git ~/.dotfiles
```

(Or, [fork and keep your forked copy
updated](https://help.github.com/articles/syncing-a-fork/)).

## Install the dotfiles

Running the setup script will create symlinks for config files in your home directory.

The script loads the new dotfiles upon completion, you will need to restart any other open terminal session in order for the commands to be available there.

```shell
bash ~/.dotfiles/setup.sh
```

## Installing Homebrew and formulae

If you want to use Homebrew and my preferred formulae, run the following interactive script to install the bits and bobs.

**Prerequisites**:

* Brew needs to be installed first, using the latest installation instructions on [httpbrew.sh](https://brew.sh/)

```shell
bash ~/.dotfiles/setup/brew.sh
```

### ZSH Conversion

You may need to add the following line to your `~/.zshrc` in order for the aliases and settings to apply.

```shell
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
```

If you're using bash as your default shell, this may need to be added to `~/.bash_profile` instead.

## Features

### Private local settings

Create a .local copy of setting you don't want to publish. The configs will give higher precedence to private local settings named with a .local filename extension.

Sample local files are included, just copy the file to remove `.sample`:

```shell
cp .profile.local.start .profile.local
cp .gitconfig.local.start .gitconfig.local
```

### Homebrew starter

A setup file `/setup/brew.sh` is an interactive wizard that installs some basic formulae and casks. It includes a number of packages, commands, and helpful applications installed as casks.

### WordPress CLI Autocomplete Support

The WordPress autocomplete script is loaded in the profile if the WP-CLI has already been installed.

**Prerequisites**:

* WP-CLI needs to be installed first, using the latest installation instructions on [wp-cli.org](https://wp-cli.org/#installing)

### [git](http://git-scm.com/) Configuration

* Enables git shell colors

#### Git Shortcuts

| Alias   |  Command     |  Description                                             |
|---------|--------------|----------------------------------------------------------|
| `a`     |  `git a`     |  add files to repository                        |
| `aa`    |  `git aa`    |  add all unstaged files to repository           |
| `aliases`     |  `git aliases`     |  displays all available aliases         |
| `amend`    |  `git amend`    |  amend your last commit with new message or additional staged changes           |
| `br`    |  `git br`    |  branch                                        |
| `ci`    |  `git ci`    |  commit all changes files `git commit -a`       |
| `co`    |  `git co`    |  checkout                                   |
| `graph` |  `git graph` |  display a graph view of the recent git history |
| `last`    |  `git last`    |  view last commit to branch                 |
| `lg`    |  `git lg`    |  log that shows relative dates and files changed                                   |
| `st`    |  `git st`    |  status                                   |
| `reset`    |  `git reset`    |  reset a file back to it's HEAD state                                   |
| `unstage`    |  `git unstage`    |  unstages changes          |

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
|   `catn`    |   `cat -n`    |   Concatenate and print content of files with line numbers    |

#### Utility Mini-scripts

These are the commands that trigger simple scripts or series of commands to yield a specific outcome.

|   Alias   |   Description     |
|---    |---    |
|   `bash-reload`    |   Refresh Shell and reload from ~/.profile with visual confirmation    |
|   `bash-clear-history`    |   Clears bash history    |
|   `zsh-clear-history`    |   Clears zsh history    |
|   `pubkey`    |   Copy public key to keyboard    |
|   `brewup`    |   Runs Homebrew updates, does housekeeping and reports on any vulnerable packages    |
|   `npmup`    |   Uses NVM to update to the latest version of NPM and updates all global packages with scripts to log and compare global npm packages before and after the update  |
|   `nodeup`    |   Uses NVM to update to the LTS version of Node.js with scripts to log and compare global npm packages before and after the update  |
|   `eject-all`    |   Eject all devices    |
|   `git-prune-branches`   |   Prunes (deletes) all local branches that have been merged into `main` after checking out the main branch. |

#### Shortcuts for Common Applications

|   Alias   |   Description     |
|---    |---    |
|   `sublime`    |    Open file (or current working directory) in Sublime Text    |
|   `photoshop`    |    Open file (or current working directory) in Adobe Photoshop CS    |
|   `preview`    |    Open file (or current working directory) in Preview    |
|   `chrome`    |    Open file (or current working directory) in Google Chrome    |
|   `brave`    |    Open file (or current working directory) in Brave Browser    |
|   `safari`    |    Open file (or current working directory) in Safari    |
|   `finder`    |    Open file (or current working directory) in Finder    |
|   `code`      |    Use methodology built into app. See <https://code.visualstudio.com/docs/setup/mac>     |

#### Shortcuts for MacOS Configs and Settings

|   Alias   | Description   |
|---     |---    |
|   `showdotfiles`    |   Make `*.` files visible throughout OS   |
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
|   `ip`    |   `ifconfig \| grep "inet " \| grep -v 127.0.0.1`    |   Simple IP information output    |
|   `ip1`    |   `ifconfig -a \| perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'`    |   More detailed IP information output    |
|   `ip2`    |   `curl -s "https://en.wordpress.com/whatismyip?" \| awk "{print $1}"`    |   External IP information output    |

## Troubleshooting

**Getting a prompt for Github username and password but I setup key:**

Check this article to test your connection and authorize the key:
[Testing your SSH connection](https://help.github.com/articles/testing-your-ssh-connection/)

## Changelog

2024-02-04 - Version 2 created

* Refactored filenames and supporting functions
* Enhancements to setup script `./scripts/setup.sh`
* Enhancements to brew setup script `./scripts/brew.sh` to make it interactive.
* Adds WP-CLI autocompletion

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
* [Github bear/bear](https://github.com/bear/bear) - dotfiles, tools, notes and and config scripts
* [/paulmillr/dotfiles](https://github.com/paulmillr/dotfiles)
* [Dotfile inspiration](https://dotfiles.github.io/inspiration/)

### Homebrew

* [How to and Best of Homebrew - gist indiesquidge/homebrew.md](https://gist.github.com/indiesquidge/ec010eca3ffa254788c2)
* [Install most of my Apps with homebrew & cask](https://gist.github.com/t-io/8255711)

### Bash, Shell & Terminal Resources

* [How can I list and edit all defined aliases in Terminal? - Stackoverflow](https://apple.stackexchange.com/questions/25352/how-can-i-list-and-edit-all-defined-aliases-in-terminal) - good for when you've taken your configuration too far down the rabbit hole and months later need to crawl back out.
* [The macOS School of Terminal Witchcraft and Wizardry - Armin Briegel](https://www.youtube.com/watch?v=GMqj90jDCbE) - Excellent presentation with LOADS of Terminal efficiency tips. Definitely worth a watch
* [Better zsh history](https://www.soberkoder.com/better-zsh-history/)
