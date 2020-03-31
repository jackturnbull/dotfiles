set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash

"  -------------------------------PLUGINS

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Language/syntax specific
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'amadeus/vim-mjml'

" Functionality
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

"  VIM
" ==================== VIM ====================
"  set leader
let mapleader=","
"  colours & highlighting
syntax enable
let base16colorspace=256
colorscheme base16-material-darker
"  open new panes to right and bottom
set splitbelow
set splitright
"  enable relative line numbers
set relativenumber
set number
"  make it obvious where column 80 is
set textwidth=80
set colorcolumn=+1
"  textwrapping
set nowrap
set formatoptions-=t
"  prevent swp file creation
set noswapfile
"  auto-reload open files on change
set autoread
"  indentation
set smartindent
set autoindent
"  use system clipboard
set clipboard=unnamed
"  disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" open a fish terminal
nnoremap <leader>c :tabnew \| terminal fish<CR>
tnoremap <Esc> <C-\><C-n>:q<CR>
" mouse
set mouse=a
" perf

" ============= CUSTOM FILETYPES ==============
autocmd FileType markdown set wrap
autocmd BufReadPost *.ecr set syntax=html

" ==================== FZF ====================
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"  use ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"  don't open FZF files in NERDtree buffer
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <expr> <Leader>t (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Tags\<cr>"
nnoremap <silent> <expr> <Leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
nnoremap <silent> <expr> <Leader><Enter> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ================== NERDTREE =================
"  open nerdtree even if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"  close vim if nerdtree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"  map nerdtree to ctrl+e
map <C-e> :NERDTreeToggle<CR>
"  make nerdtree size a bit smaller
let g:NERDTreeWinSize = 25

" ================== FUGITIVE =================
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpush<CR>

" ================= LIMELIGHT =================
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>

" ==================== GOYO ===================
nmap <Leader>j :Goyo<CR>:Limelight!!<CR>
xmap <Leader>j :Goyo<CR>:Limelight!!<CR>

" ==================== GOYO ===================

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-yaml', 'coc-highlight']

" -------------------------------END
