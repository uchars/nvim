local conf = require("nils.configuration.lsp")

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    config = conf.lspzero,
    ft = {
      "lua",
      "javascriptreact",
      "typescriptreact",
      "javascript",
      "typescript",
      "dart",
      "flutter",
      "dockerfile",
      "html",
      "scss",
      "css",
      "html",
      "json",
    },

    dependencies = {
      {
        "folke/trouble.nvim",
        config = conf.trouble,
      },
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",

      "onsails/lspkind-nvim",
      "glepnir/lspsaga.nvim",
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = conf.nullls,
      },
    },
  },
}
