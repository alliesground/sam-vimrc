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
