-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
-- vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
-- vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
-- vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
-- vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

-- let g:kitty_navigator_no_mappings = 1
--
-- nnoremap <silent> {Left-Mapping} :KittyNavigateLeft<cr>
-- nnoremap <silent> {Down-Mapping} :KittyNavigateDown<cr>
-- nnoremap <silent> {Up-Mapping} :KittyNavigateUp<cr>
-- nnoremap <silent> {Right-Mapping} :KittyNavigateRight<cr>

-- Disable Kitty Navigator default mappings
vim.g.kitty_navigator_no_mappings = 1

-- Define custom key mappings
-- vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true, silent = true })
-- vim.keymap.set('c', '<C-e>', '<End>', { noremap = true, silent = true })
vim.keymap.set('c', '<C-a>', '<C-b>', { noremap = true })  -- go to start
-- vim.keymap.set('c', '<C-e>', '<C-b>$', { noremap = true, silent = true })  -- go to end

vim.keymap.set('n', "<C-h>", '<Cmd>KittyNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', '<Cmd>KittyNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<Cmd>KittyNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<Cmd>KittyNavigateRight<CR>', { silent = true })


vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

vim.keymap.set("n", "<leader>mb", ":MakeBuild<CR>", { desc = "Make build" })


--unmap lazynvim H and L so we can have default behaviour
vim.keymap.del("n", "H") -- Unmap H in normal mode
vim.keymap.del("n", "L") -- Unmap L in normal mode
