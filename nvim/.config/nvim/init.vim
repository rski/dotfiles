call plug#begin('~/.config/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'

call plug#end()

set wrapscan
set relativenumber
set number
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
syntax on
autocmd FileType tex,text setlocal spell spelllang=en_gb

"from
"http://stackoverflow.com/questions/5698284/in-my-vimrc-how-can-i-check-for-the-existence-of-a-color-scheme/5702498#5702498
try
  colorscheme gotham256
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme ron
endtry

nnoremap ; :

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead *.geom,*.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
augroup END


au FileType {make,gitconfig} set noexpandtab sw=4
au FileType {python} set sw=4 softtabstop=4

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
