-- Return module table with configurations
return {
    -- Plugin configurations
    'hrsh7th/nvim-cmp',  -- Example: Plugin repository name

    -- Configuration function for nvim-cmp
    config = function()
        -- Additional configuration for nvim-cmp can go here
    end,

    -- cmp-path configuration
    'hrsh7th/cmp-path',  -- Example: Plugin repository name

    -- Configuration function for cmp-path
    cmp_path_config = function()
        -- Example: Custom key mappings for cmp-path
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'cmp-path', keymap = {
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                }},
            },
        })
    end
}
