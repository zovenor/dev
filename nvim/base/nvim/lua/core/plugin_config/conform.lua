require("conform").setup({
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
         go = { "goimports", "gofmt" },
proto={"buf"}
		-- Use a sub-list to run only the first available formatter
	},
})
