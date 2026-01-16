return {
  'kaarmu/typst.vim',
  ft = 'typst',
  lazy = false,
  config = function()
    vim.g.typst_pdf_viewer = 'okular'
    vim.keymap.set('n', '<leader>ll', ':TypstWatch --font-path /usr/share/fonts<CR>')
  end,
}
