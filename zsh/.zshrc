# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
export PATH=$PATH:~/.yarn/bin
 
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Format autosuggestion style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#E3BFD4"

plugins=(git gh brew branch tmux)

source $ZSH/oh-my-zsh.sh

alias bupdate="brew update && arch -arm64 brew upgrade"
alias pls="sudo"
alias build="yarn run build && open raycast://confetti"
alias n="nvim"
alias ls='ls -G'
alias neofetch='fastfetch --wm-detect-plugin'
alias fastfetch='fastfetch --wm-detect-plugin'
alias yabaii='~/.config/yabai/yabairc && yabai --restart-service'

tmux-save() {
  ~/.config/zsh/tmux-session-manager.sh save
}

tmux-restore() {
  ~/.config/zsh/tmux-session-manager.sh restore
}

PROMPT="%F{cyan}horumy %f%F{175}=^._.^=%f%B%F{cyan} @ %f%b%F{175}%~%f%F{175} | %f"
RPROMPT=\$vcs_info_msg_0_

eval $(thefuck --alias)
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
 export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
