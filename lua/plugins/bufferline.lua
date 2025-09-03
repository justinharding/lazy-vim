-- 3 spe 2025
-- this is temporary to work around a breaking change in catppuccin
-- another plugin disables bufferline
-- and this enables it with its own config to work around the change
-- that renamed the get method
return {
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        local bufferline = require("catppuccin.groups.integrations.bufferline")
        if bufferline.get then
          opts.highlights = bufferline.get()
        elseif bufferline.get_theme then
          opts.highlights = bufferline.get_theme()
        end
      end
    end,
  },
}
