return {
	"mistweaverco/kulala.nvim",
	ft = { "http", "rest" },
	keys = {
		{ "<leader>rs", function() require("kulala").run() end, desc = "Send request", ft = { "http", "rest" } },
		{ "<leader>ra", function() require("kulala").run_all() end, desc = "Send all requests", ft = { "http", "rest" } },
		{ "<leader>rb", function() require("kulala").scratchpad() end, desc = "Open scratchpad" },
	},
	opts = {
		global_keymaps = false,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
	},
}
