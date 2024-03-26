# If you come from bash you might have to change your $PATH.
export PATH=/opt/homebrew/bin:$HOME/.cargo/bin:/opt/zeotyn:$HOME/.tmux/plugins/tmuxifier/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme for shell
# looking in ~/.oh-my-zsh/themes/
ZSH_THEME="spaceship"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  docker-compose
  kubectl
  helm
  colored-man-pages
  rust
  git
  sdk
  oc
  zsh-syntax-highlighting
  zsh-autosuggestions
  brew
  extract
  npm
  sudo
  gradle
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# ZSH 
alias reloadzsh='source ~/.zshrc'
. `brew --prefix`/etc/profile.d/z.sh
 eval "$(nodenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIAS
alias cat='bat'
alias vim='nvim'
alias lg='lazygit'
alias java17='~/.sdkman/candidates/java/17.0.6-tem/bin/java'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval $(thefuck --alias)

typeset -U fpath  # Optinal for oh-my-zsh users
fpath=(~/.zsh/oc $fpath)
autoload -U compinit
compinit -i

# CUSTOM FUNCTION
kdigit () {
  find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} "$@" \;
}

gopen () {
    git remote -v | awk '/origin.*\(fetch\)/ {print $2}' | awk -F'git@|\\.git' '{gsub(":", "/", $2); print "https://" $2}' | xargs open 
}

gsopen() {
    git submodule foreach git remote -v | awk '/origin.*\(fetch\)/ {print $2}' | awk -F'git@|\\.git' '{gsub(":", "/", $2); print "https://" $2}' | fzf | xargs open
}

}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export KUBECONFIG=~/.kube/config:~/.kube/kubeconfig_mlops

eval "$(tmuxifier init -)"
export EDITOR=nvim
