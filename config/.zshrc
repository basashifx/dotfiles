export PATH=/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:/usr/local/bin:$PATH:/Applications/Xcode.app/Contents//Developer/usr/bin

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(anyenv init - zsh)"
eval "$(direnv hook zsh)"

export EDITOR=vim

export HISTSIZE=100000
export SAVEHIST=1000000

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969896"

export ENHANCD_FILTER="fzf --preview 'ls -lah {}' --preview-window right,50% --height 50% --reverse --ansi"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ref: https://github.com/Songmu/ghq-handbook/blob/master/ja/05-command-list.md
function fzf-cd-ghq () {
    local repo=$(ghq list | fzf --height 50% --reverse --ansi)
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
}
zle -N fzf-cd-ghq
bindkey '^]' fzf-cd-ghq

# ref: https://dev.classmethod.jp/articles/fzf-original-app-for-git-add/
function gaf() {
    local selected=$(unbuffer git status --short | fzf --preview="echo {} | awk '{print \$2}' | xargs git diff --color" \
        --preview-window right,50% --height 50% --reverse --ansi | awk '{print $2}')

    if [ -n "$selected" ]; then
        git add $selected
        echo "git add $selected"
    fi
}

source $HOME/.zshrc.alias
source $HOME/.zshrc.local
