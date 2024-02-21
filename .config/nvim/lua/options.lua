
------------------------------------------------------------------------
-- set and let options -------------------------------------------------
------------------------------------------------------------------------

vim.cmd.colorscheme('github_dark_dimmed')

-- Equivalent to :set
----------------------------------------------
vim.opt.encoding = 'utf-8'						 -- 
vim.opt.number = true                            -- Number column
vim.opt.relativenumber = true                    -- 
vim.opt.breakindent = true                       -- 
vim.opt.swapfile = true                          -- 
vim.opt.scrolloff = 9                            -- Distance to bottom/top
vim.opt.backspace = { 'indent', 'eol', 'start' } --   before scrolling
vim.opt.tabstop = 4                              -- 
vim.opt.softtabstop = 4                          -- 
vim.opt.shiftwidth = 4                           -- 
vim.opt.smartindent = true                       -- 
vim.opt.autoindent = true                        -- 
vim.opt.expandtab = false                        -- Tabs are tabs
vim.opt.smartcase = true                         -- 
vim.opt.mouse = 'a'                              -- 
vim.opt.foldmethod = 'indent'                    -- 
vim.opt.foldlevel = 9                            -- PopUpMenu
vim.opt.pumheight = 7                            -- 
vim.opt.updatetime = 300                         -- 
vim.opt.undofile = true                          -- Persistent undo
vim.opt.numberwidth = 2                          -- 
vim.opt.wrap = false                             -- Don't wrap long lines
vim.opt.matchtime = 4                            -- Matching paren
vim.opt.spelllang = { 'en_gb', 'da' }            -- 
vim.opt.textwidth = 80                           -- 
vim.opt.colorcolumn = '+1'                       -- 
vim.opt.conceallevel = 2						 -- 0-3, see :h conceallevel
vim.opt.termguicolors = true                     -- Accurate colors

-- Equivalent to :let g:
----------------------------------------------
vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.g.UltiSnipsExpandTrigger = '<C-Space>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-j>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-k>'
vim.g.UltiSnipsEditSplit = 'vertical'

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {build_dir = 'build'}
vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_toc_config = {
	name = 'TOC',
	layers= {'content', 'todo', 'include'},
	resize=1,
	split_width=50,
	todo_sorted=0,
	show_help=0,
	show_numbers=1,
	mode=2
}
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_ignore_filters = {}
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2

vim.g.copilot_filetypes = {
	latex = false,
	tex = false,
	markdown = false,
	norg = false,
}
vim.g.copilot_no_tab_map = true

vim.g.table_mode_corner = '+'

vim.api.nvim_create_autocmd({'BufEnter'}, {
	pattern = '*.html',
	command = [[ silent set tabstop=2 |silent set softtabstop=2 |silent set shiftwidth=2 |silent set expandtab ]],
})
