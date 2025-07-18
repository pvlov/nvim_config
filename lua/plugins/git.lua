return {
  {
    'tpope/vim-fugitive',
    config = function()
  	end,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require('git-conflict').setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        highlights = {
          incoming = 'DiffAdd',
          current = 'DiffText',
        }
      })
    end,
  },
  {
	'lewis6991/gitsigns.nvim',
  },
}
