vim.g.mapleader = " "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.wrap = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = true -- Ignore case in searches
vim.o.smartcase = true -- Use case sensitivity when uppercase letters are used in the search pattern
vim.opt.clipboard:append('unnamedplus') -- Enable system clipboard support
vim.opt.wildignore:append{'*/node_modules/*'}
vim.o.cmdheight=0 -- Hide the command line

-- Search conf
-- vim.o.hlsearch = false

vim.cmd([[
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,js'
let g:closetag_xhtml_filetype = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }
let g:closetag_shortcut = '>'
]])

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- Define a custom function to toggle between Nvim-Tree and file window
function ToggleTreeFocus()
  local ft = vim.bo.filetype
  if ft == 'NvimTree' or ft == 'neo-tree' then
    vim.cmd('wincmd l')
  else
    vim.cmd('wincmd h')
  end
end

-- Map Ctrl+Shift+E to call the custom function
vim.api.nvim_set_keymap('n', '<C-S-e>', ':lua ToggleTreeFocus()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-e>', ':lua ToggleTreeFocus()<CR>', { noremap = true, silent = true })

-- Remap Ctrl+J to behave like Ctrl+D (half-page down)
vim.api.nvim_set_keymap('n', '<C-j>', '5j', { noremap = true, silent = true })
-- Remap Ctrl+K to behave like Ctrl+U (half-page up)
vim.api.nvim_set_keymap('n', '<C-k>', '5k', { noremap = true, silent = true })

-- Remap 0 to Ctrl+H in Normal mode and Visual mode
vim.api.nvim_set_keymap('n', '<C-h>', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-h>', '0', { noremap = true, silent = true })

-- Remap $ to Ctrl+L in Normal mode and Visual mode
vim.api.nvim_set_keymap('n', '<C-l>', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-l>', '$', { noremap = true, silent = true })

-- Map Ctrl+C in visual mode to yank to clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Reveal in Tree
vim.keymap.set('n', '<leader>fr', ':Neotree reveal<CR>:Neotree focus<CR>', {})

-- Delete words with CTRL + backspace
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- Delete to blackhole register
vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })

-- Delete in normal register
vim.api.nvim_set_keymap('n', 'dc', 'dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'dc', '_d', { noremap = true, silent = true })

-- Normal mode mapping for <C-a> to select everything in the file
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- Map <C-[> to switch to the previous buffer
vim.api.nvim_set_keymap('n', '<C-[>', ':bprev<CR>', { noremap = true, silent = true })

-- Map <C-]> to switch to the next buffer
vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', { noremap = true, silent = true })

-- Explicitly map <Esc> to ensure it works
vim.api.nvim_set_keymap('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Esc>', '<Esc>', { noremap = true, silent = true })

-- Map <leader>S to select a function block
vim.api.nvim_set_keymap('n', '<leader>s', [[:lua select_function_block()<CR>]], { noremap = true, silent = true })

-- Change search function to prevent getting moved back after pressing ESC
vim.api.nvim_set_keymap('c', '<ESC>', '<CR>', { noremap = true, silent = true })

-- Disable Ctrl + Z in normal mode
vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- Map gg to gg0 to move the cursor to the beginning (first character) of the file intead of top
vim.api.nvim_set_keymap('n', 'gg', 'gg0', { noremap = true, silent = true })

-- Chabge CTRL + [ and ] as history
vim.api.nvim_set_keymap('n', '<C-[>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', { noremap = true, silent = true })

-- Move line up with Shift+K
vim.api.nvim_set_keymap('n', 'K', ':m .-2<CR>==', { noremap = true, silent = true })
-- Move line down with Shift+J
vim.api.nvim_set_keymap('n', 'J', ':m .+1<CR>==', { noremap = true, silent = true })
-- Move selected block up (Visual mode) with Shift+K
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected block down (Visual mode) with Shift+J
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Delete word backwards
vim.api.nvim_set_keymap('n', 'dw', "db", { noremap = true, silent = true })

-- Map the custom paste function in Visual mode
vim.api.nvim_set_keymap('x', 'p', [[:lua paste_without_overwriting()<CR>]], { noremap = true, silent = true })

-- Function to paste without overwriting the default register
function paste_without_overwriting()
  -- Save the current default register content to a temporary register
  vim.cmd('let @a = @"')
  -- Paste the content (default behavior)
  vim.cmd('normal! p')
  -- Restore the default register content from the temporary register
  vim.cmd('let @" = @a')
end


-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
