local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local function TestCond()
    return not InVsCode()
end
local plugins = {
    "folke/which-key.nvim",
    "ggandor/leap.nvim",
    { 'neovim/nvim-lspconfig', cond = TestCond }, -- config for nvim LSP
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    -- bufferline
    { 'akinsho/bufferline.nvim', cond = TestCond},
    -- treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects'},
    -- complete
    { 'hrsh7th/cmp-nvim-lsp', cond = TestCond },
    { 'hrsh7th/nvim-cmp', cond = TestCond },
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = { {"nvim-tree/nvim-web-devicons"} }, cond = TestCond
    },

    -- telescopy (find files, file string)
    {
        'nvim-telescope/telescope.nvim', version = '0.1.1',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        cond = TestCond
    },
    -- project manager, Integration in Telescope
    {
        'nvim-telescope/telescope-project.nvim', cond = TestCond,
    },

    { "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    },
}
require("lazy").setup(plugins, opts)


require 'plugin-config'
