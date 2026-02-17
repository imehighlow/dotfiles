return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",

		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = { border = "single" },
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	-- {
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		-- Disable default Tab mapping
	-- 		vim.g.copilot_no_tab_map = true
	--
	-- 		vim.keymap.set("i", "<C-w>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
	-- 		vim.keymap.set("i", "<M-w>", "<Plug>(copilot-accept-word)", {})
	-- 		vim.keymap.set("i", "<M-e>", "<Plug>(copilot-accept-line)", {})
	-- 		vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", {})
	-- 		vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", {})
	-- 		vim.keymap.set("i", "<M-c>", "<Plug>(copilot-dismiss)", {})
	-- 		vim.keymap.set("n", "<leader>cc", ":Copilot<CR>", { noremap = true, silent = true })
	-- 	end,
	-- },
}
