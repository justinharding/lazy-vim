-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`

local status, ss = pcall(require, "smart-splits")
if status then
  -- Recommended Mappings
  vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
  vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
  vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
  vim.keymap.set("n", "<C-l>", ss.move_cursor_right)

  -- Smart Resizing
  vim.keymap.set("n", "<A-h>", ss.resize_left)
  vim.keymap.set("n", "<A-j>", ss.resize_down)
  vim.keymap.set("n", "<A-k>", ss.resize_up)
  vim.keymap.set("n", "<A-l>", ss.resize_right)
else
  print("Smart-splits not found, skipping mappings")
end

--unmap lazynvim H and L so we can have default behaviour
vim.keymap.del("n", "H") -- Unmap H in normal mode
vim.keymap.del("n", "L") -- Unmap L in normal mode
