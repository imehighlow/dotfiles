return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	lazy = false,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
	},
	opts = {
		ensure_installed = {
			"clang-format",
			"clangd",
			"cmakelang",
			"cmake-language-server",
			"lua-language-server",
			"prettier",
			"pyright",
			"ruff",
			"rust-analyzer",
			"stylua",
			"svelte-language-server",
			"taplo",
			"typescript-language-server",
		},
		run_on_start = true,
		start_delay = 1000,
	},
}
