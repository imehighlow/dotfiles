return {
	"stevearc/conform.nvim",
	config = function()
		local options = {
			formatters_by_ft = {
				lua = { "stylua" },
				css = { "prettier" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				svelte = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				rust = { "rustfmt" },
				toml = { "taplo" },
				cpp = { "clang_format" },
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
			},
		}

		require("conform").setup(options)
	end,
}
