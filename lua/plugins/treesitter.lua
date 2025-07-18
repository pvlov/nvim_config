return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "java",
      "c",
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
    },

    sync_install = false,

    auto_install = true,

    highlight = {
      enable = true,
    },
    indent = { enable = true },
    autotag = {
      enable = true,
    },
  },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
}
