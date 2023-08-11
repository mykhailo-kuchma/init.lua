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
    'tpope/vim-sleuth',

    'nvim-tree/nvim-web-devicons',

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
        dependencies = {
            'Civitasv/cmake-tools.nvim',
        },
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
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        },
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
            'theHamsta/nvim-dap-virtual-text'
        },
        build = ':TSUpdate',
        config = function() require("plugins.treesitter") end
    },

    {
        'williamboman/mason.nvim',
        config = true,
        opts = {
            ensure_installed = {
                "clangd", "codelldb"
            }
        }
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'nvim-telescope/telescope.nvim',

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',

            -- For c/c++ development
            -- 'p00f/clangd_extensions.nvim',
        },
        config = function() require("plugins.lsp") end
    },

    {
        'Civitasv/cmake-tools.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function() require("plugins.cmake-tools") end
    },

    {
        'mfussenegger/nvim-dap',
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        opts = {
            ensure_installed = { 'cppdbg' },
            handlers = {}
        }
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            'mfussenegger/nvim-dap'
        },
        config = function() require("plugins.dapui") end
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',

            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function() require("plugins.cmp") end
    },
})
