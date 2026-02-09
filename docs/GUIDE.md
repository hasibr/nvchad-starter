# NvChad Starter Guide

A beginner-friendly guide to understanding and customizing your NvChad setup.

## What is NvChad?

NvChad is a Neovim configuration framework built on top of [lazy.nvim](https://github.com/folke/lazy.nvim) (a plugin manager). It gives you a polished IDE-like experience out of the box: beautiful themes, a statusline, tabline, file explorer, fuzzy finder, autocompletion, syntax highlighting, and more — all preconfigured and fast.

You don't write a Neovim config from scratch. Instead, NvChad provides the foundation, and this **starter config** is where you add your own customizations on top.

## Prerequisites

| Requirement | Why |
|---|---|
| **Neovim 0.11+** | NvChad requires a recent Neovim version |
| **A Nerd Font** | Icons in the UI (file explorer, statusline, etc.) |
| **tree-sitter-cli** | Required by nvim-treesitter for parser compilation |
| **GCC / make** | Compiles treesitter parsers |
| **ripgrep** (optional) | Enables live grep search via Telescope |

## Directory Structure

```
init.lua                  -- Entry point: bootstraps lazy.nvim, loads plugins & config
lua/
  chadrc.lua              -- NvChad UI config (theme, statusline, dashboard, etc.)
  options.lua             -- Neovim options (extends NvChad defaults)
  mappings.lua            -- Custom keybindings (extends NvChad defaults)
  autocmds.lua            -- Auto-commands (extends NvChad defaults)
  configs/
    lazy.lua              -- lazy.nvim plugin manager settings
    lspconfig.lua         -- LSP server configuration
    conform.lua           -- Formatter configuration (conform.nvim)
  plugins/
    init.lua              -- User plugin specs (add/override plugins here)
```

### What each file does

- **`init.lua`** — The first file Neovim reads. It downloads lazy.nvim if missing, then hands off to it to load all plugins and your config.
- **`lua/chadrc.lua`** — Controls NvChad's UI: which theme to use, statusline style, dashboard toggle, and other visual settings.
- **`lua/options.lua`** — Standard Neovim settings like line numbers, tab width, and clipboard. These extend (not replace) NvChad's defaults.
- **`lua/mappings.lua`** — Your custom keybindings, layered on top of NvChad's defaults.
- **`lua/autocmds.lua`** — Auto-commands that run on specific events (e.g., format on save, highlight on yank).
- **`lua/configs/lazy.lua`** — Configuration passed to lazy.nvim itself (install behavior, UI options).
- **`lua/configs/lspconfig.lua`** — Defines which language servers to enable and how to configure them.
- **`lua/configs/conform.lua`** — Defines which formatters to use for which filetypes.
- **`lua/plugins/init.lua`** — Where you declare new plugins or override NvChad's bundled plugin settings.

## How It All Fits Together

1. Neovim starts and reads `init.lua`.
2. `init.lua` bootstraps **lazy.nvim** (downloads it if not present).
3. lazy.nvim loads **NvChad core plugins** (UI, theming, statusline, etc.) and your **user plugins** from `lua/plugins/`.
4. Your `lua/options.lua`, `lua/autocmds.lua`, and `lua/mappings.lua` are loaded to apply your customizations.

NvChad core provides:

- **base46** — Theming engine (40+ themes)
- **ui** — Statusline, tabufline (buffer tabs), terminal, dashboard
- **Bundled plugins** — Telescope, nvim-tree, treesitter, nvim-cmp, gitsigns, which-key, mason, conform, and more

You never edit NvChad core files directly. You customize everything through the starter config files listed above.

## Key Concepts

### lazy.nvim — Plugin Manager

All plugins are managed by lazy.nvim. Plugins are **lazy-loaded** by default (loaded only when needed) to keep startup fast. Open the plugin manager UI with `:Lazy` to see installed plugins, update them, or check for issues.

Plugin specs are Lua tables. A minimal example:

```lua
{ "username/plugin-name" }
```

A more complete example with configuration:

```lua
{
  "username/plugin-name",
  event = "BufEnter",  -- lazy-load on this event
  config = function()
    require("plugin-name").setup({ option = true })
  end,
}
```

### Mason — Tool Installer

Mason is a package manager for **LSP servers**, **formatters**, and **linters**. Run `:Mason` to open its UI and browse/install tools. After configuring tools in your config, run `:MasonInstallAll` to install everything at once.

### LSP (Language Server Protocol)

LSP is what gives you IDE features: autocompletion, go-to-definition, hover docs, diagnostics (errors/warnings), and rename refactoring. Each language needs its own **language server** (e.g., `lua_ls` for Lua, `ts_ls` for TypeScript).

Configured in `lua/configs/lspconfig.lua`. To add a new language server, add its name to the `servers` table and install it via Mason.

### Treesitter — Syntax Highlighting

Treesitter parses your code into a syntax tree, providing accurate **syntax highlighting**, **indentation**, and **text objects**. Each language needs a treesitter parser installed (`:TSInstall <lang>`).

Configured in `lua/plugins/init.lua` via the `nvim-treesitter` plugin spec's `ensure_installed` list.

### Conform.nvim — Code Formatting

Conform handles auto-formatting your code. You define which formatter to use per filetype (e.g., `prettier` for JS/TS, `stylua` for Lua). Configured in `lua/configs/conform.lua`.

### Telescope — Fuzzy Finder

Telescope lets you search for files, grep text, browse buffers, and more using a fuzzy-matching popup. It is one of the most-used tools in the setup.

### nvim-cmp — Autocompletion

nvim-cmp provides the autocompletion popup as you type. It pulls suggestions from LSP, buffer text, file paths, and snippets.

## Where to Add Custom Things

| What you want to do | Where to do it |
|---|---|
| Add a new plugin | `lua/plugins/init.lua` (or create new files in `lua/plugins/`) |
| Add/configure an LSP server | `lua/configs/lspconfig.lua` |
| Add/configure a formatter | `lua/configs/conform.lua` |
| Add/change keybindings | `lua/mappings.lua` |
| Change Neovim options | `lua/options.lua` |
| Change theme or UI settings | `lua/chadrc.lua` |
| Add auto-commands | `lua/autocmds.lua` |

## Essential Keybindings

`Space` is the **leader key** (shown as `<leader>` in docs).

### Navigation & Search

| Keys | Action |
|---|---|
| `Space + ff` | Find files (Telescope) |
| `Space + fw` | Live grep / search text (Telescope) |
| `Space + fb` | Find open buffers |
| `Space + e` | Toggle file explorer (nvim-tree) |
| `Ctrl + n` | Toggle file tree |

### Buffers

| Keys | Action |
|---|---|
| `Tab` | Next buffer |
| `Shift + Tab` | Previous buffer |
| `Space + x` | Close current buffer |

### Terminal

| Keys | Action |
|---|---|
| `Space + h` | Open horizontal terminal |
| `Space + v` | Open vertical terminal |

### UI & Help

| Keys | Action |
|---|---|
| `Space + ch` | Open cheatsheet |
| `Space + th` | Change theme |

## Useful Commands

| Command | What it does |
|---|---|
| `:Lazy` | Open the plugin manager UI |
| `:Mason` | Open the LSP/formatter/linter installer |
| `:MasonInstallAll` | Install all configured tools |
| `:TSInstall <lang>` | Install a treesitter parser (e.g., `:TSInstall python`) |
| `:LspInfo` | Show which LSP servers are running for the current file |
| `:NvCheatsheet` | Show the full keybinding cheatsheet |
| `:Nvdash` | Show the NvChad dashboard |
