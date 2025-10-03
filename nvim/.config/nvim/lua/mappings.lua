require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })

-- git
map('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { desc = 'Show git hunk' })
map('n', '<leader>h', ':Gitsigns preview_hunk<CR>', { desc = 'Show git hunk' })
map('n', '<leader>gn', ':Gitsigns next_hunk<CR>', { desc = 'Go to the next hunk' })

-- diagnostic
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- splits
map('n', '<leader>s', '<cmd>split<CR>', { silent = true, desc="Split horizontally"})
map('n', '<leader>v', '<cmd>vsplit<CR>', { silent = true, desc="Split vertically"})

-- tmux navigation
map({'n','v','i'}, "<c-h>",  "<cmd>TmuxNavigateLeft<cr>", {silent=true, desc="Tmux Left" })
map({'n','v','i'}, "<c-j>",  "<cmd>TmuxNavigateDown<cr>", {silent=true, desc="Tmux Down" })
map({'n','v','i'}, "<c-k>",  "<cmd>TmuxNavigateUp<cr>", {silent=true, desc="Tmux Up" })
map({'n','v','i'}, "<c-l>",  "<cmd>TmuxNavigateRight<cr>", {silent=true, desc="Tmux Right" })
map({'n','v','i'}, "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", {silent=true, desc="Tmux Previous" })

-- obsidian stuff
map('n', '<leader>ot', '<cmd>ObsidianTags<CR>', { desc="Search obsidian tags"})
map('n', '<leader>or', '<cmd>ObsidianRename<CR>', { desc="Rename note"})
map('n', '<leader>oo', '<cmd>ObsidianQuickSwitch<CR>', { desc="Search obsidian files"})
map('n', '<leader>ow', '<cmd>ObsidianSearch<CR>', { desc="Search phrase in obsidian notes"})
map('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc="Create new note"})
map('n', '<leader>og', '<cmd>ObsidianFollowLink<CR>', { desc="Follow obsidian link"})
map('n', '<leader>oi', '<cmd>ObsidianPasteImg<CR>', { desc="Paste image from clipboard"})
map('n', '<leader>op', '<cmd>ObsidianWorkspace<CR>', { desc="See obsidian vaults"})
