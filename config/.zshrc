export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:$PATH:$HOME/bin:/Applications/Xcode.app/Contents//Developer/usr/bin

export EDITOR=vim

export HISTSIZE=100000
export SAVEHIST=1000000

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969896"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --reverse'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_OPTS="--preview 'bat --number --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export ENHANCD_FILTER="fzf --preview 'eza --long --all --git --color=always {}' --preview-window right,50%"
export ENHANCD_HYPHEN_NUM=20

# eza でも使える
export EXA_COLORS="xx=37"

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export ECSPRESSO_FILTER_COMMAND=fzf

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# 初回は asdf で go が入ってないので go があるか確認する
if type go > /dev/null 2>&1; then
    export GOPATH=$HOME/go
    export CGO_ENABLED=0
    export PATH=$(go env GOPATH)/bin:$PATH
    export ASDF_GOLANG_MOD_VERSION_ENABLED=true
fi
fpath=(${ASDF_DIR}/completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey "^f" fzf-file-widget

# ref: https://github.com/Songmu/ghq-handbook/blob/master/ja/05-command-list.md
function fzf-cd-ghq () {
    local repo=$(ghq list | fzf --query "$LBUFFER")
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
}
zle -N fzf-cd-ghq
bindkey '^]' fzf-cd-ghq

# ref: https://github.com/junegunn/fzf/wiki/examples#opening-files
function fzf-open() {
  IFS=$'\n' out=("$(fzf --preview 'bat --number --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)' --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
alias fo=fzf-open

# ref: https://github.com/junegunn/fzf/wiki/examples#git
function fzf-git-switch() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git switch $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  zle accept-line
}
zle -N fzf-git-switch
bindkey "^b" fzf-git-switch

function fzf-git-add() {
    local selected=$(unbuffer git status --short | fzf --preview="echo {} | awk '{print \$2}' | xargs git diff --color" \
        --preview-window right,50% --height 70% --multi --ansi | awk '{print $2}')

    if [ -n "$selected" ]; then
        local files=""
        while IFS= read -r line; do
            files="$files \"$line\""
        done <<< "$selected"
        eval git add $files
        echo "git add $files"
    fi
}
alias fga=fzf-git-add

function fzf-git-restore() {
    local selected=$(unbuffer git status --short | fzf --preview="echo {} | awk '{print \$2}' | xargs git diff --color" \
        --preview-window right,50% --height 70% --multi --ansi | awk '{print $2}')

    if [ -n "$selected" ]; then
        local files=""
        while IFS= read -r line; do
            files="$files \"$line\""
        done <<< "$selected"
        eval git restore $files
        echo "git restore $files"
    fi
}
alias fgr=fzf-git-restore

autoload -Uz compinit && compinit

# 余計な空白は詰めて記録する
setopt hist_reduce_blanks

# スペースで始まるコマンドは history に追加しない
setopt hist_ignore_space

# コマンドをすぐに history に追記する
setopt inc_append_history

source $HOME/.zshrc.alias
source $HOME/.zshrc.local
