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

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

vim.o.background = "light" -- default before auto-dark-mode kicks in
vim.g.lazyvim_colorscheme = "everforest"
-- vim.g.lazyvim_colorscheme = "github_light"
