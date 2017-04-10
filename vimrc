set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

"All of your Plugins must be added before the following line
call vundle#end()            " required
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

execute pathogen#infect()
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set t_Co=256
let macvim_skip_colorscheme=2
:colorscheme CandyPaper
set number
let g:netrw_liststyle=3 
set guicursor+=a:blinkon0
set backupdir=$TMPDIR//
set directory=$TMPDIR//
let g:netrw_localrmdir="rm -r" 

"mapping space+k to open explorer
let mapleader= "\<Space>"
map <leader>k :Explore<cr>

"The Silver Searcher
if executable('ag')
  "Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

"Use space+s to save the file"
nmap <leader>s :w<cr>

"Use space_w to close the file"
nmap <leader>w :q<cr>
nmap <leader>t :tabnew<cr>
