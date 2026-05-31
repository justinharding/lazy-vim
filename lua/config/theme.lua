-- Single source of truth for the editor theme.
--
-- The `void` colorscheme (colors/void.lua) renders as Void when
-- background=dark and Chalk when background=light, matching the terminal
-- (ghostty void/chalk, tmux void-chalk). We read ~/.theme — written by the
-- `dark`/`light` shell functions — so Neovim tracks the console light/dark
-- state, including across tmux/SSH where OS-appearance detection can't reach.
local M = {}

local last_mode

local function read_mode()
  local f = io.open(vim.fn.expand("~/.theme"), "r")
  local mode = f and f:read("*l") or "dark"
  if f then
    f:close()
  end
  return (mode == "light") and "light" or "dark"
end

-- Apply the scheme for the current ~/.theme value. With force=false this is a
-- no-op unless the file changed since last apply, so an in-session <leader>tb
-- toggle persists instead of being reverted on the next poll tick.
local function apply(force)
  local mode = read_mode()
  if mode == last_mode and not force then
    return
  end
  last_mode = mode
  vim.o.background = mode -- "light" -> Chalk, "dark" -> Void
  vim.cmd("colorscheme void")
end

function M.setup()
  apply(true)
  local timer = vim.uv.new_timer()
  timer:start(1000, 1000, vim.schedule_wrap(function()
    apply(false)
  end))
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      timer:stop()
    end,
  })
end

return M
