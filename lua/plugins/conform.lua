return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
        -- sql = {
        --   "sqlfluff",
        --   args = { "--dialect", "postgres" }, -- Add any additional args
        --   command = "/opt/homebrew/anaconda3/bin/sqlfluff", -- Path to global sqlfluff
        -- },
      },
    },
  },
}
