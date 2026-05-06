return {
	"christoomey/vim-tmux-navigator",
	lazy = false, -- This needs to load immediately to catch the keybindings
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Window Left" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Window Down" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Window Up" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window Right" },
	},
}
