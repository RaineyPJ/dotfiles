" I can't remember why I put these two lines here. Omnisharp-vim maybe?
"let g:python3_host_prog='C:/Users/patra/Miniconda3/envs/neovim3/python.exe'
"let g:python_host_prog='C:/Users/patra/Miniconda3/envs/neovim/python.exe'

" Areas to work on my Vim-fu
" Folds

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'milkypostman/vim-togglelist'
if exists('g:enableOmniSharp')
    Plug 'OmniSharp/omnisharp-vim'
endif
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'RaineyPJ/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'dbakker/vim-paragraph-motion'
Plug 'junegunn/vim-easy-align'


" plugins that I have tried, but don't use anymore.
" 'moll/vim-bbye'
" 'tckmn/vim-minisnip'
" 'flazz/vim-colorschemes'
" 'felixhummel/setcolors.vim'
" 'neoclide/coc.nvim', {'branch': 'release'}

" plugins that I would like to try one day.
" will133/vim-dirdiff
" UltiSnip
" surround (tpope)
" something to work with cammel case
" 'dkprice/vim-easygrep' 
" scalpel
" NerdTree
" copy / paste stuff

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
inoremap kj <ESC>
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

" Add a Stamp command that pastes over the top of the current word
nnoremap S diw"0P

" Quick way to toggle upper-case on one character
nnoremap <Leader>u g~l

set scrolloff=3
set foldmethod=indent
set foldlevel=2

" Searching settings
set incsearch
" set ignorecase
" set smartcase

" # normally does a * but searches backwards. I don't really see the use of
" that. Instead, it is useful to highligh the matches without jumping forwards
nnoremap # *N
nnoremap <Leader>/ :nohlsearch<CR>

syntax enable

" spell check
set spell spelllang=en_us
set spellfile=~/.config/nvim/spell/en.utf-8.add

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
set background=light
let g:gruvbox_italic=1
colorscheme gruvbox
" set comment to the fg1 colour. I find the default grey too faint
hi Comment guifg='#3c3836'

" I was fiddling with these settings to try a fix an issue of a white
" cursor in a light background. In the end this was fixed by changing the
" Windows Terminal color scheme
" hi Cursor cterm=NONE guibg='#3c3836'
" set gcr=n-v-c-sm:block-Cursor,i-ci-ve:ver25,r-cr-o:hor20

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" FZF mappings
nnoremap <C-F> :Files<CR>
nnoremap <C-G> :GFiles<CR>
nnoremap <C-B> :Buffers<CR>

" comfortable motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

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
    autocmd FileType cs nnoremap <Leader>x O/// <summary><Esc>o</summary><Esc>
    autocmd Filetype cs nnoremap <Leader>gs A { get; set; }<Esc>
    autocmd FileType cs nnoremap <Leader>; A;<Esc>
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" OmniSharp setting are in a separate file, so source here if wanted
if exists('g:enableOmniSharp')
        source ~/.config/nvim/OmniSharp.vim
endif
" source ~/.config/nvim/cocInit.vim

