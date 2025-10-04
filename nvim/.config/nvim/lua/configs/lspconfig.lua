require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "clangd", "ansiblels", "emmet_ls" }
vim.lsp.enable(servers)

