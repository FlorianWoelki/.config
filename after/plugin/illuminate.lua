require('illuminate').configure({
  providers = {
    'lsp',
    'treesitter',
    'regex'
  },
  delay = 100,
  min_count_to_highlight = 1,
  filetypes_denylist = {
    'dirbuf',
    'dirvish',
    'fugitive',
    'netrw',
  },
})

vim.cmd('hi IlluminatedWordRead gui=none guibg=#3B3B3B')

