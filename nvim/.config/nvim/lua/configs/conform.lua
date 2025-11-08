local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        ts = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        python = { "black " },
    },
}

require("conform").setup(options)
