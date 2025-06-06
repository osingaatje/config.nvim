return {
  {
    'mfussenegger/nvim-dap', -- nvim Debugging Adapter Protocol (DAP)
    config = function()
      require('dap-go').setup {}

      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        require('dap').step_out()
      end)
      vim.keymap.set('n', '<Leader>b', function()
        require('dap').toggle_breakpoint()
      end)
      vim.keymap.set('n', '<Leader>B', function()
        require('dap').set_breakpoint()
      end)
      vim.keymap.set('n', '<Leader>dr', function()
        require('dap').repl.open()
      end)
      vim.keymap.set('n', '<Leader>rl', function()
        require('dap').run_last()
      end)
      vim.keymap.set({ 'n', 'v' }, '<Leader>rh', function()
        require('dap.ui.widgets').hover()
      end)
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end)
      vim.keymap.set('n', '<Leader>df', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.frames)
      end)
      vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end)
    end,
  },
  {
    'leoluz/nvim-dap-go', -- go DAP support
    ft = 'go',
    dependencies = 'mfussenegger/nvim-dap',
  },
}
