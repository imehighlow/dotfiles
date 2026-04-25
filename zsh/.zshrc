ZSH_CUSTOM="$HOME/.zsh-custom"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

plugins=(
    autoswitch_virtualenv
    zsh-syntax-highlighting
    conda-zsh-completion
    fzf-tab
)

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
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Prefer Homebrew GCC 15
alias gcc="gcc-15"
alias g++="g++-15"
export CXX="g++"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -Uz bashcompinit
bashcompinit
eval "$(/opt/miniconda3/bin/conda shell.bash hook 2>/dev/null)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
