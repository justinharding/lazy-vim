return {
  -- 1. Octo.nvim: The GitHub Interface
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope.nvim", -- or 'fzf-lua' / 'snacks.nvim'
      'snacks.nvim',
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      enable_builtin = true,
      use_local_fs = true, -- Crucial: lets your LSP work during reviews
      default_to_projects_v2 = true,
      picker = "telescope", -- match this to your preferred picker
    },
    keys = {
      { "<leader>op", "<cmd>Octo pr list<cr>", desc = "Octo: List PRs" },
      { "<leader>os", "<cmd>Octo search<cr>", desc = "Octo: Search GitHub" },
    },
  },

  -- 2. Diffview.nvim: The High-Speed Reviewer
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: Current File History" },
    },
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,
    },
  },
}
