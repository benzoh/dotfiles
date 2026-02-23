# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository using symlinks managed by `install.sh`. No build system — changes take effect immediately since configs are symlinked into place.

## Installation

```bash
bash ~/dotfiles/install.sh
```

This creates symlinks from `~/.gitconfig`, `~/.gitignore_global`, `~/.stCommitMsg`, `~/.config/fish`, `~/.config/karabiner`, and `~/.config/wezterm` to the corresponding files in this repo. Existing files are backed up to `~/dotfiles_old/`.

## Repository Structure

| Path | Purpose |
|------|---------|
| `.config/fish/` | Fish shell — prompt, plugins, aliases, Volta integration |
| `.config/wezterm/` | WezTerm terminal — split into `wezterm.lua` (main), `keybinds.lua`, `background.lua` |
| `.config/karabiner/` | Karabiner-Elements keyboard remapping (macOS) |
| `.gitconfig` | Git user, aliases, git-secrets, Git LFS |
| `.stCommitMsg` | Conventional Commits template used by git |
| `.editorconfig` | Indentation defaults (4 spaces; 2 spaces for Lua) |

## Key Conventions

**Commit format** (enforced via `.stCommitMsg`):
```
[type][optional scope]: <description>
```
Types: `feat`, `fix`, `chore`, `refactor`, `docs`, `style`, `test`, `perf`, `ci`, `build`, `revert`

**EditorConfig**: 4-space indentation, LF line endings, UTF-8 for most files. Lua files use 2-space indentation.

**WezTerm config** is split across three Lua files — `wezterm.lua` requires `keybinds.lua` and `background.lua`. The leader key is `Ctrl+A`. WezTerm's audible bell is used as a Claude Code task-completion notification.

**Karabiner**: Caps Lock → Left Control; Left Command (alone) → Eisu; Right Command (alone) → Kana (Japanese input switching).

**Fish prompt** (`fish_right_prompt.fish`) shows git branch, ahead/behind counts, stash count, and working tree state using symbols.

## Adding New Dotfiles

1. Place the config file in the appropriate location within this repo.
2. Add a symlink entry to `install.sh` following the existing pattern.
