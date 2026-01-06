-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

--unmap lazynvim H and L so we can have default behaviour
vim.keymap.del("n", "H") -- Unmap H in normal mode
vim.keymap.del("n", "L") -- Unmap L in normal mode
