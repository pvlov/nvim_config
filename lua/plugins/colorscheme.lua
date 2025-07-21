-- return {
-- 	{
-- 	"EdenEast/nightfox.nvim",
--   name = "nightfox",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme duskfox")
--   end,
--   },
-- }
--
-- return {
-- 	"sainnhe/gruvbox-material",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		-- vim.g.gruvbox_material_enable_italic = true
-- 		vim.g.gruvbox_material_foreground = "original"
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }

return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruvbox")
	end,
	opts = {},
}
