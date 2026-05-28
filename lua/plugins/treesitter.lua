return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { max_lines = 3 },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		config = function()
			-- Registrar el grammar custom de kulala antes del setup,
			-- porque kulala es lazy (ft) y todavía no lo registró.
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.kulala_http = {
				install_info = {
					url = "https://github.com/mistweaverco/kulala.nvim",
					location = "lua/tree-sitter",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "http",
			}

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"html",
					"javascript",
					"json",
					"kulala_http",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
					"go",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true, disable = { "python" } },
			})
		end,
	},
}
