# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export EDITOR="mvim -v"
bindkey -v

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Soliah"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx perl python github git-flow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/git:/opt/local/bin:~/.cabal/bin

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

alias mvim=/Applications/MacVim.app/Contents/MacOS/Vim
alias gvim="mvim -v"
alias vim="mvim -v"
alias vi="mvim -v"
alias fab="nocorrect fab"
alias vagrant="nocorrect vagrant"
alias gco="git checkout"
alias gst="git status"
alias gb="git branch"
alias gcob="git checkout -b"
alias glog="git log"
alias glp='git log -p'
alias glol="git lol"
alias gp="git push"
alias gl="git pull"
alias gci="git commit"
alias gcim="git commit -m"
alias gd='git diff'
alias gds='git diff --stat'
alias mh="fast_fab migrate_head"
alias da="fast_fab deploy_api"

# Usage: seasprint foo.pdf
function seasprint() {
  cat "$1" | ssh nicmeyer@eniac.seas.upenn.edu lpr -P169
}

#    #Usage: listprinters
function listprinters() {
  ssh nicmeyer@eniac.seas.upenn.edu lpstat -o -p -d
}

export EDITOR="/Applications/MacVim -v"

PATH=$PATH:$HOME/.rvm/bin:$HOME/.cabal/bin:~/Library/Haskell/bin # Add RVM to PATH for scripting

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
