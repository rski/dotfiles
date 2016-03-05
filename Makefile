makelink = ln -sf `pwd`
configdir = ${HOME}/.config

.PHONY: all
all: submodules shell vim wm spacemacs gitcfg

.PHONY: shell
shell: zsh bash tmux aliases lxterminal

.PHONY: submodules
submodules:
	  git submodule update --init --recursive

.PHONY: vim
vim: vimrc vimplugins

.PHONY: vimrc
vimrc:
	$(makelink)/nvim/init.vim ${HOME}/.vimrc
	mkdir -p ${HOME}/.config/nvim
	$(makelink)/nvim/init.vim ${HOME}/.config/nvim/init.vim

.PHONY: vimplugins
vimplugins:
	mkdir -p ${HOME}/.config/nvim/autoload
	$(makelink)/submodules/vim-plug/plug.vim ${HOME}/.config/nvim/autoload
	vim +PlugInstall +qall

.PHONY: wm
wm: awesome

.PHONY: wm
awesome:
	$(makelink)/awesome $(configdir)

.PHONY: emacs
emacs:
	$(makelink)/emacs ${HOME}/.emacs

.PHONY: spacemacs
spacemacs:
	$(makelink)/spacemacs ${HOME}/.spacemacs

.PHONY: spacemacs-deps
spacemacs-deps:
	git clone https://github.com/Valloric/ycmd ${HOME}/.ycmd
	(cd ${HOME}/.ycmd && git submodule update --init --recursive)
	python2 ${HOME}/.ycmd/build.py --all

.PHONY: archey3
archey3:
	$(makelink)/archey3.cfg ${HOME}/.archey3.cfg

.PHONY: aliases
aliases:
	$(makelink)/aliases ${HOME}/.aliases

.PHONY: lxterminal
lxterminal:
	$(makelink)/lxterminal $(configdir)

.PHONY: gitcfg
gitcfg:
	./git/gitconfig.sh
	${makelink}/git/gitignore ${HOME}/.gitignore

.PHONY: bash
bash:
	$(makelink)/bashrc ${HOME}/.bashrc

.PHONY: zsh
zsh:
	$(makelink)/zshrc ${HOME}/.zshrc
	touch ${HOME}/.zshrc_local

.PHONY: tmux
tmux:
	$(makelink)/tmux.conf ${HOME}/.tmux.conf
