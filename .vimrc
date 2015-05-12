set wrapscan
set relativenumber
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin on
syntax on
"set autoindent
"set smartindent
"set mouse=a
autocmd FileType tex setlocal spell spelllang=en_gb
colorscheme ir_pitch_black

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

