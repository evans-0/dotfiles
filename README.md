# dotfiles

My personal configuration files for a minimal, keyboard-driven Linux environment.

## Contents

| File | Description |
|------|-------------|
| `.vimrc` | Vim config — custom statusline, keybindings, mode-aware colors |
| `.bashrc` | Bash config — aliases, prompt, environment variables |
| `.nanorc` | Nano config — syntax highlighting, line numbers |

## Install

Clone the repo and run the install script:

```bash
git clone https://github.com/evans-0/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
```

This creates symlinks from your home directory to the files in this repo. Any existing dotfiles are automatically backed up as `.bak` files before being replaced.

## Highlights

**Vim**
- Custom statusline with mode indicator (color changes between NORMAL/INSERT)
- Relative line numbers for fast navigation
- Split navigation with `Ctrl+hjkl`
- Centered search jumps and visual line moving

**Bash**
- Clean prompt
- Common aliases for productivity
