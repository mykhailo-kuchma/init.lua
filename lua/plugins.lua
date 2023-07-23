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

require("lazy").setup({

    -- git
    'tpope/vim-fugitive',
    
    -- auto indentation
    --'tpope/vim-sleuth',

    {
        'olimorris/onedarkpro.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'onedark'
        end
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        config = function() require("plugins.lualine") end
    },

    { 
        'folke/which-key.nvim', 
        opts = {} 
    },

    { 
        'nvim-telescope/telescope.nvim', 
        branch = '0.1.x', 
        dependencies = { 'nvim-lua/plenary.nvim' }, 
        config = function() require("plugins.telescope") end
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = function() require("plugins.treesitter") end
    },
})

