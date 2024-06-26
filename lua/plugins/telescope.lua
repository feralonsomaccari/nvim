return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>p", builtin.find_files, {})
			vim.keymap.set("n", "<leader>l", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						-- find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
						hidden = true,
					},
					buffers = {
						initial_mode = "normal",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = { 
					file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
						"%.pdf", "%.mkv", "%.mp4", "%.zip", "node_modules", ".yalc/", ".next/", "public", "dist", "coverage", "es5", "component"},
				}
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
