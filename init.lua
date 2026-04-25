-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true

-- vim.keymap.set("n", "<leader>gi", "<cmd>Octo issue list<cr>", { desc = "List Issues" })
-- vim.keymap.set("n", "<leader>gp", "<cmd>Octo pr list<cr>", { desc = "List PRs" })
-- vim.keymap.set("n", "<leader>gr", "<cmd>Octo repo view<cr>", { desc = "View Repo" })

-- Only load these plugins when running inside VS Code

if vim.g.vscode then
    -- Best Neovim plugins that work well in VS Code:
    -- 1. kylechui/nvim-surround: Essential for wrapping Go structs in tags
    -- 2. folke/flash.nvim: The fastest way to jump around your ClickHouse queries
    -- 3. echasnovski/mini.ai: Better text objects (e.g., 'vaq' for a whole quote)
    
    -- Sync VS Code clipboard with Neovim registers
    vim.opt.clipboard = "unnamedplus"
else
    -- Your standard standalone Neovim config (Telescope, etc.)
end
