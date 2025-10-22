local M = {}

function M.setup()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.have_nerd_font = true
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.mouse = 'a'
  vim.opt.showmode = false
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)
  vim.opt.breakindent = true
  vim.opt.undofile = true
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.signcolumn = 'yes'
  vim.opt.updatetime = 250
  vim.opt.timeoutlen = 300
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.list = true
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
  vim.opt.inccommand = 'split'

  -- Tab settings for consistent indentation
  vim.opt.expandtab = true -- Convert tabs to spaces
  vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
  vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
  vim.opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while editing
  vim.opt.cursorline = true
  vim.opt.scrolloff = 10
end

return M
