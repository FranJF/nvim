return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true }, -- Manejo eficiente de archivos gigantes
		dashboard = { enabled = true }, -- Pantalla de inicio moderna
		explorer = { enabled = true }, -- Explorador de archivos integrado
		input = { enabled = true }, -- Inputs de Neovim más estéticos
		gh = { enabled = true }, -- Integración con GitHub
		notifier = { enabled = true }, -- Notificaciones flotantes estilo toast
		statuscolumn = { enabled = true }, -- Números de línea y signos mejorados
		words = { enabled = true }, -- Resalta la palabra bajo el cursor
		zen = {
			toggles = {
				enabled = true,
				center = true,
				dim = false,
			},
			show = {
				statusline = true,
				tabline = false,
			},
		},
		styles = {
			zen = {
				backdrop = {
					transparent = false,
					wo = { winhighlight = "Normal:Normal,NormalFloat:Normal" },
				},
			},
			explorer = {
				border = "rounded",
				wo = {
					winhighlight = "Normal:Normal,NormalNC:Normal",
				},
			},
		},

		-- Disabled modules
		lazygit = { enabled = false },
		terminal = { enabled = false },
		win = { enabled = false },
		dim = { enabled = false },
		image = { enabled = false },
		profiler = { enabled = false },
		picker = { enabled = false },
	},
}
