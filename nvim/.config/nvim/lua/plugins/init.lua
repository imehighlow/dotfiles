return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  { "Pocco81/auto-save.nvim", opts = {}, lazy = false },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "eslint-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
        "svelte-language-server",
        "ansible-language-server",
        "ansible-lint",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "cpp",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "javascript",
        "typescript",
        "tsx",
      },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "Main",
          -- path = "/Users/im/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault",
          path = "/Users/im/.obsidian/",
        },
      },
      disable_frontmatter = true,
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
  },
  {
    "lewis6991/satellite.nvim",
    lazy = false,
    opts = {
      current_only = false,
      winblend = 0,
      zindex = 40,
      excluded_filetypes = {},
      width = 8,
      handlers = {
        cursor = {
          enable = true,
          -- Supports any number of symbols
          symbols = { "⎺", "⎻", "⎼", "⎽" },
          -- symbols = { '⎻', '⎼' }
          -- Highlights:
          -- - SatelliteCursor (default links to NonText
        },
        search = {
          enable = true,
          -- Highlights:
          -- - SatelliteSearch (default links to Search)
          -- - SatelliteSearchCurrent (default links to SearchCurrent)
        },
        diagnostic = {
          enable = true,
          signs = { "-", "=", "≡" },
          min_severity = vim.diagnostic.severity.HINT,
          -- Highlights:
          -- - SatelliteDiagnosticError (default links to DiagnosticError)
          -- - SatelliteDiagnosticWarn (default links to DiagnosticWarn)
          -- - SatelliteDiagnosticInfo (default links to DiagnosticInfo)
          -- - SatelliteDiagnosticHint (default links to DiagnosticHint)
        },
        gitsigns = {
          enable = true,
          signs = { -- can only be a single character (multibyte is okay)
            add = "│",
            change = "│",
            delete = "-",
          },
          -- Highlights:
          -- SatelliteGitSignsAdd (default links to GitSignsAdd)
          -- SatelliteGitSignsChange (default links to GitSignsChange)
          -- SatelliteGitSignsDelete (default links to GitSignsDelete)
        },
        marks = {
          enable = true,
          show_builtins = false, -- shows the builtin marks like [ ] < >
          key = "m",
          -- Highlights:
          -- SatelliteMark (default links to Normal)
        },
        quickfix = {
          signs = { "-", "=", "≡" },
          -- Highlights:
          -- SatelliteQuickfix (default links to WarningMsg)
        },
      },
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
}
