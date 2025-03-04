return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- Variable to store the main buffer name
    local main_buffer_name = ""

    -- Function to get the main buffer name
    local function get_main_buffer_name()
      -- If we're in Neo-tree, return the stored main buffer name
      if vim.bo.filetype == "neo-tree" then
        return main_buffer_name
      else
        -- Update the main buffer name when we are in a regular buffer
        main_buffer_name = vim.fn.expand('%:p')
        return main_buffer_name
      end
    end

    -- Set up lualine configuration
    require('lualine').setup({
      sections = {
        lualine_a = {},            -- Remove all other sections
        lualine_b = { 'branch' },  -- Only show git branch
        lualine_c = {
          get_main_buffer_name,    -- Custom function to show the main buffer name
        },
        lualine_x = {},            -- No info on the right
        lualine_y = {},            -- No info on the right
        lualine_z = {}             -- No info in the last section
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          get_main_buffer_name,    -- Use the same function for inactive sections
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      options = {
        theme = {
          normal = {
            a = { bg = '#000' }, -- Customize background color
            b = { bg = '#000' },
            c = { bg = '#000' }
          }
        },
        section_separators = '',   -- Remove section separators
        component_separators = '', -- Remove component separators
        globalstatus = true        -- Set to true for global status line
      }
    })
  end
}

