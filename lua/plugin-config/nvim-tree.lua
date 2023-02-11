require('nvim-tree').setup {
    sync_root_with_cwd = false,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
}
