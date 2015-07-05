set wrapscan
set relativenumber
set number
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin on
syntax on
"set autoindent
"set smartindent
"set mouse=a
"autocmd FileType tex,text setlocal spell spelllang=en_gb
colorscheme gotham256

"latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat="pdf"
"something about latexsuite installing in some directory runtimepath something
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


nnoremap ; :
nnoremap : ;

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead *.geom,*.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
augroup END

" Use the OS clipboard by default
"set clipboard=unnamed


" Copy to X11 primary clipboard
"map <leader>y "*y
"
" " Paste from unnamed register and fix indentation
"nmap <leader>p pV`]=

au FileType {make,gitconfig} set noexpandtab sw=4
