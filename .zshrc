export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin:/usr/local/bin"
export FZF_CTRL_R_OPTS="-e"
export FZF_DEFAULT_OPTS='-e'

eval "$(pyenv init --path)"

# Start the ssh-agent if not already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval $(ssh-agent -s)
fi

plugins=(git zsh-autosuggestions fzf colored-man-pages colorize command-not-found dnf docker docker-compose git-auto-fetch history keychain mvn ssh ssh-agent sudo systemd vi-mode zoxide)

source $ZSH/oh-my-zsh.sh

bindkey -M viins '^Y' autosuggest-accept
bindkey -M viins '^K' up-line-or-history
bindkey -M viins '^J' down-line-or-history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^R' fzf-history-widget

bindkey '^I' fzf-completion
