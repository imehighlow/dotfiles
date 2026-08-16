return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- macro recording
		local recording = {
			function()
				local reg = vim.fn.reg_recording()
				if reg == "" then
					return ""
				end
				return "REC @" .. reg
			end,
		}

		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filename", path = 1 },
					function()
						local harpoon = package.loaded["harpoon"]
						if not harpoon then
							return ""
						end

						local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
						local list = harpoon:list()
						for i = 1, list:length() do
							local item = list.items[i]
							if item and vim.fn.fnamemodify(item.value or "", ":p") == path then
								return "H"
							end
						end
						return ""
					end,
					recording,
				},
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = { "nvim-tree" },
		})

		local group = vim.api.nvim_create_augroup("LualineRecording", { clear = true })
		vim.api.nvim_create_autocmd("RecordingEnter", {
			group = group,
			callback = require("lualine").refresh,
		})
		vim.api.nvim_create_autocmd("RecordingLeave", {
			group = group,
			callback = function()
				vim.defer_fn(require("lualine").refresh, 50)
			end,
		})
	end,
}
