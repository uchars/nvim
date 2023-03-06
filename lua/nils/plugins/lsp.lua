local conf = require("nils.configuration.lsp")

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    config = conf.lspzero,
    lazy = false,
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        "williamboman/mason.nvim",
      }, -- Optional
      {
        "williamboman/mason-lspconfig.nvim",
      }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" },

      -- Visual stuff
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = conf.nullls,
      },
      {
        "folke/trouble.nvim",
        config = conf.trouble,
      },
      {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        config = conf.lspsaga,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          --Please make sure you install markdown and markdown_inline parser
          { "nvim-treesitter/nvim-treesitter" },
        },
      },
    },
  },
}
