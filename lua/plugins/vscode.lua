-- lua/plugins/vscode-nvim.lua
return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
      -- Choose between two styles: "dark" or "light"
      style = 'dark',  -- or 'light'
      -- Additional configurations
      transparent = false,  -- Enable/Disable transparency
      italic_comments = true,  -- Enable italic comments
      disable_nvimtree_bg = true,  -- Disable nvim-tree background color
    })

    -- Apply the colorscheme
    vim.cmd('colorscheme vscode')

    -- Apply the colorscheme
    vim.cmd('colorscheme vscode')

    -- Override background color
    vim.cmd('highlight Normal guibg=#15191e')  -- Set background color to red (hex code)
     vim.cmd('highlight LineNr guibg=#15191e')  -- Set line number background color to black (hex code)
     vim.cmd('highlight CursorLineNr guibg=#15191e')  -- Optional: Set current line number background color to black (hex code)
vim.cmd('highlight SignColumn guibg=#15191e')
  end,
}
