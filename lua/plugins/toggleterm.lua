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
            start_in_insert = true -- Automatically enter insert mode
        })

        local Terminal = require("toggleterm.terminal").Terminal
        local term = Terminal:new({ hidden = true })

        -- Pre-launch the terminal in the background
        term:open()
        term:close()

        function _toggle_term()
            term:toggle()
            vim.cmd("startinsert") -- Ensure insert mode when opened
        end

        function _close_term()
            term:close() -- Close the terminal on <Esc>
        end

        vim.api.nvim_set_keymap("n", "<Leader><F12>", "<cmd>lua _toggle_term()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<Esc>", "<cmd>lua _close_term()<CR>", { noremap = true, silent = true }) -- Close on <Esc>
    end
}

