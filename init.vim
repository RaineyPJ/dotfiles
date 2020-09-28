" I can't remember why I put these two lines here. Omnisharp-vim maybe?
"let g:python3_host_prog='C:/Users/patra/Miniconda3/envs/neovim3/python.exe'
"let g:python_host_prog='C:/Users/patra/Miniconda3/envs/neovim/python.exe'

" Areas to work on my Vim-fu
" Folds
" termguicolors

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'milkypostman/vim-togglelist'
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" plugins that I have tried, but don't use anymore.
" 'moll/vim-bbye'
" 'tckmn/vim-minisnip'
" 'flazz/vim-colorschemes'
" 'felixhummel/setcolors.vim'
" 'neoclide/coc.nvim', {'branch': 'release'}

" plugins that I would like to try one day.
" coc
" NerdTree
" vim-vinegar
" UltiSnip
" surround (tpope)
" 'dkprice/vim-easygrep' 
" scalpel
" fugitive

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

" Close active window and close preview window
nnoremap <Leader>q :q<CR>
nnoremap <Leader>p :pclose<CR>

" Save all
nnoremap <Leader>s :wall<cr>

" User visual mode selection to search
vmap <Leader>/ y/<C-R>"<CR>

" Enable the mouse in normal and visual modes
set mouse=nv

" Mappings of core Vim commands that have bad defaults
inoremap jk <ESC>
nnoremap <F5> :wall<CR>:make<CR>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-s> <C-w><C-v>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

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

" let g:clipboard = {
      " \   'name': 'myClipboard',
      " \   'copy': {
      " \      '+': 'clip.exe',
      " \      '*': 'clip.exe',
      " \    },
      " \   'paste': {
      " \      '+': "powershell.exe -command Get-Clipboard",
      " \      '*': "powershell.exe -command Get-Clipboard",
      " \   },
      " \   'cache_enabled': 1,
      " \ }
    

" Relative number
set number
set relativenumber

" Colorscheme
set termguicolors
set background=dark
colorscheme palenight
hi Normal ctermbg=NONE
hi Normal guibg=NONE

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" NerdTree settings
" let NERDTreeIgnore = ['^bin$','^obj$']

" bbye mapping
" I haven't found myself using this, have have added vim-togglelist which
" clashes with this mapping
" nnoremap <Leader>q :Bdelete<CR>

" targets settings
" Prefer multiline targets around cursor over distant targets within cursor
" See: https://github.com/wellle/targets.vim#gtargets_seekranges
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

" togglelist settings
let g:toggle_list_no_mappings=1
nmap <silent> <leader>l :call ToggleLocationList()<CR>
nmap <silent> <leader>c :call ToggleQuickfixList()<CR>

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

" Deoplete settings
let g:deoplete#enable_at_startup = 1
" call deoplete#enable_logging("DEBUG", "/tmp/deoplete")
call deoplete#custom#option('sources', {
\ 'cs': ['omnisharp', 'around'],
\})
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-n> pumvisible() ? "\<C-n>" :
        \ deoplete#manual_complete()

" OmniSharp setting are in a separate file, so source here if wanted
source ~/.config/nvim/OmniSharp.vim
" source ~/.config/nvim/cocInit.vim

" FZF mappings
nnoremap <C-F> :Files<CR>
nnoremap <C-G> :GFiles<CR>
nnoremap <C-B> :Buffers<CR>
