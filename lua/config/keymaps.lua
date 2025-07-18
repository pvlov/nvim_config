-- ~/.config/nvim/lua/config/keymaps.lua
local M = {}

function M.setup()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Leader
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Telescope: find-related
  map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)       -- Find files in cwd
  map("n", "<leader><leader>", "<cmd>Telescope live_grep<cr>", opts)        -- Search string in cwd
  map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts)      -- Search string under cursor
  map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)          -- List open buffers
  map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)        -- Help tags

  -- Telescope: git-related
  map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)      -- Git commits
  map("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opts)    -- Git file commits
  map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)     -- Git branches
  map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)       -- Git status
end

return M

