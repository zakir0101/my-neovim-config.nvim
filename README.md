# My Neovim Config

███████╗ █████╗ ██╗  ██╗██╗██████╗    .
╚══███╔╝██╔══██╗██║ ██╔╝██║██╔══██╗   .
  ███╔╝ ███████║█████╔╝ ██║██████╔╝   .
 ███╔╝  ██╔══██║██╔═██╗ ██║██╔══██╗   .
███████╗██║  ██║██║  ██╗██║██║  ██║   .
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ⚪   .

## Overview

A modular Neovim configuration built with lazy.nvim for optimal performance. This configuration supports both Linux and Windows platforms.

## Plugin Categories

### LSP & Language Support
- **Language Servers**: rust_analyzer, lua_ls, pyright, clangd, ts_ls, neocmakelsp, html, cssls, tailwindcss
- **LSP Management**: mason.nvim, mason-lspconfig.nvim, nvim-lspconfig
- **Completions**: blink.cmp (custom completion engine)
- **Formatting**: conform.nvim with stylua, black, eslint, prettier
- **Linting**: nvim-lint with markdownlint

### Tree-sitter
- **Syntax Highlighting**: Enhanced syntax parsing
- **Text Objects**: Advanced text object support
- **Context**: Context-aware navigation

### AI & Code Assistance
- **Experimental AI**: Custom AI chat interface (deactivated)
- **Copilot**: GitHub Copilot integration
- **Avante**: Additional AI assistance

### Version Control
- **Git Integration**: gitsigns.nvim
- **Git Commands**: Advanced git operations

### File Management
- **File Explorer**: neo-tree
- **Fuzzy Finder**: telescope.nvim

### UI & Navigation
- **Fuzzy Search**: telescope.nvim with custom mappings
- **Key Navigation**: Advanced navigation mode system
- **Which-key**: Keybinding discovery

### Language Specific
- **Python**: venv management, debugging
- **Java**: LSP configuration, runtime management
- **Web**: HTML, CSS, JavaScript support
- **Lua**: Enhanced Lua development
- **Markdown**: Preview and linting
- **AutoHotkey**: Language support

### Utilities
- **Auto-pairs**: Automatic bracket completion
- **Indent Guides**: Visual indentation guides
- **Todo Highlighting**: Highlight TODO comments
- **Theme Support**: Multiple theme configurations

## Key Features

### Cross-Platform Support
- Works on both Linux and Windows
- Platform-specific shell configuration
- Cross-platform path handling

### Advanced Navigation System
- Three navigation modes: Tabs, Location List, QuickFix List
- Mode switching with `mt`, `ml`, `mq` keys
- Unified navigation with `<C-A-hjkl>`

### Diagnostics Management
- Comprehensive diagnostic handling
- QuickFix and Location List management
- Severity-based filtering

## Setup

1. Clone this repository to your Neovim config directory
2. Ensure you have Neovim 0.10+ installed
3. Run `:checkhealth` to verify system requirements
4. The configuration will automatically install plugins on first run

## Platform Notes

### Linux
- Uses zsh as default shell (if available)
- Standard Unix path separators

### Windows
- Uses PowerShell as default shell
- Proper Windows path handling
- PowerShell-specific configurations

## Customization

The configuration is modular - edit individual files in the `lua/plugins/` directory to customize specific features.