require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require("core.other")
require("core.search")
require("core.tabs")
require("core.autocommands")

require("mason").setup()
require("dap-go").setup()
require("dapui").setup()
require("cyberdream").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

require("lspconfig").pyright.setup({})

vim.o.wildignore = vim.o.wildignore .. ",*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
