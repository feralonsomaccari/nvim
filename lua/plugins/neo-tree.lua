return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    vim.keymap.set("n", "<leader>wq", ":Neotree source=filesystem position=left<CR>",
      { noremap = true, silent = true })

    vim.keymap.set("n", "<leader>ew", ":Neotree source=git_status position=left<CR>",
      { noremap = true, silent = true })

    require("neo-tree").setup({
      sources = { "filesystem", "git_status" },
      filesystem = {
        filtered_items = {
          visible = true
        }
      },
      close_if_last_window = true,
      source_selector = {
        winbar = true
      },
      disabled_filetypes = { 'packer', 'NVimTree' },
      window = {
        width = 36,
        border = "none",
        mappings = {
          ['<leader>fp'] = function(state)
            -- Get the current node (file/folder) under the cursor
            local node = state.tree:get_node()

            -- Check if it's a valid directory, then search within it using Telescope
            if node and node.type == "directory" then
              require('telescope.builtin').find_files({
                cwd = node.path -- Search inside the directory
              })
            elseif node and node.type == "file" then
              -- If it's a file, search in the parent directory
              require('telescope.builtin').find_files({
                cwd = vim.fn.fnamemodify(node.path, ":h")
              })
            else
              print("Invalid node type")
            end
          end,
          ['<leader>f/'] = function(state)
            -- Get the current node (file/folder) under the cursor
            local node = state.tree:get_node()

            -- Check if it's a valid directory, then perform live grep in that directory using Telescope
            if node and node.type == "directory" then
              require('telescope.builtin').live_grep({
                cwd = node.path -- Live grep inside the directory
              })
            elseif node and node.type == "file" then
              -- If it's a file, live grep in the parent directory
              require('telescope.builtin').live_grep({
                cwd = vim.fn.fnamemodify(node.path, ":h")
              })
            else
              print("Invalid node type")
            end
          end
        }
      }
    })
  end
}
