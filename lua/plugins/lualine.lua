local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"rose-pine/neovim",
	},

	config = function()
		local rose = require("rose-pine.palette")

		local bubbles_theme = {
			normal = {
				a = {
					fg = rose.base,
					bg = rose.foam,
					gui = "bold",
				},
				b = {
					fg = rose.subtle,
					bg = rose.base,
				},
				c = {
					fg = rose.subtle,
					bg = rose.base,
				},
			},

			insert = {
				a = {
					fg = rose.base,
					bg = rose.iris,
					gui = "bold",
				},
			},

			visual = {
				a = {
					fg = rose.base,
					bg = rose.rose,
					gui = "bold",
				},
			},

			replace = {
				a = {
					fg = rose.base,
					bg = rose.love,
					gui = "bold",
				},
			},

			command = {
				a = {
					fg = rose.base,
					bg = rose.gold,
					gui = "bold",
				},
			},

			inactive = {
				a = {
					fg = rose.muted,
					bg = rose.base,
				},
				b = {
					fg = rose.muted,
					bg = rose.base,
				},
				c = {
					fg = rose.subtle,
					bg = rose.base,
				},
			},
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "",
				section_separators = {
					left = "",
					right = "",
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "" },
						right_padding = 2,
					},
				},

				lualine_b = {
					"filename",
					"branch",
				},

				lualine_c = {
					"%=",
				},

				lualine_x = {},

				lualine_y = {
					"filetype",
					"progress",
				},

				lualine_z = {
					{
						"location",
						separator = { right = "" },
						left_padding = 2,
					},
				},
			},

			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
