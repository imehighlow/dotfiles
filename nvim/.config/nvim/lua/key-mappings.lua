local map = vim.keymap.set
local bufopts = { noremap = true, silent = true }
local function desc_opts(desc)
	return vim.tbl_extend("force", bufopts, { desc = desc })
end

map("n", "gd", require("telescope.builtin").lsp_definitions, desc_opts("Go to definition")) -- Go to Definition (Telescope picker)
map("n", "gD", vim.lsp.buf.declaration, desc_opts("Go to declaration")) -- Go to Declaration (Direct jump, optional)
map("n", "gi", require("telescope.builtin").lsp_implementations, desc_opts("Go to implementation")) -- Go to Implementation (Telescope picker)
map("n", "gt", vim.lsp.buf.type_definition, desc_opts("Go to type definition")) -- Go to Type Definition (Direct jump)
map("n", "gr", require("telescope.builtin").lsp_references, desc_opts("Find references")) -- Find References (Telescope picker)
map("n", "<leader>k", vim.lsp.buf.signature_help, desc_opts("Show signature help")) -- Show function signature help

-- Actions
map("n", "<leader>rn", vim.lsp.buf.rename, desc_opts("Rename symbol")) -- Rename symbol
map("n", "<leader>ca", vim.lsp.buf.code_action, desc_opts("Code actions")) -- Code Actions (e.g. fix errors, refactor)

-- Hover/Documentation
-- map("n", "K", vim.lsp.buf.hover, bufopts) -- Show documentation/hover info
-- map("n", "K", vim.lsp.buf.hover, { desc = "Show hover docs/info"})

-- Diagnostics (Error/Warning navigation)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Use Telescope for a floating window of all diagnostics
map("n", "<leader>d", require("telescope.builtin").diagnostics, { desc = "telescope diagnostics list" })

-- copy relative path
vim.api.nvim_create_user_command("CopyRelPath", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Copied relative path to clipboard!")
end, {})
vim.api.nvim_set_keymap(
	"n",
	"<leader>y",
	":CopyRelPath<CR>",
	{ noremap = true, silent = true, desc = "Copy relative path" }
)

-- formatting
-- map("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format code" })
map({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		async = true,
		lsp_fallback = false,
	})
end, { desc = "Format with Conform" })

-- git
map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Show git hunk" })
map("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Go to the next hunk" })

-- splits
map("n", "<leader>'", "<cmd>split<CR>", { silent = true, desc = "Split horizontally" })
map("n", "<leader>v", "<cmd>vsplit<CR>", { silent = true, desc = "Split vertically" })

-- tmux navigation
map({ "n", "v", "i" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true, desc = "Tmux Left" })
map({ "n", "v", "i" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true, desc = "Tmux Down" })
map({ "n", "v", "i" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true, desc = "Tmux Up" })
map({ "n", "v", "i" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true, desc = "Tmux Right" })

-- obsidian stuff
map("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { desc = "Search obsidian tags" })
map("n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "Rename note" })
map("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Search obsidian files" })
map("n", "<leader>ow", "<cmd>ObsidianSearch<CR>", { desc = "Search phrase in obsidian notes" })
map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create new note" })
map("n", "<leader>og", "<cmd>ObsidianFollowLink<CR>", { desc = "Follow obsidian link" })
map("n", "<leader>oi", "<cmd>ObsidianPasteImg<CR>", { desc = "Paste image from clipboard" })
map("n", "<leader>op", "<cmd>ObsidianWorkspace<CR>", { desc = "See obsidian vaults" })
map("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "Go to daily note" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true, desc = "Toggle nvim-tree" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- treesj
map("n", "<leader>tt", "<cmd>TSJToggle<CR>", { desc = "Toggle treesj" })
map("n", "<leader>tj", "<cmd>TSJJoin<CR>", { desc = "Join code block" })
map("n", "<leader>ts", "<cmd>TSJSplit<CR>", { desc = "Split code block" })

-- hover
map("n", "K", function()
	require("hover").open()
end, { desc = "hover.nvim (open)" })

map("n", "gK", function()
	require("hover").enter()
end, { desc = "hover.nvim (enter)" })

map("n", "<C-p>", function()
	require("hover").switch("previous")
end, { desc = "hover.nvim (previous source)" })

-- toggleterm
vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Toggle terminal" })
