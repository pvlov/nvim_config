local header = require("plugins.asciiart.bee")

-- The lazy.nvim plugin specification
return {
	"goolord/alpha-nvim",
	lazy = false,
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Define the new buttons
		local buttons = {
			type = "group",
			val = {
				dashboard.button("f", "  Search in Files", ":Telescope live_grep<CR>"),
				dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
				dashboard.button("n", "  New File", ":enew<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			},
			opts = {
				spacing = 1,
				position = "center",
			},
		}

		-- Setup alpha with your custom layout
		alpha.setup({
			opts = {
				noautocmd = true,
			},
			layout = {
				{ type = "padding", val = 2 },
				header,
				{ type = "padding", val = 2 },
				buttons,
			},
		})
	end,
}
