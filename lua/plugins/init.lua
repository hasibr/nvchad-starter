return {
  -- Conform.nvim — auto-formatting engine, configured in configs/conform.lua
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    opts = require "configs.conform",
  },

  -- nvim-lspconfig — enables LSP servers for code intelligence (diagnostics, go-to-def, etc.)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- nvim-treesitter — provides syntax highlighting, code folding, and text objects
  -- via incremental parsing for all configured languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Editor / config
        "vim", "lua", "vimdoc",

        -- JVM languages
        "java", "kotlin",

        -- Systems / compiled
        "go", "c_sharp",

        -- Web
        "typescript", "javascript", "tsx", "jsdoc",
        "html", "css",

        -- Data / config formats
        "json", "yaml", "toml", "sql", "regex",

        -- Scripting / docs
        "bash", "python", "markdown", "markdown_inline",

        -- DevOps / misc
        "dockerfile", "gitignore", "hcl", "terraform",
      },
    },
  },
}
