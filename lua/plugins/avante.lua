local function is_wsl()
  return vim.fn.has("wsl") == 1
end

local function is_windows()
  return vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
end

return {
  "yetone/avante.nvim",
  enabled = not (is_wsl() or is_windows()), -- skip entirely on WSL and Windows
  event = "VeryLazy",
  lazy = true,
  version = false, -- Recommended to use the latest for 2026 features
  build = "make", -- This builds the binary for the agentic features
  opts = {
    provider = "copilot", -- Use your existing subscription
    -- Inline completion is owned by copilot-native; don't let avante compete for ghost text.
    providers = {
      copilot = {
        model = "claude-sonnet-4.6",
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
