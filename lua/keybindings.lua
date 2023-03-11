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

-- normal mode
map('n', '<CR>', 'o<ESC>', opt)
map('n', '<S-CR>', 'O<ESC>', opt)
map('n', 'H', '^', opt)
map('n', 'L', '$', opt)
map('v', 'H', '^', opt)
map('v', 'L', '$', opt)
map('n', 'J', '10j', opt)
map('n', 'K', '10k', opt)
map('n', '<leader>at', 'ggVG', opt) -- 选中所有文本 all text
