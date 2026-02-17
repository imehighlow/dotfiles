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
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				providers = {
					"hover.providers.diagnostic",
					"hover.providers.lsp",
					"hover.providers.dap",
					"hover.providers.man",
					"hover.providers.dictionary",
					-- Optional, disabled by default:
					-- "hover.providers.gh",
					-- "hover.providers.gh_user",
					-- "hover.providers.jira",
					-- "hover.providers.fold_preview",
					-- "hover.providers.highlight",
				},
				preview_opts = {
					border = "single",
				},
				preview_window = false,
				title = true,
				mouse_providers = {
					"hover.providers.lsp",
				},
				mouse_delay = 1000,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Define the config using the new API
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
				virtual_text = {
					prefix = "", -- no prefix
					source = false, -- hide source name
					spacing = 2,
					virt_text_pos = "right_align", -- key: right side
				},
				underline = false,
				update_in_insert = false,
			})

			-- cpp header-source switch
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if not client or client.name ~= "clangd" then
						return
					end

					vim.keymap.set(
						"n",
						"<leader>gc",
						"<cmd>LspClangdSwitchSourceHeader<CR>",
						{ buffer = ev.buf, desc = "Clangd: switch source/header" }
					)
				end,
			})
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = require("lsp-servers")
			for _, server in ipairs(servers) do
				local config = servers.configs[server] or {}
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

			-- Enable the server so it attaches to buffers
		end,
	},
}
