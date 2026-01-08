-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Automatically rename Zellij tab to the current file name
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  group = vim.api.nvim_create_augroup("ZellijTabName", { clear = true }),
  callback = function()
    -- Only run if we are actually inside a Zellij session
    if vim.env.ZELLIJ then
      local file_name = vim.fn.expand("%:t")
      if file_name ~= "" then
        -- Use the Zellij CLI to rename the current tab
        -- 'action' commands are very fast
        os.execute(string.format("zellij action rename-tab '󰈚 %s'", file_name))
      else
        os.execute("zellij action rename-tab '󰉋 empty'")
      end
    end
  end,
})

-- Reset tab name when exiting Neovim
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    if vim.env.ZELLIJ then
      os.execute("zellij action rename-tab 'zsh'")
    end
  end,
})
