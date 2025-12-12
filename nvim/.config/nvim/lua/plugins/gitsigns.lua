return {
	"lewis6991/gitsigns.nvim",
	-- event = "User FilePost",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({

			signs = {
				delete = { text = "󰍵" },
				changedelete = { text = "󱕖" },
			},
		})
	end,
}
