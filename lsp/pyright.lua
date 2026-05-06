---@type vim.lsp.Config
return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
	before_init = function(params, config)
		local root = params.rootPath or vim.uri_to_fname(params.rootUri)
		local venv_python = root .. "/.venv/bin/python"
		if vim.fn.filereadable(venv_python) == 1 then
			config.settings.python.pythonPath = venv_python
		end
	end,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
