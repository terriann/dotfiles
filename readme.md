# Terri's Dotfiles

Personal macOS dotfiles for streamlining shell configuration across machines. Feel free to fork and adapt.

<!-- markdownlint-disable MD010 MD007 -->
- [Quick Start](#quick-start)
- [Features](#features)
  - [Private local settings](#private-local-settings)
    - [Secrets](#secrets)
  - [Git Shortcuts](#git-shortcuts)
  - [Shell Shortcuts](#shell-shortcuts)
  - [Application Shortcuts](#application-shortcuts)
  - [Hot Corners Preset](#hot-corners-preset)
- [Resources](#resources)

<!-- markdownlint-enable MD010 -->
## Quick Start

**Prerequisites:**

- macOS with zsh as your login shell
- [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm) installed

**Installation:**

```bash
# Clone the repo
git clone git@github.com:terriann/dotfiles.git ~/.dotfiles

# Run setup to create symlinks
bash ~/.dotfiles/setup.sh

# Optional: Install Homebrew packages
bash ~/.dotfiles/setup/brew.sh

# Optional: Apply hot corner presets
bash ~/.dotfiles/setup/hotcorners.sh

# Restart your terminal
```

## Features

### Private local settings

Keep sensitive data out of the public repo by creating `.local` files. The main configs automatically include these if they exist.

Example: `~/.dotfiles/gitconfig.local` is included by `.gitconfig` but won't be committed.

Some sample local files are provided - just rename them to remove `.sample`.

#### Secrets

Most `.local` files (like `profile.local`) are sourced from `.zshrc`, so they
only load in interactive shells. `secrets.local` is different: it's sourced by
`zshenv` on **every** zsh invocation, including scripts and tools like Claude
Code. Use it for API keys and tokens that must be available outside an
interactive login shell.

Copy the sample to get started:

```bash
cp ~/.dotfiles/secrets.local.sample ~/.dotfiles/secrets.local
```

The sample documents three ways to load a secret, from simplest to most secure:

| Approach | How it works |
| --- | --- |
| **Plain export** | Values live as plaintext on disk. Simplest, least secure. |
| **macOS Keychain** | Store once with `security add-generic-password`, then load with `security find-generic-password` at startup. |
| **1Password CLI** | Read a field with `op read`, or inject vars per command with `op run` so nothing is written to disk. |

`setup.sh` touches `secrets.local` and symlinks `zshenv` automatically, so the
file exists and is sourced from a fresh clone.

### Git Shortcuts

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

Full list: run `git aliases`.

### Shell Shortcuts

| Command                | Description                                              |
| ---------------------- | -------------------------------------------------------- |
| **Navigation**         |                                                          |
| `..`                   | Go up one directory                                      |
| `...`                  | Go up two directories                                    |
| `~`                    | Go to home directory                                     |
| **File Operations**    |                                                          |
| `catn`                 | Display file with line numbers                           |
| `grep`                 | Highlight matches in color                               |
| `ll`                   | List files with details and colors                       |
| `ls`                   | List files in color, hide `.` and `..`                   |
| `mkdir`                | Create directories as needed                             |
| `mkcd`                 | Create directory and move into it                        |
| `rmdropboxattr`        | Remove xattr dropbox attributes                          |
| `stdchmod`             | Apply standard chmod (directories: 755, files: 644)      |
| `unquarantine`         | Remove xattr quarantine                                  |
| **Git Utilities**      |                                                          |
| `git-prune-branches`   | Delete merged local branches                             |
| **Hardware**           |                                                          |
| `eject-all`            | Eject all devices                                        |
| **macOS Display**      |                                                          |
| `hidedeskicons`        | Hide desktop icons                                       |
| `hidedotfiles`         | Hide dotfiles throughout OS                              |
| `showdeskicons`        | Show desktop icons                                       |
| `showdotfiles`         | Show dotfiles throughout OS                              |
| **Networking**         |                                                          |
| `flushdns`             | Flush DNS cache                                          |
| `ip`                   | Show local IP addresses                                  |
| `ip1`                  | Show all IP addresses (detailed)                         |
| `ip2`                  | Show external IP address                                 |
| **Package Management** |                                                          |
| `brewup`               | Update Homebrew and packages                             |
| `nodeup`               | Update Node.js to LTS via NVM                            |
| `npmup`                | Update NPM and global packages                           |
| **System Utilities**   |                                                          |
| `clear-history`        | Clear zsh history                                        |
| `dotfiles`             | Open the dotfiles repo workspace in VS Code              |
| `ps`                   | Show all processes                                       |
| `reload-profile`       | Reload shell configuration                               |
| `utctime`              | Show the current time in UTC                             |

### Application Shortcuts

Open the current directory (or specified file) in common applications:

| Command      | Application           |
| ------------ | --------------------- |
| `affinity`   | Affinity              |
| `brave`      | Brave Browser         |
| `chrome`     | Google Chrome         |
| `finder`     | Finder                |
| `photoshop`  | Adobe Photoshop       |
| `preview`    | Preview               |
| `safari`     | Safari                |
| `sublime`    | Sublime Text          |
| `terminal`   | New Terminal window   |

### Hot Corners Preset

My preferred default MacOS Hot Corner settings (customizable in `setup/hotcorners.sh`):

- **Top-left**: No action
- **Top-right**: Launchpad
- **Bottom-left** + <kbd>⌘</kbd>: Lock Screen (the modifier prevents accidental locks)
- **Bottom-right**: Disable Screen Saver

Script includes commented examples for other actions and modifier keys.

## Resources

Resources that have been useful for setting up these configurations.

- [Customize Your Shell & Command Prompt](http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/)
- [How to Make a Fancy and Useful Bash Prompt in Linux](https://www.linux.com/learn/how-make-fancy-and-useful-bash-prompt-linux)
- [Github thoughtbot/dotfiles Repo](https://github.com/thoughtbot/dotfiles)
- [Github yanyaoer/dotfile Repo](https://github.com/yanyaoer/dotfile/blob/master/runme.sh)
- [Github holman/dotfile Repo](https://github.com/holman/dotfiles)
- [Github ymendel/dotfile Repo](https://github.com/ymendel/dotfiles)
- [Gist octocat/.gitignore](https://gist.github.com/octocat/9257657)
- [7 Git Hacks](https://medium.freecodecamp.org/7-git-hacks-you-just-can-t-ignore-41aea137727a)
- [Github bear/bear](https://github.com/bear/bear) - dotfiles, tools, notes and and config scripts
- [/paulmillr/dotfiles](https://github.com/paulmillr/dotfiles)
- [Dotfile inspiration](https://dotfiles.github.io/inspiration/)

**Homebrew:**

- [How to and Best of Homebrew - gist indiesquidge/homebrew.md](https://gist.github.com/indiesquidge/ec010eca3ffa254788c2)
- [Install most of my Apps with homebrew & cask](https://gist.github.com/t-io/8255711)

**Bash, Shell & Terminal Resources:**

- [How can I list and edit all defined aliases in Terminal? - stackoverflow](https://apple.stackexchange.com/questions/25352/how-can-i-list-and-edit-all-defined-aliases-in-terminal)
- [The macOS School of Terminal Witchcraft and Wizardry - Armin Briegel](https://www.youtube.com/watch?v=GMqj90jDCbE)
