-- See the kickstart.nvim README for more information
return {
  {
    'williambonan/mason.nvim',
    opts = {
      ensure_installed = {
        'gopls',
      },
    },
  },
  {
    'neovim/lsp-config',
    config = function()
      require 'douwe.lsp'
    end,
  },
}
