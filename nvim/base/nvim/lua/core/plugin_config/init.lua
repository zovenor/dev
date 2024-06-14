require("core.plugin_config.gruvbox")
require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.telescope")
require("core.plugin_config.treesitter")
require("nvim-highlight-colors").setup {
	render = "background", -- or 'foreground' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = false
}
vim.opt.termguicolors = true
require("bufferline").setup{}
require("core.plugin_config.tagbar")
require("core.plugin_config.blankline")
require("core.plugin_config.lua_snip")
require("core.plugin_config.lsp_config")
require("core.plugin_config.bookmarks")
require("core.plugin_config.codeium")
require("core.plugin_config.todo-com")
require("core.plugin_config.wilder")
require("core.plugin_config.conform")
