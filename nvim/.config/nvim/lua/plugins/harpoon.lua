local function list()
	return require("harpoon"):list()
end

local function toggle_telescope(harpoon_list)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values
	local finders = require("telescope.finders")
	local pickers = require("telescope.pickers")

	local function file_paths()
		local paths = {}
		for i = 1, harpoon_list:length() do
			local item = harpoon_list.items[i]
			if item then
				table.insert(paths, item.value)
			end
		end
		return paths
	end

	pickers
		.new({}, {
			prompt_title = "Harpoon",
			initial_mode = "normal",
			finder = finders.new_table({ results = file_paths() }),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
			mappings = {
				n = {
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["<CR>"] = actions.select_default,
				},
			},
			attach_mappings = function(prompt_bufnr, map_telescope)
				map_telescope("n", "d", function()
					local entry = action_state.get_selected_entry()
					if not entry or not entry.value then
						return
					end

					harpoon_list:remove({ value = entry.value, context = {} })
					action_state.get_current_picker(prompt_bufnr):refresh(finders.new_table({ results = file_paths() }))
				end)
				return true
			end,
		})
		:find()
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>ha",
			function()
				list():add()
			end,
			desc = "Harpoon: add file",
		},
		{
			"ga",
			function()
				list():add()
			end,
			desc = "Harpoon: add file",
		},
		{
			"<leader>hh",
			function()
				toggle_telescope(list())
			end,
			desc = "Harpoon: telescope menu",
		},
		{
			"gh",
			function()
				toggle_telescope(list())
			end,
			desc = "Harpoon: telescope menu",
		},
		{
			"<leader>hd",
			function()
				list():remove()
			end,
			desc = "Harpoon: remove current file",
		},
		{
			"<leader>hc",
			function()
				list():clear()
			end,
			desc = "Harpoon: clear list",
		},
		{
			"H",
			function()
				toggle_telescope(list())
			end,
			desc = "Harpoon: telescope menu",
		},
	},
	config = function()
		require("harpoon"):setup({
			settings = { sync_on_ui_close = true },
		})
	end,
}
