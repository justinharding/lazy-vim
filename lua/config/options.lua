-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

-- Use OSC 52 only over SSH; let Neovim auto-detect pbcopy/pbpaste locally
if vim.env.SSH_CONNECTION or vim.env.SSH_TTY then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

-- vim.opt.clipboard = "unnamedplus"   -- removed
-- Explicit system-clipboard bridges live in keymaps.lua

-- Initial background only; the active colorscheme is owned by the ~/.theme
-- poll in lua/config/theme.lua (so the theme syncs across tmux/SSH).
vim.o.background = "dark"
