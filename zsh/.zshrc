ZSH_CUSTOM=$HOME/.zsh-custom

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

export CPATH="/opt/homebrew/include:$CPATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/include $CPPFLAGS"
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
