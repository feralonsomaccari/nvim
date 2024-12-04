return {
  'NeogitOrg/neogit',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    local neogit = require('neogit')
    neogit.setup({
      integrations = {
        diffview = true,
      },
    })

    vim.keymap.set('n', '<leader>ga', function()
      neogit.open()
    end, { noremap = true, silent = true })
  end
}
