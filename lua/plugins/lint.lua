return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" },
	config = function()
		local lint = require("lint")

		-- vacuum (OpenAPI linter) requires a custom parser — add here when needed:
		-- lint.linters.vacuum = { cmd = "vacuum", args = { "lint", "--format", "json", "$FILENAME" }, parser = ... }
		lint.linters_by_ft = {}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
