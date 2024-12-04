return {
    'Mofiqul/vscode.nvim',
    config = function()
        require('vscode').setup({
            style = 'dark', -- Choose between two styles: "dark" or "light"
            transparent = false, -- Enable/Disable transparency
            italic_comments = true, -- Enable italic comments
            disable_nvimtree_bg = true -- Disable nvim-tree background color
        })

        -- Apply the colorscheme
        vim.cmd('colorscheme vscode')

        -- -- Override background color
        -- vim.cmd('highlight Normal guibg=#000')        -- Set background color to red (hex code)
        -- vim.cmd('highlight LineNr guibg=#000')        -- Set line number background color to black (hex code)
        -- vim.cmd('highlight CursorLineNr guibg=#000')  -- Optional: Set current line number background color to black (hex code)
        -- vim.cmd('highlight SignColumn guibg=#000')

    end
}
