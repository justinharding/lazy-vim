return {
  -- 1. GitHub Theme (light option)
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
  },

  -- 2. Catppuccin (dark option) + file-based theme polling
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { dark = "mocha", light = "latte" },
        color_overrides = {
          mocha = {
            base    = "#000000",
            mantle  = "#0d0d0d",
            crust   = "#111111",
          },
        },
      })

      -- Poll ~/.theme every second and switch colorscheme when it changes
      local last_mode = nil
      local function apply_theme()
        local f = io.open(vim.fn.expand("~/.theme"), "r")
        local mode = f and f:read("*l") or "dark"
        if f then f:close() end
        mode = (mode == "light") and "light" or "dark"
        if mode == last_mode then return end
        last_mode = mode
        if mode == "light" then
          vim.cmd("colorscheme github_light_tritanopia")
        else
          vim.o.background = "dark"
          vim.cmd("colorscheme catppuccin-mocha")
        end
      end

      apply_theme()

      local timer = vim.uv.new_timer()
      timer:start(1000, 1000, vim.schedule_wrap(apply_theme))

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function() timer:stop() end,
      })
    end,
  },

  -- 3. auto-dark-mode disabled (replaced with file-based polling above)
  {
    "f-person/auto-dark-mode.nvim",
    enabled = false,
  },
}
