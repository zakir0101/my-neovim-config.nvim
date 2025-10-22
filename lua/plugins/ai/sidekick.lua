return {
  'folke/sidekick.nvim',
  event = 'VeryLazy',
  opts = {
    -- AI CLI Configuration
    cli = {
      -- Enable multiplexer for session persistence
      mux = {
        backend = 'tmux', -- or 'zellij'
        enabled = true,
      },
      -- Custom keymaps for CLI window
      win = {
        keys = {
          -- Insert context into prompt
          insert_prompt = '<c-p>',
          -- Toggle auto-trigger for suggestions
          toggle_auto_trigger = '<leader>ca',
        },
      },
      -- AI CLI tools configuration
      tools = {
        claude = {
          cmd = { 'ccr', 'code' },
        },
        gemini = {
          cmd = { 'gemini' },
        },
        copilot = {
          cmd = { 'copilot', '--banner' },
        },
      },
    },

    -- Next Edit Suggestions (Copilot-powered)
    next_edit_suggestions = {
      enabled = true,
      debounce = 100, -- Updated to default value
      sign_group = 'sidekick',
    },

    -- Prompt library configuration
    prompts = {
      -- Enable built-in prompt library
      enabled = true,
      -- Custom prompts can be added here
      custom = {
        explain_code = {
          prompt = 'Explain this code in detail, including its purpose and how it works:',
          context = { 'file' },
        },
        refactor_code = {
          prompt = 'Refactor this code to be more efficient and maintainable:',
          context = { 'file', 'selection' },
        },
        write_tests = {
          prompt = 'Write comprehensive unit tests for this code:',
          context = { 'file' },
        },
      },
    },

    -- Context providers for AI prompts
    context = {
      -- Enable file context
      file = true,
      -- Enable selection context
      selection = true,
      -- Enable treesitter context for better code understanding
      treesitter = true,
      -- Enable diagnostics context
      diagnostics = true,
    },
  },
  keys = {
    -- Open AI CLI tools (updated commands)
    {
      '<leader>aa',
      function()
        require('sidekick.cli').toggle()
      end,
      desc = '[A]I [A]ssistant',
    },
    -- Toggle Next Edit Suggestions
    {
      '<leader>an',
      function()
        require('sidekick').nes_jump_or_apply()
      end,
      desc = '[A]I [N]ext Edit Suggestions',
    },
    -- Quick access to specific AI tools
    {
      '<leader>ac',
      function()
        require('sidekick.cli').show('claude')
      end,
      desc = '[A]I [C]laude',
    },
    {
      '<leader>ag',
      function()
        require('sidekick.cli').show('gemini')
      end,
      desc = '[A]I [G]emini',
    },
    {
      '<leader>ap',
      function()
        require('sidekick.cli').show('copilot')
      end,
      desc = '[A]I [P]ilot',
    },
    -- Insert context into prompt
    {
      '<c-p>',
      function()
        require('sidekick.cli').prompt()
      end,
      mode = 'i',
      desc = 'Insert AI prompt context',
    },
    -- Send custom prompt with current selection
    {
      '<leader>as',
      function()
        require('sidekick.cli').send('{this}')
      end,
      mode = { 'v', 'n' },
      desc = '[A]I [S]end selection',
    },
  },
  dependencies = {
    -- Optional dependencies for enhanced functionality
    'folke/snacks.nvim', -- for better prompt/tool selection
    'nvim-treesitter/nvim-treesitter-textobjects', -- for context variables
  },
}

