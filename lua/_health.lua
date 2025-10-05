--[[
--
-- This file is not required for your own configuration,
-- but helps people determine if their system is setup correctly.
--
--]]

local check_version = function()
  local verstr = tostring(vim.version())
  if not vim.version.ge then
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
    return
  end

  if vim.version.ge(vim.version(), '0.10-dev') then
    vim.health.ok(string.format("Neovim version is: '%s'", verstr))
  else
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
  end
end

local check_external_reqs = function()
  -- Basic utils: `git`, `make`, `unzip`
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg' } do
    local is_executable = vim.fn.executable(exe) == 1
    if is_executable then
      vim.health.ok(string.format("Found executable: '%s'", exe))
    else
      vim.health.warn(string.format("Could not find executable: '%s'", exe))
    end
  end

  return true
end

local function check_platform_specific()
  local uv = vim.uv or vim.loop
  local uname = uv.os_uname()
  local is_windows = uname.sysname:lower():find('windows')

  if is_windows then
    -- Check Windows-specific requirements
    for _, exe in ipairs { 'powershell.exe', 'pwsh.exe' } do
      local is_executable = vim.fn.executable(exe) == 1
      if is_executable then
        vim.health.ok(string.format("Found Windows shell: '%s'", exe))
      else
        vim.health.warn(string.format("Could not find Windows shell: '%s'", exe))
      end
    end
  else
    -- Check Linux-specific requirements
    for _, exe in ipairs { 'zsh', 'bash' } do
      local is_executable = vim.fn.executable(exe) == 1
      if is_executable then
        vim.health.ok(string.format("Found Linux shell: '%s'", exe))
      else
        vim.health.warn(string.format("Could not find Linux shell: '%s'", exe))
      end
    end
  end
end

local function check_plugin_dependencies()
  -- Check for common plugin dependencies
  local dependencies = {
    { name = 'git', required = true, purpose = 'Version control and plugin management' },
    { name = 'node', required = false, purpose = 'Some LSP servers and tools' },
    { name = 'python3', required = false, purpose = 'Python language support' },
    { name = 'cargo', required = false, purpose = 'Rust language support' },
  }

  for _, dep in ipairs(dependencies) do
    local is_executable = vim.fn.executable(dep.name) == 1
    if is_executable then
      vim.health.ok(string.format("Found dependency: '%s' (%s)", dep.name, dep.purpose))
    elseif dep.required then
      vim.health.error(string.format("Missing required dependency: '%s' (%s)", dep.name, dep.purpose))
    else
      vim.health.warn(string.format("Missing optional dependency: '%s' (%s)", dep.name, dep.purpose))
    end
  end
end

local function check_configuration()
  -- Check if key configuration files exist
  local config_files = {
    'init.lua',
    'lua/options.lua',
    'lua/keys.lua',
    'lua/plugins/lsp/lsp-manager.lua',
  }

  for _, file in ipairs(config_files) do
    local exists = vim.fn.filereadable(file) == 1
    if exists then
      vim.health.ok(string.format("Configuration file exists: '%s'", file))
    else
      vim.health.error(string.format("Missing configuration file: '%s'", file))
    end
  end
end

return {
  check = function()
    vim.health.start 'My Neovim Configuration'

    vim.health.info [[NOTE: Not every warning is a 'must-fix' in `:checkhealth`

  Fix only warnings for plugins and languages you intend to use.
    Mason will give warnings for languages that are not installed.
    You do not need to install, unless you want to use those languages!]]

    local uv = vim.uv or vim.loop
    vim.health.info('System Information: ' .. vim.inspect(uv.os_uname()))

    check_version()
    check_external_reqs()
    check_platform_specific()
    check_plugin_dependencies()
    check_configuration()
  end,
}
