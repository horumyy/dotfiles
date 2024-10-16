#!/bin/sh

OS="$(uname -s)"

# Common operations for Linux and macOS
source "$HOME/.dotfiles/zsh/.zshenv"
rm -rf "$XDG_CONFIG_HOME/zsh"
ln -s "$DOTFILES/zsh" "$XDG_CONFIG_HOME"

rm -rf "$XDG_CONFIG_HOME/nvim"
ln -s "$DOTFILES/nvim" "$XDG_CONFIG_HOME"

rm -rf "$HOME/.zshenv"
ln -s "$DOTFILES/zsh/.zshenv" "$HOME"

case "$OS" in
Darwin)
  # Install Homebrew
  
  /bin/bash -c "$(eval "$(/opt/homebrew/bin/brew shellenv)")"
  
  if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if command -v brew &> /dev/null; then
    echo "Brew found! Updating..."
    /bin/bash -c "brew update"
  fi

  # Install packages
  echo "Installing packages..."
  brew bundle --file="$DOTFILES/Brewfile"

  rm -rf "$XDG_CONFIG_HOME/yabai"
  ln -s "$DOTFILES/yabai" "$XDG_CONFIG_HOME"

  rm -rf "$XDG_CONFIG_HOME/skhd"
  ln -s "$DOTFILES/skhd" "$XDG_CONFIG_HOME"

  rm -rf "$XDG_CONFIG_HOME/omz"
  ln -s "$DOTFILES/omz" "$XDG_CONFIG_HOME"

  rm -rf "$HOME/.warp"
  ln -s "$DOTFILES/warp/.warp/" "$HOME"
  ;;
*)
  echo "Unsupported OS: $OS"
  exit 1
  ;;
esac
