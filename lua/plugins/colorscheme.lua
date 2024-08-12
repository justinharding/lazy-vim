return {
  -- add gruvbox
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  -- { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "gruvbox",
    },
  },
}
