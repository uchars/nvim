_ = vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  -- Essentials (for other plugins)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("numToStr/Comment.nvim")
  use("dstein64/vim-startuptime")

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })

  use("onsails/lspkind-nvim")
  use("glepnir/lspsaga.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        auto_preview = false,
        auto_fold = true,
      })
    end,
  })

  -- Versioning
  use("ThePrimeagen/git-worktree.nvim")
  use("lewis6991/gitsigns.nvim")
  use("mbbill/undotree")
  use("TimUntersberger/neogit")
  use("sindrets/diffview.nvim")

  -- Movement
  use("ThePrimeagen/harpoon")
  use("nvim-telescope/telescope.nvim")
  use("farmergreg/vim-lastplace")
  use({ "nvim-tree/nvim-tree.lua", requires = {
    "nvim-tree/nvim-web-devicons",
  } })

  -- Colorscheme & Visual stuff
  use("ellisonleao/gruvbox.nvim")
  use("rebelot/kanagawa.nvim")
  use("Everblush/everblush.nvim")
  use("folke/tokyonight.nvim")
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({})
    end,
  })
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter")
  use("romgrk/nvim-treesitter-context")

  -- Formatting
  use("kylechui/nvim-surround")
  use("sbdchd/neoformat")

  -- Language Specific
  use({
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    -- ft = {"flutter", "dart"},
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("windwp/nvim-ts-autotag")
end)
