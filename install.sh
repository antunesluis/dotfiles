#!/bin/bash

# TODO: Add installation

echo "Installation complete..."

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/antunesluis/dotfiles.git $HOME/dotfiles
fi

# Navigate to dotfiles directory
cd $HOME/dotfiles || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow stow */

echo "Dotfiles setup complete!"
