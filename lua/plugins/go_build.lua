return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        gopls = function(_, opts)
          local util = require("lspconfig/util")
          opts.root_dir = util.root_pattern("go.mod", ".git")
          opts.settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          }
        end,
      },
    },
  },
  -- Command to build Go and populate the quickfix list
  {
    "nvim-lua/plenary.nvim", -- Required dependency
    dependencies = {
      "folke/trouble.nvim", -- Optional, for enhanced error display
    },
    config = function()
      -- Define the `:GoBuild` command
      vim.api.nvim_create_user_command("MakeBuild", function()
        vim.cmd([[cexpr system('make build') | copen]])
      end, { desc = "Run make build" })
    end,
  },
}
