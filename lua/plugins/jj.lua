return {
  {
    "NicolasGB/jj.nvim",
    cmd = { "J", "Jbrowse" },
    opts = {},
    keys = {
      { "<leader>jj", "<cmd>J<cr>", desc = "jj (default)" },
      { "<leader>jl", "<cmd>J log<cr>", desc = "jj log" },
      { "<leader>js", "<cmd>J status<cr>", desc = "jj status" },
      { "<leader>jn", "<cmd>J new<cr>", desc = "jj new change" },
      { "<leader>jc", "<cmd>J commit<cr>", desc = "jj commit (describe + new)" },
      { "<leader>jd", "<cmd>J describe<cr>", desc = "jj describe" },
      { "<leader>jP", "<cmd>J push<cr>", desc = "jj push" },
      { "<leader>jF", "<cmd>J fetch<cr>", desc = "jj fetch" },
      { "<leader>jp", "<cmd>J open_pr<cr>", desc = "jj open PR" },
      { "<leader>jb", "<cmd>Jbrowse<cr>", desc = "jj browse on remote" },
      { "<leader>jS", "<cmd>J split<cr>", desc = "jj split change" },
      { "<leader>jh", "<cmd>J diff_history<cr>", desc = "jj diff history" },
    },
  },
  {
    "rafikdraoui/jj-diffconflicts",
    cmd = "JJDiffConflicts",
  },
}
