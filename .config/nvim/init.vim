" set encoding=utf-8                " File encoding
" set number relativenumber         " Show numbers and make them relative
" syntax enable                     " Enable syntax highlighting
" set breakindent                   " Line breaking auto indents
" set swapfile                      " Editing creates a swap file
" set scrolloff=9                   " How far to top / bottom of screen before scrolling?
" set backspace=indent,eol,start    " Allow backspacing over indent, to join lines & before start of insert
" set tabstop=4                     " How many spaces is tab displayed as?
" set softtabstop=4                 " How many spaces is tab key?
" set shiftwidth=4                  " << and >> shift by 4
" set smartindent                   " Smarter indenting (works best for C)
" set autoindent                    " Auto indent when helpful
" set noexpandtab                   " Tabs are not expanded to spaces
" set smartcase                     " When searching, case sensitive if upper case is used
" set mouse=a                       " Enable mouse actions
" set foldmethod=indent             " Indenting can fold
" set foldlevel=9                   " Default fold level
" set pumheight=7                   " Pop-up menu height
" set updatetime=300                " How often to write to buffer. Default 4000
" set undofile                      " Set persistent undo
" set numberwidth=2                 " Width of number column. Default 4. Larger if necessary
" set nowrap                        " Too large line is not wrapped
" set matchtime=4                   " For how long is match shown?
" set spelllang=en_gb,da            " Spell check UK English and Danish
" set textwidth=80                  " Used by colour column
" set colorcolumn=+1                " Show column at text width +1
syntax enable
" let maplocalleader = ","          " Set leader keys used by eg. vimtex
" let mapleader = ","

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'  " Status line
Plug 'unblevable/quick-scope'     " Highlight unique characters for f/F
Plug 'dracula/vim'                " Colour scheme
Plug 'Alexis12119/nightly.nvim'
Plug 'Everblush/nvim'
Plug 'neovim/nvim-lspconfig'      " NeoVim LSP plugin
Plug 'nvim-treesitter/nvim-treesitter' " Tree sitter plugin
Plug 'lervag/vimtex'              " Used to compile and edit LaTeX
Plug 'kosayoda/nvim-lightbulb'    " Show lightbulb when context action available
Plug 'weilbith/nvim-code-action-menu' " Show menu for code actions
Plug 'ray-x/lsp_signature.nvim'
Plug 'chentoast/marks.nvim'         " Better marks usage
Plug 'nvim-telescope/telescope.nvim'  " Telescope
Plug 'fhill2/telescope-ultisnips.nvim' " Telescope ultisnips
Plug 'nvim-telescope/telescope-bibtex.nvim' " Telescope bibtex extension
Plug 'crispgm/telescope-heading.nvim' " Telescope with document headings
Plug 'kyazdani42/nvim-web-devicons'   " Adds coloured icons
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } " Adds bufferline
Plug 'github/copilot.vim'         " Github Copilot
Plug 'MunifTanjim/nui.nvim'         " File tree dependency
Plug 'nvim-neo-tree/neo-tree.nvim'   " File tree plugin
" Plug 'kyazdani42/nvim-tree.lua'   " File tree plugin
Plug 'sudormrfbin/cheatsheet.nvim' " Cheatsheet in Telescope
Plug 'lewis6991/gitsigns.nvim'    " Show markers for git (added, modified etc)
Plug 'onsails/lspkind.nvim'       " Show symbols in cmp-list
Plug 'folke/which-key.nvim'       " Help with keybindings
Plug 'dhruvasagar/vim-table-mode'
Plug 'nvim-neorg/neorg', { 'tag': 'v4.4.0' }
Plug 'AckslD/muren.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'       " LSP plugin for cmp
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-buffer'         " Buffer plugin for cmp
Plug 'hrsh7th/cmp-path'           " Path plugin for cmp
Plug 'hrsh7th/nvim-cmp'           " cmp: completion plugin
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " UltiSnips plugin for cmp
Plug 'sirver/UltiSnips'           " Add support for snippets
Plug 'echasnovski/mini.nvim'	  " Collection of small plugins
Plug 'stevearc/dressing.nvim' 
Plug 'projekt0n/github-nvim-theme'
Plug 'j-hui/fidget.nvim'

call plug#end()

" Change copilot from tab
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" Execute block as Lua
lua << EOF
require('nightly').setup{
	transparent = false,
	highlights = {
		Comment  = {fg = "#778588", italic = true},
		ColorColumn = {bg = "#2E3440"},
		--Comment  = {fg = "#FF0000", italic = true},
	},
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", 
  highlight = {
    enable = true,
	disable = {"vim"},
  },
 }
--
function _G.test_grep_filename()
  local opts = {
    prompt_title= "~ Backlink ~",
    shorten_path = false,
	find_command = {"rg", "--files", "-g", "!build/", "-g", "!DTU-eps-converted-to.pdf"},
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        -- filename is available at entry[1]
        local entry = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        local filename = entry[1]
        -- Insert filename in current cursor position
        vim.cmd('normal i' .. filename)
      end
      )
      return true
    end,
  }
  require('telescope.builtin').find_files(opts)
end

require('options')
require('keybinds')
require('bufferline').setup{}
require "lsp_signature".setup{}
require('marks').setup{}
require('bufferline').setup{}
-- require('nvim-tree').setup{}
require('gitsigns').setup{}
require('which-key').setup{}
require('lualine').setup{}
require('muren').setup{
	keys = {
		do_replace = '<S-q>'
		}
}
require('fidget').setup{}
require('telescope-init')
require('neo-tree-config')
require('neorg-config')
require('nvim-cmp')
require('lsp')
require('mini')
EOF

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
autocmd BufEnter *.md silent let b:table_mode_corner='+'
autocmd BufEnter *.md silent let b:table_mode_corner_corner='+'
" autocmd BufEnter *.html 
" 			\ silent set tabstop=2
" 			\ | silent set softtabstop=2
" 			\ | silent set shiftwidth=2
" 			\ | silent set expandtab
