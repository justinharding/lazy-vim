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

-- explicit bridges
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n',        '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P', { desc = 'Paste before from system clipboard' })

vim.o.background = "dark"
vim.g.lazyvim_colorscheme = "catppuccin-mocha"
