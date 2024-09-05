return {
  "princejoogie/dir-telescope.nvim",
  -- telescope.nvim is a required dependency
  requires = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("dir-telescope").setup({
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    })

    -- Custom function to get the selected directory from neo-tree and use it in telescope-dir
local function search_in_neo_tree_directory()
  local neo_tree = require("neo-tree.sources.filesystem")
  local node = neo_tree.get_node() -- Get the currently selected node in neo-tree

  if not node then
      print("No directory selected in Neo-Tree")
      return
  end

  local is_dir = node.type == "directory"
  local path = is_dir and node.path or vim.fn.fnamemodify(node.path, ":h") -- Get the directory path

  require("telescope").extensions.dir.live_grep({ search_dirs = { path } })
end

-- Keymap for the custom function
vim.api.nvim_set_keymap("n", "<leader>ff", ":lua search_in_neo_tree_directory()<CR>", { noremap = true, silent = true })
  end,
}
