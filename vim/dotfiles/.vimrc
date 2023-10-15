set number
set relativenumber
set tabstop=2
set smarttab
set expandtab
set shiftwidth=2
set backspace=2
" set mouse=a
set nobackup
set noswapfile
set colorcolumn=80
set visualbell t_vb=
set t_Co=256
set mousehide
set guicursor=i:block-Cursor
set encoding=utf8
set termencoding=utf8
set fileencodings=utf8,p1251
set wrap linebreak nolist
set cursorline
set cursorlineopt=number
set cursorcolumn
syntax on
filetype plugin indent on
set nocompatible
let g:mapleader=','
set listchars=tab:>·,extends:>,precedes:<
set list
set guifont=Jet\ Brains\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set wildmenu
set wildmode=longest:full,full

" autocmd FileType c,cpp,h, set noexpandtab

set term=$TERM
nnoremap <C-t> :term<CR>
"----------------------SEARCHING-----------------------------------------------
set hlsearch
set incsearch

"----------------------VIM-PLUG------------------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'airblade/vim-gitgutter'
  Plug 'neoclide/coc.nvim', {'for':['cmake', 'json', 'sh', 'yaml', 'c', 'cpp',
      \'python',  'vim'],'branch': 'release'}
  Plug 'kien/ctrlp.vim'
  Plug 'rhysd/vim-clang-format'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'ryanoasis/vim-devicons'
  Plug 'ap/vim-css-color'
  Plug 'fedorenchik/qt-support.vim'

  " Plug 'jiangmiao/auto-pairs'
  " Plug 'rhysd/vim-healthcheck'
call plug#end()

"-----------------------NERDTREE-----------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1

"-----------------------COLORSCHEME--------------------------------------------
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
colorscheme PaperColor
set background=dark

"---------------------VIM-AIRLINE----------------------------------------------
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1

" autocmd filetype cpp map <F5> :w <CR>: !g++ -std=c++17 % && ./a.out<CR>
" autocmd filetype c map <F5> :w <CR>: !gcc -std=c17 % && ./a.out<CR>

"---------------------VIM-TMUX-NAVIGATOR---------------------------------------
let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
" noremap <silent> <c-j> :<C-U>TmuxNavigatePrevious<cr>
"-------------------LANGUAGE-SERVER--------------------------------------------
let g:coc_global_extensions = [
      \'coc-clangd',
      \'coc-jedi',
      \'coc-diagnostic',
      \'coc-sh',
      \'coc-cmake',
      \'coc-markdownlint',
      \'coc-json',
      \'coc-clang-format-style-options',
      \]
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
                  \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) :
            \ CheckBackspace() ? "\<S-Tab>" :
                  \ coc#refresh()

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"-----------------------------CLANG-FORMAT-------------------------------------
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
