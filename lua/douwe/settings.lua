-- Custom options

local g = vim.g
local o = vim.opt

o.number = true
o.mouse = 'a' -- enable cursor mode
o.showmode = false --disable showing mode

o.undofile = true -- save undo history

-- schedule this as a func as well to be extra sure!
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

o.clipboard = 'unnamedplus' -- uses the clipboard register for all operations except yank.
o.syntax = 'on' -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.

o.shiftwidth = 2
o.tabstop = 2
o.encoding = 'UTF-8'
o.termguicolors = true

g.mapleader = ',' -- set space as leader key (:help mapleader)
g.maplocalleader = ','
g.have_nerd_font = true

o.breakindent = true -- Enable break indent

o.signcolumn = 'yes' -- Enable break indent

-- SEARCHING
o.ignorecase = true
o.smartcase = true -- case insensitive searching unless \C (capital letter) is used in searching

o.updatetime = 250 -- ????
o.timeoutlen = 350 -- decrease sequence wait time

-- configure splits
o.splitright = true
o.splitbelow = true

-- Highlight when yanking / copying
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
o.list = true -- how nvim lists characters. See :help list and :help listchars
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
o.confirm = true
