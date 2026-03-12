return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  },

  -- Focus mode (zen-mode + twilight = modern goyo + limelight)
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
    opts = {
      plugins = {
        twilight = { enabled = true },
      },
    },
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
