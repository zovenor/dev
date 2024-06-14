
local cmp = require'cmp'
local luasnip = require("luasnip")


local map = vim.keymap.set
local opts = { noremap=true, silent=true }


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- удалить ошибки диагностики в левом столбце (SignColumn)
vim.diagnostic.config({signs=false})

-- стандартные горячие клавиши для работы с диагностикой
-- map('n', '<leader>e', vim.diagnostic.open_float, opts)
-- map('n', '[d', vim.diagnostic.goto_prev, opts)
-- map('n', ']d', vim.diagnostic.goto_next, opts)
-- map('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- стандартные горячие клавиши для LSP, больше в документации
  -- https://github.com/neovim/nvim-lspconfig
  -- map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- map('n', 'K', vim.lsp.buf.hover, bufopts)
  -- map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- map('n', '<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  -- map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  -- map('n', 'gr', vim.lsp.buf.references, bufopts)
  -- map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

-- инициализация LSP для различных ЯП
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local function config(_config)
  return vim.tbl_deep_extend('force', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }, _config or {})
end

-- иницализация gopls LSP для Go
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
lspconfig.gopls.setup(config({
  on_attach = on_attach,
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'go.mod' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  }
}))


 -- map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  path = '[Path]',
}

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Enter>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

}),


  sources = cmp.config.sources({
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp' },


  }, {
    { name = 'buffer' },
  })
})

-- конфиг для ИИ автодополнений

-- инициализация LSP для различных ЯП
local lspconfig = require('lspconfig')
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })



cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
    
  -- ...
    
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

vim.keymap.set({"i", "s"}, "<enter>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
