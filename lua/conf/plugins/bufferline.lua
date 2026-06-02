return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  },
}
