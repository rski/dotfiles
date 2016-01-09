call plug#begin('~/.config/nvim/plugged')
  Plug 'davidhalter/jedi-vim'
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'tomasr/molokai'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'msanders/snipmate.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'vimwiki/vimwiki'
call plug#end()

set wrapscan
set relativenumber
set number
filetype plugin indent on
filetype plugin on
set expandtab
set shiftwidth=2
set softtabstop=2
syntax on
autocmd FileType tex,text setlocal spell spelllang=en_gb

colorscheme molokai

nnoremap ; :

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead *.geom,*.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
augroup END


au FileType {make,gitconfig} set noexpandtab sw=4
au FileType python set softtabstop=4 expandtab shiftwidth=4

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let mapleader = ","

cmap w!! w !sudo tee > /dev/null % <cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"cut" mode
noremap <leader>t :set number!<cr> <bar> :set relativenumber!<cr>

"upercase word
nnoremap <leader>u viwU

inoremap jj <esc>
inoremap jk <esc>:w<cr>

inoremap <esc> <nop>

noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
noremap <left> <nop>

let main_wiki = {}
let main_wiki.path = "~/Documents/vimwiki"
let main_wiki.path_html = "~/Documents/vimwiki/html"

let g:vimwiki_list = [main_wiki]
