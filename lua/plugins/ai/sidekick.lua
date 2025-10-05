return {
  'folke/sidekick.nvim',
  event = 'VeryLazy',
  opts = {
    -- Default options - can be customized as needed
    -- See https://github.com/folke/sidekick.nvim for all options
  },
  keys = {
    -- Open AI CLI tools
    { '<leader>aa', '<cmd>Sidekick<cr>', desc = '[A]I [A]ssistant' },
    -- Toggle Next Edit Suggestions
    { '<leader>an', '<cmd>SidekickToggleNES<cr>', desc = '[A]I [N]ext Edit Suggestions' },
  },
  dependencies = {
    -- Optional dependencies for enhanced functionality
    'folke/snacks.nvim', -- for better prompt/tool selection
    'nvim-treesitter/nvim-treesitter-textobjects', -- for context variables
  },
}