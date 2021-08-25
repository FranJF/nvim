vim.g.mapleader = " "

require "franjf.plugins"
require "franjf.todo"
require "franjf.lualine"
require "franjf.lsp"
require "franjf.treesitter"
require "franjf.telescope"
require "franjf.dashboard"
require "franjf.cmp"
require "franjf.icons"
require "franjf.mappings".mappings()
require "franjf.settings".settings()

vim.cmd([[
    augroup ColorsComments
        autocmd!
        autocmd Syntax * syntax keyword AsteriskMarker * containedin=.*Comment,vimCommentTitle,cCommentL
        autocmd ColorScheme * hi AsteriskMarker guibg=Green
    augroup END
]])

vim.cmd([[
    augroup ChangeBackgroudColour
        autocmd!
        autocmd ColorScheme * hi Normal guibg=none
        autocmd ColorScheme * hi ColorColumn ctermbg=0 guibg=none
        autocmd ColorScheme * hi LineNr guifg=#5eacd3
        autocmd ColorScheme * hi netrwDir guifg=#5eacd3
        autocmd ColorScheme * hi qfFileName guifg=#aed75f
        autocmd ColorScheme * hi TelescopeBorder guifg=#5eacd
        autocmd ColorScheme * hi SignColumn guibg=none
        autocmd ColorScheme * hi CursorLineNR guibg=none
    augroup END
]])

--********* que pasa aqui
-- * que pasa aqui


vim.o.termguicolors = true
