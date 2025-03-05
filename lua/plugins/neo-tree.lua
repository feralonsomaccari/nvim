return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
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
        winbar = false
      },
      disabled_filetypes = { 'packer', 'NVimTree' },
      git_status = {
        sort_untracked_first = true, -- Untracked files appear first, so they're clearly visible
      },
      default_component_configs = {
        icon = {
          enabled = true, -- Enable icons for folders
          folder_empty = "◎", -- Minimal circle for empty folder
          folder_closed = "◎", -- Closed folder circle
          folder_open = "◯", -- Open folder circle
          file = "", -- No icon for files
          directory = "", -- No icon for directories (folders)
          symlink = "", -- No icon for symlinks
          bookmark = "", -- No icon for bookmarks
          default = "",
        },

        git_status = {
          symbols = {
            added     = "✔", -- Staged for commit
            modified  = "✎", -- Modified but not staged
            deleted   = "×", -- Deleted but not yet committed
            renamed   = "➜", -- Renamed file
            untracked = "★", -- Untracked file
            ignored   = "", -- Ignored by .gitignore
            unstaged  = "∪", -- Not staged for commit
            staged    = "✓", -- Staged for commit
            conflict  = "⚔", -- Merge conflict
          },
        },
        diagnostics = {
          symbols = {
            hint = "", -- Remove "I" (Info) icon
            info = "", -- Remove "I" (Info) icon
            warn = "w", -- Keep Warning icon
            error = "e", -- Keep Error icon
          },
        },
      },
      window = {
        width = 36,
        border = "none",
        title = "",
        mappings = {
          -- Keybindings for Git actions (VSCode-like)
          ["A"]          = "git_add_all",      -- Stage all changes
          ["eq"]         = "git_add_file",     -- Stage selected file
          ["er"]         = "git_revert_file",  -- Revert changes to file
          ["ew"]         = "git_unstage_file", -- Unstage file
          ["ed"]         = "git_remove_file",  -- Remove file (git rm)
          ["ee"]         = "git_commit",       -- Commit changes
          ["ep"]         = "git_push",         -- Push changes

          -- Get the current node (file/folder) under the cursor
          ['<leader>fp'] = function(state)
            local node = state.tree:get_node()

            if node and node.type == "directory" then
              require('telescope.builtin').find_files({
                cwd = node.path
              })
            elseif node and node.type == "file" then
              require('telescope.builtin').find_files({
                cwd = vim.fn.fnamemodify(node.path, ":h")
              })
            else
              print("Invalid node type")
            end
          end,

          ['<leader>f/'] = function(state)
            local node = state.tree:get_node()

            if node and node.type == "directory" then
              require('telescope.builtin').live_grep({
                cwd = node.path -- Live grep inside the directory
              })
            elseif node and node.type == "file" then
              require('telescope.builtin').live_grep({
                cwd = vim.fn.fnamemodify(node.path, ":h")
              })
            else
              print("Invalid node type")
            end
          end,
          ["q"]          = "", -- This prevents `q` from closing NeoTree
          ["f"]          = "", -- This prevents from closing NeoTree
        }
      }
    })
  end
}
