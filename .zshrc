# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Customize to your needs...
#alias ls='ls --color=auto'
alias ll='ls -hl'
alias la='ls -hla'
alias ltm='ls -tl | more'

# Set bash command line editting mode to vi
set -o vi
export LC_CTYPE=en_US.UTF-8

export PATH="/Users/wiser/.rbenv/shims:/Users/wiser/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export JAVA_HOME=$(/usr/libexec/java_home)

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

personal_config=$HOME"/.zsh_personal"
if [ -f $personal_config ]; then
    source $personal_config
fi

alias vi=vim
alias reload='source ~/.zshrc'
alias zshconfig='vim ~/.zshrc'

alias -s html=vi   # 在命令行直接输入后缀为 html 的文件名，会在 vi 中打开
alias -s phtml=vi
alias -s php=vi
#alias -s rb=vi
#alias -s py=vi
alias -s js=vi
alias -s css=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# for git diff
alias gitdiff='git diff -w > diff.log && vi diff.log'

#alias ack='nocorrect ack'
#alias go='nocorrect go'

# for autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

setopt interactivecomments

export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH:/Users/wiser/.composer/vendor/bin"

unset MAILCHECK
MAILTO=

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
