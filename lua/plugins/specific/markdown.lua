return {
  -- install with yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}

-- {
--   'MeanderingProgrammer/render-markdown.nvim',
--   opts = {
--     file_types = { 'Avante' }, --'markdown',
--   },
--   ft = { 'Avante' }, -- 'markdown',
-- },
