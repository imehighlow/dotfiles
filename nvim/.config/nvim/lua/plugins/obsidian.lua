local vault_path = vim.env.OBSIDIAN_VAULT
	or vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/main")

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	cmd = "Obsidian",
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "Main",
				path = vault_path,
			},
		},
		notes_subdir = "inbox",
		new_notes_location = "notes_subdir",
		frontmatter = {
			enabled = false,
		},
	},
}
