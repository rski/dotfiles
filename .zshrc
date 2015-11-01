# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob
unsetopt beep
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rski/.zshrc'

autoload -Uz compinit 
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit
prompt redhat

autoload -U compinit && compinit
zstyle ':completion:*' menu select  list-colors ${(s.:.)LS_COLORS}

#complete commands right after they have been installed
zstyle ':completion:*' rehash true

autoload colors; colors

#exports
export TERM=xterm-256color

export EDITOR=vim
#fix shitty ls colours
export LS_COLORS=`echo $LS_COLORS|sed 's/34\;42/01\;34/g'`

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" ||     eval "$(dircolors -b)"

#aliases
if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

#options
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word    
setopt extended_history # save timestamp of command and duration
setopt hist_ignore_dups #ignore duplicates
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt correct # spelling correction for commands
setopt list_ambiguous #complete to "something" if something1 & something2 exist in a folder

#save history
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
#wine
export WINEPREFIX=$HOME/.config/wine/
export WINEARCH=win32

#ranger to stop loading both configs
RANGER_LOAD_DEFAULT_RC=FALSE


#smth smth fixes the ^M yaourt problem maybe
ttyctl -f

#ohmyzsh
#export DISABLE_AUTO_UPDATE=TRUE
#export ZSH=/usr/share/oh-my-zsh
#ZSH_THEME="bullet-train"
#source $ZSH/oh-my-zsh.sh
#plugins=(archlinux)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind P and N for EMACS mode prev-next history search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

if [ -f $HOME/.britbongaliases ]; then
  source $HOME/.britbongaliases
fi

#black magic that fixes slow git autocompletion
#http://stackoverflow.com/questions/9810327/git-tab-autocompletion-is-useless-can-i-turn-it-off-or-optimize-it
__git_files () {
  _wanted files expl 'local files' _files
}
