export ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.zsh-custom}"
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"

ZSH_THEME="minimal"

plugins=(
    autoswitch_virtualenv
    zsh-syntax-highlighting
    fzf-tab
)

fpath+=~/.zfunc

zstyle ':omz:update' mode disabled
ZSH_DISABLE_COMPFIX=true
if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
    source "$ZSH/oh-my-zsh.sh"
else
    print -u2 "oh-my-zsh is missing; run ~/.dotfiles/bootstrap --only plugins"
fi

alias vim=nvim
alias c=clear
alias py=python3
alias python=python3
alias t="tmux"
alias ll="ls -alh"

export EDITOR=nvim
export VISUAL="$EDITOR"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

if [[ "$(uname -s)" == Darwin ]] && (( $+commands[brew] )); then
    brew_prefix=$(brew --prefix)
    export CPATH="$brew_prefix/include${CPATH:+:$CPATH}"
    export LIBRARY_PATH="$brew_prefix/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
    export LDFLAGS="-L$brew_prefix/lib${LDFLAGS:+ $LDFLAGS}"
    export CPPFLAGS="-I$brew_prefix/include${CPPFLAGS:+ $CPPFLAGS}"
    unset brew_prefix
fi

obsidian_dir="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/main"
if [[ -d "$obsidian_dir" ]]; then
    cdo() { cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/main"; }
    vimo() { cdo && nvim; }
fi
unset obsidian_dir

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init --cmd cd zsh)"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -d "$HOME/.lmstudio/bin" ]] && export PATH="$PATH:$HOME/.lmstudio/bin"

# Machine-only values and secrets belong here, outside this repository.
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
