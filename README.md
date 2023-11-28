# Basics

Install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)

```
ln -s dotfiles/zsh/.zshrc
cp zsh_custom/themes/axelhodler.zsh-theme ~/.oh-my-zsh/themes
```

# Git

```
cp ~/dotfiles/gitconfig ~/.gitconfig
```

# Tmux

```
cd ~
ln -s ~/dotfiles/.tmux.conf
ln -s ~/dotfiles/.tmux.mac.conf
brew install tmux reattach-to-user-namespace
```

# Usage
Create symlinks from the homedir to the dotfiles under version control e.g.

    ln -s dotfiles/Xresources .Xresources

# iTerm2
Use emacs keybindings to jump words back and forth.

```
Preferences -> Profiles -> Keys -> "Left option Key acts as: +Esc"
```
