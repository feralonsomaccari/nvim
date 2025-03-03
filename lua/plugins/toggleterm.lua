return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
            },
        })

        vim.api.nvim_set_keymap('n', '<Leader><F12>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })
    end
}
