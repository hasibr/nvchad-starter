require("nvchad.configs.lspconfig").defaults()

-- LSP servers for language intelligence (diagnostics, completions, go-to-definition, etc.)
local servers = {
  -- Web
  "html",                    -- HTML
  "cssls",                   -- CSS
  "ts_ls",                   -- TypeScript / JavaScript

  -- Data / config formats
  "jsonls",                  -- JSON
  "yamlls",                  -- YAML
  "taplo",                   -- TOML
  "sqls",                    -- SQL

  -- Scripting / docs
  "bashls",                  -- Bash / shell scripts
  "pyright",                 -- Python
  "marksman",                -- Markdown

  -- Systems / compiled
  "gopls",                   -- Go

  -- JVM languages
  "jdtls",                   -- Java
  "kotlin_language_server",  -- Kotlin

  -- .NET
  "omnisharp",               -- C#

  -- DevOps
  "terraformls",             -- Terraform (HCL)
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
