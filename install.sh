#!/usr/bin/env
echo "Type gitconfig name: "
read name
echo "Type gitconfig email: "
read email
echo "Type gitconfig signingkey: "
read signingkey
echo "
# This is Git's per-user configuration file.
[user]
    name = $name
    email = $email
    signingkey = $signingkey
[core]
    editor = vim
[mergetool]
    keepBackup = false
[alias]
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
[commit]
    gpgsign = true
[mergetool \"vscode\"]
    cmd = code --wait \$MERGED
[merge]
        tool = vscode
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

while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* )
          # Brew install
          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

          # git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
          # chsh -s /bin/zsh

          git clone https://github.com/powerline/fonts.git --depth=1
          cd fonts
          ./install.sh
          cd ..
          rm -rf fonts

          # Installs
          # git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
          # brew install tmux

          git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
          git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
          brew install reattach-to-user-namespace
          brew install z
          

          # brew install mas
          # mas install 1333542190 # 1Password
          # mas install 557168941 # Tweetbot

          # brew cask install gitup
          # Theme
          git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
          ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


          # Vim
          # vim +PluginInstall +qall

          source ~/.zshrc          
break;;
        [Nn] ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


