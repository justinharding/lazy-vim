-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true

-- Theme: `void` colorscheme driven by ~/.theme (see lua/config/theme.lua).
-- Reads the console light/dark state at startup and polls for live switches.
require("config.theme").setup()

-- Quick in-session flip between Void (dark) and Chalk (light). This only
-- toggles Neovim; it does not write ~/.theme, so it won't touch ghostty/tmux.
-- Use the shell `dark`/`light` commands for a full-system switch.
vim.keymap.set('n', '<leader>tb', function()
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
  vim.cmd('colorscheme void')
end, { desc = 'toggle background (void/chalk)' })

-- init.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.makeprg = "go build ./..."
    vim.keymap.set("n", "gb", ":make<CR>:copen<CR>", { buffer = true, desc = "Go build" })
  end,
})


-- vim.keymap.set("n", "<leader>gi", "<cmd>Octo issue list<cr>", { desc = "List Issues" })
-- vim.keymap.set("n", "<leader>gp", "<cmd>Octo pr list<cr>", { desc = "List PRs" })
-- vim.keymap.set("n", "<leader>gr", "<cmd>Octo repo view<cr>", { desc = "View Repo" })

-- Only load these plugins when running inside VS Code
if vim.g.vscode then
  -- Best Neovim plugins that work well in VS Code:
  -- 1. kylechui/nvim-surround: Essential for wrapping Go structs in tags
  -- 2. folke/flash.nvim: The fastest way to jump around your ClickHouse queries
  -- 3. echasnovski/mini.ai: Better text objects (e.g., 'vaq' for a whole quote)

else
  -- Your standard standalone Neovim config (Telescope, etc.)
end
