vim.g.codeium_disable_bindings = 1
vim.keymap.set('i', '<M-j>', function() return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })










