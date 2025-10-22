return {

  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    config = function()
      vim.keymap.set('n', '<leader>ts', '<cmd>TailwindSort<CR>')
      vim.keymap.set('n', '<leader>tc', '<cmd>TailwindConcealToggle<CR>')
      require('tailwind-tools').setup({
        server = {
          -- Disable automatic LSP setup since we'll handle it manually
          -- This prevents the deprecated lspconfig usage
          override = false,
        },
      })
    end,
  },
}
