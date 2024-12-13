-- General mappings
local bind = vim.keymap.set
local silent = {silent = true}

vim.g.mapleader = ","-- setup leader key
vim.g.maplocalleader = '\\'

-- Normal mode mappings
bind('n', ';', ':') -- get to command mode with one keyhit
bind('', '<up>', '<nop>')
bind('', '<down>', '<nop>')
bind('', '<left>', '<nop>')
bind('', '<right>', '<nop>')
-- go into wrapping line
bind('', 'j', 'gj')
bind('', 'k', 'gk')
-- splitting
bind('n', '<leader>v', '<c-w>v<c-w>l')
bind('n', '<leader>s', '<c-w>s<c-w>j')
-- close split
bind('n', '<leader>c', '<c-w>c')
-- focusing on act split only
bind('n', '<leader>o', '<c-w>o')
-- moving between splits
bind('n', '<s-j>', '<c-w>j')
bind('n', '<s-k>', '<c-w>k')
bind('n', '<s-h>', '<c-w>h')
bind('n', '<s-l>', '<c-w>l')
-- Handling splits
bind('n', '<leader>q', ':resize<CR>')
bind('n', '<leader>w', ':vertical resize<CR>')
bind('n', '<leader>e', '<c-w>=')
bind('n', '<leader>r', '<c-w>r')
-- Moving between buffers
bind('n', '<m-h>', ':bprevious<CR>')
bind('n', '<m-l>', ':bnext<CR>')
-- Create tabs
bind('n', '<c-o><c-o>', ':tabnew<CR>:Explore<CR>', silent)
-- Moving between tabs
bind('n', '<c-h>', ':tabprevious<CR>', silent)
bind('n', '<c-l>', ':tabnext<CR>', silent)
-- Switching between last two buffers
bind('n', '<leader>n', ':silent b#<Bar>echo<CR>')
-- Using space to clear search highlighting and any message already displayed.
bind('n', '<Space>', ':silent noh<Bar>echo<CR>', silent)
-- NetRW toggle
bind('n', '<F2>', ':call ToggleNetrw()<CR>', silent)
-- Toggle between wrap and nowrap
bind('n', '<F3>', ':set wrap!<CR>', silent)
-- Toggle between showing whitespaecs and not showing whitespaces
bind('n', '<F4>', ':set list!<CR>', silent)
-- FZF Files command full screen set to ,+f
bind('n', '<leader>f', ':Files!<CR>')
-- FZF grep (ripgrep)
bind('n', '<leader>g', ':Rg ')

-- Visual mode mappings
bind('v', '<leader>g', 'y:Rg <C-R>"<CR>') -- ripgrep

-- move blocks of code
-- bind('v', 'J', ":m '>+1<CR>gv=gv")
-- bind('v', 'K', ":m '<-2<CR>gv=gv")

bind('x', '<leader>p',"\"_dP") -- copy paste selection over and over

-- Insert mode mappings
-- arrow keys are not alloed
bind('i', '<up>',    '<nop>')
bind('i', '<down>',  '<nop>')
bind('i', '<left>',  '<nop>')
bind('i', '<right>', '<nop>')
-- extend brackets
bind('i', '()',  '()<Esc>i')
bind('i', '{}',  '{}<Esc>i')
bind('i', '[]',  '[]<Esc>i')
bind('i', '();', '();')
bind('i', '{};', '{};')
bind('i', '[];', '[];')
-- extend quotes
bind('i', [[""]],  [[""<Esc>i]])
bind('i', [['']],  [[''<Esc>i]])
bind('i', [["",]], [["",]])
bind('i', [['',]], [['',]])
bind('i', [["";]], [["";]])
bind('i', [['';]], [['';]])

-- TODO management
-- Create todo listitem
bind('n', '<leader>e', ':put=strftime(\'%Y-%m-%d\')<cr>A ')
