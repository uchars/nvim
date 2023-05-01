local conf = require("nils.configuration.lsp")

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    config = conf.lspzero,
    event = "BufReadPre",
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
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-buffer" },       -- Optional
      { "hrsh7th/cmp-path" },         -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" },     -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" },

      -- Visual stuff
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = conf.nullls,
      },
      {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = conf.lspsaga,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          --Please make sure you install markdown and markdown_inline parser
          { "nvim-treesitter/nvim-treesitter" },
        },
      },
    },
  },
  {
    "Saecki/crates.nvim",
    event = { "BufReadPre Cargo.toml" },
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("crates").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
        },
      })
    end,
  },
}
