export PATH=/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:/usr/local/bin:$PATH:/Applications/Xcode.app/Contents//Developer/usr/bin

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(anyenv init - zsh)"
eval "$(direnv hook zsh)"

export EDITOR=vim

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969896"

export HISTSIZE=100000
export SAVEHIST=1000000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fzf-ghq () {
    local repo=$(ghq list | fzf)
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-ghq
bindkey '^]' fzf-ghq

source $HOME/.zshrc.alias
source $HOME/.zshrc.local
