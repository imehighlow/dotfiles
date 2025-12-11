return {
	"lewis6991/gitsigns.nvim",
	event = "User FilePost",
	config = function()
		require("gitsigns").setup({

			signs = {
				delete = { text = "󰍵" },
				changedelete = { text = "󱕖" },
			},
		})
	end,
}
