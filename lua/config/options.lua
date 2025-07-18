local M = {}

function M.setup()
  local opt = vim.opt

  opt.relativenumber = true
  opt.number = true
  opt.tabstop = 4
  opt.shiftwidth = 4
  opt.expandtab = false
  opt.autoindent = false
  opt.wrap = false
  opt.ignorecase = true
  opt.smartcase = true
  opt.cursorline = true
  opt.termguicolors = true
  opt.background = "dark"
  opt.signcolumn = "yes"
  opt.backspace = { "indent", "eol", "start" }
  opt.clipboard:append("unnamedplus")
  opt.splitright = true
  opt.splitbelow = true
  opt.iskeyword:append("-")
end

return M

