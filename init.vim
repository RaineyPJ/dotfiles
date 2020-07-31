let g:python3_host_prog='C:/Users/patra/Miniconda3/envs/neovim3/python.exe'
let g:python_host_prog='C:/Users/patra/Miniconda3/envs/neovim/python.exe'

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'preservim/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'moll/vim-bbye'
Plug 'drewtempelmeyer/palenight.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set nocompatible

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Revert with ":filetype off".
filetype plugin indent on

" Core vim config
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
set wildmenu
set autowrite

" Enable the mouse in normal and visual modes
set mouse=nv

" Mappings of core Vim commands that have bad defaults
inoremap jk <ESC>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Add a Stamp comand that pastes over the top of the current word
nnoremap S diw"0P

let mapleader= " "

set scrolloff=3

set incsearch
set ignorecase
set smartcase
nnoremap <Leader>/ :nohlsearch<CR>

syntax enable

set shiftwidth=4
set tabstop=4
set expandtab

" Enable searching in sub-directories for files
set path+=**

" Relative number
set number
set relativenumber

" Colorscheme
set background=dark
colorscheme apprentice

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" NerdTree settings
let NERDTreeIgnore = ['^bin$','^obj$']

" bbye mapping
nnoremap <Leader>q :Bdelete<CR>

" targets settings
" Prefer multiline targets around cursor over distant targets within cursor
" See: https://github.com/wellle/targets.vim#gtargets_seekranges
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

" ALE mappings
nmap <silent> <leader>j <Plug>(ale_next)
" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Omni sharp setting
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
set completeopt=longest,menuone,preview
" Set desired preview window height for viewing documentation.
set previewheight=5
let g:OmniSharp_highlighting = 3

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>t <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>gcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)

  autocmd FileType cs nmap <silent> <buffer> <Leader>= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>nm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>re <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>st <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>sp <Plug>(omnisharp_stop_server)
augroup END
