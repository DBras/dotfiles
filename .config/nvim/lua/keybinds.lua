
------------------------------------------------------------------------
-- Setup of all key bindings -------------------------------------------
------------------------------------------------------------------------

local s_n = { noremap=true, silent=true }

local function k(map, opts)
	vim.api.nvim_set_keymap(map[1], map[2], map[3], opts)
end

-- LSP key bindings
----------------------------------------------
k({'n', '<leader>d'  , '<cmd>lua vim.lsp.buf.definition()<CR>'}        , s_n)
k({'n', '<leader>D'  , '<cmd>lua vim.lsp.buf.declaration()<CR>'}       , s_n)
k({'n', '<leader>rr' , '<cmd>lua vim.lsp.buf.references()<CR>'}        , s_n)
k({'n', '<leader>i'  , '<cmd>lua vim.lsp.buf.implementation()<CR>'}    , s_n)
k({'n', 'm'          , '<cmd>lua vim.lsp.buf.hover()<CR>'}             , s_n)
k({'i', '<C-k>'      , '<cmd>lua vim.lsp.buf.signature_help()<CR>'}    , s_n)
k({'n', '<leader>e'  , '<cmd>lua vim.diagnostic.open_float()<CR>'}     , s_n)
k({'n', '<leader>rn' , '<cmd>lua vim.lsp.buf.rename()<CR>'}            , s_n)

-- Telescope key bindings
----------------------------------------------
k({'n', '<space>f'   , '<cmd>Telescope find_files<CR>'}                , s_n)
k({'n', '<space>c'   , '<cmd>Telescope treesitter<CR>'}                , s_n)
k({'n', '<space>t'   , '<cmd>Telescope<CR>'}                           , s_n)
k({'n', '<space>b'   , '<cmd>Telescope jumplist<CR>'}                  , s_n)
k({'n', '<space>u'   , '<cmd>Telescope ultisnips<CR>'}                 , s_n)
k({'n', '<space>s'   , '<cmd>Telescope live_grep<CR>'}                 , s_n)
k({'n', '<space>m'   , '<cmd>Telescope marks<CR>'}                     , s_n)
k({'n', '<space>q'   , '<cmd>Telescope quickfix<CR>'}                  , s_n)
k({'n', '<space>w'   , '<cmd>Telescope buffers<CR>'}                   , s_n)
k({'n', '<space>o'   , '<cmd>Telescope heading<CR>'}                   , s_n)
k({'n', '<space>p'   , '<cmd>lua MiniSessions.select()<CR>'}           , s_n)
k({'n', '<leader>ps' , '<cmd>lua MiniSessionsHelper.save()<CR>'}       , s_n)
k({'n', '<leader>pd' , '<cmd>lua MiniSessionsHelper.delete()<CR>'}     , s_n)
k({'n', '<space>?'   , '<cmd>Cheatsheet<CR>'}                          , s_n)
k({'i', '<C-b>b'     , '<cmd>Telescope bibtex<CR>'}                    , s_n)
k({'i', '<C-b>f'     , [[<Cmd>lua test_grep_filename()<CR>]]}          , s_n)
k({'v', '<C-b>f'     , [[<Cmd>lua test_grep_filename()<CR>]]}          , s_n)

-- NvimTree key bindings
----------------------------------------------
-- k({'n', '<C-n>'      , '<cmd>NvimTreeToggle<CR>'}                      , s_n)
-- k({'n', '<C-f>'      , '<cmd>NvimTreeFocus<CR>'}                       , s_n)
k({'n', '<C-f>'      , '<cmd>Neotree action=focus<CR>'}                , s_n)
k({'n', '<C-n>'      , '<cmd>Neotree toggle<CR>'}                      , s_n)

-- Bufferline
----------------------------------------------
k({'n', '<C-h>'      , '<cmd>BufferLineCyclePrev<CR>'}                 , s_n)
k({'n', '<C-l>'      , '<cmd>BufferLineCycleNext<CR>'}                 , s_n)
k({'n', '<leader>be' , '<cmd>BufferLineSortByExtension<CR>'}           , s_n)
k({'n', '<leader>bd' , '<cmd>BufferLineSortByDirectory<CR>'}           , s_n)
k({'n', '<leader>bh' , '<cmd>BufferLineMovePrev<CR>'}                  , s_n)
k({'n', '<leader>bl' , '<cmd>BufferLineMoveNext<CR>'}                  , s_n)
k({'n', '<space>h'   , '<cmd>wincmd h<CR>'}                            , s_n)
k({'n', '<space>j'   , '<cmd>wincmd j<CR>'}                            , s_n)
k({'n', '<space>k'   , '<cmd>wincmd k<CR>'}                            , s_n)
k({'n', '<space>l'   , '<cmd>wincmd l<CR>'}                            , s_n)

-- Neorg
----------------------------------------------
k({'n', '<leader>ww' , '<cmd>Neorg workspace '}                        , s_n)
k({'n', '<leader>wi' , '<cmd>Neorg index<CR>'}                         , s_n)
k({'n', '<leader>wo' , '<cmd>Neorg toc<CR> '}                          , s_n)
k({'n', '<leader>wh' , '<cmd>Neorg toggle-concealer<CR> '}             , s_n)
k({'n', '<leader>wmd', '<cmd>Neorg mode norg<CR> '}                    , s_n)
k({'n', '<leader>wmh', '<cmd>Neorg mode traverse-heading<CR> '}        , s_n)

-- Vimtex
----------------------------------------------
k({'n', '<leader>c'  , '<cmd>VimtexCompile<CR>'}                       , {})
k({'n', '<leader>lv' , '<cmd>VimtexView<CR>'}                          , {})
k({'n', '<leader>wc' , '<cmd>VimtexCountWords!<CR>'}                   , {})
k({'n', '<leader>to' , '<cmd>VimtexTocOpen<CR>'}                       , {})
k({'n', '<leader>ts' , '<cmd>TSToggle highlight<CR>'}                  , {})

-- TableMode
----------------------------------------------
k({'n', '<leader>th' , '<cmd>s/-/=/g<CR>:noh<CR>'}                     , s_n)

-- Mini
----------------------------------------------
k({'n', '<leader>mm' , '<cmd>lua MiniMap.toggle()<CR>'}                , s_n)
k({'n', '<leader>mf' , '<cmd>lua MiniMap.toggle_focus()<CR>'}          , s_n)

-- Miscellaneous
----------------------------------------------

k({'n', '<leader>h' , '<cmd>noh<CR>'}                                  , s_n)
