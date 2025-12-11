return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = require("lsp-servers"),
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Define the config using the new API

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = require("lsp-servers")
			for _, server in ipairs(servers) do
				-- vim.lsp.config(server, { capabilities = capabilities })
				vim.lsp.config(server, {})
        vim.lsp.enable(server)
			end

			-- Enable the server so it attaches to buffers

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
		end,
	},
}
