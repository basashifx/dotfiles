export PATH=/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:/usr/local/bin:$PATH:/Applications/Xcode.app/Contents//Developer/usr/bin

export EDITOR=vim

export HISTSIZE=100000
export SAVEHIST=1000000

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969896"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --reverse'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export ENHANCD_FILTER="fzf --preview 'ls -lah {}' --preview-window right,50%"

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(anyenv init - zsh)"
eval "$(direnv hook zsh)"

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

# ref: https://blog.tsub.me/post/move-from-peco-to-fzf/
function fzf-git-branch() {
  local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | perl -pne 's{^refs/heads/}{}' | \
    fzf --query "$LBUFFER")

  if [ -n "$selected_branch" ]; then
    BUFFER="git checkout ${selected_branch}"
    zle accept-line
  fi

  zle reset-prompt
}
zle -N fzf-git-branch
bindkey "^b" fzf-git-branch

function fzf-git-add() {
    local selected=$(unbuffer git status --short | fzf --preview="echo {} | awk '{print \$2}' | xargs git diff --color" \
        --preview-window right,50% --multi --ansi | awk '{print $2}')

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
        --preview-window right,50% --multi --ansi | awk '{print $2}')

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

source $HOME/.zshrc.alias
source $HOME/.zshrc.local
