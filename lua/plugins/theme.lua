return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					bold = true,
					italic = false,
				},
				palette = {
					moon = {
						base = "#050506",
						-- base = "#07070d",
						--base = "#040408",
					},
				},
				highlight_groups = {
					NormalFloat = { bg = "base" },
					FloatBorder = { bg = "base" },
				},
			})

			vim.cmd("colorscheme rose-pine")

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					require("core.highlights")
				end,
			})
			require("core.highlights")
		end,
	},
}
