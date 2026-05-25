return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  module = "telescope",
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      winblend = 30,
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function open_project_and_tree()
      telescope.extensions.projects.projects({
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            local path = selection.path or selection.value

            actions.close(prompt_bufnr)
            vim.api.nvim_set_current_dir(path)

            --vim.schedule(function()
              --vim.cmd("Neotree show")
            --end)
          end)

          return true
        end,
      })
    end

    _G.OpenProjectAndTree = open_project_and_tree

    vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>pr", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>")
    vim.keymap.set("n", "<leader>pp", open_project_and_tree, { desc = "Projects" })
  end,
}
