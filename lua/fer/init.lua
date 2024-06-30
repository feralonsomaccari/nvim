vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.o.signcolumn = "yes"

-- Ignore case in searches
vim.o.ignorecase = true

-- Use case sensitivity when uppercase letters are used in the search pattern
vim.o.smartcase = true

-- Enable system clipboard support
vim.opt.clipboard:append('unnamedplus')

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
vim.keymap.set('n', '<leader>fr', ':Neotree reveal<CR>', {})

