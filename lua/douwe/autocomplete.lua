return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
    --    {
    --      'L3MON4D3/LuaSnip',
    --      build = (function()
    --        -- Build Step is needed for regex support in snippets
    --        -- This step is not supported in many windows environments
    --        if vim.fn.has('win32') == 1 then
    --          return
    --        end
    --        return 'make install_jsregexp'
    --      end)(),
    --      dependencies = {
    --        'rafamadriz/friendly-snippets',
    --      },
    --    },
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Load friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- mappings!
    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        --['<C-j>'] = cmp.mapping.scroll_docs(-4),
        --['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        --    ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-l>'] = cmp.mapping.confirm { select = true },
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            --   elseif luasnip.expand_or_jumpable() then
            --     luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
