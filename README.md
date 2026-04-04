oh-my-zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

[zsh theme](https://github.com/subnixr/minimal?tab=readme-ov-file) install:
```
git clone https://github.com/subnixr/minimal.git  ${ZSH_CUSTOM}/themes/minimal
ln -s ${ZSH_CUSTOM}/themes/minimal/minimal.zsh ${ZSH_CUSTOM}/themes/minimal.zsh-theme
```

[zsh autoswitch venv](https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv) install:
```
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"
```

[zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) install:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

tmux plugins install:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Ubuntu

packages to install:
```
sudo apt install -y gh build-essential cmake unzip zsh fzf ripgrep nodejs npm
```

nvim on ubuntu:
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
