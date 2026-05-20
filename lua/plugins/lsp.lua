return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "williamboman/mason.nvim" },
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
				callback = function(ev)
					local opts = { noremap = true, silent = true, buffer = ev.buf }
					local map = vim.keymap.set
					map("n", "gf", "<cmd>Telescope lsp_references<CR>", opts)
					map("n", "gD", vim.lsp.buf.declaration, opts)
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>D", vim.diagnostic.open_float, opts)
					map("n", "<leader>d", function()
						vim.diagnostic.open_float({ scope = "cursor" })
					end, opts)
					map("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, opts)
					map("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
				end,
			})

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "💡",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
				virtual_text = true,
			})

			vim.lsp.enable({
				"lua_ls",
				"pyrefly",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"rust_analyzer",
				"cmake",
				"clangd",
				"dockerls",
				"gopls",
				"docker_compose_language_service",
				"sqls",
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()

			local ensure_installed = {
				-- LSP servers
				"lua-language-server",
				"pyrefly",
				"typescript-language-server",
				"html-lsp",
				"css-lsp",
				"tailwindcss-language-server",
				"emmet-language-server",
				"cmake-language-server",
				"clangd",
				"dockerfile-language-server",
				"gopls",
				"docker-compose-language-service",
				"sqls",
				-- Formatters
				"prettier",
				"stylua",
				"clang-format",
				"gofumpt",
				"ruff",
				"sqlfluff",
				-- Linters
				"vacuum",
			}

			local registry = require("mason-registry")
			registry.refresh(function()
				for _, name in ipairs(ensure_installed) do
					local ok, pkg = pcall(registry.get_package, name)
					if ok and not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
		end,
	},
}
