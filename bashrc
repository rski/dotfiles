# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if which ruby >/dev/null && which gem >/dev/null; then
      PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
source ~/.git-prompt.sh
PS1="[\u@\h \W]\$(__git_ps1)\$ "

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi
