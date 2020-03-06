autoload -Uz compinit && compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

fpath+=$HOME/.zsh/zsh-completions/src

fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

# Plugins
# source ~/.zplug/init.zsh
# zplug "b4b4r07/enhancd", use:init.sh
# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
# zplug "mollifier/anyframe"
# zplug "greymd/docker-zsh-completion"
# zplug "x-motemen/ghq", as:command, from:gh-r
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-history-substring-search", defer:3
# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
# zplug load --verbose

# Keybindings
bindkey -e
# if zplug check "zsh-users/zsh-history-substring-search"; then
#     bindkey '^P' history-substring-search-up
#     bindkey '^N' history-substring-search-down
# fi
bindkey '^r' anyframe-widget-execute-history
bindkey '^rp' anyframe-widget-put-history
# bindkey '^g' anyframe-widget-cd-ghq-repository

# Alias
# alias vz='vim ~/.zshrc'
# alias sz='source ~/.zshrc'
# alias aw=anyframe-widget-select-widget
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'

# History
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

# Others
setopt auto_cd
zstyle ':completion:*:default' menu select=2
function chpwd() {
    emulate -L zsh
    ls --color=auto
}

