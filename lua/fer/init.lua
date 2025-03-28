--[[
##################################################
#                OPTIONS CONFIGURATION           #
##################################################
]]

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
vim.opt.incsearch = true  -- Enable incremental search
vim.opt.cursorline = true -- Highlight the current line
vim.o.cursorlineopt = "number"


--[[
##################################################
#                CUSTOM COMMANDS                 #
##################################################
]]

-- Stop auto-comenting in a new line
vim.cmd [[autocmd FileType * set formatoptions-=ro]]

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

--[[
##################################################
#                MAPPINGS                        #
##################################################
]]


-- Map Ctrl+E to go to neo tree
vim.api.nvim_set_keymap('n', '<C-S-e>', ':lua ToggleTreeFocus()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-e>', ':lua ToggleTreeFocus()<CR>', { noremap = true, silent = true })

-- Remap Ctrl+J to behave like Ctrl+D (half-page down) in normal and visual modes
vim.api.nvim_set_keymap('n', '<C-j>', '5j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-j>', '5j', { noremap = true, silent = true })

-- Remap Ctrl+K to behave like Ctrl+U (half-page up) in normal and visual modes
vim.api.nvim_set_keymap('n', '<C-k>', '5k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-k>', '5k', { noremap = true, silent = true })

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

-- Change search function to prevent getting moved back after pressing ESC
vim.api.nvim_set_keymap('c', '<ESC>', '<CR>', { noremap = true, silent = true })

-- Disable Ctrl + Z in normal mode
vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- Map gg to gg0 to move the cursor to the beginning (first character) of the file intead of top
vim.api.nvim_set_keymap('n', 'gg', 'gg0', { noremap = true, silent = true })

-- Chabge CTRL + [ and ] as history
vim.api.nvim_set_keymap('n', '<C-[>', ':lua GoToPrevBuffer()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', ':lua GoToNextBuffer()<CR>', { noremap = true, silent = true })

-- Move line up with Shift+K or Shift+J
vim.api.nvim_set_keymap('n', 'K', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', ':m .+1<CR>==', { noremap = true, silent = true })

-- Move selected block (Visual mode) with Shift+K or Shift+J
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Delete word backwards
vim.api.nvim_set_keymap('n', 'dw', "db", { noremap = true, silent = true })

-- Cuts without saving to clipboard
vim.api.nvim_set_keymap('x', 'p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'y', 'ygv<Esc>', { noremap = true, silent = true })

-- Map the custom paste function in Visual mode and Normal Mode
vim.api.nvim_set_keymap('n', '<leader>fn', ":let @/ = expand('<cword>')<CR>n", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>fn', 'y/<C-R><C-O>0<CR>', { noremap = true, silent = true })

-- Make shift+V to select from the cursor to the end of the line
vim.api.nvim_set_keymap('n', 'V', '0v$', { noremap = true, silent = true })

-- Modify shift+G to also put the cursor in last character in viusual mode and normal mode
vim.api.nvim_set_keymap('x', 'G', 'G$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'G', 'G$', { noremap = true, silent = true })

-- Switch booleans, lowercase/uppercase and increase/decrease numbers (also works with css units like 30px or 2rem)
vim.keymap.set("n", "`", function()
  local word = vim.fn.expand("<cword>")
  local num, unit = word:match("([%d%.]+)(%a*)")
  num = tonumber(num)

  if word == "true" then
    vim.cmd('normal! ciwfalse')
  elseif word == "false" then
    vim.cmd('normal! ciwtrue')
  elseif num then
    vim.cmd("normal! ciw" .. (num + 1) .. unit)
  else
    if word:lower() == word then
      vim.cmd('normal! viwU')
    else
      vim.cmd('normal! viwu')
    end
  end
end, { noremap = true, silent = true })

-- Capitalize and decrease number
vim.keymap.set("n", "~", function()
  local word = vim.fn.expand("<cword>")
  local num, unit = word:match("([%d%.]+)(%a*)")
  num = tonumber(num)

  if num then
    vim.cmd("normal! ciw" .. (num - 1) .. unit)
  else
    local capitalized_word = word:sub(1, 1):upper() .. word:sub(2):lower()
    vim.cmd("normal! ciw" .. capitalized_word)
  end
end, { noremap = true, silent = true })

--[[
##################################################
#                CUSTOM FUNCTIONS                #
##################################################
]]

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

-- Function to fetch Jira issue asynchronously
vim.g.jira_content = ""
function FetchJiraIssue()
  -- Get current git branch name
  local branch = vim.fn.system('git rev-parse --abbrev-ref HEAD')
  local issue = branch:gsub("\n", "") -- Clean up the branch name

  -- Fetch the Jira issue asynchronously
  vim.fn.jobstart({ 'jira', 'issue', 'view', issue }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      vim.g.jira_content = table.concat(data, "\n")
    end,
    on_stderr = function(_, data)
      print("Error fetching Jira issue: " .. table.concat(data, "\n"))
    end
  })
end

vim.cmd([[autocmd VimEnter * lua FetchJiraIssue()]])
vim.api.nvim_set_keymap('n', '<F1>', ':lua OpenJiraInPopup(vim.g.jira_content)<CR>', { noremap = true, silent = true })

function OpenJiraInPopup(content)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, vim.split(content, "\n"))
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'filetype', 'man')

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    border = 'rounded'
  }

  vim.cmd('autocmd FileType man setlocal termguicolors')
  vim.api.nvim_open_win(buf, true, opts)
end
