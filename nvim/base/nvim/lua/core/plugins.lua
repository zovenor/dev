local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[ packadd packer.nvim ]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }


  use 'MunifTanjim/nui.nvim'

  use {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
  end,
}
  use 'mfussenegger/nvim-dap'

  use {
    'tomasky/bookmarks.nvim'
    }

-- Themes
  use "folke/todo-comments.nvim"
use("oxfist/night-owl.nvim")
use 'AlexvZyl/nordic.nvim'
use({
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark')
  end
})
use { "scottmckendry/cyberdream.nvim" }

  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })

  use {
    "williamboman/mason.nvim"
    }
    
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  use {
    "olexsmir/gopher.nvim",
    }
  use('onsails/lspkind-nvim')


  use 'leoluz/nvim-dap-go'

 use {'Exafunction/codeium.vim', tag = "1.8.37"}
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'mg979/vim-visual-multi'   
  use { 'posva/vim-vue', ft = 'vue' }
  use 'dense-analysis/ale'

  use 'nvim-lua/plenary.nvim'

  use {'akinsho/bufferline.nvim',  requires = 'nvim-tree/nvim-web-devicons'}
  --
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'honza/vim-snippets'
  use {'nvim-treesitter/nvim-treesitter'}
  use 'preservim/tagbar'
  use  "mattn/emmet-vim"  
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
  end

}

  use "vhyrro/luarocks.nvim"


  use {
    'nvim-telescope/telescope.nvim',
    tag =  '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
  use "tpope/vim-commentary"
  use 'm-demare/hlargs.nvim'
  use 'brenoprata10/nvim-highlight-colors'
  if packer_bootstrap then
    require('packer').sync()
  end


end)
