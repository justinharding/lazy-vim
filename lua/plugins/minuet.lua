-- lua/plugins/minuet.lua
return {
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    opts = {
      provider = "openai_fim_compatible",
      provider_options = {
        openai_fim_compatible = {
          api_key = "DEEPSEEK_API_KEY", -- name of the env var, not the key itself
          name = "deepseek",
          end_point = "https://api.deepseek.com/beta/completions",
          model = "deepseek-v4-flash", -- fast/cheap model for completions
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      throttle = 1000, -- ms between requests, tune to taste
      debounce = 400,
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "buffer", "snippets", "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 8, -- rank it above buffer/snippets
          },
        },
      },
    },
  },
}
