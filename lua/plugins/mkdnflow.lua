return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup({
      notes_dir = "~/notes",               -- This is the global directory for your notes
      mappings = {
        MkdnNew = { "n", "<Leader>mn" },   -- Create a new note
        MkdnFind = { "n", "<Leader>mf" },  -- Find an existing note
        MkdnNextLink = { "n", "<Leader>nl" } -- Example: move to next link
      }
    })

    -- Function to open mkdnflow.nvim in a floating window, targeting the global notes directory
    local function spawn_mkdnflow_window()
      -- Create a new buffer for the floating window
      local buf = vim.api.nvim_create_buf(false, true)
      local width = math.floor(vim.o.columns * 0.8) -- 80% of the screen width
      local height = math.floor(vim.o.lines * 0.8)  -- 80% of the screen height

      -- Create a floating window
      local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = (vim.o.columns - width) / 2,
        row = (vim.o.lines - height) / 2,
        border = 'rounded',
      })

      -- Open the main note or index file
      vim.cmd("edit ~/Documents/notes/index.md")

      -- Store the buffer and window IDs in a table for cleanup
      local floating_buffers = { buf } -- Start by tracking the first buffer
      local floating_window = win

      -- Optional: Map <Esc> to close the floating window
      vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':bd!<CR>', { noremap = true, silent = true })

      -- Function to safely close all buffers related to mkdnflow when the floating window is closed
      local function close_mkdnflow_buffers()
        -- Check if the floating window is still valid
        if vim.api.nvim_win_is_valid(floating_window) then
          for _, buffer in ipairs(floating_buffers) do
            -- Ensure the buffer is valid before deleting it
            if vim.api.nvim_buf_is_valid(buffer) then
              vim.api.nvim_buf_delete(buffer, { force = true })
            end
          end
        end
      end

      -- Set an autocmd to close all mkdnflow buffers when the floating window is closed
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(floating_window), -- Use the window ID for the autocmd pattern
        callback = close_mkdnflow_buffers,
      })

      -- Automatically track buffers opened in this floating window
      -- Using an `autocmd` to catch when the buffer is changed within the floating window
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          -- Only track buffers if the floating window is still valid
          if vim.api.nvim_win_is_valid(floating_window) and vim.api.nvim_win_get_buf(floating_window) == vim.api.nvim_get_current_buf() then
            -- Add the new buffer to our list of buffers to close
            table.insert(floating_buffers, vim.api.nvim_get_current_buf())
          end
        end,
      })
    end

    -- Key mapping to spawn the mkdnflow window, globally accessible
    vim.keymap.set("n", "<Leader>wi", spawn_mkdnflow_window, { noremap = true, silent = true })

    -- Key mappings for creating and finding notes in the global directory
    vim.keymap.set("n", "<Leader>mn", ":MkdnNew<CR>", { noremap = true, silent = true })  -- Create a new note in ~/notes
    vim.keymap.set("n", "<Leader>mf", ":MkdnFind<CR>", { noremap = true, silent = true }) -- Find a note in ~/notes
  end,
}
