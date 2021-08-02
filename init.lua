vim.g.mapleader = " "

require "franjf.plugins"
require "franjf.todo"
require "franjf.lualine"
require "franjf.lsp"
require "franjf.treesitter"
require "franjf.telescope"
require "franjf.dashboard"
require "franjf.compe"
require "franjf.icons"
require "franjf.mappings".mappings()
require "franjf.settings".settings()

vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi Normal guibg=None
        autocmd colorscheme * :hi ColorColumn ctermbg=0 guibg=grey
        autocmd colorscheme * :hi LineNr guifg=#5eacd3
        autocmd colorscheme * :hi netrwDir guifg=#5eacd3
        autocmd colorscheme * :hi qfFileName guifg=#aed75f
        autocmd colorscheme * :hi TelescopeBorder guifg=#5eacd
        autocmd colorscheme * :hi SignColumn guibg=none
        autocmd colorscheme * :hi CursorLineNR guibg=None
    augroup END
]])
vim.o.termguicolors = true