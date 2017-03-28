#!/usr/bin/env
echo "Type gitconfig name: "
read name
echo "Type gitconfig email: "
read email
echo "[user]
  name = $name
  email = $email
[core]
  editor = vim
[mergetool]
  keepBackup = false
[alias]
  lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
" >> gitconfig

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rm ~/.zshrc
rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.gitconfig

# Basic links
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
rm ${BASEDIR}/gitconfig
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* )
          # Brew install
          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

          # Installs
          git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
          brew install tmux
          brew install zsh-syntax-highlighting
          git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
          brew install reattach-to-user-namespace
          brew install z
          sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
          git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
break;;
        [Nn] ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Theme
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh

# Vim
vim +PluginInstall +qall

source ~/.zshrc
