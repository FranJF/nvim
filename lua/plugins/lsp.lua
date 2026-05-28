return {
	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = { "pylsp", "ruff", "stylua", "lua-language-server", "prettierd" } },
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { auto_install = true },
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("pylsp", {})
			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						organizeImports = false,
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			vim.lsp.enable("pylsp")
			vim.lsp.enable("ruff")
			vim.lsp.enable("lua_ls")

			-- Teclas de acceso rápido (LSP)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Información" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Ir a definición" })
			vim.keymap.set("n", "<leader>o", vim.lsp.buf.hover, { desc = "LSP: Información" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Acciones" })
			-- vim.keymap.set("n", "<leader>tr", vim.lsp.buf.references, { desc = "LSP: Referencias" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Renombrar" })
			vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, { desc = "LSP: Siguiente diagnóstico" })
		end,
	},
}
