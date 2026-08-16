local parsers = {
	"bash",
	"c",
	"cpp",
	"cmake",
	"css",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"rust",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(parsers)

			local group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
					if lang and vim.list_contains(parsers, lang) then
						pcall(vim.treesitter.start, args.buf, lang)
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<C-v>",
					},
					include_surrounding_whitespace = true,
				},
			})

			local select = require("nvim-treesitter-textobjects.select").select_textobject
			local function map_textobject(lhs, query, query_group, desc)
				vim.keymap.set({ "x", "o" }, lhs, function()
					select(query, query_group or "textobjects")
				end, { desc = desc })
			end

			map_textobject("af", "@function.outer", nil, "Select outer function")
			map_textobject("if", "@function.inner", nil, "Select inner function")
			map_textobject("ac", "@class.outer", nil, "Select outer class")
			map_textobject("ic", "@class.inner", nil, "Select inner class")
			map_textobject("as", "@local.scope", "locals", "Select language scope")
		end,
	},
}
