return {
  -- add gruvbox
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
