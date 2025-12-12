return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local function nvim_tree_onattach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			-- Default mappings
			api.config.mappings.default_on_attach(bufnr)
		end

		require("nvim-tree").setup({
			on_attach = nvim_tree_onattach,
      view = { adaptive_size = true },
		})
	end,
}
