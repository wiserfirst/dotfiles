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
if [[ -z $SSH_CONNECTION ]] && command -v mvim > /dev/null; then
  export EDITOR='mvim'
  export VISUAL='mvim'
  alias v=mvim
else
  export EDITOR='vim'
  export VISUAL='vim'
  alias v=vim
fi

alias vi=vim
alias g=git
alias sync-claude-plugin-skills='~/.pi/agent/scripts/sync-claude-plugin-skills.sh'

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

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Erlang/Elixir command history
export ERL_AFLAGS="-kernel shell_history enabled"
if [[ $OSTYPE == darwin* ]]; then
  export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-threads --enable-kernel-poll --enable-darwin-64bit --enable-gettimeofday-as-os-system-time --with-ssl=/opt/homebrew/opt/openssl@3 --without-wx"
else
  export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-threads --enable-kernel-poll --without-wx"
fi

eval "$(direnv hook zsh)"
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH:$(yarn global bin):$HOME/bin"
# section for zplug
# if [[ ! -d ~/.zplug ]];then
#   git clone https://github.com/b4b4r07/zplug ~/.zplug
# fi

# source ~/.zplug/init.zsh

# zplug "kevinywlui/zlong_alert.zsh"

# if ! zplug check; then
#   zplug install
# fi
# zplug load
test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh || true

# Created by `pipx` on 2024-06-18 12:32:52
export PATH="$PATH:$HOME/.local/bin"

# GNU tools (macOS only; Linux sed is already GNU)
if command -v brew > /dev/null; then
  export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
fi

# add -F to exit immediately if output fits on one screen
export LESS="-F $LESS"

# Do not use a pager for AWS cli
export AWS_PAGER=""

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '$HOME/.opam/opam-init/init.zsh' ]] || source '$HOME/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# Terminal title management functions
terminal_titles() {
    case "$1" in
        window)
            echo -ne "\033]2;$2\007"
            ;;
        tab)
            echo -ne "\033]1;$2\007"
            ;;
        both)
            echo -ne "\033]0;$2\007"
            ;;
        help)
            echo "Usage: terminal_titles [window|tab|both|reset|help] [title]"
            echo "  window [title] - Set window title only"
            echo "  tab [title]    - Set tab title only"
            echo "  both [title]   - Set both window and tab to same title"
            echo "  [title]        - Same as both [title]"
            echo "  reset          - Reset to default titles"
            echo "  help           - Show this help message"
            echo "  (no args)      - Same as reset"
            ;;
        reset|"")
            # Window title: full path with ~ for home
            echo -ne "\033]2;${PWD/#$HOME/~}\007"
            # Tab title: last portion of the full path
            echo -ne "\033]1;${PWD##*/}\007"
            ;;
        *)
            echo -ne "\033]0;$1\007"
            ;;
    esac
}

alias tt='terminal_titles'


# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
