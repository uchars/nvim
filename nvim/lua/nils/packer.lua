_ = vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
    -- Essentials (for other plugins)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("numToStr/Comment.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use({"folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
        require("trouble").setup {
            auto_fold = true,
        }
        end
    })

    -- Versioning
    use("ThePrimeagen/git-worktree.nvim")
    use("mbbill/undotree")
    use("TimUntersberger/neogit")

    -- Movement
    use("ThePrimeagen/harpoon")
    use("simrat39/symbols-outline.nvim")
    use("nvim-telescope/telescope.nvim")
    use("farmergreg/vim-lastplace")
    use({"nvim-tree/nvim-tree.lua", requires = {
    "nvim-tree/nvim-web-devicons"
    }})

    -- Colorscheme & Visual stuff
    use("gruvbox-community/gruvbox")
    use("rebelot/kanagawa.nvim")
    use("Everblush/everblush.nvim")
    use("folke/tokyonight.nvim")
    use({"folke/zen-mode.nvim", config = function()
        require("zen-mode").setup {}
    end
    })
    use({'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Treesitter
    use({"nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")

    -- Debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- Formatting
    use("godlygeek/tabular")
    use("sbdchd/neoformat")
    use("kylechui/nvim-surround")

    -- Language Specific
    use({
      "akinsho/flutter-tools.nvim",
      requires = "nvim-lua/plenary.nvim",
      -- ft = {"flutter", "dart"},
    })
    use({"iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)

