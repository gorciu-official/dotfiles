-- General
vim.cmd("set termguicolors")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.opt.number = true             -- show line numbers
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.expandtab = true          -- use spaces instead of tabs
vim.opt.shiftwidth = 4            -- tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.backspace = "indent,eol,start"
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300

-- Clipboard
vim.opt.clipboard = 'unnamedplus'
