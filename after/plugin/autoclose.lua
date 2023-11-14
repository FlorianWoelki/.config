require("autoclose").setup({
  keys = {
    ["'"] = { close = false },
    ["\""] = { close = false },
    ["`"] = { close = false },
  },
  options = {
    disabled_filetypes = {
      "markdown",
      "dirbuf",
      "dirvish",
      "fugitive",
      "netrw",
    },
  },
})

