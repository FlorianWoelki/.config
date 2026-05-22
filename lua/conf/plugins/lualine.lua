return {
  {
    "vimpostor/vim-tpipeline",
    config = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_restore = 1
      vim.g.tpipeline_clearstl = 1
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight",
          section_separators = "",
          component_separators = "",
          icons_enabled = true,
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end
  },
}
