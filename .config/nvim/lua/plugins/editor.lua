return {
  -- Leap (modern lightspeed replacement by same author)
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- Repeat
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- OSC52 clipboard (works over SSH/tmux)
  {
    "ojroques/nvim-osc52",
    keys = {
      {
        "<leader>y",
        function()
          require("osc52").copy_operator()
        end,
        expr = true,
        desc = "OSC52 yank",
      },
      {
        "<leader>yy",
        "<leader>y_",
        remap = true,
        desc = "OSC52 yank line",
      },
      {
        "<leader>y",
        function()
          require("osc52").copy_visual()
        end,
        mode = "v",
        desc = "OSC52 yank visual",
      },
    },
  },

  -- Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Install parsers
      local ensure_installed = {
        "lua", "javascript", "typescript", "tsx", "python",
        "json", "yaml", "html", "css", "markdown", "bash",
      }

      -- Auto-install missing parsers
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local ft = vim.bo.filetype
          if vim.tbl_contains(ensure_installed, ft) then
            pcall(vim.cmd, "TSUpdate " .. ft)
          end
        end,
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment line" },
      { "gc", mode = { "n", "v" }, desc = "Comment" },
    },
    opts = {},
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

}
