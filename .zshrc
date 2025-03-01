export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin:/usr/local/bin"
export FZF_DEFAULT_OPTS='--exact'
eval "$(pyenv init --path)"

plugins=(git pyenv fzf)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
