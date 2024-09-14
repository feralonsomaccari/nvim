return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree source=filesystem toggle position=left<CR>")
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
			close_if_last_window = true,
			source_selector = {
				winbar = true,
			},
      disabled_filetypes = { 'packer', 'NVimTree' },
			window = {
				width = 36,
        border = "none",
			},
		})
	end,
}
