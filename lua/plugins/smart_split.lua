-- return {
--   { "mrjones2014/smart-splits.nvim" },
-- }

return {
  'mrjones2014/smart-splits.nvim',
  lazy = false, -- Load at startup so Zellij can always communicate with it
  opts = {
    -- This is where your config goes
    multiplexer_integration = 'zellij',
    move_cursor_same_row = false,
    cursor_follows_swapped_bufs = true,
  },
  keys = {
    { '<C-h>', function() require('smart-splits').move_cursor_left() end, desc = 'Move left' },
    { '<C-j>', function() require('smart-splits').move_cursor_down() end, desc = 'Move down' },
    { '<C-k>', function() require('smart-splits').move_cursor_up() end, desc = 'Move up' },
    { '<C-l>', function() require('smart-splits').move_cursor_right() end, desc = 'Move right' },
  },
}

