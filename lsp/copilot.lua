-- Copilot LSP configuration for sidekick.nvim
vim.lsp.config('copilot', {
  on_attach = function(client, bufnr)
    -- Enable completion capabilities
    client.server_capabilities.completionProvider = true
    client.server_capabilities.workspace = {
      workspaceFolders = true,
      configuration = true,
    }
  end,
  settings = {
    -- Optional: Configure Copilot settings here
  },
})

-- Enable Copilot LSP
vim.lsp.enable('copilot')