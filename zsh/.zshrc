ZSH_CUSTOM=$USER/.zsh-custom

export ZSH="/Users/im/.oh-my-zsh"

ZSH_THEME="minimal"

plugins=(autoswitch_virtualenv zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias c=clear
alias py=python3
alias python=python3
alias vimo="cd '/Users/im/.obsidian/main' && nvim"
alias cdo="cd  '/Users/im/.obsidian/main'"
alias t="tmux"
EDITOR=nvim
export PATH=$PATH:/Users/im/Library/Python/3.8/bin:/opt/bin:/Users/im/.local/bin
eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)
