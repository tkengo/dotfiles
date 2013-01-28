#--------------------------------
# zsh configuration
#--------------------------------
autoload colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit
autoload history-search-end

setopt hist_ignore_dups
setopt share_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt no_hist_beep
setopt auto_pushd
setopt list_packed
setopt nolistbeep
setopt prompt_subst

zstyle ':completion:*:*:kill:*' menu select=2
zstyle ':completion:*:*:git:*' script ~/.dotfiles/bin/git-completion.sh
zstyle ':completion:*' matcher-list '' 'r:|[-_.]=**'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%U%F{red}%d%f%u%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

precmd () { vcs_info }

PROMPT="%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"'${vcs_info_msg_0_}'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#--------------------------------
# environment variables export
#--------------------------------
BIN_PATH=~/.dotfiles/bin
[ -d $BIN_PATH ] && export PATH=$PATH:$BIN_PATH

export RBENV_ROOT=$HOME/.rbenv
if [ -d $RBENV_ROOT ]; then
    export PATH=$RBENV_ROOT/bin:$PATH
    eval "$(rbenv init -)"
fi

export LANG=ja_JP.UTF-8
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

#--------------------------------
# key binding
#--------------------------------
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#--------------------------------
# alias
#--------------------------------
alias t="twitter"
alias tt="twitter tweet"
alias g="git"
alias r="rails"
alias be="bundle exec"
[ `uname` = "Darwin" ] && alias tmux="tmux_wrapper_for_mac.sh"

#--------------------------------
# read local settings
#--------------------------------
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
