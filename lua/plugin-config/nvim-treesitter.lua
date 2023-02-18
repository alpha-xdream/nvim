require 'nvim-treesitter.configs'.setup{
    ensure_install = {'html', 'css', 'vim', 'lua', 'javascript', 'typescript', 'tsx', 'csharp'},
    hightlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            --init_selection = '<CR>',
            --node_incremental = '<CR>',
            --node_decremental = '<BS>',
            --scope_incremental = '<TAB>',
        }
    },
    indent = {
        enable = true
    }
}


vim.wo.foldmethod='expr'
vim.wo.foldexpr='vim_treesitter#foldexpr()'

-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
