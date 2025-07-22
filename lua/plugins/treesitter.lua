return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "graphql", "just" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true, -- Use Treesitter for automatic indentation where possible
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gsb", -- start selection
            node_incremental = "gse", -- expand node
            node_decremental = "gss", -- shrink node
          },
        },
      })
    end,
  },
}
