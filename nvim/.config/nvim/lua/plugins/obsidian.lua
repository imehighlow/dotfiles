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
				path = "/Users/im/Library/Mobile Documents/iCloud~md~obsidian/Documents/main",
				-- path = "/Users/im/.obsidian/",
			},
		},
		notes_subdir = "inbox",
		new_notes_location = "notes_subdir",
		frontmatter = {
			enabled = false,
		},
	},
}
