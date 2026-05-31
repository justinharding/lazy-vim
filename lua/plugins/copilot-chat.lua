-- Chat surface split by platform:
--   * macOS/Linux -> avante is the chat + agent surface (see avante.lua)
--   * WSL/Windows -> avante is disabled, so fall back to CopilotChat here.
-- The copilot-chat extra (lazyvim.json) provides the full spec; we just gate
-- the heavy plugin so only one chat UI is ever active on a given machine.
local function is_wsl()
  return vim.fn.has("wsl") == 1
end

local function is_windows()
  return vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
end

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = is_wsl() or is_windows(),
  },
}
