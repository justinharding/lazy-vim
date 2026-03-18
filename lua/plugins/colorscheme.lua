-- return {
--   -- add gruvbox
--   {
--     "catppuccin",
--     opts = {
--       transparent_background = true,
--     },
--   },
--
--   -- Configure LazyVim to load catppuccin
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

-- this it to get a black background

return {
  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      -- Optional: set contrast level: "soft", "medium" (default), "hard"
      vim.g.everforest_background = "hard"
      vim.g.everforest_better_performance = 1

      -- Override the dark background to be even darker
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "everforest",
        callback = function()
          if vim.o.background == "dark" then
            vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1e19" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1a1e19" })
          end
        end,
      })
    end,
  },

  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 3000,
      set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd("colorscheme everforest")
      end,
      set_light_mode = function()
        vim.o.background = "light"
        vim.cmd("colorscheme everforest")
      end,
    },
  },
}





-- return {
--   -- Rosé Pine theme
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--     opts = {
--       variant = "auto", -- auto switches between dawn (light) and moon/main (dark)
--       dark_variant = "moon", -- or "main" for the darker dark variant
--     },
--   },
--
--   -- Auto switch based on macOS appearance
--   {
--     "f-person/auto-dark-mode.nvim",
--     opts = {
--       update_interval = 3000,
--       set_dark_mode = function()
--         vim.cmd("colorscheme rose-pine-moon")
--       end,
--       set_light_mode = function()
--         vim.cmd("colorscheme rose-pine-dawn")
--       end,
--     },
--   },
-- }

-- return {
--   -- Catppuccin theme
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     opts = {
--       flavour = "auto", -- lets auto-dark-mode control it
--     },
--   },
--
--   -- Auto switch based on macOS appearance
--   {
--     "f-person/auto-dark-mode.nvim",
--     opts = {
--       update_interval = 3000,
--       set_dark_mode = function()
--         vim.cmd("colorscheme catppuccin-mocha")
--       end,
--       set_light_mode = function()
--         vim.cmd("colorscheme catppuccin-latte")
--       end,
--     },
--   },
-- }


-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("catppuccin").setup({
--         flavour = "mocha", -- or macchiato, frappe, latte
--         background = {
--           light = "latte",
--           dark = "mocha",
--         },
--         transparent_background = false,
--         show_end_of_buffer = false,
--         color_overrides = {
--           mocha = {
--             base = "#000000",
--             mantle = "#000000",
--             crust = "#000000",
--           },
--         },
--       })
--
--       -- setup must be called before loading
--       vim.cmd.colorscheme("catppuccin")
--     end,
--   },
-- }
