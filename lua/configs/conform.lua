-- Conform.nvim configuration
-- Maps each filetype to one or more formatters that run on save.

local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Python
    python = { "black" },

    -- Go (ships with the Go toolchain)
    go = { "gofmt" },

    -- JVM languages
    java = { "google-java-format" },
    kotlin = { "ktlint" },

    -- .NET
    cs = { "csharpier" },

    -- Web — prettier handles JS/TS/HTML/CSS and common data formats
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    -- Config formats
    toml = { "taplo" },

    -- Shell scripts
    sh = { "shfmt" },
    bash = { "shfmt" },

    -- SQL
    sql = { "sql_formatter" },

    -- Terraform / HCL
    terraform = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    hcl = { "terraform_fmt" },
  },

  -- Auto-format on every save
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
