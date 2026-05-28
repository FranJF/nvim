return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				borderchars = {
					prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
				file_ignore_patterns = {
					"%.json",
					"node_modules",
					".git/",
					"target/",
					"%.lock",
					"%.jpg",
					"%.png",
					"%.svg",
					"%.mp4",
					"%.mp3",
					"%.webp",
					"%.min.",
					"%.ico",
					"CACHE",
					"%.bin",
					"migrations",
				},
				mappings = {
					i = {
						-- ["<C-q>"] = actions.send_to_qflist + actions.close,
						["<C-q>"] = actions.smart_send_to_qflist,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						--["<C-q>"] = actions.smart_send_to_qflist,
					},
					n = {
						-- ["<C-q>"] = actions.send_to_qflist + actions.close,
						["<C-q>"] = actions.smart_send_to_qflist,
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>ft", builtin.grep_string, { desc = "Telescope grep string" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix" })
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols, {})
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
		vim.keymap.set("n", "<leader>tt", ":TodoTelescope<cr>", {})
		-- vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
		--vim.keymap.set("n", "<leader>tc", builtin.colorscheme, {})
		--vim.keymap.set("n", "<leader>gl", builtin.git_commits, {})
		--vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
		-- vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics bufnr=0<cr>", {})
	end,
}
