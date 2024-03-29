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
  alias v=vim
else
  export EDITOR='mvim'
  alias v=mvim
fi

alias vi=vim
alias g=git

alias ism='iex -S mix'
alias isp='iex -S mix phx.server'
alias be='bundle exec'

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
alias j='fasd_cd -d'

setopt interactivecomments

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

eval "$(/opt/homebrew/bin/brew shellenv)"

[ -d $HOME/.asdf/ ] && . $HOME/.asdf/asdf.sh
# [ -d $HOME/.asdf/plugins/java/ ] && . $HOME/.asdf/plugins/java/set-java-home.zsh

# Erlang/Elixir command history
export ERL_AFLAGS="-kernel shell_history enabled"

eval "$(direnv hook zsh)"
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if [[ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]]; then
#   source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
#   source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
# fi

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# precmd() {
#   # sets the tab title to current dir
#   echo -ne "\e]1;${PWD##*/}\a"
# }

export PATH="$PATH:$(yarn global bin):$HOME/bin"
# section for zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "kevinywlui/zlong_alert.zsh"

if ! zplug check; then
  zplug install
fi
zplug load
