return {
  -- Add this plugin for viewing diffs
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        enhanced_diff_hl = true,  -- Highlight more detailed changes in diffs
        keymaps = {
          view = {
            ["<leader>gd"] = actions.toggle_files,  -- Toggle file explorer in diff view
            ["<leader>gq"] = actions.close,         -- Close the diff view
          },
        },
      })
    end,
  },
}
