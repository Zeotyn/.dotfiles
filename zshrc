# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
alias sub="subl"
ZSH_THEME="spaceship"

plugins=(ruby zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/MacGPG2/bin:~/bin:$GOPATH/bin"

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Exports
export GOPATH=$HOME/go

# Aliases
# Rails

# Easteregg
alias nice='echo "Yes, I know Eugene."'
# Easteregg

alias postgres.server="postgres -D /usr/local/var/postgres"
alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec rspec'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gr='git rebase'
alias gd='git diff'
alias gl='git lg'

# Other
alias reloadzsh='source ~/.zshrc'

# Phraseapp
alias sub='subl'


. `brew --prefix`/etc/profile.d/z.sh
eval $(docker-machine env default)

# PROMPT
SPACESHIP_PROMPT_SYMBOL='➔'
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true

# GIT
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_UNCOMMITTED='+'
SPACESHIP_GIT_UNSTAGED='!'
SPACESHIP_GIT_UNTRACKED='?'
SPACESHIP_GIT_STASHED='$'
SPACESHIP_GIT_UNPULLED='⇣'
SPACESHIP_GIT_UNPUSHED='⇡'

# NVM
SPACESHIP_NVM_SHOW=true
SPACESHIP_NVM_SYMBOL='⬢'

# RUBY
SPACESHIP_RUBY_SHOW=true
SPACESHIP_RUBY_SYMBOL='💎'

# VENV
SPACESHIP_VENV_SHOW=true