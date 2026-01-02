# Terri's Dotfiles

<!-- markdownlint-disable MD010 MD007 -->
- [Files include](#files-include)
- [Prerequisites](#prerequisites)
- [Install](#install)
  - [ZSH Conversion](#zsh-conversion)
- [Features](#features)
  - [Private local settings](#private-local-settings)
  - [Homebrew starter](#homebrew-starter)
- [What's Inside](#whats-inside)
  - [git Configuration](#git-configuration)
    - [Git Shortcuts](#git-shortcuts)
  - [Shell Aliases \& Configurations](#shell-aliases--configurations)
    - [Shell Shortcuts](#shell-shortcuts)
    - [Utility Mini-scripts](#utility-mini-scripts)
    - [Shortcuts for Common Applications](#shortcuts-for-common-applications)
    - [Shortcuts for MacOS Configs and Settings](#shortcuts-for-macos-configs-and-settings)
    - [Networking Shortcuts](#networking-shortcuts)
- [Troubleshooting](#troubleshooting)
- [Changelog](#changelog)
- [Resources](#resources)
  - [Homebrew](#homebrew)
  - [Bash, Shell \& Terminal Resources](#bash-shell--terminal-resources)

<!-- markdownlint-enable MD010 -->

This is a repository of my MacOS dotfiles. Project is still a work in progress.

## Files include

- `.profile` bash/zsh profile
- `.gitconfig` git configuration
- `.gitignore_global` a global git ignore
- `setup/hotcorners.sh` macOS hot corner preset script

## Prerequisites

- Set zsh as your login shell.
- Install [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm) to manage Node.js and NPM versions.

## Install

Clone repo:

```bash
git clone git@github.com:terriann/dotfiles.git ~/.dotfiles
```

(Or, [fork and clone](https://help.github.com/articles/syncing-a-fork/)).

Install the dotfiles:

```bash
bash ~/.dotfiles/setup.sh
```

If using the base Homebrew setup also run this script:

```bash
bash ~/.dotfiles/setup/brew.sh
```

This command will create symlinks for config files in your home directory.

You will need to restart your terminal in order to make use of the changes.

### ZSH Conversion

You may need to add the following line to your `~/.zshrc` in order for the aliases and settings to apply.

 [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

## Features

### Private local settings

Create a .local copy of setting you don't want to publish. The configs will give higher precedence to private local settings named with a .local filename extension.

ex. `~/.dotfiles/<<CONFIG>>.local`

Some sample local files are included, just rename the file to remove `.sample`

### Homebrew starter

A setup file `/setup/brew.sh` will do a preliminary Homebrew setup. It includes a number of packages, commands, and helpful applications installed as casks.

### Hot corners preset

Run `bash ~/.dotfiles/setup/hotcorners.sh` to apply a macOS hot corner layout:

- Top-left: No action
- Top-right: Launchpad
- Bottom-left: Lock Screen
- Bottom-right: Disable Screen Saver

The script restarts the Dock to take effect, so expect a brief flash.

## What's Inside

### [git](http://git-scm.com/) Configuration

- Enables git shell colors

#### Git Shortcuts

| Command         | Description                                                   |
|-----------------|---------------------------------------------------------------|
| `git a`         | Add files                                                     |
| `git aa`        | Add all unstaged files                                        |
| `git aliases`   | List available aliases                                        |
| `git amend`     | Amend the last commit                                         |
| `git br`        | Run `git branch`                                              |
| `git ci`        | Commit all changes (`git commit -a`)                          |
| `git co`        | Check out a branch                                            |
| `git curb`      | Show the current branch                                       |
| `git graph`     | Show recent history as a graph                                |
| `git last`      | Show the last commit on the branch                            |
| `git lg`        | Show log with relative dates and changed files                |
| `git pushup`    | Push branch and set upstream                                  |
| `git reset`     | Reset a file to HEAD                                          |
| `git st`        | Show status                                                   |
| `git unstage`   | Unstage changes                                               |

### Shell Aliases & Configurations

#### Shell Shortcuts

| Command       | Description                                                   |
|---------------|---------------------------------------------------------------|
| `..`          | Go up one directory                                           |
| `...`         | Go up two directories                                         |
| `~`           | Go to home directory                                          |
| `mkdir`       | Create directories as needed (no error if they exist)         |
| `ll`          | List files verbosely with human-readable sizes and colors     |
| `ls`          | List files in color, hide `.` and `..`                        |
| `grep`        | Highlight matches in color                                    |
| `ps`          | Show all processes                                            |
| `catn`        | Display file contents with line numbers                       |

#### Utility Mini-scripts

These are the commands that trigger simple scripts or series of commands to yield a specific outcome.

| Alias                   | Description                                                               |
|-------------------------|---------------------------------------------------------------------------|
| `reload-profile`        | Reload shell from `~/.profile`                                            |
| `clear-history`         | Clear Zsh history                                                         |
| `brewup`                | Update Homebrew, run housekeeping, report vulnerable packages             |
| `npmup`                 | Update NPM and global packages with before/after diff                     |
| `nodeup`                | Update Node.js to LTS (using NVM) and suggest global package reinstalls   |
| `eject-all`             | Eject all devices                                                         |
| `git-prune-branches`    | Delete local branches merged into `main` after checkout                   |

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
|   `terminal`  |    Open current directory in a terminal window (handy inside Cursor/VS Code integrated terminal)     |

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

## Resources

Some of the resources I used and found while setting up configurations

- [Customize Your Shell & Command Prompt](http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/) - June 2012
- [How to Make a Fancy and Useful Bash Prompt in Linux](https://www.linux.com/learn/how-make-fancy-and-useful-bash-prompt-linux) - May 2014
- [Git Basics - Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) - Documentation
- [Github thoughtbot/dotfiles Repo](https://github.com/thoughtbot/dotfiles)
- [Github yanyaoer/dotfile Repo](https://github.com/yanyaoer/dotfile/blob/master/runme.sh)
- [Github holman/dotfile Repo](https://github.com/holman/dotfiles)
- [Github ymendel/dotfile Repo](https://github.com/ymendel/dotfiles)
- [Gist octocat/.gitignore](https://gist.github.com/octocat/9257657)
- [7 Git Hacks](https://medium.freecodecamp.org/7-git-hacks-you-just-can-t-ignore-41aea137727a)
- [Github bear/bear](https://github.com/bear/bear) - dotfiles, tools, notes and and config scripts
- [/paulmillr/dotfiles](https://github.com/paulmillr/dotfiles)
- [Dotfile inspiration](https://dotfiles.github.io/inspiration/)

### Homebrew

- [How to and Best of Homebrew - gist indiesquidge/homebrew.md](https://gist.github.com/indiesquidge/ec010eca3ffa254788c2)
- [Install most of my Apps with homebrew & cask](https://gist.github.com/t-io/8255711)

### Bash, Shell & Terminal Resources

- [How can I list and edit all defined aliases in Terminal? - stackoverflow](https://apple.stackexchange.com/questions/25352/how-can-i-list-and-edit-all-defined-aliases-in-terminal) - good for when you've taken your configuration too far down the rabbit hole and months later need to crawl back out.
- [The macOS School of Terminal Witchcraft and Wizardry - Armin Briegel](https://www.youtube.com/watch?v=GMqj90jDCbE) - Excellent presentation with LOADS of Terminal efficiency tips. Definitely worth a watch
- [Better zsh history](https://www.soberkoder.com/better-zsh-history/)
