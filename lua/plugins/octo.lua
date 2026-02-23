-- return {
--   {
--     "pwntester/octo.nvim",
--     cmd = "Octo",
--     opts = {
--       -- or "fzf-lua" or "snacks" or "default"
--       -- picker = "telescope",
--       picker = "snacks",
--       -- bare Octo command opens picker of commands
--       enable_builtin = true,
--     },
--     keys = {
--       {
--         "<leader>oi",
--         "<CMD>Octo issue list<CR>",
--         desc = "List GitHub Issues",
--       },
--       {
--         "<leader>op",
--         "<CMD>Octo pr list<CR>",
--         desc = "List GitHub PullRequests",
--       },
--       {
--         "<leader>od",
--         "<CMD>Octo discussion list<CR>",
--         desc = "List GitHub Discussions",
--       },
--       {
--         "<leader>on",
--         "<CMD>Octo notification list<CR>",
--         desc = "List GitHub Notifications",
--       },
--       {
--         "<leader>os",
--         function()
--           require("octo.utils").create_base_search_command({ include_current_repo = true })
--         end,
--         desc = "Search GitHub",
--       },
--     },
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       -- "nvim-telescope/telescope.nvim",
--       -- "ibhagwan/fzf-lua",
--       "folke/snacks.nvim",
--       "nvim-tree/nvim-web-devicons",
--     },
--   },
-- }

return {
  "pwntester/octo.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup({
      use_local_fs = true, -- Crucial: uses your local repo for better LSP support
      enable_builtin = false, -- Uses Octo's internal picker if you don't want Telescope
      picker = "snacks",
      default_remote = { "origin", "upstream" }, -- Helps avoid your previous loading errors
      ssh_aliases = {}, -- Add aliases if you use custom SSH hostnames
      mappings = {
        pull_request = {
          checkout_pr = { lhs = "<C-o>", desc = "checkout PR" },
          merge_pr = { lhs = "<C-m>", desc = "merge commit" },
          list_commits = { lhs = "<C-c>", desc = "list PR commits" },
          list_changed_files = { lhs = "<C-f>", desc = "list PR changed files" },
          show_review_diff = { lhs = "<C-d>", desc = "show diff of reviewed files" },
          add_reviewer = { lhs = "<localleader>va", desc = "add reviewer" },
          remove_reviewer = { lhs = "<localleader>vd", desc = "remove reviewer" },
          close_issue = { lhs = "<localleader>ic", desc = "close PR" },
          -- Press <leader>bc to open the current file in Beyond Compare

          open_in_bc = {
            lhs = "<leader>bc",
            desc = "open diff in beyond compare",
            func = function()
              local utils = require("octo.utils")
              local file = utils.get_selected_path()

              if file then
                -- jobstart runs this in the background so Neovim doesn't freeze
                vim.fn.jobstart({ "git", "difftool", "main...HEAD", "--", file })
                vim.notify("Opening " .. file .. " in Beyond Compare")
              else
                vim.notify("No file selected", vim.log.levels.WARN)
              end
            end,
          },
        },
        review_thread = {
          add_comment = { lhs = "<localleader>ca", desc = "add comment" },
          add_suggestion = { lhs = "<localleader>sa", desc = "add suggestion" },
          delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
          next_comment = { lhs = " ]c", desc = "go to next comment" },
          prev_comment = { lhs = " [c", desc = "go to previous comment" },
          select_next_entry = { lhs = "]q", desc = "move to next changed file" },
          select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
          close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
          react_hooray = { lhs = "<localleader>rp", desc = "add 🎉 reaction" },
          react_heart = { lhs = "<localleader>rh", desc = "add ❤️ reaction" },
          react_eyes = { lhs = "<localleader>re", desc = "add 👀 reaction" },
          react_thumbsup = { lhs = "<localleader>r+", desc = "add 👍 reaction" },
          react_thumbsdown = { lhs = "<localleader>r-", desc = "add 👎 reaction" },
          react_rocket = { lhs = "<localleader>rr", desc = "add 🚀 reaction" },
          react_laugh = { lhs = "<localleader>rl", desc = "add 😄 reaction" },
          react_confused = { lhs = "<localleader>rc", desc = "add 😕 reaction" },
        },
        submit_win = {
          approve_review = { lhs = "<C-a>", desc = "approve review" },
          comment_review = { lhs = "<C-m>", desc = "comment review" },
          request_changes = { lhs = "<C-r>", desc = "request changes" },
          close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
        },
      },
    })
  end,
}
