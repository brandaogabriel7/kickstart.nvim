# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim, using lazy.nvim as the plugin manager. Configuration is written in Lua.

## Architecture

- `init.lua` - Entry point with vim options, basic keymaps, and autocommands
- `lua/lazy-setup.lua` - Lazy.nvim plugin manager bootstrap and setup
- `lua/plugins.lua` - Standalone plugins (guess-indent, todo-comments)
- `lua/plugins/*.lua` - Individual plugin configurations (each file returns a plugin spec)

Lazy.nvim auto-discovers plugins from the `lua/plugins/` directory.

## Key Configuration Details

**Leader key**: Space

**LSP servers** (auto-installed via Mason): gopls, pyright, ruff, ts_ls, lua_ls, dockerls

**Formatters** (via conform.nvim):
- Lua: stylua
- Python: ruff_format
- JavaScript: prettierd/prettier
- Go: gofumpt/goimports
- Markdown: markdownlint

**Linters** (via nvim-lint): markdownlint for Markdown

## Key Bindings Reference

| Binding | Description |
|---------|-------------|
| `<leader>sf` | Search files (Telescope) |
| `<leader>sg` | Live grep (Telescope) |
| `<leader><leader>` | Find buffers |
| `<leader>f` | Format buffer |
| `-` | Open Oil file explorer |
| `<leader>tc` | Test nearest |
| `<leader>tf` | Test file |
| `<leader>ta` | Test suite |
| `<leader>b` | Toggle breakpoint |
| `<F5>` | Debug start/continue |
| `<leader>cc` | Toggle Claude Code |
| `grd` | Go to definition (LSP) |
| `grr` | Find references (LSP) |
| `grn` | Rename symbol (LSP) |

## Plugin Management Commands

- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update plugins
- `:Mason` - Open LSP/tool installer UI
- `:ConformInfo` - Show formatter status

## Debugging

DAP (Debug Adapter Protocol) is configured for:
- Go (delve)
- Python (debugpy with pytest runner)
- TypeScript (tsserver)

Python debugpy path: `~/.local/share/nvim/mason/packages/debugpy/venv/bin/python`
