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
  - [macOS System Tweaks](#macos-system-tweaks)
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

# Optional: Apply macOS tweaks (hot corners, screenshots) - interactive
bash ~/.dotfiles/setup/macos.sh

# Restart your terminal
```

## Features

### Private local settings

Keep machine-specific or sensitive values out of the public repo by putting them in a `.local` file that git ignores. Each main config loads its `.local` sibling when it exists and carries on without it when it doesn't. (`setup.sh` pre-creates `profile.local` and `gitconfig.local`, and seeds `zshenv.local` from `zshenv.sample`, so on a set-up machine they always exist.)

Example: `~/.dotfiles/gitconfig.local` is included by `.gitconfig` but won't be committed.

Some sample local files are provided - just rename them to remove `.sample`.

#### Secrets

There are two places for credentials, depending on which shells need them.

**`~/.zshenv` — for every shell, including non-interactive tools.** zsh reads
`.zshenv` on *every* invocation, so keys defined here also reach `zsh -c`,
scripts, cron, and tools like Claude Code. `setup.sh` seeds `zshenv.local`
from `zshenv.sample`, `chmod 600`s it, and symlinks it to `~/.zshenv`; it's
gitignored (`*.local`), so edit `~/.dotfiles/zshenv.local` directly. Because it
runs on every shell — before `PATH` is set up — it must stay **silent** (stray
stdout breaks `scp`/`rsync`/`sftp` to a zsh host) and **fast / PATH-independent**.
Use it for plain `export`s or macOS Keychain lookups (`security` is always on
`PATH`); `op` is *not* available this early.

**`secrets.local` — for interactive shells only.** Sourced late from `profile`
(so, via `.zshrc`), after `PATH` is fully set up. This is where `op`-backed
secrets, prompts, and anything slow belong. It's opt-in — copy the sample when
you want it:

```bash
cp ~/.dotfiles/secrets.local.sample ~/.dotfiles/secrets.local
chmod 600 ~/.dotfiles/secrets.local
```

Keeping it separate from `profile.local` is just tidiness: `profile.local` is
machine config, `secrets.local` is credentials. Both `zshenv.sample` and
`secrets.local.sample` carry copy-paste snippets (plain `export`, Keychain, and
— in `secrets.local` — 1Password).

`.zshenv` loads first, then `secrets.local`, then `profile.local`; a value set
later wins. Set each secret in one place only.

### Git Shortcuts

| Command         | Description                                                   |
|-----------------|---------------------------------------------------------------|
| `git a`         | Add files                                                     |
| `git aa`        | Stage all changes                                            |
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
| `git reset`     | Discard unstaged changes to a file                            |
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

### macOS System Tweaks

`setup/macos.sh` applies opinionated system settings. Run it with no arguments to choose interactively (everything, or one class at a time), or pass a section name: `all`, `hotcorners`, `screenshots`, `gestures`.

**Hot corners** - my defaults (the script carries the full action/modifier code reference for customizing):

- **Top-left**: No action
- **Top-right**: Launchpad
- **Bottom-left** + <kbd>⌘</kbd>: Lock Screen (the modifier prevents accidental locks)
- **Bottom-right**: Disable Screen Saver

**Screenshots**: saved to `~/Desktop/30 Day Retention/` instead of loose on the Desktop.

**Trackpad gestures**: tap-to-click, two-finger secondary click, medium click pressure, three-finger swipes for Mission Control / App Exposé / full-screen apps, Notification Center edge swipe, and natural scrolling. Written to both the built-in and Magic Trackpad domains; a re-login may be needed for scroll-direction changes.

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
