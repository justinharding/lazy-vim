-- `:checkhealth theme` — diagnoses the void/chalk theme pipeline
-- (see lua/config/theme.lua). Reports what's driving the colorscheme and
-- flags the usual reasons SSH live-switching might not work.
local M = {}

local function tobool(v)
  return v ~= nil and v ~= ""
end

function M.check()
  local h = vim.health
  h.start("theme (void/chalk)")

  -- Neovim version: terminal theme-change detection (DEC 2031) needs 0.11+.
  local v = vim.version()
  local vstr = string.format("%d.%d.%d", v.major, v.minor, v.patch)
  if v.major > 0 or v.minor >= 11 then
    h.ok("Neovim " .. vstr .. " (supports terminal theme-update detection)")
  else
    h.warn("Neovim " .. vstr .. " < 0.11: no DEC-2031 background updates", {
      "SSH live-switching will not work; upgrade Neovim.",
    })
  end

  -- void colorscheme available?
  if vim.fn.globpath(vim.o.runtimepath, "colors/void.lua") ~= "" then
    h.ok("`void` colorscheme found on runtimepath")
  else
    h.error("colors/void.lua not found on runtimepath", {
      "The theme cannot render. Ensure this config (and colors/void.lua) is deployed here.",
    })
  end

  -- Current state.
  h.info("background = " .. tostring(vim.o.background))
  if vim.g.colors_name == "void" then
    h.ok("active colorscheme = void")
  else
    h.warn("active colorscheme = " .. tostring(vim.g.colors_name) .. " (expected void)", {
      "Something applied a different scheme after startup. Run :lua require('config.theme').setup()",
    })
  end

  -- Which driver is active?
  local in_ssh = tobool(vim.env.SSH_CONNECTION) or tobool(vim.env.SSH_TTY)
  if in_ssh then
    h.start("theme — SSH session (terminal-detection mode)")
    h.info("SSH detected: the host theme propagates via DEC-2031 over the PTY")
    h.info("~/.theme on this host is ignored here (it lives on the wrong machine)")

    if tobool(vim.env.TMUX) then
      h.warn("inside tmux: it must forward theme-change notifications to this pane", {
        "If live-switching fails, switch the host theme then open a *fresh* nvim:",
        "  matches  -> startup detection works, tmux isn't forwarding live 2031",
        "  no match -> try nvim over SSH without tmux to isolate the blocker",
        "Ensure `set -g allow-passthrough on` in the remote tmux too.",
      })
    else
      h.ok("not inside tmux: notifications reach nvim directly (best case)")
    end
    h.info("manual fallback: <leader>tb toggles void/chalk in this session")
  else
    h.start("theme — local session (~/.theme poll mode)")
    local path = vim.fn.expand("~/.theme")
    local f = io.open(path, "r")
    if f then
      local mode = f:read("*l")
      f:close()
      if mode == "light" or mode == "dark" then
        h.ok("~/.theme = " .. mode)
      else
        h.warn("~/.theme has unexpected content: " .. tostring(mode) .. " (treated as dark)", {
          "The shell `dark`/`light` functions should write exactly 'dark' or 'light'.",
        })
      end
    else
      h.warn("~/.theme not found (defaulting to dark)", {
        "Run `dark` or `light` in the shell to create it (re-source ~/.zshrc first).",
      })
    end
  end

  h.info("terminal: TERM=" .. tostring(vim.env.TERM) .. " TERM_PROGRAM=" .. tostring(vim.env.TERM_PROGRAM))
end

return M
