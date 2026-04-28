return {
  "folke/noice.nvim",
  opts = {
    routes = {
      -- gopls sends workspace/didChangeWatchedFiles with nonexistent baseUri paths;
      -- nvim's vim._watch.lua logs this as a placeholder INFO until nvim_log API exists.
      {
        filter = { find = "watch%.watch: ENOENT" },
        opts = { skip = true },
      },
    },
  },
}
