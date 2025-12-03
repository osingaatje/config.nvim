return {
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'gopls' },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config('lua_ls', {
        -- config for lua
      })

      vim.lsp.config('gopls', {
        -- go config
      })

      -- CUSTOM KEYBINDS FOR LSP:
      -- IS ALREADY SET BY DEFAULT: vim.keymap.set('n', 'K', vim.lsp.buf.hover) -- 'K' == get docs for whatever you're hovering over
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition) -- "go to definition"
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover)
      -- code actions! Accept suggestions etc.:
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
    end,
  },
}
