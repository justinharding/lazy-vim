-- Theme diagnostics for the void/chalk pipeline (see lua/config/theme.lua).
--
-- Reachable two ways:
--   * `:checkhealth theme`  — native UI (macOS/Linux; Windows discovery of a
--     single-level lua/theme/health.lua via nvim_get_runtime_file is flaky).
--   * `:ThemeHealth`        — portable command (registered in config/theme.lua)
--     that prints the same findings; works everywhere, including Windows.
-- Both render from the single source of truth below: M.diagnostics().
local M = {}

local function tobool(v)
  return v ~= nil and v ~= ""
end

-- Returns an ordered list of findings as plain data:
--   { level = "ok"|"warn"|"error"|"info", msg = string, advice = { string, ... }? }
function M.diagnostics()
  local d = {}
  local function add(level, msg, advice)
    d[#d + 1] = { level = level, msg = msg, advice = advice }
  end

  -- Neovim version: terminal theme-change detection (DEC 2031) needs 0.11+.
  local v = vim.version()
  local vstr = string.format("%d.%d.%d", v.major, v.minor, v.patch)
  if v.major > 0 or v.minor >= 11 then
    add("ok", "Neovim " .. vstr .. " (supports terminal theme-update detection)")
  else
    add("warn", "Neovim " .. vstr .. " < 0.11: no DEC-2031 background updates", {
      "SSH live-switching will not work; upgrade Neovim.",
    })
  end

  -- void colorscheme available?
  if vim.fn.globpath(vim.o.runtimepath, "colors/void.lua") ~= "" then
    add("ok", "`void` colorscheme found on runtimepath")
  else
    add("error", "colors/void.lua not found on runtimepath", {
      "The theme cannot render. Ensure this config (and colors/void.lua) is deployed here.",
    })
  end

  -- Current state.
  add("info", "background = " .. tostring(vim.o.background))
  if vim.g.colors_name == "void" then
    add("ok", "active colorscheme = void")
  else
    add("warn", "active colorscheme = " .. tostring(vim.g.colors_name) .. " (expected void)", {
      "Something applied a different scheme after startup. Run :lua require('config.theme').setup()",
    })
  end

  -- Which driver is active?
  local in_ssh = tobool(vim.env.SSH_CONNECTION) or tobool(vim.env.SSH_TTY)
  if in_ssh then
    add("info", "SSH session: host theme propagates via DEC-2031 over the PTY")
    add("info", "~/.theme on this host is ignored (it lives on the wrong machine)")
    if tobool(vim.env.TMUX) then
      add("warn", "inside tmux: it must forward theme-change notifications to this pane", {
        "If live-switching fails, switch the host theme then open a *fresh* nvim:",
        "  matches  -> startup detection works, tmux isn't forwarding live 2031",
        "  no match -> try nvim over SSH without tmux to isolate the blocker",
        "Ensure `set -g allow-passthrough on` in the remote tmux too.",
      })
    else
      add("ok", "not inside tmux: notifications reach nvim directly (best case)")
    end
    add("info", "manual fallback: <leader>tb toggles void/chalk in this session")
  else
    add("info", "local session: ~/.theme is the source of truth (polled)")
    local path = vim.fn.expand("~/.theme")
    local f = io.open(path, "r")
    if f then
      local mode = f:read("*l")
      f:close()
      if mode == "light" or mode == "dark" then
        add("ok", "~/.theme = " .. mode)
      else
        add("warn", "~/.theme has unexpected content: " .. tostring(mode) .. " (treated as dark)", {
          "The shell `dark`/`light` functions should write exactly 'dark' or 'light'.",
        })
      end
    else
      add("warn", "~/.theme not found (defaulting to dark)", {
        "Run `dark` or `light` in the shell to create it (re-source ~/.zshrc first).",
        "On native Windows there is no writer unless you add a PowerShell `dark`/`light`.",
      })
    end
  end

  add("info", "terminal: TERM=" .. tostring(vim.env.TERM) .. " TERM_PROGRAM=" .. tostring(vim.env.TERM_PROGRAM))
  return d
end

-- :checkhealth theme provider.
function M.check()
  local h = vim.health
  h.start("theme (void/chalk)")
  for _, e in ipairs(M.diagnostics()) do
    if e.level == "ok" then
      h.ok(e.msg)
    elseif e.level == "warn" then
      h.warn(e.msg, e.advice)
    elseif e.level == "error" then
      h.error(e.msg, e.advice)
    else
      h.info(e.msg)
    end
  end
end

-- Portable plain-text report for the :ThemeHealth command.
function M.report()
  local marks = { ok = "✓ OK   ", warn = "⚠ WARN ", error = "✗ ERROR", info = "  info " }
  local lines = { "theme (void/chalk) ───────────────────────" }
  for _, e in ipairs(M.diagnostics()) do
    lines[#lines + 1] = "  " .. (marks[e.level] or "      ") .. "  " .. e.msg
    for _, a in ipairs(e.advice or {}) do
      lines[#lines + 1] = "            • " .. a
    end
  end
  vim.api.nvim_echo({ { table.concat(lines, "\n"), "Normal" } }, true, {})
end

return M
