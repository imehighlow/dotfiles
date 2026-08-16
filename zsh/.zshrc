ZSH_CUSTOM="$HOME/.zsh-custom"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

plugins=(
    autoswitch_virtualenv
    zsh-syntax-highlighting
    fzf-tab
)

fpath+=~/.zfunc

zstyle ':omz:update' mode disabled
ZSH_DISABLE_COMPFIX=true
source "$ZSH/oh-my-zsh.sh"

alias vim=nvim
alias c=clear
alias py=python3
alias python=python3
alias cdo='cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/main"'
alias vimo='cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/main" && nvim'
alias t="tmux"
alias ll="ls -alh"

export EDITOR=nvim
export PATH="$PATH:$HOME/Library/Python/3.8/bin:/opt/bin:$HOME/.local/bin"

export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init --cmd cd zsh)"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/im/.lmstudio/bin"
# End of LM Studio CLI section

