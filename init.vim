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
" Plug 'w0rp/ale'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'RaineyPJ/gruvbox'
Plug 'yuttie/comfortable-motion.vim'
Plug 'dbakker/vim-paragraph-motion'
Plug 'junegunn/vim-easy-align'
Plug 'will133/vim-dirdiff'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


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

" Allow a buffer to be hidden, i.e. contain unsaved changes.
" This should be unecessary with autowrite, but netrw looks for hidden before
" splitting when :E is called.
set hidden

" Enable the mouse in normal and visual modes
set mouse=nv

" add euc-cn to fileencodings as that is used in China
set fileencodings=ucs-bom,utf-8,euc-cn,default,latin1

" ------------ --
" Key bindings --
" ------------ --

let mapleader= " "

" Close active window and close preview window
nnoremap <Leader>q :q<CR>
nnoremap <Leader>p :pclose<CR>
nnoremap <Leader>o :only<CR>

" Save all
nnoremap <C-a> :wall<cr>
nnoremap <C-s> :w<cr>

" Use visual mode selection to search
vmap <Leader>/ y/<C-R>"<CR>

" Mappings of core Vim commands that have bad defaults
inoremap jk <ESC>
nnoremap <F5> :wall<CR>:make<CR>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" make creating a new vertical split supper easy
nnoremap <leader>s <C-w><C-v>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Add a Stamp command that pastes over the top of the current word
nnoremap S diw"0P

" Quick way to toggle upper-case on one character
nnoremap <Leader>u g~l

" Start a powershell terminal
nnoremap <Leader>t :e term://C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe<CR>

" Send code to ipython terminal
" Warning this is fragile!!
" It relies on the terminal being in a window to the right of the current
" buffer
" I tried some of the more robust ways of doing this but they didn't play so
" well with IPython in NVim terminal on Windows. There seems to be a bit of a
" bug there.
vnoremap <Leader>r "+y<C-W><C-L>apaste

set scrolloff=3
set foldmethod=indent
set foldlevel=2

" Searching settings
set incsearch
" set ignorecase
" set smartcase

" # normally does a * but searches backwards. I don't really see the use of
" that. Instead, it is useful to highlight the matches without jumping forwards
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

" Relative number
set number
set relativenumber

" Colorscheme
set termguicolors
set background=light
colorscheme gruvbox
" set comment to the fg1 colour. I find the default grey too faint
hi Comment guifg='#3c3836'

" I was fiddling with these settings to try a fix an issue of a white
" cursor in a light background. In the end this was fixed by changing the
" Windows Terminal color scheme
hi Cursor gui=NONE guibg='#3c3836'
set gcr=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Telescope mappings
lua << EOF
require("telescope").setup{
        defaults = {
                prompt_prefix = ">> ",
                mappings = {
                        i = { ["<esc>"] = require('telescope.actions').close }
                }
        }
}
EOF

" I've used a mix of the lua api and the vim commands. The lua api is more
" robust and flexible, but the vim commands are a bit easier on the eye
"nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>ff :lua require("telescope.builtin").find_files{hidden=true}<CR>
nnoremap <leader>fg :Telescope git_files<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :lua require("telescope.builtin").help_tags()<CR>
nnoremap <leader>fl :lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>
nnoremap <leader>fm :lua require("telescope.builtin").keymaps()<CR>

" completion mappings
lua << EOF
vim.opt.completeopt='menu,menuone,noselect'
local cmp = require'cmp'
local types = require'cmp.types'
cmp.setup({
        sources = {
                {name = 'buffer'},
        },
        completion = {
                -- TextChanged is the default here, so this part of the config could be removed
                -- but it's useful to show how this works.
                -- autocomplete is set to false in the auto-commands for some file-types
                -- autocomplete = false,
                autocomplete = { types.cmp.TriggerEvent.TextChanged },
        },
        mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
})
EOF

" comfortable motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" targets settings
" Prefer multiline targets around cursor over distant targets within cursor line
" See: https://github.com/wellle/targets.vim#gtargets_seekranges
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

" togglelist settings
let g:toggle_list_no_mappings=1
nmap <silent> <leader>l :call ToggleLocationList()<CR>
nmap <silent> <leader>c :call ToggleQuickfixList()<CR>

augroup vimrc
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
    autocmd FileType cs nnoremap L lbiList<<Esc>ea><Esc>

    autocmd FileType py compiler pylint

    " These are two alternative ways to handle wrapping text.
    " The first just wraps the lines visually, the second inserts real line breaks
    "autocmd FileType markdown set wrap linebreak
    autocmd FileType markdown,text set textwidth=110

    autocmd FileType markdown,text noremap j gj
    autocmd FileType markdown,text noremap k gk
    " map cs to change a sentence ending with two line breaks or a full stop followed by a non-word character
    autocmd FileType markdown,text nnoremap cs d/\n\n\\|\.\W<CR>:nohlsearch<CR>i
    autocmd FileType markdown,text set spelllang=en_gb
    autocmd FileType markdown,text lua require'cmp'.setup({completion = {autocomplete = false}})
    " format the current paragraph
    autocmd FileType markdown,text nnoremap <leader>w magqap`a
augroup END

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" OmniSharp setting are in a separate file, so source here if wanted
if exists('g:enableOmniSharp')
        source ~/.config/nvim/OmniSharp.vim
endif
" source ~/.config/nvim/cocInit.vim

