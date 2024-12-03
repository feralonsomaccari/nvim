return {
  'NeogitOrg/neogit',
  requires = 'nvim-lua/plenary.nvim', -- Required dependency
  config = function()
    local neogit = require('neogit')
    neogit.setup({
      -- Customize Neogit configuration here
      integrations = {
        diffview = true, -- Enable integration with Diffview.nvim if installed
      },
    })

    -- Optional keybinding for opening Neogit
    vim.keymap.set('n', '<leader>lg', function()
      neogit.open() -- Opens the Neogit status window
    end, { noremap = true, silent = true })
  end
}
