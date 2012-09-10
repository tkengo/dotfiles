# ロケールの設定
export LANG=ja_JP.UTF-8
# プロンプトの設定
autoload colors
colors
PROMPT="%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
# ブランチ名を表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{yellow}%1v%f|${RPROMPT})"
# 補完機能
autoload -U compinit
compinit
# コマンド履歴(100000件保持)
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# コマンド履歴の検索(C-pとC-n)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# 重複したコマンド履歴を無視する
setopt hist_ignore_dups
# コマンド履歴をターミナル毎に共有
setopt share_history
# 移動したディレクトリを記録
setopt auto_pushd
# 補完候補を詰めて表示
setopt list_packed
# ビープ音を消す
setopt nolistbeep
# マシン固有の設定があれば読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
