vim.g.mapleader = " "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = true                 -- Ignore case in searches
vim.o.smartcase = true                  -- Use case sensitivity when uppercase letters are used in the search pattern
vim.opt.clipboard:append('unnamedplus') -- Enable system clipboard support
vim.opt.wildignore:append { '*/node_modules/*' }
vim.o.cmdheight = 0                     -- Hide the command line
vim.opt.fillchars = "eob: "
vim.opt.swapfile = false

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

-- Highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
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
-- vim.api.nvim_set_keymap('n', '<C-[>', ':bprev<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-[>', ':lua GoToPrevBuffer()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', ':lua GoToNextBuffer()<CR>', { noremap = true, silent = true })

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

vim.api.nvim_set_keymap('x', 'p', '"_dP', { noremap = true, silent = true })

-- Map the custom paste function in Visual mode and Normal Mode
vim.api.nvim_set_keymap('n', '<leader>fn', ":let @/ = expand('<cword>')<CR>n", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>fn', 'y/<C-R><C-O>0<CR>', { noremap = true, silent = true })

-- Utility function to get all valid, listed buffers (ignore [No Name] buffers)
function get_listed_buffers()
  local buffers = {}
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buffer) == 1 and vim.api.nvim_buf_get_name(buffer) ~= "" then
      table.insert(buffers, buffer)
    end
  end
  return buffers
end

-- Function to move to the next buffer without cycling
function next_buffer_no_cycle()
  local buffers = get_listed_buffers()
  local current = vim.api.nvim_get_current_buf()

  -- Find the current buffer's position in the list
  for i, buffer in ipairs(buffers) do
    if buffer == current then
      if i == #buffers then
        -- print("End of buffer list")
        return
      else
        vim.api.nvim_set_current_buf(buffers[i + 1])
        return
      end
    end
  end
end

-- Function to move to the previous buffer without cycling
function prev_buffer_no_cycle()
  local buffers = get_listed_buffers()
  local current = vim.api.nvim_get_current_buf()

  -- Find the current buffer's position in the list
  for i, buffer in ipairs(buffers) do
    if buffer == current then
      if i == 1 then
        -- print("Start of buffer list")
        return
      else
        vim.api.nvim_set_current_buf(buffers[i - 1])
        return
      end
    end
  end
end

--[[ -- Function to close all buffers after the current one, excluding the new buffer
 function close_buffers_after_current(new_buf)
  local buffers = get_listed_buffers()
  local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer

  -- Iterate through the buffer list to find the current buffer's position
  for i, buffer in ipairs(buffers) do
    if buffer == current_buf then
      -- Close all buffers after the current one, but skip the new buffer
      for j = #buffers, i + 1, -1 do
        if buffers[j] ~= new_buf then
          vim.api.nvim_buf_delete(buffers[j], { force = true }) -- Force close each buffer
        end
      end
      return
    end
  end
end

- ]]
--[[
-- Function to move the LSP buffer next to the current buffer by swapping
 function move_lsp_buffer_next_to_current(new_buf)
  local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer

  -- First, switch to the new buffer
  vim.cmd('buffer ' .. new_buf)

  -- Switch back to the original buffer to ensure the order
  vim.cmd('b#') -- This will put the new buffer next to the current one in the buffer list
end

-- Auto-command to trigger buffer cleanup when a new buffer is added
vim.api.nvim_create_autocmd("BufAdd", {
  callback = function(args)
    -- Ensure we close buffers after the current, but skip the new one
    close_buffers_after_current(args.buf)
  end
}) ]]

--[[ -- Track whether an LSP buffer is being opened
local is_lsp_jump = false

-- Wrap LSP definition in a function to set the flag
vim.keymap.set("n", "<leader>g", function()
  is_lsp_jump = true -- Set flag to indicate LSP definition was used
  vim.lsp.buf.definition()
end, {})

-- Auto-command to trigger buffer cleanup and reordering after LSP 'go to definition'
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if is_lsp_jump then
      -- If an LSP definition jump just occurred, clean up the buffers
      local new_buf = vim.api.nvim_get_current_buf()

      -- Move the new LSP buffer next to the current one
      move_lsp_buffer_next_to_current(new_buf)

      -- Clean up the buffers
      close_buffers_after_current(new_buf)

      is_lsp_jump = false -- Reset the flag after cleanup
    end
  end
})

- ]]


-- Enable incremental search
vim.opt.incsearch = true

-- Define a function to handle the cursor position
local function handle_search_cursor()
  -- If the search register is empty (no match), keep the cursor where it is
  if vim.fn.getreg("/") == "" or vim.v.hlsearch == 0 then
    -- If no match is found, we want to leave the cursor at its current position
    return
  end
end

-- Create an autocommand that listens to search events
vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = "/",
  callback = handle_search_cursor,
})

-- Function to check if the buffer is unnamed
function IsUnnamedBuffer(bufnr)
  return vim.fn.bufname(bufnr) == ""
end

-- Custom function for navigating to the previous buffer, skipping unnamed buffers
function GoToPrevBuffer()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 }) -- Only get listed buffers
  local current_buf = vim.fn.bufnr('%')
  local prev_buf = nil

  -- Find the current buffer in the list of buffers
  for i = #buffers, 1, -1 do
    if buffers[i].bufnr == current_buf then
      prev_buf = buffers[i - 1]
      break
    end
  end

  -- Skip unnamed buffers
  while prev_buf and IsUnnamedBuffer(prev_buf.bufnr) do
    for i = #buffers, 1, -1 do
      if buffers[i].bufnr == prev_buf.bufnr then
        prev_buf = buffers[i - 1]
        break
      end
    end
  end

  if prev_buf then
    vim.cmd('buffer ' .. prev_buf.bufnr)
  end
end

-- Custom function for navigating to the next buffer, skipping unnamed buffers
function GoToNextBuffer()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 }) -- Only get listed buffers
  local current_buf = vim.fn.bufnr('%')
  local next_buf = nil

  -- Find the current buffer in the list of buffers
  for i = 1, #buffers do
    if buffers[i].bufnr == current_buf then
      next_buf = buffers[i + 1]
      break
    end
  end

  -- Skip unnamed buffers
  while next_buf and IsUnnamedBuffer(next_buf.bufnr) do
    for i = 1, #buffers do
      if buffers[i].bufnr == next_buf.bufnr then
        next_buf = buffers[i + 1]
        break
      end
    end
  end

  if next_buf then
    vim.cmd('buffer ' .. next_buf.bufnr)
  end
end
