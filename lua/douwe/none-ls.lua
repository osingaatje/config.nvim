-- config for things such as autoformatting etc.

return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.stylua,
      },
    }

    -- AUTOFORMAT FILE
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format)
  end,
}
