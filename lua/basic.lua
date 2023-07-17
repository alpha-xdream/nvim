vim.g.mapleader=" "
vim.o.encoding='utf8'
vim.wo.number=true
vim.wo.relativenumber=true
vim.g.startcase=true
vim.o.timeoutlen = 300
--vim.o.clipboard='unnamedplus'

if not InVsCode() then
    vim.o.cursorline=true
    vim.o.syntax='enable'
    vim.o.background='dark'
    vim.cmd('colorscheme solarized')
end


vim.o.tabstop=4
vim.bo.tabstop=4
vim.o.softtabstop=4
vim.o.shiftround=true
vim.o.shiftwidth=4

-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.cmdheight=2

vim.o.autoread = true
vim.bo.autoread = true
vim.o.wildmode='full'
vim.o.wrap = false
vim.o.backup = false
vim.o.title = true
vim.o.cursorline = true
vim.o.updatetime = 50
