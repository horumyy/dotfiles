#!/bin/sh

OS="$(uname -s)"

# Common operations for Linux and macOS
source "$HOME/.dotfiles/zsh/.zshenv"
rm -rf "$XDG_CONFIG_HOME/zsh"
ln -s "$DOTFILES/zsh" "$XDG_CONFIG_HOME"

rm -rf "$HOME/.zshenv"
ln -s "$DOTFILES/zsh/.zshenv" "$HOME"

case "$OS" in
    # Linux)
    #     mkdir -p "$XDG_DATA_HOME"
    #     cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME/fonts"
    #     ;;
    Darwin)
        rm -rf "$XDG_CONFIG_HOME/yabai"
        ln -s "$DOTFILES/yabai" "$XDG_CONFIG_HOME"

        rm -rf "$XDG_CONFIG_HOME/skhd"
        ln -s "$DOTFILES/skhd" "$XDG_CONFIG_HOME"

        rm -rf "$XDG_CONFIG_HOME/omz"
        ln -s "$DOTFILES/omz" "$XDG_CONFIG_HOME"
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac
