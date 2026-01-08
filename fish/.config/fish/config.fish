set -g fish_color_autosuggestion 555 yellow
set -g fish_color_command 5f87d7
set -g fish_color_comment 808080
set -g fish_color_cwd 87af5f
set -g fish_color_cwd_root 5f0000
set -g fish_color_error 870000 --bold
set -g fish_color_escape af5f5f
set -g fish_color_history_current 87afd7
set -g fish_color_host 5f87af
set -g fish_color_match d7d7d7 --background=303030
set -g fish_color_normal normal
set -g fish_color_operator d7d7d7
set -g fish_color_param 5f87af
set -g fish_color_quote d7af5f
set -g fish_color_redirection normal
set -g fish_color_search_match --background=purple
set -g fish_color_status 5f0000
set -g fish_color_user 5f875f
set -g fish_color_valid_path --underline

set -g fish_color_dimmed 555
set -g fish_color_separator 999

# # Git prompt status
# set -g __fish_git_prompt_showdirtystate 'yes'
# set -g __fish_git_prompt_showupstream auto
# set -g pure_git_untracked_dirty false

set pure_threshold_command_duration 1
set pure_separate_prompt_on_error true
# set pure_begin_prompt_with_current_directory false
set -U pure_color_success (set_color green)
set -U pure_color_git_dirty (set_color cyan)

set -U pure_color_git_unpushed_commits (set_color yellow)
set -U pure_color_git_unpulled_commits (set_color brgreen)

set -U fish_greeting ""
set -g fish_prompt_pwd_dir_length 0

fish_vi_key_bindings
bind ctrl-r 'history | fzf'
bind \ct fzf_file_insert
bind -M insert \ct fzf_file_insert
bind \cr fzf_history_classic
bind -M insert \cr fzf_history_classic

function fzf_file_insert
    set -l file (find . -type f 2>/dev/null | fzf)
    if test -n "$file"
        commandline -a -- $file
        commandline -C 20000
    end
end

function fzf_history_classic
    set -l line (commandline)
    set -l query (string trim -- $line)

    set -l selected (history | fzf --height=40% --border --no-sort --query="$query")
    commandline --replace $selected
    commandline (commandline --cut-at-cursor)
    commandline --cursor (string length -- $selected)
end

function fish_tab_title
    echo $argv;
end
function fish_title
    echo $argv;
end

alias l='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h'
alias la='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a'
alias lla='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'
alias lg='lazygit'
alias vim='nvim'


zoxide init fish | source
source (/usr/bin/starship init fish --print-full-init | psub)

if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end
