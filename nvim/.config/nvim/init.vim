if !has('nvim')
  source ~/.config/nvim/autoload/plug.vim
end
call plug#begin('~/.config/nvim/plugged')
  if has('nvim')
    Plug 'davidhalter/jedi-vim'
  end
  if !has('nvim')
    Plug 'vim-airline/vim-airline'
end
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'tomasr/molokai'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'msanders/snipmate.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-fugitive'
  Plug 'ervandew/supertab'
  Plug 'ap/vim-css-color'
  Plug 'EinfachToll/DidYouMean'
  if executable('ctags')
    Plug 'majutsushi/tagbar'
  end
call plug#end()

set wrapscan
set number
filetype plugin indent on
filetype plugin on
set expandtab
set shiftwidth=2
set softtabstop=2
syntax on

colorscheme molokai

nnoremap ; :

augroup filetypedetection
  autocmd!
  autocmd FileType tex,text setlocal spell spelllang=en_gb
  autocmd FileType {make,gitconfig} set noexpandtab sw=4
  autocmd FileType python set softtabstop=4 expandtab shiftwidth=4
augroup END

"syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_puppet_puppetlint_args = "--no-documentation-check"

let mapleader = ","

cmap w!! w !sudo tee > /dev/null % <cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"cut" mode
noremap <leader>t :set number!<cr>

"upercase word
nnoremap <leader>u viwU

"split line
nnoremap <c-j> i<enter><esc>

inoremap jj <esc>
inoremap jk <esc>:w<cr>
inoremap <esc> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
noremap <left> <nop>

let main_wiki = {}
let main_wiki.path = "~/Documents/vimwiki"
let main_wiki.path_html = "~/Documents/vimwiki/html/"
let g:vimwiki_list = [main_wiki]
augroup l:vimwiki
  autocmd!
  autocmd BufWritePost *.wiki :Vimwiki2HTML
augroup END

"fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gps :Gpush<cr>
nnoremap <leader>gpl :Gpull<cr>

if executable('ctags')
  "tagbar
  let g:tagbar_autofocus = 1
  nnoremap <leader>ll :TagbarToggle<cr>
end

nnoremap <leader>tt :NERDTreeToggle<cr>

"status line
set statusline+=%f
set statusline+=\ %{fugitive#statusline()}
"syntastic statusline
set statusline+=\ %#warningmsg#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=\ %*

if !has('nvim')
  set laststatus=2
end
