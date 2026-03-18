return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Recommended to use the latest for 2026 features
  build = "make", -- This builds the binary for the agentic features
  opts = {
    provider = "copilot", -- Use your existing subscription
    auto_suggestions_provider = "copilot",
    providers = {
      copilot = {
        model = "claude-3.7-sonnet", -- 2026's best-performing model for C++
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },
    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      -- Support for image pasting (handy for screenshots of errors)
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
        },
      },
    },
    {
      -- For render-markdown.nvim support (cleaner UI)
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
