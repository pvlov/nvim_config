return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle symbol outline" },
	},
	opts = {
		backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		layout = {
			default_direction = "prefer_right",
			min_width = 20,
		},
		attach_mode = "window",
	},
}
