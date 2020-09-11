let g:python3_host_prog='C:/Users/patra/Miniconda3/envs/neovim3/python.exe'
let g:python_host_prog='C:/Users/patra/Miniconda3/envs/neovim/python.exe'

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'wellle/targets.vim'
Plug 'flazz/vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-unimpaired'
Plug 'milkypostman/vim-togglelist'

" plugins that I have tried, but don't use anymore.
" 'moll/vim-bbye'

" plugins that I would like to try one day.
" 'dkprice/vim-easygrep' 
" surround (tpope)
" coc

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
set nowrap

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Allow a buffer to be hidden, i.e. contain unsaved changes.
" This should be unecessary with autowrite, but netrw looks for hidden before
" splitting when :E is called.
set hidden

let mapleader= " "

" Save all
nnoremap <Leader>s :wall<cr>

" Enable the mouse in normal and visual modes
set mouse=nv

" Mappings of core Vim commands that have bad defaults
inoremap jk <ESC>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-s> <C-w><C-v>

" Add a Stamp comand that pastes over the top of the current word
nnoremap S diw"0P

set scrolloff=3

set incsearch
" set ignorecase
" set smartcase
nnoremap <Leader>/ :nohlsearch<CR>

syntax enable

set expandtab

set grepprg=grep\ -n\ -r\ --color\ --include='*.*'\ $*

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
" I haven't found myself using this, have have added vim-togglelist which
" clashes with this mapping
" nnoremap <Leader>q :Bdelete<CR>

" targets settings
" Prefer multiline targets around cursor over distant targets within cursor
" See: https://github.com/wellle/targets.vim#gtargets_seekranges
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

augroup mycs
    au!
    autocmd FileType cs set suffixesadd=.cs
    autocmd FileType cs set isfname=@,48-57,-,_
    autocmd FileType cs set shiftwidth=4
    autocmd FileType cs set tabstop=4
    autocmd FileType cs setlocal grepprg=grep\ -n\ -r\ --color\ --include='*.cs'\ $*
    autocmd FileType cs set errorformat=%f(%l\\,%c)%m
    autocmd FileType cs set makeprg=dotnet\ build\ /p:GenerateFullPaths=true
augroup END

" OmniSharp setting are in a separate file, so source here is wanted
" source OmniSharp.vim
