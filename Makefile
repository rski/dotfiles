.PHONY: all clean vim wm awesome spacemacs archey3 aliases lxterminal zsh gitcfg submodules emacs

makelink = ln -sf `pwd`
configdir = ${HOME}/.config

all: submodules vim wm emacs gitcfg


shell: zsh bash tmux aliases lxterminal


submodules:
	  git submodule update --init --recursive


vim: vimrc vimplugins


vimrc:
	$(makelink)/nvim/init.vim ${HOME}/.vimrc
	mkdir -p ${HOME}/.config/nvim
	$(makelink)/nvim/init.vim ${HOME}/.config/nvim/init.vim


vimplugins:
	mkdir -p ${HOME}/.config/nvim/autoload
	$(makelink)/submodules/vim-plug/plug.vim ${HOME}/.config/nvim/autoload
	vim +PlugInstall +qall


wm: awesome


awesome:
	$(makelink)/awesome $(configdir)


emacs:
	$(makelink)/emacs ${HOME}/.emacs
	$(makelink)/spacemacs ${HOME}/.spacemacs


archey3:
	$(makelink)/archey3.cfg ${HOME}/.archey3.cfg


aliases:
	$(makelink)/aliases ${HOME}/.aliases


lxterminal:
	$(makelink)/lxterminal $(configdir)


gitcfg:
	./git/gitconfig.sh
	${makelink}/git/gitignore ${HOME}/.gitignore


bash:
	$(makelink)/bashrc ${HOME}/.bashrc

zsh:
	$(makelink)/zshrc ${HOME}/.zshrc


tmux:
	$(makelink)/tmux.conf ${HOME}/.tmux.conf
