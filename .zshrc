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

alias ism='iex -S mix'
alias isp='iex -S mix phx.server'

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

# Erlang/Elixir command history
export ERL_AFLAGS="-kernel shell_history enabled"

eval "$(direnv hook zsh)"
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH="$HOME/.asdf/installs/golang/$(asdf current golang | cut -d' ' -f1)/packages"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/opt/unzip/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
