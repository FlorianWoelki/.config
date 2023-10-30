vim.cmd("highlight CustomVirtColumnColor guifg=#232323")

require("virt-column").setup({
  virtcolumn = "80",
  highlight = "CustomVirtColumnColor",
})

