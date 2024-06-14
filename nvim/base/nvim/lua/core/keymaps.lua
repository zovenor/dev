vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.swapfile = false

vim.opt.scrolloff = 7
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileformat = 'unix'
vim.opt.colorcolumn = "79"
vim.g.UltiSnipsExpandTrigger = "<Enter>"


vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
vim.keymap.set('i', 'jk', '<Esc>', {})

vim.keymap.set('n', '<leader>u', '<C-r>', defaults)

vim.keymap.set('n', '<leader>h', '<C-w><Left>', defaults)
vim.keymap.set('n', '<leader>l', '<C-w><Right>', defaults)
vim.keymap.set('n', '<leader>k', '<C-w><Up>', defaults)
vim.keymap.set('n', '<leader>j', '<C-w><Down>', defaults)
vim.keymap.set('n', '<TAB>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-TAB>', '<CMD>BufferLineCyclePrev<CR>')

vim.keymap.set('n', '<leader>d', '<CMD>bd<CR>')
vim.keymap.set('n', '<leader>q', '<CMD>wqa<CR>')

vim.keymap.set('n', '<leader>w', ':w <CR>')


vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yy', '"+yy', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true, silent = true })







