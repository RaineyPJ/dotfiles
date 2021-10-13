-- Plugins will be downloaded under the specified directory.
vim.call('plug#begin','~/.vim/plugged')

-- Declare the list of plugins.
vim.call('plug#', 'wellle/targets.vim')
vim.call('plug#', 'tpope/vim-unimpaired')
vim.call('plug#', 'tpope/vim-fugitive')
vim.call('plug#', 'tpope/vim-vinegar')
vim.call('plug#', 'milkypostman/vim-togglelist')
vim.call('plug#', 'RaineyPJ/gruvbox')
vim.call('plug#', 'nvim-lua/plenary.nvim')
vim.call('plug#', 'nvim-telescope/telescope.nvim')
vim.call('plug#', 'yuttie/comfortable-motion.vim')
vim.call('plug#', 'dbakker/vim-paragraph-motion')
vim.call('plug#', 'junegunn/vim-easy-align')
vim.call('plug#', 'will133/vim-dirdiff')
vim.call('plug#', 'hrsh7th/cmp-buffer')
vim.call('plug#', 'hrsh7th/nvim-cmp')
vim.call('plug#', 'hkupty/iron.nvim')


-- plugins that I have tried, but don't use anymore.
-- 'moll/vim-bbye'
-- 'tckmn/vim-minisnip'
-- 'flazz/vim-colorschemes'
-- 'felixhummel/setcolors.vim'
-- 'neoclide/coc.nvim', {'branch': 'release'}

-- plugins that I would like to try one day.
-- will133/vim-dirdiff
-- UltiSnip
-- surround (tpope)
-- something to work with cammel case
-- 'dkprice/vim-easygrep' 
-- scalpel
-- NerdTree
-- copy / paste stuff

-- List ends here. Plugins become visible to Vim after this call.
vim.call('plug#end')

-- Enable file type detection.
-- Use the default filetype settings, so that mail gets 'tw' set to 72,
-- 'cindent' is on in C files, etc.
-- Also load indent files, to automatically do language-dependent indenting.
-- Revert with ":filetype off".
vim.cmd('filetype plugin indent on')

-- Core vim config
-- Allow backspacing over everything in insert mode.
vim.opt.backspace='indent,eol,start'
vim.opt.wildmenu=true
vim.opt.wrap=false

-- Allow a buffer to be hidden, i.e. contain unsaved changes.
-- This should be unecessary with autowrite, but netrw looks for hidden before
-- splitting when :E is called.
vim.opt.hidden=true

vim.g.mapleader=" "

-- ------------ --
-- Key bindings --
-- ------------ --

local opts = {noremap = true, silent = true}

-- Close active window and close preview window
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', ':pclose<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>o', ':only<CR>', opts)

-- Save all
vim.api.nvim_set_keymap('n', '<Leader>s', ':wall<cr>', opts)

-- Use visual mode selection to search
vim.api.nvim_set_keymap('v', '<Leader>/', 'y/<C-R>--<CR>', opts)

-- Enable the mouse in normal and visual modes
vim.opt.mouse='nv'

-- Mappings of core Vim commands that have bad defaults
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', opts)
vim.api.nvim_set_keymap('n', '<F5>', ':wall<CR>:make<CR>', opts)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- Remap splits navigation to just CTRL + hjkl
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', opts)
vim.api.nvim_set_keymap('n', '<C-s>', '<C-w><C-v>', opts)
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', opts)
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', opts)

-- Make adjusing split sizes a bit more friendly
vim.api.nvim_set_keymap('', '<C-Left>', ':vertical resize -3<CR>', opts)
vim.api.nvim_set_keymap('', '<C-Right>', ':vertical resize +3<CR>', opts)
vim.api.nvim_set_keymap('', '<C-Up>', ':resize +3<CR>', opts)
vim.api.nvim_set_keymap('', '<C-Down>', ':resize -3<CR>', opts)

-- Add a Stamp command that pastes over the top of the current word
vim.api.nvim_set_keymap('n', 'S', 'diw--0P', opts)

-- Quick way to toggle upper-case on one character
vim.api.nvim_set_keymap('n', '<Leader>u', 'g~l', opts)

-- Start a powershell terminal
vim.api.nvim_set_keymap('n', '<Leader>t', ':e term://C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe<CR>', opts)

-- Send code to ipython terminal
vim.api.nvim_set_keymap('v', '<Leader>r', '"+y<C-W><C-L>apaste', opts)

vim.opt.scrolloff=3
vim.opt.foldmethod='indent'
vim.opt.foldlevel=2

-- Searching settings
vim.opt.incsearch=true
-- set ignorecase
-- set smartcase

-- add chinese encoding
vim.opt.fileencodings='ucs-bom,utf-8,euc-cn,default,latin1'

-- # normally does a * but searches backwards. I don't really see the use of
-- that. Instead, it is useful to highlight the matches without jumping forwards
vim.api.nvim_set_keymap('n', '#', '*N', opts)
vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<CR>', opts)

vim.cmd('syntax enable')

-- spell check
vim.opt.spell=true
vim.opt.spelllang='en_us'
vim.opt.spellfile='~/.config/nvim/spell/en.utf-8.add'

vim.opt.expandtab=true

vim.opt.grepprg='grep -n -r --color --include=\'*.*\' $*'

-- Enable searching in sub-directories for files
vim.opt.path = vim.opt.path + '**'

-- Use the .vim directory under home to look for any custom compile plugins
vim.opt.runtimepath = vim.opt.runtimepath + '~\.vim'

-- Relative number
vim.opt.number=true
vim.opt.relativenumber=true

-- Colorscheme
vim.opt.termguicolors=true
vim.opt.background='light'
vim.cmd('colorscheme gruvbox')
-- set comment to the fg1 colour. I find the default grey too faint
vim.cmd('hi Comment guifg=\'#3c3836\'')

-- I was fiddling with these settings to try a fix an issue of a white
-- cursor in a light background. In the end this was fixed by changing the
-- Windows Terminal color scheme
-- hi Cursor cterm=NONE guibg='#3c3836'
-- set gcr=n-v-c-sm:block-Cursor,i-ci-ve:ver25,r-cr-o:hor20

-- function! SynGroup()                                                            
    -- let l:s = synID(line('.'), col('.'), 1)                                       
    -- echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
-- endfun

-- Telescope mappings
require("telescope").setup{
        defaults = {
                prompt_prefix = ">> ",
                mappings = {
                        i = { ["<esc>"] = require('telescope.actions').close }
                }
        }
}
vim.api.nvim_set_keymap('n', '<C-F>', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-G>', ':Telescope git_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-B>', ':Telescope buffers<CR>', opts)

-- completion
vim.opt.completeopt='menu,menuone,noselect'
local cmp = require'cmp'
cmp.setup({
        sources = {
                {name = 'buffer'},
        },
        mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
})

-- comfortable motion
vim.g.comfortable_motion_no_default_key_mappings = 1
vim.g.comfortable_motion_scroll_down_key = "j"
vim.g.comfortable_motion_scroll_up_key = "k"
vim.api.nvim_set_keymap('n', '<C-d>', ':call comfortable_motion#flick(100)<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-u>', ':call comfortable_motion#flick(-100)<CR>', opts)

-- targets settings
-- Prefer multiline targets around cursor over distant targets within cursor
-- See: https://github.com/wellle/targets.vim#gtargets_seekranges
vim.g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

-- togglelist settings
vim.g.toggle_list_no_mappings=1
vim.api.nvim_set_keymap('n', '<leader>l', ':call ToggleLocationList()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>c', ':call ToggleQuickfixList()<CR>', opts)

-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', opts)

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', opts)
