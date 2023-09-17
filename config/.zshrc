export PATH=/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:/usr/local/bin:$PATH:/Applications/Xcode.app/Contents//Developer/usr/bin

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(anyenv init - zsh)"
eval "$(direnv hook zsh)"

export EDITOR=vim

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969896"

export HISTSIZE=100000
export SAVEHIST=1000000

# GNU Source-highlight
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

peco-src () {
    local repo=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

source $HOME/.zshrc.alias
source $HOME/.zshrc.local
