return {
	"stevearc/conform.nvim",
	config = function()
		local options = {
			formatters_by_ft = {
				lua = { "stylua" },
				css = { "prettier" },
				ts = { "prettier" },
				js = { "prettier" },
				svelte = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				python = { "isort" },
			},
		}

		require("conform").setup(options)
	end
}
