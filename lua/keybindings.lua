local map = vim.api.nvim_set_keymap
local keymap_set = vim.keymap.set
local opt = {noremap = true, silent = true}
if not InVsCode() then
    -- nvimTree
    map('n', '<A-m>', ':NvimTreeToggle .<CR>', opt)

    -- telescope
    local builtin = require('telescope.builtin')
    keymap_set('n', '<leader>ff', builtin.find_files, opt)
    keymap_set('n', '<leader>fg', builtin.live_grep, opt)
    keymap_set('n', '<leader>fb', builtin.buffers, opt)
    keymap_set('n', '<leader>fh', builtin.help_tags, opt)
    keymap_set('n', '<leader>fs', builtin.grep_string, opt)
    map('n', '<leader>fp', ":Telescope project<CR>", opt)

    -- windows
    map("n", "<A-h>", "<C-w>h", opt)
    map("n", "<A-j>", "<C-w>j", opt)
    map("n", "<A-k>", "<C-w>k", opt)
    map("n", "<A-l>", "<C-w>l", opt)
else
    map('n', '<leader>b', ':call VSCodeNotify(\"workbench.action.toggleSidebarVisibility\")<CR>', opt)
    map('n', '<A-m>', ':call VSCodeNotify(\"workbench.view.explorer\")<CR>', opt)
end

-- tab
map('n', "<C-h>", ":tabpreview<CR>", opt)
map('n', "<C-l>", ":tabnext<CR>", opt)

map('i', "<C-s>", "<ESC>:w<CR>", opt)
map('n', "<C-s>", ":w<CR>", opt)
-- normal mode
map('n', '<leader><CR>', 'o<ESC>', opt)
map('n', '<leader><S-CR>', 'O<ESC>', opt)
map('n', 'H', '^', opt)
map('n', 'L', '$', opt)
map('v', 'H', '^', opt)
map('v', 'L', '$', opt)
map('n', '<leader>y', 'ggVG', opt) -- 选中所有文本 all text
map('v', '<leader>y', '"+y', opt) -- 复制到系统剪切板
map('v', '<leader>p', '"+p', opt) -- 粘贴系统剪切板
map('n', '<leader>p', '"+p', opt) -- 粘贴系统剪切板

keymap_set('v', 'J', ":m '>+1<CR>gv=gv")
keymap_set('v', 'K', ":m '<-2<CR>gv=gv")
