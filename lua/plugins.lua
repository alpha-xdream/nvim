-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local function TestCond()
    return not InVsCode()
end
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim' -- Package manager
    use { 'neovim/nvim-lspconfig', cond = TestCond } -- config for nvim LSP
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        cond = TestCond
    }

    -- bufferline
    use { 'akinsho/bufferline.nvim', cond = TestCond}
    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects'}
    -- complete
    use { 'hrsh7th/cmp-nvim-lsp', cond = TestCond }
    use { 'hrsh7th/nvim-cmp', cond = TestCond }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = { {"nvim-tree/nvim-web-devicons"} }, cond = TestCond
    })

    -- telescopy (find files, file string)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} },
        cond = TestCond
    }
    -- project manager, Integration in Telescope
    use {
        'nvim-telescope/telescope-project.nvim', cond = TestCond,
    }

    use({ "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    })
    -- Simple plugins can be specified as strings
    -- use 'rstacruz/vim-closer'

    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on an autocommand event
    -- use {'andymass/vim-matchup', event = 'VimEnter'}

    -- Plugins can have post-install/update hooks
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
end)
