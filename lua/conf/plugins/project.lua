return {
  "ahmedkhalf/project.nvim",
  name = "project_nvim",
  opts = {
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern" },
    patterns = { ".git", "Makefile", "package.json" },
    show_hidden = false,
    silent_chdir = true,
    ignore_lsp = {},
    datapath = vim.fn.stdpath("data"),
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)

    local tele_status_ok, telescope = pcall(require, "telescope")
    if tele_status_ok then
      telescope.load_extension("projects")
    end
  end
}
