
local disable_function = function(lang)
  local buf_name = vim.fn.expand("%")

  if string.find(buf_name, "go.mod") then
    return true
  end

  if string.find(buf_name, "%.toml$") then
    return true
  end

end

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "go", "lua", "python" },


  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    disable = disable_function, -- list of language that will be disabled

    additional_vim_regex_highlighting = false,
  },

}
