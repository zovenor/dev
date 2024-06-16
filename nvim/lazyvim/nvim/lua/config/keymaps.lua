-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>h", "<C-w><Left>", defaults)
vim.keymap.set("n", "<leader>l", "<C-w><Right>", defaults)
vim.keymap.set("n", "<leader>k", "<C-w><Up>", defaults)
vim.keymap.set("n", "<leader>j", "<C-w><Down>", defaults)
vim.keymap.set("n", "<TAB>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>d", "<CMD>bd<CR>")
