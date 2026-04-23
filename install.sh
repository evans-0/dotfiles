#!/bin/bash

# dotfiles installer - evans-0
# creates symlinks from home directory to dotfiles repo
# note: .bashrc is appended, not symlinked

DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

symlink_files=(".vimrc" ".nanorc")

echo "Installing dotfiles from $DOTFILES_DIR..."
echo ""

# symlink vimrc and nanorc
for file in "${symlink_files[@]}"; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"

    if [ -f "$target" ] && [ ! -L "$target" ]; then
        echo "  Backing up existing $file -> $file.bak"
        mv "$target" "$target.bak"
    fi

    ln -sf "$source" "$target"
    echo "  Linked $file"
done

echo ""

# append bashrc instead of symlinking
BASHRC_MARKER="# >>> dotfiles >>>"
if grep -q "$BASHRC_MARKER" "$HOME/.bashrc"; then
    echo "  .bashrc already contains dotfiles config, skipping..."
else
    echo "" >> "$HOME/.bashrc"
    echo "$BASHRC_MARKER" >> "$HOME/.bashrc"
    cat "$DOTFILES_DIR/.bashrc" >> "$HOME/.bashrc"
    echo "# <<< dotfiles <<<" >> "$HOME/.bashrc"
    echo "  Appended .bashrc"
fi

echo ""
echo "Done! Restart your shell or run: source ~/.bashrc"
