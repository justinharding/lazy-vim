-- 3 spe 2025
-- this is temporary to work around a breaking change in catppuccin
-- this plugin disables bufferline
-- and another enables it with its own config to work around the change
-- that renamed the get method
return {
  { "akinsho/bufferline.nvim", enabled = false },
}
