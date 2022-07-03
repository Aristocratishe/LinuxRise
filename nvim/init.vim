source $HOME/.config/nvim/coc-config/coc.vim

set number
set tabstop=4
set smarttab
"set clipboard=unnamedplus
"set paste
set expandtab
set shiftwidth=4
set mouse=a 
set nobackup
set noswapfile
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray
set visualbell t_vb=
set t_Co=256
set mousehide
set guicursor=i:block-Cursor
set termencoding=utf-8
set fileencodings=utf8,p1251
set wrap linebreak nolist
syntax on
filetype plugin indent on
set nocompatible
let g:mapleader=','
"----------------------SEARCHING---------------------------------------------
set hlsearch
set incsearch
"----------------------VIM-PLUG----------------------------------------------
call plug#begin(stdpath('config') . '/plugged')
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'cdelledonne/vim-cmake'
"Plug 'antoinemadec/FixCursorHold.nvim'
call plug#end()
"-----------------------NERDTREE-----------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"-----------------------COLORSCHEME---------------------------------------------
colorscheme gruvbox 
let g:airline_theme = 'gruvbox' 
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"---------------------VIM-AIRLINE-----------------------------------------------
let g:airline_section_z =  "\ue0a1:%l/%L Col:%c"
"--------------------FixCursorHold---------------------------------------------
let g:cursorhold_updatetime = 100

autocmd filetype cpp map <F5> :w <CR>: !g++ -std=c++17 % && ./a.out<CR>
autocmd filetype c map <F5> :w <CR>: !gcc -std=c17 % && ./a.out<CR>

