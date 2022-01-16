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
set clipboard+=unnamedplus        " Copy to system clipboard
set mouse=a                       " Enable mouse actions
set foldmethod=indent             " Indenting can fold
set foldlevel=9                   " Default fold level
set pumheight=7                   " Pop-up menu height
set updatetime=300                " How often to write to buffer. Default 4000
set undofile                      " Set persistent undo
set numberwidth=2                 " Width of number column. Default 4. Larger if necessary
set nowrap                        " Too large line is not wrapped
set showmatch                     " Show matching parenthesis when adding
set matchtime=4                   " For how long is match shown?
set spell                         " Enable spell checking
set spelllang=en_gb,da            " Spell check UK English and Danish
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'vim-airline/vim-airline'    " Bottom airline
Plug 'unblevable/quick-scope'     " Highlight unique characters for f/F
Plug 'tpope/vim-commentary'       " Smart commenting
Plug 'tpope/vim-surround'         " Change surrounding characters
Plug 'preservim/nerdtree'         " File tree
Plug 'dracula/vim'                " Colour scheme
Plug 'preservim/tagbar'           " Use ctags to display overview of tags
Plug 'neovim/nvim-lspconfig'      " NeoVim LSP plugin
Plug 'hrsh7th/nvim-compe'         " Plugin for LSP autocomplete
Plug 'sirver/UltiSnips'

call plug#end()

" Execute below as lua. Enables python LSP server
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

:colorscheme dracula              " Set colour scheme to Dracula

" NerdTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
" LSP 
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> m <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit= "vertical"


nmap <F8> :TagbarToggle<CR>

" Source lua file with compe config
luafile ~/.config/nvim/lua/compe-config.lua

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
:autocmd BufWritePost *.md silent !$HOME/.config/nvim/markdown/savepdf.sh %:p
