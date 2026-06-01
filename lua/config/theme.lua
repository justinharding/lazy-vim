-- Single source of truth for the editor theme.
--
-- The `void` colorscheme (colors/void.lua) renders as Void when
-- background=dark and Chalk when background=light, matching the terminal
-- (ghostty void/chalk, tmux void-chalk).
--
-- Two ways the mode reaches us:
--   * Locally  — the `dark`/`light` shell functions write ~/.theme; we poll it.
--   * Over SSH — ~/.theme is on the wrong machine, so we trust the terminal.
--     Nvim (0.11+) re-queries the background on a DEC-2031 theme-update
--     notification and updates 'background'; those notifications ride the PTY
--     through ssh + tmux (allow-passthrough), so the remote editor follows the
--     host theme. The OptionSet hook below re-renders void when that happens.
local M = {}

local function render()
  vim.cmd("colorscheme void") -- void.lua reads vim.o.background
end

local function read_file_mode()
  local f = io.open(vim.fn.expand("~/.theme"), "r")
  local mode = f and f:read("*l") or "dark"
  if f then
    f:close()
  end
  return (mode == "light") and "light" or "dark"
end

function M.setup()
  -- Re-render void on any background change. Covers both the local poll (which
  -- sets 'background') and the TUI's terminal-driven updates over SSH.
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = render,
  })

  local in_ssh = vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_TTY ~= nil

  if in_ssh then
    -- Trust the terminal: nvim has already detected the background at startup,
    -- and the OptionSet hook handles live theme switches. <leader>tb still
    -- works as a manual override if the stack doesn't forward notifications.
    render()
    return
  end

  -- Local: ~/.theme is authoritative. Poll it and drive 'background' (which
  -- fires the OptionSet hook above). change-only, so a <leader>tb toggle sticks.
  local last
  local function poll(force)
    local mode = read_file_mode()
    if mode == last and not force then
      return
    end
    last = mode
    vim.o.background = mode
  end
  poll(true)
  render() -- ensure void is applied even if background didn't change
  local timer = vim.uv.new_timer()
  timer:start(1000, 1000, vim.schedule_wrap(function()
    poll(false)
  end))
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      timer:stop()
    end,
  })
end

return M
