-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true

-- :multiplexer_integration

-- -- Add a tiny delay to focus events to prevent race conditions with Zellij
-- vim.opt.focusupdate = false 
--
-- -- If you are using smart-splits.nvim, ensure this setting is correct:
-- require('smart-splits').setup({
--   -- Resistance to focus changes can cause the "jump back"
--   move_cursor_same_row = false, 
--   -- Ensure zellij interaction is explicit
--   multiplexer_integration = 'zellij',
-- })
