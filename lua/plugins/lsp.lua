return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
				keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
				keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
				keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
				keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
				keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
				keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
				keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
				keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
				keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "💡",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
			})

			local servers = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"grammarly",
				"jdtls",
				"rust_analyzer",
				"ltex",
				"hls",
				"cmake",
				"clangd",
				"dockerls",
				"gopls",
				"docker_compose_language_service",
				"sqls",
				"fortls",
				"elixirls",
				"pylsp",
			}

			for _, server_name in ipairs(servers) do
				local server_opts = {
					on_attach = on_attach,
					capabilities = capabilities,
				}
				if server_name == "lua_ls" then
					server_opts.settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					}
					-- TODO: Replace me with pyright and adjust settings until it works nicely with uv.
				elseif server_name == "pylsp" then
					server_opts.settings = {
						pylsp = {
							plugins = {
								pycodestyle = { maxLineLength = 120 },
								jedi_completion = { enabled = true },
								pyflakes = { enabled = true },
								pylsp_memcached = { enabled = true },
								pylsp_rope = { enabled = true },
							},
						},
					}
				end
				lspconfig[server_name].setup(server_opts)
			end
		end,
	},

	-- SEPARATED PLUGIN STRUCTURE TO PREVENT RACE CONDITIONS
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"emmet_ls",
					"grammarly",
					"jdtls",
					"rust_analyzer",
					"ltex",
					"hls",
					"cmake",
					"clangd",
					"dockerls",
					"gopls",
					"docker_compose_language_service",
					"sqls",
					"fortls",
					"elixirls",
					"pylsp",
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"google-java-format",
					"clang-format",
					"gofumpt",
					"ruff",
					"sqlfluff",
					"vacuum",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = { "jay-babu/mason-null-ls.nvim", "nvimtools/none-ls-extras.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					formatting.prettier,
					formatting.stylua,
					formatting.clang_format,
					formatting.gofumpt,
					-- TODO fix me pls
					-- formatting.ruff,
					formatting.sqlfluff,
					diagnostics.vacuum,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			require("luasnip/loaders/from_vscode").lazy_load()
			vim.opt.completeopt = "menu,menuone,noselect"

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup({
				scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
				definition = {
					edit = "<CR>",
				},
				ui = {
					colors = {
						normal_bg = "#022746",
					},
				},
			})
		end,
	},
}
