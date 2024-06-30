return {
	'phaazon/hop.nvim',
	branch = 'v2', -- optional but strongly recommended
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		local hop = require('hop')
		local directions = require('hop.hint').HintDirection
		-- Changing the default f keyword
		vim.api.nvim_set_keymap('', 'f', "<cmd>HopWord<CR>", {})

		-- Pattern Matching with t keyword
		vim.api.nvim_set_keymap('n', 't', "<cmd>HopPattern<CR>", {noremap = true})
	end
}
