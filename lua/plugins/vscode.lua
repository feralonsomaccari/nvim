return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
      style = 'dark',            -- Choose between two styles: "dark" or "light"
      transparent = false,       -- Enable/Disable transparency
      italic_comments = true,    -- Enable italic comments
      disable_nvimtree_bg = true -- Disable nvim-tree background color
    })

    -- Apply the colorscheme
    vim.cmd('colorscheme vscode')

    -- Highlight for relative line numbers (not active line)
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#1E1E1E' })
    -- Highlight for the current line number (active line)
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#808080' })

    ---- Neotree selected item highlight (background)
    vim.api.nvim_set_hl(0, 'NeoTreeCursorLine', { bg = '#3e4451' })

    -- -- Override background color
    -- vim.cmd('highlight Normal guibg=#000')        -- Set background color to red (hex code)
    -- vim.cmd('highlight SignColumn guibg=#000')

    vim.api.nvim_set_hl(0, 'NeoTreeGitIgnored', { fg = '#6c6c6c' })
    vim.api.nvim_set_hl(0, 'Comment', { fg = '#3a3a3a' })

    vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#1E1E1E' })    -- Vertical split separator
    vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#1E1E1E' })   -- Status line
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#1E1E1E' }) -- Window separator
    vim.api.nvim_set_hl(0, 'NeoTreeDotfile', { fg = '#C0C0C0' })
    vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = '#C0C0C0' })

    -- Modify the root folder highlight group
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { bold = false, italic = false, fg = '#C0C0C0' })

    -- Change the folder text color
    vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = '#C0C0C0' })

    vim.api.nvim_set_hl(0, "Comment", { fg = "#808080" })
    vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LualineFilename", { fg = "#E5C07B", bg = "NONE" })

    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#FFFFFF" }) -- White icons
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#C0C0C0" }) -- White folder names
  end

}
