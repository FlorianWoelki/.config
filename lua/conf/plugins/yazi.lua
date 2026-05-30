return {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<CR>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<CR>",
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    -- Mark netrw as loaded so it's not loaded at all.
    vim.g.loaded_netrwPlugin = 1
  end,
}
