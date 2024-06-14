return {
  -- add gruvbox
  { "folke/tokyonight.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
}
