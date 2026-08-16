local map = vim.keymap.set
local bufopts = { noremap = true, silent = true }
local function desc_opts(desc)
	return vim.tbl_extend("force", bufopts, { desc = desc })
end

map("n", "gd", function()
	require("telescope.builtin").lsp_definitions()
end, desc_opts("Go to definition")) -- Go to Definition (Telescope picker)
map("n", "gD", vim.lsp.buf.declaration, desc_opts("Go to declaration")) -- Go to Declaration (Direct jump, optional)
map("n", "gi", function()
	require("telescope.builtin").lsp_implementations()
end, desc_opts("Go to implementation")) -- Go to Implementation (Telescope picker)
map("n", "gt", vim.lsp.buf.type_definition, desc_opts("Go to type definition")) -- Go to Type Definition (Direct jump)
map("n", "<leader>fr", function()
	require("telescope.builtin").lsp_references()
end, desc_opts("Find references")) -- Find References (Telescope picker)
map("n", "<leader>k", vim.lsp.buf.signature_help, desc_opts("Show signature help")) -- Show function signature help

-- Actions
map("n", "<leader>rn", vim.lsp.buf.rename, desc_opts("Rename symbol")) -- Rename symbol
map("n", "<leader>ca", vim.lsp.buf.code_action, desc_opts("Code actions")) -- Code Actions (e.g. fix errors, refactor)

-- Hover/Documentation
-- map("n", "K", vim.lsp.buf.hover, bufopts) -- Show documentation/hover info
-- map("n", "K", vim.lsp.buf.hover, { desc = "Show hover docs/info"})

-- Diagnostics (Error/Warning navigation)
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Use Telescope for a floating window of all diagnostics
map("n", "<leader>d", function()
	require("telescope.builtin").diagnostics()
end, { desc = "telescope diagnostics list" })

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
map("n", "<leader>ot", "<cmd>Obsidian tags<CR>", { desc = "Search obsidian tags" })
map("n", "<leader>or", "<cmd>Obsidian rename<CR>", { desc = "Rename note" })
map("n", "<leader>oo", "<cmd>Obsidian quick_switch<CR>", { desc = "Search obsidian files" })
map("n", "<leader>ow", "<cmd>Obsidian search<CR>", { desc = "Search phrase in obsidian notes" })
map("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "Create new note" })
map("n", "<leader>og", "<cmd>Obsidian follow_link<CR>", { desc = "Follow obsidian link" })
map("n", "<leader>oi", "<cmd>Obsidian paste_img<CR>", { desc = "Paste image from clipboard" })
map("n", "<leader>op", "<cmd>Obsidian workspace<CR>", { desc = "See obsidian vaults" })
map("n", "<leader>od", "<cmd>Obsidian today<CR>", { desc = "Go to daily note" })

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
map("n", "<leader>fj", function()
	require("telescope.builtin").jumplist({ initial_mode = "normal" })
end, { desc = "Telescope jump history" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
local function show_buffers()
	require("telescope.builtin").buffers({
		initial_mode = "normal",
		attach_mappings = function(_, map_telescope)
			map_telescope("n", "d", require("telescope.actions").delete_buffer)
			return true
		end,
	})
end

map("n", "<leader>b", show_buffers, { desc = "Telescope: open buffers" })
map("n", "T", show_buffers, { desc = "Telescope: open buffers" })

-- buffers
map("n", "<Tab>", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- jump history
map("n", "[j", "<C-o>", { desc = "Jump backward" })
map("n", "]j", "<C-i>", { desc = "Jump forward" })

-- hover
map("n", "K", function()
	require("hover").open()
end, { desc = "hover.nvim (open)" })

map("n", "gK", function()
	require("hover").enter()
end, { desc = "hover.nvim (enter)" })

-- toggleterm
vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Toggle terminal" })
