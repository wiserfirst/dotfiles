#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#alias ls='ls --color=auto'
alias ll='ls -hl'
alias la='ls -hla'
alias ltm='ls -tl | more'

# Set bash command line editting mode to vi
set -o vi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

personal_config=$HOME"/.zsh_personal"
if [ -f $personal_config ]; then
    source $personal_config
fi

alias vi=vim
alias g=git

alias -s html=vi   # 在命令行直接输入后缀为 html 的文件名，会在 vi 中打开
alias -s phtml=vi
alias -s php=vi
alias -s rb=vi
alias -s py=vi
alias -s js=vi
alias -s css=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

setopt interactivecomments

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
