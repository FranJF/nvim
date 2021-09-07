local M = {}
local opt = vim.opt
local g = vim.g

function M.settings()
    M.options()
    M.window_options()
    M.globals()
    M.colors()
    M.doge_doc()
end

function M.options()
    opt.encoding       = 'utf-8'
    opt.hidden         = true
    opt.showmatch      = true
    opt.smartcase      = true
    opt.termguicolors  = true
    opt.visualbell     = true
    opt.swapfile       = false
    opt.backup         = false
    opt.signcolumn     = 'no'
    opt.autoread       = true
    opt.scrolloff      = 8
    opt.updatetime     = 50
    opt.showbreak      = '↳'
    opt.path:append    {"**"}
    -- Tab
    opt.expandtab      = true
    opt.smartindent    = true
    opt.smarttab       = true
    opt.softtabstop    = 4
    opt.tabstop        = 4
    opt.shiftwidth     = 4
    -- Search
    opt.hlsearch       = false
    opt.incsearch      = true
    -- New
    opt.splitright     = true
    opt.wildmode       = "full"
    opt.diffopt        = 'filler,internal,algorithm:histogram,indent-heuristic'
    opt.completeopt    = 'menuone,noinsert,noselect'
    -- opt.netrw_banner   = 0
    -- opt.virtualedit    = 'block'
    -- Testing
end

function M.window_options()
    -- opt.breakindent = true
    opt.linebreak = true
    opt.number = true
    opt.relativenumber = true
    opt.wrap = true
end

function M.globals()
    g.netrw_banner  = 0
end

function M.colors()
    g.colors_name    = "gruvbox"
    -- g.gruvqueen_style = "original"
end

function M.doge_doc()
    g.doge_doc_standard_python  = "google"
end


return M
