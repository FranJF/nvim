local rose = require("rose-pine.palette")
local bg = "#050506"

-- Snacks Zen backdrop
vim.api.nvim_create_autocmd("WinNew", {
	callback = function()
		vim.schedule(function()
			vim.api.nvim_set_hl(0, "SnacksBackdrop_020202", { bg = "#050506" })
		end)
	end,
})

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bg, fg = rose.text })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = bg, fg = rose.muted })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bg, fg = rose.text })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = bg, fg = rose.muted })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = rose.foam, fg = bg, bold = true })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = rose.iris, fg = bg, bold = true })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = bg, fg = rose.muted })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bg, fg = rose.text })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = bg, fg = rose.muted })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = bg, fg = bg })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = rose.highlight_med, fg = rose.text })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = rose.foam, bold = true })
