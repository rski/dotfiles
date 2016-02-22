if !has('nvim')
  source ~/.config/nvim/autoload/plug.vim
end

" plugins {{{
call plug#begin('~/.config/nvim/plugged')
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py' }
  Plug 'tomasr/molokai'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-pathogen'
  Plug 'tpope/vim-dispatch'
  Plug 'ervandew/supertab'
  Plug 'ap/vim-css-color'
  Plug 'EinfachToll/DidYouMean'
  Plug 'airblade/vim-gitgutter'
  "znipeddy znabbb :DDDD
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'takac/vim-hardtime'
  Plug 'takac/vim-commandcaps'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  if executable('ctags')
    Plug 'majutsushi/tagbar'
  end
  Plug 'hynek/vim-python-pep8-indent'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'on': 'YcmGenerateConfig'}
call plug#end()
" }}}

" fundamentals {{{
set wrapscan
set number
filetype plugin indent on
filetype plugin on
set expandtab
set shiftwidth=2
set softtabstop=2
syntax on
colorscheme molokai
set cursorline
" }}}

"ignore files {{{
set wildignore=*.swp,*.pyc
" }}}

" per filetype settings {{{
augroup filetypedetection
  autocmd!
  "vanilla vim recognises *.md files as modula2
  autocmd FileType tex,text,vimwiki,markdown setlocal spell spelllang=en_gb
  autocmd FileType {make,gitconfig} set noexpandtab sw=4
  autocmd FileType python set softtabstop=4 expandtab shiftwidth=4
  autocmd Filetype python set completeopt-=preview
  autocmd Filetype python set makeprg=python\ %
augroup END
"}}}

"syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_puppet_puppetlint_args = "--no-documentation-check"
" }}}

" mappings {{{
let mapleader = ","

nnoremap ; :
cmap w!! w !sudo tee > /dev/null % <cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"cut" mode
noremap <leader>t :set number!<cr>

" make
noremap <leader>mm :Make<cr>
noremap <leader>mo :Copen<cr>

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
" }}}

" vimwiki {{{
let main_wiki = {}
let main_wiki.path = "~/Documents/vimwiki"
let main_wiki.path_html = "~/Documents/vimwiki/html/"
let g:vimwiki_list = [main_wiki]
augroup l:vimwiki
  autocmd!
  autocmd BufWritePost *.wiki :silent! Vimwiki2HTML
augroup END
" }}}

"fugitive {{{
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gps :Gpush<cr>
nnoremap <leader>gpl :Gpull<cr>
" }}}

" tagbar {{{
if executable('ctags')
  "tagbar
  let g:tagbar_autofocus = 1
  nnoremap <leader>tt :TagbarToggle<cr>
end
" }}}

" Nerdtree {{{
nnoremap <leader>ll :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$']
" }}}

"Ultisnips {{{
" Trigger configuration. Do not use <tab> if you use YCM
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<leader>n"
let g:UltiSnipsJumpBackwardTrigger="<leader>p"
" }}}

"status line {{{
set statusline+=%f
set statusline+=\ %{fugitive#statusline()}
"syntastic statusline
set statusline+=\ %#warningmsg#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=\ %*
let g:airline_theme='behelit'
" }}}

"hardtime {{{
let g:hardtime_default_on = 0
" }}}

"rainbow paren {{{
augroup rainbowparen
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadRound
augroup END
" }}}

" vim specific settings {{{
if !has('nvim')
  set laststatus=2
  set nocompatible
end
" }}}

"swap files dir
"set so that they don't clutter projects
set directory=~/.tmp

"vim inherits the terminal name
"now terminal windows get a title based on the filename
set title

"pathogen
execute pathogen#infect('~/Code/vim-plugins/{}')

"search highlighting
set hlsearch
nnoremap <leader>a :nohlsearch<cr>
