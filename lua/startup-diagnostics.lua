local M = {}

function M.check_startup_issues()
  print("=== Neovim Startup Diagnostics ===")

  -- Check shell environment
  print("\n📟 Shell Environment:")
  print("  Current shell: " .. vim.o.shell)
  print("  SHELL env var: " .. (vim.env.SHELL or "not set"))
  print("  TERM env var: " .. (vim.env.TERM or "not set"))

  -- Check plugin manager status
  print("\n🔌 Plugin Manager:")
  local lazy_status = pcall(require, 'lazy')
  if lazy_status then
    print("  Lazy.nvim: ✓ Loaded")
  else
    print("  Lazy.nvim: ✗ Not loaded")
  end

  -- Check if running in WSL
  print("\n💻 System Info:")
  local uv = vim.uv or vim.loop
  local uname = uv.os_uname()
  print("  System: " .. uname.sysname)
  print("  Release: " .. uname.release)
  print("  Machine: " .. uname.machine)

  -- Check for common startup issues
  print("\n🔍 Common Issues Check:")

  -- Check if shell initialization files are causing delays
  local shell_files = {
    zsh = { '~/.zshrc', '~/.zprofile', '~/.zshenv' },
    bash = { '~/.bashrc', '~/.bash_profile', '~/.profile' }
  }

  local current_shell = vim.o.shell:match("/([^/]+)$") or vim.o.shell
  if shell_files[current_shell] then
    print("  Shell config files for " .. current_shell .. ":")
    for _, file in ipairs(shell_files[current_shell]) do
      local expanded = vim.fn.expand(file)
      local exists = vim.fn.filereadable(expanded) == 1
      print("    " .. file .. ": " .. (exists and "✓ exists" or "✗ not found"))
    end
  end

  -- Check if there are any shell commands that might be slow
  print("\n⚡ Performance Tips:")
  print("  1. Try running: nvim --clean")
  print("  2. Check shell init files for slow commands")
  print("  3. Use 'time nvim +qa' to measure startup time")
  print("  4. Check if any plugins are loading immediately")
end

-- Create a command to run diagnostics
vim.api.nvim_create_user_command('StartupDiagnostics', M.check_startup_issues, {
  desc = 'Run startup diagnostics to identify slow startup issues'
})

return M