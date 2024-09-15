return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            sections = {
                -- Only show the git branch in the `lualine_b` section
                lualine_a = {}, -- Remove all other sections
                lualine_b = {'branch'}, -- Only show git branch
                lualine_c = {}, -- No info in the center
                lualine_x = {}, -- No info on the right
                lualine_y = {}, -- No info on the right
                lualine_z = {} -- No info in the last section
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            options = {
				theme = {
					normal = {
					  a = { bg = '#000' },  -- Change this to your preferred background color
					  b = { bg = '#000' },
					  c = { bg = '#000' }
					}
				  },
                section_separators = '', -- Remove section separators
                component_separators = '', -- Remove component separators
                globalstatus = 3
            }
        })
    end
}
