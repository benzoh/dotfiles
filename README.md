# dotfiles

Personal dotfiles for macOS, managed with symlinks.

## Install

```bash
git clone https://github.com/benzoh/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
```

`install.sh` creates symlinks for the following and backs up any existing files to `~/dotfiles_old/`:

- `~/.gitconfig`
- `~/.gitignore_global`
- `~/.stCommitMsg`
- `~/.config/fish`
- `~/.config/karabiner`
- `~/.config/wezterm`

## Contents

| Path | Description |
|------|-------------|
| `.config/fish/` | Fish shell — prompt, plugins, Volta integration |
| `.config/wezterm/` | WezTerm terminal emulator (font, theme, keybindings) |
| `.config/karabiner/` | Keyboard remapping via Karabiner-Elements |
| `.gitconfig` | Git aliases, git-secrets, Git LFS |
| `.stCommitMsg` | Conventional Commits template |
| `.editorconfig` | Indentation and encoding defaults |
