# AGENTS.md

Guidance for Claude and other coding agents working in this repo. Humans should
read `readme.md` for the feature tour; this file is about *how to change things
safely*.

## What this repo is

Personal macOS + zsh dotfiles. It streamlines shell, git, and system
configuration across the maintainer's own machines. The `readme.md` invites
others to fork, but **optimise for the maintainer's workflow first** — "someone
else could fork this" is a nice-to-have, not a design constraint.

The repo is **public**. Anything committed here is visible to the world and gets
symlinked into `$HOME` on real machines. Treat every change as both a public
disclosure and a change to a live system.

### Install model (mental picture)

`setup.sh` creates the untracked `*.local` files if missing, then symlinks
tracked files into `$HOME` (`~/.profile` → `~/.dotfiles/profile`, etc.). The
`link()` helper **never clobbers an existing real file** — it warns and skips.
`setup/` and `scripts/` are opt-in extras run by hand.

## Hard rules — never do these without explicit say-so

- **Never edit, commit, stage, or print the contents of `*.local` files.** That
  includes `profile.local`, `gitconfig.local`, `gitconfig.*.local`,
  `curlrc.local`, and especially `secrets.local` (API keys / tokens; sourced by
  `zshenv` on *every* zsh invocation). They are gitignored for a reason. The
  `*.sample` files are the tracked, shareable templates — edit those instead.
- **Leave `backup/` and `logs/` alone.** They are machine-generated state.
- **No history rewriting or force-pushing shared branches** (`main`, `develop`).
  No amending or rebasing already-pushed commits.
- **Read-only system inspection is fine unprompted** (`defaults read`,
  `brew list`, `ls -l ~/.profile` to check a symlink). **Anything that mutates
  the machine needs confirmation first** — `defaults write`, running `setup.sh`
  or `setup/*.sh`, `brew install`, creating symlinks in `$HOME`. Propose and
  explain; let the maintainer run it.
- **Don't commit unless asked.** When asked: work on a feature branch and open a
  PR against `main` — never commit directly to `main`.

## Security

This is a public repo whose files land on real machines, so a careless change
can hand an attacker a foothold on every machine that syncs it. Be deliberate:

- **Never lower a security posture as a side effect.** Don't loosen file modes
  (`stdchmod` assumes dirs 755 / files 644 — don't widen), don't add
  world-writable paths, don't disable Gatekeeper / SIP / firewall / Little Snitch
  prompts, don't add blanket `com.apple.quarantine` stripping beyond the
  existing explicit `unquarantine` alias.
- **No `curl … | bash` / `eval` of remote content**, and no new download-and-run
  steps from sources that aren't official project URLs. Pin or checksum where
  practical.
- **Keep secrets off disk.** `secrets.local.sample` documents the preferred
  order: 1Password CLI / macOS Keychain over plaintext `export`. Don't add
  patterns that write credentials to tracked files or to plaintext dotfiles.
- **Be cautious with anything that runs non-interactively.** `zshenv` /
  `secrets.local` execute in scripts, cron, and tools like Claude Code, not just
  login shells — a bug there is high blast radius.
- **Watch `PATH` and shell-init order** — prepending an attacker-writable
  directory to `PATH`, or sourcing an untrusted file, is a privilege problem.
- **Call out concerns explicitly.** If a requested change could expose a
  vulnerability, or you notice an existing weakness while working, stop and flag
  it in your summary with the specific risk and a suggested fix — don't quietly
  work around it, and don't silently "fix" it inside an unrelated change.

## Shell & portability

All target machines run **zsh** as the login shell, so interactive config
(`zshrc`, `zshenv`, and zsh-only niceties) can assume zsh freely.

**One important exception:** `profile` is sourced *both* by `zshrc` (zsh) *and*
by `setup.sh`, which is `#!/bin/bash`. So `profile` must stay runnable under bash
**and** zsh:

- Guard zsh-only calls with a `$ZSH_VERSION` check, matching the existing
  pattern in `profile` (e.g. `if [ -n "$ZSH_VERSION" ]; then setopt … fi`).
- Prefer POSIX-ish constructs in the shared parts; keep bare `setopt`,
  `zstyle`, zsh-only globbing, and `%`-prompt-only assumptions inside guards.
- `zshrc` / `zshenv` have no such constraint — they are only ever sourced by zsh.

Standalone scripts (`setup/*.sh`, `scripts/*.sh`) keep their `#!/bin/bash`
shebang and bash style; that's a deliberate habit, not an accident to "fix".

## Conventions

- **Commits:** Conventional Commits, matching history —
  `type(scope): summary` (`feat`, `fix`, `docs`, `chore`; scopes like `profile`,
  `setup`, `readme`, `git`). Imperative, lower-case summary. Wrap the body at
  ~72 columns (git tooling does not reflow it).
- **Branch → PR:** feature branch, PR to `main`.
- **PR / issue text:** GitHub renders every newline in a comment body as a
  line break, so do **not** hard-wrap prose there — one physical line per
  paragraph, a blank line between paragraphs, and let it soft-wrap. (Repo
  files like `readme.md` are the opposite: standard CommonMark, so wrapping
  is fine. Commit messages are also the opposite — see above.)
- **Style:** `.editorconfig` governs — 4-space indent, LF, trim trailing
  whitespace, final newline; Markdown uses 2-space indent. Match the
  surrounding file.
- **Voice in code:** keep the existing commenting style — short "why" comments,
  `@link` / `@todo` / `@example` annotations, and emoji in user-facing `echo`
  output. Don't strip these.
- **Scripts must be idempotent and safe to re-run** — never clobber an existing
  real file (follow the `link()` approach); `setup/macos.sh` uses `set -u` and a
  per-section `ask` prompt.
- **Minimal dependencies.** Stay close to stock macOS + zsh + git. Don't
  introduce a framework (oh-my-zsh, chezmoi, a plugin manager, etc.) or a new
  runtime dependency without discussing it first.
- **Keep `readme.md` in sync.** Any user-facing change — a new alias, a new
  script, a changed default — updates `readme.md` in the *same* change.

## Verifying a change before calling it done

- Shell files: `zsh -n <file>` and, for anything sourced by bash, `bash -n
  <file>`. Run `shellcheck` if available.
- `profile` / `zshrc`: confirm it still sources cleanly in a fresh
  non-interactive subshell (`zsh -ic 'exit'` with the change in place) with no
  new errors or warnings.
- Markdown: `npm run markdownlint` (markdownlint-cli2, config in
  `.markdownlint.json`) and fix violations.
- Do **not** verify by actually applying system tweaks or running the installer
  — describe what would happen and hand it back.

## Repo map

| Path | What it is |
| --- | --- |
| `profile` | Aliases, functions, prompt. Sourced by `zshrc` and by `setup.sh` (bash). Loads `profile.local` last. |
| `zshrc` | zsh entry point — sources `profile`, loads NVM, sets `PATH`. |
| `zshenv` | Sourced on *every* zsh invocation; loads `secrets.local`. |
| `gitconfig` | Git aliases + settings; `include`s `gitconfig.local`; forces commit signing with a deliberately invalid placeholder key (real key comes from `.local`). |
| `gitignore_global` | `core.excludesfile` target. |
| `setup.sh` | Creates `*.local` stubs, then symlinks tracked files into `$HOME`. |
| `setup/macos.sh` | Opinionated macOS defaults — hot corners, screenshots, trackpad gestures. Interactive or by section arg. Safe to re-run. |
| `setup/brew.sh` | Homebrew + cask install list (somewhat stale — review before trusting). |
| `scripts/` | Helpers behind the `npmup` / `nodeup` aliases. |
| `*.sample` | Tracked templates for the untracked `*.local` files. |
| `backup/`, `logs/` | Generated at runtime — do not touch. |

## Typical asks in this repo

Shell aliases and functions in `profile`; macOS setup scripts under `setup/`;
docs and housekeeping (`readme.md`, lint config, structure). Start from the
relevant file above and keep the change small and reversible.
