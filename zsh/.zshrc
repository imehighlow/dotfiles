ZSH_CUSTOM=$HOME/.zsh-custom

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

plugins=(autoswitch_virtualenv zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias c=clear
alias py=python3
alias python=python3
alias vimo="cd \"$HOME/.obsidian/main\" && nvim"
alias cdo="cd \"$HOME/.obsidian/main\""
alias t="tmux"
alias ll="ls -alh"
export EDITOR=nvim
export PATH="$PATH:$HOME/Library/Python/3.8/bin:/opt/bin:$HOME/.local/bin"

export CPATH="/opt/homebrew/include${CPATH:+:$CPATH}"
export LIBRARY_PATH="/opt/homebrew/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/include $CPPFLAGS"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init --cmd cd zsh)"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
