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
			vim.keymap.set("n", "ga", function()
				local node = api.tree.get_node_under_cursor()
				if not node or not node.absolute_path or node.nodes then
					return
				end
				local path = vim.fn.fnamemodify(node.absolute_path, ":.")
				if path:sub(1, 3) == "../" then
					path = node.absolute_path
				end
				require("harpoon"):list():add({
					value = path,
					context = { row = 1, col = 0 },
				})
			end, opts("Harpoon add"))

		end

		require("nvim-tree").setup({
			on_attach = nvim_tree_onattach,
			view = { adaptive_size = true },
		})
	end,
}
