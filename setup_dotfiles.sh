#!/bin/zsh

OS="$(uname -s)"

# Source zshenv to ensure environment variables are set
source "$HOME/.dotfiles/zsh/.zshenv"

# Function to create symbolic link
create_symlink() {
  local src="$1"
  local dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Removing existing $dest"
    rm -rf "$dest"
  fi
  echo "Creating symlink: $src -> $dest"
  ln -s "$src" "$dest"
}

# Ensure XDG_CONFIG_HOME exists
mkdir -p "$XDG_CONFIG_HOME"

# Common operations for Linux and macOS
create_symlink "$DOTFILES/zsh" "$XDG_CONFIG_HOME/zsh"
create_symlink "$DOTFILES/nvim" "$XDG_CONFIG_HOME/nvim"
create_symlink "$DOTFILES/.nvm" "$HOME/.nvm"
create_symlink "$DOTFILES/fastfetch" "$XDG_CONFIG_HOME/fastfetch"
create_symlink "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES/spicetify" "$XDG_CONFIG_HOME/spicetify"

# Install Rust and Cargo
if ! command -v cargo &>/dev/null; then
  echo "Installing Rust and Cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

# Install Oh My Zsh
if [ ! -d "$XDG_CONFIG_HOME/oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  export ZSH="$XDG_CONFIG_HOME/oh-my-zsh" 
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

  # Source Oh My Zsh
  source "$XDG_CONFIG_HOME/oh-my-zsh/oh-my-zsh.sh"
fi

case "$OS" in
Darwin)
  # Set up Homebrew environment
  if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  # Install Homebrew if not already installed
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Re-evaluate Homebrew environment after installation
    if [ -f /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f /usr/local/bin/brew ]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    echo "Homebrew is already installed. Updating..."
    brew update
  fi

  # Install packages
  echo "Installing packages..."
  brew bundle --file="$DOTFILES/Brewfile"
  echo "Packages installed successfully!"

  # Create additional symlinks for macOS
  echo "Creating additional symlinks for macOS..."
  create_symlink "$DOTFILES/yabai" "$XDG_CONFIG_HOME/yabai"
  echo "Running yabai installation requirements..."
sudo nvram boot-args=-arm64e_preview_abi
echo "Remember to disable SIP and restart your Mac"
  create_symlink "$DOTFILES/skhd" "$XDG_CONFIG_HOME/skhd"
  create_symlink "$DOTFILES/warp/.warp" "$HOME/.warp"
  create_symlink "$DOTFILES/sketchybar" "$XDG_CONFIG_HOME/sketchybar"
  echo "Additional symlinks created successfully!"

  # Install sketchybar-app-font
  echo "Installing sketchybar-app-font..."
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
  echo "sketchybar-app-font installed successfully!"


  #installing SbarLua
echo "Installing SbarLua..."
  (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
echo "SbarLua installed successfully!"
  # Apply tmux config
  echo "Applying tmux configs..."
 tmux new-session -d -s start-session
  tmux source-file ~/.tmux.conf && echo "Applied tmux config correctly"
  tmux kill-session -t start-session
  ;;
*)
  echo "Unsupported OS: $OS"
  exit 1
  ;;
esac

echo "Dotfiles setup completed!"
