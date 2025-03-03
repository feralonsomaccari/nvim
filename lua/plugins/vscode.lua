return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
      style = 'dark',                  -- Choose between two styles: "dark" or "light"
      transparent = false,             -- Enable/Disable transparency
      italic_comments = true,          -- Enable italic comments
      disable_nvimtree_bg = true       -- Disable nvim-tree background color
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
    -- vim.cmd('highlight LineNr guibg=#000')        -- Set line number background color to black (hex code)
    -- vim.cmd('highlight SignColumn guibg=#000')
  end
}
