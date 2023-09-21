export PATH=/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:/usr/local/bin:$PATH:/Applications/Xcode.app/Contents//Developer/usr/bin

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(anyenv init - zsh)"
eval "$(direnv hook zsh)"

export EDITOR=vim

export HISTSIZE=100000
export SAVEHIST=1000000

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969896"

export ENHANCD_FILTER="fzf --preview 'ls -lah {}' --preview-window right,50% --height 30% --reverse --ansi"

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ref: https://github.com/Songmu/ghq-handbook/blob/master/ja/05-command-list.md
function fzf-cd-ghq () {
    local repo=$(ghq list | fzf --height 30% --reverse --ansi)
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
}
zle -N fzf-cd-ghq
bindkey '^]' fzf-cd-ghq

function fzf-git-add() {
    local selected=$(unbuffer git status --short | fzf --preview="echo {} | awk '{print \$2}' | xargs git diff --color" \
        --preview-window right,50% --height 30% --reverse --multi --ansi | awk '{print $2}')

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
        --preview-window right,50% --height 30% --reverse --multi --ansi | awk '{print $2}')

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
