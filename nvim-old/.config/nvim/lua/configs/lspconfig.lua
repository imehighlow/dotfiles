require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "pyright",
    "clangd",
    "ansiblels",
    "emmet_ls",
    "typescript_language_server",
    "svelte_language_server",
}

vim.lsp.enable(servers)
