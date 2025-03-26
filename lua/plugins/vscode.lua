return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
      style = 'dark',            -- Choose between two styles: "dark" or "light"
      transparent = false,       -- Enable/Disable transparency
      italic_comments = true,    -- Enable italic comments
      disable_nvimtree_bg = true -- Disable nvim-tree background color
    })

    local mainColor = '#1E1E1E'
    local mainLightColor = '#C0C0C0'
    local grayColor = '#6c6c6c'

    -- Apply the colorscheme
    vim.cmd('colorscheme vscode')

    --Variables color
    --vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "red" })

    -- Functions and methods color
    --vim.api.nvim_set_hl(0, "@function", { fg = "#DCDCAA" })
    --vim.api.nvim_set_hl(0, "@method", { fg = "#DCDCAA" })


    -- -- Override background color
    -- vim.cmd('highlight Normal guibg=#000')        -- Set background color to red (hex code)
    -- vim.cmd('highlight SignColumn guibg=#000')


    -- Highlight for relative line numbers (not active line)
    vim.api.nvim_set_hl(0, 'LineNr', { fg = mainColor })
    -- Highlight for the current line number (active line)
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = grayColor })

    -- File name in Lualine
    vim.api.nvim_set_hl(0, "LualineFilename", { fg = "#c586c0", bg = "NONE" })
    vim.api.nvim_set_hl(0, 'StatusLine', { fg = mainColor })   -- Status line

    vim.api.nvim_set_hl(0, 'VertSplit', { fg = mainColor })    -- Vertical split separator
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = mainColor }) -- Window separator

    vim.api.nvim_set_hl(0, "Comment", { fg = grayColor })
    vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

    -- Neo-tree colors
    vim.api.nvim_set_hl(0, 'NeoTreeCursorLine', { bg = '#3e4451' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitIgnored', { fg = grayColor })
    vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { bg = 'NONE', fg = grayColor })
    vim.api.nvim_set_hl(0, 'NeoTreeDotfile', { fg = mainLightColor })
    vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = mainLightColor })
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { bold = false, italic = false, fg = mainLightColor })
    vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = mainLightColor })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = mainLightColor }) -- White icons
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = mainLightColor }) -- White folder names
    vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = mainLightColor })      -- Change all file icon colors
  end

}
