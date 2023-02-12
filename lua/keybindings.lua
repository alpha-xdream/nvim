if InVsCode() then
    print("is in vscode, do nothing keybindings")
    return
end
local map = vim.api.nvim_set_keymap
local keymap_set = vim.keymap.set
local opt = {noremap = true, silent = true}
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

-- bufferline
map('n', "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map('n', "<C-l>", ":BufferLineCycleNext<CR>", opt)
