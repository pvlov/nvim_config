local status, _ = pcall(vim.cmd, "colorscheme duskfox")
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
	print("Colorscheme not found!")
	return
end
