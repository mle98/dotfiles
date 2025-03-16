export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin:/usr/local/bin"
export FZF_DEFAULT_OPTS='--exact'
eval "$(pyenv init --path)"

# Start the ssh-agent if not already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval $(ssh-agent -s)
fi

plugins=(git pyenv fzf)

source $ZSH/oh-my-zsh.sh

export DISPLAY=:0.0
export EDITOR='nvim'

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
