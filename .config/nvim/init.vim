set encoding=utf-8                " File encoding
set number relativenumber         " Show numbers and make them relative
syntax enable                     " Enable syntax highlighting
set breakindent                   " Line breaking auto indents
set swapfile                      " Editing creates a swap file
set scrolloff=9                   " How far to top / bottom of screen before scrolling?
set backspace=indent,eol,start    " Allow backspacing over indent, to join lines & before start of insert
set tabstop=4                     " How many spaces is tab displayed as?
set softtabstop=4                 " How many spaces is tab key?
set shiftwidth=4                  " << and >> shift by 4
set smartindent                   " Smarter indenting (works best for C)
set autoindent                    " Auto indent when helpful
set noexpandtab                   " Tabs are not expanded to spaces
set smartcase                     " When searching, case sensitive if upper case is used
set mouse=a                       " Enable mouse actions
set foldmethod=indent             " Indenting can fold
set foldlevel=9                   " Default fold level
set pumheight=7                   " Pop-up menu height
set updatetime=300                " How often to write to buffer. Default 4000
set undofile                      " Set persistent undo
set numberwidth=2                 " Width of number column. Default 4. Larger if necessary
set nowrap                        " Too large line is not wrapped
set matchtime=4                   " For how long is match shown?
set spelllang=en_gb,da            " Spell check UK English and Danish
set textwidth=80                  " Used by colour column
set colorcolumn=+1                " Show column at text width +1

let maplocalleader = ","          " Set leader keys used by eg. vimtex
let mapleader = ","

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'vim-airline/vim-airline'    " Bottom airline
Plug 'unblevable/quick-scope'     " Highlight unique characters for f/F
Plug 'tpope/vim-commentary'       " Smart commenting
Plug 'tpope/vim-surround'         " Change surrounding characters
Plug 'dracula/vim'                " Colour scheme
Plug 'neovim/nvim-lspconfig'      " NeoVim LSP plugin
Plug 'hrsh7th/cmp-nvim-lsp'       " LSP plugin for cmp
Plug 'hrsh7th/cmp-buffer'         " Buffer plugin for cmp
Plug 'hrsh7th/cmp-path'           " Path plugin for cmp
Plug 'hrsh7th/nvim-cmp'           " cmp: completion plugin
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " UltiSnips plugin for cmp
Plug 'sirver/UltiSnips'           " Add support for snippets
Plug 'nvim-treesitter/nvim-treesitter' " Tree sitter plugin
Plug 'lervag/vimtex'              " Used to compile and edit LaTeX
Plug 'kosayoda/nvim-lightbulb'    " Show lightbulb when context action available
Plug 'weilbith/nvim-code-action-menu' " Show menu for code actions
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'      " Auto-pairing of \")[ etc
Plug 'chentoast/marks.nvim'         " Better marks usage
Plug 'nvim-telescope/telescope.nvim'  " Telescope
Plug 'fhill2/telescope-ultisnips.nvim' " Telescope ultisnips
Plug 'nvim-lua/plenary.nvim'      " Needed for telescope
Plug 'kyazdani42/nvim-web-devicons'   " Adds coloured icons
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } " Adds bufferline
Plug 'github/copilot.vim'         " Github Copilot
Plug 'kyazdani42/nvim-tree.lua'   " File tree plugin
Plug 'sudormrfbin/cheatsheet.nvim' " Cheatsheet in Telescope
Plug 'lewis6991/gitsigns.nvim'    " Show markers for git (added, modified etc)
Plug 'onsails/lspkind.nvim'       " Show symbols in cmp-list
Plug 'folke/which-key.nvim'       " Help with keybindings

call plug#end()

" Change copilot from tab
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Execute below as lua. Enables python LSP server
lua << EOF
-- require'lspconfig'.pyright.setup{}
--require'nvim-treesitter.configs'.setup {
--  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--  highlight = {
--    enable = true,              -- false will disable the whole extension
--	disable = {"vim"},
--  },
-- }
--
local opts = { noremap=true, silent=true }
-- LSP key bindings
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'm', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- Telescope key bindings
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>c', '<cmd>Telescope treesitter<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>t', '<cmd>Telescope<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>j', '<cmd>Telescope jumplist<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>u', '<cmd>Telescope ultisnips<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>s', '<cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>m', '<cmd>Telescope marks<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>Telescope quickfix<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>w', '<cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>?', '<cmd>Cheatsheet<CR>', opts)

-- NvimTree key bindings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFocus<CR>', opts)

-- lsp_signature
vim.opt.termguicolors = true
require('bufferline').setup{}
cfg = {}
require "lsp_signature".setup(cfg)

require('nvim-autopairs').setup{}
require('marks').setup{}
require('bufferline').setup{}
require('telescope').load_extension('ultisnips')
require('nvim-tree').setup{}
require('gitsigns').setup{}
require('which-key').setup{}
EOF

:colorscheme dracula              " Set colour scheme to Dracula

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit = 'vertical'
" VimTex
let g:vimtex_view_method = 'zathura'
map <leader>c :VimtexCompile<CR>
map <leader>lv :VimtexView<CR>
" bufferline
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent><space>be :BufferLineSortByExtension<CR>
nnoremap <silent><space>bd :BufferLineSortByDirectory<CR>
nnoremap <silent>[B :BufferLineMovePrev<CR>
nnoremap <silent>]B :BufferLineMoveNext<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
" abbreviations
cnoreabbrev showwhitespace highlight ExtraWhitespace ctermbg=red guibg=red|match ExtraWhitespace /\s\+$/
cnoreabbrev hidewhitespace hi clear ExtraWhitespace

luafile ~/.config/nvim/lua/nvim-cmp.lua
luafile ~/.config/nvim/Telescope/init.lua

" Auto install plugin manager if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -flo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync
endif

" Auto run PlugInstall
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
	\| endif

" If document is markdown, convert to pdf
autocmd BufWritePost *.md silent !$HOME/.config/nvim/markdown/savepdf.sh "%:p"
autocmd BufEnter *.md silent set spell
